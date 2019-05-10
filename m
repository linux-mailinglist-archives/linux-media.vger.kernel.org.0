Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1783519FB0
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 16:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbfEJO6i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 10:58:38 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55345 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727346AbfEJO6h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 10:58:37 -0400
Received: from litschi.hi.pengutronix.de ([2001:67c:670:100:feaa:14ff:fe6a:8db5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1hP6yq-0003yf-3n; Fri, 10 May 2019 16:58:36 +0200
Date:   Fri, 10 May 2019 16:58:33 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        dshah@xilinx.com, mchehab@kernel.org, robh+dt@kernel.org,
        kernel@pengutronix.de, tfiga@chromium.org
Subject: Re: [PATCH v5 4/5] [media] allegro: add Allegro DVT video IP core
 driver
Message-ID: <20190510165833.4984cf0c@litschi.hi.pengutronix.de>
In-Reply-To: <5755a4f2-b946-283f-7a96-6bb9583d2c73@xs4all.nl>
References: <20190503122010.16663-1-m.tretter@pengutronix.de>
        <20190503122010.16663-5-m.tretter@pengutronix.de>
        <0d15e216-7e10-eb55-1957-32be1c48f461@xs4all.nl>
        <20190510122819.3a978105@litschi.hi.pengutronix.de>
        <f9136e3a-6592-7198-b4fb-75664a8b653e@xs4all.nl>
        <20190510155239.0502e080@litschi.hi.pengutronix.de>
        <5755a4f2-b946-283f-7a96-6bb9583d2c73@xs4all.nl>
Organization: Pengutronix
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:feaa:14ff:fe6a:8db5
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 10 May 2019 16:11:54 +0200, Hans Verkuil wrote:
> On 5/10/19 3:52 PM, Michael Tretter wrote:
> > On Fri, 10 May 2019 12:58:43 +0200, Hans Verkuil wrote:  
> >> On 5/10/19 12:28 PM, Michael Tretter wrote:  
> >>> On Fri, 10 May 2019 10:28:53 +0200, Hans Verkuil wrote:    
> >>>> On 5/3/19 2:20 PM, Michael Tretter wrote:    
> >>>>> Add a V4L2 mem-to-mem driver for Allegro DVT video IP cores as found in
> >>>>> the EV family of the Xilinx ZynqMP SoC. The Zynq UltraScale+ Device
> >>>>> Technical Reference Manual uses the term VCU (Video Codec Unit) for the
> >>>>> encoder, decoder and system integration block.
> >>>>>
> >>>>> This driver takes care of interacting with the MicroBlaze MCU that
> >>>>> controls the actual IP cores. The IP cores and MCU are integrated in the
> >>>>> FPGA. The xlnx_vcu driver is responsible for configuring the clocks and
> >>>>> providing information about the codec configuration.
> >>>>>
> >>>>> The driver currently only supports the H.264 video encoder.
> >>>>>
> >>>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> >>>>> ---    
> >>
> >> <snip>
> >>  
> >>>>> +static int allegro_try_fmt_vid_out(struct file *file, void *fh,
> >>>>> +				   struct v4l2_format *f)
> >>>>> +{
> >>>>> +	f->fmt.pix.field = V4L2_FIELD_NONE;
> >>>>> +
> >>>>> +	f->fmt.pix.width = clamp_t(__u32, f->fmt.pix.width,
> >>>>> +				   ALLEGRO_WIDTH_MIN, ALLEGRO_WIDTH_MAX);
> >>>>> +	f->fmt.pix.height = clamp_t(__u32, f->fmt.pix.height,
> >>>>> +				    ALLEGRO_HEIGHT_MIN, ALLEGRO_HEIGHT_MAX);      
> >>>>
> >>>> Shouldn't this be rounded up to the macroblock size? Or is the encoder
> >>>> smart enough to do the padding internally?    
> >>>
> >>> The driver sends a message with the visible size of the raw frames
> >>> (without macroblock alignment) to the encoder firmware. Therefore, the
> >>> encoder firmware is responsible for handling the padding to macroblock
> >>> size.    
> >>
> >> Please add a comment describing this. It is unusual for encoders to be
> >> able to do this so it is good to document this.  
> > 
> > OK.
> >   
> >>  
> >>>
> >>> Furthermore, the encoder requires that the stride is 32 byte aligned.
> >>> Therefore, we naturally have a macroblock alignment regarding the
> >>> width, but not regarding the height. This limitation is already
> >>> included in the bytesperline field.    
> >>
> >> Ack.
> >>  
> >>>     
> >>>>    
> >>>>> +
> >>>>> +	f->fmt.pix.pixelformat = V4L2_PIX_FMT_NV12;
> >>>>> +	f->fmt.pix.bytesperline = round_up(f->fmt.pix.width, 32);
> >>>>> +	f->fmt.pix.sizeimage =
> >>>>> +		f->fmt.pix.bytesperline * f->fmt.pix.height * 3 / 2;
> >>>>> +
> >>>>> +	return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int allegro_s_fmt_vid_out(struct file *file, void *fh,
> >>>>> +				 struct v4l2_format *f)
> >>>>> +{
> >>>>> +	struct allegro_channel *channel = fh_to_channel(fh);
> >>>>> +	int err;
> >>>>> +
> >>>>> +	err = allegro_try_fmt_vid_out(file, fh, f);
> >>>>> +	if (err)
> >>>>> +		return err;
> >>>>> +
> >>>>> +	channel->width = f->fmt.pix.width;
> >>>>> +	channel->height = f->fmt.pix.height;
> >>>>> +	channel->stride = f->fmt.pix.bytesperline;
> >>>>> +	channel->sizeimage_raw = f->fmt.pix.sizeimage;
> >>>>> +
> >>>>> +	channel->colorspace = f->fmt.pix.colorspace;
> >>>>> +	channel->ycbcr_enc = f->fmt.pix.ycbcr_enc;
> >>>>> +	channel->quantization = f->fmt.pix.quantization;
> >>>>> +	channel->xfer_func = f->fmt.pix.xfer_func;
> >>>>> +
> >>>>> +	channel->level =
> >>>>> +		select_minimum_h264_level(channel->width, channel->height);
> >>>>> +	channel->sizeimage_encoded =
> >>>>> +		estimate_stream_size(channel->width, channel->height);
> >>>>> +
> >>>>> +	return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int allegro_g_selection(struct file *file, void *priv,
> >>>>> +			       struct v4l2_selection *s)
> >>>>> +{
> >>>>> +	struct v4l2_fh *fh = file->private_data;
> >>>>> +	struct allegro_channel *channel = fh_to_channel(fh);
> >>>>> +
> >>>>> +	if (!V4L2_TYPE_IS_OUTPUT(s->type))
> >>>>> +		return -EINVAL;
> >>>>> +
> >>>>> +	switch (s->target) {
> >>>>> +	case V4L2_SEL_TGT_CROP:
> >>>>> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> >>>>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> >>>>> +		s->r.left = 0;
> >>>>> +		s->r.top = 0;
> >>>>> +		s->r.width = channel->width;
> >>>>> +		s->r.height = channel->height;      
> >>>>
> >>>> I don't think this is quite right. The CROP target should return the visible
> >>>> width/height (e.g. 1920x1080) whereas the other two targets should return the
> >>>> coded width/height (e.g. 1920x1088 when rounded to the macroblock alignment).
> >>>>
> >>>> Note: if the hardware doesn't require that the raw frame is macroblock aligned,
> >>>> then I need to think a bit more about how the selection handling should be
> >>>> done.    
> >>>
> >>> The driver internally calculates the coded width/height in macroblocks
> >>> and cropping and writes it to the SPS. Currently, this isn't exposed to
> >>> userspace, because I don't see a need to tell the userspace about that.
> >>>
> >>> If there is a reason to expose this to userspace, I am fine with
> >>> implementing that.    
> >>
> >> There really is no need for the selection API at all. Just drop both
> >> G and S_SELECTION from the driver. Let me know if the compliance test
> >> fails for drivers without selection support, I'll have to fix the test
> >> in that case.  
> > 
> > The compliance test for VIDIOC_S_FMT fails with the following message
> > if G_SELECTION is not implemented:
> > 
> >                 fail: v4l2-test-formats.cpp(836): sel.r.width != fmt.g_width()
> >         test VIDIOC_S_FMT: FAIL
> >   
> 
> Try this patch:
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Tested-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
> diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
> index fc497e3c..544ecb5c 100644
> --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
> @@ -828,7 +828,11 @@ static int testM2MFormats(struct node *node)
>  		.type = fmt.g_type(),
>  		.target = V4L2_SEL_TGT_CROP,
>  	};
> -	node->g_selection(sel);
> +	if (node->g_selection(sel) == ENOTTY) {
> +		fail_on_test(fmt_cap.g_width() != fmt.g_width());
> +		fail_on_test(fmt_cap.g_height() != fmt.g_height());
> +		return 0;
> +	}
>  	fail_on_test(sel.r.top || sel.r.left);
>  	fail_on_test(sel.r.width != fmt.g_width());
>  	fail_on_test(sel.r.height != fmt.g_height());
> ------------------------------------------------------------

Thanks. First I thought that it is strange to successfully finish the
test early and skip all remaining tests, but all remaining tests are
void anyway if g_selection is not implemented.

Michael

> 
> Regards,
> 
> 	Hans
> 
