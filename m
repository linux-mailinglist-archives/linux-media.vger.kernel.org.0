Return-Path: <linux-media+bounces-3780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF74283009C
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 08:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5E2A1C23D76
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 07:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD0CBA57;
	Wed, 17 Jan 2024 07:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="dHhSvSOw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EFFBA27
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 07:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705477183; cv=none; b=lfg+9gzVXHqN5XwuuXLcIQMfjXBp/eRATS4r80EHQLwRJyR4DMpq23+O7mcHmNzgzcCyP/gQ748NVHCexrsOO70JUJjythT9yEWjIISZ3cgHMrRvFw4QxvjasaceuQrGxElkpX4C7b863s+vO+nIc1evf5/kyiWnwKga80+0JDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705477183; c=relaxed/simple;
	bh=b3WPnsNipQeLYkc6L752yhTYvPjdKDM9DBWpg8cuC5I=;
	h=DKIM-Signature:X-IronPort-AV:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	b=oBdRNfzPBd5BAnLA0eThF5CnVbcLvd7QxQJjWz4iVClXK/mDkY9VVL/Vt25sPD6yE6qS3sV1HCCLEP8HpFj/SWQla9un1m9RnfVuJ2E1eOfbwblv/EQcJtP/macOa41fr9flZBcPRBUCgy30IuZ82MR/r2AWQla797CWV/0O5W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=dHhSvSOw; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1705477181; x=1737013181;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=on3lTccFpbtU0e5N68z08cN9iJZkXTWJuTsq5E5MA+M=;
  b=dHhSvSOwJbXIDLPf16WlukR++cWUgfzaUSXcWbqkSkMYQvPAcyXRTNHZ
   FonUh3fcKrzfmejHZKjdjHL2Nb7d9ta4ab4Px6tPWd/oPBJgy34XhocvG
   YNUv11RTspW5pF/9qUy/hFnRVFffErIrs3R3FQdfjP4N+eNtqTLL0p5Bb
   Qvg8GlCpBDMxn3RZBWpI9SbTT5B6uMDi1LCpnkbUZXZ2B7jCSQjwGHLK2
   w1u8Vu/cf0RCYxUitvI5IGSgKlqqLZiLM4mawnsSTzYleEZ/jT99fyDIj
   X8TYlLt8t9KZiRj7UsDqAL7Wuq7r6ojRbeSOWFoATkdZ5Ugp1Eqae+z13
   g==;
X-IronPort-AV: E=Sophos;i="6.05,200,1701126000"; 
   d="scan'208";a="34931177"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Jan 2024 08:39:38 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 46C9B280075;
	Wed, 17 Jan 2024 08:39:38 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v4 0/2] media: imx415: Add more clock configurations
Date: Wed, 17 Jan 2024 08:39:34 +0100
Message-Id: <20240117073936.2812336-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this small series converts the driver to using CCI helpers.
On top of that more clock setups are added to the driver.
These are all taken from the datasheet. I suspect they all can be calculated
dynamically later on.
Tested on TQMa8MPxL + MBa8MPxL + ISP + Vision Components IMX415 camera.

While working on the driver I notived that imx415 sets mbus code to
MEDIA_BUS_FMT_SGBRG10_1X10, while imx290 uses MEDIA_BUS_FMT_SRGGB10_1X10.
But the datasheets show the same color coding pattern. But both settings seem
to be correct, e.g. the resulting image has correct colors.

I had to remove the identity check locally. I suspect that Vision Components
interjects reading some registers.

Changes in v4:
* Fixed reading chip ID
* Collected Laurent's R-b

Changes in v3:
* Lower case register definitions
* Add missing variable initialization
* Fix line lengths on several locations
* Simplify imx415_s_ctrl()'s cci_write usage
* Suffix lane_rate (u64) values by UL

Changes in v2:
* Removed explicit selection of REGMAP_I2C
* Dropped patch 3 for now. Mode selection shall be done by dynamic VMAX/HMAX
  calculations later on

Best regards,
Alexander

Alexander Stein (2):
  media: i2c: imx415: Convert to new CCI register access helpers
  media: i2c: imx415: Add more clock configurations

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx415.c | 672 +++++++++++++++++++++++--------------
 2 files changed, 430 insertions(+), 243 deletions(-)

-- 
2.34.1


