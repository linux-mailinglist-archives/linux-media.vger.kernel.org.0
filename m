Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2129B20D9
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 15:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391606AbfIMN1K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 09:27:10 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:38242 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390650AbfIMN1J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 09:27:09 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DDR7Y9090656;
        Fri, 13 Sep 2019 08:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568381227;
        bh=BOT4+HTjzQxXq3OYIv0dSDS89qORhvStj/UKjz7Ij3E=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=lgOOlulzYuIrz65W47cZ1pwJFxhpecP4+6kb/VfsR2evESeC4jlwgpiiOeGjsxOoo
         z648ITvZuq6tVIHIuL+coHjcuJnv2e7+vn8YLkiNsATUj4LHX1DAH4FZc1WYo18ljY
         EjTbVlB6I40o8fYcQbwyYV3uF+EO3v4jn3f0/brc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DDR7K0037102
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Sep 2019 08:27:07 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 13
 Sep 2019 08:27:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 13 Sep 2019 08:27:07 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id x8DDR7cJ101515;
        Fri, 13 Sep 2019 08:27:07 -0500
Date:   Fri, 13 Sep 2019 08:29:12 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 07/13] media: am437x-vpfe: Use a per instance format
 array instead of a static one
Message-ID: <20190913132912.jbf3u32a2oshelyb@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-8-bparrot@ti.com>
 <d6aebae8-570a-284a-d336-f3a9670daa0b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d6aebae8-570a-284a-d336-f3a9670daa0b@xs4all.nl>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans Verkuil <hverkuil@xs4all.nl> wrote on Fri [2019-Sep-13 15:07:29 +0200]:
> On 9/9/19 6:27 PM, Benoit Parrot wrote:
> > Using a statically defined format array would cause issue when
> > multiple vpfe instance would be connected to sub-device of
> > different capabilities. We need to use an instance based array
> > instead to properly maintain a per port/instance format list.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/platform/am437x/am437x-vpfe.c | 108 ++++++++------------
> >  drivers/media/platform/am437x/am437x-vpfe.h |  34 ++++++
> >  2 files changed, 74 insertions(+), 68 deletions(-)
> > 
> > diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> > index ac759c066d00..e76dc2b3b7b8 100644
> > --- a/drivers/media/platform/am437x/am437x-vpfe.c
> > +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> > @@ -69,30 +69,6 @@ static const struct vpfe_standard vpfe_standards[] = {
> >  	{V4L2_STD_625_50, 720, 576, {54, 59}, 1},
> >  };
> >  
> > -struct bus_format {
> > -	unsigned int width;
> > -	unsigned int bpp;
> > -};
> > -
> > -/*
> > - * struct vpfe_fmt - VPFE media bus format information
> > - * @code: V4L2 media bus format code
> > - * @shifted: V4L2 media bus format code for the same pixel layout but
> > - *	shifted to be 8 bits per pixel. =0 if format is not shiftable.
> > - * @pixelformat: V4L2 pixel format FCC identifier
> > - * @width: Bits per pixel (when transferred over a bus)
> > - * @bpp: Bytes per pixel (when stored in memory)
> > - * @supported: Indicates format supported by subdev
> > - */
> > -struct vpfe_fmt {
> > -	u32 fourcc;
> > -	u32 code;
> > -	struct bus_format l;
> > -	struct bus_format s;
> > -	bool supported;
> > -	u32 index;
> > -};
> > -
> >  static struct vpfe_fmt formats[] = {
> >  	{
> >  		.fourcc		= V4L2_PIX_FMT_YUYV,
> > @@ -101,7 +77,6 @@ static struct vpfe_fmt formats[] = {
> >  		.l.bpp		= 4,
> >  		.s.width	= 8,
> >  		.s.bpp		= 2,
> > -		.supported	= false,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_UYVY,
> >  		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
> > @@ -109,7 +84,6 @@ static struct vpfe_fmt formats[] = {
> >  		.l.bpp		= 4,
> >  		.s.width	= 8,
> >  		.s.bpp		= 2,
> > -		.supported	= false,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_YVYU,
> >  		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
> > @@ -117,7 +91,6 @@ static struct vpfe_fmt formats[] = {
> >  		.l.bpp		= 4,
> >  		.s.width	= 8,
> >  		.s.bpp		= 2,
> > -		.supported	= false,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_VYUY,
> >  		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
> > @@ -125,7 +98,6 @@ static struct vpfe_fmt formats[] = {
> >  		.l.bpp		= 4,
> >  		.s.width	= 8,
> >  		.s.bpp		= 2,
> > -		.supported	= false,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_SBGGR8,
> >  		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
> > @@ -133,7 +105,6 @@ static struct vpfe_fmt formats[] = {
> >  		.l.bpp		= 2,
> >  		.s.width	= 8,
> >  		.s.bpp		= 1,
> > -		.supported	= false,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_SGBRG8,
> >  		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
> > @@ -141,7 +112,6 @@ static struct vpfe_fmt formats[] = {
> >  		.l.bpp		= 2,
> >  		.s.width	= 8,
> >  		.s.bpp		= 1,
> > -		.supported	= false,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_SGRBG8,
> >  		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
> > @@ -149,7 +119,6 @@ static struct vpfe_fmt formats[] = {
> >  		.l.bpp		= 2,
> >  		.s.width	= 8,
> >  		.s.bpp		= 1,
> > -		.supported	= false,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_SRGGB8,
> >  		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
> > @@ -157,7 +126,6 @@ static struct vpfe_fmt formats[] = {
> >  		.l.bpp		= 2,
> >  		.s.width	= 8,
> >  		.s.bpp		= 1,
> > -		.supported	= false,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_RGB565,
> >  		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
> > @@ -165,7 +133,6 @@ static struct vpfe_fmt formats[] = {
> >  		.l.bpp		= 4,
> >  		.s.width	= 8,
> >  		.s.bpp		= 2,
> > -		.supported	= false,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_RGB565X,
> >  		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
> > @@ -173,7 +140,6 @@ static struct vpfe_fmt formats[] = {
> >  		.l.bpp		= 4,
> >  		.s.width	= 8,
> >  		.s.bpp		= 2,
> > -		.supported	= false,
> >  	},
> >  };
> >  
> > @@ -181,13 +147,14 @@ static int
> >  __vpfe_get_format(struct vpfe_device *vpfe,
> >  		  struct v4l2_format *format, unsigned int *bpp);
> >  
> > -static struct vpfe_fmt *find_format_by_code(unsigned int code)
> > +static struct vpfe_fmt *find_format_by_code(struct vpfe_device *vpfe,
> > +					    unsigned int code)
> >  {
> >  	struct vpfe_fmt *fmt;
> >  	unsigned int k;
> >  
> > -	for (k = 0; k < ARRAY_SIZE(formats); k++) {
> > -		fmt = &formats[k];
> > +	for (k = 0; k < vpfe->num_active_fmt; k++) {
> > +		fmt = vpfe->active_fmt[k];
> >  		if (fmt->code == code)
> >  			return fmt;
> >  	}
> > @@ -195,13 +162,14 @@ static struct vpfe_fmt *find_format_by_code(unsigned int code)
> >  	return NULL;
> >  }
> >  
> > -static struct vpfe_fmt *find_format_by_pix(unsigned int pixelformat)
> > +static struct vpfe_fmt *find_format_by_pix(struct vpfe_device *vpfe,
> > +					   unsigned int pixelformat)
> >  {
> >  	struct vpfe_fmt *fmt;
> >  	unsigned int k;
> >  
> > -	for (k = 0; k < ARRAY_SIZE(formats); k++) {
> > -		fmt = &formats[k];
> > +	for (k = 0; k < vpfe->num_active_fmt; k++) {
> > +		fmt = vpfe->active_fmt[k];
> >  		if (fmt->fourcc == pixelformat)
> >  			return fmt;
> >  	}
> > @@ -218,7 +186,7 @@ mbus_to_pix(struct vpfe_device *vpfe,
> >  	unsigned int bus_width = sdinfo->vpfe_param.bus_width;
> >  	struct vpfe_fmt *fmt;
> >  
> > -	fmt = find_format_by_code(mbus->code);
> > +	fmt = find_format_by_code(vpfe, mbus->code);
> >  	if (WARN_ON(fmt == NULL)) {
> >  		pr_err("Invalid mbus code set\n");
> >  		*bpp = 1;
> > @@ -241,12 +209,12 @@ static void pix_to_mbus(struct vpfe_device *vpfe,
> >  {
> >  	struct vpfe_fmt *fmt;
> >  
> > -	fmt = find_format_by_pix(pix_fmt->pixelformat);
> > +	fmt = find_format_by_pix(vpfe, pix_fmt->pixelformat);
> >  	if (!fmt) {
> >  		/* default to first entry */
> >  		vpfe_dbg(3, vpfe, "Invalid pixel code: %x, default used instead\n",
> >  			pix_fmt->pixelformat);
> > -		fmt = &formats[0];
> > +		fmt = vpfe->active_fmt[0];
> >  	}
> >  
> >  	memset(mbus_fmt, 0, sizeof(*mbus_fmt));
> > @@ -1494,8 +1462,7 @@ static int vpfe_enum_fmt(struct file *file, void  *priv,
> >  {
> >  	struct vpfe_device *vpfe = video_drvdata(file);
> >  	struct vpfe_subdev_info *sdinfo;
> > -	struct vpfe_fmt *fmt = NULL;
> > -	unsigned int k;
> > +	struct vpfe_fmt *fmt;
> >  
> >  	vpfe_dbg(2, vpfe, "vpfe_enum_format index:%d\n",
> >  		f->index);
> > @@ -1504,17 +1471,10 @@ static int vpfe_enum_fmt(struct file *file, void  *priv,
> >  	if (!sdinfo->sd)
> >  		return -EINVAL;
> >  
> > -	if (f->index > ARRAY_SIZE(formats))
> > +	if (f->index >= vpfe->num_active_fmt)
> >  		return -EINVAL;
> >  
> > -	for (k = 0; k < ARRAY_SIZE(formats); k++) {
> > -		if (formats[k].index == f->index) {
> > -			fmt = &formats[k];
> > -			break;
> > -		}
> > -	}
> > -	if (!fmt)
> > -		return -EINVAL;
> > +	fmt = vpfe->active_fmt[f->index];
> >  
> >  	f->pixelformat = fmt->fourcc;
> >  
> > @@ -1593,7 +1553,7 @@ static int vpfe_enum_size(struct file *file, void  *priv,
> >  	vpfe_dbg(2, vpfe, "vpfe_enum_size\n");
> >  
> >  	/* check for valid format */
> > -	fmt = find_format_by_pix(fsize->pixel_format);
> > +	fmt = find_format_by_pix(vpfe, fsize->pixel_format);
> >  	if (!fmt) {
> >  		vpfe_dbg(3, vpfe, "Invalid pixel code: %x, default used instead\n",
> >  			fsize->pixel_format);
> > @@ -2281,8 +2241,10 @@ vpfe_async_bound(struct v4l2_async_notifier *notifier,
> >  					       struct vpfe_device, v4l2_dev);
> >  	struct v4l2_subdev_mbus_code_enum mbus_code;
> >  	struct vpfe_subdev_info *sdinfo;
> > +	struct vpfe_fmt *fmt;
> > +	int ret = 0;
> >  	bool found = false;
> > -	int i, j;
> > +	int i, j, k;
> >  
> >  	vpfe_dbg(1, vpfe, "vpfe_async_bound\n");
> >  
> > @@ -2304,27 +2266,37 @@ vpfe_async_bound(struct v4l2_async_notifier *notifier,
> >  
> >  	vpfe->video_dev.tvnorms |= sdinfo->inputs[0].std;
> >  
> > -	/* setup the supported formats & indexes */
> > -	for (j = 0, i = 0; ; ++j) {
> > -		struct vpfe_fmt *fmt;
> > -		int ret;
> > -
> > +	vpfe->num_active_fmt = 0;
> > +	for (j = 0, i = 0; (ret != -EINVAL); ++j) {
> >  		memset(&mbus_code, 0, sizeof(mbus_code));
> >  		mbus_code.index = j;
> >  		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> >  		ret = v4l2_subdev_call(subdev, pad, enum_mbus_code,
> > -			       NULL, &mbus_code);
> > +				       NULL, &mbus_code);
> >  		if (ret)
> > -			break;
> > -
> > -		fmt = find_format_by_code(mbus_code.code);
> > -		if (!fmt)
> >  			continue;
> >  
> > -		fmt->supported = true;
> > -		fmt->index = i++;
> > +		vpfe_dbg(3, vpfe,
> > +			 "subdev %s: code: %04x idx: %d\n",
> > +			 subdev->name, mbus_code.code, j);
> > +
> > +		for (k = 0; k < ARRAY_SIZE(formats); k++) {
> > +			fmt = &formats[k];
> > +			if (mbus_code.code != fmt->code)
> > +				continue;
> > +			vpfe->active_fmt[i] = fmt;
> > +			vpfe_dbg(3, vpfe,
> > +				 "matched fourcc: %4.4s code: %04x idx: %d\n",
> > +				 (char *)&fmt->fourcc, mbus_code.code, i);
> > +			vpfe->num_active_fmt = ++i;
> > +		}
> >  	}
> >  
> > +	if (!i) {
> > +		vpfe_err(vpfe, "No suitable format reported by subdev %s\n",
> > +			 subdev->name);
> > +		return -EINVAL;
> > +	}
> >  	return 0;
> >  }
> >  
> > diff --git a/drivers/media/platform/am437x/am437x-vpfe.h b/drivers/media/platform/am437x/am437x-vpfe.h
> > index 2dde09780215..6f25750f84e4 100644
> > --- a/drivers/media/platform/am437x/am437x-vpfe.h
> > +++ b/drivers/media/platform/am437x/am437x-vpfe.h
> > @@ -215,6 +215,37 @@ struct vpfe_ccdc {
> >  	u32 ccdc_ctx[VPFE_REG_END / sizeof(u32)];
> >  };
> >  
> > +/*
> > + * struct bus_format - VPFE bus format information
> > + * @width: Bits per pixel (when transferred over a bus)
> > + * @bpp: Bytes per pixel (when stored in memory)
> 
> Slightly confused: the '@' indicates docbook format, but the '/*'
> indicates a regular comment. Either choose '/**' or drop the @.

Yeah I think this driver pre-date all of that.

Now did you mean to fix just the above comments or all of the other ones
also.

Frankly, I do not have a clear idea either way.
I guess i'll just remove the '@' tag then.

> 
> > + */
> > +struct bus_format {
> > +	unsigned int width;
> > +	unsigned int bpp;
> > +};
> > +
> > +/*
> > + * struct vpfe_fmt - VPFE media bus format information
> > + * @fourcc: V4L2 pixel format code
> > + * @code: V4L2 media bus format code
> > + * @l: 10 bit bus format info
> > + * @s: 8 bit bus format info
> > + */
> > +struct vpfe_fmt {
> > +	u32 fourcc;
> > +	u32 code;
> > +	struct bus_format l;
> > +	struct bus_format s;
> > +};
> > +
> > +/*
> > + * This value needs to be at least as large as the number of entry in
> > + * formats[].
> > + * When formats[] is modified make sure to adjust this value also.
> > + */
> > +#define VPFE_MAX_ACTIVE_FMT	10
> 
> I recommend adding something like:
> 
> #if ARRAY_SIZE(formats) > VPFE_MAX_ACTIVE_FMT
> 	#error must update VPFE_MAX_ACTIVE_FMT
> #endif
> 
> to am437x-vpfe.c.
> 
> Or something along those lines. Don't rely on just the comment :-)

Ah yes very good.

> 
> Regards,
> 
> 	Hans
> 
> > +
> >  struct vpfe_device {
> >  	/* V4l2 specific parameters */
> >  	/* Identifies video device for this channel */
> > @@ -252,6 +283,9 @@ struct vpfe_device {
> >  	struct v4l2_format fmt;
> >  	/* Used to store current bytes per pixel based on current format */
> >  	unsigned int bpp;
> > +	struct vpfe_fmt	*active_fmt[VPFE_MAX_ACTIVE_FMT];
> > +	unsigned int num_active_fmt;
> > +
> >  	/*
> >  	 * used when IMP is chained to store the crop window which
> >  	 * is different from the image window
> > 
> 
