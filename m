Return-Path: <linux-media+bounces-59774-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HMtNOpq8GkITAEAu9opvQ
	(envelope-from <linux-media+bounces-59774-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:08:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC1547FA07
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC23130231FF
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810052D46A1;
	Tue, 28 Apr 2026 08:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="AGDli7+k"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2D43451B3;
	Tue, 28 Apr 2026 08:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363573; cv=none; b=uZZVcLuVnk6Vl1hyrtEJyxqB9xuFzzNHIQuOaHs11lvGOD/SPajF/N/+QDM7UeAEpC5RGyITZxdsvH9PdFT4w5m9ALXJGzV1o+dAH19e+PXuXUB1r7NC3zm3joQOszNc3H12XqtUW+5u5seRPq6tafFeuTlo/epN0HZQI4cZYSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363573; c=relaxed/simple;
	bh=OYob8fSUnpI9y6Gvd+dqzpKjsH6b68SDcumXg9R7qxQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UQbaLpsgJOz2a7VIBdKb0F9BfnGL2sM3J8rGrczph2K3n5HK9ugZ3DeHGWsSTToAlxcFh7Dwvz4qqxz7+/gQglMKfZvE0m6ZzfQOqDuPCecIYGdPkGFZRSXqBtrFRhkCS9NPTJ8dC0vTAY2zbIBzb37vgMCLPJWE1uUkBy5TfMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=AGDli7+k; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777363555;
	bh=zCCooQNkuhbrhVqN/DKbRXTuGY/qI92cGD/gbm9ZT8k=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=AGDli7+kqHXmhASE7qIhkAKrcfK1Ne0MZqIKJyOBygbrALo+tz9hO6oYJ/mXWO1/2
	 STKX9N5QgYZ7jjaYIUdlqI6FezJlQ10ouLNW1Qu6mdeWsFIiyYOxOhlptrVnyfXHTl
	 sIkKWcR8FBmO6loYrrrKVtOafd+JmRDKP86p06aM=
X-QQ-mid: zesmtpip2t1777363550t3c09782c
X-QQ-Originating-IP: D7QBc+Gq/wa23NcgnaXkDpaStXRKIJCGv/NNNT/U82I=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Apr 2026 16:05:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11922991574654543991
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
Subject: [PATCH 2/2] media: uvcvideo: skip resume when writing hibernation image
Date: Tue, 28 Apr 2026 16:05:13 +0800
Message-Id: <20260428080513.1833515-3-tuhaowen@uniontech.com>
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
X-QQ-XMAILINFO: OUKBLrr/x8hbTTvrmt755Oqiyj63BMUepaw8In70Sh6KvjazYshk3JOo
	ykx1+fjrRqjJXuYNR02Hxn39PcNxOjjt161UTro6TSzdgUo1vbtRSTIpPzzoHUpit+gTAbf
	idUfyUMyeAvMLhxSi8PA1CELhmLN/RySXJ30I8s/d+i3ApyiQ1pIGd7X7PeIo6qyPEcxNbK
	V8Ex4xBfHWtjEJUe/yUldqt3rMZZlRIYaKFB9da9XwVGgYP2CS/T3OjWOu3+ZYeR4V1B6lW
	Zl/r/8/uhJrVeOU1eFWmeNcOJUwwjgS6iqLbhPZo7QJDFPFUIaBv31wS6mCdwDiGiYu646i
	WIIFoXCjMp7q4qSytST+nu0muUAM6suhjlDVkpu/xoZmqYar9krpKm9w43pPu1Tb95rCKot
	mW/I9mFi9xqREeafwNV7m26M3mWo2r2L4054cK3hO/uiS8FlOMMr3hAsPfDkgmugghH/WLM
	GuQpt23I/ilqqXl2X8+eaEwAWpl+RzDa+YHbf+cYNV8YhLFOORlFuvg+Mf8LYcqTQRR5YPZ
	FBy0QcJXADchH6YRJLKzXX/HjI4Rn7j1bW5aXIAf/Utm9nKXPQZ2ukbiOs5+GI2K5j5cDZJ
	WMR3gp4uxmyOx953YMEM1SYvHNT+3f1AmtP1Lw3vCQIS1AxehCNOVMx95BG5msQPHiqxKvk
	nimtVkpxfZzH8aLabs4FFIDBTd7csIEpJUm//jX18Q498nMAuOKg0VyaDZDlGJzhT+0dmN1
	roFG2DTwS5t3J5UQbA1rLqLAvCiSw+sarFTYZaotjJOomzTWz+EBeRLR3g7lj1wtICJb/eB
	fPvKs124otyTER+8SpEC0lSJR/GFyhoRgmIyuhxvJdNw+u8l05FOnSYjKZoedxEjdy65H5K
	ph/8P/exUeEmivPJcw78T0x+FqgVm26zJi7ktVHVYJpmizF1gj2eEWw1j+yg9YpBk9YSlYe
	PKd1rA9rOi2bqcpWQF1aObQDvZI34y208vIHYoM9uFk7NrubeT6sR0K2PkTTW8549RFPWCe
	gq2xKvZBMbZUelMzOVA45/HpJs6Kkst6kXUbHREfXAlLqr75/iEKHUS6lSffQ=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: BDC1547FA07
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
	TAGGED_FROM(0.00)[bounces-59774-lists,linux-media=lfdr.de];
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

When a UVC camera is in active use and the system enters S4 hibernation,
the camera is suspended as part of the normal device freeze sequence.
However, after create_image() saves the memory snapshot, the kernel
briefly resumes all devices with PMSG_THAW to write the hibernation image
to storage.  This causes uvc_video_resume() to run and reinitialize the
camera hardware, which visibly turns on the camera indicator LED during
this intermediate phase -- even though the system is about to power off.

The UVC device is not needed during the image-write window, where the
system only needs devices required for writing the hibernation image.
USB .resume callbacks do not receive pm_message_t (unlike .suspend),
so use the PM-layer helper to detect this phase and return early from
uvc_video_resume(), preventing the unnecessary hardware reinitialization
and the spurious LED activation.

Skipping the THAW resume is safe: stream->frozen remains 1 (set during
the earlier FREEZE suspend), the device is powered off immediately after
swsusp_write() with no intervening suspend, and the subsequent
PMSG_RESTORE resume on the restored kernel calls uvc_video_resume()
with pm_hibernation_storing_image() returning false, performing the full
reinitialization as normal.

Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
 drivers/media/usb/uvc/uvc_video.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index f6c8e3223796..16a911b684d5 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -12,6 +12,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/suspend.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/videodev2.h>
@@ -2135,6 +2136,15 @@ int uvc_video_resume(struct uvc_streaming *stream, int reset)
 {
 	int ret;
 
+	/*
+	 * After taking the hibernation memory snapshot, the kernel briefly resumes
+	 * devices with PMSG_THAW to write the image to storage before powerdown.
+	 * The UVC device is not involved in storage I/O, so skip reinitializing
+	 * it to avoid unnecessary USB traffic during this transient phase.
+	 */
+	if (pm_hibernation_storing_image())
+		return 0;
+
 	/*
 	 * If the bus has been reset on resume, set the alternate setting to 0.
 	 * This should be the default value, but some devices crash or otherwise
-- 
2.20.1


