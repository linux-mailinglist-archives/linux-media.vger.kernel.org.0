Return-Path: <linux-media+bounces-25523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0099A24D96
	for <lists+linux-media@lfdr.de>; Sun,  2 Feb 2025 11:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 975E93A5555
	for <lists+linux-media@lfdr.de>; Sun,  2 Feb 2025 10:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F90F1D63D2;
	Sun,  2 Feb 2025 10:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oBxCT8Le"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EA38BE7;
	Sun,  2 Feb 2025 10:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738492459; cv=fail; b=ZGWvFeYN1ZcuEwx+lITW54r0ym3Pj4uQLIAHZyWbiuYXhtZ97qDXKkfDNDkCsIFWDNByiK21/A30GNVvVbUiIuVtKa+4mDl0QIFQ582+/V2HL3ultNfJRD++AOEeSlgF565l3afjzV3owtcIxfy3bHAhEI3O9wjYLeHoCNy2a20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738492459; c=relaxed/simple;
	bh=dGMDCzk8XNimFciOa+6jZpwtSYMXHGozQJ1RTtJb8GE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aZwNB8yHmiSGhwyh1uAw8sMSoDJZ2vT8DnNcYRi3kTs9hQlYm32BSm7iEk3AlH64fDLRwkPFDiOTr9wDHSDI6HXjUM6IfVP2w2HqUdWOB8GEAQi7yvhajMzKddrxhPm6PNJtmVcECVk3U8GclySy6G/mLnrEY1h+et8jqfra+iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oBxCT8Le; arc=fail smtp.client-ip=52.101.229.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQ21i56/2tcNguZqX1QPr9KR/E+vLWpYNQFkrwkRVNjoHZzvAervVdoVDQVWjehR0ksAI0IOTajfNxlFkY8KZwxZ2xpr63ZX5X4eIRC0+NBz03H5+eQtl8q2MBHgdId4foeZXoiTeUpGI4oW4WPmzhwcr8EyxA/+8xg9VPCaeM2w9ikUlJiSxe2HTxtJSP63g1nlVylMiKF76xv50ri/WcZh6jVhE1cxZSyesUaIuXvB3vOYnQsoAbB6KmZIexs7O0W+UJfvRcUmIl2DKSpIZxxtO8D8TOhAUlwk18gwY4HNcTrde1u9hd+8JhrrAantkhx/s4vvJp5tWBABkkGajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGMDCzk8XNimFciOa+6jZpwtSYMXHGozQJ1RTtJb8GE=;
 b=kkiFyLAGLk4HD+HFzJ1ytzuiue1o86N8h9aAQCsIBwuW+Ans8xudzJIiaOWSddZUtcjLOEcdioN5E0vAvSo34FVf2+suaefxOgBmxzeXdVXTSrks5mGozxAjiepIohtVqIarylE/jBE1OvuayjiuvqUKMZ+DZQyDxJWqDG/HVtOvCj7l/Jcblrsatx8luIC5bHfVymJp2pwkM9lJOIpDtOyLZ7406A4aXjZUJc4ru+dW8Nct+D9FSNEgBBpj6Eofd63cwnMyROzMHPCbBhUECW9qKJN1nnAjRqV4sSbeKfzruzu+3MILR5WNKh7RaDLZcVyBvl29QKIeTMxugv+cuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGMDCzk8XNimFciOa+6jZpwtSYMXHGozQJ1RTtJb8GE=;
 b=oBxCT8LeSsvhnA2Cfb9jXHQgfEQl+medmMgqed9HF+nzhTWxGd+1wYJw/zuyBmWhCKeFefrfsmgvqvuKbWt/vHeXc75nobQqyJq1VXAvEu6ztEbVzwKDjw+srEyJNcC2KIx5e8OUEoPO8P48HfDj0BJG0EBShGPmQS/QxaSMZzg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB6329.jpnprd01.prod.outlook.com (2603:1096:402:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Sun, 2 Feb
 2025 10:34:12 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8398.021; Sun, 2 Feb 2025
 10:34:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] media: platform: exynos4-is: Use
 of_get_available_child_by_name()
Thread-Topic: [PATCH] media: platform: exynos4-is: Use
 of_get_available_child_by_name()
Thread-Index: AQHbdJFM+5zV5m5Vv0WZwWuoO3ADiLMyWBUAgAF6mKA=
Date: Sun, 2 Feb 2025 10:34:12 +0000
Message-ID:
 <TY3PR01MB113463F9B71F894BF96BC53FE86EA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250201100833.34642-1-biju.das.jz@bp.renesas.com>
 <7fe9dad9-85e2-4cf0-98bc-cca20ff62df5@kernel.org>
In-Reply-To: <7fe9dad9-85e2-4cf0-98bc-cca20ff62df5@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB6329:EE_
x-ms-office365-filtering-correlation-id: e63b5aa8-8a3b-4bc4-d63d-08dd437522a7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YWs1OVZZbXBpNEExbnJEV0VwcE5HbDVMSmsyVkZuWEpzR1ZLQ2RtN2x3OUVF?=
 =?utf-8?B?aEdEb0FJeDNhZ1dFOGhlSm5BYnVuaDJEU2Zhem9RUTRPR3duaHA4OEFTRHhI?=
 =?utf-8?B?bVFDZlBuUEJ1Vm55MEl0QTA0U0o5aE13NU9IdVhaelMydFB2dXBpMHpxK3hk?=
 =?utf-8?B?amZFeWNkbW1GZUdSbjJVQlJFM1NDbDRkSWVtYVIzQmVZbnR6Qk1ldC81WDRC?=
 =?utf-8?B?Y1dJYTNLODhkVENCZ2tZN1dMeTVaZGJCQi9GVTBocW5VVHFZb1ZQemtnVm5W?=
 =?utf-8?B?bEhZcmdWeUNPSWJSQ2NUU2R0VTVteFFkZXkySG1tMFAwWG5BSTJUNm80WGNo?=
 =?utf-8?B?QTRzREREOXF0am43YUZDcktiU0s3Y2liOWxXY2QvVVQxcVVlTmhKYkp6UnRT?=
 =?utf-8?B?R1AyYm9lemhORi9PR01RTUpnMzRGOUpqRlB3RVYvb1NaSTRaN085RlZ1YkNs?=
 =?utf-8?B?aXdRc1pPTFNWb2UyVlY0M3BvY2syaFlST3IyWDFPSWs1TkRFZ2hUWU14QUJB?=
 =?utf-8?B?VTJmbitweHovVGFNVlVDZCsyR2lEalQrak94RGhvSVkxUFJTZmJaOGxyd1ha?=
 =?utf-8?B?VklWMzU1V2lVOXFEcTg4ajAreUNYZWZrc0dQejFQV0ZtWXMwOTl1blVFdmpE?=
 =?utf-8?B?NFcxb24wcVBlcVlwZklwUVU0MGpUU2xFS01qWm00QjhmOE4rb3dxbUFLbFJv?=
 =?utf-8?B?elR0bWcwMGdTOE1aUmh2YzBvbWNOMzRrT3MyQjVocldKcVZrd0RNYlJjWDRa?=
 =?utf-8?B?YU5US2xhaWcyOGs3aDhmUXdnVW9CS2svTklrMWhQSjcyeTNGY0hEakJ3L2ZU?=
 =?utf-8?B?S0xVTVh4WFArdUpibVpFNEVMeHZrUzFYZ3BEMFhVNWhyamdRK1Y2RDFUUy9l?=
 =?utf-8?B?OEFsLzJUVTVlRGZ1eFRNSUNXQVNSNkxrZDVrbXFCOGF2QUNTbERTczJER21F?=
 =?utf-8?B?TjJ0VjVUSGJzR2ZOMmR4dkxRMHZWQVVnbDNQTW56Wlk2Y2VxMnhOTktzbE8r?=
 =?utf-8?B?NU5OcGI1SW5uM2cyOWNhK2xvNjlFQ0RvZEp2SUFsVEE0N29IM3ZTdDhiVmVs?=
 =?utf-8?B?eTJwNDZKOEtnTkpNUnlVWlNIbXVyajJudHlKUVBiMExFczAvQWJacDdLaXhO?=
 =?utf-8?B?Um5qNERMY25nLzRpa3VaNEY5bVhVMUwrQVJ4ZmhlYmgrNU50eGN3Zmlnb0FP?=
 =?utf-8?B?V3U5VEVHdG1RNmtmZ0VwTkhzN2VYWS9YMXFhb0pUV0VDNmdiZm4vQnlIRWdY?=
 =?utf-8?B?ZGlldE5OUHY1MGFYbm4vanluYkl3L1lCRVdwbWVUejc3UjM3YkRpeTVJV2Jq?=
 =?utf-8?B?UDJZdmJMVWNOelJwVlh3MXBiV0ZyazhjTnJxbTd4c3lpczVlWVdLQ3VoTWdU?=
 =?utf-8?B?RU9wNExzd0RWK3JaUFJmbHVHVFkybW5mYUlNY2dBTEwzb2RmOU5jSWRxc3hi?=
 =?utf-8?B?MmZYMkdIRFNmdk5vbG5EQU5DUnZwcWpRaUgwVjZoUlo2WE5HdXJzVXRIZk1Z?=
 =?utf-8?B?ZGdqeEhTV2VQeHhEdXk1WTdHYUNkV1h2aTE1SENUM3kwbDVrQjNyWWtONGpW?=
 =?utf-8?B?WmpBVWFyUFBsRUVYR2plY3kwNHBFd1k1OWpuQTBiVmdIaHRIYmk0WDVEOFB0?=
 =?utf-8?B?clZBWmg1K1FRd3ZPNllKOWxWUy9zUzdqNlBtdWNScXRZRDg2bUZmRzI1SWJZ?=
 =?utf-8?B?enhMSVVGWXRmc09MeXJucjZUcXRKcXNOSGdFNm1mdktDbUI4OEc3Uy92b0Zo?=
 =?utf-8?B?bXhuVHdKeHRmS2hYeXdXSlR0NVA2eEorMzl3ZEdUdzVEbWo5blNpcytnRHZP?=
 =?utf-8?B?bTE2SE81R3JEcjlJSW80d1BmaEd5MWxJbTVyWGdtSEM2aEoxV2hsd3owRG5z?=
 =?utf-8?Q?888EBzYfBsJvc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aUwxLzhSeHMwaEl4QjZnUnBPSTZ6eVFoUnphSzJodk1zK1E3M3ZkdWxYZzEw?=
 =?utf-8?B?K3JzTTBpRkZSUDRzbmMzWXZtb3AwVG9XWFJkdkFOcXMvd05INlNHNkNOYkUx?=
 =?utf-8?B?NDB6OVhjRzJkVDdGR1BoWnZqZjhnUGZvMk1Wa01mY3VsbS9MbVh6STJqWUFt?=
 =?utf-8?B?NTh2b3Jja2tQNGJGbGVNdGRyT2pvVXdsY3NRclkwMkRicTZhcnI4bWtwU0dE?=
 =?utf-8?B?ajhha1F4RnMrQWdKMitMeFdzVVVzakxVR2poUFBnbzl1NFpNU0lwelNOdkx1?=
 =?utf-8?B?bWxYL0loWVJYNWh3WkFFTmZZbDQ3aDNYS0laT2pJaVdETDgrc0pWd2lPT1pC?=
 =?utf-8?B?SnFXYmRpUHRxUXp3RlFOWmdYQlNRU1Z5Mk8wcFdRTVZNSHdjV0p1NFFKYnFq?=
 =?utf-8?B?M21oOThIZ0RXNUt6ajlvdjhjSjVoemhPUFJyYWREZWxhMUtiMlpSckZROEUx?=
 =?utf-8?B?THByWG45VEZTREVxTXNabFk0emlPUUNzaUQzVDA4cjJNa29DYWRqTEJwc0Vp?=
 =?utf-8?B?QkwydVBscm1VQzlMWm13V2FJcnlxRkZjenpTY0ZmSEtubW1iZFk3YjZaNUxt?=
 =?utf-8?B?YXpwL21tNk5NRjZPYnFuQmN1YUZBNGgxeXQ5dmpJMHR2T2xLcWZZYWpyNEhm?=
 =?utf-8?B?MWF4dUU5UlR6aUhJVkdKbUZmODh1V3lHc0lTbnpQSzg2a0czc25TVi94OWZX?=
 =?utf-8?B?VmM4Q21wNWU3cWZycUVobVlYK2piU011REpNVnlzc2ZRK0kwT3A1a0luL3ZM?=
 =?utf-8?B?MVpaNTlpdlFobllydEhvSHJLa0RqY3NrRGVUamZ2UFdubFBtczRlaVdDcm1N?=
 =?utf-8?B?eE1pSzQyTGphcGk3TXJucHUza1IxdkxjYjFWUDllQlZzWExmbzhQcHlRU2tI?=
 =?utf-8?B?V09VNTRGMmRmL1ZMMW9MTGFaZWh6aUNkWmQ0aFAzQUN1bTlldHp1V2N3aHNp?=
 =?utf-8?B?ZzlLYVFhZkRpZjRGU0ZXNnFmTWJROGVaUnBKakNwc3I2MG52RzdobDV1RFIz?=
 =?utf-8?B?b25INW9QbkJBSC9NL1VTajQvVnU1RnZpVCsvU0dZTXNPakhMUEZ0SnljdGhV?=
 =?utf-8?B?QW1ycGZGNStXelVkcXhPcENjQitGSXAyYUI0eUdEZ2NyWkNaTkd3UU43Z1Fw?=
 =?utf-8?B?RzJZY0xtYzJadFljblZXL0hSbG5CdklBSW5jRzVscnoyMFBSeXFyKzNLQXVY?=
 =?utf-8?B?NC9UMTRQSEVUaHNJdE96b25sZUd3YmtVeHhLaXU2VU5tRzhPc2hSSm5abE5Q?=
 =?utf-8?B?M2ZJVllJeDlyMFErTTYvcFd3MmxjMGZHZzNMb2gyZXcvcEwvY1hRNmRJUHg1?=
 =?utf-8?B?dHhEOUxzQzR1OTAvdThkcUVWSVNNVy95eEhrNU8vMHdPQVRDb2xTSHArQlpu?=
 =?utf-8?B?Y1J0TDAxcTFhMmVLRUx5K0g4eExyd2RFODRsbCtKU0tXd3dhNnNYTDd2ZFFM?=
 =?utf-8?B?TmdaeGRCa0IxRHJWaW1RaWc2Zm5tSnNtTjZoWkt2LzhQNjJPMmxyczRhK1Fq?=
 =?utf-8?B?T3VXZU5ZUEN0UTN3SXJtNVErOXpXckdPa2VmNUwwcXNXZy90MzJYZHVHdEN5?=
 =?utf-8?B?QW1Wb1daMmdSbDNDY2plSnlMbnR0K2R2a25FbmNSMUE1c1BFbUlSQyszREc3?=
 =?utf-8?B?QVdYdWFOaXhVNjZWZ0RWNDQ2cEhqK1ZUUTUvU1RKQUtiZnEwQW5LdU1JUXl5?=
 =?utf-8?B?RWpsNlQ0dmlwUGNUbEt6bGM4cmJpc3dMQk4vNXlwUGFoaUVxUlVleE9oeWo2?=
 =?utf-8?B?Wjgxa2pOWHo1ZHRaL3dyN0xEWXdMOWZDbUhUOU52U2QveFRDVEhoM0NZTy9x?=
 =?utf-8?B?cHFxcVp0YVhFRE02OGNWRUMwWmpacFFwRnhHM3VOUVZ5NHRPK1JoUUZnVS9F?=
 =?utf-8?B?U0htS3duNHdleElqRm9EV2ExZkNhNElTU3VqL01UVm5GTE1QK04wRjZPR2Rr?=
 =?utf-8?B?dlNlOWNJa0diSUNNT3JVMURvWWdSMXNOUFNPSlV0cFl0bHcwY2Z4Y291a2Z6?=
 =?utf-8?B?MEhzN1YvK2V6RVpsSzVnNjB5OWE0ZHhWSHF5bFh2Q3F6amF1VVNGNnVtdFVj?=
 =?utf-8?B?Z1U5NUZZaDVBZ1pKTUJrejI1YWZjeHFxaW1ON2pYVW1KTXFobkt1TytnWlRu?=
 =?utf-8?B?NW8rNG5jamE4S2kybFB3Yy8xOFZQM1F3c1l4QWR5bURrL0d6Y0NtcGM0OXFa?=
 =?utf-8?B?VXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e63b5aa8-8a3b-4bc4-d63d-08dd437522a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2025 10:34:12.8013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sdpgDdeN5MNReIhTZwscQW36ByzZQ3kxISzDmYh4NpsZ5G+FJGiiynkXCqRzO5pX8AXjYqfa+M4peNVUPUgsGvS9uOXpyCfYfx5ibdd0FFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6329

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDAx
IEZlYnJ1YXJ5IDIwMjUgMTE6NTkNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gbWVkaWE6IHBsYXRm
b3JtOiBleHlub3M0LWlzOiBVc2Ugb2ZfZ2V0X2F2YWlsYWJsZV9jaGlsZF9ieV9uYW1lKCkNCj4g
DQo+IE9uIDAxLzAyLzIwMjUgMTE6MDgsIEJpanUgRGFzIHdyb3RlOg0KPiA+IFNpbXBsaWZ5IGZp
bWNfbWRfaXNfaXNwX2F2YWlsYWJsZSgpIGJ5IHVzaW5nDQo+ID4gb2ZfZ2V0X2F2YWlsYWJsZV9j
aGlsZF9ieV9uYW1lKCkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gVGhpcyBwYXRjaCBpcyBvbmx5IGNv
bXBpbGUgdGVzdGVkIGFuZCBkZXBlbmQgdXBvblsxXSBbMV0NCj4gPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNTAyMDEwOTMxMjYuNzMyMi0xLWJpanUuZGFzLmp6QGJwLnJlbmVzDQo+
ID4gYXMuY29tLw0KPiA+IC0tLQ0KPiANCj4gRGVwZW5kZW5jeSB3b24ndCBiZSBpbiA2LjE0LXJj
MSwgc28geW91IHdpbGwgbmVlZCB0byBzZW5kIGl0IGZvciBjeWNsZSBhZnRlciB0aGF0Lg0KDQpP
Sy4gV2lsbCBkby4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=

