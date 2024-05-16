Return-Path: <linux-media+bounces-11563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4538C7A81
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 18:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6806B228ED
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 16:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0A28821;
	Thu, 16 May 2024 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b="r8GDm5o/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337884691
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 16:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715877724; cv=none; b=g1Mm8zOr3q/+aUyo4+wjRUkrC/rFAu8uJHLr3UCzjiy329FhYrjOotmrG/VfDlM4lYv1U26qljQ6RJjRSmPLNWhIi28dkUgEBxUDwgB6Wh71CXUTvQOs7ER1Z2ic1FLjv4lUGKu7tpsJeGxGwWzRHSzEaZcXx/fawM4vkSlWyAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715877724; c=relaxed/simple;
	bh=mxll5xxw2+woIo0YePpQQe3rrI/nIpWL50vmYS+HKyc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EPwfQapRI6kinjJvq5UGyxwL27uhpE7R8mJHV+LjMPmknhuS/Ppohby63yMg0LOvk9lnc1jh5G/8THvR+0sxJBPQ8Vj+nb3WosBEtN01tzFDMJ3dP0Lk3W4araKDfNHp39zD93RIUsfMnKX+LArc+6oF+tbKSnTAFxFav4x9PHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com; spf=pass smtp.mailfrom=melexis.com; dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b=r8GDm5o/; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melexis.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56e1f3462caso3825538a12.3
        for <linux-media@vger.kernel.org>; Thu, 16 May 2024 09:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1715877720; x=1716482520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Cb8dShJT33kyCePvvinLpUFOu4us+UHVwkmEcdeGPc=;
        b=r8GDm5o/jx1wKs7Ne87akl9SyQHsYCrPBIE7sAND+DTBLuBrXYEGC0bjITn244kdfA
         D/qF8iSQpZ7M45UPVGKTtzIWzeNjD4Th2BM5XfwgZySh4K/sJmU43VwdprzRHi/pf9I+
         5jBSt8gZDfGTMqyoBeTjzMTsnj9xnQhg/Ln1q0K6/RhoZlLjxudF4Cuzs5WcEK4cI3dk
         zvMTojBkoFI0c80N6UxPXbXol+1bmacBkYl925iSn/PeVN6xL6uNQmAjvLgNxZog/B3P
         h0dkIkQ3fssed0LjQSeP7icPSpyT7Sf3BmwXf4BjQPR0ds4b14sWYiw9Q98qepNKtgfh
         rSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715877720; x=1716482520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Cb8dShJT33kyCePvvinLpUFOu4us+UHVwkmEcdeGPc=;
        b=L2sz5sp0YCdxSPeF3Bdhx8Xq9pd8CyY8i7xTrNTEXKJFFJG2uT4WMkfgKShDA5v6K5
         2j+wB1bVboG5UTy31OjFvkzCbcJi9Z4xid0+DhLh4ayh/KPddPdnFtGg12atRv18Krcc
         rbzRLIjWPnhKV0N72fOnBgBrv1FYPI/GhDTuLjz9wTVwxNlxPN5u0tqXB+n7kPzfBplQ
         oLO+WzVhxK6jwmMrUQs6Sbwq+WoKkbQdGs8lcTCDoG5yf1YyFUlT3seWTZj70+XRxm+l
         phVN+pnqDAfcCfR5rKsyQaHFBEJH9RGMTB23K/vY41za2ehRvl/8wqrEAI7BW+mkcO8J
         yIPw==
X-Gm-Message-State: AOJu0YyyF7CTrxkyuCZsuHMjfpYo+mf6/Vuj3nDmPvatV1CX0eRZ9Wqn
	euRhfOSDI/DDjTDdaLqvUeLfFoFZdy0eppTB9ybG7LAUPbMGwXvaEDXnIVDMmaJEwNi12v1JXHF
	YnqXGkfsa5QkoafH4a0FIjO/fRX+bbx1errrnsCH+r2aVBsubRgqZTLnr6sz+0KIA9/WJLiZGwB
	BI1p0mjCyCnJrWh7F24Z6s8HGY2772aKOWKTjd6cfv
X-Google-Smtp-Source: AGHT+IE/eCmWoo5YaWCXdZbGWXFBwLtGdfHBkK+Am/lUXfJ9urlCsbYXEK5FB3nZXfQ4P88fPA/+OQ==
X-Received: by 2002:a50:8d07:0:b0:571:e272:296 with SMTP id 4fb4d7f45d1cf-5734d67ee8emr13450798a12.27.1715877720520;
        Thu, 16 May 2024 09:42:00 -0700 (PDT)
Received: from melexis ([91.192.181.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c322c3csm10778449a12.83.2024.05.16.09.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 09:42:00 -0700 (PDT)
From: Volodymyr Kharuk <vkh@melexis.com>
To: <linux-media@vger.kernel.org>
Cc: Andrii Kyselov <ays@melexis.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Volodymyr Kharuk <vkh@melexis.com>
Subject: [PATCH v6 00/10]  media: i2c: mlx7502x ToF camera support
Date: Thu, 16 May 2024 19:41:45 +0300
Message-Id: <cover.1715871189.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all,

This email provides updated patches for the Melexis 75026 and 75027 Time of Flight
camera sensors. In version 6, there are fixes and improvements which listed below.
A key addition is trigger mode, introduced in patches 1/10 and 2/20.
This allows userspace applications to trigger frames with more precise control.

These patches have been successfully tested on Trenz TE0820 board.

v6:
- fix step of roi and compose
- remove redundant register set on mipi configuration
- add V4L2_CID_CAMERA_TRIGGER
- add V4L2_CID_CAMERA_TRIGGER_MODE
- implemented trigger mode in the driver
- use subdev state api
- add holding for VFLIP and HFLIP
- remade frame interval

v5:
- MHz to Hz for V4L2_CID_TOF_FREQ_MOD

v4:
- fix output mode
- forbid array for menu and warn if validate_new return an error
- add enums to custom control OUTPUT_MODE
- update doc
- minor fixes

v3:
- move FMOD, TINT, PHASE_SEQ to common V4L2 as ToF common controls
- FMOD and TINT became dynamic arrays
- remove PHASE_NUM, use dynamic_array for PHASE_SEQ,
  ctrl->new_elems pass number of phases
- remove leden-gpios, will be used gpio explicitly in library for now
- remade probe: use probe_new, no power on during probe
- remove autodetect and wildcard
- make all supplies to be required
- remove trigger ioctl, will add in separate patch series
- remove temperature ioctl, will add in separate patch series
- add documentation about custom ioctl
- style: 80 cols
- minor fixes device tree

v2:
- added external clock to the sensor
- added all regulators required by the sensor
- added posibility to choose sensor type in device tree
- added prefixes to all custom types in device tree and driver as well
- style fixes

Volodymyr Kharuk (10):
  media: uapi: ctrls: Add camera trigger controls
  media: v4l: ctrls: Add camera trigger controls
  media: uapi: ctrls: Add Time of Flight class controls
  media: v4l: ctrls: Fill V4L2_CID_TOF_CLASS controls
  media: Documentation: v4l: Add TOF class controls
  media: v4l: ctrls-api: Allow array update in __v4l2_ctrl_modify_range
  media: v4l: ctrls: Add user control base for mlx7502x
  media: uapi: Add mlx7502x header file
  media: dt-bindings: Add mlx7502x camera sensor
  media: i2c: Add driver for mlx7502x ToF sensor

 .../bindings/media/i2c/melexis,mlx7502x.yaml  |  126 ++
 .../userspace-api/media/drivers/index.rst     |    1 +
 .../userspace-api/media/drivers/mlx7502x.rst  |   28 +
 .../userspace-api/media/v4l/common.rst        |    1 +
 .../userspace-api/media/v4l/ext-ctrls-tof.rst |   56 +
 MAINTAINERS                                   |   11 +
 drivers/media/i2c/Kconfig                     |   13 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/mlx7502x.c                  | 1845 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |   25 +-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   32 +
 include/uapi/linux/mlx7502x.h                 |   28 +
 include/uapi/linux/v4l2-controls.h            |   22 +
 13 files changed, 2177 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/mlx7502x.rst
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
 create mode 100644 drivers/media/i2c/mlx7502x.c
 create mode 100644 include/uapi/linux/mlx7502x.h


base-commit: 8771b7f31b7fff91a998e6afdb60650d4bac59a5
-- 
BR,
Volodymyr Kharuk


