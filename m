Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 024F93691CE
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 14:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhDWMNg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 08:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238429AbhDWMNe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 08:13:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67611C061574;
        Fri, 23 Apr 2021 05:12:58 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7776D332;
        Fri, 23 Apr 2021 14:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619179977;
        bh=ub+iIB/ItT6V5W5KSuNTj3i33JnmRCY3IpGwmtb8Jpk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=NVYFRLUUfn/JKO1qLioTR2gkcEn4tH2q/OwFCiiSJ+q9bsLzzS0mSR0hWX4PlRDes
         6qieu1VN3PTFuFi8+dUHCyr68dNwXJtUA1PusyW77k7CUfeKALRpi4aoSoehEPyWQp
         TJGD3NueV/IpH3ZxC6oerXY6Qe4ucjd8bnHAqKu8=
Subject: Re: [PATCH 19/40] drm/omapdrm/omap_gem: Properly document
 omap_gem_dumb_map_offset()
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Rob Clark <rob.clark@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-20-lee.jones@linaro.org>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <1597afec-291f-4b08-cfb5-f7b04f28f4bd@ideasonboard.com>
Date:   Fri, 23 Apr 2021 15:12:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416143725.2769053-20-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/04/2021 17:37, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/gpu/drm/omapdrm/omap_gem.c:619: warning: expecting prototype for omap_gem_dumb_map(). Prototype was for omap_gem_dumb_map_offset() instead
> 
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Rob Clark <rob.clark@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/gpu/drm/omapdrm/omap_gem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
> index 38af6195d9593..27c71cded5d0a 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> @@ -605,7 +605,7 @@ int omap_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>   }
>   
>   /**
> - * omap_gem_dumb_map	-	buffer mapping for dumb interface
> + * omap_gem_dumb_map_offset	-	buffer mapping for dumb interface
>    * @file: our drm client file
>    * @dev: drm device
>    * @handle: GEM handle to the object (from dumb_create)
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
