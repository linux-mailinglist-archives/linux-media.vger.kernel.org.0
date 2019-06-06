Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1783791B
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 18:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729563AbfFFQF0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 12:05:26 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34782 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729230AbfFFQFZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 12:05:25 -0400
Received: by mail-wr1-f66.google.com with SMTP id e16so3039272wrn.1
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2019 09:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=27ciJfpFc+FjyxgfWMZIvbmGa9QD9ZvJWq9PIPeBegA=;
        b=Ozz8owAkN9q/HPaonhVsAYsHyQINBWVkTR1ogMrjU9QiEMADGqj8QtfjMRvdudqKM3
         Ya+AZBb1Yf7VMBnDqHGuj6eOHSYV8fBfuTBYdZXkx1udIJK5bjX819YpXN+hdqK6/1/S
         btICLtxez3+6LZT8V5P/lvK7qRBwCHqch1G0rcIB6gIzRmMPCeA6PngrL4osyGIedbif
         ISdh+ecI7CUq2UyIuRpwJrYC9N350KxrAGBf1r5yiXFlb0dwGwJFmk26KEXYeqyy44rj
         6dT4lgsq5ljcC0bbJ/Eoak6BWQNUJhlb6gYxgRg6u/k2tUeKBOv9C7SVm9mtJZN9wZWW
         Rn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=27ciJfpFc+FjyxgfWMZIvbmGa9QD9ZvJWq9PIPeBegA=;
        b=rLmpQvMMpnt8ORfLwfdwEUtQBR9W0TB3qqlb2W14LAD9WLhjxujvLmg1Qt/NOrKDim
         ldAeGaDLgBaxHaoAM9O+3OvP2vBEmAsF/rN+KnPD075vvWsckO8SaiMCft5UNHcEEqPa
         upURzbfxoJMBfAEbqOYjNb112qcKBrcMpJoxs0EXbpQ6I/Tx9i1gCpOQrwS8agADhQ3H
         GEmcVFrVqKibfNA3Kdi3E9sik6DmkrEiewVmWw+u8Jj4RI/siwPLtNWtwVpKoNDMXfiv
         Xa/tizo4LqKDgqflGCn1NHbAdFEWO4j/Xp0cnHxr1x/ChMmLzNSH2AHT88qseA5M0968
         XXBg==
X-Gm-Message-State: APjAAAVGNLhqp+tLirQl5FxT5eJyop/m165q2D+a/vf8yAYHWlCwI7bv
        StOMhoHSJMtu4RK4veOLUlIjZi+6bW8=
X-Google-Smtp-Source: APXvYqx3sIXIZTj1tt2eQKGWKLGFC+txXeTkK8s/lphXBmUwv0WwwWMY+tkRAahQaN93qqqe7y6SJA==
X-Received: by 2002:a5d:4087:: with SMTP id o7mr16664387wrp.277.1559837122663;
        Thu, 06 Jun 2019 09:05:22 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id t140sm2180901wmt.0.2019.06.06.09.05.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 06 Jun 2019 09:05:21 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v10 0/3] Add Amlogic video decoder driver
Date:   Thu,  6 Jun 2019 18:05:09 +0200
Message-Id: <20190606160512.26211-1-mjourdan@baylibre.com>
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
 - codec_mpeg12.c enables decoding for MPEG 1/2.
 - vdec_platform.c links codec units with vdec units
 (e.g vdec_1 with codec_mpeg12) and lists all the available
 src/dst formats and requirements (max width/height, etc.),
 per compatible chip.

It was tested primarily with ffmpeg's v4l2-m2m implementation. For instance:
$ ffmpeg -c:v mpeg2_v4l2m2m -i sample_mpeg2.mkv -f rawvideo out.nv12

The v4l2-compliance results are available below the patch diff.
Tests start failing when v4l2-compliance tries to dequeue the
V4L2_EVENT_SOURCE_CHANGE event, which is not supported for MPEG2.

Changes since v9 [9]:
 - Removed vdec_ctrls.* and moved the code to vdec.c

Changes since v8 [8]:
 - Fixed checkpatch & sparse issues

Changes since v7 [7]:
 - Removed the patch with V4L2_FMT_FLAG_FIXED_RESOLUTION from the serie.
 It will be dealt in another manner in the near future.
 - use the new v4l2_m2m_ioctl_try_decoder_cmd helper
 - Rebased against media/master

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

[9] https://patchwork.kernel.org/cover/10979559/
[8] https://patchwork.kernel.org/cover/10977259/
[7] https://patchwork.kernel.org/cover/10969815/
[6] https://patchwork.kernel.org/cover/10943029/
[5] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=e04cc56d0e6b6ff05924ff88fdba1a438ee7d3c8
[4] https://patchwork.kernel.org/cover/10879959/
[3] https://patchwork.kernel.org/cover/10669875/
[2] https://lore.kernel.org/patchwork/cover/993093/
[1] https://patchwork.kernel.org/cover/10595803/
[0] https://patchwork.kernel.org/cover/10583391/

Maxime Jourdan (3):
  dt-bindings: media: add Amlogic Video Decoder Bindings
  media: meson: add v4l2 m2m video decoder driver
  MAINTAINERS: Add meson video decoder

 .../bindings/media/amlogic,vdec.txt           |   71 ++
 MAINTAINERS                                   |    8 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/meson/vdec/Kconfig      |   11 +
 drivers/staging/media/meson/vdec/Makefile     |    8 +
 drivers/staging/media/meson/vdec/TODO         |    8 +
 .../staging/media/meson/vdec/codec_mpeg12.c   |  210 ++++
 .../staging/media/meson/vdec/codec_mpeg12.h   |   14 +
 drivers/staging/media/meson/vdec/dos_regs.h   |   98 ++
 drivers/staging/media/meson/vdec/esparser.c   |  324 +++++
 drivers/staging/media/meson/vdec/esparser.h   |   32 +
 drivers/staging/media/meson/vdec/vdec.c       | 1098 +++++++++++++++++
 drivers/staging/media/meson/vdec/vdec.h       |  267 ++++
 drivers/staging/media/meson/vdec/vdec_1.c     |  230 ++++
 drivers/staging/media/meson/vdec/vdec_1.h     |   14 +
 .../staging/media/meson/vdec/vdec_helpers.c   |  449 +++++++
 .../staging/media/meson/vdec/vdec_helpers.h   |   83 ++
 .../staging/media/meson/vdec/vdec_platform.c  |  101 ++
 .../staging/media/meson/vdec/vdec_platform.h  |   30 +
 20 files changed, 3059 insertions(+)
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

