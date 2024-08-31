Return-Path: <linux-media+bounces-17275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C799671BC
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 15:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1ABB3B21CD1
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 13:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C7FDF6C;
	Sat, 31 Aug 2024 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FJXJYhLy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8101BF2A
	for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 13:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725110311; cv=none; b=AontjGrw2+B2aK9PDWQML6vjH1fYgwruaMjoHpTeVE9AigvHhT2U7QYvQGpQEAiIhi+g9JFle66HIH+3iUF/spRXzapMg42gFDzlmsudZrvmpMQe4oAnftj46qrdiycpWSZOv0yq+llNqkV8xfoYLC+96X/z2mhKtKdU2cFvzK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725110311; c=relaxed/simple;
	bh=hVZo+V84SZNmdyzhRszi9sW+EMc4ktap3KKIbCTjajY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPu7HD3E/GXvPKYrk+AbdGxCzxGPBnccS4kkZkgMIKIGug+AhhnZu+3vZ447O6zUNKc9NJnJCCnCY6vEJaszZ5mx3JcxLTyXcEVAe8b3E33eKZ86WQLurxbmdpAudpxx/fs3MaZxjBmRizUrnLY+10XnzGZYU3Vmz1aMkCYfIZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FJXJYhLy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B1BC735;
	Sat, 31 Aug 2024 15:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725110237;
	bh=hVZo+V84SZNmdyzhRszi9sW+EMc4ktap3KKIbCTjajY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FJXJYhLyVjSEFnFPBaMGLB0PENQFtFjcEUAv02IHu3+HsFMgj8DHhpazj4t4l1tgz
	 TzGcsQPRtpZAtwsAPvsfd3TScBaofBL1prYioX0wcbOMLVcOdkZqHuKqKVrIZTHIFH
	 A/W2S5StBHkHwi9RYppvUyEQ/bHCmnismwbBEcx8=
Date: Sat, 31 Aug 2024 16:17:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: pisp_be: Remove config validation from
 schedule()
Message-ID: <20240831131756.GV3811@pendragon.ideasonboard.com>
References: <20240827074018.534354-1-jacopo.mondi@ideasonboard.com>
 <20240827074018.534354-3-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240827074018.534354-3-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 27, 2024 at 09:40:16AM +0200, Jacopo Mondi wrote:
> The config parameters buffer is already validated in
> pisp_be_validate_config() at .buf_prepare() time.

Unfortunately .buf_prepare() isn't the right place to handle the
validation. Userspace should not modify the contents of the buffer
before BUF_PREPARE and QBUF, but malicious (or just buggy) userspace
may. The validation should thus be moved to .buf_queue().

> However some of the same validations are also performed at
> pispbe_schedule() time. In particular the function checks that:
> 
> 1) config.num_tiles is valid
> 2) At least one of the BAYER or RGB input is enabled
> 
> The input validation is already performed in pisp_be_validate_config()
> and there is no need to repeat that at pispbe_schedule() time.

Is that the same validation though ? The one in
pisp_be_validate_config() validates config->config.global, while the
validation in pispbe_schedule() validates job.hw_enables. The latter is
set from config->config.global in pispbe_xlate_addrs(), but is later
modified in the function.

> The num_tiles validation can be moved to pisp_be_validate_config() as
> well. As num_tiles is a u32 it can'be be < 0, so change the sanity
> check accordingly.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../platform/raspberrypi/pisp_be/pisp_be.c    | 25 ++++++-------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index 8ba1b9f43ba1..73a5c88e25d0 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -588,24 +588,6 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
>  	pispbe->hw_busy = true;
>  	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
>  
> -	if (job.config->num_tiles <= 0 ||
> -	    job.config->num_tiles > PISP_BACK_END_NUM_TILES ||
> -	    !((job.hw_enables.bayer_enables | job.hw_enables.rgb_enables) &
> -	      PISP_BE_BAYER_ENABLE_INPUT)) {
> -		/*
> -		 * Bad job. We can't let it proceed as it could lock up
> -		 * the hardware, or worse!
> -		 *
> -		 * For now, just force num_tiles to 0, which causes the
> -		 * H/W to do something bizarre but survivable. It
> -		 * increments (started,done) counters by more than 1,
> -		 * but we seem to survive...
> -		 */
> -		dev_dbg(pispbe->dev, "Bad job: invalid number of tiles: %u\n",
> -			job.config->num_tiles);
> -		job.config->num_tiles = 0;
> -	}
> -
>  	pispbe_queue_job(pispbe, &job);
>  
>  	return;
> @@ -703,6 +685,13 @@ static int pisp_be_validate_config(struct pispbe_dev *pispbe,
>  		return -EIO;
>  	}
>  
> +	if (config->num_tiles == 0 ||
> +	    config->num_tiles > PISP_BACK_END_NUM_TILES) {
> +		dev_dbg(dev, "%s: Invalid number of tiles: %d\n", __func__,
> +			config->num_tiles);
> +		return -EIO;

Isn't -EINVAL a better error code ?

> +	}
> +
>  	/* Ensure output config strides and buffer sizes match the V4L2 formats. */
>  	fmt = &pispbe->node[TDN_OUTPUT_NODE].format;
>  	if (bayer_enables & PISP_BE_BAYER_ENABLE_TDN_OUTPUT) {

-- 
Regards,

Laurent Pinchart

