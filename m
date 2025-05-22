Return-Path: <linux-media+bounces-33150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FC2AC0E39
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF09D1BA8092
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9148628C86E;
	Thu, 22 May 2025 14:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="lRqzMNoG"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530D428A1EE;
	Thu, 22 May 2025 14:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924543; cv=fail; b=E9/Pf3vnWffxm09jnzOpfyHvvJzjbiwD9Z2ZepEFVtbbNhD60b7M7vgrhDNIsg/Sr2xmSopcL/QPeTSyHaxjcUjVZBGfbVxEc62Od7B2sOTCPGw/8lCH6wRyPrq6Z9kRly/IfY3QbIIC4B2CPOiUKqT6TuGbRftbGhNCwCzVKy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924543; c=relaxed/simple;
	bh=NstTd+C8GlzCMnrOSZLpB0mH4EhSO1Qx5EQ9kMntzjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S/1PkpWXWtbU703Yyfsz1wAJ4XtxSbKiviOopBJkvnyZz/tdl82m08IX3MJdxUlRx/5S/Hj12N8b3nYHZgFYVmJE3yyOpCkglX5ffAO9uzUH4vcyGQzaD8DjKqnKeHNwq8vHdrQsdfG2nrsJPYlo2ft+/iDOvLZ7zNQtNDBMRHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=lRqzMNoG; arc=fail smtp.client-ip=40.107.20.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy1ss1003x1U2y9QjSt5N0aB0MJ+Rk4wroYHdi4dafFew+0D3ond7NOY+x+dfQ6lUz8sOnsPJ4jN9XqcpbFRvOF3dk+N+D91Dz7AXtliI4GudWLC8AMosT3WPiD3xVcDZlonJO6eF2VT4Z/FsSwCI6hkqwhRjLcwcspFN1KAx7tCUA2Y4nxRnV4UMm4jUVuFcSxWJXa9DwsnhMQtuPhUTnTsP6+o8QCLEAlAmVocXSRuiKzhNemDIYmO4VrqXJGNZziNYbcMpcfVD67jEa7tTnPFoAMxlPxFupzV9fEgzZbImPAUmdWqBjJGVMlOq8kEvqIrXbdfux9baQFvfi8X3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ez5frIHCpCaG5LWVaidEt551wM6S4v7q5YLEmwrSDCs=;
 b=UQ0E64MveMom8yVaAEML2LwGubvFco1+nE3bvBG3Rclqd5Nvc3wY4cItXjQkIpvvR684OfjVPXhpDnxBi+dQdNBhOsFufIyuVrHoB7dGHR88y4n8GFTXUAo30M9GJpYxdEPibEFVElM2i5cREoSR/3sBytPTBOR3nXCQHvKyiZlPjqNmxDzjB4SuMmjHUrv9T9wp3r4dTma6XWTO/nFx5d2YogW6kQckFPipiwAFTyEBu9bBuuYqQhv11iK6Rs+pvoOTiYzY4yrcpS41VENQxaRJ698kwVcVSU9GcFEZQ2rFVYjcQcN0M65aY53vEh+hbj6wSfSaFhYQv+ga5I42+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ez5frIHCpCaG5LWVaidEt551wM6S4v7q5YLEmwrSDCs=;
 b=lRqzMNoGHfjjVOdcTbIfPXNcVcOhTL3cNxXSbUKiAQ+aBDYRU9ptkxYH5kkJFZNYPrSC2JeZ2HgOLtqzueNhwtSFQ1KlrslPa208fVSimolyVdcRJQSCrcePmJ72G+f1RlunII9Igv6pjVYcaAy0jxu/Oe+NARzygIVRUTZb1CfztSyKmpqOXY/vYsun8BTiw7UhSaYDtL9ICtQag3IFUvd4eBf452QCSlSJkTuDt0Ym5+A3IqAENr2IBp3Pp2g4YaL4qYVYLOtl8aY1nrxhWDxifnrqDdnu5fzHTki1VZUvMXSZQKwi0pwEzY/mfk8hTZi6X4ekEefvEjJ7rMTMpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AS2PR03MB10153.eurprd03.prod.outlook.com (2603:10a6:20b:64b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 14:35:39 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:35:39 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/7] media: dt-bindings: mt9m114: Add slew-rate DT-binding
Date: Thu, 22 May 2025 16:35:05 +0200
Message-Id: <20250522143512.112043-2-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522143512.112043-1-mathis.foerst@mt.com>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0105.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::20) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AS2PR03MB10153:EE_
X-MS-Office365-Filtering-Correlation-Id: 9afa3615-54ad-4e05-3a7b-08dd993dec14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dDgNjSl31QboW5KYt3hoSCf4aNqz/tiWNP3di+zpJCaZFkafOr0vscF31Ead?=
 =?us-ascii?Q?dBrfHWM3kPZgW7Ahq1cHH+EfH0HQhCmurstBrG6nfZIcPCW7keHPzRF7ArAm?=
 =?us-ascii?Q?Q12PbtsOsDoTLgBeWM3DRwFHRd7JXqGxFaQ+7wRJ38edlVthwZIxGaMj0ptA?=
 =?us-ascii?Q?TRbeCdBkfX6OQsabQ7ul+JeFaI2KRMgacR04u4HdVaSjTMC7+iryvPW5MdSI?=
 =?us-ascii?Q?VLkGSsDYpSck/SZzFVo29M6ncOF6JTlR6MII9Y1bCCfPDb3mflfNcxRouhD2?=
 =?us-ascii?Q?KKygUNgqr61EsEsjOOyfLEeB0bOwnCq+Ua9ZnzC0fjAmqtZ6cGBdK8fhzAsR?=
 =?us-ascii?Q?6gc+Y5MN0FlwqOw7fK7zVP1cNyr/VbOB4Wvcf6ESPG1Ezg+GdbLzoTDODla3?=
 =?us-ascii?Q?W51gjlnhhRJEtEJv4AVaZ7V6KQwMPwNdngSEQdfzwRLYAmuFORoLmLtgyCoi?=
 =?us-ascii?Q?x1MSJmTYOgJolJrIJM62WNDe33FfJr9KTuwc+EdtRRMWu/qPOOEEIHk1eJZZ?=
 =?us-ascii?Q?P21bZ4AU28eWlf4pYbxKfBxb3XOsyOmJOXiWXFjMir3+wtV4gW3RHx/DgpeY?=
 =?us-ascii?Q?guE4hczlipDAIeQOgtu5FVweMlycxQ5SSQLa+foEx2TimTAnFKSKfqM/6yxC?=
 =?us-ascii?Q?Xj7LqJYo1yb6LLQ2NV65Xouc0IcMjHwCW1Jv70dFGRCIMWoy8zS9g0W0xpor?=
 =?us-ascii?Q?jSrG3X1mh3xsmwnccX1zCGVhdLCGC8oPGLhE6o8i8uCBfz+k7gD0YV77w/lk?=
 =?us-ascii?Q?gRylOL2cHMH3nuPrz3R/VtPhvTLO6SIav9AzCIVH1484zvtzIJ3Ecs6ZmcEU?=
 =?us-ascii?Q?fW8XgAHIw5wmGL+UzlZni3HgkyOL2ZuFaqDp3MsJl77dwpJ1fX5FZcPrJ3nf?=
 =?us-ascii?Q?o1yZxQl9C8B2+uTp/LRsmIS/DeP8XvCnlgl8b1Xzxou9+t7VphoVwp65/sJQ?=
 =?us-ascii?Q?SHvAunC75471zffDf79ZFtjDyIxKZUWFRlCNKVvUB9owAXNBJA1AViXORKh3?=
 =?us-ascii?Q?zcHFSHjtJu5N/VK5ONLywWZCnehCfgJBcZBOmJxvKsf9DtA/HLUTypNqVyFc?=
 =?us-ascii?Q?PbAovEFfvzC78y9e5NeN/VzsR+bwlZKS3Et2W58984O8kIha7LK7Q/6NG8YC?=
 =?us-ascii?Q?GWgbSK6rgEJR2xNQ4F/9wU40ZZuS1Ih8vT2fmubihevzgJ6XEzSeSzpreRoV?=
 =?us-ascii?Q?9sK5Es3oT1U+kS21p4uW9B2X1ewc3DXRkPFijsFPjNmhDs8s2XEi/gwExhjn?=
 =?us-ascii?Q?9cnb3gAAdoliVboE2Mj8amKv5yl6qYR0FlQSCixo9dx/gCuytILZfeU+G0NA?=
 =?us-ascii?Q?MNH94nb6Gfc7u3JGe2Mf+OGtMDFR2sZ87nlaqFHkXzFhxvwQ/6NJf/LuHEVH?=
 =?us-ascii?Q?edfxZ4xn1jty9cGqCSqafLjqovxN58meULWFiBqxzVK+Y/9F+LBdWBywssx2?=
 =?us-ascii?Q?UxRihNjPD5ISE+0YpDaMvxW8mvInOpqYoO/x5kHMoU4e5dzNzwakMA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7u0NuStoQ0W1PlpcOBRxIM3K7crb6i6jFIdV7zxVUCnhgVjRAiwrCLakeL9E?=
 =?us-ascii?Q?UdmHJvgMK2jjiTGCkkM0cqnOvCoLAJ/mzwQe6/vyGHFjwyxD+BcIRxC/pK2A?=
 =?us-ascii?Q?9+R7gJTIAf2qa0xyIDqPUOXt65PlMT5ZrqxGbsCMrSK95WEta8zMVZO4BWSZ?=
 =?us-ascii?Q?ClZUfMoJIrSjTRuOWoh6I2kEruYjZiXWhByzK74h75C9nDGdgWJkc7hF7ek5?=
 =?us-ascii?Q?trWD3Bph4PeGb3848wxZeiE36qdNM3BDc0LtKnKQiAio2kfjsFv+GHNzsse/?=
 =?us-ascii?Q?6PAaDKisoM/TQCLxi3UIzX4JSLULAhh4nZX/ryG4CckuOmBQbMInrYgzcAjN?=
 =?us-ascii?Q?OYzSuhD5rDxCdCPkHIa2yDsJq0RYQYpODFhLk1c3NHSiPv0ULXy6z11UoDOe?=
 =?us-ascii?Q?+QYnpZkGr21IjayVdLyuwRaAatmZKkWB5gaqPDTHs/H6csp6oGuwKPDmQ+Ky?=
 =?us-ascii?Q?9j+tjrDPnBd/xP1c6PjB7kviECNX4VNqbXmhxpCD+cdLJuPmo0O9pTQPfimP?=
 =?us-ascii?Q?BWaPmabGckvld2BvY1+vFRtRG1jbJhc/cTXQ+pWPcTCA3b15bzJlUYye9WMN?=
 =?us-ascii?Q?+9/HOJjtzX4uF2VU+QN0TuW0SSA31iK2BOQxR7iFO89GC9GXyPpsb3tS7Xh6?=
 =?us-ascii?Q?VxTZkA0txpBGZ3TNhQJNOeFbDhh7/0xsvAEb2Ti/B34vpJOIey7KEUjFWyoo?=
 =?us-ascii?Q?QObEln/dx3NVJCWytLpg8PDFc+MysFsx0JGBWPs8LpI/LJ7Ds6OMKI/QHUt7?=
 =?us-ascii?Q?Sz5F5Pyde4vefmITZ5Li9eAjjFHTuMdDvB+NuIid5kV8xHk6LfeteNoR+cQD?=
 =?us-ascii?Q?qj/UWm1d8bpNOIMjIrdxRhb8ccKHxX+1z485XemJYB6bzglA99f37Jbar53d?=
 =?us-ascii?Q?6yfA1ARFq1Is+0DoAT4Yy5SuPbP95sTBIRmzHaYvLmCVyQzUQhMxoJKUyvQ8?=
 =?us-ascii?Q?/SWJFMXDwyiCFWOQU5BuzOhBzEFTM3ySJe0dFND9TQ9LIbsrF8Lf0tSos4pD?=
 =?us-ascii?Q?aL0Xaf2XXfThVoQ+xoNr4MIT99NAV6HgAugiWmFdYi076MOFKg6dtsEXONNS?=
 =?us-ascii?Q?vESdN73b+xo9qiX7gsP0D14PkrMKxGUDWrZqTdr0+vEHjPLoPouYeqKxhE26?=
 =?us-ascii?Q?gQObCCL15/pzGqGmDg1ge2dRvY9uG9lasVwCLSOTYPyl5pZNcbwzc41auL9e?=
 =?us-ascii?Q?fFyiFj5Ht4nm8BTw42AnfwJv/XVj13Qf18fXMClAIbTJF+QOa94yoCeY+6MM?=
 =?us-ascii?Q?91urF7KaB6wkCDBeMW4GmrSTRuBxkeWmliq825hqXinoxwDT5KRDjH4SuD0S?=
 =?us-ascii?Q?pUR/awgvKABEZ7wvtoky2589QwihJkJFHhnaUS7W2mks+JEQKSesg+Wbh3pi?=
 =?us-ascii?Q?MJitllJGMlXdCfPq54GlA+t+f+WbdzLwHU/E5KlL5b4jOwp7tEokXNGtgecl?=
 =?us-ascii?Q?zG79hfmSnsk18jybVBjOkuYeinQhu+x7q4cofs1k2773L/zlCliPDmPZkyvl?=
 =?us-ascii?Q?3/GFfjXd4DMhKvZf9V357kL6PhaeZxZrGmuhIhqeA7Co0Vo45J2773VO5uSD?=
 =?us-ascii?Q?Xq8up2Xe8OqEb7gTcNsV0MfNTLgJ9Uy1986Sw5PM?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afa3615-54ad-4e05-3a7b-08dd993dec14
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:35:39.0883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQdtaOT76s2qbHQX/2ytxLKhhayi5dqrYWMirG3QIhvOTCfqQMWCKkChU3Obo2D5a/GFVkh/RT6UwrhzY+HVDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10153

The MT9M114 supports the different slew rates (0 to 7) on the output pads.
At the moment, this is hardcoded to 7 (the fastest rate).
The user might want to change this values due to EMC requirements.

Add the 'slew-rate' property to the MT9M114 DT-bindings for selecting
the desired slew rate.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
index f6b87892068a..a89f740214f7 100644
--- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
@@ -70,6 +70,15 @@ properties:
           - bus-type
           - link-frequencies
 
+  slew-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Slew rate ot the output pads DOUT[7:0], LINE_VALID, FRAME_VALID and
+      PIXCLK. Higher values imply steeper voltage-flanks on the pads.
+    minimum: 0
+    maximum: 7
+    default: 7
+
 required:
   - compatible
   - reg
-- 
2.34.1


