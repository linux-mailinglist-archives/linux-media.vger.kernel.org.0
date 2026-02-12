Return-Path: <linux-media+bounces-52650-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INA2JJ7AjWlt6gAAu9opvQ
	(envelope-from <linux-media+bounces-52650-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 12:59:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA15012D36C
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 12:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD242305DB20
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 11:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970673502BD;
	Thu, 12 Feb 2026 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lgFY8y4V"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AF9296BD2;
	Thu, 12 Feb 2026 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770897550; cv=none; b=EMCj99xwgJb7QdBgoaAWabl85EWl6VU+42C0ZuT3BFa8CAe6khhplayqgR8NnXqh6WEXftrLnCGvkFdL1s0rg03m/2lsIlJP86g4EayzHOzcy73aFCSlMeIgvtazMKOhro7hbSL+yg97ACXKNRf48MJSKGg2EoAMN/vHbWao7Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770897550; c=relaxed/simple;
	bh=nA8+PJsKz/Qxikad9cmNxC/qX/Tn7x7XJkvi8067PzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Gj3kJxXDHTBq6wntwCy7Z5bzdue765p7FTGt0rEjpr3DVS/VKU7wvh/s0WydGCrTFadbPDX8S4XmAOPvCyTHaebc7b3jwdn6z2/DCDEN8cIjbf2qdr2P4F+wa8H6YFPnGAcG3sOKUwbcbcikufQ6qr5LXQYjYyxxaJVtduNaSiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lgFY8y4V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:63f7:8b59:bf7b:a87:f18a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A1B2492;
	Thu, 12 Feb 2026 12:58:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770897498;
	bh=nA8+PJsKz/Qxikad9cmNxC/qX/Tn7x7XJkvi8067PzQ=;
	h=From:Date:Subject:To:Cc:From;
	b=lgFY8y4V3mnLk4mAwWB3Usqy8TpKSkdVNVUqLLxvLr8diMbiNW9NDcyMnEtAN6x9R
	 U3h4Qt1n1Mt8ud86e8NFffqtj8RkJ4/w27a/293qwj4y3wK9mN2EdinHjuuGBLlSD0
	 EhXYrLMJISuucrGdwDPWgx9hgiICeW+7qnxJ9rFA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Feb 2026 17:28:48 +0530
Subject: [PATCH] media: i2c: imx283: Enter full standby when stopping
 streaming
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-imx283-hang-fix-v1-1-57784739604c@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAHfAjWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Mj3czcCiMLY12QnG5aZoWuRZJxmompgYV5apqZElBXQVEqUBhsYnR
 sbS0Awkusw2EAAAA=
X-Change-ID: 20260212-imx283-hang-fix-8b3f45087ef6
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Umang Jain <uajain@igalia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=nA8+PJsKz/Qxikad9cmNxC/qX/Tn7x7XJkvi8067PzQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpjcCDSBZsM79/NBu8Jo9TAo2BitR1jg4kFUA/C
 akuQ9P9lpKJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaY3AgwAKCRBD3pH5JJpx
 RUC0D/sGPUwPLJkMflzdBOh+/4enx7JzKZbXe6xcZwALzaiPxFVoNT/eatrkFqSz3RgTs27QfUX
 i1otE7ZJaF6VmLx2L3QeoDWc0ak6qLN2nnI9UzOeiLIN+qk/tbGUUKQrJ+sYdlx3DGUd/WIKVOz
 FAGlm+zqyuZ4vM/GVKSYT4ZEWg2ysEyz6MzbfW4EByZocJPNX1wxVbsSTafk9O6HhM5Fg6AE7B7
 bnmcHwE8CmzF3yaChzaZ6p7D3s1lg7OSaZ3rCSOoSx1DBKSuxCo12ZRfFMGiT3tLkd9ksOU9j3D
 /7jxEadZzZDPVsrAiQ79VgpnaP5SGy+f6V4x2S1Vo7QiO6wIQ8sUlEvySzLobk3E+0OIk374hx5
 XUk6BDLiQYfB16tiiXBOeFifAy4ymXqO6q6YqwCMvmWRNCW8qbX1DyBcjkF10mc3SIV8X2wn7Ba
 S1ae0LRC2JdSeIeUpfh3hcU7iUNfWzN+w2GNohFFdfuq4vk6rKnv+HW1kfpEQL6TfEcTV7vh6T5
 zgYsl/NGBUjL5Gw3HD2lcGSEODEGxHxLGFDc6i8KOPuumnvRna6VykJdsiZANwXZdJwbEgER5Vy
 Jt4j4jx1Py92mcpgpFzRKCtfVHrB+yn0OoIg2tdAdWvaheS/jW4J8/DCkbzy3NYZfGXDtz9Fymm
 ZenSxzyLuVlmhzQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52650-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: EA15012D36C
X-Rspamd-Action: no action

Use IMX283_STANDBY (bit 0) instead of IMX283_STBLOGIC (bit 1) when
stopping streaming. STBLOGIC only puts the sensor logic into standby but
leaves the MIPI interface (along with other components) in an
indeterminate state.

This (presumably) causes the CSI receiver (e.g. Raspberry Pi's CFE) to
miss the LP-11 to HS transition when streaming restarts, resulting in a
hang of 10+ seconds. The issue is most visible when immediately
restarting a full-resolution stream after stopping a 3x3 binned one, so
that runtime suspend hasn't yet been triggered.

Writing IMX283_STANDBY puts the entire sensor into standby. The
imx283_standby_cancel() sequence already handles the full wakeup from
this suspended state.

Cc: stable@vger.kernel.org
Link: https://github.com/raspberrypi/linux/issues/7153
Link: https://github.com/will127534/OneInchEye/issues/12
Fixes: ccb4eb4496fa ("media: i2c: Add imx283 camera sensor driver")
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 8ab63ad8f385f6e2a2d7432feff0af09a5356dc4..9b3094a57873c6e8ff8c41d058ea3b0012642cac 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -1158,7 +1158,7 @@ static int imx283_disable_streams(struct v4l2_subdev *sd,
 	if (pad != IMAGE_PAD)
 		return -EINVAL;
 
-	ret = cci_write(imx283->cci, IMX283_REG_STANDBY, IMX283_STBLOGIC, NULL);
+	ret = cci_write(imx283->cci, IMX283_REG_STANDBY, IMX283_STANDBY, NULL);
 	if (ret)
 		dev_err(imx283->dev, "Failed to stop stream\n");
 

---
base-commit: 37a93dd5c49b5fda807fd204edf2547c3493319c
change-id: 20260212-imx283-hang-fix-8b3f45087ef6

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


