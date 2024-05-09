Return-Path: <linux-media+bounces-11212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B12668C1093
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 15:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FDF3281376
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 13:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D35D15B0FC;
	Thu,  9 May 2024 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AUAJ67o4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6C115B12A;
	Thu,  9 May 2024 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715262248; cv=none; b=PdrtDrj7hAHuGT7QaM0b/+XZ17GXH5vyeTsS3j7xpbFRp1JF+V/lf0RmMKcjciP7XJ4f6vE6O9EVZGjGCooQNfZVfkuQ2lSBQVH6X08c1q36GqqkodgFiqd9iJOfQMYwfQYLh3P+wsFETGL8zCDFvc9rxyYG1kpZUpaXr9kFsJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715262248; c=relaxed/simple;
	bh=Mjokrgg/UIv00zAPfdFTgzK5gB6F8fZQaw15dNMQajc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pC3l5qwZvGZeLjk3QNK5nMdR+dmxNFWHnnF+Z94f5E4QEsXLJz12ER2hsZuYAE5qRLItmdniHEQINRW5XXK0QKJk36sIZ+pmTM1SwZh+l2Seo1K/+aoJFvFguXpg5IV5oy3COkesbe3CF79LA+NedOX196xZg1vuyhgYISmsPjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AUAJ67o4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFCA32320;
	Thu,  9 May 2024 15:44:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715262242;
	bh=Mjokrgg/UIv00zAPfdFTgzK5gB6F8fZQaw15dNMQajc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUAJ67o4e0DsbL2BtQNAbn2zkRkjKRgyT+MR1Qk7JJhh6gkc7yH5qxjkT/HdQJ2wI
	 hM2S5Us3LjkTcbR7dU3LQyLKygXcwwhzlESsHzgoqw785dN31dbk0s+fCUpQC2OKJl
	 cqIey/RiUY305IFDZHfjBzvnPJ2WgU4AJMQPWHnQ=
Date: Thu, 9 May 2024 15:44:02 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 05/11] media: adv748x-csi2: Implement enum_mbus_codes
Message-ID: <kr5uw6s2ornpovbdtdrosrx4relwpldf4ee7gfy24cuxl55alw@f2i4itou6iiv>
References: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
 <20240506164941.110389-6-jacopo.mondi@ideasonboard.com>
 <20240509124249.GB17123@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240509124249.GB17123@pendragon.ideasonboard.com>

Hi Laurent

On Thu, May 09, 2024 at 03:42:49PM GMT, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, May 06, 2024 at 06:49:33PM +0200, Jacopo Mondi wrote:
> > Define a list of supported mbus codes for the TXA and TXB CSI-2
> > transmitters and implement the enum_mbus_code operation.
> >
> > The TXB transmitter only support YUV422 while the TXA one supports
> > multiple formats as reported by the chip's manual in section 9.7.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/i2c/adv748x/adv748x-csi2.c | 35 ++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >
> > diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > index 5b265b722394..4fd6d3a681d5 100644
> > --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> > +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > @@ -14,6 +14,18 @@
> >
> >  #include "adv748x.h"
> >
> > +static const unsigned int adv748x_csi2_txa_fmts[] = {
> > +	MEDIA_BUS_FMT_UYVY8_1X16,
> > +	MEDIA_BUS_FMT_UYVY10_1X20,
> > +	MEDIA_BUS_FMT_RGB565_1X16,
> > +	MEDIA_BUS_FMT_RGB666_1X18,
> > +	MEDIA_BUS_FMT_RGB888_1X24,
> > +};
> > +
> > +static const unsigned int adv748x_csi2_txb_fmts[] = {
> > +	MEDIA_BUS_FMT_UYVY8_1X16,
> > +};
> > +
> >  int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc)
> >  {
> >  	return tx_write(tx, ADV748X_CSI_VC_REF, vc << ADV748X_CSI_VC_REF_SHIFT);
> > @@ -139,6 +151,28 @@ static const struct v4l2_subdev_video_ops adv748x_csi2_video_ops = {
> >   * But we must support setting the pad formats for format propagation.
> >   */
> >
> > +static int adv748x_csi2_enum_mbus_code(struct v4l2_subdev *sd,
> > +				       struct v4l2_subdev_state *sd_state,
> > +				       struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> > +	const unsigned int *codes = is_txa(tx) ?
> > +				    adv748x_csi2_txa_fmts :
> > +				    adv748x_csi2_txb_fmts;
> > +	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
> > +				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
> > +
> > +	if (code->pad != ADV748X_CSI2_SOURCE)
> > +		return -EINVAL;
>
> Any reason to not support enumeration of formats on the sink pad ?
>
> it modify the format between the sink and source pads ? If not, I think
> this function should be implemented as
>
> 	if (code->pad == ADV748X_CSI2_SINK) {
> 		if (code->index >= num_fmts)
> 			return -EINVAL;
>
> 		code->code = codes[code->index];

I don't think this is correct. The formats I have listed in
adv748x_csi2_txa_fmts and adv748x_csi2_txb_fmts are the CSI-2 output
formats, not the ones accepted on the sink side of the CSI-2 TX

The CSI-2 TX sink pads connects to either the HDMI or AFE subdevices.
The media link represents the internal processing pipeline between the
two frontends and the TXes. The formats accepted on the TX sinks are
then the formats that can be produced by the HDMI/Analog sources the
adv748x is connected to ?

> 	} else {
> 		const struct v4l2_msbu_framefmt *fmt;
>
> 		if (code->index > 0)
> 			return -EINVAL;
>
> 		/*
> 		 * The device doesn't modify formats, the same media bus code is

At the same time the device seems capable of performing format
conversion, but the driver configures it in pass-through mode.

Now, given this configuration, it seems that whatever format is
produced by the HDMI/Analog front-end is reproduced on the CSI-2 Tx
source side. However the two frontends only list

static int adv748x_hdmi_enum_mbus_code(struct v4l2_subdev *sd,
				  struct v4l2_subdev_state *sd_state,
				  struct v4l2_subdev_mbus_code_enum *code)
{
	if (code->index != 0)
		return -EINVAL;

	code->code = MEDIA_BUS_FMT_RGB888_1X24;

	return 0;
}


static int adv748x_afe_enum_mbus_code(struct v4l2_subdev *sd,
				      struct v4l2_subdev_state *sd_state,
				      struct v4l2_subdev_mbus_code_enum *code)
{
	if (code->index != 0)
		return -EINVAL;

	code->code = MEDIA_BUS_FMT_UYVY8_2X8;

	return 0;
}

While I presume many more formats would be possible.

In facts (for analog):
The video standards supported by the video processor include PAL B/PAL
D/PAL I/PAL G/PAL H, PAL 60, PAL M, PAL N, PAL Nc, NTSC M/NTSC J, NTSC
4.43, and SECAM B/SECAM D/SECAM G/SECAM K/SECAM L. The ADV748x can
automatically detect the input video standard and process it
accordingly.

I presume the HDMI standard support more formats than just RGB888 ?

So, as I was not sure on how to handle this, and enumerating formats
on the sink pads (which represent an internal bus connection) was of
little value, I decided to only allow format enumeration on the CSI-2
source pads, as the supported formats are well described by the chip
manual.

What do you think ?

> 		 * used on the sink and source.
> 		 */
> 		fmt = v4l2_subdev_state_get_format(sd_state, ADV748X_CSI2_SINK);
> 		code->code = fmt->code;
> 	}
>
> > +
> > +	if (code->index >= num_fmts)
> > +		return -EINVAL;
> > +
> > +	code->code = codes[code->index];
> > +
> > +	return 0;
> > +}
> > +
> >  static struct v4l2_mbus_framefmt *
> >  adv748x_csi2_get_pad_format(struct v4l2_subdev *sd,
> >  			    struct v4l2_subdev_state *sd_state,
> > @@ -228,6 +262,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
> >  }
> >
> >  static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
> > +	.enum_mbus_code = adv748x_csi2_enum_mbus_code,
> >  	.get_fmt = adv748x_csi2_get_format,
> >  	.set_fmt = adv748x_csi2_set_format,
> >  	.get_mbus_config = adv748x_csi2_get_mbus_config,
>
> --
> Regards,
>
> Laurent Pinchart

