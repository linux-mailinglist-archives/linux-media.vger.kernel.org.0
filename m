Return-Path: <linux-media+bounces-18499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5879843B4
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 12:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C60E1F23BF2
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 10:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC3619C54C;
	Tue, 24 Sep 2024 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="c9ikHpwC"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7952519B3C3;
	Tue, 24 Sep 2024 10:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727174009; cv=fail; b=hInLUeBrPhV1pzIZmttRiy488bDFCDbygC7MS8Q/vgomaq3qzQImK6haeC5/QDQGrfadLysjsaHjbWaWtSmW75sRohbpcJySvBV6RFKeOva25Iu6TsaIvNndXp0qdoYYtJzLU8aMfjKLmhGrtN5z7HUVoX/QeDtKKYiFAh4OC0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727174009; c=relaxed/simple;
	bh=q0FPEloOlVpS8Er9UdkyG/Uvxzpc22gxGNiYHn5IVlg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bjTaz7m4LR2EuIav9Ov7Ot9qDNZNfDevcv/pQArNcE6mKdxKGLalby3XnvCuEaX53e/WQJcK7DILDVeYvlwQZrnjbT4W0tP2Ya4SsQJtCSr3vlpQQBgFUWVVTchYGidvedADrbJf9Y+2ROAuekB0a+HEHeDPxiE0Bk6TtawONdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=c9ikHpwC; arc=fail smtp.client-ip=40.107.22.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDGfWuQNqAA0Z1eXJll9YGt7irrVSx07yM6j01O0IRZWXwcqlEIq8YmXO/Pa2FfA6sw6bcDeyjNSvWz1TzXUnzucG0khGMTZU2BvZloIEoyxT6Z42e7kQrJ5YjH5poqs2mw1C8YsicPRwppSghxd9fUbicce99AtKkZbIdu36pEAZxBqyAH3R7rn+U2vOwljavFijC+rozgUTtN91NfU6LL7KTB0K1/EuW58nJGzjbLiBBhDG8efrQTcGOvHhB/Anl5o+lokxOGE1Ise95P+kkOmXEoDXxi3wO+sEyi86LBSB/VxFXF7wDl1oBgyPXtiBtBKcifBjbp4BhkIR2ZLmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vW1ZVtQ5gP2VFZ6CvIDUlYCQPPo6gfXH9zlozSoPuow=;
 b=SzX793xFikhwdUYa434FgXXm7yHytrqgvj9xssioG08huOgo9R57x2NeccvOeavXKdfu6nH3tcRtmwe9iHvP1I5PJ6/e7dVCtZzqc7R3oBva4ZM2SHCkden9bRR6HSGhOcGaMfk522MQHhlyEW0r8cOgsp2EsW5sjkcAHyVPsuzLfyeEA1WF+eGs/DQt1frcnw2Gask+d1clcRdzBXUaJmE2slAZU619VOr4vuWGTwtrP5/+JbWzRGjz/gRtjkFQexmyxdiQUZoP40OOmTMyyUonoemV5ktoD5yP4ETZeNCQFjqc2vSrLSp74BdC3qb8dVBWYnDW588R2o/7ckK+EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW1ZVtQ5gP2VFZ6CvIDUlYCQPPo6gfXH9zlozSoPuow=;
 b=c9ikHpwCQGxiL2gGW1RK1u8FE/8h6xYMZVUqSrlBJ6mr94sVF+RryUzHNdHQwMXQhvptMMAWiJPOSXtj2L65RCqN7wFvsR/eYHhhY0dThsXrfxxGPPhOtIR4v0S1jBzylKYmvTe7QKqmR0BmWOxOlRmIvM58latT2KjOq0uvVUYSu6lFl2R4yFv1/7LL5GzKZl7u2nqh6MFFF8uhIZtnqmRQQaSw1UMbsBHOgp4Wjcj9W90twTUW5suDNR5Y/WlNNNlaDldYY4+pnMaVsvklODGcT4zw46z/8aBPqZRyHbmyM9lowwqGNBJvY8QX80MFi4CRx4lokDdcUZzbrc3ZLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by PR3PR04MB7257.eurprd04.prod.outlook.com (2603:10a6:102:93::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 24 Sep
 2024 10:33:23 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%7]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 10:33:22 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Dong Aisheng <aisheng.dong@nxp.com>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: nxp: imx8-isi: fix v4l2-compliance test errors
Date: Tue, 24 Sep 2024 13:33:04 +0300
Message-Id: <20240924103304.124085-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0033.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::13) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|PR3PR04MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: 312e64f1-40cc-443d-2784-08dcdc84508d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?5Fn962mjFLeDPj03vV+n1dyIhzveP6+ueaDh9g54ONtTICaY+ngIC9qLoXKW?=
 =?us-ascii?Q?VDO6Wou7oM9ge97KOk3CpvsDngxu+NKT6gTT561opfQAeOInbOwD1kXwlBOL?=
 =?us-ascii?Q?vY386PGx4/OkAaRkMJd+S4I0B6+y94OdB+biA4KOwRh0y2/Lr2dyQpa3mt6o?=
 =?us-ascii?Q?hBodYE2V8IvdRR5OndPFYm8cWoxxD65CZGn/XueZknzB68dDwnuLDR3gR40Z?=
 =?us-ascii?Q?ufi8WuEEOT/SCoLQGyB1rrdD9xJ6iftppkMOefL7YGLXU+XxWqFU4Y8ZHK3a?=
 =?us-ascii?Q?lG9zbXDyrTf4BstahwvGOWr0r49RRjq0hYNd/6vs+NYxxR86/Rg0wVSemkdU?=
 =?us-ascii?Q?jrvObxFydyCnFH2ma4tMc2l3VDyM46curFq4ApT1Iue7A7qbgq/wMI2TsFFG?=
 =?us-ascii?Q?xA3FhOXlaWQdDZXEAZ3QOwGsXGvuqkKTmgfGRw9mMqWMadJoxIoZUPXsnMH8?=
 =?us-ascii?Q?l3/JBd2ZCR8cdpZJZj2H6qWQD+tFbUKXBsivyHbdoyNlpjx+2BAHvYkUuyPK?=
 =?us-ascii?Q?Hrh6dPVmiQiAPptRR5D5CIj+a6Kh02G3hf6nk4pWQ975uabWLuayJyTAl45F?=
 =?us-ascii?Q?UBSuFC1kjZOBQmqLnlllZp+KUhLESlRfYbCwBXwxAZHiGujvEityL/z/aLed?=
 =?us-ascii?Q?XS/EnmwNxtjUm5MIc0N6wuPNsABCU7kVlMYVoNXn6h5ArG35xVZtfKzq19jC?=
 =?us-ascii?Q?xdd+mRKDpKKsFWBv7piSqJ++pO59WhrdSj4BSOGnyOmQVYomz6zvfzMdBxXo?=
 =?us-ascii?Q?hgIQrFseV8a0W6pOJKNrrVWW6ENOsHRX31CnM2ql4iZCywkcCmxJq3vXaQNB?=
 =?us-ascii?Q?7AdwOWU/41e82ApM7OiiCWJ97Bs2O49jGc2FMdnjNOLanRPNhxTaGlx7qdkS?=
 =?us-ascii?Q?6EDY4pu8sV4BNT4Ekir95gxpabSsgrBcGAygHYJCIC3YVzkpKSbZrbWAPyWJ?=
 =?us-ascii?Q?pVS7aABqIGDwiyOcnL76shWk1Sd24TsXsJTEHxQMLy3M5XllQujm2+K/xDaD?=
 =?us-ascii?Q?z150aLk6cAW6Gh98mfJ0Xgzl/F8PwV6sgVTpugaOg0lNyZfNiItbmJjTw5M9?=
 =?us-ascii?Q?yXezjhuHD0KeI+X/XG7ecyIQgh4j0h0PRqfFr6fWMy3D1j5pmgdm25g9pLXO?=
 =?us-ascii?Q?jvoBnuPgkpyCvpYKaCe22zdWSj8namLEN5YjcbIIIdgfnRNeDCp+Q3o9zJ1q?=
 =?us-ascii?Q?LX3JEnsCJISBaXoMbLcVf9eUWoi7wRu0qzwcQ5Ag423CPwk/SlkTw9ZMpJKJ?=
 =?us-ascii?Q?FeqB6po6EkCMnydj1uUZuEMl+nmX/piSjXwwZvDzxQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?KWNH+AZUCMB82IOWup2zxHIuDxeWN0d9MeFPCVYIcejJBt3rEkhvsH/GswWH?=
 =?us-ascii?Q?JSmJUHEYLJz7jwPEp1/2pTxI2KIKFVU6fFJYPRnf0BAUtWzJMAicRXbDZ8TP?=
 =?us-ascii?Q?35LqhcYate2rRs4u29EQiuumjCIqDgv8ALhf3FpXw/rwU2oj+2tJjBUmgZwT?=
 =?us-ascii?Q?9rcnkE7X2S/pK+WaJuV2PcDnQud9S6Xygowk5CfCmh/yZ4TmmHd/vExbQ5pQ?=
 =?us-ascii?Q?Wgiqy03vv0Mnz2GUl3E/65IRFFXqS1Qx26W8gvezosN7ehvdXlg85tpruat1?=
 =?us-ascii?Q?S4T7bylUq2DPGlJONZwKYymE1gqvKn5b5UROFD5rxi9MtMkWsQOVL0HbYqM+?=
 =?us-ascii?Q?YCMfOQBDaq6G1J4ARN4BjTNomosy+1mr/969wbjN/nwmQ8ko+u3IfFvZi57b?=
 =?us-ascii?Q?K4/o7Be8F+Kuni50XUaIkRWMmX6IT6YJoOsQJx1OVRtnXi2YBJiC4uABoedh?=
 =?us-ascii?Q?E6ZGnYsbu2wp3DDJuQsJwYqiPcc3y+DySQRyvqqGTrP9na/tkJ9r8OJhSOL0?=
 =?us-ascii?Q?o8SZlpGbtjr9Be9cYIDDZHv9JHdQHlxVq4NeL8cXeMLBvrIdR0o5/cnuyr+i?=
 =?us-ascii?Q?ymIllD6SzHBtsyK3Sbmbd3bjzoC8THPOkKWDypcVaPZ9g1o6Wf2JsRMf89jX?=
 =?us-ascii?Q?pPNo7bGOc48n+xMJoip6O7yuvFky2FgEiL80/2iIGFh2r26Dvv1hcqynXeqd?=
 =?us-ascii?Q?D6CyxbLkSkVunORpR5qIOigQQzY1LyPVPlyFQoHxoJj5O2IoskFXXBNVzOEu?=
 =?us-ascii?Q?yps0EoxDo4tFfBipMD20jzOlFtJJ33Uyu6f+xQUJFJxpJWD9WxoVXAoMSyk4?=
 =?us-ascii?Q?Tb/w3AfNpjNvh8CzLIwCeywuvuhC+d0yKCQOcYoBrt1qj3qVnW+TsvlR2vWa?=
 =?us-ascii?Q?ld+bnkk6zVgBd31fcjDeWQgVOp5pT3wwduRtGgwcsYy4+cDl3sJtm5b2vUS4?=
 =?us-ascii?Q?HHr8m1tyQnF6UBjfzZwN06fDrDjZV3tKmp/0IGW+syfetGNUQkpaYCoDmCho?=
 =?us-ascii?Q?Z6dS9JDwU1lii34gBJgI8hgJW5DLG95ffwryV55+Ggg1+Dzk13N21NpiviXK?=
 =?us-ascii?Q?+3voHRTslUfT1EmmGG0AYeHbyt+luRs2ybOQEOIk3eIZIj7yrl8xHSpU3GrM?=
 =?us-ascii?Q?wU64HwJC3bb95XWvPQrvqDUnMl9PAl2j6+BiEZdCl7EKeIdGBgYnlKoJNZjd?=
 =?us-ascii?Q?GeeWgH9G9evsI03J9adwqTJJqNaU0sqCHukbIbnWOIlQQGBi53YlmhYjnMZ8?=
 =?us-ascii?Q?afly0LkfP/ylkL6NVXedNHPB9rDmcfPNfbyG1cNS3nPVwbmIzc02B4UjAUjw?=
 =?us-ascii?Q?9jxBUXwkt4d4kPnsYGwrE9x90ZjXXeF+a0QMSTEF5Yke3KiE8FQrzR1nuScg?=
 =?us-ascii?Q?n/pNah9yfQLEmgpCIzMkXkV84+/+kV5r/pRe45Y4G8c6m2U22rLJEX6lK1N6?=
 =?us-ascii?Q?U1z9QClTAhdV2qDKP8C8TRNlHFdA68XwLQeG1TkaTqpEr7Ia8jVpVGRUdSyV?=
 =?us-ascii?Q?rW8wywEChyA755mRX85kphBXy90R9CVXKlQMIzrRIr9ozZOQQzls3Btd1vCa?=
 =?us-ascii?Q?Ofo0kT7K061FgeITXa7nasuENkQ5X8DtLxgyhIqrSukgS3fMMzr/4rbRvqDS?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 312e64f1-40cc-443d-2784-08dcdc84508d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 10:33:22.7053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qcwwak0dCTzvaEE8AEQN0tQUzZsnlpQTq8/oS8OxKDNmvgn0DBCUXO3gFeN+hkwsH+7LL+1RsJpcY2Qt6ypwQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7257

Running the v4l2-compliance (1.27.0-5208, SHA: af114250d48d) on the m2m
device fails on the MMAP streaming tests, with the following messages:

fail: v4l2-test-buffers.cpp(240): g_field() == V4L2_FIELD_ANY
fail: v4l2-test-buffers.cpp(1508): buf.qbuf(node)

Apparently, the driver does not properly set the field member of
vb2_v4l2_buffer struct, returning the default V4L2_FIELD_ANY value which
is against the guidelines.

Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
v2:
 * set the 'field' in mxc_isi_video_buffer_prepare() as suggested by
   Laurent;
 * change the commit subject to make it more generic as the fix does
   not address only the M2M device compliance errors but also the
   video capture ones;

 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index ddd42a8f17884..60c55d6839431 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -898,6 +898,7 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2
 				 const struct v4l2_pix_format_mplane *pix)
 {
 	unsigned int i;
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2);
 
 	for (i = 0; i < info->mem_planes; i++) {
 		unsigned long size = pix->plane_fmt[i].sizeimage;
@@ -911,6 +912,8 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2
 		vb2_set_plane_payload(vb2, i, size);
 	}
 
+	v4l2_buf->field = pix->field;
+
 	return 0;
 }
 
-- 
2.44.1


