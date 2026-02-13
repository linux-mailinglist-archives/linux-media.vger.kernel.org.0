Return-Path: <linux-media+bounces-52762-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAHjHJMwj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52762-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:09:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D70F136F05
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D65BF30B75D8
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694D2364E8C;
	Fri, 13 Feb 2026 14:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I6fWhHiZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8988B361664;
	Fri, 13 Feb 2026 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991370; cv=none; b=FQJBrRnrhFZNIxkk5PAn0SisWqpf5tfYqsrDvbRc3i/ekuOosO2FKz3UCxnIrKTHl6ocfbd8oLc01NM7TWBx60Q8QWGCtacTt41w7MLpLojZgD6XcFWtIsX/q0aCank7cD32BA7lr6RHvWzmDBdAwcEPbk46pfH7nZPT+pPfXi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991370; c=relaxed/simple;
	bh=sH0xELGy1y71O6b2pDz7NAvALUD100qDgGv6kdU87A0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PuFu05rHIX/056vZNkmCXFpGqx4HYOv9YR9LFu/w+RmpX+NfIkAKmG5e22nKao73iyiacg9he/NR8CH5jVBijl6XAx4QV2wMNhr8Br+Y+Kr8madsgxc380xXned/FZXp+43E7lQm+APxS3H7zRqHX8YlnVjft5TPo1FyjLoGiLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I6fWhHiZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BED6827F8;
	Fri, 13 Feb 2026 15:01:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991285;
	bh=sH0xELGy1y71O6b2pDz7NAvALUD100qDgGv6kdU87A0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I6fWhHiZR1jDj2V44YAmHaDe7kBIZ03muuft9G7FDPqaXzU64fOElef+TrTgGZfC1
	 He+j0RLXaTQ9DQT/7tozc4MQ2C42eK2Uc6dmKcQ08PARlj2UMM0HU8yk8+rLJ9RW+n
	 m793Izf5F2pcM0+HtDQXfE3+QPuDCYiopTxPxC+A=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:02:00 +0000
Subject: [PATCH v2 21/25] media: i2c: imx283: Provide an effective pixel
 array mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-mainline-imx283-v2-v2-21-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
In-Reply-To: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
To: Umang Jain <uajain@igalia.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=1409;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=sH0xELGy1y71O6b2pDz7NAvALUD100qDgGv6kdU87A0=;
 b=RPtataIdNgpmAIKLFo1Vfsro5BxwFKLAXL1ARjXi65ixtoFPb3im8BKKDakcln6ctdb/2oJzs
 8itrjfKCVnEB0bdJM33b8n6tAOFw5q7SN98YB10qN7v1fgDv0eMEAnb
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52762-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2D70F136F05
X-Rspamd-Action: no action

Provide a mode that includes all effective pixels which includes a 12
pixel margin for colour processing on all edges.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index d001bfb5e241..75a35d9db05d 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -183,6 +183,13 @@ static const struct v4l2_rect imx283_native_area = {
 	.height = 3710,
 };
 
+static const struct v4l2_rect imx283_effective_area = {
+	.top = 16 + 12, /* Clamp + Ignored area*/
+	.left = 96,
+	.width = 5496,
+	.height = 3672,
+};
+
 static const struct v4l2_rect imx283_active_area = {
 	.top = 16,
 	.left = 96,
@@ -538,6 +545,21 @@ static const struct imx283_mode supported_modes_12bit[] = {
 
 		.crop = imx283_active_area,
 	},
+	{
+		/* Effective Pixel Mode : 5496x3672 */
+		.scan = &imx283_scan_modes[IMX283_MODE_0],
+
+		.width = 5496,
+		.height = 3672,
+		.min_hmax = 5914, /* 887 @ 480MHz/72MHz */
+		.min_vmax = 3793, /* Lines */
+
+		/* 20.00 FPS */
+		.default_hmax = 6000, /* 900 @ 480MHz/72MHz */
+		.default_vmax = 4000,
+
+		.crop = imx283_effective_area,
+	},
 	{
 		/* 20MPix 21.40 fps readout mode 0 */
 		.scan = &imx283_scan_modes[IMX283_MODE_0],

-- 
2.52.0


