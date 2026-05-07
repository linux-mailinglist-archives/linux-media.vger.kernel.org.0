Return-Path: <linux-media+bounces-60811-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM1cONyY/GkqRwAAu9opvQ
	(envelope-from <linux-media+bounces-60811-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:51:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAF14E9A10
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7713E3026369
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C183FB05F;
	Thu,  7 May 2026 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Qitz8jdM"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA013F54AD;
	Thu,  7 May 2026 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161734; cv=fail; b=V/Bm0Sl5C5pLexgrRaY+K/B7btlfOELgOyRSVILyhxBM4ML0cYaI0++Q8fNwwgOyizmcpVq8B8KsEHMC2d9Lbru7eZTqvfV2fzWDHFVOeUFxWdR4FHvAr49MksOTlZLVNrf/nFkPn01+v1x11Mmg163NfkiIueoSddQQn3Twd10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161734; c=relaxed/simple;
	bh=N65IclBsh9MTwLMTlBlE0HeCrsIpwGGIFnJLjSMO4Jg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oDRPqtRltuTGKZXXZZHYDgy87boIazblDO8VRNtVHr1yZuj/xjRCF3b3jjDFFvH+uyaCpDWijE1wWXgoElvFE2j1golSn5ft0NDelNpr2Vj0DOcWlrlSplTqwFeZ4Wey84AZYIlXfgz/A76ghF2kaqjbM+BnfaMw3GlCM8xqz94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Qitz8jdM; arc=fail smtp.client-ip=40.107.162.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hka5MmUEdlbMZygj6VNiC1ff7NT2vRW1qEburNa5N1nZSf/NMuoFvGUvyTYaAb/Y/oamOx0bizaK/usf8iaZy0nlbqs1LPK4pJwbUfYdae64hR5bluP7UWSuThMzbAzPL0vzLZV5/fuiXWgnl73ZHg9v4lfbnm/7XkrlpFf/STC9eiY+NSYJ9thqm+lNNNcK6kXgkJa8LaoLwsMMpcOv5NXmjcOjFiRnM/F5NHV4vhADgGMok4vmjvO1h+tHA/PAV+TlXciHVxBiZgx2PpdE4P7pWzvMTgDhSIN9BcJUJq/14mOr37V6DdzxRvf9825NIB9W8J2F0lJcIg687iVkWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSw4QjQM8he6zGU30kFVNTyWkXnnb6rgk4NHDdpQR1k=;
 b=MHI5/B1DFRDmHUnc9/F6zmVWmN8mATvQk4e5ItHCAymObffG3rWSkBZm+dVs/HrY+gQ/ZjbC8VdYU/KD7/3rXPwBX05LTAvBymdTxaKoHZIHOsd28m3YkwjMOsAwbh9JgQGP8siNicHZaLrBX2B7oB7EiqBwfWMbhs2LOWsStHBwSo5/UcW1OomGNDleKwxh3IsbjcyTtz1KiYSMKR1kukNOxDA6Y0Q3lI6CBJssUyAmLkJ09R7i2mrsZEGTFbVNVUXLwdk5c2D8z6LhZlkHomBDYFrdRix3VwPif4S44Av67+YYeO9cxl+ovqww36770DJrxVvA9HT1vfJ8WiTYeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSw4QjQM8he6zGU30kFVNTyWkXnnb6rgk4NHDdpQR1k=;
 b=Qitz8jdM/qVCG36qNfrgi0ufqQivem2ij6iQ+Tgg7LyUnTK5bGotGiKSyQisBQmSQcRBdafw8sHhFyysOFUKE+BIuoJT0jql/lx2ZG+wxq6kRzBwA2xHCGrYgLdiFTtCKH7TBM074OL1lRVM5uvb+Cj2UtytX7gXUdlYODF9614z1/kTN127mRFzbmHMegREMENva30M9ORvdUzpUT8ZpUfmWJlqyIY2qv1eIPVftB/csma52cbnl6A8/UsvQ7xN0SuHgK8AWIX2oWU4MuKC/9Y8uzByS+Sq/9JYc25/gPLTtvqorfdb25j71DGBBBB7Aw2O5uLoZl8ZS2ow7rd9rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by AM8PR04MB8002.eurprd04.prod.outlook.com
 (2603:10a6:20b:247::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 13:48:50 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9870.023; Thu, 7 May 2026
 13:48:49 +0000
Message-ID: <96bff2f9-04ef-4272-b408-fefc7d1d5e11@nxp.com>
Date: Thu, 7 May 2026 15:48:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/11] media: platform: Add NXP Neoisp Image Signal
 Processor
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
 daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
 jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, michael.riesch@collabora.com, anthony.mcgivern@arm.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev, ai.luthra@ideasonboard.com,
 paul.elder@ideasonboard.com
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
 <20260413160331.2611829-10-antoine.bouyer@nxp.com>
 <CAMuHMdXrvn+kwBsc96SQxWMABZv3Y6EPc3FLU7f-pOi2+J+S1A@mail.gmail.com>
Content-Language: fr
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <CAMuHMdXrvn+kwBsc96SQxWMABZv3Y6EPc3FLU7f-pOi2+J+S1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0012.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::20) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|AM8PR04MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a33be15-bc04-42ef-36b5-08deac3f5e44
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016|22082099003|3023799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 TsJ4EAX3Yz5oFH3S6kyq8oZfK0vMraLRBCtgOy1Ma5kB2K1Kw7/YbWxWOzg/IXmcQVQHazYLdfUeScdxAX9pII/KZH5EzMQYqjid6AM/C7jSR8JjrU5mv+haBsyaasVX7IHSwrMsKt9eNdFo37/LR2bgVZbJyj+yK2V6UYylZM5qjaoZ+ncDXxCWsYkSKkaYrWNpKbydkp5xm/YwODJsaYYLinSRLHKHdQgmEJ2rd5qv7M4HyYg0WovILR9WOBlqpFUw16WH0V5XFHwHHO9cDv9HgTe5jbHc4yr0ho+pC23npkw04RhvgWZOJKU6WXhJJxIhROfnrNVDEzORbq9ZdA4hrPWSaWLX/FFFW+LMULCeBGy/azfVeRYqiKIK6SfEsedeQKZR4Ijf7oSWJ7ojm80chq4/wB5lUGhRmsGkdHJmJPvgSuel0KpuTWugdUOek1ViWZeZ3GsbYqCuCM/7JUD+mWVqbFz6UK8kPL7itQfb26EmQzIGGqAYy6jW6LIa3yx18CaZa8VMlB4OFeSiVaDTzAwWPmc9Vt8IhTB+YqttgJCD80JNJm+dAtFCcTP0EXLe63Ew0WBd2BDft5sVzY5ZVLSRH4ExZ1tQteXG09ebbHmBSPNYeS8QBsXZGFl8D1D4ztB8xeIX+NiBiiw0mSEEfRaw3DSy9IuvE14vF5ngdWYocfbdfgKMJkYLUOso
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016)(22082099003)(3023799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bGNsSnJyWFFOdFVBNERqMjhkY1BlL1I2bzFmbmFZVVhZQkRraCtUWDhCQy9Q?=
 =?utf-8?B?NGpPa0wraGxGR0VMVStWai9paFNLZVd3bDlLK1FmQjI1ZnlEUnVBbXVNM0NJ?=
 =?utf-8?B?bzJDU2paSWIzc2dXbVVETlp0emNXTTV5amNXN2Y5TG0wUWhOTCs5cXJoWHRM?=
 =?utf-8?B?Z3dEbzdra2t0OG9FajVBOHpHUXdVV0preGU2QTJlYXgxL2F6aVJ6aUE3VDdO?=
 =?utf-8?B?UzNkMDZ3MzBnVTdnc0tsdzAvY09seXcyUUZGWjVSdjBuVytZNEQwYWJTeStR?=
 =?utf-8?B?dHQ3ZzBHUVN2WGVSRFozK1F3d0pjeU1jSzczbk1UNmRObW0yV2ZMam9RdWtG?=
 =?utf-8?B?RFJRbnhpOWM2YXpzSTJuSDRzcmdVYnhTZGtRdjBKYjNBSmtkVXNZeFk0K1BG?=
 =?utf-8?B?QWNwNWU1VnhldXozOEZqVDdQSWtYUVBmYU1KRkRraDBIUUxoVGpqYU9KZ0h2?=
 =?utf-8?B?TVJhRWJpT3NpZTd4b05vaHM3RFh6WmdmSG15K0piMm5YNUdmWUNtcTlkbjF3?=
 =?utf-8?B?aDdrSUVzekpVeXFCUjdPYW1qYXB4d29EODVPWENpRkhNeXlZUGlXUUlLUklz?=
 =?utf-8?B?RytOdFhidTV5Tk94cFFxcmEvT3RiaElKUGtlZTJBMmd5MmFRaDVsUFpxL2F3?=
 =?utf-8?B?ZkYvbWZQL0lZNjJBdzJKNUh3TnhkRzNCMkhOSkY2SUJsbjhtdUZsc21ZZC9k?=
 =?utf-8?B?Y3o1aENQd1I4dWI1UVB0bUpaay90YVRHUE5pc2o0TFdmYVBBUWduRW9kdkRY?=
 =?utf-8?B?bUx6emE0WWZwTU5NbUYzZ1BqWnhWTm5Obk1jWDZvVVRJN1ZoQWVGLzZlbmNv?=
 =?utf-8?B?U3JUR2pZb1ZGWDNPQTZWZjl5NDVpNE4xalE1K0h5SkdabVRVeEVZb2ZvM0Vj?=
 =?utf-8?B?eUhCaUg5enpMTHE0UEsxdUg1WFlpZG5xbm1iRDY4MVdsUGdXbHdJNkphWDUy?=
 =?utf-8?B?WXRMY3pSTEh5bTdBUmN3dHZmdG5UZHFYckNVamRtN0N4aXp3YVNMeFBndXda?=
 =?utf-8?B?bmc0dGtiQ3RxRm1GTXBnbUttcGdLVHpET3VqZE5MWmRRdHphaWZkQzNBTThw?=
 =?utf-8?B?SkNSdXJydE85aklEVExOM0xUYmduMFpoQ3Ftb0tmSytQNDA4NG9CeVR1QnU2?=
 =?utf-8?B?ZzhCK2ZrT2lXT2tZY0xkZURWbzNYWTlNcWs2WXZIUElNRFJCZ3BER3ZQWHAy?=
 =?utf-8?B?WHhFNERLNlBiT2krNEZpL0JVQWVGTVplMkpxdXRyS1hkblhsNTE5TDNEa1VP?=
 =?utf-8?B?djRTbDdxaTlHM0tSQVNVbW9iK0dQMVgwYWVHOGJGNjZ0eTEvNkorWk52Uks2?=
 =?utf-8?B?R3k5YjgyWVRMb3RsKzRQcUpWVlFhaytTMXhCcU9paGhCYURkWWFzYmhiUGVP?=
 =?utf-8?B?c0JoNTFqaVN4NXZRTWhNdW1yY0U3UEhYdDlCTGNJVXVxZU5aQ29ubjZOZ2Zs?=
 =?utf-8?B?RmlXajBvdDJ5bnA5VDBtdjgzQVBSQU1yd3NCSlNnaEpMTjk3cUdQSzZBVVNR?=
 =?utf-8?B?ZXFmY0FCZnF3R0kwbS9ZU0tWbVMySVkySFhWaGlSejJOOVhCVWZ3V1dYZzBp?=
 =?utf-8?B?amM3Zng2S2N1R0ZWK205NEI3VmRpaldOVkxCY0o5R0o4ZXVSWEExVU95UGpU?=
 =?utf-8?B?ZFlZNHRXWGxKT2VVaHFSS0c4NVZqQnM4aWtsSnBsU1JVUGVVdWJUeTZmZ0pQ?=
 =?utf-8?B?R2NEbXBuK3RRUzQxRDA5NGMzN2RNamRaS3JydkUwT0x1ekV6aWtCQmtsU0k3?=
 =?utf-8?B?eXNiWHNWWFRMZXc3bjhuTVRORlBGVmJNR2FTVlBWMFNVRGFDZjNnUDRNTWx6?=
 =?utf-8?B?K0kwTElDS0pZQmFVQWQ4VmJ2OW44cVY3aFRiZm1qZ2tXWGd2RDdBUXZXcHc2?=
 =?utf-8?B?ZG5OVnp3R01RRDlNbThHbjk2RUtQcVRGTU43T1RMR2FNUThFNFJOdzN5RlVC?=
 =?utf-8?B?N0hWdy82YWVVUElleGtNZ0h6TkFqV1doMGUvYnpqbC9yTzFOQ1QweWdsa1dt?=
 =?utf-8?B?Ny8vVWpYNWRueEVWTHFRRGVWVVNDQWp0TjUzRG1WVnV4TlVEdU1zbmVhKy9G?=
 =?utf-8?B?MnFGQXhMeC9Cb2FOZ1p3c0ViUklFcDNPNCszQ3B0eVpIbTA2Y2VCYk04TGhP?=
 =?utf-8?B?NTZoYmN3UXE1SlM4T3hib1NiOEJtYndKZ3dqWEFmTlAyK0pHUzdPZ2d4VWlj?=
 =?utf-8?B?cXFxeFNRT1FQQlB1TW9OdzhNZWdzVlZiNlhYWXlpdWZDaHU0ZWI3SWw4QkdP?=
 =?utf-8?B?M3FlL2o3ZXR4dGFKSkNhMVdSQzdUV3d4cFpKaEhUek90WE5RbEJidHo1MTVO?=
 =?utf-8?B?UEZ1V2F5QVhtQkwySVZJOXU3K2kzTGhLRHo2VDhJSFJOVkpVZHMydGR4alp0?=
 =?utf-8?Q?wknbrqCcWy46BklA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a33be15-bc04-42ef-36b5-08deac3f5e44
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 13:48:49.8962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nm1ZZ0j048lq7x9aiY7F5NATzi5NaOdyxRQnnARp18pq1fnETs9eQYZHkPpFivgtp1yLAErF8dcQoK6hAUjD1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8002
X-Rspamd-Queue-Id: DBAF14E9A10
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-60811-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:mid,nxp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Action: no action


Hi Geert

Le 06/05/2026 à 16:26, Geert Uytterhoeven a écrit :
> 
> Hi Antoine,
> 
> On Mon, 13 Apr 2026 at 18:10, Antoine Bouyer <antoine.bouyer@nxp.com> wrote:
>> First NXP neoisp driver version with the following contents:
>>
>> This driver was initially inspired from raspberrypi pisp_be driver. It
>> reuses same approach for ISP job scheduling.
>>
>> The Neoisp driver supports:
>> * 8, 10, 12, 14 and 16-bits RAW Bayer images input.
>> * Monochrome sensors input.
>> * RGB/YUV, IR and Greyscale output formats.
>>
>> The neoisp features are:
>> * Provides single context to limit amount of v4l2 devices.
>> * Supports M2M operations.
>> * Support SDR and HDR modes.
>> * Supports generic v4l2-isp framework for extensible Parameters and
>> Statistics buffers.
>> * Provides a `core_media_register` API to register neoisp's media entities
>> into another media graph.
>> * A module parameter to run in standalone mode with its own media device.
>>
>> Co-developed-by: Alexi Birlinger <alexi.birlinger@nxp.com>
>> Signed-off-by: Alexi Birlinger <alexi.birlinger@nxp.com>
>> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> 
> Thanks for your patch!
> 
>> --- /dev/null
>> +++ b/drivers/media/platform/nxp/neoisp/Kconfig
>> @@ -0,0 +1,15 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config VIDEO_NXP_NEOISP
>> +       tristate "NXP NEOISP v4l2 hardware driver"
>> +       depends on VIDEO_DEV
> 
> depends on ARCH_MXC || COMPILE_TEST

ack

Will integrate in v2. Thanks for proposal.

> 
>> +       select MEDIA_CONTROLLER
>> +       select VIDEOBUF2_DMA_CONTIG
>> +       select V4L2_ISP
>> +       help
>> +         Enable this to support the NXP NEO Image Signal Processing (ISP)
>> +         module present in various NXP SoCs. This module offers multiple
>> +         functions for processing RAW images and generating RGB or YUV images.
>> +
>> +         To compile this driver as a module, choose M here: the module
>> +         will be called neoisp.
> 
> 
>> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_MASK GENMASK(23, 16)
>> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_SET(x) (((x) & GENMASK(7, 0)) << 16)
>> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_GET(x) (((x) >> 16) &  GENMASK(7, 0))
> 
> What about just:
> 
>      #define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2 GENMASK(23, 16)
> 
> and using the helpers from include/linux/bitfield.h in the driver code?
> 
>      FIELD_PREP(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2, val)
>      FIELD_GET(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2, reg)

That file was auto generated, so I did not want to change it.

But I agree, these macro would help to save a couple of lines, and 
probably ease readability too. I need to double check the impact, making 
sure there is no regression with such update.

Could that wait for a v3 ? as I was about to send a v2 with other 
changes first.

Thanks
Antoine

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds


