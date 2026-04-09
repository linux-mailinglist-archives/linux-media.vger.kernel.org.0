Return-Path: <linux-media+bounces-58416-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PXJOQkJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58416-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EC63CF446
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A4473032A5F
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8C733F8BC;
	Thu,  9 Apr 2026 20:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXsPXoYZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC71533D51F
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765730; cv=none; b=Ca6ewSm7943rERhfW5dQABuqluCQmSTzCF8ZM536yog5bNy2uCDb8mlFnhmLnPhrzaU+Hfh1KgF6JBUSOvJqlKNFIT0LZ1dUiSK9n6YXLnasUqn3sZbjvqlvAiHQpDa5m5JdtKo4sNURPSbvah/cxnSQ0yS37kxw/jmnjuPV270=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765730; c=relaxed/simple;
	bh=js3S6ceMZfoX8E1cwBfbf7CvTn9K/9LNZJvZTwODSSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H2mPflnqHUBmvQs8NA9g9eL6ZraSWa4f9CgGSgSVCOEm1sS2QvD4hUltbajSdldsEmPLvPKnK4Rc1fD3I62JZmtGn/r0UOf/40IaI0mhhHYu4fR7d9n12vlUzhsZx+sjzHmx+C5ENOHx8bbMkM2XOZ4BU2EBNpGFmIr6GQ4euk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXsPXoYZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765726; x=1807301726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=js3S6ceMZfoX8E1cwBfbf7CvTn9K/9LNZJvZTwODSSY=;
  b=IXsPXoYZI/a0KdhqUfJSYouak6feBXZTY11DToYj0B6qs6RQdXYfCLoK
   VjIvVl/l5OyCpPoNqhbW2Gr3Exm5G0fdWakVZ7XLpYzL4eVlLn3//5ExI
   q7sojfRRVYjRJDINnL+uaAfD8AP3KJMeobNdGPRb1OARoC85uMLirs+fw
   sIZyfDvrwt9iotq2TzPfrjjwVKzFVtwdc/dJjb2erU2nTL7QFQXAe29U5
   gLAXWAnnlgOv/3n4XmHgbzibXUkHsWY7L8UugPeFmL/0kIPTmJLG4yCed
   abC+GKyENLcq9Q3+uBoB1bjTrXYC1+XQvTHMPialmxmQuS03ceXsKAi0/
   A==;
X-CSE-ConnectionGUID: gcjpJfKkRaKmWCGARsZYVw==
X-CSE-MsgGUID: KnRz5qzZSCak2gymMC7QMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87409012"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87409012"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:17 -0700
X-CSE-ConnectionGUID: tme/TdDFT8WWm04M59b1eg==
X-CSE-MsgGUID: Uq1zXXurTamjpTL8PWcmlA==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3ED9A122182;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045l3-2rdH;
	Thu, 09 Apr 2026 23:15:01 +0300
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
Subject: [PATCH v12 06/86] media: Documentation: Reference CFA pattern control in pixelformat docs
Date: Thu,  9 Apr 2026 23:13:41 +0300
Message-ID: <20260409201501.975242-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58416-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2EC63CF446
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Refer to the CFA pattern control in the generic raw pixelformat
documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-source.rst        | 2 ++
 Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst  | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index b09ad4b4576e..2328ac99e97a 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -94,6 +94,8 @@ Image Source Control IDs
     is reported as being (say) 128, then a value of 192 would represent
     a gain of exactly 1.5.
 
+.. _image-source-control-cfa-pattern:
+
 ``V4L2_CID_CFA_PATTERN (integer)``
     This control determines the color components and native pixel order in the
     sensor's CFA (Color Filter Array) when used in conjunction with
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
index 254f8f18c7c5..708aa17b80b0 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
@@ -13,7 +13,9 @@ Description
 
 These generic raw image data formats define the memory layout of the data without
 defining the order of the colour components or even the colour components
-themselves.
+themselves. These formats may only be used with a Media Controller pipeline where
+the more specific format is reported by the :ref:`V4L2_CID_CFA_PATTERN
+<image-source-control-cfa-pattern>` control on the source sub-device.
 
 .. _v4l2-pix-fmt-raw-8:
 
-- 
2.47.3


