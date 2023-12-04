Return-Path: <linux-media+bounces-1619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0A2803C90
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 19:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED543281151
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 18:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F542F841;
	Mon,  4 Dec 2023 18:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MqpZuS1G"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B9B2FF;
	Mon,  4 Dec 2023 10:15:22 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B4IFBbP031331;
	Mon, 4 Dec 2023 12:15:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701713711;
	bh=ky632JItAjYRjDnRFjZUIuc/NYHp4SSuHv5eDViF4cQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MqpZuS1GBynjyg2SDqYuu9YKJu6+Qt3lnAmBN+4dGzVDQG+UzAy/ATY+2iySZprPY
	 ij5THq1qnmzTwbkb56+Hqhg+LlsKLVy9DOdf2goL0Qzks6OV+pOTdURMw+lMek0OOq
	 TQ5QI9fijJEPZ3cORJwrauGTVr0PBZQ3OZOXNSs8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B4IFBtm078719
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Dec 2023 12:15:11 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Dec 2023 12:15:11 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Dec 2023 12:15:11 -0600
Received: from udba0500997.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B4IF6ad035354;
	Mon, 4 Dec 2023 12:15:11 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Nas Chung <nas.chung@chipsnmedia.com>
CC: Nishanth Menon <nm@ti.com>, Darren Etheridge <detheridge@ti.com>,
        Brandon
 Brnich <b-brnich@ti.com>
Subject: [PATCH 2/2] media: chips-media: wave5: Remove K3 References
Date: Mon, 4 Dec 2023 12:14:52 -0600
Message-ID: <20231204181452.1258419-3-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204181452.1258419-1-b-brnich@ti.com>
References: <20231204181452.1258419-1-b-brnich@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Change compatible string to match dt bindings for
TI devices with Wave521c. 

K3 family prefix should not be included
as it deviates from naming convention.

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdUYOq=q1j=d+Eac28hthOUAaNUkuvxmRu-mUN1pLKq69g@mail.gmail.com/
Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index bfe4caa79cc9..0d90b5820bef 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -272,7 +272,7 @@ static const struct wave5_match_data ti_wave521c_data = {
 };
 
 static const struct of_device_id wave5_dt_ids[] = {
-	{ .compatible = "ti,k3-j721s2-wave521c", .data = &ti_wave521c_data },
+	{ .compatible = "ti,j721s2-wave521c", .data = &ti_wave521c_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, wave5_dt_ids);
-- 
2.34.1


