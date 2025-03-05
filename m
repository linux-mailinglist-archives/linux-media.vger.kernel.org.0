Return-Path: <linux-media+bounces-27537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DBBA4F668
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB670188FA84
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 05:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B55D1C8612;
	Wed,  5 Mar 2025 05:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="hYOuFr68"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FFA1487DD;
	Wed,  5 Mar 2025 05:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741151803; cv=none; b=PvIwN2qxF9E8j4pYO8qGYM5dXF6wz+XYa6aYsSUWBYyRkBLVPQ7mjkQ/7NedwN3j+ygssNp5ys1WiKmO2M29WcdLiPQW9K7+gHmgVw2YmMgWkTy/1eWj/RP1AeNFEJJNOmjzmRSdj5KFXuthpDWZh2z+kb7tLO8FxMd/hFzFXeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741151803; c=relaxed/simple;
	bh=37VKGONsxjvpKUnJMOtwcfQHgZ97yI41PzVVtWvtvms=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NJzKemBGjXVdPpQg7vMcKgIHaR50KzRwcGAvzXqWiehw8hNDcD8cM12zBDHq+hJMcu469ODcfzlV6y0V0WFPqdoA9SOay6KZTB/ptNW31iEYolb1uaRQ/KNPB5aQlpvkhEZ94I6WJRF7b3oV026YiyzWsorzXsdiqcfoC/7Ws2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=hYOuFr68; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1741151801; x=1772687801;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=37VKGONsxjvpKUnJMOtwcfQHgZ97yI41PzVVtWvtvms=;
  b=hYOuFr681RgDvK6Ju3T/T28P8dbOIu/43QeD35TaKbL1jLuqQF64wSko
   +vfSEuyUdrkeL5ti1E6pAUV4OLiNPo9QkoKafqd828mf6hAxoYugF/XlS
   prKLem35PPLgwn2+xYQaHjhvN+LN961Y788WqfJpbmVZWT0aDhwyyQaqT
   BQrqMn+PqkFeaGXw40nDkWMLtG2a2/gp+iOU/QAAvYYMDCQBmohaRM6IS
   5yU4a5yQPllRnts7J2mMK/UFQ/a52+HY2tlMgB8nrits7ESWzSNH5ScKs
   12+V9quW7aG1HR7ZWSMAr3sAshvRUWEE8Tlc0moVygs7wYO7aIocXHgoK
   A==;
X-CSE-ConnectionGUID: Blbl5gjCRMSkEPMLME7zkg==
X-CSE-MsgGUID: IbVDpWy2SzOIBOOvuyA+/w==
X-IronPort-AV: E=Sophos;i="6.14,222,1736838000"; 
   d="scan'208";a="205972040"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Mar 2025 22:16:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 4 Mar 2025 22:16:25 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 4 Mar 2025 22:16:22 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <kieran.bingham@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <conor.dooley@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH V7 0/4] media: i2c: imx334: Add support for 1280x720 & 640x480 resolutions
Date: Wed, 5 Mar 2025 10:44:38 +0530
Message-ID: <20250305051442.3716817-1-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shravan Chippa <shravan.chippa@microchip.com>

Changelog:
v6 -> v7:
Add new patch: common reg value correction

v5 -> v6:
split the patches from two to three
1) Optimized the resolution arrays by integrating a common register array
2) 3840x2160 mode restored with reset values of imx334
3) 1280x720@30 and 640x480@30 resolutions 

v4 -> v5:
Divided the patch into two separate patches:
- One for common register array values with existing resolutions
- Another for new modes supporting 640x480 and 1280x720 resolutions

v3 -> v4:
In response to the review request, the dependency of the common register
value array on the 445M link frequency has been eliminated.
Although I do not have a test setup for 4k resolution at an 819M
link frequency, I have made adjustments based on the IMX334 data sheet,
the latest 4k resolution, and the common register value array. 
Additionally, the 4k resolution has been switched to master mode to
ensure consistency with other resolutions that also use master mode.

v2 -> v3:
removied blank lines reported by media CI robot 

v1 -> v2:
Optimized the resolution arrays by added common register
array

---

Shravan Chippa (4):
  media: i2c: imx334: Optimized 4k and 2k mode register arrays
  media: i2c: imx334: common reg value correction
  media: i2c: imx334: update mode_3840x2160_regs array
  media: i2c: imx334: add modes for 720p and 480p resolutions

 drivers/media/i2c/imx334.c | 205 +++++++++++++++++++------------------
 1 file changed, 103 insertions(+), 102 deletions(-)

-- 
2.34.1


