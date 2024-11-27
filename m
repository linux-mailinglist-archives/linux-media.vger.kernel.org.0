Return-Path: <linux-media+bounces-22149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A59619DA532
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 10:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28FC9B284FA
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 09:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7934419413C;
	Wed, 27 Nov 2024 09:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQYnUyMe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA2218FC81
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732701207; cv=none; b=VH5ajjLAZMU/hfNO8fuRHWziGey9JAo5/0P0j0+WI7Cit6KbbZbnS9+RF7W5kWMLBCTH8in5XL3ZsrbVwJVOiNkXpjoPK7W4xa4Iuai2l+Ia/I4OK8C2WIvwkupTqTawUhSWgxIiR/B+6KGRKjskYMsXx2X/eqC2BqJEspfRHKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732701207; c=relaxed/simple;
	bh=E+bY82Gis3/BBcmHaMtq5QQ5xGpac+6OObJvpOS1ieg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a8PzRfUpRz3VaozsJ8Fx4Agt3bO7NIoudwWbYdeTAVCZIa4QjGLmRX3lEokq5Z3YDb59YE8CldgR+urYWSLQo27L2wLJjtFD9Z3NHN2nO+mQfb2On4YAb42TN8hkKc5r2W6xKJU8kQPI9F4LdndLfDiZngVqvYOg7XyIEhjdRBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQYnUyMe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732701206; x=1764237206;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E+bY82Gis3/BBcmHaMtq5QQ5xGpac+6OObJvpOS1ieg=;
  b=hQYnUyMe5Vcch6Fzv5GOB368g07DsR0sQTEfy2BG0AI6V9DO6fmWZDBh
   fgmRZpA2borymKwzbSe3vm/q02G7TZn/UeI9UaEL1NMgLU14qjBUf/h3n
   A7dnUoQKF1daALNXSqjhZqcVlAHjM3YnDMapiAXGzk8gkAC1Jw/poLYBN
   H0IipdnD8Id4za5J+K3ohkG9AvR8yNWYP61Bk+sIhR0BY2oW6JRwf8f1d
   M/Kak2gjbEGX9dw+rVwQ0CuSxnJ680YlCUamfS6YjBoM6l7yqPnIzJxVi
   omm0WtqckXMCIxNm3ZP+wR8f5PcF92DbEVwvLWCwY0S3N4klHKGxcklml
   w==;
X-CSE-ConnectionGUID: hwfRL4k9RyikW0gTP0gMsg==
X-CSE-MsgGUID: 87sO597nRVmob71EuLtW0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36820454"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="36820454"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 01:53:15 -0800
X-CSE-ConnectionGUID: 8WjVvBW2R2K/GuoEfNQ/hw==
X-CSE-MsgGUID: BGUAjkkZTUG1Fia+ac9M0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="92297124"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.110])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 01:53:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-media@vger.kernel.org
Cc: jani.nikula@intel.com,
	dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: cec: include linux/debugfs.h and linux/seq_file.h where needed
Date: Wed, 27 Nov 2024 11:53:08 +0200
Message-Id: <20241127095308.3149411-1-jani.nikula@intel.com>
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

Depends on commit ae19ba915eb7 ("drm/i915/display: include
media/cec-notifier.h and linux/debugfs.h where needed")
---
 drivers/media/cec/core/cec-adap.c | 5 +++--
 drivers/media/cec/core/cec-core.c | 5 +++--
 drivers/media/cec/core/cec-pin.c  | 3 ++-
 include/media/cec.h               | 1 -
 4 files changed, 8 insertions(+), 6 deletions(-)

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
index 48282d272fe6..941a7d3cb9dc 100644
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


