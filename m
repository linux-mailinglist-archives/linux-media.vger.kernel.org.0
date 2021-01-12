Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714002F337F
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 16:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbhALPB3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 12 Jan 2021 10:01:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbhALPB3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 10:01:29 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C23CC061786
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 07:00:48 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kzL9v-0002GT-Oc; Tue, 12 Jan 2021 16:00:35 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kzL9v-0008HM-37; Tue, 12 Jan 2021 16:00:35 +0100
Message-ID: <75f50b369348cea460863905ff905cfd9be6b239.camel@pengutronix.de>
Subject: Re: [PATCH v7 9/9] media: imx-jpeg: Use v4l2 jpeg helpers in
 mxc-jpeg
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Mirela Rabulea <mirela.rabulea@oss.nxp.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com
Date:   Tue, 12 Jan 2021 16:00:34 +0100
In-Reply-To: <20210111192822.12178-10-mirela.rabulea@oss.nxp.com>
References: <20210111192822.12178-1-mirela.rabulea@oss.nxp.com>
         <20210111192822.12178-10-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-01-11 at 21:28 +0200, Mirela Rabulea wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> Use v4l2_jpeg_parse_header in mxc_jpeg_parse, remove the old
> parsing way, which was duplicated in other jpeg drivers.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  drivers/media/platform/imx-jpeg/Kconfig    |   1 +
>  drivers/media/platform/imx-jpeg/mxc-jpeg.c | 267 ++++++---------------
>  drivers/media/platform/imx-jpeg/mxc-jpeg.h |  26 +-
>  3 files changed, 80 insertions(+), 214 deletions(-)
> 
> diff --git a/drivers/media/platform/imx-jpeg/Kconfig b/drivers/media/platform/imx-jpeg/Kconfig
> index 7cc89e5eff90..d875f7c88cda 100644
> --- a/drivers/media/platform/imx-jpeg/Kconfig
> +++ b/drivers/media/platform/imx-jpeg/Kconfig
> @@ -4,6 +4,7 @@ config VIDEO_IMX8_JPEG
>  	depends on VIDEO_DEV && VIDEO_V4L2
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_MEM2MEM_DEV
> +	select V4L2_JPEG_HELPER
>  	default m
>  	help
>  	  This is a video4linux2 driver for the i.MX8 QXP/QM integrated
> diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
> index 9f1052779c58..b19fc98c1ce3 100644
> --- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
> @@ -52,6 +52,7 @@
>  #include <linux/pm_domain.h>
>  #include <linux/string.h>
>  
> +#include <media/v4l2-jpeg.h>
>  #include <media/v4l2-mem2mem.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-common.h>
> @@ -65,12 +66,16 @@ static struct mxc_jpeg_fmt mxc_formats[] = {
>  	{
>  		.name		= "JPEG",
>  		.fourcc		= V4L2_PIX_FMT_JPEG,
> +		.subsampling	= -1,
> +		.nc		= -1,
>  		.colplanes	= 1,
>  		.flags		= MXC_JPEG_FMT_TYPE_ENC,
>  	},
>  	{
>  		.name		= "RGB", /*RGBRGB packed format*/
>  		.fourcc		= V4L2_PIX_FMT_RGB24,
> +		.subsampling	= V4L2_JPEG_CHROMA_SUBSAMPLING_444,
> +		.nc		= 3,
>  		.depth		= 24,
>  		.colplanes	= 1,
>  		.h_align	= 3,
> @@ -80,6 +85,8 @@ static struct mxc_jpeg_fmt mxc_formats[] = {
>  	{
>  		.name		= "ARGB", /* ARGBARGB packed format */
>  		.fourcc		= V4L2_PIX_FMT_ARGB32,
> +		.subsampling	= V4L2_JPEG_CHROMA_SUBSAMPLING_444,
> +		.nc		= 4,
>  		.depth		= 32,
>  		.colplanes	= 1,
>  		.h_align	= 3,
> @@ -89,6 +96,8 @@ static struct mxc_jpeg_fmt mxc_formats[] = {
>  	{
>  		.name		= "YUV420", /* 1st plane = Y, 2nd plane = UV */
>  		.fourcc		= V4L2_PIX_FMT_NV12,
> +		.subsampling	= V4L2_JPEG_CHROMA_SUBSAMPLING_420,
> +		.nc		= 3,
>  		.depth		= 12, /* 6 bytes (4Y + UV) for 4 pixels */
>  		.colplanes	= 2, /* 1 plane Y, 1 plane UV interleaved */
>  		.h_align	= 4,
> @@ -98,6 +107,8 @@ static struct mxc_jpeg_fmt mxc_formats[] = {
>  	{
>  		.name		= "YUV422", /* YUYV */
>  		.fourcc		= V4L2_PIX_FMT_YUYV,
> +		.subsampling	= V4L2_JPEG_CHROMA_SUBSAMPLING_422,
> +		.nc		= 3,
>  		.depth		= 16,
>  		.colplanes	= 1,
>  		.h_align	= 4,
> @@ -107,6 +118,8 @@ static struct mxc_jpeg_fmt mxc_formats[] = {
>  	{
>  		.name		= "YUV444", /* YUVYUV */
>  		.fourcc		= V4L2_PIX_FMT_YUV24,
> +		.subsampling	= V4L2_JPEG_CHROMA_SUBSAMPLING_444,
> +		.nc		= 3,
>  		.depth		= 24,
>  		.colplanes	= 1,
>  		.h_align	= 3,
> @@ -116,6 +129,8 @@ static struct mxc_jpeg_fmt mxc_formats[] = {
>  	{
>  		.name		= "Gray", /* Gray (Y8/Y12) or Single Comp */
>  		.fourcc		= V4L2_PIX_FMT_GREY,
> +		.subsampling	= V4L2_JPEG_CHROMA_SUBSAMPLING_GRAY,
> +		.nc		= 1,
>  		.depth		= 8,
>  		.colplanes	= 1,
>  		.h_align	= 3,
> @@ -384,33 +399,6 @@ static enum mxc_jpeg_image_format mxc_jpeg_fourcc_to_imgfmt(u32 fourcc)
>  	}
>  }
>  
> -static int mxc_jpeg_imgfmt_to_fourcc(enum mxc_jpeg_image_format imgfmt,
> -				     u32 *fourcc)
> -{
> -	switch (imgfmt) {
> -	case MXC_JPEG_GRAY:
> -		*fourcc = V4L2_PIX_FMT_GREY;
> -		return 0;
> -	case MXC_JPEG_YUV422:
> -		*fourcc = V4L2_PIX_FMT_YUYV;
> -		return 0;
> -	case MXC_JPEG_YUV420:
> -		*fourcc =  V4L2_PIX_FMT_NV12;
> -		return 0;
> -	case MXC_JPEG_YUV444:
> -		*fourcc =  V4L2_PIX_FMT_YUV24;
> -		return 0;
> -	case MXC_JPEG_RGB:
> -		*fourcc =  V4L2_PIX_FMT_RGB24;
> -		return 0;
> -	case MXC_JPEG_ARGB:
> -		*fourcc =  V4L2_PIX_FMT_ARGB32;
> -		return 0;
> -	default:
> -		return 1;
> -	}
> -}
> -
>  static struct mxc_jpeg_q_data *mxc_jpeg_get_q_data(struct mxc_jpeg_ctx *ctx,
>  						   enum v4l2_buf_type type)
>  {
> @@ -1130,45 +1118,6 @@ static void mxc_jpeg_stop_streaming(struct vb2_queue *q)
>  	release_active_buffers(q, VB2_BUF_STATE_ERROR);
>  }
>  
> -struct mxc_jpeg_stream {
> -	u8 *addr;
> -	u32 loc;
> -	u32 end;
> -};
> -
> -static int get_byte(struct mxc_jpeg_stream *stream)
> -{
> -	int ret;
> -
> -	if (stream->loc >= stream->end)
> -		return -1;
> -	ret = stream->addr[stream->loc];
> -	stream->loc++;
> -	return ret;
> -}
> -
> -static int get_sof(struct device *dev,
> -		   struct mxc_jpeg_stream *stream,
> -		   struct mxc_jpeg_sof *sof)
> -{
> -	int i;
> -
> -	if (stream->loc + sizeof(struct mxc_jpeg_sof) >= stream->end)
> -		return -1;
> -	memcpy(sof, &stream->addr[stream->loc], sizeof(struct mxc_jpeg_sof));
> -	_bswap16(&sof->length);
> -	_bswap16(&sof->height);
> -	_bswap16(&sof->width);
> -	dev_dbg(dev, "JPEG SOF: precision=%d\n", sof->precision);
> -	dev_dbg(dev, "JPEG SOF: height=%d, width=%d\n",
> -		sof->height, sof->width);
> -	for (i = 0; i < sof->components_no; i++) {
> -		dev_dbg(dev, "JPEG SOF: comp_id=%d, H=0x%x, V=0x%x\n",
> -			sof->comp[i].id, sof->comp[i].v, sof->comp[i].h);
> -	}
> -	return 0;
> -}
> -
>  static int mxc_jpeg_valid_comp_id(struct device *dev,
>  				  struct mxc_jpeg_sof *sof,
>  				  struct mxc_jpeg_sos *sos)
> @@ -1198,45 +1147,18 @@ static int mxc_jpeg_valid_comp_id(struct device *dev,
>  	return valid;
>  }
>  
> -static enum mxc_jpeg_image_format
> -mxc_jpeg_get_image_format(struct device *dev, const struct mxc_jpeg_sof *sof)
> +static u32 mxc_jpeg_get_image_format(struct device *dev,
> +				     const struct v4l2_jpeg_header header)
>  {
> -	if (sof->components_no == 1) {
> -		dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_GRAY\n");
> -		return MXC_JPEG_GRAY;
> -	}
> -	if (sof->components_no == 3) {
> -		if (sof->comp[0].h == 2 && sof->comp[0].v == 2 &&
> -		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
> -		    sof->comp[2].h == 1 && sof->comp[2].v == 1){
> -			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_YUV420\n");
> -			return MXC_JPEG_YUV420;
> -		}
> -		if (sof->comp[0].h == 2 && sof->comp[0].v == 1 &&
> -		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
> -		    sof->comp[2].h == 1 && sof->comp[2].v == 1){
> -			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_YUV422\n");
> -			return MXC_JPEG_YUV422;
> -		}
> -		if (sof->comp[0].h == 1 && sof->comp[0].v == 1 &&
> -		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
> -		    sof->comp[2].h == 1 && sof->comp[2].v == 1){
> -			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_YUV444\n");
> -			return MXC_JPEG_YUV444;
> -		}
> -	}
> -	if (sof->components_no == 4) {
> -		if (sof->comp[0].h == 1 && sof->comp[0].v == 1 &&
> -		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
> -		    sof->comp[2].h == 1 && sof->comp[2].v == 1 &&
> -		    sof->comp[3].h == 1 && sof->comp[3].v == 1){
> -			/* this is not tested */
> -			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_ARGB\n");
> -			return MXC_JPEG_ARGB;
> -		}
> -	}
> +	int i;
> +
> +	for (i = 0; i < MXC_JPEG_NUM_FORMATS; i++)
> +		if (mxc_formats[i].subsampling == header.frame.subsampling &&
> +		    mxc_formats[i].nc == header.frame.num_components)
> +			return mxc_formats[i].fourcc;

If the JPEG is 4:4:4, 3 components, this function always returns
V4L2_PIX_FMT_RGB24, which comes before V4L2_PIX_FMT_YUV24 in the list.
I think it would be better to move the app14_tf fixup in here and let
this function return the correct format.

 		.fourcc		= V4L2_PIX_FMT_RGB24,
> +		.subsampling	= V4L2_JPEG_CHROMA_SUBSAMPLING_444,
> +		.nc		= 3,

> +
>  	dev_err(dev, "Could not identify image format\n");

Printing subsampling and number of components might be helpful here.

> -	return MXC_JPEG_INVALID;
> +	return 0;
>  }
>  
>  static void mxc_jpeg_bytesperline(struct mxc_jpeg_q_data *q,
> @@ -1290,122 +1212,69 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
>  	struct device *dev = ctx->mxc_jpeg->dev;
>  	struct mxc_jpeg_q_data *q_data_out, *q_data_cap;
>  	enum v4l2_buf_type cap_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> -	struct mxc_jpeg_stream stream;
> -	bool notfound = true;
> -	bool app14 = false;
>  	bool src_chg = false;
> -	u8 app14_transform = 0;
> -	struct mxc_jpeg_sof sof, *psof = NULL;
> -	struct mxc_jpeg_sos *psos = NULL;
> -	int byte;
> -	u8 *next = NULL;
> -	enum mxc_jpeg_image_format img_fmt;
>  	u32 fourcc;
> +	struct v4l2_jpeg_header header;
> +	struct mxc_jpeg_sof *psof = NULL;
> +	struct mxc_jpeg_sos *psos = NULL;
> +	int ret;
>  
> -	memset(&sof, 0, sizeof(struct mxc_jpeg_sof));
> -	stream.addr = src_addr;
> -	stream.end = size;
> -	stream.loc = 0;
> -	*dht_needed = true;
> +	memset(&header, 0, sizeof(header));
> +	ret = v4l2_jpeg_parse_header((void *)src_addr, size, &header);
> +	if (ret < 0) {
> +		dev_err(dev, "Error parsing JPEG stream markers\n");
> +		return ret;
> +	}
>  
> -	/* check stream starts with SOI */
> -	byte = get_byte(&stream);
> -	if (byte == -1 || byte != 0xFF)
> -		return -EINVAL;
> -	byte = get_byte(&stream);
> -	if (byte == -1 || byte != 0xD8)
> -		return -EINVAL;
> +	/* if DHT marker present, no need to inject default one */
> +	*dht_needed = (header.num_dht == 0);
>  
> -	while (notfound) {
> -		byte = get_byte(&stream);
> -		if (byte == -1)
> -			return -EINVAL;
> -		if (byte != 0xff)
> -			continue;
> -		do {
> -			byte = get_byte(&stream);
> -		} while (byte == 0xff);
> -		if (byte == -1)
> -			return false;
> -		if (byte == 0)
> -			continue;
> -		switch (byte) {
> -		case DHT:
> -			/* DHT marker present, no need to inject default one */
> -			*dht_needed = false;
> -			break;
> -		case SOF2: /* Progressive DCF frame definition */
> -			dev_err(dev,
> -				"Progressive JPEG not supported by hardware");
> -			return -EINVAL;
> -		case SOF1: /* Extended sequential DCF frame definition */
> -		case SOF0: /* Baseline sequential DCF frame definition */
> -			if (get_sof(dev, &stream, &sof) == -1)
> -				break;
> -			next = stream.addr + stream.loc;
> -			psof = (struct mxc_jpeg_sof *)next;
> -			break;
> -		case SOS:
> -			next = stream.addr + stream.loc;
> -			psos = (struct mxc_jpeg_sos *)next;
> -			notfound = false;
> -			break;
> -		case APP14:
> -			app14 = true;
> -			/*
> -			 * Application Data Syntax is:
> -			 * 2 bytes(APPn:0xFF,0xEE), 2 bytes(Lp), Ap1...ApLp-2
> -			 * The transform flag is in Ap12
> -			 * stream.loc is now on APPn-0xEE byte
> -			 */
> -			app14_transform = *(stream.addr + stream.loc + 12 + 1);
> -			break;
> -		default:
> -			notfound = true;
> -		}
> -	}
>  	q_data_out = mxc_jpeg_get_q_data(ctx,
>  					 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>  	if (q_data_out->w == 0 && q_data_out->h == 0) {
>  		dev_warn(dev, "Invalid user resolution 0x0");
>  		dev_warn(dev, "Keeping resolution from JPEG: %dx%d",
> -			 sof.width, sof.height);
> -		 q_data_out->w = sof.width;
> -		 q_data_out->h = sof.height;
> -	} else if (sof.width != q_data_out->w || sof.height != q_data_out->h) {
> +			 header.frame.width, header.frame.height);
> +		 q_data_out->w = header.frame.width;
> +		 q_data_out->h = header.frame.height;
> +	} else if (header.frame.width != q_data_out->w ||
> +		   header.frame.height != q_data_out->h) {
>  		dev_err(dev,
>  			"Resolution mismatch: %dx%d (JPEG) versus %dx%d(user)",
> -			sof.width, sof.height, q_data_out->w, q_data_out->h);
> +			header.frame.width, header.frame.height,
> +			q_data_out->w, q_data_out->h);
>  		return -EINVAL;
>  	}
> -	if (sof.width % 8 != 0 || sof.height % 8 != 0) {
> +	if (header.frame.width % 8 != 0 || header.frame.height % 8 != 0) {
>  		dev_err(dev, "JPEG width or height not multiple of 8: %dx%d\n",
> -			sof.width, sof.height);
> +			header.frame.width, header.frame.height);
>  		return -EINVAL;
>  	}
> -	if (sof.width > MXC_JPEG_MAX_WIDTH ||
> -	    sof.height > MXC_JPEG_MAX_HEIGHT) {
> +	if (header.frame.width > MXC_JPEG_MAX_WIDTH ||
> +	    header.frame.height > MXC_JPEG_MAX_HEIGHT) {
>  		dev_err(dev, "JPEG width or height should be <= 8192: %dx%d\n",
> -			sof.width, sof.height);
> +			header.frame.width, header.frame.height);
>  		return -EINVAL;
>  	}
> -	if (sof.width < MXC_JPEG_MIN_WIDTH ||
> -	    sof.height < MXC_JPEG_MIN_HEIGHT) {
> +	if (header.frame.width < MXC_JPEG_MIN_WIDTH ||
> +	    header.frame.height < MXC_JPEG_MIN_HEIGHT) {
>  		dev_err(dev, "JPEG width or height should be > 64: %dx%d\n",
> -			sof.width, sof.height);
> +			header.frame.width, header.frame.height);
>  		return -EINVAL;
>  	}
> -	if (sof.components_no > MXC_JPEG_MAX_COMPONENTS) {
> +	if (header.frame.num_components > V4L2_JPEG_MAX_COMPONENTS) {
>  		dev_err(dev, "JPEG number of components should be <=%d",
> -			MXC_JPEG_MAX_COMPONENTS);
> +			V4L2_JPEG_MAX_COMPONENTS);
>  		return -EINVAL;
>  	}
>  	/* check and, if necessary, patch component IDs*/
> +	psof = (struct mxc_jpeg_sof *)header.sof.start;
> +	psos = (struct mxc_jpeg_sos *)header.sos.start;
>  	if (!mxc_jpeg_valid_comp_id(dev, psof, psos))
>  		dev_warn(dev, "JPEG component ids should be 0-3 or 1-4");
>  
> -	img_fmt = mxc_jpeg_get_image_format(dev, &sof);
> -	if (img_fmt == MXC_JPEG_INVALID)
> +	fourcc = mxc_jpeg_get_image_format(dev, header);
> +	if (fourcc == 0)
>  		return -EINVAL;
>  
>  	/*
> @@ -1413,12 +1282,11 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
>  	 * encoded with 3 components have RGB colorspace, see Recommendation
>  	 * ITU-T T.872 chapter 6.5.3 APP14 marker segment for colour encoding
>  	 */
> -	if (img_fmt == MXC_JPEG_YUV444 && app14 && app14_transform == 0)
> -		img_fmt = MXC_JPEG_RGB;
> -
> -	if (mxc_jpeg_imgfmt_to_fourcc(img_fmt, &fourcc)) {
> -		dev_err(dev, "Fourcc not found for %d", img_fmt);
> -		return -EINVAL;
> +	if (fourcc == V4L2_PIX_FMT_YUV24 || fourcc == V4L2_PIX_FMT_RGB24) {
> +		if (header.app14_tf == V4L2_JPEG_APP14_TF_CMYK_RGB)
> +			fourcc = V4L2_PIX_FMT_RGB24;
> +		else
> +			fourcc = V4L2_PIX_FMT_YUV24;
>  	}

See above, this fixup could be moved into mxc_jpeg_get_image_format().
With that,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
