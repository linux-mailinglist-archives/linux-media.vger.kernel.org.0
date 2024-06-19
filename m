Return-Path: <linux-media+bounces-13654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFCC90E2C0
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 07:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCE921F2405B
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 05:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB84356444;
	Wed, 19 Jun 2024 05:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="dkjk55ht"
X-Original-To: linux-media@vger.kernel.org
Received: from KOR01-SE1-obe.outbound.protection.outlook.com (mail-eopbgr810131.outbound.protection.outlook.com [40.107.81.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51B14C635;
	Wed, 19 Jun 2024 05:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.81.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718775525; cv=fail; b=crr/S1WgG9U/1aqW2o0fCXBRrrrij+RLv9mGM4TLace4wlgXxbwT+Ig9aSI2unQkry/qc3AE67K089woh3/M4zwphb51p+VRMeEBwOBq+7VdZOMQJABZaBeLToXHHjJsEfLb9EH35BlbFB/pfF2GpMjTOk6Q9qOe7VRixIQwTn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718775525; c=relaxed/simple;
	bh=3QplS29CeFOguNSAIy9TSoiBP4yqnVAbce0598Kdf1M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D5WGTERjgf7dE8Fod/d9w7/qbK6lGnRyPZAqwJ/HLaRJLOmytAzGW5FvEs+p76Mx2R4Ktj+GFvhDWORGOZBxMGLr1gK0HaaE45lhv26AcW/YiPYgxLeR8AW8pe32/UT8R1BontTXABCm77PVTqluloxzwNMTIbpdNILPkX7ZT7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=dkjk55ht; arc=fail smtp.client-ip=40.107.81.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HURJfGaKZZak+GD6UFzqTPaetP4lRtQDBPEfSW0NuS0sQgxMlaGGv+FXWDjT0Ap9cMaPoK61ptnyN8nmtOeuIgi0es/62YqGltloOnMeaMvBopF+1CW3oGgnILgYDQI2OitXPaQGsNOsqNitXLeKjcBVqSUBiVPy4f/ECXW1jdUVhmoEH+HspwKBxijLm2Kh3nnVoGUStx1yD7dtz2NCgcCij4DP/QVfsVS87b+s06FDjD7qvmUfvdEYsmzKcmnTox6U0YSjw0/5oVZqXSnIBx9+fRs7ob3k1HvLwR+8Sw8sesE0XPQHRc7mFeBkc5oFVAwy0zEln1kORJqqiVS0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QplS29CeFOguNSAIy9TSoiBP4yqnVAbce0598Kdf1M=;
 b=V1n9uyGke7hkrIHvM1KLu5MNUvzfZKiYWwk/8lImiPNf6OImBETd2UNVgGUJcT5ExpkeXrqN18ZWv1ZCL0GPKQ7y7Bxdjdw2HDyuBKUiL6Bendeid8J1+nEht/iem4fHRfIv8dxHTBptrp2NouaIFYSlFs1vewlBKIOM27ZC58XSG/PIX+UZtbsdmANkwaFB6pwTR/OrUe4U56xFDtp49QMaMiILHQ6XTYzkouoWzWnMV0wNb8EwKB1m03JuAm7nyt5CmcsV19FVoLzFRvQfz3NdRCi/4iVqmVzVhpnEfVlSfYWO+DqOkV83BBgA47O2w6glP7ZuLL7TU3gM81jUlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QplS29CeFOguNSAIy9TSoiBP4yqnVAbce0598Kdf1M=;
 b=dkjk55ht+Ifa6MrdbTChvBEVr5eTwCtd9mb7pO5NHOZtKgcZQIyI/HVFBO4HDkquWoO/GaJd8UK9/1XW1bU9GapWEqd6YqHLFkrrVo9JQjQ+cQWHyRddz6IhyNUe0g08Jv8XjjGxL/h2zVAhK4Sm9SN2Min3xGOOMKHwTnop+tc=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB1677.KORP216.PROD.OUTLOOK.COM (2603:1096:101:fd::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.19; Wed, 19 Jun 2024 05:38:38 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 05:38:38 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "nicolas@ndufresne.ca"
	<nicolas@ndufresne.ca>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	Nas Chung <nas.chung@chipsnmedia.com>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>
Subject: RE: [RESEND PATCH v6 0/4] Add features to an existing driver
Thread-Topic: [RESEND PATCH v6 0/4] Add features to an existing driver
Thread-Index: AQHawKPhBAC49Ow5fEGmb7iWSuoRv7HNQtoAgAFRfEA=
Date: Wed, 19 Jun 2024 05:38:37 +0000
Message-ID:
 <SE1P216MB13036C0101A71D3596E975D1EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
 <20240618092950.5xvkuhm7og27xgpj@basti-XPS-13-9310>
In-Reply-To: <20240618092950.5xvkuhm7og27xgpj@basti-XPS-13-9310>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SL2P216MB1677:EE_
x-ms-office365-filtering-correlation-id: a59b943c-4cd1-4a3d-124a-08dc902211c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|1800799021|366013|376011|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?bTdUZWVyczRvVDE0RnNPQ1J3T2hQQmM2RlpxVHFBOHVFQmt2KytyOUw2QUgr?=
 =?utf-8?B?NmlLWW5VM3R4VTZWdjdJR1FlQlVZd2VnQTVmQ21icXc4MzJienQwaWVqSUNI?=
 =?utf-8?B?NzZMTGdmQkRTVjBWN1M4MzRHZCttSCtEbFBuZnREVlQxUXNpY2dwc3gvYkxu?=
 =?utf-8?B?ZWdtbHJQRjZOaXJDU0c5M3ZmMkkvRjIwNXM1bW9QUWswK29oT1hNMkh2VkJM?=
 =?utf-8?B?UjRrc2V0WDFVbnZHcDhOSzNZMXEzWnZLRk8zVlZiRklvQWgreG94YmJSYzg5?=
 =?utf-8?B?dS9ZaTRTc2ZIUzkyRGRXQVhQbHFacGRwWGsvNk1sNkUzUTBMNFZxVDVNNkZY?=
 =?utf-8?B?K3JTekFmK0hEak8zOUNlRyszcGQ4OUQ2WVpCNXM2cjlmdTAxTWxBMDZsZGF4?=
 =?utf-8?B?d2JBczIxZkF1a1YycGJWQXBYcytFMjhjWkRTNXhrWTZmaFJpNzZpemkyVkVj?=
 =?utf-8?B?TXBhbi9MRGhVL1lVbTY3bmd3ajhrMC9mQmxEVUU1VmR5Z1RlbU5vdytSRlFW?=
 =?utf-8?B?S0hOTzJIM2d1bHdrL2ZLSXJCZmMwTk1uL2ZoNzRvdFNJYjBzV0xROVNhOEpx?=
 =?utf-8?B?K0trK2J0QlcwdVFsb1JVVCs1UDB1L2VkTEFaU09taXR3S0t6ZWhqWllvK1pU?=
 =?utf-8?B?dTE2RFEvR3ZxSTN1bGtkZjhMTXIrVVdiYVZGamRJWWhnUzRGZVFSMjd3c25P?=
 =?utf-8?B?c0NCb0RkNTI0UkdQeU85Y1hyR1VDNE1EMzhhRFBvejgrdU0vaFFRZWxscko1?=
 =?utf-8?B?bmNkbDBDQjhjNEhVc1FldzRSVFQ1dHRySU9KTE9MTDBTbTVKYlhmY2pXRnk4?=
 =?utf-8?B?ajhwVFU2WFl0UnNrbXZTbHE1Qk56K09uS0QyM1AxcjJKaTFVc2tabnhFcExw?=
 =?utf-8?B?VmswZndUUEsvVjZncmd6S0lvSTcrcWRjdnY0d2w3SE51c1J4T05uVzlVcURw?=
 =?utf-8?B?WTZwa2w1emhEMnNSNkhyRVNzRWJRNURIbUNpNkhPMDJnWEpMTTJkc01vazBH?=
 =?utf-8?B?MHcrOGlFaEthTHpEVkhmRFNIMm8yRUxUR21aQ052bC83UTdTcm1uaXgrREx0?=
 =?utf-8?B?NVZsb1ZrZUs3S1ZoSWtIaVd1ZW9Tck5jcVEwVnQvY25BTGRVTkF6d1BCNG5U?=
 =?utf-8?B?M3REVS8xTE40M1YyWklqTjV2cHN1djk4N2xSSHRjRkQwQ3hyY1FDOFpab2xN?=
 =?utf-8?B?bitpQ0E0bHlPK3d5b2FiSG54SVJQMTlkSzRwTThPU24xdGgxQVVScWtFcnpT?=
 =?utf-8?B?MDFDWDFVVGswcTY5REJKUGU3NjJpSFhGdENhcTdLdlNTaVN3ak9FVHNwZjNK?=
 =?utf-8?B?OC90aEFPUDlCTGZmN0xsYTlZQ2RZSXJDYTZVRWpMWmlDTFhIdVZ0dWpka1FC?=
 =?utf-8?B?NXo4LzVSZDZSQ25pQ0hWQ2hDSFBWblYvSFhIV2h6N2dnU3VwZlN5MjNHTVJK?=
 =?utf-8?B?KzZ5c2ZlTUt0d01FWG1ma055ODQ1eklZZGFTL0p4a2JqUXNDU2dOd2RXcG4w?=
 =?utf-8?B?Wm1jZGpFdXpobldVd3J3V25RQ0FWREdmNDIwK2dYUFJzSkZvUzUrUEF0cmhD?=
 =?utf-8?B?Q0RjcEtFdlBnM0daT1lIUnFiaWZ2OUczOEpiZ2IrRVl4WkttNHFseHYrVXBv?=
 =?utf-8?B?clN3MVFaOG9GeEtzcUFOTkZqQjV0a21MQmErck1VQWp4NVgyaGt6S0RKeklP?=
 =?utf-8?B?QmhNSURrRk9oTkxJQUZKVi9PSCtac1hsd1YybWdoc2RPWkNMNHhmb0hRbUE5?=
 =?utf-8?B?OFVCU3RNSU55ekg5ZGRNVTY2b3hQNGlDUHZKRVVSVzNCVVdaeGZreTlmMkR1?=
 =?utf-8?Q?YbfgIgmHUQl4XOlb+F7NV2EKPsO3UqlYC349U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011)(38070700015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NHo1cnB2UHR0bWoxVi9YdG9nSkZ0eFFmRTV0N08xemtDY0lXbDVqQWZNYzN5?=
 =?utf-8?B?bHlvUGNJM2hzR0JtRUFZejhyb051L0N0WEs1VWpBdThONWZja2JUMVlIT1VP?=
 =?utf-8?B?Z1JhcGFMQWZFVW5Hdy9vVlN1T2U2YTB3aTVJSkxMcm9mZzlvN1RLOGRZMFor?=
 =?utf-8?B?SW1qRmdhWkhNNEx5bHZ5QVRWeC9wTnplT2dSbUdpVWxCbmJFclc0VGUvTTR0?=
 =?utf-8?B?Q3lySjZoaWtmYjNIVTNQcWp4MHhMazAxaGZweWZkSEZKUzJKS2V0QjJGTGlP?=
 =?utf-8?B?TGxvOFBCaGFpMCtiMjNkK0NJUlR1UHFISFptOW5xNjZGRElpYVh4NmVONm9k?=
 =?utf-8?B?WFlVUDFya2IvOTVwY1hjZ1g3TWlyNGhUb01tSFVvbzR2b2lFcFJieWgxQVhs?=
 =?utf-8?B?LzhmeGQ4VUM1UllKbldpZkRualdnd1IrNUZBS3c2MmVHbVZ2QkU0Y3E1ZVN1?=
 =?utf-8?B?ZUFkM1RyTkhRenVNdVFCcDZPSjBXWWM3czVDYWZPSE9Jd0ljOHhUdHNnVFdL?=
 =?utf-8?B?ajlSTnRUc1Y2ZStTMFQya0tWTGtRKy8weHZ6OXg4cGU4bzd0bzNlRVhqSjFw?=
 =?utf-8?B?WnNsRGNDZ1A2ZDIxZTEwVE10cXBKbUlMWENvek5LckZZZkN0RnBFbEQxWDM4?=
 =?utf-8?B?WWRqbnEwVEZlQ3BJVjdjTkhEZEVrM0Jsb2dyMWtJbWJEVzAwcGg1YXRGWVdt?=
 =?utf-8?B?Z1BpMGtwbUNJbmNnM1VzTWEvY093UnRsSkFaSmZ3WUxlaFVVaVNnSTVVVEMr?=
 =?utf-8?B?ZWlxeS83TWFDNS9QaFpHUG5XUlE2UFBsM0tuNjNhR01mM2dhM3NDcGd4b0Vy?=
 =?utf-8?B?VWdobnRZS3ZhaER2T21PVkVBTitYbUVRMEora2RIT2ZJWEwvVEY5ek5ucUFM?=
 =?utf-8?B?WUVNU2xoYmwydlJDYlJnNkxrYXBXOTNYTDlhYklZcEpHcG16MUVzemJSa043?=
 =?utf-8?B?N0JZd2U3VG5sNXdFZHVySENvbFgwOS9ENmRxeDlQVVUyUldKN211dEJVUENz?=
 =?utf-8?B?M0M4U0MzSXRaZEhCKzBHNzV5K2xVM09kaXZsY1RoOEk1ejdwTWdRWHhwWDFK?=
 =?utf-8?B?em1kYmlPMVFuWUQxRXpGeGh3V3ZDemovVThNZ056NFlBOXZYRkE5anlWZmxH?=
 =?utf-8?B?ZW1ZRnNJelBpbkp3cjN4UDl1dlNRY1AyTkVMYWlhY3pmbStvUGR5OElCZFV1?=
 =?utf-8?B?SDRiVVBwbjZGME5NWXIzR1FjY042Q0RxVktJbzJaWTNwTlYvZ29ydVlTK3hk?=
 =?utf-8?B?a1BUYU0zaXZxQy9lQW9mUDZEN0JBb0xSQmg3VWRBeHpSZ3I0ZlBTSVo2WElq?=
 =?utf-8?B?Sk56WTlZWXNSdXJhbmFGNGpPdzFZeWw3aVZYb1JzUHljZWtxQVA5eHlkZkZo?=
 =?utf-8?B?dlFEaTFFQnZGUUExYXdZdG1BeXo4Z3R3ZGZhQlpKenFhelc0VmR5bVM2Uk12?=
 =?utf-8?B?RW9vcHJHaDZEbXEwZGM3a0dzejh3VFZUaVVzL3FWTFZpWFg2eS9kTXRJZjdi?=
 =?utf-8?B?QjF3QmEzeW9Da2o2N3VqMm1BZ3hydlBLNTRyK3MzS1B4Z1Vsd3FXenFBVTNx?=
 =?utf-8?B?bVVBYVVRS1JqWUtWMkhBM0Nkc1pzOEM5eXhKa1FQREdqeklSRmhWWG85a3FV?=
 =?utf-8?B?TmNpcTVNNFZtNFlQTjNBZTFPZ0tpL2swNUZ4UHJnVmtwRitsaFNYK3BJSHo0?=
 =?utf-8?B?Z3pieXF1aWl2L1hSaVRyL05WeFhGQnBwY1RkbmZDdDZaczJYQjNXdVgrcXY4?=
 =?utf-8?B?QmhHUWxJTktGb2dFSXRmZTRBZlE5N3Y2a2loSUl1bE0rM0xKVm5XbEpqbTJY?=
 =?utf-8?B?bjFaaldGUGN2dkVoQ0E1RTdMY09OU1dFY3J6VHF4Lzk2NUhBdCtwVXUwWVRy?=
 =?utf-8?B?Ty9pQVFKWllPeXdURUhkcG00ak0rTTVMQzlOcUxrV0I1MzRtUE56TXBXanZu?=
 =?utf-8?B?b0tabHYzQ3l3ZEV1bEI1dWx5MUxGZDdoaWVlZThBVGRMN2NJeXJFY2V1N2hM?=
 =?utf-8?B?aEJkMHoxUHplMWsrbGZkSkh5bjhtbHpyNDZYQlBjSDJ1bHgydTF0WW9hbkpo?=
 =?utf-8?B?REo1ZFlxU2F0QkREd2NXVHJVVVlMeVI1MGdSYmNWUEVST3NXSG1YS25LNWpF?=
 =?utf-8?B?c0R1eThXdjU5VEpSRnJ0ZjlYSHB1WjVXSzN4dHhhSXBKMDM5ZEtnRHAvMm43?=
 =?utf-8?B?TVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a59b943c-4cd1-4a3d-124a-08dc902211c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 05:38:38.0422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f6g+/OVqkgy0Nqt8wb5pvG9ujM0smtl3oLBIkfe7ulQ28bPkskA9RqApAdPkrnBuDMWlqbAFO3UynHlDejs95RvJVKM2BrsVA4GDJu363qM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1677

SGkgU2ViYXN0aWFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2Vi
YXN0aWFuIEZyaWNrZSA8c2ViYXN0aWFuLmZyaWNrZUBjb2xsYWJvcmEuY29tPg0KPiBTZW50OiBU
dWVzZGF5LCBKdW5lIDE4LCAyMDI0IDY6MzAgUE0NCj4gVG86IGphY2tzb24ubGVlIDxqYWNrc29u
LmxlZUBjaGlwc25tZWRpYS5jb20+DQo+IENjOiBtY2hlaGFiQGtlcm5lbC5vcmc7IG5pY29sYXNA
bmR1ZnJlc25lLmNhOyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IGh2ZXJrdWlsQHhzNGFsbC5ubDsgTmFzIENodW5nDQo+IDxuYXMu
Y2h1bmdAY2hpcHNubWVkaWEuY29tPjsgbGFmbGV5LmtpbSA8bGFmbGV5LmtpbUBjaGlwc25tZWRp
YS5jb20+OyBiLQ0KPiBicm5pY2hAdGkuY29tDQo+IFN1YmplY3Q6IFJlOiBbUkVTRU5EIFBBVENI
IHY2IDAvNF0gQWRkIGZlYXR1cmVzIHRvIGFuIGV4aXN0aW5nIGRyaXZlcg0KPiANCj4gSGV5IEph
Y2tzb24sDQo+IA0KPiB3aGF0IGlzIHVwIHdpdGggYWxsIHRoZSByZXNlbmRzLCBJIGNhbiBzZWUg
dGhhdCB5b3Ugc2VuZCBWNiB0d28gdGltZXMgd2l0aG91dA0KPiBhIFJFU0VORCB0YWcgYW5kIG9u
Y2Ugd2l0aCBhIFJFU0VORCB0YWc/DQo+IFdhcyB0aGF0IGFuIGVycm9yIG9uIHlvdXIgc2lkZSBv
ciBkaWQgeW91IGFjdHVhbGx5IGNoYW5nZSBzb21ldGhpbmc/DQo+IERvZXMgaXQgbWF0dGVyIGZv
ciBtZSB3aGljaCB2ZXJzaW9uIHRvIGNvbnNpZGVyIG9yIGFyZSB0aGV5IGFsbCB0aGUgc2FtZQ0K
PiBjb250ZW50LXdpc2U/DQo+IA0KDQoNClNvcnJ5IGZvciB0aGUgY29uZnVzaW9uLg0KDQpQbGVh
c2UgcGljayB0aGUgdjYgUkVTRU5EIHBhdGNoLCBhbmQgcGxlYXNlIGlnbm9yZSB0aGUgdjYgcGF0
Y2hlcyBzZW50IHR3byB0aW1lcyB3aXRob3V0IHRoZSBSRVNFTkQgdGFnLg0KSSBtaXNzZWQgdG8g
cmVtb3ZlIHRoZSAiLUVOT1RUWSIgY29kZSBpbiB0aGUgdjYgcGF0Y2ggdHdvIHRpbWVzLCAgSSBz
ZW50IHRoZSB2NiBwYXRjaCB3aXRoIFJFU0VORCB0YWcsIGFnYWluLg0KDQpUaGFua3MNCkphY2tz
b24NCg0KPiBSZWdhcmRzLA0KPiBTZWJhc3RpYW4NCj4gDQo+IE9uIDE3LjA2LjIwMjQgMTk6NDgs
IEphY2tzb24ubGVlIHdyb3RlOg0KPiA+VGhlIHdhdmU1IGNvZGVjIGRyaXZlciBpcyBhIHN0YXRl
ZnVsIGVuY29kZXIvZGVjb2Rlci4NCj4gPlRoZSBmb2xsb3dpbmcgcGF0Y2hlcyBpcyBmb3Igc3Vw
cG9ydGluZyB5dXY0MjIgaW5wdXkgZm9ybWF0LCBzdXBwb3J0aW5nDQo+IHJ1bnRpbWUgc3VzcGVu
ZC9yZXN1bWUgZmVhdHVyZSBhbmQgZXh0cmEgdGhpbmdzLg0KPiA+DQo+ID52NGwyLWNvbXBsaWFu
Y2UgcmVzdWx0czoNCj4gPj09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+DQo+ID52NGwyLWNv
bXBsaWFuY2UgMS4yNC4xLCA2NCBiaXRzLCA2NC1iaXQgdGltZV90DQo+ID4NCj4gPkJ1ZmZlciBp
b2N0bHM6DQo+ID4gICAgICAgd2FybjogdjRsMi10ZXN0LWJ1ZmZlcnMuY3BwKDY5Myk6IFZJRElP
Q19DUkVBVEVfQlVGUyBub3Qgc3VwcG9ydGVkDQo+ID4gICAgICAgd2FybjogdjRsMi10ZXN0LWJ1
ZmZlcnMuY3BwKDY5Myk6IFZJRElPQ19DUkVBVEVfQlVGUyBub3Qgc3VwcG9ydGVkDQo+ID4gICAg
dGVzdCBWSURJT0NfUkVRQlVGUy9DUkVBVEVfQlVGUy9RVUVSWUJVRjogT0sNCj4gPiAgICB0ZXN0
IFZJRElPQ19FWFBCVUY6IE9LDQo+ID4gICAgdGVzdCBSZXF1ZXN0czogT0sgKE5vdCBTdXBwb3J0
ZWQpDQo+ID4NCj4gPlRvdGFsIGZvciB3YXZlNS1kZWMgZGV2aWNlIC9kZXYvdmlkZW8wOiA0NSwg
U3VjY2VlZGVkOiA0NSwgRmFpbGVkOiAwLA0KPiA+V2FybmluZ3M6IDIgVG90YWwgZm9yIHdhdmU1
LWVuYyBkZXZpY2UgL2Rldi92aWRlbzE6IDQ1LCBTdWNjZWVkZWQ6IDQ1LA0KPiA+RmFpbGVkOiAw
LCBXYXJuaW5nczogMA0KPiA+DQo+ID5GbHVzdGVyIHRlc3QgcmVzdWx0czoNCj4gPj09PT09PT09
PT09PT09PT09PT09PQ0KPiA+DQo+ID5SdW5uaW5nIHRlc3Qgc3VpdGUgSkNULVZDLUhFVkNfVjEg
d2l0aCBkZWNvZGVyIEdTdHJlYW1lci1ILjI2NS1WNEwyLUdzdDEuMA0KPiBVc2luZyAxIHBhcmFs
bGVsIGpvYihzKQ0KPiA+UmFuIDEzMi8xNDcgdGVzdHMgc3VjY2Vzc2Z1bGx5ICAgICAgICAgICAg
ICAgaW4gODguNzQ1IHNlY3MNCj4gPg0KPiA+KDEgdGVzdCBmYWlscyBiZWNhdXNlIG9mIG5vdCBz
dXBwb3J0aW5nIHRvIHBhcnNlIG11bHRpIGZyYW1lcywgMSB0ZXN0DQo+ID5mYWlscyBiZWNhdXNl
IG9mIGEgbWlzc2luZyBmcmFtZSBhbmQgc2xpZ2h0IGNvcnJ1cHRpb24sDQo+ID4gMiB0ZXN0cyBm
YWlsIGJlY2F1c2Ugb2Ygc2l6ZXMgd2hpY2ggYXJlIGluY29tcGF0aWJsZSB3aXRoIHRoZSBJUCwg
MTENCj4gPnRlc3RzIGZhaWwgYmVjYXVzZSBvZiB1bnN1cHBvcnRlZCAxMCBiaXQgZm9ybWF0KQ0K
PiA+DQo+ID5SdW5uaW5nIHRlc3Qgc3VpdGUgSlZULUFWQ19WMSB3aXRoIGRlY29kZXIgR1N0cmVh
bWVyLUguMjY0LVY0TDItR3N0MS4wIFVzaW5nDQo+IDEgcGFyYWxsZWwgam9iKHMpDQo+ID5SYW4g
NzcvMTM1IHRlc3RzIHN1Y2Nlc3NmdWxseSAgICAgICAgICAgICAgIGluIDMyLjA0NCBzZWNzDQo+
ID4NCj4gPig1OCBmYWlsIGJlY2F1c2UgdGhlIGhhcmR3YXJlIGlzIHVuYWJsZSB0byBkZWNvZGUg
IE1CQUZGIC8gRk1PIC8gRmllbGQNCj4gPi8gRXh0ZW5kZWQgcHJvZmlsZSBzdHJlYW1zLikNCj4g
Pg0KPiA+Q2hhbmdlIHNpbmNlIHY1Og0KPiA+PT09PT09PT09PT09PT09PQ0KPiA+KiBGb3IgW1BB
VENIIHY0IDMvNF0gbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogVXNlIGhlbHBlcnMgdG8gY2Fs
Y3VsYXRlDQo+IGJ5dGVzcGVybGluZSBhbmQgc2l6ZWltYWdlLg0KPiA+IC0gRml4IHY0bDItY29t
cGxpYW5jZSBlcnJvciBmb3IgdGhlIHZpZGlvY19lbnVtX2ZyYW1lc2l6ZXMNCj4gPg0KPiA+KiBG
b3IgW1BBVENIIHY0IDEvNF0gbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogU3VwcG9ydCBTUFMv
UFBTDQo+ID5nZW5lcmF0aW9uIGZvciBlYWNoIElEUg0KPiA+IC0gUmVtb3ZlIHdhcm5pbmcgbWVz
c2FnZXMgZm9yIHRoZSBjaGVja3BhdGNoLnBsIHNjcmlwdA0KPiA+DQo+ID5DaGFuZ2Ugc2luY2Ug
djQ6DQo+ID49PT09PT09PT09PT09PT09DQo+ID4qIEZvciBbUEFUQ0ggdjQgMi80XSBtZWRpYTog
Y2hpcHMtbWVkaWE6IHdhdmU1OiBTdXBwb3J0IHJ1bnRpbWUNCj4gPnN1c3BlbmQvcmVzdW1lDQo+
ID4gLSBGaXggd2FybmluZyBtZXNzYWdlDQo+ID4NCj4gPiogRm9yIFtQQVRDSCB2NCAzLzRdIG1l
ZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IFVzZSBoZWxwZXJzIHRvIGNhbGN1bGF0ZQ0KPiBieXRl
c3BlcmxpbmUgYW5kIHNpemVpbWFnZS4NCj4gPiAtIEZpeCB3YXJuaW5nIG1lc3NhZ2UNCj4gPiAt
IGFkZCBSZXZpZXdlZC1CeSB0YWcNCj4gPg0KPiA+KiBGb3IgW1BBVENIIHY0IDQvNF0gbWVkaWE6
IGNoaXBzLW1lZGlhOiB3YXZlNTogU3VwcG9ydCBZVVY0MjIgcmF3DQo+ID5waXhlbC1mb3JtYXRz
IG9uIHRoZSBlbmNvZGVyDQo+ID4gLSBhZGQgUmV2aWV3ZWQtQnkgdGFnDQo+ID4NCj4gPkNoYW5n
ZSBzaW5jZSB2MzoNCj4gPj09PT09PT09PT09PT09PT09DQo+ID4NCj4gPiogRm9yIFtQQVRDSCB2
NCAxLzRdIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IFN1cHBvcnQgU1BTL1BQUw0KPiA+Z2Vu
ZXJhdGlvbiBmb3IgZWFjaCBJRFINCj4gPiAtIGFkZCBSZXZpZXdlZC1CeSB0YWcNCj4gPg0KPiA+
KiBGb3IgW1BBVENIIHY0IDIvNF0gbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogU3VwcG9ydCBy
dW50aW1lDQo+ID5zdXNwZW5kL3Jlc3VtZQ0KPiA+IC0gYWRkIFJldmlld2VkLUJ5IHRhZw0KPiA+
DQo+ID4qIEZvciBbUEFUQ0ggdjQgMy80XSBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBVc2Ug
aGVscGVycyB0byBjYWxjdWxhdGUNCj4gYnl0ZXNwZXJsaW5lIGFuZCBzaXplaW1hZ2UuDQo+ID4g
LSBtb2RpZnkgdGhlIGNvbW1pdCBtZXNzYWdlDQo+ID4gLSBkZWZpbmUgdGhyZWUgZnJhbWVzaXpl
IHN0cnVjdHVyZXMgZm9yIGRlY29kZXINCj4gPg0KPiA+KiBGb3IgW1BBVENIIHY0IDQvNF0gbWVk
aWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogU3VwcG9ydCBZVVY0MjIgcmF3DQo+ID5waXhlbC1mb3Jt
YXRzIG9uIHRoZSBlbmNvZGVyDQo+ID4gLSBtb2RpZnkgdGhlIGNvbW1pdCBtZXNzYWdlDQo+ID4g
LSB1c2UgdGhlIHY0bDJfZm9ybWF0X2luZm8gdG8gY2FsY3VsYXRlIGx1bWEsIGNocm9tYSBzaXpl
DQo+ID4NCj4gPkNoYW5nZSBzaW5jZSB2MjoNCj4gPj09PT09PT09PT09PT09PT09DQo+ID4NCj4g
PiogRm9yIFtQQVRDSCB2MyAwLzRdIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IFN1cHBvcnQg
U1BTL1BQUw0KPiA+Z2VuZXJhdGlvbiBmb3IgZWFjaCBJRFINCj4gPiAtIGFkZCB0aGUgc3VnZ2Vz
dGVkIF9TSElGVCBzdWZmaXgNCj4gPg0KPiA+KiBGb3IgW1BBVENIIHYzIDEvNF0gbWVkaWE6IGNo
aXBzLW1lZGlhOiB3YXZlNTogU3VwcG9ydCBydW50aW1lDQo+ID5zdXNwZW5kL3Jlc3VtZQ0KPiA+
IC0gY2hhbmdlIGEgY29tbWl0IG1lc3NhZ2UNCj4gPg0KPiA+KiBGb3IgW1BBVENIIHYzIDIvNF0g
bWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogVXNlIGhlbHBlcnMgdG8NCj4gPmNhbGN1bGF0ZSBi
eXRlc3BlcmxpbmUgYW5kIHNpemVpbWFnZQ0KPiA+IC0gYWRkIHBpeF9mbXRfdHlwZSBwYXJhbWV0
ZXIgaW50byB3YXZlNV91cGRhdGVfcGl4X2ZtdCBmdW5jdGlvbg0KPiA+IC0gYWRkIG1pbi9tYXgg
d2lkdGgvaGVpZ2h0IHZhbHVlcyBpbnRvIGRlY19mbXRfbGlzdA0KPiA+DQo+ID5DaGFuZ2Ugc2lu
Y2UgdjE6DQo+ID49PT09PT09PT09PT09PT09PQ0KPiA+DQo+ID4qIEZvciBbUEFUQ0ggdjIgMC80
XSBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBTdXBwb3J0IFNQUy9QUFMNCj4gPmdlbmVyYXRp
b24gZm9yIGVhY2ggSURSDQo+ID4gLSBkZWZpbmUgYSBtYWNybyBmb3IgcmVnaXN0ZXIgYWRkcmVz
c2VzDQo+ID4NCj4gPiogRm9yIFtQQVRDSCB2MiAxLzRdIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2
ZTU6IFN1cHBvcnQgcnVudGltZQ0KPiA+c3VzcGVuZC9yZXN1bWUNCj4gPiAtIGFkZCBhdXRvIHN1
c3BlbmQvcmVzdW1lDQo+ID4NCj4gPiogRm9yIFtQQVRDSCB2MiAyLzRdIG1lZGlhOiBjaGlwcy1t
ZWRpYTogd2F2ZTU6IFVzZSBoZWxwZXJzIHRvDQo+ID5jYWxjdWxhdGUgYnl0ZXNwZXJsaW5lIGFu
ZCBzaXplaW1hZ2UNCj4gPiAtIHVzZSBoZWxwZXIgZnVuY3Rpb25zIHRvIGNhbGN1bGF0ZSBieXRl
c3BlcmxpbmUgYW5kIHNpemVpbWFnZQ0KPiA+DQo+ID4qIEZvciBbUEFUQ0ggdjIgMy80XSBtZWRp
YTogY2hpcHMtbWVkaWE6IHdhdmU1OiBTdXBwb3J0IFlVVjQyMiByYXcNCj4gPnBpeGVsLWZvcm1h
dHMgb24gdGhlIGVuY29kZXINCj4gPiAtIHJlbW92ZSB1bm5lY2Vzc2FyeSBjb2Rlcw0KPiA+DQo+
ID5DaGFuZ2Ugc2luY2UgdjA6DQo+ID49PT09PT09PT09PT09PT09PQ0KPiA+VGhlIERFRkFVTFRf
U1JDX1NJWkUgbWFjcm8gd2FzIGRlZmluZWQgdXNpbmcgbXVsdGlwbGUgbGluZXMsIFRvIG1ha2Ug
YQ0KPiBzaW1wbGUgZGVmaW5lLCB0YWIgYW5kIG11bHRpcGxlIGxpbmVzIGhhcyBiZWVuIHJlbW92
ZWQsIFRoZSBtYWNybyBpcyBkZWZpbmVkDQo+IHVzaW5nIG9uZSBsaW5lLg0KPiA+DQo+ID4NCj4g
PmphY2tzb24ubGVlICg0KToNCj4gPiAgbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogU3VwcG9y
dCBTUFMvUFBTIGdlbmVyYXRpb24gZm9yIGVhY2ggSURSDQo+ID4gIG1lZGlhOiBjaGlwcy1tZWRp
YTogd2F2ZTU6IFN1cHBvcnQgcnVudGltZSBzdXNwZW5kL3Jlc3VtZQ0KPiA+ICBtZWRpYTogY2hp
cHMtbWVkaWE6IHdhdmU1OiBVc2UgaGVscGVycyB0byBjYWxjdWxhdGUgYnl0ZXNwZXJsaW5lIGFu
ZA0KPiA+ICAgIHNpemVpbWFnZS4NCj4gPiAgbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogU3Vw
cG9ydCBZVVY0MjIgcmF3IHBpeGVsLWZvcm1hdHMgb24gdGhlDQo+ID4gICAgZW5jb2Rlci4NCj4g
Pg0KPiA+IC4uLi9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS1oZWxwZXIuYyB8ICAy
NCArKw0KPiA+IC4uLi9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS1oZWxwZXIuaCB8
ICAgNSArDQo+ID4gLi4uL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LWh3LmMgICAg
IHwgIDMwICstDQo+ID4gLi4uL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdS1kZWMuYyAgICAg
ICAgIHwgMzE2ICsrKysrKystLS0tLS0tLS0tLQ0KPiA+IC4uLi9jaGlwcy1tZWRpYS93YXZlNS93
YXZlNS12cHUtZW5jLmMgICAgICAgICB8IDMwOCArKysrKysrKystLS0tLS0tLQ0KPiA+IC4uLi9w
bGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHUuYyAgICB8ICA0MyArKysNCj4gPiAu
Li4vcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1LmggICAgfCAgIDUgKy0NCj4g
PiAuLi4vcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1YXBpLmMgfCAgMTQgKy0N
Cj4gPiAuLi4vcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1YXBpLmggfCAgIDEg
Kw0KPiA+IC4uLi9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHVjb25maWcuaCAgICAgICB8ICAy
NyArLQ0KPiA+IC4uLi9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS5oICB8
ICAgMyArDQo+ID4gMTEgZmlsZXMgY2hhbmdlZCwgNDMwIGluc2VydGlvbnMoKyksIDM0NiBkZWxl
dGlvbnMoLSkNCj4gPg0KPiA+LS0NCj4gPjIuNDMuMA0KPiA+DQo=

