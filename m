Return-Path: <linux-media+bounces-37864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A453CB07487
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 13:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7F4E507E0C
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 11:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70392F49E9;
	Wed, 16 Jul 2025 11:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oWVUYlvO"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE11B2F3629;
	Wed, 16 Jul 2025 11:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752664838; cv=none; b=tofVvQh3lP2duqLW4Lp8nlBJBGCIzo/fpnismBLY3BBILMs1aYx5q1aJMAf00BT9ZnFWMQwAG8KndPiv5lotRiCkFanxyQTnWbUBnMl9rvM68Lsy8xjSnOdPFdoKpK+E1VgPqd4Nr8uxrjxRqJtQ0fA2RsuXp3R/Esn5VuAdvkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752664838; c=relaxed/simple;
	bh=Ya69yMoQgUDEZlc4ZpjftE6s3RP1FVmVxDDcRp1wGfQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GMylJyF4Y1nxP0C6KjtSAqTlM0y8d+hVwiSnDdSBkqzZ4nDH14w38dM/Vhd/wxMErOfXhquaxZkw0xrAX+79qJpBwL09EcZU9/ZzMyMtI2b7kYD1k4TdxnYdF3daEGnblqO61lQWcV8VlW1heR/ViSO1Uu7x9PlI7FC9aB/3fow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oWVUYlvO; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56GBJwDo2491029;
	Wed, 16 Jul 2025 06:19:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752664798;
	bh=kxBgsRHLe2JLhXvC8qfuzqvvFxyHAUTzqjhu1n3cZA8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oWVUYlvOwyoTTQGGYrTBib5lM0Wcye5iQfq3n0NI6wB6X54Ton9ggrR7A+l8F5xRX
	 +rzFBOen79ZcGYl8vsS8eefZZzyDepIdNFRfvGjVu2X+B9dhBG8qMdnkCWXm7S5x/r
	 HYIvWLwZju7zeEX51uAXZ5aHS9xoFyJdSFQstPf8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56GBJwjP1343275
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 16 Jul 2025 06:19:58 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 06:19:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 06:19:57 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56GBJep1344714;
	Wed, 16 Jul 2025 06:19:50 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux@armlinux.org.uk>, <ardb@kernel.org>, <ebiggers@kernel.org>,
        <geert+renesas@glider.be>, <claudiu.beznea@tuxon.dev>,
        <bparrot@ti.com>, <andre.draszik@linaro.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <heikki.krogerus@linux.intel.com>, <kory.maincent@bootlin.com>,
        <florian.fainelli@broadcom.com>, <lumag@kernel.org>,
        <dale@farnsworth.org>, <sbellary@baylibre.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <dagriego@biglakesoftware.com>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V2 1/4] MAINTAINERS: Update maintainers of TI VPE and CAL
Date: Wed, 16 Jul 2025 16:49:09 +0530
Message-ID: <20250716111912.235157-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716111912.235157-1-y-abhilashchandra@ti.com>
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Benoit has moved to work in other technical areas, and Yemike Abhilash will
maintain these modules instead of him.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7b6b13c01ba7..ea4b29c8b6b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25205,7 +25205,7 @@ S:	Maintained
 F:	sound/soc/codecs/twl4030*
 
 TI VPE/CAL DRIVERS
-M:	Benoit Parrot <bparrot@ti.com>
+M:	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	http://linuxtv.org/
-- 
2.34.1


