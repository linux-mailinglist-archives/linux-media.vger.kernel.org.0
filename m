Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EADC300467
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 14:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbhAVNlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 08:41:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727764AbhAVNlE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 08:41:04 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53123C06174A
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 05:40:24 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id by1so7731988ejc.0
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 05:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Dv7/+/NyO0aDXINqIUmwCPejHTrvrHEAZ2oKeoHKz00=;
        b=B8Uzht5O+sytkMMyGFt6RB/eoKBx4NZ9wnFtWUfDmbh9dXpdusvzx4xAQsutYvZe/l
         vdvaWutIB3OEFjByjwhGLXd3ZfD8IA34CZ7f9o/0ntXc3qSnTwEKXj6Of3xl+sUDlhAG
         OkVvw41IcjzjMYrS2IvAwVEpzJAsPnIwYhLKYrTCDjLK/BGChoBBkAlIyTsPl0MiyFbi
         mMMHe6lA4Fpqj1oEP0qlM0diCQ7YKPx9dQ8FlfgZTKIv9Ndys1R0voP4Oadv82i++yY+
         YKXBNLhZZhl2UlLQFAzm/HGKHyj8zFBJy35vPA/Qb49R5NsPXOHSAirwiGCX/cLtk+ic
         g/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=Dv7/+/NyO0aDXINqIUmwCPejHTrvrHEAZ2oKeoHKz00=;
        b=VHMf0MyV9GVLejYvCz1gi6R3YcMJEt+A5xQI27pAte7vSZrT+rt/buH7udje8HdEsc
         vkypIgCrOTJzeqTRN+34M8A6ubkLEhgRzawhUo1YLGk9hG8DftAfdiYATAIt++Pm2jsx
         j9mB0fIo+pdo5AxP9yiZs4zR1NEldajLU4fsiEhgdPOL3sj08oBX7p7W8XF/38a4gSnC
         AKsn7glciM/1k4P/TmF8ynO2Jk/VPZG8iOJMXUJjGeSkuxDkj2lKUPoz+CGRU5yXj1Wf
         bbXXjjQ33U1xZPa6Ys2FWBSVUiq/nkGSrofurL+X2Wa1ryOYtcWom6lie+l0DJmQyHwq
         LzkQ==
X-Gm-Message-State: AOAM530N4iWCVcpBx/AzqLQrF/uKizqv6EHZX2Xqvc4ArM/RBcVaSMG4
        N2/A0iSk06nNn/PRHr/KkjkzTTpGWe0=
X-Google-Smtp-Source: ABdhPJxdFyRIc4cBsYcdHDLtkQZHcOZqQEMWll5DSib2bySsdmIbq2Iw49GkoOEk5IcMal5pOZ/qQw==
X-Received: by 2002:a17:906:447:: with SMTP id e7mr2965096eja.172.1611322821816;
        Fri, 22 Jan 2021 05:40:21 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id a10sm4505138ejk.75.2021.01.22.05.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jan 2021 05:40:21 -0800 (PST)
Reply-To: christian.koenig@amd.com
Subject: Re: [Linaro-mm-sig] [PATCH] drm/todo: Add entry for moving to
 dma_resv_lock
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org
References: <20210122133624.1751802-1-daniel.vetter@ffwll.ch>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2282a592-8e19-b5ae-68ba-cf1ad6dda768@gmail.com>
Date:   Fri, 22 Jan 2021 14:40:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210122133624.1751802-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 22.01.21 um 14:36 schrieb Daniel Vetter:
> Requested by Thomas. I think it justifies a new level, since I tried
> to make some forward progress on this last summer, and gave up (for
> now). This is very tricky.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>   Documentation/gpu/todo.rst | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index dea9082c0e5f..f872d3d33218 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -23,6 +23,9 @@ Advanced: Tricky tasks that need fairly good understanding of the DRM subsystem
>   and graphics topics. Generally need the relevant hardware for development and
>   testing.
>   
> +Expert: Only attempt these if you've successfully completed some tricky
> +refactorings already and are an expert in the specific area
> +
>   Subsystem-wide refactorings
>   ===========================
>   
> @@ -168,6 +171,22 @@ Contact: Daniel Vetter, respective driver maintainers
>   
>   Level: Advanced
>   
> +Move Buffer Object Locking to dma_resv_lock()
> +---------------------------------------------
> +
> +Many drivers have their own per-object locking scheme, usually using
> +mutex_lock(). This causes all kinds of trouble for buffer sharing, since
> +depending which driver is the exporter and importer, the locking hierarchy is
> +reversed.
> +
> +To solve this we need one standard per-object locking mechanism, which is
> +dma_resv_lock(). This lock needs to be called as the outermost lock, with all
> +other driver specific per-object locks removed. The problem is tha rolling out
> +the actual change to the locking contract is a flag day, due to struct dma_buf
> +buffer sharing.
> +
> +Level: Expert
> +

Could you name some examples of driver locks here? I'm not aware in 
anything like this in amdgpu, radeon or neveau.

And yes sounds like a job for the appropriate driver maintainer.

Thanks,
Christian.

>   Convert logging to drm_* functions with drm_device paramater
>   ------------------------------------------------------------
>   

