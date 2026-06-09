Return-Path: <linux-media+bounces-64292-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2e8IIpXyJ2qF6AIAu9opvQ
	(envelope-from <linux-media+bounces-64292-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 13:01:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F087F65F38E
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 13:01:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="q/oWqugt";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64292-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64292-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05A71317ADA7
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 10:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27EE3FAE00;
	Tue,  9 Jun 2026 10:54:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013033.outbound.protection.outlook.com [40.107.201.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F19A3FADED;
	Tue,  9 Jun 2026 10:54:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002444; cv=fail; b=m2dWfV6jF2nwUS1XpMTjpiW55yg8H5QeGqMELpC+0Sb67HQE4QqLcDo3rUwa8eNRh32SX4Qr7aLa79SJkrwqvAp9Sekb6ylFCP365y0Mr6Pxes8NVRFNj3yFBAQk8U9vdSSK0CekMQxWbCFeeq8v5h7MhcoQZXFn6osk5LKvHKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002444; c=relaxed/simple;
	bh=9c8BP74mrLmuWrEVpmUeAnvzu0FaMNJADGiATilP/7c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KpdI46Z8fHU98Jx7B0s3QRzdTjXTOu9LV3vw2wV99RL52xLIekxV/X2VlnEs9cdgzcd9nhYobW8vuq7P4WIkyAEgVeUe+lSHyx+3REj92G8EC2gWtVrZQFghDmFJ2pM7/9a1RrPTPq9mBTZUMIsOT+CjlFvpDXHjHGlLZrs778Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q/oWqugt; arc=fail smtp.client-ip=40.107.201.33
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gARJJqx5R3fci53P/4LJmT21rE3dfDO5Rc8lismWOyU7mq/2cWm9r+FOiW2iSULrwTbIxXSPe3F8QBEpduXiTUHc63Ef5r2Jumu8wQPQOWRSlubf+SJ45gq5vZwMPfs0MmKHGc8aTWwJe74PdiPyWuls0NrsdtLAeiqBKubqeAo4hAKZMJX/mqXjxwgrWFCt4XJeFxxbMIQTAkMoVHcHG7ySNr4TWyuYPr4gJ6S3EDzScsbJvkBnkTZAVQDKjrZ7PWJzy0RWoxipqdP2kGD0G2LCP1BJ9IEYDQ50qzS2aUdtj1IQzFo2DB/NSTCPvjGBdAIP4UwVbLDk4R48NT/NsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZBPAxLXefDlMlbobriMFU0V+abEItqwn6kuAYAfHJY=;
 b=KcQnWvsHrzwWqbyIussZ9Eo1zbfnypMgelOkfBoTPmHJgj0Ym5VoC9AYnTFfmARa0cOIFZFVPAZOpLa8Akgl/E8peaQ/IdTYPDKNimLmoGn+zH0TWdJO4VFb0rpeGkj4sH8dzIDvY+6sz6Plb26btN0g7uRVNN3ZYV/2Mmuisrg52hG39iGg43wGd8tcY4lswA4kQW5cJNf1LbzFM6u7ycuN9x1WpHwmtHMkdyeQun3zZhK/xeW+QodQlCXDhA14NfW3RyqHD8XMF5Jtr43yQhRpRfXl8bIMCe13r4bQRLZgpAUx3gIPzn0JsOFfNUqcJh0OQUMUpCTgEf8F4QGu9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZBPAxLXefDlMlbobriMFU0V+abEItqwn6kuAYAfHJY=;
 b=q/oWqugtgZWfzddP8fWJFuUvfzBw0ZukglpO1awK5+VsIkddNHNKpMnYOzJkudRIYQ8gA4dEQXB74Hdc6YMh88Y8eBiMHi5DTsQWK0wMsDdlnhYwKldhcT0KNse6qq4c6sROVGc0/pkl2r7Pa8+q+DdDoqGWfXNLK7NzLCLq04o=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8718.namprd12.prod.outlook.com (2603:10b6:a03:540::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 10:53:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 10:53:57 +0000
Message-ID: <1bb5efeb-a5d3-4d0b-ae69-8dc8620604d4@amd.com>
Date: Tue, 9 Jun 2026 12:53:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
To: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <dwlsalmeida@gmail.com>,
 Gary Guo <gary@garyguo.net>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260608142436.265820-2-phasta@kernel.org>
 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
 <DJ3VYD71HDQ2.3C8GG983Z2YCM@kernel.org>
 <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
 <74bd33a06b75c291c3e2eda19e0250fbd280c49b.camel@mailbox.org>
 <66349a9f-d9dd-498b-b118-1c79d3aa3cca@amd.com>
 <11d7c83185a18d13760b6e77275e97c110dcddcc.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <11d7c83185a18d13760b6e77275e97c110dcddcc.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:91::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: 78cc45c3-9c54-434d-51be-08dec61567aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rqyPXuCWpdPY8+GCZq9Gh/u0gPL50xwd5mWdPlEWc5mFzq2+Q4h8cbXSykbciir9s0MUpLzhKli87CSvm7ZtXusavxaTjn57b29HbPBLmDGNpON0UCjXDbucZkjOvZBaJu7RfT2/a+w1B48f1dd5MgUvci0udCxjk8Pukppxwx0VIkcuIRLYBoVTWxEA5rHekqZMKzuNNzpvt21i1T9n+hub4GRQjVZW7WZike16S4bbLMBlBq9vTvoxGpHF7GiA82/egijPS2HHH1ZeD5zfw5BMnGtziwqsjrb5ydLhFCkggWu1YIdumUKxTbrW/TFFxbIF2kKQVmw+i+kcGZot1DYRTDxn5xh84ySK7NAJoYUvUwWUZSq4ho7aqIqZuKsA+GOPHAMyU1XXKRYll1BkLeeMps9eVIofC0gUgckx5qrSEWzRug4Wzsm4v+awo6CFTDkzwH3xRaIh98AyfQMrFBPYwK+uqhSdjsxtLDNlbsGOd10z7za8vSu0VoqeBoMD/UEoGH6olcqTVRnUAmWj0l0aSSYbx8OZSvd4A/Pw7f+CgnXTV+kf9dd7ISq1vWJQcugIW9uQIrnuAqfKAvhW0P+fqCbKLHTni8v55GP8a06QHY5Nn13bFPfoOsC3jWFTyxPz6+VNXqtxWUUf4cDA7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGdqU2NORTJOTjBTdTNVbjFPMFh1R0JrODRTQnQ1ZGVKbytMN3UyNUdjWFdz?=
 =?utf-8?B?akJzdTUwTzNDVThtV2c4TlRTWU5YU2xuMzR5eFh0WWx1S3pDdVBCOCtWRWZM?=
 =?utf-8?B?bjB6WXUzMFJoTHpVK2NDM09MREhRQUcraWw4d1BtQ3JmRmVLdFZOaFd1N0Nz?=
 =?utf-8?B?R0N5Q0ZOMzBjblR2UGJLcDZiZXpxeW1xU0xneDQ3SG85TlZ3d1RNMHBJSlpy?=
 =?utf-8?B?TUIwM081QzBWeGwrY0VmbW94ejVGU0lkeVFmcU9UUFI0VGpGLzQ2ZEJwTkNm?=
 =?utf-8?B?UHdnOXFVeDZ4aGpoZkJ6T2thSU5JK093MEFoaXdpTjdRZ29vdHZ5Z1FWY0tm?=
 =?utf-8?B?aFJsWkI2cGFxUU0xeElhbXVSZjVuVDJIeUFrNFlYaEtKMGVvdnZ5VE5RRFRo?=
 =?utf-8?B?R1kxbGhWMjBDRmZGK2gwVGFGSkF2ZkxTYVBOMzJKVTFSRGRZZVRPKy80ZTEr?=
 =?utf-8?B?QldrOFJ3U2tXeTdEZ3lkN2VvRG5xUUg5ZUEveFJSdi9jdkwyQ01lVjRNaHky?=
 =?utf-8?B?YWd1cFEyMnd2RW9DdFhSZW9pcTkzRFBLWE5zUXdXajA0dVcwL1pjL3N1OXVY?=
 =?utf-8?B?TWgwWEQzM0NKRlpEbVNaVk50MW1ORjFmZVV6cDNjU3A0MnpaaDhEVldoMWxW?=
 =?utf-8?B?NXdIejloQnpCSlQyZGpXaHZBT3QvWnVBclRmcVhrb1JCMzV1a01GRW5XUXh5?=
 =?utf-8?B?N1pzeXRCUE5sdzdWZlRUOTBaNWR2cmJiT0x4OFU3bVBPSm1panJmNmNKVGJw?=
 =?utf-8?B?eDhKT1FxSjZnS29YRUlIOWdLeXhaN1hOWTVCVi9hek42dGVEZnhPYmVlWFlM?=
 =?utf-8?B?ZXBIVmN2ZkpsTytLV0NLSkJpdFR0MW1pTVVSOFVueG5VYUxyeGhtemZpaDJH?=
 =?utf-8?B?VmtLN2o0NUJVUy9Lb1UrSEI3YzZyQlppQklxNlY1OWZ6NEU0WXJSNFVNUTBB?=
 =?utf-8?B?eGdXQTBkM0lqRWtna2Q2Q1JDZmxsWDZzTit5OVJxRTJOVDJtNGNWVjdoaXRW?=
 =?utf-8?B?ZkZqMHVVbDlTQlpKZ083OWVPNWM1VFdVU2tHZURqRWtqMVdhN2xKNEU1NGRs?=
 =?utf-8?B?WGdQZVNUQThpRTU1K2xFUFZVSHkySWJzRjM5UkZ1SjMwNThjR0w3ZEh0aFAy?=
 =?utf-8?B?dktQdWxqVGJRRjlVQ3BtWDJDNFA3Rk5mTnZ6L0cvNzFxKzN2UEJXbVRPWGJN?=
 =?utf-8?B?ZzVGTjdmYWRXZHI1MlI3WnNXOHBpMTdVMTAzYytuRis5NEhBWHBKRWdSL00z?=
 =?utf-8?B?Y3d6V3pyTFFCVjZYYkY1NXdyV3lRUGh3ZmNXUHNPWkFDa2NHOTcycXRnbWk1?=
 =?utf-8?B?d2N5OFI0bFlFTVdCdTFpUVNONEk2M2dsUmQ5Y1F4TlNmdW5pVGM1bUxMSVNN?=
 =?utf-8?B?NUdQTzNEYXhBQXVFa2YwWE1MeFBwRzlqbjBPaldvNVI0dFVCZTlJY1JzRnk5?=
 =?utf-8?B?VHFlQzdiNEoyQkVwMmFTNzRLY1lyR0c1NjhJUGFYSDQxWC9aNDJnVVFEeVNU?=
 =?utf-8?B?bElVRjBJRVFVdFo1YjJES3gzYUxkdUVuMVczK3Q5UWpFRHB5Y1ZQWUVZbUwr?=
 =?utf-8?B?QWVEY3hCdUpRdnJpaEhSZjY0Z3ZGZ1JhbS9EVEZ6dXFWNjk1R0xOUDlGZjQx?=
 =?utf-8?B?UDMyWmJ5b2x0WU5CVDFJRCtlV1NNZU9tOHdlUE9ZWGpJdytSZmc2ZUoxbDBB?=
 =?utf-8?B?Ty9wbmk5MHo2ZEVoSWNFMTU2MjY5WEMyWndLWWhMN3RWejhIelFNQmJCVC92?=
 =?utf-8?B?K3pFaHFrSGtzRnlsZ3FTNXN4bEJ3NVRsMDNROForMDdlQS9lbkFMZHU2a0No?=
 =?utf-8?B?QVFzOFc5NDAzeGN4V3hLT2F6SGU1Q0RBM0dkeVhJRzFsQUhObGlvcmpDRGVk?=
 =?utf-8?B?cnV2aFViRUJnUEtJU2RqVE9IRWJtMEJMcHhFbXFtTC90R2wzbjdoMU80S1g3?=
 =?utf-8?B?UHR6V0M2WGFHVnhKUUMzMzAxMk1XTEkxNVV5ZUdCd1lvRWN2NTBLTHZyQVNM?=
 =?utf-8?B?dXRDZ3hRUEl2RmNYMytGNUdrMzFTa1FMNGU5VzVOZGw0d1hiVkpETVNHelZ1?=
 =?utf-8?B?OW1LUmFvaTl5K1VQeTk0MGJQVUQrSWRQNDQyZTNxazFHMlBXVHRrMGt1dmdu?=
 =?utf-8?B?VnZTWGovc3VZclNDanhiQlUxZ0dXL1IwdFlZNE4zUEJabWRzUVQ5WFFlZGJ6?=
 =?utf-8?B?M0NDY1ZMeWY0a05KOWNmKzRkKzZ1Yy91MzRScERJbzRzY0JJeE9nTkVGNlpn?=
 =?utf-8?B?NGd5T1RpT0g2TXRzZExLY1lTWXZmWWtUaXJhRExNcEZQRUVPMVNpUU13Smtp?=
 =?utf-8?Q?A8G8Ao5VwrXambQSsu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78cc45c3-9c54-434d-51be-08dec61567aa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 10:53:57.0614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIMsw1/gbOjXr4drKMUVOUeIpnwvxfXhRLQc+FovP47sfBjkIPH9c8vJw0a5qVuG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8718
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64292-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:dkim,amd.com:mid,amd.com:from_mime,bootlin.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F087F65F38E

On 6/9/26 12:42, Philipp Stanner wrote:
> On Tue, 2026-06-09 at 12:26 +0200, Christian König wrote:
>> On 6/9/26 07:52, Philipp Stanner wrote:
>> ...
>>>>
>>>> In detail calling the callbacks without holding locks allows all implementations who need it to explicitly take locks in the order they want.
>>>
>>> Didn't you say a few mails above that the implementation should not use
>>> the fence lock for its own purposes?
>>
>> The usual use case the drivers have is this here:
>>
>> dma_fence_lock_irqsave(fence, flags);
>> was_signaled = dma_fence_test_signaled(fence);
>> if (!was_signaled)
>> 	dma_fence_signal(fence);
>> dma_fence_unlock_irqrestore(fence, flags);
>>
>> if (!was_signaled)
> 
> If cleanup() touches fence data, this is now exactly the race that I am
> concerned with.
> 
> With the current design, you'd actually need a synchronize_rcu() here,
> which you definitely do not want in a hot path :(
> 
>> 	cleanup();
>>
>> This is actually what you and me came up with for the KFD when we
>> removed the return code for dma_fence_signal().
> 
> Well, what we came up with for that rare case was
> 
> was_signaled = dma_fence_check_and_signal(fence);
> if (!was_signaled)
> 	cleanup();
> 
> It seems that many of the other use cases where the fence lock is taken
> by drivers ultimately are rooted in the (IMO) design mistake that
> dma_fence_set_error() exists.
> 
> There should just be
> 
> void
> dma_fence_signal(struct dma_fence *f, int err);
> 
> which also conveniently forces all signalers to really carefully think
> about whether the fence's associated operations succeeded. Correctly
> representing the "true fence error state" to all consumers is vital for
> sane system behavior, as you continuously have to point out.

Yeah that came to my mind before as well.

>>
>> Taking the lock around the enable_signaling() callback has the exact
>> same reason, preventing the fence from signaling between testing and
>> calling dma_fence_signal(). The problem with that approach is that
>> cleanup() now suddenly runs under the fence lock as well.
> 
> That problem does not exist if we re-design dma_fence like that:
> 
> // driver
> dma_fence_signal(f); // revokes all accesses to our driver through backend_ops
> // synchronize_rcu() now unnecessary \o/
> cleanup(f); // We know that all accessors are gone
> dma_fence_put(f);

Yeah and exactly that doesn't work.

Just think about the Nouveau case when you have your fences on a double linked list.

When the fence lock is independent, e.g. have a separate lock for each fence then this lock can't protect this double linked list.

So your cleanup path needs to take a lock which protects the list, but you then run into lock inversion.

>>
>> So you are left with few options: Either the fence lock is external,
>> which we don't want because that make the fence non-independent, or
>> cleanup() defers work to irq_work or work_structs, which creates
>> numerous lifetime issues.
> 
> Yup, this is uncool and we want to avoid that.
> 
> But these seem to be the options
> 
> 1. Ensure proper synchronization
> 2. Wait for a grace period in a hot path
> 3. Defer cleanup() with some delay mechanism
> 
> #1 is by far the cleanest approach. I still cannot see any downside,
> and quite a few upsides.
> 
> https://elixir.bootlin.com/linux/v7.1-rc6/source/drivers/dma-buf/dma-fence.c#L1025
> 
> ^ is already racing with the signaled check.

Yeah so what? That is just an opportunistic check. 

> I'm going through the users right now, and it seems all we need to
> ensure to implement this change is to audit all ops->signaled() for
> usage of the fence_lock and see if we can port them.
> 
>>
>> When enable_signaling would be independent of the fence lock we could
>> avoid all of this and just use a normal spin_lock() for the cleanup.
> 
> How's that related to our problem?

See the explanation above for the Nouveau example.

As far as I can see the approach you want to implement here is a NO-GO from my side.

Regards,
Christian.

> 
> P.


