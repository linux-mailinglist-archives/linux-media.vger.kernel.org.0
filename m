Return-Path: <linux-media+bounces-58390-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJBnMmIJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58390-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF2B3CF50A
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA3D13047BED
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611C033688B;
	Thu,  9 Apr 2026 20:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqKnl21P"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC4D2FF67A
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765713; cv=none; b=AyM//ilOMcVJ4oDFj15Ks1ghhGlAoUmaluL5DmKIwGOfPIWPbzhx2O0YVfd87Zm72UP6r40B1sS5VDB8rKV9mzRgaAFh+D2LLbvMr2SMipfR9Mx+xM0xSP09aXhucEVW9NyXN8v+6v52ILb0S3GsvDISJ7EKKPs+VJZBvK1gdvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765713; c=relaxed/simple;
	bh=SRF7I1sYiJckqGlM+CGwSaAXbeYnKfrRb1qjLPxVFxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3ueYV1PmJGt6Pk0GCwM9eGa8ZTGiLuIfI6DX8X4sLdI6SYY4e1+pLf80RWh1cjva1m6XrzuhfMfqlnL204P/9H04XuXebHdbqtczz5PE/t/NA5dCMAlcdo1+rmioWcofEuO8BM/F2XnjdGYerfAoLeV3Gni7eUAt2JflEQz9Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqKnl21P; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765712; x=1807301712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SRF7I1sYiJckqGlM+CGwSaAXbeYnKfrRb1qjLPxVFxE=;
  b=dqKnl21P4LBgGWTPTIca36leMZjHJ4628nu5uWLmfo9e7StlcLnd1ngz
   tHwv1YQFYOEMD0DAOiqk6lPJE6hyARfSw75aCEJCrYTmW6Q8Y3QG+BhOr
   NBww8fcilRBq//AfPUYKzBbe4wyqmkZERok7W8/7xPpHrRcQ3cv7POijk
   zqcPM/tkWEYosZx1cWa+9+/aRZimppup0bBiHrxw6aYhNcOd7ynCdKFsw
   Ph6WCGQoabTXlDX6LJqr6cgR7Li6tIO+6CEGUjn2K4dvekhQE4JdMqK8q
   vHxRDJqD742u55qccRAuO6Y83UR3ODYtxSvKFP13NtfrACg6XtkLo9q0n
   Q==;
X-CSE-ConnectionGUID: ldU2n51jQsCcKMhG//VOpQ==
X-CSE-MsgGUID: VtRYnqSbR36Dfhwfg0s0qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408709"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408709"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:09 -0700
X-CSE-ConnectionGUID: ysIxyX9mR7SZZjuapVZhYg==
X-CSE-MsgGUID: 9j7iSDOoQMevB6BQvPsPFg==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:03 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4AE9F121F87;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045pi-3DOt;
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
Subject: [PATCH v12 73/86] media: ipu6: Collect IPU streams into CSI-2 receiver sub-device context
Date: Thu,  9 Apr 2026 23:14:48 +0300
Message-ID: <20260409201501.975242-74-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58390-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1BF2B3CF50A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Collect the IPU streams to the CSI-2 receiver sub-device's context.

The background is that an IPU stream is bound to a CSI-2 virtual channel
but in a V4L2 pipeline there's no such assumption. Therefore a pipeline
may contain multiple virtual channels and so multiple IPU streams, too.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c  | 10 +++++++++-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h  |  1 +
 drivers/media/pci/intel/ipu6/ipu6-isys-video.h |  1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 93ae5f767cc0..04825cdce7c0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -362,10 +362,12 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	int ret;
 
+	list_add(&av->csi2_entry, &csi2->av_head);
+
 	ret = ipu6_isys_start_stream_firmware(av);
 	if (ret) {
 		dev_err(sd->dev, "start stream of firmware failed\n");
-		return ret;
+		goto err_del_av;
 	}
 
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
@@ -397,6 +399,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	ipu6_isys_stop_streaming_firmware(av);
 	ipu6_isys_close_streaming_firmware(av);
 
+err_del_av:
+	list_del(&av->csi2_entry);
+
 	return ret;
 }
 
@@ -426,6 +431,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	ipu6_isys_close_streaming_firmware(av);
 
+	list_del(&av->csi2_entry);
+
 	return 0;
 }
 
@@ -571,6 +578,7 @@ int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
 	if (ret)
 		goto fail;
 
+	INIT_LIST_HEAD(&csi2->av_head);
 	csi2->asd.source = IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 + index;
 	csi2->asd.supported_codes = csi2_supported_codes;
 	snprintf(csi2->asd.sd.name, sizeof(csi2->asd.sd.name),
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index ce8eed91065c..bcddd5626531 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -38,6 +38,7 @@ struct ipu6_isys_csi2 {
 	struct ipu6_isys_subdev asd;
 	struct ipu6_isys *isys;
 	struct ipu6_isys_video av[NR_OF_CSI2_SRC_PADS];
+	struct list_head av_head;
 
 	void __iomem *base;
 	u32 receiver_errors;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index 80b9d0d001b1..c1d10a9f44f2 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -77,6 +77,7 @@ struct video_stream_watermark {
 
 struct ipu6_isys_video {
 	struct ipu6_isys_queue aq;
+	struct list_head csi2_entry;
 	/* Serialise access to other fields in the struct. */
 	struct mutex mutex;
 	struct media_pad pad;
-- 
2.47.3


