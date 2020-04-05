Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2D119ED12
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 19:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbgDERnr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 13:43:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58586 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgDERnr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 13:43:47 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E083312;
        Sun,  5 Apr 2020 19:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586108624;
        bh=N+gUJ4ICmSEyTpkb1uiRqkX9E+jcUOJ2XiuaS9JyYVo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XXbbHv2nPtVjGAyrTxVrwkdkzrM0tDVvzQpntpqO7u/AuhTmhMbYYLS4SPtTSEJy0
         sf8FhUeeRfC5ymtI8LHsYc9NrRy98L5tFgkh7csEEZTIvGXNwKr19aybTMEBBRIQX/
         RGgWlYemn3e1UPbD+CXdBem3J26Y+QMd91YXKWP0=
Date:   Sun, 5 Apr 2020 20:43:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH v6 04/11] media: imx: utils: Handle Bayer format lookup
 through a selection flag
Message-ID: <20200405174335.GK5846@pendragon.ideasonboard.com>
References: <20200404224130.23118-1-slongerbeam@gmail.com>
 <20200404224130.23118-5-slongerbeam@gmail.com>
 <20200405165309.GA5846@pendragon.ideasonboard.com>
 <8faf1603-076b-95ab-4168-f36bb82b6450@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8faf1603-076b-95ab-4168-f36bb82b6450@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Sun, Apr 05, 2020 at 10:30:09AM -0700, Steve Longerbeam wrote:
> On 4/5/20 9:53 AM, Laurent Pinchart wrote:
> > On Sat, Apr 04, 2020 at 03:41:23PM -0700, Steve Longerbeam wrote:
> >> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>
> >> The format lookup (and enumeration) functions take a boolean flag to
> >> tell if Bayer formats should be considered. This leads to hard to read
> >> lines such as
> >>
> >> 	return enum_format(fourcc, NULL, index, cs_sel, true, false);
> >>
> >> where the boolean parameters can easily be mixed. To make the code
> >> clearer, add a CS_SEL_BAYER flag that can be passed through the
> >> codespace_sel parameter of the lookup functions to replace the bool
> >> parameter.
> >>
> >> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>
> >> [Instead of declaring CS_SEL_ANY as a bitfield containing only
> >>   CS_SEL_YUV | CS_SEL_RGB, declare CS_SEL_ANY as all of the above
> >>   (YUV, RGB, BAYER). A new enum is declared for the YUV | RGB selection
> >>   as CS_SEL_YUV_RGB, and that is used by sub-devices that don't support
> >>   BAYER and only allow selecting and enumerating YUV or RGB encodings.
> >>   CS_SEL_ANY is now only used by the CSI sub-devices and the attached
> >>   capture interfaces, since only those devices support BAYER formats.]
> >> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> >> ---
> >>   drivers/staging/media/imx/imx-ic-prp.c        |  8 +--
> >>   drivers/staging/media/imx/imx-ic-prpencvf.c   |  9 +--
> >>   drivers/staging/media/imx/imx-media-capture.c | 14 ++--
> >>   .../staging/media/imx/imx-media-csc-scaler.c  |  2 +-
> >>   drivers/staging/media/imx/imx-media-csi.c     | 15 ++--
> >>   drivers/staging/media/imx/imx-media-utils.c   | 68 +++++++++----------
> >>   drivers/staging/media/imx/imx-media.h         | 16 ++---
> >>   drivers/staging/media/imx/imx7-media-csi.c    | 12 ++--
> >>   8 files changed, 70 insertions(+), 74 deletions(-)
> >>
> >> diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
> >> index 2a4f77e83ed3..9c1f723972e4 100644
> >> --- a/drivers/staging/media/imx/imx-ic-prp.c
> >> +++ b/drivers/staging/media/imx/imx-ic-prp.c
> >> @@ -107,7 +107,7 @@ static int prp_enum_mbus_code(struct v4l2_subdev *sd,
> >>   	switch (code->pad) {
> >>   	case PRP_SINK_PAD:
> >>   		ret = imx_media_enum_ipu_format(&code->code, code->index,
> >> -						CS_SEL_ANY);
> >> +						CS_SEL_YUV_RGB);
> >>   		break;
> >>   	case PRP_SRC_PAD_PRPENC:
> >>   	case PRP_SRC_PAD_PRPVF:
> >> @@ -180,10 +180,10 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
> >>   				      MIN_H, MAX_H, H_ALIGN, S_ALIGN);
> >>   
> >>   		cc = imx_media_find_ipu_format(sdformat->format.code,
> >> -					       CS_SEL_ANY);
> >> +					       CS_SEL_YUV_RGB);
> >>   		if (!cc) {
> >> -			imx_media_enum_ipu_format(&code, 0, CS_SEL_ANY);
> >> -			cc = imx_media_find_ipu_format(code, CS_SEL_ANY);
> >> +			imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV);
> >> +			cc = imx_media_find_ipu_format(code, CS_SEL_YUV);
> >
> > Should these two be CS_SEL_YUV_RGB ?
> 
> It could be, but this is selecting a default format if the requested 
> format isn't supported, so it just asks for the first enumerated 
> IPU-internal format (AYUV32) as a default.

I agree it won't change anything in practice, as the YUV format is first
in the table, but I think it expresses the intent better (retrieving the
first format, whatever it is). If you would like to code to retrieve the
first YUV format explicitly, I'm not opposed to that, but I think it
should be a separate patch (or at least explained in the commit
message).

> Which brings up an idea I've been considering to clean up these default 
> format selection paths a bit. A
> 
> const struct imx_media_pixfmt *
> imx_media_default_{pixel|mbus|ipu}_format(enum imx_pixfmt_sel fmt_sel)
> 
> would return a default YUV/RGB/BAYER format depending on fmt_sel.
> 
> >>   			sdformat->format.code = cc->codes[0];
> >>   		}
> >>   
> >> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
> >> index 09c4e3f33807..5a22cdc7378a 100644
> >> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> >> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
> >> @@ -850,7 +850,8 @@ static int prp_enum_mbus_code(struct v4l2_subdev *sd,
> >>   	if (code->pad >= PRPENCVF_NUM_PADS)
> >>   		return -EINVAL;
> >>   
> >> -	return imx_media_enum_ipu_format(&code->code, code->index, CS_SEL_ANY);
> >> +	return imx_media_enum_ipu_format(&code->code, code->index,
> >> +					 CS_SEL_YUV_RGB);
> >>   }
> >>   
> >>   static int prp_get_fmt(struct v4l2_subdev *sd,
> >> @@ -885,12 +886,12 @@ static void prp_try_fmt(struct prp_priv *priv,
> >>   {
> >>   	struct v4l2_mbus_framefmt *infmt;
> >>   
> >> -	*cc = imx_media_find_ipu_format(sdformat->format.code, CS_SEL_ANY);
> >> +	*cc = imx_media_find_ipu_format(sdformat->format.code, CS_SEL_YUV_RGB);
> >>   	if (!*cc) {
> >>   		u32 code;
> >>   
> >> -		imx_media_enum_ipu_format(&code, 0, CS_SEL_ANY);
> >> -		*cc = imx_media_find_ipu_format(code, CS_SEL_ANY);
> >> +		imx_media_enum_ipu_format(&code, 0, CS_SEL_YUV);
> >> +		*cc = imx_media_find_ipu_format(code, CS_SEL_YUV);
> >
> > And here too ?
> 
> Same as above.
> 
> >>   		sdformat->format.code = (*cc)->codes[0];
> >>   	}
> >>   
> >> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> >> index d37b776ff86d..d60b49ec4fa4 100644
> >> --- a/drivers/staging/media/imx/imx-media-capture.c
> >> +++ b/drivers/staging/media/imx/imx-media-capture.c
> >> @@ -91,7 +91,7 @@ static int capture_enum_framesizes(struct file *file, void *fh,
> >>   	};
> >>   	int ret;
> >>   
> >> -	cc = imx_media_find_format(fsize->pixel_format, CS_SEL_ANY, true);
> >> +	cc = imx_media_find_format(fsize->pixel_format, CS_SEL_ANY);
> >>   	if (!cc)
> >>   		return -EINVAL;
> >>   
> >> @@ -133,7 +133,7 @@ static int capture_enum_frameintervals(struct file *file, void *fh,
> >>   	};
> >>   	int ret;
> >>   
> >> -	cc = imx_media_find_format(fival->pixel_format, CS_SEL_ANY, true);
> >> +	cc = imx_media_find_format(fival->pixel_format, CS_SEL_ANY);
> >>   	if (!cc)
> >>   		return -EINVAL;
> >>   
> >> @@ -177,7 +177,7 @@ static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
> >>   			return ret;
> >>   	} else {
> >>   		cc_src = imx_media_find_mbus_format(fmt_src.format.code,
> >> -						    CS_SEL_ANY, true);
> >> +						    CS_SEL_ANY);
> >>   		if (WARN_ON(!cc_src))
> >>   			return -EINVAL;
> >>   
> >> @@ -217,14 +217,14 @@ static int __capture_try_fmt_vid_cap(struct capture_priv *priv,
> >>   			CS_SEL_YUV : CS_SEL_RGB;
> >>   		fourcc = f->fmt.pix.pixelformat;
> >>   
> >> -		cc = imx_media_find_format(fourcc, cs_sel, false);
> >> +		cc = imx_media_find_format(fourcc, cs_sel);
> >>   		if (!cc) {
> >>   			imx_media_enum_format(&fourcc, 0, cs_sel);
> >> -			cc = imx_media_find_format(fourcc, cs_sel, false);
> >> +			cc = imx_media_find_format(fourcc, cs_sel);
> >>   		}
> >>   	} else {
> >>   		cc_src = imx_media_find_mbus_format(fmt_src->format.code,
> >> -						    CS_SEL_ANY, true);
> >> +						    CS_SEL_ANY);
> >>   		if (WARN_ON(!cc_src))
> >>   			return -EINVAL;
> >>   
> >> @@ -790,7 +790,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
> >>   	vdev->compose.width = fmt_src.format.width;
> >>   	vdev->compose.height = fmt_src.format.height;
> >>   	vdev->cc = imx_media_find_format(vdev->fmt.fmt.pix.pixelformat,
> >> -					 CS_SEL_ANY, false);
> >> +					 CS_SEL_ANY);
> >
> > Should this be CS_SEL_YUV_RGB too ?
> 
> Not in this case. The capture interface could be attached to a CSI, 
> which supports bayer, so the CSI may have selected a bayer format when 
> it registered (see below re: imx_media_enum_mbus_format()), so bayer 
> needs to be included in the search.

It wasn't before though. I'm fine fixing this, but I think it should
then be split to a separate patch, the change is too hidden in the
refactoring.

> >>   
> >>   	v4l2_info(sd, "Registered %s as /dev/%s\n", vfd->name,
> >>   		  video_device_node_name(vfd));
> >> diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
> >> index 2cc77f6e84b6..3e1c88938e7d 100644
> >> --- a/drivers/staging/media/imx/imx-media-csc-scaler.c
> >> +++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
> >> @@ -164,7 +164,7 @@ static int ipu_csc_scaler_enum_fmt(struct file *file, void *fh,
> >>   	u32 fourcc;
> >>   	int ret;
> >>   
> >> -	ret = imx_media_enum_format(&fourcc, f->index, CS_SEL_ANY);
> >> +	ret = imx_media_enum_format(&fourcc, f->index, CS_SEL_YUV_RGB);
> >>   	if (ret)
> >>   		return ret;
> >>   
> >> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> >> index e76a6a85baa3..298294b95293 100644
> >> --- a/drivers/staging/media/imx/imx-media-csi.c
> >> +++ b/drivers/staging/media/imx/imx-media-csi.c
> >> @@ -1234,12 +1234,12 @@ static int csi_enum_mbus_code(struct v4l2_subdev *sd,
> >>   	mutex_lock(&priv->lock);
> >>   
> >>   	infmt = __csi_get_fmt(priv, cfg, CSI_SINK_PAD, code->which);
> >> -	incc = imx_media_find_mbus_format(infmt->code, CS_SEL_ANY, true);
> >> +	incc = imx_media_find_mbus_format(infmt->code, CS_SEL_ANY);
> >>   
> >>   	switch (code->pad) {
> >>   	case CSI_SINK_PAD:
> >>   		ret = imx_media_enum_mbus_format(&code->code, code->index,
> >> -						 CS_SEL_ANY, true);
> >> +						 CS_SEL_ANY);
> >>   		break;
> >>   	case CSI_SRC_PAD_DIRECT:
> >>   	case CSI_SRC_PAD_IDMAC:
> >> @@ -1433,8 +1433,7 @@ static void csi_try_fmt(struct csi_priv *priv,
> >>   	switch (sdformat->pad) {
> >>   	case CSI_SRC_PAD_DIRECT:
> >>   	case CSI_SRC_PAD_IDMAC:
> >> -		incc = imx_media_find_mbus_format(infmt->code,
> >> -						  CS_SEL_ANY, true);
> >> +		incc = imx_media_find_mbus_format(infmt->code, CS_SEL_ANY);
> >>   
> >>   		sdformat->format.width = compose->width;
> >>   		sdformat->format.height = compose->height;
> >> @@ -1470,12 +1469,10 @@ static void csi_try_fmt(struct csi_priv *priv,
> >>   				      MIN_H, MAX_H, H_ALIGN, S_ALIGN);
> >>   
> >>   		*cc = imx_media_find_mbus_format(sdformat->format.code,
> >> -						 CS_SEL_ANY, true);
> >> +						 CS_SEL_ANY);
> >>   		if (!*cc) {
> >> -			imx_media_enum_mbus_format(&code, 0,
> >> -						   CS_SEL_ANY, false);
> >> -			*cc = imx_media_find_mbus_format(code,
> >> -							 CS_SEL_ANY, false);
> >> +			imx_media_enum_mbus_format(&code, 0, CS_SEL_ANY);
> >> +			*cc = imx_media_find_mbus_format(code, CS_SEL_ANY);
> >
> > Same here.
> 
> Same as above, CSI supports bayer so the default format search should 
> technically include bayer. Although since this is selecting some 
> default, maybe it shouldn't allow bayer as a default.
> 
> >>   			sdformat->format.code = (*cc)->codes[0];
> >>   		}
> >>   
> >> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> >> index cf0aba8d53ba..6a3b0b737e5f 100644
> >> --- a/drivers/staging/media/imx/imx-media-utils.c
> >> +++ b/drivers/staging/media/imx/imx-media-utils.c
> >> @@ -213,8 +213,7 @@ static const struct imx_media_pixfmt ipu_rgb_formats[] = {
> >>   static const struct imx_media_pixfmt *find_format(u32 fourcc,
> >>   						  u32 code,
> >>   						  enum codespace_sel cs_sel,
> >> -						  bool allow_non_mbus,
> >> -						  bool allow_bayer)
> >> +						  bool allow_non_mbus)
> >>   {
> >>   	unsigned int i;
> >>   
> >> @@ -223,12 +222,12 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
> >>   		enum codespace_sel fmt_cs_sel;
> >>   		unsigned int j;
> >>   
> >> -		fmt_cs_sel = (fmt->cs == IPUV3_COLORSPACE_YUV) ?
> >> -			CS_SEL_YUV : CS_SEL_RGB;
> >> +		fmt_cs_sel = fmt->bayer ? CS_SEL_BAYER :
> >> +			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
> >> +			 CS_SEL_YUV : CS_SEL_RGB);
> >>   
> >> -		if ((cs_sel != CS_SEL_ANY && fmt_cs_sel != cs_sel) ||
> >> -		    (!allow_non_mbus && !fmt->codes[0]) ||
> >> -		    (!allow_bayer && fmt->bayer))
> >> +		if (!(fmt_cs_sel & cs_sel) ||
> >> +		    (!allow_non_mbus && !fmt->codes[0]))
> >>   			continue;
> >>   
> >>   		if (fourcc && fmt->fourcc == fourcc)
> >> @@ -248,8 +247,7 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
> >>   
> >>   static int enum_format(u32 *fourcc, u32 *code, u32 index,
> >>   		       enum codespace_sel cs_sel,
> >> -		       bool allow_non_mbus,
> >> -		       bool allow_bayer)
> >> +		       bool allow_non_mbus)
> >>   {
> >>   	unsigned int i;
> >>   
> >> @@ -258,12 +256,12 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
> >>   		enum codespace_sel fmt_cs_sel;
> >>   		unsigned int j;
> >>   
> >> -		fmt_cs_sel = (fmt->cs == IPUV3_COLORSPACE_YUV) ?
> >> -			CS_SEL_YUV : CS_SEL_RGB;
> >> +		fmt_cs_sel = fmt->bayer ? CS_SEL_BAYER :
> >> +			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
> >> +			 CS_SEL_YUV : CS_SEL_RGB);
> >>   
> >> -		if ((cs_sel != CS_SEL_ANY && fmt_cs_sel != cs_sel) ||
> >> -		    (!allow_non_mbus && !fmt->codes[0]) ||
> >> -		    (!allow_bayer && fmt->bayer))
> >> +		if (!(fmt_cs_sel & cs_sel) ||
> >> +		    (!allow_non_mbus && !fmt->codes[0]))
> >>   			continue;
> >>   
> >>   		if (fourcc && index == 0) {
> >> @@ -290,30 +288,28 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
> >>   }
> >>   
> >>   const struct imx_media_pixfmt *
> >> -imx_media_find_format(u32 fourcc, enum codespace_sel cs_sel, bool allow_bayer)
> >> +imx_media_find_format(u32 fourcc, enum codespace_sel cs_sel)
> >>   {
> >> -	return find_format(fourcc, 0, cs_sel, true, allow_bayer);
> >> +	return find_format(fourcc, 0, cs_sel, true);
> >>   }
> >>   EXPORT_SYMBOL_GPL(imx_media_find_format);
> >>   
> >>   int imx_media_enum_format(u32 *fourcc, u32 index, enum codespace_sel cs_sel)
> >>   {
> >> -	return enum_format(fourcc, NULL, index, cs_sel, true, false);
> >> +	return enum_format(fourcc, NULL, index, cs_sel, true);
> >>   }
> >>   EXPORT_SYMBOL_GPL(imx_media_enum_format);
> >>   
> >>   const struct imx_media_pixfmt *
> >> -imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel,
> >> -			   bool allow_bayer)
> >> +imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel)
> >>   {
> >> -	return find_format(0, code, cs_sel, false, allow_bayer);
> >> +	return find_format(0, code, cs_sel, false);
> >>   }
> >>   EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
> >>   
> >> -int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel,
> >> -			       bool allow_bayer)
> >> +int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel)
> >>   {
> >> -	return enum_format(NULL, code, index, cs_sel, false, allow_bayer);
> >> +	return enum_format(NULL, code, index, cs_sel, false);
> >>   }
> >>   EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
> >>   
> >> @@ -324,6 +320,8 @@ imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel)
> >>   	u32 array_size;
> >>   	int i, j;
> >>   
> >> +	cs_sel &= ~CS_SEL_BAYER;
> >> +
> >>   	switch (cs_sel) {
> >>   	case CS_SEL_YUV:
> >>   		array_size = NUM_IPU_YUV_FORMATS;
> >> @@ -333,7 +331,7 @@ imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel)
> >>   		array_size = NUM_IPU_RGB_FORMATS;
> >>   		array = ipu_rgb_formats;
> >>   		break;
> >> -	case CS_SEL_ANY:
> >> +	case CS_SEL_YUV_RGB:
> >>   		array_size = NUM_IPU_YUV_FORMATS + NUM_IPU_RGB_FORMATS;
> >>   		array = ipu_yuv_formats;
> >>   		break;
> >> @@ -342,7 +340,7 @@ imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel)
> >>   	}
> >>   
> >>   	for (i = 0; i < array_size; i++) {
> >> -		if (cs_sel == CS_SEL_ANY && i >= NUM_IPU_YUV_FORMATS)
> >> +		if (cs_sel == CS_SEL_YUV_RGB && i >= NUM_IPU_YUV_FORMATS)
> >>   			fmt = &ipu_rgb_formats[i - NUM_IPU_YUV_FORMATS];
> >>   		else
> >>   			fmt = &array[i];
> >> @@ -362,6 +360,8 @@ EXPORT_SYMBOL_GPL(imx_media_find_ipu_format);
> >>   
> >>   int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel)
> >>   {
> >> +	cs_sel &= ~CS_SEL_BAYER;
> >> +
> >>   	switch (cs_sel) {
> >>   	case CS_SEL_YUV:
> >>   		if (index >= NUM_IPU_YUV_FORMATS)
> >> @@ -373,7 +373,7 @@ int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel)
> >>   			return -EINVAL;
> >>   		*code = ipu_rgb_formats[index].codes[0];
> >>   		break;
> >> -	case CS_SEL_ANY:
> >> +	case CS_SEL_YUV_RGB:
> >>   		if (index >= NUM_IPU_YUV_FORMATS + NUM_IPU_RGB_FORMATS)
> >>   			return -EINVAL;
> >>   		if (index >= NUM_IPU_YUV_FORMATS) {
> >> @@ -401,8 +401,8 @@ int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
> >>   	mbus->height = height;
> >>   	mbus->field = field;
> >>   	if (code == 0)
> >> -		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV, false);
> >> -	lcc = imx_media_find_mbus_format(code, CS_SEL_ANY, false);
> >> +		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV);
> >> +	lcc = imx_media_find_mbus_format(code, CS_SEL_ANY);
> >
> > And here.
> 
> This is imx_media_enum_mbus_format(), which is called by a subdev when 
> it is registered to fill its mbus formats with some sane defaults. It's 
> appropriate to use PIXFMT_SEL_ANY here since it is called by CSI.

Fine with me, but as it changes the behaviour, let's split it to a
separate patch.

> >>   	if (!lcc) {
> >>   		lcc = imx_media_find_ipu_format(code, CS_SEL_ANY);
> >>   		if (!lcc)
> >> @@ -473,7 +473,7 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
> >>   	const struct imx_media_pixfmt *cc;
> >>   	bool is_rgb = false;
> >>   
> >> -	cc = imx_media_find_mbus_format(tryfmt->code, CS_SEL_ANY, true);
> >> +	cc = imx_media_find_mbus_format(tryfmt->code, CS_SEL_ANY);
> >>   	if (!cc)
> >>   		cc = imx_media_find_ipu_format(tryfmt->code, CS_SEL_ANY);
> >>   	if (cc && cc->cs == IPUV3_COLORSPACE_RGB)
> >> @@ -527,8 +527,8 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
> >>   	if (!cc) {
> >>   		cc = imx_media_find_ipu_format(mbus->code, CS_SEL_ANY);
> >>   		if (!cc)
> >> -			cc = imx_media_find_mbus_format(mbus->code, CS_SEL_ANY,
> >> -							true);
> >> +			cc = imx_media_find_mbus_format(mbus->code,
> >> +							CS_SEL_ANY);
> >>   		if (!cc)
> >>   			return -EINVAL;
> >>   	}
> >> @@ -540,8 +540,8 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
> >>   	if (cc->ipufmt && cc->cs == IPUV3_COLORSPACE_YUV) {
> >>   		u32 code;
> >>   
> >> -		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV, false);
> >> -		cc = imx_media_find_mbus_format(code, CS_SEL_YUV, false);
> >> +		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV);
> >> +		cc = imx_media_find_mbus_format(code, CS_SEL_YUV);
> >>   	}
> >>   
> >>   	/* Round up width for minimum burst size */
> >> @@ -592,7 +592,7 @@ int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
> >>   {
> >>   	const struct imx_media_pixfmt *fmt;
> >>   
> >> -	fmt = imx_media_find_format(image->pix.pixelformat, CS_SEL_ANY, true);
> >> +	fmt = imx_media_find_format(image->pix.pixelformat, CS_SEL_ANY);
> >>   	if (!fmt)
> >>   		return -EINVAL;
> >>   
> >> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> >> index 11861191324a..652673a703cd 100644
> >> --- a/drivers/staging/media/imx/imx-media.h
> >> +++ b/drivers/staging/media/imx/imx-media.h
> >> @@ -150,20 +150,20 @@ struct imx_media_dev {
> >>   };
> >>   
> >>   enum codespace_sel {
> >> -	CS_SEL_YUV = 0,
> >> -	CS_SEL_RGB,
> >> -	CS_SEL_ANY,
> >> +	CS_SEL_YUV = BIT(0),
> >> +	CS_SEL_RGB = BIT(1),
> >> +	CS_SEL_BAYER = BIT(2),
> >> +	CS_SEL_YUV_RGB = CS_SEL_YUV | CS_SEL_RGB,
> >> +	CS_SEL_ANY = CS_SEL_YUV | CS_SEL_RGB | CS_SEL_BAYER,
> >>   };
> >>   
> >>   /* imx-media-utils.c */
> >>   const struct imx_media_pixfmt *
> >> -imx_media_find_format(u32 fourcc, enum codespace_sel cs_sel, bool allow_bayer);
> >> +imx_media_find_format(u32 fourcc, enum codespace_sel cs_sel);
> >>   int imx_media_enum_format(u32 *fourcc, u32 index, enum codespace_sel cs_sel);
> >>   const struct imx_media_pixfmt *
> >> -imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel,
> >> -			   bool allow_bayer);
> >> -int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel,
> >> -			       bool allow_bayer);
> >> +imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel);
> >> +int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel);
> >>   const struct imx_media_pixfmt *
> >>   imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel);
> >>   int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel);
> >> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> >> index acbdffb77668..a469dc76a787 100644
> >> --- a/drivers/staging/media/imx/imx7-media-csi.c
> >> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> >> @@ -959,7 +959,7 @@ static int imx7_csi_enum_mbus_code(struct v4l2_subdev *sd,
> >>   	switch (code->pad) {
> >>   	case IMX7_CSI_PAD_SINK:
> >>   		ret = imx_media_enum_mbus_format(&code->code, code->index,
> >> -						 CS_SEL_ANY, true);
> >> +						 CS_SEL_ANY);
> >>   		break;
> >>   	case IMX7_CSI_PAD_SRC:
> >>   		if (code->index != 0) {
> >> @@ -1019,8 +1019,7 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
> >>   
> >>   	switch (sdformat->pad) {
> >>   	case IMX7_CSI_PAD_SRC:
> >> -		in_cc = imx_media_find_mbus_format(in_fmt->code, CS_SEL_ANY,
> >> -						   true);
> >> +		in_cc = imx_media_find_mbus_format(in_fmt->code, CS_SEL_ANY);
> >>   
> >>   		sdformat->format.width = in_fmt->width;
> >>   		sdformat->format.height = in_fmt->height;
> >> @@ -1035,11 +1034,10 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
> >>   		break;
> >>   	case IMX7_CSI_PAD_SINK:
> >>   		*cc = imx_media_find_mbus_format(sdformat->format.code,
> >> -						 CS_SEL_ANY, true);
> >> +						 CS_SEL_ANY);
> >>   		if (!*cc) {
> >> -			imx_media_enum_mbus_format(&code, 0, CS_SEL_ANY, false);
> >> -			*cc = imx_media_find_mbus_format(code, CS_SEL_ANY,
> >> -							 false);
> >> +			imx_media_enum_mbus_format(&code, 0, CS_SEL_ANY);
> >> +			*cc = imx_media_find_mbus_format(code, CS_SEL_ANY);
> >
> > And finally here.
> 
> I *think* the i.MX7 CSI supports bayer, so this is allowing a bayer 
> format as a default, but again maybe it should avoid selecting bayer in 
> that case.

The i.MX7 supports Bayer in the sense that it can capture raw data.
There's no debayering support at the hardware level unfortunately :-(

I'm also fine with this change, but let's split it too with the others.

> >>   			sdformat->format.code = (*cc)->codes[0];
> >>   		}
> >>   

-- 
Regards,

Laurent Pinchart
