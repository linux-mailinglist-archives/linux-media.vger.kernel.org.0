Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73257CC086
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 18:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731315AbfJDQ2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 12:28:09 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35310 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731287AbfJDQ2I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 12:28:08 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94GS7f3008126;
        Fri, 4 Oct 2019 11:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570206487;
        bh=4b3B5a5oc4XXjmr0bMQla53asdaAKBggEzeGeja5WMw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=KbX3jyDA9QDRRrnv5oYJSSjRpBryxsoSEWo73PCjNo9p08IFBEIElcacrcCxHwy2l
         1addOl++CtBhhTU5BBiEkrSO2eqrIXpBHOklMrKFaMTsoeI/odm7M/aG5ZgzIzTzL+
         p9Dqqad81uJ/4xBSaFIO/t/Ihuss2oje68vZ+8Ow=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94GS7EL051016
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Oct 2019 11:28:07 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 11:28:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 11:28:06 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94GRgAK028904;
        Fri, 4 Oct 2019 11:28:07 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 18/21] media: ti-vpe: csc: rgb-to-yuv HD full range coeff are wrong
Date:   Fri, 4 Oct 2019 11:29:49 -0500
Message-ID: <20191004162952.4963-19-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004162952.4963-1-bparrot@ti.com>
References: <20191004162952.4963-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RGB to YUV HD full range coefficients did not match the TRM values
and appeared to be a cut-n-paste from the YUV to RGB section.

Replace the entries with the values from the TRM.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/csc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/csc.c b/drivers/media/platform/ti-vpe/csc.c
index eda2a5985da7..f0c45d187b5f 100644
--- a/drivers/media/platform/ti-vpe/csc.c
+++ b/drivers/media/platform/ti-vpe/csc.c
@@ -81,8 +81,8 @@ static struct colorspace_coeffs colorspace_coeffs[4] = {
 		},
 		{
 			/* HDTV */
-			0x04A8, 0x0000, 0x072C, 0x04A8, 0x1F26, 0x1DDE,
-			0x04A8, 0x0873, 0x0000, 0x0C20, 0x0134, 0x0B7C,
+			0x00bb, 0x0275, 0x003f, 0x1f99, 0x1ea5, 0x01c2,
+			0x01c2, 0x1e67, 0x1fd7, 0x0040, 0x0200, 0x0200,
 		},
 	},
 };
-- 
2.17.1

