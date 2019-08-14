Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD228D557
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 15:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbfHNNtS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 09:49:18 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:50694 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726575AbfHNNtO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 09:49:14 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7EDkcHo006975;
        Wed, 14 Aug 2019 15:49:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=slMLXdPQoz50nbYXXEAIS+qRi2WwHJGTB8Kau2ylpuA=;
 b=sKoioVNIJcFY7eIQaZMla6zyN/Zfw4zwH23x5OhAJLLmz4TkrEV/AeaUT+VVHVGKET/I
 1JD+/GcQULhZCrbqSpXHrSAT/FXjRYrUiiv2Xx2DMdl+z2c0wQd9kFI6lH3VYcoEFyiy
 HCxeaWvwyfX/DYGT3IPysatJXu6Tfhuckl/tkOKSTHBKcY/w/KzmWPIN/8dHDFBxX0Qr
 z9XG6oI05OMcxPkiFpheeCbkhtRPgej1ZoF+WZSa1c5D8IepmfAhvbBemDg3qdkLQhqH
 YDCMJRjuxMPYvgf1HzgPJwb/kTZpIziFLEQ4DxB9crEhjym8TvwALrf3mqHE5hX6L1jN fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2ub679ue8m-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 14 Aug 2019 15:48:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 69A2434;
        Wed, 14 Aug 2019 13:48:59 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A90F2FFE88;
        Wed, 14 Aug 2019 15:48:59 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 14 Aug
 2019 15:48:59 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 14 Aug 2019 15:48:58
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        "Hugues Fruchet" <hugues.fruchet@st.com>,
        Mickael GUENE <mickael.guene@st.com>
Subject: [PATCH v6 2/4] media: stm32-dcmi: trace the supported fourcc/mbus_code
Date:   Wed, 14 Aug 2019 15:48:51 +0200
Message-ID: <1565790533-10043-3-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565790533-10043-1-git-send-email-hugues.fruchet@st.com>
References: <1565790533-10043-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.19]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-14_05:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a trace of the set of supported fourcc/mbus_code which
intersect between DCMI and source sub-device.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index b462f71..18acecf 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -1447,12 +1447,20 @@ static int dcmi_formats_init(struct stm32_dcmi *dcmi)
 			/* Code supported, have we got this fourcc yet? */
 			for (j = 0; j < num_fmts; j++)
 				if (sd_fmts[j]->fourcc ==
-						dcmi_formats[i].fourcc)
+						dcmi_formats[i].fourcc) {
 					/* Already available */
+					dev_dbg(dcmi->dev, "Skipping fourcc/code: %4.4s/0x%x\n",
+						(char *)&sd_fmts[j]->fourcc,
+						mbus_code.code);
 					break;
-			if (j == num_fmts)
+				}
+			if (j == num_fmts) {
 				/* New */
 				sd_fmts[num_fmts++] = dcmi_formats + i;
+				dev_dbg(dcmi->dev, "Supported fourcc/code: %4.4s/0x%x\n",
+					(char *)&sd_fmts[num_fmts - 1]->fourcc,
+					sd_fmts[num_fmts - 1]->mbus_code);
+			}
 		}
 		mbus_code.index++;
 	}
-- 
2.7.4

