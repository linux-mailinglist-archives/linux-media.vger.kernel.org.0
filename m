Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B325441981
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 11:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbhKAKM3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 06:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbhKAKMW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 06:12:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF11C09AA19
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 02:51:57 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1mhTyt-0002xT-5J; Mon, 01 Nov 2021 10:51:55 +0100
Message-ID: <925990553bec513c3fa347178e1e0e75263026c3.camel@pengutronix.de>
Subject: Re: [PATCH 3/6] drm/etnaviv: stop getting the excl fence separately
 here
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Christian =?ISO-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Date:   Mon, 01 Nov 2021 10:51:54 +0100
In-Reply-To: <20211028132630.2330-3-christian.koenig@amd.com>
References: <20211028132630.2330-1-christian.koenig@amd.com>
         <20211028132630.2330-3-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, dem 28.10.2021 um 15:26 +0200 schrieb Christian König:
> Just grab all fences in one go.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 8dc93863bf96..b5e8ce86dbe7 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -189,7 +189,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>  			continue;
>  
>  		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
> -			ret = dma_resv_get_fences(robj, &bo->excl,
> +			ret = dma_resv_get_fences(robj, NULL,
>  						  &bo->nr_shared,
>  						  &bo->shared);
>  			if (ret)


