Return-Path: <linux-media+bounces-16704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 872C695DEE4
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 18:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4BDE1C20EBB
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 16:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB08143C50;
	Sat, 24 Aug 2024 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="e5sC+CFF"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E011122F11;
	Sat, 24 Aug 2024 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724515927; cv=fail; b=MzDyNVHM9rGACka/Cx5q1/ZkiFgVrrkh2w11/dUfDXdnQ+gVbGRS3R39dArfGuIs/AsYthPcgOOpWbeY9mIQr47Yde6I8c1SDHkAgVfrslnq3epVUqvTnNJJuQAcKq0ly2+wXLWdUkOJQ3nI/h5UzWQuxylBcL82m/XQY/kYCn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724515927; c=relaxed/simple;
	bh=284p9WSqxbXOmTKm1T/zlB5cZrX3DjQqu+9Vy0IhEw4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O6kNs7X6HPC7ml/7u6NGiBdksOP1neqJbZexv87AjsS66eLlKXke4lhrpAh9r2oqQkIjRRKtflaQaAiR8ZcSsyNC05RN4ueOM9K1h468/tpi5bQTgKQDfChxYQz58dxuPKSj2PfdHj2h8fNhEhHGOWTGIsjZm5bcXT4vmuAhYmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=e5sC+CFF; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KD5PgEeDc/VOO7qKzkf0kWrhWgyRy5EbYQAjhmyAkIyqmwzmVqhL5oKSswxu09+XRrk9K7bsHEBIw3gvp5sSxwabrntr+eljmV3O4gbjGQyqfo9SWrTiMwuDEp6FxWdIOfNV12qBIsJgNCAAHO6Mfr1+4GNun45kqd+mXezFDMpmhSqR5NuemJ4wsOk01TBpZCDWXPMwp/v+eaeJZSNsFVun94cEXizSn98ip/7086BdhHcri2jIPFO9e85V2E+iShVZ4tg4YJDqRnufz9+/S2xJfJ4qq+M6QXeK2KZ1E9HinjqPdDJPwQAJ3wymqEIEKE5Ki8G+ncoq+oYs2xKP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=284p9WSqxbXOmTKm1T/zlB5cZrX3DjQqu+9Vy0IhEw4=;
 b=rH10WCVzAd2xI/c5L0Q9SJD9oi7NoGZVuSxOpyAHeNORm7w7qcPxIWLtc1WgoEJzTajMEV7j2wQ958f0061tQjQpuJWLzGB9QeKKPFepvVkvIa8r3GmrFQEIo2YTCF/vjrufe3iURynji0IaiywA/isvf0Fv2ocLq9LORekvp9gIntjUusbM7AuufByB+ZwFWp/WBaYaXuB3xa6mVGT+NBqx6a85D0TYEoPxJRgsR+ASgI8srs4DHWKE6ublPVffX4IPo5l78VRyMfVkwwfdKGiQBqoS+hGo50gO2PJVSAO6BoqLJuu3lqeUteZJPt86bTBEIHTq1Js6i6sN2zESRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=284p9WSqxbXOmTKm1T/zlB5cZrX3DjQqu+9Vy0IhEw4=;
 b=e5sC+CFF3+/mSl2LWSBMvHnF8m5RfzAYEXE6591GsE7YFY8weoD+BhcJqn3j6lrwTGkyC8Rcsm0POedWmZoH9C60MsqdEYUB/DriIxPSyDUh6NfeLYuXAG3W1F+U+KsDNmWS4qeZuQOqsYuQ2r4+8ThFuY6jCHyb6xKwlMiJl/w=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9525.jpnprd01.prod.outlook.com (2603:1096:400:19a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.22; Sat, 24 Aug
 2024 16:11:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Sat, 24 Aug 2024
 16:11:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, biju.das.au <biju.das.au@gmail.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH 1/2] media: mt9p031: Extend match support for OF tables
Thread-Topic: [PATCH 1/2] media: mt9p031: Extend match support for OF tables
Thread-Index:
 AQHZ5AAUb1WsR5L3Y02tx/63I1nzfLAVVp6AgAAAj2CAAASCgIIhxfKAgAGSZwCAAABlgIAAA/3A
Date: Sat, 24 Aug 2024 16:11:49 +0000
Message-ID:
 <TY3PR01MB113469DE26038F53246FDCF6686892@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20230910160126.70122-1-biju.das.jz@bp.renesas.com>
 <20230910160126.70122-2-biju.das.jz@bp.renesas.com>
 <tlaikk73c5gc6y3bk6evuwtlizletaws7tuc5nk36hz2adkydp@duv2tjpqnios>
 <OS0PR01MB59226056EAA42B93D123CFB586F2A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <spi52a754wa4ghwvfa6hkoqiz5rws27jlrdfnintx7dfm5ccqv@cngal3bh6eje>
 <20240823155503.GR26098@pendragon.ideasonboard.com>
 <20240824155518.GA3006@pendragon.ideasonboard.com>
 <20240824155643.GB3006@pendragon.ideasonboard.com>
In-Reply-To: <20240824155643.GB3006@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9525:EE_
x-ms-office365-filtering-correlation-id: 1f9af5dc-45f0-48d3-5396-08dcc457759a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N2Y2aGIvakxWUjFwZ3pDMXRyeW80bm80YXBTV2lmSVIvM2NXLzBndkJSNkJn?=
 =?utf-8?B?Slc2VFFpNmJpNFVXR2wwT2ZXVzBuaWE1amNFVVF3dEtvTVFkenBrTUE5Zk9y?=
 =?utf-8?B?T2NNQlR1bHN2S3ljdTFIbHdra2VhZTlFd3lyVXdoNE9yVlZRNnFXM2MySnpL?=
 =?utf-8?B?M25DUWtaVXV5eGJldDVoTzRmRXl6S2xGcFJ5OE42M1JmQkgzQkk1VURHeGhF?=
 =?utf-8?B?R3pJL1RWcG11bmdodzhmZEhVc3BqWmhKRER2Qzg4NHFYYlBEb1Fib0pEWnQ1?=
 =?utf-8?B?dWNVc2MxR3F4MFgxTGVBNXB1anBrSGsySFErUzErT3pXYitJUWdPK3NIdFA2?=
 =?utf-8?B?TGl5MVFKSy96K2N3Z1lnanBTTFEvQ3JldmVKTU1aN3h3Y2NVNzF4N2xtTGdK?=
 =?utf-8?B?VEp1YUFNTFFFbHB3cCtEcThYZ0dLU2NaSE1tYWUxZHpLYzJVVjVCZ01Fcjlr?=
 =?utf-8?B?U3B0ZjRZSjdzVHJBb1R6UTlJZ3Zpb01kQ2FQR2hidk5KNjZKWHQ3OUp2MDFT?=
 =?utf-8?B?d2pyZXluQ3Ixb3BocE1WYUk3QW0vV3pHZHQvRkRGU092VkZlbHN2aVZjS29m?=
 =?utf-8?B?ak1TN1RMTy92RDIzbkVyQXdRamtBck8rUnBiKzZxaHdJUXIwanFDWDVZckhM?=
 =?utf-8?B?UlVEK3ljWkgrQzEvbERUd3hnQ2dsZFhQNGoxRGlTNzJIMTRQek82UFN3SGQ0?=
 =?utf-8?B?K0tWdTNaNnBBR1RwQmNVNlU1bWVKTmsybVorZXp6NStRRTB3Q0FVV2FuMCtB?=
 =?utf-8?B?bnNyWlBWME5rYkRIRk9UWkxGZC8xbW56NDJzQXRvOFFEWGcrSCtrU2lxQnRW?=
 =?utf-8?B?aFlRSXZETm5PN0dDVnlyVXJ1M3ZRMXJLMWJJaVNGRXEyalZaZFN4ckxmV0RM?=
 =?utf-8?B?ZXorZlN6b00rbERVTjEzRnJmYlNEV0lPUFRHR2FxUDhVd1ljQlN4UC9oWmFx?=
 =?utf-8?B?NTNUK0RXWVBSbFR0c0VWOWpaamd5TjlmSVdUZmhWaGlMS0FwVjlKUVgwdDhl?=
 =?utf-8?B?TU45TzRQcVBtaG5LanJyUG8rWHhTaUx3NVJPbmRic2hlVVZublZYMVp3Q3do?=
 =?utf-8?B?R2J6ZmhtRFlsWC9Jc0pBNmw5NURpYllYM0hEKzNNakJYdFRhUG9RMlUvdUls?=
 =?utf-8?B?OTNsMkZ0Z0Z2THlVMkcyUGd1dFdTamxzeTNjYUJuVm5RY1lwMGtVNjlhVVZI?=
 =?utf-8?B?a21EUlFzeVVOWlN3c2t4TllMbFFVT3EvaGxIOGdQZldWNFRKc0lVd09JQ3Bh?=
 =?utf-8?B?d2tJL1gyNGJob2FZTkovRERNc1VYa0lMaVdKdWtNdEpIVGVQVjd2amJDT0tU?=
 =?utf-8?B?K3I2aU5ramVJMlNRN05qSW9GZEljZjFLVURRN2VsS0lEYkQ3N0R6bXloQ3ds?=
 =?utf-8?B?R1FBL2xJQkUrZ3Q1Sm80eVlpdWVHcmZKQllXSWFJNm1GMWRJcGZtbVJFZkM3?=
 =?utf-8?B?ZDdCNHFzOW1tL21zU0s4KzhJck5ta214SDJjWnhiaEZ2ck5YanptQ2x2aUZm?=
 =?utf-8?B?eW5QM0xxakRRZlNacFB4bU9tWVduaGhldnA1eUI5Z2VjRTc4T09oMEtvbjNI?=
 =?utf-8?B?cTl6b2VaRjNUV1BLbThUN3NmcmNxTXkrZUNuSmc0ZnZxUEZDY2U2c2gvc08z?=
 =?utf-8?B?Ym1ObGVKSEVaY2JUSW1WeWsyRldROU1ueTdDWjRBQVhPMG1XcytLU1BVcm80?=
 =?utf-8?B?dllPTnRxWXorbHNieVNQeWY3Unk4Sm50dWNtVGNkcGgyNjBnSHQ4Vk1EbDJ5?=
 =?utf-8?B?Zi9sck83MmpwK1dsaXdKMitzNzYzWUtueGx1UTRDVlpwOFlBS0kwSk9tMHlP?=
 =?utf-8?B?MXpuNnhuay9GNWtibE1CQllpRVM4ajFPTTlNRUFaTVVQU2tNb3ZVcHNUVjlF?=
 =?utf-8?B?QW13NVZmdlJtd05oaEI4azRUVUo4ZWVMYlpUTEFPbWhLNkE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a0h0ekdraDY5Q3JkZWpnNmY2WTFuTnJpdVg0dHlYaEVlclFRaHIwODgvODRF?=
 =?utf-8?B?VnZjWjNrb1hBYURLMklXN1BLb0tRSzJXc0lpV3ZaUCswN1BHRTZCT09MSzJn?=
 =?utf-8?B?TENuYll6SzhUVXM2S0tHSUZ2dythZlRFSTl4WG9pMGxnS0ZSZm1EVEdITUdm?=
 =?utf-8?B?a1JXZjJrU2IwdERVSzZ0dE03MWdpMEhLUTZJT2V5alNxMmNLVlYvendsWTUx?=
 =?utf-8?B?alN6Y2hMWHN2elVrdUZIN1U0TDliMVE3R2hYcVNtd1NvZHkya3U0YXZwWDlm?=
 =?utf-8?B?TmlpeEZObHhQMktDc285WmlPM3R4V3lHMEJGem1GN2tsZSs0NlRDQndmZS9h?=
 =?utf-8?B?MmdWSStqWnlldlBtNVJiVXRqeDlILzlsTlhNQXBDcnZRdlJIV3MzcTJ5Q3ZF?=
 =?utf-8?B?b1M2aU5mYXkzbm9yR1MrbXZHK2NrQVMrME5ZQ2tjbzZhZGJ1eXFJRWJmYVdx?=
 =?utf-8?B?Zk1oZHd1dGlzVk9qdnByWkdscVhiVWE3Vkk0MjQwM2R6Wkl4ZXRCWUpkeTNM?=
 =?utf-8?B?Q2V1eEp6YVFFaHU5ZnlJMkhmQTVOckRPdDAxd0p0Q3BRcG9OY1hJWmY2a2Qr?=
 =?utf-8?B?N2hCU1orY2NtcklrV3NQWkpRbldBRHNIc3pya2t4RVp0djNGU0FoNG5xdUVX?=
 =?utf-8?B?c0hCTEVKSC9ERjJ3aGlaRmZ6M0FYUmdrWDEvQ3RGaEdiVXBWVWNJZUZyRVdp?=
 =?utf-8?B?cWxXQXhIdEJSRGtmOW9EM1ZDZlE2V3ZKNTdtclJ5WWxSSGptYzIrRTQ3ak5D?=
 =?utf-8?B?Z0VnMkFFRy8reC91ek1Mei9tMUZaZjlwN2ZOYUhwc3daS1BHS0ZvVUVRSStn?=
 =?utf-8?B?MXJBWTN1UXh5S00vazlXYUZBZjY3N0wyeCs2RnRHMTc2bUd3Mk5vbTREMm1Z?=
 =?utf-8?B?Zkl5ZDlqMCsrU0w4SzRndUNrOHQyTUU1cWhXTGgyMllJZXNhUVcwT2pUeE5K?=
 =?utf-8?B?TFlNT0toeThqait1TEJCY2M0Z2dOVElldXl0NEhROVFUQW5sME1CZWlpWi9o?=
 =?utf-8?B?RlliUmpTU1FSR24vV2puL1lOYzlnbmEybTBjWXUzQmRSWkdiRHFkaVhpN0pN?=
 =?utf-8?B?OHBMZXZPSkx4U2pHNkJIQ29UYUJUb3F4UkphMkZWejRZdWJoc2doenBsMi9o?=
 =?utf-8?B?RDMyZ3dKZkp4SkwzTVErU1REeWJSWWhrM2U1VDhsallCTDA1a0hXYVdqb1g0?=
 =?utf-8?B?QnBmK3lSbWY4NTRJcjhvZERSTkZqR1Y1b3RKVXF1RXZPbXhXdzVrN1ZqYTlB?=
 =?utf-8?B?M05MWjR2dHZlU1djVlRUWnh5V01jR1NTYUZudVpRVFYwWUlIVzVuSHBDSDJQ?=
 =?utf-8?B?MWlZRFg4UFppL0VIVzVkTVBtOUpQWEl4YUNQQVBSRGJBTXRXcnJibnZjZ2xw?=
 =?utf-8?B?aGZoV3NjRWY2RGlONnhEcklUNDRxaUk4RHFYeUZ2Umhjb09UUlNnNEU0TURm?=
 =?utf-8?B?eUh1UjhkeDdrR09HVFd1WnVlazZzbUZzWk9FdFZ5N0NISFFyNVZzSkZTbjgw?=
 =?utf-8?B?QWJzZkxETW92blNkbFNZMld3ejRnOUNpSW8zZCtzdVNFQTJySW5zeWtaOCtu?=
 =?utf-8?B?S1J5UlhhbElKVVhSVjNiZU5FV01WZ0ZOK0VwMHYyV3RPdWx3OGVpVHBUZkhN?=
 =?utf-8?B?czdmQ0lRb3FNNGhSbkRWd09WTE1ubWpMS1dxZnZXRE9vMFF3c2JQYTlUZTk0?=
 =?utf-8?B?a21ULzQ4N1BQN2RKUlp3TEV1dU82SGdseGwzdUZmS01WY1BmTXpOcG8yNDBF?=
 =?utf-8?B?cEZDbms2N0xQcXViYVBWQjF6Z0o3Q01VSjc0ZC9rUzVYdkdSVFFtMkJFdXBz?=
 =?utf-8?B?eXdnZGpSY2pGaFVQWVg5dUFYVU9yRUpRQkJ4anN2Q3Z5SVM0YXRRK0FzQUk3?=
 =?utf-8?B?MWhDZTZLUzdmRjlsQXJLR1BOZVIyOFZMTG5uL1kwQXRWdWQ5MjM3RWtIN3lT?=
 =?utf-8?B?eGJ0L0dpVkdiUWNtNXpGbkNrQUw4eCt0ZUJvNXVyTmdUSkV6bDhhaG1BWG1y?=
 =?utf-8?B?QzU3ZE5uOXVvSHprQ0x4b2Jid3B3TVFOQUdieDJaTm9FWC9EeGk1bHVScWRs?=
 =?utf-8?B?L05YZlhHVXJYRk41K3k2UFQzR3dPSlRxbGxES0xmSGNybmsyMUEzdzFMOXU4?=
 =?utf-8?B?ditZakJjSnlJakNLMUZHNXAyWExXeFkydDRnR0MxTFdaWTlzamRqckNBc1hv?=
 =?utf-8?B?Mnc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9af5dc-45f0-48d3-5396-08dcc457759a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2024 16:11:49.3902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r1FK6z7508MIBvY8ufHhz0lgxCh2x6LfpmC0x+OgeyBKM8ik9HH9qandKuoxxYlbZuLyYwVNZrvzm8lCySWi5CaquFxFlDP9B1+qnHCADfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9525

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IFNhdHVyZGF5LCBBdWd1c3QgMjQsIDIwMjQgNDo1NyBQTQ0KPiBUbzogSmFjb3BvIE1vbmRpIDxq
YWNvcG8ubW9uZGlAaWRlYXNvbmJvYXJkLmNvbT4NCj4gQ2M6IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT47IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVs
LmNvbT47IE1hdXJvIENhcnZhbGhvDQo+IENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPjsgbGlu
dXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBi
aWp1LmRhcy5hdQ0KPiA8YmlqdS5kYXMuYXVAZ21haWwuY29tPjsgQW5keSBTaGV2Y2hlbmtvIDxh
bmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
MS8yXSBtZWRpYTogbXQ5cDAzMTogRXh0ZW5kIG1hdGNoIHN1cHBvcnQgZm9yIE9GIHRhYmxlcw0K
PiANCj4gT24gU2F0LCBBdWcgMjQsIDIwMjQgYXQgMDY6NTU6MTlQTSArMDMwMCwgTGF1cmVudCBQ
aW5jaGFydCB3cm90ZToNCj4gPiBPbiBGcmksIEF1ZyAyMywgMjAyNCBhdCAwNjo1NTowNFBNICsw
MzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPiA+ID4gSGVsbG8sDQo+ID4gPg0KPiA+ID4g
T24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgMTE6MjU6MDNBTSArMDIwMCwgSmFjb3BvIE1vbmRpIHdy
b3RlOg0KPiA+ID4gPiBPbiBNb24sIFNlcCAxMSwgMjAyMyBhdCAwOToxNDozNUFNICswMDAwLCBC
aWp1IERhcyB3cm90ZToNCj4gPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBtZWRp
YTogbXQ5cDAzMTogRXh0ZW5kIG1hdGNoIHN1cHBvcnQNCj4gPiA+ID4gPiA+IGZvciBPRiB0YWJs
ZXMNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBIaSBCaWp1DQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gT24gU3VuLCBTZXAgMTAsIDIwMjMgYXQgMDU6MDE6MjVQTSArMDEwMCwgQmlqdSBEYXMg
d3JvdGU6DQo+ID4gPiA+ID4gPiA+IFRoZSBkcml2ZXIgaGFzIGFuIE9GIG1hdGNoIHRhYmxlLCBz
dGlsbCwgaXQgdXNlcyBhbiBJRA0KPiA+ID4gPiA+ID4gPiBsb29rdXAgdGFibGUgZm9yIHJldHJp
ZXZpbmcgbWF0Y2ggZGF0YS4gQ3VycmVudGx5LCB0aGUNCj4gPiA+ID4gPiA+ID4gZHJpdmVyIGlz
IHdvcmtpbmcgb24gdGhlIGFzc3VtcHRpb24gdGhhdCBhbiBJMkMgZGV2aWNlDQo+ID4gPiA+ID4g
PiA+IHJlZ2lzdGVyZWQgdmlhIE9GIHdpbGwgYWx3YXlzIG1hdGNoIGEgbGVnYWN5IEkyQyBkZXZp
Y2UgSUQuDQo+ID4gPiA+ID4gPiA+IFRoZSBjb3JyZWN0IGFwcHJvYWNoIGlzIHRvIGhhdmUgYW4g
T0YgZGV2aWNlIElEIHRhYmxlIHVzaW5nIGkyY19nZXRfbWF0Y2hfZGF0YSgpIGlmIHRoZQ0KPiBk
ZXZpY2VzIGFyZSByZWdpc3RlcmVkIHZpYSBPRi9JRC4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ID4gVW5pZnkgdGhlIE9GL0lEIHRhYmxlIGJ5IHVzaW5nIE1FRElBX0JVU19GTVQgYXMgbWF0
Y2ggZGF0YQ0KPiA+ID4gPiA+ID4gPiBmb3IgYm90aCB0aGVzZSB0YWJsZXMgYW5kIHJlcGxhY2Ug
dGhlIElEIGxvb2t1cCB0YWJsZSBmb3INCj4gPiA+ID4gPiA+ID4gdGhlIG1hdGNoIGRhdGEgYnkN
Cj4gPiA+ID4gPiA+ID4gaTJjX2dldF9tYXRjaF9kYXRhKCkgYW5kIHNpbXBsaWZseSBwcm9iZSgp
IGFuZA0KPiA+ID4gPiA+ID4gPiBtdDlwMDMxX2luaXRfY2ZnKCkNCj4gPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ID4gRHJvcCBtdDlwMDMxX2luaXRfY2ZnIGFzIHRoZXJlIGlzIG5vIHVzZXIuDQo+
ID4gPiA+ID4gPiA+DQo+IA0KPiBJJ2xsIGRyb3AgdGhpcyBzZW50ZW5jZSB3aGVuIGFwcGx5aW5n
Lg0KDQpPSyBmb3IgbWUuDQoNClRoYW5rcywNCkJpanUNCg0KPiANCj4gPiA+ID4gPiA+ID4gV2hp
bGUgYXQgaXQsIHJlbW92ZSB0aGUgdHJhaWxpbmcgY29tbWEgaW4gdGhlIHRlcm1pbmF0b3INCj4g
PiA+ID4gPiA+ID4gZW50cnkgZm9yIHRoZSBPRiB0YWJsZSBtYWtpbmcgY29kZSByb2J1c3QgYWdh
aW5zdA0KPiA+ID4gPiA+ID4gPiAodGhlb3JldGljYWwpIG1pc3JlYmFzZXMgb3Igb3RoZXIgc2lt
aWxhciB0aGluZ3Mgd2hlcmUgdGhlDQo+ID4gPiA+ID4gPiA+IG5ldyBlbnRyeSBnb2VzIF9hZnRl
cl8gdGhlIHRlcm1pbmF0aW9uIHdpdGhvdXQgdGhlIGNvbXBpbGVyIG5vdGljaW5nLg0KPiA+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gPiAgZHJp
dmVycy9tZWRpYS9pMmMvbXQ5cDAzMS5jIHwgMzMNCj4gPiA+ID4gPiA+ID4gKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTEg
aW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9tdDlwMDMxLmMNCj4gPiA+ID4gPiA+
ID4gYi9kcml2ZXJzL21lZGlhL2kyYy9tdDlwMDMxLmMgaW5kZXgNCj4gPiA+ID4gPiA+ID4gMzQ4
ZjFlMTA5OGZiLi41NDBjYjUxOTkxNWMgMTAwNjQ0DQo+ID4gPiA+ID4gPiA+IC0tLSBhL2RyaXZl
cnMvbWVkaWEvaTJjL210OXAwMzEuYw0KPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL21lZGlh
L2kyYy9tdDlwMDMxLmMNCj4gPiA+ID4gPiA+ID4gQEAgLTExMiwxMSArMTEyLDYgQEANCj4gPiA+
ID4gPiA+ID4gICNkZWZpbmUgTVQ5UDAzMV9URVNUX1BBVFRFUk5fUkVECQkJMHhhMg0KPiA+ID4g
PiA+ID4gPiAgI2RlZmluZSBNVDlQMDMxX1RFU1RfUEFUVEVSTl9CTFVFCQkJMHhhMw0KPiA+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gPiAtZW51bSBtdDlwMDMxX21vZGVsIHsNCj4gPiA+ID4gPiA+
ID4gLQlNVDlQMDMxX01PREVMX0NPTE9SLA0KPiA+ID4gPiA+ID4gPiAtCU1UOVAwMzFfTU9ERUxf
TU9OT0NIUk9NRSwNCj4gPiA+ID4gPiA+ID4gLX07DQo+ID4gPiA+ID4gPiA+IC0NCj4gPiA+ID4g
PiA+ID4gIHN0cnVjdCBtdDlwMDMxIHsNCj4gPiA+ID4gPiA+ID4gIAlzdHJ1Y3QgdjRsMl9zdWJk
ZXYgc3ViZGV2Ow0KPiA+ID4gPiA+ID4gPiAgCXN0cnVjdCBtZWRpYV9wYWQgcGFkOw0KPiA+ID4g
PiA+ID4gPiBAQCAtMTI5LDcgKzEyNCw3IEBAIHN0cnVjdCBtdDlwMDMxIHsNCj4gPiA+ID4gPiA+
ID4gIAlzdHJ1Y3QgY2xrICpjbGs7DQo+ID4gPiA+ID4gPiA+ICAJc3RydWN0IHJlZ3VsYXRvcl9i
dWxrX2RhdGEgcmVndWxhdG9yc1szXTsNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gLQll
bnVtIG10OXAwMzFfbW9kZWwgbW9kZWw7DQo+ID4gPiA+ID4gPiA+ICsJdTMyIGNvZGU7DQo+ID4g
PiA+ID4gPiA+ICAJc3RydWN0IGFwdGluYV9wbGwgcGxsOw0KPiA+ID4gPiA+ID4gPiAgCXVuc2ln
bmVkIGludCBjbGtfZGl2Ow0KPiA+ID4gPiA+ID4gPiAgCWJvb2wgdXNlX3BsbDsNCj4gPiA+ID4g
PiA+ID4gQEAgLTcxNCwxMiArNzA5LDcgQEAgc3RhdGljIGludCBtdDlwMDMxX2luaXRfY2ZnKHN0
cnVjdCB2NGwyX3N1YmRldiAqc3ViZGV2LA0KPiA+ID4gPiA+ID4gPiAgCWNyb3AtPmhlaWdodCA9
IE1UOVAwMzFfV0lORE9XX0hFSUdIVF9ERUY7DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+
ICAJZm9ybWF0ID0gX19tdDlwMDMxX2dldF9wYWRfZm9ybWF0KG10OXAwMzEsIHNkX3N0YXRlLCAw
LA0KPiA+ID4gPiA+ID4gPiB3aGljaCk7DQo+ID4gPiA+ID4gPiA+IC0NCj4gPiA+ID4gPiA+ID4g
LQlpZiAobXQ5cDAzMS0+bW9kZWwgPT0gTVQ5UDAzMV9NT0RFTF9NT05PQ0hST01FKQ0KPiA+ID4g
PiA+ID4gPiAtCQlmb3JtYXQtPmNvZGUgPSBNRURJQV9CVVNfRk1UX1kxMl8xWDEyOw0KPiA+ID4g
PiA+ID4gPiAtCWVsc2UNCj4gPiA+ID4gPiA+ID4gLQkJZm9ybWF0LT5jb2RlID0gTUVESUFfQlVT
X0ZNVF9TR1JCRzEyXzFYMTI7DQo+ID4gPiA+ID4gPiA+IC0NCj4gPiA+ID4gPiA+ID4gKwlmb3Jt
YXQtPmNvZGUgPSBtdDlwMDMxLT5jb2RlOw0KPiA+ID4gPiA+ID4gPiAgCWZvcm1hdC0+d2lkdGgg
PSBNVDlQMDMxX1dJTkRPV19XSURUSF9ERUY7DQo+ID4gPiA+ID4gPiA+ICAJZm9ybWF0LT5oZWln
aHQgPSBNVDlQMDMxX1dJTkRPV19IRUlHSFRfREVGOw0KPiA+ID4gPiA+ID4gPiAgCWZvcm1hdC0+
ZmllbGQgPSBWNEwyX0ZJRUxEX05PTkU7IEBAIC0xMTA0LDcgKzEwOTQsNiBAQA0KPiA+ID4gPiA+
ID4gPiBtdDlwMDMxX2dldF9wZGF0YShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiA+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gPiAgc3RhdGljIGludCBtdDlwMDMxX3Byb2JlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQpICB7DQo+ID4gPiA+ID4gPiA+IC0JY29uc3Qgc3RydWN0IGkyY19k
ZXZpY2VfaWQgKmRpZCA9IGkyY19jbGllbnRfZ2V0X2RldmljZV9pZChjbGllbnQpOw0KPiA+ID4g
PiA+ID4gPiAgCXN0cnVjdCBtdDlwMDMxX3BsYXRmb3JtX2RhdGEgKnBkYXRhID0gbXQ5cDAzMV9n
ZXRfcGRhdGEoY2xpZW50KTsNCj4gPiA+ID4gPiA+ID4gIAlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFk
YXB0ZXIgPSBjbGllbnQtPmFkYXB0ZXI7DQo+ID4gPiA+ID4gPiA+ICAJc3RydWN0IG10OXAwMzEg
Km10OXAwMzE7DQo+ID4gPiA+ID4gPiA+IEBAIC0xMTI5LDcgKzExMTgsNyBAQCBzdGF0aWMgaW50
IG10OXAwMzFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkNCj4gPiA+ID4gPiA+ID4g
IAltdDlwMDMxLT5wZGF0YSA9IHBkYXRhOw0KPiA+ID4gPiA+ID4gPiAgCW10OXAwMzEtPm91dHB1
dF9jb250cm9sCT0gTVQ5UDAzMV9PVVRQVVRfQ09OVFJPTF9ERUY7DQo+ID4gPiA+ID4gPiA+ICAJ
bXQ5cDAzMS0+bW9kZTIgPSBNVDlQMDMxX1JFQURfTU9ERV8yX1JPV19CTEM7DQo+ID4gPiA+ID4g
PiA+IC0JbXQ5cDAzMS0+bW9kZWwgPSBkaWQtPmRyaXZlcl9kYXRhOw0KPiA+ID4gPiA+ID4gPiAr
CW10OXAwMzEtPmNvZGUgPSAodWludHB0cl90KWkyY19nZXRfbWF0Y2hfZGF0YShjbGllbnQpOw0K
PiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiAgCW10OXAwMzEtPnJlZ3VsYXRvcnNbMF0uc3Vw
cGx5ID0gInZkZCI7DQo+ID4gPiA+ID4gPiA+ICAJbXQ5cDAzMS0+cmVndWxhdG9yc1sxXS5zdXBw
bHkgPSAidmRkX2lvIjsgQEAgLTEyMjYsMTkNCj4gPiA+ID4gPiA+ID4gKzEyMTUsMTkgQEAgc3Rh
dGljIHZvaWQgbXQ5cDAzMV9yZW1vdmUoc3RydWN0IGkyY19jbGllbnQNCj4gPiA+ID4gPiA+ID4g
KmNsaWVudCkgIH0NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgaTJjX2RldmljZV9pZCBtdDlwMDMxX2lkW10gPSB7DQo+ID4gPiA+ID4gPiA+IC0JeyAi
bXQ5cDAwNiIsIE1UOVAwMzFfTU9ERUxfQ09MT1IgfSwNCj4gPiA+ID4gPiA+ID4gLQl7ICJtdDlw
MDMxIiwgTVQ5UDAzMV9NT0RFTF9DT0xPUiB9LA0KPiA+ID4gPiA+ID4gPiAtCXsgIm10OXAwMzFt
IiwgTVQ5UDAzMV9NT0RFTF9NT05PQ0hST01FIH0sDQo+ID4gPiA+ID4gPiA+IC0JeyB9DQo+ID4g
PiA+ID4gPiA+ICsJeyAibXQ5cDAwNiIsIE1FRElBX0JVU19GTVRfU0dSQkcxMl8xWDEyIH0sDQo+
ID4gPiA+ID4gPiA+ICsJeyAibXQ5cDAzMSIsIE1FRElBX0JVU19GTVRfU0dSQkcxMl8xWDEyIH0s
DQo+ID4gPiA+ID4gPiA+ICsJeyAibXQ5cDAzMW0iLCBNRURJQV9CVVNfRk1UX1kxMl8xWDEyIH0s
DQo+ID4gPiA+ID4gPiA+ICsJeyAvKiBzZW50aW5lbCAqLyB9DQo+ID4gPiA+ID4gPiA+ICB9Ow0K
PiA+ID4gPiA+ID4gPiAgTU9EVUxFX0RFVklDRV9UQUJMRShpMmMsIG10OXAwMzFfaWQpOw0KPiA+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiAgI2lmIElTX0VOQUJMRUQoQ09ORklHX09GKQ0KPiA+
ID4gPiA+ID4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXQ5cDAzMV9vZl9t
YXRjaFtdID0gew0KPiA+ID4gPiA+ID4gPiAtCXsgLmNvbXBhdGlibGUgPSAiYXB0aW5hLG10OXAw
MDYiLCB9LA0KPiA+ID4gPiA+ID4gPiAtCXsgLmNvbXBhdGlibGUgPSAiYXB0aW5hLG10OXAwMzEi
LCB9LA0KPiA+ID4gPiA+ID4gPiAtCXsgLmNvbXBhdGlibGUgPSAiYXB0aW5hLG10OXAwMzFtIiwg
fSwNCj4gPiA+ID4gPiA+ID4gLQl7IC8qIHNlbnRpbmVsICovIH0sDQo+ID4gPiA+ID4gPiA+ICsJ
eyAuY29tcGF0aWJsZSA9ICJhcHRpbmEsbXQ5cDAwNiIsIC5kYXRhID0gKHZvaWQgKilNRURJQV9C
VVNfRk1UX1NHUkJHMTJfMVgxMiB9LA0KPiA+ID4gPiA+ID4gPiArCXsgLmNvbXBhdGlibGUgPSAi
YXB0aW5hLG10OXAwMzEiLCAuZGF0YSA9ICh2b2lkICopTUVESUFfQlVTX0ZNVF9TR1JCRzEyXzFY
MTIgfSwNCj4gPiA+ID4gPiA+ID4gKwl7IC5jb21wYXRpYmxlID0gImFwdGluYSxtdDlwMDMxbSIs
IC5kYXRhID0gKHZvaWQgKilNRURJQV9CVVNfRk1UX1kxMl8xWDEyIH0sDQo+ID4gPiA+ID4gPiA+
ICsJeyAvKiBzZW50aW5lbCAqLyB9DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gSSBrbm93IGl0
IG1pZ2h0IHNvdW5kIG5vdCBuZWNlc3NhcnksIGJ1dCBpc24ndCBpdCBiZXR0ZXIgdG8NCj4gPiA+
ID4gPiA+IHdyYXAgdGhlIGZvcm1hdCBpbiBzb21lIHNvcnQgb2YgcGVyLW1vZGVsIHN0cnVjdHVy
ZS4gSXQgd291bGQNCj4gPiA+ID4gPiA+IGF2b2lkIGEgZmV3IHR5cGUgY2FzdHMgdG9vLiBVcCB0
byB5b3UgdGhvdWdoDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGUgcHJvYmxlbSB3aXRoIHN0cnVj
dHVyZSBpcywgaXQgd2lsbCBoYXZlIG9uZSB2YXJpYWJsZSBlbnRyeS4NCj4gPiA+ID4gPiBJIGdv
dCBzb21lIGZlZWRiYWNrIHJlbGF0ZWQgdG8gc2ltaWxhciBwYXRjaGVzIG5vdCB0byBhZGQgYQ0K
PiA+ID4gPiA+IHNpbmdsZSB2YXJpYWJsZSB0byBzdHJ1Y3R1cmUgYW5kIHVzZSB0aGUgdmFsdWUg
ZGlyZWN0bHkgaW5zdGVhZC4NCj4gPiA+ID4NCj4gPiA+ID4gT2sgdGhlbiwgYSBtYXR0ZXIgb2Yg
cHJlZmVyZW5jZXMgSSB0aGluay4gVXAgdG8geW91LCByZWFsbHkuDQo+ID4gPg0KPiA+ID4gTXkg
cHJlZmVyZW5jZSBhY3R1YWxseSBnb2VzIGZvciBhIHN0cnVjdHVyZSB0b28uDQo+ID4gPg0KPiA+
ID4gR2l2ZW4gaG93IGxvbmcgaXQgdG9vayBtZSB0byByZXZpZXcgdGhpcywgSSdsbCBzZW5kIGEg
djIgb2YgdGhlDQo+ID4gPiBzZXJpZXMgbXlzZWxmLg0KPiA+DQo+ID4gQWN0dWFsbHkgaXQgd2ls
bCBiZSBzaW1wbGVyIHRvIGFwcGx5IHRoaXMgc2VyaWVzIGZpcnN0IGFuZCBhZGQgY2hhbmdlcw0K
PiA+IG9uIHRvcC4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0DQo+ID4g
PGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPg0KPiA+DQo+ID4gPiA+
ID4gPiA+ICB9Ow0KPiA+ID4gPiA+ID4gPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbXQ5cDAz
MV9vZl9tYXRjaCk7ICAjZW5kaWYNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50
IFBpbmNoYXJ0DQo=

