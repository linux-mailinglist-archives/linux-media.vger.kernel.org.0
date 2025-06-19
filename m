Return-Path: <linux-media+bounces-35371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DA4AE0C3D
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 707841BC6723
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4BC28D8F7;
	Thu, 19 Jun 2025 18:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SGGBeHrM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD3E152DE7;
	Thu, 19 Jun 2025 18:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356031; cv=none; b=kbHwVPPP/pIDtB6t43WwodtbUzV1V1YZwJvaewwL5ESF5VE4/SPEn/bfRJ4dYP08OfqeW+YkNw5fs2D9DQjjbhyrypcPiInybICkpn+JnYz2BYW+Avee/qWnyW7qftjFrjyUFIudKy51pfzPeDf7amTVasW0lMStKfLurmShQCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356031; c=relaxed/simple;
	bh=KWJQMbX5JD4uCQEL5BpmXqyAVzFe/6rRwmcsG5G6wsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GF+ZW0kiCZFOoIdhNyPsh73cfs/1HE0UMTxMp2K+WzBNZ4FbWYor3lcpwE0fFEy9mx8SzoKcHM9p88DshBTDu7PgcGvwsjHUlAXFy9BTDZ3+PtMQjV/fgezSthSSXyoHvthRfWoF86aZp8mQ00gollB0TlVmPmnEIv1FByGXaMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SGGBeHrM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356030; x=1781892030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KWJQMbX5JD4uCQEL5BpmXqyAVzFe/6rRwmcsG5G6wsY=;
  b=SGGBeHrMzQpRslHLMT9/XOFgEmmGs8/eXT9wneTaUJ9bvWqIJ+J50vUK
   +ZkPKMTAY7DDYuGx6E/re3pSuCcYUYIZUE/TCYvOgsaACc84PpbjPkK6d
   a0BVVclfTwmwr6SAai+kBC/xYWQ1vYwwfpz2AyeUeZ8dyXRnCsq3wWjaF
   NEByxYPvj90iu0C7bUwIZo0geUd8GYRRqhr+p5iwhJCGMw7yt0oqTJbha
   rvHrgbns8C24L8MQnA6P3d2mX6DUc1ROSoh7c8QXqO4MgOb7hnQltbfGs
   4WGJ6Z5Gyoqap8tlN+3uy/t4D6AQbn4v6MQHdXCk83nvEdNVmm+ajhgww
   A==;
X-CSE-ConnectionGUID: 9JY8ZGAXRnK3lt84bSUb2Q==
X-CSE-MsgGUID: RtkE+f9HQC+qTVoZXLGy5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64047708"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64047708"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:00:29 -0700
X-CSE-ConnectionGUID: ONf8kMIbRWyfZhOBKM6CDQ==
X-CSE-MsgGUID: egyGboLvSVi0nfLadPKJMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919277"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:00:19 -0700
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
Subject: [PATCH v1 02/55] Documentation: media: camera-sensor: Mention v4l2_devm_sensor_clk_get() for obtaining the clock
Date: Thu, 19 Jun 2025 19:58:55 +0200
Message-ID: <1261f41358da597fb9900b7880618ebcc392160d.1750352394.git.mehdi.djait@linux.intel.com>
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

Add the new v4l2 helper devm_v4l2_sensor_clk_get() to Documentation. the
helper works on both DT- and ACPI-based platforms to retrieve a
reference to the clock producer from firmware.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index c290833165e6..c82c018a5f40 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -32,7 +32,8 @@ user.
 ACPI
 ~~~~
 
-Read the ``clock-frequency`` _DSD property to denote the frequency. The driver
+Use ``devm_v4l2_sensor_clk_get()`` to get the clock. The function will read the
+``clock-frequency`` _DSD property to denote the frequency. The driver
 can rely on this frequency being used.
 
 Devicetree

