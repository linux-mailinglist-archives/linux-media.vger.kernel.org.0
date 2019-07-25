Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 558D874B81
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 12:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbfGYK1K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 06:27:10 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:65188 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726846AbfGYK1K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 06:27:10 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6PAQsXq025678;
        Thu, 25 Jul 2019 03:27:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=59ACLqm70PPujSya4PvicfeXzAcyGh4fxx2sLXUTfNM=;
 b=dTqeJeDoE3TxkNXSC0B5TuK1k7Sj+bIr8DmOHo25amjYDwAUPcRZk+RmpWhr7PBWrQq/
 PgDpg0c//K/5M55MoGtqdIetZsCYOAfFXCDzGEOK7pGcHzjfZwbtkw+8mTNoOh1ZjFYV
 zY7NnrZDQN3gqwFgz4b0Cl2PbzeCzlWi2LU8bPT4uE2f05Ofl0xzptpaKDaBPe4DMv1t
 x1r7BXnkd6lYK04qvQVAGmBeBoQ49QlxGOC2SKIMa1ddyQUWU8RomTm9sNUSgxIs8zSD
 HiS3vrMTaIgP+Fj9p/3ihAXxZwFRIkbEh3Qt5e9HnteQ0nglew3/vYCs1ORz4o/bikoP Hw== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam01-bn3-obe.outbound.protection.outlook.com (mail-bn3nam01lp2052.outbound.protection.outlook.com [104.47.33.52])
        by mx0a-0014ca01.pphosted.com with ESMTP id 2ty9h4g7n5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Jul 2019 03:27:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVggWy4rHQvzUXX4W020LwmW9ss6ahg1AWV4zKN9O/FT6TlU79a5cVAECzG11C8L8qFh3Bvvtc15IwY91qGMxVM/a4DdL/5YPirLmjBnnjYH6/gQuWhKZQCDa0vAgWcXpr4Sf4wEuxn1FA1XQHopQPQff4waaaCXjRxQSdCnbL2vZEDx2u/FLf1ERJKprAKZCYS80qPeGxF4VWnZs7rKYkcZ9jmKmtt3f0KCYudYBLEfeVI5Z0C5KJpKmOYXEVOHoDApSHZ8Z+BDlOThqtGRp2eB+zr5o5wB+sHXIwR4QmCN7rkk6Q63iPMhK+EZUtq4AWgZeGRmDjg/T/+TqJcjsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59ACLqm70PPujSya4PvicfeXzAcyGh4fxx2sLXUTfNM=;
 b=NxrFpqQwP5bbvZx83CZKvXxzsnfLPsbnCo6G6EnOBcjlSmjAMltE6NngdMRRlxh3N68t85LgNWn36rfWc8N/TRkTGePzf63vykYIIQNHGmCYcGxXsIny8X0CLnFgv7g1vsyC6iJwb3MWwTBxS6W1ZondY/XcUfkr3Vf9CeRDR/d/d6onQbE/rnze8+2mqcIzAIJSU9abd03ubzZqHYRy+u10I/eRcgb5dme++YvIFxCWs4b8gABk7W0NP7aLimzlXtexJ+UfvlzvEO870kTa9WVkEM95FNin/lXAXXWWLoReMKZAH/YcT4YT49Y5gwTDyEE0vmn2bIVTX0dhniP09w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=softfail (sender ip is
 158.140.1.28) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=cadence.com;dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59ACLqm70PPujSya4PvicfeXzAcyGh4fxx2sLXUTfNM=;
 b=FJCN4+il/rEFu5n7nd6wu6nUc2ltZFIA4mfXgtJEXodrb0jxOLcOTk0ID0/Qyv+09evMGiPanWJR62VVBH3w81b+pLY6fzIJz1obdX7q23azrm+n7zgj7AfGMdUKniSH0DqwurMbmgP0ClqxTcfyOXDD8fR9eR9VJ1NG/3wdWCc=
Received: from CY1PR07CA0005.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::15) by CY1PR07MB2490.namprd07.prod.outlook.com
 (2a01:111:e400:c63a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.13; Thu, 25 Jul
 2019 10:26:59 +0000
Received: from CO1NAM05FT060.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::206) by CY1PR07CA0005.outlook.office365.com
 (2a01:111:e400:c60a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2115.10 via Frontend
 Transport; Thu, 25 Jul 2019 10:26:58 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 CO1NAM05FT060.mail.protection.outlook.com (10.152.96.178) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.7 via Frontend Transport; Thu, 25 Jul 2019 10:26:58 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x6PAQsW1025529
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 25 Jul 2019 03:26:57 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 25 Jul 2019 12:26:51 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 25 Jul 2019 12:26:51 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x6PAQpwZ013588;
        Thu, 25 Jul 2019 11:26:51 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x6PAQp2r013587;
        Thu, 25 Jul 2019 11:26:51 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <rafalc@cadence.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jan Kotas <jank@cadence.com>
Subject: [PATCH 1/3] media: dt-bindings: Update bindings for Cadence CSI2RX version 2.1
Date:   Thu, 25 Jul 2019 11:26:46 +0100
Message-ID: <20190725102648.13445-2-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190725102648.13445-1-jank@cadence.com>
References: <20190725102648.13445-1-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(2980300002)(36092001)(24433001)(189003)(199004)(305945005)(336012)(11346002)(2616005)(476003)(126002)(426003)(446003)(356004)(6666004)(48376002)(486006)(186003)(76176011)(26005)(316002)(51416003)(76130400001)(5660300002)(70586007)(14444005)(50466002)(70206006)(107886003)(4326008)(86362001)(1076003)(478600001)(87636003)(8936002)(26826003)(50226002)(8676002)(246002)(2906002)(47776003)(42186006)(16586007)(7636002)(36756003)(54906003)(110136005)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:CY1PR07MB2490;H:sjmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:corp.cadence.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5efa523d-8efb-46e5-725c-08d710ea9fe1
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:CY1PR07MB2490;
X-MS-TrafficTypeDiagnostic: CY1PR07MB2490:
X-Microsoft-Antispam-PRVS: <CY1PR07MB2490998B6D018820D9535498D0C10@CY1PR07MB2490.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: EfA3Qr04gsiunMs6x0nRP/OAx4yZfTkfVmNb+ojan1d5ZfQ6vvRYUMMyU+WVcP6e0OQoKs/bebvT7R5y/d6lglvOOmgEIYK6JOkWTDFDwPHWEdjQDHVDF8UeeWZFr1trI1lRsDNlF/Ylc7L3pery+Y/PxLp/YupVI+r3RgMqW8Qmmy4U3z/V8dTCkRoiWZiPFugvCShRz2QlkTw9isHabCnlvEkANPnMKW1r0BlaunE83cXbLGguDyRYKHfqRvpafa+mnp74VRD+N9u8ULoBvM5Wia/CdAkO8O29qxa5fiLPhIJeSQ1N1Pf2xcZ5MC2/CtHK24hAs9fzXNKLpRtYBaWahX/5a8BbwNeeSDN972vk/CMNVzflCqbW5fmEmUipgEx7SRl5s2GcoK7B9Td0DJiluEi8I4fyVpOJzONylyc=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 10:26:58.4516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efa523d-8efb-46e5-725c-08d710ea9fe1
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[158.140.1.28];Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2490
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
 mlxlogscore=860 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907250126
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds a DT bindings documentation for
Cadence CSI2RX v2.1 controller.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 Documentation/devicetree/bindings/media/cdns,csi2rx.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
index 6b02a0657..a35bb0aed 100644
--- a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
+++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
@@ -5,7 +5,9 @@ The Cadence MIPI-CSI2 RX controller is a CSI-2 bridge supporting up to 4 CSI
 lanes in input, and 4 different pixel streams in output.
 
 Required properties:
-  - compatible: must be set to "cdns,csi2rx" and an SoC-specific compatible
+  - compatible: must be set to "cdns,csi2rx" or "cdns,csi2rx-1.3"
+    for version 1.3 of the controller, "cdns,csi2rx-2.1" for v2.1
+    and an SoC-specific compatible
   - reg: base address and size of the memory mapped region
   - clocks: phandles to the clocks driving the controller
   - clock-names: must contain:
-- 
2.15.0

