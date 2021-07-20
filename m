Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9372B3CF1DE
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 04:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241907AbhGTB0t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 21:26:49 -0400
Received: from mail-am6eur05on2085.outbound.protection.outlook.com ([40.107.22.85]:45921
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243803AbhGTBFK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 21:05:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEC1RI8cPnC53D523XZsn3dEEbM/oEEMr8FSV2JjY87uombLRSmbuypUrtysvJbRlsDnJbdrLspzFbxwSl/CKlj+M95/om4J3pd8UmPn1uoF8Vp94cOGCG9f/XGmdCR5zS+6Kl1ZA+KstlhRXRi6xSVAO60TdiJBRZhmwLtMcYWCc9CCogpjtnOAhhctIAtScIccMX5wk8sEYcn/J4kdBg3uauCeDirnMsrPrWxuLr55mJS3vKYj6POfRenKlqjFhe/iW2CDcXJ6n0NOQ4m2UXKzfn7rPBtIOEMByk/CFSL8sdvCYqO6hWiDnaQX+4hdGpJZSfOPWyLKBjChQzktWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2AFHzhh3/QpoqVOQXiVzYQ8CMWbBK+s8NXbBzE9l0g=;
 b=MDoFTlxo5bMVuAKhg1Cr3BpAMAPyiR3uOFkIfuHcMWkX+0GVNeIr2OVN6rGkeQhm6WeHgEB61pajPoYbfh2DjyrkTAfFolDs7onRx6Uf2maBDwaGr4I7fpq5vmZASgdltAglo8FHeSN96YMn3pXXJHfstQ0pNnAYXmR/YxDV18P7NgHUj6+ZRycrXmFay5Naf9ZrdHwG7GF04v9EmopNRK7+sZH7PWWmMwC3WEfXri7XR0UbCznwFECPt6LfzXxuDTXnhurQx5mfLnBbSlmg/dL4ylvLvHTyL9hxz80CEtLsqENw17w4DMrpqfnIKARWD9DkjRC8vUUj9pNTW/50dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2AFHzhh3/QpoqVOQXiVzYQ8CMWbBK+s8NXbBzE9l0g=;
 b=hJAwccYd+rAsuurLYKHZz2ysIMPZkI1OtsFziue2usWEVlffsJkmagPBp4aRiP0FGQdCCH+UGjSpFqSqVCL3R4SWg1D0VUc1lxZsvX+gkrQiUR4lA5Ggu0B1eqja0WhoV7T6Zq9WhPlgN+NINQeQlY7muYodSee7TQye9TQz1EE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3813.eurprd04.prod.outlook.com (2603:10a6:209:21::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 01:44:51 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8%3]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 01:44:51 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 13/13] MAINTAINERS: add NXP IMX8Q VPU CODEC V4L2 driver entry
Date:   Tue, 20 Jul 2021 09:43:32 +0800
Message-Id: <6598acda00c93a60af83189eeceb3fdd0cc58d46.1626743758.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626743758.git.ming.qian@nxp.com>
References: <cover.1626743758.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0232.apcprd06.prod.outlook.com
 (2603:1096:4:ac::16) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0232.apcprd06.prod.outlook.com (2603:1096:4:ac::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 01:44:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75d14a3b-c86a-44ee-f999-08d94b1ff754
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3813CCBE1F0B086951F5729EE7E29@AM6PR0402MB3813.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JRYHv+y1u9UrkAOflT8llSnM+0u02n03goJ3UQ9zL/RbN5O1mPmz4cSRPI318F4s/BjoTrLVWj+JVLQ4x/irwsd6QTpjAgnulJKdYHkslcWIcGcNpPoO5+8TavNQWfByjEfRHD2JkxJK0OY2+/kLDKLCBo9bk69p6fQGehazf77YJeuwl6ufVjr/aZjsaSwSDu6Yl0if1IlLrIf+DlgAunxyPzocTBIziKmcDnclzXUUUYj8OEvVbQDnEZgiQefxgUHhExhg3YeesDHaVsfaTKE5UQyc0VHRFD3PBpQ1QGaEAYTALjySphnWpgvNs5ud1TYl0jKQvtTYmd2yh5OonYnrYMUOtRVnKxFj9ovbKhpzz/uLWSVtZqO607YS6btRJas8lTlM6S84BSR97tNnHhTB0fmU/wuHc2guI1+GJmA/twKzgTn2ASotfmev2aWLVJpCcmuq4J2YT3PB3taNihNBhD/pSk7eYgSTgcZrkgc7L8cSpEZ7XfjU5F80oHSKBgjTMAyrfkB5HOLN7IMOI3Y1ugurMR/UBGazb7qN3JxOJZqEijp9Ubtd+3fa+2F97U+WoCntzpBTYhCrqgYebKwwE2UwWhs5c/lUu0i3NIe1KZH5352Aco+I/as3ZfBJnO70PGA8wyzsN9Ou8/KqKQD0cQsDDrDTBg+mXuyOyoN+0HbyM255YbdbxzFDglnShh2OwKyAxMgHzGGq33hv6k7D4TG3ssaaGpb7mc4nPPM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(4744005)(316002)(8676002)(7416002)(4326008)(86362001)(6666004)(186003)(66476007)(66946007)(66556008)(38100700002)(26005)(38350700002)(6486002)(508600001)(44832011)(5660300002)(956004)(2906002)(2616005)(8936002)(7696005)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8zEWUiR/5Jc3x9NRVDJnMGH+NDRyPT2YYbvKUtM5nxhpcZuWCioOYjjmjgJ6?=
 =?us-ascii?Q?U3s6mHLYDOITS4O98f7jqwjFcWMb/DGelswXieeZj0lZXqmh5sND9I0IPKKs?=
 =?us-ascii?Q?sesebyQIA2E1fWvfVXS6hmeKNW6mX4peYF5VgE9u5qSXGiGQvGBhl2pvO+V1?=
 =?us-ascii?Q?iWlOR7rjxzqeWp2nDNdLfCtqt4FWpTxWiN8WH9kyhed4MW2oql3uyB9VtJ/k?=
 =?us-ascii?Q?6JU86Eulf4Mz2eLx/9soCSdRq6xmE0pmxv74q4I0ACFHWcmFRnJTtdAJepmq?=
 =?us-ascii?Q?Z5b2SPoKve4Nfa27aPZx/5yVabxrkcOhxIbTSn265KjuDq5Sv4asuhKySyzV?=
 =?us-ascii?Q?D2dqWJJ1Msh4Qw8qZQnlXQoSVjGCrz9DiwNKpQ6F+JSlVko0AfYlrqhp1xBa?=
 =?us-ascii?Q?IyKi6hi8yinaAXp62ta82i5e0vZCpeyu7DRINGTLXFynp0K6B7OOcrQjtxLC?=
 =?us-ascii?Q?+1GCVP/Ym/kIUzubT+34e/tOERR09GoIEpQpzr0WGZnFz1NdYq/PHGXV14m/?=
 =?us-ascii?Q?EZMlbS+E5L4nv30up7eH5RvbIyofc6/ScCSt3PdUjslMVRD3eyffpeFSyQwz?=
 =?us-ascii?Q?N3R4hQijtrS2h+2E4DSfRxfQJMmHqjRHPitWdLmElpMxWTSljTY7FPNDzP0o?=
 =?us-ascii?Q?WKtZFf3Qmg1fTlx6/RLghg9AUpmV1v5FXvt8A4q5Yw59WCdAZZ1zxdYkH70V?=
 =?us-ascii?Q?WOPjpAqnlHyiZX3mHqCy9Wgmo8dZ0rNKHIcdzAQYIsGjUu8ifzz838bhQxcz?=
 =?us-ascii?Q?KkHSgQ3QJQKneoj4WHge5+QQrI0NlCdA8OApRk3EMXWeL2gjMnWpDBUCePqh?=
 =?us-ascii?Q?hsxpNCP6d8zo0td0qhWMi9SqlIFQtInAFxOvpYVpmu9f05VJ9QQZih/pyx0z?=
 =?us-ascii?Q?r0k7RjslISpzMIfUr76qqwEfSTRGPdqle2vVYwoJnql1Gi1eGFinJoDp3ggi?=
 =?us-ascii?Q?UwFOPnf9nBsOJXxHKPELMglS7yFvalZVmwsbcHYKx70G1RWf91jUZ8c5vCtk?=
 =?us-ascii?Q?Z7ryVFx0fvKVCTqgZ3VS7FFEbHJcQjW7W81FvIeLbT/PvyJUy8aeQOnj2hXa?=
 =?us-ascii?Q?BxlidmhKn1xw5pnAGHPSZA8U3hlf2/5DvUOHoJVC1isThPtPkXvXGXQ35uSy?=
 =?us-ascii?Q?MtG9zFO0zdELpz1fecKVvgdeAlWu2izTnT5/ur1Z5Q41Qe9BU1wBtzCgZVdd?=
 =?us-ascii?Q?+WHbJKsw9kWMNi788y8fbMUOW6ywbI0/jhEhZn8fK3Y7Pr+VpISRTeInpO+u?=
 =?us-ascii?Q?+HZ91Yuts8+r2hmDu5PuxYVHpbC/v5RFbFBudz/1CVg4bGIRSndJF5OS7RNw?=
 =?us-ascii?Q?Rb4/X9tpCmHX2llMEkT+7DJU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d14a3b-c86a-44ee-f999-08d94b1ff754
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 01:44:51.8294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVkMbELyJSSTnDQhOEH9sQQi6WIaWwYx2UKeiO4R71R0NYYo0mlkLG13jxzBksllmajHQ8TZuicPRIaHJBnYQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3813
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
2.32.0

