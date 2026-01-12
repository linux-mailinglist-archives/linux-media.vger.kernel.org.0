Return-Path: <linux-media+bounces-50424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66840D11ADE
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 644B8305855C
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5097C284898;
	Mon, 12 Jan 2026 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLr+PV92"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D13F2848AD
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212016; cv=none; b=qA++skHjRHuzIh8mNEzuUQjKUGKf3qpwLNvtZq2hwbVbyB4ng7/wdiKO4rz4+AnMXeivvbsY+npvdzzWoJjm/mwHODh4+1YSg9lng4aEmkTWoh1t3q05+ugFbo+d9bMwc4CJk2Mk6rPGhLxF0WJhzJpwb1xY+FkDSH7y6QwvXCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212016; c=relaxed/simple;
	bh=tTo7803yT/2l09zKCzCB8QUc/nK8pRfjhGzw16y3ZQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+lbM45QeoPOa4vqTye91I8svJQveQTG4t8LuZ6C0OBP+xQvaEuE66iVBzw9JLFVHfRzGomXRjkcPkhOYQiYgQDcVgxKdVeS1y99xYomjS9kT14tod7MrOMq7gdvqBn8n//A/m/WJatVUY2fP9BSqCVj0BbBKE6EfQUc/RL6hUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLr+PV92; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212015; x=1799748015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tTo7803yT/2l09zKCzCB8QUc/nK8pRfjhGzw16y3ZQg=;
  b=NLr+PV925omhDI3+og93Kt1NItDAgAflmGD8EJh5Bn4yqQMjXhLPyJZa
   17grFNqJUz2NgMHu5Q0/G+fYuX8OwClviK7cRCGazGCDciT8bUSvC+zIb
   1513rfpfieXH+2TJEWtt01c2R7HUs/mIQQwrICP3aM/PdLqml49oWLTw+
   Em5MOSbkklecCIsKXOiqIaPQ8fKMPeXsr4GjGMY4cVrwHrtRq344S3KHl
   H/PhfGDrVbXjgDJVBQ8E386pFMC3kDzn7788OWjRM+2jh0AOLMRODIkHR
   urTiDsFdlfh6LZ4bWQMNYo1Sq0kx9xrCoynmPUdWoRt4cnWqG1as8WfBS
   w==;
X-CSE-ConnectionGUID: ymynkcOCRDWFXHLsJTPcaA==
X-CSE-MsgGUID: n7NcX/icRLCKOwKUbTXhdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218815"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218815"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:00:01 -0800
X-CSE-ConnectionGUID: Lhv2e7WUQGGnNRg1TkZMNw==
X-CSE-MsgGUID: qrBdgKGcTFaAl5wLZu2pdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743171"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:59 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 58F11122014;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000012a-0x5z;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 20/23] media: i2c: ov01a10: Remove values set by controls from global_setting[]
Date: Mon, 12 Jan 2026 11:59:46 +0200
Message-ID: <20260112095949.3851-21-sakari.ailus@linux.intel.com>
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

Registers 0x3501 (exposure), 0x3508 (analogue-gain) and 0x4503 (test-
pattern) are already set through __v4l2_ctrl_handler_setup() drop them
from ov01a10_global_setting[].

Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 2480925f9957..1a02772bdf1c 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -123,11 +123,7 @@ static const struct reg_sequence ov01a10_global_setting[] = {
 	{0x3002, 0xa1},
 	{0x301e, 0xf0},
 	{0x3022, 0x01},
-	{0x3501, 0x03},
-	{0x3502, 0x78},
 	{0x3504, 0x0c},
-	{0x3508, 0x01},
-	{0x3509, 0x00},
 	{0x3601, 0xc0},
 	{0x3603, 0x71},
 	{0x3610, 0x68},
@@ -197,7 +193,6 @@ static const struct reg_sequence ov01a10_global_setting[] = {
 	{0x4300, 0xff},
 	{0x4301, 0x00},
 	{0x4302, 0x0f},
-	{0x4503, 0x00},
 	{0x4601, 0x50},
 	{0x4800, 0x64},
 	{0x481f, 0x34},
-- 
2.47.3


