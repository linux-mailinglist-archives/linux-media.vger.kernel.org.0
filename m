Return-Path: <linux-media+bounces-27062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8DEA4648E
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27702189C9F1
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8672D22837F;
	Wed, 26 Feb 2025 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TD3+XV4k"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5B4227EB1;
	Wed, 26 Feb 2025 15:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583538; cv=fail; b=HRZVtksHmz6N10ecmPMyfutaCL2Ojr5tF2OTEDcM2HsjsX3Vv7+Q4Nf+SEt0eJujtCbWXi7ijaHZUtP48dJyPxx/uSymrZwxVZbuf5+EuBe6RXrt6v+8IegOWtNBL/dODePioGa6SbEPiK2VPA9Rl/Wwxgsxy8s4vQe4XxWL24s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583538; c=relaxed/simple;
	bh=cF9wpA8XAhmDShSXhU2RlgzRnvv3u+SXE4OSiXkNLPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uSWKS5U7BPtm+6GvrS0JH4cARHNvmNfA91WBcuWSaiPAEVHYqMNPPakgRdPzR62OIQjTWx3WTMY17TnY0AkW6SQ3Zc0Jc68+g2vhA0cALXOK68UaRqIqp65by8qaf2l7MilWukwN6CKbQvgqRggNYRtIX2tViUTeYqmE8OtsrK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TD3+XV4k; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WG3qDud/0z9XEHjGiCYmXHIvFyj0GrRhB54oSlgFpFWWya5wtvDf4bCO6JE67birjyZ95OpzgskolxsqzidELeLmaFhOcQNXlckONvNBsQded9osNAUhUeq/SuRhdskadcelFCnv/v9M2EGsnR3LVSVpso1DWKIlyLCfP063mCwBGdPSWxyo05fPMYP36Sla5+BtJKvzWG0EqQ6Mjw9GKJXVxGDo1LZW8Hlit8BB8MqmQuniN5Vdv2fdzWEc/pkHrtgQVrBypYmotQUTKk7CoSMWefvpE96TX/7wIqaxs472EeqswvEbztLKkiU2vJ48kQuyVyBlxytjpO6Co7IZPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUdNFuf+p+rt8Ez7EJQNxigIcs88ficfH2BK/x1Kdm8=;
 b=L4xzmWqTTBMX7wVLly/TPKOBXMT8pHr0zf2qD5S3wvxvEoBDz8BUA/ejWqVLm6vcfoevQDakMgHDrKim0Xx8h0yzT22ZWCKrTsDTLpbflSj1wsSSv9VIVKkRm7Hvm0/sSTfljeRxjrGiGd21ObqjkkQFAir0dohA17cuODqrCMUD/Km9dvDkmV1B8Un9sKandIoPCOPWjwuZzgKVFQfo2i9KzS+kSK73ddDEID3FnTL602I8MwMGombHfCGTHHDPRp8aVWHkFimLWnAiJPFgIU2EKyBEeUD2bBhTVj672jJD2TAqpjJnO+OhryYlcv0RDX0yEVhf9/HX3DE/aABVtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUdNFuf+p+rt8Ez7EJQNxigIcs88ficfH2BK/x1Kdm8=;
 b=TD3+XV4kVDY8vLgkahokPat5Dx5zB25u+W0NV/wq2oHXD0HejE4kgwf83QRERVlYVBDTsqHoRK4CWgi25eu6iQXG+OfigopDIZcFhMUPGNm/+FlAmJkdXQS7h43P+x2iymEVFueief8A5CzMNDWIiJnOU4OVrdgB5DSI/mL2qdo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB10248.jpnprd01.prod.outlook.com (2603:1096:604:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 15:25:33 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:25:33 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/17] media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
Date: Wed, 26 Feb 2025 16:23:27 +0100
Message-ID: <20250226152418.1132337-4-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::13) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB10248:EE_
X-MS-Office365-Filtering-Correlation-Id: 44eb811d-4e84-4805-e23f-08dd5679cfa8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iOmhy0JBNQiOMuQ3KIbkSfIdywXPGaLFNvKu8VT6jjM7q6/ilyBeaiq12w7l?=
 =?us-ascii?Q?qSKNbQSu67fhBqWTU+CGH1pQ3+y5m8fIdbZaqQ5Tb7ehQcymc0GOEHAFxrnr?=
 =?us-ascii?Q?Uz08x20dCRwQ6YdCpydoUGafj/4kUYc8EWq6gZswy609imLPii3TxcIVgA+r?=
 =?us-ascii?Q?JU7XbCPkW4CAlooaMufIHL5mVJjBZVKXbqQ4C5PH711TmyqtUUqh8mXmE0kA?=
 =?us-ascii?Q?YSRLSlQW06v2HGLMcYNsb+wBVREorh4opXMNT7Yc0M8fipdozuebNOYbvAmo?=
 =?us-ascii?Q?CN5c5P20KrprNAyqzxVHbFvr/B3vTzbhXPYdYmRz4lFiBVaKQpot+Y3gI9on?=
 =?us-ascii?Q?dOL6tjewS/XUnkD0/Z83HFGSQ6BUlOYq3uA+HFPwwKrvp3ax9Ik9L4IQ2lJP?=
 =?us-ascii?Q?brws9WTZbKXi4DoNXFkbKURY+L3GtCd7HK3t+FcarxUs/e2MRXQXAzTAsnZP?=
 =?us-ascii?Q?j1J6RvyeRObbPV0XcgnyJYV/ahmNsXrE1BQMoIMyJ7EZOQ8mLxzSgSiBYIwm?=
 =?us-ascii?Q?f/BHRYbXZmJ5tL3ol0qP0mUuF8jEjw7DJPfz32FglISxJPyaxCEMRduiygct?=
 =?us-ascii?Q?djoMT2c705SxunyQFIDmRyO6N5+BCAC0kEO2AKUeaAlJr8Ze9DcBa5d9lNmq?=
 =?us-ascii?Q?kT4oN9GlKl1/V+ULtnVuJAMo90OEBwhCn+XwX/xEH3QPrasfBBuCi0pK1KXM?=
 =?us-ascii?Q?yoNg4hll6Ko1tEPLOh0zKbi0lWTLQZ0H1s0Vo7BOoGAojRGQ1Qiol6muQdm8?=
 =?us-ascii?Q?9a6DUd9zxqNd7Tpn2SWLqbOpnTYTmVyw5KrOpr/vOM1CZ7mJNNTjmEmuLevJ?=
 =?us-ascii?Q?UA99/LdKcCzCKCZtiFm7PJooRn/yUHbSKJ7PJjjhaAR4qyxFm0TmD/3ITBll?=
 =?us-ascii?Q?CEhZGNTOCKPpHbLQAVzYnvme6Vl+iBYl+xBng7XStZutyILhnm1X6VDjjBKv?=
 =?us-ascii?Q?aJo3QfYB86m7B7s8EEF0Up9dlplCWfbNOJmDBO7QzN4ZPRYyq5YRhH5eUMr4?=
 =?us-ascii?Q?OcT+HQX/O62GjOh/86d+OFd2j6rzD+u1x0ilQGeL4r28F6gRuZzjK3qbojLs?=
 =?us-ascii?Q?G/j7ZYOqJp6G9Gc2lb5pHLO46wiW8TLa+iATMWqBkrmGu24F8ezXaBW94CK0?=
 =?us-ascii?Q?PYVG5YB6XvAHzK/o2PxIPQk6v28DTAnLIpnr6Xz5GXP9bV/dcl0outp50pqe?=
 =?us-ascii?Q?ox8VJzApajKrAWkJBGdXg5ugpvH2T+rB+T3MUVR4Vd2RhBBpHFCqsa7yyeAx?=
 =?us-ascii?Q?ETJ726PmP8fR/5QAkRYzQ6rVtfURvw1grXXgCb3XRrMMTHVAZ18BdUHZNJ+j?=
 =?us-ascii?Q?oZS3a0v9y6z26QiWltY4Acl75hMYjvegPf2eOlbwfs5NhA3rnvNABixh5Pz5?=
 =?us-ascii?Q?vC2MSBUz3DSvk0+IgE+k/RTefw02sIWiy1UdTWrfMY6U7oRCImiqzTiHs4p0?=
 =?us-ascii?Q?QYMgrgeEJM3twescwTHiIGTzYEv1u9B1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dgBfwTNelmg9t5Bc8OR4SqONiceRyAyZwY9dEZNkLmZL1sTz/ozZVc8+xM2k?=
 =?us-ascii?Q?meqhWgfHExmMkYHjACUes/QQ5J/JY4jmPL5Y2ucW7l9tmGVevAWTBq/pJhgO?=
 =?us-ascii?Q?v/44hKXFsx5qQI0kv3WIkkvzEFfywdMMA2+U9nGAr1sAkzt8V+J+BA0iFaJg?=
 =?us-ascii?Q?SZpn31EI7vttU7XLSioRy3ztPYjVF4t9PJfdQIZwTj6L02oP6UJDKW627Z9o?=
 =?us-ascii?Q?058PM1epN+rHsdjhkG8pa6bu7r4L3WvpD81Vb8PRtqjJXYh4FR8ulYs807lg?=
 =?us-ascii?Q?U6FV8awUu5jrvkbHa/TUJ2l2Xg8LleACMvOB+E3HzRVVsJXtxayRlNYXH+Ec?=
 =?us-ascii?Q?7bsqA2tb/TEaWrXwHczOTdb+k/wyYkPp4O4cuc4Ul9FV/mHRKGCTOhk0QxDM?=
 =?us-ascii?Q?idFW9BVNspwY2FBXOZq+EAnKPVn2WSzv6JtBdfO82BahCQLxmWYWbneVqusj?=
 =?us-ascii?Q?ExDGeoCB8h71WRE+x8s1B0NxE4Xsnh14PZwuAfMTgTN9eX5EjkFeT51m2XM2?=
 =?us-ascii?Q?UT8MQquHofaeGJSVDkivBiUaQfPRJDQXvuMuAoRhLsPAGKPJE7Tm6pyOwvr2?=
 =?us-ascii?Q?/7QIyBCv0TClgF54D/Z4VfqLeGmQ736tgY88pbvN037jg1kIxmSDeo25YOlc?=
 =?us-ascii?Q?Vy/CGxgo8sVGrqVJpCzW5f/RPKI5UX2huDqRirjp1xVlKeQ/7MmHvBeaZTMa?=
 =?us-ascii?Q?EvvJg0BtThDOVc8UToY3pJw4aCQyljMmYwJX+e6nen1UkR8GkKErNt2VTwXQ?=
 =?us-ascii?Q?4p61lPDRrf8cfG+HAHRH8UzAwO9C+qNmvUOTbHGCenqROtHTLfYhEUq8LzzM?=
 =?us-ascii?Q?8LImm3PnFuJZOUbO3uqWX+KCc10CyDYURi4DR/HHBom3zn5v9BE48jBH57vU?=
 =?us-ascii?Q?fziJIavtYgGJu5Oewvjj+hcOQhQyAv7JWQ8tT3eS7yaT5qcpuKmT6fAQbTj/?=
 =?us-ascii?Q?dQUYKHGze1g9QqLCZEfxCGfIpwz6fZhYLUTUrEQBoKe2lSlPHuCjW/2FccmE?=
 =?us-ascii?Q?DV40ddz60MbjvJTQ16T7wRmOjJaXiQoFoF0OmP2Uw++H5r5Swl21M2beUVBK?=
 =?us-ascii?Q?s7NppLZ3Mn8PL6Q7/u8wnz39qh5ETWIqdP96d3VlmiuQAFkrOswOGbJVE1Ko?=
 =?us-ascii?Q?pRl5CYv/P4YV5HnTGL/vsFadyKmkAztO9WKKDSKS3VXK6wY4FR/ns37Lkk/r?=
 =?us-ascii?Q?xDcbeipd1uN2WgrRBZhygl4U5M2SAoR/1DYZccXh3PHVXmBIqUnldp368atj?=
 =?us-ascii?Q?gyRiMJQhSzUM3euWCnrWb5ii6ksqGRpIX6YrbSph0A6BfCdRJ4hF7F2ANWfX?=
 =?us-ascii?Q?asZmr4eENXGF1IfhGk8jFudCQWMaPCK5vR5UGq+AgCdv7KJIGsSXKcIyUCx9?=
 =?us-ascii?Q?Jfsc6sy3GgaN3PQTFp9j99oT0ONyLAok9FvgpsWmArDwLkm6VxCzIKXuDIyK?=
 =?us-ascii?Q?CdKbo9W9ghBvaIxo9wgHClww/TqAuwdBdkpp95O0wqGlgCyPZQIjZO9hIKsD?=
 =?us-ascii?Q?W8jbnbp+JP8WtuVNY6izVRU7OjSCkAYKn6WWzN28m8GaZZvlm33jY5tzuc+g?=
 =?us-ascii?Q?//yGJjPM4o+yLRbbHrdlo4luIyLA+G9kvqVC2ziopHbAqI3lKm98QAoCDcbi?=
 =?us-ascii?Q?5LOKW24h0rq9HBLVywOyXm8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44eb811d-4e84-4805-e23f-08dd5679cfa8
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:25:33.4606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQ6PXCG44bxeOLyBr/i0BiJzKljFBEUOY5GzZCJex9f/tqRgi4gZe1gsNJhZXsOuw3Qk4FfQ1xhvYxZjr8xRfgHUe5COAjbCyLI/9oL4LARnDf5ZQGyg80P5oxx3msLX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10248

The CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC has five
interrupts:

 - image_conv:    image_conv irq
 - axi_mst_err:   AXI master error level irq
 - vd_addr_wend:  Video data AXI master addr 0 write end irq
 - sd_addr_wend:  Statistics data AXI master addr 0 write end irq
 - vsd_addr_wend: Video statistics data AXI master addr 0 write end irq

This IP has only one input port 'port@1' similar to the RZ/G2UL CRU.

Document the CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Use oneOf for interrupts and interrupt-names
 - Handle interrupts and interrupt names base on soc variants

Changes since v2:
 - Collected tag.

 .../bindings/media/renesas,rzg2l-cru.yaml     | 65 +++++++++++++++----
 1 file changed, 54 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
index bc1245127025..47e18690fa57 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
@@ -17,24 +17,43 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-cru       # RZ/G2UL
-          - renesas,r9a07g044-cru       # RZ/G2{L,LC}
-          - renesas,r9a07g054-cru       # RZ/V2L
-      - const: renesas,rzg2l-cru
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-cru       # RZ/G2UL
+              - renesas,r9a07g044-cru       # RZ/G2{L,LC}
+              - renesas,r9a07g054-cru       # RZ/V2L
+          - const: renesas,rzg2l-cru
+      - const: renesas,r9a09g047-cru        # RZ/G3E
 
   reg:
     maxItems: 1
 
   interrupts:
-    maxItems: 3
+    oneOf:
+      - items:
+          - description: CRU Interrupt for image_conv
+          - description: CRU Interrupt for image_conv_err
+          - description: CRU AXI master error interrupt
+      - items:
+          - description: CRU Interrupt for image_conv
+          - description: CRU AXI master error interrupt
+          - description: CRU Video Data AXI Master Address 0 Write End interrupt
+          - description: CRU Statistics data AXI master addr 0 write end interrupt
+          - description: CRU Video statistics data AXI master addr 0 write end interrupt
 
   interrupt-names:
-    items:
-      - const: image_conv
-      - const: image_conv_err
-      - const: axi_mst_err
+    oneOf:
+      - items:
+          - const: image_conv
+          - const: image_conv_err
+          - const: axi_mst_err
+      - items:
+          - const: image_conv
+          - const: axi_mst_err
+          - const: vd_addr_wend
+          - const: sd_addr_wend
+          - const: vsd_addr_wend
 
   clocks:
     items:
@@ -109,6 +128,10 @@ allOf:
               - renesas,r9a07g054-cru
     then:
       properties:
+        interrupts:
+          maxItems: 3
+        interrupt-names:
+          maxItems: 3
         ports:
           required:
             - port@0
@@ -122,10 +145,30 @@ allOf:
               - renesas,r9a07g043-cru
     then:
       properties:
+        interrupts:
+          maxItems: 3
+        interrupt-names:
+          maxItems: 3
         ports:
           properties:
             port@0: false
+          required:
+            - port@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-cru
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+        interrupt-names:
+          minItems: 5
+        ports:
+          properties:
+            port@0: false
           required:
             - port@1
 
-- 
2.43.0


