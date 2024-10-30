Return-Path: <linux-media+bounces-20569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEFD9B5EC1
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 10:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA54F1F220FF
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 09:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6019A1E200F;
	Wed, 30 Oct 2024 09:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nIIM3Aqa"
X-Original-To: linux-media@vger.Kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010001.outbound.protection.outlook.com [52.101.69.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B48B192D79
	for <linux-media@vger.Kernel.org>; Wed, 30 Oct 2024 09:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730280161; cv=fail; b=Ix8tQFivKCpi1p87YIxncA5ttujOJAnMio4Nn2iRMGHfdlAEqKn3bGu3lSVvwbgEqCbndFHXV5rA/MPcQAEBfSdInYoAa8cuNxL9UgvvdbiLmz+h0kZ3LCgSStx+o5kWJqV3TfI4fdJ7BW2bgRypzu2ggS8HXS6AlqIuHMJWYbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730280161; c=relaxed/simple;
	bh=wYpgSkPQjg6Rd7UIZ/bgErvvr1l+zZRrLow9oSS1NmY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PxWZKT0Nx2Mh+tb2dcSH6j0c4cn/uAkj0/G1TRxkJvGieWWMmUjT1i2bz+c/Lg4qV5/+JkENeT/ji59pFtSC2YIcjIqRirxHMbO/lRJ/BpuqsOiDfkHGZI4iR0JzZIQu8gINn6HAoCQ2eGmBMh78okVDFCVfJU+y7IQ7VVAoOWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nIIM3Aqa; arc=fail smtp.client-ip=52.101.69.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twJTuv0CaSQNedBKluA4Rg6EeX812xiuGvZV5/Z/rC2rPOGRdr7VMi/aq9PG2JXjPct2lvIyDn5V+WVUVd1hKXyQdWRxh6Z0iCRARysR2DBAs7fT7+Sx+RjYUneSk8BzjTp1s26u7n4Zr9JOy6HnV/72zus1WdSsCkS4EMVvRheTL6WTpHvas5JC3BDXIny8eE7lppLppn/UIz8HPjL57t7gZIn0IgePV8sin6X4GzNVQLtLK9IFARlR6r1Nlu2u+pmr6Jv8M6Y62is+FVBLK7euM8O3NGpHxZXArbL1fQg1XBKCZ0QEXO/hw9rIe0eK1mkTJCvXdXMjGlwBE53O2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiP8aJljAOt8UAl/ZpFJhd1v+yWx76ckh7tzS7IcnB4=;
 b=cz6dZKEnI42ghkSE3eOf3nqblwgJj+FcGVpQCezbgszyADxbh/zpwphd2aFWqzctqBMRWGLUfojvqkFD4H5Ao2Gb1nIDvRFwyA3ftimxhdp54lGSoeGrYxSS1G+QBi09g4rgHhErFkoiDaotuD0WE5kd1g7iqcpySw/lHySpYu0FoJSQg/s+GaAxIPQgQ0zD+wXhS0hQhxxMaX0Yhm8e/0VQSrsQIa+beWNOIDBeSakbJz2A8Nx8YPyO1HOp0NHlCg0oyePpjuwiOUReq6UcJi30Abcab9rHbcno1Du3VBKqNRhfquVqTWUiVbQ5gF/dQYZNmtfgVSFBIPcUg2yidA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiP8aJljAOt8UAl/ZpFJhd1v+yWx76ckh7tzS7IcnB4=;
 b=nIIM3AqamKuj/1AsSEJ+r2iYUHgiZR/yVDlFnqxA9EkMkQ9e/1UVI1S3yIKo6znuJikTfEwhmtz3fxazVvpU8uX+O+RuNHLrw2ANEq9Rl+gBlUG0LXRZs/3wf2hHeInzC9T0H5zYpnWnGQcVQexJ2I3K3iS/+HdRp8IG++52QKQeIJlfAokfZocNEiuOu0o5UdaAKd5d0gqX+xW5iS3iYV6b2u1bTYVT/Jrh2prmiaBNXKVQ2XjqAY9ObN0X0xNhJU2qtdCm54iyltRGUxQYIWxiKzEf87XanUdt7ym7vXgCVXwpNCNLPbL+evzRDeswMHoi6X18SDGellD1btrX/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB7848.eurprd04.prod.outlook.com (2603:10a6:20b:288::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Wed, 30 Oct
 2024 09:22:35 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 09:22:35 +0000
Message-ID: <b67036cf-52ca-4e1d-a5c4-522af261ff93@oss.nxp.com>
Date: Wed, 30 Oct 2024 17:22:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.Kernel.org, tfiga@chromium.org, ribalda@chromium.org,
 yunkec@google.com, xiahong.bao@nxp.com, ming.zhou@nxp.com,
 eagle.zhou@nxp.com, tao.jiang_2@nxp.com, ming.qian@nxp.com
References: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
 <20241030024307.1114787-3-ming.qian@oss.nxp.com>
 <20241030090330.GS22600@pendragon.ideasonboard.com>
 <12913e54-9343-42ab-ab1e-a33656e640af@xs4all.nl>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <12913e54-9343-42ab-ab1e-a33656e640af@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d48b05-7a7b-4a52-e506-08dcf8c463ba
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?emV0SGl6TS9ST3RMd1U2dGx0dW9CTzdBM0xKOVJ1WGN2WHZGK0pITlI3TnVJ?=
 =?utf-8?B?bzYrT29pS2JSZ3VEWUplcUVhcGFqQWNGc3VIQWVPaVZzQk1BRlBEZlAxb3V2?=
 =?utf-8?B?Q1RrcFpFczVvUjdBblJPWFRHY1lpR0VkMW4vUmh0SWZROWJMdGphTk5ySVlK?=
 =?utf-8?B?WUloOW9GMFB1eE92Q3pSTnFyeUFQRG95RTlvQjR0eHczcER6U0l4YlVaU0Qr?=
 =?utf-8?B?aWk1NnBqNzFxWXM3UXlIeG8xdmpSWS9PVjN3bUl0b1l3TjNvRVZQUGpsNm5Z?=
 =?utf-8?B?U3R6OXFVWkkrMGkzZnJOVEdHWWZCNmczQ25SUEMyU1BrQW90dEJxWGhQUHN2?=
 =?utf-8?B?R3dSNUZUOGpTcWR5NjF6eW1FL05oQXkvSW14eVpXdXNqcXZrMkFjTjk4ZGRt?=
 =?utf-8?B?dzdqTmNpWWpSTVp4aDR6WXN2c0RPaXVnSm9PWG9PS0ZaTzVIWHR1RWNZbHNI?=
 =?utf-8?B?ZytkS3BZOUdGVFJBV0p2alVudzJCNE5wNmRXRnljYk9wZDZVSVhWbEhlN3VG?=
 =?utf-8?B?ZDdUaEl5S05PWkRlTGtzRGNPVXg1UFhFaUVKMy9EUk5sM3VXdVlkNTZMeTRK?=
 =?utf-8?B?MUtEY3ZWWGlmalZucVpSbnQxMWdObDdQRTg4QWEyYzR1MExUY1VmSGdPNEhW?=
 =?utf-8?B?Z3AybVBiT01LOXdWeHVsdHpSelpUY1ExbkcvcnNXbjkxQXB2b3hOSjRJUmZN?=
 =?utf-8?B?RHpMcitjWEdDVjc0aDRXN1JXSVd3UFRJMkdyUkZZZHhVeDFseC9OZ1ZZT0pw?=
 =?utf-8?B?S3p6OHVJUmk2bklFNXR3WG9QdHJpZXhHWHZMTUhBVkR2UUFnNHdvc1ZrdFRV?=
 =?utf-8?B?YU9xWTQyVmhVNU9oQnJYZStSbkdZUVF4M2k5c3laRktYWS9mSk1hYW1rRkIy?=
 =?utf-8?B?MCs3OUE0MitFMEQvTlRGOUFBbmZ0VDI0WkVpbVlXQk16Sk16alBrRzdLVTUx?=
 =?utf-8?B?cTdVM0xsOFVRcjYzTjV1RmNZL3VvNTM2ZEJjL0RrS25mZXBzUDluV0pEWFlR?=
 =?utf-8?B?S3daQ3Y4amVkWUorVWRCV0F5NU50Y21iUW54dm1yMnFvUitTbTBOS1VONUtr?=
 =?utf-8?B?K0c2WE1Sdy9Tcm80YklJVEVQQURRZVpOTUV0SlZ0a2Z2K3ZhUkJsUlJrYlZG?=
 =?utf-8?B?ZGU5VlZhRlBWU1lMckZxa2NXTVYrSzd0T3E2b1pKNnVIVG13UEhYVDZobGN5?=
 =?utf-8?B?K3NoT2ViSjZmQ1FXWXl2YXFWRXZac0cwQUxucGdxRUNJNmE2N0RwajYzNUg5?=
 =?utf-8?B?OHlobmhWNFk2K21nd2NHQVdueUQrRldiUmZ6Q01XY3ozd1g5RWpjSjIzMkhr?=
 =?utf-8?B?cjZKbzZKMEFqczJvTzM3Q3FxZG9WSlo0dElabENyL2hQWWpQNTdKaU9WWXZt?=
 =?utf-8?B?d0hyYnVBdjBSZFBqVWVRRzdpN284TEJ1Nm9yYnR2OHlGaGpYN01Va1BQWFha?=
 =?utf-8?B?YzNYTWxuc2Fnbi9OajlUODNlNndEM21IY2E4cENHbFRYdnJnUkxQNG9pKzh1?=
 =?utf-8?B?RHdLUm9vSEJ6WDJpSm1Sb2FwcU80VVBZZmlpTlEyOHFOWGVBUXZGcEg3cm00?=
 =?utf-8?B?QzUvYktYM3cwSW4rUTA5a0t1N1JWZXVsUXRCTlRmMEpYOXJNdUMxVTRZMlRp?=
 =?utf-8?B?VUkxWWx5SmxOUVhXWm5xZ2NLOWRTTDZZNU9ralFnc3BLQXlMUjBlRC9Rc1R4?=
 =?utf-8?B?MzM4SU5lRGlDWkxieHRFSnFJTUorRFBjZVFPOEkyeFQ0U0ZNZXQ4Z3d1V1ZS?=
 =?utf-8?Q?rpgle0XOtfmexVJPYVr+wbMQ1HD8gGmo32AzlCz?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?S3hIM2JxYkw4WEgrOTB6Yk1GSlA0dFRoMjI4ZzBHTXN3Z1puMzBJZ2JSSU9k?=
 =?utf-8?B?aTFTV0ppZE1GN3ZRQmF2NVRSRFhUV2dKYzEyVGZ4UDJMT28rd1J6a0krc0pH?=
 =?utf-8?B?TUlLYnBMeEVUUXhEcXYzejdvc2EvOW1wZWluL0txbUdTY1poUmxTdXhscWVa?=
 =?utf-8?B?a1Z6c1g4REJ3QndKNERRRmhldXJCSjY3VnN1WG02QitVRFpvV3ZzaDhmZUdV?=
 =?utf-8?B?dGxEMHRMSFpzVXdNNkZzOFVDd3N5dXc1QlFJa1Y2elBkbkV6b0NhbmMzWjUv?=
 =?utf-8?B?RWsvTUljOFR6a3h0UTZja0kxODlMMHZoNFprVGVleXRtcWZmRHhEYkdwa2xG?=
 =?utf-8?B?TzZHUCsvK2tqTTY2bmZPdkdRRnVzVThtMERMZXh3VUQ4U2MwZUlxLzE4N2s2?=
 =?utf-8?B?bGFDM20zL1RKR0lSSENRcUYvM2dWNHNUNHBodW1MTWhYWDdDMkhvTUphT21Q?=
 =?utf-8?B?K0t4UVQzSjNjY2d5TXUyZ2NXaG4vaE1GaHRuN2VvQ1JGWU15WGRmdC9naGZw?=
 =?utf-8?B?WkJVb3MwZXZ0d0kxWHY2TjM1ZnVHZlZ5dzN4WTZHQXJoRjNicUJFSVB4cHF1?=
 =?utf-8?B?emhGaHZBQ0x5OTdNRFE5eU1hWjdkVDNaWGNMU1ppQWZ1REZjNzhUM0FCazVG?=
 =?utf-8?B?UFFvcEM5NndXNjJvTElaMkNBS0lzY2lVTHNYN1RMRk5yY2k0eTNXcitQZ00x?=
 =?utf-8?B?WXR3SXY2MmgyV3c2dHZaOFRJaEJhaDloL1RTMzJ3TjJBOCtySUlWMTdkbjZE?=
 =?utf-8?B?anRnZmtzdXk5bXlwWC8ySkZLVld3ckg1RnVsVlpyV2duYngyNXdsckREK3BF?=
 =?utf-8?B?aXN6dlhaVkJOOEhlanRsR1RoN1UxRUozQnV5NUU2SkVFTlA1VVdoaWltMGZq?=
 =?utf-8?B?Tm1EQ09Ka1hTbS9DRHVGdDFkWnBZS0cyVDVzWGVzc3EyWFJKVW5zVSs5dGZH?=
 =?utf-8?B?STVuWGF1MHFrYTJNekFoOFE1YkdtOE9uSmhlM1ZSSGNKbjhUTU5RRStLMWln?=
 =?utf-8?B?V2g2SDlLc3IxYmRjdEhyZDl1bFdGVVNwcCtSdUM5S3N5Qkgra2Q4VW85WWpN?=
 =?utf-8?B?VUxKSVVPTjJuczhsV2FncFZxU3g1MTRkd2hlSGZGK2lUcDVTemRZbUk2WmI0?=
 =?utf-8?B?UE4vRkJIa1I0TVZJSytQZS9GRktxcmIrOVVXMzVuYmVKTGhSdHZWOVB2WDQ2?=
 =?utf-8?B?YjI5QW54ZnMrWVBSbjJDRlVndjlFMDI0MlRpKzQ0aSt3NjBkcmtwelpVSlBu?=
 =?utf-8?B?K1A3L2NRbzlIWGdMZmgvcVB0SVc1OS9xWW44bVlJMk0xZ1J6RitHNm5qdEY3?=
 =?utf-8?B?QXdzZzN0aFJlOFpVV29XeE13ZG14MDV6KzhYSTYydW9QeWNodGhLRUFPN29o?=
 =?utf-8?B?RU1xdkJaQlZNZGcrR01XZmxybHZmVi9YY0NVaHpydzBsQ01ZbVV2SU9NbzhC?=
 =?utf-8?B?WFo2NVprS3lGcTFlVDRoTTV4MWxFVTJ0TFNxUExvTmtrbUZuZXV0azhIdnJW?=
 =?utf-8?B?UG15THdVQWQvS0k0aXNyek4xQlg1a05aOFpKQ3B0OXpkQjBSc3A0L3dUMW54?=
 =?utf-8?B?K1RYVEIrQStYY3c1bkE0YUlKZlA0N3JRL0ZjRnVOck8zTXRLdUV1aXAwWmxV?=
 =?utf-8?B?MXUwdUxPeHgralRMZFFIdDZrWE5OTXZSc01HVDNlbEw0R3oyVnkzTVg4ZGJP?=
 =?utf-8?B?RGNvdXZUendMOGFNcDNzN3pzOEREM3VaTEtpRzArRit2TW9McDJvTUQ5ZS81?=
 =?utf-8?B?Z1drWmp4SGJhVHp3d2NOd0IzbGtMQ3VSYmhCNXJ1NU1OVTBXUTFMdHl3V1BJ?=
 =?utf-8?B?Rm1hbzdiMFplbkVsNVZYSFppQmxGaUlvUFFuQmNGQmVTTVNFZVBsMlVZWjBq?=
 =?utf-8?B?dFZ2RldBbk5XYlF4MWQwakxiQlhadjlvd1lnc3NlUEJpM3VhZ25ldFJvZmJH?=
 =?utf-8?B?RlN5Si9FVG5jWnBYNml0U0t4elBtOW9tZCtCU2xJOVRzc0pUa2ZicFhaS3dC?=
 =?utf-8?B?WUwxMm1vUi9URVhtRGphSWxSZjJWNGxCancrSUIyQmRTYzlEdXNwRVVvNmFS?=
 =?utf-8?B?MUlCN0c0N3NKZDE1TlI1ekNML2F5a3pFYWZDVUw1aHZ4c0x5UmwwL3FxamNT?=
 =?utf-8?Q?QD+fGZjm4yhxhpg0B2uzxOBNl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d48b05-7a7b-4a52-e506-08dcf8c463ba
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 09:22:35.3310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fldLWsRbkGe1tfZblBtWl0Av8NnJc0tHYiHDLr5UJ5+2wZja+cQb3VZQRfO2gtcW2cDoBMF7UX1xh9rJvdeL2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7848



On 2024/10/30 17:19, Hans Verkuil wrote:
> On 30/10/2024 10:03, Laurent Pinchart wrote:
>> On Wed, Oct 30, 2024 at 11:43:06AM +0900, ming.qian@oss.nxp.com wrote:
>>> From: Yunke Cao <yunkec@google.com>
>>>
>>> Tested with VIVID
>>>
>>>   ./v4l2-ctl -C rect -d 0
>>> rect: 300x400@200x100
>>>
>>>   ./v4l2-ctl -c rect=1000x2000@0x0
>>>   ./v4l2-ctl -C rect -d 0
>>> rect: 1000x2000@0x0
>>>
>>> Signed-off-by: Yunke Cao <yunkec@google.com>
>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>> ---
>>>   utils/v4l2-ctl/v4l2-ctl-common.cpp | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>> index 40667575fcc7..538e1951cf81 100644
>>> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>> @@ -614,6 +614,10 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
>>>   		case V4L2_CTRL_TYPE_AREA:
>>>   			printf("%dx%d", ctrl.p_area->width, ctrl.p_area->height);
>>>   			break;
>>> +		case V4L2_CTRL_TYPE_RECT:
>>> +			printf("%ux%u@%dx%d", ctrl.p_rect->width, ctrl.p_rect->height,
>>
>> I find this notation ambiguous, it's not immediately clear when reading
>> 10x10@20x20 if we're looking at a 10x10 rectangle positioned at (20,20)
>> or the other way around. media-ctl use (20,20)/10x10 which I think would
>> be a better notation.
> 
> Good point, I agree.
> 
> Ming Qian, can you also update patch 1/4 of the kernel patch series to
> use the same formatting when logging the V4L2_CTRL_TYPE_RECT value?
> 
> Regards,
> 
> 	Hans

Yes, I will

> 
>>
>>> +			       ctrl.p_rect->left, ctrl.p_rect->top);
>>> +			break;
>>>   		default:
>>>   			printf("unsupported payload type");
>>>   			break;
>>> @@ -702,6 +706,9 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
>>>   	case V4L2_CTRL_TYPE_AREA:
>>>   		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
>>>   		break;
>>> +	case V4L2_CTRL_TYPE_RECT:
>>> +		printf("%31s %#8.8x (rect)   :", s.c_str(), qc.id);
>>> +		break;
>>>   	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>>>   		printf("%31s %#8.8x (hdr10-cll-info):", s.c_str(), qc.id);
>>>   		break;
>>> @@ -1279,6 +1286,11 @@ void common_set(cv4l_fd &_fd)
>>>   					sscanf(set_ctrl.second.c_str(), "%ux%u",
>>>   					       &ctrl.p_area->width, &ctrl.p_area->height);
>>>   					break;
>>> +				case V4L2_CTRL_TYPE_RECT:
>>> +					sscanf(set_ctrl.second.c_str(), "%ux%u@%dx%d",
>>> +					       &ctrl.p_rect->width, &ctrl.p_rect->height,
>>> +					       &ctrl.p_rect->left, &ctrl.p_rect->top);
>>> +					break;
>>>   				default:
>>>   					fprintf(stderr, "%s: unsupported payload type\n",
>>>   							qc.name);
>>
> 

