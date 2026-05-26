Return-Path: <linux-media+bounces-62835-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBmBK8YTFmojhQcAu9opvQ
	(envelope-from <linux-media+bounces-62835-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 23:42:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0385DCD4B
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 23:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30D47300F26D
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 21:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2573C2B92;
	Tue, 26 May 2026 21:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Um2LNj0n"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C583B4E9D;
	Tue, 26 May 2026 21:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779831740; cv=none; b=nB2x8MI03quHNWOGR0O2s6CLX0RWBfyIKNOXUGAMiGY7B1c2rZDUX/RUcreCbmdP96xnHAvkK9ZO4JbAX3J+M+ySopGl+sCOX6xuBQRFBe5e1fKlqKRJ+ZzuLtWupSqvrJF1Tyig/GL1kiUSSbNRgY/8SmNnXqrsp1Q+IPlt23o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779831740; c=relaxed/simple;
	bh=4A4bUVZSTYS7MrJGrbWv/R5cLeVPUUuARJlJCjwb+60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JH6Odhm6afZzelNEzOZMtlGFqZKXKByEpA7b/aWWa+DpZ/TDw62GdiZSrWFy4yuYMqlJeJl8MdFXKUiGshX7AslcBO+LZIOft+sHoJqPZ8WSqmU2vOk8i16uHAgdtDjMjjML+JqeaSyilRLIjRp3CiFmfWKBpuQWR60xLEn+auM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Um2LNj0n; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779831738; x=1811367738;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4A4bUVZSTYS7MrJGrbWv/R5cLeVPUUuARJlJCjwb+60=;
  b=Um2LNj0nUvz6GLHe5d2ksmyUNOdFaJ9onWhlmeIRvz+iXHD9hEz/Jj6t
   iSxpaqkudS+Vanjd+wAmoqpzgOcQeYrOjRtOFXod5EhcO7T2if7tpiL6i
   Q0OCfVEFS5mNyLXFRVFhYz8otoLDL1U+JnaeegeRDSJaZva07brROKRxP
   NXQS4SI3/NJQ12O8HOifGxRxpPPE2rfL0iaP8nr5ICLNqe0qC/CvzQ0Gf
   YOmyHaNU3PGOQPebY22aKAkkLkBE5VjOVTRZHfHlWOSjE++9fYcbYxfE9
   CeQhoCWrXYbxK0sTR07SPncHYuLYOnAvitskIOhpJ2hplwNwQz4N5sD/A
   g==;
X-CSE-ConnectionGUID: 1AEeknlERn+rqdjZTNd4cg==
X-CSE-MsgGUID: fz36Rc8TQ+y0yjLoChdU2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80384281"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80384281"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 14:42:18 -0700
X-CSE-ConnectionGUID: X31GiCo8QP2VxH1z1QRs/w==
X-CSE-MsgGUID: scZYiDHIT/CJxITBqB6Epg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="237617081"
Received: from smtp.ostc.intel.com ([10.54.29.231])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 14:42:17 -0700
Received: from ray2.jf.intel.com (unknown [10.24.81.183])
	by smtp.ostc.intel.com (Postfix) with ESMTP id 96BEF6362;
	Tue, 26 May 2026 14:42:16 -0700 (PDT)
From: Dave Hansen <dave.hansen@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] MAINTAINERS: Remove bouncing Intel media maintainers
Date: Tue, 26 May 2026 14:41:31 -0700
Message-ID: <20260526214131.51118-1-dave.hansen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62835-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.hansen@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ideasonboard.com:email,linux.dev:email]
X-Rspamd-Queue-Id: 4D0385DCD4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Tianshu Qiu and Bingbu Cao are maintainers and reviewers of a bunch of
media drivers (7 and 9 respectively). Both of their emails are
bouncing.

Remove the bouncing entries and update driver status in cases where
there are no M:'s left.

Mauro, I was hoping this was the kind of thing you could take directly
since it touches so many different drivers.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Yong Zhi <yong.zhi@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-staging@lists.linux.dev
---
 MAINTAINERS | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ac9a298b811e0..6646c00dade96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3857,9 +3857,8 @@ F:	Documentation/devicetree/bindings/leds/ams,as3668.yaml
 F:	drivers/leds/leds-as3668.c
 
 ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
-M:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
-S:	Maintained
+S:	Orphan
 T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
 F:	drivers/media/i2c/ak7375.c
@@ -13003,9 +13002,7 @@ F:	drivers/iommu/intel/
 INTEL IPU3 CSI-2 CIO2 DRIVER
 M:	Yong Zhi <yong.zhi@intel.com>
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-M:	Bingbu Cao <bingbu.cao@intel.com>
 M:	Dan Scally <dan.scally@ideasonboard.com>
-R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -13014,8 +13011,6 @@ F:	drivers/media/pci/intel/ipu3/
 
 INTEL IPU3 CSI-2 IMGU DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
-R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/ipu3.rst
@@ -13025,8 +13020,6 @@ F:	drivers/staging/media/ipu3/
 
 INTEL IPU6 INPUT SYSTEM DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-M:	Bingbu Cao <bingbu.cao@intel.com>
-R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -13035,7 +13028,6 @@ F:	drivers/media/pci/intel/ipu6/
 
 INTEL IPU7 INPUT SYSTEM DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -13337,7 +13329,6 @@ F:	drivers/net/wireless/intel/iwlwifi/
 
 INTEL VISION SENSING CONTROLLER DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
 R:	Lixu Zhang <lixu.zhang@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -19620,9 +19611,8 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 F:	drivers/media/i2c/os05b10.c
 
 OMNIVISION OV01A10 SENSOR DRIVER
-M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
-S:	Maintained
+S:	Orphan
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/ov01a10.c
 
@@ -19713,11 +19703,9 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
 F:	drivers/media/i2c/ov2735.c
 
 OMNIVISION OV2740 SENSOR DRIVER
-M:	Tianshu Qiu <tian.shu.qiu@intel.com>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
-S:	Maintained
+S:	Orphan
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/ov2740.c
 
@@ -19857,10 +19845,8 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,ov9650.txt
 F:	drivers/media/i2c/ov9650.c
 
 OMNIVISION OV9734 SENSOR DRIVER
-M:	Tianshu Qiu <tian.shu.qiu@intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
-S:	Maintained
+S:	Orphan
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/ov9734.c
 
@@ -24866,9 +24852,8 @@ F:	Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
 F:	drivers/media/i2c/imx296.c
 
 SONY IMX319 SENSOR DRIVER
-M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
-S:	Maintained
+S:	Orphan
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/imx319.c
 
@@ -24888,9 +24873,8 @@ F:	Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
 F:	drivers/media/i2c/imx335.c
 
 SONY IMX355 SENSOR DRIVER
-M:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
-S:	Maintained
+S:	Orphan
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/imx355.c
 
-- 
2.43.0


