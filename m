Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A4C28633C
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 18:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbgJGQIm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 12:08:42 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:11194 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728177AbgJGQIl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Oct 2020 12:08:41 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 097FrQ8G004988;
        Wed, 7 Oct 2020 18:08:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=aZtohltui9FGlH6aAfSKwpgjGCik6ypAi07JSbtsLUs=;
 b=aDP3MLJJowXp1h5Fhd/NOnY6Oty/kl+iPJShXC2bjojTUOt6yBBWM1TnQWLj3PAoBhW0
 tAW29yxXk0cwB5N9UY993oq6N8o1tJgcw1AiYvjNSwttRa8bGNC9RzGhCO/Q075IwS12
 X1Igsedc/FcrNhl4Z4vvs6cL1//VYhqUQSnZaKF5TcPiAQiYO/a5We0CvKIR2l9vFtnW
 3ti/JYgrKM+EG10ud67kkTE/wuSAVUlrzumbz8sQaFRe52A6ZjKVnVSlOvU4gWW2Zozt
 5YKu0e3AEzVED0yymK133fRVMnAzKM2+dnxpBdhgrHUyuQmcx8J651qjPEK8d0BFo8H1 Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3402tjdubk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Oct 2020 18:08:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6AA2810002A;
        Wed,  7 Oct 2020 18:08:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5F29F2BA2C7;
        Wed,  7 Oct 2020 18:08:32 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct 2020 18:08:32
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alain Volmat <alain.volmat@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Hugues Fruchet <hugues.fruchet@st.com>
Subject: [PATCH] media: stm32-dcmi: add 8-bit Bayer formats support
Date:   Wed, 7 Oct 2020 18:08:25 +0200
Message-ID: <1602086905-9219-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-07_10:2020-10-06,2020-10-07 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Alain Volmat <alain.volmat@st.com>

Add BA81, GBRG, GRBG, RGGB formats in the list of
supported capture formats.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
Acked-by: Hugues FRUCHET <hugues.fruchet@st.com>
Reviewed-by: Philippe CORNU <philippe.cornu@st.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index fd1c41c..918b41d 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -1574,6 +1574,22 @@ static const struct dcmi_format dcmi_formats[] = {
 		.fourcc = V4L2_PIX_FMT_JPEG,
 		.mbus_code = MEDIA_BUS_FMT_JPEG_1X8,
 		.bpp = 1,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR8,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.bpp = 1,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG8,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.bpp = 1,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG8,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.bpp = 1,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB8,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.bpp = 1,
 	},
 };
 
-- 
2.7.4

