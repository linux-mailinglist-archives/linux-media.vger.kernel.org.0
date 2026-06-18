Return-Path: <linux-media+bounces-65148-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FyLTBaFKM2qY/AUAu9opvQ
	(envelope-from <linux-media+bounces-65148-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 03:32:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA9569D035
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 03:32:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=YXrkRObh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65148-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65148-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D92030F59B3
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 01:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67982DB789;
	Thu, 18 Jun 2026 01:32:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118C470808;
	Thu, 18 Jun 2026 01:32:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781746332; cv=none; b=BKOT4zSpsaraFm8rtow3e1ddaQ/8b3PxJB06TTPsVFlLp4kqC6cIPV2kyBs9z3gbNPcRqp4CVYN9wRFf+LZuPuxolg/Lhlt3e3F54vA/HE90hhtRbpAFUPfdCeuk3SaeIDh0jpK39aOXsEepoYwmha6IsMIWrLLU/XKww+Okszs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781746332; c=relaxed/simple;
	bh=3cdZrQ+gMzRsEoUHwz0XvvxIhexenokN/Q0zcOGJlvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s6SHwM99L1LMOKWMDoHlqM2FoSdYaAYXSkggXgM7Yxf2c6FZgzKvZDS+de8dBuQZ0hIX6Tv9eVsqM8liKaLf7OGprtuxIKKhAxKXKdrmuECmYmxjkdseVzxS8KDGmFDUNh6YilDsR61sWNenvKt6qlFJmnfRM2I4qlzAAfYi6gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=YXrkRObh; arc=none smtp.client-ip=54.207.19.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781746323;
	bh=Ra1g4MXA5D0NhDjT7hmvSp+cfr8vAcLzgs85SXpwPE0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=YXrkRObhDaVCEE2UEZQMFWFF3bUAb1MDq9JuwzrKpyfSVNJyT1/3LmJNPMRs7joxH
	 x1If7xmqyvSwrt6iwbSY+0Hz/Xe0WI1s6aiJtKgV3Q4ZBaOqmjwV2ErRbBO0uEY+MT
	 pOlpfrIKwGS0b5TIVOwDf75rQpjwdodifNKiKs5Q=
X-QQ-mid: esmtpsz10t1781746314tf9685e16
X-QQ-Originating-IP: JHNYKEAbmnN9fprXduYE5hvJDTnHVbSiaOyiDAyODMU=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 18 Jun 2026 09:31:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3410012867176178788
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
Subject: [PATCH v3 2/3] PM: hibernate: add pm_hibernation_snapshot_done() helper
Date: Thu, 18 Jun 2026 09:31:32 +0800
Message-Id: <20260618013133.1047270-3-tuhaowen@uniontech.com>
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
X-QQ-XMAILINFO: NhvpCzAv3WKAwKVe2pTNZlmOm+CJxNYf10OI+brehtAUXgeWW0bNcmkU
	YMYa2HjFvKPfrz/n6FWPspdhseGPtmmMDRLJQl19uKmZ2OAnRL5uIcFEcHzFtjHpNdbporR
	PRc6v5uoHNw8cPj0REMo2uAkW7n4z5SQB9Y1VgLhT+PBmQbRTCm+jItzHGyT24Zh2U2inCi
	ymgJDgicmyCWCVvizaGsq9ogqQ+602B2mJ9PFpIC+XLZOL8IF7gOdQ8E1Se07uWbO7f6eS6
	kDua+Z3e3EFo+WH27DvllHXfK7P1tPR4RHayjGL27heOc5Iex0rRQ3JDUQafhESEfU+2wOk
	MuYL9suWQ9BQTvRrqBozCFetLA7KIxIZDGOydC8OynkeuYciE2egH8tp4TYW5286eQe8MxH
	o4S/jKuigpVgd8XZ2T5jRby6cljM4uIT8MoYQB5JVE5wLXIA+qW2PU1ZrrTdfzdOIbA0oiq
	GbJjzab359o4+p7Vdnw7salQOLgo04LmiRT7hiD27lghT7DYe3WSST49Zes+r6dIiJEJ9Ba
	6W69x/qBx1gzS1FFAJsiHBm5KQZz2ujriqUj3JWsmvzJmn2UgjKgzc45rIIEnqevHrDBYxC
	mzmsDOkTSB6+gD2Iy3JkKpMW5CSGoKWg/aCAlP2KJWiqwiUyaQAFQcHJenDrkwZ7qaNPEWf
	yAjv6hc6GfDY0WRthq2ZWWLYwH/DFyLOuyuqUwbK0/ZD0qQO3unBEH2VrPlnmqBBlEH9Rb9
	4xEyGGHADtHCT0u2Y4c+42Uky/sn4sKkp2MUV95DxzDuFxHtBX/cRvtKb28gVLo8hm+tSbt
	syMKeeF2nWUYWYukJnss+/rJNSPIBumbStkMs6Z4QU+IIzhjdAbzlfGOOOt7TFsQ1NiA9qE
	O+G0p3KHnBmnFydXJZCPPZwHjL1lIkoT42myAqjBJsFbILc08HNvnEKg+xR6wzFY4AZh3gi
	owploNg3rCHTrKnbEcA5jgr7mZ5Yvz9pDgZpAVevElVFuzqcOOzGyjKxR3rjn0FUklt+X/O
	wRTO+Z37ufWysYwNMWmvOpL3oUUG+3rVcY5uDEdUu5it/LIkQBiPN7FzpLbHULSPuAvYoHz
	nkLsnnpzFdzE5ppyRU7BFo=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65148-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tuhaowen@uniontech.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:tuhaowen@uniontech.com,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:kernel@uniontech.com,m:laurent.pinchart@ideasonboard.com,m:lenb@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:mchehab@kernel.org,m:oneukum@suse.com,m:pavel@kernel.org,m:stern@rowland.harvard.edu,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BA9569D035

Some subsystem resume callbacks do not receive the PM event and
therefore cannot distinguish the PMSG_THAW phase after snapshot creation
from the PMSG_RESTORE phase.

Export pm_hibernation_snapshot_done() so a driver can query whether the
hibernation snapshot has been created and is still available.  The
helper only exposes the PM state; callers remain responsible for
ensuring that any device-specific behavior is safe, including subsequent
poweroff or shutdown handling.

The helper returns !!in_suspend.  This variable is set before
swsusp_arch_suspend(), cleared before the snapshot memory is released,
and marked __nosavedata, so it remains clear on the restore path.

Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
Changes in v3:
- Split the in_suspend cleanup into a preceding patch.
- Clarify that callers must account for poweroff/shutdown handling.
- Drop extern from the new prototype.

Changes in v2:
- Rename pm_hibernation_storing_image() to
  pm_hibernation_snapshot_done().

 include/linux/suspend.h  |  2 ++
 kernel/power/hibernate.c | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index b02876f1ae38..2cebbec3e2f7 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -393,6 +393,7 @@ extern void hibernation_set_ops(const struct platform_hibernation_ops *ops);
 extern int hibernate(void);
 extern bool system_entering_hibernation(void);
 extern bool hibernation_available(void);
+bool pm_hibernation_snapshot_done(void);
 asmlinkage int swsusp_save(void);
 extern struct pbe *restore_pblist;
 int pfn_is_nosave(unsigned long pfn);
@@ -412,6 +413,7 @@ static inline void hibernation_set_ops(const struct platform_hibernation_ops *op
 static inline int hibernate(void) { return -ENOSYS; }
 static inline bool system_entering_hibernation(void) { return false; }
 static inline bool hibernation_available(void) { return false; }
+static inline bool pm_hibernation_snapshot_done(void) { return false; }
 
 static inline int hibernate_quiet_exec(int (*func)(void *data), void *data) {
 	return -ENOTSUPP;
diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 6d3e637c5a02..045d29f55011 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -113,6 +113,18 @@ bool hibernation_available(void)
 		!secretmem_active() && !cxl_mem_active();
 }
 
+/**
+ * pm_hibernation_snapshot_done - check if a hibernation snapshot is available
+ *
+ * Return: %true if a hibernation snapshot has been taken and has not been
+ *         released yet.
+ */
+bool pm_hibernation_snapshot_done(void)
+{
+	return !!in_suspend;
+}
+EXPORT_SYMBOL_GPL(pm_hibernation_snapshot_done);
+
 /**
  * hibernation_set_ops - Set the global hibernate operations.
  * @ops: Hibernation operations to use in subsequent hibernation transitions.
-- 
2.20.1

