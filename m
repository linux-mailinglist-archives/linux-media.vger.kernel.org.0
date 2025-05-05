Return-Path: <linux-media+bounces-31757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3369AAA606
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 02:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 911E67B1CEE
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537DE318E2C;
	Mon,  5 May 2025 22:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnH37VcB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B1A318E15;
	Mon,  5 May 2025 22:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484274; cv=none; b=E5SMyfS9c9zG6g3ZSHLTzZ+PmuYXN4qhEM0dXCkAcYFaebrk4WgNsZdAx2Q+yVM0MLnNUMaC6NCKqsA3pB+tGU22UHKFcxyy8nwBmTOwJmmMpAO18p6dnLm2nlj6qmErtkLFgtaJhD683RvK1AZBBnFgHv3iNOZ6aC8WLmNFfUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484274; c=relaxed/simple;
	bh=YBmUnIz0lRLqy9NV8rne2lhFQXwhUUaNHQ5HxAJ2PGg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=crQUa6zUJoeDljLvT2Bmsuaj7NqAd+JZXCZ3XDYO/7JlehjjZQnjSh9xeqWxmyFg0r8p+K+aR6R5tYs80tyZYgSHS6RWQG0anEeB5l0XUX7pHVgSQcEqKbdI0ce3mrlQIgStbGhelNUtsUaQ3HcEMjF9/BnAdR4fO5ihZY4xo0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnH37VcB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4A5C4CEF2;
	Mon,  5 May 2025 22:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484273;
	bh=YBmUnIz0lRLqy9NV8rne2lhFQXwhUUaNHQ5HxAJ2PGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fnH37VcBEHarjfF7yxs1AP7wF+qu+9slNiEcZn6noYM4c8tVeSxPJ7uDaxHABwu+l
	 qMflop6YBtBH0brojIbNRmnHAwxa3o1kUsLEKE4oOnb5KtQMDewyZhoMEjSmYe8N1b
	 mrt3muq7Bs6tpTs+/jj3bZYqijPIGNoic4PqaBsrP4hOmfoWfD9DIthzjewM7TIB+Y
	 Jl4jaaxsWBtwP47mW8t6nswa8Pit4AxyJNtgP2h/4BY4h3zTfD74fSRCi6XmfgsYSn
	 DB8DbGpKHOmUDodpxT7Rj65AXgFtV2A9H+Rb8WYO2/xVU/oERKFcj67EP4BEQzPxDT
	 a72CrVa8PvfqA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: David Plowman <david.plowman@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 428/642] media: i2c: imx219: Correct the minimum vblanking value
Date: Mon,  5 May 2025 18:10:44 -0400
Message-Id: <20250505221419.2672473-428-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: David Plowman <david.plowman@raspberrypi.com>

[ Upstream commit e3b82d49bf676f3c873e642038765eac32ab6d39 ]

The datasheet for this sensor documents the minimum vblanking as being
32 lines. It does fix some problems with occasional black lines at the
bottom of images (tested on Raspberry Pi).

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/imx219.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 64227eb423d43..dd5a8577d7479 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -73,7 +73,7 @@
 #define IMX219_REG_VTS			CCI_REG16(0x0160)
 #define IMX219_VTS_MAX			0xffff
 
-#define IMX219_VBLANK_MIN		4
+#define IMX219_VBLANK_MIN		32
 
 /* HBLANK control - read only */
 #define IMX219_PPL_DEFAULT		3448
-- 
2.39.5


