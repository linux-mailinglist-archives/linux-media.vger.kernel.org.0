Return-Path: <linux-media+bounces-66728-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ie9uFjqPS2oZVgEAu9opvQ
	(envelope-from <linux-media+bounces-66728-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 13:19:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA30070FC0F
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 13:19:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hou0vvgX;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66728-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66728-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7552C3037BCF
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 10:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002F03DA5A0;
	Mon,  6 Jul 2026 10:30:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830A9374E62
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 10:30:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333832; cv=none; b=WYRdJlmd85hqX4VCZx1EDXal+jK/gxZjJuF5nF1hM7rGaUq+3mRl5gmSQNhZmmOtExDnObcO+wG8MMWjQkBQ2m+vQHivOaO29CLUgiE/q+rQ5KjzWAEvNH6jaLiXFjA+jEupVgMdUahrvRhDIDJKa2bvc/38pB1nCIdYRKwbXwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333832; c=relaxed/simple;
	bh=NwkQPMpaW8ciuVoZIQwjvF3tbP6Eey8R1hn/QsI6xVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rK/oAxoVcicY63MjxqwN0lpLUVju1E+kgzSRgj5JpfWDSg9A+75cby7T32K7dvlHz45Aq8EebIKZQe5I7cB323Zw4UxTB4uMDEqdqT3CRn5mtjRRYhA1giVBsLP1TGFarnNy95deX7FEVdRWHWTTkgN238qQkHgg6q/OxJNYDS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hou0vvgX; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so16891895ad.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 03:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783333830; x=1783938630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3g0UoWMOjtG1TNbStm0ioEvD0A6G9j9nRCkVCE/Z6JU=;
        b=hou0vvgX+xsNd40ZGfFtv9WUGy3CMVKpB96FGfBRD3JwvvqMGpvjCOi6O6SOzXYjOM
         I+t2qOBfYcRsbalRsjp85m2SAFV7DYTwJygKHKlMEmHeKea/XPX0mui1UAUP4rkQCV4z
         dZwcnNHLpeF5Uks5LDzzA7U0xzBlfnjijJrdTAH/U1NMAtOgoal2gp0kpC51TXQqFM7v
         RiX0YahU5t/16+CSFfooirTMw3nsmJFdHQnk8Hg0YLUi1XgMJGcdmorGshbW5HLoL6Ud
         PaxkdLsowvC1lEi98/I9ZH3dqTr6o0zE9LLoS7xDusl0BcYIti2mcasbHh8MM3/6nVaQ
         Ckdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333830; x=1783938630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3g0UoWMOjtG1TNbStm0ioEvD0A6G9j9nRCkVCE/Z6JU=;
        b=cpYElVx3Syf6Za6BobE1emT0++2nX5V9Wo/gOplf5FPqIHUubHp3iCsOiXDwZFDlfM
         Q6NreOI1iExdViC27kcxwCAIJBkY0J5ujZR/uKrcB7z9ClJxfNf53BNBkae2R0dRywu6
         Iy+uqS09XLCgu0Tnxx35IqfyFimRtn+zXbY25h3bm5r2R9YitdLiZ3e0zFsmGokS9aZI
         ySCSxdZ6xt0/ki88tBXNJ2q4W88EPAT94UWzjISkvh/Npw1BqwL6Br4De2COtzzl4Yjs
         k1iJRh0O7QDY8QFp70mWffavfocqpim9xppZvuTPO6+IOGEsMR6pR2jqs3CG72AXXZj7
         gn2A==
X-Forwarded-Encrypted: i=1; AHgh+RpUB/+L7t+K3BdDOPbh8I5YHs4ddcTJpEsKiRwELm+B47msT/2RZAtIN1gknZ5zdUpITtfi44BE0gj+WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiFJJ6I2Vawf99PhQU1vngI9jN87xQPWCLmRLKAP+3D/XTmZg2
	urUDRp/XN+JwOYdBLFHRak21bomNRr6TXO8ySSemjs7KkaKUuD3F4R7c
X-Gm-Gg: AfdE7cm5PRC1t5KzZ2pXWbFVN2wS+neBAebm6EC98gGorHz+I35oNv1ixg3DiPxL+qO
	9Sw5ryiuHVWYui0/MsiDb4xY5qcHkK95MkFmmg/t+DvbxMWBaP9sU6TMenev5nfXaq0SQZGpRlK
	N6fFI3wcvktLWxDn/+WAHgw9WYxXLVTRlljLbmdfypRIRRsPnS4xFxNCwavSNWdjlYjWn2/pEEH
	I5dNp85hvBZ/r5LWYSjV89HjfHO6Y9J50f7DCrzGRrT9Xwdfh3mY+EbF7hs5ENCbqgGaTAi4xna
	8MMvM0oB09JXVNAf8PCAIHjdT4UHFJqZ17qYLVgBa18XfusMfmLvxkqJuHAyhSaySfvq3wh7NR2
	MG89KdwQu5r+8xh0Rt5K1EvGsVvLGBdt9QhOyZSOSvxodP+OWVhB33ewwOujI6HMcQawckMfsqL
	iBZIXCVJmYUTZ0vJADl/HAlEfBFrRZpg1v9Ldo4jOeZtwgo85UbCofQQwC9Nc/FKw7G2waX69m1
	dVuUzQhMSfzjHkNfwmH2Pll2Jj2qw==
X-Received: by 2002:a17:903:8c8:b0:2cc:76fd:6537 with SMTP id d9443c01a7336-2cc76fd8d66mr74462035ad.2.1783333829552;
        Mon, 06 Jul 2026 03:30:29 -0700 (PDT)
Received: from dileep-HP-Pavilion-Laptop-15-eg2xxx.. ([2405:201:5c1b:705f:8d2c:9348:4a23:7ef4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cc9ebfd8d3sm13138735ad.82.2026.07.06.03.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:30:28 -0700 (PDT)
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	dileepsankhla.ds@gmail.com,
	chelsyratnawat2001@gmail.com,
	abdelrahmanfekry375@gmail.com,
	matt@mattwardle.net,
	azpijr@gmail.com,
	error27@gmail.com,
	kees@kernel.org,
	pontescpedro@gmail.com,
	starpt.official@gmail.com,
	karthikey3608@gmail.com,
	roehling@debian.org,
	feng@innora.ai,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: media: atomisp: Drop unnecessary else block after return/break
Date: Mon,  6 Jul 2026 16:08:10 +0530
Message-ID: <20260706103810.71919-1-dileepsankhla.ds@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-66728-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:dileepsankhla.ds@gmail.com,m:chelsyratnawat2001@gmail.com,m:abdelrahmanfekry375@gmail.com,m:matt@mattwardle.net,m:azpijr@gmail.com,m:error27@gmail.com,m:kees@kernel.org,m:pontescpedro@gmail.com,m:starpt.official@gmail.com,m:karthikey3608@gmail.com,m:roehling@debian.org,m:feng@innora.ai,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:dileepsankhlads@gmail.com,m:starptofficial@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dileepsankhlads@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,gmail.com,mattwardle.net,kernel.org,debian.org,innora.ai,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[dileepsankhlads@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA30070FC0F

Remove redundant else blocks following return or break statements. As
control flow exits in these cases, the else branch is unnecessary.
Dropping it improves code readability.

No functional change.

Signed-off-by: Dileep Sankhla <dileepsankhla.ds@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_fops.c  |  22 ++--
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  30 ++---
 .../hive_isp_css_common/host/input_system.c   | 103 ++++++++-------
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |   3 +-
 .../kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c   |   6 +-
 drivers/staging/media/atomisp/pci/sh_css.c    |  16 +--
 .../media/atomisp/pci/sh_css_firmware.c       |   4 +-
 .../staging/media/atomisp/pci/sh_css_params.c | 118 +++++++++---------
 8 files changed, 149 insertions(+), 153 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index c7aef066f209..8f885f72e195 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -125,10 +125,9 @@ static int atomisp_q_one_metadata_buffer(struct atomisp_sub_device *asd,
 					     stream_id, css_pipe_id)) {
 		list_add(&metadata_buf->list, metadata_list);
 		return -EINVAL;
-	} else {
-		list_add_tail(&metadata_buf->list,
-			      &asd->metadata_in_css[md_type]);
 	}
+
+	list_add_tail(&metadata_buf->list, &asd->metadata_in_css[md_type]);
 	asd->metadata_bufs_in_css[stream_id][css_pipe_id]++;
 
 	return 0;
@@ -165,12 +164,13 @@ static int atomisp_q_one_s3a_buffer(struct atomisp_sub_device *asd,
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
+		dev_dbg(asd->isp->dev, "drop one s3a stat with exp_id %d\n",
+			exp_id);
+
 	asd->s3a_bufs_in_css[css_pipe_id]++;
 	return 0;
 }
@@ -206,12 +206,12 @@ static int atomisp_q_one_dis_buffer(struct atomisp_sub_device *asd,
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
+
 	asd->dis_bufs_in_css++;
 
 	return 0;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..2059b3afc858 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -468,22 +468,22 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
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
+
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
+		"%s: error in iunit interrupt. status reg=0x%x\n", __func__,
+		irq);
+	spin_unlock_irqrestore(&isp->lock, flags);
+	return -EAGAIN;
 done:
 	/*
 	 * MRFLD WORKAROUND:
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 68b0ad27615d..f9bf8d1ddf0a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -408,47 +408,47 @@ static input_system_err_t input_system_configure_channel(
 {
 	input_system_err_t error = INPUT_SYSTEM_ERR_NO_ERROR;
 	// Check if channel is not already configured.
-	if (config.ch_flags[channel.ch_id] & INPUT_SYSTEM_CFG_FLAG_SET) {
+	if (config.ch_flags[channel.ch_id] & INPUT_SYSTEM_CFG_FLAG_SET)
 		return INPUT_SYSTEM_ERR_CHANNEL_ALREADY_SET;
-	} else {
-		switch (channel.source_type) {
-		case INPUT_SYSTEM_SOURCE_SENSOR:
-			error = input_system_configure_channel_sensor(channel);
-			break;
-		case INPUT_SYSTEM_SOURCE_PRBS:
-		case INPUT_SYSTEM_SOURCE_FIFO:
-		default:
-			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		}
 
-		if (error != INPUT_SYSTEM_ERR_NO_ERROR) return error;
-		// Input switch channel configurations must be combined in united config.
-		config.input_switch_cfg.hsync_data_reg[channel.source_cfg.csi_cfg.csi_port * 2]
-		    =
-			channel.target_cfg.input_switch_channel_cfg.hsync_data_reg[0];
-		config.input_switch_cfg.hsync_data_reg[channel.source_cfg.csi_cfg.csi_port * 2 +
-											   1] =
-							       channel.target_cfg.input_switch_channel_cfg.hsync_data_reg[1];
-		config.input_switch_cfg.vsync_data_reg |=
-		    (channel.target_cfg.input_switch_channel_cfg.vsync_data_reg & 0x7) <<
-		    (channel.source_cfg.csi_cfg.csi_port * 3);
-
-		// Other targets are just copied and marked as set.
-		config.target_isp[channel.source_cfg.csi_cfg.csi_port] =
-		    channel.target_cfg.target_isp_cfg;
-		config.target_sp[channel.source_cfg.csi_cfg.csi_port] =
-		    channel.target_cfg.target_sp_cfg;
-		config.target_strm2mem[channel.source_cfg.csi_cfg.csi_port] =
-		    channel.target_cfg.target_strm2mem_cfg;
-		config.target_isp_flags[channel.source_cfg.csi_cfg.csi_port] |=
-		    INPUT_SYSTEM_CFG_FLAG_SET;
-		config.target_sp_flags[channel.source_cfg.csi_cfg.csi_port] |=
-		    INPUT_SYSTEM_CFG_FLAG_SET;
-		config.target_strm2mem_flags[channel.source_cfg.csi_cfg.csi_port] |=
-		    INPUT_SYSTEM_CFG_FLAG_SET;
-
-		config.ch_flags[channel.ch_id] = INPUT_SYSTEM_CFG_FLAG_SET;
+	switch (channel.source_type) {
+	case INPUT_SYSTEM_SOURCE_SENSOR:
+		error = input_system_configure_channel_sensor(channel);
+		break;
+	case INPUT_SYSTEM_SOURCE_PRBS:
+	case INPUT_SYSTEM_SOURCE_FIFO:
+	default:
+		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	}
+
+	if (error != INPUT_SYSTEM_ERR_NO_ERROR)
+		return error;
+
+	// Input switch channel configurations must be combined in united config.
+	config.input_switch_cfg.hsync_data_reg[channel.source_cfg.csi_cfg.csi_port * 2] =
+	    channel.target_cfg.input_switch_channel_cfg.hsync_data_reg[0];
+	config.input_switch_cfg.hsync_data_reg[channel.source_cfg.csi_cfg.csi_port * 2 + 1] =
+	    channel.target_cfg.input_switch_channel_cfg.hsync_data_reg[1];
+	config.input_switch_cfg.vsync_data_reg |=
+	    (channel.target_cfg.input_switch_channel_cfg.vsync_data_reg & 0x7) <<
+	    (channel.source_cfg.csi_cfg.csi_port * 3);
+
+	// Other targets are just copied and marked as set.
+	config.target_isp[channel.source_cfg.csi_cfg.csi_port] =
+	    channel.target_cfg.target_isp_cfg;
+	config.target_sp[channel.source_cfg.csi_cfg.csi_port] =
+	    channel.target_cfg.target_sp_cfg;
+	config.target_strm2mem[channel.source_cfg.csi_cfg.csi_port] =
+	    channel.target_cfg.target_strm2mem_cfg;
+	config.target_isp_flags[channel.source_cfg.csi_cfg.csi_port] |=
+	    INPUT_SYSTEM_CFG_FLAG_SET;
+	config.target_sp_flags[channel.source_cfg.csi_cfg.csi_port] |=
+	    INPUT_SYSTEM_CFG_FLAG_SET;
+	config.target_strm2mem_flags[channel.source_cfg.csi_cfg.csi_port] |=
+	    INPUT_SYSTEM_CFG_FLAG_SET;
+
+	config.ch_flags[channel.ch_id] = INPUT_SYSTEM_CFG_FLAG_SET;
+
 	return INPUT_SYSTEM_ERR_NO_ERROR;
 }
 
@@ -1171,12 +1171,11 @@ static input_system_err_t set_source_type(
 
 	if ((*flags) & INPUT_SYSTEM_CFG_FLAG_SET) {
 		// Check for consistency with already set value.
-		if ((*lhs) == (rhs)) {
+		if ((*lhs) == (rhs))
 			return INPUT_SYSTEM_ERR_NO_ERROR;
-		} else {
-			*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
-			return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
-		}
+
+		*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
+		return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
 	}
 	// Check the value (individually).
 	if (rhs >= N_INPUT_SYSTEM_SOURCE) {
@@ -1216,12 +1215,11 @@ static input_system_err_t set_csi_cfg(
 		    && lhs->acquisition_buffer.mem_reg_size == rhs->acquisition_buffer.mem_reg_size
 		    && lhs->acquisition_buffer.nof_mem_regs  == rhs->acquisition_buffer.nof_mem_regs
 		    && lhs->nof_xmem_buffers  == rhs->nof_xmem_buffers
-		) {
+		)
 			return INPUT_SYSTEM_ERR_NO_ERROR;
-		} else {
-			*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
-			return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
-		}
+
+		*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
+		return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
 	}
 	// Check the value (individually).
 	// no check for backend_ch
@@ -1273,12 +1271,11 @@ static input_system_err_t input_system_multiplexer_cfg(
 
 	if ((*flags) & INPUT_SYSTEM_CFG_FLAG_SET) {
 		// Check for consistency with already set value.
-		if ((*lhs) == (rhs)) {
+		if ((*lhs) == (rhs))
 			return INPUT_SYSTEM_ERR_NO_ERROR;
-		} else {
-			*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
-			return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
-		}
+
+		*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
+		return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
 	}
 	// Check the value (individually).
 	if (rhs >= N_INPUT_SYSTEM_MULTIPLEX) {
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f90c4..6ff77e053d5d 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -235,9 +235,8 @@ static int load_and_flush(ia_css_ptr virt, void *data, unsigned int bytes)
 		vptr = hmm_bo_vmap(bo, true);
 		if (!vptr)
 			return load_and_flush_by_kmap(virt, data, bytes);
-		else
-			vptr = vptr + (virt - bo->start);
 
+		vptr = vptr + (virt - bo->start);
 		memcpy(data, vptr, bytes);
 		clflush_cache_range(vptr, bytes);
 		hmm_bo_vunmap(bo);
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c
index 0089402bc12d..4b2b7667f075 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c
@@ -29,11 +29,11 @@ static void ctc_gradient(
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "ctc_gradient() error, illegal division operation\n");
 		return;
-	} else {
-		dydx_int = dy / dx;
-		dydx_frc = ((dy - dydx_int * dx) << frc_bits) / dx;
 	}
 
+	dydx_int = dy / dx;
+	dydx_frc = ((dy - dydx_int * dx) << frc_bits) / dx;
+
 	assert(y0 >= 0 && y0 <= max_dydx);
 	assert(y1 >= 0 && y1 <= max_dydx);
 	assert(x0 < x1);
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 00082276f1db..8e7c99b88c39 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -7719,14 +7719,14 @@ ia_css_pipe_override_frame_format(struct ia_css_pipe *pipe,
 		err = -EINVAL;
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
-	} else {
-		err = ia_css_pipe_check_format(pipe, new_format);
-		if (!err) {
-			if (pin_index == 0)
-				pipe->output_info[0].format = new_format;
-			else
-				pipe->vf_output_info[0].format = new_format;
-		}
+	}
+
+	err = ia_css_pipe_check_format(pipe, new_format);
+	if (!err) {
+		if (pin_index == 0)
+			pipe->output_info[0].format = new_format;
+		else
+			pipe->vf_output_info[0].format = new_format;
 	}
 	IA_CSS_LEAVE_ERR_PRIVATE(err);
 	return err;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index af12df2f9b09..965445609eaa 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -246,10 +246,10 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 		IA_CSS_ERROR("CSS code version (%s) and firmware version (%s) mismatch!",
 			     file_header->version, release_version);
 		return -EINVAL;
-	} else {
-		IA_CSS_LOG("successfully load firmware version %s", release_version);
 	}
 
+	IA_CSS_LOG("Successfully loaded firmware version %s", release_version);
+
 	sh_css_num_binaries = file_header->binary_nr;
 	/* Only allocate memory for ISP blob info */
 	if (sh_css_num_binaries > NUM_OF_SPS) {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 8420a22fd8f0..b48cb3227622 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -2334,10 +2334,10 @@ sh_css_create_isp_params(struct ia_css_stream *stream,
 		IA_CSS_ERROR("%s:%d error: cannot allocate memory", __FILE__, __LINE__);
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
-	} else {
-		memset(params, 0, sizeof(struct ia_css_isp_parameters));
 	}
 
+	memset(params, 0, sizeof(struct ia_css_isp_parameters));
+
 	ddr_ptrs = &params->ddr_ptrs;
 	ddr_ptrs_size = &params->ddr_ptrs_size;
 
@@ -3195,31 +3195,31 @@ sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
 				   isp_params_info.output_frame_ptr,
 				   queue_id, thread_id);
 			break;
-		} else {
-			/* TMP: check discrepancy between nr of enqueued
-			 * parameter sets and dequeued sets
-			 */
-			g_param_buffer_enqueue_count++;
-			assert(g_param_buffer_enqueue_count < g_param_buffer_dequeue_count + 50);
-			/*
-			 * Tell the SP which queues are not empty,
-			 * by sending the software event.
-			 */
-			if (!sh_css_sp_is_running()) {
-				/* SP is not running. The queues are not valid */
-				IA_CSS_LEAVE_ERR_PRIVATE(-EBUSY);
-				return -EBUSY;
-			}
-			ia_css_bufq_enqueue_psys_event(
-			    IA_CSS_PSYS_SW_EVENT_BUFFER_ENQUEUED,
-			    (uint8_t)thread_id,
-			    (uint8_t)queue_id,
-			    0);
-			IA_CSS_LOG("pfp: added config id %d for OF %d to q %d on thread %d",
-				   isp_params_info.isp_parameters_id,
-				   isp_params_info.output_frame_ptr,
-				   queue_id, thread_id);
 		}
+
+		/* TMP: check discrepancy between nr of enqueued
+		 * parameter sets and dequeued sets
+		 */
+		g_param_buffer_enqueue_count++;
+		assert(g_param_buffer_enqueue_count < g_param_buffer_dequeue_count + 50);
+		/*
+		 * Tell the SP which queues are not empty,
+		 * by sending the software event.
+		 */
+		if (!sh_css_sp_is_running()) {
+			/* SP is not running. The queues are not valid */
+			IA_CSS_LEAVE_ERR_PRIVATE(-EBUSY);
+			return -EBUSY;
+		}
+
+		ia_css_bufq_enqueue_psys_event(
+				IA_CSS_PSYS_SW_EVENT_BUFFER_ENQUEUED,
+				(uint8_t)thread_id, (uint8_t)queue_id, 0);
+		IA_CSS_LOG("pfp: added config id %d for OF %d to q %d on thread %d",
+			   isp_params_info.isp_parameters_id,
+			   isp_params_info.output_frame_ptr,
+			   queue_id, thread_id);
+
 		/* clean-up old copy */
 		ia_css_dequeue_param_buffers(/*pipe_num*/);
 		params->pipe_dvs_6axis_config_changed[pipeline->pipe_id] = false;
@@ -4105,44 +4105,44 @@ sh_css_update_uds_and_crop_info_based_on_zoom_region(
 		uds->curr_dy = HRT_GDC_N;
 	}
 
-	if (info->enable.dvs_envelope) {
+	if (info->enable.dvs_envelope)
 		/* Zoom region is only supported by the UDS module on ISP
 		 * 2 and higher. It is not supported in video mode on ISP 1 */
 		return -EINVAL;
-	} else {
-		if (enable_zoom) {
-			/* A. Calculate dx/dy based on crop region using in_frame_info
-			* Scale the crop region if in_frame_info to the stage is not same as
-			* actual effective input of the pipeline
-			*/
-			if (in_frame_info->res.width != pipe_in_res.width ||
-			    in_frame_info->res.height != pipe_in_res.height) {
-				x0 = (x0 * in_frame_info->res.width) / (pipe_in_res.width);
-				y0 = (y0 * in_frame_info->res.height) / (pipe_in_res.height);
-				x1 = (x1 * in_frame_info->res.width) / (pipe_in_res.width);
-				y1 = (y1 * in_frame_info->res.height) / (pipe_in_res.height);
-			}
-			uds->curr_dx =
-			    ((x1 - x0 - filter_envelope) * HRT_GDC_N) / in_frame_info->res.width;
-			uds->curr_dy =
-			    ((y1 - y0 - filter_envelope) * HRT_GDC_N) / in_frame_info->res.height;
-
-			/* B. Calculate xc/yc based on crop region */
-			uds->xc = (uint16_t)x0 + (((x1) - (x0)) / 2);
-			uds->yc = (uint16_t)y0 + (((y1) - (y0)) / 2);
-		} else {
-			uds->xc = (uint16_t)in_frame_info->res.width / 2;
-			uds->yc = (uint16_t)in_frame_info->res.height / 2;
-		}
 
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-				    "uds->curr_dx=%d, uds->xc=%d, uds->yc=%d\n",
-				    uds->curr_dx, uds->xc, uds->yc);
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "x0=%d, y0=%d, x1=%d, y1=%d\n",
-				    x0, y0, x1, y1);
-		sp_out_crop_pos->x = (uint16_t)info->pipeline.left_cropping;
-		sp_out_crop_pos->y = (uint16_t)info->pipeline.top_cropping;
+	if (enable_zoom) {
+		/* A. Calculate dx/dy based on crop region using in_frame_info
+		* Scale the crop region if in_frame_info to the stage is not same as
+		* actual effective input of the pipeline
+		*/
+		if (in_frame_info->res.width != pipe_in_res.width ||
+		    in_frame_info->res.height != pipe_in_res.height) {
+			x0 = (x0 * in_frame_info->res.width) / (pipe_in_res.width);
+			y0 = (y0 * in_frame_info->res.height) / (pipe_in_res.height);
+			x1 = (x1 * in_frame_info->res.width) / (pipe_in_res.width);
+			y1 = (y1 * in_frame_info->res.height) / (pipe_in_res.height);
+		}
+		uds->curr_dx =
+		    ((x1 - x0 - filter_envelope) * HRT_GDC_N) / in_frame_info->res.width;
+		uds->curr_dy =
+		    ((y1 - y0 - filter_envelope) * HRT_GDC_N) / in_frame_info->res.height;
+
+		/* B. Calculate xc/yc based on crop region */
+		uds->xc = (uint16_t)x0 + (((x1) - (x0)) / 2);
+		uds->yc = (uint16_t)y0 + (((y1) - (y0)) / 2);
+	} else {
+		uds->xc = (uint16_t)in_frame_info->res.width / 2;
+		uds->yc = (uint16_t)in_frame_info->res.height / 2;
 	}
+
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
+			    "uds->curr_dx=%d, uds->xc=%d, uds->yc=%d\n",
+			    uds->curr_dx, uds->xc, uds->yc);
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "x0=%d, y0=%d, x1=%d, y1=%d\n",
+			    x0, y0, x1, y1);
+	sp_out_crop_pos->x = (uint16_t)info->pipeline.left_cropping;
+	sp_out_crop_pos->y = (uint16_t)info->pipeline.top_cropping;
+
 	IA_CSS_LEAVE_PRIVATE("void");
 	return err;
 }
-- 
2.43.0


