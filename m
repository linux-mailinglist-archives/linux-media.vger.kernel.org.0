Return-Path: <linux-media+bounces-23559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECCF9F483C
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 11:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7547716B072
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 10:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19C71DE2AC;
	Tue, 17 Dec 2024 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xp5uCOGa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DBDEEB2
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 10:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734429641; cv=none; b=pcVelEAD/aOHid+bZikZQnXksV+orpxifDRQBZAv6YV9/CFfi6huKIQBvztjGPisI+298tPsS8GrIamkjo5aqmUrVQpNoU8T1YzO1vnmPV58a7ILHbNnBH4rqWxUFZfntkxLrZizcZWC2lFP1yyl9+4vgIdMMPfW2c5Oa65toT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734429641; c=relaxed/simple;
	bh=CtfIqk3uPJ2IuBo3XN3BNCRkMC3iY5oG8llYhj1HIdc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KwjjiKWCF32pcG1CiCND9GQ2YOpEjv1RSj7/bYS4tGk2U3LuxKKovlNqJoQ4LCQbciMLYnmN+IuaTbbn+v1EEckH1ZXDVXhCMeTkfSzkph95pZ+UzU7fA6cwN9tnabmvPLScyohASQaEcYqVAN4tVMdwR5lckMvH/MoWQYcdDBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xp5uCOGa; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734429639; x=1765965639;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CtfIqk3uPJ2IuBo3XN3BNCRkMC3iY5oG8llYhj1HIdc=;
  b=Xp5uCOGaEOHC8L23xxfRZ6aoc0ZeD3O7rw/9twxB8B8FFW8d0q3DhlAx
   SrcqeX0KelG4K5eAaWJKt4aoXjOfbAdqOyg3gBsgYS8WI13Qi2ZscbaCE
   FM3GIJz0PafXBK0g4IvUst58z11l7e+pmNZBBUj64IA7dVZTewQUdH+qR
   pO/KDqpLSH8yKIGecYJDXTcP9GuSYTUm0IvIgB5x2k0ChUAIXqZEWHm4D
   iCuz5VoEwoofC1jQtH/fw7SB2loiAMmWekjUBhs4D1IxRpns42AcOWFXi
   7WVWNeu2R8onaHLt2P7zJqX9QTxrTTCHIswLGD5aESMCA+C1z5JRxJoxv
   w==;
X-CSE-ConnectionGUID: CEdroPxSRiCyFyniNqQX4g==
X-CSE-MsgGUID: pvHHoZ3fSfigdrhox//Fmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34997740"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="34997740"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 02:00:39 -0800
X-CSE-ConnectionGUID: RUDqX4cXRBq4r5JHKar7hg==
X-CSE-MsgGUID: LwtswJwQRjiYxv6pskKNJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97937903"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.55])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 02:00:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	jani.nikula@intel.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2] media: cec: include linux/debugfs.h and linux/seq_file.h where needed
Date: Tue, 17 Dec 2024 12:00:24 +0200
Message-Id: <20241217100024.1858704-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Having cec.h include linux/debugfs.h leads to all users of all cec
headers include and depend on debugfs.h and its dependencies for no
reason. Drop the include from cec.h, and include debugfs.h and
seq_file.h where needed.

Sort all the modified include lists while at it.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

v2: Rebase, update cec-pin-error-inj.c and cec-gpio.c too

Depends on commit ae19ba915eb7 ("drm/i915/display: include
media/cec-notifier.h and linux/debugfs.h where needed") in v6.13-rc1
---
 drivers/media/cec/core/cec-adap.c              | 5 +++--
 drivers/media/cec/core/cec-core.c              | 5 +++--
 drivers/media/cec/core/cec-pin-error-inj.c     | 3 ++-
 drivers/media/cec/core/cec-pin.c               | 3 ++-
 drivers/media/cec/platform/cec-gpio/cec-gpio.c | 7 ++++---
 include/media/cec.h                            | 1 -
 6 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index c7d36010c890..ba6828ef540e 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -7,12 +7,13 @@
 
 #include <linux/errno.h>
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/kmod.h>
 #include <linux/ktime.h>
-#include <linux/slab.h>
 #include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
 
diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index ca0db8d457b4..e10bd588a586 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -5,13 +5,14 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <linux/debugfs.h>
 #include <linux/errno.h>
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/kmod.h>
-#include <linux/slab.h>
 #include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
 
diff --git a/drivers/media/cec/core/cec-pin-error-inj.c b/drivers/media/cec/core/cec-pin-error-inj.c
index fc0968b9d40e..6e61a04b8168 100644
--- a/drivers/media/cec/core/cec-pin-error-inj.c
+++ b/drivers/media/cec/core/cec-pin-error-inj.c
@@ -4,8 +4,9 @@
  */
 
 #include <linux/delay.h>
-#include <linux/slab.h>
 #include <linux/sched/types.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
 
 #include <media/cec-pin.h>
 #include "cec-pin-priv.h"
diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index 330d5d5d86ab..a70451d99ebc 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -4,8 +4,9 @@
  */
 
 #include <linux/delay.h>
-#include <linux/slab.h>
 #include <linux/sched/types.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
 
 #include <media/cec-pin.h>
 #include "cec-pin-priv.h"
diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
index cf64e8871fe5..50cdc557c943 100644
--- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
@@ -3,11 +3,12 @@
  * Copyright 2017 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
-#include <linux/module.h>
-#include <linux/interrupt.h>
 #include <linux/delay.h>
-#include <linux/platform_device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
 #include <media/cec-notifier.h>
 #include <media/cec-pin.h>
 
diff --git a/include/media/cec.h b/include/media/cec.h
index 16b412b3131b..0c8e86115b6f 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -10,7 +10,6 @@
 
 #include <linux/poll.h>
 #include <linux/fs.h>
-#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
 #include <linux/kthread.h>
-- 
2.39.5


