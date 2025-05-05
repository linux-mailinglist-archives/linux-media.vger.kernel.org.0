Return-Path: <linux-media+bounces-31792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F0DAAB16E
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 06:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5973F4E4FD9
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 03:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E283F8A0A;
	Tue,  6 May 2025 00:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGK/Iek4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8AA361957;
	Mon,  5 May 2025 22:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485484; cv=none; b=ShdRmx5clf6N3d5tPQTNcvjAb5m0PfeOpWNsyZ2KP1Ww5+rs70khIqZnz6dbN9PJle6nuXHH1kp8k7XtkAQkiVvUzcrkKUZ0xy+QhjDpVU5b5f7pbhUkVnaz96zvSg+DGU2lsVzZjDbSzdK5nHejdMmNrbkaDO6wck/Hb0TRTZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485484; c=relaxed/simple;
	bh=9gbYbTE0WZ+udZ9d6dBdYv7OPC+50CcyB2AOMmpKzDY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BOsFP4lf0w7Gdcv4vmfetE96mpneJCtAWhZT5BP7mD8qa098TnwNHBAsAgP+451rpsf0oSNartz6KDJ9MGMDJ/f0WY95CAIDC9BfIJHs0u+eA5+h4iWUYSSwp2i5FXrjTSxti1bFdXibnIdUBUkjlr0WujavzTeGj087tq2tYDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGK/Iek4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F0FC4CEED;
	Mon,  5 May 2025 22:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485482;
	bh=9gbYbTE0WZ+udZ9d6dBdYv7OPC+50CcyB2AOMmpKzDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OGK/Iek4BsL7UpfoxhtSKFlw+7QJmZ3ynE12WHGbF3dWiiMz6d5rt9Mdc0glUfXUx
	 DiQGnkBRnNpslybcpJ7+5pEon+phbi73+y12KctkXshw+h6BCrI4E1uFWvSuyxytG1
	 IXSWiXoaFEKWfhsrCP44AqvP02Am2yoZnZCPdyURozOtMNPyz44gXm0aOVbb7X9Swt
	 yKEs1LQ5Pou5L6+n6Ar0dIxrLOhoMjaqO7oSJ0ibjawUaImYUQhF+0WKn03MqxxV4V
	 btoBEcg9YoZZ768XzuMW9ps+iddzzNPuguCAjPnY+H1o5IPc2hWJt3jZeqwgyIy6Hf
	 C79XEeM03xswA==
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
Subject: [PATCH AUTOSEL 6.12 339/486] media: i2c: imx219: Correct the minimum vblanking value
Date: Mon,  5 May 2025 18:36:55 -0400
Message-Id: <20250505223922.2682012-339-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
index 906aa314b7f84..eaa1496c71bb2 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -74,7 +74,7 @@
 #define IMX219_REG_VTS			CCI_REG16(0x0160)
 #define IMX219_VTS_MAX			0xffff
 
-#define IMX219_VBLANK_MIN		4
+#define IMX219_VBLANK_MIN		32
 
 /* HBLANK control - read only */
 #define IMX219_PPL_DEFAULT		3448
-- 
2.39.5


