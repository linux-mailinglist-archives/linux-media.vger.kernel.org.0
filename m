Return-Path: <linux-media+bounces-58392-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNoAAHAJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58392-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2F23CF52E
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37E76304DCAC
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050DF3290C7;
	Thu,  9 Apr 2026 20:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QR9RtkFm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9833385B9
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765715; cv=none; b=oMG13bD0ngfe00wXKJrmgMSP8icCmcmdO/5z5qBE8nF6DgaG3lj6Tu2MFPb0YMIt9xL8M6XrWTiA0xr+9L1PXgjB3hPeewSOky05hIhc4lKtyqnwKnrDa9guCllatswSMpPkoTVVIZJbcYpe9uSMKKkWZfZFHcILE4zcFsdEV98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765715; c=relaxed/simple;
	bh=TyS2A07ntC0x7n8FhO/LjHru+8LoldKLwUDddESLnB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AK7O1/6j1e67pP5lvCqExuXt+3meMY1P8tjyjkfPJUU79Xh24Pw6VTPR5Qcue4ObtKxyfrUdDb3OortWvQIHD5T131Pq/AcWBYXuVKEOq94bSSMvPYmCzJVNOr10MRqIPXEC1IF5d+OnUOvJQPTrsdPW14zGuFfcCs1lzP2Txe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QR9RtkFm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765713; x=1807301713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TyS2A07ntC0x7n8FhO/LjHru+8LoldKLwUDddESLnB8=;
  b=QR9RtkFmK78VbUPBlFgIoKaWtflUVJ4LgKZywkPCkQnNyN34xxoXAPxg
   l9Rkv2rhl4mH6Dp4N6P/fsG4nDJW8oc+u9bHX37aIdi8XkXAdMdQvlSM8
   eR0pNhgEVRLIxH+Ub2dNkaV2Xq/AoAySnaVYogFv0tQdoMg1Xo05HHif0
   UE9LqXbCKTUqGRkLNoznB8CYb7xMnBgqRu3q++11RJTqBCPVJr0qm3W20
   AEgD20Q9+6jxRALv41IPWobnyQl05sjZ+F9oPx59t+lOBUnYgj8uUichL
   3ERjKkstPgRUq7DKyWrtpjinSZj3qL+FzZonMgCY+Som5zmMq4HETnEcQ
   A==;
X-CSE-ConnectionGUID: gJDpDB0mSSeL/BkhXcqPmw==
X-CSE-MsgGUID: OxPpAqdLTxOe5xB01re7Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408721"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408721"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:10 -0700
X-CSE-ConnectionGUID: PU1d5PAcTg6oH9fjRTSwkA==
X-CSE-MsgGUID: OBMY6ZgbQlCeDIv4X4LnzA==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:03 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 44869121F78;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045pY-34xV;
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
Subject: [PATCH v12 71/86] media: ipu6: Clean up link frequency calculation
Date: Thu,  9 Apr 2026 23:14:46 +0300
Message-ID: <20260409201501.975242-72-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58392-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C2F23CF52E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Handle link_freq <= as a special case and continue calculating the pixel
rate otherwise.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 37 ++++++++-----------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index eebce7593b3f..0da9070aeb42 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -750,12 +750,9 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 	struct ipu6_isys_csi2 *csi2 = NULL;
 	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
 	struct device *dev = &isys->adev->auxdev.dev;
-	struct v4l2_mbus_framefmt format;
 	struct v4l2_subdev *esd;
 	struct v4l2_control hb = { .id = V4L2_CID_HBLANK, .value = 0 };
-	unsigned int bpp, lanes;
-	s64 link_freq = 0;
-	u64 pixel_rate = 0;
+	s64 link_freq;
 	int ret;
 
 	esd = media_entity_to_v4l2_subdev(source);
@@ -773,28 +770,26 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 
 	csi2 = ipu6_isys_subdev_to_csi2(av->stream->asd);
 	link_freq = ipu6_isys_csi2_get_link_freq(csi2);
-	if (link_freq > 0) {
-		struct v4l2_subdev_state *state =
-			v4l2_subdev_lock_and_get_active_state(&csi2->asd.sd);
-
-		lanes = csi2->nlanes;
-		format = *v4l2_subdev_state_get_format(state, 0,
-						       av->source_stream);
-		bpp = ipu6_isys_mbus_code_to_bpp(format.code);
-		pixel_rate = mul_u64_u32_div(link_freq, lanes * 2, bpp);
-
-		v4l2_subdev_unlock_state(state);
-	}
-
-	av->watermark.pixel_rate = pixel_rate;
-
-	if (!pixel_rate) {
+	if (link_freq <= 0) {
 		mutex_lock(&iwake_watermark->mutex);
 		iwake_watermark->force_iwake_disable = true;
 		mutex_unlock(&iwake_watermark->mutex);
-		dev_warn(dev, "unexpected pixel_rate from %s, disable iwake.\n",
+		dev_warn(dev, "unexpected link_freq from %s, disable iwake\n",
 			 source->name);
+		return;
 	}
+
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *format;
+	unsigned int bpp;
+
+	state = v4l2_subdev_lock_and_get_active_state(&csi2->asd.sd);
+	format = v4l2_subdev_state_get_format(state, 0, av->source_stream);
+	bpp = ipu6_isys_mbus_code_to_bpp(format->code);
+	v4l2_subdev_unlock_state(state);
+
+	av->watermark.pixel_rate = mul_u64_u32_div(link_freq, csi2->nlanes * 2,
+						   bpp);
 }
 
 static void calculate_stream_datarate(struct ipu6_isys_video *av)
-- 
2.47.3


