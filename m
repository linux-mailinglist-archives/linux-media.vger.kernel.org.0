Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC4A8143AD6
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 11:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729406AbgAUKXI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 05:23:08 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:26448 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727220AbgAUKXI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 05:23:08 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00LAI5KS023923;
        Tue, 21 Jan 2020 11:22:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=uU66AWwrrnwTiw+9Nz6p8yTErkFbXxjMVakld76eCaU=;
 b=ifdQ74tWi+8zC2yp06a1zXl/PCGyzzeGxVAE8Nq7gnKObCqk7fc1T2/V1fo0iMYG486/
 tk9AwuGdAEa4r1KEB0ImcoELiPPrDTPPJp5vr8MpvIEwwDF//cyBFlPrFiPYwkziz9vd
 UF54khdkZ+NkfI+7jsfFK4iHieyyoaaB7ad/iWlQuI7aeIzdTRzmGHomDhYVMd+DNDWT
 s6mjLfqhIsdGLqoSGu1CTz9VXqCyCCYQTk7sKk7Qe4OQjMfLHtPnyAEQvotCcgaR4xq2
 ndlafA57DNH1YYpZGRuGf0VgdQ8GfQ/rwhaBBhS6CYYrh8mF2xbioFJeFHLSzyu7pqtr ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xkrp2634v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jan 2020 11:22:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E33D910002A;
        Tue, 21 Jan 2020 11:22:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7D222B187E;
        Tue, 21 Jan 2020 11:22:51 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Jan 2020 11:22:51
 +0100
From:   Yannick Fertre <yannick.fertre@st.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Etienne Carriere <etienne.carriere@st.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Philippe Cornu <philippe.cornu@st.com>
Subject: [PATCH] media: platform: stm32: don't print an error on probe deferral
Date:   Tue, 21 Jan 2020 11:22:49 +0100
Message-ID: <1579602169-7484-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-21_02:2020-01-21,2020-01-21 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Etienne Carriere <etienne.carriere@st.com>

Change stm32-cec driver to not print an error message when the
device probe operation is deferred.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
---
 drivers/media/platform/stm32/stm32-cec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/stm32/stm32-cec.c b/drivers/media/platform/stm32/stm32-cec.c
index 8a86b2c..9c137f1 100644
--- a/drivers/media/platform/stm32/stm32-cec.c
+++ b/drivers/media/platform/stm32/stm32-cec.c
@@ -291,7 +291,9 @@ static int stm32_cec_probe(struct platform_device *pdev)
 
 	cec->clk_cec = devm_clk_get(&pdev->dev, "cec");
 	if (IS_ERR(cec->clk_cec)) {
-		dev_err(&pdev->dev, "Cannot get cec clock\n");
+		if (PTR_ERR(cec->clk_cec) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Cannot get cec clock\n");
+
 		return PTR_ERR(cec->clk_cec);
 	}
 
-- 
2.7.4

