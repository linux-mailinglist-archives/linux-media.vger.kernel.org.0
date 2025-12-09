Return-Path: <linux-media+bounces-48471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F771CAFEFD
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 13:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D477E301C8A1
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 12:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF40732573F;
	Tue,  9 Dec 2025 12:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UC6XkpBc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4E5326D76;
	Tue,  9 Dec 2025 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283522; cv=none; b=pUCc7zTT2SX7SDalCXbTev6gY2hQ06vGs2O6BqDRMMPOaLCmadtcaYdSI2UpXajJmN1G50HdUVOGkKklf6CETOJCJ3gYHtf8lHPe1cNExUTThTp0ZGrn7WTbePcY/3VcEtNaBLNpHE3MFSAuqeAa2i8Ai8UXqu4oRMyb7JCTHR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283522; c=relaxed/simple;
	bh=j28mLh9q2tWJK/jNy6SAvZiExT86p8zYwA+dXzqMg/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJpuo9orRkgbG4w2nMFyWHS6VrQDkgak0E+y9Ik9wZPxr8Wl52cJkNUgXSGCE2ZFap+Hxw8VIF1m/hfy8xQLZdPEZZejCFtB/+rNKPq+Q5ihpiLY2w/fCZ/PIWRh9emwQ4LeY3lmL6UgSInnAVIVNPCRlQfcVELWx1x1/3lgUzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UC6XkpBc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A876110;
	Tue,  9 Dec 2025 13:31:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765283510;
	bh=j28mLh9q2tWJK/jNy6SAvZiExT86p8zYwA+dXzqMg/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UC6XkpBcUdYSatNLI0/s6EEbyUbijDZ1iqX7vSVaYspUU952VshKv+MTI1TI6JvRf
	 GcbhAmRjH94ytPFuvJfgTe3CPK5RycuF2pVkzvZ4FFuWQcf+8qFi4eulGvDsUrhFJn
	 YruMcU09mcVe/mDRR7bCtVGXzCRykW/PFGXs0Qtk=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: dafna@fastmail.com
Cc: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [RFC PATCH 1/6] media: rkisp1-resizer: Add YUV source formats to resizer
Date: Tue,  9 Dec 2025 12:31:31 +0000
Message-ID: <20251209123136.273938-2-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209123136.273938-1-isaac.scott@ideasonboard.com>
References: <20251209123136.273938-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To be able to use YUV bypass, YUV formats need to be available on the
source pad of the rkisp1 resizer. Add them.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-resizer.c    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 8e6b753d3081..447adec8589b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -33,6 +33,22 @@ static const struct rkisp1_rsz_yuv_mbus_info rkisp1_rsz_yuv_src_formats[] = {
 		.hdiv		= 2,
 		.vdiv		= 2,
 	},
+	{
+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8, /* YUV420 */
+		.hdiv		= 1,
+		.vdiv		= 1,
+	},
+	{
+		.mbus_code	= MEDIA_BUS_FMT_VYUY8_2X8, /* YUV420 */
+		.hdiv		= 1,
+		.vdiv		= 1,
+	},
+	{
+		.mbus_code	= MEDIA_BUS_FMT_UYVY8_2X8, /* YUV420 */
+		.hdiv		= 1,
+		.vdiv		= 1,
+	},
+
 };
 
 static const struct rkisp1_rsz_yuv_mbus_info *rkisp1_rsz_get_yuv_mbus_info(u32 mbus_code)
-- 
2.43.0


