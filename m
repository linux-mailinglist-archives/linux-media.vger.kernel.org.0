Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33BF02B25BD
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 21:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbgKMUpa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 15:45:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgKMUpa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 15:45:30 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24A2C0613D1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 12:45:29 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id d12so11521568wrr.13
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 12:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iEq53tDK9TxRXDnQ/1dirbrb4PL0wbKgM/db/S9Ynt0=;
        b=kOqQPua3J5UZeO5nCycKFQG3Cq8g44foA1OkeBUHrXSfdccTl9GVRPtm1S/YFRku/x
         sdXg8YkCLKS8fRTOndeAp97UyLEJykzopw0WlSdxfowk9IZhPd73N5tdlQr8gWrxjcnk
         5ecQCM4Ly3nZ8ruLTmQwpJmPfbigpDzpUKuJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iEq53tDK9TxRXDnQ/1dirbrb4PL0wbKgM/db/S9Ynt0=;
        b=sQv+Yb5W7dea8HhQNHfc7dUWcCXOyHc3sZELg/QxI3AEz2pS8hrHteCIvgKVtwYwkm
         5u5zPrOsUqEAe/75p8WZF5BZb4eFCP6SRYbHgKs44cFQbM9lT76rEZoncBv5sj/ykj7v
         LkvYRYxpyJJBSjx3u4bYyh5Djuj+b+o3aip6Ra5mPPcjf+WTqT9T4TkU5JpgT5oXhNMn
         QB6JJ1MvTygN3IAPmK24khM4YgbF71GOm+rigF/WLZGwW1uDUY+JMe/3segTKlxVnzU2
         SyS4b0mwpseZlQU2YRKl2LRvls3vraZhUyGKirLeJRWzDbwBOWkkjLAuTX7gYP8qKIwy
         0W8A==
X-Gm-Message-State: AOAM530/7N2HXzq+ybfvGYoECv7idtBsWVmZ21LEOucW8QHk0cGUdZDN
        xqAXDBg2xRb9eAXPk/x7JQfrRQ==
X-Google-Smtp-Source: ABdhPJwzAxNKNhFPx9nHKMhmZE94CSs/NAhz/xPzP6WuZoQmHa7XtzBVzLVqPJs2h5dhb/d1nLGD8g==
X-Received: by 2002:a05:6000:10cd:: with SMTP id b13mr6033603wrx.220.1605300328502;
        Fri, 13 Nov 2020 12:45:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 89sm12533021wrp.58.2020.11.13.12.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 12:45:27 -0800 (PST)
Date:   Fri, 13 Nov 2020 21:45:25 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Veera Sundaram Sankaran <veeras@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
        daniel@ffwll.ch, robdclark@gmail.com, sean@poorly.run,
        pdhaval@codeaurora.org, abhinavk@codeaurora.org,
        jsanka@codeaurora.org
Subject: Re: [PATCH RESEND 2/2] drm/drm_vblank: set the dma-fence timestamp
 during send_vblank_event
Message-ID: <20201113204525.GV401619@phenom.ffwll.local>
References: <1605205643-12746-1-git-send-email-veeras@codeaurora.org>
 <1605205643-12746-2-git-send-email-veeras@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605205643-12746-2-git-send-email-veeras@codeaurora.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 12, 2020 at 10:27:23AM -0800, Veera Sundaram Sankaran wrote:
> The explicit out-fences in crtc are signaled as part of vblank event,
> indicating all framebuffers present on the Atomic Commit request are
> scanned out on the screen. Though the fence signal and the vblank event
> notification happens at the same time, triggered by the same hardware
> vsync event, the timestamp set in both are different. With drivers
> supporting precise vblank timestamp the difference between the two
> timestamps would be even higher. This might have an impact on use-mode
> frameworks using these fence timestamps for purposes other than simple
> buffer usage. For instance, the Android framework uses the retire-fences
> as an alternative to vblank when frame-updates are in progress Set the
> fence timestamp during send vblank event to avoid discrepancies.

I think a reference to the exact source code in android that does this
would be really useful. Something in drm_hwcomposer or whatever is doing
this.

Aside from documenting why we want to do this I think this all looks
reasonable.
-Daniel

> 
> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
> ---
>  drivers/gpu/drm/drm_vblank.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index b18e1ef..b38e50c 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -24,6 +24,7 @@
>   * OTHER DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <linux/dma-fence.h>
>  #include <linux/export.h>
>  #include <linux/kthread.h>
>  #include <linux/moduleparam.h>
> @@ -999,6 +1000,14 @@ static void send_vblank_event(struct drm_device *dev,
>  		e->event.seq.time_ns = ktime_to_ns(now);
>  		break;
>  	}
> +
> +	/*
> +	 * update fence timestamp with the same vblank timestamp as both
> +	 * are signaled by the same event
> +	 */
> +	if (e->base.fence)
> +		e->base.fence->timestamp = now;
> +
>  	trace_drm_vblank_event_delivered(e->base.file_priv, e->pipe, seq);
>  	drm_send_event_locked(dev, &e->base);
>  }
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
