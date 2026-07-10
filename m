Return-Path: <linux-media+bounces-67288-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YPOOCdDjUGqc7wIAu9opvQ
	(envelope-from <linux-media+bounces-67288-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 14:21:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8760B73AB48
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 14:21:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rt6g6KC2;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67288-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67288-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D9793092604
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4091D404BCF;
	Fri, 10 Jul 2026 12:04:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534753112A5
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 12:04:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685064; cv=none; b=Z55DvsrWN48KCAaMg2KACl/bPyFvcTTbIXxnPJ4f+WoKrG6XGIxO3pkAr98IHozqk2Lx8KeD4bxcaoBLZ7NAun25lO1PLrm0YNcbK0+MPvRt62wnc+Zw5IiG3p5pIaGIPDFbjBSxsy/zN5/Rs/b3oQHrvPr6+CLez3pzdbqjlbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685064; c=relaxed/simple;
	bh=NbPegR6+b4GRFh+klweEbzxei3XsxqVuAPE+B5WH8DU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i3C0dCWzVT9MHcyDsZ6N/6KUeFyfR7nALKKBuUmjBayDHq+xPtWDSRUdsN89bCXM5o1c+Tve1H+mQQ7oRPTzILndeFb0DR1JHMLXZ/n0KhtYtKbDm/nVuSak+v3sqphG5jBFUb057V7KISMqsFbhtwCJshk9K9P6l8azjCEdrtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rt6g6KC2; arc=none smtp.client-ip=74.125.230.73
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-39c91e78377so4627691fa.1
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 05:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783685061; x=1784289861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikiWCXLLgYFTXokprsOQoWX6Hiq5wB0hockJYlkF4+o=;
        b=rt6g6KC2G/cebktZ9rKAN99JEdOfbWjreqKCMNN/rrG9jOHJtrJrO5RO98mjm02J/M
         gGckJ6Q8j5oUohv+VTtckobYNdjE0nQW/C2sdZbse5kBi5CuuxuewpowT+c8A7eSu7jl
         sI/0W88QUyVeJJFGBub4KRsw8WmDvs0UfsDP5zpUm5C5hMiiXKOUJzEfTd59Zwo1siTc
         V6zh11AUpclWn5aQ9+oJhc9XaxFBCDCT01A6IeLjqXaJP1UNO4pFRwY+RzdPTtDR469v
         /TlcSs/Gx4I89kGocG2IzdO+Hu3wtICTqQbgEgPeUaBNdTsh+jVIAIIyAhaZ9SeBBlWL
         GLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783685061; x=1784289861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ikiWCXLLgYFTXokprsOQoWX6Hiq5wB0hockJYlkF4+o=;
        b=O03b/kHJ8IULuXgTj96E2UGkZglwx/uPbIeWObT27X1urzQOYJoyr2A2AAo8o4bZWm
         upX1dwodnJ66LZY09wUWQKdC2HMHb5VjlxUfyToKQzK3K+kimRMfaJYDZy3AFVLKPrF5
         Y4Y477hm1nZAj8zO0p2W2abqLxOg4ZrbPpgMJBASWkBjB1fPOs4vuXQ4wU2nV9jlROcI
         KWD6x4U/GjwUT1vqvqOq9LVTk1T9m4/I4lcQcitSLJB1A0MMiQ/Bx8hsc8uavbp9iiy+
         erci4ZZZl7hDLIUK+uDbcDX/+7GQciAc/UI7Inbnt5c3gQvc7Me2Yl6JzTEpLlzeKI7E
         K/Ew==
X-Gm-Message-State: AOJu0Yzt/dnjxSS7NwVxErCASpWYhjfBYklm/H/CJ77WUJPyCiX8VAt1
	Xq7jNorGZvZ6fIYFmsm+2i5sAEKHFMB69nwEeqJue+nZdVEur82cNCqA
X-Gm-Gg: AfdE7cl00UvE9cTwbz1amnKTgq2lpUJhmi3acv/vgSrhMwLaIAQ8BnzI0BmfZ3x5A8J
	oiCBXxTwQS85MySDKiDag8lNelKh/NewXXRRyXunCwhxWv5u9JIdbGqTOmJEgiyFMLtneVd5Ryy
	I18SXsPoSxRoGhDhq4ooOdXPAx9IYHtbSuvVTzF/IPaIpl5478R1Fr5OZtHXu+H7MnaGn8zlINW
	zWZCiIn5cdDS5crgXPlRoALxvHMo03U1rGLmiRIusYD2Fe04n3SZJOwG/Pa7sm3RoProUy6oiXD
	M6govcTW0Os0IWVhMYq1meqMFKnqqSz9yzboIUScdmNvniTUkqSMzCQBJGM3G6yHb8+L/UYsCXU
	j91ZrpZ5J8+M2CJGUikLtA4LPKMOLl9IMdK3FfZtVONFfQrlIbVqbCmAee8h5VOsgXmr0nYlbOe
	FNHNk3+2gOaLU=
X-Received: by 2002:a05:6512:118b:b0:5ae:c454:3740 with SMTP id 2adb3069b0e04-5b0114b7613mr3296895e87.60.1783685061324;
        Fri, 10 Jul 2026 05:04:21 -0700 (PDT)
Received: from fedora ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01cab0191sm557397e87.72.2026.07.10.05.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:04:20 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH v2 2/2] staging: media: atomisp: fix grammar and punctuation in inline comments
Date: Fri, 10 Jul 2026 15:02:54 +0300
Message-ID: <20260710120254.23565-3-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260710120254.23565-1-bohdandmarcus@gmail.com>
References: <20260710120254.23565-1-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67288-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bohdandmarcus@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8760B73AB48

Update inline comments in atomisp_cmd.c to comply with kernel
coding style and maintainer expectations. Specifically:
- Capitalize the first letter of sentences.
- Add missing periods at the end of statements.
- Ensure proper spacing before closing comment tags.

Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9f..6a4d04813 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -216,7 +216,7 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 	curr_rules.fps = fps;
 	curr_rules.run_mode = isp->asd.run_mode->val;
 
-	/* search for the target frequency by looping freq rules*/
+	/* Search for the target frequency by looping freq rules. */
 	for (i = 0; i < dfs->dfs_table_size; i++) {
 		if (curr_rules.width != dfs->dfs_table[i].width &&
 		    dfs->dfs_table[i].width != ISP_FREQ_RULE_ANY)
@@ -259,7 +259,7 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
  */
 int atomisp_reset(struct atomisp_device *isp)
 {
-	/* Reset ISP by power-cycling it */
+	/* Reset ISP by power-cycling it. */
 	int ret = 0;
 
 	dev_dbg(isp->dev, "%s\n", __func__);
@@ -420,7 +420,7 @@ static void print_csi_rx_errors(enum mipi_port_id port,
 		dev_err(isp->dev, "  line sync error");
 }
 
-/* Clear irq reg */
+/* Clear irq reg. */
 static void clear_irq_reg(struct atomisp_device *isp)
 {
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
@@ -431,7 +431,7 @@ static void clear_irq_reg(struct atomisp_device *isp)
 	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, msg_ret);
 }
 
-/* interrupt handling function*/
+/* Interrupt handling function. */
 irqreturn_t atomisp_isr(int irq, void *dev)
 {
 	struct atomisp_device *isp = (struct atomisp_device *)dev;
@@ -481,7 +481,7 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 
 	if ((irq_infos & IA_CSS_IRQ_INFO_INPUT_SYSTEM_ERROR) ||
 	    (irq_infos & IA_CSS_IRQ_INFO_IF_ERROR)) {
-		/* handle mipi receiver error */
+		/* Handle mipi receiver error. */
 		u32 rx_infos;
 		enum mipi_port_id port;
 
@@ -532,7 +532,7 @@ void atomisp_clear_css_buffer_counters(struct atomisp_sub_device *asd)
 	asd->dis_bufs_in_css = 0;
 }
 
-/* 0x100000 is the start of dmem inside SP */
+/* 0x100000 is the start of dmem inside SP. */
 #define SP_DMEM_BASE	0x100000
 
 void dump_sp_dmem(struct atomisp_device *isp, unsigned int addr,
@@ -614,7 +614,7 @@ void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, enum vb2_buffer_s
 	spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
 }
 
-/* clean out the parameters that did not apply */
+/* Clean out the parameters that did not apply. */
 void atomisp_flush_params_queue(struct atomisp_video_pipe *pipe)
 {
 	struct atomisp_css_params_with_list *param;
-- 
2.55.0


