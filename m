Return-Path: <linux-media+bounces-2193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A4E80E4CD
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 08:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A0A71F22C07
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 07:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A745F168B1;
	Tue, 12 Dec 2023 07:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="qW67L4sn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08B0A1
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 23:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702366003; x=1733902003;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f0SRWnYBEU8VQmP343c/80OG72R6TeKmEmtyKGKN0tU=;
  b=qW67L4snPrGiHvOZan4Zt5KR4HwPWi6XJM7B2sG5RWMj5VFyC08OEtlA
   EewlHyfPGOE2dSwTez4dhkY4ACbBai1h0ADIagIpQONW0BMBnznWYnEap
   HklB8rGhs+X38t7P2JpNX8w8bZt+LFIIwk+cFGI5RbS6zY6irAmZ8icyI
   mT80hhN4ceOos1OJ0loPUm/nUnKprRPQwLx+FId+iyhtp4vs9mBKhj3rA
   1WuDvq5KVWVs8yc7orC3dn5FT1HpQoCjLBBgXXiJV0Q63aZL9N6DIIQHd
   AEIoi8y/3viMxCLEvk8p67iGAboS/LJRa4ZjdrdbqeQXhenXCc1yrGgYf
   w==;
X-IronPort-AV: E=Sophos;i="6.04,269,1695679200"; 
   d="scan'208";a="34447322"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Dec 2023 08:26:41 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 328B2280075;
	Tue, 12 Dec 2023 08:26:41 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] media: imx415: Add more clock configurations
Date: Tue, 12 Dec 2023 08:26:35 +0100
Message-Id: <20231212072637.67642-1-alexander.stein@ew.tq-group.com>
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
 drivers/media/i2c/imx415.c | 651 +++++++++++++++++++++++--------------
 2 files changed, 416 insertions(+), 236 deletions(-)

-- 
2.34.1


