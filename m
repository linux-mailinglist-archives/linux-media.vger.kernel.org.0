Return-Path: <linux-media+bounces-44798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B04BBE6833
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 08:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A41E84E8C7E
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 06:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D2E30E83B;
	Fri, 17 Oct 2025 06:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/5abOfJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03221334689
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 06:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760680873; cv=none; b=UzmZ1WxXngJHo4jhIk63rDrg/JyKQZ+9zDgyPaIOAg/ZGgjUfqjPPa+xcwIvMy9nW3vSYgh969GKeMyBpgBf/HTclGZGxq2rHzj/eqbHiAJg/pk4n1zT2tOlRmH/g7f0mJWvz0ffJcIBHPOj9abGetxqsH8NRMW+NqgYWa1Ga4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760680873; c=relaxed/simple;
	bh=Ie+DdpUGd+rdnkg4BCuoPTBOYmemiRQ5f1ipSBQSlE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CHILyNrIOibQI8p2CivfDADoNIF27QIbb4Nd0t8dL6jt5dahJucKCfgEqmDmd2Cea/y+pu5+EM9usNLeeNcA1wqFh4Evt93/Qjg8cRYVHb2UQ6CCEMwu1LH0SiEfiIe6uUokVDlVIpYO4p2hg5CJoDXsJBWWCu4OqF/b1x9pkrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/5abOfJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66360C4CEE7;
	Fri, 17 Oct 2025 06:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760680872;
	bh=Ie+DdpUGd+rdnkg4BCuoPTBOYmemiRQ5f1ipSBQSlE8=;
	h=From:To:Cc:Subject:Date:From;
	b=Y/5abOfJJgVpwQezlon0ylS5aXkMVeWZZpVeufXT7KhwNW83cyM0i9QikyfFj/8cL
	 s7dNHgU9nBYVLe4sOV/thtazStnoGGws9QNDmx4XqleCY29/bIUaVQplCUP4b4EV+R
	 zIa5NUNxpn5WwrGIxw9w0JqX1hVCq+f/SH20+tc0+knlDM06HfLE7GcYnRxfeLJaaE
	 NHdjWER3w8BG8h1M2UBJCN8njiRs+NMwtUP0Jn0td+M7qTI0l5MGlS/f6lmD1wQeg2
	 xSdWpHWXG5gOiFZ3WpA8GV8DS+N0vn3p1GGqf4eTIQVdbK3ThUX+skMmevVsiDx+Ap
	 otEqSsbtVIfmQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v9dWd-0000000029C-0Y1u;
	Fri, 17 Oct 2025 08:01:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>
Cc: Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/3] media: imx-mipi-csis: drop unused module alias
Date: Fri, 17 Oct 2025 08:00:49 +0200
Message-ID: <20251017060051.8204-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver does not support anything but OF probe since commit
f0e7cfbb43f1 ("media: imx: imx7_mipi_csis: Add i.MX8MM support") so
drop the unused platform module alias.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index d5de7854f579..fd399af56e0c 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1634,4 +1634,3 @@ module_platform_driver(mipi_csis_driver);
 
 MODULE_DESCRIPTION("i.MX7 & i.MX8 MIPI CSI-2 receiver driver");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:imx-mipi-csi2");
-- 
2.49.1


