Return-Path: <linux-media+bounces-45746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C141C134B7
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 801D14F276B
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CBA2D73A1;
	Tue, 28 Oct 2025 07:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B76ipwWi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC612D6E74;
	Tue, 28 Oct 2025 07:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761636521; cv=none; b=fThV9t4xAsT0EZpByQfWbBYtVuPTw6dXbxTBLTOd8Eu0+Y+ffA4lox8I8QbAwCd7vB4tlckgJRxlua/fr6cdJ1P23mIkD2Sdom3QyY9EMrhfW0ULzoABu1/v3WnbssCIZyhPYnBIsU1HXuyZMZgXzRaDacCJe/PL1Ehv5HTHZKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761636521; c=relaxed/simple;
	bh=uhlL1+rGtT3FixHKqfVFrwRFvamKgHLjbuQUzUyVxjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KnD2kv/opRNfj7BccCkS13/mJ3Xnq3GOBYKwo8c6mXHd5//cvxH4W4Mdkc4ibrDewuBBHMVPZyuKh8z4wJQSGJWOeyOhIQeSSJ2HnDRuZCtw/ciL0LvNpucJ16QAWKgqa7betw6ha08aj/wE4x5vZcM3HMnfKsGD3dh0ZVH/iCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B76ipwWi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5C8016CD;
	Tue, 28 Oct 2025 08:26:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761636410;
	bh=uhlL1+rGtT3FixHKqfVFrwRFvamKgHLjbuQUzUyVxjw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B76ipwWiAyYE/GLnID7e1Hetf4vj6Q54s/hEaL9gWTl8MmOe2EpPPnoAd0Yi+3Xv8
	 OOtMx3FkM6aVgs7vJBulAZ8urYAhrQ7aeA5gbWtyTUxZ155oeEudK2T2lfuZqRnKb3
	 cr0fS0MiqBXrHPMaN/kzc3OwM2WgnpZ8Tuz7z0rE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 28 Oct 2025 12:57:19 +0530
Subject: [PATCH 08/13] media: i2c: ov5647: Use
 v4l2_async_register_subdev_sensor for lens binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4-rpi-ov5647-v1-8-098413454f5e@ideasonboard.com>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
In-Reply-To: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=869;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=9JGvy8SNuXsAUgJA+2YZKoOTql44ybWcLqyn8tSBJuM=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAHBx4tFHS+uhKrQqHOdtg8wV+3hqeRTLPApxc
 I9Qn4bfbk6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQBwcQAKCRBD3pH5JJpx
 RZ46D/9EtiLRDuKoEXI6eeEiSOigLtxt+J6UlGA0DB7upXa39+gv8SZyggRh6XGFuue+sUQd6m1
 25ib867raCbIHd5Gw6kWO9HHQELfo9j4g3yp41ELQYr8L1jqb/I9CXlJIZpl+JC6PTzlGQiNMcq
 XsgEOOqan7zCETIx1a0jGl6HcVjjTa/aT3bPGfB7hX5oiWSxrSvpE+Giih4qY3VfBaYDOWCgeoV
 YDy7bNQ510I8EnmooHeVZgw5hlRpA/QZXxDTP5TM37t7a89/o+N6XjksJrZalXyRhcdu64ySk57
 vPYBhLmSwUk6r/r0HbLRT95gL+LEIeKrjiRJm3IyHXSaLvu0tCSEIv+JWBxOjbGOkx8SKBgZRu7
 fx5IRvdFOizoiEBHOaNmQWTDzYVKnreKzD/5OLRCirtFScU0mPLL2RaU1/y/2vSkOuOLCOYMo53
 fjzTZUHCnAQC1ToUA2Ng/awqH2QPaLwIUnr0/FE+o5HrQf22OAKAZawMtMVuZvzu/q+HDqmoeF0
 aITW01Y3Ep0uzLbEHSjYAgELunvbhYRO+9P4+IDAUe2l3HnSYHaYQyw14JQCVuMnqrlUVeOlOkJ
 NwTqmIlYSf9ZnLCEdlDNWQ/DbsXGxtEIKKW8Uq4JSbuul6jXdXLENqNhVW3zJag3vKC92TH7AeY
 SiZKGQY0Bh5JKHg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

v4l2_async_register_subdev doesn't bind in lens or flash drivers,
but v4l2_async_register_subdev_sensor does.
Switch to using v4l2_async_register_subdev_sensor.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 598764638d518a28c8ac61ea590b996f09ecd45c..3aad3dc9b5cd0c24c07a37e2567e3c61c52e4fc2 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1553,7 +1553,7 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto power_off;
 
-	ret = v4l2_async_register_subdev(sd);
+	ret = v4l2_async_register_subdev_sensor(sd);
 	if (ret < 0)
 		goto power_off;
 

-- 
2.51.0


