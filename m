Return-Path: <linux-media+bounces-29956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F16EBA849C0
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 18:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C534C3B8EEC
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 16:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39A71EE010;
	Thu, 10 Apr 2025 16:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="dYO3/Rp+"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0269A1E3780;
	Thu, 10 Apr 2025 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302476; cv=pass; b=ntL3A+/TKGmem3YVDB9HQZap+uEaFNORvZoHXkohryMSQqxfg6WhIvIEBm2PpFy1HANvhYiPn0+1Y3DShSA656Z1KaOxCD00yub2De1rHTnUvoQ9UzesRB8ay1s+/BOpHtylnjkg9muL44wA7T2Edmjo+L68EOQMvIdnWJV7pig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302476; c=relaxed/simple;
	bh=xOdFbFHUMBmbX6rNQi65CougeA5d9LZMvbdkTvlinOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sx0XgfPnlY5gEoJfzWAT908XcgYka+LAw1RNrDiZQyQ26deQ6QmBWCSd8srZ7Qpx+09jLRoecoSkq2Bcow6nba6mrZww1bIvSiuUYqGLCWBmK29uj3ZOOsb6bct+FrDCpRPDCj04ai6DbaEtEXYZFH5Le/E/2UKXsKedn5CfPjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=dYO3/Rp+; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4ZYQG22fxZz49Psw;
	Thu, 10 Apr 2025 19:27:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1744302458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w0QvXqOCEKHNwLlFxSExtlT8Nh2mSp/gDgD4va5NV40=;
	b=dYO3/Rp+ii6sHVyGpqaw0kzGjyI/71dxNrYCK4X8X98y3CsYlL+SilzR/sDa4L/x5guEX7
	eiXVS86oMt5bo7Aj7Y0wMhbTK7l3kiZcMPSSTh4jz8Oj6L+Yh6lqvVs6WUv0+9R0k3Hfoj
	VlGb5/yUOCaqwKvEPZpAuLE5y1WEQ56TA2DYc+1LpOXtYeA+5pW4s/bMpg/BxXU0izHuvr
	dnXTAw/nlnAog6Dx3wFq0Vbk5ISeOkHnRHAtAlZAtag/1KUsrf6F3JHTVjDYFm6np+tnWz
	tChE3VwVNwsCLzhuyRi1J6FISBmnTQ0EhEspQ+5pQRky7i3ZdecznUifc8aTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1744302458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w0QvXqOCEKHNwLlFxSExtlT8Nh2mSp/gDgD4va5NV40=;
	b=HsUDWk5jfa3325EOehM16X0xArWcIORBrIQMhQ2KGdq1RaflLAhFpq6QHimxYAWRTAJGWl
	+h2aPBo0ydpybc0ZrU3n1GteBJX1iOWs1vroAlbOkxGsWm8AysOBq1WpHDo6I5x7TEy53K
	C2cN4uxSojo+qhARlmJxUbvjMHOXWdfF6BANtFgZYGxKGe1mseDynlFikWMZZSgp2PTgT4
	cOKpGu6fBkEGjYr/SejfIYhXuIEbfIWXN2oIenc1hVtiNkwkajSuYtHZYZoASEKAXuY14l
	qbbTP4FvzLbAJ7Ij6Xoeb2xeOkKXDCZDOCbU79Le99v1kblxJBaxjod/9kANCw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1744302458; a=rsa-sha256;
	cv=none;
	b=WGNzqwjbZANdhZ1UXarowHoR+BbJ/VT0wumrVVb47PRTQGsO0f4Bjhl40CnMesOkCBz+WB
	Cflw59o2OSu/CbORvVfY2DBSpwII0PNTmqej/6T3QC1UGeh9Cd4D7hmq3pMIPNKV8yVEr/
	ZimF/mER94IRzVM/vHdAHb10lHNahT+YHQIQeY3cw96VXLy++I7Ye2CymTrp/eEhTBip2D
	JgV00B81TO2AAVB1HdjKRiiGwkXk9zmTDAZ+CTWiE79C4b4i1r04p+K6QItbffQ/ccopt3
	FnyScprRhEiQkntnTyCTyOTQE5lVE8bhuQyvdEOAHYHJIGrvPF4VTTCVz5VPAQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BCF8B634C93;
	Thu, 10 Apr 2025 19:27:37 +0300 (EEST)
Date: Thu, 10 Apr 2025 16:27:37 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [yavta] [PATCH 3/3] Add colorspace support
Message-ID: <Z_fxeetrWfPqtoc5@valkosipuli.retiisi.eu>
References: <20250408233323.7650-1-laurent.pinchart@ideasonboard.com>
 <20250408233323.7650-4-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408233323.7650-4-laurent.pinchart@ideasonboard.com>

Hi Laurent,

Thanks for the set.

On Wed, Apr 09, 2025 at 02:33:23AM +0300, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Add four command line options to support setting the colorspace,
> transfer function, encoding and quantization.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  yavta.c | 205 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 202 insertions(+), 3 deletions(-)
> 
> diff --git a/yavta.c b/yavta.c
> index 4f7306daa0ce..b463f5841100 100644
> --- a/yavta.c
> +++ b/yavta.c
> @@ -184,6 +184,63 @@ static int pause_init(void)
>  	return 0;
>  }
>  
> +/* -----------------------------------------------------------------------------
> + * Key-value pairs handling
> + */
> +
> +struct key_value {
> +	const char *name;
> +	unsigned int value;
> +};
> +
> +static int __key_value_get(const struct key_value *values,
> +			   unsigned int count, const char *name)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < count; ++i) {
> +		if (!strcmp(values[i].name, name))
> +			return values[i].value;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static void __key_value_list(const struct key_value *values,
> +			     unsigned int count, const char *type)
> +{
> +	unsigned int chars;
> +	unsigned int i;
> +	bool first = true;
> +
> +	chars = printf("%s: ", type);
> +
> +	for (i = 0; i < count; ++i) {
> +		unsigned int len = strlen(values[i].name);
> +
> +		if (chars + len >= 80) {
> +			printf(",\n\t");
> +			chars = 8;
> +			first = true;
> +		}
> +
> +		if (first)
> +			first = false;
> +		else
> +			chars += printf(", ");
> +
> +		chars += printf("%s", values[i].name);
> +	}
> +
> +	printf("\n");
> +}
> +
> +#define key_value_get(values, name) \
> +	__key_value_get(values, ARRAY_SIZE(values), name)
> +
> +#define key_value_list(values, type) \
> +	__key_value_list(values, ARRAY_SIZE(values), type)

Could you use this in getting the field values as well? It should probably
be a separate patch.

Speaking of which -- field values are case-insensitive. How about using
strcasecmp() for the keys as well?

Either way, for the set,

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> +
>  /* -----------------------------------------------------------------------------
>   * Format handling
>   */
> @@ -449,6 +506,73 @@ static const char *v4l2_field_name(enum v4l2_field field)
>  	return "unknown";
>  }
>  
> +static const struct key_value v4l2_colorspaces[] = {
> +	{ "DEFAULT", V4L2_COLORSPACE_DEFAULT },
> +	{ "SMPTE170M", V4L2_COLORSPACE_SMPTE170M },
> +	{ "SMPTE240M", V4L2_COLORSPACE_SMPTE240M },
> +	{ "REC709", V4L2_COLORSPACE_REC709 },
> +	{ "BT878", V4L2_COLORSPACE_BT878 },
> +	{ "470_SYSTEM_M", V4L2_COLORSPACE_470_SYSTEM_M },
> +	{ "470_SYSTEM_BG", V4L2_COLORSPACE_470_SYSTEM_BG },
> +	{ "JPEG", V4L2_COLORSPACE_JPEG },
> +	{ "SRGB", V4L2_COLORSPACE_SRGB },
> +	{ "OPRGB", V4L2_COLORSPACE_OPRGB },
> +	{ "BT2020", V4L2_COLORSPACE_BT2020 },
> +	{ "RAW", V4L2_COLORSPACE_RAW },
> +	{ "DCI_P3", V4L2_COLORSPACE_DCI_P3 },
> +};
> +
> +static const struct key_value v4l2_xfer_funcs[] = {
> +	{ "DEFAULT", V4L2_COLORSPACE_DEFAULT },
> +	{ "709", V4L2_XFER_FUNC_709 },
> +	{ "SRGB", V4L2_XFER_FUNC_SRGB },
> +	{ "OPRGB", V4L2_XFER_FUNC_OPRGB },
> +	{ "SMPTE240M", V4L2_XFER_FUNC_SMPTE240M },
> +	{ "NONE", V4L2_XFER_FUNC_NONE },
> +	{ "DCI_P3", V4L2_XFER_FUNC_DCI_P3 },
> +	{ "SMPTE2084", V4L2_XFER_FUNC_SMPTE2084 },
> +};
> +
> +static const struct key_value v4l2_encodings[] = {
> +	/* enum v4l2_ycbcr_encoding */
> +	{ "DEFAULT", V4L2_YCBCR_ENC_DEFAULT },
> +	{ "601", V4L2_YCBCR_ENC_601 },
> +	{ "709", V4L2_YCBCR_ENC_709 },
> +	{ "XV601", V4L2_YCBCR_ENC_XV601 },
> +	{ "XV709", V4L2_YCBCR_ENC_XV709 },
> +	{ "SYCC", V4L2_YCBCR_ENC_SYCC },
> +	{ "BT2020", V4L2_YCBCR_ENC_BT2020 },
> +	{ "BT2020_CONST_LUM", V4L2_YCBCR_ENC_BT2020_CONST_LUM },
> +	{ "SMPTE240M", V4L2_YCBCR_ENC_SMPTE240M },
> +	/* enum v4l2_hsv_encoding */
> +	{ "HSV180", V4L2_HSV_ENC_180 },
> +	{ "HSV256", V4L2_HSV_ENC_256 },
> +};
> +
> +static const struct key_value v4l2_quantizations[] = {
> +	{ "DEFAULT", V4L2_QUANTIZATION_DEFAULT },
> +	{ "FULL_RANGE", V4L2_QUANTIZATION_FULL_RANGE },
> +	{ "LIM_RANGE", V4L2_QUANTIZATION_LIM_RANGE },
> +};
> +
> +#define v4l2_colorspace_from_string(name) \
> +	key_value_get(v4l2_colorspaces, name)
> +#define v4l2_xfer_func_from_string(name) \
> +	key_value_get(v4l2_xfer_funcs, name)
> +#define v4l2_encoding_from_string(name) \
> +	key_value_get(v4l2_encodings, name)
> +#define v4l2_quantization_from_string(name) \
> +	key_value_get(v4l2_quantizations, name)
> +
> +#define list_colorspaces() \
> +	key_value_list(v4l2_colorspaces, "colorspace")
> +#define list_xfer_funcs() \
> +	key_value_list(v4l2_xfer_funcs, "xfer-func")
> +#define list_encodings() \
> +	key_value_list(v4l2_encodings, "encoding")
> +#define list_quantizations() \
> +	key_value_list(v4l2_quantizations, "quantization")
> +
>  /* -----------------------------------------------------------------------------
>   *
>   */
> @@ -797,6 +921,10 @@ static int video_get_format(struct device *dev)
>  static int video_set_format(struct device *dev, unsigned int w, unsigned int h,
>  			    unsigned int format, unsigned int stride,
>  			    unsigned int buffer_size, enum v4l2_field field,
> +			    enum v4l2_colorspace colorspace,
> +			    enum v4l2_xfer_func xfer_func,
> +			    enum v4l2_ycbcr_encoding encoding,
> +			    enum v4l2_quantization quantization,
>  			    unsigned int flags)
>  {
>  	struct v4l2_format fmt;
> @@ -814,7 +942,11 @@ static int video_set_format(struct device *dev, unsigned int w, unsigned int h,
>  		fmt.fmt.pix_mp.pixelformat = format;
>  		fmt.fmt.pix_mp.field = field;
>  		fmt.fmt.pix_mp.num_planes = info->n_planes;
> +		fmt.fmt.pix_mp.colorspace = colorspace;
>  		fmt.fmt.pix_mp.flags = flags;
> +		fmt.fmt.pix_mp.ycbcr_enc = encoding;
> +		fmt.fmt.pix_mp.quantization = quantization;
> +		fmt.fmt.pix_mp.xfer_func = xfer_func;
>  
>  		for (i = 0; i < fmt.fmt.pix_mp.num_planes; i++) {
>  			fmt.fmt.pix_mp.plane_fmt[i].bytesperline = stride;
> @@ -830,8 +962,12 @@ static int video_set_format(struct device *dev, unsigned int w, unsigned int h,
>  		fmt.fmt.pix.field = field;
>  		fmt.fmt.pix.bytesperline = stride;
>  		fmt.fmt.pix.sizeimage = buffer_size;
> +		fmt.fmt.pix.colorspace = colorspace;
>  		fmt.fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
>  		fmt.fmt.pix.flags = flags;
> +		fmt.fmt.pix.ycbcr_enc = encoding;
> +		fmt.fmt.pix.quantization = quantization;
> +		fmt.fmt.pix.xfer_func = xfer_func;
>  	}
>  
>  	ret = ioctl(dev->fd, VIDIOC_S_FMT, &fmt);
> @@ -2298,6 +2434,8 @@ static void usage(const char *argv0)
>  	printf("    --buffer-size		Buffer size in bytes\n");
>  	printf("    --enum-formats		Enumerate formats\n");
>  	printf("    --enum-inputs		Enumerate inputs\n");
> +	printf("    --colorspace colorspace	Set the colorspace\n");
> +	printf("    --encoding encoding		Set the YCbCr encoding\n");
>  	printf("    --fd                        Use a numeric file descriptor insted of a device\n");
>  	printf("    --field field		Set the format field order\n");
>  	printf("\tValid values for field are none, top, bottom, interlaced, seq-tb, seq-bt,\n");
> @@ -2306,6 +2444,7 @@ static void usage(const char *argv0)
>  	printf("    --no-query			Don't query capabilities on open\n");
>  	printf("    --offset			User pointer buffer offset from page start\n");
>  	printf("    --premultiplied		Color components are premultiplied by alpha value\n");
> +	printf("    --quantization quantization	Set the quantization\n");
>  	printf("    --queue-late		Queue buffers after streamon, not before\n");
>  	printf("    --requeue-last		Requeue the last buffers before streamoff\n");
>  	printf("    --reset-controls		Reset all available controls to their default value\n");
> @@ -2313,6 +2452,13 @@ static void usage(const char *argv0)
>  	printf("    --skip n			Skip the first n frames\n");
>  	printf("    --sleep-forever		Sleep forever after configuring the device\n");
>  	printf("    --stride value		Line stride in bytes\n");
> +	printf("    --xfer-func xfer-func	Set the transfer function\n");
> +
> +	printf("\nValid fields values:\n");
> +	list_colorspaces();
> +	list_encodings();
> +	list_quantizations();
> +	list_xfer_funcs();
>  }
>  
>  #define OPT_ENUM_FORMATS	256
> @@ -2332,14 +2478,20 @@ static void usage(const char *argv0)
>  #define OPT_QUEUE_LATE		270
>  #define OPT_DATA_PREFIX		271
>  #define OPT_RESET_CONTROLS	272
> +#define OPT_COLORSPACE		273
> +#define OPT_XFER_FUNC		274
> +#define OPT_ENCODING		275
> +#define OPT_QUANTIZATION	276
>  
>  static const struct option opts[] = {
>  	{"buffer-size", 1, 0, OPT_BUFFER_SIZE},
>  	{"buffer-type", 1, 0, 'B'},
>  	{"capture", 2, 0, 'c'},
>  	{"check-overrun", 0, 0, 'C'},
> +	{"colorspace", 1, 0, OPT_COLORSPACE},
>  	{"data-prefix", 0, 0, OPT_DATA_PREFIX},
>  	{"delay", 1, 0, 'd'},
> +	{"encoding", 1, 0, OPT_ENCODING},
>  	{"enum-formats", 0, 0, OPT_ENUM_FORMATS},
>  	{"enum-inputs", 0, 0, OPT_ENUM_INPUTS},
>  	{"fd", 1, 0, OPT_FD},
> @@ -2357,6 +2509,7 @@ static const struct option opts[] = {
>  	{"pause", 2, 0, 'p'},
>  	{"premultiplied", 0, 0, OPT_PREMULTIPLIED},
>  	{"quality", 1, 0, 'q'},
> +	{"quantization", 1, 0, OPT_QUANTIZATION},
>  	{"queue-late", 0, 0, OPT_QUEUE_LATE},
>  	{"get-control", 1, 0, 'r'},
>  	{"requeue-last", 0, 0, OPT_REQUEUE_LAST},
> @@ -2370,6 +2523,7 @@ static const struct option opts[] = {
>  	{"time-per-frame", 1, 0, 't'},
>  	{"timestamp-source", 1, 0, OPT_TSTAMP_SRC},
>  	{"userptr", 0, 0, 'u'},
> +	{"xfer-func", 1, 0, OPT_XFER_FUNC},
>  	{0, 0, 0, 0}
>  };
>  
> @@ -2392,6 +2546,7 @@ int main(int argc, char *argv[])
>  	int do_sleep_forever = 0, do_requeue_last = 0;
>  	int do_rt = 0, do_log_status = 0;
>  	int no_query = 0, do_queue_late = 0;
> +	int do_csc = 0;
>  	char *endptr;
>  	int c;
>  
> @@ -2415,6 +2570,10 @@ int main(int argc, char *argv[])
>  	unsigned int pause_count = (unsigned int)-1;
>  	struct v4l2_fract time_per_frame = {1, 25};
>  	enum v4l2_field field = V4L2_FIELD_ANY;
> +	enum v4l2_colorspace colorspace = V4L2_COLORSPACE_DEFAULT;
> +	enum v4l2_xfer_func xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +	enum v4l2_ycbcr_encoding encoding = V4L2_YCBCR_ENC_DEFAULT;
> +	enum v4l2_quantization quantization = V4L2_QUANTIZATION_DEFAULT;
>  
>  	/* Capture loop */
>  	enum buffer_fill_mode fill_mode = BUFFER_FILL_NONE;
> @@ -2547,6 +2706,27 @@ int main(int argc, char *argv[])
>  		case OPT_BUFFER_SIZE:
>  			buffer_size = atoi(optarg);
>  			break;
> +		case OPT_COLORSPACE:
> +			ret = v4l2_colorspace_from_string(optarg);
> +			if (ret < 0) {
> +				printf("Invalid colorspace value '%s'\n", optarg);
> +				return 1;
> +			}
> +			colorspace = ret;
> +			do_csc = 1;
> +			break;
> +		case OPT_DATA_PREFIX:
> +			dev.write_data_prefix = true;
> +			break;
> +		case OPT_ENCODING:
> +			ret = v4l2_encoding_from_string(optarg);
> +			if (ret < 0) {
> +				printf("Invalid encoding value '%s'\n", optarg);
> +				return 1;
> +			}
> +			encoding = ret;
> +			do_csc = 1;
> +			break;
>  		case OPT_ENUM_FORMATS:
>  			do_enum_formats = 1;
>  			break;
> @@ -2578,6 +2758,15 @@ int main(int argc, char *argv[])
>  		case OPT_PREMULTIPLIED:
>  			fmt_flags |= V4L2_PIX_FMT_FLAG_PREMUL_ALPHA;
>  			break;
> +		case OPT_QUANTIZATION:
> +			ret = v4l2_quantization_from_string(optarg);
> +			if (ret < 0) {
> +				printf("Invalid quantization value '%s'\n", optarg);
> +				return 1;
> +			}
> +			quantization = ret;
> +			do_csc = 1;
> +			break;
>  		case OPT_QUEUE_LATE:
>  			do_queue_late = 1;
>  			break;
> @@ -2609,8 +2798,14 @@ int main(int argc, char *argv[])
>  		case OPT_USERPTR_OFFSET:
>  			userptr_offset = atoi(optarg);
>  			break;
> -		case OPT_DATA_PREFIX:
> -			dev.write_data_prefix = true;
> +		case OPT_XFER_FUNC:
> +			ret = v4l2_xfer_func_from_string(optarg);
> +			if (ret < 0) {
> +				printf("Invalid xfer-func value '%s'\n", optarg);
> +				return 1;
> +			}
> +			xfer_func = ret;
> +			do_csc = 1;
>  			break;
>  		default:
>  			printf("Invalid option -%c\n", c);
> @@ -2702,8 +2897,12 @@ int main(int argc, char *argv[])
>  
>  	/* Set the video format. */
>  	if (do_set_format) {
> +		if (do_csc && video_is_capture(&dev))
> +			fmt_flags |= V4L2_PIX_FMT_FLAG_SET_CSC;
> +
>  		if (video_set_format(&dev, width, height, pixelformat, stride,
> -				     buffer_size, field, fmt_flags) < 0) {
> +				     buffer_size, field, colorspace, xfer_func,
> +				     encoding, quantization, fmt_flags) < 0) {
>  			video_close(&dev);
>  			return 1;
>  		}

-- 
Kind regards,

Sakari Ailus

