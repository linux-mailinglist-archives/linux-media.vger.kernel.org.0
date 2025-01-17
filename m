Return-Path: <linux-media+bounces-24869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E875DA14A85
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 08:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11D7116329F
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 07:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14551F791E;
	Fri, 17 Jan 2025 07:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CGm8YAnd"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011035.outbound.protection.outlook.com [52.101.70.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A481F7908;
	Fri, 17 Jan 2025 07:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737100683; cv=fail; b=X7VTwAFz3F3M8kTitlTvPFj5ZZWGFpDi46i+6HmFiuN1rng0zeziDOd/E9k2tdu0YIjyC9pAsdhmaZk+BZtzX4mdaa1we1F4lcjn/6DCaGRnU/j3Hrh5Ibok70NH3PcuZ8blRg5ynpqf3P/kAaHouGtSU7LxZGMmu6h/cbr9Hws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737100683; c=relaxed/simple;
	bh=zloIRkxfzChc5UAY41WeYHKmztAyrCxZj6thXGSGj20=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QNYDZHPcvcL5bSYqGKf5kuYIFD3Qj8heIrl2snV/E3YEFwW3Px1gIn+5bRqEcFcDSbTdoaECvBJz0HeodAdwa7rhbn6FMvT59bzHTYfTtlCIWg6uLyhdv5HhCgMSBz4geg2SOLjU4CZFGkruSxTIAw+wm807VZIPzIye9JC85Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CGm8YAnd; arc=fail smtp.client-ip=52.101.70.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GoFW46BjG/NIi9Iv18935KLTd2TdDwhlE0XY7oWDWpEeHsoLLkZR+1U3R9R1c1Q9TotFKEGZ3r+0AEzQTZj/KQ4TDEvFEDcZvr8ZbYx2HY7zurlehDEKp+FpXxE7LE/zj5AM115uCg8M63Q2zNZN3ZDWkSeBAYiKEK3xLgCim/HK0OX9FWDoKLMZW3f1vapfFe76MtXoEQ5P0heU/Y5T4WQhCVazAe1TPT89GySKTMi07clvvSRasV2pJVOozAEzTW2OMw1Mz39iakHi9cEM7JGtr2e6+gNm7mvr95vu+jcdEEVcWov/ZfhupYx61U5XYJ8c7pAi9U0sbHISpXd1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8supK/9NAMDRwuUddAVjDP6hqlfZ8jq/qFC7+pM/ckU=;
 b=cyItiwZQLNxm7+upiRzVIbJ4wQCeyYAUn8oFmNiJ2cyWTpkOJxPuviG4cdW1aIHhik1WbGJawgDxJHrhZ+hPypq6O9Qr0aM4SH+XclZaxFJPnIJHmXP2/bWXcu6spdiljlOXjqVrLFxlPpk2kWhRct09LdW/2FSlM18ONXXkzwJb5FTw2X2BzTNMoT9vYycYxJ5+mTzNqrUmNfP1NPIYsD0H5tQm+qaJOaugmzPJ7MSQQEJdzsmDI4HOtpayrMyXvIVf8vWAKO9bS3hZD7i5xiXylDtUth1QlnSV+/Sk7bdItLGV1WMspGvjcY9CWKHJx0Y9HIW4UStTOqtKdT95tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8supK/9NAMDRwuUddAVjDP6hqlfZ8jq/qFC7+pM/ckU=;
 b=CGm8YAnd3QAoPUfnKEusVSxVOsTjrt6BkCLNBygXMWzZ4nXLlOAMRyr+rDhKzHnL0kOadTtRZ8W5et5e5hwCgQpkknMRH3Ol057qCU6lfuoJFdJXCTltQkaGDZoqZUtzpKYV+roCB0d+1VOL2HJM1ZhJztToph9Sy0wMfk3YOqtEEzgP4cYtvTwjSsAPbWBZ1fXZm7+K3110NN4dIbyWeiXC0oj/+BXfSDjBzF79111ngkRVfAO3+BTIzzB8lRyiGMkHGB1zBlWGCx3TyD7V9/CuMZVUKF3eAMcDW5qSl9RNnzCLJv0HNKyGvNESZvnwJGeP2rpJ79NwjbICO1wNTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DB8PR04MB7115.eurprd04.prod.outlook.com (2603:10a6:10:128::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 07:57:56 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 07:57:56 +0000
From: Ming Qian <ming.qian@oss.nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	robh+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] media: amphion: Reduce decoding latency for HEVC decoder
Date: Fri, 17 Jan 2025 16:57:19 +0900
Message-ID: <20250117075720.4018076-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DB8PR04MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b256aa-020a-43cd-a3f9-08dd36cca723
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HLYdyR+Ha6tZSPDjPkfZMb8tETzWo1kZpIfNqS6f5jBwRgXoQ4fADP3n1D//?=
 =?us-ascii?Q?EpyaZQ/yUhfwlSTGgStWsimhQbe4tWqA72mhgiDXfLnME75yPcafQDK+ShM0?=
 =?us-ascii?Q?rlpCFhAfO8ubfMgzNh6A0uXCfUWsKcndZ5jnKCYuSelX2qCN+OtpKLgMczXC?=
 =?us-ascii?Q?kPBamY9EWy3sX0bMPur947hgtrGm2twRFcmyzLVMuBLmdYZ0/LmR5DOx4qR4?=
 =?us-ascii?Q?zSXIvNa7c0PcyqrctkNOnY9N6Sr7Rbz/puSdhG3DS5TUrbAaOvTK9IwKf44P?=
 =?us-ascii?Q?5A7qs/BNw2WaGAVfAHhmteSlEVidcWs/o2q4L2cUq49j3CKuFf8TUCSRwVkW?=
 =?us-ascii?Q?DtUmJTMfu6L36onsc0VuWPSigqGG6Wh7C2CUL/Kk6anzK4ZpBomcYDpyCmn9?=
 =?us-ascii?Q?pDTCEtn1lToDH3yNS+dkHBPaHdLwAy+rfgFROoP+GHvBbITqxzNbd2DFGui1?=
 =?us-ascii?Q?0SrfMvAvtMXXHhCblTNmYUsR/s6Uj8aJEvWqJCV6eJPI6AjPfQYYXUs9VTpY?=
 =?us-ascii?Q?xZNCWQyyJLksK0wvSWcVEPVoD8o/Ckbq3FDcR9bxIDIqSS3B+ddeyZPZ5DtU?=
 =?us-ascii?Q?tKddpzX0Wd8MIUvGHCljgGCM//4/B0DlbK5ffZbDLv9fiLOxGs/ud2B5Ff+I?=
 =?us-ascii?Q?pnBptCbc6d6sXj3EN+Bm1wjfCVgs7y7Wcy97J8rabg2AOd2W/PbkDYZf77V6?=
 =?us-ascii?Q?u9YdhK7pa1n7Pc5PYGlU0H2ODfT6kW85cDoQK6EGX/ZRW+mUOQ79qlNYwCHx?=
 =?us-ascii?Q?+bF/2n3V3yTyUPi3XI1MGzfyYB4v4vbuhowJwV2DYGuxaEXGzWg9wAoMhw+q?=
 =?us-ascii?Q?jWoUfVa5+/nOF/eTzSzr8qsyZtuPlBuAq92mbFcTNWXp9lMqXpiuUwqMhx7T?=
 =?us-ascii?Q?gH+v2xrid6Rm8ftQbwBbhjb54pQZ3XpixhJesDa1yqudcmG7E/ILYoBZll09?=
 =?us-ascii?Q?6OB6UoIAzxGvYnRB8eR+c2wkfNdAClUpicl70jPV7EsiTh2uwVFLh6fZev7t?=
 =?us-ascii?Q?5HRY2Eq6vjQYb6eMmN++IflczXZjw9un1kTlkP0WTNO+Srjb1rRz5F/zWsmw?=
 =?us-ascii?Q?8NxdkkXQNKiKUp8Xd9rz/jU/FVUSozuxK17ONy4XYgXWjvOr0Zrxi21aByv6?=
 =?us-ascii?Q?GX67D+dUcySq1m2nAplJTmUsJH0pBTfvuiNdDhg3m89M7yazRce5JSmYrM9P?=
 =?us-ascii?Q?lMNOBtw3U1HDcynQC0HtQlHB5QqKFSpol2NuIbQcQznbDZ3HKs9y/gB5P+7l?=
 =?us-ascii?Q?yBycDjjmZnRBLMgcU2rIkEJQfhi9xDEa2E5i6GucqfcDOFYpUc/NZU6d8DOb?=
 =?us-ascii?Q?UbI2hykRTmhVjN9Gn7nhSlZ2t+WRPRsTPs3hiKMhdshCsVWoOvJ5FiW9iLo1?=
 =?us-ascii?Q?mZkYXCikW6ZGWDeJikjbJUU0JJgMZoVw8D9y7RqI6f63QlyfDEP1Joc/yyXR?=
 =?us-ascii?Q?W3bkaCfsERKf951wfeyezMuV9xuvoFgR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AF+2AsuucvPQffiGpF3sxRG4vFnQgJqCHDT5KVW9H+EG8Nwwn6hmVxcvVcDs?=
 =?us-ascii?Q?DiTrYM53AsKtzAYhNL9jCF/ZTZgpfX41PO/syIpQ2bhJ4FgYIvZI9yKEhkZg?=
 =?us-ascii?Q?C5BAAMrGGZUWTbTJXvaiN5p6H4RXM9YeqAizwmU4qBzcovAZx0s4F8eeDLGB?=
 =?us-ascii?Q?J5I9GnXDLXP+HAuHdhrXDrT91dYby3+iZB2L2Sw8hBYZN+/jcpbUzt8Rz51D?=
 =?us-ascii?Q?WBNNTpe89EakyL8b5NTvpYjg5PU63K6VuZMBtWRJbJQgGFpzh+cqN1Molikj?=
 =?us-ascii?Q?oDan3JzMr+66K6X3kop6lUQeSX875rz4QZ9vA/cZ+TgsePTx0NMHl15adJn7?=
 =?us-ascii?Q?WXLdP6d6Cg6RQPpwyykSvxWY+xnO40fwfGlC4YaXPR28K0EnMsRWmgLdXA45?=
 =?us-ascii?Q?grHsihPGSsuBzqqM5Aqds2UuGgzVHwM2DkR1KVJ727wUnUhbdd80i48D8ktr?=
 =?us-ascii?Q?F6UvJaITOgF4tBT6Ss/EFHF+PQZr5+/PRTksdNK8wGgM9tB0akPPCliABi9B?=
 =?us-ascii?Q?cHbm5RDRZuYRmM9kh0C+7LadqXR/CDWzNsi7hM0uQzvhdGnCBhHmqtEPjnax?=
 =?us-ascii?Q?cJ7TWqENknsZgplW5VGh9fKZMoowaG0NrXB5quwL9myO0lK6ogJkDjaelKTE?=
 =?us-ascii?Q?HsGgOZCVWSI/oXbEw8QM8phOHakR2+Q8HzkTU3sLJ+fegrsdhmKcjOZ3NbHP?=
 =?us-ascii?Q?Oy/OZyo0yXSaopShxRdpBmGdBwmkDzVhllUDZ/2y6WjvE5QyLEJNtOmlAzw7?=
 =?us-ascii?Q?tz/KWYpvG0Jxs6G8ueRPVHONnF9nLOzl/MJRjLv7p2Uou0YK2tTvYoPMbcuh?=
 =?us-ascii?Q?4BfpyunJQU7xBskPTLemIdPtb46oc6+4CCpGNd1HzszQqy3pQvc1+2LB1P88?=
 =?us-ascii?Q?9RZ8Uhf1A5uMTyxEtkdewI3RxwDnRoCNBTK43CkvP9agCmYvNpmQafY6TKDL?=
 =?us-ascii?Q?sWAz0JicXYDvtxd1Yn5T3F14EI+eplULRsvHU075cgMM+0RbTxBWbNCkQlfY?=
 =?us-ascii?Q?Vm5RY5lxqHKRu4RuK/PDqhxsCbJk3xRXM7K+XtcTjzklYocHd9S5N7JFdRUe?=
 =?us-ascii?Q?ljcXxMM7/2xRt5LKmN+Kt45njm84IiQxBQkt0nM54sJxeTv0d/0TdfdQvsD1?=
 =?us-ascii?Q?w2omzNBNsOPnpK+y60641nhKDSjxUfGUQzIyR8CTXthiYeMlNQMwQPeBSAxw?=
 =?us-ascii?Q?j8ljxQBLUesNQY0oLo2NvXEXGiKxuL5/Z5AiTuNzPxFNA7OiSpxhtbIdY3JF?=
 =?us-ascii?Q?oG0ggn/ORn9hEy4RRnuZH8mP0wTRoBo9G7uvyr8QMxhh5Wor6DL6dTahjFnJ?=
 =?us-ascii?Q?Ng66HiI++VgZpIYIvuUYgQgwEvfhqwA85ITHOwwCOTvBppYcp4o2fztoLH0r?=
 =?us-ascii?Q?3ZjkBT2Q5govOF9qtfuTjfLNzwzi3p6tnDeKYplWl1OiVbZChYSqs6gB6IzQ?=
 =?us-ascii?Q?TFt8P2c40kjly+OGizEUjeWkWLnq2etpk6jgFGf8lCmTDwubIsRfRZ9fIysP?=
 =?us-ascii?Q?n7JmlkHUJYwd/Bnk4X24TETO7HStBkGk/jceCGoIFbCxmyZH9Izk5iKRn80u?=
 =?us-ascii?Q?lgox1GMG0JpHrOGEVsH8uA4In0tOHfqhypOFcr2P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b256aa-020a-43cd-a3f9-08dd36cca723
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 07:57:56.3825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aq4od4BnlaAipV2F+7PR+nyFe2KW5MSaIq9adCXqyANVfMaIMBhPsZF1aZFjdoCaZ0kobMwd8CzkyP+AN+FUdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7115

The amphion decoder firmware supports low latency flush mode for
HEVC format since v1.9.0, it can help reduce the decoding latency by
appending some padding data after every frame, then driver can enable
this feature when the display delay 0 is enabled.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v2
- Improve commit message
- Add firmware version check

 drivers/media/platform/amphion/vpu_malone.c | 22 ++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index 5c6b2a841b6f..1d9e10d9bec1 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -68,6 +68,9 @@
 
 #define MALONE_DEC_FMT_RV_MASK			BIT(21)
 
+#define MALONE_VERSION_MASK			0xFFFFF
+#define MALONE_MIN_VERSION_HEVC_BUFFLUSH	(((1 << 16) | (9 << 8) | 0) & MALONE_VERSION_MASK)
+
 enum vpu_malone_stream_input_mode {
 	INVALID_MODE = 0,
 	FRAME_LVL,
@@ -332,6 +335,8 @@ struct vpu_dec_ctrl {
 	u32 buf_addr[VID_API_NUM_STREAMS];
 };
 
+static const struct malone_padding_scode *get_padding_scode(u32 type, u32 fmt);
+
 u32 vpu_malone_get_data_size(void)
 {
 	return sizeof(struct vpu_dec_ctrl);
@@ -654,9 +659,16 @@ static int vpu_malone_set_params(struct vpu_shared_addr *shared,
 		hc->jpg[instance].jpg_mjpeg_interlaced = 0;
 	}
 
-	hc->codec_param[instance].disp_imm = params->display_delay_enable ? 1 : 0;
-	if (malone_format != MALONE_FMT_AVC)
+	if (params->display_delay_enable &&
+	    get_padding_scode(SCODE_PADDING_BUFFLUSH, params->codec_format))
+		hc->codec_param[instance].disp_imm = 1;
+	else
 		hc->codec_param[instance].disp_imm = 0;
+
+	if (params->codec_format == V4L2_PIX_FMT_HEVC &&
+	    (iface->fw_version & MALONE_VERSION_MASK) < MALONE_MIN_VERSION_HEVC_BUFFLUSH)
+		hc->codec_param[instance].disp_imm = 0;
+
 	hc->codec_param[instance].dbglog_enable = 0;
 	iface->dbglog_desc.level = 0;
 
@@ -1024,6 +1036,7 @@ static const struct malone_padding_scode padding_scodes[] = {
 	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x0}},
 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x0}},
+	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x20}},
 };
 
 static const struct malone_padding_scode padding_scode_dft = {0x0, 0x0};
@@ -1058,8 +1071,11 @@ static int vpu_malone_add_padding_scode(struct vpu_buffer *stream_buffer,
 	int ret;
 
 	ps = get_padding_scode(scode_type, pixelformat);
-	if (!ps)
+	if (!ps) {
+		if (scode_type == SCODE_PADDING_BUFFLUSH)
+			return 0;
 		return -EINVAL;
+	}
 
 	wptr = readl(&str_buf->wptr);
 	if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + stream_buffer->length)
-- 
2.43.0-rc1


