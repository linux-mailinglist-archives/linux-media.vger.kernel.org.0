Return-Path: <linux-media+bounces-47275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B38C69452
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D702C3600CB
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C40353899;
	Tue, 18 Nov 2025 12:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BX9sq57b"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C284354AE6;
	Tue, 18 Nov 2025 12:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467425; cv=none; b=ZnfTxbjxqUX6/nIGqpcp1RSJdzS6Fn57gU+totE8EwNtmvq6qIejK+eeXuI7hMwnWJXJ5koUyGGvwoSPTn10EUte0OVOxOaOJbIJodjydz/Jn3ONra6TyhOEUXEreMh70Dz8Hfhw2hxbzhYFkEh7FIVhJyNXfkzYH/TPA3fzIqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467425; c=relaxed/simple;
	bh=4o2wSEZtfhxVZELUbPZsLlNJj6/xjS1zxgpkP1Hnv/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f0R53JFhV+eAIG9Zk0NxKWarONWkTR9AXehGcfurNQBJhbUH1UskGoHDAIcU7qOJCVB7DUM48vgBsUU9aKLZTtbcJoyLsrpLpoUEHds03aMOWLYzSqCGUZoiX33oE8Gm4I5YwMgbqwT7h41izpzeZ0IwF/pxAb5P27zl1FfPOi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BX9sq57b; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1EDC20F5;
	Tue, 18 Nov 2025 13:01:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763467299;
	bh=4o2wSEZtfhxVZELUbPZsLlNJj6/xjS1zxgpkP1Hnv/w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BX9sq57b0p9OzKCQnbqdOTKeRqUGW5RkwMfjaz2BUsGZ2vnYu0xJuX6O2GCNFA3Lu
	 vh43NNKacB741q/jrb/g+rjrLPrgCXfeE4baKAZLtMeb4pCsX64mcJcjavptL7WBEk
	 Wsp2GnaDHh9FQ2f5osemR853zLHj4j+nRilA70c0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 18 Nov 2025 17:32:56 +0530
Subject: [PATCH v2 03/16] media: i2c: ov5647: Correct minimum VBLANK value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-b4-rpi-ov5647-v2-3-5e78e7cb7f9b@ideasonboard.com>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
In-Reply-To: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
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
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=1muuSQ4oB1srNRF7JZwbFGZgnharHekQalVk0S8hxDY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpHGB8F3t3XFPo0hnEoI2NSVeekUgI7Vy381cbo
 tyiEUanSB+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaRxgfAAKCRBD3pH5JJpx
 ReHKD/4lnDyomT7XosGfVPwyrHCNz8iauvzQYs4tCWeg8NrqN0w/Z2GaGggMtuNnkCvbsT4eTk2
 EG82I1Xy0w8Kp+OhVxYybmatdpGGVhy2rd5r+eD5ZHs21Mo+m+onRKwfxG7PBdZGMcdaz2wg7jV
 jZfW7Q18D/0O3dzERLwGs8LbnYvCCWvkACQkXIDR3bAl95xQJJHoCSxtjEI/R39f35n3tC6eV61
 7GvqxvUXmG/VJZeOjJH+Nc7qWB8+0X/fBSwKFxBiLm9E+1WJAQYIHw4ZlKNnnXSEyIo0hMhf+ul
 MAEKsVhRwsHCbjS4+FmVvp+AyPqVfkx9iGtoHoexLylGUEU9/88FZS6p3Fh7rWVKFN65dYNIW4z
 crYL9Cxs/99dENKWJ7c2HShLS06oC+rJZV1FU6+fVyPBmLRJC5+6gWnCAP79M8ELKjZtpFefK4/
 5FqjCeokwauLRsg/1t0+8RoOuCEaioFGaEPi9hxLsp8aNyP6eh7k8nYvz0BhNvDqWPMG08CZvvQ
 C3lv6tp4YertYEF7jsS58YUKAuJEIEGOQUTM7x9de8e2QOiGRgkJPcES71cTCG6CIoYN5Rabj7P
 raGuBJzrv/coq3ga90ZPXX0TzXsAap/xV2k4E9LR6CyObGAlyNQC+liJaOqBcjJABo5Q8B+Tjym
 ge2v9R+nq+qGtMg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: David Plowman <david.plowman@raspberrypi.com>

Trial and error reveals that the minimum vblank value appears to be 24
(the OV5647 data sheet does not give any clues). This fixes streaming
lock-ups in full resolution mode.

Fixes: 2512c06441e3 ("media: ov5647: Support V4L2_CID_VBLANK control")
Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index d9e300406f58e554de12d9062840353bdf7a226c..191954497e3dba4b1de4094b2ea1328a6e287003 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -73,7 +73,7 @@
 #define OV5647_PIXEL_ARRAY_WIDTH	2592U
 #define OV5647_PIXEL_ARRAY_HEIGHT	1944U
 
-#define OV5647_VBLANK_MIN		4
+#define OV5647_VBLANK_MIN		24
 #define OV5647_VTS_MAX			32767
 
 #define OV5647_EXPOSURE_MIN		4

-- 
2.51.1


