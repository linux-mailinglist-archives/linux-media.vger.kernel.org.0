Return-Path: <linux-media+bounces-48748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CB1CBCC60
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C093C30204B8
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 07:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D8331353D;
	Mon, 15 Dec 2025 07:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FJKlElHJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAF8313528;
	Mon, 15 Dec 2025 07:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783804; cv=none; b=IbLRWQnc1PX6macuf+g8u/onNYRehCT6drZEEEu6Vs74d3u2U8uSBxMUHtCSSgfuYgq6M60oASjteoYG+kr/FQMKq5gDQ2Kt51F80xrmElKlW7BLEOeYjnu6nXUo7sAk7tFAHYQorFAjPxPadG52EI9xNF6zNkBaHuEWBObxAuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783804; c=relaxed/simple;
	bh=0vG50YX80bYDSrfIcyivpA/rfkbcjkjQ0pH+3E253Po=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F34ku5AXbo8ujuBe9n5V5Fs4HcitRmWPfV0r6C9BQy5j8xbiwUPS4fVXoeyhBTDbvfydsQoGZEC1HxwqtBOdPWHKzl9opMhSLyMaKC3OuUgIgpRifzP5V5wnXMuET3qlJImOVgNj2IPJcMAODK44zRMabjQWaqlcQrH7n51MofE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FJKlElHJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9954581;
	Mon, 15 Dec 2025 08:29:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765783794;
	bh=0vG50YX80bYDSrfIcyivpA/rfkbcjkjQ0pH+3E253Po=;
	h=From:Subject:Date:To:Cc:From;
	b=FJKlElHJqmjA5UAArsvQ+DQGGP2EABFOckoxD7VUmkhE0MIcji6V2pbfkPig5cg+L
	 TW5XR55xllWmYFfHR2f69kFgPb2Jk//qZMh8AR0sseJ792zY5MAUZ/4hWc3E67sHLX
	 Y46PtPo3ixOGLhsChqrLeGkcafvm5Z+iJibDQ6SE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 00/16] media: i2c: Miscellaneous features and fixes for
 OV5647
Date: Mon, 15 Dec 2025 12:57:56 +0530
Message-Id: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHy4P2kC/23PwQ7CIAwG4FdZOIsBLAM9+R7Gw2Cd9uCYMIlm2
 buLGmOiHv82/5d2YgkjYWKbamIRMyUKfQmrRcX8sekPyKktmSmhtBQKuAMeB+Ih6xoMF9rVQhh
 tTa1Y6QwRO7o+vd2+5COlMcTbk8/yMX1L9kvKkgsu1hbkCjR0GrfUYpNC70IT26UPJ/YAs/ogU
 v4gqiAajUXjnenW7g8yv86MeL6Ub8fXrcw1CXnZn2jcVLYTDrxHACtLYb4DYFDXpyYBAAA=
X-Change-ID: 20251024-b4-rpi-ov5647-05b600758762
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2943;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=0vG50YX80bYDSrfIcyivpA/rfkbcjkjQ0pH+3E253Po=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpP7jWBWUS8xa54jo54noedY2VdLIT1+q5xk+3/
 U2zL29cyvWJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaT+41gAKCRBD3pH5JJpx
 RUGkD/9pM62F3HhhjhM+5RLWgD4qZGppXwQBqqfDnIEw18rlpM3rBPiQcJVFAevC4bW6QmIxvFV
 yI9AQmpiKWWRHL4TfC1T3YlSILVlcL1KwgOwN2h2y9m1caOV3ycc9l1D0IQT+1PgVvVOiwQEpfu
 LEhTVVLbNTDZQlSYocNcN4UG65GqaNRbP1WoqOn/Y1fVIsuaPP20psZKnU6QX3BAuqFB7MA1EaC
 qujyIrN84Lk+7I13P91fVTMZKw/jprS58KWSRuFjY1+SNEudmSs8VlyEPtONdbYRvmQ6y9wB5I3
 kckUAv6G+o0rSdESfutdDc6wfoNBKNKby11sjgwduyTUaLM07rDngtJQ+QouH7sbkLoiN5F1YbH
 BV+lGRhMuaT29G0Vt4l61JKBoiTFLt3+Ptb/Kq6cI85glP+qeo7TwSH08KaTGhsjKVHU0s0rJa2
 KUYVv3m03Np8EUquT279JG+++P602Bpp99y2WzekdX9gK2nyGTBH74CbLZUW4rnwf9KY7ZuoPV8
 eu10c/rlS+wIcIQMOenLg9O92RkuNomddPG59qk/SQUd9JIYyDda+rBjzivT5nywiicOKvRigi7
 Lsp/hAvccVv1rY+4Qecb/LWhl+T81vhDNqFr/vM1qXFfxgCIZXeyz+e2/K+St3N5hGjKnkFMYCS
 us72/uALiLx2JgA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

This series adds support for some important features, like controls for
H/VFLIP, horizontal blanking, link frequency and regulator support that
is present in the downstream kernel to support the Raspberry Pi v1 camera
module.

Additionally, it also fixes some known issues with streaming lockups and
wrong pixel array size.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Match the default register value in all mode tables with the default
  value for the horizontal flip control (i.e. 0x3281[1] = 1)
- Update pixel rate for VGA mode as discussed in [PATCH v1 13/13]
- Set default link frequency value using the default mode as Jacopo
  suggested in v2
- Add review/ack tags from Dave, Jacopo and Krzysztof
- Link to v2: https://lore.kernel.org/r/20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com

Changes in v2:
- Drop [PATCH 4/13] as it is already present in mainline
- Add a fix for a potential segfault by reordering ov5647_init_controls
  after v4l2_i2c_subdev_init in the probe
- Add 2 new patches updating dt-bindings for regulators and
  rotation/orientation
- Add a patch for cleaning up the PIXEL_RATE control
- Reorder the patches in the series, moving all fixes at the start
- Fix review comments from Jacopo, Stefan, Kieran and Dave, picking
  Jacopo's R-by tag on a few patches
- Link to v1: https://lore.kernel.org/r/20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com

---
Dave Stevenson (7):
      media: i2c: ov5647: Add support for regulator control
      media: i2c: ov5647: Use v4l2_async_register_subdev_sensor for lens binding
      media: i2c: ov5647: Add control of V4L2_CID_HBLANK
      media: i2c: ov5647: Tidy up mode registers to make the order common
      media: i2c: ov5647: Separate out the common registers.
      media: i2c: ov5647: Use the same PLL config for full, 1080p, and binned modes
      media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY control

David Plowman (4):
      media: i2c: ov5647: Correct pixel array offset
      media: i2c: ov5647: Correct minimum VBLANK value
      media: i2c: ov5647: Sensor should report RAW color space
      media: i2c: ov5647: Support HFLIP and VFLIP

Jai Luthra (4):
      media: i2c: ov5647: Initialize subdev before controls
      dt-bindings: media: ov5647: Add optional regulators
      dt-bindings: media: ov5647: Allow props from video-interface-devices
      media: i2c: ov5647: Tidy up PIXEL_RATE control

Laurent Pinchart (1):
      media: i2c: ov5647: Parse and register properties

 .../devicetree/bindings/media/i2c/ovti,ov5647.yaml |  14 +-
 drivers/media/i2c/ov5647.c                         | 465 ++++++++++-----------
 2 files changed, 235 insertions(+), 244 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251024-b4-rpi-ov5647-05b600758762

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


