Return-Path: <linux-media+bounces-58400-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cE8BIakJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58400-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:18:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2594A3CF5B4
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5A0930610FB
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3240333B6C8;
	Thu,  9 Apr 2026 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiHoIiDk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4F633A9FF
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765719; cv=none; b=Pt6E7tZlATXIKl5H1LIE3U/HVYgVRB3LRBGfQNb65H1uqoPu7ik7Yn24jYv2jojiu+sBTqQlQ9sqV4XmAD71ehAk37Cqco9qpnE0nCwMflnA1iS/kL6PHnHkLRbc8cgNAZxCzSRlXAwO32Ei7tchVAnxWHmpYxg2Wct7gfHOtOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765719; c=relaxed/simple;
	bh=x6xn59LKx/8AAWwY+VJ3nKo1Qs4nk64eOv+GcD0+pBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzfFM+zHhOM+6uLZ2yN4+vdLn5sIkz9xa+Kq6r89Qk4Bxd6R+fCAvaCBYiRCpS0TAWApP9hncJNfuzjV5BPnvDKvFAqIdxOOFVj4V1TC5NU7lcHT35BA+Rnh5PzhfPtQt7J3Fr4pylFTyrOhuwctWAsbrXgt6EOjY1krzACuK1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eiHoIiDk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765718; x=1807301718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x6xn59LKx/8AAWwY+VJ3nKo1Qs4nk64eOv+GcD0+pBc=;
  b=eiHoIiDk+tFYPt+ZQcxZUzEqV6mTQEP/ZXVuVerD45MSTxDOv8Wd1/Xk
   D1/eApqHciQCiSfIcsa6B8Sqn8odSB9vOzmdO8VkwKn2HFHX60lryDdzh
   1M+aAY+kqb1MZZrCuKuYkhjEf6YLw2+q+KhxNZQ2lk3sUVEApBjMUWNIh
   iBnjmi5nXfz0NJuTss/zJI+S6D7s4z5qFT5GhPyCKaRvV9fToXx2QEC/2
   HDoUkX1HCypCAjVIHa9RkH3vT0DqELmg2JmabcSSdtTaFgz8l8NW/pjel
   fsP2yT+Fan7lSsHDD2ieJr383TyJ4WCYdM37T6jn3n7S/xd5l4i9O7vLq
   A==;
X-CSE-ConnectionGUID: mmaYo13WTpeI3o4PoHAJLg==
X-CSE-MsgGUID: y/hgnu/nSqOmEdUvwDTZOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408833"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408833"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:10 -0700
X-CSE-ConnectionGUID: MDdEju3fTy29jisqfcpAzQ==
X-CSE-MsgGUID: VzV7tAuISjW0dIgOD56TEw==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:04 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 66F1A122102;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045qH-3hDo;
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
Subject: [PATCH v12 80/86] media: ipu6: Rework watermark setting
Date: Thu,  9 Apr 2026 23:14:55 +0300
Message-ID: <20260409201501.975242-81-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58400-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 2594A3CF5B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove structs to maintain watermark related configuration, by using the
values where they're obtained, apart from keeping watermark enabled status
in struct ipu6_isys.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 76 ++++++++----------------
 drivers/media/pci/intel/ipu6/ipu6-isys.h | 34 +----------
 2 files changed, 26 insertions(+), 84 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index aa892f86d17c..04058252ac01 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -98,6 +98,27 @@ enum ltr_did_type {
 	LTR_TYPE_MAX
 };
 
+struct ltr_did {
+	union {
+		u32 value;
+		struct {
+			u8 val0;
+			u8 val1;
+			u8 val2;
+			u8 val3;
+		} bits;
+	} lut_ltr;
+	union {
+		u32 value;
+		struct {
+			u8 th0;
+			u8 th1;
+			u8 th2;
+			u8 th3;
+		} bits;
+	} lut_fill_time;
+};
+
 #define ISYS_PM_QOS_VALUE	300
 
 static int isys_isr_one(struct ipu6_bus_device *adev);
@@ -403,20 +424,6 @@ static irqreturn_t isys_isr(struct ipu6_bus_device *adev)
 	return IRQ_HANDLED;
 }
 
-static void get_lut_ltrdid(struct ipu6_isys *isys, struct ltr_did *pltr_did)
-{
-	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
-	struct ltr_did ltrdid_default;
-
-	ltrdid_default.lut_ltr.value = LTR_DEFAULT_VALUE;
-	ltrdid_default.lut_fill_time.value = FILL_TIME_DEFAULT_VALUE;
-
-	if (iwake_watermark->ltrdid.lut_ltr.value)
-		*pltr_did = iwake_watermark->ltrdid;
-	else
-		*pltr_did = ltrdid_default;
-}
-
 static int set_iwake_register(struct ipu6_isys *isys, u32 index, u32 value)
 {
 	struct device *dev = &isys->adev->auxdev.dev;
@@ -512,21 +519,14 @@ static void set_iwake_ltrdid(struct ipu6_isys *isys, u16 ltr, u16 did,
  */
 static void enable_iwake(struct ipu6_isys *isys, bool enable)
 {
-	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
 	int ret;
 
-	mutex_lock(&iwake_watermark->mutex);
-
-	if (iwake_watermark->iwake_enabled == enable) {
-		mutex_unlock(&iwake_watermark->mutex);
+	if (isys->iwake_watermark_enabled == enable)
 		return;
-	}
 
 	ret = set_iwake_register(isys, GDA_ENABLE_IWAKE_INDEX, enable);
 	if (!ret)
-		iwake_watermark->iwake_enabled = enable;
-
-	mutex_unlock(&iwake_watermark->mutex);
+		isys->iwake_watermark_enabled = enable;
 }
 
 void ipu6_isys_update_watermark_setting(struct ipu6_isys *isys)
@@ -580,7 +580,8 @@ void ipu6_isys_update_watermark_setting(struct ipu6_isys *isys)
 		did = calc_fill_time_us * DEFAULT_DID_RATIO / 100;
 		ltr_did_type = LTR_ENHANNCE_IWAKE;
 	} else {
-		get_lut_ltrdid(isys, &ltrdid);
+		ltrdid.lut_ltr.value = LTR_DEFAULT_VALUE;
+		ltrdid.lut_fill_time.value = FILL_TIME_DEFAULT_VALUE;
 
 		if (calc_fill_time_us <= ltrdid.lut_fill_time.bits.th0)
 			ltr = 0;
@@ -637,30 +638,6 @@ void ipu6_isys_update_watermark_setting(struct ipu6_isys *isys)
 	       isys->adev->isp->base + REG_PKGC_PMON_CFG);
 }
 
-static void isys_iwake_watermark_init(struct ipu6_isys *isys)
-{
-	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
-
-	INIT_LIST_HEAD(&iwake_watermark->video_list);
-	mutex_init(&iwake_watermark->mutex);
-
-	iwake_watermark->ltrdid.lut_ltr.value = 0;
-	iwake_watermark->isys = isys;
-	iwake_watermark->iwake_enabled = false;
-	iwake_watermark->force_iwake_disable = false;
-}
-
-static void isys_iwake_watermark_cleanup(struct ipu6_isys *isys)
-{
-	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
-
-	mutex_lock(&iwake_watermark->mutex);
-	list_del(&iwake_watermark->video_list);
-	mutex_unlock(&iwake_watermark->mutex);
-
-	mutex_destroy(&iwake_watermark->mutex);
-}
-
 /* The .bound() notifier callback when a match is found */
 static int isys_notifier_bound(struct v4l2_async_notifier *notifier,
 			       struct v4l2_subdev *sd,
@@ -1094,8 +1071,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	if (ret < 0)
 		goto out_remove_pkg_dir_shared_buffer;
 
-	isys_iwake_watermark_init(isys);
-
 	if (is_ipu6se(adev->isp->hw_ver))
 		isys->phy_set_power = ipu6_isys_jsl_phy_set_power;
 	else if (is_ipu6ep_mtl(adev->isp->hw_ver))
@@ -1154,7 +1129,6 @@ static void isys_remove(struct auxiliary_device *auxdev)
 	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
 		mutex_destroy(&isys->streams[i].mutex);
 
-	isys_iwake_watermark_cleanup(isys);
 	mutex_destroy(&isys->stream_mutex);
 	mutex_destroy(&isys->mutex);
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index c171e4e053c3..0689b4485c7f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -60,38 +60,6 @@ struct ipu6_bus_device;
 #define IPU6EP_MTL_LTR_VALUE			1023
 #define IPU6EP_MTL_MIN_MEMOPEN_TH		0xc
 
-struct ltr_did {
-	union {
-		u32 value;
-		struct {
-			u8 val0;
-			u8 val1;
-			u8 val2;
-			u8 val3;
-		} bits;
-	} lut_ltr;
-	union {
-		u32 value;
-		struct {
-			u8 th0;
-			u8 th1;
-			u8 th2;
-			u8 th3;
-		} bits;
-	} lut_fill_time;
-};
-
-struct isys_iwake_watermark {
-	bool iwake_enabled;
-	bool force_iwake_disable;
-	u32 iwake_threshold;
-	u64 isys_pixelbuffer_datarate;
-	struct ltr_did ltrdid;
-	struct mutex mutex; /* protect whole struct */
-	struct ipu6_isys *isys;
-	struct list_head video_list;
-};
-
 struct ipu6_isys_csi2_config {
 	u32 nlanes;
 	u32 port;
@@ -141,6 +109,7 @@ struct ipu6_isys {
 	bool need_reset;
 	bool icache_prefetch;
 	bool csi2_cse_ipc_not_supported;
+	bool iwake_watermark_enabled;
 	unsigned int ref_count;
 	unsigned int stream_opened;
 	unsigned int sensor_type;
@@ -162,7 +131,6 @@ struct ipu6_isys {
 	struct list_head framebuflist;
 	struct list_head framebuflist_fw;
 	struct v4l2_async_notifier notifier;
-	struct isys_iwake_watermark iwake_watermark;
 };
 
 struct isys_fw_msgs {
-- 
2.47.3


