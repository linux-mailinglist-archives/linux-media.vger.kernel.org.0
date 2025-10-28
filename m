Return-Path: <linux-media+bounces-45738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 53405C13490
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9E9374F2EC9
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77C42512F5;
	Tue, 28 Oct 2025 07:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jsZuXJxN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506F6239E63;
	Tue, 28 Oct 2025 07:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761636480; cv=none; b=QlfdMKGu2vjb+S1yY8yG2+cqfL92axtntyINmlZMicpKIYOH4Cmiq42pn3u3Tp5CFdSqXSdboTSTvut22YAMA9KfgJRr65FGdawUXIpBWOUEAXf6Xxy/+TaFUV3CuUXoBFiLCU9pebtBLXjvG7CmB2hwNCDTXIyh54g6rNBu2y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761636480; c=relaxed/simple;
	bh=2jeuwD+92Ty8xl8EjL6u5v1fH1GF4t7XvbCzvRoygtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EsTrxCtTLh/Ah8ThemDBLl4tQHe4u52g6KwsN+/KL4gdEiOieyQgyuAzCATMFv7RNSRXOu8pSzPahnVtPIENijZRDAL1vpYRHwKxIRS4JkMIIMjQ75PLNHhTt77MR7bvzLX4aBiJfJAugIOzZHdjrU6SrKbnja+XEEodY5Y+DUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jsZuXJxN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9176416CD;
	Tue, 28 Oct 2025 08:26:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761636368;
	bh=2jeuwD+92Ty8xl8EjL6u5v1fH1GF4t7XvbCzvRoygtU=;
	h=From:Subject:Date:To:Cc:From;
	b=jsZuXJxN7pibm7CapdyEsg3MohHfvDdEsE9/5MJEW7xL/je55JnJ2o713PwtJxr9J
	 JiAF3AfUPeswx7yK4IUDjZ5Hiu4KE70fkqX8FPZVxMShDgABjKgqNzLgkWvO5QHpWe
	 HdNH3UXZXVu8hx+15de2ZJKbknpJR+jbrCioPAgM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH 00/13] media: i2c: Miscellaneous features and fixes for
 OV5647
Date: Tue, 28 Oct 2025 12:57:11 +0530
Message-Id: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE9wAGkC/x3MPQqAMAxA4auUzAbS0h/xKuJgNWoWLS0UQby7x
 fEb3nugcBYuMKgHMlcpcp0NulOwHPO5M8raDIaM02QsRos5CV7VeRuQXPREwfXBG2hNyrzJ/f/
 G6X0/ZXlcU18AAAA=
X-Change-ID: 20251024-b4-rpi-ov5647-05b600758762
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=2jeuwD+92Ty8xl8EjL6u5v1fH1GF4t7XvbCzvRoygtU=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAHBfgmEmSBJUHo9bTK0bgElGntxNlnjbMR+9Q
 i+eJRFSO3SJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQBwXwAKCRBD3pH5JJpx
 RV5/D/9uWxbp4Sjh81IiZWOxLMC1ZRF5gqhNfDC8YiWC71DnDmsO/RfMjzGEEvyM4hBuCgN100L
 WVRtskizruUbGxtV2Od7FfcqgEk+IW8HTaA4XoMrjHQFWe/r7GfZMwia64QlBAc1o51NCqzNNKM
 nufV6phW9nFWAnYhDcvsWTNSIdq27p8gvA7wEkYnuYKsSS6Y6TqpJr57B8PyBScpa9YbdGaGj6f
 U/mAR4jZwSEvZ9b9Y+8bH8T5aPJCZz8g4d7jRs2tERZhM3nCr4K9BJGSKxzjoekVPAZ5bgzGZ5k
 U34HUAF+mPiImtZtFhkRuc4G7Q2INw1BfpRYGmtzlNtAjEdyBQ4TQTCJiM74d80HDli8lofQnNq
 wygMTRrnO0TEfc0X0mfwSLAqwweQ35xRJtEmutXPJmsH6NqGWvv8slzZFYYcGNc+tMUnMqHaj3q
 GePW/kXda4+FBiow0dnHeQW1uhCFCSXItIET45+5kJJyyPcIouyMrKhUpMcQ8wSN1M81fTUXFzL
 Dx2vD4FkswE7zHXOaTQQdDx8vt+w3Vw59UGD2mMAiJbNCymhAJnNbB8apNuWs1ablZQ4d0EkHyv
 ZDHL5hv5bFyPCg2XDjEQ/lfiBaT2g26UaX1dEX9nsjYuxjOogcgTuszOaKfLJ0dVCy0+2juvS06
 CfBirRxpjGPhajQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

This series adds support for some important features, like controls for
H/VFLIP, horizontal blanking, regulator controls etc. that are present
in the downstream raspberry pi kernel, to support their v1 camera
module.

Additionally, it also fixes some known issues with streaming lockups,
wrong pixel array size and compliance tests.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Dave Stevenson (7):
      media: i2c: ov5647: Add support for regulator control.
      media: i2c: ov5647: Use v4l2_async_register_subdev_sensor for lens binding
      media: i2c: ov5647: Add control of V4L2_CID_HBLANK
      media: i2c: ov5647: Tidy up mode registers to make the order common
      media: i2c: ov5647: Separate out the common registers.
      media: i2c: ov5647: Use the same PLL config for full, 1080p, and binned modes
      media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY control

David Plowman (5):
      media: i2c: ov5647: Correct pixel array offset
      media: i2c: ov5647: Correct minimum VBLANK value
      media: i2c: ov5647: Fix v4l2-compliance failure subscribing to events
      media: i2c: ov5647: Sensor should report RAW color space
      media: i2c: ov5647: Support HFLIP and VFLIP

Laurent Pinchart (1):
      media: i2c: ov5647: Parse and register properties

 drivers/media/i2c/ov5647.c | 447 ++++++++++++++++++++++-----------------------
 1 file changed, 216 insertions(+), 231 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251024-b4-rpi-ov5647-05b600758762

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


