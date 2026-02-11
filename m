Return-Path: <linux-media+bounces-52584-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLyrM3BHjGkHkgAAu9opvQ
	(envelope-from <linux-media+bounces-52584-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:10:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 739C81228E6
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AEBC303CE02
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D8C354AE3;
	Wed, 11 Feb 2026 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lz+Xi4Dn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3C6354AC2
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 09:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800972; cv=none; b=k7DpomzUTkFYUhsYqOnNPTkw4U1NG8WGzjxq47uh/KgpjzmweiYg3Qd2Lme09JvHPDs3n3rjEZLvL8QhkC4k+D2NJT43vHM/oxya08Gg80QA2UmClAjD4GdsJdfJqk2TVqIlXzESOqizFS5BVfRPqOWFxx5nGuemei7bikN3r58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800972; c=relaxed/simple;
	bh=l8kvXsbEX/WBP9SWaXrOTxgjgslAQLQQELZ8podlqI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXJz2CP5NqSUXyoVcNotro/9JEqpYxwVAmyoe3AgjFY6oLR8Wd0AdqiAuFldY7nvCf7o20N6UoQihpZYlUb5S4hvgCAWKeXmm9HvDb1Hkb64CW5hyjuk1FPMwmTdl4sMPRpKQxGRw00buhBEKu2XMDxvJ9MvxuO9xv7iTTdAGPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lz+Xi4Dn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770800971; x=1802336971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l8kvXsbEX/WBP9SWaXrOTxgjgslAQLQQELZ8podlqI4=;
  b=Lz+Xi4Dn9vUrhkPcgncugrfXz+BNz1OH0TR/ch0W8OMdBDW5F684ptcB
   cxDZXau+oubY/jQAv4O81psXa8uEbuDnpw7LIE6ynI2QNtboQy5wMfv2G
   cfP4XC+7KcURd3wpgDv3Sz/gY+PHxg57IwwjFj0wENl6swV/J2XZONzYz
   +eUprcrSJ6t09J7EA8DyQ7fzDHiQrQs+uIruWI8uJMYb7BsAIcPgfI/eQ
   X1CKVrdcjCopxXZcxb756qPK2cyUR51Q2V0mW+nv1O0nNrKdaQXGXcz02
   o8JtHmsHdXnMlw/+Tf071mkXUXcP9bmmo8XvwnpMjFCvoTNSjBfDJ/nKC
   w==;
X-CSE-ConnectionGUID: 9Pv+6xW6ThaJ2gL1p3PK8w==
X-CSE-MsgGUID: cr5GbijKSf6ptwpm/tpH0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72018988"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72018988"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 01:09:30 -0800
X-CSE-ConnectionGUID: zXSWyLldR6mnwC+2GjvkAA==
X-CSE-MsgGUID: ujNmpPfKQ+aV5+pZvtOqnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212222852"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.208])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 01:09:24 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C1057121D4F;
	Wed, 11 Feb 2026 11:09:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vq6Do-00000007laG-2dMB;
	Wed, 11 Feb 2026 11:09:20 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v2 08/14] media: mc: Don't care about unsettable flags in MEDIA_IOC_LINK_SETUP
Date: Wed, 11 Feb 2026 11:09:14 +0200
Message-ID: <20260211090920.1851141-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52584-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 739C81228E6
X-Rspamd-Action: no action

The implementation of MEDIA_IOC_LINK_SETUP currently requires that all
flags that are set by the driver are correctly set as the driver expect.
This poses a problem for adding new flags as programs could not work with
links that have unknown flags even when the use of these flags wouldn't
affect the program.

Ignore the non-settable link flags.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-entity.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index b29b519237d6..cf72bfb8885c 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1378,7 +1378,7 @@ static int __media_entity_setup_link_notify(struct media_link *link, u32 flags)
 
 int __media_entity_setup_link(struct media_link *link, u32 flags)
 {
-	const u32 mask = MEDIA_LNK_FL_ENABLED;
+	const u32 settable_flags = MEDIA_LNK_FL_ENABLED;
 	struct media_device *mdev;
 	struct media_pad *source, *sink;
 	int ret = -EBUSY;
@@ -1386,10 +1386,6 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
 	if (link == NULL)
 		return -EINVAL;
 
-	/* The non-modifiable link flags must not be modified. */
-	if ((link->flags & ~mask) != (flags & ~mask))
-		return -EINVAL;
-
 	if (link->flags & MEDIA_LNK_FL_IMMUTABLE)
 		return link->flags == flags ? 0 : -EINVAL;
 
@@ -1403,6 +1399,10 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
 	    (media_pad_is_streaming(source) || media_pad_is_streaming(sink)))
 		return -EBUSY;
 
+	/* Only allow changing user-settable flags. */
+	flags &= settable_flags;
+	flags |= link->flags & ~settable_flags;
+
 	mdev = source->graph_obj.mdev;
 
 	if (mdev->ops && mdev->ops->link_notify) {
-- 
2.47.3


