Return-Path: <linux-media+bounces-11278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 373CC8C1E12
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 08:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE62CB21374
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 06:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B5915E7F8;
	Fri, 10 May 2024 06:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbdwAHb2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB4A1527BE
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 06:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715322473; cv=none; b=oxI3Wl52OVnd1FK6n51Kqls9swT2lfFPtZ1ZN2r04ve2J9Oqyu0UGTHgiqPWWryB1Slb9NN4UTnpx61l51ZI+T29THscwu3FH5l6nvIowxLgICca8XGQH20TTVQr8g5g5npXaU4HcYH+FRAdAfORXjfOkaqgnC6BBUF4FGJFuGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715322473; c=relaxed/simple;
	bh=CcmZijJGW4KlGOFIfZwyDMdqhNu3d1YT4F35FN05U7M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QED6OfSbe1n5zujBhfvcB+HxP2bSEAOUuE39+YvkGXZv6ik5Q48ndYYrsv49pRWRR0Cv43shUCXjZDCzkq34r/sJ6rTyTf+VSW4SQlATjjqKd2TvOTqsC6UYeJsQbRa6eeqq5CnD8DkgfHBQHimoKVgSna+CNaIcenDyOTKboN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbdwAHb2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715322471; x=1746858471;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CcmZijJGW4KlGOFIfZwyDMdqhNu3d1YT4F35FN05U7M=;
  b=lbdwAHb2ZGfPpTuV987fuNqhVnboGOJgVvoK3icXLxvydA1CE0cq1ldA
   NyALGr5ec1j8wTFL9rXAE5uIeKsUNsoFK+YySkyGJfdUtbg+xTSgP5Eep
   FRBuBff7wKZD5dxkV73dJ4RXsRd2Xmq0wp+iC+cBzRcJzYiB/OeNuVsoZ
   n+U72Mb5KREQVdulNWHIP5/2889o07EJkLrgH+2g678WRXWwcVvR6AKP4
   ksKYrQ1/o9K0jQobuJ9qZs2HoZ1HHgFn0xpzKpgGvAnNshi3lE+TyVmun
   iAPRPsCl/QbLSMU34/l2aA9Jm6dZuUH7Ckk/2L3P9Ij0W9qP2RMTpIF8X
   A==;
X-CSE-ConnectionGUID: /WzqcqBXSOSFEcQMht7GpQ==
X-CSE-MsgGUID: /wEe6E5JSL2in4AA+s1R8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28771203"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="28771203"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 23:27:51 -0700
X-CSE-ConnectionGUID: EkCcTZP+SjSQB8kQeErbUQ==
X-CSE-MsgGUID: HF/1CTfbSYu5H5TIryRdjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="34281217"
Received: from icg-hal3.bj.intel.com ([172.16.127.200])
  by orviesa005.jf.intel.com with ESMTP; 09 May 2024 23:27:49 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com
Subject: [PATCH] media: ipu-bridge: add mod_devicetable.h header inclusion
Date: Fri, 10 May 2024 14:27:47 +0800
Message-Id: <20240510062747.3422256-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

ACPI_ID_LEN is defined in mod_devicetable.h, so the header should
be guaranteed to included in ipu-bridge.h instead of the source
files which include ipu-bridge.h.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 include/media/ipu-bridge.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 783bda6d5cc3..16fac765456e 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -3,6 +3,7 @@
 #ifndef __IPU_BRIDGE_H
 #define __IPU_BRIDGE_H
 
+#include <linux/mod_devicetable.h>
 #include <linux/property.h>
 #include <linux/types.h>
 #include <media/v4l2-fwnode.h>
-- 
2.34.1


