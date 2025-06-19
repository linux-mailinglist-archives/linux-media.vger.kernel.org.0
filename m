Return-Path: <linux-media+bounces-35372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9953AE0C40
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E965E4A4BE2
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B19428E5E6;
	Thu, 19 Jun 2025 18:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpuuiObE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2469E28C871;
	Thu, 19 Jun 2025 18:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356041; cv=none; b=CUldEujOzymo/q6wNV4sSlC6RR9HdEtx65ZCCBmWN0KIzzcfGxWoyHvoR+i6vxs3kjAIPXecvqxvpTaiE8AnSfKj1nSOlg9FcTj6b3Ys9SBioIx9sYuV84IvbqtA/yWjn9F5kYn6qaZLjJYbK0nBLe6VP92HPK5kR84fWKrLOEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356041; c=relaxed/simple;
	bh=vPzOH8cs9rp6/ju9/wn6goMW3EgRy1pi6+Fkchq34xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4G7XQpUqi3PDnr25IzTytwB0c6Z1GSDVFZ8xfbh6Rse8TBJcO5QJ7XdVKylBS6RKOdH4e5KI+px8RipRFofqCSEvCmNcP88nEHj7Mf8GGKisAmS10Mn6NEpuIPHS+YSBMqKas5xZlRD6bW6zm8450ndJHjhVOQ+dJdVFKrC8tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gpuuiObE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356040; x=1781892040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vPzOH8cs9rp6/ju9/wn6goMW3EgRy1pi6+Fkchq34xg=;
  b=gpuuiObEDPwpwzpUwHI7T/EmWt6zQOFIJXiC/TECFv4bd0FIlRZ0Y1H/
   CU8oUhNszwB5tKf4Ypkwpx/lhSGtbiYdktCB78EkeiCQ1rJoS4w7UUoVe
   Up7QVP7aDuy3dAymbK1lvnGiST3CCLesHsWhwz852inEsnqWqrHc2sGVj
   zqPyMnFMjDrsnLK7n0byhefxcOw6v0N6JYWPT2TeaDqU1NmUWW7/oV2KZ
   VPZ+qcmhzUZJQWe9R066q1ccCCFhpbyLc7q6+j5CY1w0B7Y8t9ajdO9ga
   sWKw66DN0OtyY7hWwaxOxe9nLKmBYefAu5RLG+xoWDAgiuiUQxF8iAj68
   A==;
X-CSE-ConnectionGUID: NSzC/bwiQFmPjXJgAsicow==
X-CSE-MsgGUID: ojhVS7cBQwmFIMaZ7810pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64047743"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64047743"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:00:40 -0700
X-CSE-ConnectionGUID: UvM614VbRk+b6MJKV3qI5Q==
X-CSE-MsgGUID: NsRB+dyDQzmRuRF2oiz4+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919295"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:00:30 -0700
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
Subject: [PATCH v1 03/55] media: i2c: ar0521: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:58:56 +0200
Message-ID: <193004ef9f9ace1b4c1289da7bacbee5adcd5ebc.1750352394.git.mehdi.djait@linux.intel.com>
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

Replace devm_clk_get() with the new v4l2 helper devm_v4l2_sensor_clk_get()
that works on both DT- and ACPI-based platforms to retrieve a reference to
the clock producer from firmware.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 24873149096c..87fb12774b95 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -1077,7 +1077,7 @@ static int ar0521_probe(struct i2c_client *client)
 	}
 
 	/* Get master clock (extclk) */
-	sensor->extclk = devm_clk_get(dev, "extclk");
+	sensor->extclk = devm_v4l2_sensor_clk_get(dev, "extclk");
 	if (IS_ERR(sensor->extclk)) {
 		dev_err(dev, "failed to get extclk\n");
 		return PTR_ERR(sensor->extclk);

