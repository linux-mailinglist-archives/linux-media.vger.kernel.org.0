Return-Path: <linux-media+bounces-58883-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLCGONbg4GkEnAAAu9opvQ
	(envelope-from <linux-media+bounces-58883-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:15:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5052140E948
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2CFA1302399A
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58B43BAD85;
	Thu, 16 Apr 2026 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DJzC4ghR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BB2202963
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345297; cv=none; b=juZZ1ALlZ3tcla6ezqRfk3dFY+Kf8KLDrCgjHY7cU6Au5QcfsdOA75aU+uiWpTa9Jfss2Ex/8Yr3UXLlFrKKiIcehkMLmZdiPw7Oh3uWUHuFqtbC2lGTIGqt5IssJs09afsHWKpPAFZY3emZNMNn6Ivh7yvxl+smKSy7CNzER5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345297; c=relaxed/simple;
	bh=ut+TYfWVtZqHNWoz4G96CqKMq12Q17fBcOZZMr68K2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTDkU7/MooF3QAKByI04zi2H11NngafJ6cJoNOnUZcGguVxe1piAp9AnriSBhYPQfDf3zLucc7W+D+6GedIYMJZQVPZqNA5IQXy+LH4xVYpv1JTVldEigNN7yB+tFqVHXbc53GhJ+3BOI5QU9FzeL8A2i2pHd35PSf6YoWZNVks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DJzC4ghR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 79868BB;
	Thu, 16 Apr 2026 15:13:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776345192;
	bh=ut+TYfWVtZqHNWoz4G96CqKMq12Q17fBcOZZMr68K2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DJzC4ghRoUle3IBN+arWOht4FFhSHEBHrx35fvCMZ1DR5O1+PbWnAldrckrh0irSF
	 i5trQM86LNc32XuLSvmeNPeKGOda+bRGo6gS+qTu5q6rQlqhp+YLRfyq4vnKVi99lw
	 OeBeCtMnPiTxdzSOZVKTP75WQDfn+WPah0DKvj3s=
Date: Thu, 16 Apr 2026 16:14:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 01/29] media: imx219: Rename "PIXEL_ARRAY" as "VISIBLE"
Message-ID: <20260416131444.GA1775831@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-2-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58883-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 5052140E948
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 06:39:10PM +0300, Sakari Ailus wrote:
> The imx219 driver uses macros for denoting the size of the pixel array.
> The values reflect the area of manufacturer-designated visible pixels,
> reflect this in the naming by calling it "VISIBLE" instead of
> "PIXEL_ARRAY".

The name "pixel array" is indeed bad. I'm not sure if "visible" is the
best name though. The datasheet documents those pixels as "active area".
The same name seems to be used in the documentation of other Sony
sensors, so we could standardize on that. How about naming the macros
IMX219_ACTIVE_AREA_* ?

If you agree,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx219.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 7da02ce5da15..cbd151d4af5f 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -142,10 +142,10 @@
>  /* IMX219 native and active pixel array size. */
>  #define IMX219_NATIVE_WIDTH		3296U
>  #define IMX219_NATIVE_HEIGHT		2480U
> -#define IMX219_PIXEL_ARRAY_LEFT		8U
> -#define IMX219_PIXEL_ARRAY_TOP		8U
> -#define IMX219_PIXEL_ARRAY_WIDTH	3280U
> -#define IMX219_PIXEL_ARRAY_HEIGHT	2464U
> +#define IMX219_VISIBLE_LEFT		8U
> +#define IMX219_VISIBLE_TOP		8U
> +#define IMX219_VISIBLE_WIDTH		3280U
> +#define IMX219_VISIBLE_HEIGHT		2464U
>  
>  /* Mode : resolution and related config&values */
>  struct imx219_mode {
> @@ -675,13 +675,13 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>  	bpp = imx219_get_format_bpp(format);
>  
>  	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
> -		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> +		  crop->left - IMX219_VISIBLE_LEFT, &ret);
>  	cci_write(imx219->regmap, IMX219_REG_X_ADD_END_A,
> -		  crop->left - IMX219_PIXEL_ARRAY_LEFT + crop->width - 1, &ret);
> +		  crop->left - IMX219_VISIBLE_LEFT + crop->width - 1, &ret);
>  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_STA_A,
> -		  crop->top - IMX219_PIXEL_ARRAY_TOP, &ret);
> +		  crop->top - IMX219_VISIBLE_TOP, &ret);
>  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
> -		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
> +		  crop->top - IMX219_VISIBLE_TOP + crop->height - 1, &ret);
>  
>  	imx219_get_binning(state, &bin_h, &bin_v);
>  	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
> @@ -867,8 +867,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	 * Use binning to maximize the crop rectangle size, and centre it in the
>  	 * sensor.
>  	 */
> -	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / format->width, 2U);
> -	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
> +	bin_h = min(IMX219_VISIBLE_WIDTH / format->width, 2U);
> +	bin_v = min(IMX219_VISIBLE_HEIGHT / format->height, 2U);
>  
>  	/* Ensure bin_h and bin_v are same to avoid 1:2 or 2:1 stretching */
>  	binning = min(bin_h, bin_v);
> @@ -967,10 +967,10 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
>  
>  	case V4L2_SEL_TGT_CROP_DEFAULT:
>  	case V4L2_SEL_TGT_CROP_BOUNDS:
> -		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> -		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> -		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> -		sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
> +		sel->r.top = IMX219_VISIBLE_TOP;
> +		sel->r.left = IMX219_VISIBLE_LEFT;
> +		sel->r.width = IMX219_VISIBLE_WIDTH;
> +		sel->r.height = IMX219_VISIBLE_HEIGHT;
>  
>  		return 0;
>  	}

-- 
Regards,

Laurent Pinchart

