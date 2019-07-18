Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 152E06CD36
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 13:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390091AbfGRLPw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 07:15:52 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:56902 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727692AbfGRLPk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 07:15:40 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6IB1jgM002154;
        Thu, 18 Jul 2019 04:15:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=NVDfzCzQ3lVqe+00bZH7dJJOrAvOD5pmcX6YMI8FP1g=;
 b=L6aEGF+EW+/22z3l36SjO0ZYIAslPbShcjXe9kLlp/g2lu3oxEOtYjqTJoKt4QguEDyP
 yIMQVPkH+lV4LT7I1l4lzEMsw7/ugq1bVT+cGvlB16saOtykwZzSRcxZBsxWTjclXQ2U
 ykdQpg69a5i4nFgMO4qVjgWVC13N29T7E6XcN04bR6emYcrnZ1XZABDu6on9FFvfGzpU
 fv0JnBkf7rqN4yJuiFIrGkKijtxmuiAjdmeOv9BlKmNfbzAaXV4mOUdjbhDSGEb/xY6U
 E0LVyJRx+8nyqb7dXpCk4QCJ9TUgmEsEVMdsr99YdMniKblGesi2zGmfUU9BLg+zzLBK DQ== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam05-dm3-obe.outbound.protection.outlook.com (mail-dm3nam05lp2054.outbound.protection.outlook.com [104.47.49.54])
        by mx0a-0014ca01.pphosted.com with ESMTP id 2ttm8u0pbt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 Jul 2019 04:15:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfPDlrykjpTHBZXV+rjMX9Uglg5vZaZYmBBK77w+pPlXA8F7mCL9J/U3Z4enG1TrGzEBuTK1Og4Jl9ZcHOqzJMrJkBC6yhtgorogZP5JX9ZNlil407M4nj3aKjnK1mweeTv71baCrXDejutkotniXKFX6MVJ/fSooTLXlaxCrP4Q4JCgyzjXxzo1/9LekK98tV1AEHhpCXySIrQzvWIPEWEYyOjCWM2cn1Pzm7tt3JqXm04R0E/XXDRDbeGn3jWVsIWIuS5qaHEO7iTCtsh/g81xBFPFY+DSZFvy5UxHLJkP0WtQhQu2Plt55O2Slrm5YHi6jWhBFXX0ttkbShsanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVDfzCzQ3lVqe+00bZH7dJJOrAvOD5pmcX6YMI8FP1g=;
 b=PerHBeZIG+5FNN35ljg0hrdB6a1fq86LCrWXk12HjUwYU5FtXcudPCay0dwt+MjiNM4unl2HrYJC6k0Bowa2wr1kW8q6tuSopnTELiHvnviWVHPJOJk9HouyvNzTMe6se0vFWflXn/FpodtwkKp/7TyBD8GShQCbVQwX6lil9deWXO1NMqKmd73e4T+xqdnjQU262cbaaRNQmcKge+PZRtmzSvPN0VYWZofXp/oXLt+MOqMaAPVo1NeQjFKvyAz7NNLigHxlHGvaWFOY0CUK0Am2gOW7ydB3d/wNwkr7Y/MNisANbDuBjebtYkbg+89YSLbs6Zv2Utj4+U4rrVtV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=softfail (sender ip is
 158.140.1.28) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=cadence.com;dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVDfzCzQ3lVqe+00bZH7dJJOrAvOD5pmcX6YMI8FP1g=;
 b=GEHKC0BtKv9jDr5AbMHwOptBi4BhSIx4H94WDHm8DrO3FUsuwKqmpofjBhPNVdxP2ojxHXhejMSlJ+CcKRCm9iB8w+pEqkBmHLYXAKTnhUIK2UuVYqVgSuQpxAJmBVrEotC61ycmfa9CFRuR/MJWz1D9FW8wjlQhhz7PpnUwpE0=
Received: from DM5PR07CA0031.namprd07.prod.outlook.com (2603:10b6:3:16::17) by
 SN6PR07MB5102.namprd07.prod.outlook.com (2603:10b6:805:6b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Thu, 18 Jul 2019 11:15:26 +0000
Received: from DM3NAM05FT016.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::202) by DM5PR07CA0031.outlook.office365.com
 (2603:10b6:3:16::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.11 via Frontend
 Transport; Thu, 18 Jul 2019 11:15:25 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM3NAM05FT016.mail.protection.outlook.com (10.152.98.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.4 via Frontend Transport; Thu, 18 Jul 2019 11:15:25 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id x6IBFMvC021080
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 18 Jul 2019 04:15:23 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 18 Jul 2019 13:15:21 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 18 Jul 2019 13:15:21 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x6IBFL7d030005;
        Thu, 18 Jul 2019 12:15:21 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x6IBFLrI030004;
        Thu, 18 Jul 2019 12:15:21 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jan Kotas <jank@cadence.com>
Subject: [PATCH 1/3] media: dt-bindings: Update bindings for Cadence CSI2TX version 2.1
Date:   Thu, 18 Jul 2019 12:15:07 +0100
Message-ID: <20190718111509.29924-2-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190718111509.29924-1-jank@cadence.com>
References: <20190718111509.29924-1-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(2980300002)(36092001)(189003)(199004)(24433001)(7636002)(305945005)(8676002)(26826003)(87636003)(6666004)(478600001)(356004)(2616005)(51416003)(14444005)(446003)(186003)(26005)(76176011)(11346002)(246002)(126002)(50226002)(486006)(426003)(336012)(8936002)(54906003)(110136005)(16586007)(316002)(42186006)(47776003)(2906002)(476003)(5660300002)(50466002)(4326008)(76130400001)(86362001)(70206006)(70586007)(1076003)(107886003)(48376002)(36756003)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR07MB5102;H:sjmaillnx2.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:corp.Cadence.COM;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f59e65dd-48dd-46e7-8caa-08d70b713bcd
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:SN6PR07MB5102;
X-MS-TrafficTypeDiagnostic: SN6PR07MB5102:
X-Microsoft-Antispam-PRVS: <SN6PR07MB510293CD28DA25B28B05B305D0C80@SN6PR07MB5102.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 01026E1310
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: yRacILCp9SK6Zv4z+jBNssgKKFK5wTKrk4/gW0CBLGmIHdfi6KF6NLNIl0aNaf/aCcdeO+IMdoGDseth/WelWhb1BZR4CJ+dBN0OFOYdrzJFXOmpPCV8b8z+p8wGpOhdTMODo/V0ysTW/EJ7rUrcC+mXX1oDZBrA/mmfoT3rQZGvwCE28vPHSZk5TFbq/pNceiFQf6F5lbKL8UktoGkoXC3In5ea8oX2wrG+4jdGdS9D4g1rW5bY+TWqwgx7ZTqAlTQyKjYpBu+CUvOND9zT18IxkNBbF+q23GGL0re6PE2VRT44sVa4p1altAwZl8buhABiSCi3HpNVCrzD4ju5iJ5Agif4iLuYlYJjrtee9bQ3tVC69L9I4HN5rcfEG5dcp+K8IQgR3KzvAXZ9GSNJL+m/W2heTtGbCnumqp/0Nd4=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2019 11:15:25.4387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f59e65dd-48dd-46e7-8caa-08d70b713bcd
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[158.140.1.28];Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB5102
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-18_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=883 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907180122
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

