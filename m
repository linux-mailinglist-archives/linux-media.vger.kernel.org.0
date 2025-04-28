Return-Path: <linux-media+bounces-31200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB04A9EF5B
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 13:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 613421896E02
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42923269B03;
	Mon, 28 Apr 2025 11:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KgbvxFyx"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53432267B06;
	Mon, 28 Apr 2025 11:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840179; cv=fail; b=defqL96kgNw5DIrp3NhYEhVSQxLaxPq0wCzAj9LkHtQTkW9Lau1df4YsuCeZ7LI7RXg8dAa/LExCUU87/+NABObW8Ude+j+UmrYXb/lqwWwworph97c00vo+Gc1LWhTnzBPO6xnNPIqlpAy0OcMld5OINNbFN6MX/qyY677YYsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840179; c=relaxed/simple;
	bh=uE4vhH5NJgYTyqAWzmgPqEMpr85xFII87KbxFt7NVoM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LfH3VY5TAthJLB1fxtfLLADpRtVg3rioUiZo5uKABjE5I83pI6asc+J1GN7saOJsptgJmuLICS4SeVAbKty7bJQUtPZBsAwVPTZ4ZSMJ3sRJx/0kVpsAveEaZQZWY1gatygsEOL2zPzOtmjkZnPKGntW94TAqQSqd5OD3h5kwP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KgbvxFyx; arc=fail smtp.client-ip=40.107.74.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyzUWTNjXamGnI8WHJxw1uohWBUJECzebex+HBf9wjK+0NUIVVN+YmicGnlaPBxfhoNV8pmj5HQk5ta9Em4o10WGG6YAKC+VelZTCoHOlg6Y5jsMg1DTyVeQ5gWC8APA8lDjFn8u872+6Uh4dk7dfE3FThXNt6M2bc+OjoLNqPexifjdupAQgQglY6aLEHJ8VUzZOd05MrLDL0V02Kw8YqzIORcZ7LO7aXKUHsakOfE/ECyz0DB+ZoCyxaVWrS9KcVqr7B9T93IbbfzZPHn6Gx7U7EIKzGmMpws/7QytmLdR7KlDF8qIbZTGAGhjmxg7j9MxENw3BFWDgpkjLWDL2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uE4vhH5NJgYTyqAWzmgPqEMpr85xFII87KbxFt7NVoM=;
 b=zJe+LwZKAw/X+schFGfyEYR6oBjiNXe75xYBwpfwlBIOxjAkI5bs+jaWut3B63qDMNioq72KCszl+/MMbQ4nuoHWZu3HrYCwHa409fSIDD19nb+acREqVKOy/aq1rc6TQdq1dLfeWnTMH3djMHekbJfqpXnSUCcPp7SjoBLWwZHi0eUzPSlqtvHORE6Xo7IMGegbbIIVo0djgj5oIL1hfrQEmA7MeIPi7QKFsILxA3ZvunFidPoYd02Ms0QIrWz5uvEJ0sDFI8aI7zodv//K7gAzGOAH1YWOfQ+gbxfZU4v6+eldClTIk6CREkKtD45Oynn+4LffrIdHGEOelu5iTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uE4vhH5NJgYTyqAWzmgPqEMpr85xFII87KbxFt7NVoM=;
 b=KgbvxFyxdKkWKQ1yFBny6UCKz6ZIPl6JXO9h8LyaORbJ2mf9NosOVFgG7YkkkiQXaIFF8d9yKgrjqX2YMjPCekGtrXc9Rx5giFIjjUsNBM2Z/eRsUELY+gom0ejBs0T86z/nlK+sJHRpBaD5ESX1V+u2EX0sjSvQfL1RvIZ6NXU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS0PR01MB6404.jpnprd01.prod.outlook.com (2603:1096:604:104::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:36:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 11:36:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Dan Carpenter
	<dan.carpenter@linaro.org>
Subject: RE: [PATCH] media: renesas: rzg2l-cru: Simplify FIFO empty check
Thread-Topic: [PATCH] media: renesas: rzg2l-cru: Simplify FIFO empty check
Thread-Index: AQHbuCM8dWr8bhFWIEa51Pi0ZPlXAbO42D0AgAAV2wCAAAIPAIAAAiiAgAAAoVA=
Date: Mon, 28 Apr 2025 11:36:08 +0000
Message-ID:
 <TY3PR01MB11346E57A3DF8D8A90A405E4686812@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250428095208.99062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250428095940.GE3371@pendragon.ideasonboard.com>
 <CA+V-a8taFdmCgiUAwmDG93OA+P9UH-FEw3PeMFW4sLQ2KPnEPQ@mail.gmail.com>
 <20250428112516.GG3371@pendragon.ideasonboard.com>
 <CA+V-a8vDDLZ422nZds7pEEW+gZ1n7s-U3eJjmG8DsOJT9uJygQ@mail.gmail.com>
In-Reply-To:
 <CA+V-a8vDDLZ422nZds7pEEW+gZ1n7s-U3eJjmG8DsOJT9uJygQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS0PR01MB6404:EE_
x-ms-office365-filtering-correlation-id: 4fec30e0-2c72-4481-e0ff-08dd8648de66
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aFc0SGxqY0hkNGhqWXU4UTREdHF1dXcyTDB4ZUV4Y0MxeVZWNmY4UXp0S1hH?=
 =?utf-8?B?dkZESUNrb2tOUXVkeWgzUHNsa2NzTG9paUl0WS90MDVSZDhHYk1KMFNONlVi?=
 =?utf-8?B?ZTRna2RuaWdYejBhTXIwekxKWWQxYkR1bFlva3hsY3pyMXVRaVhxN1I2MUZT?=
 =?utf-8?B?SVd0MnkySUxnV0JNR2RHWmwrb0hjQ05JYTlEWTVxOGJ0bFUrQ2dmVWhaTXJU?=
 =?utf-8?B?OWZmVzRWUjNQblJoTG5oN3FCSXZPN0tBeFE5dGFuUlFIemRBYk0xOXRoS3J2?=
 =?utf-8?B?cUcwVGhpMndoYzhKVkhJb3dGVmg5MTBKM3ZSRzJ1OHBSSTNNR3RMdC81VDdy?=
 =?utf-8?B?ZitTR3dPUmZNbytRdG5YR01JNC9ONWtSdlo3QWhZTWRrMnJPcTJ2VG0wVXNl?=
 =?utf-8?B?NTk3cUhZbUU2V1krd2ZLRWxhZUU4NHY5MVhYelkzNGsvNS9oUk1UZmwxclk4?=
 =?utf-8?B?RVNoZEl2U2hTQ2VIeDFpRGxaMnR2K1loSU1tNnNEMmhSSU5GSmZ2bDlVcGYv?=
 =?utf-8?B?VDF2OXM5NUp1d2d3dFhTSWJhc3ZXV1RiczExbFBYMHUyTEVFd1M1dWdOTVAv?=
 =?utf-8?B?V2w5Vmd5RHlFNzA4M25aWFA4cmt4UTRzVG9HRjU5dFgxN21NUUdoL3E5ZUJ4?=
 =?utf-8?B?M24vYVEreVFNaHVxcTVRcGlWbGxrdnVaOEJnc2JCaFo2Rk1IemprazFLdnZZ?=
 =?utf-8?B?Q3BwRlJvSVp4Z09IU1NJbXVGOHJjZGdBRGdML3lyU2JXWDFpczdGcEtkUjY0?=
 =?utf-8?B?WVhyVXU4NTRHZ25BQTVYUnlQOWdBU1JpU0tyb2Nldlp6ZmZ5ZXIyRkF1WFZJ?=
 =?utf-8?B?c3lQZERiaC9pZXJtNnhSVG9GN0ZBazBKR3Z2MVEzemdRRjBhckNKcVVYczdF?=
 =?utf-8?B?bklZMFdvbk0xWGFUOFpUbkZJRThEY052SWE3bGpiQmNGalF2OGJ5b2h3S0tW?=
 =?utf-8?B?ZnVsY2lVVUMxcGlLRTl2ODNOTGhSUkZxb1luWGc0QVo3V0RveC9VYmNsVWNo?=
 =?utf-8?B?MUxIY3lRSWttUmw5NE10Wk1GQVF6YjBQdGhwSWNyRk41ZVFaOTF4WDkyWUto?=
 =?utf-8?B?dzk5dEtPaGVyYXdlYlh4VW9CenV6N2k5WDg4SUdxNEQyUzA1MDV2Z1Y3aXRZ?=
 =?utf-8?B?Z0lsUm9zQ1NLZ0VwTzlaVEVXTTJEZnR6b2NTTVFZRm5wWWtFNTZDdDdFT1JM?=
 =?utf-8?B?aTV1ampTWUY0THdCZnpWZDMyWUplTlJ6cXkrdjhST0ptVGVKRHQybXIwWnlK?=
 =?utf-8?B?aU5RZ2YxQldjQ0xvK1ZPaS92Q0tRZzEyZnJ3ZmlUbzVsNU1wQmJ4YURXN0d4?=
 =?utf-8?B?dDBMZ0svRWM5eG9kcnhUVVJ3SExrUkZkWmkwWTZXVTJWaHF1Qk1NaUpMU0xK?=
 =?utf-8?B?dERMbnNqbEw4TFYrenhFZlNFNnY0Z2V6dW8weFFTRS8rYWdGbVE2K3oxUTFE?=
 =?utf-8?B?RUxDcnlYTlY3Z0NKZnU3aEZ1UXNyekxKZjF3RDQwRVNnTE9iRllLVmI0UGFL?=
 =?utf-8?B?aFk0NmIwRWl2cFh4S2d6MVZ4TXNtelhlbUYrTTl3SWVYU3F5N2FOMGVWTXQ4?=
 =?utf-8?B?RWxVZmRVZWE4MFpua3IxOE9PVEhFdkREM2twOEdHbTRoUEV2SmhuTEFOQ2cx?=
 =?utf-8?B?c3VvNkpRMW1HYXFKT1U5TmovV3FtdDE1cndNbSs0ZGNiRlJXZnpzbStiOHVO?=
 =?utf-8?B?YjFpWDl5R1k5OThaeFpNSjEyUmpnWnBQYTlWNUdRRUNPR09mS21ISU5vQmdv?=
 =?utf-8?B?UnVOcy9kN3lBdFdITmczUVRDdEpjNGVveUd4MTE2c05kUkt6alhiak5BNUc2?=
 =?utf-8?B?b1YvK29tZ3liRTNQVzJpUCt3c1RPMk5sYlJtSmQyKzdnaWVMbk5BWmRNa2Nz?=
 =?utf-8?B?clEwOUh0TjRMOGN6VXNMK1BiUVFNUFdoKzJJMUg5dkRBR0k4R3BTZkNWYngw?=
 =?utf-8?B?d0UyWkV3MGFFK2lyeFd1TmlKdHczTDZ6KzBTV3BaeHRlcThKVTZMbmRSWDI5?=
 =?utf-8?Q?pKVQz93L+t2F/Ls2B3GFEDlOxVDoZo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VWQ4QmRqT1l2UE45NDRhelZ5V05CYmwvbUJwcm5hS2hQQVFxQkxYSmxnUU1v?=
 =?utf-8?B?UkRPTnBZN1BvRGt3U21uMTF5Z0p3a0EvSGc2aWhHMklVOWlDM0t6K3VMcWZQ?=
 =?utf-8?B?WVV1cUJFWlkxZDUvNkROOVN6NmFjRCtkTWxPRk1abnpSWDF0QUJhN24wZXZq?=
 =?utf-8?B?MmkzU3JVRkZjZUltWkxjN2NZOGpKSmNlZ2pVdnpnbmN3ZStNMEVOTEc5c0N6?=
 =?utf-8?B?NnJ0dWM1My8rbURrMzBsYWpmV0hiREFmMTVod1oyOFYraCtSM3Z2SVNtMkdX?=
 =?utf-8?B?SXk1QktMSEJMMGhxc21CdWdZRGFGUkJhTUY5L0NkSEtCS1dYbGNEUkRPMnZS?=
 =?utf-8?B?eWh0czhuRm5ZNm43ZGpsWmpkWW9wVmdaaGNaSDFBRysxMnZGTE0vZkE0SnRY?=
 =?utf-8?B?ZG5WalZJQldQTzYrclZ4akhlT3V5eUttQlQyZldTNFJRTFB5clRDTDFteVhO?=
 =?utf-8?B?dHRVdVN4YXlTTEhlRTB1K2dKOE5paGFiaktGTHVxT3FIc3ZJalp6K0VDT0tT?=
 =?utf-8?B?cWFjWnZjVWoxajRaYnlmNkFSL0d5WmQvcSs2NU96Nk56Y1FEbE4zdkNZSkFV?=
 =?utf-8?B?TzlvQTE3Q0E4YThZN1FLMGlBclduaVdvZHBnejlnNTJtYUlnL1VTYkZXVXdr?=
 =?utf-8?B?d0IzRVFDSDBLNXg1TThQNWZ4Tk9naG50NkU2dEZVaFhUUU9UZkZRWWtsS0x3?=
 =?utf-8?B?YWJteGpZZjJIdzZ0SFFiRDYzS1hzWjVvbk42b01JeG4xMHluMnpoQmJqZThG?=
 =?utf-8?B?M3d2ZG42VkpZZnBxb1RKY1FPRzhtbzlXUnNSVkVOdGI4UlVGUXQ2YW1JaGhu?=
 =?utf-8?B?ckxBYk1vVWpBTVMyWDZrK2N2S1l6TVlXZkRTM3g4TEZ0czFkUmY2ZWZvT0Vi?=
 =?utf-8?B?TmE0U0hNZW1nbVpEWmZjTjZ6Wk9mRURwSGV3V1lKT3JlVHl6TlpxT0l6S05P?=
 =?utf-8?B?bjl5Lzhzc1hibXFGYXFXYU8xVFY3SnZ4Q3Y1TUQyb2FSRGRQT2NTZVRTaU1p?=
 =?utf-8?B?ZmVzMTltYndHSGNNUEdxYWZTNVF1MGtoS2ZFOFAxTUZCWVJkckJ3UGJPNzZS?=
 =?utf-8?B?Vjl1NzA4QUF5Z3hBWFJybGR2UEF2QUJoWjhFdlY1MnJVYjM0YVc1Z2E4K0R4?=
 =?utf-8?B?MmJ2Y0hia2t0K3BhU3AyWGc5QXBtNE5ZZXp2TnhMbDlWV0U0MWYxVUdrTmJm?=
 =?utf-8?B?ZWg4WHZyUnFCRlMvbmM1Mk9xWHZJeDVQNVcwUUUrWGN4b1hQK012cWU1T0R4?=
 =?utf-8?B?MEVhTngwUGpKTTJKb0ZQZGc3dlVha3ZtY2xMN3dRK0JjUGd4b0NXUUpRdlpS?=
 =?utf-8?B?M1VkY0pORnFjSzJXZEViZWdEWVVreTNGS2x1Zi9KMFN3dkVDcmQrVW5WYisx?=
 =?utf-8?B?c2lBS3BUL0RoNUR4MWFscmJ4bTVLbTQ4MmZhQ2c1RTcvODBQZDdacWhvcTQ1?=
 =?utf-8?B?U0VXRDFjZjdtY3RFL21WT0doUzRGM0t3N1RQUytrSmJCVkZUODEvTUJMcm52?=
 =?utf-8?B?T1lhS05Lczc0aUtsSnEwZFNqQUNIRmZnU25pcDh0aFo4dER6SEhQZjJ6UVhh?=
 =?utf-8?B?RlZUZXpxQlFQS0FudzJtWkJEd1luNUxEVXpYOUNod2RYd092Z0lmRXJxaGJT?=
 =?utf-8?B?VlVINk5KMmhqZUJxQUo2RGw3NzdjNWFGUXVGMlhtVWhwbVY0MkJzbW9PRXpk?=
 =?utf-8?B?dXVIVWxIdGpqQzZTOUlNSWRQTUJ6UFVINllBK05yVjlqVjBjWlRkZk9oNTJZ?=
 =?utf-8?B?b0d1SVoybmdCNy9qdHVPR3lxVmd0bHNaVzE0alg0d2dYQWh4cnZvdTBIYVdM?=
 =?utf-8?B?R3o4ZHplVm1pWXN4Njc3Qm03NU83bFNxNHFWT3JyeS9xTk43bHZyLzlmVllC?=
 =?utf-8?B?eE9mOWg4OU02cFJ4SDlqWTZCWm8rN3FUOWdSQmswVlJuSG5FMWRpenZBSWJ2?=
 =?utf-8?B?MVc0ZE5vWGhSRDRMYy81L3JMNVowdUFDbnU0N1JkRk15bHpCOE1Cd0RWWGJQ?=
 =?utf-8?B?eTBEdDFLZ29KQzhJNm9pb2g5L3o0ZURJWWtTRUpUaTF3Nld4OVFPWG1kNmNS?=
 =?utf-8?B?VCs5c2tETFF6cytkckdMNExJcFNlcSsxVCsxYnhQRHl3UnYyZUhFaE5MM0dn?=
 =?utf-8?B?YW5IbXA4ZjZjdDF2NnB4ZHRaMWNVeTkzWDFUdndtOG5PVUNteUtteS9mcjUv?=
 =?utf-8?B?TWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fec30e0-2c72-4481-e0ff-08dd8648de66
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 11:36:08.3141
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PuA05cExYFOXDs762axjKsLNN8sX4hQ8jvhVhjhbk63pTcqoGGPKd2E25Xx/zkOb0dDBqd4DLDX7F0loVjOynuwUmq5jhLb8caQ54xlWJxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6404

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFkLCBQcmFiaGFrYXIg
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTZW50OiAyOCBBcHJpbCAyMDI1IDEyOjMz
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIG1lZGlhOiByZW5lc2FzOiByemcybC1jcnU6IFNpbXBs
aWZ5IEZJRk8gZW1wdHkgY2hlY2sNCj4gDQo+IEhpIExhdXJlbnQsDQo+IA0KPiBPbiBNb24sIEFw
ciAyOCwgMjAyNSBhdCAxMjoyNeKAr1BNIExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBPbiBNb24sIEFwciAyOCwgMjAy
NSBhdCAxMjoxNzo1NFBNICswMTAwLCBMYWQsIFByYWJoYWthciB3cm90ZToNCj4gPiA+IE9uIE1v
biwgQXByIDI4LCAyMDI1IGF0IDEwOjU54oCvQU0gTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4g
PiA+ID4gT24gTW9uLCBBcHIgMjgsIDIwMjUgYXQgMTA6NTI6MDhBTSArMDEwMCwgUHJhYmhha2Fy
IHdyb3RlOg0KPiA+ID4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2
LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNpbXBsaWZ5IHRo
ZSBgcnpnMmxfZmlmb19lbXB0eSgpYCBoZWxwZXIgYnkgcmVtb3ZpbmcgdGhlDQo+ID4gPiA+ID4g
cmVkdW5kYW50IGNvbXBhcmlzb24gaW4gdGhlIHJldHVybiBwYXRoLiBOb3cgdGhlIGZ1bmN0aW9u
DQo+ID4gPiA+ID4gZXhwbGljaXRseSByZXR1cm5zIGB0cnVlYCBpZiB0aGUgRklGTyB3cml0ZSBh
bmQgcmVhZCBwb2ludGVycw0KPiA+ID4gPiA+IG1hdGNoLCBhbmQgYGZhbHNlYCBvdGhlcndpc2Us
IGltcHJvdmluZyByZWFkYWJpbGl0eSB3aXRob3V0IGNoYW5naW5nIGJlaGF2aW9yLg0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJA
bGluYXJvLm9yZz4NCj4gPiA+ID4gPiBDbG9zZXM6DQo+ID4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsL2FBdFFUaENpYlpDUk9FVHhAc3RhbmxleS5tb3VudGFpbi8NCj4gPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4gPiA+ID4gPHByYWJoYWthci5tYWhh
ZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiAgZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC12aWRlby5jIHwgMiAr
LQ0KPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gPiBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtdmlkZW8uYw0KPiA+ID4gPiA+
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC12aWRlby5j
DQo+ID4gPiA+ID4gaW5kZXggMDY3YzZhZjE0ZTk1Li45N2ZhZWZjZDYwMTkgMTAwNjQ0DQo+ID4g
PiA+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcy
bC12aWRlby5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2Fz
L3J6ZzJsLWNydS9yemcybC12aWRlby5jDQo+ID4gPiA+ID4gQEAgLTM0OCw3ICszNDgsNyBAQCBi
b29sIHJ6ZzJsX2ZpZm9fZW1wdHkoc3RydWN0IHJ6ZzJsX2NydV9kZXYgKmNydSkNCj4gPiA+ID4g
PiAgICAgICBpZiAoYW1uZmlmb3BudHJfdyA9PSBhbW5maWZvcG50cl9yX3kpDQo+ID4gPiA+ID4g
ICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IC0gICAgIHJl
dHVybiBhbW5maWZvcG50cl93ID09IGFtbmZpZm9wbnRyX3JfeTsNCj4gPiA+ID4gPiArICAgICBy
ZXR1cm4gZmFsc2U7DQo+ID4gPiA+DQo+ID4gPiA+IFNvIHRoZSBmdW5jdGlvbiBhbHdheXMgcmV0
dXJuZWQgdHJ1ZS4gVGhpcyBzZWVtcyB0byBiZSBhIGJ1ZyBmaXgsDQo+ID4gPiA+IHBsZWFzZSBh
ZGQgYSBGaXhlczogdGFnLiBUaGUgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIGFsc28gbWFrZSBpdA0K
PiA+ID4gPiBjbGVhciB0aGF0IHlvdSdyZSBmaXhpbmcgYW4gaXNzdWUsIG5vdCBqdXN0IHNpbXBs
aWZ5aW5nIHRoZSBjb2RlLg0KPiA+ID4NCj4gPiA+IE5vLCB0aGUgZnVuY3Rpb24gcmV0dXJuZWQg
dHJ1ZSBvbmx5IGlmIHRoZSBwb2ludGVycyBtYXRjaGVkOw0KPiA+ID4gb3RoZXJ3aXNlLCBhbW5m
aWZvcG50cl93ID09IGFtbmZpZm9wbnRyX3JfeSB3b3VsZCByZXR1cm4gZmFsc2UuIEkNCj4gPiA+
IHdhcyBzaW1wbHkgcmVtb3ZpbmcgdGhlIHJlcGV0aXRpdmUgcG9pbnRlciBjaGVjayBhbmQgZGly
ZWN0bHkNCj4gPiA+IHJldHVybmluZyBmYWxzZSBhdCB0aGUgZW5kIG9mIHRoZSBmdW5jdGlvbiwg
YXMgd2UgY2FuIGJlIGNlcnRhaW4gYXQgdGhhdCBwb2ludC4NCj4gPiA+IEhlbmNlLCBJIGRpZCBu
b3QgYWRkIGEgRml4ZXMgdGFnLiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPw0KPiA+DQo+ID4gT29w
cywgeW91J3JlIHJpZ2h0LCBteSBiYWQuDQo+ID4NCj4gPiA+ID4gUGVyc29uYWxseSBJJ2QgaGF2
ZSB3cml0dGVuDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiA+ID4g
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMN
Cj4gPiA+ID4gaW5kZXggMDY3YzZhZjE0ZTk1Li4zZDA4MTBiM2MzNWUgMTAwNjQ0DQo+ID4gPiA+
IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtdmlk
ZW8uYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwt
Y3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiA+ID4gQEAgLTM0NSw4ICszNDUsNiBAQCBib29sIHJ6ZzJs
X2ZpZm9fZW1wdHkoc3RydWN0IHJ6ZzJsX2NydV9kZXYgKmNydSkNCj4gPiA+ID4gICAgICAgICBh
bW5maWZvcG50cl93ID0gYW1uZmlmb3BudHIgJiBBTW5GSUZPUE5UUl9GSUZPV1BOVFI7DQo+ID4g
PiA+ICAgICAgICAgYW1uZmlmb3BudHJfcl95ID0NCj4gPiA+ID4gICAgICAgICAgICAgICAgIChh
bW5maWZvcG50ciAmIEFNbkZJRk9QTlRSX0ZJRk9SUE5UUl9ZKSA+PiAxNjsNCj4gPiA+ID4gLSAg
ICAgICBpZiAoYW1uZmlmb3BudHJfdyA9PSBhbW5maWZvcG50cl9yX3kpDQo+ID4gPiA+IC0gICAg
ICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCj4gPiA+ID4NCj4gPiA+ID4gICAgICAgICByZXR1cm4g
YW1uZmlmb3BudHJfdyA9PSBhbW5maWZvcG50cl9yX3k7ICB9DQo+ID4gPiA+DQo+ID4gPiA+IGJ1
dCB0aGF0J3MgYWxzbyBhIGJpdCBvZiBhIHN0eWxlIHByZWZlcmVuY2UuDQo+ID4gPg0KPiA+ID4g
SSB3YW50ZWQgdG8ga2VlcCB0aGlzIGNvbnNpc3RlbnQgd2l0aCB0aGUgcnozZV9maWZvX2VtcHR5
KCkuIElmIHlvdQ0KPiA+ID4gcHJlZmVyIHRoZSBhYm92ZSBJJ2xsIGRvIHRoYXQgaW4gdjIuDQo+
ID4NCj4gPiBVcCB0byB5b3UuDQo+ID4NCj4gVGhhbmtzLiBPSywgbGV0J3Mga2VlcCB0aGlzIHBh
dGNoIGFzIGlzIHRvIHN0YXkgY29uc2lzdGVudCB3aXRoIHJ6M2VfZmlmb19lbXB0eSgpLg0KDQpM
b29rcyBhIHR5cG8gcnozZV9maWZvX2VtcHR5KCktPnJ6ZzNlX2ZpZm9fZW1wdHkoKS4gQWJvdmUg
YXMgd2VsbC4NCg0KQ2hlZXJzLA0KQmlqdQ0K

