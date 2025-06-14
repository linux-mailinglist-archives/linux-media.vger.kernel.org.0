Return-Path: <linux-media+bounces-34810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F14AD9FBE
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 22:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DA64175917
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 20:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A94E2E6D09;
	Sat, 14 Jun 2025 20:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="GX/bNeDb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C16C199237;
	Sat, 14 Jun 2025 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749933456; cv=none; b=OwALRsxDU9CH0LiTVaeLvrkuOBhfoHo6OrXefewiyUSYh3Rs9xNhem4BJia2VRLTJySc534P+Xfu/IAHDGh07KtWvRh5xjY/wGfN//l/TgQMXxhuxOn4TciL+6fJcaEO+T/8oOGqSBCFy2n9zeFDp8GoWyFDHXRdL4HZY34IOuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749933456; c=relaxed/simple;
	bh=9pmEfXdk7iL9pS5LSQiBkiVD0ofCpgQ2sH3AdVhSmWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h5Jo0aV4VbxCnHoB8JOsh8UMH1rd7bd87hYowr1nXHB802vWJT0UYUk1myCFxCUB88/BhaTJcGuI092bD/VggjBi3mFenVWjKKVIflheGmhx+Y1CdOKq1mTHc5l5tP3NBo/vRvyytRoAbZyClfMexSScNk1EOcyWAe6OoJvT8rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=GX/bNeDb; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=+jgDBcJCGkYhFUceW2ssi64QZJrhtciHErgU+KLdRxc=; b=GX/bNeDbUTcLdsfq
	e9twea0F5c6+Ca7aBDgmw1qrYt3uvkGd1pzgaIqIaqpINact2wAVOOXb/nAtnEfYcb4SIki2Q6olN
	yLr89iNgWJmbUvoZyxVNhDmfFS1Ac0M7vn7Zd8O4ndALD7yOC6dG7PvOY6aJeycwxf5RTljlu/tTp
	KLn4o//oufU66eyzChPyNUNTcUmBBlJrrtgTIFR5IvQmQ74HeXLDLLS96/k28W2GOybheBaQ/ExcY
	yA2cBbm3M0tSgRiabzqLqedRGwhFiQ0mBCVf7S210mfC3fFck+6EZpSVlnOGxWFYGQLJXXHdRWWGW
	63L0bhk8xUyo6V5NYA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uQXcy-009fVm-2Q;
	Sat, 14 Jun 2025 20:37:24 +0000
From: linux@treblig.org
To: ming.qian@nxp.com,
	eagle.zhou@nxp.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: amphion: Remove unused functions
Date: Sat, 14 Jun 2025 21:37:23 +0100
Message-ID: <20250614203723.22632-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The functions:
  vpu_color_get_default()
  vpu_color_check_full_range()
  vpu_color_check_primaries()
  vpu_color_check_transfers()
  vpu_color_check_matrix()

have been unused since 2022's
commit 1925665ef403 ("media: amphion: remove redundant check of
colorspace in venc_s_fmt")

The (empty) function vpu_mbox_enable_rx() has been unused since it
was added in 2022 by the
commit 61cbf1c1fa6d ("media: amphion: implement vpu core communication
based on mailbox")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/platform/amphion/vpu_color.c   | 73 --------------------
 drivers/media/platform/amphion/vpu_helpers.h |  5 --
 drivers/media/platform/amphion/vpu_mbox.c    |  4 --
 drivers/media/platform/amphion/vpu_mbox.h    |  1 -
 4 files changed, 83 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_color.c b/drivers/media/platform/amphion/vpu_color.c
index 4ae435cbc5cd..7c0ab8289a7b 100644
--- a/drivers/media/platform/amphion/vpu_color.c
+++ b/drivers/media/platform/amphion/vpu_color.c
@@ -108,76 +108,3 @@ u32 vpu_color_cvrt_full_range_i2v(u32 full_range)
 
 	return V4L2_QUANTIZATION_LIM_RANGE;
 }
-
-int vpu_color_check_primaries(u32 primaries)
-{
-	return vpu_color_cvrt_primaries_v2i(primaries) ? 0 : -EINVAL;
-}
-
-int vpu_color_check_transfers(u32 transfers)
-{
-	return vpu_color_cvrt_transfers_v2i(transfers) ? 0 : -EINVAL;
-}
-
-int vpu_color_check_matrix(u32 matrix)
-{
-	return vpu_color_cvrt_matrix_v2i(matrix) ? 0 : -EINVAL;
-}
-
-int vpu_color_check_full_range(u32 full_range)
-{
-	int ret = -EINVAL;
-
-	switch (full_range) {
-	case V4L2_QUANTIZATION_FULL_RANGE:
-	case V4L2_QUANTIZATION_LIM_RANGE:
-		ret = 0;
-		break;
-	default:
-		break;
-	}
-
-	return ret;
-}
-
-int vpu_color_get_default(u32 primaries, u32 *ptransfers, u32 *pmatrix, u32 *pfull_range)
-{
-	u32 transfers;
-	u32 matrix;
-	u32 full_range;
-
-	switch (primaries) {
-	case V4L2_COLORSPACE_REC709:
-		transfers = V4L2_XFER_FUNC_709;
-		matrix = V4L2_YCBCR_ENC_709;
-		break;
-	case V4L2_COLORSPACE_470_SYSTEM_M:
-	case V4L2_COLORSPACE_470_SYSTEM_BG:
-	case V4L2_COLORSPACE_SMPTE170M:
-		transfers = V4L2_XFER_FUNC_709;
-		matrix = V4L2_YCBCR_ENC_601;
-		break;
-	case V4L2_COLORSPACE_SMPTE240M:
-		transfers = V4L2_XFER_FUNC_SMPTE240M;
-		matrix = V4L2_YCBCR_ENC_SMPTE240M;
-		break;
-	case V4L2_COLORSPACE_BT2020:
-		transfers = V4L2_XFER_FUNC_709;
-		matrix = V4L2_YCBCR_ENC_BT2020;
-		break;
-	default:
-		transfers = V4L2_XFER_FUNC_DEFAULT;
-		matrix = V4L2_YCBCR_ENC_DEFAULT;
-		break;
-	}
-	full_range = V4L2_QUANTIZATION_LIM_RANGE;
-
-	if (ptransfers)
-		*ptransfers = transfers;
-	if (pmatrix)
-		*pmatrix = matrix;
-	if (pfull_range)
-		*pfull_range = full_range;
-
-	return 0;
-}
diff --git a/drivers/media/platform/amphion/vpu_helpers.h b/drivers/media/platform/amphion/vpu_helpers.h
index 0eaddb07190d..84d16eb39650 100644
--- a/drivers/media/platform/amphion/vpu_helpers.h
+++ b/drivers/media/platform/amphion/vpu_helpers.h
@@ -54,10 +54,6 @@ static inline u8 vpu_helper_read_byte(struct vpu_buffer *stream_buffer, u32 pos)
 	return pdata[pos % stream_buffer->length];
 }
 
-int vpu_color_check_primaries(u32 primaries);
-int vpu_color_check_transfers(u32 transfers);
-int vpu_color_check_matrix(u32 matrix);
-int vpu_color_check_full_range(u32 full_range);
 u32 vpu_color_cvrt_primaries_v2i(u32 primaries);
 u32 vpu_color_cvrt_primaries_i2v(u32 primaries);
 u32 vpu_color_cvrt_transfers_v2i(u32 transfers);
@@ -66,7 +62,6 @@ u32 vpu_color_cvrt_matrix_v2i(u32 matrix);
 u32 vpu_color_cvrt_matrix_i2v(u32 matrix);
 u32 vpu_color_cvrt_full_range_v2i(u32 full_range);
 u32 vpu_color_cvrt_full_range_i2v(u32 full_range);
-int vpu_color_get_default(u32 primaries, u32 *ptransfers, u32 *pmatrix, u32 *pfull_range);
 
 int vpu_find_dst_by_src(struct vpu_pair *pairs, u32 cnt, u32 src);
 int vpu_find_src_by_dst(struct vpu_pair *pairs, u32 cnt, u32 dst);
diff --git a/drivers/media/platform/amphion/vpu_mbox.c b/drivers/media/platform/amphion/vpu_mbox.c
index c2963b8deb48..b2ac8de6a2d9 100644
--- a/drivers/media/platform/amphion/vpu_mbox.c
+++ b/drivers/media/platform/amphion/vpu_mbox.c
@@ -109,7 +109,3 @@ void vpu_mbox_send_msg(struct vpu_core *core, u32 type, u32 data)
 	mbox_send_message(core->tx_data.ch, &data);
 	mbox_send_message(core->tx_type.ch, &type);
 }
-
-void vpu_mbox_enable_rx(struct vpu_dev *dev)
-{
-}
diff --git a/drivers/media/platform/amphion/vpu_mbox.h b/drivers/media/platform/amphion/vpu_mbox.h
index 79cfd874e92b..8b7aea4f606c 100644
--- a/drivers/media/platform/amphion/vpu_mbox.h
+++ b/drivers/media/platform/amphion/vpu_mbox.h
@@ -11,6 +11,5 @@ int vpu_mbox_request(struct vpu_core *core);
 void vpu_mbox_free(struct vpu_core *core);
 void vpu_mbox_send_msg(struct vpu_core *core, u32 type, u32 data);
 void vpu_mbox_send_type(struct vpu_core *core, u32 type);
-void vpu_mbox_enable_rx(struct vpu_dev *dev);
 
 #endif
-- 
2.49.0


