Return-Path: <linux-media+bounces-30805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67637A989DF
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F6F33AF80E
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E662927054E;
	Wed, 23 Apr 2025 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5OaU/6t"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC64526FA5D
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411662; cv=none; b=lVh1fjH9hE5Pd6F42V9ihXrA7vE1aFlHdmq+mBRsm+4OiENOYudI8O0JNKe/7znVh+k1Coot6oOyYTvRE9Af5hgs+dkxuZuAKeAVnUY+iIUXECoudVvwCvNX+ehJWOvXQ891iZJaLP3D3UlUqY+eiZj2wPitmwUOAJyw2DOuAG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411662; c=relaxed/simple;
	bh=CrVN4Jxk7W//kQeFeZRV/8HXh1DmqN70COwz1gwYYEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jr4iVa1wVQIjc48udr22petH82tH4KCbYVe5iZQ3mGea4TkQBPLqzLJtHbfo4sz9q+qUPU3IKg5CjAHQrkG49RHujLpCQ6q6lZPPbPKBfKjnCPo77EFHgCb1IzH+5jkWx/af3Z42EJy0WZhzPZ3s4/ENbsnsVErr4Jih7ZGk7Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5OaU/6t; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745411662; x=1776947662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CrVN4Jxk7W//kQeFeZRV/8HXh1DmqN70COwz1gwYYEk=;
  b=n5OaU/6tKc5ytV1rL3+xnjiQejFIPpjvKgKOew4mH8/lAP1hNGddap0M
   U2RayGK5KA7OeWV3xx+8wSWrjtkRfnfJwQ9svESNfECCMXmeKq9a3n2X+
   mSqZRoTFcwa4hj7bLrL2xCc1RWLmdf0t1qwei3NQfgfhR/hppx1rpnrzl
   wVuMX/eXrDnMufxGA2mib8SRSMfCwm/AehoexhqdYFSmMK8PxJh2hnoQR
   dr1jap9ZrGIzEanLKN4WgGd1Lz4SeXDo64556DsptaXRgPSbSZiT5fb6k
   CEd9VGiQkH1wcT+TNz4RlxaLq/dHsJAQdeBU+egU4SqC1B2p8VE5upUf+
   Q==;
X-CSE-ConnectionGUID: r0AWRExWQyOuSUUJO//WHA==
X-CSE-MsgGUID: +cvtegFjRfmvKv6eu7CXZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46704399"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46704399"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:18 -0700
X-CSE-ConnectionGUID: FbCbJEQrSH2hVhbvxae++w==
X-CSE-MsgGUID: NaHQyVHJQ2et6y7NjhRpPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132148619"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:16 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DBB4A122AFB;
	Wed, 23 Apr 2025 15:34:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u7ZIn-007YWB-2p;
	Wed, 23 Apr 2025 15:34:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dongcheng.yan@intel.com
Subject: [PATCH v3 10/11] media: ccs-pll: Print PLL calculator flags in the beginning
Date: Wed, 23 Apr 2025 15:33:58 +0300
Message-Id: <20250423123359.1800904-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423123359.1800904-1-sakari.ailus@linux.intel.com>
References: <20250423123359.1800904-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print the PLL calculator flags right away when the PLL calculator is
called. Previously this was done only in a successful case and that didn't
really help solving a problem when one happened.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs-pll.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 8de8158a413b..87798616b76d 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -123,8 +123,11 @@ static void print_pll(struct device *dev, const struct ccs_pll *pll)
 		pll->pixel_rate_pixel_array);
 	dev_dbg(dev, "pixel rate on CSI-2 bus:\t%u\n",
 		pll->pixel_rate_csi);
+}
 
-	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s%s%s\n",
+static void print_pll_flags(struct device *dev, struct ccs_pll *pll)
+{
+	dev_dbg(dev, "PLL flags%s%s%s%s%s%s%s%s%s%s%s\n",
 		pll->flags & PLL_FL(OP_PIX_CLOCK_PER_LANE) ? " op-pix-clock-per-lane" : "",
 		pll->flags & PLL_FL(NO_OP_CLOCKS) ? " no-op-clocks" : "",
 		pll->flags & PLL_FL(EVEN_PLL_MULTIPLIER) ? " even-pll-multiplier" : "",
@@ -738,6 +741,8 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	u32 i;
 	int rval = -EINVAL;
 
+	print_pll_flags(dev, pll);
+
 	if (!(pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL)) {
 		pll->op_lanes = 1;
 		pll->vt_lanes = 1;
-- 
2.39.5


