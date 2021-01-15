Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFFA2F7E4E
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 15:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732914AbhAOOd1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 09:33:27 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:39270 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726402AbhAOOd1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 09:33:27 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 10FEQieu012767;
        Fri, 15 Jan 2021 15:32:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : subject
 : date : message-id : mime-version : content-type; s=selector1;
 bh=20mI/yLvK9/ogh5zbaHOf1X4owesvcwj4/m6TdHC+ns=;
 b=l/sKPrBte54ACnoQtjd74G+H6JjxXKxBg+rR+IHTECOo9EXoJaw9x/9HzMRotGoclcEM
 oP8ZGGQiMuwDhJRgZPrYvuQd3MBtnv17ngExwi+1eq1jrzfNpl/Z6lLo3N0sYRrLVGio
 mNau1tNOixbVQYaRsR2hzJJEsT8JTySVXDvYMir54DQYfITFaQfbQyUNt1w9PnTX0WCw
 Bbta9u7TTwKnyF3zvo0EhnOj9jqORyoK9OUN1gIg3VhVbBZrTfn5Ws4fD5ktArkaEOwq
 vqxVot3T67OxwotBRBzA5wryU78gyOWdaXm9kDPAiP/F0osKi9kL1OcDSUW+ps3dDQ0R fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35y5m04yyh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Jan 2021 15:32:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2E6D710002A;
        Fri, 15 Jan 2021 15:32:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E58724974F;
        Fri, 15 Jan 2021 15:32:29 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Jan 2021 15:31:46
 +0100
From:   Yannick Fertre <yannick.fertre@foss.st.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Etienne Carriere <etienne.carriere@st.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Philippe Cornu <philippe.cornu@foss.st.com>
Subject: [PATCH] media: cec: add stm32 driver
Date:   Fri, 15 Jan 2021 15:31:44 +0100
Message-ID: <20210115143144.27468-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-15_08:2021-01-15,2021-01-15 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Missing stm32 directory to Makefile.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/media/cec/platform/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/cec/platform/Makefile b/drivers/media/cec/platform/Makefile
index 3a947159b25a..ea6f8ee8161c 100644
--- a/drivers/media/cec/platform/Makefile
+++ b/drivers/media/cec/platform/Makefile
@@ -10,5 +10,6 @@ obj-$(CONFIG_CEC_MESON_AO)	+= meson/
 obj-$(CONFIG_CEC_SAMSUNG_S5P)	+= s5p/
 obj-$(CONFIG_CEC_SECO)		+= seco/
 obj-$(CONFIG_CEC_STI)		+= sti/
+obj-$(CONFIG_CEC_STM32)		+= stm32/
 obj-$(CONFIG_CEC_TEGRA)		+= tegra/
 
-- 
2.17.1

