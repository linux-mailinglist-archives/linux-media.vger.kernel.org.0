Return-Path: <linux-media+bounces-52296-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OJ3Ly3phWkLIQQAu9opvQ
	(envelope-from <linux-media+bounces-52296-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:14:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7824DFDF42
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AA3A3054CA1
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 13:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D94F3D6694;
	Fri,  6 Feb 2026 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoNN7Dr+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A3A3D4104
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770383624; cv=none; b=sKPRrAlYWqneb28pWCp8vNB1418tCBBTkldN+li00Oh+Ei6ISzdscD22GCmc+ONfLK45ri/G7ojEDZxfo0ECjYZJqEBzdiu7VjOJ+4zpb1IX5XkD0oMuILGd2LCTT6nQ4TI6f4Q/m6sJ3Pj6X5lyHt8pGAPRp//YNrEARKoU+S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770383624; c=relaxed/simple;
	bh=l8kvXsbEX/WBP9SWaXrOTxgjgslAQLQQELZ8podlqI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3m80VdJlc9M1A1VEfDXlaDe5vGCQOFzlhBX4C0NARnyukA27U63S5KgxX0/Kmq4HZHuMQmXXV4P6ZdSZtfjtGd98KRrI1T9y8z8N9spgnsb8wfk/HJo3zhaiW5I0jTs3pjPC554RGVuC75795fv32k3sKUwSZXRYkzrlgt2KjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AoNN7Dr+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770383625; x=1801919625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l8kvXsbEX/WBP9SWaXrOTxgjgslAQLQQELZ8podlqI4=;
  b=AoNN7Dr+QB8Fo5Mv8RD18egSkf6EFXstIQZndjiM559sHkWSbWVONqi3
   RvLnbm5wWLBTDQOhC53NoY3QzGLkqjEZt9njWZNO7VKB9/tHjqOznNMcU
   s45j8PpKPf90Dk8rUTIwOZexwJOAtCBMd5ZFya/CmGB9AQlgspOmGT6FU
   oM3zfWQNUVH4PPFroAJVNgx4uBevVqXzoDE/OIJZUczouJQ2cu0ARgnOK
   M5kGgQh/oVjU4jgvlyWFTLmY4pAExkF+0s+evCO3+BxZ5vwxGFRicpglB
   NW0AXnzmnrhBg9rizi1olAjO5fzeCsLI0NbqiIVOLFVAbFrzr4QOXOVsc
   w==;
X-CSE-ConnectionGUID: Hj9VsBUDSKmT0AG7vqh8gw==
X-CSE-MsgGUID: /vJELHVHQnaw740x1958gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75441204"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="75441204"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 05:13:44 -0800
X-CSE-ConnectionGUID: ez2MsZuuTMKe7DXROjf4/w==
X-CSE-MsgGUID: VEKHjANNTOGiB2oSJU/5Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215391293"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.219])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 05:13:38 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7DC6D121E98;
	Fri, 06 Feb 2026 15:13:40 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1voLeL-00000005TsW-1S1Z;
	Fri, 06 Feb 2026 15:13:29 +0200
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
Subject: [PATCH 08/13] media: mc: Don't care about unsettable flags in MEDIA_IOC_LINK_SETUP
Date: Fri,  6 Feb 2026 15:13:25 +0200
Message-ID: <20260206131329.1306429-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260206131329.1306429-1-sakari.ailus@linux.intel.com>
References: <20260206131329.1306429-1-sakari.ailus@linux.intel.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-52296-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7824DFDF42
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


