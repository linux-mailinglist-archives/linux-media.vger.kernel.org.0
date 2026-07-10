Return-Path: <linux-media+bounces-67263-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1/BJJzLEUGoS4wIAu9opvQ
	(envelope-from <linux-media+bounces-67263-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:06:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CAB739711
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:06:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=H3LqInqK;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67263-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67263-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D3AD0303963C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 09:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406353FB7F2;
	Fri, 10 Jul 2026 09:55:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDC23FBEC2;
	Fri, 10 Jul 2026 09:55:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677348; cv=none; b=I9f+V9KvjDdG6sgVGxch9QvS9LxguarEKTrAPN64jByeDhhkca06vYIaeKGXt4OvsQMLxkQGnt1odjZ98Wa+LQub//c35SPM5bc7JLIUwtIGWZzkedzGcMICUS1igMLcHCuaCLBp/1QyB9SVVhmjahO9xHeHMHZV+IrwATMfq/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677348; c=relaxed/simple;
	bh=HCQg3D1W2skClVuKNUjUT6Tikqzh6u/mWsC9nrQd0hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dOS/zvpy7VHf+49kEL+F1gj71nYFXRGkQmVtltRQkvO3ayYW3llK3Q+VhAuti2q0Sbc8zwT6iIu0ZSg5BrxN3hbRqJJES2939uf2q7iJs8YikLBMw9CeDzm74doO9Sdygs3X9Dr1xngvmuRQyPrtyNUbQ/7zf211y1yXF6GC9lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H3LqInqK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415C01F000E9;
	Fri, 10 Jul 2026 09:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783677347;
	bh=7Fau1QEoroybO8+INwe7Eethg9f5DZXctrvfPlA18vw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H3LqInqKUboxFbURJWGp44XaPe+Qphl0dV6HQnhuVp2AqAzs0ROD8WJfh9OO510IX
	 PTNQcszkRS4D6Cu/iHFkRuAqpA6X0GWQYm/taJcxxeBhKcvOY8DnCoWO+0Zp2uWpiG
	 qOsrkvQFco/5LiPFZXvO3Lht2WGdWmd96C0XpQk8iTy7mkcjoffIPd1isikF+FzEFR
	 gVpjuJettPMGUroH6qCJMx8DlPI8kwaux4MzFsm8+3DtBdgZFjo5h/+85rCC3FSRii
	 ZOVg/n3vdYF/k0Ial1JxqAD8xhiD1srfC9Qo+F6lKKr4z+U723IPjB6bSPu6Be/6Gk
	 eMEclOfYsi2TA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	linux-tegra@vger.kernel.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 2/2] media: cec: tegra_cec: keep track of number of Rx Low Drives
Date: Fri, 10 Jul 2026 11:53:18 +0200
Message-ID: <3d1d723b914c3ed8389a032ebbf791146b92133c.1783677198.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783677198.git.hverkuil+cisco@kernel.org>
References: <cover.1783677198.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-67263-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:thierry.reding@kernel.org,m:linux-tegra@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5CAB739711

Keep track of Rx Low Drive conditions. Useful for detecting
potential hardware/cable problems as it suggests unstable or
incorrect voltage levels.

Note that the Tx Low Drive conditions are already logged in
the CEC core.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/platform/tegra/tegra_cec.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/media/cec/platform/tegra/tegra_cec.c b/drivers/media/cec/platform/tegra/tegra_cec.c
index f8ffaeb78118..e22a4625f192 100644
--- a/drivers/media/cec/platform/tegra/tegra_cec.c
+++ b/drivers/media/cec/platform/tegra/tegra_cec.c
@@ -24,6 +24,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/seq_file.h>
 #include <linux/clk/tegra.h>
 
 #include <media/cec-notifier.h>
@@ -47,6 +48,7 @@ struct tegra_cec {
 	u32			tx_buf[CEC_MAX_MSG_SIZE];
 	u8			tx_buf_cur;
 	u8			tx_buf_cnt;
+	u32			rx_total_low_drives;
 };
 
 static inline u32 cec_read(struct tegra_cec *cec, u32 reg)
@@ -116,6 +118,13 @@ static irqreturn_t tegra_cec_irq_handler(int irq, void *data)
 		return IRQ_WAKE_THREAD;
 	}
 
+	if (status & TEGRA_CEC_INT_STAT_RX_BUS_ERROR_DETECTED) {
+		dev_warn_ratelimited(dev, "RX bus error detected, generated low drive\n");
+		cec->rx_total_low_drives++;
+		cec_write(cec, TEGRA_CEC_INT_STAT,
+			  TEGRA_CEC_INT_STAT_RX_BUS_ERROR_DETECTED);
+	}
+
 	if ((status & TEGRA_CEC_INT_STAT_TX_ARBITRATION_FAILED) ||
 		   (status & TEGRA_CEC_INT_STAT_TX_BUS_ANOMALY_DETECTED)) {
 		tegra_cec_error_recovery(cec);
@@ -241,6 +250,7 @@ static int tegra_cec_adap_enable(struct cec_adapter *adap, bool enable)
 		  TEGRA_CEC_INT_MASK_TX_BUS_ANOMALY_DETECTED |
 		  TEGRA_CEC_INT_MASK_TX_FRAME_TRANSMITTED |
 		  TEGRA_CEC_INT_MASK_RX_REGISTER_FULL |
+		  TEGRA_CEC_INT_MASK_RX_BUS_ERROR_DETECTED |
 		  TEGRA_CEC_INT_MASK_RX_START_BIT_DETECTED);
 
 	/*
@@ -318,11 +328,20 @@ static int tegra_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	return 0;
 }
 
+static void tegra_cec_adap_status(struct cec_adapter *adap, struct seq_file *file)
+{
+	struct tegra_cec *cec = adap->priv;
+
+	seq_printf(file, "receive low drive count: %u\n",
+		   cec->rx_total_low_drives);
+}
+
 static const struct cec_adap_ops tegra_cec_ops = {
 	.adap_enable = tegra_cec_adap_enable,
 	.adap_log_addr = tegra_cec_adap_log_addr,
 	.adap_transmit = tegra_cec_adap_transmit,
 	.adap_monitor_all_enable = tegra_cec_adap_monitor_all_enable,
+	.adap_status = tegra_cec_adap_status,
 };
 
 static int tegra_cec_probe(struct platform_device *pdev)
-- 
2.53.0


