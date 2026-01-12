Return-Path: <linux-media+bounces-50425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8167D11AE4
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC04830499E7
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF95290DBB;
	Mon, 12 Jan 2026 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQ2ZbpYy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4314F285072
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212017; cv=none; b=bWw45Vyxjvc0O8rSEJSNEjWCyRhxbx8wVgCvKPEvJJAowN1XCB5XTHrLCqMlKXiVX63GVx8lFIgiI9BSB6SdQPYlQ9ulJl9jjpwXmd/iHF0YuRj98ZBwQls13jTKSOhEVz1GBxUtXn2A5PK1rL0YsFDAWuNkg028uZXrYICyVuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212017; c=relaxed/simple;
	bh=E0Uhe0V2Qg8Bef4VP9VePcP9BvNCFOdkg32pifpoXMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpSF94AtBFEyrKgHvwxPjomINS9rdI5CTK2fndkCw/NsEkUTvMjdVaMTTPJo52JaJO03hWY+c4DjpZdN3A4XpkB6UFS80CsW7/qYw3fk2Amv+ZSkQ+bu/w8do+P47XYCuGL5iZ+gRpJ3oWnZp3cCsY00ZbQvhmZQiTEoxFp4TjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQ2ZbpYy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212016; x=1799748016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E0Uhe0V2Qg8Bef4VP9VePcP9BvNCFOdkg32pifpoXMo=;
  b=NQ2ZbpYy5aa+sWA4av7THEDFg3GVErzLa52OHy+3ekI+7j3qR6ildPQ0
   l0mzPPCNYjFt+e+hE5xPF1AZ87JKTUEP+szSIEnDsAuVZNNp8x6VvIXnY
   9zTGTLHijpf+XHepEfdZGeimI3qIztqdMx2B73AnwrufMdKehx7lLLaHF
   rOcA3Ji+Dwrk1tFAxa/YuTXehBDduA6UMojWg9uOoLUPiEkmoGVJxWDu8
   VvkSOZKOi6yTxhuQUHKgYrJb2+fkhQ2aCHV44ScHTaZy2nNqENOPzVZ+h
   r0How57azoxJRqprkjifo0fvhBvWmNhZntZqe48PMq2KQeg9b5WI+fgo7
   g==;
X-CSE-ConnectionGUID: 7SjQ9/okSW2JTtAX9FhvDg==
X-CSE-MsgGUID: wxQ2h6sRRRaR7352uMkEkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218817"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218817"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:00:01 -0800
X-CSE-ConnectionGUID: Ei3XKJGDRaaX2bd/IHfx3w==
X-CSE-MsgGUID: fjEEQQ+oTZaVyEB0PgDdmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743173"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:59 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5376C121FCE;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000012R-0qkD;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 18/23] media: i2c: ov01a10: Replace exposure->min/step with direct define use
Date: Mon, 12 Jan 2026 11:59:44 +0200
Message-ID: <20260112095949.3851-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hansg@kernel.org>

The exposure minimum and step are constant use the defines for this
instead of retrieving these from the exposure-control.

Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 1af0af00df24..76c75da4d7c8 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -366,9 +366,8 @@ static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
 		exposure_max = fmt->height + ctrl->val -
 			       OV01A10_EXPOSURE_MAX_MARGIN;
 		__v4l2_ctrl_modify_range(ov01a10->exposure,
-					 ov01a10->exposure->minimum,
-					 exposure_max, ov01a10->exposure->step,
-					 exposure_max);
+					 OV01A10_EXPOSURE_MIN, exposure_max,
+					 OV01A10_EXPOSURE_STEP, exposure_max);
 	}
 
 	if (!pm_runtime_get_if_in_use(ov01a10->dev))
-- 
2.47.3


