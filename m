Return-Path: <linux-media+bounces-31797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B292AAB362
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 06:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04A7E3ABFC1
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 04:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A8D22ACF3;
	Tue,  6 May 2025 00:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyQ/wxme"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DABE28136C;
	Mon,  5 May 2025 23:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486214; cv=none; b=ci/r8LUvf5i+3+rc9pDRebnkmayW6CPjVvTReUrojAx4/gr+abcuonwMmx9/3Go8i7mizmqyXDxTPDV9ENyJCIHPAyyYxJ0lGKNK2pjNg075Pnz3r3epFZexVc3Yu6XKOKp1MSMhscT/iuRkQd1yIqBgOf26iI4qQUsmmBscyYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486214; c=relaxed/simple;
	bh=o9JVDIjt6g9NuZ+ioI61yFZvhGCJCq8DL5F+bXRIQJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rLqp0ripMQ0oet1Ta4SkKmwioplG+iu0BTSfoQkhANrS8Dp7ZbcWzmhNnCOWicT288Y6RWIXOuh41zmKuCXrCmarqRCk3Ahh686x6Xc12vqkgCc1VswDKMrV/n2eInI1xMh+xR6KVmbqE28bZv3E3KBMDqWJ9P2g9AEEmnlfuoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyQ/wxme; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11762C4CEF1;
	Mon,  5 May 2025 23:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486214;
	bh=o9JVDIjt6g9NuZ+ioI61yFZvhGCJCq8DL5F+bXRIQJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lyQ/wxmexPq/MCAvZpNuCX8lx56d0Mz5Vm3M71Zv9gbzmhmQlGFIOYy03O0tg9xLA
	 8UczHeI5X2HwWCBr2NPWnUC6vYVCVpMUd9bpNvTUCjeqSt8tGGu7vy8q10yeD6rSYg
	 g7/2Ir4EFi9stK+xTSFxqZJ97Rn9PHzufY2HAWTcgscsSnv/PmTylFlEJQ6BWBr/pM
	 4SUefZwK4U5MB6iH4gnZ2NTOInttATpSIkUd6XbYmiD1QzCbMV0WnnebaVjw7bPn95
	 QrF2ay22ytjV9JHXEOWY01tx4nTwAmR7e8r5tTtKUWGg7xVBgDFTewZ+QHVv+VrWYu
	 I30agE+wgeIsg==
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
Subject: [PATCH AUTOSEL 6.6 211/294] media: i2c: imx219: Correct the minimum vblanking value
Date: Mon,  5 May 2025 18:55:11 -0400
Message-Id: <20250505225634.2688578-211-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index a14e571dc62bc..a3d5a8a7c660b 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -77,7 +77,7 @@
 #define IMX219_VTS_30FPS_640x480	0x06e3
 #define IMX219_VTS_MAX			0xffff
 
-#define IMX219_VBLANK_MIN		4
+#define IMX219_VBLANK_MIN		32
 
 /*Frame Length Line*/
 #define IMX219_FLL_MIN			0x08a6
-- 
2.39.5


