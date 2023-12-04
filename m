Return-Path: <linux-media+bounces-1618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBE3803C8E
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 19:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E870C1F210A7
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 18:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CD52EB0A;
	Mon,  4 Dec 2023 18:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QshCyor3"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ECADB4;
	Mon,  4 Dec 2023 10:15:19 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B4IF7Fw078483;
	Mon, 4 Dec 2023 12:15:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701713707;
	bh=J5RyFsGBBJGAEE/pFlDmrTVYO8SDWWX9P/I5eq1Drkk=;
	h=From:To:CC:Subject:Date;
	b=QshCyor32NxB64bv3luuB3B8NZHOlSQhkQR3YW36XkZA45Bvyiqe/RhbKA7NXVgO8
	 C7fR+xyudbHKSgeC+9yIEx3FtCt4pQRk8yGME1CPRueSSDCvyIANOAxTr/e9M8DU0w
	 T3w0PbUC2hzauezgAxRXynB07eAg80q1buLYzR2c=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B4IF7uM078622
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Dec 2023 12:15:07 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Dec 2023 12:15:07 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Dec 2023 12:15:07 -0600
Received: from udba0500997.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B4IF6ab035354;
	Mon, 4 Dec 2023 12:15:06 -0600
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
Subject: [PATCH 0/2] Update Wave521c Compatible for TI Devices
Date: Mon, 4 Dec 2023 12:14:50 -0600
Message-ID: <20231204181452.1258419-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hello All, 

There has been ongoing discussion[1] surrounding the issue
of having K3 prefix included in the compatible for dt bindings.
This series removes this prefix from both the device tree
binding as well as the driver.

[1] https://lore.kernel.org/all/20231201063309.tingjc3cjhsqb6r7@confusing/ 

Brandon Brnich (2):
  dt-bindings: media: Remove K3 Family Prefix from Compatible
  media: chips-media: wave5: Remove K3 References

 Documentation/devicetree/bindings/media/cnm,wave521c.yaml | 2 +-
 drivers/media/platform/chips-media/wave5/wave5-vpu.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1


