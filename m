Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37C4816C3B1
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 15:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730478AbgBYOUs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 09:20:48 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:58479 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729386AbgBYOUs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 09:20:48 -0500
Received: from [IPv6:2001:420:44c1:2577:a473:ad6c:dd91:35d2]
 ([IPv6:2001:420:44c1:2577:a473:ad6c:dd91:35d2])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 6b4kjo3amyIme6b4nj8kae; Tue, 25 Feb 2020 15:20:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582640445; bh=uro/G468gVq4s0qPaUCwmi2FIvVWqfTUlRGdqwnvAjc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=VqOyUnOvNTTgan4mw4vSnp9cBvPYHkClQScLLE50qpJistrJlxOORPU6FxDxwRxEq
         E0JhMuae1p5px1McjqXgnAiMQ/sFe/7saxQu5GjedzQsAjp4Kabf3rCT03Lx+kUjpX
         K0tx/+K/uWbWsr5GAHjOaE7S6rNCPqZDif5UIk6WdZa2T2CulFupAAno+nFN1upuNc
         VjLiTAbVT+R9CxTnzBIuTDOLERGt5V4Xs7tTd6vbyIkXBIpPboUVrhDX29axFVXpLH
         Ch9EEEWzNYdFht+PNDyG3haaqfziKcRiwW4cDfBifz3JtwIMm8Y5eK2XgG+AhahtzC
         iIExTjJO8l9og==
Subject: Re: [PATCH 00/18] media: allegro: fixes and new features
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
References: <20200217151358.5695-1-m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8341c72a-4055-cdc1-099f-b5dbfcb7f472@xs4all.nl>
Date:   Tue, 25 Feb 2020 15:20:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217151358.5695-1-m.tretter@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEcM+v7OHjUX9TCaqsoVeCrnb8meTdL+xNOwiWpwo+Px7n6oTlKRHPuzKvdaLKNpJyUedLuS9rNgt2pX0Mji34FAzVMbkOrfMVrVEt9k9GJo2tpcg9H2
 kbuCVjL4SfPz+PSlcmKFZ15tEPMiTwpjpCooWGRYMvw5YXX3khb4jSqdLbvj7y9ypmruGx0lym+jalb5zOaXU0DEe4hHS0hYNg/je9OOYznn2xR6LEep865H
 XwlCX0nxhVuYYYluhSmHkZ7osKt447/w9OqrwbPvr9tqRDfOcejk+y1aHnEIiZ0dtCd2/NqUAaBYD06+77IG/iH7QK0fSBmoEYPypXFZMNivF9MCBiC3Riz+
 R0wbH6BhKUSPONzyYDV6hV/TmFEU+w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/17/20 4:13 PM, Michael Tretter wrote:
> Hello,
> 
> these are a several patches for the allegro-dvt driver that have piled up over
> the last few month while I was improving my understanding of the codec.
> 
> Patches 1 to 9 fix errors in the interaction with the mcu. This includes
> better interpretation of return values from the firmware, wrong fields in the
> mails, wrong values in the fields and an error when resetting the mcu.
> 
> Patches 10 to 14 wire up more controls and allow user space applications to
> control the framerate and the quality of the codec.
> 
> Patches 15 and 16 enable the firmware to take care of the buffer scheduling
> and allow more parallelism inside the firmware. Please have a close look at
> patch 16, because it changes the behavior of the driver to finish the m2m_job
> before the driver returns the v4l2_buffers.
> 
> Patches 17 and 18 start work to restructure how to create the mails that are
> sent to the firmware, because different firmware versions expect different
> mail formats and, thus, I need additional code to generate mails if I want to
> support different firmware versions.

Posted comments for patches 14 and 16. Also note the 'kbuild test robot' post for
patch 15.

I also get a number of warnings/checks when checkpatch.pl --strict over the
patch series (and even one ERROR). Some can be ignored, but there are others
that can be easily fixed with some reformatting.

Regards,

	Hans

> 
> This is the v4l-compliance test result:
> 
> v4l2-compliance SHA: b62d322d4401e6b6e5cbd78cedad9eb69dac1324, 64 bits, 64-bit time_t
> 
> Compliance test for allegro device /dev/video3:
> 
> Driver Info:
> 	Driver name      : allegro
> 	Card type        : Allegro DVT Video Encoder
> 	Bus info         : platform:a0009000.video-codec
> 	Driver version   : 5.6.0
> 	Capabilities     : 0x84208000
> 		Video Memory-to-Memory
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04208000
> 		Video Memory-to-Memory
> 		Streaming
> 		Extended Pix Format
> 	Detected Stateful Encoder
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
> 	test second /dev/video3 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> 	test invalid ioctls: OK
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 16 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 		warn: v4l2-test-formats.cpp(1329): S_PARM is supported for buftype 2, but not for ENUM_FRAMEINTERVALS
> 	test VIDIOC_G/S_PARM: OK
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> 	test blocking wait: OK
> 	Video Capture: Captured 59 buffers
> 	test MMAP (select): OK
> 	Video Capture: Captured 59 buffers
> 	test MMAP (epoll): OK
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for allegro device /dev/video3: 50, Succeeded: 50, Failed: 0, Warnings: 1
> 
> Michael
> 
> Michael Tretter (18):
>   media: allegro: print message on mcu error
>   media: allegro: fail encoding only on actual errors
>   media: allegro: fix type of gop_length in channel_create message
>   media: allegro: remove unknown39 field from create_channel
>   media: allegro: start a GOP with an IDR frame
>   media: allegro: fix calculation of CPB size
>   media: allegro: fix reset if WAKEUP has not been set properly
>   media: allegro: extract mcu and codec address calculation
>   media: allegro: warn if response message has an unexpected size
>   media: allegro: skip filler data if possible
>   media: allegro: make frame rate configurable
>   media: allegro: make QP configurable
>   media: allegro: read bitrate mode directly from control
>   media: allegro: handle dependency of bitrate and bitrate_peak
>   media: allegro: verify source and destination buffer in VCU response
>   media: allegro: pass buffers through firmware
>   media: allegro: move mail definitions to separate file
>   media: allegro: create new struct for channel parameters
> 
>  drivers/staging/media/allegro-dvt/Makefile    |   2 +-
>  .../staging/media/allegro-dvt/allegro-core.c  | 808 ++++++++++--------
>  .../staging/media/allegro-dvt/allegro-mail.c  |  37 +
>  .../staging/media/allegro-dvt/allegro-mail.h  | 267 ++++++
>  4 files changed, 738 insertions(+), 376 deletions(-)
>  create mode 100644 drivers/staging/media/allegro-dvt/allegro-mail.c
>  create mode 100644 drivers/staging/media/allegro-dvt/allegro-mail.h
> 

