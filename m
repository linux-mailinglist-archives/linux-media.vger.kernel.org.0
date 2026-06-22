Return-Path: <linux-media+bounces-65339-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /patEEf5OGpWkwcAu9opvQ
	(envelope-from <linux-media+bounces-65339-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 10:58:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 179BF6ADFF0
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 10:58:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=MB4NBNz6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65339-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65339-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 583A9300D347
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 08:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DD3378D94;
	Mon, 22 Jun 2026 08:58:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012063.outbound.protection.outlook.com [52.101.66.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF593955CB;
	Mon, 22 Jun 2026 08:58:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118709; cv=fail; b=sByn5o7IMdWdewo1hr0Fn2Ad1jh2VcI1AmQggtkAd6cptnWG2Qy8GaORpS6HTDH67cAp0Nphakrsz26KP9IhXKHpyHzsj96uoJaeZv0qPp35HQKQvkLLC8zyUHn0r+diREi6fqFezhB+lR67Xx9qgYja/2lhwZLLaOVAVc9eJXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118709; c=relaxed/simple;
	bh=YNKDSK4dZ2UF31PnruAMBagUo/vrPLIEQaP1yxTHZzQ=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=JBwgpzoa2qtcGxmD71n5NyiQE6wpEU38H9qdC2C0KWehFXYuURzAQ/mWp6diZo7CBdfiigQTsG4Ur22PZR/Jd61NfPJXNQobp/IT88GI7wDe7B7AKf1BsCTCGa2wivWtCr5tW+GhO7jiNs/4yDTSm+t6TyHFnHDaWCwZWFH66y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MB4NBNz6; arc=fail smtp.client-ip=52.101.66.63
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAgzV6r+UKV3aXwOBkVVCkIDJLBiKMT6ptaNSA/q2rKjaB9rvYdqvhUIabMi0jc92XUrDs8GVpubvr6CHzG1b/Pjr4YcTeydjL4JtFi957iocPcHQLkEQQVN6FNCzv3dGoNO8SLHCpTBRkk8JL3xxshs1EPjBic7FeLX1Kd/1IGwfUh2G3bwr9zNO6qwd+7zR5I+J0LPMEOH2RVnP1m9iI2ecUfGJHWNE5DW9rz3cHp/k8FtKWv98ebSNJUPJ7im0/T6lM/SPE1KmriDsMrcTwslLrsax4dDEw4e/LJJFjspFMNMolB+7Il6gSsNaqEcl8ii2VD/69o2unQSKMkacA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9yLdng66C2dWI/Qpbc5zpeLK34YATUXbgQiZjcBLts=;
 b=C8+nYb76PkghMKbT5isQaWlVHp0Pf5Iu46lMEK+3Io4PkYJ8qiRHvtWQAgWY2wgpVVhADHiD18JD4fdJIq4/4RmrDB5BVhaCf9VtpatITn60q/VulO4FVPd96f5TfbdNawcdKywn4pf0RjrmNIJvIEHp3jJ13NDfZ4S8ALsrLx5CSiTv/9jbIGDrnLRt9baeHj2CMhSc3FIesE449/wlWpsWsExESVHNdH0q3ZMqDbTrj7FLZhIDO8bJDZKblcYpV3xn1MNcVVW2fvd/23y4CdZx3QZH5gYeIk93dyH0SBNBJED/n5E6qS3/T4ihR7YsLCriBe+mPYxzSzUPlMlTUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9yLdng66C2dWI/Qpbc5zpeLK34YATUXbgQiZjcBLts=;
 b=MB4NBNz6h4vXvIHOyB6sgr5LbdTlsqYCOmKkau/Oyzf7lI4y3eG8eE6tnrJhhav2zlA2SpxF3T21pkbvkvGRRDSDsMHFdjMA0/V+0YtUdv0+HeDM6w23mnpixC6c9GqhDQqq6UUEVYbDANx+9IZyWsL7a80tDlaxoKH7LU4lt0T4Q6dNKyeogoblK60ld3XF772S00J/R+1+zhR8JV/cqjrwvFi6GcUMXlJmTe267/Euk6hl+0LigrG4IelYaGGj+GwH8htvXSvDkSCSIJEdjz4DTkS5O0Nz3T445Ugh+M+lKYAJC1J3ChnkrjyLVrvfTdQq2lR337HJltX4NH3QTQ==
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by PA2PR04MB10088.eurprd04.prod.outlook.com (2603:10a6:102:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 08:58:19 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 08:58:19 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 3/8] media: synopsys: Use
 v4l2_subdev_get_frame_desc_passthrough()
From: guoniu.zhou@oss.nxp.com
To: Frank.Li@oss.nxp.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260617-imx8qxp_pcam-v5-3-7fa6c8e7fba7@nxp.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
 <20260617-imx8qxp_pcam-v5-3-7fa6c8e7fba7@nxp.com>
Date: Mon, 22 Jun 2026 17:01:14 +0800
Message-Id: <178211887401.4030874.9624759300723992658.b4-review@b4>
X-Mailer: b4 0.15-dev-0e760
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782118896; l=1929;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=YNKDSK4dZ2UF31PnruAMBagUo/vrPLIEQaP1yxTHZzQ=;
 b=VWu65sLLThB12xCGqcOzcXJdG1MQ71b4gpEtxtIf9P0yoiYg2wjsbxsMmRM4wPcceX8x/pSdR
 rxA+KXIP8POBGD4jofls8n19j9Lhi2S1zc0kGf/Nah2/BqPNx7a66bY
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2P153CA0049.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::18)
 To GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|PA2PR04MB10088:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b553deb-65d7-4c01-8848-08ded03c6741
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|19092799006|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
 uwRHKPZyd6xQsOoGri0rGoWkZcogOhsj0hZqlz42rFy2DgElWcGh8ioijypznzfsEhrB7QMQKD5HyFphziWV0WOay5U1HIw+dAUz9+dwUKRCL6pi2lM/WEKJbDpym/TJ7UasdQjMwDd6nXKA/G8lj2Q1diPu0NZMAVnC3HTP8yLo/uXiiN7EazOSeGbn5rr/vMn4pzZaxJAQ2x5/7Dl7ANyFBMHNP/ZEyWeqWOKcpZJ7AYONYYIaDbqhi5e1FtRvvK0kymUYbs3Mr8QBILK5bN8QVo+Z3nKTDk4Ogi0pFgID+cnwbt6EaDmENN5ru8vF+o0mNKlzezAcIh4h5dHagNGuTg/tqaQjMkRTl49YRo2NTJTFqf1Y3E0B144k65/Iw9S+yJRGYXqaJD/9y5J0M9Tl3i+AuxJL+zuT0jGIA1Ij2Z3Qjk609DBXb0BCb+C31PaQLtjHE7C2YqlRh7hM3Ev8NaWtdsZJZLwoAPg37v/hysIIEnH9NG9BaSB2uJ5p9yJlEOMYlfJ9VKpD9LQ8GZ+NU0ejGV9CI9Qc8/Nn2c77QPpDT8KWbr9WmKlyjuATfJ+21HRVMOKyPFjXV7uxv3qXs+ncoE5Py5cPwpDcdojfr0djpaOx3z0Ac8WeLVYaD4a6S+iCMCvrslzmqfLcnRTp78z64jghqmvgP4oYPTo=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(19092799006)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Vi9oYUc4eFlZMitQeDhrRzFDS2RmSEFuZWY5SHlIV0lvcFpzVk55N1BXUE5N?=
 =?utf-8?B?V2VmUDQwZVZ5S3MrZHdOUTc3cjRucld5MGcrZUhScEUzOFo2dk9qNWJSZUtm?=
 =?utf-8?B?U05ab1BCUUo5NEhBNDRBRE1halRta2JkR3lDQzIzUzk3TS9lQWV6aW1kRzJ3?=
 =?utf-8?B?dDRRUkJXTnVCeHNCajBkeitMOFRGY2J1eVdPLy9yam9Cd0dhYXVoUXdRWmdY?=
 =?utf-8?B?elFyN0pPN3N1a25tdEJwS0FzOVRTazBGQTdla1Y2YmpxMnFXSnhmZElmalNs?=
 =?utf-8?B?ZitWbmd0U3dYY3VkQ0h2NnRIUHBUZWZIaGloRjM1NiswY2Y0Z1JnYkltWm8r?=
 =?utf-8?B?c0JabUIwNzFxLy9wclQza0hLbitUSnVkZnRZbnppTXF5eFljL0FadUJUNzJX?=
 =?utf-8?B?bEZqZlRHRXo3SkpISUNzUjV1VElXRlpuQXBaYm8rQ29wdGtGWmhORGNPN1FV?=
 =?utf-8?B?UURwUnExM0gwQjB1SGgzWFJYSW1tbWxSWlZxb0hPT0hSM0UyemdvcytUR28z?=
 =?utf-8?B?LzFDTnBEMkVuYksxZy8xeE4yMnJ6amxOLzV2blY5VkM3dEFKKzl3c3RrMXNq?=
 =?utf-8?B?bjBLbFJjM2xWVC9BZ0dMdXlZeXkyRTJybHFEaXp2NkdoSm1NL2dDR1dPVThl?=
 =?utf-8?B?Q0UxR2h6ZUkrV2k4elpBSnlLcXpvdVovb2IzZ09TdHBpdFdKcjFYQVEwVE90?=
 =?utf-8?B?NnZnb0wzV1Nad0NjaG5SMFBwZC9WM2JnOXVDV2doNjJVZHJZRmpOeWJMRG16?=
 =?utf-8?B?dGxacHBWNzJEcWJRNTF6bDFKRlB2RGJ6RjNGejJOOHdub0l5eDJpYXNjejlX?=
 =?utf-8?B?UVQyU1lLNXltZm1CSk1XT1dtZDZkWlJlYjFqTHhFdUE2YkNpU0dQTnJuM1hy?=
 =?utf-8?B?aVlHL244YnJLeTFyNlZpdHNrNk9VSjNPQzQxcHFsb2c4b1ZRd1ZsdVpQQXNP?=
 =?utf-8?B?SjNaQTF4a1crR0p5SzNBeFdEOEduNG9kZU1vTWZUb3V4YiszR2wzOWc3R09J?=
 =?utf-8?B?Zml0YXdGeTBQVk9nYUhCZmcxV3FJcXRRcEtNelBwNmdjNHBEdjVZLzFYTlpp?=
 =?utf-8?B?akFVUHBJWDY5ZjhJUUhYNGxpT29nTVg5NkJMR00wR1p6QWNQZjZwaW1GVWdn?=
 =?utf-8?B?azUwWUNmaktzZVZsdlZQV0JlUlA5YW1jSkxmUU5FYk9oSzlhcXFzZmlqdHoz?=
 =?utf-8?B?RTd5aWh2V0RHZXF5WG52THB6TGw4djF1YTh5V0NGUDM1eTQxMXN5QlFWSlI0?=
 =?utf-8?B?Q09Tc1N0Z0VORlBmbVVwQzB3a0NIYTIxaHZIdDROTEtxUHRUaWlKMVM5bzVj?=
 =?utf-8?B?VnNpS0wwajBpdHhPVFVwWnpTaHZTcE1CNWRtSkU1bXdiclJBSnFzazR2aTZ2?=
 =?utf-8?B?K1VtRWxSVkFrZ3RabG9HUnZNNlhkWDlFMnplYVlKbDZQT1Uwd0RZSko3SjEv?=
 =?utf-8?B?a2pNb05aanUxWDFEdmxFZ1dWaWwyLzk3VEdvNE1adWVZV2hTZEtGTEQrdUFw?=
 =?utf-8?B?MjNjZ2k2MXVUQTM1ZHUvZmhIUDhTYXF0aUZKL2swWDhycUk5RHhHN0o5dTJR?=
 =?utf-8?B?MWJ5WjVjb1ZhV1Q0RXB1c0s2cVRCQ09TK1FoeVRIVVE3MEFkbVJQWjhWNGhT?=
 =?utf-8?B?NkliMFA4L3c2Wi9ZSEN5VG5xQmNob20ydHlxQ2lkRnVxOVFqTkdLcUlDUUZN?=
 =?utf-8?B?Qko1ME51ZTFkRG5DZ1NNVGdvay9BS2IyenVlQzUrYm5NY2tSSWI1OGNhRHZp?=
 =?utf-8?B?cjBWVEFybDBtRnI3UEdKdWRHT0dpV255WXB2VC9KSHpkaVBJOU5PM2dsZmV3?=
 =?utf-8?B?NTc2Mng4WGxnNzdnT1BZM1R3R00vTlU3R1l4V2xBbWh1VzNEOU9KOWNudGps?=
 =?utf-8?B?aE1UenNQNm5tUXFWa3kvM2UwanlqcWtmSWhLV09KOXZOZ2Roa2pib3J5dWg0?=
 =?utf-8?B?Z09NQW9mVm5rZWx2d1VkUktSMzhSSGJlZjJvNk1nY0pTVzNmWXYxTzdSZjQx?=
 =?utf-8?B?OGJDeWNqQjdxVkFIWW9qUG1QTU5pcWI1S3lLZkU3a1FDTHFJc0dyM1pNbEo3?=
 =?utf-8?B?V0VZay9XclZ6ckdoQktyMDdLb3h3RC9oYVhwOVJsdUtHTVpNVFE0R3JwOWZU?=
 =?utf-8?B?bm1MclhyRE1xN0pXT3FacnRPU2M3SjJIUm55a0xUdzV6MGRrUG16eHpXeUp1?=
 =?utf-8?B?QXdmZzUraFlGZzRlNUlpbUIvWDQ0UitacEQ3UEU3RnErOGQ3blErVTFBRjlu?=
 =?utf-8?B?S0hKQlJJOTNCNC9sSjFhM0pmb0hVOG1YUDFnUjFLN1p4OVBtck03Y2o2aEtQ?=
 =?utf-8?B?c3E0QnhNalJCUFFEYmtNYktjQ1ZyWm9yK1RsdEYrY0dVbmx3S1JnQVMwaFdB?=
 =?utf-8?Q?GdJyIb+4vGvQxfU644CgNHaNMHQNVYRgYvV7J?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b553deb-65d7-4c01-8848-08ded03c6741
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 08:58:19.1713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NBdNDoGz6vNPhyPyknKIpBnmDZEX6mT+oxeB+zAVBKrKtEzgpchVwYQNoPg3PPcRqSVPK2W/B+v1bIAht5OmoHrolICbXXcpoJ7oJmCL0YuBv+iKg9l2DyArb7QqUNSq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65339-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 179BF6ADFF0

> Replace the local frame descriptor callback implementation with
> v4l2_subdev_get_frame_desc_passthrough().
> 
> This helper provides the same functionality while avoiding duplicate
> code and simplifying the driver implementation.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 41e48365167e..f51367409ff4 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -630,31 +630,11 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> -static int
> -dw_mipi_csi2rx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> -			      struct v4l2_mbus_frame_desc *fd)
> -{
> -	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
> -	struct v4l2_subdev *remote_sd;
> -	struct media_pad *remote_pad;
> -
> -	remote_pad = media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
> -	if (IS_ERR(remote_pad)) {
> -		dev_err(csi2->dev, "can't get remote source pad\n");
> -		return PTR_ERR(remote_pad);
> -	}
> -
> -	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> -
> -	return v4l2_subdev_call(remote_sd, pad, get_frame_desc,
> -				remote_pad->index, fd);
> -}
> -
>  static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
>  	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = dw_mipi_csi2rx_set_fmt,
> -	.get_frame_desc = dw_mipi_csi2rx_get_frame_desc,
> +	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
>  	.set_routing = dw_mipi_csi2rx_set_routing,
>  	.enable_streams = dw_mipi_csi2rx_enable_streams,
>  	.disable_streams = dw_mipi_csi2rx_disable_streams,

Reviewed-by: Guoniu Zhou <guoniu.zhou@nxp.com>

-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

