Return-Path: <linux-media+bounces-308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6707EA6A3
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 00:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAC671C20A16
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 23:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D2A3C699;
	Mon, 13 Nov 2023 23:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtHllQV2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1682C3D963;
	Mon, 13 Nov 2023 23:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36E1C433B7;
	Mon, 13 Nov 2023 23:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699916665;
	bh=g9kp4dOAahcHHLMDbHOEBKbPO3MW2nPc6tdcUYzD1BI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UtHllQV2DEGG4gjGNxlYk2yAdeOzMS6DMXjzETa1STBlZqnbux9m9yudu3ah2pYrt
	 OJ1AFnPM0qGUjMYyDKrvpgrH7WLX8/wKWhhe+BVxN2HXJR5tqPwSmGqR7c9sFUW/OJ
	 lhdjjr818o7ZOb/KG4mQ6pjGRa963YO2Lbc4rgbThBZ2HA9/MWj1hHT7seM8tyxUFk
	 E+SbPnVy9049Q/SnxABVkRMnmZc1BedLE/P23kbvH6qOX0FBpeO3utCnzG/y+gkKL1
	 Hy4zo9qJRvikvoUs5cqXun7v3D/R1/QHy3oF0zMLkzB6PaVt6UhpP/LtvzHPRHmuWE
	 4KJOBr+ummFwg==
Received: by mercury (Postfix, from userid 1000)
	id 2DF41106323E; Tue, 14 Nov 2023 00:04:22 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/6] media: MAINTAINERS: Add GalaxyCore in camera sensor section
Date: Mon, 13 Nov 2023 23:57:22 +0100
Message-ID: <20231113230421.226808-4-sre@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113230421.226808-1-sre@kernel.org>
References: <20231113230421.226808-1-sre@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"gc" prefixed i2c media drivers are most likely GalaxyCore camera
sensor drivers, so add it to the list.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 97f51d5ec1cf..c41fcf10e356 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22792,6 +22792,7 @@ S:	Maintained
 F:	Documentation/driver-api/media/camera-sensor.rst
 F:	Documentation/driver-api/media/tx-rx.rst
 F:	drivers/media/i2c/ar*
+F:	drivers/media/i2c/gc*
 F:	drivers/media/i2c/hi*
 F:	drivers/media/i2c/imx*
 F:	drivers/media/i2c/mt*
-- 
2.42.0


