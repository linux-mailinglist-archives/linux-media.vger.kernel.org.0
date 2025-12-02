Return-Path: <linux-media+bounces-48046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A0CC9A8FC
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 75D094E2DE6
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99C8303CB2;
	Tue,  2 Dec 2025 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtPS/f9w"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EC0302CB0
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661958; cv=none; b=rdKjpFRFBOTSWur6vo+Lo0eCUVb2pUcu7Bd1oybeIzbKsQHyU5SkmLeU0MDpKc97/70NwlgQF0zVitMlJra2sLH2U36j014ipS6tgH2r14hozpAqYEY4dwgwVi9U6JW0v0ZVcLbwjdZWpbEa0D4Iy2zNXjXkDS0kGttoVcc2OW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661958; c=relaxed/simple;
	bh=Q0RWrGOrxCxP4grYbnVH/DtV4XeE6Sjc4ee1hshFWhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/s9hvTEjJdBYHSYrLFA1YKgnl4j/OarzL1qSsEE5jExC8sRzgfFkavpvzaqvc7D+jy51+VxBGZt/GrJrW73+/SDbtmfMoIzHr1AalUwgg9y7yDAL0cM9F1o/VrZ5C7abQOdthvAF6kjGr5Wc5muB1Sj6j4l3if1PL/x7OfLL8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtPS/f9w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65359C116B1;
	Tue,  2 Dec 2025 07:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661957;
	bh=Q0RWrGOrxCxP4grYbnVH/DtV4XeE6Sjc4ee1hshFWhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QtPS/f9whSEhpQSFNbpvQ9qq0PLlRerrCbl5x6UbqaBio5utiALlK2tWbO6LxKGvq
	 Gbln9Io8YzU6P/3MADO4UGcK9RcqB6678VEqQBll+ufgI3MMSGu2vCHwhAHx7PbCAe
	 6PBfDO4KPD4dyMq3hOMt1Ld1YVtzDODtD64fjgVQyDrYVxv9gW0gxVjGL9P/u7KbQ1
	 whK3O3HCoLT8UeZiwOcgmQ3KUWLmA79NsWmACSzr3WqKq4gDbLicJ7qhaXNk0V6K3S
	 p3obIRyY5FevgTxn3Wg7tExU2k20lgvXkg/h3XNDP05+zf9woRSTV+cksVeh3Tqe6p
	 ++TojRbpz/8sQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 03/12] media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus fixes
Date: Tue,  2 Dec 2025 08:51:11 +0100
Message-ID: <2fbd7561e6c2d600d0bad9ddc3525f767db6e8d1.1764661880.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661880.git.hverkuil+cisco@kernel.org>
References: <cover.1764661880.git.hverkuil+cisco@kernel.org>
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


