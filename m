Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 049AA74B89
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 12:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728686AbfGYK1X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 06:27:23 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:8282 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727260AbfGYK1K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 06:27:10 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6PAQsqv025673;
        Thu, 25 Jul 2019 03:27:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=K8HVoSNZsU/N+XRICsBa9fhZmTLkAACfWF3rPk3SAog=;
 b=fJBAccqCe0HQgNQn/TiIT5i72nc7a5uvHd4YUQlttjwQx9Tx4p9ZhlAiycXBYXBkzXF/
 oS4F5oam87VWMLmuVhIJ1rj++MzSAOG1MOxGOmnAvcyFfS1MEsqPh2dE2wgQtT6vqWCO
 QykgvorlR+X+FRBJorm7zZwbj5iKvvsbNU8BXR1uHKhzRh1007tnx0nXe18MxQRXxXHS
 OZU9z+eAm5IqKcELXoJj487xrktlR8pHOKH0qv0I5A7cP0geNSc9MntLzU2uqimqnOuY
 tiFWdw5yHbvqaIk6M877eZuUvX7Iyl9XPI3qyH9yTOhlDaIvqA/rG3BSHALQ9nsbUm7w WQ== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam04-sn1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2057.outbound.protection.outlook.com [104.47.44.57])
        by mx0a-0014ca01.pphosted.com with ESMTP id 2ty9h4g7n9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Jul 2019 03:27:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FI3gMK8WXdLBtqIOrBziYRiTcA672v+1ou3xR2RIamxtb+hklNPog55H+AifnT98mpTag8rzamui18lRJKu0ZQ9FvuzZL8IQyGTJMQ68PyWjzTZlTO3Iw6NTH8Zk9w5AxecZWTs2Zzd6+mnXXQq4IetwOJFdWiXHyYjt3VjIqRmuiXkQjY4eS5+vlKNki07cdUnLXHQ0pLQXCY6Y5F8wE/T7A9uX8UibuL6whp/ng0so0KkRdRsaEfGEdNMdKBLUkB6uQJZcQrkqU02DHpUknDWUfwR59FhST4CjJPLyAhi30cdFQoGi+Gzsh6Mh+I62bNJsJM+GfvzF9C7Xj2gZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8HVoSNZsU/N+XRICsBa9fhZmTLkAACfWF3rPk3SAog=;
 b=e8rGvngGyDae8CZ0RJ6I/19DijM73NDwhmZFze5okddMSLj1fHbzPaxwHeZUTeHALUGi9Lod43TOb8KKdJt5kKESA97AUwKUz1U4qdTTRXZyqaAYoYHy+98ng3mqg29nTv+C/bX3JCQOTZMhq8TZEWlR4KWLOoeVMfBejNDaMQeQbPHFevYcLXEaZoKYQwl2fft8wvezVhbZlb5FzkdIklXN8VKyb1XAmA08flASMcAVfwvZIdHacMun0q2ys8K6LL+omomJZYSTEMuvZZp8e19v/Fvw+2rSszNP2CFwXv4zT/z2BMnJuKhmSA4HPC4OHCdaU39h8t4WYv0BFg2QIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=softfail (sender ip is
 158.140.1.28) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=cadence.com;dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8HVoSNZsU/N+XRICsBa9fhZmTLkAACfWF3rPk3SAog=;
 b=GEsus6KtsrVxeO+6E2elpCPBzw3R9LJf6Zj9gGq7xsU8zF8n9ONVwAEuws+AB4UjNMy/ISgil3TVZXjWHKJbsuGgnGDqR234rN1WqU9HGufypkBna8xMt3WoXl30bCqJXh6EW1PKU9g5UZ7BPFxdUx6u6gzMokQx6Q6UFo10ljw=
Received: from MN2PR07CA0006.namprd07.prod.outlook.com (10.255.232.16) by
 BN8PR07MB6961.namprd07.prod.outlook.com (20.179.141.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 25 Jul 2019 10:27:00 +0000
Received: from BY2NAM05FT021.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::205) by MN2PR07CA0006.outlook.office365.com
 (2603:10b6:208:1a0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.14 via Frontend
 Transport; Thu, 25 Jul 2019 10:26:59 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 BY2NAM05FT021.mail.protection.outlook.com (10.152.100.158) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.7 via Frontend Transport; Thu, 25 Jul 2019 10:26:59 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x6PAQsW3025529
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 25 Jul 2019 03:26:58 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 25 Jul 2019 12:26:51 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 25 Jul 2019 12:26:51 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x6PAQpi2013584;
        Thu, 25 Jul 2019 11:26:51 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x6PAQoKm013580;
        Thu, 25 Jul 2019 11:26:50 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <rafalc@cadence.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jan Kotas <jank@cadence.com>
Subject: [PATCH 0/3] media: Add support for Cadence CSI2RX version 2.1
Date:   Thu, 25 Jul 2019 11:26:45 +0100
Message-ID: <20190725102648.13445-1-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(2980300002)(36092001)(189003)(199004)(24433001)(26826003)(486006)(476003)(42186006)(305945005)(5660300002)(54906003)(110136005)(8676002)(316002)(16586007)(126002)(48376002)(50466002)(47776003)(426003)(4744005)(50226002)(51416003)(8936002)(26005)(336012)(186003)(87636003)(7636002)(2616005)(86362001)(246002)(4326008)(356004)(6666004)(1076003)(2906002)(14444005)(36756003)(478600001)(70206006)(76130400001)(107886003)(70586007)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:BN8PR07MB6961;H:sjmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:corp.cadence.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74e5deee-27c0-446d-6c5b-08d710eaa048
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:BN8PR07MB6961;
X-MS-TrafficTypeDiagnostic: BN8PR07MB6961:
X-Microsoft-Antispam-PRVS: <BN8PR07MB6961A3AFF3B85BF9406A96E1D0C10@BN8PR07MB6961.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6BrV52Wx8xk9bJ6LRB8gjlQ3fhuQW4JI9RgmCZh6sGWuLlA4RyNyFrKZf8zODjmCyncI9fIWZRwUHMze3Dbxc8wV1ZrUYx1fE+xh+S5bDmFVX5nTI7pa63HChKRSAyXD4bZX6MsyAytjtyV7VH/7WW2xYHnGI8dqIsG3lllNJ8p+wL1ZUTh8tpA8veWRt7/cTAiC3xdyfnTKJbI25lRbigtqi01fIjALju6KvQUpN5qp0eEw59j7BKuvNTFsEXVn/hhSyJkvHG8ybdxl7Zb1RyxDJSK+RkPiouZgPjOp5JDs4Atnth4UxCTvfRtR5+ZdjASOM1FvpSOA0x2kJAtVXkL9AEzVH7OxCLMU2NGp6Vit2TW4rl00NmLxf33BseZM8fBEvK/SwQwqvJaXkKEpTTNQrBC3j0J1SbV7yyq8/rI=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 10:26:59.3056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e5deee-27c0-446d-6c5b-08d710eaa048
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[158.140.1.28];Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB6961
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
 mlxlogscore=878 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907250126
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset adds support for Cadence CSI2RX controller version 2.1.
It currently limits maximum amount of data lanes to 4.
Existing compatibility with v1.3 is maintained.

Jan Kotas (3):
  media: dt-bindings: Update bindings for Cadence CSI2RX version 2.1
  media: Add lane checks for Cadence CSI2RX
  media: Add support for Cadence CSI2RX 2.1

 .../devicetree/bindings/media/cdns,csi2rx.txt      |   4 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       | 150 +++++++++++++++++----
 2 files changed, 129 insertions(+), 25 deletions(-)

-- 
2.15.0

