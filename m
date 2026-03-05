Return-Path: <linux-media+bounces-54628-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFkSHnN1qWl77wAAu9opvQ
	(envelope-from <linux-media+bounces-54628-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 13:22:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA2D211854
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 13:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E1A23052068
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 12:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE232222AC;
	Thu,  5 Mar 2026 12:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tgiJubjD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A0937E2F8;
	Thu,  5 Mar 2026 12:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772713046; cv=none; b=gV4QWV7BH+0CQrp1XeTGQtGaIzeqMElwpusvoCSu0K6q0zONb1KSZ2nkuaiMtJmPZsK1PTPjp+KBokqckEQx3/1o+QMewIK+oHtTUb7B4zwgaWM73qhJoDSUSTWiaQRjVTXrom4zq0QpvG+lelHOP1boHPiYfoGmOI6yx9itwqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772713046; c=relaxed/simple;
	bh=d4y+XtC83XfG2HNat8p7aTyLQ8G6bjWMXUwlPX28nWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ufj1+TI7eYcQFOVwCsut3QVTu3XE2hgIBtGNq0eDAdMjKUQjpLRRzrV8r5+f31GmTiXSB6iDWiAgAhSEeTiM1MWBJQzuF61jJMeAhKKF8g31XBKwhlYE7BUyzD3ZZNxRaU5/ii7LbZERVV1f6lNPjpNAuEi8dJIxbczsrCQYdIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tgiJubjD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (85-76-15-90-nat.elisa-mobile.fi [85.76.15.90])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1739E802;
	Thu,  5 Mar 2026 13:16:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772712979;
	bh=d4y+XtC83XfG2HNat8p7aTyLQ8G6bjWMXUwlPX28nWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tgiJubjDwDigo+sDF/LwC/nbjDzU9/ucNc/CdGydxlhgczqfGNkIf7c8CnYbCa5og
	 ltxYfQ6cPJBn59oIY7YR8O/X0Q880oPlJoO3fpYtEh7wn9iKV9kUkAa0TPLCTCUXKk
	 9yutpEvBHopZS28mW/h2ul0wYs0S0mJaHWnLegeo=
Date: Thu, 5 Mar 2026 13:17:20 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maxime Ripard <mripard@redhat.com>
Subject: Re: [PATCH v6 2/2] media: bcm2835-unicam: Fix RGB format / mbus code
 association
Message-ID: <20260305121720.GB203047@killaraus.ideasonboard.com>
References: <20260217-csi-bgr-rgb-v6-0-064607effe42@redhat.com>
 <20260217-csi-bgr-rgb-v6-2-064607effe42@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217-csi-bgr-rgb-v6-2-064607effe42@redhat.com>
X-Rspamd-Queue-Id: 7DA2D211854
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54628-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Action: no action

Hi Maxime,

Thank you for the patch.

On Tue, Feb 17, 2026 at 09:38:58AM +0100, Maxime Ripard wrote:
> From: Maxime Ripard <mripard@redhat.com>
> 
> The Unicam driver is a MIPI-CSI2 Receiver, that can capture RGB 4:4:4,
> YCbCr 4:2:2, and raw formats.
> 
> RGB 4:4:4 is converted to the MIPI-CSI2 RGB888 video format, and
> associated to the MEDIA_BUS_FMT_RGB888_1X24 media bus code.
> 
> However, V4L2_PIX_FMT_RGB24 is defined as having its color components in
> the R, G and B order, from left to right. MIPI-CSI2 however defines the
> RGB888 format with blue first, and that's what MEDIA_BUS_FMT_RGB888_1X24
> defines too.
> 
> This essentially means that the R and B will be swapped compared to what
> V4L2_PIX_FMT_RGB24 defines. The same situation occurs with
> V4L2_PIX_FMT_BGR24 being associated to MEDIA_BUS_FMT_BGR888_1X24.
> 
> In order to fix the swapped components, we need to change the
> association of V4L2_PIX_FMT_BGR24 to MEDIA_BUS_FMT_RGB888_1X24, and of
> V4L2_PIX_FMT_RGB24 to MEDIA_BUS_FMT_BGR888_1X24.
> 
> Since the media bus code is exposed to userspace, and validated by
> unicam's link_validate implementation, we need to explicitly accept (and
> warn) the old association still to preserve backward compatibility.
> 
> Signed-off-by: Maxime Ripard <mripard@redhat.com>
> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 43 +++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index f10064107d543caf867249d0566a0f42d6d8c4c6..648d81b741e258cc24075d5f95903ee748280695 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -340,16 +340,16 @@ static const struct unicam_format_info unicam_image_formats[] = {
>  		.code		= MEDIA_BUS_FMT_RGB565_1X16,
>  		.depth		= 16,
>  		.csi_dt		= MIPI_CSI2_DT_RGB565,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_RGB24, /* rgb */
> -		.code		= MEDIA_BUS_FMT_RGB888_1X24,
> +		.code		= MEDIA_BUS_FMT_BGR888_1X24,
>  		.depth		= 24,
>  		.csi_dt		= MIPI_CSI2_DT_RGB888,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_BGR24, /* bgr */
> -		.code		= MEDIA_BUS_FMT_BGR888_1X24,
> +		.code		= MEDIA_BUS_FMT_RGB888_1X24,
>  		.depth		= 24,
>  		.csi_dt		= MIPI_CSI2_DT_RGB888,
>  	}, {
>  	/* Bayer Formats */
>  		.fourcc		= V4L2_PIX_FMT_SBGGR8,
> @@ -2146,26 +2146,51 @@ static int unicam_video_link_validate(struct media_link *link)
>  
>  	if (is_image_node(node)) {
>  		const struct v4l2_pix_format *fmt = &node->fmt.fmt.pix;
>  		const struct unicam_format_info *fmtinfo;
>  
> -		fmtinfo = unicam_find_format_by_fourcc(fmt->pixelformat,
> -						       UNICAM_SD_PAD_SOURCE_IMAGE);
> +		fmtinfo = unicam_find_format_by_code(format->code,
> +						     UNICAM_SD_PAD_SOURCE_IMAGE);
>  		if (WARN_ON(!fmtinfo)) {
>  			ret = -EPIPE;
>  			goto out;
>  		}
>  
> -		if (fmtinfo->code != format->code ||
> -		    fmt->height != format->height ||
> +		/*
> +		 * Unicam initially associated BGR24 to BGR888_1X24 and
> +		 * RGB24 to RGB888_1X24.
> +		 *
> +		 * In order to allow the applications using the old
> +		 * behaviour to run, let's accept the old combination,
> +		 * but warn about it.
> +		 */

You could reflow this to 80 columns.

> +		if (fmtinfo->fourcc != fmt->pixelformat) {
> +			if ((fmt->pixelformat == V4L2_PIX_FMT_BGR24 &&
> +			     format->code == MEDIA_BUS_FMT_BGR888_1X24) ||
> +			    (fmt->pixelformat == V4L2_PIX_FMT_RGB24 &&
> +			     format->code == MEDIA_BUS_FMT_RGB888_1X24)) {
> +				dev_warn_once(node->dev->dev,
> +					      "Incorrect pixel format %p4cc for 0x%04x. Fix your application to use %p4cc.\n",
> +					      &fmt->pixelformat, format->code, &fmtinfo->fourcc);
> +			} else {
> +				dev_dbg(node->dev->dev,
> +					"image: format mismatch: 0x%04x <=> %p4cc\n",
> +					format->code, &fmt->pixelformat);
> +				ret = -EPIPE;
> +				goto out;
> +			}
> +		}
> +
> +

Double blank line.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		if (fmt->height != format->height ||
>  		    fmt->width != format->width ||
>  		    fmt->field != format->field) {
>  			dev_dbg(node->dev->dev,
> -				"image: (%u x %u) 0x%08x %s != (%u x %u) 0x%08x %s\n",
> -				fmt->width, fmt->height, fmtinfo->code,
> +				"image: (%u x %u) %s != (%u x %u) %s\n",
> +				fmt->width, fmt->height,
>  				v4l2_field_names[fmt->field],
> -				format->width, format->height, format->code,
> +				format->width, format->height,
>  				v4l2_field_names[format->field]);
>  			ret = -EPIPE;
>  		}
>  	} else {
>  		const struct v4l2_meta_format *fmt = &node->fmt.fmt.meta;

-- 
Regards,

Laurent Pinchart

