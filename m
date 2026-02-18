Return-Path: <linux-media+bounces-53049-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBpaOHK+lWkfUgIAu9opvQ
	(envelope-from <linux-media+bounces-53049-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 14:28:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A36B156A2B
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 14:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D4793054CBF
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 13:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD2A2D6E41;
	Wed, 18 Feb 2026 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bdqldN5M"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD902D12ED;
	Wed, 18 Feb 2026 13:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421199; cv=fail; b=X7N7PFo9PdnVyMT0UxGDx49gBIej4YIIvo8igwP2TKj5TdDXxralUXfHJ0Cjk4UNDteOfvXSiygeWxackXsdn6J6v5eh/0oWj9N4bHuhNyYfYA+dYGf0ZmlCKtIUU1xdBAwsJIUG/cvY6cAzj5TvjkU52q2oFoO+zNOuOXOTBPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421199; c=relaxed/simple;
	bh=cq7Dbx7SIWdZRzFUmdGHWehw5IxivATMS0cBEDh3oSw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MrRsRX5J9nJ42OGiKiky4451zRXW+V8zT6fv9faRgf2aSVxrffyGz/AhIsNbUR7gri/A6lwL0u5PoAbMOiw3zWnkE6fctO76m+CRmbXHEI3hnp4vuZ9b5i4Ozbz0znVLDzV+sjSef13uWGP6NZ/ek35Uf/IWhr09IseJQa6cAyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bdqldN5M; arc=fail smtp.client-ip=52.101.69.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4l7DoHedgpO8a1DdmDHalhmaSVxqk/O2Vfli9VkC3Zfe1WoEz2nGL8gUCVjNhsB3AwISW0oib44O4R47khN6E8o1YEgBQQPlc+OcrEtWmKgpn0P1DWWRv7xcccko9d3P4rLbZ67sITNzjABW0BkSf8P6QRThKBzilwgQwNCDkNuhNFup24iUfHoUxJVYkifpvXgNbvcKrp/0IsUXVD58drVdblfm7Vy6IyH8xKDWKnJjHcTd9D9c7VwT8nrcpRftf6X22nN6643onzg98PfS6hQxarh9GOw60Z5TY1cCfIFfOWSFpjQJLxWAY9x+Gn4KNuLBRE3ECFqe3ioI1r1MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIOlmSLfyHWMJkwBsoXNcXaV0rpEOPIoUUE8evAgFW8=;
 b=tLVb15c5X42Ntg/GxZ6b4fcFTlwY5MTFgX+fK147L/GJMhbULzGCcV+Qu6ZI6m9YicAmuCxmVye9oVXu3kPdSolmr0e+C+oSwxSpXFKKf+nzAho+zhIFgppodDV5E96B3JsaiODyz6HhRuWWlEC6IFIPC6D5lMYQGRPUMkEwTFmO4e1wzncAqjG6r7S7ria/PEN3kk2DO75PeHyjvE3IlT7ottEGjoiYvcMP6zA6f7Xxvllaio2UuBTcDPlNSpXe1UuYz4h0O8kVPXvbCabSChkwwX+eBl3nn6kTEK8X1OGF94xxEm46p2Nn24ENVrHppPpic91vcTWvyIDgz1ev7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIOlmSLfyHWMJkwBsoXNcXaV0rpEOPIoUUE8evAgFW8=;
 b=bdqldN5Mxsv1dXayNOJlp3kNILSRxuclGDx88ktpBPCTlfzuGTd7DDTbEpEmRSnamAZ49M3EfzCn941VGhqpRx1MmVVh1Yr8oT370jizAS5B+TTkKUWHCXIT37t90Ny9aTnQQHjAwS8yLpXdptTmjjq3WVSQTCEuu8OgMAusxzl79QU/L5sRt4YZjJo++jB5E7twrvhGMQXsAJgcnmI5uNH6VyjpnAzFdo1fpsYHYH4t/XqapFgUaTZAQjUublKMOhl/V8ZrQdVQQJotYl+PY/iT49d5virEZ7VUNSKVdHUtzE8OOrrJjN4FrdCFgRElmiD+MH/3l3huodEFTgzdjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by DU0PR04MB9586.eurprd04.prod.outlook.com (2603:10a6:10:31e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 13:26:33 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 13:26:33 +0000
Message-ID: <e9c214be-840a-43fe-b24d-610fe90269b2@oss.nxp.com>
Date: Wed, 18 Feb 2026 15:26:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] dt-bindings: serial: fsl-linflexuart: add clock
 input properties
To: Krzysztof Kozlowski <krzk@kernel.org>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 chester62515@gmail.com, cosmin.stoica@nxp.com, adrian.nitu@freescale.com,
 stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com, aruizrui@redhat.com,
 eballetb@redhat.com, echanude@redhat.com, jkangas@redhat.com,
 Radu Pirea <radu-nicolae.pirea@nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
 <20260216150205.212318-9-larisa.grigore@oss.nxp.com>
 <24443e02-886e-48e2-911e-e4093d251155@kernel.org>
Content-Language: en-US
From: Larisa Ileana Grigore <larisa.grigore@oss.nxp.com>
In-Reply-To: <24443e02-886e-48e2-911e-e4093d251155@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0008.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::13) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|DU0PR04MB9586:EE_
X-MS-Office365-Filtering-Correlation-Id: 10efdcc7-203f-4a48-9633-08de6ef15525
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2ZaWHhWKzlxdmRrVXdWRWFHS0J0UDBJVS9TL3pGZWhBOFZwYzMrYWRoQzMr?=
 =?utf-8?B?SnF2ZFZpQkgrMnpnYk56QU1CWGN3YUo0Smlyemw0WFg5RlkwMDUxcUJxaWdj?=
 =?utf-8?B?K0V4QVRMYnBvdFlMaTQ1SnVLMTZuZDJjcjRUS3pZalVrQVI2Q3RtcmpuckNx?=
 =?utf-8?B?QXdQTUVEYUxUMmZxL01HeDk5cjdkQjNiSytnVlpIZnREODNSdGltYjJiYWd0?=
 =?utf-8?B?MHdDUktYNjhqTTdXR21nR1I2UlFiMjhBekVmS3NZWStGUTFrOFpBTlRsa2N5?=
 =?utf-8?B?UHBOaTRWZXRMRTAySVl2dm5wMytzNWpUTXpsVkQzUXRWWUxsWkFJbWpwSjJx?=
 =?utf-8?B?UFNvMXlLc1JMaHd0L28zZWxHQTN3dHBacTRXM2dpL3FMWWFJUjgvaWp6M3ZB?=
 =?utf-8?B?Tm1UQkppYjNZakVCeFVpVUozMG1ad2ZicmR0SDNWWmIzN2lHNkE1V2Vwb2FH?=
 =?utf-8?B?SWFEKzRGOTVUUmJLQkFDV2dub1docHlNQlozc0V2VmZYemVxcW9KNEdWUEds?=
 =?utf-8?B?cHJRbllBSmZXa1MvMUd0ckxPOWFlenVtYmI0YjZLSkdNQlQzRkJ6UFAzL0g4?=
 =?utf-8?B?dmF2a0tVMGVLNFRqR0pVWEhtTzVadloxSkh4bVptenIyV2xoRUI4Z3N3cFV0?=
 =?utf-8?B?T3d3ZlFVcDRpQlFhejV3RkQ3eGQ3VjBIaHZIQkcxVVBLK0pCZ2JTb25DdTRV?=
 =?utf-8?B?MWgvWkpGNUFaMVdpSkRIUUtWZnI3V1Avd2p5L0ZobklOeVAvVXF4d3lRN3ZI?=
 =?utf-8?B?eDl5dFpsOTQxK0FxZ1d5UEs4bzY0Ulo4ekJWVXFQbWYxRGxUcUxBVElDS00x?=
 =?utf-8?B?bjNobkJ6a2FGUTdKWEhoMHd1YkluaVFuTGt3dlB3N1h5THFQUk9MMXdkMnNX?=
 =?utf-8?B?WW8vTVB6dFdVd0x2Y1dsTTY5RGJDeGJJMGFaeXd5MStIUWNYTm9VUlpBNnJO?=
 =?utf-8?B?SzFvNGp5aG5zK012ejJUMFlJY2hHMFU1YkR1UDV3Umd5aWhVZXN3bzUxQTUw?=
 =?utf-8?B?cVBzUXZObTNqM1h6eXdPZVpUcHNvV3FwZC9PUkgzZ2dSWGJ3eWQ0R0FHOWFw?=
 =?utf-8?B?cDFyQ1BJbmxjRFkrbG1rUVBaclhCWm91QzNyeUhoc1YvQkY1TFFZMVdGK1dx?=
 =?utf-8?B?MkJORU9oSHRVekN6Si84c2UzcVdCa1FwOTc0enRBOXlQbGloWlczL1lLQ1d5?=
 =?utf-8?B?aW8xenhMVzFpWUNNVlFvL28yRkxjeWlHN20vclBqSTdWR1FzR2RZU2pqaVdi?=
 =?utf-8?B?K09LZVZ4SUxUc3hmMFhXUzFsUFNXK3Vxd1BzOVhVUWlMOUpDS3NrYUVGQy84?=
 =?utf-8?B?L3BlRXdydENtQjg2R3hxRlNveit0cHBRd3FUWjhrVzVqOExGblA3R1o0WG03?=
 =?utf-8?B?YWhzOThNR3A4YktvaXAwd2M5NDJhOG5lMkJwTGt5V2FLSG5vU2Urc0FYZkpt?=
 =?utf-8?B?MFYvN3Y3LzdUVE5yaEY2S05vTGZpcmVRV1NsUlE3YWdGQTl0dmc1YUgvR1BD?=
 =?utf-8?B?UVErSDJ1VVJhUFJHN3g0Sk5oOExtTVV0dnlsMHNQazdDTnVxMXhxSDUvQ1RZ?=
 =?utf-8?B?T2VwQmp3K2RHeXdnS3h2NEVZVTNLQ3IxTDZiMkVTMjRkMllYM3hXUDB3NkVw?=
 =?utf-8?B?SVAxSWphK1hiTHk1ZkJRUm9KRTU4ZGRaUlBaSmNwb0s5VEswcUZ4TDViUmQ5?=
 =?utf-8?B?NWdPZUJsWThmcjc0cmFvaDJOS2lMT2lPVkt4cEZjbDRURXlXR0dPSEhRV09x?=
 =?utf-8?B?bW5yWlRKTDAvZXNEOHZrM3ZHbVEwSnFNRExKemZYazhNaGxReXBpYXJxQ2FC?=
 =?utf-8?B?Q2R5T0pucjR2WEVlTWZ1RnZmRUJLZGlkWHJhODlRaGxWcElGRmV0V0c2WWcz?=
 =?utf-8?B?YzEvTW54WnRkUGlnTDAzOWMrVGJCaC8vU3RYa2JlN0RuR1pTNEJXWk1hZ1Bk?=
 =?utf-8?B?UUY2b3ZFTFBIV3VhaGxHazJQV3N6aFpUVXBoTnNVdWMrTmdVLzBxelFVTDNn?=
 =?utf-8?B?UVVKMnFZVy9rU2VueTVCckVQV2VqQlNUZHNuckNiTm5zSHFqbzUwL2ljVUl1?=
 =?utf-8?B?Vm41ZzdKSjNFNnh6VzlQd25TMVpMak9TQlQ4NjNYVktjenpSZHlxNjQzdmky?=
 =?utf-8?B?eUhOamhPQnh5Q3V1TW1la0dmMGlHcktueWEzelFwRkpSZkRNcGt4N3hsU3Yx?=
 =?utf-8?B?MFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9224.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDE1K3o5dVFiajAzTFhCcjc4TU9BcXIyMGdaNzBJUVBLRnNsYS9nK2FBYzdu?=
 =?utf-8?B?UTFpZytKNXE5d0xpaEZmS1o1Z1ZpaTFIeTNQNlQ3T3pFR3J6NmtrWjNiVjlZ?=
 =?utf-8?B?YlIwQldKRDBQSWx0ZUE1MEJoYzIxc1dMT0lZYVF0MWN2NXM0S2NzOXBlWkY4?=
 =?utf-8?B?a0pJSnRTZ0hSeWswU2s1em1mNWhSTzZuVUVEZitvdU9WbFp3Rnd2dnNQS0ZJ?=
 =?utf-8?B?S2RxeFpsdFljV3RzUGNjOStOVjJaRkwrMDF3b1pkZXdKTkw1aVFtZURzNmI2?=
 =?utf-8?B?TGFVVlkzT3lZQzFJemduRUoxQ2Y2RzYzVVhDTkIzR3pSd0IwTkNOZ1Irenpq?=
 =?utf-8?B?bUV6bUdWblZhSGZrU1htNzBCb0c2OFIrTktISVNPMWlZWGkyUDAzSkpseHMw?=
 =?utf-8?B?WGN5MDBHMXlmbXBjSkxUcFJ6MjhPZmg5K2VuWE9scmcrZitkdHZpbEN2TXF0?=
 =?utf-8?B?ZUhCR05iNWRmWkNTMTlEYlpjb2pxYmFhN01JY3NWWlFxU1JjRmxZZzl0UUEy?=
 =?utf-8?B?c0lGUE8zbi94Z1dpakRWRnF2ajgwbEE3RytZRzZWN0RJYVFEbmJPejNMb3ky?=
 =?utf-8?B?NGhLVVhtdkphUGhFdU45RHVQc2FoWEZSMmtaQTY3aFBnZk1YZ0h3a2gwbUtS?=
 =?utf-8?B?ZWRPTklVd0ZYd0V6QlljWWVWREtKTkt6SUdrM2ZvYWU4dkxHUWVQTTg0T09N?=
 =?utf-8?B?SGNOeDhmVXdQQ01JYVptM0F2T3A1TGU1b2QrTDVIQkU3NEd2OHMvcjFsK21k?=
 =?utf-8?B?T0VqMnVCc2ozbjB6N1N0TkdNZFZRcXFZZkZ4RTM0VC9ROEExaFpJWTVoclE3?=
 =?utf-8?B?c2N3alRLU3dXaU50alBBdkhmd1NLVkI0OFRCNUd1WmV0SStEMEdPZUVIOGUr?=
 =?utf-8?B?dlBkOWIyWmI2ZjRzNnZRSTMwbUZ4T2NRdmZGcStqQlRlbElEbkpMaU5SaXNq?=
 =?utf-8?B?b2JzZFB6b01jOXV3VjdiRnVUY3p3VHpxZUpYd2YzOGoyWUo2Qm5XZGtFcy9r?=
 =?utf-8?B?VmFVMWZTeTJoT2JjUERSUUQ3azhUaStRZUJpcjRERkxrL3hqZ1ExdzVWNGlN?=
 =?utf-8?B?ay82Z1RpY2gxYU0zRXVZdDFrMFh5aUhNSUc0NlFFVEUrZWlOL2JqWXdjZWNE?=
 =?utf-8?B?aFVoUGtSaXdwbGdPWDVHbkplME0yOHRCdkdPaU5ncTlxOE1aRXkyTUV2aUdQ?=
 =?utf-8?B?TVlrb1JvdFVRbXZpN0hHVER3TTlvM3NybmlLVGNIbU9UZjB0eTErQmdWU2Rh?=
 =?utf-8?B?T01QUmE3dDlHK0pMQkJaMmxRY3VGeU41QWxIeG11RTVvNEtVWlJUS0RrNTFz?=
 =?utf-8?B?OG1aTmY3dlZHazZ6dlBHbnlUcWI2YTFoNzBqdnRuRUp2dyt0d2YvaGdaVDJG?=
 =?utf-8?B?V05qY0tUYkNseWdac1M3WEJTZHF2aVBhb1RYNlZkQVhaMTg0dXNqOVZlVmRu?=
 =?utf-8?B?Mk5Wb0Nadm9UdEpjMm9hSWkzNU1JRnRNVzliK0hzSlhQODZmRXdOai9IOG05?=
 =?utf-8?B?Z3NHNkdPTENVbzJRaWVRR2VxUk56elRvalZhZlhEV1JkRk5YdzFkcUM0bnpJ?=
 =?utf-8?B?eUVwaWVlUFh4RVpoL0FZSHpCUFgyNDdEbnk2Zktua3J5SVB3YnR6Y01JRld0?=
 =?utf-8?B?Mk4xSld6a3BHUnJIa2YrZXhiQ2ozN0lYcWgwUTVmQnZPOTFkQ2ZQYkdyY3VF?=
 =?utf-8?B?SEREa1A1eHRVTXdobjVFTmxqRDE2NFNsYlNOQXpaYXZQODRvQm5YbkVkTmVi?=
 =?utf-8?B?TnhERmlvOHcvOU5GWEVlbSsvV1Voa3VYNUEzYngwUHlyaE4wQ2F6dFp0L2lL?=
 =?utf-8?B?NjRiTHhZWnFGcEFtSFU2V25BM2tCS2djR2JnY2xnTWxBV3dYZHJFN09XeWd2?=
 =?utf-8?B?NDFaYXRpQkVTQXB0Yi9CVTZPVlFDcTA4MWN4cTVhMkp6TFJUUTBxSDk3RkQ3?=
 =?utf-8?B?UHpPS2RPc0xlam9VM2xKTzRBWXphMDhQeXRZS1hzenpEOXBsbFNkOWNuZkhI?=
 =?utf-8?B?Rm8rWDdjTzJUQURFejhIWTRtNVdtNUhkR2xtSnczeHNmemN0a09RYmd3RkxS?=
 =?utf-8?B?U0c3Z2NDZVFvaVN5UzRFRlNWWjdZVDRkNmZCWGdMUnRCa05oRVRjeU5xNnoy?=
 =?utf-8?B?MnovMjdMWVZFUUF4R29FYkJzQStoc0UvV1R2Q21hY1JHSHVNZWthRGlUeVFW?=
 =?utf-8?B?czZiVUd2R0RSdHNtdDMreVVmTDRIZzhNaEhWa0pCWWhCeXNlek9nSGxURFFv?=
 =?utf-8?B?R2dzc1VyMWJpTS9sV0NzUlNBelg1NzZSZU1JY0puWU9rWVVLVU1HQzdKc1pa?=
 =?utf-8?B?UUFEejRVNFdpTlFKRHUrZVVXTTJRZnA4KzRyeStBaFFmeXYrcWpxZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10efdcc7-203f-4a48-9633-08de6ef15525
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 13:26:33.0603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93DN4AR5x3pCIPidFcLOE1UpNhaz/voMbNXwHXLQZAhMZX/LyvraYHUuY15/zivKexAnPizywyKJbEkbDPX41A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9586
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53049-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larisa.grigore@oss.nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,401c8000:email,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5A36B156A2B
X-Rspamd-Action: no action

On 2/16/2026 5:10 PM, Krzysztof Kozlowski wrote:
> On 16/02/2026 16:02, Larisa Grigore wrote:
>> From: Radu Pirea <radu-nicolae.pirea@nxp.com>
>>
>> Add optional support for the two clock inputs used by the LINFlexD UART
>> controller:
>> - "lin": LIN_BAUD_CLK
>> - "ipg": LINFLEXD_CLK
>>
>> The clock inputs are kept optional to maintain compatibility with the
>> S32V234 platform.
> 
> Does S32V234 have the clocks? I don't understand the "maintain
> compatibility" in this context. Either you have or you have not clocks,
> which should be expressed in schema (: false, see example schema).
> 
Hello Krzysztof,

Thanks for pointing this out! I will update both the schema and the 
commit description.
S32V234 does not expose these clocks in its device tree—on this platform 
the LINFlexD clocks are set up and enabled by U‑Boot, so they are not 
available to the kernel.
The changes in this patch are intended specifically for S32G2/G3, where 
the clocks are provided in the DT and required by the driver.

>>
>> Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
>> Co-developed-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
>> ---
>>   .../bindings/serial/fsl,s32-linflexuart.yaml   | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml b/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
>> index 4171f524a928..885f0b1b3492 100644
>> --- a/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
>> +++ b/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
>> @@ -34,6 +34,14 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>   
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: lin
>> +      - const: ipg
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -48,3 +56,13 @@ examples:
>>           reg = <0x40053000 0x1000>;
>>           interrupts = <0 59 4>;
>>       };
>> +
>> +  - |
>> +    serial@401c8000 {
>> +        compatible = "nxp,s32g2-linflexuart",
>> +                     "fsl,s32v234-linflexuart";
>> +        reg = <0x401C8000 0x3000>;
>> +        interrupts = <0 82 1>;
>> +        clocks = <&clks 14>, <&clks 13>;
>> +        clock-names = "lin", "ipg";
> 
> Just add the clocks to existing example. No need for new example for
> each new property.
> 
>> +    };

The existing node refers to S32V234 which does not expose any clock 
properties in its device tree. Because of this, I couldn’t extend that 
example with clocks and clock-names. The additional example is there 
only to illustrate the S32G2 case, where the clocks are required and 
actually present in the device tree. Should I remove it?

Best regards,
Larisa
> 
> Best regards,
> Krzysztof


