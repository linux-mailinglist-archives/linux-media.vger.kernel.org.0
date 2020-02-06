Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A95015408A
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 09:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbgBFImW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 03:42:22 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40572 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727922AbgBFIl6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 03:41:58 -0500
Received: by mail-wm1-f68.google.com with SMTP id t14so5903771wmi.5
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2020 00:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RJqvynypNN2lA8IbNpaHHyxr5Ke0vEOMiboIN4OzW30=;
        b=EWUmgWyYbs4rAFCAzmHJdrqGef/4kVGKIJZJFjPkDLKnJUx3XRmTnA13kqXJfQuwMI
         svu35jlwowRUG+Dgdnxf2rti2CNYK308GJJhtFluIiuS5ndAEWJ9bpkzQXQoNYap7TW6
         K5/Hs3ilY6TyGtFdZU/6pVwf1cJtZQLz67vjSXzQTy2m2icJwSn4jgb9MamPNXM52Udj
         Zib81AptNFkyIiKzrVklvsXpPtr2BN85NQhi5wGvLSdNMYOr/KYhmmz3KhUZxOcw163t
         RZJ/R+iIMzD+0kWMO4JZ0xnd9P4RIi0hCnstDMBGyiWtNpQnG+iuPUF9vqQnjxHXmdpl
         olHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RJqvynypNN2lA8IbNpaHHyxr5Ke0vEOMiboIN4OzW30=;
        b=rscOJ46W6FKOivVgteeVyfJEsfpsCK+UVNS5D1K4Fej1UwPkez5pFIxLFsNhhpSCt2
         BK7SrjHFlC8NA0l9eaUsFANi3yJzQ/4FeScz+AV1bigjfL9Y2fMjxxaW+8qz7p5KGCTi
         Kf/sYKOu0eSaQytjsmCnj4NnR4gfPQ/xHR0UghVCvZAJ93KKPMeBWmDpNkWZ90f+3gjL
         EQSsIdfJlxvGFfHdjFv9t91ydkVReIzJTEX1UNmjqz1V3rDZE+ihwHtABQU67pniJhpm
         tasg8gRGleClexKHyARncIFOfsANA+9XjRwZL2K38V1CMTr2OARR683dlGe4MP8IDAFE
         G6pw==
X-Gm-Message-State: APjAAAU/107pUeU5Xyg+q5EOKoZ5wIsxqK8dF6d4B8kqKpn0ZSyqpWv0
        qxCupzlQcE6oEw3h8c8duv5TLM/XQhsnpA==
X-Google-Smtp-Source: APXvYqzSbMdoob4ZQGTDL4ScCNP7A8RXxjNyuUP5qriotInXR0cYNt/+fL8srgNKU603EKjDkzWWqQ==
X-Received: by 2002:a05:600c:2283:: with SMTP id 3mr3161258wmf.100.1580978514693;
        Thu, 06 Feb 2020 00:41:54 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
        by smtp.gmail.com with ESMTPSA id r1sm3222760wrx.11.2020.02.06.00.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 00:41:54 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] media: meson: vdec: Add VP9 decoding support
Date:   Thu,  6 Feb 2020 09:41:47 +0100
Message-Id: <20200206084152.7070-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patchset aims to bring VP9 decoding support to Amlogic GXL, G12A & SM1
platforms for the amlogic stateful video decoder driver.

With this, it passes v4l2-compliance with streaming on Amlogic G12A and
Amlogic SM1 SoCs successfully using the stream at [1] with a fixed
pyv4l2compliance script for VP9 at [2].

The original script kept the IVF headers in the stream, confusing the
decoder. The fixed script only extracts the payload from the IVF container.

The decoder has been tested using the Google CTS TestVectorsIttiam VP9 yuv420
samples and the VP9 Decoder Performance streams at [5], decoding all streams from
Profile 0 and 2 up to Level 4.1, with 10bit downsampling to 8bit.

This patchset depends on :
- H.264 and compliance at [4]

Changes since v3 at [7]:
- fixes necessary spare ref buffer handling in parser
- added a comment to indicate how it's handled
- fix VP9 on SM1, was working with G12A firmware, but needed some changed with SM1 specific firmware
- pushed (gxl) and switched to missing (sm1) vp9 firmwares to linux-firmware repo

Changes since v2 at [6]:
- Rebased on H.264 and compliance at [4]

Changes since v1 at [3]:
- Fixed compliance for delta frame resize, but proper ref keeping is broken
- Added warns for delta frame resize, to be fixed in a following patchset
- Added VP9 probabilities parsing and transformation support to decore the VP9 performance streams
- Fixed refs keeping, avoid deleting necessary refs for next frame
- Properly used the kernel clamp_val() macros
- Zeroed the workspace to avoid refs handling glitches
- Add lock around the flush & stop to avoid race between IRQ and drain/stop

[1] https://github.com/superna9999/pyv4l2compliance/raw/tests/output/Jellyfish_1080_10s_5MB.vp9.hdr
[2] https://github.com/superna9999/pyv4l2compliance
[3] https://lore.kernel.org/linux-media/
[4] https://lore.kernel.org/linux-media/20200116133025.1903-1-narmstrong@baylibre.com
[5] https://www.webmproject.org/vp9/levels/
[6] https://lore.kernel.org/linux-media/20191217111939.10387-1-narmstrong@baylibre.com
[7] https://lore.kernel.org/linux-media/20200116133437.2443-1-narmstrong@baylibre.com

The compliance log is:
# v4l2-compliance --stream-from-hdr Jellyfish_1080_10s_5MB.vp9.hdr -s 200
v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits

Compliance test for meson-vdec device /dev/video0:

Driver Info:
	Driver name      : meson-vdec
	Card type        : Amlogic Video Decoder
	Bus info         : platform:meson-vdec
	Driver version   : 5.5.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateful Decoder

Required ioctls:
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
	Standard Controls: 2 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	Video Capture Multiplanar: Captured 198 buffers   
	test MMAP (select): OK
	Video Capture Multiplanar: Captured 198 buffers   
	test MMAP (epoll): OK
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for meson-vdec device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0

Maxime Jourdan (4):
  media: meson: vdec: add helpers for lossless framebuffer compression
    buffers
  media: meson: vdec: add common HEVC decoder support
  media: meson: vdec: add VP9 input support
  media: meson: vdec: add VP9 decoder support

Neil Armstrong (1):
  media: meson: vdec: align stride on 32 bytes

 drivers/staging/media/meson/vdec/Makefile     |    4 +-
 .../media/meson/vdec/codec_hevc_common.c      |  286 +++
 .../media/meson/vdec/codec_hevc_common.h      |   77 +
 drivers/staging/media/meson/vdec/codec_vp9.c  | 2138 +++++++++++++++++
 drivers/staging/media/meson/vdec/codec_vp9.h  |   13 +
 drivers/staging/media/meson/vdec/esparser.c   |  150 +-
 drivers/staging/media/meson/vdec/hevc_regs.h  |  218 ++
 drivers/staging/media/meson/vdec/vdec.c       |   15 +-
 .../staging/media/meson/vdec/vdec_helpers.c   |   35 +-
 .../staging/media/meson/vdec/vdec_helpers.h   |    4 +
 drivers/staging/media/meson/vdec/vdec_hevc.c  |  231 ++
 drivers/staging/media/meson/vdec/vdec_hevc.h  |   13 +
 .../staging/media/meson/vdec/vdec_platform.c  |   38 +
 13 files changed, 3209 insertions(+), 13 deletions(-)
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_common.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_common.h
 create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.h
 create mode 100644 drivers/staging/media/meson/vdec/hevc_regs.h
 create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.c
 create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.h

-- 
2.22.0

