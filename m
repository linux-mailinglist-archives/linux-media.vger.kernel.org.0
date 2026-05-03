Return-Path: <linux-media+bounces-60205-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lKsHCVqE92lgigIAu9opvQ
	(envelope-from <linux-media+bounces-60205-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 19:22:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DDB4B6C4F
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 19:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6A3C3007F48
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2026 17:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C9A3B636A;
	Sun,  3 May 2026 17:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+kWs0Cj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D56234964
	for <linux-media@vger.kernel.org>; Sun,  3 May 2026 17:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777828944; cv=none; b=Y202pJALYf75CkG6Dve1tZSD0zaGLdYPoT+5uhAz3av3ZZQCfHfKsPXiqWTb9GDlOKa4d3vwetGPUULHi8YWVy1Y7SqqR8Z5X8A+y/smVdmFGmKjB9v7elTzIs2XAAb1JY62m6gVm8uXRp/s+hTr98GYPcImn/kpR6gOSGsDg7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777828944; c=relaxed/simple;
	bh=aD59ht4Z8ccP5j0CsxyfzMmCi+t73MZoK0HM0pakRB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eZgP4G0v1EWhGMl8q4CmVJRPwaJiFxCnKFjpN/akJNotxSByhFRXLCgMN+QqZlyFhU/ucBsg9GFDKEaObJLZqjkvDCYd/Cvpyt/sYK/K7wkr8eNHs3eh/HK9x4sCcjDwjS4tp2khfZQWHLR1U1ywigS1H5c0TzrFGkyeDIh2Hdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+kWs0Cj; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8027e876fcso111749a12.1
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 10:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777828943; x=1778433743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJnjzlMwpMniUmbSXdrplWdAlDcFpdzwd1bfSco5uao=;
        b=E+kWs0Cja1pK5dzQ+jFnwCCNolkkO0YqP+eoqQNtbljnShfGHedRWhjdd/1bpkpx3w
         amSbV5tFphCNwsKNgFCmBTcBmlc5exewWgzLOFTb7cx2y7TWEoJ2L4nu6OzMbpmGoMwp
         1frTpyLUOmx1ssTI80mXYdwcsyV17dSWj8oYLB2EzBFvx5v25oKe8Evl1PMrEkEOGIle
         oCzKJVrIqY4zTg1h6nwT05jrMp7flII27oVABMtq1yiW2Mjb3Np1VL9MUHVoJavcU72l
         I/gqnhYqsG9ORJqMqEyl4C3QH+ptGD2J4XBclrl7IlmzmEkLKCT1aaGc8XC05eNVeCn7
         yXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777828943; x=1778433743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJnjzlMwpMniUmbSXdrplWdAlDcFpdzwd1bfSco5uao=;
        b=IacKg1XD3ysmeIAOCtwo6igacFRnhFvFbyBv/muDEe3ziBT3tqnqbrEoNHXiNI8eH0
         fLOXApyhUkbXrr6Ib+jrXLMLdntMKXob2lSPHj9qBnxisO3NHrEK6j07SCzKWNgw5u9C
         K6Ak5iQX3HZ+KMlSy+Ud12v7gNWFB/fdHf8ngt4jKI+xLUunXRfaXCv87JC8R74YJLiR
         ucEAfJNMXihxwo52vUqgnopSoQ+MM1/KetJARQkN7R+uXiXk0AUVpDajhX1dxUrd/k4w
         75PwXtEdP52fIOWKlOsHs44p27y+ppTkMmUcHD4F09mpJHOAZUzPnHMTyBf1j/qUBLKU
         OAhg==
X-Forwarded-Encrypted: i=1; AFNElJ/lwTTVKaZjnNZLuDmV56tTTxZQ7VRcwsHGVYhSOGbcUcMZ/DjoL5P4wb0kVduk0rNYO6gdQ0qmZPl0dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzclgHNetI4GIxTKmWRWRvoY+OnS7F/tlOqZD+ml7Rwn+eX1OsA
	MQYs4y9gS9hnUZb9MV9ZB+PRkHvYS+S4UUSu3VH1D0a3GOsT6XEvuBPK
X-Gm-Gg: AeBDiev0WHiEGrdpjiw0z6BJETQted67/B+QW3Xx4C68oVqNeqIsuOf1GHShnHf924K
	iCc226t4AsOVdVpROaPhtxMlAIfnnDfUHD3uzFukRTU/7lzbNpR13PcND8l7V/G6oDuhX34ve+7
	gSLgNYg8+ZJ4uMwjn9Fal2rHLo6uii+nUYDCVFs/nxXAGEQFbwEAQHCAt4jmq5AhgBKzYfLhPvQ
	1d0tmbEXegXfmiwPPAFMlKIlHGWxmyl9f3PbYDE1uVNJOThPkbbBhLCAFuyZ+PY6+aVEp+3lp62
	JTRdd7f8edDLZkIZuwGQyPPMR2ZtgVV1q8o6lawndWMSWqRuqQaZMBnyvIQXUs7AuFMJvZ4gmXc
	OFV1l9sEA60JXj1Q8KQtXoxrtbL+iaptKxYrnpbSje9/4EP3KPswge7w3ThUppgu/5dhHaYmJDv
	xlahys8kDKVXefHyLFd+PwdV2OTuu95rM15OzVRk+BUhSUEEL0rKlNZMg0PbqW/q+8n1r/YYjoN
	znmhESLOwTPv0f5dYyDjZ4IjtAP349sXw==
X-Received: by 2002:a05:6a20:a109:b0:3a2:f05a:7952 with SMTP id adf61e73a8af0-3a7f1c52da1mr6699896637.39.1777828942939;
        Sun, 03 May 2026 10:22:22 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.115.140])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbca2c49sm7367257a12.26.2026.05.03.10.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 10:22:22 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: media: atomisp: drop unnecessary else block after return/break
Date: Sun,  3 May 2026 22:52:00 +0530
Message-ID: <20260503172200.94712-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 72DDB4B6C4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-60205-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shyamsunderreddypadira@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Remove redundant else blocks following return or break
statements.As control flow exits in these cases, the
else branch is unnecessary.Dropping it improves code
readability.

No functional change.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_fops.c  | 18 +++++------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 30 +++++++++----------
 2 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index c7aef066f209..1aee082d34bf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -125,10 +125,8 @@ static int atomisp_q_one_metadata_buffer(struct atomisp_sub_device *asd,
 					     stream_id, css_pipe_id)) {
 		list_add(&metadata_buf->list, metadata_list);
 		return -EINVAL;
-	} else {
-		list_add_tail(&metadata_buf->list,
-			      &asd->metadata_in_css[md_type]);
 	}
+	list_add_tail(&metadata_buf->list, &asd->metadata_in_css[md_type]);
 	asd->metadata_bufs_in_css[stream_id][css_pipe_id]++;
 
 	return 0;
@@ -165,11 +163,10 @@ static int atomisp_q_one_s3a_buffer(struct atomisp_sub_device *asd,
 		/* got from head, so return back to the head */
 		list_add(&s3a_buf->list, s3a_list);
 		return -EINVAL;
-	} else {
-		list_add_tail(&s3a_buf->list, &asd->s3a_stats_in_css);
-		if (s3a_list == &asd->s3a_stats_ready)
-			dev_dbg(asd->isp->dev, "drop one s3a stat with exp_id %d\n", exp_id);
 	}
+	list_add_tail(&s3a_buf->list, &asd->s3a_stats_in_css);
+	if (s3a_list == &asd->s3a_stats_ready)
+		dev_dbg(asd->isp->dev, "drop one s3a stat with exp_id %d\n", exp_id);
 
 	asd->s3a_bufs_in_css[css_pipe_id]++;
 	return 0;
@@ -206,11 +203,10 @@ static int atomisp_q_one_dis_buffer(struct atomisp_sub_device *asd,
 		list_add_tail(&dis_buf->list, &asd->dis_stats);
 		spin_unlock_irqrestore(&asd->dis_stats_lock, irqflags);
 		return -EINVAL;
-	} else {
-		spin_lock_irqsave(&asd->dis_stats_lock, irqflags);
-		list_add_tail(&dis_buf->list, &asd->dis_stats_in_css);
-		spin_unlock_irqrestore(&asd->dis_stats_lock, irqflags);
 	}
+	spin_lock_irqsave(&asd->dis_stats_lock, irqflags);
+	list_add_tail(&dis_buf->list, &asd->dis_stats_in_css);
+	spin_unlock_irqrestore(&asd->dis_stats_lock, irqflags);
 
 	asd->dis_bufs_in_css++;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..bef803ece2dd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -467,22 +467,22 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
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
+	dev_err(isp->dev,
+		"%s: error in iunit interrupt. status reg=0x%x\n",
+		__func__, irq);
+	spin_unlock_irqrestore(&isp->lock, flags);
+	return -EAGAIN;
+
 done:
 	/*
 	 * MRFLD WORKAROUND:
-- 
2.43.0


