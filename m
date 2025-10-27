Return-Path: <linux-media+bounces-45627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28567C0C24A
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 08:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7DA03B69A3
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 07:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7821D2DF14F;
	Mon, 27 Oct 2025 07:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsenseai.com header.i=@realsenseai.com header.b="A3NzRfeO"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022104.outbound.protection.outlook.com [52.101.43.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5641A0BD6;
	Mon, 27 Oct 2025 07:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761550458; cv=fail; b=RzTyX1MdoBHllISovNGxPX7UaZAtfJiOauDSTVqwpOLpHi/ZfmbaRGoUULMrICtHW6oitNeF4okOEt4oejfzxdcppGHIj+vV04F/971/RbIz1LUQuVbjSsFc9AANa8vKmHiox0y7v/Pg/EgYspcqSBKMU3+jj8Mh5Ez9gfGec3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761550458; c=relaxed/simple;
	bh=A01qmLLDpV0ygz6zqri9I5SWkOH7UQiqQ17rOjSXOhY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KoZnSMHpt1h6WIz8q3VLoBXrM4hJrOsI4o8N9B+gJzq5lK3nUyI/nJ879X2YSkaxxME3a825lRQhOqM1T8UMj+6IFzhskeNZVSwzUB/LFBRhNMZ6P2P3GGEjjDlir3Bk3ejQKvFPb9AM1BxSNtvwV+ih7L8czKNiAU/iJy3VDHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=realsenseai.com; spf=pass smtp.mailfrom=realsenseai.com; dkim=pass (2048-bit key) header.d=realsenseai.com header.i=@realsenseai.com header.b=A3NzRfeO; arc=fail smtp.client-ip=52.101.43.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=realsenseai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsenseai.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swbS3iwCAiInXHe5T7f80Ql3Pj+PmEfrNoLIYDEMCrzUq2o+k7Lf6ke4TJwKoIdZtNdXsAXOr9YN9t1xahL7hDuC5GLdkf1S9wrzGaC5v45O+MvrjutU2XUnhlIOKlO3BnNrgaCYrzE9lGS+k4tuNCIddtSyzjjrbPfFi7XDfzGnRpJbS+rRiFP/m0jgnHkilxtfHYVZP0giXn3ISPWi3wVoA0XqtRA6OOKM1mTU0xIXc/ho6t9br7j4Iu3ZnXu73BX2sZ66XcffwO5wRymLsEUDWlVWSMGu3A+UtdD9e2C/grJKsd9qqk+U9Ge4CDTitldBF/mygHJVhGvJXdoLsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A01qmLLDpV0ygz6zqri9I5SWkOH7UQiqQ17rOjSXOhY=;
 b=muT6iTMyz2sD9Fnjk4HriJ+c8FpbhXFnkV65rFieA+gF2/OVrd4RKyuyaD5LG3HrhVenGcfMRW2LBfCB5YFhrVZvq7Xg2IClWwT/Id+LQQQCok6CajzIumutPkJnkM1rKVC7nPOFzp2VHJwtTFq0hUKYH60Y4hqI7owDYDW+kmar8jdbjo1Vd3vzMVhjwboXRDRHYxWbY7im36ZbS9jpYMapW7PNIJqf3MlVWTXsi2aPLTUcuG47SWCdeZMMAl9zMRE17ysxizTGCILVwAApX47rRcHLwGhC+R0UCSgtJyYRiIBsDiT1JvFok/1MegIRs9v/aWCCa6gRf5KfQN1ccA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=realsenseai.com; dmarc=pass action=none
 header.from=realsenseai.com; dkim=pass header.d=realsenseai.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsenseai.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A01qmLLDpV0ygz6zqri9I5SWkOH7UQiqQ17rOjSXOhY=;
 b=A3NzRfeOn61IRUgGJwoyKvn2DoBQJ1avRHVp6qDvkBd04jnLkdjR2UG4UKROisqnIxO6GXrokDbVQNinx5mPfNBi4+TMSvX1eguANckxKCA1KmNGTNlxhdWz9S/32RjtmGn9NC5wUCx53Hj7lfKfPqLi202hIdsST1JVexNDd4aWwP5dHXxXSV8AjgiHDNU5xzO5IWI/ppX91tTVKHymU+WChE7DNY5ZsjhL+Mt+D3Rs3Tco6RCyjqZgLHtT9MwgOLGSWr4fEYXcbeAWIxM0tt8rUT2de1w/I7mTXvk3n/bULtQCbGYHwUcupZy9MDkqCUu3GfpFGsj0Edb20J9jig==
Received: from MN2PR18MB2479.namprd18.prod.outlook.com (2603:10b6:208:106::27)
 by DS4PR18MB927467.namprd18.prod.outlook.com (2603:10b6:8:31b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 07:34:14 +0000
Received: from MN2PR18MB2479.namprd18.prod.outlook.com
 ([fe80::5614:d442:4fef:5b6b]) by MN2PR18MB2479.namprd18.prod.outlook.com
 ([fe80::5614:d442:4fef:5b6b%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 07:34:14 +0000
From: Yogev Modlin <yogev.modlin@realsenseai.com>
To: Ricardo Ribalda <ribalda@chromium.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
	<hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] media: uvc: Add D436 and D555 cameras metadata
 support
Thread-Topic: [PATCH v3 3/3] media: uvc: Add D436 and D555 cameras metadata
 support
Thread-Index: AQHcRKoGwes/Q6CGmkS2V5eBSYLQiLTRJRsAgAN++NCAAPqFoA==
Date: Mon, 27 Oct 2025 07:34:14 +0000
Message-ID:
 <MN2PR18MB2479036AEC3EC21E5411A88088FCA@MN2PR18MB2479.namprd18.prod.outlook.com>
References: <20251024-fix-uvc-v3-0-b7f83c012ca7@realsenseai.com>
 <20251024-fix-uvc-v3-3-b7f83c012ca7@realsenseai.com>
 <CANiDSCt30UjEEZd8-8Qsuqn_Ks2pOBE1awOwmZVsHPnPHVQ6FA@mail.gmail.com>
 <MN2PR18MB2479A2A1FF7F921AD6E88C3D88FFA@MN2PR18MB2479.namprd18.prod.outlook.com>
In-Reply-To:
 <MN2PR18MB2479A2A1FF7F921AD6E88C3D88FFA@MN2PR18MB2479.namprd18.prod.outlook.com>
Accept-Language: en-IL, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=realsenseai.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR18MB2479:EE_|DS4PR18MB927467:EE_
x-ms-office365-filtering-correlation-id: e02fa8ab-b22e-496a-54ea-08de152b3a6c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?L3A5eTBycUFUTkNES3ZwUVc5RDJKSXg3YTU0cUJrbzhKM05BajRkUWgvTjVZ?=
 =?utf-8?B?MHhzS3gwMXNsMVN5aENsWSs4N1RVdnJXdS9pTHN0c3B1bE1CMWxvL3FPZ0ta?=
 =?utf-8?B?Z3huV2M5VTVXbnJkRVlPaWZJbnd5eFB4R1pZMFdITXBQcGtBRUFQZEhUUElQ?=
 =?utf-8?B?YkswNGZTZTJrSXRpUXVWdkdteWVPby95WlEzcSs1bUtveUU1Y014V2M5eGtE?=
 =?utf-8?B?ejZ0a2xlbFhCODF3NjBBRFowbFFrRjNMUE9tZ2p5N3V1VGdXMkI4QTZ4eGdk?=
 =?utf-8?B?cTNCTEY3MDdjbk55WGd1TXFSUmtJY3ppSDZ5K05rUkVScjZnandwQjJvdDNt?=
 =?utf-8?B?YmlPMWVHUndMdU1WdGQrN1ArL0hIZ3FKbU5nTDVLbG9WQzUzN0FCWGhpYm0v?=
 =?utf-8?B?WE1SbkQ4a1EwMERzckpqWE4wR0hmWUh1WlU3bUtRcWxhZEZTa0wzQ01LVmc1?=
 =?utf-8?B?VXRubWxiclVBTkZQUysrcFJ2RGRxSUhuSENLM29WK3ZDbkY3MXV2NjZUWE5n?=
 =?utf-8?B?ZFdSeXo1bldjUWdJc2F1a3Ivd2VMc2JYTEVPMnlLSHBYWHp4alFkcW9SNlY1?=
 =?utf-8?B?dmNqVGVaVkc0akpyUHF6azFNT29aNVBiMGUzRXdDSXR6UGtEQU5MNnBtUGpI?=
 =?utf-8?B?ZzdVR2FUK25tYUNGTCtnZCtoWCtTTW5vVERKV0Vhb0liUGtRN1BHOUhYdWVo?=
 =?utf-8?B?eEpwS3dlekxsdk1lTHFQNHJncFJKclVvcGU5aXQyUjdGWDVGYUE4WW45U003?=
 =?utf-8?B?di9BNWlzLzlxZk9tMXhZMWZ0YUx1UVdrR0lnbCtzVlBGQnJSc0dQZkc4Vy9h?=
 =?utf-8?B?eCs3UjZsNjJjVkhlemJQeEZ5UVNSL3pPMjRpUzAvdDhhZnJ1OTBkNndYbk9h?=
 =?utf-8?B?eVh2VytoblpYV1lYM2xWRmpjT0c5SG9QZlJ2c2N1aG9UWHdXWHQvV095R2w3?=
 =?utf-8?B?dXZsM2NnbGp1U05FUHpidW5hOW1WR2FJenMrVDFSTytXVXpwcmdWTmlVNVFG?=
 =?utf-8?B?N0p0WFVZYy90MXVUSlVoeXRseERna1EyMHNxRmUyL1JsaG9TSUVnRnN5VCtl?=
 =?utf-8?B?eXJDalM3VmZwRnVkVUcraTlYOVV2Y3FQSVp0U3AvRzJnTzVXUGwrd2xrQmpI?=
 =?utf-8?B?YmgzU0xiVWdJWkRCTEUwTkhiRTcwY3pGWVowSHp6NWhyTElIdmo1WVIvVlZh?=
 =?utf-8?B?NlBCTURRR09VSzBpb1lEU3VVT2ZPeDhidTNDSFBvZElQeDV6eTl1cllUbm9r?=
 =?utf-8?B?d3djeStJK0g4a3JJNXBSbmVxTkg3SHJ1K0JMaFdzMnY4R0lTY3doamwwR0p4?=
 =?utf-8?B?TktFTGlNRWtuVTZBREVZREdiRjQ1SU5vaEV5THdWdVFrSU1FcHhQRVR5d0Zm?=
 =?utf-8?B?eEdOMEV2SWFaL0JYeWNKdTZtM0tYQUxNelFJQUF1NHFPT1NrTVBTNXNhcmhk?=
 =?utf-8?B?eVE2S1lJaXRQVTljb3hrSm5ndVZLdjVzL3FOY0ZLMG1zUVJtRnQ4ejRGL2dU?=
 =?utf-8?B?a29yRnlyTE9YZkR4K3QvWmRvUkxhS1F2RGtYcWREa3RGQ1I0YzVmdTVGeXNq?=
 =?utf-8?B?V0dZeFFGamh3YU9uNjc2TURQaHpkbm1aMVRYZEVPZjdXTVd0QWE2Ulh0bGtE?=
 =?utf-8?B?elRpOGFyS1hDVDB2TVh4dzFCZnRld1lmaEhhaFYwaEk5TUdJWUo1WFhIT1U4?=
 =?utf-8?B?S0pGVmtvSEhxSlc1SUY4RUIzeitzSHBUWmRCODF0OU5yNVdHdE51MmpoQ0Vw?=
 =?utf-8?B?WHFDS1Mva2VQa2dFNEUrOExZa3lodHhJYWhwU3JSdmViaFRPR1VqRFZncFRu?=
 =?utf-8?B?ZUVXRERSeGRiRXVGNG9DLzJNdXNQelo1TU9COVNVenpkcE1qbHpUK0hPa0My?=
 =?utf-8?B?N2tBbVNyTHhBWEV5SUpLYVZoRzduUDdxRFRTbmR3ejNhN0VCRER4VzE4Snps?=
 =?utf-8?B?L0Q5ZmExcUx2MGFpV2JndG84b3d4QmpLWE1nM1M1N0JhT25vK1QwQXI4SVRD?=
 =?utf-8?B?SjF2ZEFCbkdnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR18MB2479.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTlsMFhuMUhQc2ZmSGVkM29vM2NuQWYrQXp0SXNhUTJRdzRuZGdNekZBazNv?=
 =?utf-8?B?NDg4c3g4NXQ5SHliVkllYjRYQU1qYUdYdE9qVTRiVDdsN0FYSEk2QThaZENN?=
 =?utf-8?B?TXlKZmRXSXQwWkx1ZG5IOG1CRUtlVnJKNk92OGlrR3FWc3VES3g1RWJUWjBR?=
 =?utf-8?B?K0lTNnJWVEQ0Rms1c01aeEVBa2JibGdFQzdkdTdSR0xldldaekM5U3g4cWJD?=
 =?utf-8?B?TlFpOW5ET1FCVk9hNi9jOGZqWExMOEE2cjJTUjBBYlRqOHN6c0p3VFRVVDlz?=
 =?utf-8?B?WGVKVkJCVHJJN0lVZnN1Nkp2ajM0R3l0aCtVRGhvb1FteFN4WW00aXI1TEZ4?=
 =?utf-8?B?RyttY2FYMEY5U3RVTUJZRnVVZ0pwb2dRNjJ1bHBxT2w3THpHZ3JkOHRqaEd0?=
 =?utf-8?B?bUdkdDQ3ZS9yalpJT2ZCLzhBQ1hkZUh4dzlVQTdIWjlkSHl0T2RSa0djMlB1?=
 =?utf-8?B?cVpJT3pYU0ZLOXJPWWdjaGhSRDdQRCt0d2RVZ2MrQVJCczFZZ2tweDkvUThy?=
 =?utf-8?B?eGVoVzRHSWh3RUFmaEVscEpVS3pCVUF4VmlVN3FvQWRhT1BrZ1Bjc0JmeTFS?=
 =?utf-8?B?Z2UzalBSSHhOMDdOZGd5bUgzQUQyZEdnYUZSNzJLTktqMko5czJ2Rkp5WEtG?=
 =?utf-8?B?U28xK3NLQ0F5aXRTQWptZFhZV1g4d3ZzdFVZbDdjYjBteGJJZC9oTjZBZFhl?=
 =?utf-8?B?Z3JBdkdIRklFR3hWZ1lsU3FSMGk3UmhsZFYwNU54WXQyd1RkcXVkV21BVzBY?=
 =?utf-8?B?K2owWllQT2daTHlFcVU4ZDZiTzZqWTFpU2ZyMHF0THFMc08xT2xaeklhVWdw?=
 =?utf-8?B?b2pKdWkzVlR3Z0pTelRPZTdkak8yakkzY1MzWkJzeGVmRHFQQmdlQzBLUEZG?=
 =?utf-8?B?VE9RYVA2cXVUTDBiRWxzUTRZUjNkM2F5NUdVK1B1RTBuc2pnQUxadW1XVjZO?=
 =?utf-8?B?cG1VKzc0VlYwZ1BUOEtHTmljaGZhWHkrRzg0ckxhK01zdWdDWjNpQ2ZjTHp6?=
 =?utf-8?B?amwybjZxbzROK0Z0MDZ3TVZ0dUQzbmdDSy9KSnhhcUx2VnBMQ005cTBoZlFk?=
 =?utf-8?B?RHRtSWlrbHRKclNHQU8wS08ycE0rbFVxV3MzQnkxMWhUYW5JWmR1cndHOHlN?=
 =?utf-8?B?REtkUnQzYW40bzFtU2ZsMDdqcHkzYXlsSjVlYndGMmU3a0JoU2VXSkRwaUkv?=
 =?utf-8?B?Tld6bVgvTkRwaXJhN0ZyMCtDZ1FCZG9NUkxDSXU0ZE11M3RyN1dxQm12NlNy?=
 =?utf-8?B?R1V2TnR2NitIRU5YY1VKdTB1VzJJZ1RDSkxpYVdwSW1lUXlldk0rZjdFTG1E?=
 =?utf-8?B?eWtuMDRvZ1BCUlE5TG5vOFMvMjE2dXJjdHJKdVo5ZXNZb1NabWE2d0RMdEo2?=
 =?utf-8?B?OUhOclpQZHcrUUtxSWJLUWU1MG02MWF0NTY0OWhWSjNoSnlRK1lVbEJ5Rmx3?=
 =?utf-8?B?dksrcDVzZGdyRkl5YmNjQ0tzb0FMTjc2WnZlZTJsbURSOE9nTFA0cTVLb2l1?=
 =?utf-8?B?WmIxNUJPeUk5V3hUMVRDRVNrREd2TEFhUHRneFBCUS9zMVhLalZYQUtsajNl?=
 =?utf-8?B?Ti9tdEVXSDlCeVd3V3RXRFFZK1Zab0dpY1drQisxcnl6MlNVRXhRQ0cwbXRy?=
 =?utf-8?B?NUhzU2dFamtpNitQdU5JQTlpdVRnQkVEeVp3WkFFRnpoSGRlTlI1QTNZb01i?=
 =?utf-8?B?bWRIMmR2R2pxMWloUGpKRHl2ODFQL0dZTmx6TE5NQzNyTm1hL09ScjE0OTFV?=
 =?utf-8?B?NFc0K251djVzYmtad1FYb0lWMEx4dlJLMHFhQzRUVkpZZ1VNaG44L0pkVndV?=
 =?utf-8?B?V0REdUdwbnVKOTJ6TkxyMkJyWlhNemprajRWeDUwd2ZKWU5xcnhIalIzNlhG?=
 =?utf-8?B?UThoTExNUk5GTUIrV1J1a0xMMWVvdE5mZU5VbCtFaURDRnNTY09JVE9SbGZF?=
 =?utf-8?B?amR0RDdPLzhnSGI5dkRMb0hEQTE4SUR3ZkVHUUtuNC9NSVlYMjFQMWIwZjFM?=
 =?utf-8?B?OXA0V3ljQmVyVTRERk1BTFI3OGhLNE9CZWtQdkttMlcyNEJ1ZlVxTW9TZTEr?=
 =?utf-8?B?c0ZoQjZRc3pOVk1EUW9VVG5Nbm5BNFhpTFh2aTA4L3RPQ3hWMzBURGp3b1VY?=
 =?utf-8?B?TUVqQW1BbFRiVXJ2d1V2cFJZZGloZEdQeU1URkFVUU5DRzV2eitYV09aVkM3?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: realsenseai.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR18MB2479.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e02fa8ab-b22e-496a-54ea-08de152b3a6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 07:34:14.0697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 900a1806-5e7c-4a61-ba52-40ce09b89e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 15nQ4fhXawdwFGrG3+UH8sgGWqbikiFpwnkB4i8RU04n3c76R/bntzYxHeFWmIFLrwWKa5Rt8fjbOsp59ZEw4PU3zO3PHS2XccQV9hIvat0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR18MB927467

SGkgUmljYXJkbywNCg0KQXQgdGhpcyBtZXNzYWdlIG15IGNvbGxlYWd1ZSBhcyBwb3N0ZWQgdGhl
IGxzdXNiIG91dHB1dA0KDQo8Q08xUFIxOE1CNDYzMzQ5NjgwNjAzRUMyQzI4NEI3RkVGRjcxQkFA
Q08xUFIxOE1CNDYzMy5uYW1wcmQxOC5wcm9kLm91dGxvb2suY29tPg0KaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtbWVkaWEvQ08xUFIxOE1CNDYzMzQ5NjgwNjAzRUMyQzI4NEI3RkVGRjcx
QkFAQ08xUFIxOE1CNDYzMy5uYW1wcmQxOC5wcm9kLm91dGxvb2suY29tLw0KDQpUaGFuayB5b3Us
DQpZb2dldiBNb2RsaW4uDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBZb2dl
diBNb2RsaW4NClNlbnQ6IFN1bmRheSwgT2N0b2JlciAyNiwgMjAyNSA2OjM5IFBNDQpUbzogJ1Jp
Y2FyZG8gUmliYWxkYScgPHJpYmFsZGFAY2hyb21pdW0ub3JnPg0KQ2M6IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT47IEhhbnMgZGUgR29lZGUgPGhh
bnNnQGtlcm5lbC5vcmc+OyBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9y
Zz47IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZw0KU3ViamVjdDogUkU6IFtQQVRDSCB2MyAzLzNdIG1lZGlhOiB1dmM6IEFkZCBENDM2IGFu
ZCBENTU1IGNhbWVyYXMgbWV0YWRhdGEgc3VwcG9ydA0KDQpZZXMgSSBhZ3JlZS4NCkkgd2lsbCBj
aGVjayBpZiBpdCdzIHBvc3NpYmxlIHRvIGRldGVjdCBhbGwgZDR4eCBjYW1lcmFzIGFuZCBub3Qg
dG8gc3VibWl0IGEgcGF0Y2ggZm9yIGVhY2ggY2FtZXJhLg0KRm9yIG5vdyBJIHdpbGwgYXBwcmVj
aWF0ZSBpZiB3ZSBjYW4gY29udGludWUgd2l0aCB0aGUgY3VycmVudCBwYXRjaCBmb3IgdGhvc2Ug
Y2FtZXJhcy4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2FyZG8gUmli
YWxkYSA8cmliYWxkYUBjaHJvbWl1bS5vcmc+DQpTZW50OiBGcmlkYXksIE9jdG9iZXIgMjQsIDIw
MjUgMjoxMyBQTQ0KVG86IFlvZ2V2IE1vZGxpbiA8eW9nZXYubW9kbGluQHJlYWxzZW5zZWFpLmNv
bT4NCkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5j
b20+OyBIYW5zIGRlIEdvZWRlIDxoYW5zZ0BrZXJuZWwub3JnPjsgTWF1cm8gQ2FydmFsaG8gQ2hl
aGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+OyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMy8zXSBt
ZWRpYTogdXZjOiBBZGQgRDQzNiBhbmQgRDU1NSBjYW1lcmFzIG1ldGFkYXRhIHN1cHBvcnQNCg0K
W1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSByaWJhbGRhQGNocm9taXVtLm9yZy4gTGVh
cm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5k
ZXJJZGVudGlmaWNhdGlvbiBdDQoNCkhpIFlvZ2V2DQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoLiBT
b21lIG1pbm9yIG5pdHBpY2tzIGlubGluZWQuDQoNCg0KQlRXLCBpcyB0aGVyZSBhIHdheSB0byBw
cm9ncmFtbWF0aWNhbGx5IGRldGVjdCBpZiBhIGRldmljZSBpcyBSZWFsU2Vuc2Ugd2l0aCBENFhY
IG1ldGFkYXRhPw0KDQpJIGFtIHRoaW5raW5nIHRoYXQgbWF5YmUgYWxsIGhhdmUgYSBzcGVjaWFs
IGVudGl0eSBpZCwgb3IgYW55IG90aGVyIHdheSBiZXNpZGVzIHZpZC9waWQuDQoNCkkgYW0gYXNr
aW5nIHlvdSB0aGlzLCBiZWNhdXNlIGlmIHlvdSBjb3VsZCBmaW5kIGEgd2F5IHRvIGlkZW50aWZ5
IHRoZSBjYW1lcmEgeW91IGNvdWxkIGltcGxlbWVudCBzb21ldGhpbmcgbGlrZSB1dmNfbWV0YV9k
ZXRlY3RfbXN4dToNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfbWV0
YWRhdGEuYyNuMTcwDQpJbnN0ZWFkIG9mIGNyZWF0aW5nIHF1aXJrcyBmb3IgZXZlcnkgbW9kZWwu
DQoNCg0KUmVnYXJkcyENCk9uIEZyaSwgMjQgT2N0IDIwMjUgYXQgMDc6NTAsIFlvZ2V2IE1vZGxp
biB2aWEgQjQgUmVsYXkgPGRldm51bGwreW9nZXYubW9kbGluLnJlYWxzZW5zZWFpLmNvbUBrZXJu
ZWwub3JnPiB3cm90ZToNCj4NCj4gRnJvbTogWW9nZXYgTW9kbGluIDx5b2dldi5tb2RsaW5AcmVh
bHNlbnNlYWkuY29tPg0KPg0KPiBBZGQgc3VwcG9ydCBmb3IgSW50ZWwgUmVhbFNlbnNlIEQ0MzYg
YW5kIEQ1NTUgZGVwdGggY2FtZXJhcyBtZXRhZGF0YS4NCj4gVGhlc2UgY2FtZXJhcyB1c2UgdGhl
IEQ0WFggbWV0YWRhdGEgZm9ybWF0IGZvciB0cmFuc21pdHRpbmcgZGVwdGggYW5kDQo+IHNlbnNv
ciBpbmZvcm1hdGlvbi4NCj4NCj4gVGhlIEQ1NTUgY2FtZXJhIHVzZXMgVVZDIHByb3RvY29sIHZl
cnNpb24gMS41LCB3aGlsZSB0aGUgRDQzNiB1c2VzIGFuDQo+IHVuZGVmaW5lZCBwcm90b2NvbCB2
ZXJzaW9uLiBCb3RoIGNhbWVyYXMgcmVxdWlyZSB0aGUgRDRYWCBtZXRhZGF0YQ0KPiBmb3JtYXQg
ZmxhZyB0byBwcm9wZXJseSBoYW5kbGUgdGhlaXIgbWV0YWRhdGEgc3RyZWFtcy4NCg0KV2UgYXNr
IHRoZSBsc3VzYiAtdiBvdXRwdXQgZm9yIGV2ZXJ5IHF1aXJrIHdlIGFkZC4gQ291bGQgeW91IHBy
b3ZpZGUgdGhhdD8NCg0KVGhhbmtzIQ0KDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFlvZ2V2IE1vZGxp
biA8eW9nZXYubW9kbGluQHJlYWxzZW5zZWFpLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL21lZGlh
L3VzYi91dmMvdXZjX2RyaXZlci5jIHwgMTggKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRp
YS91c2IvdXZjL3V2Y19kcml2ZXIuYw0KPiBiL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfZHJp
dmVyLmMNCj4gaW5kZXggZGJkYWNjNjRlYTZiLi42ZjAwNTNhNzgxMjMgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfZHJpdmVyLmMNCj4gKysrIGIvZHJpdmVycy9tZWRp
YS91c2IvdXZjL3V2Y19kcml2ZXIuYw0KPiBAQCAtMzIyMyw2ICszMjIzLDI0IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgdXNiX2RldmljZV9pZCB1dmNfaWRzW10gPSB7DQo+ICAgICAgICAgICAuYklu
dGVyZmFjZVN1YkNsYXNzICAgPSAxLA0KPiAgICAgICAgICAgLmJJbnRlcmZhY2VQcm90b2NvbCAg
ID0gMCwNCj4gICAgICAgICAgIC5kcml2ZXJfaW5mbyAgICAgICAgICA9IFVWQ19JTkZPX01FVEEo
VjRMMl9NRVRBX0ZNVF9ENFhYKSB9LA0KPiArICAgICAgIC8qIEludGVsIFJlYWxzZW5zZSBENTU1
IERlcHRoIENhbWVyYSAqLw0KPiArICAgICAgIHsgLm1hdGNoX2ZsYWdzICAgICAgICAgID0gVVNC
X0RFVklDRV9JRF9NQVRDSF9ERVZJQ0UNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IFVTQl9ERVZJQ0VfSURfTUFUQ0hfSU5UX0lORk8sDQo+ICsgICAgICAgICAuaWRWZW5kb3Ig
ICAgICAgICAgICAgPSAweDgwODYsDQo+ICsgICAgICAgICAuaWRQcm9kdWN0ICAgICAgICAgICAg
PSAweDBiNTYsDQo+ICsgICAgICAgICAuYkludGVyZmFjZUNsYXNzICAgICAgPSBVU0JfQ0xBU1Nf
VklERU8sDQo+ICsgICAgICAgICAuYkludGVyZmFjZVN1YkNsYXNzICAgPSAxLA0KPiArICAgICAg
ICAgLmJJbnRlcmZhY2VQcm90b2NvbCAgID0gVVZDX1BDX1BST1RPQ09MXzE1LA0KPiArICAgICAg
ICAgLmRyaXZlcl9pbmZvICAgICAgICAgID0gVVZDX0lORk9fTUVUQShWNEwyX01FVEFfRk1UX0Q0
WFgpIH0sDQo+ICsgICAgICAgLyogSW50ZWwgUmVhbHNlbnNlIEQ0MzYgQ2FtZXJhICovDQoNClRo
ZSBsaXN0IGlzIHNvcnRlZCBieSB2aWQ6cGlkDQoNClBsZWFzZSBtb3ZlIHRoZSBkZWZpbml0aW9u
IHRvIHRoZSBjb3JyZWN0IHNpdGUuDQoNCj4gKyAgICAgICB7IC5tYXRjaF9mbGFncyAgICAgICAg
ICA9IFVTQl9ERVZJQ0VfSURfTUFUQ0hfREVWSUNFDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCBVU0JfREVWSUNFX0lEX01BVENIX0lOVF9JTkZPLA0KPiArICAgICAgICAgLmlk
VmVuZG9yICAgICAgICAgICAgID0gMHg4MDg2LA0KPiArICAgICAgICAgLmlkUHJvZHVjdCAgICAg
ICAgICAgID0gMHgxMTU2LA0KPiArICAgICAgICAgLmJJbnRlcmZhY2VDbGFzcyAgICAgID0gVVNC
X0NMQVNTX1ZJREVPLA0KPiArICAgICAgICAgLmJJbnRlcmZhY2VTdWJDbGFzcyAgID0gMSwNCj4g
KyAgICAgICAgIC5iSW50ZXJmYWNlUHJvdG9jb2wgICA9IFVWQ19QQ19QUk9UT0NPTF9VTkRFRklO
RUQsDQo+ICsgICAgICAgICAuZHJpdmVyX2luZm8gICAgICAgICAgPSBVVkNfSU5GT19NRVRBKFY0
TDJfTUVUQV9GTVRfRDRYWCkgfSwNCj4gICAgICAgICAvKiBHZW5lcmljIFVTQiBWaWRlbyBDbGFz
cyAqLw0KPiAgICAgICAgIHsgVVNCX0lOVEVSRkFDRV9JTkZPKFVTQl9DTEFTU19WSURFTywgMSwg
VVZDX1BDX1BST1RPQ09MX1VOREVGSU5FRCkgfSwNCj4gICAgICAgICB7IFVTQl9JTlRFUkZBQ0Vf
SU5GTyhVU0JfQ0xBU1NfVklERU8sIDEsIFVWQ19QQ19QUk9UT0NPTF8xNSkNCj4gfSwNCj4NCj4g
LS0NCj4gMi40My4wDQo+DQo+DQo+DQoNCg0KLS0NClJpY2FyZG8gUmliYWxkYQ0K

