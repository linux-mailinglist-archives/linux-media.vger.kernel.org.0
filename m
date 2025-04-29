Return-Path: <linux-media+bounces-31310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BE8AA0C77
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 14:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 865F33AC2F6
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBC42D191F;
	Tue, 29 Apr 2025 12:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vNkKi2/n"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FFB277010;
	Tue, 29 Apr 2025 12:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931557; cv=none; b=okBK2LgUjl1LHR+nAaT/7pnlLMyXlZSVMNMtH+U12iiB1uUg0d0geBjaZL5kzUKaXwWyfl9A5AO9V78iNFlvvV6yDYFEIeGVGOJ6G1Pi/gvoDxxKJw7xfKbUMkGJJ6Z7ZDkxtiH6nGzA4F4clKEQSCD76m3EsXlCf11eZkwDDxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931557; c=relaxed/simple;
	bh=2z1C8aiGut4OFg6hwle9DwiM2L+/ljeLGm2qQZiDTEo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C0Na6/1KgSreLI2pD9xev6wUJpz2PBTv4YLdaFsjKQyVi9NjBEOcDdXbapKpZDhZPM3opO4EJ7wERn/4IeW1waFDiSH8v+R/vo8a7C2f3b5H4kFA/Hgq3hbBHMYCYwhhahvcrmzZHdzWRL5t44QFgW5KV00e4GAdrFQC/VsbaR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vNkKi2/n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39E1AC4CEFC;
	Tue, 29 Apr 2025 12:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1745931556; bh=2z1C8aiGut4OFg6hwle9DwiM2L+/ljeLGm2qQZiDTEo=;
	h=From:Subject:Date:To:Cc:From;
	b=vNkKi2/nKWqurF8AWKtXNjWaOAFaPdgu5oYHdZ3iNXuVGZtQlAB74pDLH6s9CkXIz
	 YRpBDBTPhE0sOKzwKa+NWraLHWZqy01GoR1K7PIL3R8QvlFPs1gPLrdRei134064WC
	 cyeKlkwt8gum9cBgIshmF9kFw5S5QFzN6Hw7/p/w=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27021C3ABAD;
	Tue, 29 Apr 2025 12:59:16 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Subject: [PATCH v3 0/9] Add strobe/flash duration v4l2 ctrl & use it for
 ov9282
Date: Tue, 29 Apr 2025 14:59:05 +0200
Message-Id: <20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABnNEGgC/33OwWrDMBAE0F8xOneLtJacxKf+R+lh5V3FgmCnk
 iNSgv+9ikNpDqXHGZjH3FSWFCWrvrmpJCXmOE81tC+NGkaajgKRa1ao0elWtzCXA+4RwonyCHl
 JsxegofOs9XBg6VRdnpOEeN3U949HTvJ5qfjyKH/tvtlkRAfe/uBHihNIMAOTJ+cD98WoOzTGv
 Mzpa3tbq7v077FiQIMO7HZkXGc9vZ3idLm+spTNK/hkGPu3gdUwlneEe9Na5GdjXddvNBXpoUM
 BAAA=
X-Change-ID: 20250303-ov9282-flash-strobe-ac6bd00c9de6
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931554; l=2903;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=2z1C8aiGut4OFg6hwle9DwiM2L+/ljeLGm2qQZiDTEo=;
 b=tOpPmX2FLIW1sYHJ4M1PLeJXlOEXr65fEreCHoAuuLeNdhFf0LdHzwa3d8KlnVGM1HosYgAS+
 mCf8s6WAKNBBwzBfpgMvfACg+NUTlUxSw41nRvA68NwCg5i38pFfvqq
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

This series adds a new v4l2 controls named "strobe duration" with id
V4L2_CID_FLASH_DURATION. This control enables setting a desired
flash/strobe length/duration in µs.

As a first user of this new control add basic flash/strobe support for
ov9282 sensors using their "hardware strobe output". The duration
calculation is only interpolated from various measurements, as no
documentation was found.

Further flash/strobe-related controls as well as a migration to v4l2-cci
helpers for ov9282 will likely be implemented in future series.

All register addresses/values are based on the OV9281 datasheet v1.53
(january 2019). This series was tested using an ov9281 VisionComponents
camera module.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
Changes in v3:
- create separate patch for leds driver changes (thanks Lee)
- Link to v2: https://lore.kernel.org/r/20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev

Changes in v2:
- remove not needed controls in struct ov9282 (thanks Dave)
- Fix commit message of 3/3 regarding framerate get/set (thanks Dave)
- Add V4L2_CID_FLASH_STROBE_SOURCE impementation to ov9282
- Add new V4L2_CID_FLASH_DURATION control (as suggested by Laurent)
- Use FLASH_DURATION instead of FLASH_TIMEOUT for ov9282
- Link to v1: https://lore.kernel.org/r/20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev

---
Richard Leitner (9):
      media: v4l: ctrls: add a control for flash/strobe duration
      leds: flash: add support for flash/stobe duration
      media: v4l2-flash: add support for flash/strobe duration
      media: v4l2-flash: fix flash_timeout comment
      Documentation: uAPI: media: add V4L2_CID_FLASH_DURATION
      media: i2c: ov9282: add output enable register definitions
      media: i2c: ov9282: add led_mode v4l2 control
      media: i2c: ov9282: add strobe_duration v4l2 control
      media: i2c: ov9282: add strobe_source v4l2 control

 .../userspace-api/media/v4l/ext-ctrls-flash.rst    |  5 ++
 drivers/leds/led-class-flash.c                     | 15 ++++
 drivers/media/i2c/ov9282.c                         | 92 +++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  1 +
 drivers/media/v4l2-core/v4l2-flash-led-class.c     | 13 +++
 include/linux/led-class-flash.h                    | 18 ++++-
 include/uapi/linux/v4l2-controls.h                 |  1 +
 7 files changed, 141 insertions(+), 4 deletions(-)
---
base-commit: ca91b9500108d4cf083a635c2e11c884d5dd20ea
change-id: 20250303-ov9282-flash-strobe-ac6bd00c9de6
prerequisite-change-id: 20250225-b4-ov9282-gain-ef1cdaba5bfd:v1
prerequisite-patch-id: 86f2582378ff7095ab65ce4bb25a143eb639e840
prerequisite-patch-id: b06eb6ec697aaf0b3155b4b2370f171d0d304ae2
prerequisite-patch-id: b123047d71bfb9b93f743bbdd6893d5a98495801

Best regards,
-- 
Richard Leitner <richard.leitner@linux.dev>



