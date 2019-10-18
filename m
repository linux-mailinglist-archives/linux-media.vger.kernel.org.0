Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B794DC3F9
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 13:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442660AbfJRL3n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 07:29:43 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:3212 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389257AbfJRL3m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 07:29:42 -0400
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9IBRLbq019158;
        Fri, 18 Oct 2019 07:29:39 -0400
Received: from nam01-bn3-obe.outbound.protection.outlook.com (mail-bn3nam01lp2054.outbound.protection.outlook.com [104.47.33.54])
        by mx0b-00128a01.pphosted.com with ESMTP id 2vkbf6bgky-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Oct 2019 07:29:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKodbvZt/igeR8gEtDR04oJzChU4ga4qXDiQePAqKwD2dzPFssxhK810cKD3pjGywinYIQzRYL6ZjMX3e9Cpzj25QPbPSN8AS1N5q9xMTHeMWI1kqmkkHEd+kINg24jEaeIPGIP2PUfs6r4D5PcWbB17gYaBYHz5NGUxu2Y+djQ4/WeQ2UqBZWEoFgt7I44OSPVu67TpVAmTMYkWk3Eju+jDidoH/gjq89FDrTqZ4FmWrHPj9yXoqiAxicFr1NjHnEZjWsFHogLdORcLmuW71Cp3zs+WctoOC8hKpPXD8KSB6MrhcfNfER17rN5mXDoSzeoieJy7DMx/QD3iyXD3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgm1HKS5VcmDW9QZbR3ehMEDWaH7sXp4ExwUT26xxDk=;
 b=NnM1IeU+bH9BuxRI+a6g79dmItpn0hlbOS1/v2+I7pAJawf5W7Lwuuqc/Stuod7VuvfS+pKyWR40ch+pN+1ATLEWJfKAeKuN6MGB460g6WrLj1eDbs6965p7pLReOz+ofPqhjHbovsA7wyzLkR6E4Mwfsry/gll1teFf2ymGhFEHYCyANInkQAgv96mXJf0T1FKkDmA9SkfR5q7wwYHQBLHUwGbtZkm4Ay9pI4dJwzYhIoK3CLHXb6ZAElvENUGBWOX8S97JuFV4tief8gNdCEed3ROjwRIpOBL4xkWKYfrUqW1axnXa51Zum9hoKejt9l9hBgA3z8aUnt8KiWThXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=kernel.org smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgm1HKS5VcmDW9QZbR3ehMEDWaH7sXp4ExwUT26xxDk=;
 b=7xnPVOpiuRTsdW1JxfR6+kFmwzRPx6pSnNGAuyJa1UUKEXdM4zEJIYfTyUFrXFeY95C7mcfwEywU2xF1lxSCihS3yL2WZYGsDsoAjUI1gMtG2Wf0Ch4JSTTf8NqtNn4aDkrthE3rcCVvZt9rNWQkL30q8md+C5MqGRhliNgO6EE=
Received: from BL0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:208:2d::28)
 by DM6PR03MB5084.namprd03.prod.outlook.com (2603:10b6:5:1ed::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 18 Oct
 2019 11:29:38 +0000
Received: from CY1NAM02FT060.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::200) by BL0PR03CA0015.outlook.office365.com
 (2603:10b6:208:2d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 18 Oct 2019 11:29:38 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 CY1NAM02FT060.mail.protection.outlook.com (10.152.74.252) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2367.14
 via Frontend Transport; Fri, 18 Oct 2019 11:29:37 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x9IBTbCX015080
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Fri, 18 Oct 2019 04:29:37 -0700
Received: from saturn.ad.analog.com (10.48.65.112) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Fri, 18 Oct 2019 07:29:36 -0400
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        Dragos Bogdan <dragos.bogdan@analog.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2] media: adv7604: extend deep color mode to ADV7611
Date:   Fri, 18 Oct 2019 14:29:55 +0300
Message-ID: <20191018112955.13652-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018112157.31657-1-alexandru.ardelean@analog.com>
References: <20191018112157.31657-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(136003)(346002)(376002)(39860400002)(396003)(54534003)(199004)(189003)(44832011)(126002)(54906003)(70206006)(70586007)(106002)(476003)(2616005)(2870700001)(486006)(110136005)(186003)(48376002)(2906002)(47776003)(14444005)(50466002)(86362001)(305945005)(7636002)(50226002)(246002)(8936002)(8676002)(36756003)(4326008)(107886003)(478600001)(356004)(6666004)(316002)(1076003)(5660300002)(426003)(336012)(11346002)(446003)(76176011)(26005)(7696005)(51416003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR03MB5084;H:nwd2mta2.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail11.analog.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c18f5975-0285-40a1-86bc-08d753be7591
X-MS-TrafficTypeDiagnostic: DM6PR03MB5084:
X-Microsoft-Antispam-PRVS: <DM6PR03MB50844118E4774FB48A845512F96C0@DM6PR03MB5084.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 01949FE337
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1/qdV0TGHyVuM3xdz703E58cke1kDmRE1NHdZafFWUODJqHJpdPzqCis+uuZiNz+NgvNDQ+b9cwnyufE52dV6yPDAYy/nDy8maA8/k72wfVWEmcKS4kb45MR6+qhTzbkyBvJVBr212h+fsHmVWVBeJPwVpSgHI11GIAA3eX9BERPXlPziNHaQ6fZJrLf/p+XE7lSQqcpZ4GFzx3W8aOFIQeZr+q2YpKDIwV5GlMs5wZv9hvVbVmerBwABz9yAD+PvWUq3WC9Yr9Svk+8ctizVT012Id7JlfjKgFvF7VO7SvUHzYn2kmrscrj9Jslezapke5hgXt0dvH1fvogIoqhqo2/WaKgGK8ON5Q2My1c42F9GQ3TfkwRxkoxIv+fsil1UChhtbPBRRYw327ddbtdQWsYtcStfsHNfohnE3reFuM=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 11:29:37.6416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c18f5975-0285-40a1-86bc-08d753be7591
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.57];Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5084
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-18_03:2019-10-18,2019-10-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1910180111
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

Changelog v1 -> v2:
* address checkpatch complaints about 80 col limit and
  use of `unsigned` vs `unsigned int`

 drivers/media/i2c/adv7604.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 28a84bf9f8a9..c6fe3aa69733 100644
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
 
-	if (is_hdmi(sd)) {
-		/* adjust for deep color mode */
-		unsigned bits_per_channel = ((hdmi_read(sd, 0x0b) & 0x60) >> 4) + 8;
-
-		freq = freq * 8 / bits_per_channel;
-	}
-
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
+	unsigned int freq, bits_per_channel, pixelrepetition;
+
+	freq = info->read_hdmi_pixelclock(sd);
+	if (is_hdmi(sd)) {
+		/* adjust for deep color mode and pixel repetition */
+		bits_per_channel = ((hdmi_read(sd, 0x0b) & 0x60) >> 4) + 8;
+		pixelrepetition = (hdmi_read(sd, 0x05) & 0x0f) + 1;
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

