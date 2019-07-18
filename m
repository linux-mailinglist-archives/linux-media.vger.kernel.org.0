Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 882366CD2E
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 13:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389933AbfGRLPl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 07:15:41 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:57280 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727687AbfGRLPk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 07:15:40 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6IB1jgN002154;
        Thu, 18 Jul 2019 04:15:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=uxQm1ukk6+sC1nrSoRqT4IUuS4/IgHlpwty9uEN0Jp4=;
 b=lO3K9VqJc899VYf1pixrsQp3HXkZTOcHAF9GorsHzXx2Mmf13Cz8xeIGxdcNh6x53Pf0
 QO8I7cn2E12iPVpCIztgRLqeoAsISJHlLr06754IV3r528NgbGymPq68N88Pl+bCZ6fj
 1m1YR7+4kwMiZ+3Dghsg+pNVzRnfcX8kiOIv+CddY1pCAgrN0eLSI9KpPmuC0oudpBLA
 ufm+96x+KQeQiOKwHVNp0m+aOSeMZ20oZTXKjhCWN+1oPFpQFZMB4PBpitq4iegpZqlW
 eWxBAP7d0hPdjf5Oof/YLIzt3pMqPkjvNpUng+/cMuswX30K9re7nMafJKeZltC5xepj Ug== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam01-sn1-obe.outbound.protection.outlook.com (mail-sn1nam01lp2053.outbound.protection.outlook.com [104.47.32.53])
        by mx0a-0014ca01.pphosted.com with ESMTP id 2ttm8u0pbw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 18 Jul 2019 04:15:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=od9UzC38PQxKYC55Kq+bhZ1K4EdV23wsJzzgqkZG9aBKnGhFLpPvB0AF9I+/hLeWKLwFkof32/GIoYvLn2WWagOuLZWF6ou+D2Jiu4VZ4MeXKjQVe01l6BPjOrugPRC2yPNbtAmEaaz2/VcHnFm0RBsAI4g/FulVhFS2RcYi4n0oNEWL+JpaD9QIlRntxAPwFlq5VWJBbT8CCV7tTL/vnBtr7HvaBNJPeH9A1FILCNpIBrC9i9U77RRBpotF/uqsMKUI663AJOBpUZ5KljArihzv4Y274KNHao3rSwR7quD18wMCxtd1F6Q+nRvASUoA5SMs6fu8CaQnr9wIUxhY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxQm1ukk6+sC1nrSoRqT4IUuS4/IgHlpwty9uEN0Jp4=;
 b=K/TRj+9XkSsa3BaXSXAxjraSH9cJpEGOCCjYZrvnfktVAKPcV5eKxXle9oiKq9pTMo9ooC9BymWmcJIiFOG9ghn37D6jXDzOksAiwQXqgtFIxdU1Y/NfobmGWich5aI2urEgxbUnDqVlWKI6trmI7w4mPdRu7RLPncu14auWXGIN+A/XsuxfTyWj3bUkYAt8MREgHCFOp2/3uKoksq4uhweA9CzanZAKIzObhNaVwOq0nrMbfBt29Trzs6ypW2chyctz1b9S+X0sBmm1fEnCVHtNLnEqxVO7uVNrmhj7qr9S6i0BJR7+ifJCYxO/f4tZUD/R+JPYz8B4D2781bmhCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=softfail (sender ip is
 158.140.1.28) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=cadence.com;dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxQm1ukk6+sC1nrSoRqT4IUuS4/IgHlpwty9uEN0Jp4=;
 b=bvsBCVOWikWaHGzfoTotsbsh9R6vVnKVeR79NjWYt/AIrtoqJ2v7S3Yh/Pq3Iu2jpS54UTv6go9lvKpQgN12a0+qw6CHiPwD/JPYEGiJKdr7KTnt3wGHhW/nWexB3RFwzyLXYecWAmQUqTwUfEhCm8lgUWMQvLhu8HYdXyuLuWE=
Received: from DM5PR07CA0029.namprd07.prod.outlook.com (2603:10b6:3:16::15) by
 CO2PR07MB2679.namprd07.prod.outlook.com (2603:10b6:102:17::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 11:15:26 +0000
Received: from BY2NAM05FT061.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::202) by DM5PR07CA0029.outlook.office365.com
 (2603:10b6:3:16::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12 via Frontend
 Transport; Thu, 18 Jul 2019 11:15:26 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BY2NAM05FT061.mail.protection.outlook.com (10.152.100.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.4 via Frontend Transport; Thu, 18 Jul 2019 11:15:25 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id x6IBFMvE021080
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 18 Jul 2019 04:15:25 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 18 Jul 2019 13:15:22 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 18 Jul 2019 13:15:21 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x6IBFLGF030010;
        Thu, 18 Jul 2019 12:15:21 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x6IBFLQc030009;
        Thu, 18 Jul 2019 12:15:21 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jan Kotas <jank@cadence.com>
Subject: [PATCH 2/3] media: Add lane checks for Cadence CSI2TX
Date:   Thu, 18 Jul 2019 12:15:08 +0100
Message-ID: <20190718111509.29924-3-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190718111509.29924-1-jank@cadence.com>
References: <20190718111509.29924-1-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(39860400002)(376002)(136003)(2980300002)(36092001)(189003)(199004)(486006)(87636003)(107886003)(48376002)(336012)(50466002)(76176011)(4326008)(51416003)(426003)(36756003)(446003)(2906002)(476003)(186003)(26005)(2616005)(126002)(86362001)(1076003)(11346002)(70206006)(8936002)(76130400001)(54906003)(110136005)(246002)(8676002)(5660300002)(316002)(42186006)(16586007)(305945005)(6666004)(356004)(26826003)(478600001)(47776003)(70586007)(50226002)(7636002)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:CO2PR07MB2679;H:sjmaillnx2.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:corp.Cadence.COM;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33ed05aa-8ef9-4694-0423-08d70b713be0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:CO2PR07MB2679;
X-MS-TrafficTypeDiagnostic: CO2PR07MB2679:
X-Microsoft-Antispam-PRVS: <CO2PR07MB267960F5563B3E66DA6A0689D0C80@CO2PR07MB2679.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-Forefront-PRVS: 01026E1310
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: hhyvY9noBKqPb/7xhKztmZXby9dBCrX8xCNGFUS2cYv7CQRVkUe0OvUNhUB+YYCRUC7wbJgn5GotQBMskFfbltE9CS2U7kPQL+Q0tEhGQZcu/2hnYqpy9eC1pjQ0skXRxr1U+8U2SkihurSSuG0CfCC9Sl7V5EhpnJO7Uofu3mWJ9AmsNCKPMVV0nrxUoVsk6YYfJyCJPXL0iGoXWcZqco5zQYoc3Xto8+iOGzXP/iQXD7XZq38pwRCcr7Mj7Yb089qtnHFg5zdO1bcL9bgu3yrrXXnwEXscjcZImVPQSV01YAMc8xYD0B4MBERpp4sDQ8d0oxlui4BhNDwRYmJ8Xxr8AF9gqV0yyfoqpBfja849BHdqCpCwT3oRrfUTeaXwFQFgRQBWXGQ+ZDl2lAoq7/eJRGkzEdp8SOyWV97h3h0=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2019 11:15:25.9360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ed05aa-8ef9-4694-0423-08d70b713be0
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[158.140.1.28];Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR07MB2679
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-18_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=698 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907180122
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds line checks for CSI2TX, to prevent
clock lane being used as a data lane.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 drivers/media/platform/cadence/cdns-csi2tx.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 5042d053b..232259c71 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -2,7 +2,7 @@
 /*
  * Driver for Cadence MIPI-CSI2 TX Controller
  *
- * Copyright (C) 2017-2018 Cadence Design Systems Inc.
+ * Copyright (C) 2017-2019 Cadence Design Systems Inc.
  */
 
 #include <linux/clk.h>
@@ -434,7 +434,7 @@ static int csi2tx_check_lanes(struct csi2tx_priv *csi2tx)
 {
 	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
 	struct device_node *ep;
-	int ret;
+	int ret, i;
 
 	ep = of_graph_get_endpoint_by_regs(csi2tx->dev->of_node, 0, 0);
 	if (!ep)
@@ -461,6 +461,15 @@ static int csi2tx_check_lanes(struct csi2tx_priv *csi2tx)
 		goto out;
 	}
 
+	for (i = 0; i < csi2tx->num_lanes; i++) {
+		if (v4l2_ep.bus.mipi_csi2.data_lanes[i] < 1) {
+			dev_err(csi2tx->dev, "Invalid lane[%d] number: %u\n",
+				i, v4l2_ep.bus.mipi_csi2.data_lanes[i]);
+			ret = -EINVAL;
+			goto out;
+		}
+	}
+
 	memcpy(csi2tx->lanes, v4l2_ep.bus.mipi_csi2.data_lanes,
 	       sizeof(csi2tx->lanes));
 
-- 
2.15.0

