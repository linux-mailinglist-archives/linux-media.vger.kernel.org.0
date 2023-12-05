Return-Path: <linux-media+bounces-1646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD80D804D30
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 10:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A37CB2075B
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 09:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B88E3D984;
	Tue,  5 Dec 2023 09:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="JFmHzEfR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4EBFA
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 01:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1701767162; x=1733303162;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KuDOk6Xf/GnHEv0tqTNVNp6Stwsy7PMvg8hwhOKR5xk=;
  b=JFmHzEfRz0NAB0z/f/MrpllOMP9I7lkslnsgd2faODU//kPW9eRa7L1X
   Enprrf+vpQRpMbCCPCN2IVgbXFqCApb87rroiyNPbNtlFEvjpyLrvwCL+
   tliqSYAZ8kXeUs2wsDJIli8pQjfFP8QFfNHe/LWMJXxpStaK1vdVxIw70
   wpqbsAfhqmDeG5nLzi3szSuWCqe50Jm5nRbsq4a6C41Ov30aoPsiqfKCg
   YXtV+pUOZjaJWzno3AWHlpt+HJr9TrksdWqHgxi0eM1VDms3wtzBKaPYM
   1Y32yPA9dxOI+6tUtHWohTTzUddvm/0yDc6NEGKliNy8SosAWWhp2nN+6
   g==;
X-IronPort-AV: E=Sophos;i="6.04,251,1695679200"; 
   d="scan'208";a="34328800"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 05 Dec 2023 10:06:00 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 230CE280075;
	Tue,  5 Dec 2023 10:06:00 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 0/3] media: imx415: Add more modes
Date: Tue,  5 Dec 2023 10:05:54 +0100
Message-Id: <20231205090557.298680-1-alexander.stein@ew.tq-group.com>
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
On top of that more clock setups and modes are added to the driver.
These are all taken from the datasheet. I suspect they all can be calculated
dynamically later on.
Tested on TQMa8MPxL + MBa8MPxL + ISP + Vision Components IMX415 camera.

While working on the driver I notived that imx415 sets mbus code to
MEDIA_BUS_FMT_SGBRG10_1X10, while imx290 uses MEDIA_BUS_FMT_SRGGB10_1X10.
But the datasheets show the same color coding pattern. But both settings seem
to be correct, e.g. the resulting image has correct colors.

I had to remove the identity check locally. I suspect that Vision Components
interjects reading some registers.

Best regards,
Alexander

Alexander Stein (3):
  media: i2c: imx415: Convert to new CCI register access helpers
  media: i2c: imx415: Add more clock configurations
  media: i2c: imx415: Add more supported modes

 drivers/media/i2c/Kconfig  |    2 +
 drivers/media/i2c/imx415.c | 1013 +++++++++++++++++++++++++++---------
 2 files changed, 779 insertions(+), 236 deletions(-)

-- 
2.34.1


