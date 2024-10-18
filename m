Return-Path: <linux-media+bounces-19891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0469A4271
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FE721F21B87
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10EF82022C5;
	Fri, 18 Oct 2024 15:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIjVrdMr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5CE1F4264;
	Fri, 18 Oct 2024 15:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729265577; cv=none; b=r0D3lQGPXbh9McJEiT8+xfm+FjOiq8dijl59aBgMagCfTyRaX9zv7dOI9vTeeeBeNp9PYbcl7OmSl1ZnUaANIh5V5vO0SDxGaz5VZHaYgzEffylWD/sVxDCGhfdQFfIwicizVp1F3RlJlcVxo6kBA1PvNyExnLhM9qM0E8G7cmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729265577; c=relaxed/simple;
	bh=HjFT8gxixI2zdMuRm0NjH3lyWJ4lhYr7CxcnIiPls/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f4A9kgsFw98Y+hrs0+zYuUfnlyWL6pox6zvdgJ3aOd0iCI8p8URul/SZXKKbh2vPS+DPcfo/0iTAVco7Fx6RjRfF+/yfX1fOMTVNcMp2fvt0DteKBiMbemBsrsBuNUJEiO0mOwMu6VCcFeylGhQKCC6qmB1fWjUheoF6ZkbL+k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIjVrdMr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so353365f8f.2;
        Fri, 18 Oct 2024 08:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729265573; x=1729870373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JeZX36AOts656XeIipRUW//VVqaiAIOn+txCH/BlOKo=;
        b=dIjVrdMrp2Zg4nye+Uj6kySN7mQ7Hv95AzYvI0duRiPQWnolL0DxQ6MlyDZ7K+MHyI
         2iW2fRA7B7vXWjwkd3afVckqVZmdVe0cMEzY04H8mE4vpjin6zwpz7fyKoWoYzRu/2oy
         M4szdcq9tjOSwdUg9Yjlk7XNxp/LnlICn9fSAVZYXuAzG+J/FIgNuZIHeSHaKUOtPalS
         7b9/nGkXfavhHcnts5eMXQgfL460s6sSoVbiaXHVTw1DeIu12nJZ3rNOZYOG99YWvMwo
         SdB7+1ShC8ClftPH/BTgYSbWu78Jgy59sOpShO1fTgb75CHfzPPEVYmNsBCR7b49v0h7
         VARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729265573; x=1729870373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeZX36AOts656XeIipRUW//VVqaiAIOn+txCH/BlOKo=;
        b=OKVEm7exd8p+d8/ryDSa0zapB9WpxXoTZiEB+sS1KSZu5APVJPSIL8HluChYn+jEuR
         kDpUafe4S0yvOrhxowHPd6tpZaYd7o7rCDJQxsc9MtFl39NXSdktcTl2Au1xbD7MwDaS
         MBSz5+RnIVn9yTMYxb723Fe/SgpCQxtYp6XpE3SXbdtA0Zgrt1s5QpS3A8rFTem5LgzO
         kc+juIkxaK1sMUUlxqNvlVWe40Fqn+DjD+2FPZn/VOQJvbQsBWzZdg2+Mr9PJXInnI9m
         e+wCt0blZWDVBqLOijgSISh4S5RbuBROAL8bu+jDwpN8Oott4oHLpIZcBoAWKK9nL3U1
         z9oQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6APZMol5lXA3gMb0oBOuIrzzI6JgZFlbVG99BsOU2rTWixojarXItIgAkTRqTl7DWbw5kH0OEec59P/wpnbmKnXo=@vger.kernel.org, AJvYcCWNFhnTXCC7PNE3Kh40+DmFACJwIkQq14KmStcJuPUi/f0sGrc9GDU6omQAYwo+FymYujBqdlffxkv7rbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXUkeTm851z51/esqer3LC8tZgjPHjMNgOHN3+GoPeHtXkhHff
	4R46i1Q5OHwwrTVfMKP2hFZPXqlpX89uibPbFpQ/kwK/bR6X5Gf3
X-Google-Smtp-Source: AGHT+IEQFWX1fvkIjTzMGYo1gxAvOZz0GYutoj8BZaUd4y7lJ1Z8Tg/O5kZcJWa6e16HLeVqe5Tfjg==
X-Received: by 2002:adf:a3d2:0:b0:37d:33ab:de30 with SMTP id ffacd0b85a97d-37ea2137119mr1761709f8f.8.1729265573123;
        Fri, 18 Oct 2024 08:32:53 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316067e7b9sm30615595e9.6.2024.10.18.08.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 08:32:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 00/10] media: ov5645: Add support for streams
Date: Fri, 18 Oct 2024 16:32:20 +0100
Message-ID: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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

v2->v3
- Fixed review commments from Laurent
- Included RB tags from Laurent
- Dropped patch "media: i2c: ov5645: Enable runtime PM after v4l2_async_register_subdev()"
- Fixed checkpatch issues (ie used --max-line-length=80)

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
......
- entity 4: ov5645 0-003c (2 pads, 1 link, 1 route)
      type V4L2 subdev subtype Sensor flags 0
      device node name /dev/v4l-subdev1
    routes:
        1/0 -> 0/0 [ACTIVE]
    pad0: SOURCE
        [stream:0 fmt:UYVY8_1X16/1280x960 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
        crop:(0,0)/1280x960]
        -> "csi-10830400.csi2":0 [ENABLED,IMMUTABLE]
    pad1: SINK,0x8
        [stream:0 fmt:SBGGR8_1X8/2592x1944 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
        crop:(0,0)/1280x960]
......

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
root@smarc-rzg2l:~# v4l2-compliance -u /dev/v4l-subdev1
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for device /dev/v4l-subdev1:

Driver Info:
    Driver version  : 6.12.0
    Capabilities   : 0x00000002
        Streams Support
    Client Capabilities: 0x00000[ 2429.125325] ov5645 0-003c: ================= START STATUS =================
00000000003
streams int[ 2429.134589] ov5645 0-003c: ================== END STATUS ==================
erval-uses-which
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
------------------------------------------------------------

Lad Prabhakar (10):
  media: i2c: ov5645: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
  media: i2c: ov5645: Use local `dev` pointer for subdev device
    assignment
  media: i2c: ov5645: Replace dev_err with dev_err_probe in probe
    function
  media: i2c: ov5645: Use v4l2_async_register_subdev_sensor()
  media: i2c: ov5645: Drop `power_lock` mutex
  media: i2c: ov5645: Use subdev active state
  media: i2c: ov5645: Switch to {enable,disable}_streams
  media: i2c: ov5645: Report streams using frame descriptors
  media: i2c: ov5645: Add internal image sink pad
  media: i2c: ov5645: Report internal routes to userspace

 drivers/media/i2c/ov5645.c | 435 +++++++++++++++++++++----------------
 1 file changed, 246 insertions(+), 189 deletions(-)

-- 
2.43.0


