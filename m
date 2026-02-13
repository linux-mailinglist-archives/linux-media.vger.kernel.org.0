Return-Path: <linux-media+bounces-52750-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KN6KEUwj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52750-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:08:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B61D136EAB
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4FEC317B93B
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2ED36166E;
	Fri, 13 Feb 2026 14:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VB3CiNOd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E79A36165A;
	Fri, 13 Feb 2026 14:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991347; cv=none; b=g0325CzfboJVSIuETrO9zx3Y8RrY8WvWrLSUqQjfsCQD0xiaaqPAQu9WM4SMA8mQytDG1sI3IByUg4TJKbvviN6fhm19iSzx/OQHIQ9hlgerSv39UnZjddFVzduASbGLi+U8+w8oEO/k0TlQP1vcJIVPUdmBqqzMF0qNBUTgkB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991347; c=relaxed/simple;
	bh=xNZjOVWHoFb2Y69Wyoo6hq9ClPD5Ha/Xtk0lMGTTphk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kFozKV+VcEI6FwnOXyOoMbI8AXOh4o1TEv/4D7/nWsbtTE42pVqW6bPfam4fG9fNq5wt4J6pqQOAm+DaH6/Nf9BDUhTxhKuC+9+QZw9cqxost4X1gE/vDOrk356f5RJHylztGZMzn6AwoWSFSMp/lHAruOngqrrnDy8V6H/STbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VB3CiNOd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A756926D1;
	Fri, 13 Feb 2026 15:01:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991280;
	bh=xNZjOVWHoFb2Y69Wyoo6hq9ClPD5Ha/Xtk0lMGTTphk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VB3CiNOdF+YAgIUOtPgl7R0d0c/VbZbSU+eg+YJeQLEr4T7vGpCYbhdsnr4gLdrRK
	 0unPyQRXNvtKVd389ed/xUfzljS2BC0EkF/JRLXwdWkP768pIBRXDokpQTiQ0nLA2u
	 fG7agD21UYvyOl815htsPkd64x7l/l4xfAg3flU4=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:01:49 +0000
Subject: [PATCH v2 10/25] media: i2c: imx283: Move Horizontal configuration
 block
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-mainline-imx283-v2-v2-10-be40a3770ebf@ideasonboard.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=1490;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=xNZjOVWHoFb2Y69Wyoo6hq9ClPD5Ha/Xtk0lMGTTphk=;
 b=+GPowK9not4gbVozsibvKOW/5L3aXeMIUXC4Cbp54WSOxhQP3u7/AOyGFQplJl2FaEQJN0Uy3
 R095vzjpzlkALJNbI25ZKzjV7YJ8lJr6AyOgoPMvQOOKz2b9pliOuI6
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52750-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 0B61D136EAB
X-Rspamd-Action: no action

Adapt the Horiztonal configuration into its own scope to improve
readability of these two associated register configurations.

No functional change intended in this commit.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 32b8070756f0..6d551a26cfa6 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -1160,10 +1160,19 @@ static int imx283_start_streaming(struct imx283 *imx283,
 
 	cci_write(imx283->cci, IMX283_REG_OB_SIZE_V, mode->scan->vertical_ob, &ret);
 
-	/* TODO: Validate mode->crop is fully contained within imx283_native_area */
-	cci_write(imx283->cci, IMX283_REG_HTRIMMING_START, mode->crop.left, &ret);
-	cci_write(imx283->cci, IMX283_REG_HTRIMMING_END,
-		  mode->crop.left + mode->crop.width, &ret);
+	/* Horizontal Configuration */
+	{
+		/*
+		 * While Vertical OB is excluded from the sensor positions,
+		 * the Horizontal OB is included within the whole HTRIMMING
+		 * calculation.
+		 */
+		u32 left = mode->crop.left;
+		u32 right = left + mode->crop.width;
+
+		cci_write(imx283->cci, IMX283_REG_HTRIMMING_START, left, &ret);
+		cci_write(imx283->cci, IMX283_REG_HTRIMMING_END, right, &ret);
+	}
 
 	/* Disable embedded data */
 	cci_write(imx283->cci, IMX283_REG_EBD_X_OUT_SIZE, 0, &ret);

-- 
2.52.0


