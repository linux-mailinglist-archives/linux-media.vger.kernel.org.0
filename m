Return-Path: <linux-media+bounces-35991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32558AE9F0F
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A22A93B4734
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE682E6D12;
	Thu, 26 Jun 2025 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LugPziQL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ABF2E6D0A
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945118; cv=none; b=XboVxvmxEVuEl2AZfVi9OWCW0q4+obFr789mP8fL/+ZqAfEfn/Qx6pkyvK6Y4782Calq23878HpSyMYayibcXTIsMK5HNQW7IS7gbdb8YX9QyRDmEnqj3CzFE8vAA/3pBaQgKQABUNL2FMjBu44lZpsDaAcL5nppgtMB7XCpP2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945118; c=relaxed/simple;
	bh=PC04xeqfMSH1gq5sq8mT7GOTPTl6rZu/96Q4mlN26Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uSlk5XdoEbi1Sy4/Xow6dDHs9/z8OsBh62ONppuKrHE17ZlOWMlp51roRaDAOQv50nnoCmXVk2NJxqO07b2gaMVA8sKwSAC4hxo+EZBCCZnDr+OJKMtmzkp/UNlUPREK3S3JHqdJce7gBv5BhhZkhYBkJWnte3XSVuirdIDq6Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LugPziQL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945117; x=1782481117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PC04xeqfMSH1gq5sq8mT7GOTPTl6rZu/96Q4mlN26Zs=;
  b=LugPziQLQOEd412B65Kxlrura2jgO+StstpMMhopLU58oCQChvz41XUb
   LvUz4l6sqmXOQKFV+tq8pqgu21rF/0WzOXMIMq3Fck9MfnQs3/ZbhgUvH
   NQZD/c3WZT9507SRH8xnpsYkPEILRliKuuo7LNalMbSk1gkjv9oOkP4hd
   QGvD6Zy6s9aylTNiLXxc1yI1lP7/N8XgYLjqDWdKdUQXgNfXc1AYY7mpx
   nXvpa4QC+4MX3QaBZn8nZVuf5Oodl+4NuyG5owaDUWHF0HoVorJjXXeLv
   aDFA8tL8dcGAmeCymut8kmFbCuc5oN0GVcLnhBNv/OHRexxeJ1tlJGpn8
   g==;
X-CSE-ConnectionGUID: jQm53qR6Sgui3ccEU8I6oQ==
X-CSE-MsgGUID: /GG2FMm0SfqzL9zCjh+WZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921988"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921988"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:38:36 -0700
X-CSE-ConnectionGUID: iP2qE2voSMmGnbWgoURscw==
X-CSE-MsgGUID: Q9tLTRdLT42m2LWxtdd8+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049763"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:38:30 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com,
	arnd@arndb.de,
	alain.volmat@foss.st.com,
	andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com,
	hansg@kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	khalasa@piap.pl,
	mani@kernel.org,
	m.felsch@pengutronix.de,
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
	rashanmu@gmail.com,
	ribalda@chromium.org,
	slongerbeam@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 33/48] media: i2c: ov64a40: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:24 +0200
Message-ID: <e9960e14e16caecbea1cf108e8618a11cfd8d67c.1750942967.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750942967.git.mehdi.djait@linux.intel.com>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
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

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/ov64a40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov64a40.c b/drivers/media/i2c/ov64a40.c
index a5da4fe47e0b..d7a13e855a41 100644
--- a/drivers/media/i2c/ov64a40.c
+++ b/drivers/media/i2c/ov64a40.c
@@ -3550,7 +3550,7 @@ static int ov64a40_probe(struct i2c_client *client)
 		return PTR_ERR(ov64a40->cci);
 	}
 
-	ov64a40->xclk = devm_clk_get(&client->dev, NULL);
+	ov64a40->xclk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
 	if (IS_ERR(ov64a40->xclk))
 		return dev_err_probe(&client->dev, PTR_ERR(ov64a40->xclk),
 				     "Failed to get clock\n");
-- 
2.49.0


