Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C35C30B9C
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 11:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbfEaJbc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 05:31:32 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35338 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfEaJbc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 05:31:32 -0400
Received: by mail-wr1-f68.google.com with SMTP id m3so6046766wrv.2
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 02:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jPFtFu0au4TB7J3q2KvJitWHXqV0/8huBw2wNPZRon4=;
        b=nzQVw6FQGHaI1+5jwz3wo9mbx7pLl92rQpN7nM+0wUW+io57Go46BmvU1UMifPNZAY
         zO1mGkReB4opBw4cgUh+LjQmmwlQvq8RUABOX9y8CdYO8iGZFIG/OhS0LZ8bjKTLaEGS
         W8LGENIv4DddhNy3w7W90EA2lHqvsKAdeStv7KLnC30J4ZJQO+lAbnGITUsB6y9WHQ1F
         UvepPsD+eoGULCphczZ1ZUPh9ZBSKC8rXB8bKtIiIJYt/MkurSEgPs0g7AjZhzBnZzjT
         v1smGp+TkLMJY5M+cy2IZar12bGPspvM0uCNjsFq/dUAWF8O1ryxdMn2+hwhYJ90tieS
         5yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jPFtFu0au4TB7J3q2KvJitWHXqV0/8huBw2wNPZRon4=;
        b=QKsVR2g56pkVCKDw9RGqdQnfbhx/Oo4tgcWHPPIGAn9Eo4WY5E9e7s8YAoO+5syVUO
         a8IKMRyANC8cDq7jyaYdLyA/1uNGVjsSwCL/uEdzV7AWyfbMSqUu1lZlXmUYgwCVTvDg
         7DkpJY/2zCmnf1RonvyNQGLxrSYO5bU6GztcryAkK2ZkakNLC14v34pRblLFPDE/8TiI
         1w+VwDLHI8ni1RsRXKnSfs8i1Q3fJKbtNlOPcb3/OdNE60UsrijNa660Dfy3ZAiU9A4H
         wHchwf1iIBkwv+kngo9OyjzebMxu3SzzXK4bylTcnD5KgNAXofZdzRFbXZiHfGWWvcfg
         pLug==
X-Gm-Message-State: APjAAAUBdOnFrliFn0EEwbrdZq9eCcYMFlKDLLxuCOdJxv50Flvt4CwQ
        XCDaD1hAAvwgOfukNwazKzvOpQ==
X-Google-Smtp-Source: APXvYqwRN7VA0ovfKfPIeRXkPucpKe7Od24f6Toao+WZoTzy6YEDT+p1DPfkMPFxwm8GAHLopjZuDQ==
X-Received: by 2002:adf:deca:: with SMTP id i10mr5730325wrn.313.1559295089787;
        Fri, 31 May 2019 02:31:29 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id b136sm7187023wme.30.2019.05.31.02.31.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 31 May 2019 02:31:29 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v7 0/4] Add Amlogic video decoder driver
Date:   Fri, 31 May 2019 11:31:22 +0200
Message-Id: <20190531093126.26956-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

[V7] The Driver was moved to staging until it can pass future
specification & compliance tools.

[V6] Good news, the firmware situation is resolved. We have received a
redistributable license from Amlogic and the firmwares have been merged
in linux-firmware[5].

[V5] It's been a while since the last patch series regarding the Amlogic
video decoder. Unfortunately, the firmware licensing situation is still
on hold as we await communication from Amlogic. As such, we do not have
the firmwares in linux-firmware yet.
I decided to push the V5 anyway, as changes were starting to pile up.

This patch series adds support for the Amlogic video decoder,
as well as the corresponding dt bindings for GXBB/GXL/GXM chips.

It features decoding for the following formats:
- MPEG 1
- MPEG 2

The following formats will be added in future patches:
- MJPEG
- MPEG 4 (incl. Xvid, H.263)
- H.264
- HEVC (incl. 10-bit)
- VP9 (incl. 10-bit)

The code was made in such a way to allow easy inclusion of those formats
in the future.

The decoder is single instance.

Files:
 - vdec.c handles the V4L2 M2M logic
 - esparser.c manages the hardware bitstream parser
 - vdec_helpers.c provides helpers to DONE the dst buffers as well as
 various common code used by the codecs
 - vdec_1.c manages the VDEC_1 block of the vdec IP
 - vdec_ctrls.c handles the V4L2 controls exposed by the driver
 - codec_mpeg12.c enables decoding for MPEG 1/2.
 - vdec_platform.c links codec units with vdec units
 (e.g vdec_1 with codec_mpeg12) and lists all the available
 src/dst formats and requirements (max width/height, etc.),
 per compatible chip.

It was tested primarily with ffmpeg's v4l2-m2m implementation. For instance:
$ ffmpeg -c:v mpeg2_v4l2m2m -i sample_mpeg2.mkv -f rawvideo out.nv12

The v4l2-compliance results are available below the patch diff.
Tests start failing when v4l2-compliance tries to dequeue the
V4L2_EVENT_SOURCE_CHANGE event, which is not supported for MPEG2 currently.

Changes since v6 [6]:
 - Rebased against v5.2-rc2 (fixed build issue with missing interrupt include)
 - Moved to staging - added TODO file
 - Don't declare V4L2_CID_MIN_BUFFERS_FOR_CAPTURE as volatile. Use
 v4l2_ctrl_s_ctrl() instead.
 - Fix compliance issues with V4L2_DEC_CMD_STOP, V4L2_DEC_CMD_START and
 vbuf->field not prepared to V4L2_FIELD_NONE.
 - Fixed coccinelle issue (unneeded semicolon)
 - Fixed smatch issue (PTR_ERR() could be called with 0)

Changes since v5 [4]:
 - Rebased against media_tree (fixes conflict with platform/meson/Makefile
 following the meson CEC driver updates)

Changes since v4 [3]:
 - Updated for 5.1: 
  - cropcap -> g_pixelaspect
  - dma_zalloc_coherent -> dma_alloc_coherent
 - enum_framesizes: changed from STEPWISE to CONTINUOUS, as suggested by Hans
 - Reintroduced support for CREATE_BUFS. It was a driver bug where I wasn't
 accounting for the amount of buffers created this way (only buffers created
 via REQBUFS were).
 - Added the patch introducing V4L2_FMT_FLAG_FIXED_RESOLUTION to the V4L2
 framework, needed as MPEG2 on Amlogic hardware only supports a fixed
 resolution during a decode session.
 - Added support for events and V4L2_EVENT_SOURCE_CHANGE, as it is now checked
 by v4l2-compliance for stateful decoders. I was planning on introducing this
 for codecs that actually use it (H264, HEVC..), but it doesn't hurt to have
 this in the initial commit.
 - Added support for controls, mainly V4L2_CID_MIN_BUFFERS_FOR_CAPTURE

Changes since v3 [2]:
 - strlcpy -> strscpy
 - queue_setup: account for existing buffers when clamping *num_buffers
 - removed support for CREATE_BUFS. This caused issues with gstreamer and allowed
 userspace to alloc more buffers than the decoder can handle in its fixed list.
 So for now we just disable it and only allow allocating via REQBUFS.
 - rebased & tested with 4.20-rc1

Changes since v2 [1]:
 - Override capture queue's min_buffers_needed in queue_setup
 The HW needs the full buffer list to be available when doing start_streaming
 - Fix the draining sequence
 The blob that we write to the ESPARSER to trigger drain is codec-dependent.
 The one that was sent in v1 is specific to H.264 and isn't guaranteed to
 trigger drain for MPEG2. For the latter, a simple MPEG2 EOS code
 should be sent to the ESPARSER instead.
 - Slight enhancements to the way we do vififo offset<=>timestamp matching

Changes since v1 [0]:
 - use named interrupts in the bindings
 - rewrite description in the bindings doc
 - don't include the dts changes in the patch series
 - fill the vb2 queues locks
 - fill the video_device lock
 - use helpers for wait_prepare and wait_finish vb2_ops
 - remove unnecessary usleep in between esparser writes.
 Extensive testing of every codec on GXBB/GXL didn't reveal
 any fails without it, so just remove it.
 - compile v4l2_compliance inside the git repo
 - Check for plane number/plane size to pass the latest v4l2-compliance test
 - Moved the single instance check (returning -EBUSY) to start/stop streaming
 The check was previously in queue_setup but there was no great location to
 clear it except for .close().
 - Slight rework of the way CAPTURE frames are timestamped for better accuracy
 - Implement PAR reporting via VIDIOC_CROPCAP

[6] https://patchwork.kernel.org/cover/10943029/
[5] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=e04cc56d0e6b6ff05924ff88fdba1a438ee7d3c8
[4] https://patchwork.kernel.org/cover/10879959/
[3] https://patchwork.kernel.org/cover/10669875/
[2] https://lore.kernel.org/patchwork/cover/993093/
[1] https://patchwork.kernel.org/cover/10595803/
[0] https://patchwork.kernel.org/cover/10583391/

Maxime Jourdan (4):
  dt-bindings: media: add Amlogic Video Decoder Bindings
  media: videodev2: add V4L2_FMT_FLAG_FIXED_RESOLUTION
  media: meson: add v4l2 m2m video decoder driver
  MAINTAINERS: Add meson video decoder

 .../bindings/media/amlogic,vdec.txt           |   71 ++
 .../media/uapi/v4l/vidioc-enum-fmt.rst        |    6 +
 MAINTAINERS                                   |    8 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/meson/vdec/Kconfig      |   11 +
 drivers/staging/media/meson/vdec/Makefile     |    8 +
 drivers/staging/media/meson/vdec/TODO         |    8 +
 .../staging/media/meson/vdec/codec_mpeg12.c   |  209 ++++
 .../staging/media/meson/vdec/codec_mpeg12.h   |   14 +
 drivers/staging/media/meson/vdec/dos_regs.h   |   98 ++
 drivers/staging/media/meson/vdec/esparser.c   |  324 +++++
 drivers/staging/media/meson/vdec/esparser.h   |   32 +
 drivers/staging/media/meson/vdec/vdec.c       | 1090 +++++++++++++++++
 drivers/staging/media/meson/vdec/vdec.h       |  269 ++++
 drivers/staging/media/meson/vdec/vdec_1.c     |  229 ++++
 drivers/staging/media/meson/vdec/vdec_1.h     |   14 +
 drivers/staging/media/meson/vdec/vdec_ctrls.c |   29 +
 drivers/staging/media/meson/vdec/vdec_ctrls.h |   14 +
 .../staging/media/meson/vdec/vdec_helpers.c   |  449 +++++++
 .../staging/media/meson/vdec/vdec_helpers.h   |   83 ++
 .../staging/media/meson/vdec/vdec_platform.c  |  107 ++
 .../staging/media/meson/vdec/vdec_platform.h  |   30 +
 include/uapi/linux/videodev2.h                |    5 +-
 24 files changed, 3109 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,vdec.txt
 create mode 100644 drivers/staging/media/meson/vdec/Kconfig
 create mode 100644 drivers/staging/media/meson/vdec/Makefile
 create mode 100644 drivers/staging/media/meson/vdec/TODO
 create mode 100644 drivers/staging/media/meson/vdec/codec_mpeg12.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_mpeg12.h
 create mode 100644 drivers/staging/media/meson/vdec/dos_regs.h
 create mode 100644 drivers/staging/media/meson/vdec/esparser.c
 create mode 100644 drivers/staging/media/meson/vdec/esparser.h
 create mode 100644 drivers/staging/media/meson/vdec/vdec.c
 create mode 100644 drivers/staging/media/meson/vdec/vdec.h
 create mode 100644 drivers/staging/media/meson/vdec/vdec_1.c
 create mode 100644 drivers/staging/media/meson/vdec/vdec_1.h
 create mode 100644 drivers/staging/media/meson/vdec/vdec_ctrls.c
 create mode 100644 drivers/staging/media/meson/vdec/vdec_ctrls.h
 create mode 100644 drivers/staging/media/meson/vdec/vdec_helpers.c
 create mode 100644 drivers/staging/media/meson/vdec/vdec_helpers.h
 create mode 100644 drivers/staging/media/meson/vdec/vdec_platform.c
 create mode 100644 drivers/staging/media/meson/vdec/vdec_platform.h


root@hardkernel-odroidc2:~# v4l2-compliance -s --stream-from=hst_2.mpg 
v4l2-compliance SHA: a162244d47d4bb01d0692da879dce5a070f118e7, 64 bits

Compliance test for meson-vdec device /dev/video0:

Driver Info:
        Driver name      : meson-vdec
        Card type        : Amlogic Video Decoder
        Bus info         : platform:meson-vdec
        Driver version   : 5.2.0
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
        test Scaling: OK

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
                fail: v4l2-test-buffers.cpp(1324): node->dqevent(ev)
        test MMAP (select): FAIL
                fail: v4l2-test-buffers.cpp(1324): node->dqevent(ev)
        test MMAP (epoll): FAIL
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for meson-vdec device /dev/video0: 49, Succeeded: 47, Failed: 2, Warnings: 0

-- 
2.21.0

