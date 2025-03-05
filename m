Return-Path: <linux-media+bounces-27545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9544CA4F700
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 07:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A51C8188FF93
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A4A1C8619;
	Wed,  5 Mar 2025 06:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HevoCyzV"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013046.outbound.protection.outlook.com [40.107.162.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB965249E5;
	Wed,  5 Mar 2025 06:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741155485; cv=fail; b=dW7G9utqUXYB+t+6Bbm0VvKfpoUZ5xFVG6G96bw2CKk7POl3pZrDx5MXxSAGps4MM9NRCLT+0aJea4dYrQYurRhhH0lPEcow4/HtS2blXt7AORJt0keV4E/sXqanJO4gov+BkxMrgThlvnMmbA+S2+kyXFqz498Bxqy6qOBBB24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741155485; c=relaxed/simple;
	bh=dkOTKuvD9DjvJ658JwQO4k6aT5gfyqAU73QiftVE7KI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KdMj/HlmpjtyzRSrukUpESu1YXrZHEWKpuOboRdO1n+sKVOdzP+drg/hlUpi8xv8mHJ7IXVTwSTTr2GOk/PiTCxhGZeAlfasZwAHYBYpkgFJFtU1tFYjWu37Pnt4POfR8EwZ1p+WBVBGRbuvu+TpwN3QQC8ZIgVuXlJPkMlo4y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HevoCyzV; arc=fail smtp.client-ip=40.107.162.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCLAsopRhH9FqfUPEM+6qie01XYQfat119jbKpa7NRIefrvznvzOJCP9bXphFD6S6jz5nU7YcS2j0jOZ8IQDp6vxUraDtFNK/tm3Na2wyt3Qcy9v+UZtmkfU/tqm0bhMdqmJiinpjDAW9qNvjLojJgZy7THHVmUOQllC2D910MZyDn33gORXKWmwy+c7RkC+KyfdXVOZ35Jj1ZEClbO2sM9dd5USBisLxgL0FgHnP0q9LaNiVt7MyHdh11gzPmVDLHKZGx4qt2j5r2SQBB2FTm01JHe0JOLM4gwNnu2bDxm0i3izXhsqBbFNBmmtKHLLuRy+1bF2m9hLrfFItbN5wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1c6ZYCZp5klNQBFcGM3Y+zTeEUbR1gvPwTKtbfHzXc=;
 b=PIbI4oaC1/Le5fmcv3rpqV9YVnd7hvPD5NKRSzfRJF9+bOOSufPxJsLVDYAbsJECiLd6E6D3gQ4H6xxfnnvdjG/LawNRCUcK5AJRhzw3DOHXcJXfBVZJJVQH3E4Rmnfa06b5KhHyeBYJ0F03+sSgVRQ+oHE1X+ZJEfhNNtqXih3WQ+1n87EsmIbId7Zgw+PXQo/+tnS2eAdnIEwY5cpv3/K6HF2nzSQ9/Z6+Ao12/o1pIQIkRhOhhhegXQLhFPjOMlepitGdXtG6VSfCLiXiQ4rYq60D2mXw6wgiobDgsY6/Bn60T8nq2GRpk/fECSHo5hMZdVgqtKzDMhtRabHJdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1c6ZYCZp5klNQBFcGM3Y+zTeEUbR1gvPwTKtbfHzXc=;
 b=HevoCyzVZmUFq9l18m6A0ZckWM5ZOoUeVw5Oa5Z9dnXeWWC2j8rMJa3NdBfIFveiJI3Gfi3g7jJUL5v3y9/YchnYR2NSpeRJhpXa6pjrB9GYSJvt4PcbnsFQ8BRe/84ekFvdwcJLYdVpIZ24Fsq0tuFwQbz7PZ4J+PXpVMRpDhWHrkM7k888tmpAOJFkJvc+HdLftT8p5I5dMu1bH3t/zwh4NuyOPGz+OFjsEJ/GqttGh7qWyg4kgD0mb/5Lb9sRNJ2z+Ewa86pkInb4uy0dqF/jYIYs83YRRwZ501WetsNAbB8TiHzoNVMM9/3k1s+cCIyxm85I7G6QUz48P8XUBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA1PR04MB10721.eurprd04.prod.outlook.com (2603:10a6:102:489::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 06:17:59 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 06:17:59 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/2] media: amphion: Reduce decoding latency for HEVC decoder
Date: Wed,  5 Mar 2025 14:26:29 +0800
Message-Id: <20250305062630.2329032-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0040.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA1PR04MB10721:EE_
X-MS-Office365-Filtering-Correlation-Id: 0155e199-899b-42f1-601a-08dd5bad79f5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TymyqbN5bDN9pZ9gQNi4Pto9LRdGkmJlpCBwDTnMbBCL9MrQiY/SlrC4/pDU?=
 =?us-ascii?Q?7YDcI6yH7YVa6oVUR+eYkFhuvSiA5GAvcwhY7XgTC2bDglQ6E6I7QQCxPcZE?=
 =?us-ascii?Q?jGBj1jk5O//kANqsPHlyzAl3eVtOEgHTfaddB/7tAGMK6ymzeQab4rbOY4t2?=
 =?us-ascii?Q?s2LWrc2HsdeMQRq8CmPr5ouO9rbXkJ0qnnulvq/ZwkQPNhJ8EVGL4WgKhiU4?=
 =?us-ascii?Q?TwO2p+viPoFZdV7Hcm4CrPzmHKNFBFRunkyYNVZFmq3Frt27qDetF1zjvyr3?=
 =?us-ascii?Q?nniBIqXL+oINgxNAfD1hkhtqWvecq9hOlkwjwcdro3B5gJYb0qGVGchtp+PO?=
 =?us-ascii?Q?nDXt0X5cJCtOc4j4X2VWPH/D2JL7uLKIBIPhUYchMQwgOW4xBIwPO0M66kyz?=
 =?us-ascii?Q?kcT7886dRlix692lzE7P7YnJo4eKwkSfS/S9xN4qjzDuBRyYQ4uClizBO7xV?=
 =?us-ascii?Q?E/mpL5C7Zhry5c5b0OS97wqQxD2yOOHqIfurDvoH6XofkwbiMo/slIxHcgZg?=
 =?us-ascii?Q?KFmEioQgPA1KzT6kbh02BKVLhMgAxOARMAxLf2qCpMh6WSA5yZsfOQmMDVT+?=
 =?us-ascii?Q?hPx5g45WDn+Z3zAvF0F46sDOYcz+3QDgFKqpQ5ilVdbY8AX5rZhHpw9cNYt1?=
 =?us-ascii?Q?JVqXV1XVECJGwkoNnWM1he9KOTTkBelmsIdf/xDIak/Qi7N6tkGVv8n0Nuii?=
 =?us-ascii?Q?7aQeuveahiN+eTb40Hn1vWguqGbGOUYHtfC/LYm8XxbBXr3M8TTL0xo+HHHT?=
 =?us-ascii?Q?smdnPKALm24/pJ2gM+yBMKfLMBNMooLiM4ncY+bVcRAFH1Lu9orGQn3azBFR?=
 =?us-ascii?Q?VAuaU0/gZAWbijoPlTO4Dr8J1oISpG3UO0/5CwjkkDnGCBXq/mE0JbmQGWXw?=
 =?us-ascii?Q?uvvC4Gmu8fmOLuN9RyaAiMhqrlcf9tiMJQzFWnXTxabgilWlrbY35dLnBI6F?=
 =?us-ascii?Q?IqRPVKpaBV1htR9rPQfCmplY4oxoaevdfMzVJV5Ay0j6iFNjt08QNrxLxGtr?=
 =?us-ascii?Q?DCyoUCoIOrYb0+D1EYttNEV33t1w1VNVLOLyTpDmjVA9QwHfV06Oc3FTXZD7?=
 =?us-ascii?Q?opVvsKsjFNIHoeG5sfuXuq2IgWvLFnRnI1DnBRD9GRsfGroYUxc3JMaTXfiv?=
 =?us-ascii?Q?yyTFihmGx5vXg8FXfEzYWCvA2F/rhe/DBAxf6U1OxYI8h4HTiIt0gaBUGXWk?=
 =?us-ascii?Q?NmQb5vD4QNSEc4nproC+cqTa9f4/LZBcabmH+R9TmfozshHP3vWgJCTK5NTT?=
 =?us-ascii?Q?bU7qFcufsNCoHh+GTf/tYUOPavt0teL380VFZfkI3Uwf/lP5lPOYiaa9aZAl?=
 =?us-ascii?Q?HTrTC5/dMBHKYPQU+mKRNqBLTNsYc10yDq19NFsZiz7RMOih4+1WPiuRGHgi?=
 =?us-ascii?Q?t94ankzU2UzR13XP4BYGrCsZWdzFT21kZWob0eJ1y8zj1e9youDPr1ljB+P4?=
 =?us-ascii?Q?7r+0sK7GWrsZC/OTDp0S6zFzM+oS1QiT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uzA4Q3ofbGvQGyuX1PQmFWtojM9Qt79QIi6X93OTS3xe3MBT2t8pbyZQg0i9?=
 =?us-ascii?Q?ZvJAh79v85ufUNKoRIYnXXBKWUIVlyyD1bCvWRpYzlCzLxzBXVU++vqmylo2?=
 =?us-ascii?Q?xJ8ly5jtKCiFtHoXmBSxbxWLscG4c9nPgpGkgiVun3ncEUQQuIU3XvluMFz+?=
 =?us-ascii?Q?9eVzv3aFVesxBYeX4BZ371NcDkC+sZAmDIL3a0PoO/io+GKhbu39Cmuzg6E6?=
 =?us-ascii?Q?IybqylzildcJdO3VhPznyR2TrQ9MSJXV/VJTaH1c6EhJDqJs4k+REUTiimVS?=
 =?us-ascii?Q?WWIPGO8Fw/eREF1IsQBPrc8ETWf+aieDRomILoPsA0oZbQDlaLL33BSni5h9?=
 =?us-ascii?Q?w97N3HrT2uK1R5EvMdDYd/guQDb778kyR+sHjkgK9584CCZKN1qQuGYN6ING?=
 =?us-ascii?Q?dM3b6EjhyULSsMhKy98NVGJNnsnQ2qZ4cVIM1+AoRBKySlnSj53Eg7KojdK/?=
 =?us-ascii?Q?7nJ2K8PP5IMe5GsssTpBsx3yw+WhZnU94+tB8uNhkixrQDFJV1d5RF8zK8YB?=
 =?us-ascii?Q?vhWTcY15WLVJWEdSFljJZiMPKq5fk9fVstSsiHpm/09TXcsKVxKhq59Wk5IS?=
 =?us-ascii?Q?C6q+B727kZEPzb/8p8Tc0aZtq6yqCpuDcbKKGMXZfBZ90ISX2sAZQACaCPoL?=
 =?us-ascii?Q?1E3vdhqlEwqLv+bX2x66amxkV60yQANoM7AnuWOgzzrXAizRrn1UWaYI6MOp?=
 =?us-ascii?Q?NAunB0eyHIEzZs2qE9DbXo6Vmrw78U4211cButOlbZ8hy2A3StUM/rBlPPIv?=
 =?us-ascii?Q?yPxYuQihUIobmb4C5sobhLyrU5q7qMeJD35zwhpd86NJReeJ0lD7fCATzON1?=
 =?us-ascii?Q?Exg4Ac6kELCBmqjRA8/bDapLsCB1wYbYBLOGsyZZFDSpCVZOK2RrMVYa1Wrm?=
 =?us-ascii?Q?QnIYxOE9s5JhN3UjH9ekGa9x31volIo38pwwkxTtUW953QBk6iNPP+MH+GK0?=
 =?us-ascii?Q?1W+pT07YBy++K7SExlrsTMMKB4xoXtbO8yARnLslfgQsg9VnouPgN+R+zcNp?=
 =?us-ascii?Q?Ncb24sLk5omJ1GHSu4G5jWIXc9tYGXj1D2Gqrz624sn2EO/vr7niZy/79bGd?=
 =?us-ascii?Q?nbEB8vn50bd6a45pEqJ8agKmkyHwbhm5iFR/+5DC3Lm14Pc2AAzdUFyBdIqu?=
 =?us-ascii?Q?TZ6RwyU2Ywx4Z9dIzmDORfWuJ8N/PZgKsMHUXqWzcrr4GOH2D08xYp9vB8uu?=
 =?us-ascii?Q?qJD2PUq8fXMURLxy3qtqR6HMfh4znVswLk0nsQ/6buXTbd7lIoivfOCZrZJK?=
 =?us-ascii?Q?4eIcS4abNWSArBvi+8k5zH0Oy6ifzwKfQRy3ACfV0fXSI0G5jxyEd0MXwSf+?=
 =?us-ascii?Q?PxSpH73g4H2ieHbxqOfy81uOERvfr5+I8vqOeDwOzRpPttbXmIrmgfmic/7R?=
 =?us-ascii?Q?vEMN/7xEoADPLZKcMKeeLc+xaoXY98MdOZfwbq7MjykFUDXPQdWEF9o3qVFf?=
 =?us-ascii?Q?drFx96XxUUHCKs+VAOlQgivykMe6gWVb3cEyAV5s6rQkXghlFiyU0TzR/Lph?=
 =?us-ascii?Q?vi6ptAPBofzIaXKCMlxhnRW9uxdcVwY/JEHiXj3WY98fwIyq3uAobz7iD9B/?=
 =?us-ascii?Q?foM7kmtdhWGvsKMXx9eUyhiXWLR+ifw1VCOhVO2t?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0155e199-899b-42f1-601a-08dd5bad79f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 06:17:59.4201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hdGG5EzBT2u/mdrtlV5ueK7XF/XKuuZJQRHSJUT40gMC0zDNxO9CGktWFZT7wmHkobuvLa2AOXNnsmxLR7UeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10721

From: Ming Qian <ming.qian@oss.nxp.com>

The amphion decoder firmware supports a low latency flush mode for the
HEVC format since v1.9.0. This feature, which is enabled when the
display delay is set to 0, can help to reduce the decoding latency by
appending some padding data to every frame.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v3
- Improve commit message as recommended
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


