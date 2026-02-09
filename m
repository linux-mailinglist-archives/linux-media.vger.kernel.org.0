Return-Path: <linux-media+bounces-52470-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G7QIb1kimmiJwAAu9opvQ
	(envelope-from <linux-media+bounces-52470-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 23:50:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E112C115403
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 23:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2B7D3051863
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 22:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32967317708;
	Mon,  9 Feb 2026 22:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K/jADqVG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8BE315760;
	Mon,  9 Feb 2026 22:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770677081; cv=none; b=NI7HAAsvzlBPpaTYupSG7Mfzm5ttLlsXU//OHXSM6606JSEEQ8PNUp6SakesqZiTkLhrCTGD1sxuGiHDGfmal0qYz/JDOKI/sI0EOehYRHEOQnQ6Yf4cUbKkfxL0n4MALP3173BrjCsmfe9NKaPt1KRrkmLCCzu5mBzKEFat2oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770677081; c=relaxed/simple;
	bh=OlW0JHB055QJRTc+KSdO4zjLxltnTtyR0aKriait4g0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSR0DUzhu1SBtXYZ859kCdKOrNTVHL3H6xn8WNbG5qHIe/1uRpPPitCgcdHK6ozOV8d5BPv68aCgU+Va7sq9rAvfcNJ+Oh5E1PBuN9yiNOMDMpkw5PaX2Ma8RNtDeFvAKKeWGcIbPXZ6/dlZ6uB97qvT2x/AGAokTjGnDcNOJOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K/jADqVG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6E99F63F;
	Mon,  9 Feb 2026 23:43:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770677031;
	bh=OlW0JHB055QJRTc+KSdO4zjLxltnTtyR0aKriait4g0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/jADqVG4lzfhGOMPK/8gBgf32WGNQ1Jp0t1nz5RkqpAtEY3U2zxOn4TN0JPOEhop
	 nJ+ai8ZIiO9XnCcx8NW+8An0AO9hG5dcH0vTrcqsjnNyCYXZ1Gi08rFAC3/6QdoBDg
	 XUgyX0UB9Vn/jRco5DoyUa7TacBp2T6k0+v7zp4Y=
Date: Tue, 10 Feb 2026 00:44:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maxime Ripard <mripard@redhat.com>
Subject: Re: [PATCH v5 2/2] media: bcm2835-unicam: Fix RGB format / mbus code
 association
Message-ID: <20260209224436.GE2405149@killaraus.ideasonboard.com>
References: <20260209-csi-bgr-rgb-v5-0-e7af3cd6cde6@redhat.com>
 <20260209-csi-bgr-rgb-v5-2-e7af3cd6cde6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260209-csi-bgr-rgb-v5-2-e7af3cd6cde6@redhat.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52470-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: E112C115403
X-Rspamd-Action: no action

Hi Maxime,

Thank you for the patch.

On Mon, Feb 09, 2026 at 04:03:17PM +0100, Maxime Ripard wrote:
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
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 36 +++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index f10064107d543caf867249d0566a0f42d6d8c4c6..5e4850831c931d346146aa8e22c53f0655e462c9 100644
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
> @@ -2153,12 +2153,40 @@ static int unicam_video_link_validate(struct media_link *link)
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
> +		if (fmtinfo->code != format->code) {
> +			if (fmtinfo->fourcc == V4L2_PIX_FMT_BGR24 &&
> +			    format->code == MEDIA_BUS_FMT_BGR888_1X24) {
> +				dev_warn_once(node->dev->dev,
> +					      "MIPI-CSI media bus code for RGB88 is RGB888_1X24. The application must be fixed.");

s/RGB88/RGB888/

But I find this confusing, the message doesn't make it clear if RGB888 +
RGB888_1X24 is expected or is an error. I think the following would be
clearer.

				dev_warn_once(node->dev->dev,
					      "Incorrect pixel format BGR24 for BGR888_1X24. Fix your application to use RGB24.");

> +			} else if (fmtinfo->fourcc == V4L2_PIX_FMT_RGB24 &&
> +				   format->code == MEDIA_BUS_FMT_RGB888_1X24) {
> +				dev_warn_once(node->dev->dev,
> +					      "MIPI-CSI media bus code for BGR888 is BGR888_1X24. The application must be fixed.");

				dev_warn_once(node->dev->dev,
					      "Incorrect pixel format RGB24 for RGB888_1X24. Fix your application to use BGR24.");

Or you could combine those two (untested):

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index f10064107d54..e9f191536765 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2148,22 +2148,38 @@ static int unicam_video_link_validate(struct media_link *link)
 		const struct v4l2_pix_format *fmt = &node->fmt.fmt.pix;
 		const struct unicam_format_info *fmtinfo;

-		fmtinfo = unicam_find_format_by_fourcc(fmt->pixelformat,
-						       UNICAM_SD_PAD_SOURCE_IMAGE);
+		fmtinfo = unicam_find_format_by_code(format->code,
+						     UNICAM_SD_PAD_SOURCE_IMAGE);
 		if (WARN_ON(!fmtinfo)) {
 			ret = -EPIPE;
 			goto out;
 		}

-		if (fmtinfo->code != format->code ||
-		    fmt->height != format->height ||
+		if (fmtinfo->fourcc != fmt->pixelformat) {
+			if ((fmtinfo->fourcc == V4L2_PIX_FMT_BGR24 &&
+			     format->code == MEDIA_BUS_FMT_BGR888_1X24) ||
+			    (fmtinfo->fourcc == V4L2_PIX_FMT_RGB24 &&
+			     format->code == MEDIA_BUS_FMT_RGB888_1X24)) {
+                                dev_warn_once(node->dev->dev,
+                                              "Incorrect pixel format %p4CC for 0x%04x. Fix your application to use %p4CC.\n",
+                                              &fmt->pixelformat, format->code, &fmtinfo->fourcc);
+			} else {
+				dev_dbg(node->dev->dev,
+					"image: format mismatch: 0x%04x <=> %p4CCx\n",
+					format->code, &fmt->pixelformat);
+				ret = -EPIPE
+				goto out;
+			}
+		}
+
+		if (fmt->height != format->height ||
 		    fmt->width != format->width ||
 		    fmt->field != format->field) {
 			dev_dbg(node->dev->dev,
-				"image: (%u x %u) 0x%08x %s != (%u x %u) 0x%08x %s\n",
-				fmt->width, fmt->height, fmtinfo->code,
+				"image: (%u x %u) %s != (%u x %u) %s\n",
+				fmt->width, fmt->height,
 				v4l2_field_names[fmt->field],
-				format->width, format->height, format->code,
+				format->width, format->height,
 				v4l2_field_names[format->field]);
 			ret = -EPIPE;
 		}

> +			} else {
> +				dev_dbg(node->dev->dev,
> +					"image: (%u x %u) 0x%08x %s != (%u x %u) 0x%08x %s\n",
> +					fmt->width, fmt->height, fmtinfo->code,
> +					v4l2_field_names[fmt->field],
> +					format->width, format->height, format->code,
> +					v4l2_field_names[format->field]);

As this message is printed specifically due to a format mismatch, I
would drop the size and field information:

				dev_dbg(node->dev->dev,
					"image: format mismatch: 0x%04x <=> %p4CC\n",
					format->code, &fmt->pixelformat);

> +				ret = -EPIPE;
> +				goto out;
> +			}
> +		}
> +
> +		if (fmt->height != format->height ||
>  		    fmt->width != format->width ||
>  		    fmt->field != format->field) {
>  			dev_dbg(node->dev->dev,
>  				"image: (%u x %u) 0x%08x %s != (%u x %u) 0x%08x %s\n",
>  				fmt->width, fmt->height, fmtinfo->code,

And here you can drop the format.

I like the approach in this v5. As far as I can see, it won't break
userspace, will warn of incorrect format usage, and implements the
backward compatibility in the driver that initially got it wrong,
unicam. I'm happy with it.

-- 
Regards,

Laurent Pinchart

