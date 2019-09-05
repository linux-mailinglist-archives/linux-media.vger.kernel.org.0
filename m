Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90948AA09B
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732763AbfIEK4k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:56:40 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:8330 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731857AbfIEK4k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 06:56:40 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x85AsLC2009041;
        Thu, 5 Sep 2019 03:56:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=4jRxWKIl34Qkr4JqdEPNR1IrsEWr0gzER19vmDKZ8wc=;
 b=g6O8P61Kwuf92/7xDTBEzY1VbC6TwLdersoc4hBVfXKhC4FepwK3CkOQBZVCo9kwcNbf
 NOV07JOKgXdv5c9dzNupEWDRSj0r+MHPKUgFPzFavsmZwPxjYlZeCdYhX6DocR1zkgaK
 WPEczOf779TQ6rNCXlJua+ciAXeSwxfvApREib+hlXDPuZvw+8H/doA/77U8kGhRQJH8
 /9B+4y5A76cvOajpZTA9Z3RW+qYXiQhZ5BS2kK0QqasKHXi+C3jNywR6gqDV9qgyDlpR
 d9wTcHhVtBVvnkq8gX1ch6bFV7dEPNamlxHwv/uvPCYGJA6Tjdq5L8gsBwS9isu0VdcU Uw== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam04-co1-obe.outbound.protection.outlook.com (mail-co1nam04lp2055.outbound.protection.outlook.com [104.47.45.55])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2uqmfvvx45-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 05 Sep 2019 03:56:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vt5N0BFmO6F6+XfywI4NQ/7O9Qz81s9Zlg13HFGzYnk9rELazAhUSErkbCn9Wi4CcUroS+YXPv08F3s4rEXcouMNyVUbDxM9pojJsBRqM2FcOvwYCUvYOREyxLiXNrunGpbrSS83O8vC9Wq20w8DAhCZib2Y+Ay/w5lpl1XFMcM4ESrB/B9NfK70x+Of2ppZYXBO5F92uiUSQH45VLV0TrazA7nt5qY6IRu6s/RsC3NEjzHfyTtrb6RmRdKoywt5nb5C2o+9TePbQbd/DsX6WmlFT6Lv/geG/HCn7DndJ99vJUtiUNVI5TIWR8dLoa2UWg1new7xeuA3hAJnjXUzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jRxWKIl34Qkr4JqdEPNR1IrsEWr0gzER19vmDKZ8wc=;
 b=OGJc2oGNYw0SNrmBqdo1sqdoMSFgrPQ6LbLJ0VyNkCYB0tLYE63PXZ/NN4cG2CeCpzhA+8iFdKiKw7F4wJPEpXONTlkXHqu75BhWuDkdNWuneFzYJz4HDaS6AdGjryYtGEiptIVcnvyGWgwMOzMjwl8xkt8SAOKdkHjGvcQzmkkkXTw22tJ7sbg2achT1JZbRQr8eiJ9S0UA+bygqoRkWbIdXKj5VlsBo1okNGLTrhRIVDRnB8EaTqcq17Sr9lKAr+aUhVnrSqRJGlrN4+73Mz3nXObedNDwlxMPT9ummCUXG+HrxpmAL+QueFL2f+stqBfg7RGTsblRJHWBlpy+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 199.43.4.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jRxWKIl34Qkr4JqdEPNR1IrsEWr0gzER19vmDKZ8wc=;
 b=vGEZeEbwe4F7INt2hslcb3IuGoeCs+fJwdoSOjEGpytTWm+jaliUyrXZaKmQZSlCCp7vZ6oS75OfjtDHjYgK7Pvc0Rcyo9pzMSlvCFE2PhwdCC/F/88zSPyV9Jl/FbhoL6dy6ZpperMPy36sriYnUFHO0i9Cg/+wzD6sW/AUJRw=
Received: from DM6PR07CA0027.namprd07.prod.outlook.com (2603:10b6:5:94::40) by
 MN2PR07MB6448.namprd07.prod.outlook.com (2603:10b6:208:159::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Thu, 5 Sep
 2019 10:56:27 +0000
Received: from CO1NAM05FT064.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::204) by DM6PR07CA0027.outlook.office365.com
 (2603:10b6:5:94::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14 via Frontend
 Transport; Thu, 5 Sep 2019 10:56:27 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT064.mail.protection.outlook.com (10.152.96.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.6 via Frontend Transport; Thu, 5 Sep 2019 10:56:26 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x85AuLtK025588
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 5 Sep 2019 06:56:25 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 5 Sep 2019 12:56:21 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 5 Sep 2019 12:56:21 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x85AuKo9027144;
        Thu, 5 Sep 2019 11:56:20 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x85AuKMT027143;
        Thu, 5 Sep 2019 11:56:20 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <rafalc@cadence.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 0/3] media: Add support for Cadence CSI2RX version 2.1
Date:   Thu, 5 Sep 2019 11:55:58 +0100
Message-ID: <20190905105601.27034-1-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(2980300002)(24433001)(36092001)(199004)(189003)(87636003)(76130400001)(2906002)(476003)(426003)(14444005)(486006)(2616005)(70586007)(126002)(336012)(70206006)(86362001)(47776003)(4326008)(305945005)(26826003)(51416003)(107886003)(5660300002)(478600001)(50226002)(186003)(26005)(36756003)(6666004)(50466002)(356004)(110136005)(8936002)(54906003)(53936002)(42186006)(16586007)(316002)(1076003)(8676002)(48376002)(81156014)(81166006)(4744005)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR07MB6448;H:rmmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:InfoDomainNonexistent;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98cda3f7-81f2-47c3-0111-08d731efb34c
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328);SRVR:MN2PR07MB6448;
X-MS-TrafficTypeDiagnostic: MN2PR07MB6448:
X-Microsoft-Antispam-PRVS: <MN2PR07MB64488CFFDAE38FB48FF4AE81D0BB0@MN2PR07MB6448.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 015114592F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: j7XbaV8VkK55juJ/CuKGyFtwDHQKAqM6NeFKCzl5F8Spv+dhS30qHv+8lxtkIHyiWTeswAFBMWC/QvEhDQzzL8TE/sOeSwm06BZACJzklPYYOTLRvzcQiGstxntSm/XGfL4Kcsi9qXVw+Z6gIClc8ycC1UsiCQv+Sjeew41jpQY4iPBEjD/lawOmpl+xsvA+Ng0xu370jKCnofdte6PlWPrlS6EkB0W10nnPogCNYNMlJ8TZaPRhC9KlwYQ1W3+J8lAFDV9aSFEfyD6AUhqYxReBaCDqZlZwobeBFvAJZ+u+AK2CU73vQEpKnOMnPhpJtLvUr7NxqGQp60Q5vgQs+9WmKNPJtWQu3hTvfSXoGdFd7+6DP8PFr0GR2WQruwa6STU11SnxKHscBrLA3sBlCDaeIR2pk4SCmMycwhrEP9I=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2019 10:56:26.7689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98cda3f7-81f2-47c3-0111-08d731efb34c
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.28];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB6448
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-05_03:2019-09-04,2019-09-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 phishscore=0
 adultscore=0 mlxscore=0 mlxlogscore=879 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909050110
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset adds support for Cadence CSI2RX controller version 2.1.
It currently limits maximum amount of data lanes to 4.
Existing compatibility with v1.3 is maintained.

Jan Kotas (3):
  media: dt-bindings: Update bindings for Cadence CSI2RX
  media: Add lane checks for Cadence CSI2RX
  media: Add support for Cadence CSI2RX 2.1

 .../devicetree/bindings/media/cdns,csi2rx.txt      |   5 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       | 152 +++++++++++++++++----
 2 files changed, 131 insertions(+), 26 deletions(-)

-- 
2.15.0

