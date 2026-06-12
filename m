Return-Path: <linux-media+bounces-64726-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Uv+xIjRTLGqxPQQAu9opvQ
	(envelope-from <linux-media+bounces-64726-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 20:43:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A7567BD0E
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 20:43:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=garyguo.net header.s=selector1 header.b=HrHXfTMR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64726-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64726-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=garyguo.net;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3416F3072B61
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 18:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C6839A809;
	Fri, 12 Jun 2026 18:42:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020131.outbound.protection.outlook.com [52.101.196.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187C238887B;
	Fri, 12 Jun 2026 18:41:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289722; cv=fail; b=MC5kDy1N9AyPqXoh3yjxOAw/LvHLaHZP31Um10B1QLfpQvtzoPCOEYjMZ7llTnLaKVF5t8icZ3PqS6GPWk/VVtJkusLNIyYWbt6YL/WWbOpuxPk0P1KtRjinUejQ8rBC+wlidH1YtRaJrYvhxqd892yT6YjDmOOHHfIXX11SaAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289722; c=relaxed/simple;
	bh=HDanx0cf9rDnd5zXhatrxcAjoYcILcwVj0JwJMRBdyo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=oLA1R07CiQAeL8GDZuXLKczzNzkqIy2KRBNSoWmZ1JN/snqBAAU4LlsZy+asE6RtpwVt+CxTiD3HpVEOfpWwgn7xC2NqKoW75uzRLIFXIcbpFiHkhouFRDo+UBu+F3n+y/uxNSRvIWU7m2ZzESaOdV2Ixz8PSWpUH9sJSYViKHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=HrHXfTMR; arc=fail smtp.client-ip=52.101.196.131
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsPP9qZAXHtdaFYVoT8Qs/2qJznO7FVlidxjzI3uIIbqxlxgrcsWftA6S6lM/Uf9dIeBH1f0gT++ivR+jjeU6V2SC6IW7MJOE6sCIlMPqHDz90h0Go/wjlEskXX7GTIOdcS76GOgZKU2ozkBV+pATs3RjRAbmlLcxZzd4QyL9SQIrnD0OzRY/6j+mQLE6riEcYS0kIhdDCJoGlJ3vo/5/9g9HIjw/fHWa37M9cRO1BWgg9e5GamGguwuvzv3U/UcAYTO7jeF4G0dn1BgOT273vQqyQOP9PP6OxA19hGf3wBGJud40XlgbyWxtcMq/oikQb9pG1Eyb7N7RstTtEdPUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vU2Fth49zfwW8O+jvi6kKRYh+COxCP1+tEcO4OhODgY=;
 b=pEzfuQEoP1EbqFSvEtLy8I5yndjcfEi3sAoTSrvdUOAWWipi26LbE0B5dqWLVuUP6voEN00WUVbCV4bc2YcDDcJqc0fnA7sjUoOekYbqT4Mgo+6nfGJ2oNbeunJHsxmX0gy2AoSKg3G6AatiH5u6qKOdYarTJysN/ADwSyX7SJ5pneVtOq0t0HNuSZ/eqd3dNbo37kn146Axi0jSgASMLQ1OhWSWqq7tK6iljByJh52FvKqXOqlTlEcrYKOxd5lF8z1hc+zI3rwwFnhiXCdB8LZ1tU5djwmwi4G+iwyayBQT4bxOLzrT+d9PoAoVf7YCa5eFZGVMOEOgDK7COwPR+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vU2Fth49zfwW8O+jvi6kKRYh+COxCP1+tEcO4OhODgY=;
 b=HrHXfTMRvL0hEnm3L1i6+A4c3ebRt4iynq1r5pIshkxwkQW3ywXHirAH8i4/zzyys7u6zP8Mb5vfJ4DfA0z7tFtxRyaH2gInKfAs++bCXy8TnsWSh34TuiLdKH58i+j5bzH0WgKu8p5phrXDQ0DrTO6KJCoRineXvdiVsIuvO7o=
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO0P265MB2841.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:180::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 18:41:56 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0113.011; Fri, 12 Jun 2026
 18:41:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 19:41:55 +0100
Message-Id: <DJ7AI6E1YIF1.34AQ9WVWKR0IG@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, <driver-core@lists.linux.dev>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Simona Vetter" <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, <linux-media@vger.kernel.org>, "Rafael J
 . Wysocki" <rafael@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Maxime Ripard" <mripard@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Benno Lossin" <lossin@kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Mukesh Kumar Chaurasiya"
 <mkchauras@gmail.com>, "Asahi Lina" <lina+kernel@asahilina.net>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v20 1/4] rust: drm: gem: shmem: Add DmaResvGuard helper
From: "Gary Guo" <gary@garyguo.net>
To: "Lyude Paul" <lyude@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260610162433.923550-1-lyude@redhat.com>
 <20260610162433.923550-2-lyude@redhat.com>
In-Reply-To: <20260610162433.923550-2-lyude@redhat.com>
X-ClientProxiedBy: LO4P123CA0528.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::10) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO0P265MB2841:EE_
X-MS-Office365-Filtering-Correlation-Id: fe0ba968-a043-4887-b52e-08dec8b24783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|376014|7416014|366016|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	dvHYgYQj1cwThgyvymKotGpqbY28k8iWSfn2UP3Kkjbx1kXddyCdjzrM6A0RtfCOzkiOtdOer1Qh2vXR5R+r60Elj+/bstQYrpjOPjnsXWlVb3KY2TJ0Mtk0RM3la+6+D4TySDA1EArvtD8Y0GWYH8ONsnOCkFF+g0Fvxx8aj8jJ3Bi3JTLZdTuDMVxWdi9ZaEAFiqkYSLTQkJ85mUwdAcrPV3nQ8XrqEzM5a5sRNziCICGL81tK4EZgwhAxUAovXnCTlB6BF1TjRxAxJ1DIPe5EoyKi+h6MA51CqfqE2dRtHkCQO7tivPRjHCPuZmKjKCyLb9EWW99YRSdzACrNEN+BgFU6LVJ/YfBdy16pPYjGlGTlNajh6e0+mb5LpLIakhYySSqKoGlXySAk+kX5BY+Gib6TQ+CIqAWO9H7N0DQL96+3BgwBcY6Bg/UmPsd8ccB1SI3lr02mS08dIE3R6m8303ojlVuKtqlj3QGA9DjvombNjTHfuMJbCKyZr6wpnewBkVeMTJsgwGY9AwwTW4hh0ecR8MV6QDTA0+4eGSuEwJM992hhUIOblh/UygViJDZkMv3hgTQFPzhHl+fc8AdjgbeEyR0m+ZAXMzEQrjcn1coHY5ETY+0C1SBSMzd3Ri5beOz4XyUtmF9D3XT97pWxZulQ326z1SsGmp4kiYKuzpjgZqa43uGjVRpVdNMB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(376014)(7416014)(366016)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjdsdDJNK1dnL3poTmQ5TzRwU0hGUHljRFhHSW9WZlJ0SS9WWnA5d0ZqQ0dl?=
 =?utf-8?B?azNoS1NQOVFZTzZndDhWUXQ5OEQzQjZKZk0vMWc3UVF6R0hEdnVkMnlvNlU0?=
 =?utf-8?B?cUdTMHhyMlBTemw3RU45ZkhsVThENUlUWXpXNmpYZ3hRWno1dGRKa3FqU2Q1?=
 =?utf-8?B?UzZvMzgxTmh6VEUxUlcrcXlmbkJPRW91S0Q4RUdDb2NQbWU2bjNvR0JqTjkw?=
 =?utf-8?B?bUJJcWFtRDF1clJhbHlON0k4NEVSMlpxZkwrc2J6cFA1a1lRUzM3bnlScXlX?=
 =?utf-8?B?T0RZYzJ1M0xEcnlsMFJjSmlvVlV1T1RRV2VOR21jZVhoRkY5S3VJenoyRkNQ?=
 =?utf-8?B?eXVXbG1sSEpmdDB6SzVRYzJnRG5PZncxNzVEMzFTMldpUHNaZ00yS1pINDdH?=
 =?utf-8?B?RG1BaktUcERQNkh4elU3ZlpFQTd1RW15SGxEZFdONVlSeUVCZnV0OWV2U2xh?=
 =?utf-8?B?ZGFPSmxXaEcvbGV3d3F4Y2U3Vmh1aUtpRVo1RnkxTndkN0Z3Y1Z3N2lRZVVn?=
 =?utf-8?B?UCtLRFZlS2VnQXNhMkxYdDA1Skk3eExmcnc3VjZXU2R3dTNYVk9uS0s3MVE4?=
 =?utf-8?B?OEM1SnBPdFhJcVJ2ZnJocDVHYXZUSkRZZkFpMWNZTmdsL2svUlFvdkU1NFFx?=
 =?utf-8?B?TDhWeTNHYWptVm5XTTlyR1I3ZGlSc1BvbE9mb0s3RVhNVHZzVmpKWjRYd1pF?=
 =?utf-8?B?a1ZhOCtoeE9tSHhNTU96bFl5MklWWmIyaVlVaWljR0FERTBwbm9ueWg2dGJt?=
 =?utf-8?B?RVFYRVp6OFNCT2pPb2QzckZtOXhLdmV6Vi8xSzN1V21qSGlWclp2bWpXK0Jj?=
 =?utf-8?B?T2JGSG0rTUM1RU4zRWZVL21URDhXQXh2akMvWENiS0ZFZWFna2gyUW1Qd1Ny?=
 =?utf-8?B?TUdtYkxVVGt1ZUFCUkJHZUpMTDFTcm4vN1F0YmprNDhlODJ0SkZUYS9JaG56?=
 =?utf-8?B?c3JMVlFyNjNTcnBheVpxWVVMdEc2OVl6WE5MeXJTZ1hES2FMRzVEMVRLUTBi?=
 =?utf-8?B?U2w0ZWhEMERtQUR5NWdZcFdCR2hGVmtwL0hheFp5dzFpZnBXUFFGZVN4cVMx?=
 =?utf-8?B?WXVMbjVURThSakc3Y3lZTkxWVDY3OUN6cENIWE5idEQvWnlNQVV0QTdNR3pM?=
 =?utf-8?B?cDJoOVBmbmR1WmJsWDlVbi9zdVRRcnZZbjd1alVvUlRvMjB0T09kWjFFa0lo?=
 =?utf-8?B?MDBmeSszYmx1ckNVcG9OZ25pR2ZBOG16RkZ6TmpqbkpQRmp1NVJNYkFMVzBl?=
 =?utf-8?B?ZEllMmFmUEpVSmtDK01kVWJDbmlWbWc2RW9sN21SbEZqOExWNFA0UWJVcEUw?=
 =?utf-8?B?L3gyNzV2SmFZTWV5Y3U0K2NxZmF2aG1ZQ0JudW92TUhhaDFnc1NaVzVMZmZW?=
 =?utf-8?B?SHVQbitCcTEwejB6aUdVLzhWU1VGTUVLelhZbmZrbWN1dUFsSENmM1NCS3RF?=
 =?utf-8?B?bkt0ejYyTFdsMWdwQ2YzRzhSOUlrSmxGdmU0ZjRPWFU2d1NPZkdndkhuYTkv?=
 =?utf-8?B?Sm52bENtYnZBL0k5QWMzeFJ1UFUyQUZmdHIwZEFPUDg4U0doc3gyUk14Z2Yx?=
 =?utf-8?B?Z3VWaFM4TGdORURheEFNQndnWVU4aW8vazUrek93Vm5rci8vUGZQMjBKRFUx?=
 =?utf-8?B?V2xNRG9CaDVwTnA3YWppdzVRK1VYVStlR0MxaWk1K3VPOEtrUW9UZVpEN2tx?=
 =?utf-8?B?S0wrZHl1NTBhcHg3a3d6bWVLVG9CNGpvZXF5ZXIxMDhvZHpnbjQ0c3UwRTly?=
 =?utf-8?B?TVZZMTFIL2h1T25DS2ExZUl4V1EyNXljQ0M1Wmt0cW80TWJFaTNWOVEzNVZw?=
 =?utf-8?B?SUdxL2d2QUR4YStrODZ0N3crbFFUZXlia0FvRWRoR2MvRGZsQVRWVFRSbHhK?=
 =?utf-8?B?TXlRSkJyMkxaRDJIRmx5OGVEQ2l0SDZvT2FjWm1YNGcvWWJDUnd5NzFzNC9I?=
 =?utf-8?B?c05tQ2todmJkMitEdkVibmRGWFdFRVpRSWt6Y3lVWnZzTHRKQkMrWjBoSnVl?=
 =?utf-8?B?VnJvVmlmT2U2RmxjOFdQQjE1dWhEbWdZaGtVMjV2YlR0TDczUjd5T25PNXZi?=
 =?utf-8?B?WWdlWllkTzR2NDVXbkE5MzR5elJodmpCWHdOZjk1TWt0cW5GMTJUTi9tVnFy?=
 =?utf-8?B?eWtyd3NLcFQwcUt0bDRTUHhsbTRmL0xLR0lIZWNSbHg1aWd2UDBmcktxejNS?=
 =?utf-8?B?aUpCa2dSTVBHMnExczF5azAvcDJubFByZnBJMXJQVVV1T05VdFlEb1dNVDUx?=
 =?utf-8?B?VlptdXBieTJBV1RIMWw0eEszVTFVekxLaUJMdWEwRTBZdExIa1dzMXNRcm5z?=
 =?utf-8?B?ZHpCcWdBRUh0VWFqVXRIWmJyaGp0dnhaNGxIQlJ5emNvbEZySEhxdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0ba968-a043-4887-b52e-08dec8b24783
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 18:41:56.3980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFgo5OWH//L/jCCR6twz7aAgicNKXSZ9VhKIE5bwnQk05gkBlLKbYpfZo2bzDMxf9RArzxXyI0tdufzNN7dBpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2841
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64726-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:acourbot@nvidia.com,m:gary@garyguo.net,m:christian.koenig@amd.com,m:driver-core@lists.linux.dev,m:ojeda@kernel.org,m:maarten.lankhorst@linux.intel.com,m:aliceryhl@google.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:rafael@kernel.org,m:tzimmermann@suse.de,m:mripard@kernel.org,m:airlied@gmail.com,m:lossin@kernel.org,m:linaro-mm-sig@lists.linaro.org,m:dakr@kernel.org,m:mkchauras@gmail.com,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:lyude@redhat.com,m:dri-devel@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:lina@asahilina.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,garyguo.net,amd.com,lists.linux.dev,kernel.org,linux.intel.com,google.com,ffwll.ch,vger.kernel.org,linaro.org,suse.de,gmail.com,lists.linaro.org,asahilina.net,collabora.com,linuxfoundation.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04A7567BD0E

On Wed Jun 10, 2026 at 5:21 PM BST, Lyude Paul wrote:
> Just a temporary holdover to make locking/unlocking the dma_resv lock muc=
h
> easier.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> V17:
> * Fix format of commit message title
> V19:
> * Add NotThreadSafe to DmaResvGuard
> V20:
> * s/inline(always)/inline/
>=20
>  rust/kernel/drm/gem/shmem.rs | 39 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)


