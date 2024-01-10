Return-Path: <linux-media+bounces-3459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B70829968
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 12:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1BFD1C25802
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 11:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C080E47F42;
	Wed, 10 Jan 2024 11:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Dl5Hz7Gr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96A4487B2
	for <linux-media@vger.kernel.org>; Wed, 10 Jan 2024 11:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1704886945; x=1736422945;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s35uulYj20NjjWRsZkGZXmOH90F3RANLuBgKuA9o2Ks=;
  b=Dl5Hz7GrXTXx/SYBAyFi3ihhf0X/LJiupN3Yq4pyQSr0KXr/u3i+gpxV
   RBdI0IIm2CCH6mDb3C2QiEGEcmXTNr2cQp1PHD7s+F+kGoBZwoy4lXILF
   7vbJdJr7+lc70oiAxfrDrNEWA/4isQT29539L0MBwfnT3W3Ya2TIT5mkK
   K5wNSJ87nH+LDtU/RQL4zp3RIhfDwWV3CtbNch0NmDf7pW/kzefhfPtWb
   2MXjUXJDwyvNXihUpLR9BCuTqZgccW75E9obYexbLlQC8TvyrAjvJUv+E
   vCfPzqwZGkTKJ/GhJ0E3ThKu9m5A11CzZQ8QESaxLkDyIQy/VfOZ3yody
   g==;
X-IronPort-AV: E=Sophos;i="6.04,184,1695679200"; 
   d="scan'208";a="34827596"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Jan 2024 12:42:22 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1A775280075;
	Wed, 10 Jan 2024 12:42:22 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 0/2] media: imx415: Add more clock configurations
Date: Wed, 10 Jan 2024 12:42:14 +0100
Message-Id: <20240110114216.504690-1-alexander.stein@ew.tq-group.com>
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
 drivers/media/i2c/imx415.c | 670 +++++++++++++++++++++++--------------
 2 files changed, 429 insertions(+), 242 deletions(-)

-- 
2.34.1


