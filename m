Return-Path: <linux-media+bounces-60284-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A+kHEqV+Gn0wgIAu9opvQ
	(envelope-from <linux-media+bounces-60284-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 14:47:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E26C94BD30A
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 14:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D852307A368
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 12:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845FB3D6696;
	Mon,  4 May 2026 12:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wVW5UZvp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F6C3D566B;
	Mon,  4 May 2026 12:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898609; cv=none; b=kstUzddS9xZpL0bP1oEH+lQiD23ao9dID2pSt8/UhnIHR85AQxmjyLVxT2vkh0mJxqq7vgd+N/l19Stui8XOJWrT3yHQ7B0iLuC3sWq6JM+7DXbpY1letOcDSfkPIzwvnfBowH3nyueFlS9+d9v0+GAj3Gd/20+X10c588LNCY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898609; c=relaxed/simple;
	bh=y1Ns9tniI8yyUBh0uJQ7AF5iGdQDvxidGWK5W187M8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rXMbvBdMu75pXtd4nPH1CgFi6SR+NwbFOAPDfxEjTHUybAgkvlbZhGepPylaeBGBoSEWo5sbsDnTgfujCeFo4kyOD37lQ1SMBgbL2vyCGBtbQQRfrowc7VNEQiWU67mersAiL/BzeULGUn+IZkgsqe3AALBTKQ8m/2A+2aozDYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wVW5UZvp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 766C1175;
	Mon,  4 May 2026 14:43:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777898603;
	bh=y1Ns9tniI8yyUBh0uJQ7AF5iGdQDvxidGWK5W187M8E=;
	h=From:Date:Subject:To:Cc:From;
	b=wVW5UZvpTFoy7hXxYjoj+qqgrIsijh7YhsJrR6r2pclUotB/RaHy9RO99QhfcqRrE
	 Z2IyRhOVSUVzMpAPHR8dsZE1vjxKR4ifUsqdKAIvXdRBARc/AFtRLtf5URlUstsVmE
	 f7kp/rig8XAITl0WZUWRFWOQ7c2RQe91L8o0sQ/Y=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 04 May 2026 14:43:14 +0200
Subject: [PATCH] media: rcar-vin: Drop min_queued_buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-rcar-vin-min-queued-buffs-v1-1-59d20ad5cd2d@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAGGU+GkC/x2MuwqEMBAAf0W2voUkatD7lcPCx65uYfQ2RATx3
 w0WU0wxc0EkFYrwLS5QOiTKFrLYTwHj0oeZUKbs4IzzpjYV6tgrHhJwzfwTJZpwSMwRS9u0lp3
 zTB5yvyuxnO/71933A6N5krlrAAAA
X-Change-ID: 20260504-rcar-vin-min-queued-buffs-31891f226fe6
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=8Yj8Ur+YbVRHkLx84XIR+VsUL5gMoy591rONA8jVFS4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBp+JRsz+XHQBrcgx+MWTjYQwURxOTc2trjN6i48
 ikjFxOeoeeJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCafiUbAAKCRByNAaPFqFW
 PPFuD/9O4m6rVLqr4A5lTvnBRJ6PG8f2VhFDaoyktyvjBl6sSyCokjR7na72a9hBC5I2noJhcUb
 pRC8Ii0I/8wmAAqlHpLJ/G9sCM/NOJ4S3LNlm9HaoEvA47jeuoDyWFPODgNXULGVhSKszMJ2+vx
 JPpBnIhDjGwu0fvyfbqQeeSlhqWJUBp7xL/DQ/tJ9tROrdZrhzkZjeWOdZIdhGjrWPGX529MF0d
 0eu+4a1/iMr57ZSi1PKEdCBZXR0WwBeDkfdAWuMCP53oosqp1wEsJOEQhUB0PRjXYE/tRFCEFmA
 dKPriage5kYUqX3xddO4XAzN2SFgcAfLZ0YAINrtdWnwJhMocgzsyT8o5gQxQCdZvRifQOwppWE
 IrVwjY/dJgW3/LRO+8OI35AJ2MAYD2TqlGINOmI8Fx4mYx8X1ZvmtyQK/ySf6D3tLZ8FRzvueZH
 /LpeVWww0gn2SQmWBC7RPtyatREXK25q2vta7wwIHOLgeqjN1LRWQsrHwXg43bOf749kzz3JQ7y
 JbhvbNQ7nRDlNAKd6jsYHRsz62hdw6dpZOQaCIlgBAxLx3lq31UzMfoNGFILcr2RJP5GFhGuv74
 B3SJYwaweuxkH9qimEQAQgI/508phScODB17n44z2/kjVV+GeaQGq6J8V1gezhg9Oxg6RZSg5Og
 Fsvp3JAmnKU2vjw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Queue-Id: E26C94BD30A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60284-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[ragnatech.se,ideasonboard.com,kernel.org,glider.be,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The R-Car VIN driver already uses a scratch buffer to sustain capture
operations in absence of a frame buffer provided by userspace.

There is no reason to require 4 buffers queued at all times for the
driver to operate. Drop min_queued_buffers from the VIN driver to allow
single-frame capture operations.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
This allows to capture a single frame when the R-Car VIN is used
to feed the R-Car ISP on R-Car V4H.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index f9af9177e02f..73cda0e2d45a 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -1494,7 +1494,6 @@ int rvin_dma_register(struct rvin_dev *vin, int irq)
 	q->ops = &rvin_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_queued_buffers = 4;
 	q->dev = vin->dev;
 
 	ret = vb2_queue_init(q);

---
base-commit: d9c8c4adf23d17549c0ec9c85b99d85a0ee6cf18
change-id: 20260504-rcar-vin-min-queued-buffs-31891f226fe6

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


