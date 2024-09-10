Return-Path: <linux-media+bounces-18091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BDF973E11
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E35CC1F26B28
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C221A01CC;
	Tue, 10 Sep 2024 17:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsL9sZBD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1753A19ABC6;
	Tue, 10 Sep 2024 17:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987980; cv=none; b=b8E5JyBwSPs5fJC8AGV2I6tVRtToO5n2y2rxNZMgOC2ypRDzoWlC37WGBioO8si/EH/iC/m1jYcNzxASs4w9ag3dYHtCdEutS4NonoZ7pwJOlTbQn9OLKIOS17kLz67cHH4bhBRnRQHkX1g7xYPJhWKoNhpBkFy6G3iqm3LViNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987980; c=relaxed/simple;
	bh=ERSOo1gLyL6NRUXpI7BYr7TNKvkN81Ne2xc5qpENzSE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tqQMv8gAnV8zITiXJrZGzSnizzF0YiJiLLz5fQMmlpkbArh8m4CnhyxVC4iYous3i+S9SB96Sd7HP4Dt8HytF3YnTVJHS0nJAWNArllYgyXtATd9wJ/8xzu5o0Yozf8/OsYtBF352muFw0cy1ZCWRFaIQyeSxJU7AO4hRLU7aAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsL9sZBD; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f752d9ab62so55073921fa.3;
        Tue, 10 Sep 2024 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725987977; x=1726592777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IictGBPqCiiw3p09IMxat80agLiHcd00LB2nW0GaKVs=;
        b=nsL9sZBDGVRswUh44BUxrEyemNPcff3Valy9sYFVBzEbunEdJm1w0ESnA3hFczxnAx
         ArtENa+LhrGGjajG1oDWQOZB/VuqsSFsxIBU7OTQEkDBRNa81IIC18Zn/U56sdhh6kpS
         b1MMC/7/sP0gv9jxTS7MnB8VfiJmiIJ20gyw5DKLx5gM5JXXzIjkZMD5s/otnPNaghg3
         q9TB7uGT4yymRCWsuj37FdCyz6S1c78CgtWbwI6WaYcTmQiO9/KTCSaFRCnykEioXP7/
         XpQcUz2KrZrrSRZvNf2aKUOVFK3K9/OvI+/k2fvyD9D0l5y2Gc5e3HdxYbZ2qkLXuN0e
         a9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725987977; x=1726592777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IictGBPqCiiw3p09IMxat80agLiHcd00LB2nW0GaKVs=;
        b=E3fVuLM0pm9IqfAxFCdzhN1DcVJB69aHqRT+X7nG8sYYDTXJ870cyQ+178MIUj0/Z7
         GohQZC80eYje1pgvWYEtzJRR1c6nIEzIzJ1fNwQrVHuIoPi4pbpn7qDaGkV67udg2pUZ
         ZFLrEpY15dJYcF4rWpA75OtNQkYDISrlKLtYfyFBSxdavYuPxka8VxCA+ROY+Zb29/hS
         e5RZk20wshQomjGnlyC4HrLeIRDg62QEwGpt/8Ad4C9/P4gwTWUWT114BlmKU+Guvvuo
         BELZZx6l/X1H7GN5PdRzOdV6oKvTRSDKjc9oQc1krbRVOcCzm8yEiyNlZtxx+pY39z4k
         OSow==
X-Forwarded-Encrypted: i=1; AJvYcCUeqTwz4XQ2Y4DX/hDbCBzpyXUYMAZWp+Khibf1lSG5qrZL9nUuJ7AKEzyhGn58hl1rVEm1cVbY0UbtclRZXMV7C0U=@vger.kernel.org, AJvYcCVWtWrGlarejWzrkcAP/sD2z0Ut7AD8Y7zxPNrvLWrNK85yEaY4wWE9kaNm4U4mSSMjB5fM1ry7PDZCwQI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/o3wHrpdwFpcyd7I6nN3EoHUrp4ZwapJFvfbEUKnAqHBN3Qu+
	7V1lBHzJrPMtCJW5KBBoKllED8SBCJ+ijxuqd4fVCxB/izCHs9b/
X-Google-Smtp-Source: AGHT+IGDW33Klp1v5arH0qZGDpA2Gs9o2FYaMLo2uhtpKVWfWvsdhU8NjPo2eDJcbZ04R54u1I7Ddg==
X-Received: by 2002:a05:6512:b1e:b0:52e:7448:e137 with SMTP id 2adb3069b0e04-536587a6790mr11834418e87.6.1725987976594;
        Tue, 10 Sep 2024 10:06:16 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de4b9sm9438925f8f.111.2024.09.10.10.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:06:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 00/11] media: ov5645: Add support for streams
Date: Tue, 10 Sep 2024 18:05:59 +0100
Message-Id: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add the below features,
- Support subdev active state
- Support for streams
- Support for virtual channel
- Code cleanup

Note, these patches are dependent on below:
1] https://patchwork.kernel.org/project/linux-media/patch/20240416193319.778192-27-sakari.ailus@linux.intel.com/
2] https://patchwork.kernel.org/project/linux-media/patch/20240416193319.778192-26-sakari.ailus@linux.intel.com/

RFC->v2
- Dropped setting of VC using routes
- Defaulted the native format to MEDIA_BUS_FMT_SBGGR8_1X8
- Fixed ov5645_enum_frame_size and ov5645_enum_mbus_code
  for internal image pad

RFC patch,
Link: https://lore.kernel.org/all/20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Test logs:
====================================

root@smarc-rzg2l:~# media-ctl -p
.....
- entity 4: ov5645 0-003c (2 pads, 1 link, 1 route)
            type V4L2 subdev subtype Sensor flags 0
            device node name /dev/v4l-subdev1
        routes:
                1/0 -> 0/0 [ACTIVE]
        pad0: SOURCE
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb
                 crop:(0,0)/1920x1080]
                -> "csi-10830400.csi2":0 [ENABLED,IMMUTABLE]
        pad1: SINK,0x8
                [stream:0 fmt:SBGGR8_1X8/2592x1944 field:none colorspace:srgb
                 crop:(0,0)/1920x1080]
.....

root@smarc-rzg2l:~# v4l2-ctl --device /dev/v4l-subdev1 --list-subdev-mbus-codes pad=0
ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=0,stream=0)
    0x200f: MEDIA_BUS_FMT_UYVY8_1X16
root@smarc-rzg2l:~# v4l2-ctl --device /dev/v4l-subdev1 --list-subdev-mbus-codes pad=1
ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=1,stream=0)
    0x3001: MEDIA_BUS_FMT_SBGGR8_1X8
root@smarc-rzg2l:~# v4l2-ctl --device /dev/v4l-subdev1 --list-subdev-framesizes pad=1,code=0x3001
ioctl: VIDIOC_SUBDEV_ENUM_FRAME_SIZE (pad=1,stream=0)
    Size Range: 2592x1944 - 2592x1944
root@smarc-rzg2l:~# v4l2-ctl --device /dev/v4l-subdev1 --list-subdev-framesizes pad=0,code=0x200f
ioctl: VIDIOC_SUBDEV_ENUM_FRAME_SIZE (pad=0,stream=0)
    Size Range: 1280x960 - 1280x960
    Size Range: 1920x1080 - 1920x1080
    Size Range: 2592x1944 - 2592x1944
root@smarc-rzg2l:~#

v4l2-compliance log:
-------------------
root@smarc-rzg2l:~# v4l2-compliance -u /dev/v4l-subdev1
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for device /dev/v[ 6347.789338] ov5645 0-003c: ================= START STATUS =================
4l-subdev1:

Driver In[ 6347.798197] ov5645 0-003c: ================== END STATUS ==================
fo:
    Driver version  : 6.11.0
    Capabilities   : 0x00000002
        Streams Support
    Client Capabilities: 0x0000000000000003
streams interval-uses-which
Required ioctls:
    test VIDIOC_SUDBEV_QUERYCAP: OK
    test invalid ioctls: OK

Allow for multiple opens:
    test second /dev/v4l-subdev1 open: OK
    test VIDIOC_SUBDEV_QUERYCAP: OK
    test for unlimited opens: OK

Debug ioctls:
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

Sub-Device routing ioctls:
    test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
    test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Control ioctls:
    test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
    test VIDIOC_QUERYCTRL: OK
    test VIDIOC_G/S_CTRL: OK
    test VIDIOC_G/S/TRY_EXT_CTRLS: OK
    test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
    test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
    Standard Controls: 12 Private Controls: 0

Format ioctls:
    test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
    test VIDIOC_G/S_PARM: OK (Not Supported)
    test VIDIOC_G_FBUF: OK (Not Supported)
    test VIDIOC_G_FMT: OK (Not Supported)
    test VIDIOC_TRY_FMT: OK (Not Supported)
    test VIDIOC_S_FMT: OK (Not Supported)
    test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
    test Cropping: OK (Not Supported)
    test Composing: OK (Not Supported)
    test Scaling: OK (Not Supported)

Codec ioctls:
    test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
    test VIDIOC_G_ENC_INDEX: OK (Not Supported)
    test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
    test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
    test CREATE_BUFS maximum buffers: OK
    test VIDIOC_REMOVE_BUFS: OK
    test VIDIOC_EXPBUF: OK (Not Supported)
    test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev1: 47, Succeeded: 47, Failed: 0, Warnings: 0

Lad Prabhakar (11):
  media: i2c: ov5645: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
  media: i2c: ov5645: Use local `dev` pointer for subdev device
    assignment
  media: i2c: ov5645: Enable runtime PM after
    v4l2_async_register_subdev()
  media: i2c: ov5645: Use dev_err_probe instead of dev_err
  media: i2c: ov5645: Use v4l2_async_register_subdev_sensor()
  media: i2c: ov5645: Drop `power_lock` mutex
  media: i2c: ov5645: Use subdev active state
  media: i2c: ov5645: Switch to {enable,disable}_streams
  media: i2c: ov5645: Add internal image sink pad
  media: i2c: ov5645: Report internal routes to userspace
  media: i2c: ov5645: Report streams using frame descriptors

 drivers/media/i2c/ov5645.c | 433 ++++++++++++++++++++-----------------
 1 file changed, 240 insertions(+), 193 deletions(-)

-- 
2.34.1


