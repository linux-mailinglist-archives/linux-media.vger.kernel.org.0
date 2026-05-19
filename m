Return-Path: <linux-media+bounces-62168-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNnQN0qLDGo1iwUAu9opvQ
	(envelope-from <linux-media+bounces-62168-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 18:09:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8945C582012
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 18:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B3685302D2ED
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 16:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A632E974D;
	Tue, 19 May 2026 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="A/apEJ2Q"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010060.outbound.protection.outlook.com [52.101.193.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012162DA756;
	Tue, 19 May 2026 16:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206477; cv=fail; b=TaSw0xt15amIyNTW61X15R1eiHpsTbxJEnUS3YxneK3IOi496FINcW8X0TSkFDRfQy/2cA04cVlpkjC3Uat6DNU6c/CdQzjK0xibUlFYITmPyTYFXx5rAYizbGY3AtwPonVrRNN0cHqX+AvX4JJVCmQ6Uqp7SHqdsT0S+CJG6oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206477; c=relaxed/simple;
	bh=bOneGRO/OZxvgXe7LTpEnGJIAyA+DRxWwEXHD8tRhYs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U1bPL6+uisLcElIRdgcOWlkEnhIc9aw7Rl+7WCc2NqstswWDxlVq0oXV8y7xW5In0VrfVxc3YIO2XMS8PDTeUi5y9znQh6I2+6ZXa2pAc+7EZPS7U7N6WIlF+WExKJybZqVWcuolx9yiyfWefUj5yke6MfBzHkkUUidxfr6LPqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=A/apEJ2Q; arc=fail smtp.client-ip=52.101.193.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iS9S8ia92Ce/udbv2pAgh+YFUkLBoZ8ZmmkM17s5+a4CKx8JfilAj1vDHt3GOD1BdVNWc1BolV3gl6fhN1asXvdz/ttTo28s4CzWLctP5+6SWPd2BdeIvPkGZQV4qkzY69v2UDyuMBL7rnjH/EuXlsPULasU5M/eEL0owxfwsghZvYBFoGMFCaY+qFG+WwPATeieF1+a9umVc87r7/rzTyq8UHmhZygyRHK2LoNAU4ZYECXS79vtZarVeLJif2AUqKSoCxAtBlO/O5TAkdLH5vyv18nFpjT9KIiYvYjkD5v7HdY2oXhnxGSHllR3tGK3N76VC/z0Yfuw3hLKTzbfew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJBAZMonto8kFM+S2DQQvr9Q5kCNnJ/IZCt8qwLLwLk=;
 b=KWNGZSHbM9q7POwxZMn/ZXKf5KUsAWfZUUeCN07XOpLQimyy4FzcKc6cMw2jRVpCgdZzIRP+Mu/V3FiZtnC/gpulFEFRnIhWAjAJYCPEj6aL5hQxFAadFZvjEV+LWHti5Ib10yDBMEVpXJWFVX99lD4xTMD/bR8Bs8qoiOE+PYT5N6EIcVH9NmIOiIW9Ol7DyxiFPNZaSHraFPgPmH1oyRtZNgwRMrIXrHh/EwYJ5P9LqoUP7VysiZmyTCdfqTTpJr4AS5Lu2OCttQ/jy/WxOEUVVIL4L8hQZ7tcncAz4GoplSuiRevM6jOwJieGUdLiRBaU3B1Fja/YQmJqnnUhvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJBAZMonto8kFM+S2DQQvr9Q5kCNnJ/IZCt8qwLLwLk=;
 b=A/apEJ2QkcaqwKAZrGgPbjWS+3p5IlZfubJGRU5gfu0fYXjhpRefPhajPyMML2aEpXG4ETePEVCdKn+mRg9PnYLHM/yZXgukadWzG/8I1UeqYIO665BsTLbSmrTu+J+TpV4+i3EM6cDqrpQqP5YnRldeBBEXywfoD559albXPxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB9529.namprd12.prod.outlook.com (2603:10b6:208:592::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Tue, 19 May
 2026 16:01:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 16:01:04 +0000
Message-ID: <dff60378-4e47-4753-8878-feec6e1c2690@amd.com>
Date: Tue, 19 May 2026 18:00:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: Julian Orth <ju.orth@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com>
 <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
 <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com>
 <CAHijbEWqc2+kSkk3i_LxB2PQ6XwUetw1UkdUdXJfdv3zgKd1kA@mail.gmail.com>
 <38551bfe-75e1-4978-b57d-adc43cebc85e@amd.com>
 <CAHijbEWHp960qvZFoK7+9ppHAqkAR7=UQhtMUccqWzGd_pFPQA@mail.gmail.com>
 <5ee6d5af-ac48-41d7-a19f-e08a3c5b7d19@amd.com>
 <CAFZQkGwmeipZnvmBkcE7KhvUSMkSE=fzLBZtiMyhv3mM04Vudg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAFZQkGwmeipZnvmBkcE7KhvUSMkSE=fzLBZtiMyhv3mM04Vudg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB9529:EE_
X-MS-Office365-Filtering-Correlation-Id: 237c7ba7-b248-4dc6-7eba-08deb5bfd437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|22082099003|56012099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ZOAjKR5rYMflddddzYJ9bdsebehaBLqcfOYfkzxzarKJ5yr8ppEH7cuMfY9PHMEeyigrzdatr3Pfin1jxDpbyO8rgUGU8OT1crCB8MF9EDm5S/dRwdRnTTebxUrjykrhL34gTk6JXpK8+teCEFVHPx3ECFp7Rdkllnfcfd740+SMMI6WyhKVbKY/6IZzi7WfCVVaigM5VPYzpeNqLFB5C2VKr668NJltH2rtivl2uZbNIDpPdo4BRTqGifF1ZOFk2uRWyHdfdY6Oru5mIVhldy+jY7dG7+pS+yFTu1wI1SvjRhbyQPx5DMxPE5ZbeqZJv8onsAWC9FeZMotU1hTC+B/K69vZtpPYABVs0rPMwOasJLKTXYDNrhdY5JsTGgbTQswdJhGbLvyKadEbeP2c0cBuhoEhFq2EZ0xiap65tEcWArYQhZi2hYPNMM/jXDEJbmADRwiSEfsPzE7yxDgZO+5h6O6azpdNSdsF5GOK0TTNkrobojr0uZ3jGx06dKA62Mdt15fxYDwlMFELtsJaW7Y5b6GxStV514qGbM+4McMPGexcmZ9aRToqkDlLbQjQLtgI48K/9srTSbMpB4AqZddEuzDh+r2RfSJfhNpv41xlIjbU9Yp/ZMFKQEIJmcfgT5UC6Qq/8MO8AUZyID1OU+30fAlaFWnRVIT6g7E4gx+g2GZC5PzcTjLlWKk8pI62
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(22082099003)(56012099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QldpbGMzVk1tMTJCQkxseGdneE5sb1dHNVlWem9ZTk92Wk9IaXdhL2p5a2ox?=
 =?utf-8?B?T293d0ZYZVpQNTFIdDhlQndlMzNYZHNZcnhXeHhBSFpUZkMrRG53Qk1Hd1Vm?=
 =?utf-8?B?ZG8rS3N0TGVsTXcyVVpXUm9KeWhjRWE5ajBLT2ZWQUl4OFZGVG1nSWx5WE9G?=
 =?utf-8?B?ak4wcDJuUFBzNmhITUszS01jWEZZTDl6SWZVcVg2Y0laTnhka2NrQ0JEd1Fh?=
 =?utf-8?B?dGNwVGxxdk94YVQra3p2SUZLeW5YV252WHREc0NDU2RsREJVaWZGSzBicVJz?=
 =?utf-8?B?cm5KaWkxUEhYQ2c2NHRIN1Eyb3hsQXhsTHo2blFzeVBLc1BaOXBlMEhtcmV4?=
 =?utf-8?B?b3p4Ym9SY1JJK3JDYURSYzY2ZkFIeDF4akZ5ekhXN1dQV20xN2M5VFBnZW9Q?=
 =?utf-8?B?TitzOEIydFg3OWN2dFFSeE11QzJBU0dQYlJtNHFQZ3hNbDFMTlhqdUhOMkRt?=
 =?utf-8?B?TmFvRG5KMnk5V1pBU3VWdkRCdlM2RUtHM0RRcWs4a3hxWlpjUEpUSnZ2TC9t?=
 =?utf-8?B?bHkzZHJxM1E3N1BkNzNWdlA2bzRweW4rdTFmemhnZ0NuOWh6Ymk5WXBiSUph?=
 =?utf-8?B?ZE13Ukk0Q0g2UUxyaHVzTUtGSW1zUG9hUG1BVGR3MS8weTlwOHhSZG5tZE9Z?=
 =?utf-8?B?ZEV4M2V4NzdTOFdFSVRWZENqRDNicm8zWnFrcDhmRUxuSThuUmhrdzQ3a1hh?=
 =?utf-8?B?NDJmd25vaWg1c3ZSTit2Vmc3REwzSkIrK0JpSS9jV2Z1dm1TOWNpTERWbldG?=
 =?utf-8?B?WGpkNmFIV21kRjVGYVdGcjJUVmxNbWlDK3ZvOFZGK2NDeWlVN2hONFhVTG1X?=
 =?utf-8?B?Mm13TG9QWEo4UE4zbWVjalRLUXR6akkweG9OMWZralBOL1lKclRyamkxOW1q?=
 =?utf-8?B?aFhHMHVZRlAwYWM0SnpoZnMzZVY0Y1NFa0xIcGU1MTNKOUoxb0RTTDZZRVVn?=
 =?utf-8?B?Yk9zWFJiNmRMamFrY2FxZitjTWVSOXBFTWZ2Y2pBZ2pTaTJXWmUrTjJCZ1pp?=
 =?utf-8?B?NERQNjNpdG9TKzk4Z3pXZmRkUlM1OWVaUEp6R1lYNXoyVVRKUEJjSkl4TzIy?=
 =?utf-8?B?bUdzelh5RXcxTm04TWU1T3NiNTFoNEQ3NWZRUlFnc0hKM3g3ekpiYytzZE16?=
 =?utf-8?B?YWl0R09BbDMvdlJXaFZBKzFRZXJoVkswNlpNOTY1dnB0NzBDTllPWkhoQTl6?=
 =?utf-8?B?WEtCQTRPdEZIY29sQTBlYTJqZlpmbUZVcVN4MFdFZ2NCMGZoR29aVThxY1lS?=
 =?utf-8?B?Tm9TQmhRMGZJa1gvNG9RSzJBVWxCcUpMLzhPOWxrWHoxeEo5M3RtWjZlei9y?=
 =?utf-8?B?R2E0WDJlVXNOOTZXMi9hcHIvMXkxZWJVbUxPWjhjYlBCWmZlL1lYb2JpaTZo?=
 =?utf-8?B?NXRxTDRtRFhuNUdpbERRb2E3Q1d1RFB4TCtlOXZWWG9SaXJ0c2VmalZRSm1K?=
 =?utf-8?B?UUlFSE54V29hbU9qOS9sQWFQbWpCK09rWXVFQUVLUWpKeUtSSzhudWtSWkcv?=
 =?utf-8?B?NENtajBhaGNJQkR5RVRyZEJaTEgxNXNORmZrbkM0d1FyTlZtaldKZHNselJn?=
 =?utf-8?B?K1ZsRXV3amdGbys4UjIzZHZGUzN5UklDelZzbjkwUnRhdzA3YkE1MkRaeStn?=
 =?utf-8?B?KzBqSjJLMnNMUWZOTmpSVzR5blptR1V0QW90dFNmNDdLTnQ1Qm9LSzcxcGMy?=
 =?utf-8?B?TFVKTVYvckJpbU5kS3dPVGViZXF0azRjWUdBeEdxTWkzTVhoRGxUY0FPTzlS?=
 =?utf-8?B?SEZ5VVcycXI1OHc3NXpQU1o3TEF0MnJoUWxmdjJ2R1JoalZWYWdaSE5mYjN6?=
 =?utf-8?B?dVI4Uk8wcUwreWVnZktuVDN3aVJwSzU1NHN2UDhUM2hyVldNTFZpa0lqNll6?=
 =?utf-8?B?alN5b3ZwMDd2ZXIvQ3h0YzVHMVk4RVhMUzdPUXAxcmRvcjQ0K3IwUlVBY1o5?=
 =?utf-8?B?bHhrNmMwSWhabU1sUlFldjl1QU96Y0dzUFhSOVhGRVpiNnp0cWkwMm9SYzA4?=
 =?utf-8?B?SE5SK2Y3cnRGYm1qbWRJZ3BvS3lZTUtaSkJnMnpQYWJEczVmbzhWN2xaT2J5?=
 =?utf-8?B?bkhGT1ZxOTMzM1FBWG9XbCtHUlY5VHN1cjVqZ3BMTlk4QksxTUM2dmFiYW1L?=
 =?utf-8?B?aWRDSmJ3WGREUTlBWlNWUExuRm5aMWhUcGZTeUVvYmpHQU9xNlkxa3REUEsr?=
 =?utf-8?B?dHpFRitKRlgySHFsM25ka0tvSEw3YkpXcFhhZTJra3E3SjNHTU1GZElhMHdq?=
 =?utf-8?B?eHlYR1BZSHpZbDNidU5HWGVzZVc2UVRFNGFKL3hPZ0hQOXl1dDVkY1plcm8v?=
 =?utf-8?Q?Z/YG7ESBqYwUe3wcc4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 237c7ba7-b248-4dc6-7eba-08deb5bfd437
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 16:01:04.2813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MCQR0oYk7unyi/NOgZJRZlkqp62PzzOK39PJzrB7+4w0ZR+bvVqN7bw9lIpGu8A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9529
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62168-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,lwn.net,linuxfoundation.org,arndb.de,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,mailbox.org];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8945C582012
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 17:31, Xaver Hugl wrote:
> Am Di., 19. Mai 2026 um 15:29 Uhr schrieb Christian König
> <christian.koenig@amd.com>:
>>> 1. This series makes the ability to manipulate syncobjs available
>>> independently of attached hardware.
>>> 2. It makes it available under a consistent path /dev/syncobj.
>>
>> Exactly that is a big no-go. This has to be under /dev/dri.
> FWIW udmabuf is also under /dev directly, but I don't think any
> compositor developer would complain about a different path.
> What are the rules for that? Could this simply be put in /dev/dri/syncobj?

The syncobj are actually the DRM specific way of doing things. The general kernel wide way is to use sync files (see drivers/dma-buf/sync_file.c).

But there has already been tons of problems with those sync files. E.g. they doesn't support your use case at all since they don't have wait before submit behavior.

So there are already ways to do this, but the Linux kernel so far told everybody that this is forbidden. The DRM syncobj wait before signal functionality is much better, but then basically the second try to do this.

> The part where we get this independent of attached hardware is quite
> important for us though, since we can't just ignore explicit sync once
> the device we previously imported the syncobj into is disconnected.

Can you elaborate more on this?

> Buffers can be from any device or allocated in system memory and
> access should be synchronized properly in all cases.
> 
> How exactly it's made available isn't all that critical.
> 
>>> 3. It removes the need to translate between syncobjs fds and handles.
>>
>> That's a pretty big no-go as well. The differentiation between FDs and handles is completely intentional.
> Could you expand on why it's needed? For compositors, the handle is
> just an intermediary thing when translating between file descriptors.

Well what we could do is to add an IOCTL to directly attach an syncobj file descriptor to an eventfd.

> FTR for me at least, this part would be merely nice to have, since it
> slightly reduces the amount of ioctls a compositor needs to call, but
> it's not important.
> 
>>>> What about using VGEM for this?
>>>
>>> If the vgem render node were made available unconditionally under,
>>
>> Software rendering is a complete corner case, I don't think that this will be enabled by default.
> That simply makes vgem unsuitable for solving the problems we face in
> compositors.

Thinking more about it vgem also has the same issues as sync file mentioned above. So that is really also not doable.

Maybe Simona or David have another idea.

Regards,
Christian.

> 
> - Xaver


