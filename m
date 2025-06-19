Return-Path: <linux-media+bounces-35310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E04AE04F5
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C90553B64D7
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC2625A2C8;
	Thu, 19 Jun 2025 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InrgnmyV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBFE2594B4
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334362; cv=none; b=Qt92FeEIRuDYroHTO5HM9kLV2Bo2/IvlJVJKBFi3GWJ9peJ2jLbp7J9iBZxushrjDoDjyRqc797a0l34+IfXgd2PlJkRCG88VeI8VVOcp6MsAVEL9GGYBNOpzR6v9j1PkPkJyqDRlwcxkwhUy5MTjs8d5/1nbevRfs+/5D4r3KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334362; c=relaxed/simple;
	bh=UqzkOPzCc/gFzaqsq7hM7ZRnwBZ46R/qF2fqP/JNWZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PLwEP+2yjGpbAFppqEew5Rmg/Q6p6801oQCP6FB13MOre7MT4P/s/hYg4uBYj477zxFinjl7Vq2Q0vLf8aomVKTQ88TuICrcvOAdnpz7IVssWDCk2urr96fvxsi7qsk+N/gvWjBvLVTGDJfn/fo82aSycBtN9vLkaueTNUSeM1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InrgnmyV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334361; x=1781870361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UqzkOPzCc/gFzaqsq7hM7ZRnwBZ46R/qF2fqP/JNWZA=;
  b=InrgnmyV5sqqUxMYqIMoefknFAsgd/Z7VSKYT3+QjCGMeb2jrP/srztL
   os8aGSU53lB283ejxhS3zCViEgwbpabRkBWiOu0ew8m3thqGabpcxxrk2
   YGc/EAfPYyF4gVdbEUeOCPelu4NGNAS7RPjvrDesoaOcA6vZ6A5CbmdCi
   Ydz2GoAj3tK7u3Pljmt+FcgsidpHYIiye7N05OgEqEMMJ6ocJHxWwEH7L
   Qg7d3qcRCZseSXgRU+gxu7y2oMebixDGTh4JmWpitQ8qk7Hla4npsdrzK
   Z3ENrIPUkfCJw1OX7EjYbqUe2r1lQTrWMWFLkFR5/Bw3zOVyi9IKtkzRt
   Q==;
X-CSE-ConnectionGUID: p2TjIejtTpCFKNTXVs1C3w==
X-CSE-MsgGUID: uhe4vstRSPuZy6E8V6E14A==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386675"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386675"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:12 -0700
X-CSE-ConnectionGUID: w7XlUEMNQBC0XanxrgOowQ==
X-CSE-MsgGUID: H4kVgpolSC+mMgGZh5P8xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908439"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:06 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 50938123266;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008ALW-0y;
	Thu, 19 Jun 2025 14:58:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 49/64] media: ov2740: Add metadata layout control
Date: Thu, 19 Jun 2025 14:58:21 +0300
Message-Id: <20250619115836.1946016-50-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the V4L2_CID_METADATA_LAYOUT control to the sub-device's control
handler, to convey the metadata layout for the sensor-generated embedded
data.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 0b9309fd0461..00319eacf89e 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -863,6 +863,9 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 			  V4L2_CID_COLOR_PATTERN_FLIP,
 			  0, V4L2_COLOR_PATTERN_FLIP_BOTH,
 			  0, V4L2_COLOR_PATTERN_FLIP_BOTH);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_METADATA_LAYOUT,
+			  0, V4L2_METADATA_LAYOUT_OV2740,
+			  1, V4L2_METADATA_LAYOUT_OV2740);
 	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_CONFIG_MODEL,
 			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR,
 			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR);
-- 
2.39.5


