Return-Path: <linux-media+bounces-31761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8EBAAA5F7
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 02:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 836423AB196
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D16319A5D;
	Mon,  5 May 2025 22:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFbLmQiU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B15319A44;
	Mon,  5 May 2025 22:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484281; cv=none; b=Jz6HRiBl4OIuD/lUHTcP5X2CA4QV21lJkwPQQTTqe9wyu3+B9+OWk39OwhHULjZ/oska+3k70/6J6FWVAay/FJywS5Y0tnYY7F26B1MFsN0Kok2HYYr19ArBQDMMRRruSYqWh1BHyvis8aFjd3V6wd/4Zz5DIYb4uiNRf2TYSmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484281; c=relaxed/simple;
	bh=fFQmUpUjhN2J9FyPEPTJ2tW28MtDTr0L9Xb/am9hxaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sFKz45ajJWTrJpYe8PJoAhbl5OvceMM4aSwYPPoQkfMeiFxM87j0qjycd3NyQhJSLJ6A0WZB0kKvabxNIM3fpQxQoFCp4PWw7n77xNq+xopr7QqFpBkJ7C/fyQyzVddqM7kQXAuPoh5VixDoOzp/oV5vOaL/u93ObyV6OTQUqNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFbLmQiU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2945BC4CEF1;
	Mon,  5 May 2025 22:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484281;
	bh=fFQmUpUjhN2J9FyPEPTJ2tW28MtDTr0L9Xb/am9hxaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bFbLmQiUpbT/fjhGsMO34/bvslPjJxUWEvfg2pZHyBKkE8VMybg0KMEuLzv2rNe3H
	 vrf5rkMF7bbbyNfG6cxVABawBq36Qam3SXoHQBAs2G24AXr3gceKuSylBHBoBH7w5U
	 OyEKeevHm3vLuUOovB6nRHKQk8SYnui1g2SIWV4pDmGMi5ouaJ/oVMw81GFCC7/sNb
	 AyZw1YdRzPEXWF7Fynt5kffCfJjpyGn1hkdLPywA+1RnqmA/nnC6GY3qzLEfQItF0k
	 sv7uQP/WzDprIipyGlFuTvdbfM9YF7ZCSS8t3WZ3LgsG0yq/+nCFbgNyc4sorVif56
	 TmrzeInSfWovQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	tian.shu.qiu@intel.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 432/642] media: i2c: ov2740: Free control handler on error path
Date: Mon,  5 May 2025 18:10:48 -0400
Message-Id: <20250505221419.2672473-432-sashal@kernel.org>
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

From: Sakari Ailus <sakari.ailus@linux.intel.com>

[ Upstream commit 71dfb2c7548994aad6cb0a316c2601e7144d15a5 ]

The control handler wasn't freed if v4l2_fwnode_device_parse() failed. Do
that now.

Co-developed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/ov2740.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 9a5d118b87b01..04e93618f408a 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -828,8 +828,10 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 				     0, 0, ov2740_test_pattern_menu);
 
 	ret = v4l2_fwnode_device_parse(&client->dev, &props);
-	if (ret)
+	if (ret) {
+		v4l2_ctrl_handler_free(ctrl_hdlr);
 		return ret;
+	}
 
 	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov2740_ctrl_ops, &props);
 
-- 
2.39.5


