Return-Path: <linux-media+bounces-62945-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGDaNZ76F2oWXwgAu9opvQ
	(envelope-from <linux-media+bounces-62945-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 10:19:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDC25EE727
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 10:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA9583054F5D
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 08:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230E03793AD;
	Thu, 28 May 2026 08:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Y7mtK4/m"
X-Original-To: linux-media@vger.kernel.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.67.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAEC348C7E;
	Thu, 28 May 2026 08:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.67.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779956368; cv=none; b=YhGnhbqPw6To0H8YkkqbV/0uPeDOwFjQ8DZozOCzQsqnSk8YrxdYolQfMLU4fCoC7LgHMbYESEiWOGbPkneuUVd6xVOf/oxEB/tJFrERDLhOpg/dWtCfBrtjn95EdOCse6hxlwow168HANqowe4R63eFWAqJOA8Ny6rsEnSEB/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779956368; c=relaxed/simple;
	bh=nAVAHsXso3C/0PsJj5P60FI82/FmYb+nqnvDIYEgvvo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q6QoR6qjDerYQ2CAx8d5DFzKVQToMVGHfK+hpZK3N9nfZNJqyclkWZgCaFDzH5Kbjca/qxhW2KWJZ7Ie70nrN0GKh3NazmA09fAigtOzbPg98LuATAJdlX6T9ex+P8o5NhBbaAhdvmAuTkt+YynyUkLQDs7oWUVw5gU8ozLoH5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Y7mtK4/m; arc=none smtp.client-ip=114.132.67.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1779956354;
	bh=hTfKHFLpQr6Uxul1FFGZN32A4tJE6awvwOwRmFziUKE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Y7mtK4/m5NPfiouT/AWDoaDCV+abLgbfMkDljpyj6d+bDkG8gpFfb7k4QrU5fgOj0
	 HTjWDQ0lc0IXDIwJ1Dbhs7PbUGr0UmVawNdBVhSfPC5ymZqWF65a6OAKrZV5Zl8tFp
	 hsL1nRWmN15lW9b20C58TdXXgSezsWNrTarmZnlk=
X-QQ-mid: zesmtpgz3t1779956344tbbf05453
X-QQ-Originating-IP: 8iWOHWTPwmeusF4wCfttTXj2BiriBmDGHpk8HJ2MsI0=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 28 May 2026 16:18:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17934321688194046005
EX-QQ-RecipientCnt: 15
From: Haowen Tu <tuhaowen@uniontech.com>
To: rafael@kernel.org
Cc: lenb@kernel.org,
	pavel@kernel.org,
	linux-pm@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu,
	oneukum@suse.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@uniontech.com,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: [PATCH v2 1/2] PM: hibernate: add pm_hibernation_snapshot_done() helper
Date: Thu, 28 May 2026 16:18:39 +0800
Message-Id: <20260528081840.3528089-2-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260528081840.3528089-1-tuhaowen@uniontech.com>
References: <20260428080513.1833515-1-tuhaowen@uniontech.com>
 <20260528081840.3528089-1-tuhaowen@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OK3+qfAWNAgAnjmDS180e3eqdpUMk11cspPagtwEf5j8szBokYyicW9f
	+auil4skjVabVyt9gxE9hv8UfgdJle+lY0mHzuvIfjg/5oV3qZIxTN5M8UT2DVpVvPSKXit
	/4PqkZrgbgkmA/4FR7flM0Po1WvREmkUt8d4WhNMf7JdXZED2nvPPEIi8v4v0qwdzsuJpDj
	O87VuJDx4Q2nQqjPygVfH2k9lkQCoa9eXuMOOz6kyCw4huyx3UzHZRZXbiCTKy2QhmmpFah
	nSyv8Pr8e3DRSSEBmtPYIvoc0VE2j9s9JnAXk9167IJBPkFCu9qb+BrLd3BqDlmhHPz+tei
	JbsQbnmilE7BTiIAG5oCOsjLpVqYW1Do6qeih+OuJx6Yta2ZBpH6opyM4vvu/h3p+4Z1bUD
	gt+NIzkCsGZFXysWtlL3QpixHKrw9jDcEP9EMhzCph0mlSCGTIJYkAkXV2OYTb0z5bds9BV
	rjFdfq+CjJjxZRQjIWFh1msPKRuq6Y7yGbV0qpnmzJPwOHXdH5Tr7YNFLLLXsUt0JdNQGqa
	0cS8jttsQTaqVSRvafo4OZNLtk7fbehIbqyFvbdjzgqwnSvGAP02rDwA1/HWxOEErz3YDrM
	qwTPv/SWyxYaBIVYU1tfTtKpIkxOBlEnJWdkKABl7n/XxrD0YxD0A9ZZcYLWxNtlyCjsApS
	D86k82sOmwja2CCwoLpMLTifFDEG6L4kmhufhJqN0D74+F7XPHPM0fBATw9oRMNpqt69jvc
	UqOAs8UZ2whOILhQljbV+aO71TBofMGuKVyzU2XTlZSLyxQFnJAduZA4QMUHAV0HTQt3rK1
	uZRpDaskzDWEbpN22lTTjOjnsQT80Af4rUqI3e0yDp3sbM1rkMHFMZ/i6hvGuDqWicqiGAu
	tdgJZK5yXZQhGm6T2jNfFUF4+KJiZcYQbbMJU7DQzpWlGdzOgv+bZCen+YbDg5xDsomQ/+b
	eaFcwWu59mVjsISioLgWRZV7qzQD/GcVtNv9dLqfl+rz0Q5ZKs5+3oAyLeMErBJTFda+YLC
	oBi1pQJm7O8cdyld6T0rAvJriceAN7LBARtBEeNEwIM6wjXnYkxf4C7CegbiUs2NzZtjYPk
	vclPsx6Y3I4x5LJGyhP2k4=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62945-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tuhaowen@uniontech.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:email,uniontech.com:mid,uniontech.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7DDC25EE727
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During hibernation, after create_image() saves the memory snapshot, the
kernel resumes devices with PMSG_THAW solely to write the hibernation
image to storage, then powers off.  Drivers for hardware not involved in
storage I/O have no reason to reinitialize during this transient phase.

Some subsystems, such as USB, do not expose the hibernation PM message
to driver resume callbacks, so drivers there need an explicit query to
distinguish the image-write phase from the final restore path.  Export
pm_hibernation_snapshot_done() for this purpose.

The implementation returns !!in_suspend, which is set to 1 in
create_image() just before swsusp_arch_suspend().  Because in_suspend is
marked __nosavedata, it is not saved into the hibernation image; on the
restore path the variable remains 0, so the helper correctly returns
false during PMSG_RESTORE device resume.

Clear in_suspend before releasing snapshot memory on hibernation failure
paths and after swsusp_write() returns, so the helper does not report a
stale snapshot after the snapshot pages have been released.

Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
Changes in v2:
- Rename pm_hibernation_storing_image() to
  pm_hibernation_snapshot_done().
- Clear in_suspend before releasing snapshot memory on failure paths and
  after swsusp_write() returns.

 include/linux/suspend.h  |  2 ++
 kernel/power/hibernate.c | 31 +++++++++++++++++++++++++++----
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index b02876f1ae38..78e7e33c3d19 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -393,6 +393,7 @@ extern void hibernation_set_ops(const struct platform_hibernation_ops *ops);
 extern int hibernate(void);
 extern bool system_entering_hibernation(void);
 extern bool hibernation_available(void);
+extern bool pm_hibernation_snapshot_done(void);
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
index af8d07bafe02..47047937e262 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -113,6 +113,25 @@ bool hibernation_available(void)
 		!secretmem_active() && !cxl_mem_active();
 }
 
+/**
+ * pm_hibernation_snapshot_done - check if a hibernation snapshot is available
+ *
+ * After create_image() saves a memory snapshot, the kernel briefly resumes
+ * devices with PMSG_THAW to write the image to storage before final powerdown.
+ * Drivers that do not need to participate in image writing may call this
+ * helper from their resume callbacks to skip unnecessary hardware
+ * initialization during that transient phase.
+ *
+ * Context: May be called from device PM callbacks.
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
@@ -418,6 +437,7 @@ static void shrink_shmem_memory(void)
 int hibernation_snapshot(int platform_mode)
 {
 	pm_message_t msg;
+	bool snapshot_done;
 	int error;
 
 	pm_suspend_clear_flags();
@@ -474,15 +494,18 @@ int hibernation_snapshot(int platform_mode)
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
@@ -865,6 +888,7 @@ int hibernate(void)
 
 		pm_pr_dbg("Writing hibernation image.\n");
 		error = swsusp_write(flags);
+		in_suspend = 0;
 		swsusp_free();
 		if (!error) {
 			if (hibernation_mode == HIBERNATION_TEST_RESUME)
@@ -872,7 +896,6 @@ int hibernate(void)
 			else
 				power_down();
 		}
-		in_suspend = 0;
 		pm_restore_gfp_mask();
 	} else {
 		pm_pr_dbg("Hibernation image restored successfully.\n");
-- 
2.20.1

