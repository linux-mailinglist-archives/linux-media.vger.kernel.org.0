Return-Path: <linux-media+bounces-40768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B449B31AC2
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EC927B4A97
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD143043DB;
	Fri, 22 Aug 2025 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d+2NdJcB"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34B82FDC3D;
	Fri, 22 Aug 2025 14:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755871589; cv=fail; b=ubBKOtKjCEdrD7aYNZVgKpfU8FW62lHSWIq9ddD+2I6mt0j9p8aSkmwNFrZNOnWEIxy19CZZ2dasOp40sj56vH6pagVW6O2jyYPqtK+tJja9Dft80q0UcHu/KjGE9NJ+xi8UGn+8NAD8D5wPhIesjOo3JwVtE+Jlc2FgIMTNgM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755871589; c=relaxed/simple;
	bh=dn7cwnMKKH7zltaJZG4pgRsXqguCMJGMlUIvMUOu7a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a6aUzGqE3jyxU8wrrrD1b79uDpE/cbuM/IDvOQ6yjJCVA+GGkYUxn0Bvrz4DAEfT4eG5lOzEtpVhYea+aWoOqwxW/uLr/XwW0lWDomY2uz6vnSkhijpnRfkBEOArrOdlHBxEY0KjqqwRsKm+GcbJFK0TqE5uYzOJ2zSRevQwnKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d+2NdJcB; arc=fail smtp.client-ip=40.107.130.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKN5UaRlKCZ4W1LL454CzUrOAWVetm72snA3bdLLcL7L1dT8ehNHFsP3KQP5GbZ3Em4craz6dDR+BzAe0wWsDbyaxrdQdEQzqaRVEEOgva4dLIg/2h5UdUm3MQ5fFVf6JSQfdWdLBDLZh78sZ4BoWJONsTHLIfizMD502OQR2bBOZvE5Tz5ACOoUSq5BQN3T8wkMJSRco1Lay5AMSyj6nrarfOSa2oNGlEPPlgo129Bq6KDJiUoeXYKCSdfky7nJod87Ju0Hpx9WP/lSWdv95in1qxaiDwh/EwzKAzl0uGDe502ekwMU8y6qSd3KYZluiNro5zuVVxUuJ55b0QOQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3C1E8RA58E9cOH5Wf+B+E+qYmlTNp2l9Cs4ov6ItMCU=;
 b=iCiKhjx4XvfL/RcsF/CUr5FTW5WEgp2prsFzrzmVrcM1BR0HBJgBxlRPmUDPZsA9ZCiD2X32kzHBm+tv0NW7PhIwNKvHDRQRw+eU+EFQH10OpV3v3SYk13mhewY1bTl6CtSNAXZ2XMd1/DWlXkeBv9rN9Nen6Opzjh/f1Nwv2Ed7Ye1MDZ9RzIxEpdD7JTwTQLQtrlIE7YQRb9psfOMDId6Yyb8o1TZgc8P8vCT5u3HT8C5S0U3eWnyXHRfIeS/swhy44MtiJIo2MRhN2pb0k+gvoKfqB0IVD+lVwukaYBjbq3VTXXiilud0IW8CyH9DbRUK3/rmlLs7sGQbhOGnow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3C1E8RA58E9cOH5Wf+B+E+qYmlTNp2l9Cs4ov6ItMCU=;
 b=d+2NdJcBXQKc50U02IsgUhHmp8jJ+ZKYq75KItPtx1tjxtd+AMILsjmPKiz/mSQcXooF4yB8X07hwd3aINs1ubiB7sqhyXAZU9scaFDd2WLhggt/yBqZnlqhC1NjaXI9SGPyR9Tmi+KddO76EZPTfObw4RbaS/bcQr68nDdkyBT0zI1qocsghVRC8jNXb5g7HBB9SVmUTYnbUdg5wD8593KHokTPhWjc1xjJoOIbFCgWa4mhA5rz3MI14YjCZKNCOWPxBelpx7o4Sry3CtzqKC8aTaOXq9lWNM0d5/markNkJJILAheAAnvin4Z3BqcVO5i+VJHQISsUwl2ALn13/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV4PR04MB11306.eurprd04.prod.outlook.com (2603:10a6:150:297::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 14:06:23 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Fri, 22 Aug 2025
 14:06:23 +0000
Date: Fri, 22 Aug 2025 10:06:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <aKh5VnsKNSFO8GzY@lizhi-Precision-Tower-5810>
References: <20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com>
 <20250822-csi2_imx8ulp-v2-1-26a444394965@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-csi2_imx8ulp-v2-1-26a444394965@nxp.com>
X-ClientProxiedBy: PH7P220CA0126.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::11) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV4PR04MB11306:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aef625e-ba3a-4dd6-469f-08dde18513c8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?cIyd9UcA0csNeqQTqMa0vp1o3CSWN/4XQlL57hTk0HL+vUrNCRyrtR3XUtjb?=
 =?us-ascii?Q?hrEbi1dnCoSWn72SikvVCvROQC+2o1jn1oNlWdsAKECEhPBnbNZa3joC9GsF?=
 =?us-ascii?Q?IuQHqQFV09EKlCIx/aQiNCfiNhalvowBg+YcOiQHHwl9PIC1GGYeepiYNTpZ?=
 =?us-ascii?Q?Efj2emZb/4C894GOJbDujeR5qKSO86QtqMNTG82gkMzv5fXqirwW0mpdEjLD?=
 =?us-ascii?Q?llmOHomNmyPrC1o0ZNtFi1ONnmuCgtjspGeeFibp0cigXftNDn9GvFrZOEZp?=
 =?us-ascii?Q?yCZGzAy9ADiA0HXZUjTosdSoZT/L4kXG4eA2Mb6vExhL+9+2Twdw+V3VmFy5?=
 =?us-ascii?Q?eyC1ov+8ER5ZWZKwRZGppxcPVHPtfecUHla7bgQDeXMRXVSa2oe+vXedvZ8p?=
 =?us-ascii?Q?VC/N/52G/4fApKDCr10HbXlGHHdphmuJkUJnmTAJnjUYE4SZKeFhq2IfCKUL?=
 =?us-ascii?Q?4TpXYa3PmNQhnsMVO8A9bWNs9/VV+Dbu3M0peEP8g/L2oMAqYeDfDugTm4Mg?=
 =?us-ascii?Q?ZwxK7c6pqdkLD7kGFX9tVVuNyk/JB9NIEq5fjolySRQgpMw1aAr7o8RbhyFC?=
 =?us-ascii?Q?QTMcqxkeV/ILTWWL4k8aazqNdJr86/T5CMOYof/C3EG/OVqVAwo5zbiclqqQ?=
 =?us-ascii?Q?N4qRDAHXvmo0wcCZYw3wZZontSRTAhLmYBhCYJp5Z8et5uWbXLcP0dcqqEmf?=
 =?us-ascii?Q?JS4wnqrk/XtkwuemLOF3kEPfeXVOMFppiqMSaAq6Ei0v4c6SI9OzQDvCG+TR?=
 =?us-ascii?Q?6iEC1GwYHoEHrJIsSbkMfglJA6z7zoGIJSbOPusk+0tFkPhev9pxV0gBf+Q9?=
 =?us-ascii?Q?+rC9u95+LNeKHNi+9RJceBvm+gjlPO/bKjeIaKeDP49/3x2sAoxhi8iaT34m?=
 =?us-ascii?Q?zd4SKttFD5OWPIJPZnTPjg0mRX2wxvzmnePKN2VIySsreRvwoEdMET8ePTUY?=
 =?us-ascii?Q?gwcwcy4qbzMzsqBwvxMN6pEDC469KTK0iz0MJUKA+WYO+LjgPKLbGHmJgQcx?=
 =?us-ascii?Q?A+45uZs6jai92Q45Jtbh0WO9E4U/DyCnLVBDmChAG1HIdQ0XnQC1KT92L9Ca?=
 =?us-ascii?Q?5SFXsAqdkf9iioZOp0Aw8daPYoVS1En8QEGAL+Ov64AP8NLCi/QswUPn8qIz?=
 =?us-ascii?Q?nloyISLVcuuOR1ktXFem0Q8bj+cTvMy3y4vO0PnWqWcD7N3NsHqY5J9c65y3?=
 =?us-ascii?Q?+cGGtgFgv0cYNXKJaptDBolTSzWk3lfXnHVLEo/OcwF6b8W9FcH+hd70IGU0?=
 =?us-ascii?Q?PvI3NxKh1zuG0APTioy1pMfgtYGUURAo5rBrGGSqGRN20Tuz2r+dX3IJyo//?=
 =?us-ascii?Q?2IaitHEp7uPXJdRZ9IAf7LS7OaTytYiEZUgQ/Cr1b8TD9Xv2Xw/1y0sTpZ8g?=
 =?us-ascii?Q?4NeYgTsKTUiGpi7i0U9CVu7K/hbCwP9rtQn+M+BqM5TfjSWcxJvlVy4NZBHx?=
 =?us-ascii?Q?B7TKedMz4w6jAlz00NDTTPV9MRinMmUMud3vzES0WBCJqix9BLtl7Q=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Sh/Fj8D2KstmPdN/Mgg7Fs5imKWuKkxuXTyi9JGHHIu830Jk1rEiHXBe6S2W?=
 =?us-ascii?Q?zmeZ3ppV0r+WMm50y7O4OVaob79zzZktEIBOGMcIeBg6L3U+Pq9mnpX+zZNz?=
 =?us-ascii?Q?WeEKpSmr0vRsw44fnNoXeraSQX2zDhd/NmZAOOLLnBZOjtMXOAz3d7J8uwoU?=
 =?us-ascii?Q?4FlL6ofQiRogmKSmSU9Rc/KhzKFdNmn9ThbbXh2/zc4FGv2kiO0sdOtxoOqw?=
 =?us-ascii?Q?x5ie2N7O72J4ST0ekqh/4CeytfLlLGSaSNU3DqjS65ZUJpdgqe2yUcsJ5b3F?=
 =?us-ascii?Q?lx86QhcF1GH2lV4SnDPZJzp607hUVGWE2kVhj+a4UmTQweGYmyalz8yZj/i/?=
 =?us-ascii?Q?c4ernQaq1pYWyvyGn778mk24gImrr/oc9f306ekpmobl3vpdz96C09pQ6hWn?=
 =?us-ascii?Q?RHeyQ3gtyOkw3GenvpgXuJ2i2w8awkzeSM1SpjqQ65t0Qtg3NaMkhuH+3hpV?=
 =?us-ascii?Q?tqHRSiNXmTkvxkhhbnn+SBsWG2lsnKtaQoRMoh+GoMmMHhw4+5USN/02F8oD?=
 =?us-ascii?Q?/mlhxKNrYEL7r/uflgPOa77CWDIJ10FqaxM9WiJ1/yNiU0XB5M4/OOLcwPLK?=
 =?us-ascii?Q?S0OUrjSV6HKi+47M7TxRBlzTDizgy8X9gw8ErrIvnskjI14FJD7+pdnVDgaJ?=
 =?us-ascii?Q?jEahofS7B+HVoK4vVUURc0BZ5M0N4jvkhNNgYN++jxr5YlZr60sfGSymjpsN?=
 =?us-ascii?Q?d6a63620NYmZvpatmb7OM113RmaOV4hhEqSiXLyYbdXbhmzYGzW/b7Q4A3c3?=
 =?us-ascii?Q?LD+BYChnM56rsT3YL3v6tgu+J6mw2PU6H76nbFf0E73z/OW148FYa6Utaba/?=
 =?us-ascii?Q?fBhzf0ZpTl8RothtzF+XA3PWFTg1Accfkrvl7ZitLlwFqTM1Ka0l9tM+Bist?=
 =?us-ascii?Q?oDdkgHwAqb4EQhhb1nX6tBVb8pWED6qzd1fYhZUcq68LWdGtgLBvJWAU48jP?=
 =?us-ascii?Q?HHFroSXzh0ONtit9TkbAJVOtrl0fHwoXi4F8Pcj/q1HIcwdKdqc75yA+LSzh?=
 =?us-ascii?Q?dQcX7Bw2NEeh3NGVQmp/qzcrluIVhDhR9ShimafYjFyiKtPViLW9HFmDkIpN?=
 =?us-ascii?Q?8bDRD1zayvuQxWtd7Y64uZL9vXlM6ZsAw/Lopr3fN7+y6wwiWgUBLCUOF320?=
 =?us-ascii?Q?sCPqJdIXMVYPrh+qKNZE3IYi8h00WNHGqDi0Z1ik4ok2lKYly9ETR6wCYvbg?=
 =?us-ascii?Q?BX5Ji+oo180RdtmP6enVniAG23kd5bDf/ZbioUWhCoGaM1IF/N4eRfIreClV?=
 =?us-ascii?Q?Y2bQv5FRaGcIIHPioYMEkU5KaRyf0GZxNKjxoxVsDfw/GD0hChRRrQK5+SX2?=
 =?us-ascii?Q?F7vjMfO+3q/lYuQEV0NPlyLrZMYsAAD/G/S0/hCbWnAjcRy9WKJtFFM+Ieha?=
 =?us-ascii?Q?PdIwSWMgsAXy81SCmpXSI9Zdk/5J06RSMR9PxodhLvHN/ytoE7csHT8XNQjU?=
 =?us-ascii?Q?nTjHe1EN+KpMJYK2yHA8VhZXeC1HO43g/wUT0bFp9G8QDHFfR5mnFq5gDowm?=
 =?us-ascii?Q?5G65yMUHGQgt4USmouyHhp8+qo0w03IxTtWhhG4zW8pfBm3bmn+f3F93B1gY?=
 =?us-ascii?Q?orXjqklk3lkHFLULxs5SFgz8yyHb/b9D/4OwP2nt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aef625e-ba3a-4dd6-469f-08dde18513c8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 14:06:23.6902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61xTQ8hfZ1Ak259/Kafh8PzmuQFPCkpq3aerTsbgVn/RDoH/IqTQi/9YfuL00cj/zSi5K3hjUzfli4yLx3dUqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11306

On Fri, Aug 22, 2025 at 06:50:12PM +0800, Guoniu Zhou wrote:
> The CSI-2 receiver in the i.MX8ULP is almost identical to the version
> present in the i.MX8QXP/QM. But have different reset and clock design,
> so add a device-specific compatible string for i.MX8ULP to handle the
> difference.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 42 ++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> index 3389bab266a9adbda313c8ad795b998641df12f3..ca485d1d596c274eb7e1f3cdc39c61bb54cc0685 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -21,7 +21,9 @@ properties:
>            - fsl,imx8mq-mipi-csi2
>            - fsl,imx8qxp-mipi-csi2
>        - items:
> -          - const: fsl,imx8qm-mipi-csi2
> +          - enum:
> +              - fsl,imx8ulp-mipi-csi2
> +              - fsl,imx8qm-mipi-csi2
>            - const: fsl,imx8qxp-mipi-csi2
>
>    reg:
> @@ -39,12 +41,19 @@ properties:
>                       clock that the RX DPHY receives.
>        - description: ui is the pixel clock (phy_ref up to 333Mhz).
>                       See the reference manual for details.
> +      - description: pclk is the lpav bus clock of i.MX8ULP. It provides
> +                     clock to CSI_REG module.
> +                     (see section "4.5.4 Peripheral clock diagrams,
> +                      Figure 76 MIPI CSI clocking" in IMX8ULPRM REV1)
> +    minItems: 3
>
>    clock-names:
>      items:
>        - const: core
>        - const: esc
>        - const: ui
> +      - const: pclk
> +    minItems: 3
>
>    power-domains:
>      maxItems: 1
> @@ -125,19 +134,48 @@ required:
>    - ports
>
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8ulp-mipi-csi2
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        resets:
> +          maxItems: 2
> +          minItems: 2
> +        clocks:
> +          minItems: 4
> +        clock-names:
> +          minItems: 4
> +

Add
    else
      properties:
        clocks:
          - maxItems: 3
        clock-names
          - maxItems: 3

to keep the same restriction for other compatible string

Frank

>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
>                - fsl,imx8qxp-mipi-csi2
> +          not:
> +            contains:
> +              enum:
> +                - fsl,imx8ulp-mipi-csi2


>      then:
>        properties:
>          reg:
>            minItems: 2
>          resets:
>            maxItems: 1
> -    else:
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8mq-mipi-csi2
> +    then:
>        properties:
>          reg:
>            maxItems: 1
>
> --
> 2.34.1
>

