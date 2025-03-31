Return-Path: <linux-media+bounces-29060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A58EFA76783
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 16:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7775168650
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 14:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4D6213E77;
	Mon, 31 Mar 2025 14:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HEsjMm6O"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00401DFE0B;
	Mon, 31 Mar 2025 14:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743430470; cv=fail; b=DyUc8Oe57u9NHqi3dqeKmrz752IV/Q9i2gGnl8LHfiLtGiDMQri6qkIW+17AdvSsIjps8D2reOLQ2zgsXCgHJHwZr5m4oI3E6ZR5Ui8t2kbnu3MjtiDqJrFuE7Lr/tNh8fHMmbjwZtTkAhmYkbryduAlMZ3Bfl73YJMkBiSMZpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743430470; c=relaxed/simple;
	bh=qBzLKILklJzgwo9Ydh3rucmgxeX9vuPW3aWEwiZ9DzU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gBxd5MV1qRmNEOjd1aCGtXtE21my09eXt7L1OZ91AS0iZePHJtOOYGSHebkCTxc5n0rAcbPEFBgagOf1c5UKkd3ZuvhRC9dyOzyhfOdhf/iFFF/Xw38wzzgt35RcvQDEHI5kMdNYHJrTch7wJUVnawjL/cPPumSYnedSRjdpvPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HEsjMm6O; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mict0od1YUIn+s9/gKIWBIDu1fmZdKofQQt7mrBX8zCaJSlHRV0oE6GmrhfRqMsp+59E3fYPsZY7BPmJYxYXP6cNI4Q0MAEX3x/M+40eHspZDqRaHBn5vavYfXlewc6jbolBYreL3NPJ+8YuntGzi9EBxCVn8pvdNVdveYxtRgzrSDbZZEuUjgwSZvbp2cAqNyr8AxmlWTW/XxR/sQlWp+KK6u5nR814OVw6TwjqWkPqBrBSV+r8vicxVZdPztYkHRhqBww6gEnkbxy0ZZd5b8zfgmdup9y5vGGRzzjChDLKq0UeyvHWLdu8MWXMlou3wL9Fg2cbbAf9wcWH2WK7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBzLKILklJzgwo9Ydh3rucmgxeX9vuPW3aWEwiZ9DzU=;
 b=pDeGJxhs4c+V1XEE8d7EdT/WI61ye/jPTHLvHfi8wtfhr5pw22xJtOUA2fcwm1q4RR8EQfWpdVbWdu3f2JKK7IFgoWt02AYnU6gaRrxYex0b73Q5OK/hFvVqQwaNblVICZF3DJaKKA59IQWTdR9gswKdjN9eZzadmHFTBn97U/H6DMQskW1aPk3IaZD7IWUcXJnqk7wEoZjJ3Upxl12+btPUGfPdHb18tlh4+j4X61FsobJY2OI2/XOXn590R9WRPVfgZjQ1tVd09yAcDYtAgKP0uftx5MbEtgMFlXFMMf6Zpc2jeNTN9fgaEL1w68GZ9CplxyiLA1xxjZ9ZV6l1zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBzLKILklJzgwo9Ydh3rucmgxeX9vuPW3aWEwiZ9DzU=;
 b=HEsjMm6OxjnaoV0BEko9v+FKN3uVHQmu/rh1BsEiADrC25NAXEleaiWBjw2D6esMe88eANU0fseBvoBXRTtszvkC+WY8/jx+mpuYr2661L9NvyJxSgGebOm8++VaNsn/dJsTxftqloiTEaJIKJkiNE2yJ5AIpiS7vDb9b74BkUg=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS7PR01MB14601.jpnprd01.prod.outlook.com (2603:1096:604:386::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.37; Mon, 31 Mar
 2025 14:14:24 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.8583.028; Mon, 31 Mar 2025
 14:14:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 11/17] drm: renesas: rz-du: mipi_dsi: Add OF data support
Thread-Topic: [PATCH 11/17] drm: renesas: rz-du: mipi_dsi: Add OF data support
Thread-Index: AQHbobffKVZaNpzzt0OUbkVl0xBRjrONLy9wgAAXaoCAAANnEA==
Date: Mon, 31 Mar 2025 14:14:24 +0000
Message-ID:
 <TYCPR01MB11332F548F3770F0C70C9051A86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113463B37FE6B1AAE8CF0F51F86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8v0K_tWA=LnyHDptoBjtgPHSbgwpJp4L1rw4Uv6KC+-JA@mail.gmail.com>
In-Reply-To:
 <CA+V-a8v0K_tWA=LnyHDptoBjtgPHSbgwpJp4L1rw4Uv6KC+-JA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS7PR01MB14601:EE_
x-ms-office365-filtering-correlation-id: f6dcb2fc-81bc-4ad3-e4be-08dd705e56dc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SC82dXdXVXR1WGxBbjZ2YUVtd2RqVFJVenVBZmNlMjAvNWM0YzBMbHYvbVNY?=
 =?utf-8?B?WDdEZkdYRlRDdmQ1cFBBc2I2ZUJVVElVeTZRcEdjYm43V3dDVGlmbkJ6QkNW?=
 =?utf-8?B?b0RoS3B6dGpnNlpxSzhReDR0SVZjTzJDWjloaUVvK3BwYS81Yk1YMG1jNWVY?=
 =?utf-8?B?R3g4ZjVKUC9XN3AzakV5dlZkUFVKK0hzNU14ejU0Y2VpajJyVHdMY1hKU2lr?=
 =?utf-8?B?SitZRks3eWdwRnROWUdnaDZWMDBzdU5PYkhPQzBERmtFSzdmakZGQUl6Umlt?=
 =?utf-8?B?dkliL2k1QjBlWHQ2UUhsemZpQ2tEcWlVUVpFNWsxNi9DQ25jSGtUc2h5YmR4?=
 =?utf-8?B?a1FFUDZyM2preW9pUFFBUndaZUdoWmwyT0ozZTdVdkdHaURobUhTOVJ0eVU0?=
 =?utf-8?B?VHZDWEFVUlhDdVo4bnU2MWttUldIMkJiUVpnL2xuRlp4NUp0NUwwK1lUWDFD?=
 =?utf-8?B?d1J3KzR0bmE3QWtEcXZkQjJQRE9adjZxS2xYMHJlSElQY3RuY0pKd1ZhZVF0?=
 =?utf-8?B?Z0l1WjBRNWhUdWFpa0syUlk4TnFaN2MwL0pFRUdKUTFhZzRWZmVTL2VxQWNv?=
 =?utf-8?B?MEFvVWtWc3dVeC96WjdlbGlSUThkUW54U25JNE1DSXJGNG8vRmlFYjRvZjVu?=
 =?utf-8?B?L1VuNnd4Ykx2blNwWVpuMUVQSjJTL21kYk5iSVdpMk01cVZWUFVPTU5CTFJI?=
 =?utf-8?B?UFBlWmk2Njh3SC9XZzdJWEE4MDVWWDZ2eGtCdUFhK3JLNzFHQ3c0MVVRR1h3?=
 =?utf-8?B?RWxoRkFwN2xrd3NnVFFYRHF5UXJsek5ZaGFRY1k0eFRmTmNYMWZzbDVkYzdt?=
 =?utf-8?B?dEMwTVhncENGclhhQjNsaWI4VmRNSkZnd081aWFROVZRRFE5dTNtd01yR05l?=
 =?utf-8?B?NDNtRHdFZGRwYWdWa2syMm1NQUE5dDdvaldiMzBVZXF4dk5aRjB3VEZvVXF6?=
 =?utf-8?B?b1ZlbkJjRVp0eHFWSWJBc1RNNnhXTjYxd1ZOYzJmWHo4bFZoc1VUY2NBMGVL?=
 =?utf-8?B?M2prTjJXc0xpV2Zwd1pVcnZhUXUwMUFrc29PdVNqQWVFcnJVRktaalpkeENX?=
 =?utf-8?B?ZVhLYWhVTG9uMGhOQ0dZR1V1MlhOaVVuL09tdzlwa0hYczd6akpzcElRZCtR?=
 =?utf-8?B?SlBCNVhZbWo2d1BYV3U2TlM2TDZ0TDlBZ2UzaC9YYmF0MDBubWFKYVU1cWFx?=
 =?utf-8?B?QU4zNXR1U1hqcUY5amJzei9POFY1d0t3bEMxSXFjNDFrTUFkMmsxUTdiMWRP?=
 =?utf-8?B?QjFjVVJrOUNwTm1FMGxBdlk3dXllZEI1T25vRW8waktuMjBvR1VNRVJCQ3J6?=
 =?utf-8?B?ekt3bW1ob3Nyc0hvTjhyczdCaDJoV1FaRmpDNTA5Vks5Nm03SkNMSjQvbVc4?=
 =?utf-8?B?cHlrcVQ3SDdaZGl2VUNkanZXVUl3UnF0dGtiN3lXaXNnRmsrUVEva3dKWkFs?=
 =?utf-8?B?aytTTjdXRXBIVDFKd2s4Q2F4NmdBb0hkdC9aUS9NMmNqdVV5SDU0aUhyLzBX?=
 =?utf-8?B?RXN5aXVFMEhKQnlrYUIwR2FOdmRHYm50SWJqNmxXVVZnLzlkZXh2SjNueXhk?=
 =?utf-8?B?UVJ1d01jUDFCUG43dE00N2hxK1NCUm4vZHc2NkJYai9BaytDc0thWG9IWjd1?=
 =?utf-8?B?Tzg4U2pTN1lVV2tqMVBRY0VFdUoybnhKZkI1NksrVGpKLzlmcXhjV3JBeUJG?=
 =?utf-8?B?YytWYmc1cjE4d1FMNStwTStqU25YZFc2S01NaWltU1ZsM0NlQnFtTVhBeDJQ?=
 =?utf-8?B?Mll4dGdxQzRibE9OMUtvTHl3N0FqNnBoVjE0dStOd2lkK1ZJd0RFb1VaNExS?=
 =?utf-8?B?YTFVQnJ5cTR4dkpaVTZIS09FTys0UUtTQlYwYVpXbVVqZ2h3NGNwTUoxaTFL?=
 =?utf-8?B?RngxUlNDenFBa2YzcCtoZlhCWjNDOHhhcU02UEpIQjdVbkZiazV0S0tXaE44?=
 =?utf-8?Q?I6c/neh7iCTTiqwHTRToex5XJIfMXq90?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?emJvY0xBQldBdGdGV0lqSDZqbGV6UHBnN0s3TzlQMmlDbDlsRlZRK1JOT3J6?=
 =?utf-8?B?TTEvbFduelg5UGczK2crZlo3eHJXTzUxMmVHTzJia1ZJZVNwVjZmY1pyakVK?=
 =?utf-8?B?aTlkb1RkbmNXbHlLZTFOazRQaU90dnNDaURFVFREbGR4a1J6MDVjMWNRTE5P?=
 =?utf-8?B?YmROaWJsOXhPMHRQQ1NzTitHT2djOGRNbWVXaFV0QkJFeHZuRmNkWHFhdlpv?=
 =?utf-8?B?QUNxM0pCVnlJNFR0YjVkZG0zb2pMSWZSeHVHWU5CajFlUi9QK3d4aXJPM2V1?=
 =?utf-8?B?SHNnbFp2djd0NEtHYzNzU3VZZnNNT2VmbWRXbzdkd3B5ckRKeVlBbHJyaUtG?=
 =?utf-8?B?UDB1cENGZWprNFUvazFma205VjhHdnE4dFBhQ0VPWk5FQlhBZ21ZUnRpMWNz?=
 =?utf-8?B?Z3A4L0lLckx2bFNkblBvZFdxbS8vQW1NdVNFck9SZ2YwT1FNdlViZm1mOWxt?=
 =?utf-8?B?MHFJd1hQRnF0RjM3NWVDa3BTWlpTSUY3enNBYitaMXFWWkNvdlNOWVdFTXNs?=
 =?utf-8?B?WmR5RDFRbFIvaGtITGhoVENTSWkyb2grd1BFc1hVTStyWG1ya3hpYXVJY2p6?=
 =?utf-8?B?UEgxN0Y4WU4yRlQyM3R4ZXdDb1lSZEsvM2p0QS9BSkk5Y0E3YkxOeDRUTHMx?=
 =?utf-8?B?R054amhraGFVRlB1NjM0bFpwTXdtNmw5aE15TU9jU1VXT1dTMFR6SlpGUllh?=
 =?utf-8?B?QXRLODlMdm5xbC9QcTJmTXI1VTNXN01Uc2djWktiWjBsOEw5bVVMZFZtemtS?=
 =?utf-8?B?M0ZWQ1ZPb2VYQWhaT21oT3ZYOVV5Y2pQdUFMVGhQUWNQZlVUM0oyZitySGlD?=
 =?utf-8?B?ZHVBYkN4Vk1YRUNoeXMwbHByM2pLenpNS3g0Wk9vQ2g2dFNVWU1ISFVpVmhS?=
 =?utf-8?B?cy8vMkJkT2g1WHhpODhiajhEemRkQmswVTJVTTBVbHRmVVYvTFAvKzJPbFd4?=
 =?utf-8?B?U2tvQlY2U2NOaWdFMi9lOEJlRE43bWVEMHIzUE9Tc3VnWk9URjV6d01TYmQ2?=
 =?utf-8?B?NnZ1TjQ1bzFMdXlXK0RQZXJ3azJmQ0M4dVkzQW1HSjdiWEF5V3A0bThLc2hY?=
 =?utf-8?B?cDZTOGlzSmRrR1oyTDlLM1o3bUsrK09qVnZnQ3N6cnlMeWdCMFBEWXlHQlIw?=
 =?utf-8?B?MzMxdFhvbC9yY1h1ejBHdE0rRmtxZW02b28wZnFrVzdyRmVQWDFKN0EwaXNE?=
 =?utf-8?B?V0N6alU1L1hjTHo4bEZPeENmYnNhWHJLd1BrdXlaZnl0U0ZVaEhTWXNKSEdu?=
 =?utf-8?B?cHJIY21TelVVMHQwdEt4bC9uV0lrVFA5UW9CaVZSTzRPUWd4K3JpMkp6VnNZ?=
 =?utf-8?B?MVBmZlNhcTBlUlRSVmt0dE1BZ3IweGY4TllUWnZqeHlCUEdrOHIyelUrbGNh?=
 =?utf-8?B?akR3N2pGTnRSMjRyaUExL0FLdTdOTE1VVUJsYUV5WWIvdmJOZU9RVGZJMmF4?=
 =?utf-8?B?akhRWjBIb1N5ZXBFQ0xlWUt6VVEyY1B0WDVWNUtUcVRLbFNyMHN0TC9zNjlD?=
 =?utf-8?B?eExTWE5iQkpwUzJ1cUdWVWoxQ2hiWUZpeG9KRjVWYVQramxzeTNVc0R1NHQx?=
 =?utf-8?B?ZHEreHJCQk1Iay9XZGQwOTFPay8zR3pibFhwa1FaaEVKMzFaQ1gyUHBXTVJj?=
 =?utf-8?B?NnY5ajF2QnZCS2pjSDBuRk43c3RLcEtjMURodCtUV1VDcGsyeFNqK1NLcFJ2?=
 =?utf-8?B?cElMejJMOTIwcXR5MHNMVFlDZDhIZE1FazlGWHM5WW9PdlVaejBBOGQvK0Zs?=
 =?utf-8?B?aGg0dGFKRGRJY3FOLzh6M29leDFMQmVUSjl1ekdXampYaVUyMW5peVEwY3ZV?=
 =?utf-8?B?L2ZGVzAzbTU5MVVhcDFweC9henN6OFVGQmV3L1RjZVJjSVdqRGxEOHpuaTNa?=
 =?utf-8?B?SUtIWG0yc1BJeWROcHI2ZFh6djFuMlNRekc1cnlYbWM1R2dYZVk1N2UwTnN1?=
 =?utf-8?B?NWpreWlKOGMwVEt0ZGRBMFBpbkFzS0JnRUdCK01CRWJuOVpRd29DbXYzV0RE?=
 =?utf-8?B?SnNwSlI5SGMzVlhMUnY5ZlZZMkFOdnFrYzNiUG8vcVBYTDZleGtMZTFVeC9T?=
 =?utf-8?B?MXFoeXNBN0VKcDF1V2J3MUZBWFU1dUxETzFQVUNMbVU0RlE4YW5FbW5UeU45?=
 =?utf-8?B?MUtlWXQ3aXV2OXlGTFhlNUxHQ0R3WS9sRyttcHJHOWdVdmh4UTgrZlBmZEk1?=
 =?utf-8?B?TVE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6dcb2fc-81bc-4ad3-e4be-08dd705e56dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 14:14:24.2857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wp1NXMZxNlYROoX25W6gzYN7vq6d+N7brzdAMWVvIFg6KI3+6IfpAM1kzTC7fPaUsT+sAhWw6RqZ/7v33JpB8h29bIK9Fcp2TLWGCPMNAD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14601

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFkLCBQcmFiaGFrYXIg
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTZW50OiAzMSBNYXJjaCAyMDI1IDE0OjU5
DQo+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgQW5kcnplaiBIYWpkYSA8
YW5kcnplai5oYWpkYUBpbnRlbC5jb20+OyBOZWlsDQo+IEFybXN0cm9uZyA8bmVpbC5hcm1zdHJv
bmdAbGluYXJvLm9yZz47IFJvYmVydCBGb3NzIDxyZm9zc0BrZXJuZWwub3JnPjsgbGF1cmVudC5w
aW5jaGFydA0KPiA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPjsgSm9uYXMgS2Fy
bG1hbiA8am9uYXNAa3dpYm9vLnNlPjsgSmVybmVqIFNrcmFiZWMNCj4gPGplcm5lai5za3JhYmVj
QGdtYWlsLmNvbT47IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBTaW1vbmEgVmV0
dGVyIDxzaW1vbmFAZmZ3bGwuY2g+OyBNYWFydGVuDQo+IExhbmtob3JzdCA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3Jn
PjsgVGhvbWFzIFppbW1lcm1hbm4NCj4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwu
b3JnPjsgQ29ub3INCj4gRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgTWF1cm8gQ2FydmFs
aG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+OyBLaWVyYW4gQmluZ2hhbQ0KPiA8a2llcmFu
LmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPjsgU3RlcGhlbiBCb3lkIDxzYm95ZEBr
ZXJuZWwub3JnPjsgUGhpbGlwcCBaYWJlbA0KPiA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47IGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1yZW5lc2FzLQ0KPiBzb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1tZWRpYUB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc7IEZhYnJpemlvIENhc3Rybw0KPiA8
ZmFicml6aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPjsgUHJhYmhha2FyIE1haGFkZXYgTGFkIDxw
cmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMTEvMTddIGRybTogcmVuZXNhczogcnotZHU6IG1pcGlfZHNpOiBBZGQgT0YgZGF0YSBz
dXBwb3J0DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0K
PiANCj4gT24gTW9uLCBNYXIgMzEsIDIwMjUgYXQgMTozOOKAr1BNIEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBQcmFiaGFrYXIsDQo+ID4N
Cj4gPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPiA+IEZyb206IFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5j
b20+DQo+ID4gPiBTZW50OiAzMCBNYXJjaCAyMDI1IDIyOjA3DQo+ID4gPiBTdWJqZWN0OiBbUEFU
Q0ggMTEvMTddIGRybTogcmVuZXNhczogcnotZHU6IG1pcGlfZHNpOiBBZGQgT0YgZGF0YQ0KPiA+
ID4gc3VwcG9ydA0KPiA+ID4NCj4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBJbiBwcmVwYXJhdGlv
biBmb3IgYWRkaW5nIHN1cHBvcnQgZm9yIHRoZSBSZW5lc2FzIFJaL1YySChQKSBTb0MsDQo+ID4g
PiB0aGlzIHBhdGNoIGludHJvZHVjZXMgYSBtZWNoYW5pc20gdG8gcGFzcyBTb0Mtc3BlY2lmaWMg
aW5mb3JtYXRpb24NCj4gPiA+IHZpYSBPRiBkYXRhIGluIHRoZSBEU0kgZHJpdmVyLiBUaGlzIGVu
YWJsZXMgdGhlIGRyaXZlciB0byBhZGFwdCBkeW5hbWljYWxseSB0byB2YXJpb3VzIFNvQy0NCj4g
c3BlY2lmaWMgcmVxdWlyZW1lbnRzIHdpdGhvdXQgaGFyZGNvZGluZyBjb25maWd1cmF0aW9ucy4N
Cj4gPiA+DQo+ID4gPiBUaGUgTUlQSSBEU0kgaW50ZXJmYWNlIG9uIHRoZSBSWi9WMkgoUCkgU29D
IGlzIG5lYXJseSBpZGVudGljYWwgdG8NCj4gPiA+IHRoZSBvbmUgb24gdGhlIFJaL0cyTCBTb0Mu
IFdoaWxlIHRoZSBMSU5LIHJlZ2lzdGVycyBhcmUgc2hhcmVkDQo+ID4gPiBiZXR3ZWVuIHRoZSB0
d28gU29DcywgdGhlIEQtUEhZIHJlZ2lzdGVycyBkaWZmZXIuIEFsc28gdGhlIFZDTEsNCj4gPiA+
IHJhbmdlIGRpZmZlcnMgb24gYm90aCB0aGVzZSBTb0NzLiBUbyBhY2NvbW1vZGF0ZSB0aGVzZSBk
aWZmZXJlbmNlcyBgc3RydWN0IHJ6ZzJsX21pcGlfZHNpX2h3X2luZm9gDQo+IGlzIGludHJvZHVj
ZWQgYW5kIGFzIG5vdyBwYXNzZWQgYXMgT0YgZGF0YS4NCj4gPiA+DQo+ID4gPiBUaGVzZSBjaGFu
Z2VzIGxheSB0aGUgZ3JvdW5kd29yayBmb3IgdGhlIHVwY29taW5nIFJaL1YySChQKSBTb0MNCj4g
PiA+IHN1cHBvcnQgYnkgYWxsb3dpbmcgU29DLXNwZWNpZmljIGRhdGEgdG8gYmUgcGFzc2VkIHRo
cm91Z2ggT0YuDQo+ID4gPg0KPiA8c25pcD4NCj4gPiA+ICsNCj4gPiA+ICAgICAgIHJldCA9IGRy
bV9vZl9nZXRfZGF0YV9sYW5lc19jb3VudF9lcChkc2ktPmRldi0+b2Zfbm9kZSwgMSwgMCwgMSwg
NCk7DQo+ID4gPiAgICAgICBpZiAocmV0IDwgMCkNCj4gPiA+ICAgICAgICAgICAgICAgcmV0dXJu
IGRldl9lcnJfcHJvYmUoZHNpLT5kZXYsIHJldCwgQEAgLTcyOSwxMCArNzUwLDEyDQo+ID4gPiBA
QCBzdGF0aWMgaW50IHJ6ZzJsX21pcGlfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ID4gPiAgICAgICBpZiAoSVNfRVJSKGRzaS0+dmNsaykpDQo+ID4gPiAgICAgICAg
ICAgICAgIHJldHVybiBQVFJfRVJSKGRzaS0+dmNsayk7DQo+ID4gPg0KPiA+ID4gLSAgICAgZHNp
LT5yc3RjID0gZGV2bV9yZXNldF9jb250cm9sX2dldF9leGNsdXNpdmUoZHNpLT5kZXYsICJyc3Qi
KTsNCj4gPiA+IC0gICAgIGlmIChJU19FUlIoZHNpLT5yc3RjKSkNCj4gPiA+IC0gICAgICAgICAg
ICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZHNpLT5kZXYsIFBUUl9FUlIoZHNpLT5yc3RjKSwNCj4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImZhaWxlZCB0byBnZXQgcnN0
XG4iKTsNCj4gPiA+ICsgICAgIGlmIChkc2ktPmluZm8tPmhhc19kcGh5X3JzdGMpIHsNCj4gPiA+
ICsgICAgICAgICAgICAgZHNpLT5yc3RjID0gZGV2bV9yZXNldF9jb250cm9sX2dldF9leGNsdXNp
dmUoZHNpLT5kZXYsDQo+ID4gPiArICJyc3QiKTsNCj4gPg0KPiA+IE1heWJlIHVzZSBkZXZtX3Jl
c2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX2V4Y2x1c2l2ZSBieSBkcm9wcGluZyBoYXNfZHBoeV9y
c3RjLg0KPiA+DQo+IEFzIHRoZSBkdGJzX2NoZWNrIGRvZXNuJ3QgZW5mb3JjZSB0aGlzLCAgYGhh
c19kcGh5X3JzdGNgIGZsYWcgd2FzIGFkZGVkLiBSZWNlbnRseSB0aGUgc2FtZSB3YXMgZG9uZQ0K
PiBmb3IgdGhlIENSVSBbMF0gYmFzZWQgb24gdGhlIHJlY2VudCBjb21tZW50IHJlY2VpdmVkLg0K
PiANCg0KUlovVjJIIGhhcyAiYXJzdCIgYW5kICJwcnN0Ii4gU28sIElmIHlvdSBhZGQgInJzdCIg
Zm9yIFJaL1YySCB0aGVuIHlvdSBzaG91bGQgZ2V0IGR0YnMgd2FybmluZywgcmlnaHQ/DQoNCkNo
ZWVycywNCkJpanUNCg0K

