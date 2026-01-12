Return-Path: <linux-media+bounces-50412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEE1D11B4B
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 283FB30A50F1
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB953281358;
	Mon, 12 Jan 2026 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhs9HF4N"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E450D26ED56
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212004; cv=none; b=OJh7hEG5Uvvu++TK6VI1P+dUwN3vspEUWmjV+uYQRKvlKQXsfO72p7zhjMrAebPFMC5YTlTjDfxbi7lT4FVFWijqUdwq/RoeF/2D9MfuEw9QVz3mMFy4irmIZMfSu/BY44VNSz5xEHCgKeBLxreOSiOurucU6PfUF4/mBulavIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212004; c=relaxed/simple;
	bh=x758VpHvun8C6JCoITFoDdh3C+d7TGN4WfnqWMl84NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wse/7eyfmX696+pBVOrVQltmg4tNYJphNPvTXJhpKK7E6nR2JE3Qd2fYxV4mqpVRu9nTPXFmlIp+UGu8yUSRauDfe/w83bWaJqKQnwPkRbuSIZaokdQ9gQNDLsEZmM2GYN2icrHdZLIhFDpEwYo7fy1v3kdKJiv/R0niAM0w9U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhs9HF4N; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212002; x=1799748002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x758VpHvun8C6JCoITFoDdh3C+d7TGN4WfnqWMl84NM=;
  b=lhs9HF4NYkCpahsjyEouUtG6AxJKKWmt4qC06VyEfuO6a3Jd6KTRtwPj
   AXYU77DADPkB0u2MEpGVbKsd7oeuEVJgG9WOeLoB1YcbGnGbxLYxpk8XL
   fL8xrLgqUb0J7Z9zpCP46Wz1xxkeL2LdxhSmmMdrPCSBQPrY2PGEOKcAR
   +Wxwsz+HHg9dSrq3DeVbB5V3VRJFIRX6XOZAdeq8y9v9IYiFkGufBCgjI
   dG6nOqT+Q8s7rGSpmEt3JoziZw/P/5gcQMDgw55DranHxVEQOoWdTqwvm
   GII4VKWYdGwD+mEb3+lIG57p/LV2VU6E3Ki7FEEEVEP7aPKMMNJ9ga4vw
   Q==;
X-CSE-ConnectionGUID: gfR6lBBgQtC8WAantdkXzg==
X-CSE-MsgGUID: vOdpeWRVT3yPQSnSVcPY1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218797"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218797"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:58 -0800
X-CSE-ConnectionGUID: 3JGrUjiyRAe5RUJ85lLb0Q==
X-CSE-MsgGUID: FytJ02JDRXePt7c7Upf3Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743138"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:56 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 43BD8121F96;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-00000000121-0agQ;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 13/23] media: i2c: ov01a10: Don't update pixel_rate and link_freq from set_fmt
Date: Mon, 12 Jan 2026 11:59:39 +0200
Message-ID: <20260112095949.3851-14-sakari.ailus@linux.intel.com>
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

The pixel_rate and link_freq never change, stop updating them on every
set_fmt.

Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index fee24acef4b2..747e91cd8828 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -619,8 +619,6 @@ static int ov01a10_set_format(struct v4l2_subdev *sd,
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		ov01a10->cur_mode = mode;
-		__v4l2_ctrl_s_ctrl(ov01a10->link_freq, mode->link_freq_index);
-		__v4l2_ctrl_s_ctrl_int64(ov01a10->pixel_rate, OV01A10_SCLK);
 
 		vblank_def = mode->vts_def - mode->height;
 		__v4l2_ctrl_modify_range(ov01a10->vblank,
-- 
2.47.3


