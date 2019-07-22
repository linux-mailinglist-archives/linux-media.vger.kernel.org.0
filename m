Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A13FC6FB38
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 10:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbfGVIX3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 04:23:29 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:4602 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727492AbfGVIX2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 04:23:28 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6M8MDG2011281;
        Mon, 22 Jul 2019 01:23:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=NVDfzCzQ3lVqe+00bZH7dJJOrAvOD5pmcX6YMI8FP1g=;
 b=Ry/ERAC+SRfAvd5EPrtwQXBQJP5MoZyDPaJ3Tt6zimZvG5NRV1e9BuQByqu62DiFxrj+
 WQ+x8Y0GQG7Ngt4+8Sk2rmwAs1VYPKlOaFWT6LX+Vl/rUy2oQNTJCsfZWIMfpvozEBez
 lfZk71NPaYhYzKslMvKYnv8DktRVj9kyTWypk2nCy/ARLUr9phHeU+M+cQy4PO7UxQGH
 BcXM1IjeZtxVj5pcoHTjT/1X0d1/rvjItAJcOBZvShpIkW5ssmTKyA3V9fomuqCpLHL+
 gBvp6RlgRvunTVKiXmjNHFFBTgrBuTRbLe3QPnSYeCcqi2BqIPRrV2p24fmVWwPQo20r Ew== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam02-cy1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2052.outbound.protection.outlook.com [104.47.37.52])
        by mx0a-0014ca01.pphosted.com with ESMTP id 2tuygwnq75-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 22 Jul 2019 01:23:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCUU2yeL2CpeypC8CLNt5E84nSCmrIHzeC1SwWs+ZSPZUun3W5RNrTDnPxKhJ7iJCVKRsW07x9EHuuFTx4/tUTmWA4nxTqu+9kNZejDEe/syQwd8FxVw+K6ElKC5UDm5AI6t62JzrEHvHiPUmQdYTdxv5ouRF+mZA5svPbYwEatiYSbRz9Gl52cD61c9CDqe4RzfSkKCp39doJalS1TxCk3WvmxlBiMGc0f74cGZk6rppgDs2F7+9I/yqOVdFi+0ZLVt7KiRBKUCZzVJh0GVLADVuJ98hvLoZWQx1I8LQFAvOBA2NgT4Sb3Go0xfoHS0vhFUukDu5TTauoRdYRJjKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVDfzCzQ3lVqe+00bZH7dJJOrAvOD5pmcX6YMI8FP1g=;
 b=iftOchJsozs0Zb1IUzQqDPsic1nbRI+N9fUgHZEAlHbpQbwBKZ+Nj2cc64utHQwf6XAeZ1zkdKv9+7rd8z9Noy6hsx6Pj60mDqnkI0tU9y5lwc1UeYA7JRP6a1M7gLGEGMPgdXmhOrRHYxbRpoiuJbv9+SSTu/5q5DUCI9cLYVbiB4Y/znqFWDx8bq63jkOhSsLLRfkPIICdJpNn3IheXYNhleqmaPVBvNLE8tD+iu73Zy32cE/+XEsw4hpUGqM1pahV4iGBJBDQCilcw6FnGfFlzn5wGl0y7jafdNSqaZ2f7vjKRvSwTWIvTeTZs6ngqhKAhmH1BPp4V1/9uyYrRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=softfail (sender ip is
 199.43.4.28) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=cadence.com;dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVDfzCzQ3lVqe+00bZH7dJJOrAvOD5pmcX6YMI8FP1g=;
 b=ouxPcoKEFEsY6vqRJY7L6CbvYIDz3XxMskPkbvHHQ28fkFpQXHENS5sa6fuI1zmtqgVXYPVTqK0QSVuUEm33BYWA8WSXeNww+p6c/fXA686XsGpFOEk3BdyfMlCPj9Cf5iY6EsBw5vYiCUg1v2Mo44ACC9tZ2VqgQee9/Vx13C4=
Received: from MN2PR07CA0010.namprd07.prod.outlook.com (2603:10b6:208:1a0::20)
 by BYAPR07MB4342.namprd07.prod.outlook.com (2603:10b6:a02:bf::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Mon, 22 Jul
 2019 08:23:16 +0000
Received: from CO1NAM05FT015.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::208) by MN2PR07CA0010.outlook.office365.com
 (2603:10b6:208:1a0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.14 via Frontend
 Transport; Mon, 22 Jul 2019 08:23:15 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT015.mail.protection.outlook.com (10.152.96.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.4 via Frontend Transport; Mon, 22 Jul 2019 08:23:14 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x6M8N8DA007762
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Mon, 22 Jul 2019 04:23:13 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 22 Jul 2019 10:23:08 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 22 Jul 2019 10:23:08 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x6M8N8tL019013;
        Mon, 22 Jul 2019 09:23:08 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x6M8N8Yc019012;
        Mon, 22 Jul 2019 09:23:08 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <rafalc@cadence.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 1/4] media: dt-bindings: Update bindings for Cadence CSI2TX version 2.1
Date:   Mon, 22 Jul 2019 09:22:20 +0100
Message-ID: <20190722082223.18693-2-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190722082223.18693-1-jank@cadence.com>
References: <20190722082223.18693-1-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(199004)(189003)(24433001)(36092001)(110136005)(14444005)(47776003)(316002)(51416003)(16586007)(42186006)(76176011)(4326008)(107886003)(70586007)(70206006)(5660300002)(68736007)(86362001)(76130400001)(54906003)(1076003)(69596002)(26826003)(50226002)(87636003)(446003)(11346002)(36756003)(2616005)(53936002)(426003)(476003)(50466002)(8676002)(48376002)(81156014)(126002)(2906002)(26005)(186003)(8936002)(478600001)(356004)(81166006)(6666004)(486006)(305945005)(336012)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR07MB4342;H:rmmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:InfoDomainNonexistent;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72577fe7-10c1-42a7-7cc1-08d70e7dd7d2
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:BYAPR07MB4342;
X-MS-TrafficTypeDiagnostic: BYAPR07MB4342:
X-Microsoft-Antispam-PRVS: <BYAPR07MB4342B1BAED6226749C78E3B9D0C40@BYAPR07MB4342.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 01068D0A20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: yOIXlG1tZj+1aC5CTHjy6rLFzpZ40T6O+B961Jmq1VknNdNNwpn/5fqECq2V7bfUa7bkTbL9GH/HWwYRGZYB7oDFY2PMQP2+relMfCfaGvo2evIaoRoivJpFbpOSyL/EyQ9B8joQI62/mOG5wA4PhYtMY2+VSdxFMvyf8o1+kG30l/ho70HIbUl6mKRVdyouJqWxpApOPYcI8fVn8VgS8TS5edYoUmOTuwrmHIkdC1kz3YK3y9qJqlBYJQV4SADWsHpLEpJTsHuV28t9lkTT7JsszYhR3dT8e3h1s7J008YVlg/s2zYk0RDun6seF88rO1izG7k/x8945XCIvpKS24Q1v2HyeKqcrRYAOODiuDeRiikvTTxYktdrrSySBAghhRdKK3TBho0g220NPFTk4aWtagyW+c95Idx/TBdj/io=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2019 08:23:14.7088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72577fe7-10c1-42a7-7cc1-08d70e7dd7d2
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.28];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4342
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
 mlxlogscore=887 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907220101
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds a DT bindings documentation for
Cadence CSI2TX v2.1 controller.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 Documentation/devicetree/bindings/media/cdns,csi2tx.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/cdns,csi2tx.txt b/Documentation/devicetree/bindings/media/cdns,csi2tx.txt
index 459c6e332..751b9edf1 100644
--- a/Documentation/devicetree/bindings/media/cdns,csi2tx.txt
+++ b/Documentation/devicetree/bindings/media/cdns,csi2tx.txt
@@ -5,7 +5,8 @@ The Cadence MIPI-CSI2 TX controller is a CSI-2 bridge supporting up to
 4 CSI lanes in output, and up to 4 different pixel streams in input.
 
 Required properties:
-  - compatible: must be set to "cdns,csi2tx"
+  - compatible: must be set to "cdns,csi2tx" or "cdns,csi2tx-1.3"
+    for version 1.3 of the controller, "cdns,csi2tx-2.1" for v2.1
   - reg: base address and size of the memory mapped region
   - clocks: phandles to the clocks driving the controller
   - clock-names: must contain:
-- 
2.15.0

