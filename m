Return-Path: <linux-media+bounces-58391-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MsREWoJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58391-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 998403CF51F
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65E88304B2A6
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3A13290C7;
	Thu,  9 Apr 2026 20:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMurId4x"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529AF309F00
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765714; cv=none; b=rgrbJBkQSv7Ag9BgOPIn5fkbpiiHlajEm5nWh3hKKUlUdPmjI3xTuMJMqJjIMcAakTSfuST1xiLFUbssDqdbspGFI0vBknwDAygtuVg8CAQ+e5lPPXf1Ns6qfmICcq3e5r+QV1bwtAWIBmRfJds3Cphseii0EHBm8qXseLBM030=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765714; c=relaxed/simple;
	bh=YBBbblrYKO+b2A9q2jL3a2REFeSdh3PkPcqvnK+nqwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/52nufWTlKwkbrUPjOAgV7AlzFbjJx13WdN+y1pjQ3hONg0KNbp+UnzYctLG4ceaABhTiCTrE0wxMtkGkVobo1Rhk/+ZPAdI+1qPHW6HxM6bAVZCZ4DWc3QdBUV/MuJALV5FyFpGGdta1VCUMpSo1L1UVLpzE7dBdVMaFW2X+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMurId4x; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765713; x=1807301713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YBBbblrYKO+b2A9q2jL3a2REFeSdh3PkPcqvnK+nqwU=;
  b=cMurId4xk1eNv4Pmy0YUvd8eFer9lZkr9MfKtCUxjbEalyKijzJujbXY
   7EvmYTnuLVCzGy8mkfdf/WJggPbAlE5MywoGI248pd5ivgR9CiQxTUmRm
   Y2ob+lKOdth5RKdhf1g06q4qr94dLwib2N8SdKKr+80j2Az2B1vi/JdZv
   cLagNTES+fvoOGBwl9sH+4jqDp5yknk8k5H8OUTc+LbjiG7lU4FbKfeJQ
   I0GGU8TMIE2gDISNB2K+KPp0Ww2XG/ZEjsk/VNNN15G9EhKVJzJIg8VJi
   +DnwZlSfo5MQ8ilOT5GPHl0KRAFUHUd4mmCYOyvj+Z3oaY7PMfoDWCqWZ
   A==;
X-CSE-ConnectionGUID: 4UZQpFNXQiOq8JJbqbDPPQ==
X-CSE-MsgGUID: +9i+vgBpTuC3r/6HgnD03A==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408735"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408735"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:10 -0700
X-CSE-ConnectionGUID: qyL/HI6rSJOEiHUQp6k9ug==
X-CSE-MsgGUID: 936mLF2JT1O2tOiZcY3y/w==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:03 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 478C5121F82;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045pd-3980;
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
Subject: [PATCH v12 72/86] media: ipu6: Get watermark configuration directly from ipdata
Date: Thu,  9 Apr 2026 23:14:47 +0300
Message-ID: <20260409201501.975242-73-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58391-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 998403CF51F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of passing watermark configuration data around, get it directly
from IPU variant specific static data structure.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 12 ++++--------
 drivers/media/pci/intel/ipu6/ipu6-isys-video.h |  2 --
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 0da9070aeb42..1165d5bc693b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -759,8 +759,6 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 
 	av->watermark.width = ipu6_isys_get_frame_width(av);
 	av->watermark.height = ipu6_isys_get_frame_height(av);
-	av->watermark.sram_gran_shift = isys->pdata->ipdata->sram_gran_shift;
-	av->watermark.sram_gran_size = isys->pdata->ipdata->sram_gran_size;
 
 	ret = v4l2_g_ctrl(esd->ctrl_handler, &hb);
 	if (!ret && hb.value >= 0)
@@ -799,17 +797,15 @@ static void calculate_stream_datarate(struct ipu6_isys_video *av)
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	u32 pages_per_line, pb_bytes_per_line, pixels_per_line, bytes_per_line;
 	u64 line_time_ns, stream_data_rate;
-	u16 shift, size;
-
-	shift = watermark->sram_gran_shift;
-	size = watermark->sram_gran_size;
 
 	pixels_per_line = watermark->width + watermark->hblank;
 	line_time_ns =  div_u64(pixels_per_line * NSEC_PER_SEC,
 				watermark->pixel_rate);
 	bytes_per_line = watermark->width * pfmt->bpp / 8;
-	pages_per_line = DIV_ROUND_UP(bytes_per_line, size);
-	pb_bytes_per_line = pages_per_line << shift;
+	pages_per_line = DIV_ROUND_UP(bytes_per_line,
+				      av->isys->pdata->ipdata->sram_gran_size);
+	pb_bytes_per_line =
+		pages_per_line << av->isys->pdata->ipdata->sram_gran_shift;
 	stream_data_rate = div64_u64(pb_bytes_per_line * 1000, line_time_ns);
 
 	watermark->stream_data_rate = stream_data_rate;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index d07c16e79877..80b9d0d001b1 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -72,8 +72,6 @@ struct video_stream_watermark {
 	u32 frame_rate;
 	u64 pixel_rate;
 	u64 stream_data_rate;
-	u16 sram_gran_shift;
-	u16 sram_gran_size;
 	struct list_head stream_node;
 };
 
-- 
2.47.3


