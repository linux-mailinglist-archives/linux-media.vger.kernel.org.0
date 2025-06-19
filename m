Return-Path: <linux-media+bounces-35404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B18AE0C68
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38E911BC7A14
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40552FE324;
	Thu, 19 Jun 2025 18:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gt+EeEx8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBC72FE317;
	Thu, 19 Jun 2025 18:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356371; cv=none; b=WovQGwdUpj7pt0mcMJ+dWYsLkhC3q12JiL9BWrX/h2vwdHCeRFBxzcjUG6iCLbLwm/yTxKAcCeFh4LkNK1WJqyZColnSSnmfbUI+6xLGctDs935HdfrDkKssYA/9bybSyvgMYjz+e4AEWkHZNYdONT0atWsp1Q+n6C3K7isztkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356371; c=relaxed/simple;
	bh=1gIorCFG94UmhHTN3ZrubNEQesMYc52whgy6DbtznSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1WKElZpQj+8/AWYmEsOSjAXOI+/HrghEOsA1Wy1TQnoob18DZKavXQhEIcjiNIlSIFt0DCTiJJyqDA1VBfsFiuh98O9XXSh6MB7Tv4nMVHNHyoqXhHXV3636Ns/rhtVKywbF0z5v2hLI+pXKG9AIo+YZAQJXGi+MLQTG8WEHFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gt+EeEx8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356370; x=1781892370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1gIorCFG94UmhHTN3ZrubNEQesMYc52whgy6DbtznSs=;
  b=Gt+EeEx8RsTNoAseLe9UeQd4ohyRKfuSx+s+102B/rMZ0PEwAyjQ+POk
   CkUQi7M8dheYnK5wqFSwAjYPuxrZU+zqw5B0sBp/x7bhekYr2T7AUS4W6
   DpCaZfVGNvWQcA2OX2Jk5NyrGLRhlvScAqqUcyeE2nw87tExIqdlUbc4K
   AZe9SM94DeUjVAKKApV3pNfiTtVmyphBfsJaP2oujLOuMLSbDUWaKhxXh
   03DogCim2eiuW75q80DIPrMNS/3vvqM2D2bOXmpaxUDdixakkzarWGnOg
   0yiQGTka5+psD5m5KoQmPnpWDHhhfTSgjOvQzKHYoKwSn5hYuXMCCotUY
   A==;
X-CSE-ConnectionGUID: LWOG4lH2Tky9FqD/3ZGing==
X-CSE-MsgGUID: NVINFG6oTM6vN4zv58bLog==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048764"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048764"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:06:10 -0700
X-CSE-ConnectionGUID: CSB7Pf29TP6lvjzAj49hNg==
X-CSE-MsgGUID: Zo+/maNARs2KfzfVihgicg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919747"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:06:00 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: akinobu.mita@gmail.com,
	stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com,
	arnd@arndb.de,
	alain.volmat@foss.st.com,
	andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com,
	hansg@kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	jonas@kwiboo.se,
	kieran.bingham@ideasonboard.com,
	khalasa@piap.pl,
	prabhakar.csengg@gmail.com,
	mani@kernel.org,
	m.felsch@pengutronix.de,
	martink@posteo.de,
	mattwmajewski@gmail.com,
	matthias.fend@emfend.at,
	mchehab@kernel.org,
	mehdi.djait@linux.intel.com,
	michael.riesch@collabora.com,
	naush@raspberrypi.com,
	nicholas@rothemail.net,
	nicolas.dufresne@collabora.com,
	paul.elder@ideasonboard.com,
	dan.scally@ideasonboard.com,
	pavel@kernel.org,
	petrcvekcz@gmail.com,
	rashanmu@gmail.com,
	ribalda@chromium.org,
	rmfrfs@gmail.com,
	zhengsq@rock-chips.com,
	slongerbeam@gmail.com,
	sylvain.petinot@foss.st.com,
	s.nawrocki@samsung.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	zhi.mao@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 35/55] media: i2c: ov5695: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:28 +0200
Message-ID: <8bdb217bfe923f3d0be1f2a26c5d631278eaeb18.1750352394.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750352394.git.mehdi.djait@linux.intel.com>
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_clk_get() fails on ACPI-based platforms, where firmware does not
provide a direct reference to the clock producer.

Replace devm_clk_get() with the new v4l2 helper
devm_v4l2_sensor_clk_get() that works on both DT- and ACPI-based
platforms to retrieve a reference to the clock producer from firmware.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>

diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index 663eccdfea6a..12e57ddf00c9 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -1264,7 +1264,7 @@ static int ov5695_probe(struct i2c_client *client)
 	ov5695->client = client;
 	ov5695->cur_mode = &supported_modes[0];
 
-	ov5695->xvclk = devm_clk_get(dev, "xvclk");
+	ov5695->xvclk = devm_v4l2_sensor_clk_get(dev, "xvclk");
 	if (IS_ERR(ov5695->xvclk)) {
 		dev_err(dev, "Failed to get xvclk\n");
 		return -EINVAL;

