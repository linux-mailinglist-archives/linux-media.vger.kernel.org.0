Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06689424A88
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 01:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbhJFXdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 19:33:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53306 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbhJFXdS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 19:33:18 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 702139DC;
        Thu,  7 Oct 2021 01:31:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633563083;
        bh=HUFmwxiZ46w1+hW64n0QX0dQp8cWb6tqfnPkGfaXtdQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QE98plgCTTwn6JjHVrOJXMzk1y0YlcggNinsisbb/AEGnDvWntCR2sp/VN3lVJJJ2
         sZhvivoeagZusw16RwlTru8hnuITFi+TcyXOVrTcB6VYrAkBdcdqD0FjSACFIFe0te
         +m9jZW7Gg4lzbtkLMZutQpq/nM5K+q7tNThzT86U=
Date:   Thu, 7 Oct 2021 02:31:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 01/11] media: cadence: csi2rx: Unregister v4l2 async
 notifier
Message-ID: <YV4xwiUVGUi3biAT@pendragon.ideasonboard.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-2-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210915120240.21572-2-p.yadav@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pratyush,

Thank you for the patch.

On Wed, Sep 15, 2021 at 05:32:30PM +0530, Pratyush Yadav wrote:
> The notifier is added to the global notifier list when registered. When
> the module is removed, the struct csi2rx_priv in which the notifier is
> embedded, is destroyed. As a result the notifier list has a reference to
> a notifier that no longer exists. This causes invalid memory accesses
> when the list is iterated over. Similar for when the probe fails.
> 
> Unregister and clean up the notifier to avoid this.
> 
> Fixes: 1fc3b37f34f6 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver")
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Note that there are other issues in the driver in cleanup paths, in
particular a missing v4l2_async_notifier_cleanup() call in
csi2rx_parse_dt() when v4l2_async_notifier_add_fwnode_remote_subdev()
fails (moving the one from the other error path to an err label would be
best), and missing media_entity_cleanup() calls in both the probe error
path and the remove handler. Would you like to submit fixes for those ?

> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - New in v3.
> 
>  drivers/media/platform/cadence/cdns-csi2rx.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 7b44ab2b8c9a..d60975f905d6 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -469,6 +469,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_cleanup:
> +	v4l2_async_nf_unregister(&csi2rx->notifier);
>  	v4l2_async_nf_cleanup(&csi2rx->notifier);
>  err_free_priv:
>  	kfree(csi2rx);
> @@ -479,6 +480,8 @@ static int csi2rx_remove(struct platform_device *pdev)
>  {
>  	struct csi2rx_priv *csi2rx = platform_get_drvdata(pdev);
>  
> +	v4l2_async_nf_unregister(&csi2rx->notifier);
> +	v4l2_async_nf_cleanup(&csi2rx->notifier);
>  	v4l2_async_unregister_subdev(&csi2rx->subdev);
>  	kfree(csi2rx);
>  

-- 
Regards,

Laurent Pinchart
