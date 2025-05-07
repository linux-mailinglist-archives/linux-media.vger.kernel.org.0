Return-Path: <linux-media+bounces-31891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB83CAAD635
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 08:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15BBF3B68F8
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 06:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25331211283;
	Wed,  7 May 2025 06:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8fHD4O7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E662101AF;
	Wed,  7 May 2025 06:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599817; cv=none; b=Tg9GMcf5e+PGERA1UtBshpyrtdtUcO9FtY9L2v/w5TIV0sdMIzMpemObjD9TqMkA3ep3UiFpAHa+/TxWyt37/eJliWPEhvvVI32p8vsOdk82O+wa449ygiPQW3kfqk4OP5c2qxFhF11GJf2ywlWNrNvv5LwjoSR5CjBnCg7iHG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599817; c=relaxed/simple;
	bh=gOcAC/SJd3NKIiheEFoY7etRn6MLIJ+Pq10VBbDLuDU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DUq+GdkfDtvmDV7qsrOvlPfTo91sjlVN+XijDMNTP+4p8qQWSt/ceyPPT/Ac35IKu5j7ii6x3rjxWAUUwEhufHty8LLyi/avhXy+m7cr8dILaQWBwKIj/KqBHwooOl/w+i5UQJrkgdDIjefNcalzTLyqwJU3mJ2gcbBV8iMlxEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8fHD4O7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746599817; x=1778135817;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gOcAC/SJd3NKIiheEFoY7etRn6MLIJ+Pq10VBbDLuDU=;
  b=e8fHD4O7k1y7DnD423HBV0qyb0KRNPbIdP+LjDq7sJpX67fesYixi+75
   CshzC+IS0PSsrREKtslV98ZlvcHvsgEWjQIGENenAyxdcFw54z7ZgAcwP
   xc24TFoHUOX9O3dxnRG+iF/B2VpVPV6/Z3jQF0mgN6Rb3g/aSCkdprWiZ
   //45CPRaCB1v2TApmxt4sMMmlCtofbTQG1dvAO9B7oiNqfnwrqBUO3YPi
   szkSscrKyQPBWZnK7t8VckUE1366sBr4zRfm3rSBluChuba5FO4uVHaU3
   Qtu/3XDgAIIJssvHdHxe5IiFSO8Psvm971gjwDHFBtrTVrY0W9Kv53i5U
   A==;
X-CSE-ConnectionGUID: 0qbF6x1iQzaPyQzuXSOAbA==
X-CSE-MsgGUID: J6uk5VJCTreViMaRq+UyxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48183110"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48183110"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:36:56 -0700
X-CSE-ConnectionGUID: pOrfbdgLTWqcHVLlPrZaTg==
X-CSE-MsgGUID: DBgWt80wT+6G1Hk4+GcrRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135825710"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.193])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:36:54 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 899B111FAF5;
	Wed,  7 May 2025 09:36:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uCYOh-000Dc6-1R;
	Wed, 07 May 2025 09:36:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/1] media: dt-bindings: mipi-ccs: Refer to video-interface-devices.yaml
Date: Wed,  7 May 2025 09:36:51 +0300
Message-Id: <20250507063651.52322-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refer to video-interface-devices.yaml instead of documenting the common
properties here.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../devicetree/bindings/media/i2c/mipi-ccs.yaml     | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index f8ace8cbccdb..bc664a016396 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -23,6 +23,9 @@ description:
   More detailed documentation can be found in
   Documentation/devicetree/bindings/media/video-interfaces.txt .
 
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -58,16 +61,10 @@ properties:
       documentation.
     maxItems: 1
 
-  flash-leds:
-    description: Flash LED phandles. See ../video-interfaces.txt for details.
-
-  lens-focus:
-    description: Lens focus controller phandles. See ../video-interfaces.txt
-      for details.
+  flash-leds: true
+  lens-focus: true
 
   rotation:
-    description: Rotation of the sensor.  See ../video-interfaces.txt for
-      details.
     enum: [ 0, 180 ]
 
   port:
-- 
2.39.5


