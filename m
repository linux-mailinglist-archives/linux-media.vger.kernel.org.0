Return-Path: <linux-media+bounces-65589-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lr+GCN9APGrslggAu9opvQ
	(envelope-from <linux-media+bounces-65589-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:41:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 626076C13B2
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:41:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=fsEr9vlO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65589-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65589-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 513203048933
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 20:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB933839B3;
	Wed, 24 Jun 2026 20:38:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDF13E1691;
	Wed, 24 Jun 2026 20:38:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782333537; cv=fail; b=sWkafFyYlq53YFmjQ534VRcaIAKpBWoeCvE/rWi1CfxRAGEMUXC+mz+rLlYbeN3O7j2mbnPRXv5rceX7GIMuOkph9Xp3JiHp5hYq9wrEvPSInlttwthl0bVqzT6Qy/ssvZNDn6URrzTZXEmiprFEX8dQF0AP8YaKwRtCw118jPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782333537; c=relaxed/simple;
	bh=km6cQFEZ9mWZXCHjiDnIzJTfL4u9BpGKutWUxqDDNQ0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bQlNTEXCHOpshtT0RIBEU2Nnj0MbDsHCtzUftH1PqR6ZI3SkPe/oMnZI/KBvgK4MCoX58OuhIC3zBucjvB7qOIf3+BTk7AjwRqg9Z21bz8dN4pcARqFV7T26IlVFLSZcyfOWKhvMRREWFyOSbeWiqUEK378/T5reQGkiMygrNVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fsEr9vlO; arc=fail smtp.client-ip=52.101.70.8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPIujk71Hc1eOcZIWZ6AjA95DvccBIoqR/WPRQEiPD3vw1If9wViFeSymfZCco0ZsKELfPEj5KgdjgcXN08FuL3shO0x5wrb4+eSLfFWXYXHRbSRtFZlxKj9gI8ydWvu/G2/z33OurvtNVyecfW2xpciQvNaARA1lxFjtU8MNTMDMs8OXslhXaUvWO6gby36Oc1Jlw+aKy3XlJQt+VyOyP/pYYWQhlxL5MOqhKVvggL0aMUQsNcb61JjIB/sEXDtWsAp7GCCE/ctgcxjXt+BoGlHXzdthHjJp9C3+WlN4e6Orw+fTy95MeERm5ExzS7p8kT5YGV5Q7ZfkfZo3dGEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcfV8ewK4ZvAJiw9mZQqoUWrZCdtwJ/KSI9ztDyj0F4=;
 b=apmjsJ7tdJP2bdUtWKwqQRK+Eu9nI8cksb+D7dHA3NM7v+2sjLUbHSVwF3l9atn4XCHXgo3ua1aBmlj+jgizM442FPM6TCxOJNCKsESxLHVjuBuywR9MZ1l/ErNhzqpTHK4okA9KHIq+4v/2LYvjB1zW+6A6J6DmYB/H7L6W2XXRYqP9s+/tvv12rp2ctDA04D4RVI+fssyWAP5RrwSpHEEnJZBRXm1Yz57MtYtte8216EHTwM4NKfgmVCO5DFmQDlLEGfC/nSF5MhRjZxUDl9uLnhK3oxYNN0+51DN4Vf+Hq158rA6CLhA42plxQefgZBDOMVP8ACn4NoChxsx10A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcfV8ewK4ZvAJiw9mZQqoUWrZCdtwJ/KSI9ztDyj0F4=;
 b=fsEr9vlOMv9zU8w/MYz7Prc/SUVOLJ0IvFfzYr1HQGqQ10gnhrn7xFyftW3N1FttPKWceNBAKXJm2bw6f784foW3ke5BRzBMlDn0pvdY8R5GYWIUHAP2EWSE9mxwq1lshEKQ3udWdmCrSUfJ4LXj7vrURIXM9tOK4QLxTXP9+U87aSrpjr/nWg3iR4n/LnK4JKtuVGgD4dal7LXnV4uPpgT0P0BT1chK542wzu44uCLsEvdhcJUzUQi6kZctlVYSd96huZUZwTGohO3CMBhL3HwuqlkWNlT5yQxNu6j2kxJbmylSy1irt6t1Sl3LIBX5jT2kpL9uO4fXUum8t1JHiw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11335.eurprd04.prod.outlook.com (2603:10a6:102:4f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 20:38:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 20:38:52 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 24 Jun 2026 16:37:50 -0400
Subject: [PATCH v6 3/9] media: subdev: Add media_async_register_subdev()
 helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-imx8qxp_pcam-v6-3-4b3f45920d2f@nxp.com>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
In-Reply-To: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782333513; l=7578;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ivufRrOYABca2aG0XdfOT4j3wgZR4YOqvyN8P8q5zB0=;
 b=bsFpAw+jUh1WY7P30JcMpq+8BEr//Wv1tH1br0sV3k/oVwzHzrajXiBN6kkHt4jC/YteYH95Y
 DIh3hJlXbcoD+ho+pVowg8x2xqvxA8Nkphf3OCSoWpm2qMF/CYW2/Ye
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11335:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a936c0-d12d-4f63-6466-08ded2309a8c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|6133799003|11063799006|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
 Ep2w0Kbe3K/nWfuT7CqZPt/iozDjpaOQ5DVpVnYCjXKMcgqiLoT+ABX6nrjZVH6IRKDSqiJLNEAtSukVcu//EoLpv3VVfqOBWNPsL3LSkX4TOmPGKzjmDnDP2sHpy+ktZP665czeckrvC1AmCzIb0ynZIvq1bJXmT0m60dFdG9SDS5HJy5luOS+QdcK2CSrwvan5l8zMbd0Zk0MLrJkLVKnAdtxe2EauUJl4y8t5+swd0tJ9JKnmEK27lUlTqazaa5riEhjzn0eYiTH2L492A5rJ90JhurREQRWVigcqH9fcqopJIseYe3hIiJ4JIcGgHUapTBy77FMXvsCQnzBPJcJkPYcEBi+kSb9g8+3PfqQf6t/pvZkyx1jrJLEVr2UE0dRrbaSXvah3JN63bmmZ2b5PYS3yjAv43qY+vT1jZameobrj5Ikvopy4m9Bsrz0E4ZO3c+Mh6bFijNRaru7A0XGnp5ZdvQg/f5ftyTNa4bEUfx+svpdiY+44gkNqbfi2PKtuR7VjJmTfRysFKnqLDvolB6tPMFWknViKPfYqVA8smUFVJMvyPS3hMhJE9e2vJ+CoVyhxqFqDyVIY8ewy2MYpasHbb6hFgm22PdIShhoAqNUR7BROKsdZfcMDnLtwuDMOKRjdi2O/872J0uTZmDby8PFeHDUQ7DizDZPmbbTdJ5Yq7/PD9+AM3tmnqv/ncs5Ku4CwWOppQBGyUWSGiw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QWNBZGxwVW9zazV6K0ViR3pOUkNXRTlhelFvdWMxcFo4TWlVeVBoRnNYWVQ2?=
 =?utf-8?B?NnNJUURRNEs0R1R2MkFzYmJmQnhzdHRQNVZxNkFYbmtZSWlXVFF5UDhvcWVq?=
 =?utf-8?B?b3lJR3g0cEdNYzV3cXMxR2hoVjRjajRqekppaWlwalVkMFlGNDIrMzdYVjF6?=
 =?utf-8?B?WjdKUVlMUkliNkxmeEU4SElKbEgxK0d4ZGVoL3EvM3E0SyswKy9FdXk1ZnJ1?=
 =?utf-8?B?ZjFEYkd5RXpjZlFnZ2Y3YUY2bHBUaEZKek5zNHk3OFg3Q2EySGtuWlJKVE9h?=
 =?utf-8?B?MkE1UVM5OUVPcndEckdoT2JsTS93WlB0czhEVC9Fb3Bad3lUTUk2Rmk3Kzlm?=
 =?utf-8?B?dnhvUzkycEhBR0hwSWRkcGlKZGZFRS9TUTNNeVVkRCtEZVRWdlA3emNrTWdD?=
 =?utf-8?B?ZXVHQS9PbEZHQlhjOUlTQ1FldDJqK2d6MUl1TEFRR0c1OGZMU2RvN3grMmNz?=
 =?utf-8?B?anpPRS9qUWlRZ05nUmFNZmM1ZUFMdWpRU0pqYkptV3puTmxzeXpTc2xkVExD?=
 =?utf-8?B?TUl4OHJrVUlwMzRYWEFubUpnSU1mQzEzZnhzemNkNXRXV0dyWDlQcHdodDdl?=
 =?utf-8?B?cHVna3RMbCtyYVVudUZ1bCtNNVBHUGJ4UmU5QS9PMEtGL3NuNStSNHNZaWtH?=
 =?utf-8?B?dzlGZjFlVHB2MFZRSktIRk1DWTFLb3FlY1IrYlZ5QVM5aHNUQVQ4VGt0dkMw?=
 =?utf-8?B?a0lsVGIvS0lMaExuS01jTG5DOEhkeDJybDVFL1BVMm5nS0F0bXFuNUZaYWdT?=
 =?utf-8?B?emRNcE51VUYvS0JjWlBhc0IxMnR0UHVRTUh2VjVDYncycGsraWVuUkNqaFE1?=
 =?utf-8?B?aTZJNFo3RUZwTEJIWlU1eEo4eEV3SVVUK092OXMvL3FiTzhzS2J4eWJkNnp1?=
 =?utf-8?B?YW5Md3RwS2puYkxqdjVCSWF1dm9XYUN6ZjBmQjdnOVhCTXd6SDVjRUQ4eXd3?=
 =?utf-8?B?MnpzdUp5ODVjc2xWQ2gyb1FVUUtSNDlhWTEwZ1BOS0RpeFRoN2N3TEtzVkYy?=
 =?utf-8?B?NmVRUHljc2FFSXpmZVRmKzVvelFsY2xXNFREdjVHeXJDdlFNVTRRMU44Z1U1?=
 =?utf-8?B?RlJFcWFGbWgyVDFqMzZPd2kxZVVxVEZpQzZyblk5VU8zSDlTb21NaEdSMnE4?=
 =?utf-8?B?MXltdHBNYVN6MG1hMFJGTUUyVTVQVENPWjNTdGtFZENuNDYySnF0aDIrMC92?=
 =?utf-8?B?SmRJNFYwelBGd0VLYTl6YTk4bWNZQmJuWmlBdTBCZ09rTzZrVVllODdoNzU0?=
 =?utf-8?B?akN5UDh1Z0RoenBoSGl1ZGlMb1pYMEJzQmpiZEV2OEhkU3NET0cyY1FLbGJM?=
 =?utf-8?B?cE1tcWFLUWFSSFNLU3ZhWDExazlyZFAvNXJIVmMxNjdGdFJIblhGUUNoemUz?=
 =?utf-8?B?SnlvOVo3dHdvWnd6dW5JMmx6bG9ERGFSNEdPRWNxVTBpcHlscUg0VHNqenpz?=
 =?utf-8?B?dnVKVEthQURHM3B2Mno0RVN2ZC9FQ3ZJYW9IVUphQWdMQnl4alA4Mmx4dTY0?=
 =?utf-8?B?RVpkTjl5LzI0WlV2Zk1seWJDUnpERVhaRjNLd1RPL3NXNmdUc3dMSVZPK1RY?=
 =?utf-8?B?eHdjQXRBNC9NVTV4ZDU0NDVib2liMVA2WWg1OFA0Q1k1YWZRL28xRFN1N1du?=
 =?utf-8?B?YjRMOWJKTmkvZDN5Wk5qN24zbzlWMjUrWWFyUStuV2YvbFlxdmNnL2d6Umhr?=
 =?utf-8?B?bExhc3NlZkhaQnMySDBDS3U0OTgvaTN2Yng2SEtjcHRkOTQ1WlZmRFhJWUhh?=
 =?utf-8?B?WTA3cGdLbnRVeDN5SzlGR2d0QUM1YW1MbG1CUTFlU0w0OUllSkdxL1d3cFVj?=
 =?utf-8?B?N0I5dVZic25icU8yaTJrNEZGL2U0WEFLb2hGdjJjcUxZTmdtQXFJeEk2MDZv?=
 =?utf-8?B?VEJISG51cU1adHRNdnQ5WjhlT3VtM3hQejdtMm8vb3htb3UxbkE1TStKTUtQ?=
 =?utf-8?B?aUUySWhNcTRDdEp3eUNiaGcrNzNPRTJLUGZLSzY0d2VWQ2k4S2VxM0N5Z0lh?=
 =?utf-8?B?Q1ZlaGdndnJmeWxwTFBMd2hEKzErUFhCeENVRUxzVDFLMmVTYlVvOWZyM2dn?=
 =?utf-8?B?WjZxUzhncHE1K1ZaUDgvMG8wYmg0ZXBUYjYvMTdFWE45bkdjUVFJSlh3d2hV?=
 =?utf-8?B?a2hBSG0wMWZVeitmNFpaRHZRRzZ6T3NuMnhpUmQ3bVVFK05DWUk3cW9jUllU?=
 =?utf-8?B?V0J5MG1teFMvd05qNnhkNFdTbDZuc0ZEODVnRG41ODBZMjVFa2hxSERNNFBn?=
 =?utf-8?B?L2sxQStEem90K2xDbzhyL2lBR2ZsV1RONUd3NGhYTGhUdlhPVm5qbXZOR1N2?=
 =?utf-8?B?UTVBaC9HQ3JWQ2tQaGNwZG1XVUtoNytyM0d4dGtGQ05vWGU4bGl5clhhWE4v?=
 =?utf-8?Q?Ame18J1zH3LlcdeSSwumThIgTybD9yEt44cgD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a936c0-d12d-4f63-6466-08ded2309a8c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:38:52.7735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWt9C8oQoTN2cn5L1wiZb0kXL26mDKot/S4agOF3xaSWfb3TGJQCY+G5rSmfZH3nZNr9tcmq2LE9lBAUMcC50gqwHnirkCDoxwSu5LGocarTa4FpNZzQU4aBaBIQLb5v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11335
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65589-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,oss.nxp.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 626076C13B2

From: Frank Li <Frank.Li@nxp.com>

Add media_async_register_subdev(), a helper to register a V4L2 sub-device
with the asynchronous sub-device framework.

The helper assumes a 1:1 mapping between firmware endpoints and media pads.
During registration it parses the firmware graph, creates media pads for
all endpoints, and registers common asynchronous notifiers for sink
endpoints. These notifiers automatically create media links when the
corresponding remote source devices become available.

The set_pad_by_ep() callback allows drivers to determine the media pad
associated with a firmware endpoint and identify whether the endpoint
represents a sink pad.

By centralizing firmware graph parsing, media pad creation, notifier
registration, and link creation, this helper reduces duplicated code and
simplifies error handling in V4L2 sub-device drivers.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v6
- new patch
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 155 ++++++++++++++++++++++++++++++++++
 include/media/v4l2-async.h            |  39 +++++++++
 2 files changed, 194 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 62a3a452f7884..169059654478f 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -26,6 +26,7 @@
 
 #include <media/v4l2-async.h>
 #include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 
 #include "v4l2-subdev-priv.h"
@@ -1302,6 +1303,160 @@ int __v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *m
 }
 EXPORT_SYMBOL_GPL(__v4l2_async_register_subdev_sensor);
 
+static int v4l2_common_notifier_bound(struct v4l2_async_notifier *notifier,
+				      struct v4l2_subdev *sd,
+				      struct v4l2_async_connection *asd)
+{
+	struct media_pad *pad = NULL;
+	int ret;
+
+	if (asd->match.type != V4L2_ASYNC_MATCH_TYPE_FWNODE)
+		return -EINVAL;
+
+	if (!asd->match.fwnode)
+		return -EINVAL;
+
+	struct fwnode_handle *remote __free(fwnode_handle) =
+		fwnode_graph_get_remote_endpoint(asd->match.fwnode);
+
+	for (int i = 0; i < notifier->sd->entity.num_pads; i++) {
+		if (notifier->sd->entity.pads[i].vep.base.local_fwnode == remote) {
+			pad = &notifier->sd->entity.pads[i];
+			break;
+		}
+	}
+
+	if (!pad) {
+		dev_err(notifier->sd->dev, "failed to find sink pad\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_create_fwnode_links_to_pad(sd, pad, MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(sd->dev, "failed to link source pad\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations v4l2_common_notifier_ops = {
+	.bound = v4l2_common_notifier_bound,
+};
+
+static int
+v4l2_async_nf_parse_fwnode(struct device *dev, struct media_pad *pads,
+			   struct v4l2_async_notifier *notifier)
+{
+	struct v4l2_subdev *sd = notifier->sd;
+	struct v4l2_async_connection *asd;
+	struct media_pad *pad;
+	int ret;
+
+	if (!sd->internal_ops->set_pad_by_ep)
+		return dev_err_probe(dev, -EINVAL,
+				     "Missed valiate_endpoint() callback\n");
+	pad = pads;
+
+	fwnode_graph_for_each_endpoint_scoped(dev_fwnode(dev), ep) {
+		u32 flags;
+
+		ret = v4l2_fwnode_endpoint_parse(ep, &pad->vep);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to parse endpoint\n");
+
+		ret = sd->internal_ops->set_pad_by_ep(sd, pad);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Can support endponit\n");
+
+		flags = pad->flags;
+
+		pad++;
+
+		if (flags & MEDIA_PAD_FL_SOURCE)
+			continue; /* Bypass source port */
+
+		notifier->ops = &v4l2_common_notifier_ops;
+
+		asd = v4l2_async_nf_add_fwnode_remote(notifier, ep,
+						      struct v4l2_async_connection);
+		if (IS_ERR(asd))
+			return dev_err_probe(dev, PTR_ERR(asd),
+					      "failed to add notifier\n");
+	}
+
+	return 0;
+}
+
+void media_async_subdev_cleanup(struct v4l2_subdev *sd)
+{
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_async_nf_unregister(sd->subdev_notifier);
+	v4l2_async_nf_cleanup(sd->subdev_notifier);
+	kfree(sd->entity.pads);
+}
+EXPORT_SYMBOL_GPL(media_async_subdev_cleanup);
+
+int __media_async_register_subdev(struct v4l2_subdev *sd, struct module *module)
+{
+	struct device *dev = sd->dev;
+	u32 ep_count;
+	int ret;
+
+	if (WARN_ON(!sd->dev))
+		return -ENODEV;
+
+	struct v4l2_async_notifier *notifier __free(kfree) = kzalloc_obj(*notifier);
+	if (!notifier)
+		return -ENOMEM;
+
+	v4l2_async_subdev_nf_init(notifier, sd);
+
+	ep_count = fwnode_graph_get_endpoint_count(dev_fwnode(dev), 0);
+	if (!ep_count)
+		return dev_err_probe(dev, -EINVAL, "No connected endpoints\n");
+
+	struct media_pad *pads __free(kfree) = kzalloc_objs(struct media_pad, ep_count);
+	if (!pads)
+		return -ENOMEM;
+
+	ret = v4l2_async_nf_parse_fwnode(dev, pads, notifier);
+	if (ret < 0)
+		return ret;
+
+	ret = media_entity_pads_init(&sd->entity, ep_count, pads);
+	if (ret)
+		goto out_cleanup;
+
+	ret = v4l2_async_nf_register(notifier);
+	if (ret < 0)
+		goto out_cleanup;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto out_unregister;
+
+	ret = __v4l2_async_register_subdev(sd, module);
+	if (ret < 0)
+		goto out_unregister;
+
+	sd->subdev_notifier = no_free_ptr(notifier);
+	retain_and_null_ptr(pads);
+
+	return 0;
+
+out_unregister:
+	v4l2_async_nf_unregister(notifier);
+
+out_cleanup:
+	v4l2_async_nf_cleanup(notifier);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(__media_async_register_subdev);
+
 MODULE_DESCRIPTION("V4L2 fwnode binding parsing library");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 54a2d9620ed5b..ca41820f776c5 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -345,4 +345,43 @@ __v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *modul
  * @sd: pointer to &struct v4l2_subdev
  */
 void v4l2_async_unregister_subdev(struct v4l2_subdev *sd);
+
+enum v4l2_subdev_1to1_pads {
+	V4L2_SUBDEV_1TO1_PADS_SINK,
+	V4L2_SUBDEV_1TO1_PADS_SOURCE,
+	V4L2_SUBDEV_1TO1_PADS_TOTAL,
+};
+
+/**
+ * media_async_register_subdev - registers a sub-device to the asynchronous
+ *				 sub-device framework and parse set up common
+ *				 related devices
+ *
+ * @sd: pointer to struct &v4l2_subdev
+ *
+ * Register a V4L2 sub-device with the asynchronous sub-device framework.
+ * In addition to v4l2_async_register_subdev(), this function parses the
+ * firmware graph, creates media pads for the endpoints, and registers common
+ * notifiers to create media links between connected devices.
+ *
+ * This function also init media_pads.
+ *
+ * The sub-device is unregistered and cleanup by media_async_subdev_cleanup()
+ *
+ * While registered, the subdev module is marked as in-use.
+ *
+ * An error is returned if the module is no longer loaded on any attempts
+ * to register it.
+ */
+#define media_async_register_subdev(sd_1to1) \
+	 __media_async_register_subdev(sd_1to1, THIS_MODULE)
+
+int __media_async_register_subdev(struct v4l2_subdev *sd_1to1, struct module *module);
+
+/**
+ * media_async_subdev_cleanup - unregistered and cleanup subdev and media pads
+ * @sd_1to1: pointer to struct &v4l2_subdev_1to1
+ */
+void media_async_subdev_cleanup(struct v4l2_subdev *sd_1to1);
+
 #endif

-- 
2.43.0


