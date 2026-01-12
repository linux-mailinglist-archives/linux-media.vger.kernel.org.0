Return-Path: <linux-media+bounces-50423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DB2D11AAE
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32B163022132
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB09428CF5E;
	Mon, 12 Jan 2026 10:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPRHdE4X"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F227B284693
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212015; cv=none; b=GPsanGxDYZQ7857i54tWlT7eQY3cCNlrOQv3ZDOhl/yrsQD36R2aX94qu+XAzpDixlSNhA9Y9sIFpHl+wCYXDWHxnkZPLQ7Z1Om2Xj411bSUYwyyohlIZN3fYuObiu5o2VVTnT2C0GcTmrvyGIPR2UgP+3dh7lg8VhwRY0bHbCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212015; c=relaxed/simple;
	bh=/JqF1IhMi4jhMU0lOafiggtg0907PmFWnGACTbER7uU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F5+b0p6mLxa7IpSgzDOyJHoIbpVqRA8Ci+vR2nIAF+dezOOTrr2rIBRlTRS0EB/f33K9FfpH06h+8dI47+qk6encIYsZiqFNiX1yXQGDzSxAvaIKY/fJFnxJkw5XuzAloW8wDql0dOlg9f6Zz/evkBJzQGfVprojzpUa6i8BXTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPRHdE4X; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212015; x=1799748015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/JqF1IhMi4jhMU0lOafiggtg0907PmFWnGACTbER7uU=;
  b=JPRHdE4XImsbh3v5KvP9POwiZ766PDMUsESMeF2+ztjhd5v6qZOR2ySx
   jBriCrmjNh0VZE/jrcXFrgy0WS++N1UItXSus2+ZOc9DelpRjNhDC6+/A
   +xNKMtVWxIdMpTNZPLTCy7lJmQB8Av0JL5oh4dxfPcul/18TWGkUSLjso
   7WRZ9t4RolCuLWHjzL9aLIwXztZgqHFWK2B18zkaj4/tqMzmJhfkuhj05
   u9Q5IwJnoC3JA8+TjwAtRrlSPC+7KLx7WM9PQ/Wn5BvUfDqH3L9cJ65c2
   p8RPW47qIbFIOZCw15/p11RKyeaj2O2PlhTix1UEICMwwEtfNfHeFQab/
   w==;
X-CSE-ConnectionGUID: QTGIy8QEQEqKYY5KCyn+fw==
X-CSE-MsgGUID: FoAyBndFSZKmmTENWsxQJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218813"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218813"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:00:01 -0800
X-CSE-ConnectionGUID: lWx94UElTVOSBeEmS1P7TQ==
X-CSE-MsgGUID: 1nOHJJQ5Siyniwe32TkGRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743169"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:59 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 56137122000;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000012W-0twb;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 19/23] media: i2c: ov01a10: Only set register 0x0305 once
Date: Mon, 12 Jan 2026 11:59:45 +0200
Message-ID: <20260112095949.3851-20-sakari.ailus@linux.intel.com>
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

Stop setting register 0x0305 to one value from mipi_data_rate_720mbps
only to override it with a different value from sensor_1280x800_setting.

Instead directly set it to 0xf4.

Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 76c75da4d7c8..2480925f9957 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -108,7 +108,7 @@ static const struct reg_sequence mipi_data_rate_720mbps[] = {
 	{0x0302, 0x00},
 	{0x0303, 0x06},
 	{0x0304, 0x01},
-	{0x0305, 0xe0},
+	{0x0305, 0xf4},
 	{0x0306, 0x00},
 	{0x0308, 0x01},
 	{0x0309, 0x00},
@@ -216,7 +216,6 @@ static const struct reg_sequence ov01a10_global_setting[] = {
 	{0x5200, 0x18},
 	{0x5004, 0x00},
 	{0x5080, 0x40},
-	{0x0305, 0xf4},
 	{0x0325, 0xc2},
 };
 
-- 
2.47.3


