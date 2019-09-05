Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7399BAA099
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387613AbfIEK4k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:56:40 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:57344 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732175AbfIEK4k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 06:56:40 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x85As5Wp008971;
        Thu, 5 Sep 2019 03:56:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=fl2qfzDzlii41ljTMqPY/YmoUfD/06SxvGSv+4k8UMM=;
 b=WScxBF/BrrIHx8LM2jJ27wBbY2xm3UPqFOQ44Kde1AVFmgkT7/xJuD9g4D17OeM7dHe5
 eEDcX+ie0cANLs3OKLmAFauPv+d7tRjJXcvPR/g0GJdkJ8kRnVy+A5ZkBCaKU52F6VCj
 YQ0fh+iLlS0vdjkK0Z4qkqtyxjALrujMYEhAN9PFL1ZNdAxzmKGErGjpu4lNifokr0YG
 QNgHJe2PEJcBbiRg2xxAvWB73EfCrqTvH92mxb2EwxpVeGUEu5Amfy6y57uGxU9zwQbp
 Efz6IswvwSICh8GVTU+/EfIHNV4Xq9Ne7BcAzHoTK0r6bNzeYU4QoaoqANu54bYRhdlF Tg== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam02-cy1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2058.outbound.protection.outlook.com [104.47.37.58])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2uqmfvvx48-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Sep 2019 03:56:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecQ6UzY9CtThz4zM9n5q7pVECiR4vsIkee63kz3EbqyVZqBv+NubHJAU6byC9+fMCOkIJLH1F3J+Ncsk6NGFRoNBa6UOWD3qbmTltGhKlT6/MNdNlWpqAQeWjFQh/hlrABX54WcuNFT618wIlfHtEmku3a7Ho6Tu+zET8nGgU1Ae7SqhUdrAISOrAN6/JCQqrQwIAdQOC/FQMdM2bRONUDg1FDIsBIaJaQbvOe4wyYCWaL1rF97VKQdZpzG2eqiyqH05TaLN58I46MOa9HGUoDt406S4ennR1++A1/6lBDTLt+zptYWN49TTiY5O1RyCpOAdgUETFGUpq0j8uGtt0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fl2qfzDzlii41ljTMqPY/YmoUfD/06SxvGSv+4k8UMM=;
 b=YcrczU9el7UhMTVxWI3qd51ZBKwo52VFwthVmJUtOFzqpG5EvVPjgCqRaUAGMV8XVrVGrpq75y0+W3yqQ4kYv3yi62ZtkoUcrhqFa4wUvPss7NcZ+h4gwI3/lzCjIAKdC7rI+smNszsqgKrERro79j07udepKE3RlrXxNW7NO2FtshmerKQOJBmAxZFqQeA/zoewfQihAZH80n/1nlxvKfI7ztKYLOxOiS4dXQSyExG8WW/LrA3TI21revgLD3fyeO0vdRePsMS+QXqHAx72eWEi44GIUJRffVSO3ktX8vO/zUV8b4vjZFNfNG2cIVDGJwHoK8fsPJBW4j/84mKLfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 199.43.4.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fl2qfzDzlii41ljTMqPY/YmoUfD/06SxvGSv+4k8UMM=;
 b=tOZDLOpeYr8GBKJ3qdv595gIwZQRn5ChW7/fD3JZK8MSOW6v5B+OqpM96K36L7VZzKYbqopmu1LSHJi/PFVKYvTqRfa/8Ookw4GT+L5vq+xbUFaEs0KIrTuq1um4G8/G+9zlyloNXmM/v7zEMZI1RkDJCtMeZTaWSVPSV9UiViM=
Received: from DM5PR07CA0096.namprd07.prod.outlook.com (2603:10b6:4:ae::25) by
 CY4PR07MB3590.namprd07.prod.outlook.com (2603:10b6:910:76::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Thu, 5 Sep 2019 10:56:26 +0000
Received: from CO1NAM05FT007.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::202) by DM5PR07CA0096.outlook.office365.com
 (2603:10b6:4:ae::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.13 via Frontend
 Transport; Thu, 5 Sep 2019 10:56:26 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT007.mail.protection.outlook.com (10.152.96.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.6 via Frontend Transport; Thu, 5 Sep 2019 10:56:26 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x85AuLtJ025588
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 5 Sep 2019 06:56:23 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 5 Sep 2019 12:56:21 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 5 Sep 2019 12:56:21 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x85AuKf1027149;
        Thu, 5 Sep 2019 11:56:20 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x85AuK15027148;
        Thu, 5 Sep 2019 11:56:20 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <rafalc@cadence.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 1/3] media: dt-bindings: Update bindings for Cadence CSI2RX
Date:   Thu, 5 Sep 2019 11:55:59 +0100
Message-ID: <20190905105601.27034-2-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190905105601.27034-1-jank@cadence.com>
References: <20190905105601.27034-1-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(2980300002)(36092001)(189003)(199004)(4326008)(2616005)(48376002)(446003)(476003)(126002)(110136005)(54906003)(16586007)(316002)(42186006)(426003)(50466002)(11346002)(51416003)(486006)(76130400001)(6666004)(356004)(47776003)(5660300002)(26826003)(87636003)(478600001)(14444005)(2906002)(107886003)(53936002)(70206006)(70586007)(36756003)(26005)(186003)(336012)(50226002)(76176011)(1076003)(81166006)(81156014)(86362001)(8936002)(8676002)(305945005)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR07MB3590;H:rmmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:InfoDomainNonexistent;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7e143cc-5802-4784-c34c-08d731efb2e8
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);SRVR:CY4PR07MB3590;
X-MS-TrafficTypeDiagnostic: CY4PR07MB3590:
X-Microsoft-Antispam-PRVS: <CY4PR07MB3590368315A0630B9EA1F2E0D0BB0@CY4PR07MB3590.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 015114592F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BbSRlIFYp7/DmRpNbk9RV5wZi7fgmzu2Netl5/YmDeFulg+/K/8MyZeJ9IbH2BzfEiMYUlrrGu2mt4uJNZGS2+NLb1rBGV5q4JucwAw2qHKPZp1IX9QnL7ojI0rgOs5QsfRyzmRsKPI8WE7dKL4GtHWlT9JHWwqaWo7JVhMPghGMQ2UIeG1GH0opBC5mfgh9HdvPoUZScwKzcbP9R2+9FLe6M83ZpFuf42VaydZN/mwcFZSBQ1kHAzcrtQ7P5MDbP/NOM2HpZ6ZJ4hJc/uoS4xUOZQHt1YaraCy7XNpqB9r8b7auGcqXGU/5o1B5rDXt2MZJqRyVirg43bP4fYYjUOpYX1U+hFg9JQFjs8WzwSsJ5Tp07/UhM3KWKKd6n1KKx21EZKY8h0nWD+K2tcu+57E2uGr+dJRq1V58fVWC99g=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2019 10:56:26.1195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e143cc-5802-4784-c34c-08d731efb2e8
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.28];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR07MB3590
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-05_03:2019-09-04,2019-09-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 phishscore=0
 adultscore=0 mlxscore=0 mlxlogscore=790 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909050110
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds a DT bindings documentation for
Cadence CSI2RX v1.3 and v2.1 controllers.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 Documentation/devicetree/bindings/media/cdns,csi2rx.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
index 6b02a0657..df828e4e4 100644
--- a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
+++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
@@ -5,7 +5,10 @@ The Cadence MIPI-CSI2 RX controller is a CSI-2 bridge supporting up to 4 CSI
 lanes in input, and 4 different pixel streams in output.
 
 Required properties:
-  - compatible: must be set to "cdns,csi2rx" and an SoC-specific compatible
+  - compatible: must be set to:
+    * "cdns,csi2rx" or "cdns,csi2rx-1.3" for version 1.3 of the controller,
+    * "cdns,csi2rx-2.1" for v2.1,
+    and an SoC-specific compatible
   - reg: base address and size of the memory mapped region
   - clocks: phandles to the clocks driving the controller
   - clock-names: must contain:
-- 
2.15.0

