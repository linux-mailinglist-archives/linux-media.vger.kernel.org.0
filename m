Return-Path: <linux-media+bounces-37145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A38AAFD4AF
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 19:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FBD7587965
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 17:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE9E2E54DE;
	Tue,  8 Jul 2025 17:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jJMfeoE/"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915F21FC0F3;
	Tue,  8 Jul 2025 17:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751994407; cv=fail; b=bmWwtcK/fV+j6cyNQ45s5H99rAxkgd8nCngQGyjLv6nKRiqrHatedopRpfh3z8MLcTxK2ZrZhwRfXd7lBK/q89UedlnqDHDmrtuFq6QQ0MBhMYcNU6a3NQcfwUsaZUm9NC06VDOf6ezb3XjtL/jB1PKzPrKq8W9tQeQQhTjsCZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751994407; c=relaxed/simple;
	bh=X4+seT/ywYT/8MKHDV8qYAHsBNyfEaR5gNSE0bIbQzM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GtFjjy4TdlJJVTNpHg21f8FjNMfSjPXgmgQzVsM1apSGOfgEKMz3qBUT1rwMNT+m/aoOwPtZ3NUYcFCkI7RvLyDO+CquosbTMD+VoZ2dpHcomRcxNysXHYUe93jBV0UbvvNFwJyUsypULJZbvNkh4SqMx73/8NMx+62skShf/zY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jJMfeoE/; arc=fail smtp.client-ip=52.101.66.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTE8GVa2uTEJMe761KFzBeeUDuKJO/ivLP732NhXI1HcpDoE7C3D1neq7TKrlWWuFjlwBvSU/8WhSQxpSwOscmji0wYys9n+J+ETc2jauv1s2LhyxUaTccIFp8g7Q+KrOmLmhbJA7JeafrSb9fY1+eOAsiNDsHAU6s/AK8V5ARAGxOb5xVCIr1Hn8MfVyERGtrdgzS4TJ9vBhAgXNm8DPI5q8pfohaSgimBjeU5tksJZYdSLXi22jL+vbOeXfTcWjYuz3xvF+gIQo5WJF/NoJn5QXeGYMKLP15gsOhEvH7L9cVktJDDZeTLY2LJe10d++PuT2CzvargMfy9+sv5ahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0QeZjUK94cQai4YOtmoq+QGBmOOd64RF8VWJxsX1go=;
 b=q9ngXJXBaLQUeQppBFKwDQhXI8QrZxtJz6FoAvQ8gwFPKw7iX45ZrUwqUhaTfQ0jDhvACjDks2E6b7Gvd2vdKW4zbbCzLdLWeZCm9dGweoH2L3jnpkQ1OhUwUNeqRI2aXNxItxFc3Mb4tdbfd/J2AKaechWFRV9b/lN65BPUkFJvLfNtTdvL7n6KvAIRexFS3oCldDMMIFtfcbl3m3FguqJDGEYtPJNQxbh/ob83KmKZbfYfjhbrMGt6up0a8ZoxRJoCy5dD/EFDMvx9ivh1yBtXyQgaURUSf/l8oJwhMFr/cVQTd6xpHBvG8of9cdC52YukQfsm124vjm0Ade8oVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0QeZjUK94cQai4YOtmoq+QGBmOOd64RF8VWJxsX1go=;
 b=jJMfeoE/f9H4mPqhboyPVe33uJu+UWeplRGCp4ozY+zAXNVocsnXgIom1j92k3OEl7ILtBLbvnSXU/PkNOeEAg7OvZ1zizXutOm4kaPccY6lz6Ofs3VrrCiHI7uQNukS5Bp93Zcx1pIZX/RAUHyrVZiyX4RRQX8zo4Wpj+7VwnSrAr8DJWo9dX/xzIe6FxZLw+ojVmeaL7UsgI0zULYZQmtlG0LqNQtqT4xWvEH5XKc6D5k7jYojww5ewIErfuZ37bHu+BWDhtsyNUEIz7iVeL7OBVUOl0klSHf+7zBHh1NG1SFAnziRuGDcz+/28TqId9E9ivEGInfVPqH/XSpZow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DB9PR04MB8073.eurprd04.prod.outlook.com (2603:10a6:10:24d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 8 Jul
 2025 17:06:40 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 17:06:40 +0000
Message-ID: <3df6d174-ce7d-40ff-a7e0-fb9e8a9ab435@nxp.com>
Date: Tue, 8 Jul 2025 20:09:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 2/4] media: ox05b1s: Add omnivision OX05B1S
 raw sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 robh@kernel.org, krzk+dt@kernel.org, bryan.odonoghue@linaro.org,
 laurentiu.palcu@nxp.com, robert.chiras@nxp.com, jai.luthra@ideasonboard.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
 dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
 alain.volmat@foss.st.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 alexander.stein@ew.tq-group.com, umang.jain@ideasonboard.com,
 zhi.mao@mediatek.com, festevam@denx.de, julien.vuillaumier@nxp.com
References: <20250305094359.299895-1-mirela.rabulea@nxp.com>
 <20250305094359.299895-3-mirela.rabulea@nxp.com>
 <7c4379dd-e004-4e0d-85db-139c3f671edc@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <7c4379dd-e004-4e0d-85db-139c3f671edc@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::15) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DB9PR04MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e299911-0509-45a0-f2f3-08ddbe41ce47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlVPT0dDcFpKQ1habjQzL1BUeVZDSFVacEc4a2Robnc2MFJWeWJxMGRWK2ti?=
 =?utf-8?B?dFRpU29XUnFESm05MjFoMEJsNFp5VmVNdU05KzhKVEJucFE2YmhDdlgxTUpZ?=
 =?utf-8?B?TnNSeWp0VG03MkZic0QyV1dFMXBTQWxnangyVU5HK05Fb0paWXZQUlBVeXlJ?=
 =?utf-8?B?cG5EOGIxcktTMm5DNFZwckpDdFF3MWtmb2RoU21NcUQ5bjRlRjZxVzZrRTlH?=
 =?utf-8?B?ZlFmUnRkeTFCa1hJU1F4a25ESTBidjFFbEFDckxUUjVCU1owVlpTQXYzSjdG?=
 =?utf-8?B?RzY0dTNnMzZMT1dIS1FXcDhFQzJkR1ZwL1VIL0FpSi9ZWDBBelVVVk9oWlV4?=
 =?utf-8?B?TDh1MENjN2dza0x3WExlRmhici9BZnl4UUZDWk9KQnU3NklabmZmZkZhM2RL?=
 =?utf-8?B?RkdtQ25xdGVuNFhxNzRvaVJFUjV6ZEJaamtJRHNBRFlRbnRjZVhsZ2EyRkhH?=
 =?utf-8?B?REZweTY0VXltdE5hM2FHZkx6NWhydmFod3FHcFp0bE0zU3NDck4vRFB4Z3Fa?=
 =?utf-8?B?UlRleUlxR20wbUx2MjVTTytLQk9vbmZtcDhKRFFITGY3WXRsSkdKelRTODRi?=
 =?utf-8?B?bWhDRmJ1N3gzZDFNdlBRTTVoVk1RcHk2eVpKakZ0ekpyTDNSTDNxWHE2QUpH?=
 =?utf-8?B?VDZnK0lGd3hKZ1pIbmNTTWpFNEtYcUMyTGQwTlRUdXpGa2hRLzdrR0VOR0ZY?=
 =?utf-8?B?QVlraS9QN3JPdkRCU3lJN2xHdTUrTVRiWjNwUldsWS80QmRrVDUxaTgwWGNK?=
 =?utf-8?B?ckxETTVOV2w3V2RlTnZaQVBUV2dJQjlrd3l6djgwN0lRakRqTGhwcFR0U1dq?=
 =?utf-8?B?cDlGaDFvNGl4WUhCSlVualR3L0EvRXJmdU5FSlpkc0Z4aEgxWFNWRGgrbzFs?=
 =?utf-8?B?Z0MrUzR4SnNaNHEvRDZGRW9ueWl3UzNFT3FwT2tndW4wR01RRWl5cEVMWWlv?=
 =?utf-8?B?aEUxQ2V5eHpvTjhYQi94alMzZEI5UnVHUlBlWmcvQ2x6cXVKLy9hOGZuMWRq?=
 =?utf-8?B?MmxTYmdDelAvWWk5L0s3T2FUNVJlLzd0blpzckFtd0lWOElZbWZNTnZwVzZr?=
 =?utf-8?B?WlV4b2lwcnNaOUJFREZpcGJaTE84elZ2SXd3RVFELzZuRzN0ZXZYNzJOYUJn?=
 =?utf-8?B?N3BSMkVRS3ZuelpWK1ZpaXJvOUs5MS83VEFvcStJQmg0OEV3UGtYOGM4V0JV?=
 =?utf-8?B?aFBGMm41TEhSeG1tdEkzYVJTVkhlZTBHVkEwZGhLYTUrQTJUTGVReldKMWFU?=
 =?utf-8?B?emNYeG96M29zTkRNU0RIRC9DWEtuRjBjN2JhTjZLVnYzTkwxQS91OFVWRW16?=
 =?utf-8?B?UFV6bXAzL1Jia3V0andlVm1Rd0FINXhIem56bWRkZlIrOXVqSExEWU1TRWJS?=
 =?utf-8?B?WWR4emduci85Y2kxaGpoa2kyR2VUYmpJYTZoUEhsMWY5R285aWxNNkJhNDBE?=
 =?utf-8?B?WitKMnhOK1J5Q2NSSlo0eU5iSWRiNURZWWxKYU45S2dDZE5ZV3phNkFQNy9G?=
 =?utf-8?B?ZUpac1A2VEZYSFd3Mm1nRlVGM1BQN3gwUUI0M3RjQ2luaFZ4bDhZdzJPSnJK?=
 =?utf-8?B?dGdNc0l3WGtRTkJlMm5DRVRnT0tHaEVGU2wvQWVqOHJWaXpiVmJaZWsrcHl0?=
 =?utf-8?B?N0w3ZnNoSkpjVTRvMTBSSzY3b25BMG0vU1JzTHhHQTdEMDZZbnRDUXcxYnBk?=
 =?utf-8?B?UE1EcWVlNnNNTC85WkdrQ05KV1pSWGUrR1FqaDkzTFlkbkNYNzJNeE5QVktJ?=
 =?utf-8?B?djdxRVNTRWNHd2dZSTFFT2lVSHlmbkQ0ZWhKbjFnbEZqSkdrNnJUWVZHVnFj?=
 =?utf-8?B?RDNvTWRwUmI1ZitEVVIwTWJWTS83SzJJSGFydGtyTjI0Y0gwMFJIeGo5b2Mw?=
 =?utf-8?B?cHY0OHFzdnFOc3dQSk5vRnlXZHVaNmZUbkxOS1FCZzhtL2ttcmV3TzhDNG5u?=
 =?utf-8?B?MGlOb0ZVMm43dVpSWlBmWjNCY1NOK013R0YvUHIxck55MDgrZHMxU2o0Tyty?=
 =?utf-8?Q?5mZbvHr2/18nDXbe9CpValGwTINLY0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWx2bTdHeFpjdlcvVC9DT0pOR0p1bWRZWDdLVmw2MlhNK0J3NGdTclduemh1?=
 =?utf-8?B?YTB4VHVXZVFyNzBKak5UL2VFWjFvNVp5bVkzZWt4emVSZHJHL3NXUTF1dlJs?=
 =?utf-8?B?UFNXUTh2VEp0VkxDcW5oSXJBaVlWM1RlMEpEQVlYOXVCRzZ6OWpRcldTVEFJ?=
 =?utf-8?B?emg4Z2xYMXg5WlhNSW16RjRmVW90OFl1cGMxMURTOXlONjMvdkJiSFliRHhp?=
 =?utf-8?B?dGhOZFVLVUd6ZGNaL3Ryd2JRRGwvdEhVQmV3UTlqemRPeWx2b2FWMVRPTm4z?=
 =?utf-8?B?QlEyUU9kQys5ZmtJcjJScTNHL3BubDB2MUFkU0hrZFh5SjlwUUdjNUxWMXI3?=
 =?utf-8?B?V3JzV3JUZ3pGUzIzb1VBOWRDWG8xZlhhOGtMa2orUUV1Q0JlaHFlVTlBQXRs?=
 =?utf-8?B?ZkVuNmFkK2lmanpYR0V0UDJQcGxvWWlXMnhnUTJZZUl0SE9CRlBZK3djR3lI?=
 =?utf-8?B?Tkp5Ri91eHRtMWcrWGlkRDdXTVpCeHZYT3dOUnlWUW5SRmUwaG5SVVNmSHVF?=
 =?utf-8?B?ei9QQ0VmOXJmSXJBZ3pyV1JYYkttSDd3bDZuaEVlRW5rWmhCWWw1dVBqRlRS?=
 =?utf-8?B?RTBMSWtCbEYxcksraEhWZHhiNmRaaFl0WmsrSVN1SVJJZ2hRMlMveXBMY09S?=
 =?utf-8?B?YkRlNFQweDRHRmQyd1NVZ1B3V3JTQkk2NzRjbE9WaWRQSkVpb1lzcHQzYnN5?=
 =?utf-8?B?aVpmVUN5eHA2QkpwclF5N1JEZlR5bUI4MWVheUN5bEJITWowRHIrSU5Fa1VO?=
 =?utf-8?B?WlJoSFlxNFZiOEJjT3F0QldZLy9HMkxRZWZ3TWpMOUg4bFhOSVc3a2FlMXU4?=
 =?utf-8?B?eGFDOHAvRGRPckxudURzSjJTeG9IVWRhMERHVG5KQXp1aCsrR0tDZTNiQzdN?=
 =?utf-8?B?SjlWV09VRGdUejJmYkxEMStTUE0vaGdaemU1MDNjWWtJeERSbGRxR015QTdq?=
 =?utf-8?B?Y0lxKzQ5RHlRU0xFUzFKWjZRTUpndEdtMjBORmhjVTFDZTl5ckMxR05Zb2Nw?=
 =?utf-8?B?TytQWFhFeXUweEhLSDI3RUhKSzUvWFpkdjRMMHdlR01JVCtHS1ZEUTQ0cTU0?=
 =?utf-8?B?YW45UkhVVGlWV1lOa1E4V1lvQzVOY2JSM2dKWVpiQjZvc2dYd0gxeVhrLzls?=
 =?utf-8?B?YytYWnlZUG41TC9SVTlZOXdpWjM1L0tJTE1jUG50NTRNMEk1V1lwaFlXNUpO?=
 =?utf-8?B?T1B6b2ZnVXcvVzhoVTl6QWZIUlZIWnhFNU8xUW4vUVdmNXBhL0szYk9EZllK?=
 =?utf-8?B?Q2F2QW0rSUMyUVl5emQyMm1BbmFiUHJMaDVDRkNaZElNU212RGdXYmhzeENL?=
 =?utf-8?B?WDVzaUErajVMZzdKQkNJSHJ4VFIyN3UySTRXSjhSaERRMWVOU2U1Z2tOb056?=
 =?utf-8?B?NHdzQi9aeTY5SmVnUmhBUEsrVERVRUY4UzczalQwbWhLZ0htdy9MTE5wbXVh?=
 =?utf-8?B?M0U4azJ5RlVHWllveXpvVXR5NmREZUpMNHE0Q2t6c0hQQnVsdFhlcmlmZkhh?=
 =?utf-8?B?SHhRZWF1ZHhycE1jWVlmSUVkNjJzRUxLdW8xRCt3R1NvWlMvSEFhcVhmcGF2?=
 =?utf-8?B?SEs2SHU5UXFhWUVtTVd6dEhpTVRYYUwwdTdBZVNqcWNrbDBwSGxiNURGN1hv?=
 =?utf-8?B?THluWDY4UUI2d2ZCWnliQ1RUZ3p4eGl2SlZ5R3pUT2wzU2lrRkxLMENVa3Nv?=
 =?utf-8?B?L2h4eGlkaDg1WDIxai85QzZyTWdwN0NOR1pjUmZHTFo0ekZ3WHdRUFlvaThR?=
 =?utf-8?B?MWtiTnpQeXRMVXdwSWthd2hIZlFiblYzZVVhM1pwWTV2eWxNKzgxbHJrLzQz?=
 =?utf-8?B?TTRmOHVnUTgvZ0V2M3YrTUpHdUVBUy9qUUhNeFhCWjFodGpLOXdBdFZFQllI?=
 =?utf-8?B?TmQxNzJBZlBncTE5eGlsT1VESlZaSDlCd2NWa08wZE5SbVFwVjdNSzVsNy91?=
 =?utf-8?B?QUtGV3Y0OFlHSlh6RFlsSTJpR2g1cUpYVGp5VGNoK1hVaDlhYjBQbXZuZVF2?=
 =?utf-8?B?TmxxVnNQaGFNSEo4Q3MwMkJXSnBnY0pnWVUwSGtkaGVaSU9Tc1pIanR4dldV?=
 =?utf-8?B?UW9iS2xiTWpSYTVWcXdhTkRKbUxWYkplUm5hTmRWMXJZdjZWSVRLRVlzRmNo?=
 =?utf-8?Q?VrH6bD7CTjMaA7JSb7PPZsR8l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e299911-0509-45a0-f2f3-08ddbe41ce47
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 17:06:40.0796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWExNqz+dNo5bI3hpfoXdk6H653X9lDiliuH3C3K5L2wb31JVSXLyIvcWN6PhFu9t5/HJ6AcnINlZIMW7hDd/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8073

Hi Sakari & all,

On 6/29/25 11:30, Sakari Ailus wrote:
> Caution: This is an external email. Please take care when clicking 
> links or opening attachments. When in doubt, report the message using 
> the 'Report this email' button
>
>
> Hi Mirela,
>
> On 3/5/25 11:43, Mirela Rabulea wrote:
>> +struct ox05b1s_reg {
>> +     u32 addr;
>> +     u32 data;
>> +};
>
> Could you use struct reg_sequence instead, please?

Yes, sure, thanks for the hint.

Any other suggestions, anyone, before I send the next version?

Thanks,

Mirela

>
> -- 
> Sakari Ailus

