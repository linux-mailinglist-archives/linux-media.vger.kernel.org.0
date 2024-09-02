Return-Path: <linux-media+bounces-17419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA30C969054
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 01:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 192261C21D1E
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 23:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA9E187571;
	Mon,  2 Sep 2024 23:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KUxLcppC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DE01428E8
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 23:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725318504; cv=none; b=qwGEDMLsuOTeCMewDgwoskhSqOTdpcU80rfwJLvWYQ41td9L/TAViOwQZNp8PP5XutJKiUscCv0Kek1Edejerbi00xzQzqkmyxXTrnuRASqcvmxN88Wyzmq31sUMNZtuFJHQ8jkw9IMO3BGdzwxgmSNeD9U6s7Vrhs9m0m1gq/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725318504; c=relaxed/simple;
	bh=fUbNyFTLuKfIEksu4tl0hPZyKrHzUdRPGo5yCYTlTJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBU3nz6DHRB84iznOCyEC/2t3Ze9UKqugQGZw6e00kj1HvFQi2FDlP8Do3v79S5c9ziG+N1J+KWU4qK80fcti6RnFYeLEENNsrFknnqp9rhU/i6gNgIdjGSXWroEHF4JVHPPAhehf2ubtxr3A2Mir6T/FH5qOxJ1hU3CNxVEbiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KUxLcppC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 033E4280;
	Tue,  3 Sep 2024 01:07:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725318430;
	bh=fUbNyFTLuKfIEksu4tl0hPZyKrHzUdRPGo5yCYTlTJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KUxLcppCjcXgi65LJbok9Tg3ZMCIN2UTXdLzfvM1kknWqFxwhhNGQsC5rBfdFjp06
	 xsKN+BETYMXfez0LA8GOAPgiQY7aBlTIbqiur6GlrH6JPpDntzdlB18Di1tvDyTiL3
	 rg8GNA/ANQDXKfjASxfr5bKIgJUIvVM6wlnf5+lQ=
Date: Tue, 3 Sep 2024 02:07:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 2/4] media: pisp_be: Remove config validation from
 schedule()
Message-ID: <20240902230747.GB26371@pendragon.ideasonboard.com>
References: <20240902112408.493201-1-jacopo.mondi@ideasonboard.com>
 <20240902112408.493201-3-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240902112408.493201-3-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Sep 02, 2024 at 01:24:04PM +0200, Jacopo Mondi wrote:
> The config parameters buffer is already validated in
> pisp_be_validate_config() at .buf_prepare() time.
> 
> However some of the same validations are also performed at
> pispbe_schedule() time. In particular the function checks that:
> 
> 1) config.num_tiles is valid
> 2) At least one of the BAYER or RGB input is enabled
> 
> The input config validation is already performed in
> pisp_be_validate_config() and while job.hw_enables is modified by
> pispbe_xlate_addrs(), the function only resets the input masks if
> 
> - there is no input buffer available, but pispbe_prepare_job() fails
>   before calling pispbe_xlate_addrs() in this case
> - bayer_enable is 0, but in this case rgb_enable is valid as guaranteed
>   by pisp_be_validate_config()
> - only outputs are reset in rgb_enable
> 
> For this reasons there is no need to repeat the check at
> pispbe_schedule() time.
> 
> The num_tiles validation can be moved to pisp_be_validate_config() as
> well. As num_tiles is a u32 it can'be be < 0, so change the sanity
> check accordingly.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../platform/raspberrypi/pisp_be/pisp_be.c    | 25 ++++++-------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index 8ba1b9f43ba1..41fd68b7757b 100644
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
> +		return -EINVAL;
> +	}
> +
>  	/* Ensure output config strides and buffer sizes match the V4L2 formats. */
>  	fmt = &pispbe->node[TDN_OUTPUT_NODE].format;
>  	if (bayer_enables & PISP_BE_BAYER_ENABLE_TDN_OUTPUT) {

-- 
Regards,

Laurent Pinchart

