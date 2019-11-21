Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C31AB105026
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2019 11:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbfKUKOg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Nov 2019 05:14:36 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36392 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfKUKOe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Nov 2019 05:14:34 -0500
Received: by mail-wm1-f66.google.com with SMTP id n188so1070593wme.1
        for <linux-media@vger.kernel.org>; Thu, 21 Nov 2019 02:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n7DzjzsuSLvj9pdWFStqaFJF8gdHM1T9f/YXYyoJOjk=;
        b=CzFSpjV143IUsg5swiQ/xd6HekWPa8WT+SHymkLFYW8WZccwKp/V8QjnOfEjuNP5t8
         w1z9rdRXOZ+T7qZDUi3vPMh3P9JWM+j4gZ7XTw0wFUO1vLMosw9OCFMGHaa13EE/zh/v
         pc3Y+j7ILOj0i+k14bnEZTcqxcxkpAo1TwUCm8geSaM9PF24vQ771JN0p19hpN84c4JP
         EgQ3njdMGF/c0Ra+WHZDIEOONMVnKYqIQ4QldDIeGamQNwG7x4mZWuDD1929IZk4gj1y
         omx3QqMOxGBNqbSdF+oD4fm6Gb5fknsFczRcokiQ4ZUgZ1tN1xyTizuJfONw9k4j0V/Q
         1/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n7DzjzsuSLvj9pdWFStqaFJF8gdHM1T9f/YXYyoJOjk=;
        b=CjS2w8xyee5G8QdfuRkDbV6nviSyvaXi7DFFiMgsrzAMNRdJXWbv6EQsIE+e68RrZq
         4XGIGB+VfI75xDZf5YD+0cw+8fvZn4LTf+OGAp5wXgpNYAheznXVdaHRN3uDO0UFT/W5
         afCL2s/732FY9Zel6WAG7K3WLETtN5lD8DAk7T0SGQSXyr6H+0IaLACzc+P1G/xOAVsg
         Sk593mXAD+ORxuOT9KVKBjYRcaySAuTfIAPg0GuvkAfxO0/77MyPutm1brBpO9xZ7ZLW
         Dy4JbuQQj9gPUg2UFsO+vWheZJbUoRvi/1ts5bMvkZ4n2mVdsMTWDzn+JbNVl+LK1Tyf
         PiHQ==
X-Gm-Message-State: APjAAAXi6LfJXK0OG/+SzJM9l+kYl/neJPrvJoYibpU7uy5xAxH/Q/3S
        OkmwTG63K+um1+tHwobwyB/TLwEHQzvbDQ==
X-Google-Smtp-Source: APXvYqxPADgVv5/yD9ctzuTcZNw5cUFWHwvJhUI0DOZzRCGful8vLGq7ZwkZBc87z0uvxwTFov8oDQ==
X-Received: by 2002:a7b:ca4d:: with SMTP id m13mr8689497wml.21.1574331271418;
        Thu, 21 Nov 2019 02:14:31 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o21sm1289932wmc.17.2019.11.21.02.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 02:14:30 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mjourdan@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: meson: vdec: add sm1 platform
Date:   Thu, 21 Nov 2019 11:14:26 +0100
Message-Id: <20191121101429.23831-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset adds support for the current Amlogic Video Decoder
driver for the Amlogic SM1 & compatible SoCs.

Then support is added for the currently supported MPEG1 & MPEG2 decoders
like for G12A support.

This patchset depends on G12A support patchset at [1].

M2M Decoder compliance is handled in a separate patchset at [2].

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

[1] https://lore.kernel.org/linux-media/20191120111430.29552-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/linux-media/20191007145909.29979-1-mjourdan@baylibre.com

Neil Armstrong (3):
  dt-bindings: media: amlogic,gx-vdec: add bindings for SM1 family
  media: meson: vdec: add sm1 platform
  arm64: dts: meson-sm1: add video decoder compatible

 .../bindings/media/amlogic,gx-vdec.yaml       |  2 ++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  4 +++
 drivers/staging/media/meson/vdec/vdec.c       |  5 +++-
 drivers/staging/media/meson/vdec/vdec_1.c     | 29 ++++++++++++++----
 .../staging/media/meson/vdec/vdec_platform.c  | 30 +++++++++++++++++++
 .../staging/media/meson/vdec/vdec_platform.h  |  2 ++
 6 files changed, 65 insertions(+), 7 deletions(-)

-- 
2.22.0

