Return-Path: <linux-media+bounces-2039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8F080B243
	for <lists+linux-media@lfdr.de>; Sat,  9 Dec 2023 06:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00C12281156
	for <lists+linux-media@lfdr.de>; Sat,  9 Dec 2023 05:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9AC1C37;
	Sat,  9 Dec 2023 05:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EesK6SYL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B69A17EA;
	Sat,  9 Dec 2023 05:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B29DC433C8;
	Sat,  9 Dec 2023 05:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702101372;
	bh=6PYTXwogHAUVenupi8BZQBLtsE/8OEo/sEyy3ePyUvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EesK6SYL3ARV9NdcmtjJmYCY8lpowh/xM4QqyisjpN/JEC5J6L7rbZ4lYJde3f99L
	 h8x8hH0/D7aAf3bQtjYme8AlX38C5JEKvKGsWLc+ZYzjHm6b+cwH3FR+tPb5hbfMwz
	 lfcHhJRgCigzA81/UESmt20S1ZO990eCbEcMBnLm1lW6tIRE6gSf0Qjofhmx4Xutzj
	 tecV8eQOEBx/xBdejghRM9U2PLQzSj2wJKfmEtIIaw1phXYY5hJyQQGzEz+leDLyJf
	 ssElXwPshHKfFkdGCg5NbZ1w/rZ4JspqlYliQ7VjdNqKxpZfbSMu84bP0nNk+hf5yw
	 8Vhy6Lxo9UxIQ==
Received: by mercury (Postfix, from userid 1000)
	id A4346106CC75; Sat,  9 Dec 2023 00:19:49 +0100 (CET)
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
Subject: [PATCH v5 2/3] media: MAINTAINERS: Add GalaxyCore in camera sensor section
Date: Sat,  9 Dec 2023 00:18:18 +0100
Message-ID: <20231208231933.284277-3-sre@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208231933.284277-1-sre@kernel.org>
References: <20231208231933.284277-1-sre@kernel.org>
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
index b6c4c8e037bf..142225181316 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22833,6 +22833,7 @@ S:	Maintained
 F:	Documentation/driver-api/media/camera-sensor.rst
 F:	Documentation/driver-api/media/tx-rx.rst
 F:	drivers/media/i2c/ar*
+F:	drivers/media/i2c/gc*
 F:	drivers/media/i2c/hi*
 F:	drivers/media/i2c/imx*
 F:	drivers/media/i2c/mt*
-- 
2.42.0


