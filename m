Return-Path: <linux-media+bounces-45339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B4528BFFF94
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 10:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0A5B44F66E5
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 08:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0FC3019A4;
	Thu, 23 Oct 2025 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WIMReNcc"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013010.outbound.protection.outlook.com [40.107.162.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150B5301487;
	Thu, 23 Oct 2025 08:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761208890; cv=fail; b=lQP833gcXpD1WQFe3FIsyAHkphTWiQChQJVxVvaYp7Qlr0MFktSRzBF1+pv+GyfaDXZSDU4D6Nhh4juoEIa09m8LHDkQt4AIEICKegoWDnRig3pDe9wpXI/LevRQZGilK29jk4weNrChOUK7MhsJAMBGuT8COYOwnde66UMBle4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761208890; c=relaxed/simple;
	bh=2DyqZxTZwAUH2CxfLluzvWuQnXJD38NonTxHa0pYtFM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SxqBevunCJY9pzv1Y9vR+vJ76uqpLLCDKCUSsqF53pfyFp0yQbxe+2/JERyr0Y3YyXOC+xwxirtQSle3KuHcTW622Y+idWN17LzLLonHUxjTJ7oZqA2w8YX1HAHVLb2buV4geFvBtgPcVRsM53EvoOXCLpQEdrK2zdR7I90VSOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WIMReNcc; arc=fail smtp.client-ip=40.107.162.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvHE4MRy3KX4ONRa0Y1LU5RthF1loGrn83rKoELE+LRXV7+ihhvLGXExwUQMMe7/y/++DdPuXGSoH9k1PRO6Rf9+BRsEb/dwPaKDj3/OocjhgIDkYcEatXWCWNUxncVrPLAs2oeeUHBdgN26VQmnOHgiLvDNjqjT65NVmXvbMz93l+O/xj7LqRBlnijCpxqJbHS7eUgrHi5sx5VIuN94IDWneeom/Lp2AE8EGuVgn7M5onzuK+EPFXo1Jeh4AsCSK1Zf+VF915F5HiovABx8XuRI2I12371c4n/qpn350FBF2LlwDvT8GgX9NWu+qs6xi1LujaMxHmDMaVoASEKBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DyqZxTZwAUH2CxfLluzvWuQnXJD38NonTxHa0pYtFM=;
 b=P6C4TDJCgun+Fx3QpYZKc9hsmu7JJS08UVT8+orPo0ZHg2DbAxpYD43ca9FV49Zwe7aWYeso/8E6kGUJ6OYHFOx5X5QOk1LgrylrOFSRSCKCsmFArC+kvTQWqqxh3FimdtmXhXkS47OEEe7GxGPcCOlMm0eXd15R+wnrVOvtiMMYM32pKqVmea+KSbyyXaOuPV90b7MUjFm/yOWAG5ijFb4t7ocAfb+eZ3XppLMR3gqrRrGiPEVPwDffTkSTXDW+xCh/otjQaXgNeXUc5nIbgcdij3P35xrm4zyR34i491N9bBnPIoB62C8mHrgN7CDfv5E1abviac7R63HADFsgdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DyqZxTZwAUH2CxfLluzvWuQnXJD38NonTxHa0pYtFM=;
 b=WIMReNccr9KpezUlQtgEz3yhnZIcnTHeIhjjdfua55eHBmTK290ivOPkse2LYGUHvVHmjpOaVltHNe3RjIGPJXvXqcwoGU8dKDLm3XiZdVXUSDIPPajgUEmE3YmbpUUN6mO23gbvSBIvLD4fZDJ754b2E7pYRoGpF5OINWaNDXfx+UaZDWbnLTaP2kcq2rR6mcm6LOee1/OvCs2kiFg+bL12IjP2voOe/DWuxy3XMqY75w1MSAtEakjYjybeXAqNMByAmzhCKBSA7RujU7o+j8P8cwgmN2Qs8c3r6AGvDMiJD8ZYMkqbZ73k03qO52YGNrGMW16KwzRmwU/dSMy+iQ==
Received: from AS8SPRMB0023.eurprd04.prod.outlook.com (2603:10a6:20b:44e::21)
 by PA1PR04MB10294.eurprd04.prod.outlook.com (2603:10a6:102:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 23 Oct
 2025 08:41:23 +0000
Received: from AS8SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::1394:27d9:e69a:1798]) by AS8SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::1394:27d9:e69a:1798%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 08:41:23 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v3 0/4] media: i2c: ds90ub953: Add back channel GPIO
 support
Thread-Topic: [PATCH v3 0/4] media: i2c: ds90ub953: Add back channel GPIO
 support
Thread-Index: AQHcJu5oc3KqDcgry0GiXUxH93Xs+bTPoNSA
Date: Thu, 23 Oct 2025 08:41:23 +0000
Message-ID:
 <AS8SPRMB00234BD00ADD079D8DC7E438FAF0A@AS8SPRMB0023.eurprd04.prod.outlook.com>
References: <20250916-ds90ub953-v3-0-bb7bc6545da7@nxp.com>
In-Reply-To: <20250916-ds90ub953-v3-0-bb7bc6545da7@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8SPRMB0023:EE_|PA1PR04MB10294:EE_
x-ms-office365-filtering-correlation-id: e9716a82-d6ab-40ab-039d-08de120ff25f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?eks3alg5YnRBRzVpVFIremtFbjhnNUt6VU9Kb081SXc4K3M5VlFScnFXd1Vo?=
 =?utf-8?B?ejMwNEV1ZTJvcVJRVUx3NEcxU0ZDY1FPT2NIMkxmNHZPMEdtVmRSUG1VMklH?=
 =?utf-8?B?bWs2MzdRQzd0ZSthTjQ3d2pxUEIrMmFsOEVJNjJHOHEvSVJjOG9QdEN0TGF5?=
 =?utf-8?B?WlhqZUlpandPQm9uMkxsYmYzUGR1ZFRIVFJMc2Vld0xJeTNBYkJDVlhjaGN4?=
 =?utf-8?B?R0RURWsvQVlCa0pMQ201bi84VTNpVmsrYzRBL05iVFlacURDNC9BVjZLKzFu?=
 =?utf-8?B?U0pFL0dWUFNMN3JRcVA0VEsxUDE2Z0FJU3lMMUhua2NTK05yaEFaTmVjMFhG?=
 =?utf-8?B?NnI5NGdpdnl4THpwb0g2WlNTdGJHam9vWXFWemlObllVQStUZXUvTHFFRHla?=
 =?utf-8?B?dGtJdVVkWTZGbG90ZXpBLzlaNEY0emIxUzBxUXJCMVRQK0tXcjNwcmJiNUpk?=
 =?utf-8?B?OE1zSlU1KzZrRmpPTE5EOTZKUUQwNHgreFU4VS83U1orMmJTbkhMRi9Od3VO?=
 =?utf-8?B?OVdPbnN0Njk1dWtuZHArY2xHQnV3TExLc1dIU1RxN2d5QlU4NHo1MGViOENv?=
 =?utf-8?B?N0trT1FjaG9GSXFNb0tiTHZ0YXk4YlhlQXlZbVNXMUZ0OUhKa0htOEVWNjBU?=
 =?utf-8?B?YWZ6QTZLREhWbzhxQzBsUjZDeUhDeERKZ3JXQ0kvT1VndGVTaWdNNCtQeTBE?=
 =?utf-8?B?MHdKT3dCQXllcUtnRkE5VnM2UDVZbk9sRkpua0Z5WWNLbU1UaExFaCs1VHAv?=
 =?utf-8?B?NENxa3J0QklxYzNjR29VZU4vdmJONXNRZW5SaVZIU2JPSDNuV3FUQTF2bHRK?=
 =?utf-8?B?dVowTWVURUdKZWlKdEtZV0tqa2FBaVJCK0orNEJuVTlmNFY5SnRHNjllYjhp?=
 =?utf-8?B?MU5CQXBacWJFUUw4UGNnYmRoQ0swcENkcUd3dWF2Y3RIak9BcW90TnJjVUo4?=
 =?utf-8?B?QzdJa2FKNWgvS3FTNVd2Y2RVNE9aMGRnS2xObjlkaUx0V21JUVVqSFQxUmtC?=
 =?utf-8?B?emIzWGYxckkxWFpzMWNPcGg2SjdyOXIvUEhPc1NUTFlWVVlhUVJKSm83L2lY?=
 =?utf-8?B?VzRybnVUUCtMeE83c3AvVTlReDJtNGNQelZwTms4RVFCZHJEYkRVVWtaZHM2?=
 =?utf-8?B?L1BiNFkyUE9tUGk3NysyTG9OcmxRaEtLZlFOZlNZQ0s4TjhjeW55YTd5dlJ5?=
 =?utf-8?B?VURibVE4ekhlYUsvZ212MVFKUWRFWUZKdDRSVHM0VDMzemJCUjFpQ0doYlBo?=
 =?utf-8?B?OHhwam1XazNlSTY3dE0xYm5SVzN3Z0pFUURVUjF6TVlxbjhjOXd3cTR3dVRL?=
 =?utf-8?B?dGhCNExMcEl4UEJZRHBGb0FocXBkK09LbHdZYzJvSDNrSDhJYWFsU1hhbGkw?=
 =?utf-8?B?SnhSenltYUd4SkgweTFxTVRwVkdWN29XWlIyZktNYy9BeDI5SGV2bmpJL3V3?=
 =?utf-8?B?eVB6Z0xRQzhJTkdBQ0Ztek9iS0JDN3JaY09PUlZuek9TTVJoa2h3aFdVeUF4?=
 =?utf-8?B?dDloZTY3WW5zVXFmRE9NY2JaWDBpNlhGbHBEUDVTbjRDdmpTcDNrOTBnOFEy?=
 =?utf-8?B?ZUYwYnhJNVdvcHdmS2J5dUVvNXdSSUhOYUZ2KzRZVEM3bXV6cmRFTEJNUjJS?=
 =?utf-8?B?Z1RMUm1nT2pUdUhGcnhwNzkzYy9leVhGYVc5V21BZk5hUjgxeFo1KzZqVkFo?=
 =?utf-8?B?VlZNckJBWTAwZk15MFpMaDl5YWszM1ZCOVk1NmJwdDNWL2xmSEVoYi9uQkpj?=
 =?utf-8?B?ZUoycFYzcU5MZlVLeitrZFdJMWUvTndnQ1Rtd1V1TXN5MzVDMXdpc204eHpP?=
 =?utf-8?B?ekJ6OGUyajRHZ3Q5S2NFeFA2WDFDMjQvSHdwMFcyZ2ZKYWgzZC9sbm1wWFg4?=
 =?utf-8?B?ZnR5bWN4OFlxNWxsTlZWeHErdGdHbkxBRWdOKzk2Vkxjc0NCOTluZWZmdVhn?=
 =?utf-8?B?eUo4aUFDQnVua2h3ZHBGZnV0YnBJMWF2Q0c3dmJCL2RzTjBvLytDYWxZUHk0?=
 =?utf-8?B?azcxaHVpc3c2TDRMRUt3ZFoydnZCRDRJY0hNVTA1UHlLTk9ueEtEMkgzZ0lV?=
 =?utf-8?Q?5vE6CU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8SPRMB0023.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFRyaDVVZ2tXQmxMNElNQmZMNmpncmI4d0dZclR0VHFTQmlKVVAyZFZOd1U4?=
 =?utf-8?B?UDE2NURQM1ZlQnBDWllWLzdBOXNRZ3NLK2FDNForLzU1U3h3dVQ5WWFkcFli?=
 =?utf-8?B?b3VEN2tWZ1M4VERJZzhHSTU3bGhtajNhaERnZUpvcFNJeWVIUmF2WDl5RVVi?=
 =?utf-8?B?dnFvQVNTaERxbmhWYVE3ODVHd0FnWXJsSlpFQ2s5U1JoRFdQSmZyQS9ualFu?=
 =?utf-8?B?VnFBaGFnRlR2czBZeFMzdFVCRHcvL2xPM1VUQWlTSlEzUXlsbUtJTTMvQTNk?=
 =?utf-8?B?NXhKR2hzdlo3YUszYTZNa3pMekVpZjRmdWEycjNKVkd0NDZPaHB2aWZkbzFQ?=
 =?utf-8?B?bjBNWjlkbnVCREFvNXp5dGM5UE1nYlVQSmVZWiszZFRmaW8yajlmdUdKSzM2?=
 =?utf-8?B?b25GNXF5UTdUaVREbHppV3kzVnIwZWhNNUtrM0NqZzhvZE4vZlFGTElWTWxN?=
 =?utf-8?B?TWQzTmFpalk5eTZERWVvdEZNZHlMd0YydzlFMSsvaGlJd0pZbzVFZzY5M0dP?=
 =?utf-8?B?dUNRcTZEV01wOEhpVGZwaXpvaGlYbHp6SkpwQ1UwWloybU9LbVUzTUhvM0di?=
 =?utf-8?B?UG5mL0ZZNHJERVdoZ2RqUXFlOE5VNk9Yd1A3TzlBWFIwK1QxQTJ6RE1naXBX?=
 =?utf-8?B?b29oNGdJL1RMMDI2R083WUFqVVN1bjJheFRtc09RTE1Pc0NvbzZmUUxVcStw?=
 =?utf-8?B?eVFsMWRWZ2l3RlNCbTM3NFp2YVQvT2pGOVI3RTRJVGhBUWxLVW5yWXVvd3Ev?=
 =?utf-8?B?VzBYR1FGeHZCT2xqWmRnNHljYmlmQUpUR0VLNEp4V3dSYjhYZDdMT3NZUld5?=
 =?utf-8?B?T3BKU2dhVG5TdnBZQW8wTWx0Q3ZwVUFreVFHS205dzIwaEpyOWxFNjdpeGxi?=
 =?utf-8?B?cnBFTnRhREpUcEF4U0htQnZIMUsvb3NCbUZDMXdNWFFSdDFzeGxsNGV3ODlz?=
 =?utf-8?B?djRSMmFMSWZ0NDNrOXdTb1hKRER4TmNteWdzVGpUVEZ1MGJoNlAvdGUzM3pW?=
 =?utf-8?B?bHNlVXl2bVI1YzVNelRmdkI5SU9RYkF0SWZuVjZXZWwvdEpKdUFBc1Z4YzVR?=
 =?utf-8?B?bVQvVzg1aG1FMGZnbDJ3ZDdvYlh0czlyQXYxOXJSVEhYdzJOcjZkY2JFc05p?=
 =?utf-8?B?MTc1RzJNZit0QXRXcERTQzJjaFJQOTJpWmt1VnZ6UVlreW5FOFJuRDdyc2xH?=
 =?utf-8?B?QVg1RmhpZU14aVJlSUlLem9MRFM5OGE5NXpHR2Y1d05RS0dyYkRCRUUxZW9q?=
 =?utf-8?B?blQzS3NzVU5KbDFJamxNODdpUmFVTTVRbzZQT095N0V1VTVYc2Noa3lLVjRw?=
 =?utf-8?B?aHRGRTJmaDZOZzZZaFFpUUNTTjU0TTNkenZsOU9kQkZlclFFd3h3M3dtSVBJ?=
 =?utf-8?B?Q0VIMTk2ckZkQnZwdEF1Q3JGc0tJRFAreUVPclIyUURQeStCRWV5WlNYbUtH?=
 =?utf-8?B?b3JIVXlYZmU2MTM5M2c1NzQ5UjZCY3U4ZUkyZlRhblQ2TkFvWndNdjBpVmox?=
 =?utf-8?B?MzAvbFJNMlBLRkpMN1VtUW1KSTdQWDZwTWJvOW9WQlpjNGlDcU9mUFVoSkpR?=
 =?utf-8?B?bEJGaHp2bzZVc2RrV2Rob1FoNzU2b0NTRmlJV2svLzVSWGRZQTNON3h3aHVz?=
 =?utf-8?B?U0ptTm5IUnlTemZrZmpQcGViVWdPbWxZVDBCOTBRM0UzY0ZYVFZBSisrVWpZ?=
 =?utf-8?B?RXk5NXg4TFNyT0pxblg2YWNpU3kvZ3ozdEUvMFl4OHBRWmtSU0pkVDFjVGxk?=
 =?utf-8?B?Zlk1K2hYUWlTK0s2RmVrcWhUaExsczRhaFE5R1VZb3MyYjJIV3NJYWFHZ0dZ?=
 =?utf-8?B?YW9CS2VaS3dYTUg3T0VSc1RlT2w1YnM4ZThBRll3S2hTRWFnNFdBMTJ6ZG1K?=
 =?utf-8?B?bHlyZnJXa0djUFk3MUxxRUppd3ViRUFJbTBlbS9lT0ZiOEx4Nk1PNlFaMW1B?=
 =?utf-8?B?UU92b0tNT3hUaE5JYkxPekRHK2g4MTkyZmJTVkpIVzh3cDRicE5Vb0pBZ3Fo?=
 =?utf-8?B?NUwwS3hIajhiL1hHRkREYkJ1WEhrTTU0dzI3em82M09TZXdDTUEyT1JnSHRz?=
 =?utf-8?B?VVpsVU1BWVFCREtiaktQRC9Qc0dVandPT2tFZFFNWUJLc0RRTHpPZ0tsYmQz?=
 =?utf-8?Q?vXQDWAG7obbsxT0a3Yxlu81dF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8SPRMB0023.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9716a82-d6ab-40ab-039d-08de120ff25f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 08:41:23.2830
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tj7f8CDinfAvvf45Fnu7TnLV3z05o4hTF8eD1oIrYQRotSBFTIR92uxWVCldGkM+kPBSZq34b0De5VAC8k8GvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10294

SGkgVG9taSwNCg0KQ291bGQgeW91IHBsZWFzZSBoZWxwIHRvIHJldmlldyB0aGUgcGF0Y2hlcz8g
WW91ciBpbnB1dCB3aWxsIGJlIGFwcHJlY2lhdGVkLiAgDQoNCkJlc3QgUmVnYXJkcw0KRy5OIFpo
b3UNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEcuTi4gWmhvdQ0K
PiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMTYsIDIwMjUgNTo0NCBQTQ0KPiBUbzogVG9taSBW
YWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQGlkZWFzb25ib2FyZC5jb20+OyBNYXVybyBDYXJ2YWxo
bw0KPiBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+OyBLcnp5c3p0b2YNCj4gS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25v
ciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBGcmFuaw0KPiBMaSA8ZnJhbmsubGlAbnhw
LmNvbT4NCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMu
bGludXguZGV2OyBHLk4uIFpob3UNCj4gPGd1b25pdS56aG91QG54cC5jb20+DQo+IFN1YmplY3Q6
IFtQQVRDSCB2MyAwLzRdIG1lZGlhOiBpMmM6IGRzOTB1Yjk1MzogQWRkIGJhY2sgY2hhbm5lbCBH
UElPDQo+IHN1cHBvcnQNCj4gDQo+IEFkZCBiYWNrIGNoYW5uZWwgR1BJTyBzdXBwb3J0Lg0KPiAg
IGR0LWJpbmRpbmdzOiBtZWRpYTogdGksZHM5MHViOTUzOiBBZGQgbmV3IHJhbmdlIGZvciByZW1v
dGUgR1BJTyBkYXRhDQo+ICAgbWVkaWE6IGkyYzogZHM5MHViOTUzOiBBZGQgYmFjayBjaGFubmVs
IEdQSU8gc3VwcG9ydA0KPiANCj4gVXNlIGhlbHBlciBtYWNybyB0byBzaW1wbGlmeSBjb2RlLg0K
PiAgIG1lZGlhOiBpMmM6IGRzOTB1Yjk1MzogdXNlIGRldm1fbXV0ZXhfaW5pdCgpIHRvIHNpbXBs
aWZ5IGNvZGUNCj4gICBtZWRpYTogaTJjOiBkczkwdWI5NTM6IHVzZSBndWFyZCgpIHRvIHNpbXBs
aWZ5IGNvZGUNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEd1b25pdSBaaG91IDxndW9uaXUuemhvdUBu
eHAuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSBNYWtlIEdQSU8gcmFuZ2UgZnJv
bSAwLTMgdG8gMC03IHRvIHN1cHBvcnQgR1BJTyBkYXRhIGZyb20gcmVtb3RlDQo+ICAgY29tcGF0
aWJsZSBkZXNlcmlhbGl6ZXIgc3VnZ2VzdGVkIGJ5IFJvYiBpbnN0ZWFkIG9mIGFkZGluZyB0aGly
ZA0KPiAgIGNlbGwgZm9yIEdQSU8gY29udHJvbGxlci4NCj4gLSBVcGRhdGUgZHJpdmVyIHRvIGV4
cGFuZCBHUElPIHJhbmdlLg0KPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNTA5MTEtZHM5MHViOTUzLXYyLTAtDQo+IDAzZWU3NmViNmI1OUBueHAuY29tDQo+IA0K
PiBDaGFuZ2VzIGluIHYyOg0KPiAtIFJlbW92ZSBuZXcgcHJvcGVydHkgdGksZ3Bpby1kYXRhIGFk
ZGVkIGluIHBhdGNoIDEuDQo+IC0gQWRkIHRoaXJkIGNlbGwgZm9yIEdQSU8gY29udHJvbGxlciB0
byBzZWxlY3QgR1BJTyBvdXRwdXQgc291cmNlLg0KPiAtIE1vdmUgUFRSX0VSUigpIGluIGRldl9l
cnJfcHJvYmUoKTsNCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIw
MjUwOTEwLWRzOTB1Yjk1My12MS0wLQ0KPiBhNzgxM2ZmYmRmMTFAbnhwLmNvbQ0KPiANCj4gLS0t
DQo+IEd1b25pdSBaaG91ICg0KToNCj4gICAgICAgZHQtYmluZGluZ3M6IG1lZGlhOiB0aSxkczkw
dWI5NTM6IEFkZCBuZXcgcmFuZ2UgZm9yIHJlbW90ZSBHUElPIGRhdGENCj4gICAgICAgbWVkaWE6
IGkyYzogZHM5MHViOTUzOiBBZGQgYmFjayBjaGFubmVsIEdQSU8gc3VwcG9ydA0KPiAgICAgICBt
ZWRpYTogaTJjOiBkczkwdWI5NTM6IHVzZSBkZXZtX211dGV4X2luaXQoKSB0byBzaW1wbGlmeSBj
b2RlDQo+ICAgICAgIG1lZGlhOiBpMmM6IGRzOTB1Yjk1MzogdXNlIGd1YXJkKCkgdG8gc2ltcGxp
ZnkgY29kZQ0KPiANCj4gIC4uLi9iaW5kaW5ncy9tZWRpYS9pMmMvdGksZHM5MHViOTUzLnlhbWwg
ICAgICAgICAgIHwgICA4ICstDQo+ICBkcml2ZXJzL21lZGlhL2kyYy9kczkwdWI5NTMuYyAgICAg
ICAgICAgICAgICAgICAgICB8IDExNCArKysrKysrKysrKy0tLS0tLS0tLS0NCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKSwgNTQgZGVsZXRpb25zKC0pDQo+IC0tLQ0KPiBiYXNl
LWNvbW1pdDogMzQ4MzdjNDQ0Y2Q0MjIzNmIyYjQzY2U4NzFmMzBkODM3NzZhMzQzMQ0KPiBjaGFu
Z2UtaWQ6IDIwMjUwOTAxLWRzOTB1Yjk1My0xNjg2MjhjNTNhMDANCj4gDQo+IEJlc3QgcmVnYXJk
cywNCj4gLS0NCj4gR3Vvbml1IFpob3UgPGd1b25pdS56aG91QG54cC5jb20+DQoNCg==

