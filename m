Return-Path: <linux-media+bounces-29981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AE7A84D8F
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 21:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC4054C45F3
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 19:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA74A290BBA;
	Thu, 10 Apr 2025 19:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u/uboG6x"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA271F12FB;
	Thu, 10 Apr 2025 19:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314798; cv=none; b=TPjuDaCKhtIiDFqtCtx+BA3RduiQBbduGyD2hy8roV9Sev3bqCllcu+ez4d3Vq8/J9zCQvl3SndtteS/vH0HS3lNAlqszqFmXNg+UCYa0cVeaQXaRdWZHub09vCWIPm/2W2TGykt67tvw3+KO0rWI5nLoiKTaRPDhRyUshnyVoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314798; c=relaxed/simple;
	bh=klsiRpsxrYY/kBTOjn+5UjZZmFb6SIsSv71rVIh72RQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HAQ2SkBjXLnx1j36z/24rW77Xg9GGtLym1CcBWiagGLSsudAAcblFC+qg6jMEVppfqRca6tTFeQ/53ZoEHsAgNOry8xx2E5gsE0P+25ohkAPmMKMpNA8DWth1wqFFxY1gUqY0IogRRFk7LEtE5kUiFnb9aLhUUcwAx59E2D8G/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u/uboG6x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 586A2C4CEE7;
	Thu, 10 Apr 2025 19:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744314797;
	bh=klsiRpsxrYY/kBTOjn+5UjZZmFb6SIsSv71rVIh72RQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u/uboG6xLdtfABb0z35BUI9QrAyRtInAMMcU0wucAxlkCqGSgTKSe69p7jk+ojJD9
	 ioz86mFAq6jrH/clQwUutDFVWy9824TYHAi04b+NEyKG1T8RHSxbpi3ftbsUiQC/8u
	 rMq8U+iHmcHQOxHzPzvnGS6Onmoa+nVSu7roZOw1IFdxT6GMM5UIatmm5pRfCrCT9L
	 img7pohC57f/BlMqtcORgw4IZvJeS695YT39t2NE/qR9B/rUcH9aS8kM7GapY5vS7k
	 C4o7y5ICA5DuZgRl9bxCtkceZzWE80NBvW4KgI2+laBBNxXlTqTRi5xP6y42n7uUGm
	 BKBhir20oJPrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EA9C369A9;
	Thu, 10 Apr 2025 19:53:17 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Thu, 10 Apr 2025 21:41:30 +0200
Subject: [PATCH 1/3] MAINTAINERS: add exclude for dt-bindings to imx entry
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-maintainer-mriesch-v1-1-cdc5c6c68238@collabora.com>
References: <20250410-maintainer-mriesch-v1-0-cdc5c6c68238@collabora.com>
In-Reply-To: <20250410-maintainer-mriesch-v1-0-cdc5c6c68238@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Collabora Kernel Team <kernel@collabora.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744314121; l=1038;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=X1CVfLOeLPqWSee4KPG6jhbZlQYBoSFynMcMXTp5Z9o=;
 b=Zh/AQQfAuatrmJO0rGGXk/rTSqdO5Z4z+h9vttZOMHXxS93ra3H+h6dDtc4iWNBL9La9/+5i6
 kFrTAb9AP5FDFZ3PKwUkXvRkyklkaZvzcbXHu9TXUs3fBzzZGADR6IC
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

Since the IMX (as in i.MX, the NXP SoCs) MAINTAINERS entry claims
everything that contains the name "imx", hanges to device tree
bindings for any Sony IMX image sensor are likely to be sent to the
maintainers listed therein. Add the missing exclude to fix that.

Fixes: da8b7f0fb02b ("MAINTAINERS: add all files matching "imx" and "mxs" to the IMX entry")
Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..c87b26eada7b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2519,6 +2519,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
 F:	arch/arm/boot/dts/nxp/imx/
 F:	arch/arm/boot/dts/nxp/mxs/
 F:	arch/arm64/boot/dts/freescale/
+X:	Documentation/devicetree/bindings/media/i2c/
 X:	arch/arm64/boot/dts/freescale/fsl-*
 X:	arch/arm64/boot/dts/freescale/qoriq-*
 X:	drivers/media/i2c/

-- 
2.39.5



