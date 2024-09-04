Return-Path: <linux-media+bounces-17620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8434296C922
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 23:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07FF31F241AB
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 21:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDFE14EC77;
	Wed,  4 Sep 2024 21:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S30JOPQe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF8E84047;
	Wed,  4 Sep 2024 21:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484066; cv=none; b=TDpJIHgG18KdaMauwTW6SkHgy2jaIbGK2ORi2rHjV14BrrBwjxn+bvVEUjPkiBTlfalLQw9sigT6XKJ+vKh4ZbWNX8OxVFTkceEJqS60nui48+H2NuSoecbLeKjSM2FbLdnXgd16VzAVkfzKbQ427neSooYxAJ4vtRo0gQmU05Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484066; c=relaxed/simple;
	bh=UGTJYGv+0UmGj+Ze0pdlYqBkQwyEedTIWoYfk5nRgb4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bb6sC4CpfJxZS+iCSQ8qjyGOAeVyFN0JcJtd2wTx7rRg2V3bFCObkbbwmkVUXWxqfPWHcMxYki1sBuksHhsjSjvbv+1Bj/gzRNzyEjEuxtUaGBDSCxAVkM7hgRGzej6PpeA9Dd9dAhwDLx7BZi4QyQCr+tR0j6ZPHsjEbapvr8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S30JOPQe; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428e1915e18so57897165e9.1;
        Wed, 04 Sep 2024 14:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725484063; x=1726088863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5OiiYFimXSQBkHtC8xC7+fpH0+JqA60CxzJJEPbycak=;
        b=S30JOPQeMCJteCt7/HY9nAO7IUgQAoUBEd+zTu7/iBheOmY+Ikq/UuAL84U6GR1InB
         hstl+zPiYzfB+ClLeERWW0+ricCmcpZkIQ8B9wMJJGXzrdCulI47NLw/YGRx41zYLmy/
         JUMt7LGa45lvT441dS9mSJZYEj0+G1M9Fi4fDxXAO1+TuX5S3Mj0YTk3ZlCBnv0bctQT
         +iL1TErcWRIdJh+aRCnXj1C8NWeMKtpseFdMc6E6W4OYQUdO4VzqP/r8YYSUMGadEO5X
         w739r8UZXd4LA8eqdH1r921SgOqCaUcTafucQ9Lu81MXggnZUBX1feQninyeK0xvMcnH
         cP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725484063; x=1726088863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OiiYFimXSQBkHtC8xC7+fpH0+JqA60CxzJJEPbycak=;
        b=TKn/LcMsrwpMAeUOH7tzbpRT9B5gNXPNS+nhtcKxOKwfEDZqwOphUxZ7aNxOGjSH8b
         qunRVTgz9Ba8DelLgC/E9RK+pPAcAqwzKRPHFCaeYXFrss2ZxZQQ8Ra/cOJgCFhXc5j0
         6L1spgTxvH/UpQ7wVm63wBxHNIfqFn1SRPMNVjfQVDmqvHtDJwZH3YWRWJB7RUAjo2pc
         tBkxYFbrO3PDPlRdwdbDZZQBPujjx5bdOsFbOhqCxi6E9IxHADUCsTxR7tdIw7h9WDpY
         d8nA8y1E7lzeFinemWfZiqDRwTbiBnu0L6YYZnGa5DidTZrOxQG6I1Cx69mKfA9P16iY
         74ag==
X-Forwarded-Encrypted: i=1; AJvYcCVpyUf8JRZ2bVL5vjrmP2LUMDZzocPHmRo3JVySGNrrjbHnDonRQ7pa3jh7klefNr1Uw23DGiMktcKtX0Q=@vger.kernel.org, AJvYcCXYx8N2d3Mtb02/hV544Ps4WaNDhroG8QMMtoJ1UmVz/L5gEbRsbu128sPgnUMYq6Gkajgs9kRkHawj8cAlXck9UfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmTeGLlLljMKJJD1LZa0C89pYEfNB7pREXMHd86iHFH+phPW/w
	YWbRnPJqwxk+5BcdKOlU8laHBgtDtfb/H1T9myJ2NFrx/UiBp223
X-Google-Smtp-Source: AGHT+IEisZfpjh5yr9l6IjozsVxAz5zCuH1MG1Vkuxvikw5aLmvlyJiyUkuG0hGlWfs2IGpkAl+blQ==
X-Received: by 2002:a05:600c:3511:b0:426:6f1e:ce93 with SMTP id 5b1f17b1804b1-42c7b5f0e91mr93463875e9.33.1725484062449;
        Wed, 04 Sep 2024 14:07:42 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c57c:1e61:792:2ab1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c7a41bdc8sm158821485e9.3.2024.09.04.14.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:07:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 00/12] media: ov5645: Add support for streams
Date: Wed,  4 Sep 2024 22:07:07 +0100
Message-Id: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Sending this is as an RFC, I've done limited testing and Im seeing issue
when route is updated and wanted some feedback on the implementation.

When route is updated for the sensor with below command, and when start
streaming I get "Dangling sink streams: mask 0x1" error. Should the
corresponding bridge also need to support routes to fix this? or is it
something missing Ive missed in the current implementation.

$ media-ctl -R "'ov5645 0-003c' [1/0->0/1[1]]"

Output after route update:
- entity 4: ov5645 0-003c (2 pads, 1 link, 1 route)
            type V4L2 subdev subtype Sensor flags 0
            device node name /dev/v4l-subdev1
        routes:
                1/0 -> 0/1 [ACTIVE]
        pad0: SOURCE
                [stream:1 fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb
                 crop:(0,0)/1920x1080]
                -> "csi-10830400.csi2":0 [ENABLED,IMMUTABLE]
        pad1: SINK,0x8
                [stream:0 fmt:UYVY8_1X16/2592x1944 field:none colorspace:srgb
                 crop:(0,0)/1920x1080]
              
v4l2-compliance log after this patch series:
--------------------------------------------
root@smarc-rzg2l:~# v4l2-compliance -u /dev/v4l-subdev1
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for device /dev/v4l-subdev1:

Driver Info:
        Driver version   : 6.11.0
        Capabilities     : 0x00000002
                Streams Support
        Client Capabilities:[   53.919041] ov5645 0-003c: =================  START STATUS  =================
 0x0000000000000[   53.927271] ov5645 0-003c: ==================  END STATUS  ==================
003
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

Cheers,
Prabhakar

Lad Prabhakar (12):
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
  media: i2c: ov5645: Add virtual channel support

 drivers/media/i2c/ov5645.c | 507 +++++++++++++++++++++++--------------
 1 file changed, 316 insertions(+), 191 deletions(-)

-- 
2.34.1


