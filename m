Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B32086CD31
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 13:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbfGRLPj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 07:15:39 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:52262 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726495AbfGRLPj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 07:15:39 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6IB1lAU002160;
        Thu, 18 Jul 2019 04:15:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=nNeeWGyjDjkpj96sq05BoMg4MSFEXTIwAQtyQ4v0G1Q=;
 b=ThpZJanX1QVHzpyIeyrdkoheezXV1KR+Wlnsnc9n1WEIu5mFiN7mYlo0b1H2M8g2K0Ca
 fGjrVxABbcuLR0t3wNcXkvPayj35H8zBQX+wvl+CHfrLRGE4iitmqKfpcHmk1wqKYlnp
 b1qxGMP7F3r4mXzhD2pJHz5a6/xM0EJdT9PSAA3t5oX8CNWihwcBNAbRrYVI0f4RRcdM
 nYnRFRX7YXMTFavVtbBALXvPi57f2LmClJNLuhhI9C2kHDjUfnIk2Ksos2S20398HsHC
 V5WgRAutjtHVS7nkjpy18bfQaSfmS6ZfWPDCULdnIkh/R5u7QBk8uYR94gqTnuXjaaAh mw== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam03-co1-obe.outbound.protection.outlook.com (mail-co1nam03lp2053.outbound.protection.outlook.com [104.47.40.53])
        by mx0a-0014ca01.pphosted.com with ESMTP id 2ttm8u0pby-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 Jul 2019 04:15:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbzMQealnm0LNPjate3Bh+MgB6EBLJy+rV1Oy/LO82eidlrau9evMxepKZh6BDF8iOkTOoW6m3qxg0G0pdBP1exqb5o1d0nV3sJgskKS54I3RoaZggPSaeMd5B0eZF1hUXiJWVs43eKV9KNnOFSfoKC4uj6sg6Q5+DtxZBpuc2zJ5iHwDvfYRwYGRm3Ru1Ho0+43PTAu974P95ih+hxVngMDnWSYbtCjHA8acu3QCwB34E/BrDMPsXUBY62KOl82rwkdemSiLcauDrSfFXuTWHi60cRicxCFrUE18tdOZQNl8rtW/AhBXZhq6iPQkXoi9VVf2Yx7qpdSVesiheTNzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNeeWGyjDjkpj96sq05BoMg4MSFEXTIwAQtyQ4v0G1Q=;
 b=P4VAx9tfkkd1XN1cU0P7DZc+ykjXGmWmDPRgE6Hlc+f8M4vuIi0WkhSbpl2ly+Rj8hdbWRsPE34DMK0+Cx8x6z7ZLE0HBLOjQRoFMn2Y1NjdYjjUBCEZvtPMre7hHr4GEMqAkM5H1yy8P225/fOUkiW4Viz7SCi4YyrK3LxdddtEl+UlhQg8SlM2JJ8h9264nNscVegJigVueVU0kwezHfrdoNrKnIQHUR2TcQ70i2sT2GEMz3294rslmyUo+fcM9xUTIQgpSBBcjhb6Y1kHklbYfyWfu6kAfo0owj6CWKex7Ssk+ZVJvlRor9Wza37DdCIstFDe2Q2ZE+fChJPUSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=softfail (sender ip is
 158.140.1.28) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=cadence.com;dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNeeWGyjDjkpj96sq05BoMg4MSFEXTIwAQtyQ4v0G1Q=;
 b=OQqImQrjhGcA1/GwyI7PER3gRSf0X2aGf18Fo7gik4hDRuCQkciEx3kxmIAB/QT853teA8Ay9C4b1iGqWQL4AVrjlYH9SQ2L/EvGcra5hnUEaIuRGflzWtd+Hz7uN6G/jxYUtvsEvabhdO6bd9wzom41gr0knf2nylzgJTrbvn0=
Received: from MN2PR07CA0003.namprd07.prod.outlook.com (2603:10b6:208:1a0::13)
 by BYAPR07MB5094.namprd07.prod.outlook.com (2603:10b6:a03:6e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12; Thu, 18 Jul
 2019 11:15:26 +0000
Received: from DM3NAM05FT064.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::205) by MN2PR07CA0003.outlook.office365.com
 (2603:10b6:208:1a0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.12 via Frontend
 Transport; Thu, 18 Jul 2019 11:15:26 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM3NAM05FT064.mail.protection.outlook.com (10.152.98.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.4 via Frontend Transport; Thu, 18 Jul 2019 11:15:25 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id x6IBFMvD021080
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 18 Jul 2019 04:15:24 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 18 Jul 2019 13:15:21 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 18 Jul 2019 13:15:21 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x6IBFLB6030001;
        Thu, 18 Jul 2019 12:15:21 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x6IBFKC4029997;
        Thu, 18 Jul 2019 12:15:20 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jan Kotas <jank@cadence.com>
Subject: [PATCH 0/3] media: Add support for Cadence CSI2TX version 2.1
Date:   Thu, 18 Jul 2019 12:15:06 +0100
Message-ID: <20190718111509.29924-1-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(2980300002)(36092001)(189003)(199004)(24433001)(1076003)(16586007)(356004)(246002)(86362001)(316002)(76130400001)(5660300002)(4744005)(8936002)(54906003)(42186006)(8676002)(50226002)(70206006)(6666004)(110136005)(70586007)(36756003)(7636002)(48376002)(336012)(426003)(50466002)(4326008)(107886003)(305945005)(87636003)(26826003)(478600001)(2906002)(51416003)(47776003)(14444005)(26005)(186003)(486006)(2616005)(476003)(126002)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR07MB5094;H:sjmaillnx2.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:corp.cadence.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8600224-911a-464d-eba9-08d70b713c07
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:BYAPR07MB5094;
X-MS-TrafficTypeDiagnostic: BYAPR07MB5094:
X-Microsoft-Antispam-PRVS: <BYAPR07MB50945E1E6994F5ECBDA956A0D0C80@BYAPR07MB5094.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 01026E1310
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 00HGzaW3dFp8DZQq1Q8LF0sMFfUuz5Q/xahkgXZPnjHVditcxMIKnPnh17PQXLBIWPF/JX4r6E8ITcqF06rvWg803Ktu3s94NB2lYSbyJ0QjaUhXIVs6vP6Y4PxxlHp96yF5386UUEV0HyBY+g43zltygC8dMgcfP2hoX9GkP6GdQ8/L43jMIYwK4+WPp7EoQLiWbKCVN13NEyDHiHMigNAwYZ8uHmS21zMxyLQvmSGKkyySeIKBzycICdm5gj2EPBC5El2T9ePM46B0tAxuWhOrOaOquriyNHslCJ37694hwA87pMz538DPJVped+ZMW7Lhu8M2hYypRsKwjEBJUBUQY5rfalJKqIID9JjRmphX8FI9r9Z7uUyW/mkXt5RD+i7fRGLFLUNAZ7T6FagccE7o9MqgSgY1jWwr6A0LQxs=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2019 11:15:25.8243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8600224-911a-464d-eba9-08d70b713c07
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[158.140.1.28];Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB5094
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
 mlxlogscore=899 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907180122
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset adds support for Cadence CSI2TX controller version 2.1.
Existing compatibility with v1.3 is maintained. 

Jan Kotas (3):
  media: dt-bindings: Update bindings for Cadence CSI2TX version 2.1
  media: Add lane checks for Cadence CSI2TX
  media: Add support for Cadence CSI2TX 2.1

 .../devicetree/bindings/media/cdns,csi2tx.txt      |   3 +-
 drivers/media/platform/cadence/cdns-csi2tx.c       | 155 ++++++++++++++++-----
 2 files changed, 125 insertions(+), 33 deletions(-)

-- 
2.15.0

