Return-Path: <linux-media+bounces-60270-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L+NFPp2+GlavgIAu9opvQ
	(envelope-from <linux-media+bounces-60270-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 12:37:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B75E84BBD4B
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 12:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45C713015A48
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 10:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CFE3A545B;
	Mon,  4 May 2026 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxUaVRnG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7581C38A73B
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 10:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777891057; cv=none; b=SvK2YjgTvG1G8rYI0yYAVovqa65+Slco4fYNlQlioMkYkkUvgdUqqjouJZAtidPUOnywSwabAqgIoHKdzc7ov3LpSeTMaNr8oVvICBpzz+TkrmKOgCAlWGphzO1nBYAn34SWqGaDl0uQ/jHig1VE+Eqyl6/47vWvm3OV5BzFygc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777891057; c=relaxed/simple;
	bh=9tAaz20Ae5udo+1KfEibhpKitw73uVxHmbWSDrohfFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P73q7OXXDQpHJ4OrjAJQ2qSLtGwl9DtTqHXv2blDDwsSWiXpu18HTzuSO5cz1JT1XyZgW8lkiYruakE9J2EzsihkYXPaLRZikyMOSEqx2k0U2TNNLM3vTUrO28MM33fYRvT6nTf8EPgCnMBQWsrnrgn68dU9k3qQx2dzt+UsAlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxUaVRnG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ab46931cf1so28701525ad.0
        for <linux-media@vger.kernel.org>; Mon, 04 May 2026 03:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777891056; x=1778495856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zwBefue+sqPVaGbAyP7uY++EiQcB2m+LSHBlyeXzufA=;
        b=WxUaVRnGVtJ/nkSLoArfAH2PsBO9ziasYwEAWVU5ZDpPMoOqb/x6EmNTQfeSGCIJ3V
         c0xZ3/9BaNT85CgF42WCXJNsQmG435jxKHpbi3Bnc0svTUhHWUOGl2PAUbxyrBAN5sIe
         1Zd0LNSuCXZR4sao8ppNfdaBIb5CRagdk/AL/U2GHZDDhhY4ClSZrmDiFpF5MNppacVD
         B+GnK2U2STP72HF4lRwfk9/Ednrf6VcCLMm4dMeLAcL0Dn4zCTyR6g6FMwhk2E90OKUl
         DIZeXGucnenklZ3R/nIEemXqoqgnM5EojXtOimGKbkVF6TSVCfafk+XPeufDhFLuSjzi
         cbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777891056; x=1778495856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwBefue+sqPVaGbAyP7uY++EiQcB2m+LSHBlyeXzufA=;
        b=BKjxDOzKen2fgXJ9k5dKctqIqiBHSfCo3dEg85pqB+6P27xxDregd/T5hwWu/8tvsB
         5m5zm0Zn8Mi1yr2sgLitDnZwmu5gx4kfequkrVZRykdzeeb3fdSe8WP+rD4FVP9deTIt
         zbu+j9fFJXwjh7lPCxAkMPmb8FB3ZRAB9GHsXBbSga8QHf8R2q5cu193LHOnsbk1I9Yv
         OvCa8RAyWo2cCDmvU6PbPpTUmh1VViM3IdlMfqNFPqatNWKjIaghdOUmp+fu5dm40mvh
         K5mxYABUjoo6c8BRlr9ccBP1pcH42wpzsyWszEaDdgU9blMPKH1Iz1Np04uf+psiSiLi
         5HrA==
X-Forwarded-Encrypted: i=1; AFNElJ8+B6Zu7+CLi/9FOWrHYgTNS+cKR5atOIcToO7ZbaqJiyT/cwtDCdnm7GegpBsyV5O/AhCnqLLjkA2HKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6UR3XNsEJGtIY68Ad9ER0ibPhm1E4P17BXdxRHl5r58IJ4kJG
	CqkRLcafNHxUa3JsBtmJq87cl5n+ZpE+IN6rf8D229C/eg/LmD8mM1y3
X-Gm-Gg: AeBDievT9QtIxAcShjoBlrnPvZbA3YnoiWiwRwd/MgHuDiT1ozxoeGutf1Gh13GV4RK
	FdPqEYNRMAoy/bdWbI2WwjLSmaNmDIjMRuSZAWcscbOyKxX63X4oIiNMThqsRn4WQvEzla3eQmo
	1EkhxTyxQ8olr+EfZz4rzm3pkXdWLfYu+Bj+zbJ7xo6ZIaYpHkfH5EuKpp1msRv5fk161kEvG1R
	GQNziBLyww3jAPN0VtHZJRtd9zM7fnM/n8VjIABDWxVoNZsyV8zmc5nqSojcq0Qb08CApk/MY6x
	m7o+D05Q4biHJFcRhrMbK3KFrItllsVshrrvSzbXSgsWP1DuF2rl1v2/6LYSO29dXMAvmIxHZdi
	zAFaWmfa40SxmL4Vm5rkIXIXwQDXdEAIqoh9NUGBN5NT2sHYiBfcqfvQf8hJV6kuMsXOzUOShEe
	UJx1kgEJIHpDG9VxZAsgoKSrHvWcUPJKsdiWK/Hfn6NKYID4U6XTPxPJCsEKLkOO1yFGyox2Bx/
	nyfAVBjLK2qQP64wkXgPY4UXJjOQF7XOjTGvu/nusX7
X-Received: by 2002:a17:903:120f:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2b9a44e3639mr144821845ad.20.1777891055673;
        Mon, 04 May 2026 03:37:35 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.112.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba41784313sm13194525ad.40.2026.05.04.03.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:37:35 -0700 (PDT)
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
Subject: [PATCH v2] staging: media: atomisp: drop unnecessary else block after return/break
Date: Mon,  4 May 2026 16:06:56 +0530
Message-ID: <20260504103656.32945-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B75E84BBD4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-60270-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shyamsunderreddypadira@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Remove redundant else blocks following return or break statements.
As control flow exits in these cases, the else branch is
unnecessary. Dropping it improves code readability.

No functional change.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
Changes in v2:
- Fixed grammar and added missing spaces after punctuation.
- Consolidated dev_err() call to occupy only two lines.

 .../staging/media/atomisp/pci/atomisp_fops.c  | 18 +++++-------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 29 +++++++++----------
 2 files changed, 21 insertions(+), 26 deletions(-)

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
index 900a67552d6a..32b07834d66d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -467,22 +467,21 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
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
+	dev_err(isp->dev, "%s: error in iunit interrupt. status reg=0x%x\n",
+		__func__, irq);
+	spin_unlock_irqrestore(&isp->lock, flags);
+	return -EAGAIN;
+
 done:
 	/*
 	 * MRFLD WORKAROUND:
-- 
2.43.0


