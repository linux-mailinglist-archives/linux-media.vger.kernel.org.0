Return-Path: <linux-media+bounces-9574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7E78A74EB
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 403681C21E3C
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FE513A3E8;
	Tue, 16 Apr 2024 19:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbEEA2yq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7832B13AA2A
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296040; cv=none; b=EjmSuDUJ/4OYJL9FqlGcfW7J7Q0Mya+VMmW/OsCpQAPxxtnSUPoAW0b2IwjpV4dHyCV8W8c6LnPK+YOdAD6lEsY90f3NG5XqCg8+LS/WfJZaQLR54uc0+Mv9Mm5bc8ih0YZUvZARReVKUlNkBaH5sSDtd5yXmv5I3MDLBb3CtTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296040; c=relaxed/simple;
	bh=N2yHA+6k5HIx92G2Kw66zz4ryid9cXzLGZvOz6A9d5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ltFsD8aoQ4WbS9e2rPh0LbZMMdw/hP2Om60xFBDMa8WxCHt4V5957uPG7AhRk1DZAQIiSwuAAMUcWU59UfmArigdzr91o5WfKhlXbwa0A5RH84Z/foUajmX+s4uyv/3c1DGlaQojrxXdFV8Sxhx8apknBST2sobGEj/y9rdmjZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbEEA2yq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296039; x=1744832039;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N2yHA+6k5HIx92G2Kw66zz4ryid9cXzLGZvOz6A9d5U=;
  b=jbEEA2yqjisPuW7bwFufT1qZIh1dS6C2QkwAxHaQSj8khdj+sbEEFSSr
   ynfitjdRx1iB8xATAY1L3kiYlBDrzGlkGEFcDcWGmy3+YckUN+JjrdPVN
   O5UkBFkzRDHw5JBSFumPTkdDQ+RT/IwDstQI/5DEJTUyTtNgNfTjcfF6s
   SLYRxB7ukPYYVFGc3WebLmvz0IkS1tOxq9QOjYgeCsyFPftYK/5xPZntQ
   pZEmNWo4DC6EouFGI7I9CkwJBYtNFErgfAWz6OzdOhmKICPonUYQKTzAb
   93jgqa/oJtLRqQ867RLuxYjs2AwmgE0lyue5Afza9D0lGjwBaWPRApYIb
   g==;
X-CSE-ConnectionGUID: 49RQmtUDSzqKarUgJ5hbdw==
X-CSE-MsgGUID: cyQvIUqNTvyxrh3DG4C/8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929809"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929809"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:59 -0700
X-CSE-ConnectionGUID: GLBo+bvoRTK+TKFOVbeZKw==
X-CSE-MsgGUID: DLBojPgXTs2Q7uObDncVDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22380187"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:56 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4E8A41204F9;
	Tue, 16 Apr 2024 22:33:53 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v9 23/46] media: ccs: Move ccs_validate_csi_data_format up
Date: Tue, 16 Apr 2024 22:32:56 +0300
Message-Id: <20240416193319.778192-24-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ccs_validate_csi_data_format() will soon be needed elsewhere, above its
current location. Move it up.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index c39ee4394534..a711233f6fbf 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1980,6 +1980,20 @@ static int ccs_post_streamoff(struct v4l2_subdev *subdev)
 	return pm_runtime_put(&client->dev);
 }
 
+static const struct ccs_csi_data_format
+*ccs_validate_csi_data_format(struct ccs_sensor *sensor, u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
+		if (sensor->mbus_frame_fmts & (1 << i) &&
+		    ccs_csi_data_formats[i].code == code)
+			return &ccs_csi_data_formats[i];
+	}
+
+	return sensor->csi_format;
+}
+
 static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
@@ -2115,20 +2129,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 	}
 }
 
-static const struct ccs_csi_data_format
-*ccs_validate_csi_data_format(struct ccs_sensor *sensor, u32 code)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
-		if (sensor->mbus_frame_fmts & (1 << i) &&
-		    ccs_csi_data_formats[i].code == code)
-			return &ccs_csi_data_formats[i];
-	}
-
-	return sensor->csi_format;
-}
-
 static int ccs_set_format_source(struct v4l2_subdev *subdev,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
-- 
2.39.2


