Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5A4DC3E5
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 13:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437826AbfJRLV5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 07:21:57 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:12746 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728497AbfJRLV5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 07:21:57 -0400
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9IBHUQe031635;
        Fri, 18 Oct 2019 07:21:55 -0400
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2055.outbound.protection.outlook.com [104.47.36.55])
        by mx0a-00128a01.pphosted.com with ESMTP id 2vk8pb2f1w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Oct 2019 07:21:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vp5Qi4KIG+8XfZCIRxRpMYhtKbOs0sM0ZkT/MQwZf4X4WJtnkMIHWHkD7F/7/TaBjHeEWtBu8sbMkj2vxFd0Yzh+RQ+eukaTiKcILgoBolF3BGK+sR9b0HTTUJRBdaVknvrx0G8OnWA7gpcykleUW3l13Qqvh7IxbH9APSDKJIcaStf+JJIhoyn4Lg6+BkU22KjHKtorAJ7chPg5BXrw8mpVyDasMETsECijJnfeL0EBHYVHOuyYw4yYaCDNwV9stxRttrbuOtVe2Gh47al2wboBqvPlVYj/9PhizTwyN88Z+feYrkyMUof9hoAUE79GMuqF0/ww9+vAagBztOoGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SNxwd9Hf8Lct6yYE5eBxebfY7H0ana6yLvOBbUda/w=;
 b=SKnE8wI1WzkOVOBYXNjiNjKPVY0voIIbi8mNWtWIPy0JXfAY3aAjwuGf2+U0RARBQY+7MYbix6KOVSw1yqb8vCR6XED27MY4Fhu3YqyMKeyEeRsIHODYvAcyV1/mcl3OWsFHUlHRbTjzkd5Ve3JoKULxZ8UmEe1Cgz4SvloaAj8XJ+/XQoPbUDG+2Q4Lk+oiMEgSAYrFENZUzWE2lrtCy2OxlaE2dZ8V7t45a7d+IteRJVIuDd0IBmV5hWtTV9ttDQFZf/FdqmRgRU90GH1tvh+9sBCpo8aGtOQFmJzZ6A4kf24eJc80k1KA14MZAtL7Vcf1RU8yLn66D9kQ/1YubA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=kernel.org smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SNxwd9Hf8Lct6yYE5eBxebfY7H0ana6yLvOBbUda/w=;
 b=vOAgLbR7Gd/zpyEJZF4CXNrMgBTOfpnHxKJ5BrSo3whtlvmxFqMQOvKB3na55FnFSPQh0U1i3g+qnwRwfzRInIZMpGRLpW5q3LzgADLS9NfIFTUgIhSf7hWpsV4ajkAmlrH6IvzoAZuj28NB8fHJDJ8D2d95JY2iHxR/1JWuKvw=
Received: from BN6PR03CA0004.namprd03.prod.outlook.com (2603:10b6:404:23::14)
 by SN6PR03MB4159.namprd03.prod.outlook.com (2603:10b6:805:b8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Fri, 18 Oct
 2019 11:21:53 +0000
Received: from CY1NAM02FT060.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::209) by BN6PR03CA0004.outlook.office365.com
 (2603:10b6:404:23::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 18 Oct 2019 11:21:53 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 CY1NAM02FT060.mail.protection.outlook.com (10.152.74.252) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2367.14
 via Frontend Transport; Fri, 18 Oct 2019 11:21:53 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x9IBLqen011013
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Fri, 18 Oct 2019 04:21:52 -0700
Received: from saturn.ad.analog.com (10.48.65.112) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Fri, 18 Oct 2019 07:21:52 -0400
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        Dragos Bogdan <dragos.bogdan@analog.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH] media: adv7604: extend deep color mode to ADV7611
Date:   Fri, 18 Oct 2019 14:21:57 +0300
Message-ID: <20191018112157.31657-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(136003)(376002)(396003)(346002)(199004)(189003)(5660300002)(26005)(51416003)(50466002)(8676002)(36756003)(1076003)(186003)(44832011)(7636002)(126002)(486006)(4326008)(476003)(86362001)(478600001)(7696005)(70206006)(70586007)(305945005)(47776003)(50226002)(356004)(106002)(48376002)(2870700001)(316002)(54906003)(426003)(336012)(110136005)(246002)(2616005)(107886003)(8936002)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR03MB4159;H:nwd2mta1.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail10.analog.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2ded6d2-40fc-4bfc-8b0b-08d753bd60ae
X-MS-TrafficTypeDiagnostic: SN6PR03MB4159:
X-Microsoft-Antispam-PRVS: <SN6PR03MB415961ED1A1F47551032B6C8F96C0@SN6PR03MB4159.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 01949FE337
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q+v8Jbd3sc1LjCRFxqja7Tve/LrYDcYReVKux+ZJB0G9vxYXlVsSzjnifKbghVQP8gL69u8NCoqVeFZtoqXoBc8gfEx/bucHvepGFjn8znl5YamYJiXWehgjr2gMu7gmF9GitRpVgLfb62rrdCpEvWC/pzGOvcepx5CSiF+Si24VhIYAbxEU8jbY2Rf0tmLBhaNx/taPHKrQV8xLi5sNBzTiaWjFemrAy8gdKvJH7EZ8YXlF4aJN5wgT6tshDM7N0ISsGE5hlR6eaeyVtflj23c2V9S1PQePg4NT2NhFtEHl/qtYJ4rPN+u7DcT+20ChSv4Z0D1B4vbhv34k0hWe4UZUAzQWHw7Ti5pALA2C3KIYgyIVR3oscSUIEb9Mfv/lXyxmhI99L1D+naSIZvmRyxUT5qu5jL15RQo5jX8WMrY=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 11:21:53.1039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ded6d2-40fc-4bfc-8b0b-08d753bd60ae
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.55];Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4159
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-18_03:2019-10-18,2019-10-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1011 mlxscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910180109
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dragos Bogdan <dragos.bogdan@analog.com>

The AD7611 chip supports the same Deep Color Mode settings as the AD7604.
This change extends support for this feature to the AD7611 by adding a
wrapper function for the `read_hdmi_pixelclock` hook and adding the same
frequency adjustment logic.

Signed-off-by: Dragos Bogdan <dragos.bogdan@analog.com>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/media/i2c/adv7604.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 28a84bf9f8a9..5384c40eed7d 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -1503,23 +1503,14 @@ static void adv76xx_fill_optional_dv_timings_fields(struct v4l2_subdev *sd,
 
 static unsigned int adv7604_read_hdmi_pixelclock(struct v4l2_subdev *sd)
 {
-	unsigned int freq;
 	int a, b;
 
 	a = hdmi_read(sd, 0x06);
 	b = hdmi_read(sd, 0x3b);
 	if (a < 0 || b < 0)
 		return 0;
-	freq =  a * 1000000 + ((b & 0x30) >> 4) * 250000;
-
-	if (is_hdmi(sd)) {
-		/* adjust for deep color mode */
-		unsigned bits_per_channel = ((hdmi_read(sd, 0x0b) & 0x60) >> 4) + 8;
-
-		freq = freq * 8 / bits_per_channel;
-	}
 
-	return freq;
+	return a * 1000000 + ((b & 0x30) >> 4) * 250000;
 }
 
 static unsigned int adv7611_read_hdmi_pixelclock(struct v4l2_subdev *sd)
@@ -1530,9 +1521,28 @@ static unsigned int adv7611_read_hdmi_pixelclock(struct v4l2_subdev *sd)
 	b = hdmi_read(sd, 0x52);
 	if (a < 0 || b < 0)
 		return 0;
+
 	return ((a << 1) | (b >> 7)) * 1000000 + (b & 0x7f) * 1000000 / 128;
 }
 
+static unsigned int adv76xx_read_hdmi_pixelclock(struct v4l2_subdev *sd)
+{
+	struct adv76xx_state *state = to_state(sd);
+	const struct adv76xx_chip_info *info = state->info;
+	unsigned int freq;
+
+	freq = info->read_hdmi_pixelclock(sd);
+	if (is_hdmi(sd)) {
+		/* adjust for deep color mode and pixel repetition */
+		unsigned bits_per_channel = ((hdmi_read(sd, 0x0b) & 0x60) >> 4) + 8;
+		unsigned pixelrepetition = (hdmi_read(sd, 0x05) & 0x0f) + 1;
+
+		freq = freq * 8 / bits_per_channel / pixelrepetition;
+	}
+
+	return freq;
+}
+
 static int adv76xx_query_dv_timings(struct v4l2_subdev *sd,
 			struct v4l2_dv_timings *timings)
 {
@@ -1579,7 +1589,7 @@ static int adv76xx_query_dv_timings(struct v4l2_subdev *sd,
 
 		bt->width = w;
 		bt->height = h;
-		bt->pixelclock = info->read_hdmi_pixelclock(sd);
+		bt->pixelclock = adv76xx_read_hdmi_pixelclock(sd);
 		bt->hfrontporch = hdmi_read16(sd, 0x20, info->hfrontporch_mask);
 		bt->hsync = hdmi_read16(sd, 0x22, info->hsync_mask);
 		bt->hbackporch = hdmi_read16(sd, 0x24, info->hbackporch_mask);
-- 
2.20.1

