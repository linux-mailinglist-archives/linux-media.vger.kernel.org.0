Return-Path: <linux-media+bounces-62943-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCMgJA/8F2oTYQgAu9opvQ
	(envelope-from <linux-media+bounces-62943-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 10:25:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 159555EE86C
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 10:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC45B301A1F2
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 08:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B7C378D7D;
	Thu, 28 May 2026 08:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="f8a4FuBJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B41E314D07;
	Thu, 28 May 2026 08:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779956357; cv=none; b=TtwS5fmVC7WwObzdCD3s0UN+zniHycTb1Qxi3obhdyDcEJEZxeKX+Vus2A1mFn56xeSr1koy1Tqukolt3qML1uUAlXZUnhcoFICLJe5wALtjgjR+R7IDcODx5czYWYlW5omG7AWvofLOowWxQzUoV5WMVFB08Zj6nfcdceJ9tJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779956357; c=relaxed/simple;
	bh=nT7vtUkFVweXht3a+NAlINTXWJpVZFgV0zikEEBICyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jdfthhDzlrTYb4Pnc/+OCqerPFrRv1i29tzJURV+SNCKHMvg+cmyJrOFYStoPqkSrfMJ4ZIXzdMwFaALVdL47+1/po2KrhoH+rtCwSt2XR/QbiSQILNgPrXRCHhCqtp/aDqLv3PC9dflOzc6F6HlfbO70AVmTT4H+QBXrpRyeJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=f8a4FuBJ; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1779956344;
	bh=KWr/K5mP2Y58tJXieQkFjga7owiMuJEyUtjw67tfJ78=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=f8a4FuBJXZg4BEBiUyFpKXX4tG4lbgfol21Tg9Gn9ZSQJ94mHtpTAAOTVhYOuZGsk
	 XBkMyeEOs9WIplPDjI3JF0WqhHAIuvZyPWY/b+stGa6mV6jeyiLcqD9OOGTCza4PRA
	 wVo1DZW+zEB5mZzXKniz/052ovWwbofTZaPF8fW4=
X-QQ-mid: zesmtpgz3t1779956333t6885fce0
X-QQ-Originating-IP: xIOo1WjjSFuC3rAr/TU7gIVukxxul7/cimwAROAwV+o=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 28 May 2026 16:18:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 434068552171632037
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
Subject: [PATCH v2 0/2] PM: hibernate: skip UVC resume after snapshot
Date: Thu, 28 May 2026 16:18:38 +0800
Message-Id: <20260528081840.3528089-1-tuhaowen@uniontech.com>
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
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NrJTIfBrO/QTz6vBxvXQhyPUzTGs9U+QQK/Rvi4nVcW5zeshmCiHBukq
	e7rkU1ah9+FUFkx0Cw+Kc9UwpbFeKUlGUeUiGo5RTR/uoTybXKFkjW90oEGDGMQ9DszJPSN
	TK+BVnnAIz2Uzl2TJdRxFDqh+ijBxJTdFyTG0PdMCO7Rl46zJPglBCj9rZPGuCxRh/rIelT
	2e0K3d26/lil+cibGhp0mUL49kScd3EfEmz0F1y2zu3f+3VVHAJ3hb+YDwD/pHM4DHfG+jH
	EmbbRKctBpUpci+Y2fMpodA8NhE6Y588ap/z9LM2DSuGulEXaqqFkqndqeo4Gk7yQr8g9ff
	lqsPg6OQdIbxcLNPjZmzQv1HkfCww/zrbHMdeJsV8EIUoh8I/rHxGKJTMwvfmnaiLtX/Qb1
	g7sGn+lNEISk6ziYiRPUJdrjdNg0qwZNGFgFwwv49zCfBnG+6nq221i0Nb9QYZ2Ca33n6GS
	SL0has35DXfq54qViidPWDIeohE8fIqA+tNDxmByuOevFpUnC1rkNKxjkGjxwZW/N+WapqS
	IPwTxYGhBQvvZteVgMLP/38ZU3CZ2BI1PTY5xGztsOSYcLH58f7ZJcIfFZ7dPgbpqfXNiH6
	NnZNV6aznxJ+w6sRKMihN0jDXU9P8lcjpvYDuAnFHCFk4D9qFCM+oHhDwEf4fiVXjF0+SKT
	uYV36KrvOtozSQw0inZn0cySbhKIeER8Lamlghp8gRhY4xKw87FENpu3K7e0E11dsBhBts/
	D/rfS7AGKLRktbnpAP4Mf4GXmZQTZiEO5+3RVNIiexq0h1aUA8YXz/A9xeOJfYqpJC4hETU
	QaYDzPeg6av6VeOX9ZKmZtA7s/iXCMQ9rMErRakDiJa8GVHOnB84/+NtscmXKqwCFgqey5y
	ah6bExJvSFm5yCdG4zZ+X6QaAg9/OcQQkK9XwmnRfca8DHaXpfSxE7h0eN3KQE0GfKPib8U
	tj25Fx+549adXw7HWgGqZs9qzgw5APlaUKlHblLg3hOBKaicO15xVMdW4qXL8aBGjU2uBBw
	ArQhLWumMWZ/Sdo1LNIpbVe+J/oIT7fWFroBdViQ==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62943-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 159555EE86C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During hibernation, after the memory snapshot has been created, the
kernel briefly resumes devices with PMSG_THAW to write the snapshot to
storage before powering off.  USB driver resume callbacks do not receive
the hibernation PM message, so uvcvideo cannot distinguish this transient
image-write phase from the final restore path.

This series adds pm_hibernation_snapshot_done() and uses it in uvcvideo
to avoid reinitializing the camera during the image-write phase.

This is not intended to make every leaf driver special-case hibernation
THAW.  A generic USB-core skip would not be safe because some USB
interfaces may be part of the storage path, or otherwise be required by
dependencies during image writeout.  The helper is an opt-in mechanism
for drivers with a concrete reason to avoid reinitializing hardware in
this transient phase.  In this case, uvcvideo has a user-visible side
effect, the camera indicator LED, while the camera is not part of the
image writeout path.

Changes in v2:
- Rename pm_hibernation_storing_image() to
  pm_hibernation_snapshot_done().
- Clear in_suspend before releasing snapshot memory on the hibernation
  failure paths and after swsusp_write() returns.
- Update the uvcvideo call site for the new helper name.

Haowen Tu (2):
  PM: hibernate: add pm_hibernation_snapshot_done() helper
  media: uvcvideo: skip resume after hibernation snapshot

 drivers/media/usb/uvc/uvc_video.c | 12 ++++++++++++
 include/linux/suspend.h           |  2 ++
 kernel/power/hibernate.c          | 31 +++++++++++++++++++++++++++----
 3 files changed, 41 insertions(+), 4 deletions(-)

-- 
2.20.1

