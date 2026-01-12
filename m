Return-Path: <linux-media+bounces-50410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C49DCD11B3B
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 397953095393
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF26277818;
	Mon, 12 Jan 2026 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDp2D6RX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407D7212554
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 09:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212001; cv=none; b=PLWSFi24n5SXwGfIsiav5XcLnobuhDA60WFdIrR/UTZr07fMyq3MyDuG/zlGYnXLvKUmNd/xyRCfNI61FNww/fbN5udc7cfRZ2RimLDbOGx+0t3GIjEtm5SwGOgYAWn1OKJLo9/EKEZF1nSnymR6uhSFV1WavmBwIfEpNcTmNCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212001; c=relaxed/simple;
	bh=bBspNutdJ9LoGK7vFGMLMc3UnyAOPAvhaUbYi7cYcpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mmuqt0IcN6YF20Eu94qqOMxJqkPqf4FkObVRmQTrQ6yJDU42WEWxeTM33458c7IQ4QTl+rz6k5IzdktgQaohQ9BHRM+38Nn+HGwGkMosXxXV3MnQslNc8TM5RqtmaOK5Pm/JHttg7nbbjTusYHY2pZFERB1eqTOg0V9mUKE44lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDp2D6RX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768211999; x=1799747999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bBspNutdJ9LoGK7vFGMLMc3UnyAOPAvhaUbYi7cYcpk=;
  b=EDp2D6RXVkTR8NOQ4ojJKSv6LwrAbqqbTkQBaM6rOtPmL3naLVbwJzJv
   dhwg2Ba8UiLzaYLky02zYtlulYlWYfF2Ynvjvu55/AQNYMolvGvhgJ638
   1i8PrUpuvm3PoZxNJMxO6k2AdBFcvQ3VcMDQGsl+P1d/8k0xWCKQc9AO5
   TUQBoSzmBvqkkS2+Jnyr1r5JN7y4sSLNxCDSFpDjJvtC9uMrrgtkFUc6S
   Hj/gtxmK5MSd/IBK31x/Hx5TSUhwPHu/th+bXXJRFaqpfLA7O+ncMekYO
   s6Ew6vOK4hC+u3gS+sk4w7qlqSu6FLsu+gZVeeJWzFynxnyO8B8FybMKi
   Q==;
X-CSE-ConnectionGUID: bwv5pyS8SOKi2r7mncatDQ==
X-CSE-MsgGUID: AfA6TrIZSrK3hJrxvTw80A==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218781"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218781"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:54 -0800
X-CSE-ConnectionGUID: 5RERRVEkSTCiu2xI4CUgCg==
X-CSE-MsgGUID: knVEBkp9Tv2yp9fWTCuYoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743095"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:53 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 26547121F38;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000011E-02p4;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 03/23] media: i2c: ov01a10: Fix analogue gain range
Date: Mon, 12 Jan 2026 11:59:29 +0200
Message-ID: <20260112095949.3851-4-sakari.ailus@linux.intel.com>
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

A analogue maximum gain of 0xffff / 65525 seems unlikely and testing
indeed shows that the gain control wraps-around at 16383, so set the
maximum gain to 0x3fff / 16383.

The minimum gain of 0x100 is correct. Setting bits 8-11 to 0x0 results
in the same gain values as setting these bits to 0x1, with bits 0-7
still increasing the gain when going from 0x000 - 0x0ff in the exact
same range as when going from 0x100 - 0x1ff.

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
[Sakari Ailus: mention analogue gain and update the limit from 4096.]
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 0b1a1ecfffd0..834ca46acb75 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -48,7 +48,7 @@
 /* analog gain controls */
 #define OV01A10_REG_ANALOG_GAIN		0x3508
 #define OV01A10_ANAL_GAIN_MIN		0x100
-#define OV01A10_ANAL_GAIN_MAX		0xffff
+#define OV01A10_ANAL_GAIN_MAX		0x3fff
 #define OV01A10_ANAL_GAIN_STEP		1
 
 /* digital gain controls */
-- 
2.47.3


