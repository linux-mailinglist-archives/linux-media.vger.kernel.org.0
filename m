Return-Path: <linux-media+bounces-29512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFE7A7DFBC
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80023160580
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37031865E5;
	Mon,  7 Apr 2025 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngjdgOvx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E637F146593
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 13:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033252; cv=none; b=YOdk3/BkDJMBeEswyJ0q/sUV75/Xzl94brPQ2AitkUgVn2Ksy4T/NOwEpfruuWBcBL6E/9dxIN0yklVHxMtvMuvXbOnz/tiaZcG+p/bk/eHHgJzoB0D44i5b2mkwN5HWcyiZaOVsW1D1WeaYfVbEuaJQGI9XcmwExCD1l+V43Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033252; c=relaxed/simple;
	bh=bpYQ8mhZvRvKhH46GYfeTJ+/3jkKYaiLqIKfaHl3jBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oRw+DG4v500BPn5J/qzJsvjTpeQcBOtRlWUw0W4elDvZkU4Nx1ZxrZe2LcFl7+xs3p4XeUjzu5LbjGaMdZuIEi7Ifz41CSfc8iC8srYEj3add4cGQgPxSpjqWvyggMP9azUJVQm98xvLElsKtoaQ5GnkSdlkqjI1OfB8kaWFc4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngjdgOvx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033252; x=1775569252;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bpYQ8mhZvRvKhH46GYfeTJ+/3jkKYaiLqIKfaHl3jBQ=;
  b=ngjdgOvx0VomVfB4oBDaU96OjDyBKPJm/leV4capy++zCfhvGAzXmpnx
   V79XuVxhRODexr+CGwwFJwoCMk9e18CnRUhCUBYZVlyA0bgN7wCLzVkfY
   GxuMM1PrugaRaeH/toFr0CRBM9NJaFGAoo561rNTe/n/U50vEMza+KRnV
   YBUDV5IUnMP0XVJSsgojoG+/jTzXr0aj9utYT3FTL1Vt3GmNECkoKk7Wh
   ij2J3X2CJm1vqJBlrzS6ZSMFR9iOslmNly612tRasMEDQaPXJaUgfa4Zm
   mkJIxoRKvSrV5gsJqr+EIQUAY7tzGFXfeEoUojUzkJk1SSPxZGPFhJMhb
   w==;
X-CSE-ConnectionGUID: ZgiMRx/uQEylkY/bYO4/6A==
X-CSE-MsgGUID: HU3AUI8sS8akAPUUdKHfUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45557454"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45557454"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:40:51 -0700
X-CSE-ConnectionGUID: vtps7qMRSQ21Ew5nV8JfJQ==
X-CSE-MsgGUID: LQFVt++tR4itiqfovhdQOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128893990"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.80.153])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:40:49 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 1/7] media: intel/ipu6: Use isd name in isys.h
Date: Mon,  7 Apr 2025 15:40:31 +0200
Message-Id: <20250407134037.808367-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
References: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename asd to isd also in isys.h

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/isys.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/isys.h b/drivers/media/pci/intel/ipu6/isys.h
index 4bde32f6d767..b6ddadfc374b 100644
--- a/drivers/media/pci/intel/ipu6/isys.h
+++ b/drivers/media/pci/intel/ipu6/isys.h
@@ -35,8 +35,8 @@ int isys_subdev_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 int isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_mbus_code_enum *code);
-int isys_subdev_init(struct isys_subdev *asd, struct device *dev,
+int isys_subdev_init(struct isys_subdev *isd, struct device *dev,
 		     const struct v4l2_subdev_ops *ops, unsigned int nr_ctrls,
 		     unsigned int num_sink_pads, unsigned int num_source_pads);
-void isys_subdev_cleanup(struct isys_subdev *asd);
+void isys_subdev_cleanup(struct isys_subdev *isd);
 #endif
-- 
2.34.1


