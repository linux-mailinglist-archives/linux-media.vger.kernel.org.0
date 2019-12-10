Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21743117E77
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 04:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbfLJDmf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 22:42:35 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:44367 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbfLJDmf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 22:42:35 -0500
Received: by mail-qt1-f195.google.com with SMTP id g17so1459536qtp.11
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2019 19:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HSkbHsLsaqfQDr/Qigk/MgThmH429gWM5QAZfrurbHg=;
        b=AIVWunWPK5LW9THdKlTLo/WzQvKZZ2EqSyz58pgGOfu5PSMm3SUsXm585KE3McK6hu
         Lz27O7Ve1HGXIO66jt+jzI1AQ8w4hwQJ+BUNgVa8hHpKbXXRnMIomcu7fQ/qj1v0AkVx
         Ud7tLGzFoB/I0EEm6ScN8/bkeKdjLo6mxwqYnh1so7ve2YT6EQ3MZUeC2LKl6ywGf1K0
         L4b80SW7JagXi8GtTLgUQXVacQ1yR3l2r3BLaUUrCReIVnrFLeh6FhiDfwt8Fy+oVHel
         AyD39csnZjWmaxZJg0ijrmopIvQcrNLltdR8vpZedWVD20gBt2zyHForNixroxvr2MHU
         kA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HSkbHsLsaqfQDr/Qigk/MgThmH429gWM5QAZfrurbHg=;
        b=UkExt6D8mPC49H6Xg2nl6J8biIozGAZ+JtKKsEJ5qJGN7cRWYbO9nv7/yGi391emws
         wuv350m4y4J45MF4TlQNnzMSin/V0eYqiHIHK7OznxwZ/E7KV1QBPaJh9nWVI5rPcFZg
         Via3mfKMMWdIwyrINH9GOO4CkHxrAJbqvt2TFzzgQ/QJvKccFL/Bt2H9wGKIsE8Pkd2y
         k9nhDcbhAxwjYALAYscjwWUPq35Sxcsh6twE0GHGXdzYmjV7bQRwOduMkahx/DWbXT2f
         SpKlLLuxCL0K4ddzFqxLiqdsbeQqhsIiJLZfd2PNqbNRAAO+e89USGUQy+mtp0c3l9Be
         rErQ==
X-Gm-Message-State: APjAAAWEHE6p8Hk14BoI60KI5k+dWHSovDs1mvWo+IWQ9wcFvH7CF/5V
        hnrHw6pidh5/Ue92CAFhmhCfqg==
X-Google-Smtp-Source: APXvYqyacWiSW20TRcPBrAZJpXpXZOit1js32GRkn/LlvYq9Pp4PQdj4OqUPdlH8mrwsZGwXkwD8mQ==
X-Received: by 2002:aed:33a3:: with SMTP id v32mr28458752qtd.269.1575949353549;
        Mon, 09 Dec 2019 19:42:33 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id o19sm683827qtb.43.2019.12.09.19.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 19:42:32 -0800 (PST)
Message-ID: <89908b9f9ae974b23f7ba05ff658c3860bfbba88.camel@ndufresne.ca>
Subject: Re: [PATCH v3 0/4] media: meson: vdec: Add compliant H264 support
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Mon, 09 Dec 2019 22:42:30 -0500
In-Reply-To: <20191209122028.13714-1-narmstrong@baylibre.com>
References: <20191209122028.13714-1-narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1 (3.34.1-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le lundi 09 décembre 2019 à 13:20 +0100, Neil Armstrong a écrit :
> Hello,
> 
> This patch series aims to bring H.264 support as well as compliance update
> to the amlogic stateful video decoder driver.

I have started testing this patchset on S905X. I'm not very far into it
yet, but noticed this spam in the kernel logs:

[  192.230935] meson-vdec c8820000.video-codec: VIFIFO usage (16777858) > VIFIFO size (16777216)

So far it seems to be printed once per frame while decoding
bbb_sunflower_1080p_30fps_normal.mp4 from blender fondation. I'm don't
think I have ever seen that one before.

> 
> The issue in the V1 patchset at [1] is solved by patch #1 following comments
> and requirements from hans. It moves the full draining & stopped state tracking
> and handling from vicodec to core v4l2-mem2mem.
> 
> With this, it passes v4l2-compliance with streaming on Amlogic G12A and
> Amlogic SM1 SoCs successfully.
> 
> This patchset depends on G12A and SM1 enablement series at [2] and [3].
> 
> The compliance log is:
> # v4l2-compliance --stream-from-hdr test-25fps.h264.hdr -s
> v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits
> 
> Compliance test for vicodec device /dev/video0:
> 
> Driver Info:
> 	Driver name      : vicodec
> 	Card type        : vicodec
> 	Bus info         : platform:vicodec
> 	Driver version   : 5.5.0
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
> Media Driver Info:
> 	Driver name      : vicodec
> 	Model            : vicodec
> 	Serial           : 
> 	Bus info         : platform:vicodec
> 	Media version    : 5.5.0
> 	Hardware revision: 0x00000000 (0)
> 	Driver version   : 5.5.0
> Interface Info:
> 	ID               : 0x0300000c
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x00000001 (1)
> 	Name             : stateful-encoder-source
> 	Function         : V4L2 I/O
> 	Pad 0x01000002   : 0: Source
> 	  Link 0x02000008: to remote pad 0x1000005 of entity 'stateful-encoder-proc': Data, Enabled, Immutable
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
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
> 	Standard Controls: 6 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK
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
> 	Video Capture: Captured 60 buffers                
> 	test MMAP (select): OK
> 	Video Capture: Captured 60 buffers                
> 	test MMAP (epoll): OK
> 	Video Capture: Captured 60 buffers                
> 	test USERPTR (select): OK
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for vicodec device /dev/video0: 50, Succeeded: 50, Failed: 0, Warnings: 0
> 
> Changes since v2 at [4]:
> - Move full draining & stopped state tracking into core v4l2-mem2mem
> - Adapt vicodec to use the core v4l2-mem2mem draining & stopped state tracking
> 
> Changes since v1 at [1]:
> - fixed output_size is never used reported by hans
> - rebased on G12A and SM1 patches
> - added handling of qbuf after STREAMON and STOP before enought buffer queued
> 
> [1] https://lore.kernel.org/linux-media/20191007145909.29979-1-mjourdan@baylibre.com
> [2] https://lore.kernel.org/linux-media/20191205153408.26500-1-narmstrong@baylibre.com
> [3] https://lore.kernel.org/linux-media/20191121101429.23831-1-narmstrong@baylibre.com
> [4] https://lore.kernel.org/linux-media/20191126093733.32404-1-narmstrong@baylibre.com
> 
> Maxime Jourdan (2):
>   media: meson: vdec: bring up to compliance
>   media: meson: vdec: add H.264 decoding support
> 
> Neil Armstrong (2):
>   media: v4l2-mem2mem: handle draining, stopped and next-buf-is-last
>     states
>   media: vicodec: use v4l2-mem2mem draining, stopped and
>     next-buf-is-last states handling
> 
>  drivers/media/platform/vicodec/vicodec-core.c | 154 ++----
>  drivers/media/v4l2-core/v4l2-mem2mem.c        | 174 ++++++-
>  drivers/staging/media/meson/vdec/Makefile     |   2 +-
>  drivers/staging/media/meson/vdec/codec_h264.c | 482 ++++++++++++++++++
>  drivers/staging/media/meson/vdec/codec_h264.h |  14 +
>  drivers/staging/media/meson/vdec/esparser.c   |  58 +--
>  drivers/staging/media/meson/vdec/vdec.c       |  92 ++--
>  drivers/staging/media/meson/vdec/vdec.h       |  14 +-
>  .../staging/media/meson/vdec/vdec_helpers.c   |  85 ++-
>  .../staging/media/meson/vdec/vdec_helpers.h   |   6 +-
>  .../staging/media/meson/vdec/vdec_platform.c  |  71 +++
>  include/media/v4l2-mem2mem.h                  |  87 ++++
>  12 files changed, 1009 insertions(+), 230 deletions(-)
>  create mode 100644 drivers/staging/media/meson/vdec/codec_h264.c
>  create mode 100644 drivers/staging/media/meson/vdec/codec_h264.h
> 

