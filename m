Return-Path: <linux-media+bounces-59773-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLMOMedq8GkITAEAu9opvQ
	(envelope-from <linux-media+bounces-59773-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:08:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A1947F9F8
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 301283022D82
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BFB34F48F;
	Tue, 28 Apr 2026 08:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Aye0e1UH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C08433FE02;
	Tue, 28 Apr 2026 08:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363573; cv=none; b=o2NlxmpDoWfPu52V/qnrpQZCWXRmZ5R2xuQzA4ZObsDZGwinBvAOJ88NdS+FAnqYEkT+2fyuZpsdDHL/lobJEeHs0sUwSFXbo1vkg5nPJwPKRUABh/qp21dRJbWT7Gvbeaa9d4o9+IBMTtf00Qxia+KYA6FXo2TCAI5X0pKbSk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363573; c=relaxed/simple;
	bh=Icyu9mDyR5XC6EJ+fw6HwbZeEumToytyMGuJSUYBJjM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IT+t/OQAh4/IrpS4LplmK/k2EATVtjneHjpH5zxR0xj59RvohAMPTb6Z2rYP4ock1WI9h6PI82vtzMg/IJKcyKdbOV/HD4sEqoOImzKbUVFXtSVTVFgL+EGd29F+GxRbizpxDb2jphdDw8hQDB4ndDN5B5kXm8as7boyvjhsMco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Aye0e1UH; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777363550;
	bh=1RR1YtVSBXfVSJxUBB2AKFR+yLwoFEUBMjDD17hxsj0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Aye0e1UHPypow8bO7Ki7AodHq8zTZuDSDKUM/cwcSnOumDOJsIGIVbV9F27/wPHcc
	 RYUouvPMdqISa8wWAPmspoOCZNpMRbhBjv6KkYXTQSvUBTrOtcVJ5//TRL4bO4CT6T
	 PSbDQ8S8Ie1XgzbY33zCUpKr8Odk30q3h+TFraZ4=
X-QQ-mid: zesmtpip2t1777363545t07a96599
X-QQ-Originating-IP: zOGsRQ4vEgqT/NE82VSDH4QQPothkDoKChOOIb4l5hM=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Apr 2026 16:05:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9221135693376165927
EX-QQ-RecipientCnt: 10
From: Haowen Tu <tuhaowen@uniontech.com>
To: rafael@kernel.org
Cc: lenb@kernel.org,
	pavel@kernel.org,
	linux-pm@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: [PATCH 1/2] PM: hibernate: add pm_hibernation_storing_image() helper
Date: Tue, 28 Apr 2026 16:05:12 +0800
Message-Id: <20260428080513.1833515-2-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260428080513.1833515-1-tuhaowen@uniontech.com>
References: <20260428080513.1833515-1-tuhaowen@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NuC7ko3X4dcAdQNq9HLYhUpihyKysUA6+YWdUUw6uk2TV/K61ZfnQPXT
	PPXiriyUzNmpcg10jp6N7S7VB1vDFx2tSVIbOAX6umdR4ghBm4LyM0UA9wpV5tG1m/NmTfC
	WX8I52/JZ2NFXVSMF8X29Jy8zaWnZwgJYIo4edNUbqrI/H56AZUuS+PXXcG3yWj24eJwpNX
	4DNntdGHfhovxWy29vTEey5Het/ryW3msqIp7KgiebTTXkigbcvsOB0OE6StlRj/1e/YTFj
	AE1V6RsCY5sCkq0EXWBzZDSd7DRvoFlqP1u7ACHqeAtcvrzx+dWWhxUOMvjAIzvg7JJyu+u
	wT6SEt+r2v5/Hu0sEiC0WgwVoRQOMtnEcyPT91pCneXPvWbfiw7SkpCdGsM21TUfPI0FEu+
	FtzoU6bY/liqIQV/U0HQH1Mm99FYd1byv8ikdytSFjm/w2TWBXA+olKSTfupkCZDRxDaF4v
	ZiOeGFAY6WHc3598t1KDcqeNzjQ/6VH0miygdpmZSK8YBqJXSJrdy7kEzWZMTO5bH9PVX43
	DR8/Pw5AiRJdYgOx4Y9khQxIRW2WW1bLmGPzMGCAsHsLfknAMZJ8pgOCg3peYO1OitnpjSD
	QM/Bk3vc82W/nPxns883KUHcrAFTVNw8Y/RcbD31p+5TQtl0fCnt6ov1gW+vFE7OeM7Bdsb
	97ZIjgIFWOmFquXGBhMU5Ij5kaRWm+21yAfkb6P/7PIyTPqY3ySzgriipz5Uf1++K7PD9Rr
	0ltVtvTU279HozQsVX7mP43C61/vYB5jNX8x7bb3icw5biK3342VtysGKYxkTkfyhPjkVRR
	sFev8YNe12N6FtxlqRu6QKC0X41nUsm2k6QsBWhefg5U82JHYC+1s3WA8O/64YHYAByco1b
	+WSFn9zd3vy/8S3Aa2BX0Ttsgce8wKvcDINiqmGSwAfUobaNU5K0gRkl2PzmpCfZEeBU1jT
	RL5igejYIujzQTjdKZCtzHWYcCofHDxc+aCFltS1ebXUG43LISrB0e4KQwopnkWET83e7Fd
	IObcWZ7NEcjz/WfEDnNmbbj5uCaRfKe3bODhE+ez04rqLlhVIA
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 64A1947F9F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59773-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tuhaowen@uniontech.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,uniontech.com:email,uniontech.com:dkim,uniontech.com:mid]

During hibernation, after create_image() saves the memory snapshot,
the kernel resumes devices with PMSG_THAW solely to write the hibernation
image to storage, then powers off.  Drivers for hardware not involved in
storage I/O have no reason to reinitialize during this transient phase.

Some subsystems, such as USB, do not expose the hibernation PM message
to driver resume callbacks, so drivers there need an explicit query to
distinguish the image-write phase from the final restore path.  Export
pm_hibernation_storing_image() for this purpose.

The implementation returns !!in_suspend, which is set to 1 in
create_image() just before swsusp_arch_suspend() and reset to 0 in
hibernate() after swsusp_write() completes.  Because in_suspend is
marked __nosavedata, it is not saved into the hibernation image; on the
restore path the variable remains 0 throughout, so the helper correctly
returns false during PMSG_RESTORE device resume.

Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
 include/linux/suspend.h  |  2 ++
 kernel/power/hibernate.c | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index b02876f1ae38..28b454def83d 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -393,6 +393,7 @@ extern void hibernation_set_ops(const struct platform_hibernation_ops *ops);
 extern int hibernate(void);
 extern bool system_entering_hibernation(void);
 extern bool hibernation_available(void);
+extern bool pm_hibernation_storing_image(void);
 asmlinkage int swsusp_save(void);
 extern struct pbe *restore_pblist;
 int pfn_is_nosave(unsigned long pfn);
@@ -412,6 +413,7 @@ static inline void hibernation_set_ops(const struct platform_hibernation_ops *op
 static inline int hibernate(void) { return -ENOSYS; }
 static inline bool system_entering_hibernation(void) { return false; }
 static inline bool hibernation_available(void) { return false; }
+static inline bool pm_hibernation_storing_image(void) { return false; }
 
 static inline int hibernate_quiet_exec(int (*func)(void *data), void *data) {
 	return -ENOTSUPP;
diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index af8d07bafe02..bc632cce40ff 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -113,6 +113,25 @@ bool hibernation_available(void)
 		!secretmem_active() && !cxl_mem_active();
 }
 
+/**
+ * pm_hibernation_storing_image - check if system is writing the hibernation image
+ *
+ * After create_image() saves a memory snapshot, the kernel briefly resumes
+ * devices with PMSG_THAW to write the image to storage before final powerdown.
+ * Drivers for hardware not involved in storage I/O may call this helper from
+ * their resume callbacks to skip unnecessary hardware initialization during
+ * that transient phase.
+ *
+ * Context: May be called from device PM callbacks.
+ * Return: %true if a hibernation snapshot has been taken and the system is
+ *         in the process of writing the image to persistent storage.
+ */
+bool pm_hibernation_storing_image(void)
+{
+	return !!in_suspend;
+}
+EXPORT_SYMBOL_GPL(pm_hibernation_storing_image);
+
 /**
  * hibernation_set_ops - Set the global hibernate operations.
  * @ops: Hibernation operations to use in subsequent hibernation transitions.
-- 
2.20.1


