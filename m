Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBF88C3397
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 14:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfJAMAp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 08:00:45 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50692 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfJAMAp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 08:00:45 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UKMWaj121399;
        Mon, 30 Sep 2019 15:22:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569874952;
        bh=/ubZdApPBnsXOwica/+pxmLmIFznLxE+d34pdI5c1JY=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=jURCmzfyYxoJwybgfhe2AQ8cgH2bRRhMutFF1AeKG8pW8kURB5xlVa4Mai1gWRbJW
         O39iVxJrgLITaQskttlECqj2ONDqprRUOKcUj5EN8CyGII2oQQTDVhe6+N+/P+7aEN
         SMKnEoC6z6HCVqSPahuPOJ3ssXAKZ2H12rexWnCU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UKMWDM001356
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Sep 2019 15:22:32 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 15:22:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 15:22:32 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with SMTP id x8UKMWe8020400;
        Mon, 30 Sep 2019 15:22:32 -0500
Date:   Mon, 30 Sep 2019 15:24:43 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 16/16] media: ti-vpe: vpe: don't rely on colorspace
 member for conversion
Message-ID: <20190930202443.tvu4htu7w5sv33ee@ti.com>
References: <20190927183650.31345-1-bparrot@ti.com>
 <20190927183650.31345-17-bparrot@ti.com>
 <263b7b22-b867-3f73-bcaf-8978f9e3b415@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <263b7b22-b867-3f73-bcaf-8978f9e3b415@xs4all.nl>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans Verkuil <hverkuil@xs4all.nl> wrote on Mon [2019-Sep-30 11:05:13 +0200]:
> On 9/27/19 8:36 PM, Benoit Parrot wrote:
> > Up to now VPE was relying on the colorspace value of struct v4l2_format
> > as an indication to perform color space conversion from YUV to RGB or
> > not.
> > 
> > Instead we should used the source/destination fourcc codes as a more
> > reliable indication to perform color space conversion or not.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/platform/ti-vpe/vpe.c | 41 ++++++++++++++++++++++-------
> >  1 file changed, 32 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
> > index e30981cd3e8f..d002adc6263f 100644
> > --- a/drivers/media/platform/ti-vpe/vpe.c
> > +++ b/drivers/media/platform/ti-vpe/vpe.c
> > @@ -353,6 +353,32 @@ enum {
> >  	Q_DATA_DST = 1,
> >  };
> >  
> > +static bool is_fmt_rgb(u32 fourcc)
> > +{
> > +	if (fourcc == V4L2_PIX_FMT_RGB24 ||
> > +	    fourcc == V4L2_PIX_FMT_BGR24 ||
> > +	    fourcc == V4L2_PIX_FMT_RGB32 ||
> > +	    fourcc == V4L2_PIX_FMT_BGR32 ||
> > +	    fourcc == V4L2_PIX_FMT_RGB565 ||
> > +	    fourcc == V4L2_PIX_FMT_RGB555)
> > +		return true;
> > +
> > +	return false;
> > +}
> 
> Why not add a 'bool is_rgb' to struct vpe_fmt?
> 
> It is all too easy to forget to update this function if a new RGB format is
> added to the vpe_formats array in the future.

Yeah I debate going that route also.
I can change it easily enough.

Although, depending on the further changes required below this may be moot.
We'll see.

> 
> > +
> > +/*
> > + * This helper is only used to setup the color space converter
> > + * the actual value returned is only to broadly differentiate between
> > + * RGB and YUV
> > + */
> > +static enum  v4l2_colorspace fourcc_to_colorspace(u32 fourcc)
> 
> double space after enum.

Arrg, I'll fix that.

> 
> > +{
> > +	if (is_fmt_rgb(fourcc))
> > +		return V4L2_COLORSPACE_SRGB;
> > +
> > +	return V4L2_COLORSPACE_SMPTE170M;
> > +}
> 
> This is highly confusing. RGB or YUV conversion does not change the colorspace
> at all.
> 

Well I see here that I am missing some understanding.
But as you saw all I am trying to get to is this: do we need to setup YUV
to RGB conversion or not.

Regarding csc_set_coeff() I was not trying to re-write it but use the
pixel_formats as hint. I understand that this might not be as flexible as
it needs to be (meaning handling colorspace, xfer_func, ycbr_encoding or
quantization in a sane way) but to at least get the correct direction of the
conversion. At the moment VPE driver only handles YUV to RGB conversion.


> There are four colorimetry related fields: colorspace, xfer_func, ycbcr_enc and
> quantization. Most hardware (including this one AFAICT) have a 3x3 matrix + a
> vector to do the conversion. This only allows you to convert between different
> ycbcr encodings and quantization ranges. The colorspace and xfer_func parameters
> stay unchanged (you need gamma tables and two other 3x3 matrices for that).
> 
> So if you want to set up the 3x3 matrix + vector correctly, then you need to
> provide the ycbcr_enc value + quantization value of the source to your function.
> ycbcr_enc is only valid of YUV pixelformats, of course, and you can use
> V4L2_MAP_COLORSPACE_DEFAULT, V4L2_MAP_YCBCR_ENC_DEFAULT and V4L2_MAP_QUANTIZATION_DEFAULT
> if one or more of these values as set by userspace are 0.
> 
> Since the V4L2 API does not (yet) support setting ycbcr_enc and quantization for the
> capture queue you have to provide that information yourself:
> 
> For RGB ycbcr_enc is of course ignored, and quantization should be full range.
> For YUV it depends: the quantization is always limited range, but for the ycbcr_enc
> you have a choice: if the source was YUV, then you can decide to just copy the
> ycbcr_enc value. Alternatively, you can convert to 601 for SDTV and 709 for anything
> else. The latter is also the recommended choice if the source was RGB.
> 
> In any case, please do not use enum v4l2_colorspace in the csc_set_coeff function:
> it's misleading.

But I guess I can rewrite the csc_set_coeff() module API to use at least
pixel_format instead of enum_colorspace at least as a first step.

Full color space parameters support (meaning all 4 of them) would probably
be better done as its own future patch series.

Benoit

> 
> https://hverkuil.home.xs4all.nl/spec/uapi/v4l/colorspaces.html and the following two
> sections contain a lot of information about how colorspaces work.
> 
> Regards,
> 
> 	Hans
> 
> > +
> >  /* find our format description corresponding to the passed v4l2_format */
> >  static struct vpe_fmt *__find_format(u32 fourcc)
> >  {
> > @@ -764,11 +790,10 @@ static void set_src_registers(struct vpe_ctx *ctx)
> >  static void set_dst_registers(struct vpe_ctx *ctx)
> >  {
> >  	struct vpe_mmr_adb *mmr_adb = ctx->mmr_adb.addr;
> > -	enum v4l2_colorspace clrspc = ctx->q_data[Q_DATA_DST].colorspace;
> >  	struct vpe_fmt *fmt = ctx->q_data[Q_DATA_DST].fmt;
> >  	u32 val = 0;
> >  
> > -	if (clrspc == V4L2_COLORSPACE_SRGB) {
> > +	if (is_fmt_rgb(fmt->fourcc)) {
> >  		val |= VPE_RGB_OUT_SELECT;
> >  		vpdma_set_bg_color(ctx->dev->vpdma,
> >  			(struct vpdma_data_format *)fmt->vpdma_fmt[0], 0xff);
> > @@ -912,7 +937,8 @@ static int set_srcdst_params(struct vpe_ctx *ctx)
> >  	set_dei_regs(ctx);
> >  
> >  	csc_set_coeff(ctx->dev->csc, &mmr_adb->csc_regs[0],
> > -		s_q_data->colorspace, d_q_data->colorspace);
> > +		      fourcc_to_colorspace(s_q_data->fmt->fourcc),
> > +		      fourcc_to_colorspace(d_q_data->fmt->fourcc));
> >  
> >  	sc_set_hs_coeffs(ctx->dev->sc, ctx->sc_coeff_h.addr, src_w, dst_w);
> >  	sc_set_vs_coeffs(ctx->dev->sc, ctx->sc_coeff_v.addr, src_h, dst_h);
> > @@ -1285,7 +1311,7 @@ static void device_run(void *priv)
> >  	if (ctx->deinterlacing)
> >  		add_out_dtd(ctx, VPE_PORT_MV_OUT);
> >  
> > -	if (d_q_data->colorspace == V4L2_COLORSPACE_SRGB) {
> > +	if (is_fmt_rgb(d_q_data->fmt->fourcc)) {
> >  		add_out_dtd(ctx, VPE_PORT_RGB_OUT);
> >  	} else {
> >  		add_out_dtd(ctx, VPE_PORT_LUMA_OUT);
> > @@ -1327,7 +1353,7 @@ static void device_run(void *priv)
> >  	}
> >  
> >  	/* sync on channel control descriptors for output ports */
> > -	if (d_q_data->colorspace == V4L2_COLORSPACE_SRGB) {
> > +	if (is_fmt_rgb(d_q_data->fmt->fourcc)) {
> >  		vpdma_add_sync_on_channel_ctd(&ctx->desc_list,
> >  			VPE_CHAN_RGB_OUT);
> >  	} else {
> > @@ -1682,10 +1708,7 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
> >  		height = pix->height;
> >  
> >  	if (!pix->colorspace) {
> > -		if (fmt->fourcc == V4L2_PIX_FMT_RGB24 ||
> > -				fmt->fourcc == V4L2_PIX_FMT_BGR24 ||
> > -				fmt->fourcc == V4L2_PIX_FMT_RGB32 ||
> > -				fmt->fourcc == V4L2_PIX_FMT_BGR32) {
> > +		if (is_fmt_rgb(fmt->fourcc)) {
> >  			pix->colorspace = V4L2_COLORSPACE_SRGB;
> >  		} else {
> >  			if (height > 1280)	/* HD */
> > 
> 
