Return-Path: <linux-media+bounces-37258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 352CDAFFAEB
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 09:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DA104A1F94
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 07:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9799289835;
	Thu, 10 Jul 2025 07:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvB2sGAn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFFB28936C
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 07:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752132731; cv=none; b=XDhsTejWq9d7qciIpirLCTKP9gbUQV2Nc0lH4xDHB9rv8/rPnkOlNgE1oxbyiyfw03C5oFgNWXjSVUo+lzsnNhxi36Joha3f+rCNClDGdIuekEpib1crmPilamMmnpnYCR2HZD4IHr+1TvTpv0c1Fo3lCdosTlblVewrJXgM18E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752132731; c=relaxed/simple;
	bh=AXu+ji42ewPha3tNO5rA2uOzovFDxFmoGajlctFYbLI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QRD0+NgBEQDHoxPgqfG9SdGXj84Ki0czvHL6NMcoNrwoGFcrAQruq/0v4wzWSCBG5uxA1s1bJspMAr7t1IChrXc2rxIuX27e8JiyhGfD5+MZTReCpIJE2cUSVtucjwdHhc892nvrbBRhYnBFMhUnF/rWXixIJARBdVA7ZRyM4+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvB2sGAn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752132730; x=1783668730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AXu+ji42ewPha3tNO5rA2uOzovFDxFmoGajlctFYbLI=;
  b=GvB2sGAnNATp2hOVwekwmAow7zsxdogVehFB3vsSb8q/FfTibx6UZpn+
   nuGqrJChFxU1qflGv4Tx7gpErHTMgByNiwcZ3vyh5QeN42/POyN5FOLxS
   oMZV0yfjCjsxmPiZx0DbOA7QmH4pqoH9rS7uTJYMsgeqhK3zf7OOJwFlE
   5K6ccyiTEVbmN1B1UWd8u2wGlJZO8QkZWVUhu6m9xnZV4t2IvI1CcTKlf
   kOn/0SffS+y2A7oQ04MwBe79CX5z9istqPDsLvTycbJGI2yO1Afl/Iryc
   7G5BgkRDeVRD4iT701O6lgjfl88oWILak9ximXqyhylQF2pbSw1S4lEs7
   Q==;
X-CSE-ConnectionGUID: zT5lOU9nQMGm9ibVYCuucg==
X-CSE-MsgGUID: j113kFarTrOvjBJltobLHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54258397"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="54258397"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 00:32:06 -0700
X-CSE-ConnectionGUID: PjEAqFprRzico7++RB9Cag==
X-CSE-MsgGUID: V+Skx1dkQ/+Bwt0G4Gc51A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="186998391"
Received: from opintica-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.54])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 00:32:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 89FD512090D;
	Thu, 10 Jul 2025 10:32:01 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uZllB-0045v9-2V;
	Thu, 10 Jul 2025 10:32:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: [PATCH v2 1/2] media: v4l2-subdev: Print early in v4l2_subdev_{enable,disable}_streams()
Date: Thu, 10 Jul 2025 10:32:00 +0300
Message-Id: <20250710073201.976056-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250710073201.976056-1-sakari.ailus@linux.intel.com>
References: <20250710073201.976056-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print debug messages early in v4l2_subdev_enable_streams() and
v4l2_subdev_disable_streams(), before sanity checks take place. This can
help figuring out why something goes wrong, in driver development or
otherwise.

Also print the name of the sub-device where streaming is to be enabled or
disabled.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index c69d1aff701f..7b1a67a52efa 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2285,6 +2285,9 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
 	bool use_s_stream;
 	int ret;
 
+	dev_dbg(dev, "enable streams \"%s\":%u/%#llx\n", sd->entity.name, pad,
+		streams_mask);
+
 	/* A few basic sanity checks first. */
 	if (pad >= sd->entity.num_pads)
 		return -EINVAL;
@@ -2332,8 +2335,6 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
 		goto done;
 	}
 
-	dev_dbg(dev, "enable streams %u:%#llx\n", pad, streams_mask);
-
 	already_streaming = v4l2_subdev_is_streaming(sd);
 
 	if (!use_s_stream) {
@@ -2385,6 +2386,9 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
 	bool use_s_stream;
 	int ret;
 
+	dev_dbg(dev, "disable streams \"%s\":%u/%#llx\n", sd->entity.name, pad,
+		streams_mask);
+
 	/* A few basic sanity checks first. */
 	if (pad >= sd->entity.num_pads)
 		return -EINVAL;
@@ -2432,8 +2436,6 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
 		goto done;
 	}
 
-	dev_dbg(dev, "disable streams %u:%#llx\n", pad, streams_mask);
-
 	if (!use_s_stream) {
 		/* Call the .disable_streams() operation. */
 		ret = v4l2_subdev_call(sd, pad, disable_streams, state, pad,
-- 
2.39.5


