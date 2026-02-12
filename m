Return-Path: <linux-media+bounces-52676-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDP+AzAQjmkM/AAAu9opvQ
	(envelope-from <linux-media+bounces-52676-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 18:38:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A502B12FFD5
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 18:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 379FC301C6C5
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1862926B741;
	Thu, 12 Feb 2026 17:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QGF64ZvO"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5470C7E110;
	Thu, 12 Feb 2026 17:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770917927; cv=fail; b=T7U+rJIp0Z04PR0ZsPvY1hGcL7bwJNvFMCuGrBrwtM9HC+C+9vxwc6XcorKA3rRjo/O31CFK8BlYq9ZeBexXW16l9vWuicTJItyjit4VTYVG2J9D+pEYOlOGiUvDtmNpx2fTnWjX5HNzM6c/h0GYfuAQ3xUEEMy1kjzyC8Bsa58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770917927; c=relaxed/simple;
	bh=gJKR/tJXXgBvrQJTY958ciSZCIkYcyUjog15R1hzhak=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X9Mreh1XpOZ7cRteqQYHEMX7ENUy6Ru2hMQ0zwfzQHqicYU0XF993Xlp4ffsU7+RXAYfcQWt9wtG6PCL5fVzy5l5bH3/Fie2KVoAD6JG2BmTFpTYpVJX295XcZGYNi2Vb3EeAfye8eTC2gOBPr3XALukvYtS87/zwrqDWRyO/6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QGF64ZvO; arc=fail smtp.client-ip=40.107.159.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxsEyTsibcWoWYd2verHaVUKXaaaVG4WZz0htUgrcb6Ey6wFjk19stu1iUstFyIY+OX2xowQLzTPXyr6myY5gcMz+CAytbbphwJ9MagAReCvSCj/AXnUY4yUf5DgDX45LTtNSYjYU+DOobuWUGDppXQGe7PQYwDH/lU1SgXPedEMNOIdtQBuLWAACHQQAGvlo7eQUHwLt1wlHwjGbTHGTubM6JdTJiaEFJVsXBI0DB6IbABfMoQ89MvzZaZljURl4HKSHKNbMZp/z+oEWWZCbbz4JzoztE6GcL/ei+gaSdTl1OtpRrIWranGxCIyk2JIW+ByLn41xT5InYcsiVjAhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2agi0WBrIcsQvkc5ysLKKAo3D67S0ADEDcbHeTmZmtU=;
 b=Q2/qo/YcsPSmnoT3f3KP4+HkWlenweEb2+4RYZog7mrb0rvw1G4ZHbyKyvsAeukLs3MT/fhIRBiafiz72DSnvEeyLpdDme25ngiv7zMRzltNDcPYzOgmBQKZnhEqlkAra0nRrC3xtKxJKXdsfqGUB50elhk9Km2lUPGBnAK1oD1z2Q9z+XZ45qLVmNsypxsx+jHS2wUlrmL7VgPMluxo5Q+c+uVvMwwhybTW1Et6Fc1zD2WYQ834kCgCxPic0hJS+SXKwwLu7DxBpGz+QOr7Cu500LHfIZl5p0zOxABqJBD6tL9KfZCo2EbmqCWIi304BlcCuqjHTHpr2lMXcqgnZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2agi0WBrIcsQvkc5ysLKKAo3D67S0ADEDcbHeTmZmtU=;
 b=QGF64ZvOH+FtKke+FeUfEOVvohI95cQd/FxwJn5xFx01mbEj6Adxma9/AUY7RYdRx2xbOI5ZzVoD1oIyzcPBfYYJwjIoKPeEIdrrj+B2G1DvjfR9inOAipbW7f8enCE8qsqWXICFNw+wemcEyRmjJVRUA6JsqjmH/0mS1ShYPPg9jpQXUBr2f2RNn6jxBC4FmWy79klDvLTxfu6mHKPZ+6H5Nz5JpdOtxCb/rvJtFx3j0sSr4OgQknseeTa3BmleH4msywrdki1285ktCVXjJKk46Ofbgnc8RmP1S9Hps1sjqrAAj/l2uMv3r5Fk47++DhwwCfq0FvZdO/pkdCOwOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8147.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::22)
 by AM9PR04MB7492.eurprd04.prod.outlook.com (2603:10a6:20b:282::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 17:38:38 +0000
Received: from AM9PR04MB8147.eurprd04.prod.outlook.com
 ([fe80::b387:72c6:e33c:8656]) by AM9PR04MB8147.eurprd04.prod.outlook.com
 ([fe80::b387:72c6:e33c:8656%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 17:38:38 +0000
Message-ID: <827f9c36-6f20-4bc5-917b-1f7685bc54a6@nxp.com>
Date: Thu, 12 Feb 2026 18:38:36 +0100
User-Agent: Mozilla Thunderbird
Subject: [RFC v1 00/11] Add iMX95 neoisp driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Antoine Bouyer <antoine.bouyer@nxp.com>,
 Michael Riesch <michael.riesch@collabora.com>, alexi.birlinger@nxp.com,
 daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 niklas soderlund <niklas.soderlund@ragnatech.se>,
 Anthony McGivern <Anthony.McGivern@arm.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <544a98f3-d451-4ca1-b7d0-0b0a1238f66a@collabora.com>
 <c8536c80-2f58-4eae-9336-436d772206df@nxp.com>
 <22b3916a-a12f-4ea2-8863-8ebd9cb498b0@collabora.com> <aYI0CrKLGeiZMlD8@zed>
 <aYN8v3UGFKfzkl4_@zed> <86109309-8200-464a-a167-ae9cef3f41b7@nxp.com>
 <aYRSMXHjFC0M_DM_@zed> <20260210000317.GI2405149@killaraus.ideasonboard.com>
Content-Language: en-US
From: Julien Vuillaumier <julien.vuillaumier@nxp.com>
In-Reply-To: <20260210000317.GI2405149@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0032.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::15) To AM9PR04MB8147.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e0::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8147:EE_|AM9PR04MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6c9002-24ba-480e-97b0-08de6a5d8dd1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ME5tWit4MWVvcS9CYmtUWUo5NWpsQW5HQ01OT0pMV0tML0NxOUo3OUk2bXo1?=
 =?utf-8?B?L3p2ZG5UcUVkSHhJRkx4cVJCMHBOMWFPZEZySVI5NC93L1pVbHEzMHdja0hS?=
 =?utf-8?B?MmpYM2dOT1BVYmJ6NHJHWlpEclQ5MkRjNVVUc24ybUg1Z0kzNHNlOEJhM0tq?=
 =?utf-8?B?a2lqS0VVWC9vMUxMUHVqSDZXbDQ5TFpuN2YvL0MxeW9KaE9qaUV4VjhVZUVH?=
 =?utf-8?B?eGN4NW4vMUpGN0xPYmdUb0trUG1SeldBWi9tdjNpUWN6L3FXWG1wWC94MnM4?=
 =?utf-8?B?bjhzK2hzVk5jc0NVQW9BYy9CVEJxbjV6WUVOdWQ1dTBPY2gyMm42VWZzUjRl?=
 =?utf-8?B?Q3F2dFM1bk54TjFKVUZNVDY5UElMejR1KzBKWDEwT0lvd3REVVo2b3J6MjN4?=
 =?utf-8?B?WGNIa0Y1bmtOZUsvb2hab3k4U0REQUNkMXEwMFRiUnZFcWlVMXdmL1hqOWNx?=
 =?utf-8?B?TEViNTZBcW1Ua3FZNSttd2xSUGw0cmxvRGtBZFFmM29hN0NPb0ZJNS9ESUkz?=
 =?utf-8?B?MWl3WndQMFhXVWJ4SzRmOHhzYkVkbVpTdWZldGh6ME0ySXdXSmx4a2E2cE91?=
 =?utf-8?B?bW1JalRtWUtZM2xObCsvWndLeFgrRU40eFZwWWFoVE44ZGNQbTZuSEVocmsz?=
 =?utf-8?B?cWF6aEoxY1I4SFllTzE2YW41Q1pBMktHMkFYMmYrV0h6ZVcrUVZqSnpySHhp?=
 =?utf-8?B?c3J2YzE2c1U1VnZDWlppSlNQVlpFbC9vODVpcnBxWTF6Rzc0dlNnanZXaWRs?=
 =?utf-8?B?T1dCS0JIbG1qVDh6SnpHY0szckk1Q0RCM2NuVjYyZEpuZ0hqS1Jsd0o1bnc3?=
 =?utf-8?B?NWZrMVJRZ2drQ3U5eVk4NDhNcWNZOGFCTTNiblQ2L2JBMGgvc2VSZ2hCbjNE?=
 =?utf-8?B?bW9qajZYYzVZQyt6QUtUWVlrdTJ4bkU4RXgxczZYMWlJbXpEcHJHaGg3bzkz?=
 =?utf-8?B?djRkSUozTU12OW5Pb1c0Rmh4dUxaMVo2WnRyUjZMY3lEazVYMnllZGk0YmhB?=
 =?utf-8?B?aFNjbWxwUDA2VllIWk5TaVdtd2JUdkJqVVBHRklpd2k5SGJ3SkROQmM2eVVu?=
 =?utf-8?B?K3R6eU5XOUdaekpObTJ4WVNPYzhOMFBPaGxhRXR6NzU4UXB5N09zZ2VPQnlC?=
 =?utf-8?B?T0hURm9PRFlwR255WlNZY2UvT2xiSk1UZmt6ZkxBUlBoRnJiWi80YlA1QUlS?=
 =?utf-8?B?WEJwNE1yYlVLaTRaQWIwdUw1b0NBNUxBMG9CTFdhdDZJMlhITnJ3RVJMMW45?=
 =?utf-8?B?RVowZVVOa1Y3ZS92bkR5Y253MGQ5ZlQrZlVqY0dzOVdOaDg1Qmx4UUtaN1dq?=
 =?utf-8?B?WlpVKzNnSnZCRlp1WW5VT2hkcXl1K3IvNWp4Z0FsN2wxdGlnQllNcnlqbVJQ?=
 =?utf-8?B?WlNBT3dtbEFSejlINzVJQWxIUnVMYlVsTDRoOWMxRlFmUGpvYU1qdTg3YmFG?=
 =?utf-8?B?QXJFRmd2RTR3TDRvQkoxSUNuSWJFcWtuczU4dTNsd2haQm9PaTNxZ0lmUGxn?=
 =?utf-8?B?OS95a2NKYlIrYWdJNU9YZ2Z0SlYrL29UN1BocWJlTGQ1MUpHMHlGaDE4NFkx?=
 =?utf-8?B?NU14U0sxTEZuVFFQS1hLaDR1aHZkWWVSbTNFZlRObmxJWXF4VzdKWG1UVzB1?=
 =?utf-8?B?Qm1MZFFqSXpuc29jTk1jbzJCMm0xWk5XSGJvSXdjcnM3ZXVYSXpOK2VqS0gz?=
 =?utf-8?B?L29PU2JYVDJReEZlWmwxMlE4OHgrZ0RpSmsyaERDQ2I5cUNySXFoM0xIUE9W?=
 =?utf-8?B?SnEzT1loUElKTEEwamx4SFl6eGJVRW81SUFQa2hQN3FiK0pKaGVIdGUwV1FY?=
 =?utf-8?B?emdORVAwRUtEaDBsQTlNUkc5R2w5aE5SdUZXRWpHaEh5WStmZVhoMCs2T253?=
 =?utf-8?B?OXgvdTF3ZVoyUUFCQVVMRkUxTnBMcFVWb0ZVSENHTDNPNXNkOSs1NmVOWVlL?=
 =?utf-8?B?T2VEdExCcEZZWk84elVvWTc0cjVDMnh4enlEQ2hqWldnTnlLR1lvRHlWMldL?=
 =?utf-8?B?bDFHN255VEZNZkt5NlJMQWVPVkNLclRQL3AzZVNiZHpQNzZvdEViaWg2Qk9G?=
 =?utf-8?B?azlyT04vY29nNmdxWW1idkNML25IMTd6MFdvcVpxVytvZkdEWWdWVFN5ditG?=
 =?utf-8?Q?rm9c=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eHhzaXN0dTczWGI0d3piSzF4djJZUVJWWDQyT3dTaWtHd01HVEhkeTdQTENM?=
 =?utf-8?B?VEtpQUNVK24rOGlTODNjbmVybjdyb1pDSjVuSzRGbHY0dU90TkNRcytLUUJ3?=
 =?utf-8?B?UTl4YlQ4VldnZ1hPcW42RTd2d2plRjBrTHhsaGVKdEJQWmlnK1NRL0M2cjRv?=
 =?utf-8?B?U0p3YWxNQTJPd0RMOXpOVTRRb2JNM0VxUlVMdmpXUVR4aXZqeEVHT29tR3NS?=
 =?utf-8?B?OGhua2poWjlCM1BoS1dTeXF5NUQzWmRkQ003L0VSZEl2NE1FcWd4eE5rQnp4?=
 =?utf-8?B?aWZFZ1d3dFAxeWJqeTU5czZ1c3ZCelFXcHpSdE92cTIyUFdDTklkQTFNVW93?=
 =?utf-8?B?czIrYUFacVZEbndTRUhoMzVQc2d6dEI0K2RGTEo4aXEzNnBpL0N0SXF0ZHp3?=
 =?utf-8?B?MjN2bmFyVG5RRjRuajl6eCtnRVZjQVdONDBmNVMrZVByVTE5SEhidjhvNERn?=
 =?utf-8?B?YkUvUWZaaEExdmxnTlBCc1JPbWhxcjFoSlpyWG83NGI5RnRPZURsM2N1d2hu?=
 =?utf-8?B?c2pML2F0TUp2NWZzVlR2OTh1Q2ZLY3k1dlUxOWRNVGtQYWVBUU5KVVA4N3dC?=
 =?utf-8?B?enA3OXZVc3dvRE9YbXZjNnJHcnJUdEVxQS9WN01aQUN4OXB3R01jb2NGMGR6?=
 =?utf-8?B?TnR2cWNsZFdma3lCSm1TYm5kREpmVUJPSDM0Rm5wYndpN2t3Mkg3dXhXb01P?=
 =?utf-8?B?cVc4YWN5NExaY1B5VmVTK0R5YXBXeEpaUzc3cmYwbHIvNVE4T0R1VzZUN1lY?=
 =?utf-8?B?c0FDYnJFZjRpeU50dEZBVmVqaElmOGNVbmJtU2V3K2VnejVTNUR1dFlHQWFx?=
 =?utf-8?B?U2wyaXZqV0dyQjJpVHNQblZsS1NNR3N6MlJHQkFiYm9VOWRaZ0NaLzM4R1Nn?=
 =?utf-8?B?dmdLMDNaNHludnBpTlRiN3JQOTkzcXNBSEs2bmpQbGNnMU93dnJZbTFzeTlK?=
 =?utf-8?B?bThkR20yeU9URkdMQzBIaHphbHJQS1I1a1ZLWHZLcFJKYWRFQmpGTjNuZzRF?=
 =?utf-8?B?QTdWOTI2bnpIUTJybU9xTlpuTktaWmFVdVFPeW0yNUxGcG8wenYraVpoUVI4?=
 =?utf-8?B?akZVbnRPQXhUdDRHcXJoNnFjMHpsaUVrNkdmVm93d0svR052ZFUxWWYvODNP?=
 =?utf-8?B?RDQrSVdRaDZVaFF3MldXdWJKbmNib2JyR3ZzVkpHMGVURmozY2ZDbHdCOW5N?=
 =?utf-8?B?N3g1TFRkOHFyeFFIRnRZM00yYVZvYUNad1Jwd1hLUnI0NGF1SWpDTXJ4aXI5?=
 =?utf-8?B?SjdaUldDUVg5cXpSenVSR2xWZVFDRkxVZzRPNVMxTWhIMi8vbkl4K1lUTTR1?=
 =?utf-8?B?Z1lWb0dVM05xdFk3UUI4dmRRYTZnUzlGVjdVOUVDeEl4bVZ4T3lTM2ZyQStR?=
 =?utf-8?B?Q2FGMisvSXlXcUNRM1gvaURNNllYRjM1bU1VZVhIQ3hKK0NROUFUMXVYL1Q0?=
 =?utf-8?B?aE1Rc1pNbWhjNUMzT1lvMlF5TWtnREl2K0UyRG5BRkwwTnBxdWpMQzZhZWxM?=
 =?utf-8?B?S1ZLY01xbFBFemd3TWdjUjhhR1dWM1BYTUNSd1hUMW9hSlViZUg4ODF1Y3lz?=
 =?utf-8?B?cUp0NTdxOGZ6KzV6bjRBaWs3TUFsTjlYMHBBU2tMWVo2MEYraDlXalk5d2U4?=
 =?utf-8?B?Y2JjK3pRMzZQUG0zNmtBWFQrYlFCRE1TWVpoWUFDQysxM2c0TUtJRjhFQ1RX?=
 =?utf-8?B?alFtaFZ4c0h3S09zSlJTR1lrU0ZoYzl4aE1oMU9VMTV3c2ZVMkFhMXhjTnNy?=
 =?utf-8?B?OThOUTU0UDhzNStxc0FHTmFpUlJ5cFJkQ1NZTVYrRHdlYnVKazEvMSs0QUo0?=
 =?utf-8?B?YVVIdHBUdzM2aVlsSmUwMEVOR3VuZ0puVExxMVVCcmtUcHV0aHVyalNjN2FU?=
 =?utf-8?B?ZDFZT2JTWXI2MzVOREJ0MHVSb2Vha2l0d1BvYVBOU3pWeTNxYS9nTnNrMmpw?=
 =?utf-8?B?SUQ5a1dQSVlpTXZ5cGlTeUZHRUlHS0hIc2JaVEhHWVE1cGNtYnV2eUR5bXdI?=
 =?utf-8?B?SlgwcGc4QTExUmdpSnVoSnJJUXVHVUs3RWtjNDdKWnFoQ0FOV01wdVExTXYr?=
 =?utf-8?B?TUxLN3JQQk9UaURDM1MyTXlNNTNDQUt6TXhycVZLSWp4OE5YMkhCbHdOa25x?=
 =?utf-8?B?QlRWT3FqV0haM0RTZUc5M3pqa1k1cUVlQUdXaFBzd0cwUzV4K0g0QlZtMHJL?=
 =?utf-8?B?TjVzTlgvTjJ2MGV4L2RGMUhuVjhYVWlzM1hqeFBmSm5QMzVhTXNna2dDc2to?=
 =?utf-8?B?MlBBbTFzR3JsanUyc3BINGJaUEFyWGFDd2p6czBDYVVJNm90b1E2RHRXU21z?=
 =?utf-8?B?UHlFM3NTZHdQU0tEV1VXMi83eUZic1E5dzZzK0dFbHJXOXg0UHdCcUx0Z1FM?=
 =?utf-8?Q?8quhKWf5fTnzz6aU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6c9002-24ba-480e-97b0-08de6a5d8dd1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 17:38:38.3396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oZ85A7z82Md3lRUL6Twf0bkf1AH4KqZ5vrUyag2uQ1ZWxZ/aYol26+5oCnFfwsoir3S0aEkGslMukNYGevAyuWoKEvja2/InTCkvz+/mh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7492
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52676-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail,linuxtv.org:server fail,nxp.com:server fail];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien.vuillaumier@nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[nxp.com,collabora.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org,ragnatech.se,arm.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxtv.org:url]
X-Rspamd-Queue-Id: A502B12FFD5
X-Rspamd-Action: no action

Hello Laurent,

On 2/10/26 01:03, Laurent Pinchart wrote:
> 
> 
> On Thu, Feb 05, 2026 at 10:40:12AM +0100, Jacopo Mondi wrote:
>> On Wed, Feb 04, 2026 at 07:30:18PM +0100, Antoine Bouyer wrote:
>>> Le 04/02/2026 à 18:12, Jacopo Mondi a écrit :
>>>> On Tue, Feb 03, 2026 at 07:37:34PM +0100, Jacopo Mondi wrote:
>>>>> On Thu, Jan 29, 2026 at 12:00:24AM +0100, Michael Riesch wrote:
>>>>>> On 1/28/26 09:17, Antoine Bouyer wrote:
>>>>>>> On 1/26/26 10:44 AM, Michael Riesch wrote:
>>>>>>>> On 1/23/26 09:09, Antoine Bouyer wrote:
>>>>>>>>> Hi all,
>>>>>>>>>
>>>>>>>>> This RFC patch series introduces the NXP Neo Image Signal Processor (ISP)
>>>>>>>>> driver, used in the NXP i.MX95 SoC and future devices in the i.MX9 family.
>>>>>>>>> The series also includes updates to the generic v4l2-isp interface to
>>>>>>>>> support extended statistics required by the Neo ISP.
>>>>>>>>>
>>>>>>>>> The Neo ISP processes one or more camera streams, converting RAW formats
>>>>>>>>> into YUV or RGB outputs. Its architecture is largely influenced by the
>>>>>>>>> PISP driver. The hardware supports up to eight contexts, with three sink
>>>>>>>>> pads (main input, HDR input, and parameter buffers) and three source pads
>>>>>>>>> (RGB output, IR output, and statistics metadata).
>>>>>>>>>
>>>>>>>>> At this stage, both legacy (fixed-size) and extensible (dynamic-size)
>>>>>>>>> parameter/statistics buffers are supported through the generic v4l2-isp
>>>>>>>>> framework, similar to rkisp1 and Mali-C55. The driver currently supports
>>>>>>>>> M2M operation; direct CSI-to-ISP streaming is not yet implemented.
>>>>>>>>
>>>>>>>> How do you envisage the direct CSI-to-ISP streaming shall be supported?
>>>>>>>
>>>>>>> At this stage, this streaming mode still needs to be evaluated on
>>>>>>> neoisp. We should follow the integration model used by existing ISP
>>>>>>> drivers to avoid duplicating solutions.
>>>>>>
>>>>>> Fair point, but I have had the impression that there are not many
>>>>>> examples (if any). The rkisp1 driver, for instance, only supports inline
>>>>>> mode although the HW should be able to do both.
>>>>>>
>>>>>> But any pointers most welcome, I won't claim I have the full overview.
>>>>>>
>>>>>>> Below are my initial thoughts on the specific points you raised:
>>>>>>>
>>>>>>>>     - How shall the final media graph(s) look like?
>>>>>>>
>>>>>>> The media entities would remain mostly identical, except for the absence
>>>>>>> of ISI. The topology would be a direct linkg from sensor->csi-
>>>>>>>> formatter->neoisp.
>>>>>
>>>>> If support for inline mode has to be added later, the ISP will need to
>>>>> be registered in the same media graph of the CSI-2 receiver to be able
>>>>> to link the two, right ?
>>>
>>> yes correct.
>>>
>>>>> How do you envision to control the ISP operating mode, because I'm
>>>>> afraid if you register the ISP in its own media graph, you're locking
>>>>> yourself there as implementing inline mode would require a different
>>>>> media topology with all the implications on the rest of the userspace
>>>>> stack.
>>>>>
>>>>> This might not be a problem if you know that the inline vs m2m mode is
>>>>> SoC sythesis time parameter. Some SoCs will integrate neoisp inline, some
>>>>> other as m2m. In this case you'll likely need two pipeline handlers
>>>>> in libcamera, but if that's per SoC-line maybe is acceptable. The fact
>>>>> you suggests in inline mode there won't be an ISI makes me think this
>>>>> actually depends on the SoC design ?
>>>
>>> Actually, this is not really at SoC synthesis time, neoisp HW does support
>>> both modes, that is configurable. But ISP HW can run in a single mode only
>>> once it is configured. Streaming mode is tightly coupled with CSI HW, then
>>> ISP cannot be used in M2M mode with another sensor simultaneously.
>>
>> Yes, my point is trying to understand "how it is configured" and what
>> your expectations are.
>>
>> Will the board .dts (or a camera .dtso) decide how the ISP is operated
>> by defining its endpoint connections ? Assuming with the same SoC both
>> inline and m2m modes are possible, without differences in the SoC
>> design/integration, will users of the same board have to modify the
>> .dts or load ad-hoc .dtso to decide what mode is in use ?
> 
> That's what we do on i.MX8MP, to route the CSI-2 receiver output to
> either the ISI or the ISP. And it was a really bad design mistake. Let's
> not repeat it: if the hardware allows both inline and offline operation,
> then selecting between the two modes should be possible without changing
> the device tree, without rebooting and without reloading modules. All
> components must be in the same media graph. This includes the CSI-2
> receiver, ISI and ISP.

As you mentioned, i.MX8 SoCs that include an ISI device can expose a 
dedicated media graph for the CSI‑2->memory front‑end. The i.MX8MP SoC, 
which supports only inline ISP operation, exposes a single media graph 
for the CSI‑2->ISP pipeline, without the ISI. To my understanding, this 
aligns with common practice: SoCs with inline‑only ISPs (e.g. rkisp1, 
Mali‑C55 without M2M) typically expose a single media graph, while SoCs 
supporting a CSI‑2->memory path for M2M ISP generally split the 
front‑end and ISP into separate media graphs (e.g. PiSP, IPU3).
In this context, the media graph partitioning used on i.MX8MP for 
CSI->memory and inline ISP use cases appears consistent with established 
patterns. Is the issue that i.MX8MP may use either topology, single or 
dual media graph, and that the graph selection is done through device tree?

While combining the front‑end and ISP into a single graph can offer 
user‑space flexibility for SoCs supporting both ISP operation modes, it 
is not clear that dynamic mode selection is practical for the i.MX95. 
The product definition likely dictates the ISP operation mode:
- Multi‑camera or memory‑based captures require M2M operation
- Single CSI‑2 camera capture can use either mode (inline preferred?)

Having a unified graph supporting both ISP modes also introduces 
downsides. Inline mode operation (single‑camera) is mutually exclusive 
with M2M mode. Switching one camera of the graph to inline mode would 
require stopping other cameras already active in M2M, leaving them 
present but temporarily invalid in the media graph. This results in 
complex user‑space policies and inter‑camera dependencies, which goes 
against the intuitive expectation that each camera should behave as an 
independent entity.
Also, another thing is that a potential i.MX9 variant with a similar ISP 
but supporting only M2M operation would probably still reuse this same 
unified media graph. Such variant would then diverge from the common 
partitioning for M2M-only ISP where the front‑end and ISP are exposed as 
separate media graphs.

> 
>> Then, the question of how the media topology will look and which
>> components registers what has to be clarified.
>>
>> Let's try to make a taxonomy of the cases we have in mainline (or on
>> their way to mainline).
>>
>> In the mali example I mentioned, the operating mode is selected by the
>> .dtsi as Mali can be integrated either inline or in m2m mode in
>> different SoCs. RZ/V2H in example, will always be m2m as it doesn't
>> interface the CSI-2 receiver with the ISP but rather interfaces the
>> ISP with a companion chip the performs memory access on its behalf
>> (the IVC). A different design that incorporates Mali inline will
>> instead have to interface the CSI-2 receiver with the ISP with
>> internal busses/glue logic and will then have to described this in dts.
>>
>> This is fine as the ISP integration is different and then having the
>> description in dts is legit.
> 
> Note that the C55 could be integrated in an SoC in a way that would
> support both inline and offline modes. In that case selection of the
> operation mode must be done by userspace, without changing DT.
> 
>> The ISP driver unconditionally registers an async notifier and the
>> downstream component (csi-2 or IVC) will register its async subdev(s)
>> which will all appear in the ISP media graph. This is possible because
>> the assumption is that the CSI-2 receiver (or the companion chip)
>> won't register their own media graph.
>>
>> The Renesas V4H example I mentioned is instead different. The ISP can
>> be operated in inline and m2m, on the same SoC without any
>> modification to hardware and to the dts/dtsi. It's basically a user
>> choice we defer to runtime.
>>
>> The V4H already has a component that registers a media graph: the
>> CSI-2/VIN block which is found in many SoCs of the same (and older)
>> generations. The ISP is present only in some SoC, but the CSI-2/VIN is
>> always there. In this case, to support both inline and m2m modes, the
>> VIN registers the media device and, with the trick I pointed you to in
>> Niklas' code, the ISP registers a subdev in the VIN media graph. Then
>> the inline/m2m mode can be selected by media link enablement at
>> run-time. Now, inline mode is not yet supported on V4H and there might
>> be dragons there, but at least, both modes should be possible on the same
>> SoC.
>>
>> On the other extremes we have the RaspberryPi PiSP BE and RkISP1.
>>
>> RPi knows the only SoC where the PiPS will be found is their one. The
>> ISP cannot function inline and will always be m2m. In this case, a
>> dedicated media graph for the ISP is the simplest and cleanest
>> solution.
>>
>> RkISP1 instead will always be inline only. It registers a media device
>> and an async notifier, the connected CSI-2 receiver will register an
>> async subdev and will be connected to the device tree endpoint of the
>> ISP device node.
>>
>> What model is the closest one to the neoisp integration that you
>> envision on NXP SoCs ?
>>
>>>> One small correction after some more research:
>>>>
>>>> we actually already have a pipeline in libcamera that supports inline
>>>> and (will soon) support m2m: the mali c55 one. My take on "probably
>>>> need two pipeline handlers" was not correct then.
>>>
>>> Yes, I saw your patchwork on libcamera about this coming upgrade. Spent some
>>> time analyzing it ':) Seems we are quite aligned as per my understanding:
>>> inline mode (i.e. streaming mode with neoisp) _or_ M2M mode using IVC video
>>> device from Mali. Is that right ?
>>>
>>>> As said, Mali-C55 can be integrated inline or in m2m mode and this is
>>>> decided based on the device tree endpoint connections.
>>>
>>> Good. Do you have an example available ?
>>
>> It's in mainline, but there's nothing exciting there as the assumption
>> is that there will always be a connection on the first endpoint and
>> the driver simply registers a notifier for the connected async subdev. If
>> it's a CSI-2 receiver then we're inline. If it's a companion chip
>> we're m2m.
>>
>> The libcamera pipeline (not upstream yet) inspects the media entity
>> function of the entity connected to the ISP sink pad#0. If it's a
>> CSI-2 reciver we're inline. If it's not, we're m2m. Based on that it
>> operated the pipeline differently.
>>
>>>> So, if you know neoisp will be integrated either inline or m2m in
>>>> different SoC lines, maybe deferring it to device tree is good enough
>>>> at the expense of a slightly more complicated pipeline ?
>>>
>>> As said, SoC/ISP HW does support both modes. But I think that the selection
>>> can be done in device tree too. So that after bootup, a camera will be used
>>> only in 1 mode.
>>>
>>>> I guess this has implications on the bindings definition as well..
>>>
>>> Most probably yes. Can this be done as second phase once evaluation is
>>> completed ?
>>
>> I think you should asses from the very beginning what is the planned
>> integration model of the ISP in order not to corner yourself in a
>> place where it will be hard to support inline without re-writing
>> the driver's media device registration logic.
>>
>> Looking at the below media graph of CSI/ISI you should ask the question "how
>> will I register the ISP subdev in the CSI-2 media graph when inline"
>> and "how will I describe inline vs m2m mode if the underlying hardware
>> design doesn't change?" as deferring it to the .dts might not be the
>> most correct way to go in that case ?
> 
> The driver doesn't need to support all modes right away, but we need to
> design the DT bindings and media graph to ensure that additional modes
> can be added later without breaking backward compatibility.
> 
>>>>> However, if you plan to allow deferring inline/m2m mode selection to
>>>>> the system integrators or even have it as a run-time parameter, then
>>>>> you should really consider having the ISP in the same media graph as
>>>>> the CSI-2 receiver and operate the whole CSI-2/ISI/ISP as a single
>>>>> media graph, where you could select the operating mode through media link
>>>>> enablement or dts endpoint connections
>>>>>
>>>>> Niklas (in cc) has addressed a similar situation, where inline and m2m
>>>>> mode can be selected by link enablement at runtime here
>>>>> https://patchwork.linuxtv.org/project/linux-media/patch/20251225171054.1370856-3-niklas.soderlund+renesas@ragnatech.se/
>>>>> (see risp_cs_internal_ops)
>>>>>
>>>>>> OK, I thought that ISI was still around...
>>>>>>
>>>>>>>>     - How many media devices are registered and which driver registers it
>>>>>>>>       or them?
>>>>>>>
>>>>>>> That will be part of the evaluation. My initial assumption is that
>>>>>>> neoisp would be the appropriate component to register the media device
>>>>>>> in this mode, since ISI is not involved, and ISI currently performs the
>>>>>>> registration in the M2M configuration.
>>>>>
>>>>> Isn't the ISP registering its own media graph ?
>>>
>>> Yes, 8 copies of ISP media graph, that can be used with the 8 output video
>>> devices of the ISI media graph.
>>
>> I suggest you do what RPi does. The mainline driver only registers one
>> instance and they carry a little patch downstream that implements the
>> for() loop where multiple instances are registered. Duplicating media graphs
>> is not desirable (at least in mainline) as we can have ISPs with 256
>> contexts, we don't want 256 media graphs.
>>
>> A framework level solution with proper priority handling and job
>> scheduling is what is required and that's what the context work should
>> end up being.
>>
>>>>> Can we get a copy of all media graphs on an i.MX95 system including
>>>>> the ISI and the CSI-2 receiver ?
>>>
>>> Here is an example with multiple sensors. Or do you need it in another
>>> format ?
>>
>> No it's fine, thanks!
>>
>>> digraph board {
>>>          rankdir=TB
>>>          n00000001 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3 | <port4> 4} | crossbar\n/dev/v4l-subdev8 | {<port5> 5 | <port6> 6 | <port7> 7 | <port8> 8 | <port9> 9 | <port10> 10 | <port11> 11 | <port12> 12}}", shape=Mrecord, style=filled, fillcolor=green]
>>>          n00000001:port5 -> n0000000f:port0 [style=bold]
>>>          n00000001:port6 -> n0000001a:port0 [style=bold]
>>>          n00000001:port7 -> n00000025:port0 [style=bold]
>>>          n00000001:port8 -> n00000030:port0 [style=bold]
>>>          n00000001:port9 -> n0000003b:port0 [style=bold]
>>>          n00000001:port10 -> n00000046:port0 [style=bold]
>>>          n00000001:port11 -> n00000051:port0 [style=bold]
>>>          n00000001:port12 -> n0000005c:port0 [style=bold]
>>>          n0000000f [label="{{<port0> 0} | mxc_isi.0\n/dev/v4l-subdev9 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>          n0000000f:port1 -> n00000012 [style=bold]
>>>          n00000012 [label="mxc_isi.0.capture\n/dev/video8", shape=box, style=filled, fillcolor=yellow]
>>>          n0000001a [label="{{<port0> 0} | mxc_isi.1\n/dev/v4l-subdev10 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>          n0000001a:port1 -> n0000001d [style=bold]
>>>          n0000001d [label="mxc_isi.1.capture\n/dev/video9", shape=box, style=filled, fillcolor=yellow]
>>>          n00000025 [label="{{<port0> 0} | mxc_isi.2\n/dev/v4l-subdev11 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>          n00000025:port1 -> n00000028 [style=bold]
>>>          n00000028 [label="mxc_isi.2.capture\n/dev/video10", shape=box, style=filled, fillcolor=yellow]
>>>          n00000030 [label="{{<port0> 0} | mxc_isi.3\n/dev/v4l-subdev12 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>          n00000030:port1 -> n00000033 [style=bold]
>>>          n00000033 [label="mxc_isi.3.capture\n/dev/video13", shape=box, style=filled, fillcolor=yellow]
>>>          n0000003b [label="{{<port0> 0} | mxc_isi.4\n/dev/v4l-subdev13 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>          n0000003b:port1 -> n0000003e [style=bold]
>>>          n0000003e [label="mxc_isi.4.capture\n/dev/video14", shape=box, style=filled, fillcolor=yellow]
>>>          n00000046 [label="{{<port0> 0} | mxc_isi.5\n/dev/v4l-subdev14 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>          n00000046:port1 -> n00000049 [style=bold]
>>>          n00000049 [label="mxc_isi.5.capture\n/dev/video21", shape=box, style=filled, fillcolor=yellow]
>>>          n00000051 [label="{{<port0> 0} | mxc_isi.6\n/dev/v4l-subdev15 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>          n00000051:port1 -> n00000054 [style=bold]
>>>          n00000054 [label="mxc_isi.6.capture\n/dev/video22", shape=box, style=filled, fillcolor=yellow]
>>>          n0000005c [label="{{<port0> 0} | mxc_isi.7\n/dev/v4l-subdev16 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>          n0000005c:port1 -> n0000005f [style=bold]
>>>          n0000005f [label="mxc_isi.7.capture\n/dev/video23", shape=box, style=filled, fillcolor=yellow]
>>>          n00000067 [label="mxc_isi.output\n", shape=box, style=filled, fillcolor=yellow]
>>>          n00000067 -> n00000001:port4 [style=bold]
>>>          n0000006e [label="{{<port0> 0} | 4ac10000.syscon:formatter@20\n/dev/v4l-subdev17 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>          n0000006e:port1 -> n00000001:port2 [style=bold]
>>>          n00000073 [label="{{<port0> 0} | csidev-4ad30000.csi\n/dev/v4l-subdev18 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>          n00000073:port1 -> n0000006e:port0 [style=bold]
>>>          n00000078 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3} | max96724 2-0027\n/dev/v4l-subdev19 | {<port4> 4 | <port5> 5}}", shape=Mrecord, style=filled, fillcolor=green]
>>>          n00000078:port4 -> n00000073:port0 [style=dashed]
>>>          n00000081 [label="{{} | mx95mbcam 8-0040\n/dev/v4l-subdev20 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>          n00000081:port0 -> n00000078:port0 [style=bold]
>>>          n00000085 [label="{{} | mx95mbcam 9-0040\n/dev/v4l-subdev21 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>          n00000085:port0 -> n00000078:port1 [style=bold]
>>>          n00000089 [label="{{} | mx95mbcam 10-0040\n/dev/v4l-subdev22 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>          n00000089:port0 -> n00000078:port2 [style=bold]
>>>          n0000008d [label="{{} | mx95mbcam 11-0040\n/dev/v4l-subdev23 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>          n0000008d:port0 -> n00000078:port3 [style=bold]
>>> }
>>>
>>>>> If I'm not mistaken you'll have 8 copies of the ISP media graphs, and
>>>>> that's exactly what we're working on with the context framework :)
>>>>>
>>>
>>> Ok. Then I should have a look to context framework too ...
>>
>> Please, I hope to be able to resume working on it sooner or later
>> given the right use case.
>>
>>>>>> ... since it is not, your assumption seems very reasonable.
>>>>>>
>>>>>>>
>>>>>>>>     - How can the user decide whether direct (csi2isp) or indirect
>>>>>>>>       (mem2mem) streaming shall be used?
>>>>>>>
>>>>>>> That will also be part of the evaluation. From dts would be my first
>>>>>>> option, but may prevent using both modes on same platform then.
>>>>>>
>>>>>> Of course this depends what the hardware is able to do, but in case the
>>>>>> HW is reconfigurable easily, I doubt that device tree is a good choice
>>>>>> to solve that.
>>>>>>
>>>>>>>> While it is certainly OK to introduce this support only at a later
>>>>>>>> stage, it makes sense to consider this right from the start to avoid
>>>>>>>> some nasty changes e.g. in how this hardware is exposed to user space.
>>>>>>>>
>>>>>>>> Also, we are facing a similiar challenge with recent Rockchip ISP
>>>>>>>> hardware (RK3588, RK3576, ...) and it would be great to hear your
>>>>>>>> thoughts about that.
>>>>>>>
>>>>>>> Is there an existing discussion thread available on this topic? I would
>>>>>>> be very interested in following it.
>>>>>>
>>>>>> Not yet, I am afraid. But there should be one or two soon (TM) :-)
>>>>>
>>>>> It's probably time to have one :)
>>>
>>> Good. Please loop me in ;)
>>
>> You are in, this is the conversation ;)
>>
>> It might be a good discussion point for the media summit in Nice
>> co-located with Embedded Recipes if people with interest in the topic
>> will going the be there.
> 
> Possibly even for a whole day workshop on Monday before the media
> summit.
> 
>> I'm also adding Anthony from ARM as I know he's going through the same
>> inline/m2m duality you're now facing.
>>
>>>>>>>>> This series is posted as RFC because extending the v4l2-isp interface may
>>>>>>>>> overlap with ongoing work. If similar development already exists, I am
>>>>>>>>> happy to rebase or adapt the series accordingly. If preferred, the series
>>>>>>>>> can also be split into two parts: the v4l2-isp rework and the Neo ISP
>>>>>>>>> driver introduction.
>>>>>>>>>
>>>>>>>>> A few checkpatch warnings in v4l2-ioctl.c remain intentionally to stay
>>>>>>>>> consistent with the existing style in that file.
>>>>>>>>>
>>>>>>>>> Testing was performed on the i.MX95 EVK using the media/next kernel in
>>>>>>>>> standalone M2M mode. End-to-end camera-to-ISP capture has been validated
>>>>>>>>> using the downstream NXP kernel, as some hardware dependencies are not
>>>>>>>>> yet upstreamed.
> 
> [snip]
> 

Thanks,
Julien


