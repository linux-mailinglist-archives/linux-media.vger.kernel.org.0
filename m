Return-Path: <linux-media+bounces-58432-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNO9DD4J2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58432-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2163CF4B2
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9A36302661A
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E525133EAEC;
	Thu,  9 Apr 2026 20:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUCgYnbq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C54B342CBA
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765734; cv=none; b=cxv+NwyVQ4vgpKpwKKp0o/loKDUPxo5QSKFbGPB5ww30xOpc0HclsEHn4vdq2xkXlUwvBTen/xuBEDXgtQ7COV1z64U8SRVE1xRNyrd96YnMn0vkcYdHaERWBwwZKNudT1LpKoDVVKk/nWE6WpqKcjP5arEJnN1wzpAq5zgfuYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765734; c=relaxed/simple;
	bh=oLfm7W1lexeKYW6WKnolXXU+zcmSnrPNvSSJt/eKRTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bnmFJ0wDg61JSosB9h2AK/cwTR2HwWwaO8RX6Joz6HKK1MniFI39fC2n1EKmpGkHSxvAAg/icTvWiU7zIWYhO16QoeFKUSMKmlkxYFm/UAEA27RTkunB+keWCeLYuy8cFE0JgMelBvrziGv8ZvD3H9iOXgsyK72iOAHt03w1p1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUCgYnbq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765732; x=1807301732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oLfm7W1lexeKYW6WKnolXXU+zcmSnrPNvSSJt/eKRTA=;
  b=cUCgYnbqkx4sSv/XEBt+iBOzWv4xB3IS9gsHkyRXLVvFnr1ueeddMY9w
   E4xWggLpKzrsejVr6pUZGsbR1Pby2MwygnxHNgt+NAxhFKtWh8UqGd6Om
   2vNGJjZqFNsWmOn9vyFtsjEorjSx1HC+jKlC5ISsRPBt2lwidgXSd3wAC
   j2YOq5HYsAyrW1YaudUAs0odshrJzU3lirCyYbSIo2APTEgFGqU/FegpZ
   dQw9nG39O/Xdrxu/hLFH1tA4fD6A93E7sXW91jr26/FPeEZCqzXzqsR1d
   +pWyI4gGpF9PswkaCWLUkBkRZ/QMhY0YPgjwHPSTsy2FwMwXK4gSJ12kB
   Q==;
X-CSE-ConnectionGUID: SqlMbSCQTeWIGLjMqbf0aw==
X-CSE-MsgGUID: JpY7c4uFRkelre6812N53Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176470"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176470"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:26 -0700
X-CSE-ConnectionGUID: RRyY85nJT/iQDBU7aWxBZA==
X-CSE-MsgGUID: 8uvAGbCYTIiMLc3eoI57RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047530"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:20 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AFBFF1228C8;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045mr-0YaY;
	Thu, 09 Apr 2026 23:15:02 +0300
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
Subject: [PATCH v12 34/86] media: uapi: Add binning factor helper macros
Date: Thu,  9 Apr 2026 23:14:09 +0300
Message-ID: <20260409201501.975242-35-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58432-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CA2163CF4B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add helper macros for handling binning factor integer control menu items.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/uapi/linux/v4l2-controls.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 60f0fb599926..aaa0d88d7e6e 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1250,6 +1250,13 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
 
 #define V4L2_CID_BINNING_FACTORS		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 13)
+#define V4L2_BINNING_FACTORS_MAKE(hnum, hdem, vnum, vdem)		\
+	(((uint64_t)(0xffff & hnum) << 48) | ((uint64_t)(0xffff & hdem) << 32) | \
+	 ((uint64_t)(0xffff & vnum) << 16) | (uint64_t)(0xffff & vdem))
+#define V4L2_BINNING_FACTORS_HNUM(binning)	((binning >> 48) & 0xffff)
+#define V4L2_BINNING_FACTORS_HDEM(binning)	((binning >> 32) & 0xffff)
+#define V4L2_BINNING_FACTORS_VNUM(binning)	((binning >> 16) & 0xffff)
+#define V4L2_BINNING_FACTORS_VDEM(binning)	(binning & 0xffff)
 #define V4L2_CID_SUBSAMPLING_HORIZONTAL		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 14)
 #define V4L2_CID_SUBSAMPLING_VERTICAL		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 15)
 
-- 
2.47.3


