Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E23B39D7C8
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 10:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbhFGIqY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 04:46:24 -0400
Received: from mail-db8eur05on2081.outbound.protection.outlook.com ([40.107.20.81]:5364
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231222AbhFGIqV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Jun 2021 04:46:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqUIOS9pu6f/D5V/+tdWvP0sUYqDNTd7wsVSC0kltHr7Zstrw427gmGXgvtGGwCff+dgOEwEeu+YQGuESUXJhS6qdqZjiZIdbNIHkzlDF6HUqqkqbJHYRDWzKqHYbbXN5OtivM4PbvzI1lvzcm0Tq1tes2wFhnaq5B1NPdcs6Um3N+9q7WTcspxU3HDCEk2EGiGQJldf8t7XzXerenfD/O7twRNxD/CwIUiEVouDcDe+J+LZG5nHIxyDUptLSEh6ddShcBFLjyaq4+QVU13ady82/hN6znwnnhhjlT2ZBdf1u1fvHA5yFeOram66whnyGGWhVf+L1qVn3rN8TfckQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4abajW1vhYPi9V1bSpIlYdoKd9unIa5A4cUELflhH/U=;
 b=R3JGj6nKZIdXd2eBbRrLyFJqPLSc+dIEllFyWqqn4/HDkdp3XBwz5Naimyu/21xrpIvnMjUV2RigqDBsksqa81LY6NYloiCA/VVpW2UZdyrNgCxdY3NLRCFQt1Ut9A7EHIpcVEoFsxNg6O7v9jkpU3OWclLb0y4bP7Z1+x4gpfaqsdocxNhGTwjXHMULuEccZWYDnY06cSHdmLGJ224S+USKW81FN9O6Qtt/Nyqdz+vzo6nceMZnjHaBKj5l4vtT+GRWpLCDZKqxUv30ZGHW3sL6Li9SOYMtDdDN74bkOb93asIEGPH+e24WBesdAYpmA4K+JRjyDdPFztyBfQB4eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4abajW1vhYPi9V1bSpIlYdoKd9unIa5A4cUELflhH/U=;
 b=IaOV06y1sLTyR3bY1E/lpzxLbPzdvnfJj3GX+WSgzyemp5tUFug8r4QPmlgmdnbvnv5M5IrCX3VecBLXNkNQKSkDKKR/totZK6j/zBELHv9ijsVtrdsFrGgw964aHYMsZQjC7z4TZLbRiFo2C0LpvGOSu5j8OA8Vsj4ylbYkD0Q=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB6696.eurprd04.prod.outlook.com (2603:10a6:20b:fa::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Mon, 7 Jun
 2021 08:44:24 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 08:44:24 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 13/13] MAINTAINERS: add NXP IMX8Q VPU CODEC V4L2 driver entry
Date:   Mon,  7 Jun 2021 16:43:00 +0800
Message-Id: <2a17a586d2b4d07cc79901e488c4c133b3f6ffa2.1623054584.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623054584.git.ming.qian@nxp.com>
References: <cover.1623054584.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 08:44:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ceafc48f-fc26-4b85-bbc8-08d929907398
X-MS-TrafficTypeDiagnostic: AM6PR04MB6696:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB6696C406902EC8783C218A4EE7389@AM6PR04MB6696.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XGMdAvXCi40FBdoH0z8EMs7Z2Nq/5U48iMvvBIduzeLv7ExVEqASybkbPkbY4nvy8BgRANVTgiZRyX2C/huSfWcj4enaE9Unzf7TeLgbzizLv+S8U3soRo6Tg7thJf6C3K3JH5W68ieN08TMXpJbjJboglNJcl5smoInapw4/WSj0p+4wJrYCq8NQ2XGkyFEqHhqTEZg+grVUfl8a7ZQZ1tkCXr+wTwg/u+NoqLaLDJaSyteaGLMlM79gkt9YdNBjxym4ncOuQbIGgL73GAMDVw1e73CgcJQoc+v1suEp89cgT40sHRhlUylWce5inHgjX6QiWsMyYiAKzJtJgcybDsI32uw4zmAojj1wgNbSaTfu8SSw6cHji+/k6in9oKY0o6Q/zGIY4uhLx0FeFHlsDt2MgEWi0OAwIinKnaK+eIVtVdkO4HAwJ3cHT+RDPyQYDEC34/jfSMOny0CFClWt4Wxp9pEqea4g9lYbaGGMLnJ6MFeP5BUW+JzSuAueumEavPmJETq6RYEjniwEKzQS1c05VBv/gZW9W/p4rmePrnRziRMWY7Z5SIugMiT0hzi8Q6YU6QT/v0zEgMjaGmtq34i7BC9DJj4rOrr3LGSwCJkMSEBXdeKhm+AbQ/uR6TxyFxOxE6C6wlTNEIJc1xVRMJlw/HxJUY21xRsEN+/7Ic=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(36756003)(6486002)(7416002)(4744005)(4326008)(16526019)(956004)(6666004)(186003)(5660300002)(2906002)(38350700002)(38100700002)(44832011)(26005)(2616005)(478600001)(8676002)(8936002)(66476007)(66946007)(7696005)(66556008)(52116002)(316002)(86362001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3iy973DNDQxv/yQPKY3O+sAmcPsmbNkqpzGdhaBeMn+F+MglYtiFqD/23eza?=
 =?us-ascii?Q?Rqkgd4KTBms4DB0bKfRz8OmNmkKoOdVfSFIpfAJt3weQkDnG1dtcuexJt5me?=
 =?us-ascii?Q?3KkrU0Y17Z4PzguGu/mJO4grvqIZdx8VNl+zbQlQaGTQ8aneuYt4avt6gKlk?=
 =?us-ascii?Q?MPIXRtxPYW2m64VswEheRvZtXvodZbMpm8HvFMlHCWK79CbUAvtIzeQ/pNq+?=
 =?us-ascii?Q?ChPAo4mKPvPo36ZdkNMICG96Ub0Q9+V0wHklwSjYNAeuBgxg1zgr6TlKG1xL?=
 =?us-ascii?Q?cd4l4MTZ/s9nqdQqFPd4k6cwEV+XEHPE/2c5t+rt8OniH6vO0E9wk5mO380y?=
 =?us-ascii?Q?M2d+hgNYP60w1G3Kss+ieI/N1enN+iwwN60Wx1sb5IUtFXJUClRbVNKRT11A?=
 =?us-ascii?Q?ZYF5+7DX4sMQCdsneqz3IA2EBzO1/Fw17Eq/GlE2Sqy/daUE9VfOF9TyL+Cg?=
 =?us-ascii?Q?o7TBsZP2LZrrJXQY37jkcqhIyMU4uO1l1qq/HovyVoKXycarL9al7iBnghoJ?=
 =?us-ascii?Q?0uoGDkkD3PAbQeYjIwrusjM+2URYz3fVjVWaIfyoHsWE1dsZ9XwL6nnUImi4?=
 =?us-ascii?Q?nvCZBGbjWbpmey/ARvEB5L3i1d++8h/oAZcQaqEKj3M8o/TlY5wFnwDkNqq4?=
 =?us-ascii?Q?yTWmu25sOhoue0lIBCfcPdOr17mpjAaiBQ2Bw32HT3cm6b2Tl+PsTkZpdq2K?=
 =?us-ascii?Q?Pzxz/WQwtRWtje2u8wIAUL7IEqFxctzLb6Zi5mn+zZGSwvtdEH9bpaunp7nX?=
 =?us-ascii?Q?4mqDsEOnAs81B7BUgQNP9UcMAD9kXMR1KfQWg72TmVzbbBSd0EsmBj3hzwp9?=
 =?us-ascii?Q?nHHe1Y3M46IIXaYPdsDsaZCf9EUxOo4zAHlu8GbZjpchkVE0bOhO0mhdREmv?=
 =?us-ascii?Q?iejhFgA/j+qm9/M1sKyPy557Tg4O/wL/i9M2zZUjb8dRvliGD3qBFLFMiAsP?=
 =?us-ascii?Q?1zydWJYUU9ZmPhQ3dxz3vtp05b86a2ODPFLn12qeCdDCVGzMdGMl97TUHxEB?=
 =?us-ascii?Q?/Q5Sm9IH7eHVeBG9FhL80QGZxZ5HpHO9jP3ytkUJMtZP8Bz4f6Ns8yxHIJOz?=
 =?us-ascii?Q?oBbhsrc1+Q6U6GF1YatHLezIlsw+Apzvapzqr28P2kGX/45RDEXgMSxhuHgi?=
 =?us-ascii?Q?b/a4Gti9ba5mJGln6ACReJhicK73jtCct5cE2PqV+YpFXBI8aohee7raHZQO?=
 =?us-ascii?Q?ynYUuK9Lhj4SmtwgqTcooOSvlw63mjtNr2BIV+4TYQzjwVAnoqWU/sx7JOh6?=
 =?us-ascii?Q?jqvYJH1w8dG3Oeo48bJRAUD9UJEX45+Y5/axZiAjZQYYBGA7fibrrKmllUSv?=
 =?us-ascii?Q?wqYZotbplrYY/yUjhkgsalap?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceafc48f-fc26-4b85-bbc8-08d929907398
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 08:44:24.3993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbMJI2yW024omr/LWdUhoNeolgMHYJE718pYUfZWQ2HWlm140JqVas5h1q/RVKPXXEgraYXzwHfEBta3nXZoow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6696
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add NXP IMX8Q VPU CODEC v4l2 driver entry

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f59b0412953..b88f6e650fab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12600,6 +12600,16 @@ L:	linux-nfc@lists.01.org (moderated for non-subscribers)
 S:	Supported
 F:	drivers/nfc/nxp-nci
 
+NXP IMX8Q VPU CODEC V4L2 DRIVER
+M:	Ming Qian <ming.qian@nxp.com>
+M:	Shijie Qin <shijie.qin@nxp.com>
+M:	Zhou Peng <eagle.zhou@nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
+F:	drivers/media/platform/imx/vpu-8q
+F:	include/uapi/linux/imx_vpu.h
+
 OBJAGG
 M:	Jiri Pirko <jiri@nvidia.com>
 L:	netdev@vger.kernel.org
-- 
2.31.1

