Return-Path: <linux-media+bounces-311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 902887EA6A9
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 00:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C09A21C20506
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 23:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC073E46C;
	Mon, 13 Nov 2023 23:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnScn8PS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F25E3D98E;
	Mon, 13 Nov 2023 23:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7E3C433CD;
	Mon, 13 Nov 2023 23:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699916667;
	bh=/TpGTUwxaehUdu0Xa2c9g+Ihph9wNk+OMb8HMuH20Hs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mnScn8PSevZ1lI7KkR77gTZSq1qTSaJpD+zZjLYk6dKBz/Y1UKi/+JyS0R9JmS7GH
	 f21xPlXpmf2owJhZ9tz8QHDMS+e5om+ooU2rKIu+dWg//hkoNOIXBtriftIHR6rGH8
	 tVdZcdX/wl/FvxnpC+rOXnnRBR/LfSjMDO9LF0DYpq9ZQ1YiW88ZPrMRk/oi+syD+K
	 CvKzpeUZf5q2bS061G7QGftaGZJ4NK87uTBFTQGmXWFGDH5NSea6RfaiHoOvICpLRw
	 aRwESMBxDEhdX2lg4/EGD61t96ANUDsk+pyr3hi65Ep7LshPp20FGzJ+Grrz/WLrE8
	 XywJiBYCEwy8A==
Received: by mercury (Postfix, from userid 1000)
	id 279751060547; Tue, 14 Nov 2023 00:04:22 +0100 (CET)
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
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/6] dt-bindings: vendor-prefixes: add GalaxyCore
Date: Mon, 13 Nov 2023 23:57:20 +0100
Message-ID: <20231113230421.226808-2-sre@kernel.org>
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

From: Alain Volmat <alain.volmat@foss.st.com>

GalaxyCore Shanghai Limited Corporation (https://www.gcoreinc.com)
manufacturers CMOS Image Sensor and Display Driver IC.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 309b94c328c8..b3d751b42927 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -502,6 +502,8 @@ patternProperties:
     description: Fujitsu Ltd.
   "^fxtec,.*":
     description: FX Technology Ltd.
+  "^galaxycore,.*":
+    description: GalaxyCore Inc.
   "^gardena,.*":
     description: GARDENA GmbH
   "^gateway,.*":
-- 
2.42.0


