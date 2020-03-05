Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEF017A1C1
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2020 09:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgCEI4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Mar 2020 03:56:33 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:54042 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725816AbgCEI4d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Mar 2020 03:56:33 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0258r7g1025055;
        Thu, 5 Mar 2020 03:56:30 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 2yfnrasp52-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Mar 2020 03:56:29 -0500
Received: from SCSQMBX11.ad.analog.com (scsqmbx11.ad.analog.com [10.77.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 0258uSha065141
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Thu, 5 Mar 2020 03:56:28 -0500
Received: from SCSQMBX11.ad.analog.com (10.77.17.10) by
 SCSQMBX11.ad.analog.com (10.77.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 5 Mar 2020 00:56:27 -0800
Received: from zeus.spd.analog.com (10.64.82.11) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Thu, 5 Mar 2020 00:56:26 -0800
Received: from ben-Latitude-E6540.ad.analog.com ([10.48.65.231])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0258uNUb021067;
        Thu, 5 Mar 2020 03:56:23 -0500
From:   Beniamin Bia <beniamin.bia@analog.com>
To:     <linux-media@vger.kernel.org>
CC:     <hverkuil-cisco@xs4all.nl>, <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <dragos.bogdan@analog.com>,
        <biabeniamin@outlook.com>, <alexandru.ardelean@analog.com>,
        Beniamin Bia <beniamin.bia@analog.com>
Subject: [PATCH] media: adv7604: Add new predefined video timings for adv76xx
Date:   Thu, 5 Mar 2020 10:59:08 +0200
Message-ID: <20200305085908.26267-1-beniamin.bia@analog.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-05_02:2020-03-04,2020-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=729 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1011 spamscore=0 phishscore=0 mlxscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050056
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds more predefined video timings for adv76xx family.

Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
Signed-off-by: Dragos Bogdan <dragos.bogdan@analog.com>
---
 drivers/media/i2c/adv7604.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 2dedd6ebb236..bf16c7a626a9 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -280,6 +280,8 @@ static const struct adv76xx_video_standards adv7604_prim_mode_gr[] = {
 static const struct adv76xx_video_standards adv76xx_prim_mode_hdmi_comp[] = {
 	{ V4L2_DV_BT_CEA_720X480P59_94, 0x0a, 0x00 },
 	{ V4L2_DV_BT_CEA_720X576P50, 0x0b, 0x00 },
+	{ V4L2_DV_BT_CEA_1280X720P25, 0x13, 0x03 },
+	{ V4L2_DV_BT_CEA_1280X720P24, 0x13, 0x04 },
 	{ V4L2_DV_BT_CEA_1280X720P50, 0x13, 0x01 },
 	{ V4L2_DV_BT_CEA_1280X720P60, 0x13, 0x00 },
 	{ V4L2_DV_BT_CEA_1920X1080P24, 0x1e, 0x04 },
@@ -305,8 +307,17 @@ static const struct adv76xx_video_standards adv76xx_prim_mode_hdmi_gr[] = {
 	{ V4L2_DV_BT_DMT_1024X768P70, 0x0d, 0x00 },
 	{ V4L2_DV_BT_DMT_1024X768P75, 0x0e, 0x00 },
 	{ V4L2_DV_BT_DMT_1024X768P85, 0x0f, 0x00 },
+	{ V4L2_DV_BT_DMT_1280X768P60, 0x10, 0x00 },
+	{ V4L2_DV_BT_DMT_1280X768P60_RB, 0x11, 0x00 },
 	{ V4L2_DV_BT_DMT_1280X1024P60, 0x05, 0x00 },
 	{ V4L2_DV_BT_DMT_1280X1024P75, 0x06, 0x00 },
+	{ V4L2_DV_BT_DMT_1360X768P60, 0x12, 0x00 },
+	{ V4L2_DV_BT_DMT_1366X768P60, 0x13, 0x00 },
+	{ V4L2_DV_BT_DMT_1400X1050P60, 0x14, 0x00 },
+	{ V4L2_DV_BT_DMT_1400X1050P75, 0x15, 0x00 },
+	{ V4L2_DV_BT_DMT_1600X1200P60, 0x16, 0x00 },
+	{ V4L2_DV_BT_DMT_1680X1050P60, 0x18, 0x00 },
+	{ V4L2_DV_BT_DMT_1920X1200P60_RB, 0x19, 0x00 },
 	{ },
 };
 
-- 
2.17.1

