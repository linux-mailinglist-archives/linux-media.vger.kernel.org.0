Return-Path: <linux-media+bounces-61380-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Kn+CztWBGqMHAIAu9opvQ
	(envelope-from <linux-media+bounces-61380-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:45:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C32553189D
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2FF1F303D0B0
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0253FA5E9;
	Wed, 13 May 2026 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LW8E4DiW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7F23F65EE
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669048; cv=none; b=rm5GgyTzhIHbUbIZirwC3P+FZreMQtvWMTB9LizIdh4h/YRl4wRoGwGmTvOCHaZVn4s9ghHLuaCRVn4JWtttTE+iHR2e9TEmn853dw1Y90DahDmSWLMaLfMt1BCe4EWGTvjLUwT//WEWIfnV3hXlhZZmcPNIm89JODkN0vme7eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669048; c=relaxed/simple;
	bh=ue+QoLfeZlOdOxmuiTtClgON30hPEhRWX+qd8mVF/Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RuxXUj+UaiVJvcaXRT3oQ3ql4hA7BpTnce94ZSG0hoHTDs80CDF4QIQGkwyIhIx3t/5yrNFVrGjyhOhe+7chX1UkA0hX6HPSi2mTgdWHKqBAEdGtu9CfWlyFJmIryet6dDGTUpSc57ZpLRg+5avLsX3ytPQFZMzZ5bi4ByPBJ3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LW8E4DiW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669047; x=1810205047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ue+QoLfeZlOdOxmuiTtClgON30hPEhRWX+qd8mVF/Vk=;
  b=LW8E4DiW5NrycWGgEgO/5EE39sZp1A06UaMYDVyfEMgqaA28MYY4aBxe
   kEUHfFU0g2hcxSRcB8jQeVBPO8QmH87Wikoc4Jg5Sb3tDFDN9rE48staX
   cM40YPhPgSiZsvAN/FCaNQNN/scJJ4hWtKyt9iJ3G/npJyB++EiLk4wjF
   2xyOn5DdXZBD0YANRRDV1yzF072pSmN6ayDZxuqeUaiyRfUBCEiN1mBVz
   r0qXAh3RMwoA+qiAK5E51UNr0eFp5gZq6pwzFwSHLrTvc0MDNdEr24tyX
   NSG7te91V4bFkBbWNlq+4iBx1mFaw+QcgXU1dmg3jjCbM0HtOTY9mOJCI
   Q==;
X-CSE-ConnectionGUID: 3rb6RQOwQKChMyIJsTLb5w==
X-CSE-MsgGUID: KMNLdgHZRBSrDQrEVdBlDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464455"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464455"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:07 -0700
X-CSE-ConnectionGUID: LAm8MGBxRlOe8zBWN8jbVQ==
X-CSE-MsgGUID: TCCIl68QS2qOHDW25OqUvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599262"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D5ED8121D50;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S1j-3NxW;
	Wed, 13 May 2026 13:43:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 09/17] media: bcm2835-unicam: Use v4l2_subdev_get_frame_desc()
Date: Wed, 13 May 2026 13:43:50 +0300
Message-ID: <20260513104358.2252605-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2C32553189D
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-61380-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:email,intel.com:dkim];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/broadcom/bcm2835-unicam.c  | 20 +++++++++----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..2e78b16bf18c 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -888,7 +888,8 @@ static int unicam_get_image_vc_dt(struct unicam_device *unicam,
 				  struct v4l2_subdev_state *state,
 				  u8 *vc, u8 *dt)
 {
-	struct v4l2_mbus_frame_desc fd;
+	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
+		NULL;
 	u32 stream;
 	int ret;
 
@@ -898,17 +899,14 @@ static int unicam_get_image_vc_dt(struct unicam_device *unicam,
 	if (ret)
 		return ret;
 
-	ret = v4l2_subdev_call(unicam->sensor.subdev, pad, get_frame_desc,
-			       unicam->sensor.pad->index, &fd);
-	if (ret)
-		return ret;
-
-	/* Only CSI-2 supports DTs. */
-	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
-		return -EINVAL;
+	fd = v4l2_subdev_get_frame_desc(unicam->sensor.subdev,
+					unicam->sensor.pad->index,
+					V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (IS_ERR(fd))
+		return PTR_ERR(fd);
 
-	for (unsigned int i = 0; i < fd.num_entries; ++i) {
-		const struct v4l2_mbus_frame_desc_entry *fde = &fd.entry[i];
+	for (unsigned int i = 0; i < fd->num_entries; ++i) {
+		const struct v4l2_mbus_frame_desc_entry *fde = &fd->entry[i];
 
 		if (fde->stream == stream) {
 			*vc = fde->bus.csi2.vc;
-- 
2.47.3


