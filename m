Return-Path: <linux-media+bounces-50417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01009D11AAB
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C1F33049FEC
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F373281358;
	Mon, 12 Jan 2026 10:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFy/XFlg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D952820A9
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212010; cv=none; b=DWcB+sTRTF6gf4NTxB7A+X0w4w0ElJhNxoBd00v4OBMEZ63PvVHx/Lad4Ic+hiTOkiVgXNAzuY81siATkBDT7piaW3vV3QxFG3RCl7tq6HnJDXnFxsIrWY9UFFOlmo8PNytTvOUNGIv4BiGoSTwuV1X3VyVpYTo1Fvq3rZDPfGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212010; c=relaxed/simple;
	bh=rrGTkNjwiuZHF5pM9DdY0p1AkLQZqtoRjMDo9+On/Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lE/EqKlgS3ip7dl+cR3h5GqYY514uut9YfKM055zj+MsesCw/NFPpkBTWIiWAxMYrz4HIPxkBiu7lyJaISU67O3sWIwSDdjo4jSIAFgwLCAuVzlvobNc7OMo1MYWlvTnzne9KFjHyRhsSZ+DcbqTbslsaMi6DVXH15Z0F23tfHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFy/XFlg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212010; x=1799748010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rrGTkNjwiuZHF5pM9DdY0p1AkLQZqtoRjMDo9+On/Wc=;
  b=mFy/XFlgxUE9vRzUv86tl/dHPT6Y/vyQ0TTcx79aC6+kwbtkpj2TcAIs
   3xL5SI7z4Nzn+stptA4DOCtyxOLrA5rirX2no3aDFRdwqZ020WML0raXB
   IdvHLcgsA89v6yry4/LDBIqKqg5zxi10Q0JheJ2ZB0gq2dEuj8H7zhaID
   aD53d8Y2ixi3akTYRanxhQ1aT+WX+awxf93XWkjXr0u9NNUKtadvQlrVM
   kqaGROvrhGIxy7AqmIllsR94aE8UBpXFszv8U/0NAo0EC/Rw1Mehw3Wme
   2o0j28CgesGj6h1X34Z52yaIExNT11UlJadcWG/SkijnDpG3JKqEc2g5Q
   g==;
X-CSE-ConnectionGUID: B/ermJ9IQxyBzD8XzFr24w==
X-CSE-MsgGUID: p9HWUpU3ShWqyBDhdARREQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218793"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218793"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:58 -0800
X-CSE-ConnectionGUID: Q3vom2sOQ6W/7x78Nm3GRQ==
X-CSE-MsgGUID: m+NGl1JWRESNJzg+oaL/6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743134"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:56 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2CD8A121F7D;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000011M-09Ah;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 05/23] media: i2c: ov01a10: Fix passing stream instead of pad to v4l2_subdev_state_get_format()
Date: Mon, 12 Jan 2026 11:59:31 +0200
Message-ID: <20260112095949.3851-6-sakari.ailus@linux.intel.com>
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

The 2 argument version of v4l2_subdev_state_get_format() takes the pad
as second argument, not the stream.

Fixes: bc0e8d91feec ("media: v4l: subdev: Switch to stream-aware state functions")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 1e22df12989a..dd2b6d381175 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -731,7 +731,7 @@ static int ov01a10_set_format(struct v4l2_subdev *sd,
 					 h_blank);
 	}
 
-	format = v4l2_subdev_state_get_format(sd_state, fmt->stream);
+	format = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 	*format = fmt->format;
 
 	return 0;
-- 
2.47.3


