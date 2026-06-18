Return-Path: <linux-media+bounces-65147-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ODOHBrNKM2qd/AUAu9opvQ
	(envelope-from <linux-media+bounces-65147-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 03:32:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B087D69D04A
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 03:32:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=DJczzAQx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65147-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65147-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64462303AB7B
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 01:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2622DE702;
	Thu, 18 Jun 2026 01:32:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE04870808;
	Thu, 18 Jun 2026 01:32:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781746327; cv=none; b=TFeqGPyEcJmD735wHwFOfImsPa8otGP6Rb/4xxrDkFSbk1BheGiY3ZaVZ4cLZlzJucZQhb4ggfyrnzIZxGoe+f0uJ03F002dlDi3LKM3bthnlbitolE7ZP9+6eBoONhzvnq5GiLiMLgDiZYkARsl6wOA5lLYDPp8Trs65joQINU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781746327; c=relaxed/simple;
	bh=TAIARPIajkOITGDbzSdoHBoCTTaPL3l2Xbtr82qtBKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h9HrPMgF3DcVbrw6wdbBfuOZUBdHH7z6RtP760mabRztVxDNDSW+QRT+3o6I7JGwH8AvFr50WyL3hVvcpUWV+12/yfpvjK0/O5UIDYUpAKH87zMRsPSLVNtD/8Myb5Ufc/eqlnBEUt5036IJKI2HlGz7DPLKQHmumqAu7dS+1OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=DJczzAQx; arc=none smtp.client-ip=54.206.16.166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781746319;
	bh=hfITmRqopvF8VmHdbL2kohw7TYEzFUvuc8O9lZccWZs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=DJczzAQxYQMtzKq62qOpxS291r5L0Kz3hvdiDOMIdD8eBsofT0+JxCNa4yP/spHjD
	 MarlyOtlThae6fas2gC8mGPy8AYhBcHoWg0Rqz4uJo6+Cz3p+2AUlJ6uL++k4biQZ9
	 sQ1Ck2/zXZePl7LUjI5CmxEI7JFKWNAMZ6juaO0E=
X-QQ-mid: esmtpsz10t1781746309t53ccef32
X-QQ-Originating-IP: llpGkfY8lgptXbhHPfjBEmBbKy49yDRwyfIoAWzQe7o=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 18 Jun 2026 09:31:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8223294922707337741
EX-QQ-RecipientCnt: 15
From: Haowen Tu <tuhaowen@uniontech.com>
To: rafael@kernel.org
Cc: tuhaowen@uniontech.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	kernel@uniontech.com,
	laurent.pinchart@ideasonboard.com,
	lenb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mchehab@kernel.org,
	oneukum@suse.com,
	pavel@kernel.org,
	stern@rowland.harvard.edu
Subject: [PATCH v3 1/3] PM: hibernate: clear in_suspend before freeing the snapshot
Date: Thu, 18 Jun 2026 09:31:31 +0800
Message-Id: <20260618013133.1047270-2-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260618013133.1047270-1-tuhaowen@uniontech.com>
References: <20260602032413.1540166-1-tuhaowen@uniontech.com>
 <20260618013133.1047270-1-tuhaowen@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NQDSFSrlZSaiNTQywGS0gUgsqo8KzJnutWFTBqx9JbfL/jIPamAudznU
	4pYOnhf41zZgUuqO1rP5Jpz7095/zvCR7IUmA46KPVbQ3slkp794lO3tgvMHkiI1zP0OkpJ
	8SN+QuN9voDjmgGr9Qco8iZzuU31I3NOVbKRZpZRb9Ia8p+9ZEZnWZLRFzJPChHMIqgPGVm
	sLt0aDMY+CEIHMmI7aJtFQs9Dpeo+CG/9UCdBDfXm86VOHkJCT+jWEAhER3Z2qyhIuyCW80
	QHIosyGfncgKVgP621x33rTdA+pnQ5Cd92KAwt4zI3ig+6tA/7iQKEp0gtLc4RwbW7BphAt
	/WUNTPAZOxOsvfPvdTEJyaM8xrsvLfAoItqiaFfhN749dW7katHwpOf467mo53kfKwwvfXq
	i89bH2T8GR3RPUXzzebBw2MnrqonvYlwyGz9rzBEZwcLGCc1yWhe6Q1KtPcUuNWCKAufnlj
	zjvC7TImC1NStbTDGeRldWgOow+21dv7ACOtrM8C8LvFVYcI10NvfpQKU3oTYynfINpVCE3
	M15qdFCW0cPoVC4+RFG+5qHm8PvOCUs6DNOTi5TaZNvijUP3rPqR/RxOPq54C4wwLK1G8pV
	S29N6qCXgY9g0y0LHbBZuIYz47qDwV1xrkITsklAI+gyz0SHBTf4ndkAWa6GaCtWnDdI5Sa
	HSe24qzuqqwIivGJnjdjYSLuvVxL6EiVlStphArLvyKx1cxGCHLzNt1ZsNPKQB7+WvduAot
	gZYYeeInKCcAMwEMxagKSjgPplrn56Njg4WOh8WzGOqAXEXBbt07XzQGzJsHBt4gxwlGlcS
	1qXmPPqScvXiQz5aQvyP/jHjqHmbcgZIxL7VMz/rIRexELOjx8/UQ9DP2txw+VheBhV9fx5
	hS1XLyv81mxa0GVGL+7jPhi31pZyV2tEpM6KgghFSNeBeSqENmbxk131PRHFgDZVbQ0P0K2
	jlmOQkAxVsYGuHLcLaFIUoR0hcPqI9N7n3i6pjz/oKRscV7+nbcWVjmXFbS3yHOp7ogadQP
	XlRQqxv1E6XRX8XziuwLhClnV01DMDuc6e8kbY42RGhRozzzt+Rtf1jEhm4GQ=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65147-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tuhaowen@uniontech.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:tuhaowen@uniontech.com,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:kernel@uniontech.com,m:laurent.pinchart@ideasonboard.com,m:lenb@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:mchehab@kernel.org,m:oneukum@suse.com,m:pavel@kernel.org,m:stern@rowland.harvard.edu,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tuhaowen@uniontech.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,uniontech.com:dkim,uniontech.com:email,uniontech.com:mid,uniontech.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B087D69D04A

in_suspend indicates that a hibernation snapshot has been created and is
still available.  Keep that state consistent with the lifetime of the
snapshot memory by clearing in_suspend before swsusp_free() releases it.

If image creation fails after in_suspend has been set,
hibernation_snapshot() releases the snapshot memory but currently leaves
in_suspend set.  Preserve its value locally long enough to select the
appropriate device resume message, then clear it before releasing the
snapshot.

Also clear in_suspend before releasing the snapshot after swsusp_write()
returns.

Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
Changes in v3:
- Split this cleanup from the helper patch.

 kernel/power/hibernate.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index af8d07bafe02..6d3e637c5a02 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -418,6 +418,7 @@ static void shrink_shmem_memory(void)
 int hibernation_snapshot(int platform_mode)
 {
 	pm_message_t msg;
+	bool snapshot_done;
 	int error;
 
 	pm_suspend_clear_flags();
@@ -474,15 +475,18 @@ int hibernation_snapshot(int platform_mode)
 	 * returns here (1) after the image has been created or the
 	 * image creation has failed and (2) after a successful restore.
 	 */
+	snapshot_done = in_suspend;
 
 	/* We may need to release the preallocated image pages here. */
-	if (error || !in_suspend)
+	if (error || !snapshot_done) {
+		in_suspend = 0;
 		swsusp_free();
+	}
 
-	msg = in_suspend ? (error ? PMSG_RECOVER : PMSG_THAW) : PMSG_RESTORE;
+	msg = snapshot_done ? (error ? PMSG_RECOVER : PMSG_THAW) : PMSG_RESTORE;
 	dpm_resume(msg);
 
-	if (error || !in_suspend)
+	if (error || !snapshot_done)
 		pm_restore_gfp_mask();
 
 	console_resume_all();
@@ -865,6 +869,7 @@ int hibernate(void)
 
 		pm_pr_dbg("Writing hibernation image.\n");
 		error = swsusp_write(flags);
+		in_suspend = 0;
 		swsusp_free();
 		if (!error) {
 			if (hibernation_mode == HIBERNATION_TEST_RESUME)
@@ -872,7 +877,6 @@ int hibernate(void)
 			else
 				power_down();
 		}
-		in_suspend = 0;
 		pm_restore_gfp_mask();
 	} else {
 		pm_pr_dbg("Hibernation image restored successfully.\n");
-- 
2.20.1

