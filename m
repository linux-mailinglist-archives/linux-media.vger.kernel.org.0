Return-Path: <linux-media+bounces-48041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE9AC9A8DB
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31FDC3A6496
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4843043C9;
	Tue,  2 Dec 2025 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BV63HgOt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F0F302CB0
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661758; cv=none; b=n4rh4pgLRK/bTByNWgtqJEB4PSL8fittbz+7GoNkr0itUMXPvMDwaDdGp5LMy1MvBuGH7zlejPszc02aw9yzVe8lw6uHkIc3iOJV9dG4VppQMTpIv7Hi7rPYFu2K5GApQEKmkRNYsVPH0B5E00T/JV8EpbF3Dr2SSxa2jVSKvCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661758; c=relaxed/simple;
	bh=sU3MT+TtaCZCC5FEV6SLswIrUoyfSLskYGD+rJu5aBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HzchdviyWioE/wp5wF3flgwjbgutiiHY39illfqJDOFM6C17NB9pJDfZmpXJzQtIISflBem13UD+VAZFTL0YRFGU5TsNj2+/p9HjVFbd9HavZxBUgB0AJE+TjVYe42Bibe6PwItSJXMEXSuFnZPEX1dJSu+sMaeVr/bATe2KBVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BV63HgOt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6DEC116D0;
	Tue,  2 Dec 2025 07:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661757;
	bh=sU3MT+TtaCZCC5FEV6SLswIrUoyfSLskYGD+rJu5aBE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BV63HgOtn7vYyja1Es7itsmT/zNSA3NaQG2jIuOipV5M5VLRf2gCTzrtNvsLxC2jO
	 GRH9YvDskpA3G2QC6TvyV+OlTMacttestGyHjop2li4XaouU2BhoR4iDdP0v9Qpq0e
	 hudh0k2Mzo45xwWQnyzME2SMFyyATQcuMBXrePovEXb7dPXo4B0/cICNvkqP0mQ1MO
	 mdjf/sTs9PfZB8rb+kohZHm8Sn9AknwEdQQrem8koa9LmAXxpg1UiwkXjJy5OeU5/O
	 uI4MvjxS6CixZqkrie3eYuK+g7MP4XmQTD5OogU6zcF+PT9vxU3KEOwNvEBGk9KsdF
	 a4RWJHsrl7C+Q==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 10/11] media: omap3isp: ispccp2: always clamp in ccp2_try_format()
Date: Tue,  2 Dec 2025 08:48:11 +0100
Message-ID: <49327c06160d2068b82f295921d30d39d8e133cc.1764661692.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661692.git.hverkuil+cisco@kernel.org>
References: <cover.1764661692.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If ccp2->input == CCP2_INPUT_NONE, then try_format didn't clamp
the width and height. This can happen with v4l2-compliance tests.

Always clamp.

This fixes this v4l2-compliance error:

	fail: v4l2-test-subdevs.cpp(171): fse.max_width == ~0U || fse.max_height == ~0U
	fail: v4l2-test-subdevs.cpp(270): ret && ret != ENOTTY
test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/ispccp2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispccp2.c b/drivers/media/platform/ti/omap3isp/ispccp2.c
index 1204ee221c9e..2c51015f7359 100644
--- a/drivers/media/platform/ti/omap3isp/ispccp2.c
+++ b/drivers/media/platform/ti/omap3isp/ispccp2.c
@@ -658,7 +658,7 @@ static void ccp2_try_format(struct isp_ccp2_device *ccp2,
 			fmt->height = clamp_t(u32, fmt->height,
 					      ISPCCP2_DAT_SIZE_MIN,
 					      ISPCCP2_DAT_SIZE_MAX);
-		} else if (ccp2->input == CCP2_INPUT_MEMORY) {
+		} else {
 			fmt->width = clamp_t(u32, fmt->width,
 					     ISPCCP2_LCM_HSIZE_COUNT_MIN,
 					     ISPCCP2_LCM_HSIZE_COUNT_MAX);
-- 
2.51.0


