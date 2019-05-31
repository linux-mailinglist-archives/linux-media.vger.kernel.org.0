Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44EF730B3C
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 11:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbfEaJSr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 05:18:47 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:46958 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726002AbfEaJSr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 05:18:47 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4V97nqd018680;
        Fri, 31 May 2019 11:18:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=rz5GP3p1X72UWRAxSNm3DrASQ+E4MaPT9C6RQHCpmq0=;
 b=rvbek+Dq2ug8amgrE3UQvq+FhSycEB2bRCB8U9vs4DAkatMPUGr6eKLpSgp9rDmrw/v2
 ZXOf+CtoinI3KWqDKUQ+hpqVdz2b5sjivjjN50b+hboktcNsV8bg8uT9j786apCqsC5K
 2wMmOra0jHuYTEBGK2XNUFDUSvqLZUrxNcqyyXQGWG3mRac7D0Fpq8+m+66m8+UHMr9P
 SQvviH4fe/eIEjxCN9/myCtgtQ7JFMBRW3kDogi8oXZz+yeZRLBOcI+Sbdxu3mcOR73Z
 shBWFBRB/yXCf2Oe9s991wLAH5hM8FSrmb/OgCKBu+QwwX96q5GWWJCh8PmhmvN4pDk3 vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2spvkhk772-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Fri, 31 May 2019 11:18:31 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1D5C31;
        Fri, 31 May 2019 09:18:28 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A14272476;
        Fri, 31 May 2019 09:18:28 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 31 May
 2019 11:18:28 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 31 May 2019 11:18:28
 +0200
From:   Fabien Dessenne <fabien.dessenne@st.com>
To:     Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre Torgue" <alexandre.torgue@st.com>,
        Pavel Machek <pavel@denx.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Fabien Dessenne <fabien.dessenne@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH] media: stm32-dcmi: fix irq = 0 case
Date:   Fri, 31 May 2019 11:18:15 +0200
Message-ID: <1559294295-20573-1-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-31_05:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Manage the irq = 0 case, where we shall return an error.

Fixes: b5b5a27bee58 ("media: stm32-dcmi: return appropriate error codes during probe")
Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index b9dad0a..d855e9c 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -1702,7 +1702,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	if (irq <= 0) {
 		if (irq != -EPROBE_DEFER)
 			dev_err(&pdev->dev, "Could not get irq\n");
-		return irq;
+		return irq ? irq : -ENXIO;
 	}
 
 	dcmi->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
2.7.4

