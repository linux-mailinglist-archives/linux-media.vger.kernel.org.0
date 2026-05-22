Return-Path: <linux-media+bounces-62556-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPBzLYfJD2r/PgYAu9opvQ
	(envelope-from <linux-media+bounces-62556-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 05:12:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D97915AE403
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 05:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45BA8302DFAE
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 03:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3A8314B63;
	Fri, 22 May 2026 03:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dodOi0sz"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B8327A47F
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 03:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779419521; cv=none; b=olLYppwXq+Lw/CxfCITQU5ZPycMqg9wtW3ZYvygY7chV4jG4bl/jvy0vUmOk2gBcJD6Rzd6T+jxrTBx0b2yjdJ0MNfxBD/Q4VGyzRKcVOyKPCogFTFHXsjyk8J4rmsE59F8g+UJcpbvB/lldl8lTB7XXdImkvK37Q9g9rzCgSCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779419521; c=relaxed/simple;
	bh=hov0JMN9Od7SadFQsFhYuLitVjNK4kHxVbDTT/wlbqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obOowRjKR0gyxp8QRrMuUvzUdifGWBsWskWO4/AktuhODdbCPxYW1qm+EuNiCFu0WNRxMSH0IcLVvGfVtwyw3EdPX6pKtEvC84Xj2iUame36Igez7yUjDHNpAFNJrFyYbeVIMyxSrB2hh9IWtmgJVdLps3GnKLU+LL9d8+AgVU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dodOi0sz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779419518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o2pgXNSMR48O4yNjxQT2DPLfWXCyHlGh80R1B64u2gc=;
	b=dodOi0szXMnipQrgpzslHzwEaYLLhptHWOAucRDB0DekhzP923Yl6sNVMaNCg9kNZ6mkEX
	b56/BpC/tsf7cDwXhgtYGpWgYxJfEWUnQCww1mbMGJAuTQZMpt4eab24JbfuqIUS/NlQuM
	ZByHa3VLqSwjulMdQl1mdM9Y57tyRMI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-210-hfmFWaHpP2OeobqKNHVpsw-1; Thu,
 21 May 2026 23:11:56 -0400
X-MC-Unique: hfmFWaHpP2OeobqKNHVpsw-1
X-Mimecast-MFC-AGG-ID: hfmFWaHpP2OeobqKNHVpsw_1779419515
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 61BBF19560B7;
	Fri, 22 May 2026 03:11:55 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.32.61])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0FC0819560A3;
	Fri, 22 May 2026 03:11:50 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Serin Yeh <serin.yeh@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 3/3] media: i2c: imx471: Naming the register
Date: Fri, 22 May 2026 11:11:21 +0800
Message-ID: <20260522031121.11968-4-hpa@redhat.com>
In-Reply-To: <20260522031121.11968-1-hpa@redhat.com>
References: <20260522031121.11968-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62556-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D97915AE403
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Name the register addresses and set up the value with correct value
length.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/i2c/imx471.c | 96 ++++++++++++++++++++------------------
 1 file changed, 50 insertions(+), 46 deletions(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index f3c7fdce2d50..e8bc3487370f 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -76,12 +76,6 @@
 /* Default exposure margin */
 #define IMX471_EXPOSURE_MARGIN			18
 
-/* Horizontal crop window offset */
-#define IMX471_REG_H_WIN_OFFSET			CCI_REG8(0x0409)
-
-/* Vertical crop window offset */
-#define IMX471_REG_V_WIN_OFFSET			CCI_REG8(0x034b)
-
 /* Test Pattern Control */
 #define IMX471_REG_TEST_PATTERN			CCI_REG8(0x0600)
 #define IMX471_TEST_PATTERN_DISABLED		0
@@ -103,6 +97,32 @@
 #define IMX471_PIXEL_ARRAY_WIDTH		4656
 #define IMX471_PIXEL_ARRAY_HEIGHT		3496
 
+#define IMX471_REG_EXCK_FREQ			CCI_REG16(0x0136)
+#define IMX471_EXCK_FREQ(n)			((n) * 256)	/* n in MHz */
+
+#define IMX471_REG_CSI_DATA_FORMAT		CCI_REG16(0x0112)
+#define IMX471_CSI_DATA_FORMAT_RAW10		0x0a0a
+
+#define IMX471_REG_CSI_LANE_MODE		CCI_REG8(0x0114)
+#define IMX471_CSI_2_LANE_MODE			1
+#define IMX471_CSI_4_LANE_MODE			3
+
+#define IMX471_REG_X_ADD_STA			CCI_REG16(0x0344)
+#define IMX471_REG_Y_ADD_STA			CCI_REG16(0x0346)
+#define IMX471_REG_X_ADD_END			CCI_REG16(0x0348)
+#define IMX471_REG_Y_ADD_END			CCI_REG16(0x034a)
+#define IMX471_REG_X_OUTPUT_SIZE		CCI_REG16(0x034c)
+#define IMX471_REG_Y_OUTPUT_SIZE		CCI_REG16(0x034e)
+#define IMX471_REG_X_EVEN_INC			CCI_REG8(0x0381)
+#define IMX471_REG_X_ODD_INC			CCI_REG8(0x0383)
+#define IMX471_REG_Y_EVEN_INC			CCI_REG8(0x0385)
+#define IMX471_REG_Y_ODD_INC			CCI_REG8(0x0387)
+
+#define IMX471_REG_DIG_CROP_X_OFFSET		CCI_REG16(0x0408)
+#define IMX471_REG_DIG_CROP_Y_OFFSET		CCI_REG16(0x040a)
+#define IMX471_REG_DIG_CROP_WIDTH		CCI_REG16(0x040c)
+#define IMX471_REG_DIG_CROP_HEIGHT		CCI_REG16(0x040e)
+
 #define to_imx471(_sd) container_of_const(_sd, struct imx471, sd)
 
 static const char * const imx471_supply_name[] = {
@@ -156,8 +176,7 @@ struct imx471 {
 };
 
 static const struct cci_reg_sequence imx471_global_regs[] = {
-	{ CCI_REG8(0x0136), 0x13 },
-	{ CCI_REG8(0x0137), 0x33 },
+	{ IMX471_REG_EXCK_FREQ, IMX471_EXCK_FREQ(19.2) },
 	{ CCI_REG8(0x3c7e), 0x08 },
 	{ CCI_REG8(0x3c7f), 0x05 },
 	{ CCI_REG8(0x3e35), 0x00 },
@@ -215,43 +234,29 @@ static const struct cci_reg_sequence imx471_global_regs[] = {
 };
 
 static const struct cci_reg_sequence mode_1928x1088_regs[] = {
-	{ CCI_REG8(0x0101), 0x00 },
-	{ CCI_REG8(0x0112), 0x0a },
-	{ CCI_REG8(0x0113), 0x0a },
-	{ CCI_REG8(0x0114), 0x03 },
+	{ IMX471_REG_ORIENTATION, 0x00 },
+	{ IMX471_REG_CSI_DATA_FORMAT, IMX471_CSI_DATA_FORMAT_RAW10 },
+	{ IMX471_REG_CSI_LANE_MODE, IMX471_CSI_4_LANE_MODE },
 	{ CCI_REG8(0x0342), 0x0a },
 	{ CCI_REG8(0x0343), 0x00 },
-	{ CCI_REG8(0x0340), 0x13 },
-	{ CCI_REG8(0x0341), 0xb0 },
-	{ CCI_REG8(0x0344), 0x00 },
-	{ CCI_REG8(0x0345), 0x00 },
-	{ CCI_REG8(0x0346), 0x01 },
-	{ CCI_REG8(0x0347), 0xbc },
-	{ CCI_REG8(0x0348), 0x12 },
-	{ CCI_REG8(0x0349), 0x2f },
-	{ CCI_REG8(0x034a), 0x0b },
-	{ CCI_REG8(0x034b), 0xeb },
-	{ CCI_REG8(0x0381), 0x01 },
-	{ CCI_REG8(0x0383), 0x01 },
-	{ CCI_REG8(0x0385), 0x01 },
-	{ CCI_REG8(0x0387), 0x01 },
+	{ IMX471_REG_FLL, 0x13b0 },
+	{ IMX471_REG_X_ADD_STA, 8 },
+	{ IMX471_REG_Y_ADD_STA, 444 },
+	{ IMX471_REG_X_ADD_END, 4647 },
+	{ IMX471_REG_Y_ADD_END, 3051 },
+	{ IMX471_REG_X_EVEN_INC, 1 },
+	{ IMX471_REG_X_ODD_INC, 1 },
+	{ IMX471_REG_Y_EVEN_INC, 1 },
+	{ IMX471_REG_Y_ODD_INC, 1 },
 	{ CCI_REG8(0x0900), 0x01 },
 	{ CCI_REG8(0x0901), 0x22 },
 	{ CCI_REG8(0x0902), 0x08 },
-	{ CCI_REG8(0x3f4c), 0x81 },
-	{ CCI_REG8(0x3f4d), 0x81 },
-	{ CCI_REG8(0x0408), 0x00 },
-	{ CCI_REG8(0x0409), 0xc8 },
-	{ CCI_REG8(0x040a), 0x00 },
-	{ CCI_REG8(0x040b), 0x6c },
-	{ CCI_REG8(0x040c), 0x07 },
-	{ CCI_REG8(0x040d), 0x88 },
-	{ CCI_REG8(0x040e), 0x04 },
-	{ CCI_REG8(0x040f), 0x40 },
-	{ CCI_REG8(0x034c), 0x07 },
-	{ CCI_REG8(0x034d), 0x88 },
-	{ CCI_REG8(0x034e), 0x04 },
-	{ CCI_REG8(0x034f), 0x40 },
+	{ IMX471_REG_DIG_CROP_X_OFFSET, 208 },
+	{ IMX471_REG_DIG_CROP_Y_OFFSET, 108 },
+	{ IMX471_REG_DIG_CROP_WIDTH, 1928 },
+	{ IMX471_REG_DIG_CROP_HEIGHT, 1088 },
+	{ IMX471_REG_X_OUTPUT_SIZE, 1928 },
+	{ IMX471_REG_Y_OUTPUT_SIZE, 1088 },
 	{ CCI_REG8(0x0301), 0x06 },
 	{ CCI_REG8(0x0303), 0x02 },
 	{ CCI_REG8(0x0305), 0x02 },
@@ -262,12 +267,11 @@ static const struct cci_reg_sequence mode_1928x1088_regs[] = {
 	{ CCI_REG8(0x030e), 0x00 },
 	{ CCI_REG8(0x030f), 0x53 },
 	{ CCI_REG8(0x0310), 0x01 },
-	{ CCI_REG8(0x0202), 0x13 },
-	{ CCI_REG8(0x0203), 0x9e },
-	{ CCI_REG8(0x0204), 0x00 },
-	{ CCI_REG8(0x0205), 0x00 },
-	{ CCI_REG8(0x020e), 0x01 },
-	{ CCI_REG8(0x020f), 0x00 },
+	{ IMX471_REG_EXPOSURE, 5022 },
+	{ IMX471_REG_ANALOG_GAIN, 0 },
+	{ IMX471_REG_DIG_GAIN_GLOBAL, 256 },
+	{ CCI_REG8(0x3f4c), 0x81 },
+	{ CCI_REG8(0x3f4d), 0x81 },
 	{ CCI_REG8(0x3f78), 0x01 },
 	{ CCI_REG8(0x3f79), 0x31 },
 	{ CCI_REG8(0x3ffe), 0x00 },
-- 
2.54.0


