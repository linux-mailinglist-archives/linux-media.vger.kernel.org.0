Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBB6B2D1814
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 19:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgLGSCS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 13:02:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgLGSCS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 13:02:18 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46B30C061749
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 10:01:32 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id n26so20763828eju.6
        for <linux-media@vger.kernel.org>; Mon, 07 Dec 2020 10:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O7OfS8xY2H3vDNXVNJl1Oef0RtYD5eKw240jYjS6XxI=;
        b=NYLOjtyLcGke9omfLNZH62t9QFHxi6+RAGnnOT51SYBrQpLEJHhojjbu3LLHU1qKko
         fnj+CuoZhe4Kt/oGddVslfManAap9AwbIT2SEWn0VTjrqhl7vuiLOas4XKwpbMJRTXV/
         iPXiKGrTITFFIXk3q79acbHn4tmd7IhU0G9tBuxet07/CYDGNERS/ksiau5bxTa0yg9j
         NbxseWmQbaefV628Stc8X0PvAwwS8Uy52vGUTwO0LPXCS8eZkQJiuH+O/4AZcVLaWyff
         Z5BxHHmrhnsLSJQI1Pa3RoHddCrW3rrdc0pgEbr9RDOAwpAWhuLrJkSlETWa3dhO+bvP
         u6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=O7OfS8xY2H3vDNXVNJl1Oef0RtYD5eKw240jYjS6XxI=;
        b=EHXNL9PZYUkU0KjjDRWBy/kSyrUJUPPaJ4g9QEkCgE6zPvKxKwxDDJ11Ly4MiJmuo2
         oiNpGFv5S3x8CbVVfQcrdK5bLGlqYNVa1K/1ieRkquFHGZ7K0n9t16qY58yn2ceR721F
         /7KOXdmorNP8559Z9o68vYREU24/60J4X+BIu6QQ2HaYBFULZozT8h4HUznzZLGzZy2a
         JcAXLyd/9SoDeI1hKTwBXE23+cDIeBZ/dbeLuiN8p8dD4SijPdr6xWSQiTsIgqgWeKk4
         BICrZy20ekYO6Y/0oye/xQyuWpifHRIU2e2R9NCk/WBtSowd8HD8kUIWLls3eniAol/K
         S+Kg==
X-Gm-Message-State: AOAM5300EyHVaqec4dvomys5gGp1lYUkgnZt2yhW0lhJLKQgYwMWxNY2
        NU0M5EYJSKaNDI29jQjBF0cX16l2d9A=
X-Google-Smtp-Source: ABdhPJy0BRKkdanTJ6X4euqnrBkXdLPw8/H7ftWB6xlEY0pfbQYQzoQJkEd92rfN4+KFnI9yT61g7Q==
X-Received: by 2002:a17:906:a8e:: with SMTP id y14mr17795456ejf.47.1607364090964;
        Mon, 07 Dec 2020 10:01:30 -0800 (PST)
Received: from localhost (p200300d1ff007e00856c8d61f828fe5b.dip0.t-ipconnect.de. [2003:d1:ff00:7e00:856c:8d61:f828:fe5b])
        by smtp.gmail.com with ESMTPSA id bn21sm11038896ejb.47.2020.12.07.10.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 10:01:30 -0800 (PST)
Date:   Mon, 7 Dec 2020 19:01:28 +0100
From:   Sebastian Fricke <sebastian.fricke.linux@gmail.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com
Subject: Re: [PATCH] media: rkisp1: Add the enum_frame_size ioctl
Message-ID: <20201207180128.35o7rezfm3yoavdd@basti.Speedport_W_724V_Typ_A_05011603_06_001>
Reply-To: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
References: <20201206053935.24028-1-sebastian.fricke.linux@gmail.com>
 <f430e612-0583-9ee2-3d91-349e90bdfe20@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <f430e612-0583-9ee2-3d91-349e90bdfe20@collabora.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07.12.2020 08:33, Helen Koike wrote:
>Hi Sebastian,
>
>Thanks for your patch.

Hello Helen,

I am very grateful for your review.

>
>On 12/6/20 2:39 AM, Sebastian Fricke wrote:
>> Implement the VIDIOC_SUBDEV_ENUM_FRAME_SIZE ioctl, check if the mbus
>> code is valid for the given pad. This call is not available for the
>> parameter or metadata pads of the RkISP1.
>>
>> Signed-off-by: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
>> ---
>>
>> I have tested this patch with the following script:
>> https://github.com/initBasti/Linux_kernel_media_tree_fork/commit/efc4b399cff53fb36fadde999594961a3d84073e
>>
>> The results on my NanoPC-T4 (Linux nanopct4 5.10.0-rc6-rockchip64):
>>
>> pad 0 = RKISP1_ISP_PAD_SINK_VIDEO
>> pad 1 = RKISP1_ISP_PAD_SINK_PARAMS
>> pad 2 = RKISP1_ISP_PAD_SOURCE_VIDEO
>> pad 3 = RKISP1_ISP_PAD_SOURCE_STATS
>>
>> basti@nanopct4:~$ python3 rkisp1_enum_frame_size_test.py
>> TEST  0: pad 0 - code 0x300f - size 32x32 - 4032x3024
>> TEST  1: pad 0 - code 0x3007 - size 32x32 - 4032x3024
>> TEST  2: pad 0 - code 0x300e - size 32x32 - 4032x3024
>> TEST  3: pad 0 - code 0x300a - size 32x32 - 4032x3024
>> TEST  4: pad 0 - code 0x3012 - size 32x32 - 4032x3024
>> TEST  5: pad 0 - code 0x3008 - size 32x32 - 4032x3024
>> TEST  6: pad 0 - code 0x3010 - size 32x32 - 4032x3024
>> TEST  7: pad 0 - code 0x3011 - size 32x32 - 4032x3024
>> TEST  8: pad 0 - code 0x3014 - size 32x32 - 4032x3024
>> TEST  9: pad 0 - code 0x3001 - size 32x32 - 4032x3024
>> TEST 10: pad 0 - code 0x3013 - size 32x32 - 4032x3024
>> TEST 11: pad 0 - code 0x3002 - size 32x32 - 4032x3024
>> TEST 12: pad 0 - code 0x2011 - size 32x32 - 4032x3024
>> TEST 13: pad 0 - code 0x2012 - size 32x32 - 4032x3024
>> TEST 14: pad 0 - code 0x200f - size 32x32 - 4032x3024
>> TEST 15: pad 0 - code 0x2010 - size 32x32 - 4032x3024
>> TEST 16: pad 1 - code 0x7001 - size /
>> TEST 17: pad 2 - code 0x2008 - size 32x32 - 4032x3024
>> TEST 18: pad 2 - code 0x300f - size 32x32 - 4032x3024
>> TEST 19: pad 2 - code 0x3007 - size 32x32 - 4032x3024
>> TEST 20: pad 2 - code 0x300e - size 32x32 - 4032x3024
>> TEST 21: pad 2 - code 0x300a - size 32x32 - 4032x3024
>> TEST 22: pad 2 - code 0x3012 - size 32x32 - 4032x3024
>> TEST 23: pad 2 - code 0x3008 - size 32x32 - 4032x3024
>> TEST 24: pad 2 - code 0x3010 - size 32x32 - 4032x3024
>> TEST 25: pad 2 - code 0x3011 - size 32x32 - 4032x3024
>> TEST 26: pad 2 - code 0x3014 - size 32x32 - 4032x3024
>> TEST 27: pad 2 - code 0x3001 - size 32x32 - 4032x3024
>> TEST 28: pad 2 - code 0x3013 - size 32x32 - 4032x3024
>> TEST 29: pad 2 - code 0x3002 - size 32x32 - 4032x3024
>> TEST 30: pad 3 - code 0x7001 - size /
>> TEST 31: pad 0 - code 0xdead - size / (test with an invalid media bus code)
>> TEST 32: pad 6 - code 0x300f - size / (test with an invalid pad)
>> TEST 33: pad 0 - code 0x2008 - size / (test with a format that is not supported by the pad)
>> TEST 34: pad 2 - code 0x2010 - size / (test with a format that is not supported by the pad)
>
>Could you please also run v4l2-compliance ?

Yes, it finished without errors here is the output.

Greetings,
Sebastian

---

basti@nanopct4:~$ v4l2-compliance 
v4l2-compliance 1.21.0-4683, 64 bits, 64-bit time_t
v4l2-compliance SHA: 0aee9991e0c0 2020-12-01 09:48:02

Compliance test for rkisp1 device /dev/video0:

Driver Info:
	Driver name      : rkisp1
	Card type        : rkisp1
	Bus info         : platform:rkisp1
	Driver version   : 5.10.0
	Capabilities     : 0xa4201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : rkisp1
	Model            : rkisp1
	Serial           :
	Bus info         : platform:rkisp1
	Media version    : 5.10.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.10.0
Interface Info:
	ID               : 0x0300000d
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000c (12)
	Name             : rkisp1_mainpath
	Function         : V4L2 I/O
	Pad 0x0100000f   : 0: Sink
	  Link 0x02000022: from remote pad 0x1000008 of entity 'rkisp1_resizer_mainpath': Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

	test invalid ioctls: OK
Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for rkisp1 device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 0

>
>>
>> ---
>>
>>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 39 +++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>> index 889982d8ca41..fa7540155d71 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>> @@ -599,6 +599,44 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
>>
>>  	return -EINVAL;
>>  }
>
>Please add a new line here
>
>> +static int rkisp1_isp_enum_frame_size(struct v4l2_subdev *sd,
>> +				      struct v4l2_subdev_pad_config *cfg,
>> +				      struct v4l2_subdev_frame_size_enum *fse)
>> +{
>> +	int i;
>
>unsigned
>
>> +	bool code_match = false;
>> +
>> +	if (fse->pad == RKISP1_ISP_PAD_SINK_PARAMS ||
>> +	    fse->pad == RKISP1_ISP_PAD_SOURCE_STATS)
>> +		return -EINVAL;
>
>
>
>> +
>> +	if (fse->index > 0)> +		return -EINVAL;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(rkisp1_isp_formats); i++) {
>> +		const struct rkisp1_isp_mbus_info *fmt = &rkisp1_isp_formats[i];
>
>Can't you use function rkisp1_isp_mbus_info_get() ?
>
>Check how rkisp1_isp_set_src_fmt() checks for a valid mbus code.
>
>Thanks
>Helen
>
>> +
>> +		if (fmt->mbus_code == fse->code) {
>> +			code_match = true;
>> +			if (!(fmt->direction & RKISP1_ISP_SD_SINK) &&
>> +			    fse->pad == RKISP1_ISP_PAD_SINK_VIDEO)
>> +				return -EINVAL;
>> +			if (!(fmt->direction & RKISP1_ISP_SD_SRC) &&
>> +			    fse->pad == RKISP1_ISP_PAD_SOURCE_VIDEO)
>> +				return -EINVAL;
>> +		}
>> +	}
>> +
>> +	if (!code_match)
>> +		return -EINVAL;
>> +
>> +	fse->min_width = RKISP1_ISP_MIN_WIDTH;
>> +	fse->max_width = RKISP1_ISP_MAX_WIDTH;
>> +	fse->min_height = RKISP1_ISP_MIN_HEIGHT;
>> +	fse->max_height = RKISP1_ISP_MAX_HEIGHT;
>> +
>> +	return 0;
>> +}
>>
>>  static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
>>  				  struct v4l2_subdev_pad_config *cfg)
>> @@ -880,6 +918,7 @@ static int rkisp1_subdev_link_validate(struct media_link *link)
>>
>>  static const struct v4l2_subdev_pad_ops rkisp1_isp_pad_ops = {
>>  	.enum_mbus_code = rkisp1_isp_enum_mbus_code,
>> +	.enum_frame_size = rkisp1_isp_enum_frame_size,
>>  	.get_selection = rkisp1_isp_get_selection,
>>  	.set_selection = rkisp1_isp_set_selection,
>>  	.init_cfg = rkisp1_isp_init_config,
>>
