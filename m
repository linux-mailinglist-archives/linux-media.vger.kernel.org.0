Return-Path: <linux-media+bounces-52891-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PKJMOEyk2lx2gEAu9opvQ
	(envelope-from <linux-media+bounces-52891-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:08:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D123145204
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A6F43058480
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F81A314A65;
	Mon, 16 Feb 2026 15:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jZnEYjVL"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E66313E34;
	Mon, 16 Feb 2026 15:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254136; cv=fail; b=pJIUVYGwD3qoEvZRktFzK2iYpgV4JJ5+s2++ub/memeZRA3LXEgdvBCi2FWG8oV9qIhOv2MFmRRx8UAc38ihBgBeq1Cbej61bPuhcL5uvfBSqgnfdX6845Y2gbXglqCeIrRb9SP1mXUKUhdL7AZzhYEZvuhO/MrvlkD7moawN+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254136; c=relaxed/simple;
	bh=G9T1g+E7obTHS9mLc65oLXsoLUL8zoeOCOu6aZTMeT8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZZc1qDtiTEGD5vQNzLCaYxZ74WiBYbIPOzjWNrLtCjKUxdGXt6zoROnSI+fZi6NFF4N+n4ZMUhUOg9sjpjyB0WJO/S4W7rl9pNvXHJzyqkiwXCY3U7vVf9gGBhwQlfalRrUkBcFep1ir9KzkRBTJoMHFfrpXrcXswVP1Y0OQcYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jZnEYjVL; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRiBPGJWjJhr3iEMe2WDteob2SRSfh5BzqLwRXvfA5WfgRp9L1Ss7OpoU39LO8+hu/qmEjQ2DjxUAFsmFtublyIRPaXUOhoKzEJMhHFcLNwueixfMzwt0HuKplm3dL2Vh3CMIpPtDDoevhhVmXiRkpNXVL3FaS0LsRYY0JaAL2ycX7ZdTdTubzcfDXt/CYrVjGRQPyvrJvxYGHU12ahWZ3SoHJxSj48x3CEhj8751tTbgQYzZM3oIbnPKJReJKUVYfqHm2XXx9qbleBi1Yd/BysiT+PWoXPFfdCrw7l1x8xjpx5Xg5U7SdyQGdI1hEYDwswELxZnff8YoE2DRolTzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93MBKnyrHL+7xNDV4PL+Bko54swU3x3QP6oRqNHaDpw=;
 b=Tdj4CkkTw6XDNtFhwnnRSMxbB4agw9XDNGAWwLxw6wp0nDRIXzpeh4CiLjh14+kvMkJiUUFVlBOYGoU1xYrLWIOcMJk0fx2w/jCDpcZvQTDnkL3lLX2UWWlui3HuIRp7ahxn0/Tua3cbQzBgm87n/H/3H022yy3/9aVS3l7GhaOu6fnX6T+oQMrC/gbqiDLeG0NKF4IbOJLxnoLwiB/ghvEjV9WYniykyA2fS4LKCqbTRU0qJRDPzvT2fNMuXGj8YGzyswBt2qkXKye9Imf36JAsVPpbX9LFTkgJ1y9p2Nd4s+GNF+gx2BlKnuRm5bkAHb4RJH/vj2SunRJPTH0y5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93MBKnyrHL+7xNDV4PL+Bko54swU3x3QP6oRqNHaDpw=;
 b=jZnEYjVLmZg2Xg1o+JSwgAR/Fwn+NZMxHaOEyjLs277k2uhJFKOsD0L2ShgYh4ymtBoiJMg+E9dKBymDd6oSiD345IzTeo42VfV4gRS4Mt1ytQ9AR2y/eOEI/HNf+G8IlkMw+ET8zd61Ndw5/uvPx4eljOioT3hNAUD1dHxJjndRlJAGbgJYK958m1MwIfAGLEEUEANVZunpbJzo6amVrffhI+eYUW0JXBXM0/LWmCm30Cp3iRtTgGfoK4BMvVcUOin4Gp+/0mi0ONqlx396PCqhJ0kGtDEBEZps2emAaDafeezsFfKObYOVYpvxgHU6O9Eu0u/TsJL7z/YIQAmGTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by MRWPR04MB12380.eurprd04.prod.outlook.com (2603:10a6:501:83::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:02:09 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 15:02:09 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	chester62515@gmail.com,
	cosmin.stoica@nxp.com,
	adrian.nitu@freescale.com,
	stefan-gabriel.mirea@nxp.com,
	Mihaela.Martinas@freescale.com
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	s32@nxp.com,
	imx@lists.linux.dev,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com,
	jkangas@redhat.com,
	Larisa Grigore <larisa.grigore@oss.nxp.com>
Subject: [PATCH 00/13] Add DMA support for LINFlexD UART driver
Date: Mon, 16 Feb 2026 16:01:52 +0100
Message-ID: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0009.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::10) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|MRWPR04MB12380:EE_
X-MS-Office365-Filtering-Correlation-Id: e67ae89f-67f0-46b8-f23e-08de6d6c5bb1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUNiczJTQTgwSU1zNEl1MGVNM3VJbDFzbFI1S1JlOGZCK0NxeWR0RGtzbC92?=
 =?utf-8?B?UjdLVG1vYkk0cW15dFRGbyt4TnZabTdYa2lZRFNGdHhQNlFwK3dNeDdwc25z?=
 =?utf-8?B?UHZnVmV3RWNOelFibkJsRGJkelhzbTd4MGRTTEdpL1UwQUQ2cVNtWHRnMXhv?=
 =?utf-8?B?Y3JlVjcvNXpaRlQxWkJncjBRT3pFbWgweXM5djhPb1Bhd1M1OS9SdEZOUk4x?=
 =?utf-8?B?dE51M0kvNkFiLzdWclF6aTFPNjFMbUlEbnZ4QTcxVHFQY0ZJcXBNd2RpZkYr?=
 =?utf-8?B?NmxYcWJza1FvQTc2WVAveXNuN1lXMVBWUGlHSnlrdUZWVnNQUmNZS1A1d1Vr?=
 =?utf-8?B?eExYTUpiSFZ3cmYvbVRWeUQrUStCamlER0RTa3h1K3VJaVJiN1BCV2U3ZmRP?=
 =?utf-8?B?dFNsZjdDaC9tcGRYZ0RxUFJpeDd4V3V2VEtUYjI4SzBYd2ZJM0o0Z2Z1L3lt?=
 =?utf-8?B?UTdXcEcyQUk0dklMMWJFTWJMWGZpSHJ2TlJMM0t2dDR2Myt4Nm15RjNoaHFz?=
 =?utf-8?B?c2lvc0ZpK0JqSU5VWUhDUEMzbG9WOUNKcmRET2dOQmVPVndBR2t6SnR4Yyth?=
 =?utf-8?B?djVDY1B6Q1c5N2lncnF1a0xsNnl5NWtnekhJUXN1WlVBMGZKSm5RQXZvbjFo?=
 =?utf-8?B?Wit4WkdRMjZLYjYxeFFZbjlaaXgzSk9xeHlwNkdFY3pqeEFQRkRmNFBYRmZq?=
 =?utf-8?B?L1Q1Wm1iS3hXTlFxU094TDMvcjcrMXJNOXZxR2M1L3hGd0hBazhReVVLSFFx?=
 =?utf-8?B?czdCWTduWVY5SmlRTW4yaDFUNmdPeHNOaTZMVUs3NXJ5M2JQeGd5aWY1Y1Zy?=
 =?utf-8?B?WVdtZGp4cy9reG92a3ZHZXhicXZTMkNGUFVoNnppa3NaOTlIS1Nsa2Q5Unh4?=
 =?utf-8?B?c1JYVFVtcmhmL0Z3aUtSekxqQkpCTU1ON3lzUWU4SE4yQ3kxaEU2Mno4UFRF?=
 =?utf-8?B?LytnS0ZaSGJWanZHOHVweDZYbDAvUmZKL3A5bXNFSmlvc25Ia2YwZ3BVUkNX?=
 =?utf-8?B?YW8zWmdSMGVVc3EzRC9GUDZ1NUF3WDkwK1UvK0RaSWRML3BxRkcza3lRcmNW?=
 =?utf-8?B?bjk0NXJwVkZDaEJ3UXNlTkVSUi93NDV6N2dsNEp0SUhmOU9OSDRheTBjUThJ?=
 =?utf-8?B?S0E5ZFEwUno5U3NNQ1NaaEhtQlhCOXVwNU42VWxhM1ZtQTBHVzk4T1d5bVov?=
 =?utf-8?B?WFJHWEw5bG81UWx6RWdiUXYxQ3B4QzJWM0crNWVhTmlBRmc5Ukp3QnhVOXBh?=
 =?utf-8?B?d2djQmRMa0pvaVE0VEREaGZNMkFnMk5UTkpBN3pLVm90b2RTQkhxOUVQcits?=
 =?utf-8?B?a1M1R2xteW1aWGg3VW0xb1lSYkJab1NWaVlTdWxVOXlKY1dBY0hxeTVPUC9W?=
 =?utf-8?B?ZEQ5WHpBZFNCOGdtSHRGR1FOZmwzTTl4emFXZUlmeWU2NytrL1d3b1IvQmdQ?=
 =?utf-8?B?Q3d3YkQva0hSV0tWYlQ0dlYrdng5ZlhwSWkrdFBtTTFpSklab3BQZDFMcFIv?=
 =?utf-8?B?Q0YyTkZIYXFlUFZib3FYZUlhd2NzSlk1Q1ZzblBhWmUyb2lPRGFiOXpSTjJ3?=
 =?utf-8?B?dWx4dmhQcVlkSWx5am1Ma2MvSlNEYVNmZmhUNlM4NUxPTnEzRVJ4dkxvZW4x?=
 =?utf-8?B?OUJMbklJQUNoK1hTTFNabmp2djVNM3M2Vk9GbUNCNThXVjU0YkZUK0s2QlRk?=
 =?utf-8?B?a3NCOEh0eUlGbTFOU1ZORzhxWXF5NGwvMnA4Y0l6YmZoTUw2V0h3UU5NcEZn?=
 =?utf-8?B?VHVCTUpMTUp0aVBURUorYSs2ZDhyeHhnczVoSDhRR0UrVmJLWXg5VFJQNzlt?=
 =?utf-8?B?clA0ZVZxcWo5aTArWVBiT3dGY2FlYWowSHVZdFJyaXAwUmtHdnZwUVAwUDlp?=
 =?utf-8?B?Nyt0UUFOY0VoRDNod3AxOGpwQU9rVmRDZXM3SktWYkNzYWdCMm1pV1FlbVZp?=
 =?utf-8?B?M3BBb3ZJaHcvOHVrRmVRWVJBUTFBazNwY1drNys1Yk5CWFEvOGNYb0tPdnFG?=
 =?utf-8?B?SlRTSDg2K1NTK0M1MGY3MVNaQkErRFBFZWRYM2hEMjVBdEtaelZ5Nm9lZjBI?=
 =?utf-8?B?SzVXbGdZTVYxU2U4TDZpWHhmSEZwQUg4RmVNYkhxVjFHRjdOYnNTZVhUNlAw?=
 =?utf-8?B?NzlRMDNybWhpVmZBZG54Y01wZDJrcERnVFZzMnFTTzdCL1VremgxUEtRQ2pQ?=
 =?utf-8?B?RFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9224.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDhkdm45QjIza2tFR2RUVVJ0UVF4aC9NcjhGWEczcVVudTBmTTFjeGRlOE10?=
 =?utf-8?B?RCtxVk9yRUpGUWJ2MVl0bE1kWUdsN1l1Q1J5bFpXbzRNTERjWVBwNW1sdmJi?=
 =?utf-8?B?UFdTVlhDdUNCT05yYmg0SGNkNHE3WmR2dXZ0aENhVDI3Qi9tR0pPYnc2UGNU?=
 =?utf-8?B?dnBwcDVMSFN3WWViK1VNeExIUmoxMEFpdmRPTWlJeTJDeEM2R0pQaDVjeG9t?=
 =?utf-8?B?bmg5WXZNTnlhV3RMbERPRGF5RzFCM3laNG5kZWlGaHZ2SGV1aitKYlQ2MHU2?=
 =?utf-8?B?ZnhVOFhrQWREaUk3THhXNWJvckdjakx6UlpwQ2c1T2E0NExSU2ljL1BGSmgx?=
 =?utf-8?B?d2NzekdXUlJpK050QTVaOTdIb0lIUkFNWGZNNlVuWEhONkpBWmtBUnlWRWpX?=
 =?utf-8?B?NjNUNHZVSEdHZXpNRktuUG1ZVmxaMDMrbTNSNlRXL0J4bnErNUVWaXpVVDFW?=
 =?utf-8?B?OUVrMVhSWVJVK0kzb1dObGhzcnBidUN2RFczUG5QZHk2bUJtekE3U2NkM1Zs?=
 =?utf-8?B?T2RZa01xdEJ5VkZVWGZ3bXRQRkJVcEFDVWQ1a2pHZnFlMHB2SG9hTFBXYlV3?=
 =?utf-8?B?V0FYRU9nZlpHbDZuempNd3Q2cndMSHA4WEQwQ3ZQd0ZpbmlUeXY0VlAxNysy?=
 =?utf-8?B?VTFZV2k2bnVCa3JmemliVmVGSjZHdTdyVG9jOTNaNEQyQUg3N0pXR2QraXJS?=
 =?utf-8?B?K3hBZ1kvRkhkSjAvbDJZNHZncVIzbmsySC9aS2d3MEdrV1YxNmRRdW9tVWVx?=
 =?utf-8?B?Nko3VnEzcVYzSkhnenFFbHI0M1Z4OHp5THFGUzdkY042ZXB5TVNvdWZPUElr?=
 =?utf-8?B?TmFMdUQvckh6QWJYYXU3U0hzdmlFK3pKNUJVTzF6QThaYURFa0F6SDI5Sktl?=
 =?utf-8?B?ZVczNXRucUJKZG9VNXo2SG5hZ0k1SzduWjVpdUYyWEkzMlNQOEU4VVVuYzl5?=
 =?utf-8?B?L2JEMUU4ODdNY2FBbzNMSDljaXBrbTdPbEw5dmhiN21GaXduVy8yZWFKTnFW?=
 =?utf-8?B?Y3c4TzRHZ29ML29ZbGRGOWZ6aUZHWjQ0SUQ5MHZ3bXVXMlpVOVZBOEpvZVh1?=
 =?utf-8?B?SDJML2pWVzVkSEFZZmZmSHBKbStGdXEvKzhQWGRLbTUzTndqU0dveCtXbWtE?=
 =?utf-8?B?TE15Q1B4Zm9XbVpKc0xpS2JwWHVlUlZWZzN5QzBmbk5mZDI4SGVrU1JwMXVI?=
 =?utf-8?B?ZERoejkrR1NoQmJJU2FTSkFvVE1uT1BmbjY2dk9aZlRGVm1HZXpXZnZXK1Mr?=
 =?utf-8?B?bzBDcDFRbDhoL2t4OVYwSGZYQXNFd1IxRkJqTUhGSjRLa1JKMzA1VC9XWlZI?=
 =?utf-8?B?NFJmcVlXMy9Tbm1tQ3h5clRtc3l6VWltT3pwaURUbW1Xa0tvWXh0blZ3bUNT?=
 =?utf-8?B?UExkYyt3VlRsMnE0ZzI3YitXWmIyZFVQTDMrUjV2U2FwL1psdkVPMVJ0RVJr?=
 =?utf-8?B?dUdWQUo3NHBJTzlkVDBaOVhDY1ppM05zbHJiMk5NNXhQYkVMcmMzMnU2TnVV?=
 =?utf-8?B?QlczUUVuMDA1SFY0Mm1hcFMyeE9yNVI0OVQvRjJBblJjcDA2a3lmZXY5R2NL?=
 =?utf-8?B?QlFXY1B3YlcwR3kyVVdrRktkYzhRVUFSeTNMTXB4dVZoeUY4L3FzVGJYaE1P?=
 =?utf-8?B?SW04dGwwbFVadGw2V0ttTVVnY25rUUxocElXSlFSY0ZWTjRQK1I2elB6ODBS?=
 =?utf-8?B?Nlkxc1NVajRZK2RaOGQ0MjllTDBMY0hjUFU3UVV6djUvMUlqNXg4SiswZHd0?=
 =?utf-8?B?OFB3RTVJcWZYY1NZelJWSmVDTS9oR0JSOHBUazhSVUhTUHg4ekRyQ3FPYXpV?=
 =?utf-8?B?K2o2U1R2cS9SN1VxTVdObml1dy8veGFILzlYK3cvVjB3OHk1V1lua2NGRzRN?=
 =?utf-8?B?elUwQ2pFS1BGTHl3Y2xLTDU2b2NiRXUzT3VWcXY3bGs0eEgyL0tkS0JlU2p1?=
 =?utf-8?B?K1JxM2RUWmJMZTcyT2ZaZituS0ZmbmVrZjJYRFFFSVJSVld3SHQ3OXdSYXp2?=
 =?utf-8?B?NGVEWGtlcVdESjJzVndES1MwVGZQaFkyMVg1MElmWGdtd25GNkRMdXpNOHdr?=
 =?utf-8?B?VnM5QkVKRHFSWURFSVlxQlB0MHl0SWExQzdTSVBveUJPVGdpRzNYcTdRRndW?=
 =?utf-8?B?N2pnMTZqY2hIbmJNM0l5UEdjSGZZb2Y4UXh0SVZuVkJGbzc3TU5yOTVTeFk0?=
 =?utf-8?B?K3lGeXNSZHoyT21hazl0L29RKzBXVGR1RjlCa0ZZNU1OZVBLMDZjRUt3SXZu?=
 =?utf-8?B?ZXdxc2ZGR0RFNWNqOEhrOTZobDJjNHgwdEVqTUs4dHJRVlFQVlFxaHhFaDlj?=
 =?utf-8?B?MzRIN05GY2szOWlrVUNieGVSamZ5aHNzNFBzdm1ZemI2VGtnNWszWE1RcFA5?=
 =?utf-8?Q?HndumlG0sojg7wCQ=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e67ae89f-67f0-46b8-f23e-08de6d6c5bb1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:02:09.6940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9S7hXgkYLFLEcqNw3FoSDb5/lzLxVUN4a769qDDh4CkWRrFZjSWTQSPLam8Rfu28P3K2ruax9HMN2kF06eB8EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12380
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52891-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larisa.grigore@oss.nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 6D123145204
X-Rspamd-Action: no action

This patchset enhances the LINFlexD UART driver and its device tree bindings to
support DMA transfers, configurable clock inputs, dynamic baudrate changes, and
termios features. It also includes a series of fixes and improvements to ensure
reliable operation across various modes and configurations.

The changes added can be summarized as follows:
1. Fixes with respect to FIFO handling, locking, interrupt related registers and
INITM mode transition.
2. Removal of the earlycon workaround, as proper FIFO handling and INITM
transitions now ensure stable behavior.
3. Support for configurable stop bits and dynamic baudrate changes based on
clock inputs and termios settings.
4. Optional DMA support for RX and TX paths, preventing character loss during
high-throughput operations like copy-paste. Cyclic DMA is used for RX to avoid
gaps between transactions.

Larisa Grigore (8):
  serial: linflexuart: Clean SLEEP bit in LINCR1 after suspend
  serial: linflexuart: Check FIFO full before writing
  serial: linflexuart: Correctly clear UARTSR in buffer mode
  serial: linflexuart: Update RXEN/TXEN outside INITM mode
  serial: linflexuart: Ensure FIFO is empty when entering INITM
  serial: linflexuart: Revert earlycon workaround
  serial: linflexuart: Add support for configurable stop bits
  serial: linflexuart: Add DMA support

Radu Pirea (5):
  serial: linflexuart: Fix locking in set_termios
  dt-bindings: serial: fsl-linflexuart: add clock input properties
  dt-bindings: serial: fsl-linflexuart: add dma properties
  serial: linflexuart: Add support for changing baudrate
  serial: linflexuart: Avoid stopping DMA during receive operations

 .../bindings/serial/fsl,s32-linflexuart.yaml  |  31 +
 drivers/tty/serial/fsl_linflexuart.c          | 972 +++++++++++++++---
 2 files changed, 846 insertions(+), 157 deletions(-)

-- 
2.47.0


