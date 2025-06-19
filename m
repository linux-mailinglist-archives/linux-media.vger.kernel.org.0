Return-Path: <linux-media+bounces-35420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4643AE0CC4
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 600E2189CAF4
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41CF2D4B51;
	Thu, 19 Jun 2025 18:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ex25Tytj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AEE2BD032;
	Thu, 19 Jun 2025 18:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356744; cv=none; b=uRToCzqpwk4VcVbs/FEX3Q9d4f0rJA/yDnyK8LNEv0eDQQ9P0LiXOCOySTqaEJ06igAvXyl6Wu7nJ/f9tONg7fWEKeskbgANObKKW38NLiNhZqpSxq0THyVk4WTBF2NJY7kYWzF6bHqjyOTGDOV0e8r2U1srY/oIf6/D5DWhmtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356744; c=relaxed/simple;
	bh=bTo6px3X1EMi1rbOravRwlvb8EcSahPkxhRIpVezF4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GUQLGB2vKXoKXkaRGcCFeZfjZ+bIiKmlklqgvZvlvwlAv57OtTIKlM9eVWCQg2dhbO0KnjscRmMRwofmqkWV5QpYnqdqwi9VRn2d5yhlDyM+VgpxmYEQp1OsIM4nT3m1i9d997brNkBcxKcnF3/8w0hHUmWq6bbT9npIn4EzITk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ex25Tytj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356743; x=1781892743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bTo6px3X1EMi1rbOravRwlvb8EcSahPkxhRIpVezF4Y=;
  b=Ex25TytjzxxcIvkzq3y5ph80hW57p7FOirDntgT9rUetpTrkuHwFZMju
   kkZOAQx9jpDHshMNm0f3Gi0J82Gxs7MeHRLx0DJp6lcBj4S6VUpuaIPZM
   f7bncecVzNik+U/LNYzVnsoV5KosyH5hwzbteU+MbhrUgcTIkXTJdyawa
   4kP9xL+2/c9BczO0zj7eBby5IDDT+8V7SjrggLywNwIG6ae1ex6syUqDD
   kOGCXeNAXFmOLLKAxh8Abt4A/WpguAuwRjTTPA/shVz7CIpyJr3oX5mv0
   7BUDqQc5BdqhSpNlQfE6DficA3s9cSnjhj8Nl2f5q6BPlG5rf3ntXA3CQ
   g==;
X-CSE-ConnectionGUID: Mk98FO+MTbKGIXq17PT1WQ==
X-CSE-MsgGUID: d9rXg7bGRZ+fyxT24Ytxqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70054432"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="70054432"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:12:22 -0700
X-CSE-ConnectionGUID: cmz6Q6iCRvyqzah3W+VjVQ==
X-CSE-MsgGUID: 9FqFp6DjQM6ySAoxb72tnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150143673"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:12:12 -0700
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
Subject: [PATCH v1 51/55] media: i2c: thp7312: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 20:11:20 +0200
Message-ID: <840db3da814e0355bbb572e07f1ef794831bd8e7.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
index 8852c56431fe..ca5c5c409c8c 100644
--- a/drivers/media/i2c/thp7312.c
+++ b/drivers/media/i2c/thp7312.c
@@ -2109,7 +2109,7 @@ static int thp7312_probe(struct i2c_client *client)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get regulators\n");
 
-	thp7312->iclk = devm_clk_get(dev, NULL);
+	thp7312->iclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(thp7312->iclk))
 		return dev_err_probe(dev, PTR_ERR(thp7312->iclk),
 				     "Failed to get iclk\n");

