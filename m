Return-Path: <linux-media+bounces-52638-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHRGJHOdjWmD5QAAu9opvQ
	(envelope-from <linux-media+bounces-52638-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 10:29:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B48712BDDC
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 10:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2511C303A3F9
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8D92DEA87;
	Thu, 12 Feb 2026 09:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="At74B7Vk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708502E06EF
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770888541; cv=none; b=VxBB1rPUCHdT4fL2LXEI1qJYkk+BBW3IBzEjX+r6uBelcDFF54OjHRk4bcNAcDN+flTUGFPgDRx/mV8FWWgCvnd/q+FXVvGwJl1qlKawoJIA/I+ukBc0IbPUL6scJu1neGSx0ALZzOakJqjJNziartUVA2yCD/GQ3G/I6eB1VBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770888541; c=relaxed/simple;
	bh=upfOg7F/IZKqxuhv6smQ1R4YFqOiga+sMw/zSmNMPkE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EHFXtA4PZs6bNuhEdEYuqhQy266vsBbFC/JVWHrfjprXU+XS2V5pHe4rTdSojuBDUEIawvzohoQe8Q0eULatXxwpu+b0rH6dqN6jAbOKfQT6+if4rTcNbK2vhZ0Ezvkg5VVw4lLxzEvI5rvkY6Xri5R2vSBS1dIEG4PDXYBOEH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=At74B7Vk; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48327b8350dso56425895e9.1
        for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 01:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770888539; x=1771493339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rn6ZMz5ArFmcupuhjM4pA0NvahHaCKwC6aMAFTPQflw=;
        b=At74B7VkPbM1DH/qcrTQRtG1OLrB0OsZOZF2MUO7+CbKoWBBnB10yUpmcYcMjB2eXG
         VWv4It+DDBsLYm9bEjT14ax3789bBtqPFGeeYk/Z7n2fgK50s6nb2vnl1oSId3iu/dDr
         amMoXjRr/JPSOOBjJNsqEV9SJprpTs4ddmTosv5bdjWK1VbSojKUWhSfOWa4mzdxfdTn
         c3MFUBlFdzN5hNY7rsg59nhKm7uxbCcus7iJYH3q/GC9WX9DHE0U4R9YFIFDG+Dpqal3
         r6mQx+wNL/liQuLG7zclsKelHyty+27TVktxyzEEYpe9FqPzVSoRl2sIMRU7clxfRpex
         K3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770888539; x=1771493339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rn6ZMz5ArFmcupuhjM4pA0NvahHaCKwC6aMAFTPQflw=;
        b=pFqlD5004hG2RXM3MsRf3Jv1fEbKyntShh97FNOTYV93xwach++8UusOHFLKvRZePF
         ifVz8RX5vv7ZT9bGNWiLwqqmk+UL5HPhj+IRDKJGCBggGxOOsKyqjljqagsnaWIN6++W
         YkYgQga+Y0T0T08GMw7dv5SQuVyjETKR1U60aOlKHDNOfrVcxDX5SPCFAMRnUX4OcoJ0
         BU/uCDl6vlBDcS5artA10dhrB+2oQLxMm6AUw+8hRz6M/X0v73LthN/FW2IwW2mCPStP
         y2I+c4IVKzAckD98hZ222x4E6OG7rwhXFK1wPh/kb8P5YeS4UwKjH03TqqRiSzLqRBu6
         Gq1A==
X-Forwarded-Encrypted: i=1; AJvYcCXmbgScLBP+ES1ofF6umr3ZgQZn/FqWwIDd1ouqQa+islPIHk6yPTviI0yKHmRF+ZD4P6r06pLMe+AjQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztuwnWU/Xp3XNbWNcS1NZAStCBW/BAA6OwEFxfR6e2aXp9jeDJ
	txCjv+mjEp41OLUoidnbNP1LF4Eb6gUdjTT5lVkqZkEwHDRcaltv18xtE6Uw+mUJCC0=
X-Gm-Gg: AZuq6aKV46nkjXfmcK1IrMx5hTYvk/x4OiJD5pfluOQAgzNL6kLaVStsDnZwGFGhd/l
	xwSHxtkUsml6/qGGOmhS3+dY3typHmxRB4Evnj907GfbLU/luwC8qdAvZFAIVs/I6a/r8qKyhuB
	tHHTJ6WbVbXDT88MSimaXMlrUcAFwtbNHVlfsk3sS80TC4Q5lfOejrmMJMl/3+UpXu0JZ9eE3wX
	AqMowJlqJr464L81rw5qEriRCPXMkIwYOr5UCWdNcWyVAv8NDThhkcvHMjVQlsmYY+iHa5Oo/IN
	DXGfa9gNEtTbI7DwgD9aGD557BETZACFOXEfuAE8iJfh68R1+xMV7s3DYPE7Wn2wMO6QgcM/GKe
	M4McMlaJvWM30tLq/6pV+2fegkts5CI03qCFLNVBfbjqFYtwVDcloyiwkilvzETdWEWa7npg4tk
	Y+acOaVkSbZxSOwOsTqxiAfdEyXQ==
X-Received: by 2002:a05:600c:450d:b0:47a:8cce:2940 with SMTP id 5b1f17b1804b1-483656c5709mr26908835e9.14.1770888538746;
        Thu, 12 Feb 2026 01:28:58 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836aa0847asm28415945e9.3.2026.02.12.01.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 01:28:58 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Shreeya Patel <shreeya.patel@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2] media: synopsys: hdmirx: replace use of system_unbound_wq with system_dfl_wq
Date: Thu, 12 Feb 2026 10:28:46 +0100
Message-ID: <20260212092846.61602-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52638-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,collabora.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email]
X-Rspamd-Queue-Id: 2B48712BDDC
X-Rspamd-Action: no action

This patch continues the effort to refactor workqueue APIs, which has begun
with the changes introducing new workqueues and a new alloc_workqueue flag:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The point of the refactoring is to eventually alter the default behavior of
workqueues to become unbound by default so that their workload placement is
optimized by the scheduler.

Before that to happen, workqueue users must be converted to the better named
new workqueues with no intended behaviour changes:

   system_wq -> system_percpu_wq
   system_unbound_wq -> system_dfl_wq

This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
removed in the future.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
Changes in v2:
- improved commit log
- rebased on v6.19

 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index c3007e09bc9f..9839a5143d54 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -1735,7 +1735,7 @@ static void process_signal_change(struct snps_hdmirx_dev *hdmirx_dev)
 			   FIFO_UNDERFLOW_INT_EN |
 			   HDMIRX_AXI_ERROR_INT_EN, 0);
 	hdmirx_reset_dma(hdmirx_dev);
-	queue_delayed_work(system_unbound_wq,
+	queue_delayed_work(system_dfl_wq,
 			   &hdmirx_dev->delayed_work_res_change,
 			   msecs_to_jiffies(50));
 }
@@ -2190,7 +2190,7 @@ static void hdmirx_delayed_work_res_change(struct work_struct *work)
 
 		if (hdmirx_wait_signal_lock(hdmirx_dev)) {
 			hdmirx_plugout(hdmirx_dev);
-			queue_delayed_work(system_unbound_wq,
+			queue_delayed_work(system_dfl_wq,
 					   &hdmirx_dev->delayed_work_hotplug,
 					   msecs_to_jiffies(200));
 		} else {
@@ -2209,7 +2209,7 @@ static irqreturn_t hdmirx_5v_det_irq_handler(int irq, void *dev_id)
 	val = gpiod_get_value(hdmirx_dev->detect_5v_gpio);
 	v4l2_dbg(3, debug, &hdmirx_dev->v4l2_dev, "%s: 5v:%d\n", __func__, val);
 
-	queue_delayed_work(system_unbound_wq,
+	queue_delayed_work(system_dfl_wq,
 			   &hdmirx_dev->delayed_work_hotplug,
 			   msecs_to_jiffies(10));
 
@@ -2441,7 +2441,7 @@ static void hdmirx_enable_irq(struct device *dev)
 	enable_irq(hdmirx_dev->dma_irq);
 	enable_irq(hdmirx_dev->det_irq);
 
-	queue_delayed_work(system_unbound_wq,
+	queue_delayed_work(system_dfl_wq,
 			   &hdmirx_dev->delayed_work_hotplug,
 			   msecs_to_jiffies(110));
 }
-- 
2.52.0


