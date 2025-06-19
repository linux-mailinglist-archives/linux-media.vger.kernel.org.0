Return-Path: <linux-media+bounces-35416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 225AEAE0CB2
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63D7F6A130F
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DDC30E829;
	Thu, 19 Jun 2025 18:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbRMyp4d"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D23530E827;
	Thu, 19 Jun 2025 18:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356704; cv=none; b=Eo1U3S7fCpAS4wuuhmqW7n3pvhzs6AbTtZrPR7ApqlcxJuVZe1P7juFPIloN4CFvPx+1DFhbVPZrWxDX6bwFdxEiveJelr+MtY06LuIHwxA134eDTpYTY+8k7kqURVRPmN7IDdL7cqyyL2GfoY5G98FXz6e2iU6mNpA9FriEcBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356704; c=relaxed/simple;
	bh=u+HYL/MjomKoU42zZYmC3mQI9Nv82B1dv3/KNsTDo2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GNiRbxlULJb4B7E9OsFA0P5ua+simb+BjPfgcLr0iiThjgfIptSSxzGctVDbn1PDVXuG9Jpef70IYTIiMi370+zpfQ/DxHgxO1CiIGvNZRFa9zdYR29E25zIYOb/t97+DnHaQfyv7s7t5uAwtzA+wjwXrPJ87M1ATgyHnKMXgUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbRMyp4d; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356703; x=1781892703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u+HYL/MjomKoU42zZYmC3mQI9Nv82B1dv3/KNsTDo2c=;
  b=jbRMyp4dBF52v6VJ/RRqGrWxq72kuLixRf2jEw+uLRNQbrYM8qZhY5eG
   FbmHQLnVShax1DLOnc0JBqYA/Cg49pHThFCy8XvgGEzWaSQYHvTvpspEQ
   Xl7Ev584GKTOAHkCxRnmOlH1oxydjuKw5XAV6dqWPKXhgdlEpSASAclDA
   cp8Ae3Z7ocBEcBGfZPMYV4JZOcsODG88vkRHsc+ioLfuLJV1kvxwo2nJx
   X4/Bd7iZf3Ao/Mrk6b6eGrae2YgHLppxP5BYqfDkVpah+QG7IScmkqDEJ
   bRzLO7vjOF2AYkjiENBWcpFqkv4AT9pjYYGa6XMDbwkchLzCt7KlkZBzD
   w==;
X-CSE-ConnectionGUID: aSz1p6eoSqG5dHr4H71XcQ==
X-CSE-MsgGUID: KGjIsUewQ+KgNvDYVM0kqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70054265"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="70054265"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:11:42 -0700
X-CSE-ConnectionGUID: Y1Rhx4+USu6+JomqiPjZ4w==
X-CSE-MsgGUID: bKumbF1HT5+VNkcsKCJ3bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150143595"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:11:33 -0700
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
Subject: [PATCH v1 46/55] media: i2c: s5k5baf: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 20:11:16 +0200
Message-ID: <01a20363c37c8cfce366422739a3dcbacf523f5e.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 24f399cd2124..01d37f49e5ad 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -1967,7 +1967,7 @@ static int s5k5baf_probe(struct i2c_client *c)
 	if (ret < 0)
 		goto err_me;
 
-	state->clock = devm_clk_get(state->sd.dev, S5K5BAF_CLK_NAME);
+	state->clock = devm_v4l2_sensor_clk_get(state->sd.dev, S5K5BAF_CLK_NAME);
 	if (IS_ERR(state->clock)) {
 		ret = -EPROBE_DEFER;
 		goto err_me;

