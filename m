Return-Path: <linux-media+bounces-58258-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB81MfZ21mlQFggAu9opvQ
	(envelope-from <linux-media+bounces-58258-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:40:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 935CB3BE53A
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A31213021186
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F12A3D7D75;
	Wed,  8 Apr 2026 15:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cbcLyz2/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594233D4131
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662820; cv=none; b=krZnohErjMi9ZhyrntcXKFvYiEKtV0GqA28kDYl8Xlc5ug0NtOk7++tYfcjBYjjrsSLPkV06cw9Y2UM77B7E3qoMixqQU01GR9rx1kndJWNr9MmGlEn1Ds0L+o1AJNfrumx3Px5qMBojqGBKHUp4b4iPOud/j2RsbXjbDhD5WHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662820; c=relaxed/simple;
	bh=UvPWqLhCQMB93578Gw+6pMtEfXhRc3BIVSXw0GJOG1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=boJkuIxtQn+gJbbX72fLXGIdBJq7yrkFxfxT2/JXj1LuYw2mfku4QBZCBu1s2Mz+OUIKa8V93AXmQDR8MnHpqfitBlsznAPH6aeAZSAdWu37EnJQn+2rz/TGMinuHtWmID11eG538zhyxL44ltGFicisMjV9PPVckSN0G5SH8pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cbcLyz2/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662818; x=1807198818;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UvPWqLhCQMB93578Gw+6pMtEfXhRc3BIVSXw0GJOG1M=;
  b=cbcLyz2/y80fKQqf1ff0Hg2vuQw5kTl8TQTBmZdejTnnqt97CjNs+JcM
   qfEUwGIeYgazgNLMvk8OfSWnqKuBct0K4QPj0sczMhcBtcSq5RELR0pqS
   jZdRQxlww9aHBpblECFNrISeJ8cFqoZqNDQ2L/kv4eL8svxSSIcacA5wt
   OvArB5r5MOY/G4CYpGkSvIi7fVp2BfPOoPczfywSaeERCkjw1lCOtldJf
   +N1nTtAf5rnfdxb6JXH4w2HfwZ1eym3B3TUtIHnbFMn6/CCqAFOXiQJK1
   PIysdg8CFZTB95SmSZZuop6sLYyUHlt4Nyp08aq8W9uey/M3/b69xdg1s
   Q==;
X-CSE-ConnectionGUID: EtBqWE4HTUWE79AwJo3LBQ==
X-CSE-MsgGUID: 4vqaSBNeS3u/nTDgUxA/MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038460"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038460"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:40:01 -0700
X-CSE-ConnectionGUID: tWBB/06oQNKWADotNjyALw==
X-CSE-MsgGUID: J/JMjzyZS1ODnyZB+UupXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740383"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:53 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 20F65122014;
	Wed, 08 Apr 2026 18:39:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044DO-2KaE;
	Wed, 08 Apr 2026 18:39:39 +0300
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
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v4 17/29] media: v4l2-subdev: Allow accessing routes with STREAMS client capability
Date: Wed,  8 Apr 2026 18:39:26 +0300
Message-ID: <20260408153939.969381-18-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58258-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.947];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 935CB3BE53A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Disable access to routes when the STREAMS client capability bit isn't set.
Routes aren't relevant otherwise anyway.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index f8fde395a53a..647587c0499a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1020,6 +1020,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
 			return -ENOIOCTLCMD;
 
+		if (!client_supports_streams)
+			return -EINVAL;
+
 		memset(routing->reserved, 0, sizeof(routing->reserved));
 
 		copy_routes_state_to_routing(routing, state);
@@ -1041,6 +1044,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
 			return -ENOIOCTLCMD;
 
+		if (!client_supports_streams)
+			return -EINVAL;
+
 		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
 			return -EPERM;
 
-- 
2.47.3


