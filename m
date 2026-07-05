Return-Path: <linux-media+bounces-66613-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GyDQCwTPSWpo7QAAu9opvQ
	(envelope-from <linux-media+bounces-66613-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 05:27:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A646708DE7
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 05:26:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66613-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66613-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 594D03021E73
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 03:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A62283FE5;
	Sun,  5 Jul 2026 03:26:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.175.55.52])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D33F26D4DD;
	Sun,  5 Jul 2026 03:26:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222001; cv=none; b=OxkvI9dfpcTV9j1LTcWDYvr8nsaX+eUZx31pJLu4K3J6/LRVnwbPmrI8o7a7AuW34NVbAvGRFwjiZ7UsWYWgXDyIwqlZImh75nXxgB66fcB42pg97Ngr44buMTj51agGL099DdYdZA70zJmoUuKGbkyQS+0AFvPF6qKYtZZOT8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222001; c=relaxed/simple;
	bh=dkreYVcX1uYyR6dZ+wOjFG/ekHUBS5MgFEMPxWHM/vU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TX1/+78BrBw5/47pprkxLeC5kyTROKY+ajD+DDrnCJzUjB307vBn7tzUwi6JQONaRKf4Q7ag/ep/0KIN3jD/YexCh6h4xYKl9xcMReXkThR+rgiLxOVtstfOE1zaNomtFikAvES0Xp80R0m55x6HMQU8UqflKxppiReYgEW6ZNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=52.175.55.52
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wA3Eabhzklq4ysHAA--.13475S3;
	Sun, 05 Jul 2026 11:26:26 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app1 (Coremail) with SMTP id yy_KCgAXiKHgzklqOMSSAg--.50065S2;
	Sun, 05 Jul 2026 11:26:24 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH] media: iris: prevent sys_error_handler from restarting core during remove
Date: Sun,  5 Jul 2026 03:25:29 +0000
Message-Id: <20260705032529.2439425-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yy_KCgAXiKHgzklqOMSSAg--.50065S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?joUb2AXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnVCjTgEH9dVomQuWcozCBBFPrdXRH3UZVhak3gHVbiGEBh9VZZxX0tgRfxAjX6EEgSVV
	fHE+BDvbNLEvXezgMYmp9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoW3Gr15ZFykAFy3tw4DKF45urX_yoW7ZF47pF
	n0k34akrW8WF40vw1UXa1j9F90yw1FgFWUWF93u34xAr15ur4Y9r10ka4rWFyDAFsFva43
	AF4YqrZ8uFZ0qrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Gb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU85l1PUUUUU==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[zju.edu.cn];
	TAGGED_FROM(0.00)[bounces-66613-lists,linux-media=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:fanwu01@zju.edu.cn,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[fanwu01@zju.edu.cn,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[fanwu01@zju.edu.cn,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,zju.edu.cn:from_mime,zju.edu.cn:email,zju.edu.cn:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A646708DE7

iris_remove() does not cancel the sys_error_handler delayed work, which is
armed from the HFI response path on system errors. The handler calls
iris_core_deinit() followed by iris_core_init(), so a pending handler can
restart the core after iris_remove() has started tearing it down.

Set an unregistering flag under the core mutex and make
iris_core_init() refuse to re-initialize the core once removal has begun.
Check the same flag while holding the core mutex in the HFI response
handlers before arming the delayed work, so a system-error interrupt
cannot queue new work after removal starts.

Cancel any delayed work that was queued before the flag was set before
destroying the core mutex.

Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Cc: stable@vger.kernel.org
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 drivers/media/platform/qcom/iris/iris_core.c           |  5 +++++
 drivers/media/platform/qcom/iris/iris_core.h           |  4 ++++
 .../media/platform/qcom/iris/iris_hfi_gen1_response.c  |  5 +++--
 .../media/platform/qcom/iris/iris_hfi_gen2_response.c  |  5 +++--
 drivers/media/platform/qcom/iris/iris_probe.c          | 10 ++++++++++
 5 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 52bf56e517f9..b843ab0d484c 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -48,6 +48,11 @@ int iris_core_init(struct iris_core *core)
 	int ret;
 
 	mutex_lock(&core->lock);
+	if (core->unregistering) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
 	if (core->state == IRIS_CORE_INIT) {
 		ret = 0;
 		goto exit;
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 24da60448cf2..a52d2a1f07c4 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -74,6 +74,9 @@ struct qcom_ubwc_cfg_data;
  * @core_init_done: structure of signal completion for system response
  * @intr_status: interrupt status
  * @sys_error_handler: a delayed work for handling system fatal error
+ * @unregistering: set under @lock in iris_remove() to block core re-init
+ *	and sys_error re-arming; checked under @lock in iris_core_init() and
+ *	the HFI system-error handlers
  * @instances: a list_head of all instances
  * @inst_fw_caps_dec: an array of supported instance capabilities by decoder
  * @inst_fw_caps_enc: an array of supported instance capabilities by encoder
@@ -119,6 +122,7 @@ struct iris_core {
 	struct completion			core_init_done;
 	u32					intr_status;
 	struct delayed_work			sys_error_handler;
+	bool					unregistering;
 	struct list_head			instances;
 	/* encoder and decoder have overlapping caps, so two different arrays are required */
 	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index bfd7495bf44f..c9100112d07b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -230,9 +230,10 @@ iris_hfi_gen1_sys_event_notify(struct iris_core *core, void *packet)
 	mutex_lock(&core->lock);
 	list_for_each_entry(instance, &core->instances, list)
 		iris_inst_change_state(instance, IRIS_INST_ERROR);
+	if (!core->unregistering)
+		schedule_delayed_work(&core->sys_error_handler,
+				      msecs_to_jiffies(10));
 	mutex_unlock(&core->lock);
-
-	schedule_delayed_work(&core->sys_error_handler, msecs_to_jiffies(10));
 }
 
 static void
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 25162ae71357..7f0c121866f2 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -285,10 +285,11 @@ static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
 	mutex_lock(&core->lock);
 	list_for_each_entry(instance, &core->instances, list)
 		iris_inst_change_state(instance, IRIS_INST_ERROR);
+	if (!core->unregistering)
+		schedule_delayed_work(&core->sys_error_handler,
+				      msecs_to_jiffies(10));
 	mutex_unlock(&core->lock);
 
-	schedule_delayed_work(&core->sys_error_handler, msecs_to_jiffies(10));
-
 	return 0;
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index c2dcb50a2782..c8553bc7619f 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -200,7 +200,17 @@ static void iris_remove(struct platform_device *pdev)
 	if (!core)
 		return;
 
+	/*
+	 * Prevent the system-error work from re-initializing the core once
+	 * teardown begins.  Then drain any work that was queued before the
+	 * flag was set, before destroying the mutex used by the work function.
+	 */
+	mutex_lock(&core->lock);
+	core->unregistering = true;
+	mutex_unlock(&core->lock);
+
 	iris_core_deinit(core);
+	cancel_delayed_work_sync(&core->sys_error_handler);
 
 	video_unregister_device(core->vdev_dec);
 	video_unregister_device(core->vdev_enc);
-- 
2.34.1


