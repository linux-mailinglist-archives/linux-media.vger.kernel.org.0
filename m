Return-Path: <linux-media+bounces-29510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA67A7DF90
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 469AB1694DA
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48841A0BDB;
	Mon,  7 Apr 2025 13:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kWAslurd"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010054.outbound.protection.outlook.com [52.101.229.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D5C199FC5;
	Mon,  7 Apr 2025 13:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033030; cv=fail; b=HE96HMG5lWDYQ2uySdErHGBrmZAACSBgDSAksk+ZURBT/Omv2O8KPCDpJPqCBrH9G6vqgU3SYi1l7FJnieRRwXkd/RJIvv0DRJEy4GLtFknoAj71Q+xTcfOH6uROshDBTifaOgKlTcLSaTwcqrkPnmHgy+5rNXCrTyr88DNByqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033030; c=relaxed/simple;
	bh=RMH4U91mQ/kilW6ZO0x2Yl1SHdJpIQq+GwpBNyhmipk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KxNE5si5QFPZpfvnnfj1jDhiwkaxi3FoagSynQlOrjgSRGUwmYF9zXmOs1ZOWGeINNl4X34gzMhS+/XV6swMyjCQ6/lYeFyl+nSMKgQPZFqbFEE5Hl7E9iZb/X8YVnhxMK+l5gThQdTJI3FTKdd1aS+Ok/Fr3httBRP2xegfJA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kWAslurd; arc=fail smtp.client-ip=52.101.229.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aW2uGErmHkrLbq/Bj7U3IpVffDTGDC6cxqP+21xS8C/nbgxpUNqhf7b8/5pbXHAXgZeUiNRvrF15kS+C7iW0ePsbfyIPwF2fS4GXwG/PLjLuoiMl9L94aFaNmRHR6TgaQZSe/FOgD9tTNr+yZeLSB3Qic8tGRZVSG/3jbe/n9M9bEnAK+4OAchz9D7fm5eX2yhLjOb3AzxaGGOS0VxOw7Sm2SC4MRBvQeQiLlMbUragoCjxQ131nd2knnv9tumh222CYrn8aKcypp9urqzaCNOR5kI8dFIjDoTZP7A2BtsNI5e+jUAcYeFj2bgx9LJ8RW6+IWeGQPUtLxR0BNOsESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMH4U91mQ/kilW6ZO0x2Yl1SHdJpIQq+GwpBNyhmipk=;
 b=aVA9SSHX2UEQWKDrv6Mune9ZQcv0MFaq5tjpedZDzdPvm3Ze875NDMUtnaRq0wkxv2C9Q7FFDGjBPJ4hCLL8TbgBTL0xLmo+pfOkv/wspnJkp990kFqJoPcCGsoXaynj8yVoQtRkuMrbX5DBiZ2tSp01aW+NdAqcy5wjoL/X8uHa5bRjLUXkES0PWACEdeXOd7yxVkqSG+jvVUZW2eI/xVTrP4Ol8pCkzP6baDmEfLvjtNL69BiQTCWsNHj96N3u4Xri3qZ8G/2NV6xbim36rKhyY75s0z0RlFkMoiHICJtJmpdQnI+y3PywBHu8ZZezPgmMVZD51sohNh/gJHlfqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMH4U91mQ/kilW6ZO0x2Yl1SHdJpIQq+GwpBNyhmipk=;
 b=kWAslurdSJF40Kpgy+X6voQFEZmN8LoavCHmUQJOfcNTNx77T4jJs9PQHYqvY7vokQNWgvwesnyL0Ec4rOJoBqIpqPURqVDAE4vvg/YVKeOXmMZP0If0cQFNB9JG1b7zIx0OT6M85Vx7G1a3Et8LKM9F5mVq5eBt5bBrb8d0BwU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10959.jpnprd01.prod.outlook.com (2603:1096:400:3b1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.28; Mon, 7 Apr
 2025 13:36:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 13:36:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Alim Akhtar <alim.akhtar@samsung.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH v3] media: platform: exynos4-is: Use
 of_get_available_child_by_name()
Thread-Topic: [PATCH v3] media: platform: exynos4-is: Use
 of_get_available_child_by_name()
Thread-Index: AQHbp6z3P9GMd7ZS7UO71DLoh9RIFLOYMxUAgAAAvtA=
Date: Mon, 7 Apr 2025 13:36:56 +0000
Message-ID:
 <TY3PR01MB11346C7A2535C4E465B22F4EF86AA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250407110516.41124-1-biju.das.jz@bp.renesas.com>
 <d07e4e1a-2b83-461a-b259-91c7e80e0ed8@kernel.org>
In-Reply-To: <d07e4e1a-2b83-461a-b259-91c7e80e0ed8@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10959:EE_
x-ms-office365-filtering-correlation-id: ce18c753-08b0-4f21-1f28-08dd75d943d7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z0x1L3JMTUFqSCtHU0s5Q0JBUDlMRnpzSW9DR2Y5dC9TNWo2MlU0bkJ0UzR2?=
 =?utf-8?B?MlBnVllpZURQVmNxdFFWKzlBUmZERUkxZnY5eHZXL0NQOHZFWjBjTjFYNWVu?=
 =?utf-8?B?R2w1MXRpRUQ3YzhSeDBDYWlabVR5b1ZBOWlveis5eVJpRFExTlZQQmlXMFRr?=
 =?utf-8?B?ZnF0VThFU3QySStXZjVsQ3oyZ0k2RVhWS3dsT2NJZi9tQy8zMWk0cTFHQWpT?=
 =?utf-8?B?Z3BMd2MvV2F6S1JwTHhXazVXMHJieFN5aUxyRlcyN3hRemFDTmtyQTlMOFBx?=
 =?utf-8?B?OStMY0N0cjl1bGRoNHBpTTgwTUdRb0JCL2VqbTVXMFpvQk51NGZJUnphTU1y?=
 =?utf-8?B?RDRUcUh4d3dyS21vaVdXamRQSExDa3puMkUwYlhQMFRJVnpnaGtBRm9nQlNI?=
 =?utf-8?B?NkMwWWdNUmsvTW91b1kzc01RUFU4eFBoZUp5VjJGcEJkNCtsWjRRMlRaUXJ0?=
 =?utf-8?B?OG14Y1U2ZkFPRldTL3pjRmJESEk1enhJeGVWTzRXdGhvUW9PblpPZFBDWkxL?=
 =?utf-8?B?eW9XUFF0UElTVThSZjhnYzQzMmpYQ0thSUVqdlBoNzVjK2lvK2Y4dXFmWHc5?=
 =?utf-8?B?cWlHNFJmVkZnbkV6Y0haQlF2MjBhSVhFM21LVTRGVDA0em9Eakw3anY3aUJw?=
 =?utf-8?B?a1RtUlZ6N2VERTdmWlpVK2k5M3hOU2ZtM2huTVUzbFhab0gzMTBnakNvWU5N?=
 =?utf-8?B?ZDN4YjRYdStGckIvR2N5a1dVa0NDZFZSVEdVanM3ZS9DQzIzVkVoU1Jra3o0?=
 =?utf-8?B?K3NyWnhxY3NxREdpYnRtMVpRZElOZTcxckh3eEtiMWJUYTVCbVYrWkZVVVNO?=
 =?utf-8?B?VGNNcTg1WUhwWVhUZ2FhdWo1RlNQdUlONkVRZXl3UmZzb21zRE1RN0kvKytC?=
 =?utf-8?B?eEZBaFduU3R0aHc4dE44bTV3WUFKZmpLdWE3UTRKRFFGK1EyNDFaZWhXYXZ4?=
 =?utf-8?B?UG1UKzREaGN4d2o2c0JDT0IzNkRPU0I2QkhkSVliQmpEOUVJSU8yd2N3UnNH?=
 =?utf-8?B?SWIxWmtQaDR6RFp0anB5ZWV3YktjZU9Hb1NzcFQzYllsMnBTQkhRRXRhQlcw?=
 =?utf-8?B?ZnZLRlprWFROY1VzeUptTGMrMlR2b2c1Zkd2WUxQaUI3Rm9TS0FGMzVJUVNS?=
 =?utf-8?B?enFBVEc3dDY5MmF4Z29KSzN6Ym5JV2JvWGtNYzg2SGpkKzBUWW1OT0hybzFh?=
 =?utf-8?B?TDZudy9Lck42RDhLTS8xSEJZQ2hVdEdTenVVVUZpMERhSDdQTy9CRWhtYlFj?=
 =?utf-8?B?Y2hmcFNkRVRUOWhmUGZyYWJIUFkrZEwydDRQUnY5YnZmTmFjTHppNGduRHQr?=
 =?utf-8?B?TGhlb0ZlU2JRa0E1V1RjTEY2Z29nOWVpblpzdHlJQWtLdFR5YkZldEk1eXdm?=
 =?utf-8?B?Nm1EeHlhWW1QRGZMK0FKdWI2WFcyNG1uc1ptSFE5akNqekFLdFRnTG5RUzB5?=
 =?utf-8?B?aVl5RUYvdmFLWFM0N1JjbHFacFJjZ1Jjc0VRYUdPTC8xcHAxc0dvcTZBZ1Y5?=
 =?utf-8?B?dTJQSTJUVml2VCt2Q0Y5N0g3bWhVNHpPbjJvalVDWU9vdldsYUE4RVBwT3Zn?=
 =?utf-8?B?NnVaN2U0aXlsdVZCV3lIQzlkU01kUUF5RmtVR3RrNi9rSHZyZDFtNzFscU91?=
 =?utf-8?B?b2hYdEVhS1NYWnp1VXFrWU1yK1d4VW0rb3BTL2tjR0E1SnA3dWZwYkZDWDRn?=
 =?utf-8?B?VEZ2d0tCaHB5WktQVE5yaWFCV2t3MWlCdm1TUEJOK0V5Ky9nNDVTQTA2NVdk?=
 =?utf-8?B?YjgwNVRyVHJHdGUrUG9ZQ25IMFdySmlxdE9sUldaYVFrYU5JYWRkRS9yS3JM?=
 =?utf-8?B?QUE1WUNMQmpSeVpZSCtYc2t4L1hqV1ZMZ2RyaDQwN1E2RVpWYTVYSFQyaFcy?=
 =?utf-8?B?WWhBMmVmWmRGVC9yVVdZeElmSlo0Sk42dHJ4Y28vaFV2T2VsakdhV2t6YS9V?=
 =?utf-8?Q?WOHs0CruSGM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Qlc1OHdXLzVVbnA1SGZ0eTNQdnJrbDVXMjdyNS82dW5Ec0s2WFFqVnNHNDlL?=
 =?utf-8?B?dzkvdHpXSEN1U2NzcldZdlk5anAxQSszQmFWaUVLS2E2WEpYOE5nTzlRUzNh?=
 =?utf-8?B?a1V5T21pZ09FcmVlSE5zZXJOR0MxS1FtaUltZjRFMFZzZXZrKzNYMFlyZWVS?=
 =?utf-8?B?NGlsQVovWk9PV3N3UUVaZ3Q5cVFjQW9SVUFBWjR5aWxqNlBpUDJhbFNJeS82?=
 =?utf-8?B?Y3ViNXpCVWNXclZJVkZMamRBTk5rTW93MkFrSDFyMk9WN1JXZ1RMWmFPc1By?=
 =?utf-8?B?ZlQyR1JoNCtUeU1WQ0VabjBsY3FtZElpQkUwTEphc3NKZm1ZRFBvZ3FZVlJu?=
 =?utf-8?B?cXUwR0NUZGNGRTc2ZDdhLzA0cVJSZ3ZXWHdTZk9md0hWaU8xaXVmMUdYaHo4?=
 =?utf-8?B?cm5JSmR3eVJFTTJIaDZKS3JkRFBkekpxdUZ6aS9jd2hqcVpmSW4yUmJKKzFP?=
 =?utf-8?B?UHRCZ2RCVFZxRC9oY1MyLzBoMG8xVWpzMnJHQXpHVTlrb1BSYWZuLytJZWsv?=
 =?utf-8?B?RlhlMXlrc3JOcDBpOThtZEVsTjlVQU16OC9Ha21EWjYzT2Q3dVp6Ry9mRTFm?=
 =?utf-8?B?QjhWWkUwZ2x2c29IVG5PMzlKczloalFuL3B4WXFCOWcxNlQ3MCtLSHFSRkRD?=
 =?utf-8?B?cC9YbmZiMVAvZWZpbWlwUnlYVE5lUHVYU3lDOXFTcmxIVXowWVZlZ2VES2F0?=
 =?utf-8?B?MmI0RnpVdU4zcU5Qb3J2TFhCWmN2TVVDWDhXdVNxZk9uaXA5UHM5N3FPMVA0?=
 =?utf-8?B?b2JVWFZXWnVhcStZSTdVeWtFeTRONDlxZEQyV1ovZk9tRmRUTnJNUGNReTgv?=
 =?utf-8?B?Z05aWTg0K1pMYndlR3VlclNDV2NNN21xakVjVXM1M25INW5KMUNLRTJNbE52?=
 =?utf-8?B?STRMZzI0TldxamtPWTJIR20yWEtqalBINHRLTC90c1lXYVEySUtiRCtvNUdY?=
 =?utf-8?B?Y2RiSVZHV2YzYy9IdWNKaHRhR3M1L2FhaUZ0c0hmcnRVT3pGek52SW1tQjZN?=
 =?utf-8?B?cm9uZTQrRm9tenhvNnRIcHJwaitIdHRMbkFuNCtCRjJKR05URG5FbXBQREo3?=
 =?utf-8?B?RnVpN0Rnd2tZWExzUW5yTTZHdWMwMU9hM05PTE4xck9pUU5hTXdPczJJSGQ5?=
 =?utf-8?B?Y2ZncWJaVlZKa0hGb0IxbkZWZXorV1JvSGgwQisyd3ArTEgyTVZUYmRad1pq?=
 =?utf-8?B?OWd0SG8xdnFibllDV3NybFZKWkNZNGIvU1l2aGRybFJSMDlzU1FaY1dEb0Ja?=
 =?utf-8?B?T0tjS3BYMlM1M0VPQlJ1L3V3ZkptZ3FSN3RIS0U0cC9MR1pNZnlBZHNLM0xr?=
 =?utf-8?B?VVRMVUg5dGdDN1QweFVwbEczS0EzSi8xUUtlVkhCVGFhL1NLaStTRzh4ZUJq?=
 =?utf-8?B?cUVvdklzSktxTTBxbFZqdEl2VXNxVlk0ZDRSOC9TZHJzY3QyR0lIZVJ4OFU2?=
 =?utf-8?B?d3h6VHVpT2M3Q0NsbXNmM2dpaEpyNGI0YjJTWnVrOFdCb28vUkZENXVBbUN5?=
 =?utf-8?B?a0JsTDJGdmZzUHRMbUVwdzQxQjBBWkY1d0tOUVp1NHpmYkp1Mml2d29qRFRG?=
 =?utf-8?B?cmkwK1g3N2V5bWhLZHFZczJMM2NOay9hUDJreXQzcmZJSkM1WEE3bW9iT0Zl?=
 =?utf-8?B?Z0czTldWMXlycnNwRWZqTTRTUjRTUjJ5MnpRKzRwVFFwVUxoSmFLRk8vblRB?=
 =?utf-8?B?MnBhbk5oVUI0aG9waDNSemVYNG5ISERnNGxIdWdNeEQrbDQxcS8rY1I1NWdo?=
 =?utf-8?B?dkNYdXBUdFV1L0sxandLNFpiMjhla0xNc1NyWlhISFd4K0NDZnJYN1l1emdl?=
 =?utf-8?B?TWNNaHgwS3FTWjdoNHB6OUZZMjRLcHl5Rm0xQ3E2WHovMTlYNmtCSWZJeFZ5?=
 =?utf-8?B?QUw4aVpzQlQ1MlZWM3pUTnUyVEJjOEtuSTk2UGVjTnRBY0tOTzMxMGliblho?=
 =?utf-8?B?aERKU0NBbEpkQjBGTEdFQkhFaEJDU1lReW41RnI5TmpCb2xrVmdBVGtOMkpK?=
 =?utf-8?B?M0pwQlBVZ2x4bzRLc0pOeDlkdGpFMWJXWS9oL3RtalNGU29wUWg5blFUV3Jh?=
 =?utf-8?B?TXhPK2lMN3V1dDd0RVErdXB1akkwOXZ0bEVMRGpuTkxFb3ZzNnBJVXRUaHdj?=
 =?utf-8?B?TDVKK0lQbE14TVBpQ3pST0VHYkVkc3ZvZGtQQXgvYXhPSURQcGFIRFRBMUcr?=
 =?utf-8?B?Vnc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ce18c753-08b0-4f21-1f28-08dd75d943d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 13:36:56.2931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nbOkpPJBGrz+fQFKY1PDwnMOu2OXQHZ33Q8PAOXmUIcAmsFap4v4Dpro7HQueSIxYvb1ndMrHC3gkflDKnRSsmAW1oHI2nmxzMdgItHwLXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10959

SGkgS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEty
enlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gU2VudDogMDcgQXByaWwgMjAy
NSAxNDozMA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzXSBtZWRpYTogcGxhdGZvcm06IGV4eW5v
czQtaXM6IFVzZSBvZl9nZXRfYXZhaWxhYmxlX2NoaWxkX2J5X25hbWUoKQ0KPiANCj4gT24gMDcv
MDQvMjAyNSAxMzowNSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gU2ltcGxpZnkgZmltY19tZF9pc19p
c3BfYXZhaWxhYmxlKCkgYnkgdXNpbmcNCj4gPiBvZl9nZXRfYXZhaWxhYmxlX2NoaWxkX2J5X25h
bWUoKS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2Mi0+djM6DQo+ID4gICogRml4ZWQgQ0hFQ0s6IENv
bXBhcmlzb24gdG8gTlVMTCBjb3VsZCBiZSB3cml0dGVuICJjaGlsZCIgcmVvcG9ydGVkIGJ5DQo+
ID4gICAgWzFdDQo+ID4gaHR0cHM6Ly9saW51eC1tZWRpYS5wYWdlcy5mcmVlZGVza3RvcC5vcmcv
LS91c2Vycy9wYXRjaHdvcmsvLS9qb2JzLzc0MQ0KPiA+IDE2MTMyL2FydGlmYWN0cy9yZXBvcnQu
aHRtDQo+ID4gICogRHJvcHBlZCBSYiB0YWcgZnJvbSBLcnp5c3p0b2YuDQo+IEFuZCB3aGF0IGlz
IHRoZSByZWFzb24/IE1pbm9yIHR3ZWFrIGZvciBjaGVja3BhdGNoPyBSZWFsbHk/DQoNCkp1c3Qg
dG8gaGF2ZSB5b3VyIHNlY29uZCBvcGluaW9uLCBJIGRyb3BwZWQgdGhlIFJiIHRhZyBldmVuIHRo
b3VnaCBpdCBpcyBtaW5vcg0KYXMgdGhlIHBhdGNoIGdvdCByZWplY3RlZCBzZWVbMV0uDQoNClsx
XQ0KVGhhbmtzIGZvciB5b3VyIHBhdGNoZXMhIFVuZm9ydHVuYXRlbHkgdGhlIE1lZGlhIENJIHJv
Ym90IGRldGVjdGVkIHNvbWUNCmlzc3VlczoNCg0KIyBUZXN0IGNoZWNrcGF0Y2g6Li8wMDAxLW1l
ZGlhLXBsYXRmb3JtLWV4eW5vczQtaXMtVXNlLW9mX2dldF9hdmFpbGFibGVfY2hpbGQucGF0Y2gg
Y2hlY2twYXRjaA0KQ0hFQ0s6IENvbXBhcmlzb24gdG8gTlVMTCBjb3VsZCBiZSB3cml0dGVuICJj
aGlsZCINCiMyODogRklMRTogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zYW1zdW5nL2V4eW5vczQt
aXMvbWVkaWEtZGV2Lmg6MTgzOg0KK3JldHVybiBjaGlsZCAhPSBOVUxMOw0KDQp0b3RhbDogMCBl
cnJvcnMsIDAgd2FybmluZ3MsIDEgY2hlY2tzLCAxMCBsaW5lcyBjaGVja2VkDQoNCg0KDQpQbGVh
c2UgZml4IHlvdXIgc2VyaWVzLCBhbmQgdXBsb2FkIGEgbmV3IHZlcnNpb24uIElmIHlvdSBoYXZl
IGEgcGF0Y2h3b3JrIGFjY291bnQsIGRvIG5vdCBmb3JnZXQgdG8gbWFyayB0aGUgY3VycmVudCBz
ZXJpZXMgYXMgU3VwZXJzZWRlZC4NCg0KRm9yIG1vcmUgZGV0YWlscywgY2hlY2sgdGhlIGZ1bGwg
cmVwb3J0IGF0Og0KaHR0cHM6Ly9saW51eC1tZWRpYS5wYWdlcy5mcmVlZGVza3RvcC5vcmcvLS91
c2Vycy9wYXRjaHdvcmsvLS9qb2JzLzc0MTE2MTMyL2FydGlmYWN0cy9yZXBvcnQuaHRtIC4NCg0K
DQpDaGVlcnMsDQpCaWp1DQo=

