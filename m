Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80771419EC2
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 20:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236168AbhI0S7M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 14:59:12 -0400
Received: from mail-am6eur05on2076.outbound.protection.outlook.com ([40.107.22.76]:1889
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236136AbhI0S7L (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 14:59:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nH3UIzDA+JvcERN2Flum6NeYKHN8YktDstktmQYAYecRCEM3BU5Ov3ido/9TgNgoGnNVkL9DQfcFR4DNivotRf0/2bBdbQih7Wueire0/p9cbDVxi1ria+wzSwRzU+HwRT+s3pBaN8LjI91kqAuv5L5oAEFacDW0wmI4xn/bxuzSay/vX9ixhCCXJsXeaVxXeRNUbnvNE/kL71ovgPWc/tysSjNeSoPnfl2lmUeyUsuraD8ISxcSxBG39x7RvnTxGULO/2jPSx5Ea8DEBGggEHDTP998X77HMxM2T9PWiJKM1D10dmn4jSFQ7NS2avwnGLaJLO8h8ZRYTR9JwJSDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=KrnKP0e253IhM2mVn5DNeIwrJogfEg3vSO/4v1S2DW8=;
 b=chhPUNzbq81f9H6Nqx+gKuJGxD5B0wWv5qf57kSyLH7WX4Gt4PmLwpiwWlIYYFMoroTJGq2W+uOoubal6YKHWzp1ePpagZ23Um29dVhq1Bffmq2se7cUDLrIc10JnX8KqZCHXU9fY8xgj4kAG4Z5o4JcllDu8xoKnWo730mE2PYUaMhQLqMyOxi4iM3lS+HuNCRoKfy85tBMYGWwGYj9jno3Z7aY2wZu0dOavSiPlye2elucwQJD3xdiazuuAMEhHpQvmu8QXygYdKnqKtRZcyt8UKt/CPl59OG+sh7kvRO2YogfHGhtV3q1ta/s5xqpJrKwQDSTAqawvfCPUaFqrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrnKP0e253IhM2mVn5DNeIwrJogfEg3vSO/4v1S2DW8=;
 b=bhroofaEyQ3DU7krVwSsmvIRUIZZHqwsooOPL76jY4dgEYDej8xVhQ7lXgOe+WIlOA9pjHgecRFnDV8wi4CTeruKeioFIbMad4LZn57iA2ivWrAh3xsvPB2XNWEhBlIeLrRifNkjbhvWjsuh907RoCEMtBCHZ8HEKBUVAIpja+I=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com (10.168.63.15) by
 VI1PR0401MB2287.eurprd04.prod.outlook.com (10.169.136.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.20; Mon, 27 Sep 2021 18:57:30 +0000
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::7858:1e48:5260:2810]) by VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::7858:1e48:5260:2810%3]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 18:57:30 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com
Cc:     linux-imx@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: imx-jpeg: Remove soft reset between frames encoding
Date:   Mon, 27 Sep 2021 21:57:19 +0300
Message-Id: <20210927185719.3094796-1-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0032.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::21) To VI1PR0401MB2495.eurprd04.prod.outlook.com
 (2603:10a6:800:52::15)
MIME-Version: 1.0
Received: from localhost.localdomain (86.124.168.147) by VI1P195CA0032.EURP195.PROD.OUTLOOK.COM (2603:10a6:802:5a::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend Transport; Mon, 27 Sep 2021 18:57:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56c0912d-35e9-46d8-807f-08d981e8a841
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2287:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2287B73B90C9CC4808C7B5788FA79@VI1PR0401MB2287.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dh09eHt+hfLEHG/s5OjzhbgmZ0e2DD59vsUAggH0rkEQvXw0ZUq4OdbeGGuLSHcS8VqSGt32DhXtL/ryxO/jPx5YNAIltT1sQ6zCUlU1EOeIddRohFDKG2knHW+k4TjXidLl6rCQZgNtNzX46X+52giiGW7qgb75OetzXeqYoj3mKf1NPi/P1Ls+fswkRUNbTcgJWwEXhn4qZbB1ZV/FL5YGbbitPRX8gImQaDzf2BqtjgA0Vruw0yW0luwce/nifuodId7OEnJqA/m7TDUHs9D/YqC3cL/QU3+jjOBbGA6Qjl8w6kYajUgm/9B+HUKYeJCylB1/pyjLVwYZxSpr9olj+cwsRloWVAu//N89RtYSHhqZo7yeW+pRAqRCGACYurki+nOvivrHg0Jw3s1S63rH7LcftUb0ZPzzWmtX8DdsRCBmHYkiHqdIx4rTRwdR5LGPjbg28ijC/9y98uGDdCeiv+VrQ5VNoADzEdIQD2qsevydVicxa3aXd8PxQU0CXib1c6ZxdpThrZHNOk6dRib6ErqT0jL+QDAj8T3WiM8JgvGMLgE1+MdB1l8JwLs1IlreaQ/6+nQmwzp6AYngtcBgiSUf4OYva3QWF8WelJe4qXpxJfgmZRpg7Y8gESFjQjO7UU0tIrIRcWO1WA1AWJZWWutSW9BQ5UXR5qrUdUG4e/kTW7Q8ky9notdeT8bmR3d2jUX0Ewmk1vp3FQo21g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2495.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(2906002)(6666004)(38350700002)(6486002)(83380400001)(6636002)(38100700002)(1076003)(26005)(36756003)(6506007)(66476007)(66556008)(5660300002)(66946007)(186003)(86362001)(508600001)(8676002)(8936002)(6512007)(52116002)(4326008)(956004)(316002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6iGpX0hJrcEliPi5b6ccNgKia2VWAgo22aDoLa4kqEf+ipHRvOyCMFcZQVGs?=
 =?us-ascii?Q?oUlJeulElkmrLvEVV9caZOToOGIqxf84RYgE1uOz1WkBu46qcQbc1nCdgmtg?=
 =?us-ascii?Q?MhqAA621kOp+6axvRTujfR1tBE/CwGDW3S6VCbToogNW9JL2+K32WQq6SIDI?=
 =?us-ascii?Q?TM/G4JHaqe2vhBlFFhzh2DTNYstIjcoRCYlcfz6+lfKNV9C4j5cvwFrqa0yP?=
 =?us-ascii?Q?cw0/4hHq7DU4/oDqelkLuVHFQaSxc37JreT8K2bjdOphMvdgRkUihKsK/SGN?=
 =?us-ascii?Q?NR4ZF2SOu8fnNxY9dKbs5E2aEiJrMQT9BMMVH16af+dGYzWRraoQ7JEHBGc/?=
 =?us-ascii?Q?NlC2TXc/5V+cGQ4c3JNkqnZmubemUKigA5ZJKwkVfz0PAWCiehCsrK9po1W/?=
 =?us-ascii?Q?GVNk/sEKDN8I1lni3OyDIrlrr+tKJj8NBDkSTFmm62Y23N+cSDRjbRTAxP3j?=
 =?us-ascii?Q?62vsZagH/Hm+LIWndpKUuvuSa+luvJskMB9Q/vGVdFAwC4s2UJOskaPYruQE?=
 =?us-ascii?Q?36Lz79S+S7vv0IgIbolMwm0l8n9gumyFf0p0NP0Q8zfuLNW/bh3O44XW6cBF?=
 =?us-ascii?Q?Xg2mxtKnJmKZQ2Bbrz1bH0mS9kgiF8RYLn4JPmktqxts2wTSgc4WuHwDqids?=
 =?us-ascii?Q?jhzpqVvnzpn8dd0vdr6xvu29vn+qyoHACgyAxX2MvFqDun+Djimd0SPrsSxi?=
 =?us-ascii?Q?w+oazNgNuk4K8zQruCNHcrzOXcav92SNkl+bv7U/Cwq5XRxqnCJ/YegTXEhM?=
 =?us-ascii?Q?dr1fJjGkIq1FbtexiDbWspdCd8lJCDhsgL+lalvDSu6E/ODuQPGSSzkB56Ne?=
 =?us-ascii?Q?OcQ1mwsD9fWkKA8HgYwY32O4LV3825+namRuqoRZPVatK9Xvhe2Op60IfwBX?=
 =?us-ascii?Q?IsyDZ1b00oXCzNh/kYYoR+suiVi66rXxgsz+ZJr+wgvVwbpDasKrL0fgJqum?=
 =?us-ascii?Q?M+yjirPkokW+IYMxyFCy4JNaKOSYEyVU2Nu4mCcCZlJ7sWMhjWwf3hdn3p+G?=
 =?us-ascii?Q?jHDs5uzBky+VCd/2GKBc/8m2UdQ5sk/D05WsoYWS1ruP/WGC8xzBsie2N0mo?=
 =?us-ascii?Q?zrSyxXYaAn9ULtEHiVd92N1YAkWqHDqrcb9opW+OqxuPUkaAAxhx4MsMeub9?=
 =?us-ascii?Q?0PH1FZ7qJ1CGMtxMaD2GCl3QwMzPEFpbsGUbaAEGkRRaDRF2J3IRMflaGOcu?=
 =?us-ascii?Q?4oFOTu9jQ7xCyXfDuX6xZHnLYq6q3x3qf4z8W10vglAiJUSlzkdLma+JtfVJ?=
 =?us-ascii?Q?qHqgOgozTe6Nv7BCYtbiQraHrSjExYopC6XDVyaNnw/UwLY+T1WdPI0Vw/zs?=
 =?us-ascii?Q?Z6AppfYNUB2sD90HlTV61Ymo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c0912d-35e9-46d8-807f-08d981e8a841
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2495.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 18:57:30.6715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbTr370VAtVXTlOwvXv6kL2uQEIOqsfeUQJH9AyFjci2DVSggZt14wTdmhpRYuTonVpDQmSmWbTTg8QTvCfDVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2287
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove soft reset between frames, which was merely a workaround,
actually replace it with something less aggressive: clearing of jpeg stream
buffer pointer, via STM_CTRL[BITBUF_PTR_CLR].
According to the reference manual, the BITBUF_PTR_CLR is performed on
context switch, but, per hardware team recommendation, it is also working
without context switch, which is the case for this driver, for now.

Without soft reset and without BITBUF_PTR_CLR, successive encoding jobs
continue from where the previous left off, basically writing past the
v4l2 buffer.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Robert Chiras <robert.chiras@nxp.com>
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
index bd19a4b1bf08..f18b67453152 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
@@ -817,6 +817,7 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
 	img_fmt = mxc_jpeg_fourcc_to_imgfmt(q_data_cap->fmt->fourcc);
 	desc->stm_ctrl &= ~STM_CTRL_IMAGE_FORMAT(0xF); /* clear image format */
 	desc->stm_ctrl |= STM_CTRL_IMAGE_FORMAT(img_fmt);
+	desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
 	desc->line_pitch = q_data_cap->bytesperline[0];
 	mxc_jpeg_addrs(desc, dst_buf, src_buf, 0);
 	mxc_jpeg_set_bufsize(desc, ALIGN(vb2_plane_size(src_buf, 0), 1024));
@@ -843,6 +844,7 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
 	cfg_desc->imgsize |= MXC_JPEG_MIN_HEIGHT;
 	cfg_desc->line_pitch = MXC_JPEG_MIN_WIDTH * 2;
 	cfg_desc->stm_ctrl = STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV422);
+	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
 	cfg_desc->stm_bufbase = cfg_stream_handle;
 	cfg_desc->stm_bufsize = ALIGN(*cfg_size, 1024);
 	print_descriptor_info(jpeg->dev, cfg_desc);
@@ -886,6 +888,7 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	cfg_desc->stm_bufsize = 0x0;
 	cfg_desc->imgsize = 0;
 	cfg_desc->stm_ctrl = STM_CTRL_CONFIG_MOD(1);
+	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
 
 	desc->next_descpt_ptr = 0; /* end of chain */
 
@@ -900,6 +903,7 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 		dev_err(jpeg->dev, "No valid image format detected\n");
 	desc->stm_ctrl = STM_CTRL_CONFIG_MOD(0) |
 			 STM_CTRL_IMAGE_FORMAT(img_fmt);
+	desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
 	mxc_jpeg_addrs(desc, src_buf, dst_buf, 0);
 	dev_dbg(jpeg->dev, "cfg_desc:\n");
 	print_descriptor_info(jpeg->dev, cfg_desc);
@@ -955,11 +959,6 @@ static void mxc_jpeg_device_run(void *priv)
 		return;
 	}
 
-	/*
-	 * TODO: this reset should be removed, once we figure out
-	 * how to overcome hardware issues both on encoder and decoder
-	 */
-	mxc_jpeg_sw_reset(reg);
 	mxc_jpeg_enable(reg);
 	mxc_jpeg_set_l_endian(reg, 1);
 
-- 
2.25.1

