Return-Path: <linux-media+bounces-58427-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJHfDykK2Gm5WggAu9opvQ
	(envelope-from <linux-media+bounces-58427-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:20:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5733CF6AF
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5812F3024511
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B56345734;
	Thu,  9 Apr 2026 20:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPgrsXMG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9592F341AD6
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765733; cv=none; b=iSzeKMQabFLzNGqA1QosNFOwEVTnrzjZyF6vw/jU8bhmibehFcSqKo7kCzhyfvRov1H2/XV0X8sCCfUrrhs7zuNvkeBxJTnAHysxYWjFbJnaT6COlT9s7nVydTwb/U64NLJJA9M9b+JH+3dTUbPf4gNF/O+ZJXw2DtvRjz21h3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765733; c=relaxed/simple;
	bh=T7SWsJuxjyloUisRKKKluQnUnYjxUV1B6yiaErfrEJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oP9V1LVxIk1ql1y6P1fFxRR9mF3Dj8YDsTbW6EEXUsvjv1wbOpalZ3BEMcfaczQSy7j7S/X0S3yK1Qc/Q+WDa5LbGm18P2lGbEaaQ4WEzTRvEtkvK5J4M/13a506UU5JhzR5BABPndeMyAQrzf9PR5G9MTI6Ka61V8XovGlgcJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPgrsXMG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765731; x=1807301731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T7SWsJuxjyloUisRKKKluQnUnYjxUV1B6yiaErfrEJc=;
  b=IPgrsXMGGzBagSM6mG2exdw566Oqe6yeihjDtbGMI7Q4GNQhojpqdn4b
   28pNdWIjNUfMd/LyldUuYT/6K2lv/wY49WJrRxY9jYrwo6+iq17oTY1FU
   xfv8Ya+J++lHTOua4qIzmLgy3dnSZEB0YAJbjMaywzsUAQ4qv4ugLIS26
   i69sTGB29FPk72obVayjAQjTZW8uYYjKjP7clLhsYh0RawwH0raVBBM6O
   YYj3Z3LWN4J/FGfB0V5thuoAU43q1b2zquqGsGZZLFS/tiBlXkOuaqEK8
   f3wOctoVkODc/+L25ai0V9Uj+PyzrDFEC4Cslquhb8rnVC8zUJMdeoSU+
   w==;
X-CSE-ConnectionGUID: DAPNJbOITz+GjJ1oAeW8rQ==
X-CSE-MsgGUID: kl1fSxWHRFSWb0Rip8VyuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87409094"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87409094"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:18 -0700
X-CSE-ConnectionGUID: iH1ES4UdSqmJmfxKqz1biA==
X-CSE-MsgGUID: rB+5AC6+T+aegp5c+lsO/g==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 57421122609;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045lN-3Cqb;
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
Subject: [PATCH v12 11/86] media: uapi: Add V4L2_CID_METADATA_LAYOUT control
Date: Thu,  9 Apr 2026 23:13:46 +0300
Message-ID: <20260409201501.975242-12-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58427-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,ideasonboard.com:email,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F5733CF6AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The metadata layout control defines the layout of the metadata on the bus.
It is used on sub-devices that use generic metadata mbus codes on at least
one of the pads.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-source.rst     | 6 ++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                  | 7 +++++++
 include/uapi/linux/v4l2-controls.h                         | 1 +
 3 files changed, 14 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index e1f96987ad59..e369978c2b50 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -152,3 +152,9 @@ Image Source Control IDs
     is provided as well.
 
     This is a read-only control.
+
+``V4L2_CID_METADATA_LAYOUT (integer)``
+    The metadata layout control defines the metadata layout on the device's data
+    interface for metadata streams. The control is used in conjunction with
+    :ref:`generic metadata formats <media-bus-format-generic-meta>` formats to
+    specify the layout of the data.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 32a4b1b3fc0e..4618252d24f2 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1159,6 +1159,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
 	case V4L2_CID_CFA_PATTERN:		return "Color Filter Array Pattern";
 	case V4L2_CID_CFA_PATTERN_FLIP:		return "CFA Pattern Flip";
+	case V4L2_CID_METADATA_LAYOUT:		return "Metadata Layout";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1322,6 +1323,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*min = 0;
 		*max = *step = 1;
 		break;
+	case V4L2_CID_METADATA_LAYOUT:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		*min = 0;
+		*step = 1;
+		break;
 	case V4L2_CID_ROTATE:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		*flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d5cedb28a564..2f0bd33bbc3d 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1247,6 +1247,7 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CFA_PATTERN_FLIP_BOTH \
 	(V4L2_CFA_PATTERN_FLIP_HORIZONTAL | V4L2_CFA_PATTERN_FLIP_VERTICAL)
 
+#define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
 
 /* Image processing controls */
 
-- 
2.47.3


