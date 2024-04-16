Return-Path: <linux-media+bounces-9589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ABE8A74FA
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B778B21C84
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184BF13BADA;
	Tue, 16 Apr 2024 19:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LT0d+Kl2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF4113B7A4
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296060; cv=none; b=XmKveF+99zMc0A0EvUd8eYjKKa8RypEq3d5IxoOr3CyxtsnD6z4bBKR6jaGy739FZOxUW7kH6MZzkLXN+HsuS+nym1TuATzCPusbAkwfCSmUd2fwEnZKQyxJyF0M9r14XWLU3//UJemKLxFg8MvE0qn3DbAqhGfeGdrHjTtYmRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296060; c=relaxed/simple;
	bh=4VxhYFM+IW/7q861Ak5yQv+JBl5nHqKZfRl/vrD3Qbs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i9806oRxlY+koIKEdPrzmQVHa9D+m2pJYi9phsecfEtcKJxVjL5m4Q8SL0N6gt9DpjA2YJOX3Fl8Rpzwy+ow34jfHSwV/2TiRQxaigGY0kHstJsp54VY3rg0v/G3/vBorwm9dM2LYIaC1laFhy/1yL7vIrt5NoOeFVEA8F7QaAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LT0d+Kl2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296059; x=1744832059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4VxhYFM+IW/7q861Ak5yQv+JBl5nHqKZfRl/vrD3Qbs=;
  b=LT0d+Kl2v0KtiJ8OOQMCL2Llx2EAvFtCjMuUrhnN0eySMeC8W8WgrGnZ
   rjqNk7N/uyl5wGLeAQVSqG7CRGV3AT/Q2cpSO1FpV5RCXCFxCFmXSPjEX
   9lCdZ1VG0+dzT3ofXByvr4xmI3TRLDlc5gMW3zXsu3XyNynrKpZDXz4XQ
   ozj0rMUpr+BiGLxyp74DBXxLaBV1Cxp2CF0QjrJIRdf1aH/O8t0GDK4ca
   pGo6FnfJ5clv6p4cX0RZ3/qnpdCliJIdBzubpH7GdkZFOwXYrEYlmcJj3
   hkyO4vZ/FGI1F5G1GiT2YZhkMvFAC98CWUxKM3nWZ+cK4qS6s+41S95C7
   w==;
X-CSE-ConnectionGUID: 78AW60hwSoK1y6Ui+BqcFQ==
X-CSE-MsgGUID: HC11kegMSdSX7VTNCdT7DQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929888"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929888"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:19 -0700
X-CSE-ConnectionGUID: U3wwd2j9SkuYWw2b4jOKlg==
X-CSE-MsgGUID: XlUq1Pc/Qk6rWR2mIP8gIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22380267"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:16 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E8D9B12056F;
	Tue, 16 Apr 2024 22:34:12 +0300 (EEST)
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
Subject: [PATCH v9 37/46] media: ov2740: Fix LINK_FREQ and PIXEL_RATE control value reporting
Date: Tue, 16 Apr 2024 22:33:10 +0300
Message-Id: <20240416193319.778192-38-sakari.ailus@linux.intel.com>
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

The driver dug the supported link frequency up from the V4L2 fwnode
endpoint and used it internally, but failed to report this in the
LINK_FREQ and PIXEL_RATE controls. Fix this.

Fixes: 0677a2d9b735 ("media: ov2740: Add support for 180 MHz link frequency")
Cc: stable@vger.kernel.org # for v6.8 and later
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 552935ccb4a9..57906df7be4e 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -768,14 +768,15 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	cur_mode = ov2740->cur_mode;
 	size = ARRAY_SIZE(link_freq_menu_items);
 
-	ov2740->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
-						   V4L2_CID_LINK_FREQ,
-						   size - 1, 0,
-						   link_freq_menu_items);
+	ov2740->link_freq =
+		v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
+				       V4L2_CID_LINK_FREQ, size - 1,
+				       ov2740->supported_modes->link_freq_index,
+				       link_freq_menu_items);
 	if (ov2740->link_freq)
 		ov2740->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	pixel_rate = to_pixel_rate(OV2740_LINK_FREQ_360MHZ_INDEX);
+	pixel_rate = to_pixel_rate(ov2740->supported_modes->link_freq_index);
 	ov2740->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					       V4L2_CID_PIXEL_RATE, 0,
 					       pixel_rate, 1, pixel_rate);
-- 
2.39.2


