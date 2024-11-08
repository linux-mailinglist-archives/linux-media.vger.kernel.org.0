Return-Path: <linux-media+bounces-21135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E39279C194E
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CE11B25348
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7AC1E8844;
	Fri,  8 Nov 2024 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I38L+ZOK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A270E1E7C18;
	Fri,  8 Nov 2024 09:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058536; cv=none; b=IlQ041JTCAE8VQGwG8vNPl0QVdLDED/Fwpek7JlE5WaaPuoSxdIEWNK6OW5JoGDa6Twlop+2dWLgKAdrUZlnJV5W+75+uNf34b1Dk7SxAP1uOU30ej/aqQaBr6dMs0baj6YZVHZAim3J2h/dIYWp6SHb6Hke3nOput9IjbyCPKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058536; c=relaxed/simple;
	bh=heR8KYwFA0qbODgROfqUDYupEapASDH6h0/td17hWK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=un3Dys9LS156l4+P2bzbyRsDPhIDRxrKSqT7nX8YzYgRtspCctQvDTDyuLqpTbUfI9dib6h+dWVnby1pyJSITjYgbBf1MD4WPTOpjDJ3Q1darftGH/J3vXd1kIxmC1UUEnThC4Jg2z1iZTXxOdAoKEkueZxE0O4NSRbPO09MBfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I38L+ZOK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9B7FA30;
	Fri,  8 Nov 2024 10:35:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731058512;
	bh=heR8KYwFA0qbODgROfqUDYupEapASDH6h0/td17hWK0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I38L+ZOK2KWqUO8k5gcaOS4JNQD01U4wR15XJAZVHhFA0tuXlo86POxYb5Ftgpmgb
	 x7sb7Nj8/K6LuCg8U1Lc8TG2aOa6bcsEvg5CFUylh+v3Zc06FbQ1JAwPYf3vf5mZt1
	 ZJr+xJdPcz5KgvuIQmCDwouFk64y/3oKRxM7suKA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 08 Nov 2024 11:34:54 +0200
Subject: [PATCH v2 10/15] media: i2c: ds90ub960: Drop unused indirect block
 define
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-ub9xx-fixes-v2-10-c7db3b2ad89f@ideasonboard.com>
References: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
In-Reply-To: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=heR8KYwFA0qbODgROfqUDYupEapASDH6h0/td17hWK0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnLdtQyaTOeOWPj4ux8RGsnP6uZ7JYMRdIEg6Bs
 vtrbvyMh3KJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZy3bUAAKCRD6PaqMvJYe
 9VpgD/9ulqk3a9gB7HTG6ZKXW9mqZ8Ii3uwHGXkHobNG8wW97ytIUXIgREN9RgiB8jLSKC9mieO
 H8d918X2uLDzMpmXdOjyFe5k55BOb2l9snKJSeGAe8j+La321KMp/2D94K8jod3masj3NgJfG9G
 osL1qEaOKQ7NMzyR9QdaBktVPuCjD85TTxgE5AvlJSd3kMVMO1lHBbdgQvttzTCLtcYddas55dC
 1xUd/4ev96ORrc1TN8C6XG1JF7qBGHTFJh5OpvU+ug2ERVIfGHFUYkMjkqV3WfZopFu6J0KVHkT
 ftcDe0pgOtmsqwnRuM9o0Ewhm3LUuaeO8TWtor2LzrGwTBwzkOBllzBvdAKbr3DTOVrpNOOj4AX
 tNFO/BG5s8JoHoaIwjWX7Hc2+9/J96va0fuONQdLZOItSDMvP4EJtpY09GTyDeKLeoby7V8dncw
 5gdiGJXgCTs5TzDvDqnTubYkCCEVBUzPHKH5FY7pNNJbOzK22pJL6j2YH+8n9M4GJPeVCYmYQam
 0F8JdL9XbaOwzao3yy+CSbZiNLaWJkFBfR89wtOnZ5aQJWIT/+FfHx+iMZIrXF22olnRv8ut5db
 Bpbm7iBqxg6pJa52u9e0FrH1ef4HJVAS7ZQDTARsaRB7XI0VgIKQkIXqnSWmqKEId7mMh7c4MHL
 A+SJHj82UlzZZ5A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Drop the unused UB960_IND_TARGET_CSI_CSIPLL_REG_1 define. It does not
even match to any block in the more recent documents, so it's possible
it is not only unused but also wrong.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index c2035cabf579..a4a624816d8b 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -367,7 +367,6 @@
 /* Indirect register blocks */
 #define UB960_IND_TARGET_PAT_GEN		0x00
 #define UB960_IND_TARGET_RX_ANA(n)		(0x01 + (n))
-#define UB960_IND_TARGET_CSI_CSIPLL_REG_1	0x92	/* UB9702 */
 #define UB960_IND_TARGET_CSI_ANA		0x07
 
 /* UB960_IR_PGEN_*: Indirect Registers for Test Pattern Generator */

-- 
2.43.0


