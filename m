Return-Path: <linux-media+bounces-36150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 393C7AEC791
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 16:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97EE44A0716
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 14:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E8A1DDA09;
	Sat, 28 Jun 2025 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pg8veHnn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549411C84A8
	for <linux-media@vger.kernel.org>; Sat, 28 Jun 2025 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751120128; cv=none; b=VoFYYHVp+2SdMYNsDua8Y4ifagfiBXjYD5EsQJs1qC0XNWVOoSkWvrq+eiPcfeCyHRQe9LcGuBPRy5Vl15UMNZ0UpBHH/U62kThMRD6FyZzkMAzlKEMhGs3tYTkkEN0ub4CVydULxOh69BZQTWNw9GXEUbx5cl7ONC0RueQOESI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751120128; c=relaxed/simple;
	bh=ciHk+M2TTpNCgmirkkVVVSu1+YiEHm9+R7t+iaPyJVg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=A1peaceb+wq3tnIzGC1OuWthgUUDd3GwX3GeYzJwU7tLjbUtL7oRm02QF6I3bNMbjaJTjWvX096IFP2dJyQWocZ1Gd+8inkaWxoikm3tWWK7FOILjgQ6m6UN+YF9tersAsU01F+ALFfUGMiDhPuumeB6GPcvRrzrEFBkx8jPzJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pg8veHnn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751120126; x=1782656126;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ciHk+M2TTpNCgmirkkVVVSu1+YiEHm9+R7t+iaPyJVg=;
  b=Pg8veHnnX5TatBk1aMgVWg8OArd3R4rpJofIdo0N0m/psrAEmQFpMTxt
   /kV/vqPGpE85bPfLBG7XOFHFfH/GTe5hwyI2Aipmn5hs+cKh0kiwZGw/E
   3AhXKwOW7ulIaiB1n0Us4FkXtsyokCiXjgsdXA+XWKyUaz3lY0wYPBWkI
   WhEHAzEUT0Gd526Sny2SUWDJ9e5Agc3H9MXsTTj22GPqnoxitRhZP7aTk
   N715ATqxUbKxe8HObBA72LpYwgv/yLWVz0BD6jfFzRySAUjWjNLSiL7kK
   1bXVggeJaoxknto3CXxnBhqZEI/QuxnvSrQTNI55AopTIJx6RlMzs/TtD
   A==;
X-CSE-ConnectionGUID: 7ZhTOnJ5QdW6Y3nYI28Vhg==
X-CSE-MsgGUID: WcGSbwBlTqC4PoyFarCXHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="52638005"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="52638005"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 07:15:26 -0700
X-CSE-ConnectionGUID: rAizJ8LiRee97PYxgcGCXQ==
X-CSE-MsgGUID: 8dOxQM82TaeOOFW1WkTOdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="183959113"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.245.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 07:15:25 -0700
Received: from svinhufvud.intel.com (syyslaukka.retiisi.eu [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 247524437E
	for <linux-media@vger.kernel.org>; Sat, 28 Jun 2025 17:15:21 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: ov02c10: Don't include linux/version.h
Date: Sat, 28 Jun 2025 17:15:20 +0300
Message-Id: <20250628141520.297264-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

linux/version.h isn't needed by the driver, don't include it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov02c10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 089a4fd9627c..594bfb02da0f 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
-#include <linux/version.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
-- 
2.39.5


