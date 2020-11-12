Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653F42AFF52
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 06:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgKLFcH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 00:32:07 -0500
Received: from mail-eopbgr60055.outbound.protection.outlook.com ([40.107.6.55]:38372
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728048AbgKLDHl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 22:07:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgWeGuWTw8AG6+W+bn47836n1Qqr11j6NzocDFdhyL7Dlk+Pq2mDc2KTmsS2VFJQlj4Y3jVVd/6l7cPVVKBTk45AoYrhSG9eo8zf+zV6NeGEYz3RtI9yw3lW6xXbyY6zP1+bWCP2N8psIXNbDtdBHIO9katphxNLtg8mobTaJcWFcjcW+aOvQCPgdMRDxkSZ08B1aR2CLgb4Znod9Ab9JQU8TSBwFBYIZptcCoIxbgUNPjLSEFQfQ8A6coCVmMcwcyhCsYVMDGr/V85tWHmH/zvyhjPFR0077TQLrLseWKpohfnEq0NLmgbgdFk9LeKING/BA7IcL6nq4oFsFSsGsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ajMZtv/MSM0AcWEmfCg5reul6N8WfZ2tvMjWmk7OwY=;
 b=nzNFOH2Vm4YQuYTlhl467ie04cl/JAa0byF+IBfgcDdjdhjjH3J4TQNvNetiEyyQQ4RRy9SreXzhL5VYzBSFulnWyhceOfNOFdYB+zw08NGA//8Zo5efz3sduhl30XguddGZODVGdvhoNkYPfICHzaPHnRd1FMG7aX0pUKEMpUHKCCeFs0KTPJk+4n/aKIZ35m/Rqb/PPGdSyWu8D+1XYvVIHRpk9CE8zL8EsHQTMEOAAuEImHXsQeY7topscTo3MD/8WDVsioD3w+JwY9PRRYNsAAHr5uxxyssGJSlv/kk+OP5V7UIvHeB3KTiqz4KxDNk8csGSbfDpJj7v7CIvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ajMZtv/MSM0AcWEmfCg5reul6N8WfZ2tvMjWmk7OwY=;
 b=PHWBn7gTa8QOZv+F1KepGqPtdFpi+2Khn5GrNZLL+3j/VtB5ZfO6LFIYT8T8631AM5g04Eiuov1Z+M06t70jEQC4BUGBNtGudfyhoTx8cH8BKw5RwC50b9T2B/nMoRjDlpL1/cJwpfhK9WDiOpFEpra8bZen80wRULgs8YCRVMM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 03:06:47 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 03:06:47 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org, p.zabel@pengutronix.de
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v5 02/10] firmware: imx: scu-pd: Add power domains for imx-jpeg
Date:   Thu, 12 Nov 2020 05:05:49 +0200
Message-Id: <20201112030557.8540-3-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.171.138]
X-ClientProxiedBy: AM0PR06CA0100.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::41) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.138) by AM0PR06CA0100.eurprd06.prod.outlook.com (2603:10a6:208:fa::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 03:06:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5d854647-db21-40e0-2db3-08d886b7fdbc
X-MS-TrafficTypeDiagnostic: AM7PR04MB6997:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6997484AA87BD46AFCC55D06CEE70@AM7PR04MB6997.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xpuGuwyWyRB+PsnSosMmyEPRAXkffNDOk3GOjMtXmJJ5U8g0N2oLZ1oQ5o4s+ByLYq+Omvf944t+VqtF7Pz3xsjInOw5cPBWjukrU65rVt4O5QMjuLQC07pQQadPX6G8+eCVNk4VGq9glztrMUJJxTyPDBX6MZbKcFaPSSlcZAqq+hZVgdK+uJtrpbyfJry63bFrYWMOUmyPyP1dJczl0/kv4XsrssQ4ysQSvhY0pvdQ+qQ0IHyY3ui+o01XjGUUHWW6BjOrSWy9p5PI4hICnzmU1ne856WVMVRqeQjNTXMks/TeHB2LuviFs5a46RBsLNtxvOLatANBRLvEczJoRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(1076003)(316002)(26005)(478600001)(6506007)(4326008)(6512007)(66946007)(66476007)(186003)(6486002)(2906002)(66556008)(5660300002)(16526019)(8676002)(52116002)(86362001)(7416002)(8936002)(2616005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: x6QtyiP3ZAzbPFlrCcG+qz9EDl5ZVHeOnjXa9FOc03Pcd5BqXiMPWfMS3TffnXxX8lxq8hUQZEm8IFMART4vXtJwNDnNvecDg7NSVVogQoMjpqJFOnNnzx9KPh4euQSzjZay0RbUyQ57TKzCrMeSq1EQFAw4c/mAxImefy5hU+emL26r/PYOttNrDyUFFytEChSQj+u1cwkzF0jdKtyCslrxqwF0BVT4cf+1i7HfNd5ELjY8c7XwZIlfRZZaxsXpchVN3xE7GMl4TTtJp+5SNq9JCQjjj+QBgDWyDEZuAkw/BW1MXnGhyJNjMxvts+Hcm9qvwCPnX6C416jkTpAQ0thHQfutLr5vAnD3WNT25Q/lozJPYHPMaN+LwZywtdFv2sWXHSVCqs8pBpcTJFDGfMipc0VPEJGRqns8T1oZshUsfsaSFZo7XGBM9DrYXuLqnPacbbpX5U4yJRjrcJmUi4fDVIM4VTGySeC+QnK201Xmb39XLUmtgjbs2fM0LJEjtQGa5rsZ/rsxaQsQJhBYyrMAEWWssPiZvDM9oZOyKoMgkp+3aQ75FxRznIm6yh1YnTIuo2caOkYe06gz291P7k1x81i/wqUA9FL2Nu1uIWDSy4mkME20+TDDTqHdRGraiLZ1fsozUM4Z3qN4nZjKBKJVE0e3r5mRuJdN4Orm2roCw0VkqmRn4c/6b5DUFEdOZ7NDNbpRE4cRXnu2Fm6eN5/3qWByLB8FyBZOB4auKCutuquBFbiE1QFmlHzktGolkHMFFZxiAXURkfFZEjqEmp6FeLlO6SyuZW2UAYV7FswcGGBtLuCuybBziB7DC8jfJSygH1EiAHuueTZ5dGrEQvimbAxVeWBb4OX6HQdvCQfFhismse+O+PKsveoZyVaZ8fLfZkYiRge4bsMkYYPP6w==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d854647-db21-40e0-2db3-08d886b7fdbc
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 03:06:47.5205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MRpmGrkq2deb8uNeiS4WQF9YxK9GTvcXhTorSM9zfPYThJG3I6ajNHQHxGM2LZFFtLueN3yz64MfGXv/+EWjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

The power domains are for imx8qxp/imx8qm JPEG encoder & decoder.
Each has 4 slots and a wrapper.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes in v5:
Added Acked-by

 drivers/firmware/imx/scu-pd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/firmware/imx/scu-pd.c b/drivers/firmware/imx/scu-pd.c
index 946eea292b52..a614d8dd868e 100644
--- a/drivers/firmware/imx/scu-pd.c
+++ b/drivers/firmware/imx/scu-pd.c
@@ -180,6 +180,12 @@ static const struct imx_sc_pd_range imx8qxp_scu_pd_ranges[] = {
 	{ "cm41-pid", IMX_SC_R_M4_1_PID0, 5, true, 0},
 	{ "cm41-mu-a1", IMX_SC_R_M4_1_MU_1A, 1, false, 0},
 	{ "cm41-lpuart", IMX_SC_R_M4_1_UART, 1, false, 0},
+
+	/* IMAGE SS */
+	{ "img-jpegdec-mp", IMX_SC_R_MJPEG_DEC_MP, 1, false, 0 },
+	{ "img-jpegdec-s0", IMX_SC_R_MJPEG_DEC_S0, 4, true, 0 },
+	{ "img-jpegenc-mp", IMX_SC_R_MJPEG_ENC_MP, 1, false, 0 },
+	{ "img-jpegenc-s0", IMX_SC_R_MJPEG_ENC_S0, 4, true, 0 },
 };
 
 static const struct imx_sc_pd_soc imx8qxp_scu_pd = {
-- 
2.17.1

