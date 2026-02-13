Return-Path: <linux-media+bounces-52768-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOcqD085j2nHNAEAu9opvQ
	(envelope-from <linux-media+bounces-52768-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:46:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 875D61372FA
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B23C93100606
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1106E22E3F0;
	Fri, 13 Feb 2026 14:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vHrUV/4Z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E31D33A6E2
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770993769; cv=none; b=oyNFC1az2wu3yEJAhrccHKHHX4hR/ww2eYq9TnAxDW+SFooOhLAlkM1uA7X0PCSxN+Lebe7cvQk2KHk0jUK2q3glBl7bjB3FwhBzuf0DrHPHJWjX1gEmsPjcFXn7Y9dLE/he0WQx4ns+mTl5sBkENBhzn2/QeEjy4fAyBmiNM2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770993769; c=relaxed/simple;
	bh=5LZEiyblmE5cjTTaA/tSxotTzlumfsspN658jeKcIks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQECXKxb2Aky/wWwFI8UtIS85xTz+p9TZ7704K6hJdk5RQpfe55YO3XJPGCNncwCpvVVpQ5TfYQ6m5Jje6Ay6xAAkdupvxoBFMIwQhJchSq+1HEFwD8sSdjILiX6FR2ODHcWyoo2DHx1aYdYytysvTvvkmZZBY2WejW3iIV4KK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vHrUV/4Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77695348;
	Fri, 13 Feb 2026 15:41:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770993716;
	bh=5LZEiyblmE5cjTTaA/tSxotTzlumfsspN658jeKcIks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vHrUV/4ZjlYCRgRFR7NXLIljrUYHD6gdNtAl5QKgqeKpgqbCdFfOWd5caAQ354xPo
	 WyvJKvRD4TsySezMlq9s14EZQ187uDnKOC7ucH/Z9gVJndGfFab8h0AetTD+5+Yzlc
	 euWeBQu2cUP1QRsCWpM7xRLPOCws8CqeYq1vcS5s=
Date: Fri, 13 Feb 2026 15:42:41 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, 
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 01/14] media: imx219: Rename "PIXEL_ARRAY" as "CROP"
Message-ID: <aY83fFX7wi5gzDfV@zed>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211090920.1851141-2-sakari.ailus@linux.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52768-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 875D61372FA
X-Rspamd-Action: no action

Hi Sakari
  How is this related to the metadata seris ? :)

Shouldn't we aim to fast track that series instead of adding more
things as requisites ?

On Wed, Feb 11, 2026 at 11:09:07AM +0200, Sakari Ailus wrote:
> The imx219 driver uses macros for denoting different aspects of the pixel
> array. The values used for IMX219_PIXEL_ARRAY_* macros imply a crop
> configuration however, not the size of the pixel array. Reflect this in
> the naming, too.

3280x2464 is the active pixel array area, according to the datasheet.
I guess one can claim is the default crop (it is in facts used as
DEFAULT_CROP and CROP_BOUNDS rectangle), so:

Acked-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx219.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index fee63bc106d9..54622c406a03 100644
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
> +#define IMX219_CROP_LEFT		8U
> +#define IMX219_CROP_TOP			8U
> +#define IMX219_CROP_WIDTH		3280U
> +#define IMX219_CROP_HEIGHT		2464U
>
>  /* Mode : resolution and related config&values */
>  struct imx219_mode {
> @@ -675,13 +675,13 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>  	bpp = imx219_get_format_bpp(format);
>
>  	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
> -		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> +		  crop->left - IMX219_CROP_LEFT, &ret);
>  	cci_write(imx219->regmap, IMX219_REG_X_ADD_END_A,
> -		  crop->left - IMX219_PIXEL_ARRAY_LEFT + crop->width - 1, &ret);
> +		  crop->left - IMX219_CROP_LEFT + crop->width - 1, &ret);
>  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_STA_A,
> -		  crop->top - IMX219_PIXEL_ARRAY_TOP, &ret);
> +		  crop->top - IMX219_CROP_TOP, &ret);
>  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
> -		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
> +		  crop->top - IMX219_CROP_TOP + crop->height - 1, &ret);
>
>  	imx219_get_binning(state, &bin_h, &bin_v);
>  	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
> @@ -867,8 +867,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	 * Use binning to maximize the crop rectangle size, and centre it in the
>  	 * sensor.
>  	 */
> -	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / format->width, 2U);
> -	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
> +	bin_h = min(IMX219_CROP_WIDTH / format->width, 2U);
> +	bin_v = min(IMX219_CROP_HEIGHT / format->height, 2U);
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
> +		sel->r.top = IMX219_CROP_TOP;
> +		sel->r.left = IMX219_CROP_LEFT;
> +		sel->r.width = IMX219_CROP_WIDTH;
> +		sel->r.height = IMX219_CROP_HEIGHT;
>
>  		return 0;
>  	}
> --
> 2.47.3
>
>

