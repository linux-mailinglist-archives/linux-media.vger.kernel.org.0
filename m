Return-Path: <linux-media+bounces-42270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 050AFB52C13
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A171A001CC
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 08:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F352E6CDF;
	Thu, 11 Sep 2025 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nySRT04A"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04692E6CBB;
	Thu, 11 Sep 2025 08:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757580312; cv=fail; b=Q+rZAduzZ4Ync+oYrjEa1wd7lwgStT+gtiAo5GPnx35Oq1MwTazILJoIPvPbF/rR7KVxXrS0cI4MVH9lMgmKfP1HrVpKp6D5iUPQ7Ptify8I/6uMT8+WsejzZNwehuFlzn8MtClxngL7YMzgqDmvyNdFBqTtCwrh6HEDqRt0kFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757580312; c=relaxed/simple;
	bh=PQ4anAdu8DeRWFAbeRrMikCJtLcI0q/L0HQepJU8h8I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ho9oilgVLqksRFz+HXSKss+oMA5DkpWIohn9k3pIyfnsLOhvB67tzvbI8iOFP41rFFEEL5Ud2euNbpTL4JMj+ge7PIZx80+yAq8LTJW/GimJ9Cq+Ync3fIRg9F6wQNu2FjcVDRieVq87okLFP/qEwIgnlwqCg3Qv6ZIQMIMlE7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nySRT04A; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dX2QVVcFjgTi+jHl7LSiqyhzDj3ehdoxhjgzY8ujgd1dyf7ZO//NqgStzZHsdWoNwEnXL3T5wUHcudc+OZt6n3lwlENBnUqvz7gCyqq+ASIS1HiZ3s0u8CI5IsUV4fYS3/WmvHmcUdt3m+zqKfZvT6D2UqVDCTaCVExTCZP61fOoVNzs2mV4RASfqMfapzE7Qdzo29dzOQq7s+mz4E1zFJTZwDpzNO1spTuQBxFt+iBe30+t16ToecUUUeRzj1dV4tJKPneW2DB91mtsXS6TF5VP8geHIzGbRgRk/a3zncabXiKrQwVgOlqDAekp8VVauE1RH8c1DX3YpMB1iVbj6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgsAC2eRi/NqCjsHcTE4PpmYKtshhGz0Ea7mzRS1PSw=;
 b=J02UFwbTeBagcG4synkCeJdkeksrWjhU04UDnV+3ALzWxcLeXO89B822KT0dncqMxtCwjbs3nKJx4d2SwgEpTbag+6Qp9bbhJ6WqLTiEDIGqihP5oNWMxTsaWX0tQ1QDgSlIXq/1ehvP22UyrtwFwI2Tv0yP9/wdnhG2G7zaJuygVHb+Fj3miMhPlKgqLmGe7wJAUCOJHeTTANyrFTZuWFGr88yIIJkhD50/ZAhQGqdeZ3qi3OIdPXA2w0yG4iWOYa6AF0NEUI4WV7NM/1DgH4kGzOd1PUCsWOT5WxCaDXjmwC3VC3ogpi1VvJTWfe7V8sPlcNrMAMHY0Pk3wJG/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgsAC2eRi/NqCjsHcTE4PpmYKtshhGz0Ea7mzRS1PSw=;
 b=nySRT04Ag2ifkGwX1ngL3qeDI9EdbAXqIwFvVnMJwOOEc5VL7VXSwVMegSjtlr953ypv3iu5mrC9P8wvcTbOp2Vu23gRINT/T60bd4qbls3mf4dsKp5GFFYkuJlIlgCOCv8oEMbUgmzlowL/2fW1ZVqENP6hhXcbbIUQxMJvS9rLFO4m7rTg3PCiNPfMEaRckDtLLf7z0qZDvnwkCzi62tDo1lCG0UMOMrF8a4bwOjKF79ZLdtdZdET20RdW4rf56mxW7q/zT8+ueizJ1C99YfpZm8ECjb78F8RGs6zdjFJwM2C8EqKzQLZ6tqLdrC55ObkPHpv1sddg3PvaQYivVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB9PR04MB8364.eurprd04.prod.outlook.com (2603:10a6:10:24c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Thu, 11 Sep
 2025 08:45:05 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 08:45:05 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Thu, 11 Sep 2025 16:44:23 +0800
Subject: [PATCH v2 2/4] media: i2c: ds90ub953: Add back channel GPIO
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-ds90ub953-v2-2-03ee76eb6b59@nxp.com>
References: <20250911-ds90ub953-v2-0-03ee76eb6b59@nxp.com>
In-Reply-To: <20250911-ds90ub953-v2-0-03ee76eb6b59@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757580308; l=3072;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=PQ4anAdu8DeRWFAbeRrMikCJtLcI0q/L0HQepJU8h8I=;
 b=jh3peuH9tiSljD+1o3lSSfmUCwNB/YV/PhrwY7tWJxm7TPfj/veTXn6NXMX1H5px5yb581uHp
 xrBFKFix4KtBA/bp1fdCitbzyJy4jDZVq+XyPA0cQhhh3WDQI6p8dp6
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DB9PR04MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c84d8c6-2765-4a2f-1bf2-08ddf10f8117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFNGSlVyc24yV1JySS9SZUJITzczU0hVRGpBNStWTjl5RnBrSnZDQzZIbzZr?=
 =?utf-8?B?QjdhaDNoQm0yalQyNEh6WUQyR3FsR0YvUUZBTStMdDFFbTZ4WUo5ODFxS3dP?=
 =?utf-8?B?Qjcxd0IwZklHaURjb01FMU5VWVp4cEkrY0NFNmNTR2ZIVUNQSk54eUpMem1Y?=
 =?utf-8?B?Z0R4Uyt3QzVoTmxoMnQ1WURzeTVmNFNUYUV1cVpIY2FReFp2czlEanVJZzFr?=
 =?utf-8?B?blF0S3J1VlFIL1dNeVJPYzdMVGd5akVDTmtIZDBpelJyMHhrZEJBZVBpTEVY?=
 =?utf-8?B?YngwNkl4cW8rNjVWUm5vWGxqUlRyNzFjbXlLVUJzY25iS2JJZDJQUUgyeHJ2?=
 =?utf-8?B?M1NJV0lYS3huRmg1RUIwdjBtaTJRcElNVTBRNExiQW1xTHF2RlFlQ2luQ1FS?=
 =?utf-8?B?QnVwaXJjVWFSZnNwaWUzcDBJR293d2FxdmliWERORklZUnYvdkxmZWl3ZWlR?=
 =?utf-8?B?Z2xJRjJiZTVZOEFEOXhtOEI4ZVFIR09KOWRCb2xXdnQ1Szh0dmNOWHg3ZUQw?=
 =?utf-8?B?bjh1OERMTUtXazJqVWJtUklKR1YyTlMzdyt3em9xQmtmNXlTcE5xYXNLNGwz?=
 =?utf-8?B?S01tYWVrSW1UZmdQbHVwaU1EWnd5emtRZkxaTVdoR3NGUlJwMjljQjJYMTc3?=
 =?utf-8?B?OEdzNzF6dmdJWVlpbWkvcW12MWptWGRzK0pBT2N4NFE2MlNySHU0UEFKT3lF?=
 =?utf-8?B?anZ5alcvMW02UGZBbHMrR2I5MjM2aVQweTNYQjZ4Q2JkYStjWmp4OW52U1Y5?=
 =?utf-8?B?b05VL0pOLzIwWVlEMXdwNktzUkRGSDA5STBIMnFxY0ZLNGNlSDBQdG5zczMy?=
 =?utf-8?B?OU82d05xWFh0YzF4T3FnL3pNUmNPZjZNN0xEOG5Ca0lwNGNpYnhXdm5MQncx?=
 =?utf-8?B?MjRDNmswakROejRQeDl2bjJ5Y0dLejFFMlpNRUdRQmR4MW82QnlsQ0JNZVdx?=
 =?utf-8?B?SjRGZ2pKVDRsdk1tZUtsOGRZVWxiM3JVVEJ6WmlJakoyancrR0R3WWlCVG5Z?=
 =?utf-8?B?UjhaWExzbzIxZWRPUi9iMGtsUjR2SE9HNHNJVEQyRzF1dm8xZXA5UWExdzhj?=
 =?utf-8?B?Sy9wVElrQVE0YjAwV2Vzcm1sMW52NUt3dkdDSEtJNkM2ZWlwanFvbnJLeHZX?=
 =?utf-8?B?Y2M1b0tPdWFPR2xpcEMxTEd3VjEyRHFXaXJ3L0pIVC8zSmdLTDg5eXZrYnBx?=
 =?utf-8?B?blk0ZlR4NnBWS2xEdkIzb0Z3Z0Y3cWt5aHVjV29PcVhNZWNkTlV6WG1oRTNV?=
 =?utf-8?B?WVBwanlnZzZjUUd0WkhZMVRWOS9VN0FkS0ZBU0c4MXZQZEtvZ1BiU1U5L1BX?=
 =?utf-8?B?TEZKZERUQUlJRU9sMXZ2WUJkTCtMU09mRFRlbUk5UHM3c2VWNWxxa3lKUis1?=
 =?utf-8?B?NGtUYXIvLzNIN1hCZUQrRjd3SGowZVpMbG4vd25kK0U3ZTM3dUcveElHdU93?=
 =?utf-8?B?cFJkc1d0UW9LY3VQNWx3T3JIN0JaWUphU2tOdnhxbFhwS2pCNXJHRlRFa0d1?=
 =?utf-8?B?d3hNSmpnZHRKVmhFMTZjdjBSaHdRc2hrMnpEbEpROGlYdVR3MThyR0o4cTZp?=
 =?utf-8?B?VjM5SEZDN1FDQ2k5bVZUd092TFpCWHhxQVFqVDJJVjRoZGFNSHhvU05BeEIz?=
 =?utf-8?B?bk1ydjBzNGU5Zjl5cXF2S1Npb0Z4cUJIMlhoY0tkWk4yQTFOVkhKUGh6ekpF?=
 =?utf-8?B?QmxUWEdGVnhlKzM0RXh4eFR3YUVMeUtVZDRJQ1hHeVU0a1dtd25lNlJmY2dO?=
 =?utf-8?B?d2lVTnJ3Z0hteUc4Q1I5SU1vaXdUK2dscjRkbWM0YUNNMWFPWnpnK28rK1NV?=
 =?utf-8?B?WGViNGhIak1HaUhkNmU3UWVTa0VCTnFIakV1czU5aFpORE9LTHNiKzlxQWY1?=
 =?utf-8?B?RnJVSGhzSHU4N1JNVUI5eThicVJHekxFbVF1V0NiT1cwZVhPMERKaWx5UHAy?=
 =?utf-8?B?KzVZWnc0V2RXWUVNRXFlNDMzbGdmRGVVakxkUklKK3FPWnZ3NUMzbFg0eWZN?=
 =?utf-8?Q?YBcDtwZgivjmPeJfRqbaQoPCUOa34c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3EvSDdTN29zL3VtdmpaTXVxOFdRUlpXbDF1eVQ4Y2Zrd2ZISXAvRUw0eldL?=
 =?utf-8?B?N211Wk9rOEFON1lHT2lRMGU3RXZpU01HUW5yR2p0TjQ3R2FrOC9udGE4bUNm?=
 =?utf-8?B?QWc4TFJuYklHam8rQUVTdnVKZFFGSUxCdExxMGM0aDRXajR3U3Z3MmE3ZkVX?=
 =?utf-8?B?V3A5Z1owenVUOWVTTllIYmJnQmZta09ub3F0OU03SWg0SU1lMnZteUp4ZlRz?=
 =?utf-8?B?Z0pQNndycHpuN0x1TjlBam56Kzl4dnRud05tWDhManFoMm1KdkhXMjVZdTMr?=
 =?utf-8?B?ZlFPdHlKald5VUJXcjE2R2R3Ull6eTRIOWg0T1p0MzF0TjJmbGJnOS9CbTEw?=
 =?utf-8?B?VFM0U1NyMlBJbllnSWdRd0Ivd1VJN3hpcUkxN211cWl3eC9qUnVMeEVqdzla?=
 =?utf-8?B?b3BGZjZYSjdQNGtYaWdhWFdZQWJObzBQVHM4RDdBRGo4VFBhcFlCNkJaZWhD?=
 =?utf-8?B?QW1NMDJsV2Y0bnlGNk4raWQvUVI3UGRFdy9BT3BKSHlCSzFreXYyWDJhcXlk?=
 =?utf-8?B?NjZ6YXh6WkVXUFEwOHhHSGNlQ2hpNjh2dlRzRElXZFNqYzRRdWoxamF0MmNx?=
 =?utf-8?B?N3F5bXRWTWI4WEczdlROZDhlWVNES2NwWnJrS0hJbUMwaC85TVJ4cjltUUFI?=
 =?utf-8?B?aGdGY3RPZGV2a2haVkM0SjE2VzlROTc5anFMVWhVUHJsV05adUpJa1FyajdK?=
 =?utf-8?B?bGNjSEZFQlhCMTg5bStENW5BbldhVXhxdU9ONmd6TnB2ZGZRNVdQejNCbFJO?=
 =?utf-8?B?clpqL25KYm1IYmhJdE40UW1HNkI3VHpXSWYxWE51alVUcG1sMUx0Ymk5V2ZD?=
 =?utf-8?B?NmRUQk9hdWhzWGtxbzZkUUNtQW9QRmROejNiVy9WNThhZWVxM2wwWUNhWGd3?=
 =?utf-8?B?VnpJdDEzN1Bxeko1RmZhdjI5eDZvZ3l0WWpjcSs5ZjVoTE41UW5pUk45c1Rz?=
 =?utf-8?B?dXd5TlJNNHpTN3BFVm10U2lzYmd2cGJ4NkNCblB0RkFXdlByb2RUQXJmT3lE?=
 =?utf-8?B?RHN5WmFBcUYxUzkzblkzODMyeHppSThJaG16YUZLamtoMWVRN0h2NlFFTzdQ?=
 =?utf-8?B?TTl2SUtiS3hkMktqQ2VuNThtMG4zUk9BdVZLeHpubE1qa0F6Y3RmRlBnTitX?=
 =?utf-8?B?c3NpNXdzbTdHdXJGOWdtL3A0Um9hRGJhTEIzbDVDZkZYQklMWFA5QmxsS0NE?=
 =?utf-8?B?ekJIL2I2QmlpRDFJSlRYVjd4MU1wbndkTTR1ZjFyYzVPRUlCMCtrWHd1cThS?=
 =?utf-8?B?ZldkSU56SVZQREtaZnRaV1Q1KzVxdGJWNDYvT1BPYVVwaGtmdDVDODF6eks4?=
 =?utf-8?B?QlpMck1TUnNmb2NQcWlIUEZHZmtDT2dzTllVWEFwcTB0WE1FS2MxcjhoZ1d1?=
 =?utf-8?B?R2xybDJOTmFnL0N6TFFtT0g2dDFNTjg1dWRmWldrR21BdHpuSFFJWlI4blQz?=
 =?utf-8?B?OEhTRituaTM4ZENlU3grZzI3TC9scldRYnRLRmhHaVJBa0cxd0RzV3pZRG5h?=
 =?utf-8?B?TzFQdHFBbkU2WDhFOGxNcGg5Z0xNVk8vWk1ydGllWCtnTUMrbkxLU1VQaTBr?=
 =?utf-8?B?QkRkRVdKTEc4YTdMUnk3U3hCL2VFWnVnNDZYYlkxT01zUXVOU1ZwTjJVWmNu?=
 =?utf-8?B?WGgwZ2JYbWlQdCtMc1FhNG9LMFVDNkg5d0s5L1lCMVp2REhoU2czUXNMb1lj?=
 =?utf-8?B?NFhhalcvSDNYWWV2UzZhbHR1TUsyQ0dBVmY5N1grdXcvTWR1Q1BidHRsVUlr?=
 =?utf-8?B?dHNCK1BtVmpObStzVnpvdHFsbVhvSzdYYVVmYXg2VTV4WnpncU96THRVR0s0?=
 =?utf-8?B?VXV2NHRJZlNLRVV3YXEzK21PUkNQcFpxb1ZhUVBVOXBOcnpncHVIWnpJdlpu?=
 =?utf-8?B?RFZnZll3YjFMRHJtL2VVcDM4ZlBSeENBTXpCU01FcFRLZTB2c3VZblhucHFa?=
 =?utf-8?B?aHlDaU9sZ0cvOWxFRjR1L3ZsZ1JJVzdUUUc2SEdPYlFKbm96NDFmdGoxZDh5?=
 =?utf-8?B?UnB0ZXVTRDlQZlNxK2F3U3JsakdnclpMRDZuWmU2S21wSzVXVCtuZGRmeXpE?=
 =?utf-8?B?VDhBajQzOTFiRnFHQ29lYXY5Tnoxd0F4S1BSRWNnRVluWERrWk0yUkZDZG8w?=
 =?utf-8?Q?XHYKcPlswv0KYC20fBTVI4tpN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c84d8c6-2765-4a2f-1bf2-08ddf10f8117
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 08:45:05.1133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9t+86POMjs1H1MNo6XjCQ+7i+8mGI7kOtPCvPIaR3INW1gSGOYEHraYY/Qr8kGrelpBuagTDI4ROl9sYfFq+7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8364

The ds90ub953 supports GPIO0 through GPIO3. When enabled as an output,
each GPIO pin can be programed to output remote data coming from the
compatible deserializer using the register LOCAL_GPIO_DATA[7:4] field.

Add third cell for GPIO controller to select output source.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ds90ub953.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index e3fc9d66970a762d284955f14db48d7105b4b8c4..274972cd21f9f0facd5098b724c0d6c661ce95c2 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -71,6 +71,7 @@ struct ub953_data {
 	bool			non_continous_clk;
 
 	struct gpio_chip	gpio_chip;
+	bool			gpio_rmten[UB953_NUM_GPIOS];
 
 	struct v4l2_subdev	sd;
 	struct media_pad	pads[2];
@@ -288,13 +289,17 @@ static int ub953_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
 				    int value)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
+	unsigned int val;
 	int ret;
 
-	ret = regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
-				 UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
-				 value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) :
-					 0);
+	val = priv->gpio_rmten[offset]
+	    ? UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(offset)
+	    : value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) : 0;
 
+	ret = regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
+				 UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) |
+					UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(offset),
+				 val);
 	if (ret)
 		return ret;
 
@@ -320,6 +325,12 @@ static int ub953_gpio_get(struct gpio_chip *gc, unsigned int offset)
 static int ub953_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
+	struct device *dev = &priv->client->dev;
+
+	if (priv->gpio_rmten[offset]) {
+		dev_err(dev, "GPIO%u be programed to output remote data\n", offset);
+		return -EINVAL;
+	}
 
 	return regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
 				  UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
@@ -330,10 +341,19 @@ static int ub953_gpio_of_xlate(struct gpio_chip *gc,
 			       const struct of_phandle_args *gpiospec,
 			       u32 *flags)
 {
+	struct ub953_data *priv = gpiochip_get_data(gc);
+	u32 line;
+
+	line = gpiospec->args[0];
+	if (line >= UB953_NUM_GPIOS)
+		return -EINVAL;
+
+	priv->gpio_rmten[line] = gpiospec->args[2] ? true : false;
+
 	if (flags)
 		*flags = gpiospec->args[1];
 
-	return gpiospec->args[0];
+	return line;
 }
 
 static int ub953_gpiochip_probe(struct ub953_data *priv)
@@ -363,7 +383,7 @@ static int ub953_gpiochip_probe(struct ub953_data *priv)
 	gc->get = ub953_gpio_get;
 	gc->set = ub953_gpio_set;
 	gc->of_xlate = ub953_gpio_of_xlate;
-	gc->of_gpio_n_cells = 2;
+	gc->of_gpio_n_cells = 3;
 
 	ret = gpiochip_add_data(gc, priv);
 	if (ret) {

-- 
2.34.1


