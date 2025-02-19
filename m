Return-Path: <linux-media+bounces-26346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A69A3BB67
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 11:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35E441897F41
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C453C1DFE34;
	Wed, 19 Feb 2025 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="OO7b3Pcg"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2102.outbound.protection.outlook.com [40.107.22.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6858C1DF987;
	Wed, 19 Feb 2025 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739960213; cv=fail; b=pw9O17S7wDICK4EQsu+MbLcVhv7UKyxihBUGCkM+oNS535h7KsVzQRHLzfVNsbBApAWFCdTFM1whQtrbnLrn+rdG0F85QgCUQMlwD9x6Eglb/tdzQWhtQsB+TFAVaVb/mJqXuaaTlEoeqmrZUMN6lDZMla9UEzk7vgYhPpX1264=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739960213; c=relaxed/simple;
	bh=TOjjCdbG8+id2SdNirR3B6WDLwEWVtZBREEw0OdTRgc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hmoBVpQluNlak+LbKY+3n2UrmibP2EWg6axpCdvlmLBjwd/bHEzEVzGA72XBy5zlDnp3Xf9u76Wp301z/y4+sSih8pNt+mMwS0UrWi76xNdRrfgH/oxyp4iIDggQrofg7KK6CxBltq43cfc03OdRT8hIljNaOiqvXGO6GA6xtZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=OO7b3Pcg; arc=fail smtp.client-ip=40.107.22.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bj3q2g1lSe0Pe14z2imwmx/ugOiwUhPDnOO73SHOG7FntOEJqTdlR69pXLBa+Vbfp9VrmCJQFG7Zx6zu2HJ2HaI7AYIbY6eYnwH3reXDV69T7CSKG4KEcA5s+0hTRu+N7adxyk/3hJKKz5QdXisSuZbC7ZiOHeVElIFcMsWqd2IKa6SL1C9ghV+El3DKh/gD/U6Eq9P34X8zfl/u3kLu1qwxN+R3haRl+mRpvWVxRdH8SOynOAngn9Ixop1KQyH/Y6U/5jNW3kfMZ94f95oEq+2E9G52CAVi3FhGcpmyMGJ0o/q6iG6BQqz9ZMgE/FmWtcahwhugVne5pz/1E3w02w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAevX8DPPJJwFpeEZsZj9Ll8Xy/l/5Dz9tCfFmx2VLA=;
 b=kVzm2YqTYBhohHJ0oKhScJY+5wSJMy+zqc9RqiDBuZuZA/p5kHXJjTBE2mF+bsU9boAPawebigsSu1OEGAPsnYUEO0khrSxpbt8ehPxtO/PR5ObYmfk01Vt4mDK+Piaa0pZ/kp+ontK4n4iMzMJc+IqegXKni/d6F25YsXdiBWCeOg0g20ZTDwt/jMqj2fvOJAXpNMIIT/ehQm/WtACE7GjZplivHCVmOAhYWQCWFSX4+KwT78ttAaj3gVN9nbuWnLwmrUTUtjBVjK1VDGVE/j7nYY1tjRsLPzsMHwZ8ZGL/Z3GbBHE4Mi+FRRqUX+F6z3B90fNkvaK5nO5gui44Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAevX8DPPJJwFpeEZsZj9Ll8Xy/l/5Dz9tCfFmx2VLA=;
 b=OO7b3PcgjDZzqSR6BvRCJaP26WTWZDvphlyZdpNk0Q6jPuWANlV5b6hKIp69eEcGKVSZfMdSnDCa8aTvXjQh2wYsJ5/VQdbEOjeunGJr9gquk9wOtr9trDnT8WyPuPmeNN0pfMOxROCzLNuYaizDMc5gy8fcOo2L955Sx8xlTRQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU0PR08MB8138.eurprd08.prod.outlook.com (2603:10a6:10:3ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Wed, 19 Feb
 2025 10:16:42 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 10:16:42 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Wed, 19 Feb 2025 11:16:33 +0100
Subject: [PATCH v4 02/11] media: dt-bindings: media: add bindings for
 rockchip px30 vip
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-v6-8-topic-rk3568-vicap-v4-2-e906600ae3b0@wolfvision.net>
References: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
In-Reply-To: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mehdi Djait <mehdi.djait@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739960197; l=4443;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=NsTFkcABzB7Oz4O9mN4hbSE8/lW18X7tv64zaWMvP0c=;
 b=tEjWmYaw9XCfi1mBEFzvx0Z0HEEZcWdbxF5P/5q+NFM6xvyEa1yiqkTb/FxWeGLB4658vt3bg
 kKrV538z0nKAuFc7+zG4ZecJqLe/PfMI/EXvq7GHzwruxEZITjrzeBC
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1P190CA0041.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::8) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU0PR08MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: 895570b1-3002-466f-0479-08dd50ce81b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnFncWV4UHM4V2tUZE9RU1Z5N1JSS0FjaHRYSitLTk5FeEZhYmhyRnhUY2VN?=
 =?utf-8?B?TS9Qa3dpbHBkVzRpTXFSZGdoS09Ed3BYdHFpVEhQbEtnNFV6eEVybGl0Nmc1?=
 =?utf-8?B?YUFpM3ArL0JRYm9rbnAvcFU1WEpHZzBxRFUxNzluUXBQV3VadFNob1VzZE1n?=
 =?utf-8?B?N284c1ZxZU1OU0Fhd0N2azFDaEw5VXVrNG1iZHh5WWhCanppQnJNNkF3Z2xr?=
 =?utf-8?B?alZ0Q0pyQlNpem8xYjVuZ01IallJUDVYUjQ4ejE0OExFc1p1cnI5ekEzOW53?=
 =?utf-8?B?UkNqbjBFZkpEcU9MelNpTXpOdUZaM1RtY0x0RTNURDFhYXN3bVpvK0FpNEV1?=
 =?utf-8?B?ZzhMc0Rkdk1vZEcrc1V2S2EwcUV3ZXh0UDhzTFpSMTZTb2F3b28yZXNPWEYy?=
 =?utf-8?B?VEFjWXdiM2h0OGJOdElqR3U4QWdDckhRdUsyUWlmTmNmUG05aTl5MCtzRnMy?=
 =?utf-8?B?WXIzUW1BbDR2VGNBL0ZrTVlYQUNLSkwzTlNGaCtncytydVowc3J1ZGZ3RE5R?=
 =?utf-8?B?S0pJVERoNGQ5RUN2eE81M3lLRlRWc3VEUnRlN2Z4NCtuUmJyMEhSNi8yeDdZ?=
 =?utf-8?B?dlhXNXo1TllnYllyVHAvYkNKMjMyS2pJSUFNRlBLVmNHVk5SdFB5M2lobzVl?=
 =?utf-8?B?MHBVTlcwQ0xvOGRGNE5RUEdrQWpKNUMxb0xQajBpUzJPV200Q2RNRWsrMnFl?=
 =?utf-8?B?azdML3oyampJQ1FuMmlpY2lzV2cxaFJNUGQ1MkNWVDYwWE1ITTcxMEN6Q1Vk?=
 =?utf-8?B?OEJSdDdUUEhhOThsYWNoNHplMXl4cVZxTGlRV1REa0hwTmg1QlZqT0NLZmVM?=
 =?utf-8?B?NUYzeENxQW1YeXhNUVZ3dHVodEFIUFY1bU81U0QyZGx6NVpvUXpvUERacm0x?=
 =?utf-8?B?dml6OWN3SC9Yajl2K0JpdFFzMVdVM1hOUjZQT1l3dDJMQm96MFNlSVpyNFl2?=
 =?utf-8?B?MHhDWlZFUW9JbWFBVkRhYXZ1alRGWmpnUTFZNlpzbW8xVjdzYzQzak1BQXI5?=
 =?utf-8?B?bFBuUE5HeE93b1dEd1dMUmNjTGRITUw0MXhYQ2V4T2FWRFFmS2RCZ25Ud3dU?=
 =?utf-8?B?ajJIdDV1L2psS1FTOVJFT1FIcWxxNVFaSFNnZkxjclI3QXpVNloxMG40RWZi?=
 =?utf-8?B?cDQwUTRER1cwWm5DTEVDZ3NOU21PZG9CYWVmT2tuaktMWTJ4UUJBSUIyZkNv?=
 =?utf-8?B?ZVA5YXUxREJpaTh6TXFQUmtWWmRSeGNmVzhualVSNEkyT3ZPenRXNm84UEp4?=
 =?utf-8?B?dWtnNHMwNENOazZzbTBRWHU4ZUVvdEZLcytlRWpuL1Z3cHQzQkgxeDQra1hi?=
 =?utf-8?B?YlhNRHFhR3hUTXZZN1ZoeGRGbStDLytQQy9XMVptRm9aOHhZVzlGcHQ4ZnNK?=
 =?utf-8?B?eVVYeFBPa3lZTWswNDN2UTY4TWNjVUt4T2MrK3FLRTZxbm91TnFpaTBnK2hN?=
 =?utf-8?B?WkVOaE1HNjltL3YxTFFDWXBjNHIvVGtLMytnZWJkU1A4UmhxZTAzS29hQmNB?=
 =?utf-8?B?amFUeFFLN2JiVTQ0Y0hsbzRwQU5ITUROTVNrVXNhc1RsOWk0MkhzS3dvYnhB?=
 =?utf-8?B?ZXZrTURoNEFIeTgvMHVhYWEzMlRNeVZCSzBXeG0vYXRmb0FJQXJRWTVYOVVk?=
 =?utf-8?B?SVR5VWtBSzVyWWtmRVZFK0JicXJrUFpGN1VQSXM3Z3ZkNDVYUFRWeURGeGNm?=
 =?utf-8?B?R0llQkpDcmxjcHhnQzBieHF2dUNrODJuNy9wVktSeG9qRE5DR0pJUEtEOGdS?=
 =?utf-8?B?OHlLamozcCtsb2JzOFUwa25PR3RHdWs1bkNnbDRSNDJzcHEzYittTjBFYzdX?=
 =?utf-8?B?VklsUWg4NEFpWUdSZDFKeFc2MTM5MnFIczdvVlBPejR2b1V3NCtwakFUemlE?=
 =?utf-8?B?dlN6bmVreldrM1BMTUdVTWFwRmtic0haOVA3Rm0rbzZXOEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmwyVVFkNU5ncVBZRGhVM3ViaC9QTjI1dCtuM1pkTzgzTzVWV01KVGYyZEdp?=
 =?utf-8?B?bjIxQit2TXRkc2dCZVZiZjJQZElMaE1FRGpaYkxYZTl1UHNZeUErY2hDM3dU?=
 =?utf-8?B?bk1MSWtxdDM1TmNpRC9BSjBNbFg2clA3T3RRNlJXaDZmcFBqblAzRHFVZnVS?=
 =?utf-8?B?VDBPYnk2akhWS2szSEZyYW8zaHRZQ1RQVDBHL0EyWTdySnc2RUEzaDVibkx5?=
 =?utf-8?B?RWxTbkZRRERiaURFdnhxWEFnWmRZV1hMSkJjdjBzVWtsa3lqTUR6S1I1WFFs?=
 =?utf-8?B?cnROQXFXNGVSa2Rkb0N6dHoxbUdaYkFTdmF0ajdNYmhaQktIU1dHVW9ha0JQ?=
 =?utf-8?B?ZjkzRHJZRWFTYmVXend0U0lDdjJ4Q2JDVFdMRFc4NElFYkltVHJpRFJ1MG4r?=
 =?utf-8?B?ZDdWTTM2QWtqaStQbEJJcFpPdkdNbElDMVQyd0lMME03N1F4NWt4dDQzMlov?=
 =?utf-8?B?Q3RCeElIbVJaQU5QT09WUkNvZmlLNVQ5M1p4dTZGZ2ZTdkJoNmgvN1ZrV2lX?=
 =?utf-8?B?dW5uKzE4bTNySndGZ1lJZFJVQ2Y3aVFlZnZ1VGZ6RXp4YUhXeGE5N3dsUXhI?=
 =?utf-8?B?L0dlU0NNdkNUck12eG1SWHY4MXptRCs2emtsOTZhOWJDenJka3VCdkdIblNB?=
 =?utf-8?B?OERWM1BTVnNPald0TU5HOVcvMGFWU3JOYmZ2ZXIzTWpyLzBlbkV3Q0U5N2Qr?=
 =?utf-8?B?TzJ1ZDZmOE96ZmhPMkMrMmxZT2xRVDIvV0sva0hma0RabUFzcDlyam1yaXZW?=
 =?utf-8?B?QXZrVTRwdVJITlZoV0RFQ1dGRUxUZW9ETmpUNFhiSlpzYjRqZUl5Nk1wckVX?=
 =?utf-8?B?UDgyZkpoRFVPcTlZcU15YUhrd3pVSDRyQ0JjaWhxMTJXTlFvU2kveE5UcFpT?=
 =?utf-8?B?ckFnTUZ6a2gxL1RpdXA0aUw1Qm0rdWVqaE5ORnowb0dacWxzQUQ5Zk9RWUpF?=
 =?utf-8?B?WVA1QlVUSzB5dVhpWE9SM1ROdkhKZ25mS0QyVTdFSm4zM0F3dldoL2wxSHl1?=
 =?utf-8?B?c0VLYUZaT2ZRM1psWk85eXlRVWw4cWplekU4alFtQkVNbGVMaUNHTSs1SkVD?=
 =?utf-8?B?YTJOY3J0b2lINFdwZGVPM1hMVjRySnFjVDZHaHhsYy9iTGI0MWVad1A2UWpX?=
 =?utf-8?B?QU4vMnlvWElMVVZwbWZXa09MSXZIZWRKRzhwQU1HTEpkT3ByQjd3NlpkUk1D?=
 =?utf-8?B?S29BblNCQzJjQ2FMbjZqWlVQQVlUeHJFTkZuNnhpZ1lKaWFGZFVtYUs2dnVk?=
 =?utf-8?B?Tlk3Ui9vQ2R5eVo4NWtxSG1STU0vUC9nRkNxeDhuUWRYbTVZZXhmYlFtMHFi?=
 =?utf-8?B?VEdaRTFxVS9ndXZSS3ZOY2wzQzZ5OXNrSkowcTZTZTN3UDZqRmxhcS9JNUNr?=
 =?utf-8?B?azIyVk95eHpURDIxeTdMeS90NTBxQ2ZQWk14L3gvZlI4R2xsMHNBaTk5UHRB?=
 =?utf-8?B?Ry9qYmN0eVB6QU05V29TQ3dxNUJVdVVRVGVNYmNFaU1lUDl3ODJ0Q0QwSGlq?=
 =?utf-8?B?cDVEdTg4eEVZQ2xJdW91YlF5WkovS042V2wzTmJzUnRjQjRaTWxUaUh4STF6?=
 =?utf-8?B?aVNobUNMNzVYRXR4RlVNS3A3dEhCTXBNNi8ySnNxNzl6TzQ3a2pNeFVxcWJK?=
 =?utf-8?B?QlJxWkthWFFSR3hyaitjNzV5bnRVY05ZZk9IaFhUcUQ2dU9oWkVYRUhNRVNW?=
 =?utf-8?B?amlVYXpZelR6WklVNlloUDJZZEpFMkF0WjhsUWtyVm83NW85UkVYVmtJREFw?=
 =?utf-8?B?aWRBVzJ4VnptN3dnQ2tDQnZxUHpxVS8rbXlzaFE3ckRac2l5Q3FJc0dJN01y?=
 =?utf-8?B?Si9udk11RGtKQ2dYUjNjRmZxS2NVMEllcXhQS09zZndzRkhwNWczcEZUWHJY?=
 =?utf-8?B?U3dvWDcwRlN2NlREbWs1dkVyaVF2ZS9nUkZoSEhkMzdxTHRrTEllTWtPMTBn?=
 =?utf-8?B?NjFSc25ydXdPWjhURnFiNm5tMWZqQ0Z0enRLQ1ViNXpHNUh2bytVY3ZlUVhu?=
 =?utf-8?B?YXVOMmxUZXpvdXlaaEFVc1lRdXBJZkVWUi9sakxCRkhuN3VxRVA3OXpvRzNl?=
 =?utf-8?B?bkZEY3FwejRVTEVHQ1dmRnltVmNOcmZ3KytZeGRVeG8zVDlaT0R1b0o3RXda?=
 =?utf-8?B?SjVhc0pxa2dTWndCdTVOY2NmMjRIanhPa1kxVWM0c0NvWWdweW9PTHFGUWxr?=
 =?utf-8?B?Qmc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 895570b1-3002-466f-0479-08dd50ce81b8
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 10:16:42.7639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYq2l3RfeEIeUPPxAGPI5QMshctrvx0Sm2BlCBpvic05JRft/5j9zj9LZzc9ONFVjugL79Z7Jedh8XEzwFDK+p78vJ/4HeNIJEBvT6oJvko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8138

From: Mehdi Djait <mehdi.djait@bootlin.com>

Add documentation for the Rockchip PX30 Video Input Processor (VIP).

Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
[revised description]
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../bindings/media/rockchip,px30-vip.yaml          | 123 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml b/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
new file mode 100644
index 000000000000..d34c0974204f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,px30-vip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip PX30 Video Input Processor (VIP)
+
+maintainers:
+  - Mehdi Djait <mehdi.djait@linux.intel.com>
+  - Michael Riesch <michael.riesch@wolfvision.net>
+
+description:
+  The Rockchip PX30 Video Input Processor (VIP) receives the data from a camera
+  sensor or CCIR656 encoder and transfers it into system main memory by AXI bus.
+
+properties:
+  compatible:
+    const: rockchip,px30-vip
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ACLK
+      - description: HCLK
+      - description: PCLK
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: pclk
+
+  resets:
+    items:
+      - description: AXI
+      - description: AHB
+      - description: PCLK IN
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: pclkin
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: input port on the parallel interface
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                enum: [5, 6]
+
+            required:
+              - bus-type
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/px30-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/power/px30-power.h>
+
+    parent {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        video-capture@ff490000 {
+            compatible = "rockchip,px30-vip";
+            reg = <0x0 0xff490000 0x0 0x200>;
+            interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
+            clock-names = "aclk", "hclk", "pclk";
+            power-domains = <&power PX30_PD_VI>;
+            resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
+            reset-names = "axi", "ahb", "pclkin";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    cif_in: endpoint {
+                        remote-endpoint = <&tw9900_out>;
+                        bus-type = <MEDIA_BUS_TYPE_BT656>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..bbfaf35d50c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20401,6 +20401,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
 F:	drivers/net/can/rockchip/
 
+ROCKCHIP CIF DRIVER
+M:	Mehdi Djait <mehdi.djait@linux.intel.com>
+M:	Michael Riesch <michael.riesch@wolfvision.net>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
+
 ROCKCHIP CRYPTO DRIVERS
 M:	Corentin Labbe <clabbe@baylibre.com>
 L:	linux-crypto@vger.kernel.org

-- 
2.34.1


