Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDEB46FB34
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 10:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbfGVIX2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 04:23:28 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:9200 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727092AbfGVIX1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 04:23:27 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6M8Ef5U005896;
        Mon, 22 Jul 2019 01:23:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=OpurjFaUZgycpTMqpvj7ZULPS4V4xb3KKNTYtfx78ow=;
 b=i28pYzg7dZVp97xBy4HAUyYrxx5XwVQfeu13W4Ylx1SakrEO3cFpmXOK7pS484LEwL5O
 RB0K1aHCpWAzdLChLDYtLX2xltgUjKGkhVeZ3gvv++WTOzTy41WBZCrz3aVhp3dgUjfn
 NQ4ILYUVYQnlMBWC8TDouwU3W+ENWcqrK8EMJ9qqSChHtppv4xLaiU1hqFyI2ipaW58m
 QmUV2iLavirQkIHVecbu8TVVunOhsspNONUlC6KigZjsI8tQ4FPRDDcayW72twbKAy6l
 HF5dhOv7j4sjsQHGygqEMfZQNWFbt9W1JW4tx1aryaio7Ig5NGcfKmBQ9yaF0u2zclkP 1g== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam01-by2-obe.outbound.protection.outlook.com (mail-by2nam01lp2056.outbound.protection.outlook.com [104.47.34.56])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2tuxhwe231-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 22 Jul 2019 01:23:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWAl6ddrw5CDSpYey8o/DCn70OeqzM6yQo+9dqgU1Osqe1neEqtYjTjYG1+oOa11PGnD0PnlR3qEkzGMWTFAvOoNUh3wLzxn9W31wwVVADZ8dNJOdhkmfgUZ2rS2U+/5K7WiuXSjNa1qWTNx586944MH3G+AKz/fSiVkmYcYk6lfEkksHqze5NHNaL5COu5xK+9gwjmj8bhqkeAId3lWScNIXcIZR6bHkorg59DTwtiqs5lB8sEHGkLN4CHsrfkn8wlUuz78TRwf31rXPXLMpoEOWHW4IWSCpKswkFDIVASPGMKxAw69IJFuYaxSP2HVJtKCm9VuWrPV/Q/fmSd+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpurjFaUZgycpTMqpvj7ZULPS4V4xb3KKNTYtfx78ow=;
 b=ix3VR14LyGEMbl5o6znnmEYbjRmGsHrDi18daS7IymKWAD8FZaP61RLYmPXWikI9u2UZuui+aFlDMHoQDX/TVsd4TzOxgYTZvVOo87wqZaQjjmxO4hz7hEJBcILqvczvruI/qQ34Ve3Ri+c9Rx177nxacUw9gzbp8zia+U3f6AqcS9nydVvt+85X2jNGW9hYB8+30fyjtF1+WN5NNEQaLbDonNzQk3TIHkYAqLWjXi7dZmBcbVliTqTl0eZqLTsB3P/3CkzaRgOL6QnVLXLvlKRkmclb/Gkirj7hGxreDjmBOvhK1efM8uwMFia5lNypvMWitpjMRqK7tpEkELX4Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=softfail (sender ip is
 199.43.4.28) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=cadence.com;dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpurjFaUZgycpTMqpvj7ZULPS4V4xb3KKNTYtfx78ow=;
 b=WHHCxDxuurxkJRxbjXwECJrQcJ7xKq9mCHZLMWkXpopF0RT4gv1u49JCrUlRdq+S3uXBrafmz8aLHjIsROYvKHWn69Nz0Q9R43TlYhdOJKzImufEValmTFmL9MAcd7L0k6wMoYgdIYPnlqxnB1BvRWq3EU9bmY7KoafSFKsTYPY=
Received: from BYAPR07CA0108.namprd07.prod.outlook.com (2603:10b6:a03:12b::49)
 by BYAPR07MB4453.namprd07.prod.outlook.com (2603:10b6:a02:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Mon, 22 Jul
 2019 08:23:17 +0000
Received: from CO1NAM05FT016.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::201) by BYAPR07CA0108.outlook.office365.com
 (2603:10b6:a03:12b::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16 via Frontend
 Transport; Mon, 22 Jul 2019 08:23:17 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT016.mail.protection.outlook.com (10.152.96.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.4 via Frontend Transport; Mon, 22 Jul 2019 08:23:16 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x6M8N8DC007762
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Mon, 22 Jul 2019 04:23:15 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 22 Jul 2019 10:23:08 +0200
Received: from lvloginb.cadence.com (10.165.177.11) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 22 Jul 2019 10:23:08 +0200
Received: from lvloginb.cadence.com (localhost [127.0.0.1])
        by lvloginb.cadence.com (8.14.4/8.14.4) with ESMTP id x6M8N8qw019021;
        Mon, 22 Jul 2019 09:23:08 +0100
Received: (from jank@localhost)
        by lvloginb.cadence.com (8.14.4/8.14.4/Submit) id x6M8N80d019020;
        Mon, 22 Jul 2019 09:23:08 +0100
From:   Jan Kotas <jank@cadence.com>
To:     <maxime.ripard@bootlin.com>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <rafalc@cadence.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 3/4] media: Fix Lane mapping in Cadence CSI2TX
Date:   Mon, 22 Jul 2019 09:22:22 +0100
Message-ID: <20190722082223.18693-4-jank@cadence.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190722082223.18693-1-jank@cadence.com>
References: <20190722082223.18693-1-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(2980300002)(36092001)(199004)(189003)(87636003)(47776003)(107886003)(478600001)(186003)(8936002)(26826003)(50226002)(4326008)(86362001)(26005)(81166006)(81156014)(53936002)(8676002)(48376002)(69596002)(11346002)(70206006)(36756003)(486006)(70586007)(446003)(50466002)(6666004)(356004)(476003)(16586007)(1076003)(126002)(76130400001)(2616005)(316002)(42186006)(54906003)(110136005)(305945005)(336012)(76176011)(68736007)(5660300002)(51416003)(426003)(2906002)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR07MB4453;H:rmmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:InfoDomainNonexistent;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86b923a5-c021-45fa-2650-08d70e7dd90a
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:BYAPR07MB4453;
X-MS-TrafficTypeDiagnostic: BYAPR07MB4453:
X-Microsoft-Antispam-PRVS: <BYAPR07MB445372F0C40E04CAD8D62FB7D0C40@BYAPR07MB4453.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 01068D0A20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BWUC8CBVh85Kjan5ifVkitgwtJxWLIPBNiglO2gWV3RvB8e3IBtDkjzVtQu4+FAggE/D+CcYv6q1AuyERJEJLDLeX03CZifg74XH/ppaZslPMkym4nmKmJlCLz3B3+KbUSMoFmkS/q3+c+lye0DpWrnuu1fZ6AIU8mW2bA9OjNkOSgJ5MJ9qiyZaygc2ELuX5oVVnneTYQMK1112vkvBPRP3O0WnYv/j+o/SQov8ZgO/vIZi+Z/6bk691wpNtCqN670NKv+y1z8z6g2Rg4egZhjbdO2MolrU4fB6yT2HgsTCItXRsgA0wCjT3fJ8Z4TpUnJvahKNOE8fB9GCHkvevMiksfq96GjZhNQcODEp6Qg6xahkbhsrj9vvM6+AHd43CiFBaQPoVZmCyVpdrFrOcfyuIxjZuXwCyiNaWJQzF4w=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2019 08:23:16.7525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b923a5-c021-45fa-2650-08d70e7dd90a
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.28];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4453
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
 mlxlogscore=765 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907220100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes mapping of lanes in DPHY_CFG register
of the controller. In the register, bit 0 means first data lane.
In Linux we currently assume lane 0 is clock.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 drivers/media/platform/cadence/cdns-csi2tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 232259c71..c72c8a065 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -236,7 +236,7 @@ static int csi2tx_start(struct csi2tx_priv *csi2tx)
 	/* Put our lanes (clock and data) out of reset */
 	reg = CSI2TX_DPHY_CFG_CLK_RESET | CSI2TX_DPHY_CFG_MODE_LPDT;
 	for (i = 0; i < csi2tx->num_lanes; i++)
-		reg |= CSI2TX_DPHY_CFG_LANE_RESET(csi2tx->lanes[i]);
+		reg |= CSI2TX_DPHY_CFG_LANE_RESET(csi2tx->lanes[i] - 1);
 	writel(reg, csi2tx->base + CSI2TX_DPHY_CFG_REG);
 
 	udelay(10);
@@ -244,7 +244,7 @@ static int csi2tx_start(struct csi2tx_priv *csi2tx)
 	/* Enable our (clock and data) lanes */
 	reg |= CSI2TX_DPHY_CFG_CLK_ENABLE;
 	for (i = 0; i < csi2tx->num_lanes; i++)
-		reg |= CSI2TX_DPHY_CFG_LANE_ENABLE(csi2tx->lanes[i]);
+		reg |= CSI2TX_DPHY_CFG_LANE_ENABLE(csi2tx->lanes[i] - 1);
 	writel(reg, csi2tx->base + CSI2TX_DPHY_CFG_REG);
 
 	udelay(10);
-- 
2.15.0

