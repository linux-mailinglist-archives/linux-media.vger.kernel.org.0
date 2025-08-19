Return-Path: <linux-media+bounces-40298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 164B2B2C7E7
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 17:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DC717B7768
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314B9285CA6;
	Tue, 19 Aug 2025 14:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qIzZreWj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E6F27F19F;
	Tue, 19 Aug 2025 14:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615311; cv=none; b=VqrMdGRRk3lRAhEZIf7Z7lmgIuytima5kiTTWABETlpDwkXKrNf3iAwnjLwHLOtgOcY3VwK9NKH5g2ai24Jhqv0Qvfx6HM4opR42Zd3nSyseMVI+GDSSobMIt5JCEregQI5gPbLwvSWAfQ//jO6dCQVgmYrIYSAc9f4ARitQYvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615311; c=relaxed/simple;
	bh=iH2fNzQ3ZFHpzPlJuJdqflptF90hlToFOvzIGy7xjpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2amj+hYNITERau8rlNolaEHOjHyS15xTiZo3pZJMAUDYmN0AZjXPUVSkQELWgY+yX9u/B/NEjs449gjSX3TrhZSSpwmvn4s2g0lDBsZOvFxdCa7QsRC/E78lsxlkGH90CbPSo/agpxr0FVeJeJRjqwhS2lzmO0FdesXP3VFfP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qIzZreWj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.106] (mob-5-90-52-92.net.vodafone.it [5.90.52.92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 156FD2F8A;
	Tue, 19 Aug 2025 16:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755615250;
	bh=iH2fNzQ3ZFHpzPlJuJdqflptF90hlToFOvzIGy7xjpo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qIzZreWj1upqtNMA5gqVxqS0/JDbIE2EUrjY5Oe8RU/npsWqm1kYciR7qXcRq3Z9n
	 qbK4fhp/gWwo21lhKk9cKMwL2/nedmbZXbx0bYm9XDZqpt8aUTKEnoKAgCnUZm3Mu9
	 tAYLO7J0Wsce1FHHskSWy/QOTyAuRms/wgZ7cBHc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 19 Aug 2025 16:54:49 +0200
Subject: [PATCH v3 8/8] media: Documentation: kapi: Add v4l2 extensible
 parameters
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-extensible-parameters-validation-v3-8-9dc008348b30@ideasonboard.com>
References: <20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com>
In-Reply-To: <20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=iH2fNzQ3ZFHpzPlJuJdqflptF90hlToFOvzIGy7xjpo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBopJA7HthrV9FPEEFq/WvUsDHkN4su5F2GbYayv
 j9u4Yj779WJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKSQOwAKCRByNAaPFqFW
 PIuRD/487NVywsuiC6cSTeBHNzqeEUPM+lYOX8MgCgjtfucq2L3g15QL1HJgXiRneteFi5eU2Sm
 A0lquhYAxjdMy544gjfSGXbzc2piZWmMzl47uOmHwJh8skaHGlw+Uh73b+IdA0u9FVxSC4sSW2o
 XTRdwaSYpCRMlTTmuGsF/HTh1MfbYo8+3Pu546pv5Rds2aXhREnl4NZMkHuYcwTso1x/JsqUaZs
 5mz9PnaJZrGrZ/8wY9tvGE+4/A1mj/PPAgk470q7s7LwcxLwPWazePCJ3SIHM8l18Z1UMD+ZiKM
 6WOdHuLt9x87UKKoINV8KWRipsoKnmlz12Z0IXrbmhdtnMTQ8EtkxUsAkAsYbXPjcFA2YVJ1CfN
 SsQg7p6I76QR0b6flmy6KYMtKoenrTt0789k+pP3isypXSgsntrLH5flFDQyxOCwM4MDRUne1vX
 maMdoawEPlPSZrcELgVChZIMjW1rBVWoglGnvSYwqaAscMYMA/p3sLDsgaDoEmQ89QQjJ9EqVLX
 WBmxhx/Fqr7dX279CKu9Tp2eYsWjnfos9WxZd5ZtrwP5knMM85fmih0TZ0r485cRR42ko6a1WsT
 3s1ToeCvR+6TduLerJCCMwhPta68UsCqtZnHC9uYnUOH2X8E99zKBrSe+uRTbo19443GK8/Tc+E
 2gh5gh/Ri4Rn/1A==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add to the driver-api documentation the v4l2-params.h types and
helpers documentation.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/driver-api/media/v4l2-core.rst   | 1 +
 Documentation/driver-api/media/v4l2-params.rst | 5 +++++
 MAINTAINERS                                    | 1 +
 3 files changed, 7 insertions(+)

diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
index ad987c34ad2a8460bb95e97adc4d850d624e0b81..2d7793298c6a2046bdd59b185a411e092b659d52 100644
--- a/Documentation/driver-api/media/v4l2-core.rst
+++ b/Documentation/driver-api/media/v4l2-core.rst
@@ -27,3 +27,4 @@ Video4Linux devices
     v4l2-common
     v4l2-tveeprom
     v4l2-jpeg
+    v4l2-params
diff --git a/Documentation/driver-api/media/v4l2-params.rst b/Documentation/driver-api/media/v4l2-params.rst
new file mode 100644
index 0000000000000000000000000000000000000000..8d2a5f004d21dfc3a81255cabbc6b7cce588db71
--- /dev/null
+++ b/Documentation/driver-api/media/v4l2-params.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+V4L2 extensible parameters kAPI
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+.. kernel-doc:: include/media/v4l2-params.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 008f984c0769691f6ddec8d8f0f461fde056ddb3..44598a823f084e98a9b2d2e21881665d1ab64908 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26384,6 +26384,7 @@ V4L2 EXTENSIBLE PARAMETERS FORMAT
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/driver-api/media/v4l2-params.rst
 F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
 F:	drivers/media/v4l2-core/v4l2-params.c
 F:	include/media/v4l2-params.h

-- 
2.50.1


