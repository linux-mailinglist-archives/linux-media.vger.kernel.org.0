Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 504096FB33
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 10:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727605AbfGVIX1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 04:23:27 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:59566 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726944AbfGVIX1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 04:23:27 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6M8EfiW005895;
        Mon, 22 Jul 2019 01:23:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=VwR4oUbD99eMkbnY/k4NgjwH5Cen3lPi3+9ZXzAZklA=;
 b=mKRKVpyuguzhpwRrqgxAienxRVzfQTNe0qdVqH43zVVOAB72NG7zBn6fmvaGSiQRuIpC
 dHZ0mwnjPk/1BEMrY7MwEjz3S/JBF7N0n6908cfLqGKI8ST/rBM/bgegEspkdvQIpNxZ
 BvizoPMZtkt6p84MHqO4I61+9mUlPH7VNDLB2NGa09xrJ7ZHYk6MI4n/5CXXHRG1qjD5
 QDurKQg9AYW+EugTUTdHWTImGlCsJlmEuWNeBzdVvYDlLHW7w252qytPU9N/l5gj7oIh
 vmpMJYE1rnCQ0qxCk9qpRIikWSHy1Wqjx7Hdx0oci5H3xrpfWYkRPA3GQOCmkQmTzYOa 0A== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam04-co1-obe.outbound.protection.outlook.com (mail-co1nam04lp2053.outbound.protection.outlook.com [104.47.45.53])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2tuxhwe22x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 22 Jul 2019 01:23:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8JdQpJmnq++HafI5oHQJ0CdWUJTqzOa3CKu1ZRNqRaFJxetOtkKFdoZoWGyIbgxmmUB3mx6JH17534jj+35P+hG+bBSngB/eF/pzcdayBguiHMIaNxB5Wc9rqZrNlyc8i5JZPaKsM6Zj8GdKrqhKzDiG50vimVW7aBomjAAzthE0KpEmDVn85pGAmorHOTRBulfIxsJd+YdKZr945eTwSoMugMhKT6oSgDLFykEIFlorO+ZGJMVSq6HzGNtf+yxojjOtth/j7h1cF2W/a8hdBzkgUUyYSTcpngvgUkZmblDneE+V+r2/ZuGK8Ujd6wPGdxu64kyL2CWqMpaOQqWOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwR4oUbD99eMkbnY/k4NgjwH5Cen3lPi3+9ZXzAZklA=;
 b=bDfPLQJN2u1vHJwjjMjgZc5b571lHfpvlLwvPolzNVS1NvAfvxkJr0NHRJ5Bd9yvmuLRul5c24HBtkpuCQNx7x1+6ncXVwdRXlOYp9p/H102WSPTfbKO18rqZEN3IkHdJCVgrVKnU3hWzFI6E5zTMIuGNFCgvHGtOvEkQATCdJ9l8VahzfOi5CAp0TLXnU2mHoLehoSEJKbMGEYLePLycg3lP9gbGrLrv1f9+mcaRPQFh7Z5uFNkYxb2QaV4goietpVBjSI0rDZSt7/5G6nICa8wxd5VtrR4GABoXbDi1inHrnHc2IQ08yDAvmYLUJ9O4N8nXX25Z42+ZQ0gckzwBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=softfail (sender ip is
 199.43.4.28) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=cadence.com;dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwR4oUbD99eMkbnY/k4NgjwH5Cen3lPi3+9ZXzAZklA=;
 b=k6Myj106GqPsU9lyu9qvhsKR4Gcm13VJ+kE+qjWdDbHYr8bwPgT1iQgsmCaAiygQabH3oSDl1Z784NtZfzx6bkjG32/VMuaBuOQCqecytnxqjkCrqzHFASjzb8Ev69LRaqSC7hRvmM1+VGL+9B28NkCDU0D1HQ/tsEnMt6blIx8=
Received: from SN4PR0701CA0042.namprd07.prod.outlook.com
 (2603:10b6:803:2d::16) by DM6PR07MB6523.namprd07.prod.outlook.com
 (2603:10b6:5:1c3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.14; Mon, 22 Jul
 2019 08:23:15 +0000
Received: from CO1NAM05FT057.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::204) by SN4PR0701CA0042.outlook.office365.com
 (2603:10b6:803:2d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.11 via Frontend
 Transport; Mon, 22 Jul 2019 08:23:14 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT057.mail.protection.outlook.com (10.152.96.174) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.4 via Frontend Transport; Mon, 22 Jul 2019 08:23:14 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x6M8N8D9007762
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Mon, 22 Jul 2019 04:23:10 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 22 Jul 2019 10:23:08 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 22 Jul 2019 10:23:08 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x6M8N86v019009;
        Mon, 22 Jul 2019 09:23:08 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x6M8N7PE019005;
        Mon, 22 Jul 2019 09:23:07 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <rafalc@cadence.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 0/4] media: Add support for Cadence CSI2TX version 2.1
Date:   Mon, 22 Jul 2019 09:22:19 +0100
Message-ID: <20190722082223.18693-1-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(36092001)(189003)(199004)(24433001)(110136005)(51416003)(336012)(305945005)(426003)(2616005)(476003)(126002)(54906003)(478600001)(26826003)(186003)(36756003)(70586007)(70206006)(8676002)(4326008)(26005)(81166006)(316002)(81156014)(16586007)(42186006)(87636003)(5660300002)(76130400001)(50226002)(1076003)(486006)(69596002)(6666004)(356004)(107886003)(86362001)(4744005)(68736007)(2906002)(53936002)(47776003)(14444005)(8936002)(50466002)(48376002)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR07MB6523;H:rmmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:InfoDomainNonexistent;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa1324b0-436a-401d-75f1-08d70e7dd76b
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:DM6PR07MB6523;
X-MS-TrafficTypeDiagnostic: DM6PR07MB6523:
X-Microsoft-Antispam-PRVS: <DM6PR07MB6523D3358F1F8E1180F29E7FD0C40@DM6PR07MB6523.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 01068D0A20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 9IgoLuqGolQM0JZBYzuCyQmu6Du57kA9IOa0evHDBcMzjqEesF9ESVczwanYzBJGBf+Ri1M2/Wmo25MwZYIDfm1y1H1oGuLz1bNddB0udKZfZpztyuEkW0suBNLz2tz+6ESwUyXL2/Pjt1yZy5FKSHazAm2zMYKcjMKDJNXhtfLuzJlc76Pjg/VpsXX8ZxGtj+QdDQhoDebyTip9gGVwqCoHn2i/zmtZ+IYzkivFESj9f1qfkJg3u6cJw4DjCVI3WEzPJrx0vpgfv5L0tvazt2UDafqhd680mCeDs3JlDPxDFiGEaemAZkYm7FETJd6AqhyWUn8Gopeu5O349SjApVzDOQq4DSuqxRWo/FeCiPs+x8Cgm5pVLN6RUdVPor/QxTUhR0yNMX2TR68XmpNxK//U7JJnFCFLcMOoZgtxNeE=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2019 08:23:14.0356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1324b0-436a-401d-75f1-08d70e7dd76b
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.28];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6523
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
 mlxlogscore=985 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907220100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset adds support for Cadence CSI2TX controller version 2.1.
Existing compatibility with v1.3 is updated and maintained. 

Jan Kotas (4):
  media: dt-bindings: Update bindings for Cadence CSI2TX version 2.1
  media: Add lane checks for Cadence CSI2TX
  media: Fix Lane mapping in Cadence CSI2TX
  media: Add support for Cadence CSI2TX 2.1

 .../devicetree/bindings/media/cdns,csi2tx.txt      |   3 +-
 drivers/media/platform/cadence/cdns-csi2tx.c       | 155 ++++++++++++++++-----
 2 files changed, 125 insertions(+), 33 deletions(-)

-- 
2.15.0

