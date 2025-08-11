Return-Path: <linux-media+bounces-39459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C864AB216A8
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 22:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDD3E2A6263
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 20:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E966C2E2DDA;
	Mon, 11 Aug 2025 20:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lpT1Jn0K"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EAA311C08;
	Mon, 11 Aug 2025 20:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754944983; cv=fail; b=Wx2Rc3rrh54uaeKO2LFnIk5SHjsSz7VC0KTC9oYPQgHzWXcbHo4OELLdBXUulWugXMFEfqTN0jYFSYe3mZRvHtNiRCaAkiXmU272Sy21ZaRrZBf/6NP/fzo3b0yHsE08QEto4QFafBdhS8I+6nfioXl7OfkbbXk/onpNIjcH8q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754944983; c=relaxed/simple;
	bh=lN5hzEuOgIhwLaRbh4WEg9SsPxrU/BIIhmvMMHQQeBo=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=NGQ4v0NrbZmo/Gb+Qv0KdUiU3JavVaf4sSLUAcG/H7TNxJO3uQufKmwAka8JcyYoxVPqsJUfFaZxR4J1nQMeE7I9tyTedH1ZvnVdVLjiptUVAHLS3uV45m688aMsON4N0O7WjTlW77QVBObOmAI0vIskuHmaT32mDULhaTSpUbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lpT1Jn0K; arc=fail smtp.client-ip=40.107.162.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iF9UdJNKdF78jzkPo84Cp8+4hCcpqcODUIMJ/pVa7AW67rdvuwuJOiu4aCyoBlrTPwd80YwQzjqzEd13kYEHx7uMj35GottxEcDahVt6w/HJi5ydXj1R68wbAPVw7NjfC6Prk39WQhuOlQWuPikX30eqAEl1HmMMTB/6EwaJuqYeN9oRrRjC5ShhFSUfRzDNA5U0g1j7g2WxBvifUpRxeBJXu2ZA3lzneQJYLLLPrBX+fqdDYQUigGu8IrDoP/H00RWRF44gddVtgsdEMdIIU/J99h7H+0O1zWRWUJ+xadJCdbmyHx0QDz6xhuKfnt4WeHTU1h6fSLNS8bLyGV+gDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xw7ghyS/0nwCpQcpGTSGTJhqgPzrFdH2kLB0pOWjTZM=;
 b=L8AVGmpJ3zIWGZyUtfXjrgV+/A6+TdzP61aXbaj2oXKC7Af3iYmAV616uoWPTj3lBiOvThs+o20HYm8R8Op1o2Sd79P6nwCbfSHnrVy5IgwHnRz9V8WWnLWG8KZ2Ot+eIao3YXxT2OTiPXuIkusjOlSdkRZ4P5N6O+NdFISzQGcv6OeqnG5ilcqwzkHu5mlIkSV77243OkExQTM0XiosZTS0zb4XlOaQYMa+txMbdyajKSHL56OywVDrXfp/Fv0zXbEnpzvyApHtWz6n8C3pUCP516gnrgrXDiac8ifeXIs7E+bSyDNiKv+DsXhDhgFFSJV9eWciFnNilcB+1dJ+qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xw7ghyS/0nwCpQcpGTSGTJhqgPzrFdH2kLB0pOWjTZM=;
 b=lpT1Jn0K2JNYA9IkCQgwm6G7X+UYqwrUtm8v+xEX6gTTDw42BystXfqXW5tp9NfRFplRuMBq4DWIg1yd7zqZmphV8ppPoyprpfDUXfC+DiS9oo2fRxsVmx2j3AMFX7cwmo/uO/0qIiPAn7uAugoMyyqgOFunfG8v+MX7Z+hxo2XkpRQuiJVmekNKCmV0Kbma81/sGEI3WsjfhkhIKlWBZaR/AfGOKIaePvgmxjO0Rdy6WBp7IvSsO9Pcx22JeyuJBUALIw4XlvEw+1/3L0TXHBO40Sh9iksny2yk+On3M0YmJbR4NteZlnYMeMPIEqujX2ATtCRKwTdsgYIWs8iXxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7747.eurprd04.prod.outlook.com (2603:10a6:20b:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.11; Mon, 11 Aug
 2025 20:42:56 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.011; Mon, 11 Aug 2025
 20:42:56 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 0/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Date: Mon, 11 Aug 2025 16:42:29 -0400
Message-Id: <20250811-ap1302-v4-0-80cc41b91662@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALZVmmgC/zXMSw7CIBSF4a00dyyGp5SO3IfpABHtHQgEDKlp2
 LvY6PA/Ofk2KD6jLzANG2RfsWAMPeRhALfY8PAEb72BU67oiWliExOUEzka7ZRho2YO+jllf8d
 1hy5z7wXLK+b37lbxXX8EF3+iCkKJM86qqzZMGnkOazq6+IS5tfYBKixSHZoAAAA=
X-Change-ID: 20250617-ap1302-4897c591871c
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kumar M <anil.mamidala@xilinx.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Stefan Hladnik <stefan.hladnik@gmail.com>, 
 Florian Rebaudo <frebaudo@witekio.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754944973; l=1501;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=lN5hzEuOgIhwLaRbh4WEg9SsPxrU/BIIhmvMMHQQeBo=;
 b=zDPevimnHoxOP1zwNaAVihYN+Wd7rSWqcmB6a6x366YF3B9JfBBOCm1HY4NcmT2bZf3VQUYpb
 w3Int8HAGPiDN0cdf0k1JJr9WJKy+fv5trsQzAi8F6HGvzTXfJ1xinH
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AS9PR06CA0746.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: f72e0634-8733-43e4-56e4-08ddd917a67a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UUJURnJhT2tZemJKYS9TQlpjOG9kME5BeTJIc0JMVlJ0RnY5cDhsZDlKVWd2?=
 =?utf-8?B?ckhWMkhGWndWdUlqMU1CaEk1NldoMXFkTHFXSGZHYitWc2Y5R0dOSGdwWU95?=
 =?utf-8?B?aEVpdjUvN20rYUhUN0M1Nm5YYk4xd0JFd2NGdWNmdFhFaTY4SWVjaEtBV3N6?=
 =?utf-8?B?WVY1N1RkaGkzRVRkTzZnZ3JCckdYUGpMcFcxOUFGbzNIenVCYUlFcmVvQ0RV?=
 =?utf-8?B?T1NiVFBGSytvTHZMNU5ndnFLVEx1NVBudmt4N2hhYkZyZFRyeVRMRHExVHJ4?=
 =?utf-8?B?TG92STVpMjhRNzRtYXlkU1dLL3JRYVpnR0xVbVRjbmhaT3J1bzh3TSsyK0NS?=
 =?utf-8?B?T1BBQi9jdGZnOXJHWnRITnVOUUorNDVXa2x6NHBPZGcrdEZ1SE16NDRaTUxy?=
 =?utf-8?B?UUh1SFdiWncySWlLbk1ZcEgxd2xrMVNIdGhiMDR2SDF4UCt1TXVBRG9hOWFJ?=
 =?utf-8?B?L1EzZFZSODBaYndLVHVSQnNHUm1zdHIxcGJoa2RjNFdTQ1ZOWjlQd2xkbFFZ?=
 =?utf-8?B?TDMwdzV1U0hmckZOTGJucThHa0ZHUzc3WUtpU0l1MldDSnF4OW50VUlwTFpz?=
 =?utf-8?B?dDRDMjI0MmNHdnhJQ3ArVHhDOEpqa2psNXpaOU5wSnlSRnBlQVYxS0ZOemRl?=
 =?utf-8?B?T3pIZWlzSXA4aE92eGNpU2VJNzhvWmN0NGdvd3pSRjFZam9odFZjcFRBN3p5?=
 =?utf-8?B?bVJjOVc2OHNwTllUdWt6UnRablJPQkU4QlE4b1lub01WL0JleEVlRGxZYncr?=
 =?utf-8?B?ZVhneEpFZWRSZ25rMTlnaS9nQzROS0REOVluRjQ4ckoxVS9raTZNN3lLU2tS?=
 =?utf-8?B?MDlva0tlbGgrelpMcWhVQzVEbEhSSFl6Rm1VMXR2YnRLQ3UrNmNPdDIxbU02?=
 =?utf-8?B?Uk54R0tPZGMxZDE4RnYvRWNkcTNnS29RU2taZGh5a1pzWE84RENTM21UMWVp?=
 =?utf-8?B?QXlzK0tOUU9QQWRRMWpQeWhPNG40VEE2Slp0MWVBdlFjcTdJUGNLZFhGdU93?=
 =?utf-8?B?SDNTMWJ4M3lWUzV5b1Z3MXBSNmtGek5PdFBadTRRejNXVTlobC93RzVQMC9r?=
 =?utf-8?B?T2pENzdESnJWdmltL0VVOE9XaGFSZDBTSmoyYVZTc3hqVWE4R1FlUzIxdWdO?=
 =?utf-8?B?bU94d1RGdTBPN3VLMFY2SEpvdWtoRjhoRnN4NEhQQWNYOWVrRWh0c3JOZUVW?=
 =?utf-8?B?ZkNnSXZmOFoxWWRYYjZPcC9XaTlZV0lvSmVQYlhBeHVXaU15VmhBZWNSN0Mw?=
 =?utf-8?B?RDJ1ZlA1YXRaRXFhcFNBeXpYWVRkeVNpcGp4anVRSFVCdjVNQkF3MURwVlhN?=
 =?utf-8?B?SE5CWTM4aGZoYkVTU3A1WTlURHQxRmdjZ1pCOC9rNVVYaTZxZlBETzN4WnNV?=
 =?utf-8?B?UG56NmJtdWlGMEVzWk9tQ0ZVSGdEVzY5cGZHcmVkajlZZVkzaStVYUR2WlFN?=
 =?utf-8?B?TitLQ2FzZ2hYR2tHSjhrMTRrVmNRWGZ1TEN1NUxsK1B5ak9obFlhRm4vWnRX?=
 =?utf-8?B?Uzl5V3FQSytRYVF5YWlIcDFNVlRwZm5FTy85UEgyVWtRZlRuaEkyMllEWkNo?=
 =?utf-8?B?SzdSNlVRVkRkL0ErWVZRc25PR3dyMEEzak5tY0sydGs1MStOUVUvdHZvNDdX?=
 =?utf-8?B?VG5oQ3JtQ3lYbHJ2b0tpdmZzbUE2RHRxakFrSEVhdWRIWk13eU12UFhoUStL?=
 =?utf-8?B?NVZWcGptYTd0SlNabVV1Y2pPMVNUL3UybER4alg3dnhjN2RPYW9NT0QrS3RP?=
 =?utf-8?B?eU5wWnRLWHhWUFkzS28rY05xRmQyWVRaeWlEZEIzNHpsdkxLOXJZOXRhbjFC?=
 =?utf-8?B?RXFuQTNaanBsRlYxVTJRY3Ftb3VBa1FSTlREV3kxR1dHS1lPNEl6c0RQd3NR?=
 =?utf-8?B?U2ppaklia0Y1WDdLV25vK1A0cWZjbnpGb1ZmYmFYNU1kbXA2UHJ1WGxmNlVo?=
 =?utf-8?B?YzZ4SldEdkRDbU50M1ZWMGhVUmFQOTNBU2hTa3FodGtVbE1HWk5XREJweTNy?=
 =?utf-8?Q?5PWkFCWeWdQrNPuCLwNnsnyXVUGEzI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?d2JYam5kdjk2bmRXMVU5NCtjRStES1ZyeVgyZjRIWUhHc2lrWFB1N1Brdnc5?=
 =?utf-8?B?OHd0R0dhM21sbUJDanZ1SnViUkVtTzBwSFFuNmZVcDNIa2tGSWtrSnlJT2NH?=
 =?utf-8?B?d2N5ZzFENlZvcHpLM2RzdlRNMGd4bHBYRCtZKzJLNVF0MzFTZ3lnTXVqRXlZ?=
 =?utf-8?B?TzZiZm1BNm5sZWNGWXZ5QXR2V09uU2VBaWIvZWNlYVpjL29wV3BaQUdqem4w?=
 =?utf-8?B?RkNYd1lXbUNOUEVXWmpMNFkvMGdhNXFoMjBTRlZBc25BU2lmYXkwMitlS0Yr?=
 =?utf-8?B?Wm43R3NJN3BpQldmUFJJWkxTZkEzajV0NjJZT3NHclBJMzZIbDdHNTFIallK?=
 =?utf-8?B?WGVrc2UvYWNTMGZiQ1RYQWlwMUcySThrTUMxRkRXd0VYRzZaRElGSTVqZktX?=
 =?utf-8?B?QXBLNUtFWEsrUTdmYk96dCtOK2Rya3AvVEJGNmR1L0pQSDdTYzZFUnh0ejRl?=
 =?utf-8?B?RVB1ZkRqK1R3NTVoNUc4MDh1eld4ZTRFOS96QVp0eDA3OGJ5NFkzRDN1cDVk?=
 =?utf-8?B?UzE2SlBwZUdaczJoMEZXRXIyUDJ4Yzk0WTM4QWRnRHZKQXBrRHlBYXhrc1pG?=
 =?utf-8?B?Sm5MOXZQMUxCcklhQzB2bDlzY25rcTBFaTJKeUZ2Sjh3OGNSUWVMcyszUTl1?=
 =?utf-8?B?eXU2MmZGTUpRT1pzdklpbm1hb2I4dWxXSkpjVWFjTjhITU5sZTdicDNIZVVF?=
 =?utf-8?B?UFg2ckRiK05UQ0hLNFpwYXZBQ2Q2VHhzRUJUK3ZKTlZsNUMrWW9wR3FLVVdF?=
 =?utf-8?B?OWNaQTUvaDdMdmhoRWN6c3kyVWtGVlpJYUIwSWl0OW5BajRpZWZXTDVCTVlB?=
 =?utf-8?B?NjhQUlFwV213WTNabkcrRWJvNEZhK1IxSFRwVm9mYmhjZ25YUW1QOXRyMGJl?=
 =?utf-8?B?M29zcjRncmVwYk1kVjQwUHJCV2xlbFRCU2QzSVh3SndpcUk1dmZBUUtEdGNx?=
 =?utf-8?B?UTlzTXdVNXFSSktjT3c5UDVadEdPOUxwUTlkSmo4Z0dKVkhvZ2dNQXhpTDBo?=
 =?utf-8?B?cnBlaWdBN3JUNy9XQUw3aXNtWHJjNFV1eXYwN0lEYjJWSE01YkpFYkhybU9M?=
 =?utf-8?B?Z0EwWndjSWNmejYvZzVsRjV4ZzNWTmxqWlJZM3crZENpQjArVlY0aDZXanRJ?=
 =?utf-8?B?SUR0WFV1Q3NLOVdITVZXSmRpUitOVVBLNnBLZ1lQbUFtV092MythS0h3dHJt?=
 =?utf-8?B?REFSMGlKY2Rzcmx5aFRJbTNqSWxWTnVxdHU1SXk2aVl3dmdqYU4wcTV6dkts?=
 =?utf-8?B?T3dtT3lHUFliWkRyOUpzUjRuRHdYU29Cc2pQV245N1Q3Q0xpNU5STlBZdVdN?=
 =?utf-8?B?ODBnNWJ6cEN3SmQ4VjdjeFg1Rzd4T0sxZk5veUZnQU5ESkYxR2VhSGVMYnpu?=
 =?utf-8?B?aExOcUZRc3pMSnNQa3E1VmVBUFhYb0RSc0wzTVI4YnNmL3pqdFh3Rms4WThs?=
 =?utf-8?B?RDBDVVJNS1FWSWRyN3dFUUV6d0doVWJpVy93ZnhYSTJoZEhQSWl3cUhUTzZz?=
 =?utf-8?B?c2tCOWZSNE5veU9oMytkK3ltamZtNjdqYUoyQ1hSWkhRYjVZTTk0QkMvb3RZ?=
 =?utf-8?B?V2VhazhXUHhqdTc4dDZ1QzlyeUgxRnhvbXh3Yld2NUllM3pYTG81SUdCS1ht?=
 =?utf-8?B?SzZHb1V6N0hVYWhEbzdVNk5oWUpsV05md0k5WW90N2tBZ2t4OTErVmorMTYv?=
 =?utf-8?B?MVR3WDlEekVnUDBYNy9va3B4T1l3b3JTRHJBYU5QOUF0QkNyZzRnVlo2YXh5?=
 =?utf-8?B?cUtkZmI1MjJjTlc0dUkzMm9VRDkvajNObzNYdEpTVnpjZHpuZEdCc3FqRUtQ?=
 =?utf-8?B?OHJqOExwV0FTZFJpT216SGRVaWhnS09qQW5sWkIzMHV3aHdTdktvSUJiSjdn?=
 =?utf-8?B?MmpuNVQ0UGFRL0tlcm85US9zWFFYWlZ5STJDcnFBcnlWYkFFbFozZ010OFAr?=
 =?utf-8?B?emxvckl2Y2ZTTHZOeCtGK3ZuUjNCWE42dFg3L3lXZzhxclErTXZrMlVPNUFk?=
 =?utf-8?B?L2s1ZU00bDNvbWVncVFvMjhleTBWZjlrWVdLeE1abHNGNUtET2MrZmcwZGJ5?=
 =?utf-8?B?cG0xNmhaa2dpOFBBRHB4VjVPbUxUOEdRbEFGRlBUNkdIN0pWQUM5TkJuZm5W?=
 =?utf-8?Q?o7M0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72e0634-8733-43e4-56e4-08ddd917a67a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 20:42:55.9140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlnsqdagOb2Kcf+TNCfGEJAnCmobPq3pYx9/MNahiUvdnEqm3+wboPPLCxl+sBd8MQxOidOrw9oc06zt8FeAPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7747

The AP1302 is a standalone ISP for ON Semiconductor sensors.
AP1302 ISP supports single and dual sensor inputs. The driver
code supports AR1335, AR0144 and AR0330 sensors with single and
dual mode by loading the corresponding firmware.

Continue previous upstream:
https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v4:
- roll back to use onnn,module method: see discussion with Rob at
  https://lore.kernel.org/imx/CAL_JsqLUj2h1OxUokOGFL34czroJnJ33cpvn9jO8b8=cu8Fz0g@mail.gmail.com/

- Link to v3: https://lore.kernel.org/r/20250623-ap1302-v3-0-c9ca5b791494@nxp.com

change in v3
- move sensor in binding into ports.
- add missed regulator and enable-gpios.
- detail change log see each patches's change log

---
Anil Kumar Mamidala (2):
      dt-bindings: media: i2c: Add bindings for AP1302
      media: i2c: Add ON Semiconductor AP1302 ISP driver

 .../devicetree/bindings/media/i2c/onnn,ap1302.yaml |  184 ++
 MAINTAINERS                                        |    9 +
 drivers/media/i2c/Kconfig                          |    9 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ap1302.c                         | 2829 ++++++++++++++++++++
 5 files changed, 3032 insertions(+)
---
base-commit: ce5d48bfb56d70cfbdf29770c5c392a979cc3871
change-id: 20250617-ap1302-4897c591871c

Best regards,
--
Frank Li <Frank.Li@nxp.com>


