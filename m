Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDF902960BB
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 16:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895520AbgJVONx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 10:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2895495AbgJVONx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 10:13:53 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6ABC0613CE
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 07:13:51 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e2so2446086wme.1
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 07:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=enF/NQ78UlHZi0kpjlRMqO+lesxBNMFNnWEi966YlwU=;
        b=lcgl8RehFALlBvKW+2WEqI6hL3DQCvnayUx386YFYdIACL6eZdDekWSge6wl0xau/P
         OurS80PGFdE+uCz2ywydsXe1KEcW2OKxZnMZUyxNDMbbrQ0IMr0SI/JTRmyVAXaE9J1O
         hmmezb9rcO1k/LRCAp+BJe5NUZwtKmz2hdtkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=enF/NQ78UlHZi0kpjlRMqO+lesxBNMFNnWEi966YlwU=;
        b=KwXUIu5t9tJHdffFLG2V9YxGSO7fwtxUJn2dRfMQdc3wRpJnCO9wnXmTNTB/5/oVgO
         FfKsV5g8STJHbzUdwQd2L8g0VjJlegGB5jZ76EBOg9O5S/RT377OUcLunLofngUp5pSO
         2+0aSBX1E9uVSVv0G+ibBdMmMwsHJj6sejCNj1mQZMZrg32nM9bjGmm0POvSayP6jml0
         psKJJTSaPkCo0yB3nxisybj0DCoQomv0Y3jpVZDrp0teF8GGPohxFLZLnx+DGLXSdpW6
         481f7crZQNFBnm9mdnxKBWbeRVllGd77beB4lcZ3nkLyTPfSLdzsWo1AtLrugjSe80eu
         shVQ==
X-Gm-Message-State: AOAM531bVdCZN0TwiMvNRMCdzKng9xw4KWnHsC6tc3/LuGOJKjKBg2pD
        8VxoSRvzYTY4YpkkW63E2BVbZg==
X-Google-Smtp-Source: ABdhPJwHYDGIRoRMV1tiPrqE+G8DvABiHKwtdx9svGn7vK4QZAvd1J5pyjsiQ/shrV+Vnd5qklpZ6Q==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr2863073wma.95.1603376030491;
        Thu, 22 Oct 2020 07:13:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y4sm3726390wmj.2.2020.10.22.07.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 07:13:49 -0700 (PDT)
Date:   Thu, 22 Oct 2020 16:13:47 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@linux.ie, daniel@ffwll.ch, melissa.srw@gmail.com,
        linux-media@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel][PATCH 0/5] drm/amdgpu: Replace snprintf()
 with sysfs_emit
Message-ID: <20201022141347.GZ401619@phenom.ffwll.local>
Mail-Followup-To: Sumera Priyadarsini <sylphrenadin@gmail.com>,
        dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@linux.ie, melissa.srw@gmail.com,
        linux-media@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <cover.1603371258.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1603371258.git.sylphrenadin@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 22, 2020 at 07:07:50PM +0530, Sumera Priyadarsini wrote:
> Using snprintf() for show() methods holds the risk of buffer overrun
> as snprintf() does not know the PAGE_SIZE maximum of the temporary
> buffer used to output sysfs content.
> 
> This patchset is a series of Coccinelle cleanups across the staging
> directory to convert snprintf with scnprintf in the relevant files.

I think you need to edit your template here since this is now drivers/gpu,
not staging :-)
-Daniel

> 
> Sumera Priyadarsini (5):
>   gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
>   gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
>   gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
>   gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
>   gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   | 8 ++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c      | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c      | 4 ++--
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
