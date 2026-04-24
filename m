Return-Path: <linux-media+bounces-59481-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKteCDgS62lsIAAAu9opvQ
	(envelope-from <linux-media+bounces-59481-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 08:48:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B6145A522
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 08:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D113E3018D75
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 06:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F68A35DA69;
	Fri, 24 Apr 2026 06:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wIAbiLAT"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013027.outbound.protection.outlook.com [52.101.83.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79421DDC2B;
	Fri, 24 Apr 2026 06:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013288; cv=fail; b=puAOZOvSNp2QU2nMV8luy+GQNuBABajRo7c+9iz/HHMWccVry5NISmxbeu8b1BzkAAvX8ngc5FDTT4h/OsvkEs+B4UVwYC3FrdkqKezzdrRAExJGznhwra4PaLdTcrNftk38MkKppv6ecm3O3RNccakoN78Ddsc6P2UsEkF53IU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013288; c=relaxed/simple;
	bh=pwEkce4XM8PYyYN3+Sut3Seajm4enQZ8Kkbnib9GgD4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=o6w6AnwwZ478sLPuhD9DeDwO8y4grdAp617MHjAR7DlMS6fen7uuRCw6T157/BDPtySoQ5Iau5SHQea1oFfzqQfL1EADbq+jnXuYP1H5NO9wfZPbIiWyJtrFoZ6Eolup95LZohJ84Nd42mRajDfcpzadmiMgxcpoFGgt4uKGJ78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wIAbiLAT; arc=fail smtp.client-ip=52.101.83.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y06wF7FM2qVvkCTKWMrlFxmLAKl/6aAxJ1ZhdRIFd7yuzKZx5kowsVR4kXbJEIlQKqbJMtAbCH/DPR5KX2Y0KoPDDbTT5ZnPjJc2RKdjsP4mWFCPYd3m90+gEKOH8rQi8auNxGRPQEtjc1svqFEkU3fVpF94gEn8E550DiFqeQdxOGdB9Tb4JNRArq2O8YCRFRoUWhl10uCAcAqG2S4dw7j+5Pp0G39Zp0PYXfTw9x5a+n8M1kV7wVBN4iUSaDFG5haB+g9LZ8euGeMnfOBOXNNyyXsBZyc69UZBN9weDHpFssHXadYwpjJw3FGtn1891MIzaPI9u618Bm5Vyq87gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugtIIw3a3Rrt7NM/Ow3hm9sQ97KPTEleeHCrULCoBLY=;
 b=Qhya0rRhdc5Xb+xRbikxqZjQrguf5PAhTlEHIGizfmMpvMnChF7oXOvqsLHDN8T09fYeoYog0jnTwwgm1Ow+5YqoGBFI6wLpwLOGbjz7Yo3F4jQFeRxlxkFhEsdrRs9Nvk1gC3p/ujQFAQr7kLS1S9wkPcm/F8Td7EzH03g2LpUGm5fS9J38PB6BEyobR9ZF2kFe8HRN5DTiYIi8lSxCyKLbgWhRPendgDV9SVFCYHRtWhlZMe2Plk59NOmPG5jtRElO4rIk+iHm60C8tErPQ4v6Yiu2jinDjSp5eXcdnJ/avChpgvBBhLGm/NvpoMDkWU5EQ4/JNTghldvY7r1ULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugtIIw3a3Rrt7NM/Ow3hm9sQ97KPTEleeHCrULCoBLY=;
 b=wIAbiLATU7qg5UcOMTIWIRwguUoqlyNUNte2TnXMROVNeFKruxgHJ3NXJ4unvsipX35O+/+VLgC0/xiWiYYurbAk+UcIh8ff2L0myBfZDLhd2Dv+5d5MbeX/ZY+bOcrotTnk5kw4ODg+QgR3tnilBGSA0Dy947AxWY0RiAwGF8akQpcDkZVETvXHVw3TzPFz4dFn00/biblVyxSvR35MMWLS6Lhi/9ewVeJex5w88nFKrSjK9PL3MTdrzv3BkmbkdqHNwhVD7Wm9D/mH4R8RdMlJm2A8cxDOMcncWpDCOu+Oz7XDCVSjHZwEfPdDBNX+rzsq/l+J7d75nrKesdPDbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA4PR04MB7903.eurprd04.prod.outlook.com (2603:10a6:102:b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Fri, 24 Apr
 2026 06:48:02 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 06:48:02 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v12 0/2] Add i.MX8ULP ISI and CSI-2 support
Date: Fri, 24 Apr 2026 14:49:49 +0800
Message-Id: <20260424-csi2_imx8ulp-v12-0-da148eabc035@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI0S62kC/13RS27DIBAG4KtEXheLGd5d5R5VVYGBBKmxIzu20
 ka5e3HUNoblgL6fGebWTGFMYWped7dmDEua0tDnAvBl13RH2x8CST4fNEhRUA2GdFPCj3S66vn
 zTIx3TEvvpfOxyeQ8hpiuj7y391zHcTiRy3EMdhuCaxCyFigYxgUBcpiHPs3t93GY98M0tf313
 HbDaY08pukyjF+PDhdcg39jEMteFiSUoLScc2a4kWL/l7J2srAtFRVlmTKhtbDOSnRdSfmW6or
 yTC1GoxwI54wuqXhSQ6GiIlOpjOQeuILISio3FFRF5Tors0wIozHEWFL1T4Eiq6jKVITO5SV0Q
 RlXUv2kADXV66vBBaZ0VPm+pGZDsZ7VZEqF4+C0UUHQkgJ9WqT1diBTAoZ23nqH1G4+6n6//wB
 wY4+0xAIAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777013438; l=2222;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=pwEkce4XM8PYyYN3+Sut3Seajm4enQZ8Kkbnib9GgD4=;
 b=HGtdha5MiGAy8L4co1mxR4XB7zFnWL0DTc8xmRcxgfGzgL75b10mlxiGr3VDxdN3rrb1Dd/Sh
 HtzRJyMVb/mCdRT/sI65nEsjZABQmYxvhgBrkc7no8eGWKIoUDVS0qJ
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::8) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA4PR04MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5b98f6-4084-4394-0af8-08dea1cd6e27
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|52116014|19092799006|1800799024|56012099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 8NAnwpcjoFYB9Zs1scmiGuokwUYbLCSQX0ElKmXoaIwPC2Mg2zc50MWdysGfdhPAgJFGSdcdT/v7hvTxvOoAEk7oXzLf5JZN52EtiaFQsf8m9fv8QLZVleou4LiGOGrCOWDHQdziC/S2Qaf7yGkQLu3qP3JS6Jv6HVrbs9vliqglIi7fZDpDNkPsEoROu57HMKIqkqyoZAW/5aGFS8SqZ5A75uqu0Y0SvD8RghpTG8eHPsOMEE7HxUjg3xHIe2Y4J1cU1qX6iMqdzd7tVBfOMiQ8ry6KwfVAnAOIZohycxCWZm262jlHd6k4r6qOp+XRpfyzI9eLS6iezSJl4vVK2TUOjBIZ4miAM+c61+EO7MNCnPxY+2BilllXHUEu8E81yDXNnzemsApHxtgdYqPmGK1nvXRx1UGygzjY/tGjiScTPDAsnn9YmOySI4GvOwGSUy9yppdoszbtr7hfrFFwQFp1Moo7F9j0NaDgy2qI8bybqHNgG7naHqB41GJLnROPtSXl7Dyx8SYxVfwEj0O9Zh8bwSCKhBTMrp2rbgd7Lx9JkSAhNXTPHCgC7RNXZaD4WxI1Y2TQOa1yrs6k+rzVlSHJjZEjNa6atBzRff2eNqZz8CWDi6+oDrPAsyTOhTENrgmGxkjAYk97ipIj5hnA6lvZGJrtGWzYG1oh8JALOYHy5dOWzf8pHoRGcrPCiBuscC34cJNky46V4H8Mtnbvnjdzaco3igbjOLP+fTSbXuk3kjgUsokREJHNUJauJExKwH5Gcpo4ulT89VoEbKy3vEsFigPevObXRlB2xjtLJ2ZkE6QZkdM/BKRl2gYJdXcJ
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(52116014)(19092799006)(1800799024)(56012099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UnpVL04wWkVKYkhaRlBSYUtMcjhPNTVIRnFBYkVHQ2pnSVp4NkRFSUI5aGNY?=
 =?utf-8?B?R3JWb2hPZkFkMU83UWZyNEs5K21NVUhqSGUrOUFpMjVrY3lBZGkwSnREVFdS?=
 =?utf-8?B?Y3AwbGdiOXpZZnJRRGhDSE9iK3JYcy9HcHVoTTl5Nk1LbEtSRlV2Uy9RM0hU?=
 =?utf-8?B?cXo3VFU0SWx5YnBwd25XUGtFRUpQcXdPMXNvZ0pUMVM2Qyt2dEE5TWN3Qm90?=
 =?utf-8?B?Y1N2M0Y1dzBKYUczU2pacFAwcHFTanBBZlFVa3Aya0J5UWxsRWZXSVhXWHVS?=
 =?utf-8?B?SFdiaE40QWh2a2k4UGhCajB0OVltVyszSGVGQlJCVnhSRjJRNExmTUdmTVZ1?=
 =?utf-8?B?QjYrYzBFb0gxS1FLRFlOb05PRy9EbU5OR2t4U2lIWHpRd1EyaGxkdSs2c2Fv?=
 =?utf-8?B?NUN0WEg1YVNjOEpCK1Q1WCsvMUNzMkZ3Q2Y0SFAvYUZ0YTk4cmsxWGx1MkZ4?=
 =?utf-8?B?UVRzdVN3SWhTb0U2TFliQk9TVlBrQm1ma3dRQmF3YkJraUlYL21FNjk4aEx6?=
 =?utf-8?B?UEJlQTNJQlB6ajMrdlgxbFpmNS9KY0w2cHdteWJNazVhV0NoSktmYWlSUVZX?=
 =?utf-8?B?R1RnZGpNNUNDK3FvNHZlTVhiNmk1MGUrWkdIaWhHZmF4Sm9hTWZpRW9nVmpo?=
 =?utf-8?B?SUxjQllzNitrRUF4U0J5ZHdEMlkzSTBtV1VsZWY5UXVuYWo1SHJ4RVNUOVh0?=
 =?utf-8?B?S0dhVUNkNmlndWlpeEtNenZDSWFBU1pkcXJla09Eb2Z6NFBlYUZZdEVzS3Zn?=
 =?utf-8?B?ZTgrbFpUQTdZLzdsS21YZllvK0NORDFwaEVGdW9CcGl4VUxoSDZvR2FJZnVi?=
 =?utf-8?B?V05QeGRydkVBWUo5RUhYVWx0Sld3RGJmUCtRY1RaWHkvdU1pcXJSY1VNWlBD?=
 =?utf-8?B?REVzRzhZMVE0b3V3L3daajc1RmNwTXRrNFZwSG8rblJUajNWRFpYb29XMkhk?=
 =?utf-8?B?U3ZyUTdGVHlzQWluYXBXQk9URzdJVTNucWdyaUZRU2hodmNSNHhpQTRxZVdv?=
 =?utf-8?B?MVorcFNhMkhObDZmaW5zTEZUR29hamdTQXVTeThsOWFhSm1FK0cydGxZdTVF?=
 =?utf-8?B?M2huMnA4NTNGOFJ6d3hmSUVyaHU2RHNkVENwRVJLWU0ya3drb1RGWTdIUENh?=
 =?utf-8?B?aGlVUmtVVnczbmUxeVIvQkcxU1BlaEVRYldxN0VMZVZsTU1obEYxdkgrd0xj?=
 =?utf-8?B?VjFmRll6b2ZYMzlDbzR1ZkxZV3phcEpOa3B1Sm0zS2ZaYUpMdmFIYkR1Tk51?=
 =?utf-8?B?WUdkcm5iL21BcG5peExWWm5mYU40WXVOa2x3VHpwVGJaNWREaldMZm4yL21j?=
 =?utf-8?B?YUo0TzFaRGZsdUdReXZueVRWMHUveFZMMWd4d3dCcDZjMmlxSnk0NDU0eXZR?=
 =?utf-8?B?SmxCeWJ4aEJqUVdIN1p6bmo0ZTVYWk9KR1Q5NUFnalNZOFV1U05wVy9sYXpp?=
 =?utf-8?B?ZGVJb25kZEIxRms4OXc0cXFiY3FEdGpvaVJMSjdTemVjcCtNT000M1BqdmtU?=
 =?utf-8?B?bjdtdTBHTkIzYkJ0bFhYUmFKNGs0UUZtaCtzcDJubnhMbmdPUnpBVmpMa1VQ?=
 =?utf-8?B?aDNDOGlTQlFMUDZ0L2FobFk1MjB5NFFneVd2dnRvajhLVUlLTnN1ek11STgr?=
 =?utf-8?B?c3YwMXpVVVZuTUQ3RzBWMDFlL0gvbWI0R1ZJeDI3MVhiOG05dTQ2NDVEbzZa?=
 =?utf-8?B?N2VjMkhmWG5OVnlhVkVOc3puWkM2NkhUcnF4OG1pV1JMTVFOaVNkaVRuMWJs?=
 =?utf-8?B?TDZneWlRWUszMkZnOXUrb045cE5PYmNQdnhZSFAyWlZ6N0RtS0FpYmptRUNk?=
 =?utf-8?B?elpna05WS2k2V283dXowRDNyYkJ0a2RYdmQxZnc0TmVEMjlNZmlFNkEvQkhl?=
 =?utf-8?B?TTl0d2piN0I5ZGI1THdxbXJidng3VjVIV0wrM00vNkFFekhLQlpVb21DWEdZ?=
 =?utf-8?B?MVBRMnF6M2x4WlRsVk45eWMzalIrZGNKRTd6L29UY0FCcHdlb2luVUVHc0xr?=
 =?utf-8?B?Mm5xem1iVWlsZi9vS0IxQ3VaVFNkSTVEZGJYb1FhcXdIeUlERFJuNUJpbzdN?=
 =?utf-8?B?cWpnblJnN0RCWUZtNndlM0NxaWJUU0hlcGJsRzIvRDc4WFNvc1h2bXRTNC9Z?=
 =?utf-8?B?STA3N2hQR1pSRU1DT2hKREorYkFUSlZ0bDMxSGc4dzZoNzBlMndXb2JOKzQr?=
 =?utf-8?B?MHhsd05LaGJtUG9TQlo2c2h0bUwrS1ZuUjcyZFJMQWR1d0tIMmNYMHh0d2lh?=
 =?utf-8?B?TjdyWUR1RU12UU5BR05iMjlreU5DTUdlVktXUVRmOUZnRW42RkZBSlBRdit1?=
 =?utf-8?B?akhheCtWY2VuSTIwWkJuVk03U0RZYmNuWEVHdWJ3b1NYSCtrci8vdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5b98f6-4084-4394-0af8-08dea1cd6e27
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 06:48:02.3090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwhQHT/4fsedevou6dKoW/ad53He+f07S2suOKyw1He7buDpGm2O3B4tKW7yuGXp9OPBeCVpjXFKucWokjxojw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7903
X-Rspamd-Queue-Id: 72B6145A522
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59481-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,ideasonboard.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add support for the Image Sensing Interface (ISI) and MIPI CSI-2 receiver
on i.MX8ULP.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
This was previously sent as patch 5/5 in the v10 series based on media
tree [1]. Patches 1-4 have already been applied to linux-next tree.

Changes in v12:
- Add one new patch
- Swap ISI axi and apb clocks to align with dt-binding requirements 
- Update commit message
- See each patch's changelog for details.

Changes in v11:
- Rebased on latest media/next
- Removed #include <dt-bindings/reset/imx8ulp-pcc-reset.h> which was
  deleted by Rob's dt-bindings cleanup series [2]
- Replaced reset macros with numeric values and added comments to
  document the reset indices
- Link to v10: https://lore.kernel.org/r/20251205-csi2_imx8ulp-v10-5-190cdadb20a3@nxp.com

Changes in v6:
- Update compatible string in dts for csi node.
- Link to v5: https://lore.kernel.org/r/20250901-csi2_imx8ulp-v5-4-67964d1471f3@nxp.com

Changes in v4:
- Change csr clock name to pclk which is more readability.
- Link to v3: https://lore.kernel.org/all/20250825-csi2_imx8ulp-v3-4-35885aba62bc@nxp.com

Changes in v3:
- Change pclk clock name to csr to match IP port name.
- Link to v2: https://lore.kernel.org/all/20250822-csi2_imx8ulp-v2-4-26a444394965@nxp.com

Changes in v2:
- Move dts patch as the last one.
- Add "fsl,imx8qxp-mipi-csi2" to compatible string list of csi node.
- Link to v1: https://lore.kernel.org/all/20250812081923.1019345-3-guoniu.zhou@oss.nxp.com

[1] https://lore.kernel.org/all/20251205-csi2_imx8ulp-v10-0-190cdadb20a3@nxp.com/
[2] https://lore.kernel.org/all/20251212231203.727227-1-robh@kernel.org/

---
Guoniu Zhou (2):
      media: dt-bindings: nxp,imx8-isi: Drop fsl,blk-ctrl requirement for i.MX8ULP
      arm64: dts: imx8ulp: Add MIPI CSI-2 and ISI nodes

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |  4 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         | 66 ++++++++++++++++++++++
 2 files changed, 69 insertions(+), 1 deletion(-)
---
base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
change-id: 20250819-csi2_imx8ulp-9db386dd6bdf

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


