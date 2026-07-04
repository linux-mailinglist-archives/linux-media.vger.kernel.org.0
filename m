Return-Path: <linux-media+bounces-66600-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8ZtGDFtaSWqO0gAAu9opvQ
	(envelope-from <linux-media+bounces-66600-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 21:09:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BDA70838C
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 21:09:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ctw+Ms5S;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66600-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66600-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 250113016294
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 19:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2B2376490;
	Sat,  4 Jul 2026 19:09:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25BF25B099
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 19:09:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783192146; cv=none; b=tkPis6v4nkH+cJN50J9dfkkp86Ikgw0/83XRB1Q+4r14XTM+k6VL0C9TMPps2h3uV3xVRGwUCh2eu+0TbJM8nl9eTHQpX60Yrwn9yNyklAHwxSQO2ASWPJqxtBIchqBSTTfx4WLj6XjULQc1qV9CD2Z4A9r1etO8zAm3p4kPy2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783192146; c=relaxed/simple;
	bh=A06Yy2EYDfHEtoWJM6CBiEhn33Kee9RzFJyasyjw0wY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OJJLcm7HDCEJ0IVDoQkDWHUMICDB/QRodazFLAEqrLgN2G+fVqDrvscuIn5tXhKPgT+njMp4dJG4G7N7hkw/bWzyIDXmrN0CCFrXRE/5jdWQg4CTN7EDA0LGo0IyTtfdi7+0auxewyYVgoxVhQsPKKlJlZf70Mgv8vxVwEJSLXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctw+Ms5S; arc=none smtp.client-ip=209.85.128.68
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-493c1950518so13320915e9.1
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 12:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783192143; x=1783796943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VRh4MeESNZjA8ZY8SVwMDtx07Fu+whGeI3UAREbb+eo=;
        b=ctw+Ms5SuErnRfBoCHrSqcBnW0gv7PR2KkYsb2KVQMm0FBv+cTY0oFfka5Yjv3Vw7e
         2dcD547IWmvBTf+K2omr+Zd5KGqzA26tLEjQ4h3ZI3ZdYOQt7q32cYaY07UO5gQk764w
         JU8yMVfidY6mk1BWRHWNMny9JwhSn1y8g+S2sjT1P1w4qTfqS75wSK972L/hHQcRvIKY
         NuEldezrCWEgxn5cls5sPB6acpkYbcS8xbPiryZrEZXqdzwgpiGj3rVo+AaPJjpHs4bI
         v+AZEVaL3ADD7evPmERiLNxpCwHfOdtcpwHnixBOdpoRjl/bH+gvqOMLI33wtWsH0ZKZ
         gJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783192143; x=1783796943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRh4MeESNZjA8ZY8SVwMDtx07Fu+whGeI3UAREbb+eo=;
        b=C7TLT4pCXbZXEB8/cSd5Nx4eAF9MmW80wobFk6rS8bluFkV8dmKAn5B4eBLf6LC05L
         p02SOZV9Ql5NmyaeI8KGPITE/Q+m+1RzOOct2j4iGTMtACv4sDTN78B0lxDSr1Qx674w
         ojNklx0vzn5PcbUpCNIM38Zoxytr0BvQqLFBjDMV3xr+86TZhe/Y131WWql4ZkHWpu/T
         gA7t78122Yk7yhDexZLVIjrmtf15C/8UG0kcrLkeGZHr5lJgnSqwkOiY9dJKnqCB4P7O
         WPuN2jHRly2hzgE1J4Uhsi8PgJvajCfr8CJu4A620Z3D9zSsE6dUKy2sxvjwcj9jdS5I
         NU0g==
X-Forwarded-Encrypted: i=1; AFNElJ89hGmWeuvanY3Wz+bCMyNhCrRHA2Z35Itv0cdhR+xfZc4vA/letFgUIs6HB4jzGkHrpMWgti67fvrfJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6buxetC9yrBcQBK2OyP8waQoJy6Vl6+rSPjnq/zpxT9+O8iDj
	qyRQkM3UoUe1qlAgF2o1wKmPmly0TTiZt9S7emzPCvROIQ+11eUMpZA0
X-Gm-Gg: AfdE7ck6Msrijk1olF4xWvg8+q5f2q4Vt1vJOaATc39aDC2TxNJ4bVodfIKkIX1IieO
	B/pWgtpQP99/8ngpgTPxqoFIvCt0ifaVys1Ntdi5hjxlYw4+ZUkFIWmWSkGfzuUTPcXL1MM1HpU
	qYcsosbRkEJcZH9dw5XAYvBRtSSLOGxxFiplkGnoAutJkKL9FGbJzYfr4zJid36eJgVW751lnZp
	EZkFuQxT69wKzvACvvLngAzJfR9FbkhR+EFlm5QxYTwgrv+tlKAIT/WEMSHcP++mIhVESc/Ku+i
	h7YiWQwuL+RO2dBX/wpzuoC4RStM0W3/VANhfYdvP93wQgZTpsOcBMdEwjnHdoNJtk2vorjAbbj
	hl18TnYz1ixw8dc3k4MXG79lt0zEpbmgKYWSJGDys72ib1vt1DGdNvNYHQZcG/YvRq9xGIeNuhG
	0JzOe4/kjgIRoxTVFsAZ9I
X-Received: by 2002:a05:600c:3b28:b0:493:b698:9247 with SMTP id 5b1f17b1804b1-493d1593adbmr39535475e9.14.1783192142995;
        Sat, 04 Jul 2026 12:09:02 -0700 (PDT)
Received: from myhost.localdomain ([89.253.41.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm261718885e9.15.2026.07.04.12.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 12:09:02 -0700 (PDT)
From: Ruziev Miraly <miraly.dev@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ruziev Miraly <miraly.dev@gmail.com>
Subject: [PATCH v2] media: atomisp: flatten pre_power_down logic and clean up staging code
Date: Sun,  5 Jul 2026 00:08:54 +0500
Message-ID: <20260704190854.114172-1-miraly.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-66600-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:miraly.dev@gmail.com,m:miralydev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miralydev@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miralydev@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87BDA70838C

Refactor atomisp_mrfld_pre_power_down() by removing the redundant
nested 'else' block, making the function structure linear and easier
to follow. Keep both error logging branches intact to ensure consistency
in hardware failure reporting.

In addition, fix minor checkpatch.pl style warnings in the same file
regarding code alignment and hanging open parentheses.

Signed-off-by: Ruziev Miraly <miraly.dev@gmail.com>
---
Changes in v2:
  - Fixed an issue from v1 where dev_err() was accidentally dropped.
  - Kept both error logging branches for consistency with original behavior.
  - Flattened the code structure by removing the nested 'else' block.
  - Fixed checkpatch.pl style issues (hanging parenthesis and alignment).
---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 39 +++++++++++--------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 2d72467eb..78cf09753 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -439,14 +439,14 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	u32 irq;
 	unsigned long flags;
+	int ret = 0;
 
 	spin_lock_irqsave(&isp->lock, flags);
 
 	/*
 	 * MRFLD HAS requirement: cannot power off i-unit if
 	 * ISP has IRQ not serviced.
-	 * So, here we need to check if there is any pending
-	 * IRQ, if so, waiting for it to be served
+	 * Wait for pending IRQs to be served.
 	 */
 	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
 	irq &= BIT(INTR_IIR);
@@ -454,29 +454,36 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 
 	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
 	if (!(irq & BIT(INTR_IIR)))
-		goto done;
+		goto power_down;
 
+	/* Clear and check interrupt status registers */
 	atomisp_css2_hw_store_32(MRFLD_INTR_CLEAR_REG, 0xFFFFFFFF);
 	atomisp_load_uint32(MRFLD_INTR_STATUS_REG, &irq);
+
 	if (irq != 0) {
 		dev_err(isp->dev,
 			"%s: fail to clear isp interrupt status reg=0x%x\n",
 			__func__, irq);
-		spin_unlock_irqrestore(&isp->lock, flags);
-		return -EAGAIN;
+		ret = -EAGAIN;
+		goto unlock_exit;
 	}
+
 	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
 	irq &= BIT(INTR_IIR);
 	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
 
 	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
-	if (!(irq & BIT(INTR_IIR))) {
-		atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
-		goto done;
+	if (irq & BIT(INTR_IIR)) {
+		dev_err(isp->dev,
+			"%s: error in iunit interrupt. status reg=0x%x\n",
+			__func__, irq);
+		ret = -EAGAIN;
+		goto unlock_exit;
 	}
-	spin_unlock_irqrestore(&isp->lock, flags);
-	return -EAGAIN;
-done:
+
+	atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
+
+power_down:
 	/*
 	 * MRFLD WORKAROUND:
 	 * before powering off IUNIT, clear the pending interrupts
@@ -490,9 +497,10 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 
 	atomisp_msi_irq_uninit(isp);
 	atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_LOW, true);
-	spin_unlock_irqrestore(&isp->lock, flags);
 
-	return 0;
+unlock_exit:
+	spin_unlock_irqrestore(&isp->lock, flags);
+	return ret;
 }
 
 /*
@@ -839,7 +847,7 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 	/* Register internal entities */
 	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
 		ret = atomisp_mipi_csi2_register_entities(&isp->csi2_port[i],
-			&isp->v4l2_dev);
+							  &isp->v4l2_dev);
 		if (ret == 0)
 			continue;
 
@@ -847,8 +855,7 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 		dev_err(isp->dev, "failed to register the CSI port: %d\n", i);
 		/* deregister all registered CSI ports */
 		while (i--)
-			atomisp_mipi_csi2_unregister_entities(
-			    &isp->csi2_port[i]);
+			atomisp_mipi_csi2_unregister_entities(&isp->csi2_port[i]);
 
 		goto csi_and_subdev_probe_failed;
 	}
-- 
2.54.0


