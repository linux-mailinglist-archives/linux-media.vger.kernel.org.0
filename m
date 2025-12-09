Return-Path: <linux-media+bounces-48475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CED02CAFF4F
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 13:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6941E3078C88
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 12:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE0C327BE4;
	Tue,  9 Dec 2025 12:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VWaHCQ/b"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685E73271ED;
	Tue,  9 Dec 2025 12:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283547; cv=none; b=rEI2FhD//aS83kVQJkY1m47qx6PQYb5jKvE2hXOSZyNnufTepvYVYblcWKwmTKLoKdFEdzeCiEiEbGE3B5cosNOh598wjxrbh83Vz+Ws4frUkswgp4lRQ3fmhh1ld5fRma2IfjjiwFTpYqOL39k0iX6P7k7gkHGJjz9vEfpYXKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283547; c=relaxed/simple;
	bh=uT+0UkAjXO177URXDBOJe4n6IOs5odTKgpgqrzkTy60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hjCQt84EJfTTKE9W3Z+xCHREeTByyA8kRhnjC0sH6mIpu1S/re7EsnEi3eyT3vUwt3GCYeBJ0O4N5OM9sPOiZLb7tYbNGeu/M0xyNJi7+p8vkCWS/sGy3YdTSPlHw3dLTujsQSBPWvL11/WyU3fvifhx1q9i2BYkSYdD1qFLRtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VWaHCQ/b; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53F63A30;
	Tue,  9 Dec 2025 13:31:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765283517;
	bh=uT+0UkAjXO177URXDBOJe4n6IOs5odTKgpgqrzkTy60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VWaHCQ/b99ZxsDrWxwWtGnomlXayB3t/iT+Dt9D14rTCdjVx0A6r+Eb0+jAYejmM3
	 37vg3Bl697mI9qdQzqz7r7z0Z1MRxpn0eoxp7kfMbWzy3EE+/bijEdloqTlGGE6sXW
	 BKwZ3DIkXSoKsMIfhuuJna++gfqFyqQ8adFXze30=
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
Subject: [RFC PATCH 5/6] media: Propagate sink -> source format in YUV passthough
Date: Tue,  9 Dec 2025 12:31:35 +0000
Message-ID: <20251209123136.273938-6-isaac.scott@ideasonboard.com>
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

If we are in bypass mode, we should propagate the sink format of the ISP
to the source format to ensure the pipeline is valid.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 716bd7f3c66d..c457593526c5 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -630,6 +630,11 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 	 */
 	sink_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
 
+	if (sink_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
+		format->code = sink_fmt->code;
+		dev_dbg(isp->rkisp1->dev, "ISP sink pad is YUV");
+	}
+
 	src_fmt->code = format->code;
 	src_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
 	if (!src_info || !(src_info->direction & RKISP1_ISP_SD_SRC)) {
-- 
2.43.0


