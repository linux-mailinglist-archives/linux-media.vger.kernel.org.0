Return-Path: <linux-media+bounces-62944-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMKSM/v7F2oTYQgAu9opvQ
	(envelope-from <linux-media+bounces-62944-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 10:25:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4A95EE84E
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 10:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5DF4A309BEF0
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 08:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F29237883E;
	Thu, 28 May 2026 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="UPoGZUCW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5453F2571C7;
	Thu, 28 May 2026 08:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779956368; cv=none; b=M2STwJu8Dv+3DhXH+l59RegMIsgj7Biz+zjE9POrumPwAkHf+Z8Hg7uITZzS902Lsd8yNZjYipRKAQCV+/mxQv1Ul6chM5cOo4Gyk3XXaG0rrIWY7t8g7O9+GTbj2tvnrVm9RNChYsG+hiOxeia3hWXFOw390u18YWnAFbFmz30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779956368; c=relaxed/simple;
	bh=MLatFh+ITEgavEN5ELhODVOrrueAp2v6chz36/OYIfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u6xErf/cIm+Zp8jBJqhJfbVM+pVfYYEnH3SofjzAJcIXEg1HlDuhH6LsUngR751VCgWHAXMljt7YlFZA0zG0kukBgFDrXgSeOJNxnnmRzmBuPlTL0f0wd0Iy/jC1CV26+2ye/tYCHRVnhZU1oKCvyjSBod05FH1bg7SmECLIq30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=UPoGZUCW; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1779956363;
	bh=oeURz6oicc+pZP9AWLhlYv7MHtn2iU5Ne4XKIeL0nIc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=UPoGZUCWSPekYr5V/OPXEZDb4Up4tHhT8ZmgXB04zWiajDnu0f0lXi6iHdRHo3z6h
	 mlroBJ48QaFss/GBpMLB5nRpD46uGS8spiFdvy3dSW4ZKGT+TEq3WXkcQvpUnnT4jq
	 6fpTv8RgaVj0N2XjQOXlGXTb18rFC+13t1DEG5VY=
X-QQ-mid: zesmtpgz3t1779956349t15de0229
X-QQ-Originating-IP: SYALA+0AfiCbbM+XpXJbIjiqmJcJglSmxfVd4eUuncE=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 28 May 2026 16:19:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10008302796186427878
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
Subject: [PATCH v2 2/2] media: uvcvideo: skip resume after hibernation snapshot
Date: Thu, 28 May 2026 16:18:40 +0800
Message-Id: <20260528081840.3528089-3-tuhaowen@uniontech.com>
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
X-QQ-XMAILINFO: M1v+UkG2MoDhCQ3lacNFWoCDrJnYJ5B3tmDdimcXIgaZwyiSgngjOLmD
	mQEbX3CeVAzjBC4FzfP00rCgV9FQZ+QmDE7xu4mMmJRAG4vYd8VYpxSxccpyruECF7/3pKc
	JuRF+GJOjNc3rBcGDDZJW0Gf9Ou3nxfQ5xs+MVC7Sl34tfE7ELOJ2Kraal0lN+YhHUyQicq
	Lx94dkSNIOv92oafEIWMld19YWIA0lR+qocNdyLGzVSAoc5B+JPfxM226GVTQoD9TcvGVaK
	nBkOy1lEHnD4aOc7vji531GBCKmg8n8WcyL72Ah3hiAZTfvpymYY7omDj5Re2Zx436QQrU7
	fatfUt3EifvQ/x4MHZa2m1hqinZ1c19bMsINPrWeQ/hBuGHvZmOxCTGmHSVgntez46cqvxV
	9H9YrfcGKyX7XUWH6+e/ocm6SIoKamYdTFqy4PGBjvuRqtqxy4waQ5W0Cq1Zr8k4GbELftu
	h+ZE4gThnjzB15lSPWOhUJGHn3wGcJqNnNFfLgf3KodfEHRKmu0hJabcL9ESvXLf83/voC8
	17sqmcaA/dzMYo3zLmr98kNPsEOEb8fxc7Br847qvymc0N/KbX3983URYf9nI7ix3SMWjyN
	O8UjEYEt/2y6PvHDF/FjPakE89YuHBLUBU+LbQPWsTRAwjt4gyWOfuBaTRGUCL/7sF+yHAr
	6DtT+Ku7AlXCx12kBlysgdveTGh2x0bJqTs6ry/FSZPfOD5rAGPWdxWi6Pk9TiaGgLvTtgY
	aF+Fyvq2Uwb+dAKEdC8xOwmnuIpHMR9ZZtoecCUf+uT5t5mVrlp9Y+peqZezaOYOfGRKXVY
	7WIVtT3Q1A0T/EtgDTGWrjMnuINJxIANqCGINnLn2QUY4tHYFMEtwGlCTW1JQ5FlLv+ADrw
	2erg01hfhceUMHwz9bWqX/h5K87SVWJla7oa3pNi0f2D3O+7sNAVnoyiYOxrza1uZj+1w4U
	VwLVqMcM+0jd+6fr6fX7HDZ6q8c23P8ioiTU+CDt2zTCBdJeaswnHJ376CNqMmbbglsPn0y
	KEKHQhT4io61twSqypHRh/F9cGabCrRLbzpFQAaKhluk9aKbC+oDMdva7yc9HaVTboUaAs0
	XBDr6B3dJZY
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62944-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tuhaowen@uniontech.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[uniontech.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: CE4A95EE84E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When a UVC camera is in active use and the system enters S4 hibernation,
the camera is suspended as part of the normal device freeze sequence.
However, after create_image() saves the memory snapshot, the kernel
briefly resumes all devices with PMSG_THAW to write the hibernation
image to storage.  This causes uvc_video_resume() to run and
reinitialize the camera hardware, which visibly turns on the camera
indicator LED during this intermediate phase even though the system is
about to power off.

The UVC device is not needed during the image-write window, where the
system only needs devices required for writing the hibernation image.
USB .resume callbacks do not receive pm_message_t, unlike .suspend, so
use the PM-layer helper to detect this phase.

This is intentionally handled in uvcvideo rather than in USB core.  USB
core cannot skip all interface resume callbacks during hibernation THAW,
because some USB interfaces may be part of the image writeout path or
otherwise be required by dependencies.  uvcvideo has a concrete
user-visible side effect from reinitializing hardware in this transient
phase, and it is not involved in image writeout.

The check is placed after stream->frozen is cleared and the clock is
reset, so that driver state remains consistent if the image write fails
and the system resumes normally instead of powering off.  In that case
userspace will need to restart the stream, but the driver will not be
left with stale frozen state.

Tested with hibernation image written to local storage and resumed from
disk on a system with a USB UVC camera attached; the camera LED remains
off during image writing and the video stream resumes correctly after
restore.

Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
Changes in v2:
- Use pm_hibernation_snapshot_done() after the PM helper was renamed.

 drivers/media/usb/uvc/uvc_video.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index f6c8e3223796..9fa649fd47e0 100644
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
@@ -2151,6 +2152,17 @@ int uvc_video_resume(struct uvc_streaming *stream, int reset)
 	if (!uvc_queue_streaming(&stream->queue))
 		return 0;
 
+	/*
+	 * During hibernation image writing (PMSG_THAW), the kernel briefly
+	 * resumes devices after the snapshot has been created.  Skip hardware
+	 * reinitialization to avoid USB traffic and the spurious camera LED
+	 * activation.  stream->frozen has already been cleared, so if the
+	 * image write fails and the system resumes normally, driver state
+	 * remains consistent; userspace will need to restart the stream.
+	 */
+	if (pm_hibernation_snapshot_done())
+		return 0;
+
 	ret = uvc_commit_video(stream, &stream->ctrl);
 	if (ret < 0)
 		return ret;
-- 
2.20.1

