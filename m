Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7017819C0E
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 12:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbfEJK6r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 06:58:47 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:60879 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727249AbfEJK6r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 06:58:47 -0400
Received: from [IPv6:2001:983:e9a7:1:2dea:e21e:760a:b215] ([IPv6:2001:983:e9a7:1:2dea:e21e:760a:b215])
        by smtp-cloud9.xs4all.net with ESMTPA
        id P3EhhdBCMsDWyP3Eihc3QZ; Fri, 10 May 2019 12:58:44 +0200
Subject: Re: [PATCH v5 4/5] [media] allegro: add Allegro DVT video IP core
 driver
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        dshah@xilinx.com, mchehab@kernel.org, robh+dt@kernel.org,
        kernel@pengutronix.de, tfiga@chromium.org
References: <20190503122010.16663-1-m.tretter@pengutronix.de>
 <20190503122010.16663-5-m.tretter@pengutronix.de>
 <0d15e216-7e10-eb55-1957-32be1c48f461@xs4all.nl>
 <20190510122819.3a978105@litschi.hi.pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f9136e3a-6592-7198-b4fb-75664a8b653e@xs4all.nl>
Date:   Fri, 10 May 2019 12:58:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510122819.3a978105@litschi.hi.pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIOAviVBUnqILB9b2x2UUsTsYEmLcfU1GyXN2Z3lOUTClaTmQQ5S21/yGO2skSgV3GpC04dB9OpuBp9mhSJ6nqdj/FTcNt7K645lBvV7uWXpGcfZ34L6
 Y8df6uS4tYrol9Oa6vCyAy0fkSPmxvKXuKDGdzNWnap3meOvLyLGvCirb2J4nh+7A3xNO37WezMa47pgIOBSR3FrEO1W2iONoj918OflxP6jD3/SkLBN2kRA
 N2xXY9c8NXoaZBFnD0H4Dy6dUMRNPVtl+94DHZdbr7s5ta3IPjLzC7Ew7rFcS28U80VcUu10IeHrmFyTdFEK+CeAqEwduMk3Wkc5TBDHVNtPUJP4kLsSzR2A
 vgIOxR4ok7Su2EehrVaFjz3beW1KTVqL4dppb7XaHMO4Ack40b5Kzkz617ulgbFj5Z2t3w9hCFGCpuGF55Uf2MYsMYXHKBLLXkb+G+6zzKGL+c6WYWZ6ooDP
 YGJHq9s46hjg/TfdzWz+wJDaXV185larDQzXeA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/10/19 12:28 PM, Michael Tretter wrote:
> On Fri, 10 May 2019 10:28:53 +0200, Hans Verkuil wrote:
>> On 5/3/19 2:20 PM, Michael Tretter wrote:
>>> Add a V4L2 mem-to-mem driver for Allegro DVT video IP cores as found in
>>> the EV family of the Xilinx ZynqMP SoC. The Zynq UltraScale+ Device
>>> Technical Reference Manual uses the term VCU (Video Codec Unit) for the
>>> encoder, decoder and system integration block.
>>>
>>> This driver takes care of interacting with the MicroBlaze MCU that
>>> controls the actual IP cores. The IP cores and MCU are integrated in the
>>> FPGA. The xlnx_vcu driver is responsible for configuring the clocks and
>>> providing information about the codec configuration.
>>>
>>> The driver currently only supports the H.264 video encoder.
>>>
>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>> ---

<snip>

>>> +static int allegro_try_fmt_vid_out(struct file *file, void *fh,
>>> +				   struct v4l2_format *f)
>>> +{
>>> +	f->fmt.pix.field = V4L2_FIELD_NONE;
>>> +
>>> +	f->fmt.pix.width = clamp_t(__u32, f->fmt.pix.width,
>>> +				   ALLEGRO_WIDTH_MIN, ALLEGRO_WIDTH_MAX);
>>> +	f->fmt.pix.height = clamp_t(__u32, f->fmt.pix.height,
>>> +				    ALLEGRO_HEIGHT_MIN, ALLEGRO_HEIGHT_MAX);  
>>
>> Shouldn't this be rounded up to the macroblock size? Or is the encoder
>> smart enough to do the padding internally?
> 
> The driver sends a message with the visible size of the raw frames
> (without macroblock alignment) to the encoder firmware. Therefore, the
> encoder firmware is responsible for handling the padding to macroblock
> size.

Please add a comment describing this. It is unusual for encoders to be
able to do this so it is good to document this.

> 
> Furthermore, the encoder requires that the stride is 32 byte aligned.
> Therefore, we naturally have a macroblock alignment regarding the
> width, but not regarding the height. This limitation is already
> included in the bytesperline field.

Ack.

> 
>>
>>> +
>>> +	f->fmt.pix.pixelformat = V4L2_PIX_FMT_NV12;
>>> +	f->fmt.pix.bytesperline = round_up(f->fmt.pix.width, 32);
>>> +	f->fmt.pix.sizeimage =
>>> +		f->fmt.pix.bytesperline * f->fmt.pix.height * 3 / 2;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int allegro_s_fmt_vid_out(struct file *file, void *fh,
>>> +				 struct v4l2_format *f)
>>> +{
>>> +	struct allegro_channel *channel = fh_to_channel(fh);
>>> +	int err;
>>> +
>>> +	err = allegro_try_fmt_vid_out(file, fh, f);
>>> +	if (err)
>>> +		return err;
>>> +
>>> +	channel->width = f->fmt.pix.width;
>>> +	channel->height = f->fmt.pix.height;
>>> +	channel->stride = f->fmt.pix.bytesperline;
>>> +	channel->sizeimage_raw = f->fmt.pix.sizeimage;
>>> +
>>> +	channel->colorspace = f->fmt.pix.colorspace;
>>> +	channel->ycbcr_enc = f->fmt.pix.ycbcr_enc;
>>> +	channel->quantization = f->fmt.pix.quantization;
>>> +	channel->xfer_func = f->fmt.pix.xfer_func;
>>> +
>>> +	channel->level =
>>> +		select_minimum_h264_level(channel->width, channel->height);
>>> +	channel->sizeimage_encoded =
>>> +		estimate_stream_size(channel->width, channel->height);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int allegro_g_selection(struct file *file, void *priv,
>>> +			       struct v4l2_selection *s)
>>> +{
>>> +	struct v4l2_fh *fh = file->private_data;
>>> +	struct allegro_channel *channel = fh_to_channel(fh);
>>> +
>>> +	if (!V4L2_TYPE_IS_OUTPUT(s->type))
>>> +		return -EINVAL;
>>> +
>>> +	switch (s->target) {
>>> +	case V4L2_SEL_TGT_CROP:
>>> +	case V4L2_SEL_TGT_CROP_DEFAULT:
>>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
>>> +		s->r.left = 0;
>>> +		s->r.top = 0;
>>> +		s->r.width = channel->width;
>>> +		s->r.height = channel->height;  
>>
>> I don't think this is quite right. The CROP target should return the visible
>> width/height (e.g. 1920x1080) whereas the other two targets should return the
>> coded width/height (e.g. 1920x1088 when rounded to the macroblock alignment).
>>
>> Note: if the hardware doesn't require that the raw frame is macroblock aligned,
>> then I need to think a bit more about how the selection handling should be
>> done.
> 
> The driver internally calculates the coded width/height in macroblocks
> and cropping and writes it to the SPS. Currently, this isn't exposed to
> userspace, because I don't see a need to tell the userspace about that.
> 
> If there is a reason to expose this to userspace, I am fine with
> implementing that.

There really is no need for the selection API at all. Just drop both
G and S_SELECTION from the driver. Let me know if the compliance test
fails for drivers without selection support, I'll have to fix the test
in that case.

> 
>>
>>> +		break;
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int allegro_s_selection(struct file *file, void *priv,
>>> +			       struct v4l2_selection *s)
>>> +{
>>> +	return -EINVAL;
>>> +}  
>>
>> You have to implement setting the CROP target for an encoder. Otherwise
>> you cannot tell the encoder what the visible width/height should be.
>>
>> Just setting the format to 1920x1080 will actually return 1920x1088 and
>> set the visible width/height to that as well as per the encoder spec.
>>
>> So applications have to call S_SELECTION afterwards to make sure the
>> visible rectangle is set correctly.
>>
>> Note that the compliance test in my vicodec branch doesn't check for this
>> (yet). It's still work in progress :-)
> 
> Agreed, if I actually need to align the size to macroblocks. If not, I
> could support S_SELECTION by adjusting the SPS, but I understand that
> it is not required by the spec.


>>> +static int allegro_enum_framesizes(struct file *file, void *fh,
>>> +				   struct v4l2_frmsizeenum *fsize)
>>> +{
>>> +	switch (fsize->pixel_format) {
>>> +	case V4L2_PIX_FMT_H264:
>>> +	case V4L2_PIX_FMT_NV12:
>>> +		break;
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (fsize->index)
>>> +		return -EINVAL;
>>> +
>>> +	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
>>> +	fsize->stepwise.min_width = ALLEGRO_WIDTH_MIN;
>>> +	fsize->stepwise.max_width = ALLEGRO_WIDTH_MAX;
>>> +	fsize->stepwise.step_width = 1;
>>> +	fsize->stepwise.min_height = ALLEGRO_HEIGHT_MIN;
>>> +	fsize->stepwise.max_height = ALLEGRO_HEIGHT_MAX;
>>> +	fsize->stepwise.step_height = 1;  
>>
>> I would expect this to be STEPWISE with the macroblock size as
>> the step size.

Based on your HW capabilities you can ignore this comment as well.

>>
>>> +
>>> +	return 0;
>>> +}

Regards,

	Hans
