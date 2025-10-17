Return-Path: <linux-media+bounces-44894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B74BE8F4F
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3B7D1AA5D3C
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10142F6925;
	Fri, 17 Oct 2025 13:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBTOBwdZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058642F6901
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708316; cv=none; b=HsGxmCa5g9P7rbqxzKcueEXQvM4944outR+QQgBeTO0nnOimbv9n9MRaODlF9YWc2O7TLplMZYOA/wozNn5rxNfN0vaUraVVn+zpS1HxpcolxQ1OzTm0pzL/wLBdQEsj4YOWbIvBpuKOSYcLsORyfPKGByvmTSF2pXBgNrWY3eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708316; c=relaxed/simple;
	bh=Q0RWrGOrxCxP4grYbnVH/DtV4XeE6Sjc4ee1hshFWhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHS/aeZuQKga8AfjnyT8gd98MVxIsEtAkH34aTBkKh5/VvwR/sfBMY2amDlJ8qpmCVyQq1jSprBuPxupUcqpOQmhsXWGWXOwxt0TY6SlFfjQ9fTdCnqLt4Gg+8JP10qcDsNGWPMZo1QG6FKnrV9MI/Ewd4uCW6fowBkxiEYU0Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBTOBwdZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5743DC4CEE7;
	Fri, 17 Oct 2025 13:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708315;
	bh=Q0RWrGOrxCxP4grYbnVH/DtV4XeE6Sjc4ee1hshFWhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oBTOBwdZG1uuj2nFYZXLfWdZHiB6psijlTaV+6SFJY1/crfAYg9GOj7MumuFYe20O
	 fczogvltxTV6DGsUJ/fJWbElU9xB4c6oMlkj/TkY78BiyGACX/BooL4xwwkbTJgZEr
	 xVgC3NiAxipzvz4j65re9fZ05VVYehQhyKrogMct7Mx3ot6+9zh/GmMeFTohcYH0Kf
	 r+AOpL4/QxIDLkrdPQ1rHQEmHcVIWNMJ3qJmoIDVitAxdo0lx4pl+SmuU16kzutk43
	 l1IrdOy6V0YaEp+IyDnLECNNRWaSukfHkm1XGGWqyyFnRtq3vde5p6UQVjm4QCrQO5
	 ccQdLAbE3SPrg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 03/14] media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus fixes
Date: Fri, 17 Oct 2025 15:26:40 +0200
Message-ID: <1e7330bdeb61565bef5254fa35717a260d9e4633.1760707611.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760707611.git.hverkuil+cisco@kernel.org>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The isp_video_mbus_to_pix/pix_to_mbus functions did not take
the last empty entry { 0, } of the formats array into account.

As a result, isp_video_mbus_to_pix would accept code 0 and
isp_video_pix_to_mbus would select code 0 if no match was found.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 46609045e2c8..864d38140b87 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -148,12 +148,12 @@ static unsigned int isp_video_mbus_to_pix(const struct isp_video *video,
 	pix->width = mbus->width;
 	pix->height = mbus->height;
 
-	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
+	for (i = 0; i < ARRAY_SIZE(formats) - 1; ++i) {
 		if (formats[i].code == mbus->code)
 			break;
 	}
 
-	if (WARN_ON(i == ARRAY_SIZE(formats)))
+	if (WARN_ON(i == ARRAY_SIZE(formats) - 1))
 		return 0;
 
 	min_bpl = pix->width * formats[i].bpp;
@@ -191,7 +191,7 @@ static void isp_video_pix_to_mbus(const struct v4l2_pix_format *pix,
 	/* Skip the last format in the loop so that it will be selected if no
 	 * match is found.
 	 */
-	for (i = 0; i < ARRAY_SIZE(formats) - 1; ++i) {
+	for (i = 0; i < ARRAY_SIZE(formats) - 2; ++i) {
 		if (formats[i].pixelformat == pix->pixelformat)
 			break;
 	}
-- 
2.51.0


