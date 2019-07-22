Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88A916FB3A
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 10:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbfGVIXe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 04:23:34 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:22478 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728349AbfGVIXc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 04:23:32 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6M8EfiY005895;
        Mon, 22 Jul 2019 01:23:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=7m7nPx2g/E5A6p2bWoMnIdGkgcxGSmpRh+Ha5Ly/6Bw=;
 b=Eu8YR4ed+iX2GOp8BOZxi6yklsKN3dyzODccs/wrTtzVvC5cq+xdK+MTg+GZj1Dx4men
 NftmzDYvt0gEl2bwj+a/XCMZOYeFupFZ+AQMdYcgorFuqR+uDmd7ioRNCzQq3jsTgKtS
 SzvA6r7BbGaLnOD6cwKCawOcpC5sWRs9+jUFw+q39NwlrlQCBdSifRu4UBM50fNUq7tl
 sK5cjwk3p8VGqXOT+yrWRGi65nfHKhmeaXwSLOmWj9Tl5Wx5XoD66KbJvV4pGOEpGa4q
 k1Mth/UvVBGqTCdtrW7CMt3wAtpmLHlknSOmsDl9canUll4o83stMuFfb6/ZJW0qYi34 9w== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam03-by2-obe.outbound.protection.outlook.com (mail-by2nam03lp2052.outbound.protection.outlook.com [104.47.42.52])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2tuxhwe23e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 22 Jul 2019 01:23:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/mW45pDru57x7sxc2v4LR0cqianeQAoHGK/WfFbRp3LZHI2pmSup1D0qF3v3P0Qfq8RaWTYIRyEx5ylJgYBqzV2NyQydZjfYFH3tQJ/2haQWLbks08M3Ap6rCKUuz7ThTL0KOdE3J/0sHC9o5yQCI/e7e+zItqJWatNHk6eFVwfXgTdbmlx7+DfpIE935JZlpxj83tzD+w/Rl0+KgJGULmISQQ+htFJ0gFEjyGJAGZZYElS6h23hZBHfNXDQEYmUsvkLS0cYONhhc5EN3Ks4KSQUc0LottdZTAIS8DrosYAHjEChB2r0cSphga25oivxhea6e6v7ChMHDp7sWhP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7m7nPx2g/E5A6p2bWoMnIdGkgcxGSmpRh+Ha5Ly/6Bw=;
 b=FtWmhu/TRSCJOowOiG57xrkmaqdZb4NLF9Yfgb+UMYJcNOyvTupapKi9WrNM8g3chdTtLHv+Qo2CEhGhwOyKp/myflEfRYai5Z3wJpAVDtgekVpxIhjFpAmaDvbW3U7PtOUzjNZbmRXQGIVa6MTYRHVAuJ0XvB/3Psu95+RXRDA4FOfy9wcRaB5ySZ+Wx8qaTLRZc0Rc6miy2DYuWRjKKM7J9kcfPliGj07dVTO/bt/cyGcEZOszp1u8LO8Q6Lx+vIwGAHw/IvxKLGQjr6/O7Ys3nQXMMnuJ5puVYzCRYZGgZn5+GlvxMf4r6iI3RrSJ+Zp7ZhXdRawhRAYiw6MbhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=softfail (sender ip is
 199.43.4.28) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=cadence.com;dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7m7nPx2g/E5A6p2bWoMnIdGkgcxGSmpRh+Ha5Ly/6Bw=;
 b=bBq0HI1HyJI9McZQULBk3HCHRLSSGbil5NjbDbAAvnW2U1lK5RGOtvUfWjjqAa1Nm+cmh6fSKQGESVti1IzgNhBSgSyVYdlum9dtMwCVkMT6/oG/Ne2XZ9nXlfm+5kot4q+zTjMjn9xgRnehve8g19OCnQ+MV3IMxoePIePlQyI=
Received: from DM6PR07CA0042.namprd07.prod.outlook.com (2603:10b6:5:74::19) by
 BYAPR07MB4343.namprd07.prod.outlook.com (2603:10b6:a02:c0::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 08:23:24 +0000
Received: from CO1NAM05FT062.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::201) by DM6PR07CA0042.outlook.office365.com
 (2603:10b6:5:74::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.17 via Frontend
 Transport; Mon, 22 Jul 2019 08:23:23 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT062.mail.protection.outlook.com (10.152.96.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.4 via Frontend Transport; Mon, 22 Jul 2019 08:23:15 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x6M8N8DB007762
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Mon, 22 Jul 2019 04:23:14 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 22 Jul 2019 10:23:08 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 22 Jul 2019 10:23:08 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x6M8N83X019017;
        Mon, 22 Jul 2019 09:23:08 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x6M8N8mF019016;
        Mon, 22 Jul 2019 09:23:08 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <rafalc@cadence.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 2/4] media: Add lane checks for Cadence CSI2TX
Date:   Mon, 22 Jul 2019 09:22:21 +0100
Message-ID: <20190722082223.18693-3-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190722082223.18693-1-jank@cadence.com>
References: <20190722082223.18693-1-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(396003)(346002)(39860400002)(2980300002)(189003)(199004)(36092001)(86362001)(2906002)(107886003)(81166006)(81156014)(47776003)(4326008)(50226002)(68736007)(8936002)(53936002)(36756003)(1076003)(5660300002)(6666004)(356004)(76176011)(54906003)(336012)(16586007)(42186006)(426003)(126002)(476003)(2616005)(316002)(11346002)(446003)(70206006)(478600001)(76130400001)(87636003)(26826003)(70586007)(69596002)(26005)(50466002)(8676002)(48376002)(486006)(110136005)(51416003)(186003)(305945005)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR07MB4343;H:rmmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:InfoDomainNonexistent;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59a40098-659a-4694-e3ac-08d70e7dd86d
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);SRVR:BYAPR07MB4343;
X-MS-TrafficTypeDiagnostic: BYAPR07MB4343:
X-Microsoft-Antispam-PRVS: <BYAPR07MB4343F96BA5134ED269884857D0C40@BYAPR07MB4343.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-Forefront-PRVS: 01068D0A20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: iZQAfxunGwPAN0Dr+vbHwRdkecRRUxqEuEQxGm7gt6O/rpyBNWWz7ogEFSI98YmMqw0/kGQlu6doBYUHN5jHchNY15XXBON/xr7ccaeLZRXtzgcfB/Ky9q3+bXixTExSeAnC7wqkuyx+N1yu81kQ6zHhQPl98vvIWhGzYLLqw2dcedHdVeGA127eBFRO0JP9yVmZHnjk+MUEVbLPNt5bSNZKPN5+Yx/mcTynF1lS2QjXwdsDtVfhZJYsDWws5p7kBRSdN7ytm2qEC8ikqB8e8H6tCxx2hFP+Ki0Ilp9LjVaxp2Izr2h7cigDlk3IsWTOk/TFS7881d5WY7CW0ZV2XFBa/M99SJeXBeVrwQl5aPgJotyWlKkF5/OG+uppDG2kXLfUnoRdbO0eZ+apH/gJDMtMncUuvTVMU1FHkaKM+jM=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2019 08:23:15.7279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a40098-659a-4694-e3ac-08d70e7dd86d
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.28];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4343
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-22_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=712 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907220100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds lane checks for CSI2TX, to prevent clock lane
being used as a data lane.

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

