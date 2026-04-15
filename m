Return-Path: <linux-media+bounces-58781-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBI+LxE432nAQQAAu9opvQ
	(envelope-from <linux-media+bounces-58781-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:02:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CB34012B4
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 53A0C30359FC
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 07:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDE2395D87;
	Wed, 15 Apr 2026 07:02:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DBA3932F7
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 07:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776236553; cv=none; b=pcDEuo8cxt9O5nA8DgEnY4XiIB4rVdAnucev8dgRebfTXbHXQDnshj5cXq5rtyCTI6ZClnWe9NLT1nRlx/mk0TU5SNSKX0Q0md3Et9Jkk98+cY7VJ+/Um3PIb9MbzPxfovZQNr8h/vF0RW3s9tECtHZ0ZuHIj6y5O7/eXE0El2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776236553; c=relaxed/simple;
	bh=DUB4STdOB4g2xGyanHAxxahaeQI2HzEuaPo39/+FI70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LyPoG6bD+dtRGaoJIiM7R9SiGP3jHRwS3yZzarQYRGzbncbLZLkULeqa9ChjyUuwZPiBZ9m98gVpK8seJRyfzUn2Fy2hgoKTnCu/hIsBghzXgOQX1xPfQibKc2rqmhLFrXToUdRBkCUVLQ8MSPqxHYxheHXw8e9BxZY8B7HgBfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d73352cf2so2815859f8f.1
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 00:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776236548; x=1776841348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnzH5N/NFS74ukq9uAOkMVTEW0SopGDztI/w3fsROJM=;
        b=kWxDYADrgwkQsOHwJEmq/aQKCQ8RaKjOQ9UomDuvZRdljoptBSCQi4Yge/XNqdqDKG
         VV0PXAT3lxe5odzad/hSSC4+0N7iRc0SRp/BLXvJEkpdMZGUQaBHdFPeUz/vG71ZAqQT
         N+cMP3zdKc6BO5jnP+1VsZvB9vBp3JW2fSnCPoYEdbrrrGlyQL9CmxBZeuGJfcH3D2HA
         8JEgJk/uqc5ulGc/cxflAZ2ZAgTulhq6FYy1sLy1P4l5T0Kc0XmvsTLGUXGLI6fH1Uek
         U/l4MednmaL1nZUH9vl9PauFUER9zmn13+QlCQxjq2xaJ3psy6rCWMLTXd4IZ6zhO3Dg
         GjUg==
X-Forwarded-Encrypted: i=1; AFNElJ8PJEfyXmTW698kgAztYdYRUvRxoCnD3N+uxZ+BhwADwFQ3JasXKTmbh1GtMgkkhomtSS9WJYP9cegLXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9PAw/1FozHSpxLrjox/VV84d7i1Or+eni7016FP5BM0e1/jO8
	g19S5Ov30mbWjgXwZ2owCchiRCdP8E56quf/TyeiFYi5Z46ylWxxP4+w
X-Gm-Gg: AeBDieviSLYnQv6ugQr6S/f63cXc/wAkBFlp0OfSk10v9sSicyI58KTpgMF8fmsMdJE
	XYojWM4K5IyAo3KZkaiWRSs+TVFJ50E2awD1Ix7m9uSsiAVVNIXrSzD5Sc/niB0yyr5EVtmmf/t
	mfa9BtGT/WpBHyT9ns7asfe+sYf7/A3/uNRyT/6YOrcyV8EytmHu5z63D+r9Iqpm/TXh6EISZPB
	yBL/Araoy/0Sv+ayk0phWPUQVbSIVNlEdbezD7PJ6lp8giRJsg+GIeXgTNy8A1tYRv6iS5fI85J
	Kj+PPrzAVEI2iq80H/L3MpG7NCWiE3jKQhaQAaIOKwO34Igzhfob4RDY85ouozWOWg8We7hlyR0
	Ywxq3b9vLT0DA+KfGScOo7D1aLicWDNCGuUstjzZtx8EmIUtSNke8e938tMZPZWKskXRcppMY/m
	WlFVUsDA4C0pzMCdzHqnaAZOKK20riihm8qqPErJJl9gzQS14K/Kv01Q6Iz7RtDeJ6TwfBjm85c
	xsGzTsetBrG5NOVa4uG7yPmB/osPl8bo+uvQrEyiXaIu++hdxYH6KuvS6GLyMahYu18njk=
X-Received: by 2002:a05:6000:22c5:b0:43d:73ff:fd59 with SMTP id ffacd0b85a97d-43d73fffe60mr19742972f8f.10.1776236546921;
        Wed, 15 Apr 2026 00:02:26 -0700 (PDT)
Received: from localhost.localdomain (host-79-18-131-221.retail.telecomitalia.it. [79.18.131.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5f11sm2882904f8f.18.2026.04.15.00.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 00:02:26 -0700 (PDT)
From: deep@crimson.net.eu.org
To: sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kenet Jovan Sokoli <deep@crimson.net.eu.org>
Subject: [PATCH] media: staging: ipu7: cleanup register names and suffixes
Date: Wed, 15 Apr 2026 09:02:05 +0200
Message-ID: <20260415070205.1245502-1-deep@crimson.net.eu.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[crimson.net.eu.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58781-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deep@crimson.net.eu.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 51CB34012B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>

Rename BUTTRESS_ registers to include IPU7_ prefix and
remove unnecessary U suffixes from numeric constants
for consistency.

Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
---
 .../staging/media/ipu7/ipu7-buttress-regs.h   | 18 ++---
 drivers/staging/media/ipu7/ipu7-buttress.c    | 38 +++++-----
 drivers/staging/media/ipu7/ipu7-cpd.c         | 38 +++++-----
 drivers/staging/media/ipu7/ipu7-fw-isys.c     |  8 +--
 .../staging/media/ipu7/ipu7-isys-csi-phy.c    | 72 +++++++++----------
 .../staging/media/ipu7/ipu7-isys-csi-phy.h    |  4 +-
 .../staging/media/ipu7/ipu7-isys-csi2-regs.h  | 14 ++--
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   |  2 +-
 drivers/staging/media/ipu7/ipu7-isys-csi2.h   | 10 +--
 drivers/staging/media/ipu7/ipu7-isys-queue.c  |  4 +-
 drivers/staging/media/ipu7/ipu7-isys-subdev.c |  8 +--
 drivers/staging/media/ipu7/ipu7-isys-video.c  | 22 +++---
 drivers/staging/media/ipu7/ipu7-isys-video.h  |  8 +--
 drivers/staging/media/ipu7/ipu7-isys.c        | 18 ++---
 drivers/staging/media/ipu7/ipu7-isys.h        | 22 +++---
 drivers/staging/media/ipu7/ipu7-mmu.c         | 36 +++++-----
 drivers/staging/media/ipu7/ipu7.c             |  8 +--
 drivers/staging/media/ipu7/ipu7.h             | 40 +++++------
 18 files changed, 185 insertions(+), 185 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-buttress-regs.h b/drivers/staging/media/ipu7/ipu7-buttress-regs.h
index 3eafd6a3813d..e81669ef4824 100644
--- a/drivers/staging/media/ipu7/ipu7-buttress-regs.h
+++ b/drivers/staging/media/ipu7/ipu7-buttress-regs.h
@@ -280,14 +280,14 @@
 #define BUTTRESS_IRQ_PS_IRQ				BIT(31)
 
 /* buttress irq */
-#define	BUTTRESS_PWR_STATUS_HH_STATE_IDLE	0U
-#define	BUTTRESS_PWR_STATUS_HH_STATE_IN_PRGS	1U
-#define	BUTTRESS_PWR_STATUS_HH_STATE_DONE	2U
-#define	BUTTRESS_PWR_STATUS_HH_STATE_ERR	3U
+#define	IPU7_BUTTRESS_PWR_STATUS_HH_STATE_IDLE	0
+#define	IPU7_BUTTRESS_PWR_STATUS_HH_STATE_IN_PRGS	1
+#define	IPU7_BUTTRESS_PWR_STATUS_HH_STATE_DONE	2
+#define	IPU7_BUTTRESS_PWR_STATUS_HH_STATE_ERR	3
 
 #define BUTTRESS_TSC_CMD_START_TSC_SYNC		BIT(0)
 #define BUTTRESS_PWR_STATUS_HH_STATUS_SHIFT	11
-#define BUTTRESS_PWR_STATUS_HH_STATUS_MASK	(0x3U << 11)
+#define IPU7_BUTTRESS_PWR_STATUS_HH_STATUS_MASK	(0x3 << 11)
 #define BUTTRESS_TSW_WA_SOFT_RESET		BIT(8)
 /* new for PTL */
 #define BUTTRESS_SEL_PB_TIMESTAMP		BIT(9)
@@ -326,15 +326,15 @@
 #define BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK 0xffff
 
 /* IS/PS freq control */
-#define BUTTRESS_IS_FREQ_CTL_RATIO_MASK	0xffU
-#define BUTTRESS_PS_FREQ_CTL_RATIO_MASK	0xffU
+#define IPU7_BUTTRESS_IS_FREQ_CTL_RATIO_MASK	0xff
+#define IPU7_BUTTRESS_PS_FREQ_CTL_RATIO_MASK	0xff
 
 #define IPU7_IS_FREQ_MAX		450
 #define IPU7_IS_FREQ_MIN		50
 #define IPU7_PS_FREQ_MAX		750
-#define BUTTRESS_PS_FREQ_RATIO_STEP		25U
+#define IPU7_BUTTRESS_PS_FREQ_RATIO_STEP		25
 /* valid for IPU8 */
-#define BUTTRESS_IS_FREQ_RATIO_STEP		25U
+#define IPU7_BUTTRESS_IS_FREQ_RATIO_STEP		25
 
 /* IS: 400mhz, PS: 500mhz */
 #define IPU7_IS_FREQ_CTL_DEFAULT_RATIO		0x1b
diff --git a/drivers/staging/media/ipu7/ipu7-buttress.c b/drivers/staging/media/ipu7/ipu7-buttress.c
index 40c6c8473357..b013f458ff60 100644
--- a/drivers/staging/media/ipu7/ipu7-buttress.c
+++ b/drivers/staging/media/ipu7/ipu7-buttress.c
@@ -28,13 +28,13 @@
 
 #define BOOTLOADER_STATUS_OFFSET	BUTTRESS_REG_FW_BOOT_PARAMS7
 
-#define BOOTLOADER_MAGIC_KEY		0xb00710adU
+#define IPU7_BOOTLOADER_MAGIC_KEY		0xb00710ad
 
 #define ENTRY	BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE1
 #define EXIT	BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE2
 #define QUERY	BUTTRESS_IU2CSECSR_IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE
 
-#define BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX	10U
+#define IPU7_BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX	10
 
 #define BUTTRESS_POWER_TIMEOUT_US		(200 * USEC_PER_MSEC)
 
@@ -47,9 +47,9 @@
 #define BUTTRESS_IPC_VALIDITY_TIMEOUT_US	(1 * USEC_PER_SEC)
 #define BUTTRESS_TSC_SYNC_TIMEOUT_US		(5 * USEC_PER_MSEC)
 
-#define BUTTRESS_IPC_RESET_RETRY		2000U
-#define BUTTRESS_CSE_IPC_RESET_RETRY		4U
-#define BUTTRESS_IPC_CMD_SEND_RETRY		1U
+#define IPU7_BUTTRESS_IPC_RESET_RETRY		2000
+#define IPU7_BUTTRESS_CSE_IPC_RESET_RETRY		4
+#define IPU7_BUTTRESS_IPC_CMD_SEND_RETRY		1
 
 struct ipu7_ipc_buttress_msg {
 	u32 cmd;
@@ -66,7 +66,7 @@ static const u32 ipu7_adev_irq_mask[2] = {
 int ipu_buttress_ipc_reset(struct ipu7_device *isp,
 			   struct ipu_buttress_ipc *ipc)
 {
-	unsigned int retries = BUTTRESS_IPC_RESET_RETRY;
+	unsigned int retries = IPU7_BUTTRESS_IPC_RESET_RETRY;
 	struct ipu_buttress *b = &isp->buttress;
 	struct device *dev = &isp->pdev->dev;
 	u32 val = 0, csr_in_clr;
@@ -221,7 +221,7 @@ static int ipu_buttress_ipc_send_msg(struct ipu7_device *isp,
 				     struct ipu7_ipc_buttress_msg *msg)
 {
 	unsigned long tx_timeout_jiffies, rx_timeout_jiffies;
-	unsigned int retry = BUTTRESS_IPC_CMD_SEND_RETRY;
+	unsigned int retry = IPU7_BUTTRESS_IPC_CMD_SEND_RETRY;
 	struct ipu_buttress *b = &isp->buttress;
 	struct ipu_buttress_ipc *ipc = &b->cse;
 	struct device *dev = &isp->pdev->dev;
@@ -779,9 +779,9 @@ int ipu_buttress_get_isys_freq(struct ipu7_device *isp, u32 *freq)
 	pm_runtime_put(&isp->isys->auxdev.dev);
 
 	if (is_ipu8(isp->hw_ver))
-		*freq = (reg_val & BUTTRESS_IS_FREQ_CTL_RATIO_MASK) * 25;
+		*freq = (reg_val & IPU7_BUTTRESS_IS_FREQ_CTL_RATIO_MASK) * 25;
 	else
-		*freq = (reg_val & BUTTRESS_IS_FREQ_CTL_RATIO_MASK) * 50 / 3;
+		*freq = (reg_val & IPU7_BUTTRESS_IS_FREQ_CTL_RATIO_MASK) * 50 / 3;
 
 	return 0;
 }
@@ -803,8 +803,8 @@ int ipu_buttress_get_psys_freq(struct ipu7_device *isp, u32 *freq)
 
 	pm_runtime_put(&isp->psys->auxdev.dev);
 
-	reg_val &= BUTTRESS_PS_FREQ_CTL_RATIO_MASK;
-	*freq = BUTTRESS_PS_FREQ_RATIO_STEP * reg_val;
+	reg_val &= IPU7_BUTTRESS_PS_FREQ_CTL_RATIO_MASK;
+	*freq = IPU7_BUTTRESS_PS_FREQ_RATIO_STEP * reg_val;
 
 	return 0;
 }
@@ -901,7 +901,7 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
 	}
 
 	ret = readl_poll_timeout(isp->base + BOOTLOADER_STATUS_OFFSET,
-				 data, data == BOOTLOADER_MAGIC_KEY, 500,
+				 data, data == IPU7_BOOTLOADER_MAGIC_KEY, 500,
 				 BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
 	if (ret) {
 		dev_err(dev, "Unexpected magic number 0x%x\n", data);
@@ -951,19 +951,19 @@ static int ipu_buttress_send_tsc_request(struct ipu7_device *isp)
 	u32 val, mask, done;
 	int ret;
 
-	mask = BUTTRESS_PWR_STATUS_HH_STATUS_MASK;
+	mask = IPU7_BUTTRESS_PWR_STATUS_HH_STATUS_MASK;
 
 	writel(BUTTRESS_TSC_CMD_START_TSC_SYNC,
 	       isp->base + BUTTRESS_REG_TSC_CMD);
 
 	val = readl(isp->base + BUTTRESS_REG_PWR_STATUS);
 	val = FIELD_GET(mask, val);
-	if (val == BUTTRESS_PWR_STATUS_HH_STATE_ERR) {
+	if (val == IPU7_BUTTRESS_PWR_STATUS_HH_STATE_ERR) {
 		dev_err(&isp->pdev->dev, "Start tsc sync failed\n");
 		return -EINVAL;
 	}
 
-	done = BUTTRESS_PWR_STATUS_HH_STATE_DONE;
+	done = IPU7_BUTTRESS_PWR_STATUS_HH_STATE_DONE;
 	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_PWR_STATUS, val,
 				 FIELD_GET(mask, val) == done, 500,
 				 BUTTRESS_TSC_SYNC_TIMEOUT_US);
@@ -980,7 +980,7 @@ int ipu_buttress_start_tsc_sync(struct ipu7_device *isp)
 	u32 val;
 
 	if (is_ipu8(isp->hw_ver)) {
-		for (i = 0; i < BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
+		for (i = 0; i < IPU7_BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
 			val = readl(base + BUTTRESS_REG_PB_TIMESTAMP_VALID);
 			if (val == 1)
 				return 0;
@@ -996,7 +996,7 @@ int ipu_buttress_start_tsc_sync(struct ipu7_device *isp)
 		val |= BUTTRESS_SEL_PB_TIMESTAMP;
 		writel(val, base + BUTTRESS_REG_TSC_CTL);
 
-		for (i = 0; i < BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
+		for (i = 0; i < IPU7_BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
 			val = readl(base + BUTTRESS_REG_PB_TIMESTAMP_VALID);
 			if (val == 1)
 				return 0;
@@ -1008,7 +1008,7 @@ int ipu_buttress_start_tsc_sync(struct ipu7_device *isp)
 		return -ETIMEDOUT;
 	}
 
-	for (i = 0; i < BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
+	for (i = 0; i < IPU7_BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
 		int ret;
 
 		ret = ipu_buttress_send_tsc_request(isp);
@@ -1143,7 +1143,7 @@ void ipu_buttress_restore(struct ipu7_device *isp)
 
 int ipu_buttress_init(struct ipu7_device *isp)
 {
-	int ret, ipc_reset_retry = BUTTRESS_CSE_IPC_RESET_RETRY;
+	int ret, ipc_reset_retry = IPU7_BUTTRESS_CSE_IPC_RESET_RETRY;
 	struct ipu_buttress *b = &isp->buttress;
 	struct device *dev = &isp->pdev->dev;
 	u32 val;
diff --git a/drivers/staging/media/ipu7/ipu7-cpd.c b/drivers/staging/media/ipu7/ipu7-cpd.c
index 4f49fb57eae4..80b5834a9587 100644
--- a/drivers/staging/media/ipu7/ipu7-cpd.c
+++ b/drivers/staging/media/ipu7/ipu7-cpd.c
@@ -21,21 +21,21 @@
 #define MAX_MANIFEST_SIZE	(SZ_4K * sizeof(u32))
 
 #define CPD_MANIFEST_IDX	0
-#define CPD_BINARY_START_IDX	1U
-#define CPD_METADATA_START_IDX	2U
-#define CPD_BINARY_NUM		2U /* ISYS + PSYS */
+#define IPU7_CPD_BINARY_START_IDX	1
+#define IPU7_CPD_METADATA_START_IDX	2
+#define IPU7_CPD_BINARY_NUM		2 /* ISYS + PSYS */
 /*
  * Entries include:
  * 1 manifest entry.
  * 1 metadata entry for each sub system(ISYS and PSYS).
  * 1 binary entry for each sub system(ISYS and PSYS).
  */
-#define CPD_ENTRY_NUM		(CPD_BINARY_NUM * 2U + 1U)
+#define IPU7_CPD_ENTRY_NUM		(IPU7_CPD_BINARY_NUM * 2 + 1)
 
 #define CPD_METADATA_ATTR	0xa
 #define CPD_METADATA_IPL	0x1c
-#define ONLINE_METADATA_SIZE	128U
-#define ONLINE_METADATA_LINES	6U
+#define IPU7_ONLINE_METADATA_SIZE	128
+#define IPU7_ONLINE_METADATA_LINES	6
 
 struct ipu7_cpd_hdr {
 	u32 hdr_mark;
@@ -94,7 +94,7 @@ static inline struct ipu7_cpd_ent *ipu7_cpd_get_entry(const void *cpd, int idx)
 static struct ipu7_cpd_metadata *ipu7_cpd_get_metadata(const void *cpd, int idx)
 {
 	struct ipu7_cpd_ent *cpd_ent =
-		ipu7_cpd_get_entry(cpd, CPD_METADATA_START_IDX + idx * 2);
+		ipu7_cpd_get_entry(cpd, IPU7_CPD_METADATA_START_IDX + idx * 2);
 
 	return (struct ipu7_cpd_metadata *)((u8 *)cpd + cpd_ent->offset);
 }
@@ -123,7 +123,7 @@ static int ipu7_cpd_validate_cpd(struct ipu7_device *isp,
 	}
 
 	/* Sanity check for CPD entry header */
-	if (cpd_hdr->ent_cnt != CPD_ENTRY_NUM) {
+	if (cpd_hdr->ent_cnt != IPU7_CPD_ENTRY_NUM) {
 		dev_err(dev, "Invalid CPD entry number %d\n",
 			cpd_hdr->ent_cnt);
 		return -EINVAL;
@@ -151,7 +151,7 @@ static int ipu7_cpd_validate_metadata(struct ipu7_device *isp,
 				      const void *cpd, int idx)
 {
 	const struct ipu7_cpd_ent *cpd_ent =
-		ipu7_cpd_get_entry(cpd, CPD_METADATA_START_IDX + idx * 2);
+		ipu7_cpd_get_entry(cpd, IPU7_CPD_METADATA_START_IDX + idx * 2);
 	const struct ipu7_cpd_metadata *metadata =
 		ipu7_cpd_get_metadata(cpd, idx);
 	struct device *dev = &isp->pdev->dev;
@@ -210,7 +210,7 @@ int ipu7_cpd_validate_cpd_file(struct ipu7_device *isp, const void *cpd_file,
 	}
 
 	/* Validate metadata */
-	for (i = 0; i < CPD_BINARY_NUM; i++) {
+	for (i = 0; i < IPU7_CPD_BINARY_NUM; i++) {
 		ret = ipu7_cpd_validate_metadata(isp, cpd_file, i);
 		if (ret) {
 			dev_err(dev, "Invalid metadata%d\n", i);
@@ -219,24 +219,24 @@ int ipu7_cpd_validate_cpd_file(struct ipu7_device *isp, const void *cpd_file,
 	}
 
 	/* Get fw binary version. */
-	buf = kmalloc(ONLINE_METADATA_SIZE, GFP_KERNEL);
+	buf = kmalloc(IPU7_ONLINE_METADATA_SIZE, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
-	for (i = 0; i < CPD_BINARY_NUM; i++) {
-		char *lines[ONLINE_METADATA_LINES];
+	for (i = 0; i < IPU7_CPD_BINARY_NUM; i++) {
+		char *lines[IPU7_ONLINE_METADATA_LINES];
 		char *info = buf;
 		unsigned int l;
 
 		ent = ipu7_cpd_get_entry(cpd_file,
-					 CPD_BINARY_START_IDX + i * 2U);
+					 IPU7_CPD_BINARY_START_IDX + i * 2U);
 		memcpy(info, (u8 *)cpd_file + ent->offset + ent->len -
-		       ONLINE_METADATA_SIZE, ONLINE_METADATA_SIZE);
-		for (l = 0; l < ONLINE_METADATA_LINES; l++) {
+		       IPU7_ONLINE_METADATA_SIZE, IPU7_ONLINE_METADATA_SIZE);
+		for (l = 0; l < IPU7_ONLINE_METADATA_LINES; l++) {
 			lines[l] = strsep((char **)&info, "\n");
 			if (!lines[l])
 				break;
 		}
-		if (l < ONLINE_METADATA_LINES) {
+		if (l < IPU7_ONLINE_METADATA_LINES) {
 			dev_err(dev, "Failed to parse fw binary%d info.\n", i);
 			continue;
 		}
@@ -257,9 +257,9 @@ int ipu7_cpd_copy_binary(const void *cpd, const char *name,
 {
 	unsigned int i;
 
-	for (i = 0; i < CPD_BINARY_NUM; i++) {
+	for (i = 0; i < IPU7_CPD_BINARY_NUM; i++) {
 		const struct ipu7_cpd_ent *binary =
-			ipu7_cpd_get_entry(cpd, CPD_BINARY_START_IDX + i * 2U);
+			ipu7_cpd_get_entry(cpd, IPU7_CPD_BINARY_START_IDX + i * 2U);
 		const struct ipu7_cpd_metadata *metadata =
 			ipu7_cpd_get_metadata(cpd, i);
 
diff --git a/drivers/staging/media/ipu7/ipu7-fw-isys.c b/drivers/staging/media/ipu7/ipu7-fw-isys.c
index e4b9c364572b..25cfa7ff0b21 100644
--- a/drivers/staging/media/ipu7/ipu7-fw-isys.c
+++ b/drivers/staging/media/ipu7/ipu7-fw-isys.c
@@ -109,23 +109,23 @@ int ipu7_fw_isys_init(struct ipu7_isys *isys)
 	}
 	syscom->queue_configs = queue_configs;
 	queue_configs[IPU_INSYS_OUTPUT_MSG_QUEUE].max_capacity =
-		IPU_ISYS_SIZE_RECV_QUEUE;
+		IPU7_ISYS_SIZE_RECV_QUEUE;
 	queue_configs[IPU_INSYS_OUTPUT_MSG_QUEUE].token_size_in_bytes =
 		sizeof(struct ipu7_insys_resp);
 	queue_configs[IPU_INSYS_OUTPUT_LOG_QUEUE].max_capacity =
-		IPU_ISYS_SIZE_LOG_QUEUE;
+		IPU7_ISYS_SIZE_LOG_QUEUE;
 	queue_configs[IPU_INSYS_OUTPUT_LOG_QUEUE].token_size_in_bytes =
 		sizeof(struct ipu7_insys_resp);
 	queue_configs[IPU_INSYS_OUTPUT_RESERVED_QUEUE].max_capacity = 0;
 	queue_configs[IPU_INSYS_OUTPUT_RESERVED_QUEUE].token_size_in_bytes = 0;
 
 	queue_configs[IPU_INSYS_INPUT_DEV_QUEUE].max_capacity =
-		IPU_ISYS_MAX_STREAMS;
+		IPU7_ISYS_MAX_STREAMS;
 	queue_configs[IPU_INSYS_INPUT_DEV_QUEUE].token_size_in_bytes =
 		sizeof(struct ipu7_insys_send_queue_token);
 
 	for (i = IPU_INSYS_INPUT_MSG_QUEUE; i < num_queues; i++) {
-		queue_configs[i].max_capacity = IPU_ISYS_SIZE_SEND_QUEUE;
+		queue_configs[i].max_capacity = IPU7_ISYS_SIZE_SEND_QUEUE;
 		queue_configs[i].token_size_in_bytes =
 			sizeof(struct ipu7_insys_send_queue_token);
 	}
diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
index 3f15af3b4c79..3ca85babd615 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
@@ -23,13 +23,13 @@
 #include "ipu7-platform-regs.h"
 #include "ipu7-isys-csi-phy.h"
 
-#define PORT_A		0U
-#define PORT_B		1U
-#define PORT_C		2U
-#define PORT_D		3U
+#define IPU7_PORT_A		0
+#define IPU7_PORT_B		1
+#define IPU7_PORT_C		2
+#define IPU7_PORT_D		3
 
-#define N_DATA_IDS	8U
-static DECLARE_BITMAP(data_ids, N_DATA_IDS);
+#define IPU7_N_DATA_IDS	8
+static DECLARE_BITMAP(data_ids, IPU7_N_DATA_IDS);
 
 struct ddlcal_counter_ref_s {
 	u16 min_mbps;
@@ -275,8 +275,8 @@ static int __dids_config(struct ipu7_isys_csi2 *csi2, u32 id, u8 vc, u8 dt)
 		id, vc, dt);
 
 	dwc_csi_write(isys, id, VC_EXTENSION, 0x0);
-	n = find_first_zero_bit(data_ids, N_DATA_IDS);
-	if (n == N_DATA_IDS)
+	n = find_first_zero_bit(data_ids, IPU7_N_DATA_IDS);
+	if (n == IPU7_N_DATA_IDS)
 		return -ENOSPC;
 
 	ret = test_and_set_bit(n, data_ids);
@@ -340,7 +340,7 @@ static int ipu7_isys_csi_ctrl_dids_config(struct ipu7_isys_csi2 *csi2, u32 id)
 	return 0;
 }
 
-#define CDPHY_TIMEOUT 5000000U
+#define IPU7_CDPHY_TIMEOUT 5000000
 static int ipu7_isys_phy_ready(struct ipu7_isys *isys, u32 id)
 {
 	void __iomem *isys_base = isys->pdata->base;
@@ -355,7 +355,7 @@ static int ipu7_isys_phy_ready(struct ipu7_isys *isys, u32 id)
 	dev_dbg(dev, "waiting phy ready...\n");
 	ret = readl_poll_timeout(gpreg + PHY_READY, phy_ready,
 				 phy_ready & BIT(0) && phy_ready != ~0U,
-				 100, CDPHY_TIMEOUT);
+				 100, IPU7_CDPHY_TIMEOUT);
 	dev_dbg(dev, "phy %u ready = 0x%08x\n", id, readl(gpreg + PHY_READY));
 	dev_dbg(dev, "csi %u PHY_RX = 0x%08x\n", id,
 		dwc_csi_read(isys, id, PHY_RX));
@@ -509,7 +509,7 @@ static void ipu7_isys_dphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
 	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_2,
 			   0, 0, 0);
 	if (!is_ipu7(isys->adev->isp->hw_ver) ||
-	    id == PORT_B || id == PORT_C) {
+	    id == IPU7_PORT_B || id == IPU7_PORT_C) {
 		dwc_phy_write_mask(isys, id,
 				   CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_2,
 				   1, 0, 0);
@@ -551,7 +551,7 @@ static void ipu7_isys_dphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
 		dwc_phy_write_mask(isys, id, reg + (i * 0x400), val, 3, 3);
 	}
 
-	if (!is_ipu7(isys->adev->isp->hw_ver) || id == PORT_B || id == PORT_C)
+	if (!is_ipu7(isys->adev->isp->hw_ver) || id == IPU7_PORT_B || id == IPU7_PORT_C)
 		reg = CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_9;
 	else
 		reg = CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_9;
@@ -572,7 +572,7 @@ static void ipu7_isys_dphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
 		reg = CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_15;
 		dwc_phy_write_mask(isys, id, reg, 3, 3, 4);
 
-		val = (id == PORT_A) ? 3 : 0;
+		val = (id == IPU7_PORT_A) ? 3 : 0;
 		reg = CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_15;
 		dwc_phy_write_mask(isys, id, reg, val, 3, 4);
 
@@ -904,7 +904,7 @@ static int ipu7_isys_phy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
 			   563, 0, 11);
 	dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_2, 5, 0, 7);
 	/* bypass the RCAL state (bit6) */
-	if (aggregation && id != PORT_A)
+	if (aggregation && id != IPU7_PORT_A)
 		dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_2, 0x45,
 				   0, 7);
 
@@ -945,9 +945,9 @@ static int ipu7_isys_phy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
 	else
 		phy_mode = isys->csi2[id].phy_mode;
 
-	if (phy_mode == PHY_MODE_DPHY) {
+	if (phy_mode == IPU7_PHY_MODE_DPHY) {
 		ipu7_isys_dphy_config(isys, id, lanes, aggregation, mbps);
-	} else if (phy_mode == PHY_MODE_CPHY) {
+	} else if (phy_mode == IPU7_PHY_MODE_CPHY) {
 		ipu7_isys_cphy_config(isys, id, lanes, aggregation, mbps);
 	} else {
 		dev_err(dev, "unsupported phy mode %d!\n",
@@ -966,7 +966,7 @@ int ipu7_isys_csi_phy_powerup(struct ipu7_isys_csi2 *csi2)
 	int ret;
 
 	/* lanes remapping for aggregation (port AB) mode */
-	if (!is_ipu7(isys->adev->isp->hw_ver) && lanes > 2 && id == PORT_A) {
+	if (!is_ipu7(isys->adev->isp->hw_ver) && lanes > 2 && id == IPU7_PORT_A) {
 		aggregation = true;
 		lanes = 2;
 	}
@@ -978,14 +978,14 @@ int ipu7_isys_csi_phy_powerup(struct ipu7_isys_csi2 *csi2)
 	gpreg_write(isys, id, PHY_LANE_FORCE_CONTROL, 0xf);
 	gpreg_write(isys, id, PHY_MODE, csi2->phy_mode);
 
-	/* config PORT_B if aggregation mode */
+	/* config IPU7_PORT_B if aggregation mode */
 	if (aggregation) {
-		ipu7_isys_csi_phy_reset(isys, PORT_B);
-		gpreg_write(isys, PORT_B, PHY_CLK_LANE_CONTROL, 0x0);
-		gpreg_write(isys, PORT_B, PHY_LANE_CONTROL_EN, 0x3);
-		gpreg_write(isys, PORT_B, PHY_CLK_LANE_FORCE_CONTROL, 0x2);
-		gpreg_write(isys, PORT_B, PHY_LANE_FORCE_CONTROL, 0xf);
-		gpreg_write(isys, PORT_B, PHY_MODE, csi2->phy_mode);
+		ipu7_isys_csi_phy_reset(isys, IPU7_PORT_B);
+		gpreg_write(isys, IPU7_PORT_B, PHY_CLK_LANE_CONTROL, 0x0);
+		gpreg_write(isys, IPU7_PORT_B, PHY_LANE_CONTROL_EN, 0x3);
+		gpreg_write(isys, IPU7_PORT_B, PHY_CLK_LANE_FORCE_CONTROL, 0x2);
+		gpreg_write(isys, IPU7_PORT_B, PHY_LANE_FORCE_CONTROL, 0xf);
+		gpreg_write(isys, IPU7_PORT_B, PHY_MODE, csi2->phy_mode);
 	}
 
 	ipu7_isys_csi_ctrl_cfg(csi2);
@@ -1008,23 +1008,23 @@ int ipu7_isys_csi_phy_powerup(struct ipu7_isys_csi2 *csi2)
 	gpreg_write(isys, id, PHY_LANE_FORCE_CONTROL, 0);
 	gpreg_write(isys, id, PHY_CLK_LANE_FORCE_CONTROL, 0);
 
-	/* config PORT_B if aggregation mode */
+	/* config IPU7_PORT_B if aggregation mode */
 	if (aggregation) {
-		ret = ipu7_isys_phy_config(isys, PORT_B, 2, aggregation);
+		ret = ipu7_isys_phy_config(isys, IPU7_PORT_B, 2, aggregation);
 		if (ret < 0)
 			return ret;
 
-		gpreg_write(isys, PORT_B, PHY_RESET, 1);
-		gpreg_write(isys, PORT_B, PHY_SHUTDOWN, 1);
-		dwc_csi_write(isys, PORT_B, DPHY_RSTZ, 1);
-		dwc_csi_write(isys, PORT_B, PHY_SHUTDOWNZ, 1);
-		dwc_csi_write(isys, PORT_B, CSI2_RESETN, 1);
-		ret = ipu7_isys_phy_ready(isys, PORT_B);
+		gpreg_write(isys, IPU7_PORT_B, PHY_RESET, 1);
+		gpreg_write(isys, IPU7_PORT_B, PHY_SHUTDOWN, 1);
+		dwc_csi_write(isys, IPU7_PORT_B, DPHY_RSTZ, 1);
+		dwc_csi_write(isys, IPU7_PORT_B, PHY_SHUTDOWNZ, 1);
+		dwc_csi_write(isys, IPU7_PORT_B, CSI2_RESETN, 1);
+		ret = ipu7_isys_phy_ready(isys, IPU7_PORT_B);
 		if (ret < 0)
 			return ret;
 
-		gpreg_write(isys, PORT_B, PHY_LANE_FORCE_CONTROL, 0);
-		gpreg_write(isys, PORT_B, PHY_CLK_LANE_FORCE_CONTROL, 0);
+		gpreg_write(isys, IPU7_PORT_B, PHY_LANE_FORCE_CONTROL, 0);
+		gpreg_write(isys, IPU7_PORT_B, PHY_CLK_LANE_FORCE_CONTROL, 0);
 	}
 
 	return 0;
@@ -1036,6 +1036,6 @@ void ipu7_isys_csi_phy_powerdown(struct ipu7_isys_csi2 *csi2)
 
 	ipu7_isys_csi_phy_reset(isys, csi2->port);
 	if (!is_ipu7(isys->adev->isp->hw_ver) &&
-	    csi2->nlanes > 2U && csi2->port == PORT_A)
-		ipu7_isys_csi_phy_reset(isys, PORT_B);
+	    csi2->nlanes > 2U && csi2->port == IPU7_PORT_A)
+		ipu7_isys_csi_phy_reset(isys, IPU7_PORT_B);
 }
diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.h b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.h
index dfdcb61540c4..5a6c47dd7485 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.h
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.h
@@ -8,8 +8,8 @@
 
 struct ipu7_isys;
 
-#define PHY_MODE_DPHY		0U
-#define PHY_MODE_CPHY		1U
+#define IPU7_PHY_MODE_DPHY		0
+#define IPU7_PHY_MODE_CPHY		1
 
 int ipu7_isys_csi_phy_powerup(struct ipu7_isys_csi2 *csi2);
 void ipu7_isys_csi_phy_powerdown(struct ipu7_isys_csi2 *csi2);
diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h b/drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h
index aad52c44a005..02991a0d5e90 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h
@@ -54,7 +54,7 @@
 #define IS_MAIN_IRQ_CTL_LEVEL_NOT_PULSE		(IS_MAIN_IRQ_CTRL_BASE + 0x14)
 
 /* IS IO regs base */
-#define IS_PHY_NUM				4U
+#define IPU7_IS_PHY_NUM				4
 #define IS_IO_BASE				0x280000
 
 /* dwc csi cdphy registers */
@@ -1003,7 +1003,7 @@
 #define PORT_ARB_IRQ_CTL_CLEAR			0x8
 #define PORT_ARB_IRQ_CTL_ENABLE			0xc
 
-#define MGC_PPC					4U
+#define IPU7_MGC_PPC					4
 #define MGC_DTYPE_RAW(i)			(((i) - 8) / 2)
 #define IS_IO_MGC_BASE				(IS_IO_BASE + 0x48000)
 #define MGC_KICK				0x0
@@ -1048,8 +1048,8 @@
 #define MGC_MG_BUSY_STTS			0xa8
 #define MGC_MG_STOPPED_STTS			0xac
 /* tile width and height in pixels for Chess board and Color palette */
-#define MGC_TPG_TILE_WIDTH			64U
-#define MGC_TPG_TILE_HEIGHT			64U
+#define IPU7_MGC_TPG_TILE_WIDTH			64
+#define IPU7_MGC_TPG_TILE_HEIGHT			64
 
 #define IPU_CSI_PORT_A_ADDR_OFFSET		0x0
 #define IPU_CSI_PORT_B_ADDR_OFFSET		0x0
@@ -1152,8 +1152,8 @@
 #define IPU7_CSI_RX_SYNC_IRQ_MASK		0x0
 #define IPU7P5_CSI_RX_SYNC_FE_IRQ_MASK		0x0
 
-#define CSI_RX_NUM_ERRORS_IN_IRQ		12U
-#define CSI_RX_NUM_SYNC_IN_IRQ			32U
+#define IPU7_CSI_RX_NUM_ERRORS_IN_IRQ		12
+#define IPU7_CSI_RX_NUM_SYNC_IN_IRQ			32
 
 enum CSI_FE_MODE_TYPE {
 	CSI_FE_DPHY_MODE = 0,
@@ -1187,7 +1187,7 @@ enum CSI2HOST_SELECTION {
 #define CSI_REG_PORT_GPREG_CSI2_SLV_REG_SRST	0x4
 #define CSI_REG_PORT_GPREG_CSI2_PORT_CONTROL	0x8
 
-#define CSI_RX_NUM_IRQ				32U
+#define IPU7_CSI_RX_NUM_IRQ				32
 
 #define IPU7_CSI_RX_SYNC_FS_VC			0x55555555
 #define IPU7_CSI_RX_SYNC_FE_VC			0xaaaaaaaa
diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.c b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
index f34eabfe8a98..a5e222e92edb 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi2.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
@@ -222,7 +222,7 @@ static int ipu7_isys_csi2_set_sel(struct v4l2_subdev *sd,
 	/* Non-bayer formats can't be single line cropped */
 	if (!ipu7_isys_is_bayer_format(sink_ffmt->code))
 		sel->r.top &= ~1U;
-	sel->r.height = clamp(sel->r.height & ~1U, IPU_ISYS_MIN_HEIGHT,
+	sel->r.height = clamp(sel->r.height & ~1U, IPU7_ISYS_MIN_HEIGHT,
 			      sink_ffmt->height - sel->r.top);
 	*crop = sel->r;
 
diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.h b/drivers/staging/media/ipu7/ipu7-isys-csi2.h
index 6c23b80f92a2..a83b9a1e2bc7 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi2.h
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi2.h
@@ -16,12 +16,12 @@ struct ipu7_isys;
 struct ipu7_isys_csi2_pdata;
 struct ipu7_isys_stream;
 
-#define IPU7_NR_OF_CSI2_VC		16U
+#define IPU7_NR_OF_CSI2_VC		16
 #define INVALID_VC_ID			-1
-#define IPU7_NR_OF_CSI2_SINK_PADS	1U
-#define IPU7_CSI2_PAD_SINK		0U
-#define IPU7_NR_OF_CSI2_SRC_PADS	8U
-#define IPU7_CSI2_PAD_SRC		1U
+#define IPU7_NR_OF_CSI2_SINK_PADS	1
+#define IPU7_CSI2_PAD_SINK		0
+#define IPU7_NR_OF_CSI2_SRC_PADS	8
+#define IPU7_CSI2_PAD_SRC		1
 #define IPU7_NR_OF_CSI2_PADS		(IPU7_NR_OF_CSI2_SINK_PADS + \
 					 IPU7_NR_OF_CSI2_SRC_PADS)
 
diff --git a/drivers/staging/media/ipu7/ipu7-isys-queue.c b/drivers/staging/media/ipu7/ipu7-isys-queue.c
index 434d9d9c7158..c6eecd5c86f3 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-queue.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-queue.c
@@ -652,7 +652,7 @@ get_sof_sequence_by_timestamp(struct ipu7_isys_stream *stream, u64 time)
 	if (time == 0)
 		return atomic_read(&stream->sequence) - 1;
 
-	for (i = 0; i < IPU_ISYS_MAX_PARALLEL_SOF; i++)
+	for (i = 0; i < IPU7_ISYS_MAX_PARALLEL_SOF; i++)
 		if (time == stream->seq[i].timestamp) {
 			dev_dbg(dev, "SOF: using seq nr %u for ts %llu\n",
 				stream->seq[i].sequence, time);
@@ -660,7 +660,7 @@ get_sof_sequence_by_timestamp(struct ipu7_isys_stream *stream, u64 time)
 		}
 
 	dev_dbg(dev, "SOF: looking for %llu\n", time);
-	for (i = 0; i < IPU_ISYS_MAX_PARALLEL_SOF; i++)
+	for (i = 0; i < IPU7_ISYS_MAX_PARALLEL_SOF; i++)
 		dev_dbg(dev, "SOF: sequence %u, timestamp value %llu\n",
 			stream->seq[i].sequence, stream->seq[i].timestamp);
 	dev_dbg(dev, "SOF sequence number not found\n");
diff --git a/drivers/staging/media/ipu7/ipu7-isys-subdev.c b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
index 67a776033d5b..b05035b403d5 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-subdev.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
@@ -115,11 +115,11 @@ int ipu7_isys_subdev_set_fmt(struct v4l2_subdev *sd,
 	    sd->entity.num_pads > 1)
 		return v4l2_subdev_get_fmt(sd, state, format);
 
-	format->format.width = clamp(format->format.width, IPU_ISYS_MIN_WIDTH,
-				     IPU_ISYS_MAX_WIDTH);
+	format->format.width = clamp(format->format.width, IPU7_ISYS_MIN_WIDTH,
+				     IPU7_ISYS_MAX_WIDTH);
 	format->format.height = clamp(format->format.height,
-				      IPU_ISYS_MIN_HEIGHT,
-				      IPU_ISYS_MAX_HEIGHT);
+				      IPU7_ISYS_MIN_HEIGHT,
+				      IPU7_ISYS_MAX_HEIGHT);
 
 	for (i = 0; asd->supported_codes[i]; i++) {
 		if (asd->supported_codes[i] == format->format.code) {
diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
index 8c6730833f24..4c5d9d1ec772 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
@@ -152,10 +152,10 @@ static int ipu7_isys_vidioc_enum_framesizes(struct file *file, void *fh,
 			continue;
 
 		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
-		fsize->stepwise.min_width = IPU_ISYS_MIN_WIDTH;
-		fsize->stepwise.max_width = IPU_ISYS_MAX_WIDTH;
-		fsize->stepwise.min_height = IPU_ISYS_MIN_HEIGHT;
-		fsize->stepwise.max_height = IPU_ISYS_MAX_HEIGHT;
+		fsize->stepwise.min_width = IPU7_ISYS_MIN_WIDTH;
+		fsize->stepwise.max_width = IPU7_ISYS_MAX_WIDTH;
+		fsize->stepwise.min_height = IPU7_ISYS_MIN_HEIGHT;
+		fsize->stepwise.max_height = IPU7_ISYS_MAX_HEIGHT;
 		fsize->stepwise.step_width = 2;
 		fsize->stepwise.step_height = 2;
 
@@ -183,8 +183,8 @@ static void ipu7_isys_try_fmt_cap(struct ipu7_isys_video *av, u32 type,
 		ipu7_isys_get_isys_format(*format);
 
 	*format = pfmt->pixelformat;
-	*width = clamp(*width, IPU_ISYS_MIN_WIDTH, IPU_ISYS_MAX_WIDTH);
-	*height = clamp(*height, IPU_ISYS_MIN_HEIGHT, IPU_ISYS_MAX_HEIGHT);
+	*width = clamp(*width, IPU7_ISYS_MIN_WIDTH, IPU7_ISYS_MAX_WIDTH);
+	*height = clamp(*height, IPU7_ISYS_MIN_HEIGHT, IPU7_ISYS_MAX_HEIGHT);
 
 	if (pfmt->bpp != pfmt->bpp_packed)
 		*bytesperline = *width * DIV_ROUND_UP(pfmt->bpp, BITS_PER_BYTE);
@@ -665,7 +665,7 @@ void ipu7_isys_put_stream(struct ipu7_isys_stream *stream)
 	dev = &stream->isys->adev->auxdev.dev;
 
 	spin_lock_irqsave(&stream->isys->streams_lock, flags);
-	for (i = 0; i < IPU_ISYS_MAX_STREAMS; i++) {
+	for (i = 0; i < IPU7_ISYS_MAX_STREAMS; i++) {
 		if (&stream->isys->streams[i] == stream) {
 			if (stream->isys->streams_ref_count[i] > 0)
 				stream->isys->streams_ref_count[i]--;
@@ -691,7 +691,7 @@ ipu7_isys_get_stream(struct ipu7_isys_video *av, struct ipu7_isys_subdev *asd)
 		return NULL;
 
 	spin_lock_irqsave(&isys->streams_lock, flags);
-	for (i = 0; i < IPU_ISYS_MAX_STREAMS; i++) {
+	for (i = 0; i < IPU7_ISYS_MAX_STREAMS; i++) {
 		if (isys->streams_ref_count[i] && isys->streams[i].vc == vc &&
 		    isys->streams[i].asd == asd) {
 			isys->streams_ref_count[i]++;
@@ -701,7 +701,7 @@ ipu7_isys_get_stream(struct ipu7_isys_video *av, struct ipu7_isys_subdev *asd)
 	}
 
 	if (!stream) {
-		for (i = 0; i < IPU_ISYS_MAX_STREAMS; i++) {
+		for (i = 0; i < IPU7_ISYS_MAX_STREAMS; i++) {
 			if (!isys->streams_ref_count[i]) {
 				isys->streams_ref_count[i]++;
 				stream = &isys->streams[i];
@@ -725,7 +725,7 @@ ipu7_isys_query_stream_by_handle(struct ipu7_isys *isys, u8 stream_handle)
 	if (!isys)
 		return NULL;
 
-	if (stream_handle >= IPU_ISYS_MAX_STREAMS) {
+	if (stream_handle >= IPU7_ISYS_MAX_STREAMS) {
 		dev_err(&isys->adev->auxdev.dev,
 			"stream_handle %d is invalid\n", stream_handle);
 		return NULL;
@@ -758,7 +758,7 @@ ipu7_isys_query_stream_by_source(struct ipu7_isys *isys, int source, u8 vc)
 	}
 
 	spin_lock_irqsave(&isys->streams_lock, flags);
-	for (i = 0; i < IPU_ISYS_MAX_STREAMS; i++) {
+	for (i = 0; i < IPU7_ISYS_MAX_STREAMS; i++) {
 		if (!isys->streams_ref_count[i])
 			continue;
 
diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.h b/drivers/staging/media/ipu7/ipu7-isys-video.h
index 1ac1787fabef..55510c594655 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.h
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.h
@@ -17,8 +17,8 @@
 
 #include "ipu7-isys-queue.h"
 
-#define IPU_INSYS_OUTPUT_PINS		11U
-#define IPU_ISYS_MAX_PARALLEL_SOF	2U
+#define IPU7_INSYS_OUTPUT_PINS		11
+#define IPU7_ISYS_MAX_PARALLEL_SOF	2
 
 struct file;
 struct ipu7_isys;
@@ -55,7 +55,7 @@ struct ipu7_isys_stream {
 	atomic_t sequence;
 	atomic_t buf_id;
 	unsigned int seq_index;
-	struct sequence_info seq[IPU_ISYS_MAX_PARALLEL_SOF];
+	struct sequence_info seq[IPU7_ISYS_MAX_PARALLEL_SOF];
 	int stream_source;
 	int stream_handle;
 	unsigned int nr_output_pins;
@@ -71,7 +71,7 @@ struct ipu7_isys_stream {
 	struct completion stream_stop_completion;
 	struct ipu7_isys *isys;
 
-	struct output_pin_data output_pins[IPU_INSYS_OUTPUT_PINS];
+	struct output_pin_data output_pins[IPU7_INSYS_OUTPUT_PINS];
 	int error;
 	u8 vc;
 };
diff --git a/drivers/staging/media/ipu7/ipu7-isys.c b/drivers/staging/media/ipu7/ipu7-isys.c
index cb2f49f3e0fa..6cb597e114fa 100644
--- a/drivers/staging/media/ipu7/ipu7-isys.c
+++ b/drivers/staging/media/ipu7/ipu7-isys.c
@@ -82,9 +82,9 @@ isys_complete_ext_device_registration(struct ipu7_isys *isys,
 
 	isys->csi2[csi2->port].nlanes = csi2->nlanes;
 	if (csi2->bus_type == V4L2_MBUS_CSI2_DPHY)
-		isys->csi2[csi2->port].phy_mode = PHY_MODE_DPHY;
+		isys->csi2[csi2->port].phy_mode = IPU7_PHY_MODE_DPHY;
 	else
-		isys->csi2[csi2->port].phy_mode = PHY_MODE_CPHY;
+		isys->csi2[csi2->port].phy_mode = IPU7_PHY_MODE_CPHY;
 
 	return 0;
 
@@ -97,7 +97,7 @@ static void isys_stream_init(struct ipu7_isys *isys)
 {
 	unsigned int i;
 
-	for (i = 0; i < IPU_ISYS_MAX_STREAMS; i++) {
+	for (i = 0; i < IPU7_ISYS_MAX_STREAMS; i++) {
 		mutex_init(&isys->streams[i].mutex);
 		init_completion(&isys->streams[i].stream_open_completion);
 		init_completion(&isys->streams[i].stream_close_completion);
@@ -576,7 +576,7 @@ static void isys_remove(struct auxiliary_device *auxdev)
 	struct isys_fw_msgs *fwmsg, *safe;
 	struct ipu7_bus_device *adev = auxdev_to_adev(auxdev);
 
-	for (int i = 0; i < IPU_ISYS_MAX_STREAMS; i++)
+	for (int i = 0; i < IPU7_ISYS_MAX_STREAMS; i++)
 		mutex_destroy(&isys->streams[i].mutex);
 
 	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist, head)
@@ -779,7 +779,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
 out_cleanup_isys:
 	cpu_latency_qos_remove_request(&isys->pm_qos);
 
-	for (unsigned int i = 0; i < IPU_ISYS_MAX_STREAMS; i++)
+	for (unsigned int i = 0; i < IPU7_ISYS_MAX_STREAMS; i++)
 		mutex_destroy(&isys->streams[i].mutex);
 
 	mutex_destroy(&isys->mutex);
@@ -846,7 +846,7 @@ static void ipu7_isys_csi2_error(struct ipu7_isys_csi2 *csi2)
 	csi2->receiver_errors = 0;
 	errors = dphy_rx_errors;
 
-	for (i = 0; i < CSI_RX_NUM_ERRORS_IN_IRQ; i++) {
+	for (i = 0; i < IPU7_CSI_RX_NUM_ERRORS_IN_IRQ; i++) {
 		if (status & BIT(i))
 			dev_err_ratelimited(&csi2->isys->adev->auxdev.dev,
 					    "csi2-%i error: %s\n",
@@ -934,7 +934,7 @@ int isys_isr_one(struct ipu7_bus_device *adev)
 		dev_dbg(dev, "\tts %llu\n", ts);
 	}
 
-	if (resp->stream_id >= IPU_ISYS_MAX_STREAMS) {
+	if (resp->stream_id >= IPU7_ISYS_MAX_STREAMS) {
 		dev_err(dev, "bad stream handle %u\n",
 			resp->stream_id);
 		goto leave;
@@ -974,7 +974,7 @@ int isys_isr_one(struct ipu7_bus_device *adev)
 		 * get pin_data_ready event
 		 */
 		ipu7_put_fw_msg_buf(ipu7_bus_get_drvdata(adev), resp->buf_id);
-		if (resp->pin_id < IPU_INSYS_OUTPUT_PINS &&
+		if (resp->pin_id < IPU7_INSYS_OUTPUT_PINS &&
 		    stream->output_pins[resp->pin_id].pin_ready)
 			stream->output_pins[resp->pin_id].pin_ready(stream,
 								    resp);
@@ -1002,7 +1002,7 @@ int isys_isr_one(struct ipu7_bus_device *adev)
 			resp->stream_id, resp->frame_id,
 			stream->seq[stream->seq_index].sequence, ts);
 		stream->seq_index = (stream->seq_index + 1U)
-			% IPU_ISYS_MAX_PARALLEL_SOF;
+			% IPU7_ISYS_MAX_PARALLEL_SOF;
 		break;
 	case IPU_INSYS_RESP_TYPE_FRAME_EOF:
 		if (csi2)
diff --git a/drivers/staging/media/ipu7/ipu7-isys.h b/drivers/staging/media/ipu7/ipu7-isys.h
index ef1ab1b42f6c..951a509db93d 100644
--- a/drivers/staging/media/ipu7/ipu7-isys.h
+++ b/drivers/staging/media/ipu7/ipu7-isys.h
@@ -28,21 +28,21 @@
 #define IPU_ISYS_ENTITY_PREFIX		"Intel IPU7"
 
 /* FW support max 16 streams */
-#define IPU_ISYS_MAX_STREAMS		16U
+#define IPU7_ISYS_MAX_STREAMS		16
 
 /*
  * Current message queue configuration. These must be big enough
  * so that they never gets full. Queues are located in system memory
  */
-#define IPU_ISYS_SIZE_RECV_QUEUE	40U
-#define IPU_ISYS_SIZE_LOG_QUEUE		256U
-#define IPU_ISYS_SIZE_SEND_QUEUE	40U
-#define IPU_ISYS_NUM_RECV_QUEUE		1U
+#define IPU7_ISYS_SIZE_RECV_QUEUE	40
+#define IPU7_ISYS_SIZE_LOG_QUEUE		256
+#define IPU7_ISYS_SIZE_SEND_QUEUE	40
+#define IPU7_ISYS_NUM_RECV_QUEUE		1
 
-#define IPU_ISYS_MIN_WIDTH		2U
-#define IPU_ISYS_MIN_HEIGHT		2U
-#define IPU_ISYS_MAX_WIDTH		8160U
-#define IPU_ISYS_MAX_HEIGHT		8190U
+#define IPU7_ISYS_MIN_WIDTH		2
+#define IPU7_ISYS_MIN_HEIGHT		2
+#define IPU7_ISYS_MAX_WIDTH		8160
+#define IPU7_ISYS_MAX_HEIGHT		8190
 
 #define FW_CALL_TIMEOUT_JIFFIES		\
 	msecs_to_jiffies(IPU_LIB_CALL_TIMEOUT_MS)
@@ -84,8 +84,8 @@ struct ipu7_isys {
 	u32 isr_csi2_mask;
 	u32 csi2_rx_ctrl_cached;
 	spinlock_t streams_lock;
-	struct ipu7_isys_stream streams[IPU_ISYS_MAX_STREAMS];
-	int streams_ref_count[IPU_ISYS_MAX_STREAMS];
+	struct ipu7_isys_stream streams[IPU7_ISYS_MAX_STREAMS];
+	int streams_ref_count[IPU7_ISYS_MAX_STREAMS];
 	u32 phy_rext_cal;
 	bool icache_prefetch;
 	bool csi2_cse_ipc_not_supported;
diff --git a/drivers/staging/media/ipu7/ipu7-mmu.c b/drivers/staging/media/ipu7/ipu7-mmu.c
index 6ded07ccd780..c5f83023ddbd 100644
--- a/drivers/staging/media/ipu7/ipu7-mmu.c
+++ b/drivers/staging/media/ipu7/ipu7-mmu.c
@@ -33,16 +33,16 @@
 
 #define ISP_PAGE_SHIFT		12
 #define ISP_PAGE_SIZE		BIT(ISP_PAGE_SHIFT)
-#define ISP_PAGE_MASK		(~(ISP_PAGE_SIZE - 1U))
+#define IPU7_ISP_PAGE_MASK		(~(ISP_PAGE_SIZE - 1))
 
 #define ISP_L1PT_SHIFT		22
-#define ISP_L1PT_MASK		(~((1U << ISP_L1PT_SHIFT) - 1))
+#define IPU7_ISP_L1PT_MASK		(~((1 << ISP_L1PT_SHIFT) - 1))
 
 #define ISP_L2PT_SHIFT		12
-#define ISP_L2PT_MASK		(~(ISP_L1PT_MASK | (~(ISP_PAGE_MASK))))
+#define ISP_L2PT_MASK		(~(IPU7_ISP_L1PT_MASK | (~(IPU7_ISP_PAGE_MASK))))
 
-#define ISP_L1PT_PTES		1024U
-#define ISP_L2PT_PTES		1024U
+#define IPU7_ISP_L1PT_PTES		1024
+#define IPU7_ISP_L2PT_PTES		1024
 
 #define ISP_PADDR_SHIFT		12
 
@@ -170,7 +170,7 @@ static int alloc_dummy_l2_pt(struct ipu7_mmu_info *mmu_info)
 		goto err_free_page;
 	}
 
-	for (i = 0; i < ISP_L2PT_PTES; i++)
+	for (i = 0; i < IPU7_ISP_L2PT_PTES; i++)
 		pt[i] = mmu_info->dummy_page_pteval;
 
 	mmu_info->dummy_l2_pt = pt;
@@ -202,7 +202,7 @@ static u32 *alloc_l1_pt(struct ipu7_mmu_info *mmu_info)
 
 	dev_dbg(mmu_info->dev, "alloc_l1: get_zeroed_page() = %p\n", pt);
 
-	for (i = 0; i < ISP_L1PT_PTES; i++)
+	for (i = 0; i < IPU7_ISP_L1PT_PTES; i++)
 		pt[i] = mmu_info->dummy_l2_pteval;
 
 	dma = map_single(mmu_info, pt);
@@ -231,7 +231,7 @@ static u32 *alloc_l2_pt(struct ipu7_mmu_info *mmu_info)
 
 	dev_dbg(mmu_info->dev, "alloc_l2: get_zeroed_page() = %p\n", pt);
 
-	for (i = 0; i < ISP_L2PT_PTES; i++)
+	for (i = 0; i < IPU7_ISP_L2PT_PTES; i++)
 		pt[i] = mmu_info->dummy_page_pteval;
 
 	return pt;
@@ -248,7 +248,7 @@ static void l2_unmap(struct ipu7_mmu_info *mmu_info, unsigned long iova,
 
 	spin_lock_irqsave(&mmu_info->lock, flags);
 	for (l1_idx = iova >> ISP_L1PT_SHIFT;
-	     size > 0U && l1_idx < ISP_L1PT_PTES; l1_idx++) {
+	     size > 0U && l1_idx < IPU7_ISP_L1PT_PTES; l1_idx++) {
 		dev_dbg(mmu_info->dev,
 			"unmapping l2 pgtable (l1 index %u (iova 0x%8.8lx))\n",
 			l1_idx, iova);
@@ -263,7 +263,7 @@ static void l2_unmap(struct ipu7_mmu_info *mmu_info, unsigned long iova,
 
 		l2_entries = 0;
 		for (l2_idx = (iova & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
-		     size > 0U && l2_idx < ISP_L2PT_PTES; l2_idx++) {
+		     size > 0U && l2_idx < IPU7_ISP_L2PT_PTES; l2_idx++) {
 			phys_addr_t pteval = TBL_PHYS_ADDR(l2_pt[l2_idx]);
 
 			dev_dbg(mmu_info->dev,
@@ -304,7 +304,7 @@ static int l2_map(struct ipu7_mmu_info *mmu_info, unsigned long iova,
 
 	paddr = ALIGN(paddr, ISP_PAGE_SIZE);
 	for (l1_idx = iova >> ISP_L1PT_SHIFT;
-	     size && l1_idx < ISP_L1PT_PTES; l1_idx++) {
+	     size && l1_idx < IPU7_ISP_L1PT_PTES; l1_idx++) {
 		dev_dbg(dev,
 			"mapping l2 page table for l1 index %u (iova %8.8x)\n",
 			l1_idx, (u32)iova);
@@ -343,7 +343,7 @@ static int l2_map(struct ipu7_mmu_info *mmu_info, unsigned long iova,
 		l2_entries = 0;
 
 		for (l2_idx = (iova & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
-		     size && l2_idx < ISP_L2PT_PTES; l2_idx++) {
+		     size && l2_idx < IPU7_ISP_L2PT_PTES; l2_idx++) {
 			l2_pt[l2_idx] = paddr >> ISP_PADDR_SHIFT;
 
 			dev_dbg(dev, "l2 index %u mapped as 0x%8.8x\n", l2_idx,
@@ -518,7 +518,7 @@ static void __mmu_zlx_init(struct ipu7_mmu *mmu)
 		unsigned int j;
 
 		dev_dbg(mmu->dev, "mmu %s zlx init\n", mmu_hw->name);
-		for (j = 0; j < IPU_ZLX_POOL_NUM; j++) {
+		for (j = 0; j < IPU7_ZLX_POOL_NUM; j++) {
 			if (!mmu_hw->zlx_axi_pool[j])
 				continue;
 			writel(mmu_hw->zlx_axi_pool[j],
@@ -609,7 +609,7 @@ static struct ipu7_mmu_info *ipu7_mmu_alloc(struct ipu7_device *isp)
 	if (ret)
 		goto err_free_dummy_page;
 
-	mmu_info->l2_pts = vzalloc(ISP_L2PT_PTES * sizeof(*mmu_info->l2_pts));
+	mmu_info->l2_pts = vzalloc(IPU7_ISP_L2PT_PTES * sizeof(*mmu_info->l2_pts));
 	if (!mmu_info->l2_pts)
 		goto err_free_dummy_l2_pt;
 
@@ -772,7 +772,7 @@ static void ipu7_mmu_destroy(struct ipu7_mmu *mmu)
 		__free_page(mmu->trash_page);
 	}
 
-	for (l1_idx = 0; l1_idx < ISP_L1PT_PTES; l1_idx++) {
+	for (l1_idx = 0; l1_idx < IPU7_ISP_L1PT_PTES; l1_idx++) {
 		if (mmu_info->l1_pt[l1_idx] != mmu_info->dummy_l2_pteval) {
 			dma_unmap_single(mmu_info->dev,
 					 TBL_PHYS_ADDR(mmu_info->l1_pt[l1_idx]),
@@ -799,7 +799,7 @@ struct ipu7_mmu *ipu7_mmu_init(struct device *dev,
 	struct ipu7_mmu *mmu;
 	unsigned int i;
 
-	if (hw->nr_mmus > IPU_MMU_MAX_NUM)
+	if (hw->nr_mmus > IPU7_MMU_MAX_NUM)
 		return ERR_PTR(-EINVAL);
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
@@ -810,8 +810,8 @@ struct ipu7_mmu *ipu7_mmu_init(struct device *dev,
 		struct ipu7_mmu_hw *pdata_mmu = &pdata->mmu_hw[i];
 		const struct ipu7_mmu_hw *src_mmu = &hw->mmu_hw[i];
 
-		if (src_mmu->nr_l1streams > IPU_MMU_MAX_TLB_L1_STREAMS ||
-		    src_mmu->nr_l2streams > IPU_MMU_MAX_TLB_L2_STREAMS)
+		if (src_mmu->nr_l1streams > IPU7_MMU_MAX_TLB_L1_STREAMS ||
+		    src_mmu->nr_l2streams > IPU7_MMU_MAX_TLB_L2_STREAMS)
 			return ERR_PTR(-EINVAL);
 
 		*pdata_mmu = *src_mmu;
diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index c771e763f8c5..d5bff819a83a 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -52,7 +52,7 @@ static struct ipu_isys_internal_pdata ipu7p5_isys_ipdata = {
 	},
 	.hw_variant = {
 		.offset = IPU_UNIFIED_OFFSET,
-		.nr_mmus = IPU7P5_IS_MMU_NUM,
+		.nr_mmus = IPU7_7P5_IS_MMU_NUM,
 		.mmu_hw = {
 			{
 				.name = "IS_FW_RD",
@@ -333,7 +333,7 @@ static struct ipu_isys_internal_pdata ipu7p5_isys_ipdata = {
 static struct ipu_psys_internal_pdata ipu7p5_psys_ipdata = {
 	.hw_variant = {
 		.offset = IPU_UNIFIED_OFFSET,
-		.nr_mmus = IPU7P5_PS_MMU_NUM,
+		.nr_mmus = IPU7_7P5_PS_MMU_NUM,
 		.mmu_hw = {
 			{
 				.name = "PS_FW_RD",
@@ -1309,7 +1309,7 @@ static struct ipu_isys_internal_pdata ipu8_isys_ipdata = {
 	},
 	.hw_variant = {
 		.offset = IPU_UNIFIED_OFFSET,
-		.nr_mmus = IPU8_IS_MMU_NUM,
+		.nr_mmus = IPU7_8_IS_MMU_NUM,
 		.mmu_hw = {
 			{
 				.name = "IS_FW_RD",
@@ -1644,7 +1644,7 @@ static struct ipu_isys_internal_pdata ipu8_isys_ipdata = {
 static struct ipu_psys_internal_pdata ipu8_psys_ipdata = {
 	.hw_variant = {
 		.offset = IPU_UNIFIED_OFFSET,
-		.nr_mmus = IPU8_PS_MMU_NUM,
+		.nr_mmus = IPU7_8_PS_MMU_NUM,
 		.mmu_hw = {
 			{
 				.name = "PS_FW_RD",
diff --git a/drivers/staging/media/ipu7/ipu7.h b/drivers/staging/media/ipu7/ipu7.h
index ac8ac0689468..79cf750e85b4 100644
--- a/drivers/staging/media/ipu7/ipu7.h
+++ b/drivers/staging/media/ipu7/ipu7.h
@@ -100,18 +100,18 @@ struct ipu7_device {
 /* FW is accessible within the first 2 GiB only in non-secure mode. */
 #define IPU_MMU_ADDR_BITS_NON_SECURE	31
 
-#define IPU7_IS_MMU_NUM			4U
-#define IPU7_PS_MMU_NUM			4U
-#define IPU7P5_IS_MMU_NUM		4U
-#define IPU7P5_PS_MMU_NUM		4U
-#define IPU8_IS_MMU_NUM			5U
-#define IPU8_PS_MMU_NUM			4U
-#define IPU_MMU_MAX_NUM			5U /* max(IS, PS) */
-#define IPU_MMU_MAX_TLB_L1_STREAMS	40U
-#define IPU_MMU_MAX_TLB_L2_STREAMS	40U
-#define IPU_ZLX_MAX_NUM			32U
-#define IPU_ZLX_POOL_NUM		8U
-#define IPU_UAO_PLANE_MAX_NUM		64U
+#define IPU7_IS_MMU_NUM			4
+#define IPU7_PS_MMU_NUM			4
+#define IPU7_7P5_IS_MMU_NUM		4
+#define IPU7_7P5_PS_MMU_NUM		4
+#define IPU7_8_IS_MMU_NUM			5
+#define IPU7_8_PS_MMU_NUM			4
+#define IPU7_MMU_MAX_NUM			5 /* max(IS, PS) */
+#define IPU7_MMU_MAX_TLB_L1_STREAMS	40
+#define IPU7_MMU_MAX_TLB_L2_STREAMS	40
+#define IPU7_ZLX_MAX_NUM			32
+#define IPU7_ZLX_POOL_NUM		8
+#define IPU7_UAO_PLANE_MAX_NUM		64
 
 /*
  * To maximize the IOSF utlization, IPU need to send requests in bursts.
@@ -175,21 +175,21 @@ struct ipu7_mmu_hw {
 
 	u8 nr_l1streams;
 	u8 nr_l2streams;
-	u32 l1_block_sz[IPU_MMU_MAX_TLB_L1_STREAMS];
-	u32 l2_block_sz[IPU_MMU_MAX_TLB_L2_STREAMS];
+	u32 l1_block_sz[IPU7_MMU_MAX_TLB_L1_STREAMS];
+	u32 l2_block_sz[IPU7_MMU_MAX_TLB_L2_STREAMS];
 
 	u8 zlx_nr;
-	u32 zlx_axi_pool[IPU_ZLX_POOL_NUM];
-	u32 zlx_en[IPU_ZLX_MAX_NUM];
-	u32 zlx_conf[IPU_ZLX_MAX_NUM];
+	u32 zlx_axi_pool[IPU7_ZLX_POOL_NUM];
+	u32 zlx_en[IPU7_ZLX_MAX_NUM];
+	u32 zlx_conf[IPU7_ZLX_MAX_NUM];
 
 	u32 uao_p_num;
-	u32 uao_p2tlb[IPU_UAO_PLANE_MAX_NUM];
+	u32 uao_p2tlb[IPU7_UAO_PLANE_MAX_NUM];
 };
 
 struct ipu7_mmu_pdata {
 	u32 nr_mmus;
-	struct ipu7_mmu_hw mmu_hw[IPU_MMU_MAX_NUM];
+	struct ipu7_mmu_hw mmu_hw[IPU7_MMU_MAX_NUM];
 	int mmid;
 };
 
@@ -206,7 +206,7 @@ struct ipu7_isys_internal_csi2_pdata {
 struct ipu7_hw_variants {
 	unsigned long offset;
 	u32 nr_mmus;
-	struct ipu7_mmu_hw mmu_hw[IPU_MMU_MAX_NUM];
+	struct ipu7_mmu_hw mmu_hw[IPU7_MMU_MAX_NUM];
 	u8 cdc_fifos;
 	u8 cdc_fifo_threshold[IPU_MAX_VC_IOSF_PORTS];
 	u32 dmem_offset;
-- 
2.43.0


