Return-Path: <linux-media+bounces-40750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4B2B315EE
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 12:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0710DAA8227
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 10:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683542FD7BC;
	Fri, 22 Aug 2025 10:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ID+z5jGf"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968722FCBF3;
	Fri, 22 Aug 2025 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859898; cv=fail; b=SrtxD/dMbJGO3BkC+UDe+M4kUqqO5bxW70gfCf8NnbUKNMN28Wk2NnawTbMbFsyIQ06yHAReaNso87RPP41agXUfAGXqAX1xDnMO0ARWIC+yCYkIguoaA40Oys4fgKuU2KU8DW9AbgJUQhkO+mDUfjP2FEXyGcMV17DbN4eSz18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859898; c=relaxed/simple;
	bh=Ag1sPLelcYnWzBZdsKbQ0WjA3PlOnGbW7Zj32b1hAMA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cMbpo8bMhS59JCF7G4JVwDgrbnySDn1/CosuEYrDkOYwvWG7KGtFx9ZJ56A++bTz03swEDSAuqmFa+CviC+BLXmnRer1ETnHlh1uaByMCjsVrI1vc6z5zUo7qDJnvQ1KNE8eUsZw5n8V7Z49hpbeTXv8xEMj8zzv6AUQoHetCmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ID+z5jGf; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coBCmXURaA9X2l2RAFaWKj7m60YztW2G7GI3EnAyqzW5LQ/fLukqqPQ3dXGmamFNVLeEDiN+t3JsjIaiCIpZE2m82HjIDj9YL5EOFQ7sh+n3uNE8c59MWatqlJXFKU/CvPoc/Z72Pz5NqrGUHiX43LCQOBgC+hKUVoRjAvC6tCjG9SaDiFJTWa5yoaVGf/QF/sja3tUFoJukpcY7QssksYvKvB0pmnPns+b5NL8862HLbI7/PPRZ9NivzsjAQ/K3yPNe+Xig1y46OtkvlHWOpXh5vRFPtTb+SVKpzRZs2OVq0KeCxaeWHdJse0Ix4lj3fr0U1TlduY5v30QieholqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrV43YVpug2qoLlBpnd5P8XCLKayNbe6sk52nDkNtF4=;
 b=kV2QBAsuITF/MMy4FTPP6RL7/5/UyBgwBERE0WIgURPD6qDGQ1JkOmzOe3twBoMgYt7euAfqcMzCcIV0nutPt5GqExjb0WI9vANKk6o8Hf6em25sG9DLxvgCuHb+N+zoPlNMK79OxcltNOFXi0FO5Epj0xu+w7zugwrjZtDVydNz5qU3FmYupBBLYLm520E6sFH7NxuC18XQZ7G3ab2cRq5a+AJBdDKu0MGriHqNUYl+f6nL58ELWTVtcKJ0euZ7CrNv0FGn3xS1n18O1sWhXqVVQLulqFw4ZA/lXxPe58giqwya/eq66WtpHPUaNlHCm9g9v5PJM5MQVRvSfT03rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrV43YVpug2qoLlBpnd5P8XCLKayNbe6sk52nDkNtF4=;
 b=ID+z5jGfs/q6/mJXCmgy/Jbipjt/PQ0iFsbRJKBqBcJKU+8ivsw6J0eoc9/mwY3qdx0ZifUDlR7TvtWeil9pNsjMEGXlGTfl7Ibu+IHQ+TcgyYaV3eUMMpL1WgE/sx8WXCuH4brZporHIs/ncD0CgVpGKgpXuOvjAtbbZo2mgqAWQmBxc+rvhczZq7HycE7icH6O1N/EN+IW3VeWzuA25b9mb8x5uawZ0nxDW8bY2KVxLNnNYzY3/w2IKPFua+vWDkS3zTulKwDHARXRY26tssgftLrWKJY8m04ZkcTTkKWTXb7q9eAKOsyueTJtCKXFEs+fWm0/mPe8HdkcpkhsnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8207.eurprd04.prod.outlook.com (2603:10a6:102:1cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 10:51:21 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Fri, 22 Aug 2025
 10:51:21 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Fri, 22 Aug 2025 18:50:15 +0800
Subject: [PATCH v2 4/4] arm64: dts: imx8ulp: Add CSI and ISI Nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-csi2_imx8ulp-v2-4-26a444394965@nxp.com>
References: <20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com>
In-Reply-To: <20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755859853; l=3033;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=Ag1sPLelcYnWzBZdsKbQ0WjA3PlOnGbW7Zj32b1hAMA=;
 b=tlVBH9zdpw5vFz0YEsSEObdry4rofr3LSjzEnbhoJznU98CI7S6/tObFYtCg1CP30m0iJevZW
 m9nkIw8P8N2AaUnf1RmAcII9lfeemWxX49Oore/k+abtIbGTmkRoGKV
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::20) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6a22f1-a833-4f5a-acc2-08dde169d4b5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Mk5PTkxwd25IMElTcXhXUHhZOE8zNW1oejUyRml3SXFWdVRjaXYyajE4NHU5?=
 =?utf-8?B?bDZiSEtwVE1ha0pJYUNnSnVNb0JMc3hYQ0g1VkFGeDZYVDRpZHlYRFpDNFZr?=
 =?utf-8?B?aWVzQ3FTZEhHRHFpcVl3MEhVSlcrRmxSazZBai9oT2lKTEN6SGZ2blU3TElE?=
 =?utf-8?B?dmpyWUZUSm13QTdwSkVsMzMzUWVEWWFHQTJURUgzKzJuNWRvYjdQZFJqb3lR?=
 =?utf-8?B?SnYwR2pXWEVpSk4rYnkrZnJWejlpYzVidjB3anlzRGpLb0JtSW5EVUgzbXdU?=
 =?utf-8?B?VVlhZ0VRaVV6U3dYclhaNDZXWk1EeGJkUnpyaytDZ2Ezc0JvSHVnQU1GQzJW?=
 =?utf-8?B?N0hzbGpjS1REQmJobFd1NWFGY0doV2xkYU9nc0hwWm5mL0dKRzNXTkhXS0xk?=
 =?utf-8?B?NlVmdFp6Zy9zNXRjNEtIQ1lVdU9kby9TaDBNTytnVFVJenNhRVk0NG5kZDJo?=
 =?utf-8?B?TWR5ODFjWTVTdzcxUkhtaEZ0VExjdGUwb3c1cDR4cFpZdlZwcUFoMkhCWEha?=
 =?utf-8?B?MWhNMlZ0Z1E3YVRZTGt1dDR5YStjelhrdDgvOEZqNC84bXJSV2RKT0ZaeDhL?=
 =?utf-8?B?TVRyN2tQM0JFRUJyN3UxVzVnenJSektNeUFLY0NER3k3a3Bka1dVMzl6cGE5?=
 =?utf-8?B?eGluVFhwNzMwcnA4YnZVRHdJOVhNMXRFL0d4TGxNQ0FIM2FHcm9FTmM3T2sw?=
 =?utf-8?B?dlRXM2Q0UXRIUlBwK0M5MmhJUDJJTGdub3IrMktCMUI0ckl5TWdiOWFXYlRR?=
 =?utf-8?B?OGd4SkZKM25pc1NoMk9WdzJOYUoyWHVpUENnZ3hVbEFhYWsxamI5YnlJNEFm?=
 =?utf-8?B?K1AyQmtNWU9odmFYcE5pL0o3YmYxKzRTTFNqMlJjMVJubGVyYjM4VFZjWWdm?=
 =?utf-8?B?M0hlcng5Nzl5VDl5T2taeERHUndrUENlbnlVM0p0UGwwclBPL0picG9BdGd4?=
 =?utf-8?B?RytlRDNNSlp3NU9LOTVxWEowZ2hZMEd3aEVjTWtwUm16WE9UZHZXM1V2ZTFM?=
 =?utf-8?B?bit1dURieHRxTTdnMWx4M2VVMk1hKzRTR042WmVDQWpHOCtwUmY4dTRXWGVP?=
 =?utf-8?B?VmFxSVY0V1ZpOU1uVTMzNWNaUDF5QWJ1UGVTZzRRQTFndzJMRnlEZ0VsVnQ3?=
 =?utf-8?B?YXVjcDBheEJzWnBleW1pamdINGd2SHg1Yy9CdTZFckRadWxkbGgxYi9LK2Nz?=
 =?utf-8?B?NnNjNXlucHNrZFlkM3krVGNUZGg3bHVsWjdsL2d5Z2NLdlFIVkZNMTBvSWNW?=
 =?utf-8?B?SUIwQU5YT0FMNzRyL1N0Umt4bHRFcVZ3VjdlRVF5TVFzckVHaEc2VEdvVjlq?=
 =?utf-8?B?UkJVeDlTTFdNOGNJY05sbndjYjRhYkkvNVRKYUt1R0RnQzBtZWhGNGp4Tlh4?=
 =?utf-8?B?QVlMUFVyeXdCOHFoN0dKUU8yb1ZjOUlzZUphMkRmazVSNWgrYzJ4MTFlWHQ0?=
 =?utf-8?B?cTkxSExrYUVtQzNiaXhuQzhhM2dKYmtEUkdoTzA5cyt5UkZleHJtMm5iQml4?=
 =?utf-8?B?dlhLL2FqcGJkeW82bmJvZlI0dmx5SE0zTjJqMU5zbklDanpiNnZNNFNGRHQ0?=
 =?utf-8?B?S29FNHpXVnBFd2s3a1dibmIvN29Lam9kVGxTVnBuY2RGYld2VEFEdDN4ZWtL?=
 =?utf-8?B?ejdKUXAyRlk0bG5EdmRweTJsbSt2eVNCMWw1VmExTWdIYWF0UTRUOU5XNnNO?=
 =?utf-8?B?QXdTSStyM1FwMDJ3S0xYeEc5L0l5RllMQkF1VUJUbi84ZktublZIQWh2a3F4?=
 =?utf-8?B?aWwzK0UxSm9JNEUzZTZkQXVUL2tVUm4zdjY5MFdKVWFlMER0dTFobEJhSU5a?=
 =?utf-8?B?NjBIMmwzcDdiMTdRZ2NIQXIxdzkyN1hSN2djcGtPM1RJYzcxOGI4Z2RnNVc4?=
 =?utf-8?B?TCtkcnFpWVRuLytHMzNGQTlPM01PQmQvSXA3eG1QYXhkL0kyTkh5U1pQUjMy?=
 =?utf-8?B?SXN6Ym5LclhhaTNjcW1FblJxdHBDRlRPY3dlVXNkTGdFekFUQ1RZT2RZdnE2?=
 =?utf-8?Q?+MfVXMErSB1PESLxBS0LWoEOSMlqAY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?clV2NGZ0Z2E4Ylo2VU9TYW53Yzg5NC9OTVN5MEFURkxhVGVWSVVDc3FVd0M5?=
 =?utf-8?B?NUxlajJiOWE4SmFjdkxxTGtTQlJsTWM4SVRoMDVmMGVIN3NxUXg3V3hpQmFC?=
 =?utf-8?B?aTZYMGR1algyeDYydFdiWHRjZURKWFpSd01WUE9ZZ2ZrZkh5Tllsc1ZLRXVi?=
 =?utf-8?B?YzF1aSs3RkpTZmh3K2Jkd1MvRENYYVhIZmdkZmRCRmZhRUtQZWV3b3J0Vksz?=
 =?utf-8?B?bXN6UFcwUDQzZUJNditJVkNnNWNTSnVLYzkrVmNWRTJUbkZvZnNyNlpsdFZF?=
 =?utf-8?B?ejhxcDZtOExPYURIVUJOSGg1cmVTcUdadGp2U2M4QS9xRXpoRnNnWFdYMERp?=
 =?utf-8?B?ajQ4RHR4T2JVR0lTRE12S0tGRnpOV2pTbjN6NnhsbUc0aTJTaXNQZUErQ0NT?=
 =?utf-8?B?eWMyNWkrTnBZV2VOSnJzSTQxM1ZteGsrazViMFFLOUl6Z2oxY0VuU1NWT3VE?=
 =?utf-8?B?am8wOTdYY2xBYmRtZDFpVllQVGNQakFnRGI3MmtZR1laSUJPMVFwWlNvb1Rt?=
 =?utf-8?B?Y1c4L0dPZnhObUk3OThPOE9GcHVFV1BVbjJTMmdkaTV5ZlJOY1hWb1ZVUHZm?=
 =?utf-8?B?c1A5aFpWNlZvU25zdDZLZGZlRC9DcExveUVUYlh2a3A0QzE2UHlXSjY0Q3Uz?=
 =?utf-8?B?bktsMGRuM01oNy9nL3F1ODI1aUo0SlBtWllKQ1VuR252U3QxRmV5RURKam0w?=
 =?utf-8?B?cE5sWWxaMnl5eTc1TlhtM0p6RURqblBuOE9DTEtxejF1S1RsKzdGSTVUR1BS?=
 =?utf-8?B?MjVWWDlXcFZIMVQraEJtUkVJdHFxQXY2ZUhwUExLTmsybWZxUndEM1ZDaTZS?=
 =?utf-8?B?WGdwVGh1RjVkZC96c1ozUk1UV015bDVjRUNxUE1PbjRZTytKcERYTEkrakNn?=
 =?utf-8?B?bVRsbmtiYUR2bjdNSFpUUHNiVVlENDJ2aXZ1VmtlRWhoalY0dXJJTjhXeG1O?=
 =?utf-8?B?NWlLTmEwdzVML2ZXd1YwTjliOTJJOHBMY01LZ1BqQ1pMeFJwUUQzUE1jeGla?=
 =?utf-8?B?RTFON1ZuRm1DOVpqN1FYcHJTN08zRVpvNTdQS1ladS8zVzg1UVRERi8wYzNM?=
 =?utf-8?B?TTBtOWJzaVJMM01nci9vdCtaTElvSW5YTmNFMU1seXFjSDc2ZUYvbDcrMGtF?=
 =?utf-8?B?ZFFSd2xhS2pncnBtL0FxdWRDVG9yYW5zNytRRzIreDVVZXZzTlZVak5UNFli?=
 =?utf-8?B?ajc1VjJjRWJqallOakJsQjY0UVRKdXdHaVRhT0IrZThRcFU3TGVPeFJSTzhB?=
 =?utf-8?B?S2FvdVBvTHhQWEY0QlIvYi82TGdIeWE2M1JUQ1NwQ3VUY1RaSHVLaU5sV0Q0?=
 =?utf-8?B?MTlneXpTYzd0UkFQTmNoQ3RldTJWdHBWZFJwYVJyYXFJUWtraTJxUjQ1UDk3?=
 =?utf-8?B?eTF4Q0ZwVTJ2cWVtanR3ZDZaVC9QbzBNUTl2VUN4d09JQWsrRVd4Q2FHZEtl?=
 =?utf-8?B?c2RiQ0xFUXhrV2pJUXMzRWF1MjJJbmEwWFVCR2pQVUdRYWJ3YjZQbkp4a1BL?=
 =?utf-8?B?RFR4UWZ4OFVqaFlOU1hJTVcwTzd5cXNxcVdyTUQrdkJQdTdWVDBtVEI1eG5x?=
 =?utf-8?B?TGY2bjY1eVR5TnBJUkZ0WS84cVJVSEFqREpyZnVTYWw2S3BnV1FTY2FEaWFH?=
 =?utf-8?B?MFlhOERVMld0VzdXYk5DcFNXRVM0MGVLcEo3d3pnNUJDSi9na1J0aFVKWlNP?=
 =?utf-8?B?RG9VdDNERWptMXozeTVjV0t0dzZFb2p3a0tKTllrZGR1TzZtYllqUFBybU9S?=
 =?utf-8?B?dFpDTkpSdUF5RHVGWVJMdk0yc1Q1WmVVcldTK1VSemFIQ3lkdFZEbEIxMHNS?=
 =?utf-8?B?bTJNdnU3Z0NlVThPaFRleWRYT3A5QVlDM0lTTExHVmdTRWw5MmYrTnZUU0do?=
 =?utf-8?B?dUxvY1N2SE1Xd1dEODJ3bWdXK0R2Y1J1bm1EK2lYMDFaVktwTERYTzk3c1F5?=
 =?utf-8?B?cjlYdDRBc05XbFBTcVNiMVoreXVxSDdyb2VhekN6aTJMSFVYQUdRYklod0g4?=
 =?utf-8?B?ZE1ad0V1SWNhbWgvVkF5c3JiQzhRVGIzN3VNT2N1SzJyU1FUTm0rd2xSWnl5?=
 =?utf-8?B?a2ZKTUFQaXUzRTNWdVhsZTVLc0dBeklzSG1qWDlTRHNHM2g5UmRCYllxZXoz?=
 =?utf-8?Q?cZxka6EtVAnAfKagowwmPP1su?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6a22f1-a833-4f5a-acc2-08dde169d4b5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:51:21.4847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jjmGrfIJ7jxNxrDfuZ34Pl1Apb/AC3/6xMzVVU1ItaQGiTR3b5uQPJRnqSock294YtAO6+GS+SS1r0pe9M9uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8207

The CSI-2 in the i.MX8ULP is almost identical to the version present
in the i.MX8QXP/QM and is routed to the ISI. Add both the ISI and CSI
nodes and mark them as disabled by default since capture is dependent
on an attached camera.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 67 ++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4950c37e72e04f6bfb5995dc19178..7981f7dc62f5dfb2dff051e2d91bde6a2498ac13 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/imx8ulp-power.h>
+#include <dt-bindings/reset/imx8ulp-pcc-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "imx8ulp-pinfunc.h"
@@ -842,6 +843,72 @@ spdif: spdif@2dab0000 {
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
+
+			isi: isi@2dac0000 {
+				compatible = "fsl,imx8ulp-isi";
+				reg = <0x2dac0000 0x10000>;
+				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pcc5 IMX8ULP_CLK_ISI>,
+					 <&cgc2 IMX8ULP_CLK_LPAV_AXI_DIV>;
+				clock-names = "axi", "apb";
+				power-domains = <&scmi_devpd IMX8ULP_PD_ISI>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						isi_in: endpoint {
+							remote-endpoint = <&mipi_csi_out>;
+						};
+					};
+				};
+			};
+
+			mipi_csi: csi@2daf0000 {
+				compatible = "fsl,imx8ulp-mipi-csi2", "fsl,imx8qxp-mipi-csi2";
+				reg = <0x2daf0000 0x10000>,
+				      <0x2dad0000 0x10000>;
+				clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				clock-names = "core", "esc", "ui", "pclk";
+				assigned-clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV1>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV2>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD0_DIV1>;
+				assigned-clock-rates = <200000000>,
+						       <80000000>,
+						       <100000000>,
+						       <79200000>;
+				power-domains = <&scmi_devpd IMX8ULP_PD_MIPI_CSI>;
+				resets = <&pcc5 PCC5_CSI_SWRST>,
+					 <&pcc5 PCC5_CSI_REGS_SWRST>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mipi_csi_out: endpoint {
+							remote-endpoint = <&isi_in>;
+						};
+					};
+				};
+			};
 		};
 
 		gpiod: gpio@2e200000 {

-- 
2.34.1


