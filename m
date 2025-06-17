Return-Path: <linux-media+bounces-35018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F6EADC273
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 08:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11F4218967FB
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 06:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B9228BAB3;
	Tue, 17 Jun 2025 06:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="GrgjftYH"
X-Original-To: linux-media@vger.kernel.org
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazon11020116.outbound.protection.outlook.com [52.101.167.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48548528E;
	Tue, 17 Jun 2025 06:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.167.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750142047; cv=fail; b=jLJw668V0HUhfXrccGRuYYIGEvnhjQeYPRUCYhYtqDdVEg8VYnaKplSdqpolMjcemFHAQKhp7FTMDTFX6iBF4cOBIi3QG4a5JFkotPV/gLhGuygB5+IBwEUiAY6rP/V6HxNt8vWC3QqI3Xgtj3DuSjecgCFuTZk/FwjB5Y8hg4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750142047; c=relaxed/simple;
	bh=SturZozky9b3HrXCboYpDCOQJUhQFzaQsFPosHfJuaE=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GWTojRTJ153E2w0UWnnxhPdpK76/GSSaJ0M45SWmGbjWewucNpbOkozXDJj+2hMhWkIHnTNAkEsPTeMhv6yPxQCYxUTyD6AZ2hkuokZlRRoAKkpP1IwHXmaEtt9Jb8BWqBOs2d+DnKQHSak8/mCsFRv9gtoO71RZLOrd96rNb1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=GrgjftYH; arc=fail smtp.client-ip=52.101.167.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRvHyUfb7v/+nmgK7BYx4FuYth6K8KY67ebdnloQ30nwPdcR0o836MTRr8N++vX44HuLna1J/X3j73hkdqeiwD51voHsUD9cYEhYweXaLqKQXtW9sioNIJCdTlfsTP1uSRvNujFoM8KO/R+Ej2RlHZIwtQGfzz366mE2aDJ8yhu/CS57cJdXpC4w5f5UjtAF12TnHcZXf0jwqvHFL120rV3iLVsvOGP3q4AdOFV/d4xhfuQsktZXjyU/UjmT+z+D7Ww8aVEwa7fu5zcTKWtNTFcJSMcNYS+N2cpNP+6J/JeBGgQ9Xdpd3YmMngFOOd+6O/60SdrTN0eE3sTa83ck8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FazVkiIDsbOfxjOK2dzuJTd5HGATSOBrRRytB+4yllo=;
 b=aS5Xnwd+Awl5zn3CwIjKyOn56ZYDHQqyWa3Tl7EnBuY2JGyup8LOt/gdBUj23oqCMiogRTdNq/h1hgCR89BGM/iw0ygBEKI9ppZlpqk0sUQBFSzHIIB9l7S2FCYEVa1mDd1w1xg3fIY9glN/mAy5OVNKe/lPS5L7XChAwCPQ9dtulfF2WYy+FhdG21y6BTlwRe09p1s18YC/ND9/Y+/wc70QH/QXT7wR5INUzw3JYfHjH/1CAiyMaFZ2x91qrdJxuWhmyGOJ84/2CXv2tJn0MKg7YkJ37tk4+SX9niicaHKQ9vp7EZOsrZV9pWnY/FvsO0nTbbNcRLfFX29pcsO6ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FazVkiIDsbOfxjOK2dzuJTd5HGATSOBrRRytB+4yllo=;
 b=GrgjftYHTTWLu/NnA3+BonxTA6FQU4/vfRpP9U6DSWZZ5yCF3+gbOeiFeeGJ0TqjMgp+4CPo6LLofb3IJ4bJCRoXf0NysRHvV1uftuWP6LX7w12tCfjUtjrc6x8wDQAbFJjv6QpbScxOuIDcWeLE/9HtnRCXhYjUgkFxSoeEJbS/4jyVb6aMuvTCCxz8IN0MmsTNXqjg6RuGB8j9z4ivdiZ8nWBAVejOXOveKNNjyXb5jAGoL+8vgIPAsdKZNecuz/o26lNOimbtFBtarzDQkpPGSfanrYMgvr78eNaa5/A+xUWEEnhtxHp9/FyBikY6eKeBr+kfdnixQnFymaczhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PAZP264MB2573.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 06:33:59 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%2]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 06:33:58 +0000
Date: Tue, 17 Jun 2025 06:33:49 +0000
From: Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
To: Michael Tretter <m.tretter@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: media: allegro-dvt: add decoder
 dt-bindings for Gen3 IP
Message-ID: <uld753xxm3ryp2iav6zgb47m6parp6vqz7mpflmdiftpgg6iim@7menlew7pycg>
References: <20250605-allegro_dvt_al300_dec_driver-v2-0-1ef4839f5f06@allegrodvt.com>
 <20250605-allegro_dvt_al300_dec_driver-v2-2-1ef4839f5f06@allegrodvt.com>
 <aErLIriSYa1meukJ@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <aErLIriSYa1meukJ@pengutronix.de>
X-ClientProxiedBy: MR2P264CA0078.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::18) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PAZP264MB2573:EE_
X-MS-Office365-Filtering-Correlation-Id: 764fcade-01a8-4243-2e1b-08ddad68f0c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXh3cWxXV2xTQm0wQlhrVURaVkdxam1RTnI1eTI5MExqY3VVQm50ZzJiSVlK?=
 =?utf-8?B?THR1UFRRZFFEUXkvZk41UHNaTWs0K0JZU2lIYUhmVFB3d1o4QUNWNHR3clBS?=
 =?utf-8?B?NlFFSE1ZNGg3SFg1VUw3aTliYWZ0elBNYkZNeXNYZWQyRy8zcmdqckR2STl3?=
 =?utf-8?B?TWN1RjJHaWxFUmhaaTM3Um9KZVUwYzZaR0tsSkNZSkJvKzVJMHE0SE8rUngr?=
 =?utf-8?B?cXg0ZlE4NHF5cUhtd3VnaHhJQmp4dkdJdjI1dldBNVJ2cDVBZXlpQUlLOFZs?=
 =?utf-8?B?SXZ3dnpydGdQVTFVTTFaL29jZkE5cVVPOFFsV1dTejVFc0ZGUldDVkJ1VHQv?=
 =?utf-8?B?YUNQMG00MUNKcHc0SEtEYVh3T2NsVkx5aWRsYXVKYk4waEZZNjY4UDkrZEFi?=
 =?utf-8?B?dXBlMTJyYy9tN3A0VWl2NDNWYW44U1RyK2JGVTMvVGdIMHdoemh5QTg4WFdU?=
 =?utf-8?B?KzFoeHZJMi8xbEdFN0FqTlkzVStyV1lkdDZ0OFdBTXN1R0JsUEFnZDAxczgz?=
 =?utf-8?B?bjQ2UzF5VUpNN0Q3Rk83WjBqcS9lekpwbjM4VXlnemd1dUFFS3FmWXFPMFZq?=
 =?utf-8?B?ZHhUdlJaZkcvdGFrMEp0U3BFc1lqcTQ2c1hjWm1JbXJ0RUtDcGRMVURkSjlU?=
 =?utf-8?B?dXcyQVZMNGg3allVRnlTWUhhR1U5LzF5czNZbHBuWnMrK3dCS09mWjNFQ0tI?=
 =?utf-8?B?bHlybExPaGxIazFwMWErS0VjM1NhWStCRm5YNzdmQXNuQlNyOGVIbVI1eW5h?=
 =?utf-8?B?bHJLQ09LUVRoTGs2U0lVMllhZmoxS09DUEsra1ZuNGcrZzk1Y3RrT1MyNHJX?=
 =?utf-8?B?WTBTUGw0NlNqeGpoSUd6cWpqSVJwcVc2WnQ4UVVaOU1tQmhReHFXKzFyd1ZM?=
 =?utf-8?B?UXQ0SFZQc0w4VFFPWEFlRTRhd2Qra3JsaXYzaUJESTRwVDAxWlVhblNkWDZz?=
 =?utf-8?B?dWo5ZFlmQ1FhRzZBS3pobEROWEpNUGZpMVAzeXliUnRxWGVNaGRGRTcwMGZI?=
 =?utf-8?B?cTVycnp5TXpiaDFGc1hBN216aUVLN2IzZWtZU0NOd2FhYkQySUhZRVlRZEM0?=
 =?utf-8?B?Y3p0SUptTjBDUFB6UjVtL2o0eFdzZlcyd0FwUEJmamtrSG1aVzI5QjRYMEo3?=
 =?utf-8?B?cnE5aTZkQmozYlQ3QkkxNk4ycjlvSTd0QmpIdWp6ek9idGR5NTlrTEJBbkY2?=
 =?utf-8?B?V3R0OEtrMGVpckJYSHYrN1FEZXBKK2RsMkRDVnNUOXJEeDArN1ZCYTRWZFhT?=
 =?utf-8?B?aWQ4a3hWNU5iTlYwV1dQL3V5bS83SnlvRzRUMTBjYjRZQllxUXNzV3YxZDRj?=
 =?utf-8?B?c3hQNDY5VjJpUk5YeG82SldYQ3ZwQWdqS1FkZnNpWmFHejF3QXFIOFRxM1hC?=
 =?utf-8?B?c3NrS08zN1JTWXF0SUZ2eDFhckt2WTE5ZUpob2RhOVNoUWZicnR5V3d2Vkx4?=
 =?utf-8?B?TjJpUWlaTEZ4TGQ1cFNkYnJVV1dFUUxlMUJqa05aZlBZeFU3MksvVFhqQ0hE?=
 =?utf-8?B?bVo2YTMwMFVhZFQ2WGtDelRCbDBEUWVadGE3WEZVOXZkd05PdWJxN3lBMHFW?=
 =?utf-8?B?NS9LL0NXUnlIWlBkLzNMME9aZFhUSGxEdk1IV3Z4ZFEzWE5aZHFxVlA2ejFW?=
 =?utf-8?B?YXJZOE5tYmtXbUVUeVFkYnpqT05vbHIrcDE3VUJXYk1aQTVMa2RFaVN0Y1JD?=
 =?utf-8?B?VElJOHlqRVlvTHJ4bkJKdlRaYzJ0eHFjaTJyVGFXdUhGYm9CTFk2aVRWcWxo?=
 =?utf-8?B?UzFpQ3lHYkwyM2VVU0RFTjltNUNTS0VMblVrNHo2bFpnNytzN2RUdS8rSnh0?=
 =?utf-8?B?eEZ5cTVEWlNUVTU3MjdoYmQyWU1MeGtVaU5KZGh2RjgzaE1nQmphSGlmZUk5?=
 =?utf-8?B?WjhRZWhEVW9tTzA5SGU4ZGFEY2RUUlJOMExUTmxJQzJrNnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y21tVGlMd0tJWFVvbjBXU29vL2VHM3FFQkI1bXpGT0FCS2UzY1ZSU0o5MFlo?=
 =?utf-8?B?VmZqY01GR2MwTWRLaVM5NWxXaGI3V0o1Qng0RmpIenVuUk5IZVhVYnFZUXYy?=
 =?utf-8?B?aWFhYWEyQnFheXlkalpHYkZqd3htOTRycDNDZzA0enRSbERxdDNZL3F2bkJF?=
 =?utf-8?B?bXFLeDY4MFZjS3Q3ei83b2ZyemUwSC9KeC9wSXNPUTYxeWdKMXkxVDNONzRa?=
 =?utf-8?B?eFIzUUJ3YUNyNERORm5JN2M2UVRNNG5ZcXM5NXZVTDRrVk5VQzVmL01xaDV6?=
 =?utf-8?B?ZUo2Mjgwd3A4QUtkVXAwazdmb04xTmYzY1Q5aWlKUXJ5WmxNWXNyQ1YyUmxz?=
 =?utf-8?B?ZXNGUm5jMWZUR1o3UUpqWVl2bEpYMW5GWXZ3SlZXZnNld1BQeWZIQkFGTis0?=
 =?utf-8?B?ai9wamRtNTFRUlNDYXNEbTc0cCtBUnhKSzl3TFJQRForQ0NOay91NDFlbzFO?=
 =?utf-8?B?d2laMHFXTFpqeHN1c0NGTERrZ1hDclNhTkdTVDF6NDhEaFlROVJPbjYrUklu?=
 =?utf-8?B?MlJOTjllMUxwR1JBNnNkWVlZRGpIdGdEQmxZUVAvcnZ6UVkxd1FOQUxHM0dh?=
 =?utf-8?B?WHU4UlVaaW5FOUhkcFJvMGtuQXZSQVVtdE45bDI2MUp0aGdPeXltNGVTMkt2?=
 =?utf-8?B?SXFMcmgwTGdmeTc0bzV1VFNtQVVLRnNUNlk2Wkc4WGRRUnBmS0E2MFF0WkR5?=
 =?utf-8?B?NGlhTnNUNWhoZGdYRUJyazhoRjQyd3Z0L3JXdjViZ0hqMVRzY2MxTDREdmdP?=
 =?utf-8?B?RkJQcDB6RUhjdWNlL3JSY3BFYmpQQzhHZjRhYW4rQ2NoWW94Um1RY2FEYm1X?=
 =?utf-8?B?aW16UUp3cTZRZzVIajF5akZSdEVkMGN6SGtuV3lqWlZsQVdobWV2NXBjdE9z?=
 =?utf-8?B?R1M5SEhOSjN5NTYzT3NKWGNuYm5ScndDOFJLK0FDVGhlN1NZckk0Z2t2eFFa?=
 =?utf-8?B?a2lBcHhURVVhUHVuc3VFZVdvUnNaNTFDTXBVaER6NGtvK2xnODFqS25LbjVL?=
 =?utf-8?B?YW41cm85NDlYczd3RWViaTdXZW9OZC9qZ045THlEUjVSWm9INVhJMmEvVElH?=
 =?utf-8?B?aFlMbkVzL3U2MmlFM2FLR3JNdjYvRU9QVWw4d1FHbitrcWNuT0RKN290WGNk?=
 =?utf-8?B?T2xzTnd4QlJkSSs1dFdkUXAzMzNQRGZqZGJvSCtNMUx4L2t6YlBKVmxWSVh3?=
 =?utf-8?B?ZjB2MWI0V09TUHZHTG0yUEJKdGpnNFNrTG9CMkV4VUZuOEIzY1c0WWZ3YWFl?=
 =?utf-8?B?NHFKNHU0amRWajBXODd0SVpiRUdyRVhaWlpvc2diVktOTTZQNXA4YVpOaEMw?=
 =?utf-8?B?S0tNYm9ndW8xWnFmNTZpUEdOODltZG00UGszUGQzaGp1ZUF2bmFlL3pxTWV2?=
 =?utf-8?B?OGY4S1dmdzZtZ3dDY2o4SHRnNFZXSEI1azlnUmh2SHJVYW14YmtjR1VZaGJq?=
 =?utf-8?B?aFZWU1ByRThuRFZYdlRuWmtXUkUwRTFEbEpqN3VnVkVzYUN6M1I3U1BndmJ3?=
 =?utf-8?B?QlFRbmVwS0tXb0RCTjJvRzlGekxZa0RibFBPYlRYZmhZY0hXaTFiaDB4M3dM?=
 =?utf-8?B?Q25rRmpSbWN2SzVxU0swUXh1b2pDajBvSFNndEx1b0ZNdHFkcWJmZlhDZTBp?=
 =?utf-8?B?TWhXUmhvS3NsMm9Fb3FqQ2J5SFkrOFZDUmZwdkZYUFV4NmpjYTh4RUJkeHNV?=
 =?utf-8?B?Um1IMlRXMnhCNW9ONGQ5MVBBMFVraER4WExoOElybEJFKy9wZzFRQlhzMVdk?=
 =?utf-8?B?RWtQWDd2TDJzM3laTE9rWElkU3M0VzBzQTFQZ3p1SkEvcERHZXdOMU5oSTFT?=
 =?utf-8?B?eE5YcHRCeG01Q3NQUU9qbWZBNERyR0k1Q0ptMXU5VTE2b1pEL1kzVDVTZnhN?=
 =?utf-8?B?V09na3JnbmoxcWhuUlUrME9LSERvZXIwY1BGdE5iZ0I2YUNSbFE0U0YzY3Fn?=
 =?utf-8?B?QzhxbWJGd0tZTWpYclpMSTdid3hHY2huNElvZEt1TG90cG1rUklKcSs1N3RI?=
 =?utf-8?B?cmg5cFl6a29FdWtzdnJIMmRyeW1VQ3FmTXdhbXJrSS9YUjdoZG1VeGUwSW5L?=
 =?utf-8?B?eDc3T0srWjNlaUlqb25jaDY1T2ZnVFBMYkFmTzU1WHhMN3VxTGNnT3V5SGhT?=
 =?utf-8?B?QkZWK3IzeDlnSTltdldkZmsrTk1HVmQ2Vy9IaGtScHlmV09mc3d1MEpUUXlk?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 764fcade-01a8-4243-2e1b-08ddad68f0c4
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 06:33:58.8131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8aB2S4nYhhx9H9BbhK/tquX4Ty2Yha5B0pmCpVgJrVadgHw584NPkJb34OjN4RROMlL0Nh6xUJMOISA3DwJEVdiKKrCkmZtbTZf3uqMmuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2573

On 12.06.2025 14:42, Michael Tretter wrote:
>On Thu, 05 Jun 2025 12:26:57 +0000, Yassine Ouaissa via B4 Relay wrote:
>> From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>>
>> Add compatible for video decoder on allegrodvt Gen 3 IP.
>>
>> v2:
>> - Change the YAML file name, use the existing vendor-prefix.
>> - Improuve the dt-bindings description.
>> - Change the device compatible identifier, from "allegrodvt, al300-vdec",
>>   to "allegro, al300-vdec"
>> - Simplify the register property specification,
>>   by using the simple min/max items constraint (Krzysztof Kozlowski)
>> - Remove the clock-names property. And remove it from the required
>>   properties list (Krzysztof Kozlowski) (Conor Dooley)
>> - Use the simple maxItems constraint for the memory-region property.
>>   Also for the firmware-name (Krzysztof Kozlowski)
>> - Example changes:
>>   - Use header provides definitions for the interrupts (Conor Dooley)
>>   - Improuve Interrupt specification using GIC constants (Conor Dooley)
>>   - Use generic node name "video-decoder" (Krzysztof Kozlowski) (Conor Dooley)
>>   - Remove unused label (Krzysztof Kozlowski)
>>   - Change clock reference from <&mcu_clock_dec> to <&mcu_core_clk>
>>   - Use hex format for reg property (Krzysztof Kozlowski) (Conor Dooley)
>>   - Reduce memory region size (Krzysztof Kozlowski) (Conor Dooley)
>>
>>   - Link v1: https://patchwork.linuxtv.org/project/linux-media/patch/20250511144752.504162-4-yassine.ouaissa@allegrodvt.com/
>>
>> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>> ---
>>  .../bindings/media/allegro,al300-vdec.yaml         | 75 ++++++++++++++++++++++
>>  MAINTAINERS                                        |  2 +
>>  2 files changed, 77 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..26f9ac39682431b1d4828aed5d1ed43ef099e204
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/allegro,al300-vdec.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Allegro DVT Video IP Decoder Gen 3
>> +
>> +maintainers:
>> +  - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
>> +
>> +description: The al300-vdec represents the gen 3 of Allegro DVT IP video
>> +  decoding technology, offering significant advancements over its
>> +  predecessors. This new decoder features enhanced processing capabilities
>> +  with improved throughput and reduced latency.
>> +
>> +  Communication between the host driver software and the MCU is implemented
>> +  through a specialized mailbox interface mechanism. This mailbox system
>> +  provides a structured channel for exchanging commands, parameters, and
>> +  status information between the host CPU and the MCU controlling the codec
>> +  engines.
>> +
>> +properties:
>> +  compatible:
>> +    const: allegro,al300-vdec
>> +
>> +  reg:
>> +    maxItems: 2
>> +    minItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: regs
>> +      - const: apb
>
>If I understand correctly, "regs" are the registers to control the MCU
>and "apb" are the registers of the actual codec engines, which is
>controlled by the MCU. The driver never accesses the apb registers, but
>uses the apb address only to configure the firmware and tell it, where
>the registers of the codec engines are found.
>
>Maybe a separate node for the actual codec that is referred via a
>phandle could be a better description of the hardware?
>
the regs is actually is used to configure the decoder and also the mcu.
the APB address is used to map the mcu peripheral, which includes the
codec engine.

I think it's sampler to let it as reg.

the naming has changed in the v3.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: MCU core clock
>> +
>> +  memory-region:
>> +    maxItems: 1
>> +
>> +  firmware-name:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - clocks
>> +
>> +additionalProperties: False
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    axi {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        video-decoder@a0120000 {
>> +            compatible = "allegro,al300-vdec";
>> +            reg = <0x00 0xa0120000 0x00 0x10000>,
>> +                  <0x01 0x80000000 0x00 0x8000>;
>> +            reg-names = "regs", "apb";
>> +            interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&mcu_core_clk>;
>> +            firmware-name = "al300_vdec.fw";
>> +        };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index abc6ba61048771303bc219102f2db602266b7c30..1ff78b9a76cb8cdf32263fcd9b4579b4a2bb6b2a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -816,7 +816,9 @@ M:	Michael Tretter <m.tretter@pengutronix.de>
>>  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>>  L:	linux-media@vger.kernel.org
>>  S:	Maintained
>> +F:	Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
>>  F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
>> +F:	drivers/media/platform/allegro-dvt/al300
>>  F:	drivers/media/platform/allegro-dvt/zynqmp
>>
>>  ALLIED VISION ALVIUM CAMERA DRIVER
>>
>> --
>> 2.30.2
>>
>>
>>

Best regards,
Yassine OUAISSA

