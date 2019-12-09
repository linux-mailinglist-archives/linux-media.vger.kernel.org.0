Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1E58116CF1
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 13:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbfLIMUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 07:20:35 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41478 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbfLIMUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 07:20:34 -0500
Received: by mail-wr1-f68.google.com with SMTP id c9so15960370wrw.8
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2019 04:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IEnxe+vNcQIIOdbQCJdw7H0NnUMN0YCJx2d0b7iRXO0=;
        b=Pqljb8jOEfj4sQBHVKTQXybiKxMVaV5vjMy5yi+GY+yhURsWcKv7OjWFCYxLSG6Y3W
         UEvf9/lFK0yQK6pmOabG/vZxgTMJ6xx4bdujdsexpBLtoU0KkRMfCM80xbYJSvNv9Z2u
         yuPT32CwBMLWPrCv6TQ4W0y9TgByZM+WCdss/AzshsMXUZyBNpY+6cKtcljD7V+J453y
         2ASGjh/GfZkofRCbs2dwdJMupJ38m9cAus561DOzswwSW9HxfwZrUjc+DuoHa4U/mXhW
         HNktOMFf9pmBl7Zm48qir7a57CH4j9XOMs7miOFR9GHg6kGCSBFyVoBZMgFLaxwktzFx
         LTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IEnxe+vNcQIIOdbQCJdw7H0NnUMN0YCJx2d0b7iRXO0=;
        b=U8FOHqtvowapEk8QfF6Ys1s5EdGF9XXstxyECPxlNZRMdgd9jmEb2FsAyJQzo2JYd8
         CJaehvBHjuocbKIcOoKXNZhi2y8O5m8VzdG6+f2eIRPw3SXouL0la49lTl6RdXAx6rXb
         aG3kDx2dHP/tP1u/c8nD1Sk6cxJT3FmcXv9Iu7MBQ4IHSLrXOlbhV7/zL3dQoYRbT3Ro
         Zo5FeiJJPCbaaEIGLZnPiVb4OgPyHHyplDYW+LNf42uQucHnenhJyXQKZNgEQoOuAi+H
         sBol1o6qf3/bCuOspyrbYFNftTUP6569HlmtG9+BL1MCQsElWQGD/TtrHo6/b6D6Yset
         8FmA==
X-Gm-Message-State: APjAAAVekTWS1S46gTjstJq+MkP9zPE9lkSLHtWYy9lhXLNz3z7Q6obn
        KvqEav/kVPlRteCnKVC1paEexQ==
X-Google-Smtp-Source: APXvYqz98vZuBLcYM8ZhXEFLZRBpSVxQYrHtGSxeVi7XEoSvipKy6w4NOibAIPpPXKO6wM9o6T6cYQ==
X-Received: by 2002:a5d:4204:: with SMTP id n4mr1876656wrq.123.1575894031025;
        Mon, 09 Dec 2019 04:20:31 -0800 (PST)
Received: from bender.baylibre.local (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id u18sm27066949wrt.26.2019.12.09.04.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 04:20:30 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] media: meson: vdec: Add compliant H264 support
Date:   Mon,  9 Dec 2019 13:20:24 +0100
Message-Id: <20191209122028.13714-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series aims to bring H.264 support as well as compliance update
to the amlogic stateful video decoder driver.

The issue in the V1 patchset at [1] is solved by patch #1 following comments
and requirements from hans. It moves the full draining & stopped state tracking
and handling from vicodec to core v4l2-mem2mem.

With this, it passes v4l2-compliance with streaming on Amlogic G12A and
Amlogic SM1 SoCs successfully.

This patchset depends on G12A and SM1 enablement series at [2] and [3].

The compliance log is:
# v4l2-compliance --stream-from-hdr test-25fps.h264.hdr -s
v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits

Compliance test for vicodec device /dev/video0:

Driver Info:
	Driver name      : vicodec
	Card type        : vicodec
	Bus info         : platform:vicodec
	Driver version   : 5.5.0
	Capabilities     : 0x84208000
		Video Memory-to-Memory
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04208000
		Video Memory-to-Memory
		Streaming
		Extended Pix Format
	Detected Stateful Encoder
Media Driver Info:
	Driver name      : vicodec
	Model            : vicodec
	Serial           : 
	Bus info         : platform:vicodec
	Media version    : 5.5.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.5.0
Interface Info:
	ID               : 0x0300000c
	Type             : V4L Video
Entity Info:
	ID               : 0x00000001 (1)
	Name             : stateful-encoder-source
	Function         : V4L2 I/O
	Pad 0x01000002   : 0: Source
	  Link 0x02000008: to remote pad 0x1000005 of entity 'stateful-encoder-proc': Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

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

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 6 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	Video Capture: Captured 60 buffers                
	test MMAP (select): OK
	Video Capture: Captured 60 buffers                
	test MMAP (epoll): OK
	Video Capture: Captured 60 buffers                
	test USERPTR (select): OK
	test DMABUF: Cannot test, specify --expbuf-device

Total for vicodec device /dev/video0: 50, Succeeded: 50, Failed: 0, Warnings: 0

Changes since v2 at [4]:
- Move full draining & stopped state tracking into core v4l2-mem2mem
- Adapt vicodec to use the core v4l2-mem2mem draining & stopped state tracking

Changes since v1 at [1]:
- fixed output_size is never used reported by hans
- rebased on G12A and SM1 patches
- added handling of qbuf after STREAMON and STOP before enought buffer queued

[1] https://lore.kernel.org/linux-media/20191007145909.29979-1-mjourdan@baylibre.com
[2] https://lore.kernel.org/linux-media/20191205153408.26500-1-narmstrong@baylibre.com
[3] https://lore.kernel.org/linux-media/20191121101429.23831-1-narmstrong@baylibre.com
[4] https://lore.kernel.org/linux-media/20191126093733.32404-1-narmstrong@baylibre.com

Maxime Jourdan (2):
  media: meson: vdec: bring up to compliance
  media: meson: vdec: add H.264 decoding support

Neil Armstrong (2):
  media: v4l2-mem2mem: handle draining, stopped and next-buf-is-last
    states
  media: vicodec: use v4l2-mem2mem draining, stopped and
    next-buf-is-last states handling

 drivers/media/platform/vicodec/vicodec-core.c | 154 ++----
 drivers/media/v4l2-core/v4l2-mem2mem.c        | 174 ++++++-
 drivers/staging/media/meson/vdec/Makefile     |   2 +-
 drivers/staging/media/meson/vdec/codec_h264.c | 482 ++++++++++++++++++
 drivers/staging/media/meson/vdec/codec_h264.h |  14 +
 drivers/staging/media/meson/vdec/esparser.c   |  58 +--
 drivers/staging/media/meson/vdec/vdec.c       |  92 ++--
 drivers/staging/media/meson/vdec/vdec.h       |  14 +-
 .../staging/media/meson/vdec/vdec_helpers.c   |  85 ++-
 .../staging/media/meson/vdec/vdec_helpers.h   |   6 +-
 .../staging/media/meson/vdec/vdec_platform.c  |  71 +++
 include/media/v4l2-mem2mem.h                  |  87 ++++
 12 files changed, 1009 insertions(+), 230 deletions(-)
 create mode 100644 drivers/staging/media/meson/vdec/codec_h264.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_h264.h

-- 
2.22.0

