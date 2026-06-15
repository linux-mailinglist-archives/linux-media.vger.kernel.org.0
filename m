Return-Path: <linux-media+bounces-64883-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7bc9HlqqL2o4EQUAu9opvQ
	(envelope-from <linux-media+bounces-64883-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:31:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C052768436C
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:31:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b=AlpAUJhL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64883-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64883-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C3E5303B6CD
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 07:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB5E3BE17D;
	Mon, 15 Jun 2026 07:29:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7893BE650;
	Mon, 15 Jun 2026 07:28:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508541; cv=none; b=QBd+lVGbr4lWtilYjMGtd1uskFVE/zrxtg7OqkB6IaCscIwEzBde/zNM7QXcUHHTLncYHvp2V/nZehjadsBru/DiX9cSaSvwWH1Mo1ZUNTTtbqoWxg/AGe08NDiQrzZk7aZ6TcesW1/XrCZj7g3qi88Ax87JumXc2n7D597WEY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508541; c=relaxed/simple;
	bh=49YSG0xugYHu88e6UqYrXixFYP6jUlLst8e14prOc2I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kgaiXNCuEoHPNg4pISNV8yIkwLZyVAifStJYdgRvRnAz3+nhNzfXsHgq5i/WbQ/+jjSvm1kL2U2JZpreVihQ0UZD5jegftde9FQP3CgJmtMyIj90NkO5dZQT6fh4/UuxL2JlXtUJL9xS1QdQ9zbKbSLaJtkRA5dV4mwhTC6AgKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=AlpAUJhL; arc=none smtp.client-ip=101.71.155.101
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 426442c89;
	Mon, 15 Jun 2026 15:28:43 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: andy@kernel.org
Cc: error27@gmail.com,
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
Subject: [PATCH v2 0/2] media: atomisp: fix probe memory leaks
Date: Mon, 15 Jun 2026 15:28:39 +0800
Message-Id: <20260615072841.3113700-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9eca2ec68603a2kunme2f225d529d47b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTkpKVktCSEsdTksfHk4dSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=AlpAUJhL6t4Ekn+s5tsRyMLZGGTxQsp1ADgJHheHuDMuc0Px5n6bWRtRxF0+DGlFeaikoFZifEHa1kWejzlO3NwK5jShl5PGHlNnTu2T6wndGXW425rzk9KTNHw/Bb/BSr1HGFkxn11EM29PxzDmgWvIbUK+Habn3OeZkEVLuVM=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=LHB5zmoGT9lNpKaN2/EbK8IPkvIdVjaqV8u3VOjrvNs=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64883-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:error27@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:abdelrahmanfekry375@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:jianhao.xu@seu.edu.cn,m:dawei.feng@seu.edu.cn,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dawei.feng@seu.edu.cn,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,seu.edu.cn];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.feng@seu.edu.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[seu.edu.cn:dkim,seu.edu.cn:mid,seu.edu.cn:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C052768436C

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

Changes in v2:
- Rework patch 1 around the module-init cleanup ownership boundary and
  move media_device_cleanup() after module cleanup.
- Add async notifier cleanup as patch 2.

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

