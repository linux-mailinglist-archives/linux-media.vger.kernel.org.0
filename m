Return-Path: <linux-media+bounces-40989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69693B33C00
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6904188498B
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EDD2D8763;
	Mon, 25 Aug 2025 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJrS5Klh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2DF2D7DFF
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115523; cv=none; b=MkC7jjjK98fWM+jin8+jTzIqayGCR/I3cEei7xL0TRv0ktuTGDHxl9idt6HUECJ9LU/wcumZd6j2A63FIAcmNFrjhVPXqYkMgZ1OyX5T7VPfFal9jQeFPy929zcrZVSff1ClWluAANr1+DXctyJVG0cdhlpzbnsFgROK8v/dwPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115523; c=relaxed/simple;
	bh=v0n68jrK6oMpT3+HCuRJp+0qPiQJk28KDz0G7wlD8uI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uThLLEquS5cSmTRwRIMzoUz//jsKfMPQOn6O51Y273HSxkmfxcME18LzJeMBbrO2pNiUBJEnqeTr2u9CTcgjaJMEY7MAh7Rs7HysjwIMi6YcIc2cWtvPUUgeXEm4wUSRO+HRGy/c5ZLdM+5C06WMHc4V28DRY0C6q3a7hfmVgDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJrS5Klh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115522; x=1787651522;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v0n68jrK6oMpT3+HCuRJp+0qPiQJk28KDz0G7wlD8uI=;
  b=LJrS5KlhjJgkr56EMKJBmnbTLKn/gqEyaKF+923Sh4wVujNjuK+aqOnz
   7re+LMbOz+Rb9pFuDvdumZb8mzB3Aw27aNLdaE2aBTOP8ocfK0ItGYASg
   ppxDZiBf4jkZ85Pd9UWorE3tMv8/kIZrFWSVYFBuOo5CAMBe5mpEW2N2/
   qTGjtM0EDbrkf9CEzGiRG4uztGwT7oMkavuFwI4TnK20uK7P4W+wfHkoc
   /2wp5co4ajDqiMXWdpmzVuh04YvsZPAsAyOjo+BCnyh63PpJuRkYWxngY
   i4SqBEWlYp068XUfVzaG05LITArxZEyuydix7+G8er9Lls0kCCCum1LCP
   Q==;
X-CSE-ConnectionGUID: q3JzEi+8QReKmdv+lcEJ0g==
X-CSE-MsgGUID: yGE85c9VRgCeq/POubbC9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032471"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032471"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:54 -0700
X-CSE-ConnectionGUID: AHFNNcFLREiFvr1dkQZ9LQ==
X-CSE-MsgGUID: By4EV3mqTJ+Nb7btqPxYPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431154"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:47 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 57869122011;
	Mon, 25 Aug 2025 12:51:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr3-00000005aiM-1L2r;
	Mon, 25 Aug 2025 12:51:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 64/66] media: ccs: Add frame descriptor quirk
Date: Mon, 25 Aug 2025 12:51:05 +0300
Message-ID: <20250825095107.1332313-65-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c  | 3 +++
 drivers/media/i2c/ccs/ccs-quirk.h | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 44e7c3a2f95a..ed63a8501723 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2917,6 +2917,9 @@ static int ccs_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
 	struct v4l2_mbus_frame_desc_entry *entry = desc->entry;
 	struct v4l2_subdev_state *sd_state;
 
+	if (ccs_has_quirk(sensor, frame_desc))
+		return ccs_call_quirk(sensor, frame_desc, desc);
+
 	switch (sensor->hwcfg.csi_signalling_mode) {
 	case CCS_CSI_SIGNALING_MODE_CSI_2_DPHY:
 	case CCS_CSI_SIGNALING_MODE_CSI_2_CPHY:
diff --git a/drivers/media/i2c/ccs/ccs-quirk.h b/drivers/media/i2c/ccs/ccs-quirk.h
index 392c97109617..3e1d9eaa33fa 100644
--- a/drivers/media/i2c/ccs/ccs-quirk.h
+++ b/drivers/media/i2c/ccs/ccs-quirk.h
@@ -36,6 +36,7 @@ struct ccs_sensor;
  *			 access may be done by the caller (default read
  *			 value is zero), else negative error code on error
  * @flags: Quirk flags
+ * @frame_desc: Obtain the frame descriptor
  */
 struct ccs_quirk {
 	int (*limits)(struct ccs_sensor *sensor);
@@ -46,6 +47,8 @@ struct ccs_quirk {
 	int (*init)(struct ccs_sensor *sensor);
 	int (*reg_access)(struct ccs_sensor *sensor, bool write, u32 *reg,
 			  u32 *val);
+	int (*frame_desc)(struct ccs_sensor *sensor,
+			  struct v4l2_mbus_frame_desc *desc);
 	unsigned long flags;
 };
 
@@ -62,6 +65,10 @@ struct ccs_reg_8 {
 		.val = _val,		\
 	}
 
+#define ccs_has_quirk(sensor, _quirk)					\
+	((sensor)->minfo.quirk &&					\
+	 (sensor)->minfo.quirk->_quirk)
+
 #define ccs_call_quirk(sensor, _quirk, ...)				\
 	((sensor)->minfo.quirk &&					\
 	 (sensor)->minfo.quirk->_quirk ?				\
-- 
2.47.2


