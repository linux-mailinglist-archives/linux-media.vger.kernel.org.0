Return-Path: <linux-media+bounces-67282-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KBMSIpPTUGpm5gIAu9opvQ
	(envelope-from <linux-media+bounces-67282-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:12:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E109F73A02C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:12:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=m+ToKRuC;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67282-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67282-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D427303EEAF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5657413D87;
	Fri, 10 Jul 2026 11:11:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B313E416CE5
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 11:11:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681917; cv=none; b=e5scLS5LUuuzgxLYY06zWXO5qV7mm9BSZOyj+hKExqAEvbQhdJvUK7FZNCNLhSmmNZTo1WYAUWlV/avGtrCbQq2MVIYqxmcyaYUPrJoLs2qIrkzGDVN0wAEBwze6ZSwBP9sBh8DFLolUe3d5aI2K7xFEaGfFVrgIoiKFhzM0D24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681917; c=relaxed/simple;
	bh=P9O6A7/XmFSgwLLSWqO4vkxCnJqfZGgtus1oF2ifABQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ns66vOoFwdBAdB9bHa5mOkM22MY1bO9ZCgpZLK3vRYYCNraFYXyQL5GIdZwaXEjjMZeUccmP1Gn2aiFgpZ0CQI8oXjSWrrbzoJDEjDAJbW3yHDV//cNqlrRdYZ/jDmz1LfC7h3uSOsgSqHcCTQIV8ulZLmO0zllG7TmcaXR5oZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+ToKRuC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DFC1F000E9;
	Fri, 10 Jul 2026 11:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783681914;
	bh=LBTWCn5kcW5JB1VvJgsM1HKvYzbbSLvMVtJM1OD7xlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m+ToKRuCchAisZQGhuRw4QnZskmxsILv882D3YyrMwAFf4GLeHDnUl4CiDjzI1YQ7
	 Z6wJCR/O9BtPvjnoeneOGMo3TR0bGxaPGXoMf8cwZV8OPx7zA2I1IhQFWr012XjmZM
	 GXPhK19HSBiuKod8FJsw46jC7PUTY87QbsLoHK+WAN642C5/OzPW539aqOD7z3PRMS
	 QXDDzQ3YmH3ECplOfGeLIsTQgqWw0vdISCEhQ848FS6FTWjF8BC1Ugf09WTaJnVT7E
	 a4GF2bUBzwCLaeS5hCDhPPJPaxKiKGx+uHY3hdHaR2tAV9Am7cFmajHvnneQ/5IwO0
	 XFhtecPTQdSAg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 8/8] media: cec/core: add error-inj-tx-timeouts debugfs entry
Date: Fri, 10 Jul 2026 13:07:36 +0200
Message-ID: <305102d2cd56b1724b3bfd628d46f52977f3cac4.1783681656.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783681656.git.hverkuil+cisco@kernel.org>
References: <cover.1783681656.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67282-lists,linux-media=lfdr.de,cisco];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E109F73A02C

Add a new debugfs entry that makes it possible to do
error injection of failing the next N transmits by a
timeout.

This can be used to test what happens in that case during
the claiming of a free logical address.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/core/cec-adap.c |  7 +++++++
 drivers/media/cec/core/cec-core.c | 31 +++++++++++++++++++++++++++++++
 include/media/cec.h               |  2 ++
 3 files changed, 40 insertions(+)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 774bf9099183..ee8a200b9803 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -629,6 +629,13 @@ void cec_transmit_done_ts(struct cec_adapter *adap, u8 status,
 		attempts_made = 1;
 
 	mutex_lock(&adap->lock);
+	if (adap->error_inj_tx_timeouts) {
+		dprintk(2, "%s: error_inj_tx_timeouts %u\n",
+			__func__, adap->error_inj_tx_timeouts);
+		adap->error_inj_tx_timeouts--;
+		mutex_unlock(&adap->lock);
+		return;
+	}
 	data = adap->transmitting;
 	if (!data) {
 		/*
diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index c51e769b4e34..230f8a413e74 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -223,6 +223,34 @@ static int cec_error_inj_show(struct seq_file *sf, void *unused)
 	return call_op(adap, error_inj_show, sf);
 }
 DEFINE_SHOW_STORE_ATTRIBUTE(cec_error_inj);
+
+static ssize_t cec_error_inj_tx_timeouts_write(struct file *file,
+			const char __user *ubuf, size_t count, loff_t *ppos)
+{
+	struct seq_file *sf = file->private_data;
+	struct cec_adapter *adap = sf->private;
+	int ret;
+
+	if (count > 5)
+		return -EINVAL;
+
+	mutex_lock(&adap->lock);
+	ret = kstrtou32_from_user(ubuf, count, 0, &adap->error_inj_tx_timeouts);
+	if (ret)
+		adap->error_inj_tx_timeouts = 0;
+	mutex_unlock(&adap->lock);
+	return ret ? : count;
+}
+
+static int cec_error_inj_tx_timeouts_show(struct seq_file *sf, void *unused)
+{
+	struct cec_adapter *adap = sf->private;
+
+	seq_printf(sf, "%u", adap->error_inj_tx_timeouts);
+	return 0;
+}
+
+DEFINE_SHOW_STORE_ATTRIBUTE(cec_error_inj_tx_timeouts);
 #endif
 
 struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
@@ -367,6 +395,9 @@ int cec_register_adapter(struct cec_adapter *adap,
 	debugfs_create_devm_seqfile(&adap->devnode.dev, "status", adap->cec_dir,
 				    cec_adap_status);
 
+	debugfs_create_file("error-inj-tx-timeouts", 0644, adap->cec_dir, adap,
+			    &cec_error_inj_tx_timeouts_fops);
+
 	if (!adap->ops->error_inj_show || !adap->ops->error_inj_parse_line)
 		return 0;
 	debugfs_create_file("error-inj", 0644, adap->cec_dir, adap,
diff --git a/include/media/cec.h b/include/media/cec.h
index 5aff399e69e6..6b462d5efe93 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -281,6 +281,8 @@ struct cec_adapter {
 	u32 tx_low_drive_log_cnt;
 	u32 tx_error_log_cnt;
 
+	u32 error_inj_tx_timeouts;
+
 #ifdef CONFIG_CEC_NOTIFIER
 	struct cec_notifier *notifier;
 #endif
-- 
2.53.0


