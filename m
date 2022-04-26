Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0EA450F970
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 12:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347973AbiDZKCs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 26 Apr 2022 06:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346935AbiDZKCX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 06:02:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 229795F8D3
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 02:21:07 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1njHNZ-0004Q0-GJ; Tue, 26 Apr 2022 11:21:05 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1njHNZ-005Jl4-SH; Tue, 26 Apr 2022 11:21:04 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1njHNX-00041d-Ib; Tue, 26 Apr 2022 11:21:03 +0200
Message-ID: <d2bd0beba92ca14bf2b7ffd93f854ae46a8c45e6.camel@pengutronix.de>
Subject: Re: [PATCH 5/7] media: coda: fix default JPEG colorimetry
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Date:   Tue, 26 Apr 2022 11:21:03 +0200
In-Reply-To: <7baae67d-e5e0-1f6f-d915-4ef5ca5fffd3@xs4all.nl>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
         <20220404163533.707508-5-p.zabel@pengutronix.de>
         <0f5d9c16-860b-015f-8028-234d2fb96959@xs4all.nl>
         <4ddc131113b41bf8427d0b316b70335578971ff4.camel@pengutronix.de>
         <7baae67d-e5e0-1f6f-d915-4ef5ca5fffd3@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Do, 2022-04-21 at 13:06 +0200, Hans Verkuil wrote:
> On 21/04/2022 12:38, Philipp Zabel wrote:
> > On Do, 2022-04-21 at 12:02 +0200, Hans Verkuil wrote:
> > > Hi Philipp,
> > > 
> > > On 04/04/2022 18:35, Philipp Zabel wrote:
> > > > Set default colorspace to SRGB for JPEG encoder and decoder devices,
> > > > to fix the following v4l2-compliance test failure:
> > > > 
> > > > 	test VIDIOC_TRY_FMT: OK
> > > > 		fail: v4l2-test-formats.cpp(818): fmt_raw.g_colorspace() != V4L2_COLORSPACE_SRGB
> > > > 
> > > > Also explicitly set transfer function, YCbCr encoding and quantization
> > > > range, as required by v4l2-compliance for the JPEG encoded side.
> > > 
> > > I'm not quite sure if this patch addresses the correct issue.
> > > 
> > > > 
> > > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > > ---
> > > >  .../media/platform/chips-media/coda-common.c  | 36 +++++++++++++------
> > > >  1 file changed, 25 insertions(+), 11 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
> > > > index 4a7346ed771e..c068c16d1eb4 100644
> > > > --- a/drivers/media/platform/chips-media/coda-common.c
> > > > +++ b/drivers/media/platform/chips-media/coda-common.c
> > > > @@ -732,13 +732,22 @@ static int coda_try_fmt_vid_cap(struct file *file, void *priv,
> > > >  	return 0;
> > > >  }
> > > >  
> > > > 
> > > > 
> > > > 
> > > > -static void coda_set_default_colorspace(struct v4l2_pix_format *fmt)
> > > > +static void coda_set_default_colorspace(struct coda_ctx *ctx,
> > > > +					struct v4l2_pix_format *fmt)
> > > >  {
> > > >  	enum v4l2_colorspace colorspace;
> > > >  
> > > > 
> > > > 
> > > > 
> > > > -	if (fmt->pixelformat == V4L2_PIX_FMT_JPEG)
> > > > -		colorspace = V4L2_COLORSPACE_JPEG;
> > > 
> > > It's perfectly fine to keep this, the problem occurs with the raw image side
> > > (capture for the decoder, output for the encoder).
> > > 
> > > There the colorspace must be SRGB, the xfer_func may be 0 or SRGB, and the
> > > ycbcr_enc is 0 (if not a YUV pixelformat) or ENC_601 (if it is a YUV format).
> > > Actually, if the hardware can convert from other YUV encodings such as 709,
> > > then other YUV encodings are valid, but I assume that's not the case.
> > 
> > So the driver has to support different colorspace on output and capture
> > queues?
> 
> Correct. Note that it is OK to replace COLORSPACE_JPEG by explicit colorspace,
> xfer_func, ycbcr_enc and quantization values, but in reality (almost?) all drivers
> use COLORSPACE_JPEG, and that won't go away. Keeping it will certainly reduce
> the patch size.
> 
> Regards,
> 
> 	Hans
> 
> > 
> > > > -	else if (fmt->width <= 720 && fmt->height <= 576)
> > > > +	if (ctx->cvd->src_formats[0] == V4L2_PIX_FMT_JPEG ||
> > > > +	    ctx->cvd->dst_formats[0] == V4L2_PIX_FMT_JPEG ||
> > > > +	    fmt->pixelformat == V4L2_PIX_FMT_JPEG) {
> > > > +		fmt->colorspace = V4L2_COLORSPACE_SRGB;
> > > > +		fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
> > > > +		fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> > > > +		fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	if (fmt->width <= 720 && fmt->height <= 576)
> > > >  		colorspace = V4L2_COLORSPACE_SMPTE170M;
> > > >  	else
> > > >  		colorspace = V4L2_COLORSPACE_REC709;

coda_set_default_colorspace() is only called when userspace calls S_FMT
with colorspace = V4L2_COLORSPACE_DEFAULT.

Since v4l2-compliance doesn't care about this, I've dropped this part.

> > > > @@ -763,7 +772,7 @@ static int coda_try_fmt_vid_out(struct file *file, void *priv,
> > > >  		return ret;
> > > >  
> > > > 
> > > > 
> > > > 
> > > >  	if (f->fmt.pix.colorspace == V4L2_COLORSPACE_DEFAULT)
> > > > -		coda_set_default_colorspace(&f->fmt.pix);
> > > > +		coda_set_default_colorspace(ctx, &f->fmt.pix);

And this.

> > > >  
> > > > 
> > > > 
> > > > 
> > > >  	q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> > > >  	codec = coda_find_codec(dev, f->fmt.pix.pixelformat, q_data_dst->fourcc);
> > > > @@ -1640,13 +1649,18 @@ static void set_default_params(struct coda_ctx *ctx)
> > > >  	csize = coda_estimate_sizeimage(ctx, usize, max_w, max_h);
> > > >  
> > > > 
> > > > 
> > > > 
> > > >  	ctx->params.codec_mode = ctx->codec->mode;
> > > > -	if (ctx->cvd->src_formats[0] == V4L2_PIX_FMT_JPEG)
> > > > -		ctx->colorspace = V4L2_COLORSPACE_JPEG;
> > > > -	else
> > > > +	if (ctx->cvd->src_formats[0] == V4L2_PIX_FMT_JPEG ||
> > > > +	    ctx->cvd->dst_formats[0] == V4L2_PIX_FMT_JPEG) {
> > > > +		ctx->colorspace = V4L2_COLORSPACE_SRGB;
> > > > +		ctx->xfer_func = V4L2_XFER_FUNC_SRGB;
> > > > +		ctx->ycbcr_enc = V4L2_YCBCR_ENC_601;
> > > > +		ctx->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > > > +	} else {
> > > >  		ctx->colorspace = V4L2_COLORSPACE_REC709;
> > > 
> > > My guess is that the raw format colorspace is set to REC709, which is definitely
> > > wrong for a JPEG codec. For a JPEG codec that must be set to SRGB.
> > > 
> > > I suspect that's the real bug here.

Right, this part is enough to make v4l2-compliance happy. I've sent a
v2 reduced to this.

The driver still only supports identical colorimetry on both queues, so
when userspace sets colorspace = V4L2_COLORSPACE_JPEG on the output
queue, the capture queue will be set to the same.

regards
Philipp
