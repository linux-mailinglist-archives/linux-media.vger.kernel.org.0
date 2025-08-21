Return-Path: <linux-media+bounces-40579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE9EB2F922
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7CBB7ABFBE
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EB32DA76E;
	Thu, 21 Aug 2025 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kX118QcS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8437D320CDB
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755781209; cv=none; b=TFLpmml+03a2/GzCCLdsONBjbyN3Vw3WoURD4NCFxaWlNvatBWDMmJR/k2eS8aVBEkSO5fveGAJdVJgEKgHGWuUWgoKoWoIQgMNDgkw9zUynLUNm/mRbEZq/v31ZdoMO6QDJ+kN2hC614YiH1oG0PHtJlDbll0+cl3B7a+hGXgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755781209; c=relaxed/simple;
	bh=Ff0bgQbs94VW+LUhdDkltHKYA/BTJgCATk1N+h526s8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sc+o7sLfxNnTob9TBXgCj2FasLMP2xtkziluf6oq5V9qbxr+9NK0bENAm8E2JlNbu/kQnHX/76EwHWBUaC1Sm0dbVaaj/OckJ51BRy5gQRSLWkhhRVNvnt1886Pm5u8ynw1XJq8hb2ldUERqrSx4hnRw1+p72JAiB4wQ3w5wv+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kX118QcS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755781207; x=1787317207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ff0bgQbs94VW+LUhdDkltHKYA/BTJgCATk1N+h526s8=;
  b=kX118QcSHlKwjZlqQftJWBZDUCfzwVCQ+HyDUAqixbq1NMZuSnCNujky
   0QltK30TrXvF2/utWb/nApvnarvOQBO7mevleH146hW/zkWUk7HrpO81S
   tdgaETioHqDXCssOLtCcASzC6M+tKmfE3AbOHvGp0xDs+8OaknExpeB1m
   Zg2PLU1kM2U+OX4BNXQSKFHp0XGIGPDZ4Z1ukqkS0rzB1QEBZlq0poy7u
   Z8yBFKmJ24zUkXgkgqlkF1GWcu8yE8fK3VbZXDnmeuYi65YDjzgNVNrUa
   /hDTcZLXzjfmHAyxnAYnBdi7LhRr4XSBbM5jTrsxOQll0y5E3tMYEvSRu
   Q==;
X-CSE-ConnectionGUID: M2BElkllQ6moI1/9IkasLw==
X-CSE-MsgGUID: 2Rk9lyjzQredvdqenKkw3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58018267"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="58018267"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:00:05 -0700
X-CSE-ConnectionGUID: vdicTshoRRm/K5Ay6xjfZQ==
X-CSE-MsgGUID: tGh+ehYpR6ifX7UKNoJFiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="199278782"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:00:02 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DCD5B12083F;
	Thu, 21 Aug 2025 15:59:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1up4tb-00000002K2o-3eFy;
	Thu, 21 Aug 2025 15:59:59 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Keke Li <keke.li@amlogic.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 3/3] media: v4l2-common: Update v4l2_get_link_freq() documentation
Date: Thu, 21 Aug 2025 15:59:59 +0300
Message-ID: <20250821125959.553681-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250821125959.553681-1-sakari.ailus@linux.intel.com>
References: <20250821125959.553681-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document that v4l2_get_link_freq() obtains the link frequency primarily
by calling the get_mbus_config sub-device pad operation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/media/v4l2-common.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index ab0ce8e605c3..e31b4434ea5d 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -566,10 +566,12 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
  * @div: The divisor between pixel rate and link frequency. Number of data lanes
  *	 times two on D-PHY, 1 on parallel. 0 otherwise.
  *
- * This function is intended for obtaining the link frequency from the
- * transmitter sub-device's pad. It returns the link rate, either from the
- * V4L2_CID_LINK_FREQ control implemented by the transmitter, or value
- * calculated based on the V4L2_CID_PIXEL_RATE implemented by the transmitter.
+ * This function obtains and returns the link frequency from the transmitter
+ * sub-device's pad. The link frequency is retrieved using the get_mbus_config
+ * sub-device pad operation. If this fails, the function falls back to obtaining
+ * the frequency either directly from the V4L2_CID_LINK_FREQ control if
+ * implemented by the transmitter, or by calculating it from the pixel rate
+ * obtained from the V4L2_CID_PIXEL_RATE control.
  *
  * Return:
  * * >0: Link frequency
-- 
2.47.2


