Return-Path: <linux-media+bounces-65031-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RjqcMXRUMWqxgwUAu9opvQ
	(envelope-from <linux-media+bounces-65031-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:49:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8CC690190
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:49:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b=UyixYJAT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65031-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65031-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DFB0307F2A7
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47027331A4C;
	Tue, 16 Jun 2026 13:48:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275722C3248;
	Tue, 16 Jun 2026 13:48:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617722; cv=none; b=m57zzzoK3FbQZhaYIUS7dYGAurl9di54vkkueYd8oTpLbLMVaYTejAssKRqdRPunMD0CGsuspoA9+NpqB42TA/LOYKAD9zsDEIaHuH/UoBJBCNL3XCUfLdO/nyWx7jgKdN7e6A6KMC0tb6E+Y8QEYGafhiFGmMY/f5jgJ2DjQhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617722; c=relaxed/simple;
	bh=ZLf3JWyRJ4ZMlPlaKgsDjHJZ1+zely5V+Cx9SYvUC6E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BN3cRbfxjhuI6YjOIu8C0vBY4WA+hO7N57gEGpttVmIGOo0mBJaTp8w+GYVImcafZ58OUXniOarmWTE7zuFVJOqp3cks4EoWEOa0TIrbTERe9dVrA+ND+3nJcZ7d5F9g81vf3bSA2vuWf6tUQBiisEQO5/62JyAo+NazD+dfvlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=UyixYJAT; arc=none smtp.client-ip=45.254.49.198
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 429ab32a7;
	Tue, 16 Jun 2026 21:43:21 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: andriy.shevchenko@intel.com
Cc: andy@kernel.org,
	error27@gmail.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	abdelrahmanfekry375@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	jianhao.xu@seu.edu.cn,
	Dawei Feng <dawei.feng@seu.edu.cn>
Subject: [PATCH v3 0/2] media: atomisp: fix probe memory leaks
Date: Tue, 16 Jun 2026 21:43:17 +0800
Message-Id: <20260616134319.3969928-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ed0ac1f2603a2kunmea38caa144bbe
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDH0tMVhlKSBpPSUpKGhgeT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=UyixYJATlchTC72LjI68aMEjO/yUWElXsPUiHFginsLZq5pmpfC5SptEtlg4OUKR8KtSbgCYjeWLKJd1AbRPStaBB4Rs9LXJkE7P4XaAxJWz7XDk4/3gKRf+exsPFj7z1BmxxCrPUAnQoaD4JX5xxEZ0143AiHbz1sCautLIjy0=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=ffCh9oL1e0EAcHuPsDW71SlmsWGjbc+hxVo6fDlA5d8=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65031-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dawei.feng@seu.edu.cn,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:error27@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:abdelrahmanfekry375@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:jianhao.xu@seu.edu.cn,m:dawei.feng@seu.edu.cn,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,seu.edu.cn];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.feng@seu.edu.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,seu.edu.cn:dkim,seu.edu.cn:mid,seu.edu.cn:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D8CC690190

This series fixes two memory leaks in the atomisp PCI probe and adjusts
cleanup paths.

Patch 1 fixes the cleanup boundary for media entities created during
module initialization. atomisp_uninitialize_modules() did not release all
module-owned state and instead left some media entity cleanup to unregister
helpers. That split is incomplete for probe failures that happen after
module initialization but before all entities are registered, so the
module cleanup path now owns the corresponding media entity cleanup.

Patch 2 adds cleanup for the V4L2 async notifier state initialized by
atomisp_csi2_bridge_parse_firmware(), including notifier connection
cleanup on probe failures and notifier unregister on remove.

The bug was first flagged by an experimental analysis tool we are
developing for kernel memory-management bugs while analyzing
v6.13-rc1. The tool is still under development and is not yet publicly
available. Manual inspection confirms that the bug is still present in
v7.1-rc7.

An x86_64 allyesconfig build showed no new warnings. As we do not have
an Intel Atom ISP platform with the required camera sensor hardware to
test with, no runtime testing was able to be performed.

Changes in v3:
- Moved the research background and static analysis explanation to the
  cover letter.
- Changed Zilin's Signed-off-by to Reported-by.

Dawei Feng (2):
  media: atomisp: fix memory leak in atomisp_pci_probe()
  media: atomisp: fix memory leak in
    atomisp_csi2_bridge_parse_firmware()

 .../staging/media/atomisp/pci/atomisp_csi2.c  |  5 +++-
 .../media/atomisp/pci/atomisp_subdev.c        |  9 +++++--
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 26 ++++++++++++++-----
 3 files changed, 30 insertions(+), 10 deletions(-)

-- 
2.34.1

