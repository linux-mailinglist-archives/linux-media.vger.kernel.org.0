Return-Path: <linux-media+bounces-48474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 131BACAFF1F
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 13:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B531930D10BA
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 12:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14583327C0D;
	Tue,  9 Dec 2025 12:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="voxqRvEO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82503271F9;
	Tue,  9 Dec 2025 12:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283544; cv=none; b=G+uZnf5HD5QX2afbxALgPZdjlNnLZytKx7HjRVaZ2kMs0AexGRl0c09bSb67YIR/RoC6tjgFEbAZfsyqzAzLsvJGogCcfYo9PtNTeWZ50uNP3eD9B7aE9NyiGxu9qoTe6ViwzGiKgHBGJNm3wll2fHDRwH1p+YYSa8zJ2j+fGtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283544; c=relaxed/simple;
	bh=JrLzcV4fJeWZQJDh36e6v9O37lwUmXTAldwPVMcCne8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=arcnvTMYWZ2XIOyIDY+46Ss5dhvHuWY83fkTqydikbc0RPK1oTNPUhm3dkhGCp5rzc0k5wVE8SNz0xVjOj30AQktGI0MgW3fFmrfAMdUnJP2ir1lcR3+Y2xPjCLqjTXErEJdMa11i/drUyw41KhUDGhDjVERlEbY5twmj/Q+F7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=voxqRvEO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABD5B89A;
	Tue,  9 Dec 2025 13:31:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765283516;
	bh=JrLzcV4fJeWZQJDh36e6v9O37lwUmXTAldwPVMcCne8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=voxqRvEOPLyxl/KvsDCbOG8uoQUOODnWQGsOjOUs0rInZP0AfNOkYWXNHw3Isii/M
	 NSboeL9cqaWny7iBDXM4vA90UrScx5QvTS+xO28HLk6BA3CRGz6UQ0EFmM4i7nyshs
	 PhANWt8wB905Hs+CPY8D4SheuoUhfnM2C8/x5tPU=
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
Subject: [RFC PATCH 4/6] media: rkisp1: Set input configuration to data mode in bypass
Date: Tue,  9 Dec 2025 12:31:34 +0000
Message-ID: <20251209123136.273938-5-isaac.scott@ideasonboard.com>
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

For YUV bypass, we should configure the ISP input to interpret incoming
H/VSYNC signals as data enable / disable. Add this.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 7c844e00808a..716bd7f3c66d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -244,6 +244,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 	} else if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
 		acq_mult = 2;
 		if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
+			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_DATA_MODE;
 			rkisp1->in_bypass = true;
 		} else if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
 			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
-- 
2.43.0


