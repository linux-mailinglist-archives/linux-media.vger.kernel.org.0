Return-Path: <linux-media+bounces-12163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE1E8D3A6E
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 17:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13B91286C24
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 15:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA5317DE21;
	Wed, 29 May 2024 15:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hk54B5XL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031EE15A861
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 15:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716995673; cv=none; b=LKYhaBOflrtrSqkLX/91oQSXwsayV8OiKp2qblXnZ9aMXx4bgpsqPsE+gW/onJMOKcvT7JZOwDLLzjwCdjBumZiGKm5ccW8X0AcQQT6MTnWDdx7ICq8EiAtU25U9xdQ0LmU/SVLiisxmb8Wn/gk9SOLPiCLTz7QvKX1zr/+zL+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716995673; c=relaxed/simple;
	bh=hqm4r7WgZOsPIw3Rzaax3zrAqKNvHaSKDgj+OADkAjg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q5XxhDq5V8mxSVnL8GZl7vgRio3Nlia7Ti2VRqrWS9zUPL+IpAPN1DQVYqjaA1HJzJYqvFzeAPkL8kF0uE/no9cEZhaCTnBkDnpgG6Mm8vaf8U7VplrWSXEf+IdxvPU9yh6lGmqvpY5eT5SemIuvlatRArZwwPly76Bc0aJvAvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hk54B5XL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716995672; x=1748531672;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hqm4r7WgZOsPIw3Rzaax3zrAqKNvHaSKDgj+OADkAjg=;
  b=hk54B5XLJRukSEGqZzq4bvvk+upVPxgCAWXeZVaOCq6mFETXwQxrHCHN
   ue89HBL2gX8VGtD3wtNBh4UqdkMjVskXwbEMwhTShmkJBVgaGYoE1WcB0
   2sJm5/RpdL6ctRMnIQky4kJ01dQpb1+zItL+XLpMbLQQqsH0TLvcsDpUw
   cm/D8honcQ20NwvxdTacjQdrZbGjrdkMjSm3/hV0BJAQeI9jJ0eu45ANL
   5r4kWBpQBigUGaJ4WU/c081lTjzoSGC5s4toKzPgnxqDimcGBJ7tKRbCE
   S1xT1Po5XUnSWeCikEnzF/k6qM+bdp65vRGstKbv1lP+rf9bDXFN/rs5L
   Q==;
X-CSE-ConnectionGUID: Wz5OlgqYR2GtjmkmLnEYSw==
X-CSE-MsgGUID: iE32ktSaSoemkWW1CG4k0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30908584"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="30908584"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 08:14:30 -0700
X-CSE-ConnectionGUID: LCfihIgFSoOj/UZiQA0mNQ==
X-CSE-MsgGUID: SWVAjpRSTXyBiOqU1e2PjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="35942358"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 08:14:29 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CB8F611FA4A;
	Wed, 29 May 2024 18:14:26 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sCL0U-00CDF1-2Y;
	Wed, 29 May 2024 18:14:26 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH 1/1] media: v4l2-cci: Always assign *val
Date: Wed, 29 May 2024 18:14:15 +0300
Message-Id: <20240529151415.2910827-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Always assign *val to 0 in cci_read(). This has the benefit of not
requiring initialisation of the variables data is read to using
cci_read(). Once smatch is fixed, it could catch the use of uninitialised
reads.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/v4l2-core/v4l2-cci.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
index ee3475bed37f..1ff94affbaf3 100644
--- a/drivers/media/v4l2-core/v4l2-cci.c
+++ b/drivers/media/v4l2-core/v4l2-cci.c
@@ -23,6 +23,15 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
 	u8 buf[8];
 	int ret;
 
+	/*
+	 * TODO: Fix smatch. Assign *val to 0 here in order to avoid
+	 * failing a smatch check on caller when the caller proceeds to
+	 * read *val without initialising it on caller's side. *val is set
+	 * to a valid value whenever this function returns 0 but smatch
+	 * can't figure that out currently.
+	 */
+	*val = 0;
+
 	if (err && *err)
 		return *err;
 
-- 
2.39.2


