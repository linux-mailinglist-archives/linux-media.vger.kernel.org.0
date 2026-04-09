Return-Path: <linux-media+bounces-58402-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIZ7KLkJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58402-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:19:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8D73CF5D9
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE51D3068EEE
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2640339861;
	Thu,  9 Apr 2026 20:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUBDXg6f"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4AD33A9DB
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765721; cv=none; b=mKGNXsZVyQ10UwbzL+1zPmz0CWlCAS69CmZ1hq0L3plg3pmhKYTXJbiJDrIz+7lQJVEwqn6oIpPYwwgvmtNbCoBHqha4Ga81CmYu1t+yC0297DF6MDtQ7NtovMO2DXJQKL+/ctfdaYzPTpNCXDWC2OwcXZZYFD4VLiLCVJuNcms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765721; c=relaxed/simple;
	bh=72C4jG7LVJY/1YS4jYQFYft1TEc358kAGdoD+pxd9eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ee5zo8jmmJXKX9X1l2L8oQT7kqDZLzwaLtkMjTUn2pK42ATVVDmkCDDURpGj1Axcbc65cK5nwBeKNbhJGDYc2zdFq4lVJkEGM/vMR9yk0Lc8cMND0rjrhB/Ewa4BHK7sgq03ptOCyD3QUtmnFXg8Wgm29EcdcGnnG2kh/x9NaDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUBDXg6f; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765720; x=1807301720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=72C4jG7LVJY/1YS4jYQFYft1TEc358kAGdoD+pxd9eQ=;
  b=lUBDXg6fSRA+wMerArPk8qoRB8n5elJIh4STVULEh8EssdQf0xfyPZ2C
   RQQ8XH51pSFuRSTpWVvA5fO1VTsvjA9/p/PdZ1oz/iLx+AU3pnr7OPJYj
   N6skXeTzroPbZRI1d6q1F1TnbDVXCLQPvRl0UVOPjP79W+XsSo2uYYLld
   60ylHkkyGnrX707ek7Z/CAVBdf69qH34rzpNQvXTV+fyVac45jAK7w/7n
   +edyzAOi5i5ead6pQgfGcjWbuqpzxs0mmrbUdiTJPUui9eOox1dABdxA3
   jdwck81ceO6k4c6gSqQPhaOuV1ZobP/6kJJsZRcHI8qRU9qCL01IT2ptw
   g==;
X-CSE-ConnectionGUID: 3+T+iwOHSjiAhcfird3EyA==
X-CSE-MsgGUID: H+iCHyqbTk2wu5on+/BTFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408857"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408857"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
X-CSE-ConnectionGUID: kU1GdzdyRXK4JdfwXYKTqg==
X-CSE-MsgGUID: +sOOxrnRTEGiHbGmWW0tcQ==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:04 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 73021122122;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045qW-3uCK;
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
Subject: [PATCH v12 83/86] media: ipu6: Serialise access to stream pointers by isys stream_lock
Date: Thu,  9 Apr 2026 23:14:58 +0300
Message-ID: <20260409201501.975242-84-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58402-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E8D73CF5D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Re-purpose the unused stream_lock in struct ipu6_isys to serialise access
to streams_by_handle (struct ipu6_isys) and streams_by_vc (struct
ipu6_isys_csi2). Switch to scoped_guard() while at it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  6 ++---
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 23 ++++++++++---------
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 9eb22e456834..0c3223c4d019 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -714,7 +714,7 @@ static int ipu6_isys_close_streaming_firmware(struct ipu6_isys_stream *stream,
 	else
 		dev_dbg(dev, "close stream: complete\n");
 
-	scoped_guard(spinlock_irqsave, &stream->isys->power_lock) {
+	scoped_guard(spinlock_irqsave, &stream->isys->streams_lock) {
 		stream->isys->streams_by_handle[stream->stream_handle] = NULL;
 		csi2->streams_by_vc[stream->vc] = NULL;
 	}
@@ -794,8 +794,6 @@ int ipu6_isys_alloc_start_streams_firmware(struct ipu6_isys_csi2 *csi2,
 				break;
 
 		if (list_entry_is_head(stream, &csi2->streams, csi2_entry)) {
-			unsigned long flags;
-
 			stream = kzalloc(sizeof(*stream), GFP_KERNEL);
 			if (!stream) {
 				ret = -ENOMEM;
@@ -821,7 +819,7 @@ int ipu6_isys_alloc_start_streams_firmware(struct ipu6_isys_csi2 *csi2,
 			stream->asd = &csi2->asd;
 			stream->vc = entry->bus.csi2.vc;
 
-			scoped_guard(spinlock_irqsave, &stream->isys->power_lock) {
+			scoped_guard(spinlock_irqsave, &stream->isys->streams_lock) {
 				stream->isys->streams_by_handle[stream->stream_handle] =
 					stream;
 				csi2->streams_by_vc[stream->vc] = stream;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index fb46ded122fa..0c2adfa01034 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -311,10 +311,8 @@ static void isys_setup_hw(struct ipu6_isys *isys)
 
 static void ipu6_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
 {
-	struct ipu6_isys_stream *stream;
 	unsigned int i;
 	u32 status;
-	int source;
 
 	ipu6_isys_register_errors(csi2);
 
@@ -324,17 +322,18 @@ static void ipu6_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
 	writel(status, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
 	       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
 
-	source = csi2->asd.source;
-	for (i = 0; i < NR_OF_CSI2_VC; i++) {
-		if (status & IPU_CSI_RX_IRQ_FS_VC(i)) {
-			stream = csi2->streams_by_vc[i];
-			if (stream)
+	scoped_guard(spinlock, &csi2->isys->streams_lock) {
+		for (i = 0; i < NR_OF_CSI2_VC; i++) {
+			struct ipu6_isys_stream *stream =
+				csi2->streams_by_vc[i];
+
+			if (!stream)
+				continue;
+
+			if (status & IPU_CSI_RX_IRQ_FS_VC(i))
 				ipu6_isys_csi2_sof_event_by_stream(stream);
-		}
 
-		if (status & IPU_CSI_RX_IRQ_FE_VC(i)) {
-			stream = csi2->streams_by_vc[i];
-			if (stream)
+			if (status & IPU_CSI_RX_IRQ_FE_VC(i))
 				ipu6_isys_csi2_eof_event_by_stream(stream);
 		}
 	}
@@ -1176,6 +1175,8 @@ static int isys_isr_one(struct ipu6_bus_device *adev)
 			"FW error resp error %d, details %d\n",
 			resp->error_info.error, resp->error_info.error_details);
 
+	guard(spinlock_irqsave)(&isys->streams_lock);
+
 	if (resp->stream_handle >= IPU6_ISYS_MAX_STREAMS) {
 		dev_err(&adev->auxdev.dev, "bad stream handle %u\n",
 			resp->stream_handle);
-- 
2.47.3


