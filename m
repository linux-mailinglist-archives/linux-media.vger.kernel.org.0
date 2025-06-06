Return-Path: <linux-media+bounces-34245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD08AD0244
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26A723A7D6E
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510F2288538;
	Fri,  6 Jun 2025 12:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iYmgYv6/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3089C287513;
	Fri,  6 Jun 2025 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749213255; cv=none; b=G8iXrBezfv9C8553UGPZcc2bdvCoXrD8OFA91rdFOA1OHd9iYtuFTx2o7xvTRg1eTQQC9ZgmHDYk6FdxkLQIndmFzKWNWYF1KdAgcuTrSPFmsLr6ewkQFnuadENV04AYyxkd8Laer9XaV0QX+BjxTZWfU0lEdgX8r4fvvDx1PGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749213255; c=relaxed/simple;
	bh=KUB1zHF41EieIHY6D7XrX8haH8SMgp958TtlLmEVyME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mykdciOsmDGJsy6nkPZYELNGfEbpBVvFgYCQ4CWHqYEahncwDGmiGZGHiz/GxLIPXY4izC6oajb5bUdypuVC/pXqd6JlQ34Rr3tJ5BwLXD3YAHsE1ozBuFShdn+IFJyt9FDOM3bKvW4hzJuwLTw1MjgtQ6s5svMROTPWuh3+8Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iYmgYv6/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00E1811DD;
	Fri,  6 Jun 2025 14:34:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749213247;
	bh=KUB1zHF41EieIHY6D7XrX8haH8SMgp958TtlLmEVyME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYmgYv6/bkOqUY27LwbLH8YpzTftPCEyojGssCbFJDNzi/e7NTTfKskNvC6JTRalL
	 weTLpS/8iDMAjVRE9f4JNBoBaRviTxp+dQ7r2//TfTQYSbQpKveA36ua5KsYHRFkoe
	 Jp4lyDEB7i1raRFKlZvqzbOwFywnH6ytawPeQg9k=
Date: Fri, 6 Jun 2025 15:34:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: kieran.bingham@ideasonboard.com, rmfrfs@gmail.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: platform: Refactor interrupt status registers
Message-ID: <20250606123400.GB27510@pendragon.ideasonboard.com>
References: <20250606121403.498153-1-isaac.scott@ideasonboard.com>
 <20250606121403.498153-2-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606121403.498153-2-isaac.scott@ideasonboard.com>

Hi Isaac,

Thank you for the patch.

On Fri, Jun 06, 2025 at 01:14:02PM +0100, Isaac Scott wrote:
> The NXP i.MX 8 MP CSI-2 receiver features multiple interrupt and debug
> status sources which span multiple registers. The driver currently
> supports two interrupt source registers, and attributes the
> mipi_csis_event event entries to those registers through a boolean debug
> field that indicate if the event relates to the main interrupt status
> (false) or debug interrupt status (true) register. To make it easier to
> add new event fields, replace the debug bool with a 'status index'
> integer than indicates the index of the corresponding status register.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 64 +++++++++++-----------
>  1 file changed, 31 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index d060eadebc7a..bbc549c22aff 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -249,7 +249,7 @@
>  #define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
>  
>  struct mipi_csis_event {
> -	bool debug;
> +	unsigned int status_index;
>  	u32 mask;
>  	const char * const name;
>  	unsigned int counter;
> @@ -257,30 +257,30 @@ struct mipi_csis_event {
>  
>  static const struct mipi_csis_event mipi_csis_events[] = {
>  	/* Errors */
> -	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,	"Early Frame End" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,	"Early Frame Start" },
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,		"Wrong Configuration Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_ECC,			"ECC Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_CRC,			"CRC Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,		"Data Type Ignored"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,		"Early Frame End"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,		"Early Frame Start"},
>  	/* Non-image data receive events */
> -	{ false, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame" },
> -	{ false, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame" },
> -	{ false, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame" },
> -	{ false, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame" },
> +	{ 0, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame"},
> +	{ 0, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame"},
> +	{ 0, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame"},
> +	{ 0, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame"},
>  	/* Frame start/end */
> -	{ false, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start" },
> -	{ false, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge" },
> +	{ 0, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start"},
> +	{ 0, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge"},
>  };
>  
>  #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
> @@ -765,32 +765,30 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
>  	struct mipi_csis_device *csis = dev_id;
>  	unsigned long flags;
>  	unsigned int i;
> -	u32 status;
> -	u32 dbg_status;
> +	u32 status[2];
>  
> -	status = mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
> -	dbg_status = mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
> +	status[0] = mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
> +	status[1] = mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
>  
>  	spin_lock_irqsave(&csis->slock, flags);
>  
>  	/* Update the event/error counters */
> -	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
> +	if ((status[0] & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
>  		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
>  			struct mipi_csis_event *event = &csis->events[i];
>  
> -			if ((!event->debug && (status & event->mask)) ||
> -			    (event->debug && (dbg_status & event->mask)))
> +			if (status[event->status_index] & event->mask)
>  				event->counter++;
>  		}
>  	}
>  
> -	if (status & MIPI_CSIS_INT_SRC_FRAME_START)
> +	if (status[0] & MIPI_CSIS_INT_SRC_FRAME_START)
>  		mipi_csis_queue_event_sof(csis);
>  
>  	spin_unlock_irqrestore(&csis->slock, flags);
>  
> -	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status);
> -	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, dbg_status);
> +	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status[0]);
> +	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, status[1]);
>  
>  	return IRQ_HANDLED;
>  }

-- 
Regards,

Laurent Pinchart

