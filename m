Return-Path: <linux-media+bounces-47673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B281BC82C21
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 00:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 603B63ACFCE
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 23:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74772265CBE;
	Mon, 24 Nov 2025 23:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIuo3ynJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37DB158538;
	Mon, 24 Nov 2025 23:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764025251; cv=none; b=jJ5H87hAN5+1viBXfKcU7X40184Q9f4yqmVUYrUNYCYRF0R/LkGsLMmz2S44FVpnJcfouMtuP16TsbfT9Fo7D68QmIK7XYUaD6cmQ5LNDcPfLchwlVBWVLjEmMZT8B9Z1kJlHawYXsJuNzR3dv6JpOsziBHwegbzWMDYQ8dGT74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764025251; c=relaxed/simple;
	bh=UCA3d0FFln8ohnY08Q8wliMEd8mH8w3WnT7Cofp+e08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pCAW+bDGGnShglMIKRQuEOidSxA7tz1HXpEusUGZ4YJR38RyUy4mIYlTwUHEU+UGRIitAx9hsmno7BG27Afbze09Dug+cNjoRPrB+lcG8mx+U75rjWEUHwCDISYOXjDq2aPlvqJ8oD+nF6IExSOifYlmoXDUru9HmsSBc0GTsAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIuo3ynJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764025249; x=1795561249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UCA3d0FFln8ohnY08Q8wliMEd8mH8w3WnT7Cofp+e08=;
  b=TIuo3ynJjFdWM1ebl2JHv5qdcIjMMjLT3JlDft9wfwaHizRAf/65wnee
   6JsusVsuTCD3oEUDXt3THUWKCRo0pTTi5ETvzr1SlTX8q5QyZBz9RkAjX
   7dfEVmfujr74hF4bQYlwMj/Oas5InSZQ7usmpuBItEpGmZ9IQAqqFAffK
   CcEmtTOVZ0ePTrqdoBCSA4wHSo3MX/F/uyCLei/eMCPT7H6A/YL/Ik35J
   uSTtOrA792Lo38Cco2VcOcxyt69SI7XBZMJuOPows5H/v5hkqIYBkFNz9
   Ddfas735GNisTHaGaEcWHRekiLO0kF45JHMJDSez2tGWapBrKyF7oHd3x
   Q==;
X-CSE-ConnectionGUID: Q+c32qzYQG+5yMKSYRUNBA==
X-CSE-MsgGUID: s3MhGnFxTrmqNGH6fNyskQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69656990"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="69656990"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 15:00:49 -0800
X-CSE-ConnectionGUID: 5h6tVZjXT3mZEgOyo/JiKQ==
X-CSE-MsgGUID: 2wUOMFK5S46RMqCftbSb4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="192704659"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.126])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 15:00:47 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B0FB111F90E;
	Tue, 25 Nov 2025 01:00:46 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vNfY5-0000000DNSH-3ont;
	Tue, 25 Nov 2025 01:00:45 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] media: ccs: Avoid possible division by zero
Date: Tue, 25 Nov 2025 01:00:45 +0200
Message-ID: <20251124230045.3188417-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251124184441.GB1084995@ax162>
References: <20251124184441.GB1084995@ax162>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calculating maximum M for scaler configuration involves dividing by
MIN_X_OUTPUT_SIZE limit register's value. Albeit the value is presumably
non-zero, the driver was missing the check it in fact was. Fix this.

Reported-by: Josh Poimboeuf <jpoimboe@kernel.org>
Closes: https://lore.kernel.org/all/ahukd6b3wonye3zgtptvwzvrxldcruazs2exfvll6etjhmcxyj@vq3eh6pd375b/
Fixes: ccfc97bdb5ae ("[media] smiapp: Add driver")
Cc: stable@vger.kernel.org # for 5.15 and later
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Not tested but what could go wrong here? :-)

 drivers/media/i2c/ccs/ccs-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index f8523140784c..dadff8c50679 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2346,7 +2346,7 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.height;
 	max_m = crops[CCS_PAD_SINK]->width
 		* CCS_LIM(sensor, SCALER_N_MIN)
-		/ CCS_LIM(sensor, MIN_X_OUTPUT_SIZE);
+		/ (CCS_LIM(sensor, MIN_X_OUTPUT_SIZE) ?: 1);
 
 	a = clamp(a, CCS_LIM(sensor, SCALER_M_MIN),
 		  CCS_LIM(sensor, SCALER_M_MAX));
-- 
2.47.3


