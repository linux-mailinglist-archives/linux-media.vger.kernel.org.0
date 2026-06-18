Return-Path: <linux-media+bounces-65149-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q57YKaNKM2qa/AUAu9opvQ
	(envelope-from <linux-media+bounces-65149-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 03:32:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5745469D03F
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 03:32:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=c26MEkLL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65149-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65149-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 485B230F59A7
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 01:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4014C2DB798;
	Thu, 18 Jun 2026 01:32:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF1A2D9EE4;
	Thu, 18 Jun 2026 01:32:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781746335; cv=none; b=XiT7jasN7P2ofBtIqteLcnV7yOAerZn5apV09pWGEzDpgw9gUgmvaX94dOtcdkw2vi7Ke9179s4Veszb+ETcJTqoKfSDOAYjzfrBnM3Cf54FehWpGI+6YaH1Q/63zMGrPF43f4GUtA36EAso8m0J98k/cfo+fKU6SbrkuaocTRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781746335; c=relaxed/simple;
	bh=2gr6RnPWlqfowu2APd9UT+JaBUmNi2S9q1Qj8h8PPWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ID5mJ0Keex3lMip/2D0YuM+FD1s9SZybT234vni/HJSEZRMcDdd/+4qGtmVXvz6G2xd0nal5IoN5VBUAKjTbJBlmTElnYYj/eeet3UYIB1BUoLgCHh+ViAFUePEQdnopUDNFYsAFcTljdWMSZwiCAbK2HjsgvAPb7aRfsj80IKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=c26MEkLL; arc=none smtp.client-ip=54.204.34.129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781746329;
	bh=IJJqRoaJn1UGNs+9V5J1PVXcLQf6UF9/UcB48PE0U4M=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=c26MEkLLzc4B6JI9ktoaQunXCSmtDX3dGaCiTsCx9V3t+xam7d9FTnwHQfVMMlU9w
	 f2dQ+sdLuaajOFGfTVxqV9whyOKZxbVG9AO/xWDO87cZyqstqzxlvGzB6jYT2JFdvm
	 vSAHexN7fMH6LDdoS3RDkB8PNKsMiqf3+2zbNRy0=
X-QQ-mid: esmtpsz10t1781746320tc3798f72
X-QQ-Originating-IP: lrrYilJAl45jPMuEjtLcMdeb/zzIeyM440DdwcO7wec=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 18 Jun 2026 09:31:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1632563843144384507
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
Subject: [PATCH v3 3/3] media: uvcvideo: skip streaming restart after hibernation snapshot
Date: Thu, 18 Jun 2026 09:31:33 +0800
Message-Id: <20260618013133.1047270-4-tuhaowen@uniontech.com>
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
X-QQ-XMAILINFO: OYMEOeTae7ml0htRwYqZzVrpBuOjNfauwX4TaBEmwv1BlxDiACpfk67E
	KE4ZD6pgn5JH7cJAaUc3zX07o6RXF4MTX6wGEDOeSTO6NE3wGfvhy3Btgwsf60GhEegc5x7
	5ung55hp+wKpiFfqaHS4byfvbtSraKHf6sVkthC51jyT+iGHytLgmQ0BVi4HfC+7XGcVPPm
	YMLYzXVCg6bd1/22B18VnkfLr+iBTeI60/kNn5gVngBu5jNJxWalX85qLC/neoj43G7VGwf
	qtdd1odJOgDWVHKYBm0SGn3kimAgZ5gpX/gcTTGNLQEjqcsBsIpxR0FqSrcdihiqD+cFih0
	LEndi0hdWxWwSDd6pqkV9QBzZ6ywATsLfP5fMtDunAXpejBeqPfECqRkeSks4pWHdSgDi8o
	tZOX1zk9yyC6tiMCeoCkBbNCQ9XOqFnbs1XIuEm06wtVFy1GBb+YhXp9+rFki9XewQn3KeO
	KzOd5nKrc7rJ//iDF5j4CSRMdnxCI4qod7XE6p0PcCmQ7/BAjEEUIUWzsaVLtBMg86or3iN
	ggKzoON27msX4VwurT2xHPkmKy5hnor+2bdhf3Aq8iNAKrNZNhCTlfnCIE9Y5gAM0OzbsVJ
	G4loAP7mVacNJOb+wS1sFzA3pk/KnQlCHWlvsP7eY3y6UXcrBdwfK4tulm4ZsyJd7WgaMMv
	7KOA5mv94Wu/msS6syKzvE9UiTqFjcMlP9+8xSohA70opl0bbY7akACBFKcEFSqwR3WYEwM
	8ypey7hNHih7PIpjIAkHOKbvXRKTI97ZD1uBO//rfpfRDzZu65WzpYnFyt4EQH9mbZnEU6c
	o1ovhPeaT531/Z357llmJDrIkP9igKFqPONRBxLHSha2agpLgrxPZhkkwD6SoUv5zQvlkYL
	c0bnnrgs9G6nIWuEhPQyJaEU1sJMwpy/Nv9fSFHIoqWVI6ec/+B8N9TNn368ePvAcMa+N5e
	EQVMH3HM69NefKod/d9laUK1W8Ks1tZaOhVdla8KZCQzZyCm0cTnAnD/2z46FgziKZUhmUL
	Y6KKGxy8/txpK5fxpX/YBRge0MdJwgbXZ7lL1v1QuJNxwFTIOTHbX8F1WR3v8=
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
	TAGGED_FROM(0.00)[bounces-65149-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 5745469D03F

After the hibernation snapshot is created, devices are resumed with
PMSG_THAW before the image is written and the system is powered off.
Restarting an active UVC stream during this phase reinitializes the
camera and visibly turns its indicator LED back on.

Skip only the UVC streaming hardware restart while the snapshot is
available.  The driver's frozen state and clock are still updated before
the check, and a subsequent UVC suspend can stop the stream and select
alternate setting 0 as usual.  uvcvideo does not provide a shutdown
callback that requires the streaming hardware to be restarted first.

This is a device-specific use of pm_hibernation_snapshot_done().  The
helper does not cause other drivers or USB core to skip THAW resume.

Tested with hibernation image written to local storage and resumed from
disk on a system with a USB UVC camera attached; the camera LED remains
off during image writing and the video stream resumes correctly after
restore.

Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
Changes in v3:
- Clarify that only the UVC streaming hardware restart is skipped.
- Explain the subsequent UVC suspend and shutdown handling.

Changes in v2:
- Use pm_hibernation_snapshot_done() after the PM helper was renamed.
- Move the check after clearing the frozen state and resetting the clock.

 drivers/media/usb/uvc/uvc_video.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index f6c8e3223796..1744298f4b1f 100644
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
@@ -2151,6 +2152,13 @@ int uvc_video_resume(struct uvc_streaming *stream, int reset)
 	if (!uvc_queue_streaming(&stream->queue))
 		return 0;
 
+	/*
+	 * Avoid restarting the streaming hardware during the transient THAW
+	 * phase after a hibernation snapshot has been created.
+	 */
+	if (pm_hibernation_snapshot_done())
+		return 0;
+
 	ret = uvc_commit_video(stream, &stream->ctrl);
 	if (ret < 0)
 		return ret;
-- 
2.20.1

