Return-Path: <linux-media+bounces-65146-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M188LZpKM2qV/AUAu9opvQ
	(envelope-from <linux-media+bounces-65146-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 03:32:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2764C69D02F
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 03:32:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=pZaTx82R;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65146-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65146-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 610AE30EF9ED
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 01:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176322D949F;
	Thu, 18 Jun 2026 01:32:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E962AF1D;
	Thu, 18 Jun 2026 01:31:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781746326; cv=none; b=fEoingmiYKgxQZrdn8Oq+kpImKib2ypKcw32wz8Xp9WHE7JnDTvRJnjWthKrgD+QdlRYTedL6Dk/5ckQd86QCebZxpvTuk6CGAyfIjby9vXIymvWaveNeYRO5xCRGPEt3LI8gdX7sGLYzF9f7zX1Ont8AcQiZU+YflocfhxCksU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781746326; c=relaxed/simple;
	bh=BN3HOsEgWlvUWdTzGM/7bMKC1H0GMmZnPty4uJ5J3zY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FDYNj0XG112E8ENeSXtH01jOvnw0zxNDE5koTQzWJpUXg+3cGBNHsWNXe0C10AJPLMMMzaHie8ZfAxaqQkysmoV4UhB9n1isoZyNqZgtpycNdDu4FuqjUofzUUe3pA+Vu+/UtIyHvh6S/U939HaNcBpehuElFp71s7P9QhaPgBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=pZaTx82R; arc=none smtp.client-ip=18.194.254.142
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781746310;
	bh=XuyqIVk4TA83mMek4q/hmkWntBwGcXqXYtOybwsn4DY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=pZaTx82Rw0cm4NWhuwz7r5DAuRtPaiPJseg+giMvGPGyqnEc5InLJimABYeyiYPRX
	 UfKCTMlJ9nonht8AyQ4GoEQkp8rrqmr/neD+UwUhu+JHNZsKX7M0HBjBvJEkATsDiq
	 Rx2EF2EfMkEeREj9F4oPjvi5g5VX+ZgB9jpY+2T4=
X-QQ-mid: esmtpsz10t1781746301td878c4d8
X-QQ-Originating-IP: /fn3H90OKJPyg9TAzppitqhppYgXFYix1ahqvTzODAA=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 18 Jun 2026 09:31:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3030917331799414675
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
Subject: [PATCH v3 0/3] PM: hibernate: skip UVC streaming restart after snapshot
Date: Thu, 18 Jun 2026 09:31:30 +0800
Message-Id: <20260618013133.1047270-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260602032413.1540166-1-tuhaowen@uniontech.com>
References: <20260602032413.1540166-1-tuhaowen@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Obfty5iaetlmdMESGBd1g1KvlhGocYMaRp4EoTP5aLsvR1aBw3LVHTee
	c/a4cfQX2kmzzqr1ip4dqa/uyVSONsLtQHpcPZWDMQ6rv7BMJIUI7chnk2nyKmCyGKr78AU
	yM167100tBHgtngsxSFeb7nVoiXW/g0rNNnHs9R5O+anYfMDoO+9MRdyIe87LA10TZzArP5
	RVSobtfoayE1jC2LEkrCFjA6bl7ICJEcAPIpspv0H/DWDfMgdfczQ1effbOe2y4sBrTsKXg
	FR4g0I9qDe3MItjmuSk6m+jzWMsCPtinMSHcrngkaOA/CwUop95Wteh3GCxQEgmpvaU7cVy
	pwtDahxR9qkpvL8S3PneOokmRPLKLeZ51EUJ86TGUj4BIKi9cbgM9EaUSyhKwN6fNScg8pg
	KsZHWF5AXueD3h4BLlU+TEDj7wMU2LIDdciZ05krPuqfgD8d1RpSCCrt5OfQ9PvCzf+fGlF
	xdYItUdojuJ/iQ3k629V799ecYLPmp20/GpSf7rtIVY7FjISw5KgO0Dix652FLIemPEgsd2
	Zgo/wDSBH/jEWOtbYPKdcH8wFuL6KQHADmybK8w0r7cOXU6ehqiSid7MXNPccQa0DJ80ih4
	yrzIR2YtRA/3YLfK/oHl5365NdjtuQr+9yoH+3rHpN5xhD6uZAJ2ViwYJrqqSsP/tS+Cy6K
	eDHxAjXgrBwHUcd5NfZTg9ZMDB4IVVtsOGZ0EKq3fJgKCzfYmAjmZPQ87QdKn+/zpWu/qk5
	uCp79lTXhhva03KyqXxectdC+PY5hEeLGjJFEXelUKFdzSUamX4yLQqNmmbqSdckUMD4jGv
	WhDJNH1Cmejwam/xZZNo/VEHzwxLNE1qwlb2rrDPRcpKcEVWd9+boRnpwtZNgUTya+TvsXG
	2vryIBOJbiv/Zwe8P7dkzG/lOtXXdgpaXvCb0WqGyPdV6TvemgH+KRtyQYveG5xqHdhK1ho
	ynqDHC9HBlP0bHKe0yPehmI7V4Qe5s6nwL6DAkBylQ129Xw0vD0Er6kZDFCiguoeaGEuY0y
	+Uxr06G57sWOs75QRIvXySoNsxLmMFGWcp3EkotA==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65146-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tuhaowen@uniontech.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:tuhaowen@uniontech.com,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:kernel@uniontech.com,m:laurent.pinchart@ideasonboard.com,m:lenb@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:mchehab@kernel.org,m:oneukum@suse.com,m:pavel@kernel.org,m:stern@rowland.harvard.edu,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 2764C69D02F

After a hibernation snapshot is created, devices are resumed with
PMSG_THAW before the image is written and the system is powered off.
USB interface driver resume callbacks do not receive the PM event, so
they cannot distinguish this phase from PMSG_RESTORE.

This series first makes the lifetime represented by in_suspend match the
snapshot memory lifetime, then exposes that state through
pm_hibernation_snapshot_done().  The helper only exposes the PM state;
drivers remain responsible for deciding whether device-specific behavior
is safe, including subsequent poweroff or shutdown handling.

As the first user, uvcvideo skips only restarting active streaming
hardware during the transient THAW phase.  Its frozen state and clock are
still updated, a subsequent UVC suspend can stop the stream as usual,
and uvcvideo does not provide a shutdown callback that requires the
streaming hardware to be restarted first.

Changes in v3:
- Split the in_suspend cleanup into a separate patch, as requested by
  Rafael.
- Reword the helper description to clarify that it only exposes PM
  state and that callers must account for poweroff/shutdown handling.
- Restrict the UVC description to skipping the streaming hardware
  restart and explain why it does not prevent UVC shutdown handling.
- Drop extern from the new prototype to satisfy Media CI checkpatch.

Changes in v2:
- Rename pm_hibernation_storing_image() to
  pm_hibernation_snapshot_done().
- Clear in_suspend before releasing snapshot memory on failure paths and
  after swsusp_write() returns.
- Move the UVC check after clearing the frozen state and resetting its
  clock.

Haowen Tu (3):
  PM: hibernate: clear in_suspend before freeing the snapshot
  PM: hibernate: add pm_hibernation_snapshot_done() helper
  media: uvcvideo: skip streaming restart after hibernation snapshot

 drivers/media/usb/uvc/uvc_video.c |  8 ++++++++
 include/linux/suspend.h           |  2 ++
 kernel/power/hibernate.c          | 24 ++++++++++++++++++++----
 3 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.20.1

