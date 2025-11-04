Return-Path: <linux-media+bounces-46275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ABBC3079F
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 11:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C04818829FC
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 10:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C40314B71;
	Tue,  4 Nov 2025 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aTz7eAqE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6F72D323F
	for <linux-media@vger.kernel.org>; Tue,  4 Nov 2025 10:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762251793; cv=none; b=JFwuxEuoPxcsMi5vBpHQfGivDbdY6/zcJ4xu5A4iNqhvqOLe+VzF1rRjytp5AVGI0yHvHePhBz1lMKu1AT5QMO4XO/qK/OnAPmdpLDCvqNvVvw+8Xogn5IlZuj8SMALWkzwUJxCyBzs6tGuJPL577sVEeeRZ8VIHu8CXSQg3lvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762251793; c=relaxed/simple;
	bh=JiN5zRSgS7hbKTfA+TE3fwE94DEPB8B1lvln54KOk/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OlsX+2OKXlCOyKZ6OFYPT1lwF3lc3WzpidqpYswT8Oa5+rnBh0Z2HyY4JL3VjDizMGuvjRDmnEEv8glI04eFYFZywgn7yi+iU/5HsVujcP7Hxsc4LPVg6D4wjByvzgwA3ddMbyWHipGDrMReF47SoRkcWSRS0MwS2Rhb2zl3M/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aTz7eAqE; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso5129181a12.3
        for <linux-media@vger.kernel.org>; Tue, 04 Nov 2025 02:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762251790; x=1762856590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F5ReZ2sO1ifGE2LFSUDiqxuLt2EAfiZIaMd88MSsMsc=;
        b=aTz7eAqEWfzl9AKSpDDtvTg1znmgo2fvrtH2yogM/NdyMQz578VFLAP6Dx+VlUUyq7
         bEsiCBGE7WPbpwu7AJWNbTk4CtrZEd97lnt5R2lVYDGnwX/4cbrTDZ5Ft+N1v8n7UGYD
         p2zc6cmw2W/+RPGRyeZEpfRgOrEW/TW2HZfWoV36wXCehJU3Ffog0ytV0c+0K/LX53LA
         h8amw2apds5oUmDkLnO9QHBgnnUx22OwSIiRmCeQ1PP0xNQ3gkmbn16ag+fEhvHUn+O0
         fyn99o30QVH6Wu7sr1AZw+56yDTOTfOad1XNspAT265zb81/M56mVu3pBaNp+1vK/yeL
         MdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762251790; x=1762856590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5ReZ2sO1ifGE2LFSUDiqxuLt2EAfiZIaMd88MSsMsc=;
        b=jl42PxF0p5cZvw3oWDsI23pevCCM9mlcTEx8fdf2i+AoTHG5UQHJU2iN+on8JhFx5/
         iFxYiCAx4NwKnlGGpC/Tcmdu6N2Glfe/nItVNxf24UF2A1c3++mAHemHNYkoxPS9zrxj
         9Nl+mwpNhvjPwsU0sbgj+a1GhWdsHVF6iVN+X5PLxNIa6dxBQkcDRmXS5MiuGdE+aeoJ
         ynkmwMNp6AjV3RhGqHEExya0FfRyntcbhD77HW7x9QbKw9rElIGEh+JgRl63NdPbwtlr
         z69T0woZ8ia/B4iMWMLWKkbVGN5qLpc8ENVZntXa+cLmIkVd0YS8arrimxMXiZiYq1lD
         TjXA==
X-Forwarded-Encrypted: i=1; AJvYcCXEBgZgVhQjfViaXf0LK2bdiVVLbo19OZ4Vg52oS8goYyUSSNwaWuFAoNxzVl56o0S7i1FRNUcOKkjg/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU0SlcUrZfdrLSDW6m0G3MZ/FMywdWkgoTl9oZ2RXVJCb+y9XC
	OpNArghQVDf/s3/2vjRNAvI2VOXJMt6FNpZgbOj7bGm5K1gox7kNncJw09+XAYPCFPU=
X-Gm-Gg: ASbGncsv7x9uj0wiVfj3usFeHZfrlYJuSfNUMu1AOKKHopCSvKGJDnd0Eeax4SC1lAp
	dEGMxEg4oMwDG9OVVUpE+PpkHDNq3g/vADuChqv1srA3Q64yPQz99iXnoYnYyW+Ra8IiLHVwId+
	k7FDYYoT8tnKnJ5+AJz0c8M+W7dVK+0eqf7Xp8PaBaDbSsjzfhm0NP2BPzstOAOUxKwL9eVG+ZR
	s88Ek8eGeXVG3ZiytkpJka6jOlqIKZ+n1j6hJ3TAXQTlUtvTaLp7dTDEicZzSyLFNJ5veXPCVyB
	0wPUXqlcGzAS5oB40Sgx2lsFhDdHBzfwFF3AK0GjCeVAVrDOBxrBQ0p2xaVrO5/z7ZRLnKTxQv1
	xAs8NbNKC8VKea7Cg9LGlT6ChThdiXBQPyjBKfYi1h1HNHa+ItI0u6w21eO9ZiRfpPv+mZQ2rsg
	+ChfI=
X-Google-Smtp-Source: AGHT+IGWDLrkGQTycS37vVNtt8N0T7C7MlaRLG8MWxJRzk8Dyu5UYLqwpV2UGQDLweeSm5p96/Ae9Q==
X-Received: by 2002:a17:907:94d5:b0:b70:cfe3:aae2 with SMTP id a640c23a62f3a-b70cfe3ac57mr612722666b.8.1762251790139;
        Tue, 04 Nov 2025 02:23:10 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6805da3sm1753752a12.15.2025.11.04.02.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 02:23:09 -0800 (PST)
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
Subject: [PATCH] media: synopsys: hdmirx: replace use of system_unbound_wq with system_dfl_wq
Date: Tue,  4 Nov 2025 11:20:48 +0100
Message-ID: <20251104102048.79374-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

This patch continues the effort to refactor worqueue APIs, which has begun
with the change introducing new workqueues:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")

system_dfl_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

The old system_unbound_wq will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index b7d278b3889f..da6a725e4fbe 100644
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
2.51.1


