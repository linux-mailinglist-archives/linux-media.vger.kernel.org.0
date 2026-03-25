Return-Path: <linux-media+bounces-56991-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBbKDk3Cw2n6twQAu9opvQ
	(envelope-from <linux-media+bounces-56991-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:09:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3AC323956
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5461E30C7A25
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2BE282F14;
	Wed, 25 Mar 2026 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFAikgi7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5503C8720
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 10:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436330; cv=none; b=ToXOEEYgG00g52dIVOpk87uyL5Lvp+5Z3EQVJhNsgJDsEiQa+L2TcB6izBKlM1BOWP0nRPEXKztmGDiglnAvI6E4qwhEO7a08Ut7ktC/QXTN3hucnUz+6BrD+Xy1JYNOPUnUXVkepRaEYqOhP3R1sIpYE713eHMopO68aoq1RGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436330; c=relaxed/simple;
	bh=d6ewd0OgnjdCKMEMQLVVi5WVY9nK65gp+GsUlIM3QjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4KsykOTrm+CGH+MAa0nD7DT4k1LF6BK8otVN4uhxjgzvBdUVimHwLv0ja6WVFk2dPKzDi4DRPWOncfNBuNFBdg8Ai/fIJcnC7+tdfJMWu72Cl/+L7Z4H+rgGIRgJyvsc4goj0UUo7VmCsGL0vutSNIsLPzDFBHp9xecgk0au6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFAikgi7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774436330; x=1805972330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d6ewd0OgnjdCKMEMQLVVi5WVY9nK65gp+GsUlIM3QjM=;
  b=VFAikgi7oE2GWeCZoZFqjMm4jXvrQ6OkOmW+8FhUExkqqhR6evu8PSDv
   V9Axu7o6pPnpMZgR6kSd31sUyRd6T26WWox2BnO8iydY8/T+DnVvLmUr/
   RqqkeswKICwLx7EZ0j9bx/bEL4S9cIK7/rF6C3K3Nmm53flrL56BSnJAY
   D3z8z6oKk9/bGg6jaK3MzESZ11REi5H/t5GAYwkPsKHwkaiDQWihxgBtW
   WiJ7DKdR7eghzz9kY6Z7J+qdBo7ytuFTzBoWhyU/xLAnB9hgDSmFUUbnY
   MsIuo0v0U8jsZRuR+foXPkp80NnjBVH55HZwW6utcmQgJxKv++kF5Fuws
   A==;
X-CSE-ConnectionGUID: rznQBt13QR2I2r3uSsqB1Q==
X-CSE-MsgGUID: lj0VpBIwTzq+6Ww1QoBfvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74496419"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="74496419"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:49 -0700
X-CSE-ConnectionGUID: l8IUO/+hQhm4JM1XrNBmqg==
X-CSE-MsgGUID: LhctG/gDRlO9TzOjgXHKRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="221763530"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:43 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id ADE1F122472;
	Wed, 25 Mar 2026 12:58:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w5LwJ-00000004wAp-0bdh;
	Wed, 25 Mar 2026 12:58:19 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 15/22] media: mc: Don't care about unsettable flags in MEDIA_IOC_LINK_SETUP
Date: Wed, 25 Mar 2026 12:58:12 +0200
Message-ID: <20260325105818.1176816-17-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
References: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-56991-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E3AC323956
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The implementation of MEDIA_IOC_LINK_SETUP currently requires that all
flags that are set by the driver are correctly set as the driver expects.
This poses a problem for adding new flags as programs could not work with
links that have unknown flags even when the use of these flags wouldn't
affect the program.

Ignore the non-settable link flags.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-entity.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 717569bd1a8c..287eded356bb 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1319,7 +1319,7 @@ static int __media_entity_setup_link_notify(struct media_link *link, u32 flags)
 
 int __media_entity_setup_link(struct media_link *link, u32 flags)
 {
-	const u32 mask = MEDIA_LNK_FL_ENABLED;
+	const u32 settable_flags = MEDIA_LNK_FL_ENABLED;
 	struct media_device *mdev;
 	struct media_pad *source, *sink;
 	int ret = -EBUSY;
@@ -1327,9 +1327,9 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
 	if (link == NULL)
 		return -EINVAL;
 
-	/* The non-modifiable link flags must not be modified. */
-	if ((link->flags & ~mask) != (flags & ~mask))
-		return -EINVAL;
+	/* Only allow changing user-settable flags. */
+	flags &= settable_flags;
+	flags |= link->flags & ~settable_flags;
 
 	if (link->flags & MEDIA_LNK_FL_IMMUTABLE)
 		return link->flags == flags ? 0 : -EINVAL;
-- 
2.47.3


