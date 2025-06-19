Return-Path: <linux-media+bounces-35323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1B7AE04F6
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ECE417803F
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2B925B1F4;
	Thu, 19 Jun 2025 11:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mEeOLA8j"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5193025B669
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334369; cv=none; b=LZDGFb7X7HLooAa2pEqB4RIvcor7pOhb4cdnSXY9J5Qp3UWyE0ASHYjfqI3bW+U+HDqz+STHlGJQYvBH5swuZn3ooN15MPRs9nr6RD7UWCvLlOoJOO6Bmk98WZwOljk496F67/Na/mBpY2DFkr9mrxmnD1G3Rwm7XRP7LoNewOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334369; c=relaxed/simple;
	bh=nwXmbukpY0qg+pcGZbyYZD1BlW1pB/kDnr1NPtzk6xk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QaWX3y6cWhh/wXXiB7pqWqQ5NC8FHV/6+1qplNLWdtdk1YQLRXYtH1IofJgDLM19/Nx66feIhtnM5R/2eptz+gQLDz3Wg/MNWeymcvGahIrbbO2EtmbPtWu5cBM0XpFpZAtpiHIQtcbW2R+35SeO0SG68E05WqJiIXIPNuDRS30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mEeOLA8j; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334368; x=1781870368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nwXmbukpY0qg+pcGZbyYZD1BlW1pB/kDnr1NPtzk6xk=;
  b=mEeOLA8jns3N8aVTmvGr7ruBKfkiVbg7BM3t0Vo+0hDklBSGaqIO5hWM
   uDapVwhXBsYBAOSRkcmrC5qSA3TUVurxSb8kA6TXk86KFTmCJIUSIJxPF
   LB3aOG30b9biN7YO5jd8HmanTmsSOHlbImc47QyeRQSWWgq3EgXZhe3+q
   f956QyjUi7qkV+na+MMk35crnVCgVMQv7JZAuYJLXE5L3pkv3w451muNh
   B9nQTCBgs1qiyg2aCGAT0e51M9CUrhqE8MvO6GzM9b7xegDZD0eWEUKOp
   KIzFx+HdpDh6MDN6SJuetBJ9gdG1Me4ZtBKZGVlRbjIF7UE4UCLPCfLQW
   A==;
X-CSE-ConnectionGUID: 7qNGIB7uSGKlr+AynyQzTQ==
X-CSE-MsgGUID: MY0guUteTq26iamg67Kokg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386900"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386900"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:20 -0700
X-CSE-ConnectionGUID: NvsZflL7RBa6RSqxWJiC8w==
X-CSE-MsgGUID: uXbYorFHTPmB595s2vX/UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908529"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:13 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 78A55123294;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AMU-1V;
	Thu, 19 Jun 2025 14:58:37 +0300
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
Subject: [PATCH v10 61/64] media: ccs: Add frame descriptor quirk
Date: Thu, 19 Jun 2025 14:58:33 +0300
Message-Id: <20250619115836.1946016-62-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
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
index 1bb390c9ac54..0376e4844820 100644
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
2.39.5


