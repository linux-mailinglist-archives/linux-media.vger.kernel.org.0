Return-Path: <linux-media+bounces-60153-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Kl7I1TJ9GnEEgIAu9opvQ
	(envelope-from <linux-media+bounces-60153-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:40:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C454ADA70
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C47AF300A329
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 15:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5DD3D16E3;
	Fri,  1 May 2026 15:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VK9tflmI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A493D331D;
	Fri,  1 May 2026 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649996; cv=none; b=IxvVU/zAqno3c0c0h+h1sI2XgSzpAZM1vFPJ6Z935vMZ/tg1qZf0nXtMqEtFh5gDbtl1b3eiwMPNfiqIaQ9NYwx53+wQDAPdqRshLwtrX8vuVpmW1bF+VgDZRLzYKZNN08z/5zswToBcDUchMsU57B3ey7yae8SAhwFSuJOTu3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649996; c=relaxed/simple;
	bh=Bv+aA0Un6jxPT3sP5HXuqKuE8Sfx1qAXIhAULNpfPRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kzmpBneTehngjE7uXGT6t3cnXyjm0wZ4jfRIx+gm5Frfr67S8Mip4APQyKP996IYVtL0bilS/QiZNUhUr3dieQTUIikClhhoin6F6C8KO7S5446tsz2h5eZ/WNA5MCUrxFc9NblYcAlsMXVoSFIDKnwsBPuuepbmo0sFGZOCwYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VK9tflmI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1FDA13D7;
	Fri,  1 May 2026 17:37:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777649858;
	bh=Bv+aA0Un6jxPT3sP5HXuqKuE8Sfx1qAXIhAULNpfPRM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VK9tflmIkchD4umkRVUZB/SrVadTVXpVmXwgHjsjs+Gv3DrMXsxTZiyP1FO1R2pJ7
	 yoJGat+M30pQOBbkiI8PSDOKkhVRnnMysH4/+Va43BigGcj2h9xfPxgb14JvZws83z
	 IxpIY2BsdPFUw0XeU0b+G4FiMoyqocAVpHVQxCgM=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 01 May 2026 16:39:11 +0100
Subject: [PATCH 09/11] media: i2c: ov5640: Add ISP Control registers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-ov5640_cleanup-v1-9-0869a7802a33@ideasonboard.com>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
In-Reply-To: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777649959; l=1723;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=Bv+aA0Un6jxPT3sP5HXuqKuE8Sfx1qAXIhAULNpfPRM=;
 b=chYR7ZZJY/l32y+0vkmyc0QA8dAMmmD/vlEE6Jwj4ufDSyOfVi+4xFmabHYps4EqKUe9J6S2G
 THMBXDbZLVbBkm60s/lKhq+DHFBc00UTDYvmk1vzbJSutwKHYCWgAii
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Queue-Id: 49C454ADA70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60153-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]

Define the bits for the ISP control register to be able to use
and explain component enablement.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 34fe7f51e17b..fd369a13463e 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -110,6 +110,21 @@
 #define OV5640_REG_MIPI_CTRL00		0x4800
 #define OV5640_REG_DEBUG_MODE		0x4814
 #define OV5640_REG_PCLK_PERIOD		0x4837
+
+#define OV5640_REG_ISP_CTRL00		0x5000
+#define OV5640_ISP_00_LENC_ENABLE	BIT(7)
+#define OV5640_ISP_00_GMA_ENABLE	BIT(5)
+#define OV5640_ISP_00_BPC_ENABLE	BIT(2)
+#define OV5640_ISP_00_WPC_ENABLE	BIT(1)
+#define OV5640_ISP_00_CIP_ENABLE	BIT(0)
+
+#define OV5640_REG_ISP_CTRL01		0x5001
+#define OV5640_ISP_01_SDE_ENABLE	BIT(7)
+#define OV5640_ISP_01_SCL_ENABLE	BIT(5)
+#define OV5640_ISP_01_UVA_ENABLE	BIT(2)
+#define OV5640_ISP_01_CMX_ENABLE	BIT(1)
+#define OV5640_ISP_01_AWB_ENABLE	BIT(0)
+
 #define OV5640_REG_ISP_FORMAT_MUX_CTRL	0x501f
 #define OV5640_REG_PRE_ISP_TEST_SET1	0x503d
 
@@ -601,7 +616,10 @@ static const struct reg_value ov5640_init_setting[] = {
 	{0x3002, 0x1c, 0, 0}, {0x3004, 0xff, 0, 0}, {0x3006, 0xc3, 0, 0},
 	{0x302e, 0x08, 0, 0}, {0x4300, 0x3f, 0, 0},
 	{0x501f, 0x00, 0, 0}, {0x440e, 0x00, 0, 0}, {0x4837, 0x0a, 0, 0},
-	{0x5000, 0xa7, 0, 0}, {0x5001, 0xa3, 0, 0},
+
+	/* ISP Control */
+	{OV5640_REG_ISP_CTRL00, 0xa7, 0, 0},
+	{OV5640_REG_ISP_CTRL01, 0xa3, 0, 0},
 
 	/* AWB Control */
 	{OV5640_REG_AWB_CONTROL_00, 0xff, 0, 0}, /* AWB B Block */

-- 
2.52.0


