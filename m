Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE1974B7F
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 12:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbfGYK1K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 06:27:10 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:21980 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726543AbfGYK1K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 06:27:10 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6PANOFK032194;
        Thu, 25 Jul 2019 03:27:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=AkR+aZVC0e8yItIo9Mq2cuSkYxp0Et2coMIZHZjXLgs=;
 b=N/twsUvKcmNXDxH712kQujwbqqtlKx+TDCz0A8pMhqv1z7rNDAzWsuUBXtsdVOS2EPlO
 OJkcoAQGH26tqazpxnOW08ZCqiBm6fK4gIfmifFU2T5NlzqVDxyeYOOdf4mvxbupn58d
 Poavrh5Jx1mbe/1KIWd1v5rRCcCWGtMNNasdQw6dMUl+fpjzau3Q08jJEUp42qgctj7r
 tk/vIUoZMqOfPOKZ9eL/c4/ZbebsXmpmogSpHvH/gJu5kTs4XE5po3QwgK5YGduM6Ono
 E301T5E5Bp1iY7zUa+Zq62vwxWvWi1DnNi9sv33xz/EcxMfNEaeZFAUpr1XtQMd61UW6 RA== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam04-sn1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2057.outbound.protection.outlook.com [104.47.44.57])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2tx61f8vt9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Jul 2019 03:27:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AajV6+ceOjg/fWOFtor79py97V8cHpJag2fc67vSxMoJUtOErHfMkB1iNggwNJ3JLJVgoSVeA/xA0namZQfjcUo4hVpU8RyCt4rUNPgPYCO4yHAVeeP+nPIEcd/fbWAqftK6++3pmQxgARbFnSbt1RziwD2P6CQhOCo3O4oc1Cm0+8xMpmeL4oTj9mGZm+E5pk9JMGc+D+N1ztYTLvXEmdlDUSrrl5fxr3Rk+mBTyVNdUURVB4nVAIu4dfHRrcDdaiOuzWWTiQbLi94O0Q4MsaXxJx8fbuCj9MAOsV2rqOEXqjeuE1EhThCigpnz8Ue5ZwwLnA9rGzWXRSToIQCwtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkR+aZVC0e8yItIo9Mq2cuSkYxp0Et2coMIZHZjXLgs=;
 b=EO71mk+La7xQLZUMJoX5yr+RQ9jxzroTOrME69ikuXrxpUuuRDgPxCbb+vwufr+qOb2isYCP0NsIoWBPsVKC/2TUUSOt8Opc6ZTZZgDvD8xDHxmUZcVv9kzqZkfljSF0LN+Ba8NESwBYyRuBsGlWpWUexwO+qQg1r5yDmsS5V4zpQOkdLQnajThEXXrz3Cb81ijtsMKkFARV3mw8rS/H04h1WbzkOAPK851SCatyi8Tv+Gw/f7Lu3Ar5wuw40ZHk/83DiRShFvx34DTnmhuCq8h7plCnjUBfWcqiOvjM8H3gzOpSqOBoVfX3OeKFUpVqIrzgurBf3wxlLfjbEt5O5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=softfail (sender ip is
 158.140.1.28) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=cadence.com;dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkR+aZVC0e8yItIo9Mq2cuSkYxp0Et2coMIZHZjXLgs=;
 b=gHVeiGTCBcuhruo83RSLYsay2QqsISnhrYLqiSUgHhjVSEg/lvM7RDn5F+q0NTKMM8FkSNmccGVg4W9/7oidZyp/32R+bgmH+pbV7iGStt+9t0SzAnDvFXFPy61ZQjwSNfFlPSejKTmGb51b62PIWNdGGZI12BVXKOwwxUwDJO0=
Received: from DM6PR07CA0015.namprd07.prod.outlook.com (2603:10b6:5:94::28) by
 BN8PR07MB6963.namprd07.prod.outlook.com (2603:10b6:408:d6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 25 Jul 2019 10:26:58 +0000
Received: from BY2NAM05FT060.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::205) by DM6PR07CA0015.outlook.office365.com
 (2603:10b6:5:94::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.10 via Frontend
 Transport; Thu, 25 Jul 2019 10:26:58 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 BY2NAM05FT060.mail.protection.outlook.com (10.152.100.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.7 via Frontend Transport; Thu, 25 Jul 2019 10:26:57 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x6PAQsW0025529
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 25 Jul 2019 03:26:56 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 25 Jul 2019 12:26:52 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 25 Jul 2019 12:26:51 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x6PAQpK4013592;
        Thu, 25 Jul 2019 11:26:51 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x6PAQpMK013591;
        Thu, 25 Jul 2019 11:26:51 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <rafalc@cadence.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jan Kotas <jank@cadence.com>
Subject: [PATCH 2/3] media: Add lane checks for Cadence CSI2RX
Date:   Thu, 25 Jul 2019 11:26:47 +0100
Message-ID: <20190725102648.13445-3-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190725102648.13445-1-jank@cadence.com>
References: <20190725102648.13445-1-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(2980300002)(36092001)(199004)(189003)(1076003)(446003)(305945005)(7636002)(107886003)(186003)(50466002)(336012)(4326008)(476003)(126002)(48376002)(426003)(2616005)(11346002)(486006)(316002)(8936002)(76176011)(246002)(110136005)(478600001)(86362001)(42186006)(16586007)(54906003)(36756003)(5660300002)(47776003)(70206006)(76130400001)(356004)(70586007)(6666004)(8676002)(26005)(2906002)(50226002)(26826003)(51416003)(87636003)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:BN8PR07MB6963;H:sjmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:corp.Cadence.COM;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d9df931-db84-4be4-fa9b-08d710ea9f7b
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:BN8PR07MB6963;
X-MS-TrafficTypeDiagnostic: BN8PR07MB6963:
X-Microsoft-Antispam-PRVS: <BN8PR07MB696300CE79A9642E436E6C75D0C10@BN8PR07MB6963.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Qv7vQnSX+ilrWeh9w4gJQ7xkU4VP0FTwGKfOf1QtjQUcv73QdoD7+pavjE+AjI1kxTXImer8Mt+TmCYOboDNXHgrRB0h2JXC12lCOZGILp3OE/sU4xy/mAjeYx5bNkidtMJu9Wnu7DSX+ahr773guPF/9vW1sPtp6DFH8k/+6JVjUp+kxKRRk9BKVSydEw9QcXl7qLYxVJRk33dE5jWxzcopxJRNMILQVby4LbwvvxUTdGOVnaurVCF16IGVm+FkbWRFDTBb/QktnS5ysY06p0nUOZYO8odBDdYWR+NHya3nYfZpb6Dfy2p6uQnpe5BgfdGgumu+3hYGnUAzBEE4qUKYvnmrvlhgQkxVDfxqpOwGlhNzWnfy1kb1Swh7LBlaWAItfW+YpMb1ICBd/xzVZOq7GRQdg4UD5z9ac/+QYDI=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 10:26:57.9718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9df931-db84-4be4-fa9b-08d710ea9f7b
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[158.140.1.28];Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB6963
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-25_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=776 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907250125
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

