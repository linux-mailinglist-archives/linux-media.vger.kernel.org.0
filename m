Return-Path: <linux-media+bounces-58399-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AODlIKgJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58399-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:18:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFAA3CF5AD
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90F1F3060D5F
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2752D335571;
	Thu,  9 Apr 2026 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2LfJms7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1027D336EC6
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765719; cv=none; b=X5aMQDqInK8Sjn4Gy2gtRk5oafG57ew2Yd44E7KBlSj89OpEi1yx+d0WflVX/n+obb5BN9WR3KRBk45d52BI+mDuLVEV7Bmn+DXFWBr4nTAqwzWbg2IH2w5g1klX6ivWNwFF3UyC204dC2YSjHAiVEOXrz6iw5N+Ip/EzA1lsaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765719; c=relaxed/simple;
	bh=lfyVPsDxVjYFGhqxZj2f8L3AnBVnq070ED1PUOLxuYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q0XLQ4vLvLnG7WAO09UXvYzUZP0P6w5J9Ui++GBCthwvMTQJNkzlg5IY7ke7U8MOrbJ3ocfbiHUwJDKB05py7RPx2gLdhV1gHzauBB7Z8N13lAPMRS4Eu7+N/PWS0NeST83aReLyd1T9gygW3MkPC5rLjuSZKmkH929ZMlBT1q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E2LfJms7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765718; x=1807301718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lfyVPsDxVjYFGhqxZj2f8L3AnBVnq070ED1PUOLxuYA=;
  b=E2LfJms7jGJY77oP40P4x+a4OqT8XZBCn2C0zPcT7VpsZqH5IdS4/XuY
   qHHAcD+Lywt6BjxhsZYIINnGt3NUkNZ8zzH5nhYaToUtvXvlPEF9XC6I8
   p0dtd/Re7Kk0uNRQfqMtU6/KmRGun2YTRx9i9U6D4RYFKQe4syMNH6EpR
   8PpRMHii3SPAlgXFFbuLi7rx9QAG+b7nrhpUrqIIlpLuX7kVka5iDojVu
   yO2hte8XFiR5UTXvBteZXtWqS0E5kwYSyt7K1X33DbIMgTyeDfiHbYhYI
   49IFOoPSTe2G0Zz5mdgWKY8FhFl+Y9D7CJCV2nvwNoK4YRI4NRTmNQyux
   w==;
X-CSE-ConnectionGUID: 1cvFRIMESN24XHPZYHPlFA==
X-CSE-MsgGUID: Hcp7B5OiTz6mKe/IRZuVVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408822"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408822"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:10 -0700
X-CSE-ConnectionGUID: 7baRky+YTKyHQMoBxMHNXQ==
X-CSE-MsgGUID: grOGg+HrSga7AcQJ3fVWLA==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:04 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5AC04122036;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045q2-3Udh;
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
Subject: [PATCH v12 77/86] media: ipu6: Collect enabled stream IDs
Date: Thu,  9 Apr 2026 23:14:52 +0300
Message-ID: <20260409201501.975242-78-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58399-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: DFFAA3CF5AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Collect enable stream IDs as streaming is enabled on video nodes. These
values will be needed once streaming actually starts. This is required for
multiple streams from a single source.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 27 ++++++++++++-------
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  1 +
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index c2f4ea444e8e..77e13644746d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -381,6 +381,10 @@ static bool ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
 		return true;
 	}
 
+	dev_dbg(asd->sd.dev, "not setting streaming %s %s (%u/%u)\n",
+		str_enabled_disabled(enable), enable ? "yet" : "anymore",
+		nodes_streaming, streams_enabled);
+
 	return false;
 }
 
@@ -403,6 +407,11 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 
 	list_add(&av->csi2_entry, &csi2->av_head);
 
+	sink_streams =
+		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
+						&streams_mask);
+	csi2->stream_ids |= sink_streams;
+
 	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, true))
 		return 0;
 
@@ -412,13 +421,6 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 		goto err_del_av;
 	}
 
-	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-
-	sink_streams =
-		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
-						&streams_mask);
-
 	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
 	if (ret)
 		goto err_stop_stream_firmware;
@@ -427,8 +429,11 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto err_stop_stream_firmware;
 
+	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
 	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index,
-					 sink_streams);
+					 csi2->stream_ids);
 	if (ret)
 		goto err_stop_stream_csi2;
 
@@ -444,6 +449,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	ipu6_isys_close_streaming_firmware(av);
 
 err_del_av:
+	csi2->stream_ids &= ~sink_streams;
 	list_del(&av->csi2_entry);
 
 	return ret;
@@ -471,6 +477,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
 						&streams_mask);
 
+	csi2->streaming = false;
+
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
@@ -478,7 +486,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
 
-	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, sink_streams);
+	v4l2_subdev_disable_streams(remote_sd, remote_pad->index,
+				    csi2->stream_ids);
 
 	ipu6_isys_close_streaming_firmware(av);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index 9178638edd37..5ff7af0ab274 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -45,6 +45,7 @@ struct ipu6_isys_csi2 {
 	unsigned int nlanes;
 	unsigned int port;
 	bool streaming;
+	u64 stream_ids;
 };
 
 struct ipu6_isys_csi2_timing {
-- 
2.47.3


