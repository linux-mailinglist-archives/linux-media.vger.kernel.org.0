Return-Path: <linux-media+bounces-25685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4BFA2971A
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 18:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B92E1882430
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 17:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD5A1FBEB0;
	Wed,  5 Feb 2025 17:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WvHgHuXm"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013051.outbound.protection.outlook.com [52.101.67.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1786E193436;
	Wed,  5 Feb 2025 17:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775932; cv=fail; b=H3RyVs5+0MB2AUeEvObFejOAfST2w8x7kvWwkDKexfHvEoEHwJekHTOMKLKaJTd//ntZJfFPLuGiMD9gBBYceJbxTV18WPr7CJfKgcJk8yOKiukfhmL1sc3TkBCWGFBMUXQ/56f5e1ncBLiKGlfX5FVxBNk9aOMHegqM2KC3lPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775932; c=relaxed/simple;
	bh=uO7dACA8OdRkq49Uh5klUQcijycSwBMqLbQADIcjQkI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=JaYwRsXysYbNbqNhLxrKkCgTvKKrvXrNYgI9SsAXdaav3MutK21n2lB2g/BzMYuoJ4rC3IPDVA2Cw4k9nuLoCQPtlhv87bPGnHnJOmv7B12HR89+Gu9zgHJeAuChjnWU3HRGqBu7t0jrfr72Tu/SUp+sSvHci0IE08HldaO4S8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WvHgHuXm; arc=fail smtp.client-ip=52.101.67.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l56sGiALpt+occiro5DS2FO8daN5GxguF3IEp/RjFq6a5/Zve/IT88xgWkvrga9FOUCIZgnMTPFpWNhvNiq2ZSxt7IuyovAMiLQ3d1TxiM6dze0lKwbMv6hyGi4EwukI6HJakpnbNTE1WrcAlcDSslGGXvGmJ/EJ26Pxn8+ecRVEsdbJt/8l6UYner5ASTLXI4nO26qnny4v6Prq9vYSCZZscEfWPJvefy1ryr5VzPVkV2V7qFXmWkY5GLM7q6Xn9be3f39U41kLlXZiS6/FQMC2bgje5BopaHicttGEZqD7Ycz/qbVxhNnLNf3tBvuaLafl7awPa+ksQTJlPS/s0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWtjmjUV/McFamVq2dNWV2ja1bI5xtAQcrh1WoXc28Q=;
 b=vUJLAgCInMaLfrnBqggmvBKxF4ioZJ/a4COoaeyg1yuFt6keeoHfhd9uJC2jc3tLJAitAFbdX9zSD1sj9Uec+Bxq6wp1cB7Jh5xomJLF01QfzKQxjJCOciRZkcl8RHJn1ZkynN5MKBjGycRqXJTgQ7XruVlFvTABve0hhf7VWY876b8NFfSommeZiTl5ikQaXazyiEf5QpNl4p9Wd3xEM6xCXU9SeBtFstLT9P4vP3SRzNBYpzw6sUS+xS4d6C3el7melqGL4+lrdYg9R0QC7/6UJ5lk+nWJ7LkSQMacmuFV82ox1j+QBPvSZUhAo9QXiwGlZaJzgXMCty+KiL6EGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWtjmjUV/McFamVq2dNWV2ja1bI5xtAQcrh1WoXc28Q=;
 b=WvHgHuXmsGxmTUnxL5JpbiXl0F7L2bXewfMQtMYhHvY0ZNiZ4E0D/WbRd4lcEdwRWi/90lMegzkjdAq+MkaqgJIUnEsNsFPuY9pNuUZoH3D4RYqnyymUzLQY3J4gq6pU9ccPDICeVFNyCLLcIYJZJTBybtSsjFu0MQM7r2IOJLqQ5/GJV88a+w4DdoKAaZAuRHmZ2KSnNS5b/yrGQcJrPUU+1Yc+9q3/9QdfHQ9y95VReTHc22U/oTVb09IT9KZtTl26wx35FQvlUe+sAlE9XMscdJYhIBfkm0vHgDYx0maXkgAxeg3ngKBDwkLMp82IBvSMtiNa/yM+U8/FAyG4Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10546.eurprd04.prod.outlook.com (2603:10a6:800:274::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 17:18:46 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:18:46 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 00/14] media: imx8: add camera support
Date: Wed, 05 Feb 2025 12:18:09 -0500
Message-Id: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFKdo2cC/1XMQQ7CIBRF0a00fyyGD7TajtyHaQxSahkUEAzBN
 OxdbJw4vC95Z4Oog9ERhmaDoJOJxtka7NCAWqR9aGKm2sAoaymiIOdn9jclVx0kUSjn9iT6iVM
 B9eGDnk3etetYezHx5cJ7xxN+15/D8c9JSCjh2AvK5L2jnbzY7I/KrTCWUj6pISrqpAAAAA==
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738775920; l=4441;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=uO7dACA8OdRkq49Uh5klUQcijycSwBMqLbQADIcjQkI=;
 b=qZESQe4vLlQU+HzNChLC5tkaZ//jOPHcj3ZFphN/1wDUjjiYh3hs2Nk0W5NNJoOSXHln2+0Up
 Adzm1SUyuMQCsYkFefwor6yXD465CJnMTnXUKhpgmUEXhWC0jSYuybL
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10546:EE_
X-MS-Office365-Filtering-Correlation-Id: 26fd053b-3894-4e51-5fc9-08dd46092629
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|7053199007|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?OXhHMGFzd2JHMGJJemRhU0ZFcFBZRW1VOGQzRS9TV2pBZExsRElzcnh3cEda?=
 =?utf-8?B?V3NhQWNsTGYwc3VKakkyL05HZzVmVVhsRkVMZEJjUDhoZjN1TVRuMzNrS2xF?=
 =?utf-8?B?aVdmU0NDellwL0xPdUlHR0JLK2owVFMxS1dNQThRNGpPZ1BXSzE1VS9WcnV1?=
 =?utf-8?B?cEkyaGNicmdyQ3J2SXZyM3VZejNxK01FckRmeHFsWWV1L3I1WU1teitucEg2?=
 =?utf-8?B?dXNPRldzcExIZGRqWFNab2p2MTVNcVB4dFdqY3l6UXlzdmM5NTA0aEd5Zmc3?=
 =?utf-8?B?TC90aHp1cjJ0NDRUc2xpTUFpUFhHdGlYY0tYcE5aZzRPK1A2OFU3QUhTRmZy?=
 =?utf-8?B?Tkttbm1ucFg4QkpwQTNMWWNUNFI1eHQva3ZFdXBJK1lodG5PN1M4NTgwYU5X?=
 =?utf-8?B?aER2ZXZtYUtYelZXYUZnOXJpbjF2NWJweWR5U0J6V3ZGYWpmQjUvNVlxekRl?=
 =?utf-8?B?SjF4NVlCK1FRQ29oKytINVBZRWlWR1lxdzhaQzFGNFc5TUY5cWJvUEY5bDNS?=
 =?utf-8?B?L2VUbTRjN0FkWldlcGRZcG1aMi8vUnE2Y25JQlo3cFF1b3ZhbVpKK0w4amFU?=
 =?utf-8?B?WmZ5cWlCOGRqc3pzb3FsMVVYT2owSzFnb3hIS255MjI0RG8yOU9FSStnV0Fm?=
 =?utf-8?B?dnhQdGhDaXlFVmoyNlk1b0RaUTQxMkV1RUFycytWcmhMbGVVYy9BTDgydjdr?=
 =?utf-8?B?RUFEVURKbW9DcHFTTEFvMzFKb3YrT2NOSVdnZWlOS1pXUHRIU3VKeXg2dXZE?=
 =?utf-8?B?TExNTUNLNHE4bTRJVTZuKzZ2dmVVRTFVVDNHa0JISmZqcXdlZnNveDhXVko5?=
 =?utf-8?B?SHdYbWJnd0IxSy80eWMrTzZwZHNVTE9aUGlqWDZJbEF1amhES1FLOTVzRTVZ?=
 =?utf-8?B?MS9TMEhGeHlxSDhIQlFJTkhFSU9XWXlQQjg4Mlg3bm1zN0UyWkFqc1NrVS9y?=
 =?utf-8?B?bmhhSzZVSUpjREw1RjI4MTFxYURNVHhuTHhFOHlnYWZFL0R3THRZZndnU1hE?=
 =?utf-8?B?TWlXQnFNK29DOFZxc1hsS1dObDVlUXhFajZkL2tzRXRYM2hmY2I0RmJKblZN?=
 =?utf-8?B?eDlsZDhsOThqSit2dXlCTy9hdHdkVDVlQlN4eUc5THhYVUhOVVVGZmN1WldI?=
 =?utf-8?B?MXlJeENFVjZJU0VlZ041M05GMGZ2U0tVSFZmbDFxNU5mSE92ZGpkc214YWpN?=
 =?utf-8?B?a2JZTVlTNzRUSFRCWU5Ra0xnVzI0T2pIOFNCbTFqQlRFcWtNcEo4V1hDSVhp?=
 =?utf-8?B?cFlrUWlFOTJuR2cwMG9pKytnNkRNL0NoRmYycWwwaGdFcW5HNGM4YzJwczFM?=
 =?utf-8?B?Z2VNc2ZlWmVsTWxnbFg0OVkyK1JaYllnTjdObzBhanVNR25MTzU3dWg1Zi83?=
 =?utf-8?B?N1RYZnBuYnVYUGl5WnVDc1NIRTVvWDFRRlJQcTVXeXJyK2pVY0RIUFFTNTFU?=
 =?utf-8?B?T2VraXJpTnJKV1BHVERGYmF4bGRBdU5BR1E5K3lPWkNVdHR1N3htc2FpdFR3?=
 =?utf-8?B?ZzByVmRoTEluMVNjbU1iQzkrbGRqQzBaMkJwdlUwenJieW9ucmVXZ2RVb1o2?=
 =?utf-8?B?NUJQbmFkRzY1c2FZWlBJQ3RNQ0U4cUVZNHZBV3V3Mzk0eWJPdDlKMTMyMXZ1?=
 =?utf-8?B?TXVYRkZSWXp4TWhnZ05EYjlhenJSeGhQVm1Kb2Nkc2ZiVHRkS0lEMTVKRWtj?=
 =?utf-8?B?a01KYU9rN0l1NmFJS2IyMmJEbUhkV0FpY3V0ZHV5cnF3SmNIemxHZTMzRFdt?=
 =?utf-8?B?VGpRaHpYZjZmaE14SThuQkY4b1djL3d1SjMyNXpTT1dUaHovMVJ2TU5FWnN4?=
 =?utf-8?B?eHZMeG8zalM5eWZNb1JmRG9lZnF4UHhzTTVqaFNDcmUxOUUza2p3WGsrSWU0?=
 =?utf-8?B?YThYNzRGbCt4U2lBMmtRRTBKbmExbmsreTAxRzQ0WHoreDhWK1ZrRnRpb1lm?=
 =?utf-8?B?bVZoeGFvRzhHSnJHYVNjUmNNZHQ4OGpsT0pob2IrNjNDMG82cC9oOEZ2RXRj?=
 =?utf-8?B?SzdSWGdmK1FRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(7053199007)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?M05xcHhHb1hqS2luSHYzZ1FlV3pZOS8zL3A3anJ6Y1puQXFPNXg0blFqK3FE?=
 =?utf-8?B?dVJ6VlJkYVlHRXl1Z1RTR2hEL1YrNUtjK3lldmZwSDRPQmhLRFAxYW95akFF?=
 =?utf-8?B?cElJUXRyMGxqNGttZll0djBsNS9XVTZXeVFnVWt0cktqZ2lQWWdvN25sbnNn?=
 =?utf-8?B?ZFVPR0lJVXp2SXc5UUMzOUYweEJBK3J1SVViYXR5VERwaGNtTkpHbnM1K0NQ?=
 =?utf-8?B?Uk5EVm5YdW80UjF6WERvd3o0QzJ4VkNOV1NCVlU0Z09vZlVGQlFZb3BiTHZ6?=
 =?utf-8?B?TTVMTG5wUEFwQXdmQjZweDI4OCtyNnZlRWRJNzFRY3BYbDJkem9KRi8rSkkz?=
 =?utf-8?B?R21sK1F6cVFkcmZ2VzhTTmwzNXdzOU0xNFM3VjRCQVhVc3V3aGswb0xOMHd4?=
 =?utf-8?B?STFwWjNmWCtUenlhYU0zTUgvbGZ6dE8wcEdRbVE3LzJUdC9UT2VZV2p4KzZh?=
 =?utf-8?B?S1owVnJDbkxFZ3VxRUhIQ3ZndmlDMnJ3SGltRVJ4MlJjOGVMejU1TndvSUdu?=
 =?utf-8?B?RENSSUF6cGNOSGRzQ1V0NU91ZFB4cTFVNGRDdW4rZ3JDRVl4aldFMGQrYU5O?=
 =?utf-8?B?Ui9EUERqajQzWU5Gd05rMTVXQjZ4OGhjMFZZNVZrRnk5RTNYNGZzZXN4cmpD?=
 =?utf-8?B?dktDeUVkcTJhNlE1MjlOMm1Id1RlRDFxMllzc2h3dTNTdHFocGFIWksrTytm?=
 =?utf-8?B?RFB3VTRTdUF6cTRIMTFWdjFXZG9Xa0Q0aEY4T042RU0vOTNMZEhwNzZKUGtL?=
 =?utf-8?B?WHREYlBTS2dWajJ0Q0FSdlNwellzRUFIeDFkWFI1bnNVdTZzay82VTlwVDZL?=
 =?utf-8?B?UWFFNy9YYUE4Z3hiNWczTDIwZ0h0VjVaUXNNNFlQa3RZMnRRQ3AzVldGZWZS?=
 =?utf-8?B?eVpYREVYcGlLNzI1cGpMT0NRUTY5ek9zRjhsUjJpWW9mcEtuNmJWYTFZQTl3?=
 =?utf-8?B?YkcwNTByNWhRcFpoZFZLSmc0ZkJ4Z29wUVM2UXVZTFFpRTNqQzM5UmpLaFpZ?=
 =?utf-8?B?WjJLUHNaTTNrQURtRmFTeUgvU3ozdlRHUW05cElaNEF0TlJMTlpyc2hZQ0Ra?=
 =?utf-8?B?RWE3b1l3STR2cjhOMmhFaVRGZ244UDNZRHlHT2pLVmkrMmxnQTBXL2R0c2JV?=
 =?utf-8?B?QmREbzZhaWh3bUtSN0ZDWU9xa0dyRFpMdys4Q3drWXE5dlZSMWczQVFZYmJI?=
 =?utf-8?B?YTNDTVlGVDgwRmdPYmVUZUN2dTJPS0U1aFJtTUc4ODEwTWg5c1ljOThKeGZD?=
 =?utf-8?B?K0NGd2toMi8zTC9ndHFlSHBmTmRLSWpVMXdJTXR1aGFsS2dWc1lqN25SYkxq?=
 =?utf-8?B?NjA0dVBiMlRMTzl5cXVHUDlHOTNFc00xUE9CQm90cTl2SjdKTXJjNFpBc0hn?=
 =?utf-8?B?dk9VZm8ybDdSdlBQL1VLeGNNZXZFNjd5Y1JDZUpxMUwvWEZPZU4ramxkQ3Q5?=
 =?utf-8?B?QjNGbURDcTRRSnpzQTJ4MFBvbzU0TGduMjNPYk84azRZYmNnUDU0cUtzR0M2?=
 =?utf-8?B?N3lqbWhkZFcvQnp5aG5xL3pqckxoNE5pM0VaNE1UVllvR3J5NkNlUzdyTm9x?=
 =?utf-8?B?Y0VKbGNmQTJqcjRsWEt0aWN4eFhpTTBGKy8xbXF1VFFuci9xZDFsemV0Nkx0?=
 =?utf-8?B?dkRORHVIWjY3c3Zmd3FIeG1jYSt4KzdUZUxlTnBCbTRDc2pRNm1yVjJOQVFl?=
 =?utf-8?B?Ukl4SHMvTUl4YTVodzNmMnpSUHdvM3VWamp1MEN5ZnZBd2hUUFpZS2ZIQUNw?=
 =?utf-8?B?MUtEUFNTVkhQc2R2UmZnSTFON09Ic3BSbGVndXRDWjhVS1hXcndiUDJNaHZu?=
 =?utf-8?B?My9yNlNNcklGZ3E5ZTZlVUdLR2xiYjZ5TjFlUnFoWW1aU0dLTWV4R1RDKzhi?=
 =?utf-8?B?TWFycU9kM0p6VlVsb0dsUnYxL3M4RkhVNmNCN2hKT293TU8rd0hJUWRtdzFJ?=
 =?utf-8?B?Uzc2ajBqTmRnZWJHd3hGR05McXQzQ3gybEYwSUZxcTFTVGZkUVJzdFRiWFBW?=
 =?utf-8?B?NmdIQVlqczVzWkh1MmJCVXFiNTJhTHZQRVhhK3p4SURiOVgyaHk4bnNTSnIr?=
 =?utf-8?B?bVFUbzlSQzFxTEgzNVc5dVdLOUFaLzRpRHFHSmtGV0FaYmpJTis4WHFrSzZM?=
 =?utf-8?Q?tp5/6rHDRSEOraHjbP0xAVJBX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fd053b-3894-4e51-5fc9-08dd46092629
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:18:46.6952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4x/dnigNMtMazafN72CpCwsWcfED89Wx2cLWUsCY7sPZuo8teKr3RzFskckFU/YFIAlIsLCLktVs47miaz4MXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10546

Add SCU reset driver for i.MX8QM/i.MX8QXP.
Add phy driver for mipi csi phy.
Update binding doc.
Update driver for imx8qxp and imx8qm.
Add dts files for it.

To: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rui Miguel Silva <rmfrfs@gmail.com>
To: Martin Kepplinger <martink@posteo.de>
To: Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Guoniu.zhou <guoniu.zhou@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Robert Chiras <robert.chiras@nxp.com>

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- move scu reset binding doc to top scu doc.
- isi use seperate binding doc for imx8qxp and imx8qm.
- phy and csi2, compatible string 8qm fallback to qxp
- remove internal review tags
- Link to v1: https://lore.kernel.org/r/20250131-8qxp_camera-v1-0-319402ab606a@nxp.com

---
Frank Li (11):
      dt-bindings: phy: Add MIPI CSI PHY for i.MX8Q
      phy: freescale: Add MIPI CSI PHY driver for i.MX8Q
      dt-bindings: firmware: imx: add property reset-controller
      reset: imx: Add SCU reset driver for i.MX8QXP and i.MX8QM
      media: dt-bindings: Add binding doc for i.MX8QXP and i.MX8QM ISI
      media: nxp: imx8-isi: Allow num_sources to be greater than num_sink
      media: imx8mq-mipi-csi2: Add support for i.MX8QXP
      arm64: dts: imx8: add capture controller for i.MX8's img subsystem
      arm64: dts: imx8qm: add 24MHz clock-xtal24m
      arm64: dts: imx8q: add linux,cma node for imx8qm-mek and imx8qxp-mek
      arm64: dts: imx8q: add camera ov5640 support for imx8qm-mek and imx8qxp-mek

Guoniu.zhou (1):
      media: imx8mq-mipi-csi2: Add imx8mq_plat_data for different compatible strings

Robert Chiras (2):
      media: imx8-isi: Add support for i.MX8QM and i.MX8QXP
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8QM(QXP) compatible strings

 .../devicetree/bindings/firmware/fsl,scu.yaml      |  12 +
 .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 ++++++
 .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 103 ++++++
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |  34 +-
 .../bindings/phy/fsl,imx8qxp-mipi-cphy.yaml        |  57 +++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |  12 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     | 391 +++++++++++++++++++++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso |  93 +++++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso |  93 +++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  60 ++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi   |  53 +++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  12 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso |  92 +++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  44 +++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  60 ++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   5 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  47 +++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   2 +
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |   8 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 106 +++++-
 drivers/phy/freescale/Kconfig                      |   9 +
 drivers/phy/freescale/Makefile                     |   1 +
 drivers/phy/freescale/phy-fsl-imx8q-mipi-cphy.c    | 185 ++++++++++
 drivers/reset/Kconfig                              |   7 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-imx-scu.c                      | 101 ++++++
 27 files changed, 1685 insertions(+), 21 deletions(-)
---
base-commit: b830154e4d06a06e1312311147be924b4232dea0
change-id: 20250114-8qxp_camera-c1af5749d304

Best regards,
---
Frank Li <Frank.Li@nxp.com>


