Return-Path: <linux-media+bounces-40667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5EBB305CC
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A4EF1CE746E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE5035A293;
	Thu, 21 Aug 2025 20:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kjmrCAhQ"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013040.outbound.protection.outlook.com [40.107.162.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628D03570C5;
	Thu, 21 Aug 2025 20:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807436; cv=fail; b=OfCtAKeoK5+8QoKtvzeJnN4BAYOR7qtqvcGbaSgdD9c/oNfbdzLpCcH92o6dA+pl3JAV3oavZCc1C3CzyyJmdvZ3VMiMUNpyTucnwUPVGnaQSARdipocJT5RB9uT05jS0lYuCccEG5U9yRbXk/b3tluL8+zpZMjlZSpLWLQqVEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807436; c=relaxed/simple;
	bh=zgkiq41sBjVmIq8lPRyZaw2+HzWqoUbenMg/fiWquic=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VJCOi55DL9bp6tFaAh3gJOQrLJS74VjoyB76tBEeP+VuJgF0kksqjmz3hfYFXnNAHx+vcd3vU5NmcS0EU2AMDC8/wE+8u+3XlabV+ipk/7QVHK4Vwrv/rr8BzcNRrg9toqd+aOdAOjqu1LEOnMSbwW+XIkG/J8hxSt56fmH6h9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kjmrCAhQ; arc=fail smtp.client-ip=40.107.162.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnNUY6WvSjzqzcLENNmb6cDin0aS/JKMKj7hR4RZmR7ojWSXPvHpT6CwcNnPyYufsiyPMNomiXuLnSUNVzU3ANBuKUKSQBitrpZHe8DhNvaQXNs1/u+HR2P6kt9LajURH7ZKb/lZuuW1/N8SHXkMpRB4j3N1N1lG0MQY5MAF/5sIXJof7+b8G65toX+yex72iqOe8YlzjTNAcc6QC5m0/DuF2cNUyTiQC8Dv3WGtf1UqKBuialnJ/r7M0pOtFUlT21LYEEKWW3VnOi1DougJeGyvho6+HqNH2VqrSJ7tr7YG+SK0dTsZxhUTF4VA8AGSOyn0HNFrc6kVOBBsMlEvMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdI3SfYM5azAkZSeabX/v+xP7mJmaaaMvJHHJdT1ieE=;
 b=EKPzof0gjhWxWPmrbJJBmayNRMQbVOVdwMTCaciAO43bD+hNe15XJ770clGS+AtXpqJqcKZts88vJ6XMNpww5T277CUEMi0UhJXaIV84xHtdikmnrqaFRtifTbQGtmlcQiWkycv29d4WCKMW0yrJeaH3RFLiw6yHALkubT9noc/Ll3/4J5qrFUmOct4RZREEEOLeiCw/kYpU1RLfsBl/3u8qwzlFZNHBuCiadPz1hieOZrAy2ynimcQNkGXTGJqufnX04Egy/aFb2zfwNKNxacSfoUx8bwUeXuxM6MW2kMwqYUc3MPIuZzpOZj85xgvyWIk+rzzLSs0qH0EiRLnGUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdI3SfYM5azAkZSeabX/v+xP7mJmaaaMvJHHJdT1ieE=;
 b=kjmrCAhQBzRbBhbShf39VQ/T3lh1P1+rgT2Txd0EquCa91tyf6RNx9w6eVK+KC3WVUjl5YqPnn15Uzvi4mjuMAeCFePjpOnNySjbmRhgwYTNh4Lx6mdFUWBLh3M5fKvMWuwUw+4lNrcCVynyYxLCLMnYVwfqjcueSKhtlM5yCAihNEics+PjhiTU4x36MkbQUH4RJdfWE0RjDdzx8iFHMNrklEL+bJrCYqaVdHE+3oaFSrHwJIJpr4eps+eAeFA4q97H5yiH/nxq0kPph99RlsnUaL197V0+arfC5pwyKH/Hj11aPaYzUWVYjtSntd91sXYzizfyFNEx+IilNIOOTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:17:11 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:17:11 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:45 -0400
Subject: [PATCH v3 10/31] media: staging: media: imx6-mipi-csi2: use
 devm_platform_ioremap_resource() simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-10-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807361; l=1427;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=zgkiq41sBjVmIq8lPRyZaw2+HzWqoUbenMg/fiWquic=;
 b=C84JVFCox1/syTYRIIWySF1Z09RYbhJfwYzB/s1UzkDR+cwmQkzKiJPPJ4SLUPXDWUvYPmVvv
 gddUAQodwdJBPszRT6Jy0Zdi1knEdZIsNc9437zsdHEcT5y+CcjyL+K
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed5cd7b-7758-4b1d-8070-08dde0efb5e8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UHQ3RGlnV1BUTzl1bjZDbjNSY0ZFRzY3SFRvTGlybGJybW5wTCtCNWUxVDVN?=
 =?utf-8?B?RFoySHNFWTR3akpZQ2Y1Rm9OcmVEOXpKYUZTYkZuYkpnZm51Z05ESURiUHB2?=
 =?utf-8?B?N0ExSGFLNWRkVGJxb2VYVkYrd08vWU41Y2tCYnlWOUVJbXdZVzl2ZDNoTXVV?=
 =?utf-8?B?QTBqNlBnYlZpb2pCM0IyV1gyOEF5VlZJWTlhanhkbVdFOVdEMDhtaXgvTHBU?=
 =?utf-8?B?bDliRWlta2MrTGRQUTBPR1N4aHlCMC9GbGs1MjVmSkorQW9WMVg5SjZDZEVl?=
 =?utf-8?B?eVJOMzZVNG11SEROUVhuZm94Tk16bFpmRENCMUtXMnMzd25nVWVaYXpvSE5m?=
 =?utf-8?B?ekJ1UUExU3BFT2VKaGdqR25sS1RNTW9OeFhZcnFBTjdZSnlRd0k1MVl4cWpW?=
 =?utf-8?B?bUxGUWRrS3pSWnBkbW5adEpVaW0xVlZwWnEyQk5sRFJ5VWZpZzZtTEIxQlll?=
 =?utf-8?B?Umd4QUpwaFFSRTZVSlhXK1pZWTc0VldRTTE4ZWQrdnBySTBOakZQM0FyMnZ3?=
 =?utf-8?B?ZC9oVFdudWhPN2tpVkdNcEJkek9lZTdyb1NRemVvT0tLb1MwSDRaUlZLdTgr?=
 =?utf-8?B?SlpuZHcwKzhMd2xsVEpMOHN1aEVEQ1ZiNHU3VzR1NFFsL3RvbmhuaTVROUZZ?=
 =?utf-8?B?YW11dTljeFhndXBYYlRNZDRla2xkOTNreDJ5SStFRGJPRThoQW9CSi9YbFg3?=
 =?utf-8?B?b3NXdGcvbTUyV2MxSUtON1R3SW9oRDBzSUJJUitqTjJuTm44NzFBWkVFY2lD?=
 =?utf-8?B?ckdJS1ZqNTJNaW1NZmNhQkFkd2dYbE1yMkVabGxKOTlFZTUvWG82ekxGUmFE?=
 =?utf-8?B?eGN6UmdYYVZLM2RFYkVKQUk1bjJjSUJMWGlmZnl4Sk5vOG10elI1SkdZYXNV?=
 =?utf-8?B?a1hzTFVteGZTdGpiMUtKTkFJSElDQ0tuUmFFZjZ6cnJxVHhwYUlYRWY4VnhW?=
 =?utf-8?B?TDNqVnBvVzV1eXcvbEJ5V1p2Vi9ocjcvQTZOZm9Ha2dib3haZkRFaUQ0SitM?=
 =?utf-8?B?bTkybmNGcmloL0huRG50MElKZTZTNUU5Zk9Da0FVWDVJOElibEY2QjZGejYz?=
 =?utf-8?B?czBFNGFnT1p1ZlkwUlNIQ3NwT1FwVjgxak9BZC9Pc1ZvMThKTHJoaG9mdFpp?=
 =?utf-8?B?RW9EVm5ZdkNRQitNdGlBTnFpOUEvbmxtRU1weEQvamVpZ0ZrRTN3ZVpmM2I4?=
 =?utf-8?B?RzlrUk8vVmpEeitlcVU4MEZTc2I0RmhvYk9NUFUveXpUNEE5QUhDbk1FRHJ2?=
 =?utf-8?B?OG90Ymtic2dHYk9oOVRNT3ZHNUhqbks0UnFNY1N5b2dkMkIzVVFRSnZIdlBW?=
 =?utf-8?B?bEFoN28yU1I2R050MzFWMjZ5cnRFRU9LZk0raWY0N0kyV3pQbkN6UlNDMDRG?=
 =?utf-8?B?aE92d1RSWHIwQWlUVzdERjVlY2dWUHdESUprOFpNMDZFWnNoWWNYTWVsSnN4?=
 =?utf-8?B?WTB4NjNwQklZdEF1SVdyVDRvczYxSlgvOUlnQ0Fna1VCVjcxcHE3UXlTT3E4?=
 =?utf-8?B?T0dreGM4Zkp5T1Y4bzJ4Rmt3cTNmekJNNkZQWEh2cTBYamM4RzF2YzdLZ0xt?=
 =?utf-8?B?N0d0amlEbTBUb0NaSk4wdE50bnhJdDhWU2Q0aVRuWVVJZGthTUJBcHdHbGgr?=
 =?utf-8?B?WVp4WHdVRW5TWWxKcndwUkQ3Ymc4dHV3SmRTQ1hOQ3NSL2Rha1htMEM2U0tQ?=
 =?utf-8?B?VndnZXhOenhGcExiMzZXdTdVRlJWdGpYcy9rQlJYSmR4YitBbUh4Y0pINGJw?=
 =?utf-8?B?RjVUbG5TYWhQWFkxcURPVlZqYXc5dm04dm1CZFoxbEhOZ05uWFl1UjgzQjVC?=
 =?utf-8?B?S3U3NDV5aCtWZFRJWmcvYjBJajdzSWlJQnEvcEJZajV4dzVqY0NlT1d2amJL?=
 =?utf-8?B?dHdwcEhSa0ZWWGVYU2J6TzYrQzhhNndybGwxZkZyUmlaUkhQNTdPa21YTlU2?=
 =?utf-8?B?azJ3SWJwQ3h4amtuaHVBUlk2ZThndktxTHJ1M0Q2WlJBdENYQTdmdkNnVWE2?=
 =?utf-8?Q?A7S4qEwTtVlMG1237U6jB71CdGzx8Q=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MGRId1l1Z2tUTUlHc1M2ZVFOd3duamxyZDV4dkdHVXo0azYxdFExaU5Wd1JE?=
 =?utf-8?B?RHJmT1VRVDZueVBIbTRHQzM1Q1VXZTVRblBJRGxuRDUxYmNwbmNpVjU2Yldw?=
 =?utf-8?B?dGpsa0swWm5kcUFUUWVic0FVanpEUERXc0ZxN2dMeEhNcVFMUkk1aHpWR2Ns?=
 =?utf-8?B?TmlwU05BR3hSVUsvWUdQQkJockVWdlhvcW91dEg4SXVlNERnZzhKT0I3Zkdk?=
 =?utf-8?B?SnlIY2djQkR0eThVTExJQVd0eUJsbVF2THNKVDFENTVOWWFyNjVISFA4elB6?=
 =?utf-8?B?RWhEL0I1VzZuUVlmamRFdjdybEsvWHh4TWl5cStoNkgrNTA0WEVpWWpVRExv?=
 =?utf-8?B?b3hNRjV2SEwwVWwyMC9jUmRTR05mRzhFQmNseERxL1JqbmlpM2Y0V3QyR2V0?=
 =?utf-8?B?Y1ZKQjZWTmZuQ1BJZlJnbkVvU29zY3ZDejcvaWgrS2hLTmdjOGVWcUx3enFp?=
 =?utf-8?B?WldWQlVKUmF5Zm8yR1dJYlkrOEFFeENjTDZvM2dMNEZSNHRTWlBDRFlTcFl3?=
 =?utf-8?B?eE9kV0lSVGRyRzQxSVhnV0ppSXd0eVNjUk1EdHJCUGpjeU5MMEZuQy91QkJq?=
 =?utf-8?B?Tlp2L1ZteFA1U1RjYU1HRStqSFo1TmY1b21Md2w4K0JUbTVGb0xiWTBEYW1n?=
 =?utf-8?B?aEdRbGYzdkQxTUNwS2JJejgwS1h6YUZiWC9jSW1oblVDTTFtYkkwQXlOeWhy?=
 =?utf-8?B?TjhxcVEyQmp2bzFFajkwQit1QzZidDhKeE9pTmdIS1lDSGNIOHUwOHhiTm56?=
 =?utf-8?B?VDhiWDFCSDJxY1FUTlNKTVBsOFBBU1ZMdnp1ck5sODgwcXhNNDdaQnpMTU1K?=
 =?utf-8?B?VGw5ZFBYWnUvNTZtL2RUa09zRDZOL1g1WnprTU9QNFpSeDA5amJlY3lURzRz?=
 =?utf-8?B?RWU0dDNKaTYyM2xsTkxOQnJDTXQ5bUNOUGlKRHY3NkszSzUzSjFsZnhNY1Nj?=
 =?utf-8?B?dVZOd1kxN3RNc0tCN2RPbzVsMXE3Q0JtOFFMRkJvL2pxbGhIYzlReXdTV1VN?=
 =?utf-8?B?aFdKMEZZdmFKRy9sZmVkeWtOaFljMkNyS3Z2WEZyeENJc095djlyUURFK0Jh?=
 =?utf-8?B?SUlGMXFTR3daRExzdCtRV2FSQnh6Q3BEZW90NDlHZVVvQmdRL2lkUTZrdWNz?=
 =?utf-8?B?MHF0UXFBQkRNTGNoSkt3d1A3K3VqK0Q4cnlMTHVEcDc4c3NpWlZQdzlNeUlZ?=
 =?utf-8?B?dVVBekVRaUpSVFFlOEdMVDJvaW9Fak9LZ2NveEdZTTE4aUNIYldRS2ZVdFZm?=
 =?utf-8?B?cmRzcG9FakY3NG5aNHJWR3BzRlNKZGhqMjgwZGFXNzhPeFFMLzNLVTU3cUNk?=
 =?utf-8?B?djBWTzBtb2hyZnNiOVhOYTZ2a2FGcDlOemVtaHk3T09aQ2ZlZ1VqVmtZUEcv?=
 =?utf-8?B?Sk13dUtoRHV2Tmk1ODhxcldjWUJZU2FNYnNxa3hkNXcyVEQwNWlzN3dVVkZE?=
 =?utf-8?B?Ti9VOGo5aHk1QXFwc1dlalJybjdnV3RvSHpWSU5qV1RlRndHdUZPRDhzQlQw?=
 =?utf-8?B?T2Y0S3ZMNFdNYTNOR2h0TzFIdGIyb3pGTERUMW9EcnkvbkF1OEFIdjdXOURB?=
 =?utf-8?B?R3hiM1lpa1FlNDZnUXd0OFpBbk9VNE1YWnJMejZ5TE5STm82Z01TRkllSjVa?=
 =?utf-8?B?b3liall1R2w5bU5hNlVBaExtaWtGOFhVZG1YZzdaN1JSZ243WXZpRXY5cUhK?=
 =?utf-8?B?ejFWTDBDL1J6YmhCdEhWMUJ0b2JUWDE3TGNiWXFCTXdVYkpWQ1ZmVmxndFZZ?=
 =?utf-8?B?MEhKY2QxVmR6UDVWbUlST01WVmRrMVZKZnBaWmJBeXlPZXp0Z000Njd1YjE3?=
 =?utf-8?B?dFFFeWJ2ZkRiYmhGYjhhTGYvL2ExWmlmYXNXYitHc0wrdm85Vkg4VHlIdFBM?=
 =?utf-8?B?cjY0dGs4Z0xDcHV4RGlYY0s4djBURmpuZVRmWkw3eDR3SmJyZkVIaTdiMWpF?=
 =?utf-8?B?VFZDb3VubUR3dHQzdjdPUks3bUVTYVpYVVBQMWZtb3VaTVRGanlwR1FLUWNY?=
 =?utf-8?B?N0JnM003WUpNY2RQNkM4WTQyV2hjTnhMTjNpaFdFczJWZ3h1MFhDOGl4Wm1u?=
 =?utf-8?B?eDBCcXJ2WGYrcm8venVvbkZrM0JnSHVFMlV3YUNHUFU1YTMrcmNTYXgyR2s5?=
 =?utf-8?Q?kizI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed5cd7b-7758-4b1d-8070-08dde0efb5e8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:17:11.1522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0Px/9TrsvGz8exRcIzOV3oOLjGNnYI81Xvthgxmln4TC6GxQT43Io6HYsIC0AetDSNuCTO/Y7hN/uIMPJRSiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

Use devm_platform_ioremap_resource() simplify code. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index b04c1b98c088b8bfa66eb3f61cca8bb735b7eae4..7b8911bea3fad8187fafb1d0916d730fd6fa671c 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -738,7 +738,6 @@ static void csi2_nf_cleanup(void *data)
 static int csi2_probe(struct platform_device *pdev)
 {
 	struct csi2_dev *csi2;
-	struct resource *res;
 	int i, ret;
 
 	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
@@ -772,15 +771,10 @@ static int csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		v4l2_err(&csi2->sd, "failed to get platform resources\n");
-		return -ENODEV;
-	}
-
-	csi2->base = devm_ioremap(&pdev->dev, res->start, PAGE_SIZE);
-	if (!csi2->base)
-		return -ENOMEM;
+	csi2->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(csi2->base))
+		return dev_err_probe(&pdev->dev, -ENOMEM,
+				     "failed to get platform resources");
 
 	ret = devm_mutex_init(&pdev->dev, &csi2->lock);
 	if (ret)

-- 
2.34.1


