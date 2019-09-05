Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED5AEAA097
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387988AbfIEK4p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:56:45 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:60646 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387697AbfIEK4l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 06:56:41 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x85As5Wr008971;
        Thu, 5 Sep 2019 03:56:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=AkR+aZVC0e8yItIo9Mq2cuSkYxp0Et2coMIZHZjXLgs=;
 b=CTWmbx8rOjW4AHIPK9dimr9JbBo3rle0TNkDY0r590SPtruXglNjli08XBlTnhuQwe/w
 fT63bMz8BJCD9iOV5JGsidGbgR1zr5sn5PK5vJC6ZzwOdeejiD+HoQAmWWtHPiSY3m1v
 RMGfiHvyajFuzy5IegKlmJp0KszYs6/F2ZFHLELVXJQnYbdFVgDy0sJTZseYRm7ef6OD
 0T6M9NJ7ZOTXdHyCq4IznRu8iARslHFnXosWfIN4K67j5+kYm2QNNckpvfNSumZ9S6+m
 +6hk1WGbavVBpQcP8waTbqNm9oU1+iaH7hlNPKcz28FiGiSEGFS/5/N442Z48HSnkAOY EA== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam03-by2-obe.outbound.protection.outlook.com (mail-by2nam03lp2052.outbound.protection.outlook.com [104.47.42.52])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2uqmfvvx4j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Sep 2019 03:56:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aa2QfsFkhtODcy5Fu+SxUDq7jPcNs74zLiqOr7vrT75qKkxfdUQVHUN1rfzlCeHeQJxWMxlq2cxopYCcIrzI72OVW6OuOufquLZYm45Zweo++jnVg+fdZMYk8aZNYaQGsA1YjxJJpEJ5jYQHJxHc+Zq9ZfrmQ67NKe6MhrjBUdZ3pT/wn1f2MACE8xutmOY7kpXDihA+VWwPZGXcHKJEqaZ0iIs/s1Ob8yruVHddVPHgf8zTug72OIktaHaCNaA1CHPlSh6SksUaVFX2u1d/r7D6VhFYOz1CuNbIv5P/naacDBccRf0A4F8JatQ8lodOBS/5YiWsdPAS8yYG2GM/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkR+aZVC0e8yItIo9Mq2cuSkYxp0Et2coMIZHZjXLgs=;
 b=Ax9mTOMOoqDz3GiPNok4iMimdhp4hRiIH0M6W3mDm+UD02n/7DU9kq0GHISqBOdbp0ly2lHOPIdivvbw15G39lzgGIyHdvHX1hMk28WLx46W71GtDbRfBHWnpBCYWJMEmrkThjxPhQPNhhL94vkjV9LlMQ0wuwHCGY2asJZnrZf4b0oPon2Wvos7sh5TrI70VR4dNGI9hGS1JghUqyMvZWMid0jEhXTqJ/ysHm0CBrJAEGyGKV/WwE99XH7M3LV0PkA9Xwk31/XUYtUV5niJB01ADwKkuOkWFF6J/e8cZNz+PirSJd/1hRjfDvx8hDUfxMK6wn6Piknb/O0eOZG3MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 199.43.4.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkR+aZVC0e8yItIo9Mq2cuSkYxp0Et2coMIZHZjXLgs=;
 b=3TD0AHDKwy+gagwNzBgyWfGtxx+l9+zhxZL2TipASQYLUAuZgsPqwTL6V3Q+Cg40l6iriERic9YlBEAJSGGeJW1cJMU0OSpTUjGE100zGZ/wrqXrlwFv7QY/R+jCWnki/BE4wqcSyRNnaqTzEOvCEuC/Q+c9riJhIMT9bWeZNug=
Received: from DM6PR07CA0070.namprd07.prod.outlook.com (2603:10b6:5:74::47) by
 MN2PR07MB7085.namprd07.prod.outlook.com (2603:10b6:208:1b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15; Thu, 5 Sep
 2019 10:56:29 +0000
Received: from CO1NAM05FT017.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::209) by DM6PR07CA0070.outlook.office365.com
 (2603:10b6:5:74::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Thu, 5 Sep 2019 10:56:29 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT017.mail.protection.outlook.com (10.152.96.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.6 via Frontend Transport; Thu, 5 Sep 2019 10:56:29 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x85AuLtM025588
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 5 Sep 2019 06:56:27 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 5 Sep 2019 12:56:21 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 5 Sep 2019 12:56:21 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x85AuLas027157;
        Thu, 5 Sep 2019 11:56:21 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x85AuKUW027155;
        Thu, 5 Sep 2019 11:56:21 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <rafalc@cadence.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 2/3] media: Add lane checks for Cadence CSI2RX
Date:   Thu, 5 Sep 2019 11:56:00 +0100
Message-ID: <20190905105601.27034-3-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190905105601.27034-1-jank@cadence.com>
References: <20190905105601.27034-1-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(2980300002)(199004)(36092001)(189003)(76130400001)(47776003)(8676002)(86362001)(42186006)(316002)(5660300002)(16586007)(87636003)(36756003)(26826003)(81166006)(81156014)(54906003)(110136005)(2616005)(11346002)(486006)(126002)(476003)(356004)(6666004)(305945005)(8936002)(4326008)(2906002)(186003)(426003)(1076003)(26005)(107886003)(53936002)(446003)(478600001)(50466002)(48376002)(70206006)(50226002)(336012)(70586007)(51416003)(76176011)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR07MB7085;H:rmmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:InfoDomainNonexistent;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc038ad1-8f43-4e89-7c20-08d731efb4a3
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328);SRVR:MN2PR07MB7085;
X-MS-TrafficTypeDiagnostic: MN2PR07MB7085:
X-Microsoft-Antispam-PRVS: <MN2PR07MB7085ED76307AA6EC867ACDC1D0BB0@MN2PR07MB7085.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-Forefront-PRVS: 015114592F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ekUlLZGawAu7o0yM7RLThXMCSeWVm2WWNf35BFKNKUyQKEia323ruUzvNBzrEOVkjgPkPk5LOFI6pq3x0PWQGWIFvCE1nGmdFDJpf7vaGA//z6T/ZDrTOWpxDj0UkXAbRm7lU3FTp8f+4cZJ63HSRD7cWNXqy/u3+uFt2RRb6muXvmzrIDSxpori22n1xMSuk0r3OzbXNGclbj5OWccWRtaBkPwSeLaVMr3vX2Tkiy+lvIi5ERpZmhrWTDexI6kkNuQk8vqgM4U+ENBCLga4DrQYKEfnDuAH4YiCdpyg85kkzthvKaug4ODSvS8cZH3ZnQvoZmd5n6CibgtMevWCDFF4zp1d9I9eW76LSzrJroIMQFkAUKK0VbjW/OjeIHJ3n4BalPCI7iqTotOOZ5zAxBhDSOm9GY1J2EulW9yyTTE=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2019 10:56:29.0169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc038ad1-8f43-4e89-7c20-08d731efb4a3
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.28];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB7085
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-05_03:2019-09-04,2019-09-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 phishscore=0
 adultscore=0 mlxscore=0 mlxlogscore=785 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909050110
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds lane checks for CSI2RX, to prevent clock lane
being used as a data lane.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 31ace114e..97ec09e72 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -2,7 +2,7 @@
 /*
  * Driver for Cadence MIPI-CSI2 RX Controller v1.3
  *
- * Copyright (C) 2017 Cadence Design Systems Inc.
+ * Copyright (C) 2017-2019 Cadence Design Systems Inc.
  */
 
 #include <linux/clk.h>
@@ -364,7 +364,7 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
 	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
 	struct fwnode_handle *fwh;
 	struct device_node *ep;
-	int ret;
+	int ret, i;
 
 	ep = of_graph_get_endpoint_by_regs(csi2rx->dev->of_node, 0, 0);
 	if (!ep)
@@ -395,6 +395,15 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
 		return -EINVAL;
 	}
 
+	for (i = 0; i < csi2rx->num_lanes; i++) {
+		if (csi2rx->lanes[i] < 1) {
+			dev_err(csi2rx->dev, "Invalid lane[%d] number: %u\n",
+				i, csi2rx->lanes[i]);
+			of_node_put(ep);
+			return -EINVAL;
+		}
+	}
+
 	csi2rx->asd.match.fwnode = fwnode_graph_get_remote_port_parent(fwh);
 	csi2rx->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
 	of_node_put(ep);
-- 
2.15.0

