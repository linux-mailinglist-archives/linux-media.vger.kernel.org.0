Return-Path: <linux-media+bounces-35419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E930BAE0CBD
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 451836A2040
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD6B2BE7BE;
	Thu, 19 Jun 2025 18:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9vlU9IJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE7C2BD000;
	Thu, 19 Jun 2025 18:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356734; cv=none; b=ipLL9LqfsOXkd4SlEY0kmIZNCh2ak6DiQ7rWl0dKnVvRVI0ldMQu8fbN5v2YHeIIYaSnIZG6x5PUHSXybW9olWJ1Rblb+b5osscrJGx6e4BuVkEds9lIppBP5OV7W+6LsQW8ijk0SOaWZJWNF8DuECcl0SHkx2k2xIGSmfo4QnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356734; c=relaxed/simple;
	bh=1Nn/o2nuXOF2WSKEl7KGbdIlMXsDwh9W0PIpKVz01n4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cet0v69mrVETr0wqGDYOfCw50qT65GV5AAjhMr66x7R35cGsXBEqUrASC0SKTgKFvukvPv712i/juwYllKwI1r0g3y43t/uEMD42op4sfYMfV8NRoLV1hh4WHlhV5mOErSQcQpXLlpuhcCjACvlCF8dpUp8TZxOhJoTpjLnYNLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9vlU9IJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356733; x=1781892733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Nn/o2nuXOF2WSKEl7KGbdIlMXsDwh9W0PIpKVz01n4=;
  b=i9vlU9IJhh88N3FxRRXcxPciUhiH2YAGadUcXQ38Cik+hwHdj7q0ZDmr
   6Oux8Ac9plwZAT+Ub9xw1tQT1Bta7bclBXRD1MWttmWvcWBLRUiRLP37I
   VrIEIecM5fLaPhNuu8sipAw94SjuQldOOLuTJEqOfha259xvsonAMMKuI
   dtqZ4IIWiG7sfBMtblEqX8Vl4iyEtIEvVDdxjIbmiHXkAlc8afoLvMRlp
   e5r09p2AAanEJzIBRDxAaiDpkGaZXYjzp+fnEx920rVSd4FdSRSrBSHps
   urt/kTb9RpS5fJn6nifKzu7zvPQaWiw168qEGlI95o2g089MEjIYAIRdm
   Q==;
X-CSE-ConnectionGUID: 54ZavXRVTe2m56ko8NN5Bw==
X-CSE-MsgGUID: u0qgcgBFRkWT+Ed5ffZpAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70054390"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="70054390"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:12:12 -0700
X-CSE-ConnectionGUID: jDqTubunQNuKA0Qv1oWq/Q==
X-CSE-MsgGUID: E31axTxHSvqxOHaE1RFYXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150143645"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:12:02 -0700
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
Subject: [PATCH v1 50/55] media: i2c: tc358746: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 20:11:19 +0200
Message-ID: <e5c3ac26a9639ce61828f96fbb88b286f3daa1dc.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 143aa1359aba..66d271cd516e 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1525,7 +1525,7 @@ static int tc358746_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(tc358746->regmap),
 				     "Failed to init regmap\n");
 
-	tc358746->refclk = devm_clk_get(dev, "refclk");
+	tc358746->refclk = devm_v4l2_sensor_clk_get(dev, "refclk");
 	if (IS_ERR(tc358746->refclk))
 		return dev_err_probe(dev, PTR_ERR(tc358746->refclk),
 				     "Failed to get refclk\n");

