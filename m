Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02313103853
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 12:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbfKTLOh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 06:14:37 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33140 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbfKTLOh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 06:14:37 -0500
Received: by mail-wr1-f67.google.com with SMTP id w9so27665559wrr.0
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 03:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IgYzZaU8uJ/7u1V0pMNs5thFQ1I8pzKQqgnk0/fTTTU=;
        b=Ou+zNIN690Ag9QQblICw/jCubbbAUkdAZu4zi5csFYcgIzOr0UdxwZYNwvDy4iQKP6
         wpJt7kAMC2CA9+62qEdpWN+ajRDqLHgvA86XyZ93x+s/6vKEuhn40UKHdB0jvsjwrbmU
         /oE+gP2ofZhvjDUG5xMoy718G74QG1FuG89JY5xtsPzWwukglpGipgbg9l02E0rBLnRy
         EkUJt6fokb0PMFFnUmyedjEqF89wnZ8wVIZKJtSklBr3WG9dLNTaZpNMPZx6o9XCwINf
         5CZQ6gB748clHEwp5HEHWHva/rcknNqHuHZNHEZY2EC0qYqpcdzUDRvbmH5bBLwglWjH
         f3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IgYzZaU8uJ/7u1V0pMNs5thFQ1I8pzKQqgnk0/fTTTU=;
        b=Fo49rZWr+23Co0Qci5Fd5SANwxW7UVyQmY+TOVQQ5M1An42+VKvS3r2cInjDXR2vUr
         tdD9Hm5KE8nG2kPEI3pu83me6sTLbMwgEtarIK6ESnWk8EJ/oQo8fcxcxvTn5Rd56fBG
         +tof52inawLG9M7aV62PhcxqNBfTmJkCN9Ir5W+fJeJrweAwf1Trp1+OoznQeZFoRFbz
         aucoXgCstbGYRD41vi4vRbXTdiwxGaUVt9YMt8EuJCAl5y2MJecXKkeoMZC3A4QoiaBA
         uRgzx+K90fzQ5V/TsEsu+uYRYrXouclSyQSrnksHSLf6NYTG6U+6oVR+uFElvqOWsyeU
         9cEg==
X-Gm-Message-State: APjAAAUWZSqX/jQekLHO+9PlQIqGhp5zho+Wy8jOod0H+8i8gJcME247
        UDiUepeXKAgkSpM1uickyhc6Lw==
X-Google-Smtp-Source: APXvYqxKueLdTe2n6x4adgsjWVndca2Jih8lVmAqNV6a9rCzGzaDxDT74+lKTTmxqGu1uX2S7Fn8gw==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr2693976wrw.141.1574248473858;
        Wed, 20 Nov 2019 03:14:33 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id u1sm6061748wmc.3.2019.11.20.03.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 03:14:33 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mjourdan@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] media: meson: vdec: add g12a platform
Date:   Wed, 20 Nov 2019 12:14:26 +0100
Message-Id: <20191120111430.29552-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset adds support for the current Amlogic Video Decoder
driver for the Amlogic G12A & compatible SoCs.

The bindings are converted to YAML and dt-schemes to ease validation
of the bindings and the Amlogic DT.

Then support is added for the currently supported MPEG1 & MPEG2 decoders
and additional clock for upcoming HEVC/VP9 decoder support.

M2M Decoder compliance is handled in a separate patchset at [1].

# v4l2-compliance
v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits

Compliance test for meson-vdec device /dev/video0:

Driver Info:
	Driver name      : meson-vdec
	Card type        : Amlogic Video Decoder
	Bus info         : platform:meson-vdec
	Driver version   : 5.4.0
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

Total for meson-vdec device /dev/video0: 44, Succeeded: 44, Failed: 0, Warnings: 0

[1] 20191007145909.29979-1-mjourdan@baylibre.com

Maxime Jourdan (1):
  media: meson: vdec: add g12a platform

Neil Armstrong (3):
  dt-bindings: media: amlogic,vdec: convert to yaml
  dt-bindings: media: amlogic,gx-vdec: add bindings for G12A family
  arm64: dts: meson-g12-common: add video decoder node

 .../bindings/media/amlogic,gx-vdec.yaml       | 142 ++++++++++++++++++
 .../bindings/media/amlogic,vdec.txt           |  72 ---------
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  23 +++
 drivers/staging/media/meson/vdec/vdec.c       |  13 +-
 drivers/staging/media/meson/vdec/vdec.h       |   1 +
 .../staging/media/meson/vdec/vdec_platform.c  |  30 ++++
 .../staging/media/meson/vdec/vdec_platform.h  |   2 +
 7 files changed, 209 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/amlogic,vdec.txt

-- 
2.22.0

