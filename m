Return-Path: <linux-media+bounces-66586-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fTevOEMSSWrByAAAu9opvQ
	(envelope-from <linux-media+bounces-66586-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 16:01:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD4B707BA6
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 16:01:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jgGGSH3p;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66586-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66586-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56FED3019B81
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 14:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989E52701B8;
	Sat,  4 Jul 2026 14:01:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C562253EB
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 14:01:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783173674; cv=none; b=W7qPv2PM/Fen9HdP7i5tsZHIXEsQ1SU9xpNXoJz7UXA3pbCujmhBhNOp4b1+fZzvlOIZ63Gmwj1GdpenYMdGoR6M+f/ytll3Qi5sWameqzx5fSagKFl+BTodM6LZkKthzVh63IT+KfwSMJT+feDyT5bPqoLtuhWW6Fa9U0AeyLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783173674; c=relaxed/simple;
	bh=X9dhOW7szVP4R7YiwC+ooewHbP8bEQ5HGQ+9OTzrZ5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zidw+h5HHOd7zEvDyX3TpHMxR88kv2FMoEGRKvxuMseZjg0h7KeNz3BXTzGGDzNUd4WwXvt+tZhmriy18Hx8p48rZ7UotziiQgVVL/9K89E7XBI4FZONfkgPHFdFJvun3fx1N5EbkUYMcJpWNc0dzc0OwOFWTkNQ1uRG1IAmLtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgGGSH3p; arc=none smtp.client-ip=209.85.208.193
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-39b22d0e488so16102391fa.3
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 07:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783173670; x=1783778470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QoW6wy5Ibs/c5PrDFE7Z/Vk7E0hnNjlbrEMZdtHLRLk=;
        b=jgGGSH3p2pW5QwBe/CQEwLXvtwJdahMoNi51l3ZAgOW2rabCGnhPc6pt7xdp+Tul2h
         nae64dJSL89s51MmTyJqFYByi5ME9j8C/Q0ChcAN13CH3VxJJrZJhs68SQKWRqJpcie/
         vEvS13rCuow0rE4/nTn6eOpONRAMBwuEEEjxjd8mO6UeQeL/1wZdQzZQNyP3lnyG8+uz
         1BQqXWjBDZuyBacu6BW/oqBc+wJbrTn/JP+C2OSkDmbdY+d+rUUzGGCQefUjQt1M/Q1l
         G1+e7jzEZq9qL0HLtMpOpcUpKzXhlR/rnyhbeQTHoYpCIMlu1Bp0YkiYVbcx03DrMjUP
         NptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783173670; x=1783778470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoW6wy5Ibs/c5PrDFE7Z/Vk7E0hnNjlbrEMZdtHLRLk=;
        b=ZjqdMr3s5Ac8j2v/L4NS5nzEoJpOAj+aMZXt13UijIszteRxGqrc+Rg6lQ3roidhNv
         jC1IAC4ZV7kOlQ0VTm6uc8GdNiLJGNGWWh0vGemtYNknR+hM8ruhXvTsLEDgF/X5rDji
         a0WLAwEp3EfG3BYM9mndcnSfAj8ptkyF336fLkJoByf8hrg0QP/bR0DkYXq2eR0BfqUC
         YMZ6EjYaBD5u2c0eJlt9fPrbkSesNPEb/g+GLt6j4nZM7/9gjP+vxZ4nVuHDP4aAWqJ2
         wRnGTF3WuDX6MDnYazHl2g7SgqBBQdVHhCFLJaj9PL+Jb2ZWy0XPgK0Lck6AWHgZaC8+
         WWSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5ziT+dhgJObwt3x1DopRIWA7BnWGujiwD/biF8v4GjB5Ke+8r41ru7nm11U51xkqJICgyV0tf3FVBVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztCJBKQYRwILE74mjZuS9GCPVCFcQKv7jOUkgkjhNRF4Zv20Cn
	ar+I9iWlIRU/+evtOTA/ltYaXKklL49q5W+O1zzu2h3kBWk3DgC4CqBn
X-Gm-Gg: AfdE7ckUqnH6l/aimE2HiVONLbI7jtw2LDU/5NAUZq5JX6nZUt70O8Nn+GULMNXnXLG
	AMpd72d6Hm3qrCbtr8f9JKPQTM2cHf/uqmgRFMbbTEpSEaTOitDX8XCvliKdmibi3HKD0uankNe
	CYvnXcHYCz4fIwzTLSRwCz9l/nw7Fpps3uq3bNtikQYUus30+PVk98hLkOFNbh1rLYpzozNUNts
	JviQ0/0sgsNz70H65rY6M/2ePbgdI78EHfs8InaNYNKWoaoVHhF3Ka0WHN3JBQrfYbrxiB8JPlB
	ODojlZPdvPNnZTZ4dHT6M+IhvLVqUG5Q9lgzvUkwC79VVXApyiNoGXM2BemV8jEuXirKxY261pg
	8S/XkyuQfEvBqrSDyyEUfQuYzzv+taPqYwHn3qNzsT9OLFOkiF1hgCyz5Om8ulU0kV1+Zz+M4I/
	XmJ5H0u+aFdSoTJuPVcj4=
X-Received: by 2002:a2e:a107:0:b0:39a:cfea:f17 with SMTP id 38308e7fff4ca-39b53c9e119mr7914081fa.30.1783173669522;
        Sat, 04 Jul 2026 07:01:09 -0700 (PDT)
Received: from myhost.localdomain ([89.253.17.10])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad18b5asm8604601fa.9.2026.07.04.07.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 07:01:09 -0700 (PDT)
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
Subject: [PATCH] staging: media: atomisp: clean up atomisp_v4l2.c style warnings
Date: Sat,  4 Jul 2026 19:00:55 +0500
Message-ID: <20260704140055.88080-1-miraly.dev@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-66586-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:miraly.dev@gmail.com,m:miralydev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miralydev@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,checkpatch.pl:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BD4B707BA6

Fix checkpatch.pl warnings in atomisp_v4l2.c regarding unnecessary
ftrace-like logging and redundant else statements after return.

Remove dev_dbg() calls that only log function entry, as ftrace should
be preferred for this purpose. Also, remove the unnecessary else block
following a return statement to flatten the code structure.

Signed-off-by: Ruziev Miraly <miraly.dev@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 30 +++++++------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397..2d72467eb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -345,8 +345,6 @@ static int atomisp_save_iunit_reg(struct atomisp_device *isp)
 {
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 
-	dev_dbg(isp->dev, "%s\n", __func__);
-
 	pci_read_config_word(pdev, PCI_COMMAND, &isp->saved_regs.pcicmdsts);
 	/* isp->saved_regs.ispmmadr is set from the atomisp_pci_probe() */
 	pci_read_config_dword(pdev, PCI_MSI_CAPID, &isp->saved_regs.msicap);
@@ -400,8 +398,6 @@ static int atomisp_restore_iunit_reg(struct atomisp_device *isp)
 {
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 
-	dev_dbg(isp->dev, "%s\n", __func__);
-
 	pci_write_config_word(pdev, PCI_COMMAND, isp->saved_regs.pcicmdsts);
 	pci_write_config_dword(pdev, PCI_BASE_ADDRESS_0, isp->saved_regs.ispmmadr);
 	pci_write_config_dword(pdev, PCI_MSI_CAPID, isp->saved_regs.msicap);
@@ -468,22 +464,18 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 			__func__, irq);
 		spin_unlock_irqrestore(&isp->lock, flags);
 		return -EAGAIN;
-	} else {
-		pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
-		irq &= BIT(INTR_IIR);
-		pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
-
-		pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
-		if (!(irq & BIT(INTR_IIR))) {
-			atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
-			goto done;
-		}
-		dev_err(isp->dev,
-			"%s: error in iunit interrupt. status reg=0x%x\n",
-			__func__, irq);
-		spin_unlock_irqrestore(&isp->lock, flags);
-		return -EAGAIN;
 	}
+	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
+	irq &= BIT(INTR_IIR);
+	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
+
+	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
+	if (!(irq & BIT(INTR_IIR))) {
+		atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
+		goto done;
+	}
+	spin_unlock_irqrestore(&isp->lock, flags);
+	return -EAGAIN;
 done:
 	/*
 	 * MRFLD WORKAROUND:
-- 
2.54.0


