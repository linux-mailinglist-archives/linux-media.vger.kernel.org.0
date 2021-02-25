Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9901A3258A5
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 22:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhBYV3y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 16:29:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbhBYV3w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 16:29:52 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703FEC061574;
        Thu, 25 Feb 2021 13:29:12 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id z126so7593875oiz.6;
        Thu, 25 Feb 2021 13:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vNmAJW/zyB5XEgw8h6FvBxPzYo4y5t37treLZpDOceo=;
        b=sCz9tTsaYlGjyP3OVvfQHFE1Jq6AsnZXv+DwdO+YsX5JKbirG+dxUiAQcZel9UnGqe
         6wGtCpgN4+68XYtWekQ6PmZOEBre3BbkSMKVINyqWimLyYkrhbZqL7I+Pb6YzzwEQZhT
         gm+7dCJdIkCE6jhtx+dyFrKO+viz0wd7E2zM+HVtjx1Gp/NN2nuwMudtsDs3lmM46eHc
         R8NWfSK2tB8EAIYdNkB2CGiGq+JL77iXK2UEhm7e6lABHemU0KDRpjD3lR1BCtVoSZjd
         KrHd5WrbJXGoIp9ZylUcomEIHcByTk90TUvzltlJ9lASAaQPDvdZP7/7qPrA1Zfj2fu+
         gxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vNmAJW/zyB5XEgw8h6FvBxPzYo4y5t37treLZpDOceo=;
        b=E+MV7xulRY9eneszjfsJhJmP3g17xylAoEsMHnLTHH+Fl9VAqwg1iUgH8sRPBMHItK
         Cl0WLU+676YV+r8AuGZPyYonLfmgOsU9wiVUrFCVgkc4GurtU36eCE3trTR9QbgDFABR
         y3mtcL6MUNy4ghQKdaltrRB4ITZPmAz7X2wvofVQMZ/cKr+6EUnM8rrXkU+iQ36Pmo0t
         tN2k2RUYL600pCeOWa91qDwSt7J9bIdFJ8hXqmJ7VFJmfyv96n1F27UKHOypIbZipggK
         /qgz8pswN+4tQ7WVkweFXEYhJae3xKroSefvZu3oTUmm9eIa2soZvJD5WFg1rded3czV
         ZjxA==
X-Gm-Message-State: AOAM5338L5X0xASPxhVHeRO0Uv0piKhEk1WEkLqTPA33XOpqrRU04AzI
        E670MWFBXaxkhPkc+e3fcJLgCqJf3HgdEftyT0M=
X-Google-Smtp-Source: ABdhPJz8h5CbpNmNWFW+5CPs0D5Ot6TYcO6pJ5ZglZgFse6a4n332blIPY1hL7WS4TLDebN2ONgPU+pxu72DeVZttco=
X-Received: by 2002:a05:6808:f15:: with SMTP id m21mr254325oiw.123.1614288551794;
 Thu, 25 Feb 2021 13:29:11 -0800 (PST)
MIME-Version: 1.0
References: <1614243728-52952-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1614243728-52952-1-git-send-email-yang.lee@linux.alibaba.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 25 Feb 2021 16:29:00 -0500
Message-ID: <CADnq5_Net7GN_zaMJWeO_b-zXwOQMNNsx5YqvhR_UdWxP-rsYA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     Dave Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Christian Koenig <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 25, 2021 at 4:02 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warning:
> ./drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1589:0-23: WARNING:
> fops_ib_preempt should be defined with DEFINE_DEBUGFS_ATTRIBUTE
> ./drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1592:0-23: WARNING:
> fops_sclk_set should be defined with DEFINE_DEBUGFS_ATTRIBUTE
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Applied.  Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index 0a25fec..52ef488 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1586,10 +1586,10 @@ static int amdgpu_debugfs_sclk_set(void *data, u64 val)
>         return 0;
>  }
>
> -DEFINE_SIMPLE_ATTRIBUTE(fops_ib_preempt, NULL,
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_ib_preempt, NULL,
>                         amdgpu_debugfs_ib_preempt, "%llu\n");
>
> -DEFINE_SIMPLE_ATTRIBUTE(fops_sclk_set, NULL,
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_sclk_set, NULL,
>                         amdgpu_debugfs_sclk_set, "%llu\n");
>
>  int amdgpu_debugfs_init(struct amdgpu_device *adev)
> --
> 1.8.3.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
