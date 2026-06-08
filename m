Return-Path: <linux-media+bounces-64145-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +BeqC9x2Jmp3WwIAu9opvQ
	(envelope-from <linux-media+bounces-64145-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 10:01:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09470653C5E
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 10:01:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=XQa1odak;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64145-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64145-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21E173073FBF
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 07:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC88E3988F8;
	Mon,  8 Jun 2026 07:55:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010028.outbound.protection.outlook.com [52.101.56.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4C238F945;
	Mon,  8 Jun 2026 07:55:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905319; cv=fail; b=bFKyWyyDk460ZUGT8JHmJ/mcRtmVUFSGOqvbUYHvN05dNKJxtK+I0EZ2uR+YBwdcnkJKxvvDHdvPF4bZHc3W77OO3s1ZdIr1iza8tljHhvmv2jlmbCQnNR7rGpPAc3cvO+SbwkH1Ojfsb/oks2fkVb9eo58Eel20yiZ9kGa7cKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905319; c=relaxed/simple;
	bh=EGi4zX0oXmX0gMtbzaD+n5JcnGnydqShNCS+aTDfkHY=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=StiXLtFysjwzQehDNsT4nbfnRyBXa5qiqpFgB1oWvuLHj9grxjWRFXlhSPp06+IOIZDPVdVnUUjnR2hEkVHk6H0VvoAInZshcZ//vh+4cpGmyf2sJOt/zAvIxqTMwJq2H6TJgMltW+PzMuLvrKlqG9vKXsZ/R3kY44wc5wPT93w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XQa1odak; arc=fail smtp.client-ip=52.101.56.28
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zV7SQVQz0U7HeRZAnIpEo37FYnYwXjuz1ZiYI9M161R5wrutdxCppmMMxiHsXSLOiyBrKUY84cfKJilOuh0gX2W/wi7SwhUEou9u7TL/WeTIWfkpCODxSsGs3SZqv9yCOfel/gs0G4ceYgrxsfHuO+3dwPquLHpTlzrb8ToR08VhSyOCpqGxa4HMwl2S3Y+CgCDgSYeg0iEpCUFn/qXwU/aYNi2fzRI+kP3zhhJhFdpP9XcrLH528HzdFW2BKpTcqfA3xMnIVVWaZDQHnAr1RQuEZMv74+aY8NPpnxH4KWzhifNK30slnbMdcHFBH/s1bzWUjOKTFX49oepUaXLung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhX3Y6Dt/Kt6vrkTBfT1yHX8RoFTmS6z+Dz45sG24kE=;
 b=vp/hmTduJLEGgv2Y8p8rC2/zGXRQ0E/QmPufd4KXQb62seBA0h6X5dyBUYc89O7/mFTPd8Um7cCmGX76ev11ZHWQZcFM08HmLoKp1epputGLYhXUWYSl/IQBDXWFhJivbQg9PSsuqhdBkabO3G4Hl2K3hypSQ12cQa2WjfQZB/jD/WIhZxXWEGATORIdwglGZOOdihwB4w0Vziv8XvoOKuncOme+cbw3xqCrkpzIRdrw0NXE1G4xZu8GsUJKorEqY7vjbOR85zN3kNIqCnoyT88qF8BlxDQ8G8RtOO3o7A0DJp2iVALcT7YbDl4FHIR687KeFaYdX1NTty77n+c3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhX3Y6Dt/Kt6vrkTBfT1yHX8RoFTmS6z+Dz45sG24kE=;
 b=XQa1odakfpeaHMCIbILvaEqkzfnwfP3FOatuQW9uC/pXP6t8eZmXM1FnlpJ4yN7fEQDCQzqMgnV8YbiuBadjKQfrRWTu5BfCpTCmdqZSA8vkTAOg345+so2QPYrpUgwX5oWoB1OKzHqhiXKPNp/65rwXZ1tzTnqHuHH9ZYTVHxi/UFStD6kbTlZt0/doidp0ehqxrtLgRwUTYTbnMhAcq/NDPN+jtavUJNLnV+nRaro5m/8ZQr2LvqxBuAK1A1iahtcb/CgeTeq5q4mltigKzoPCHPVkqA0MDQ9Yg9Xf4EEbTV7CtKhl0hzilotLDXEKhc+uxJR6CpciqWM9HVhAOA==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4214.namprd12.prod.outlook.com (2603:10b6:610:aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 07:55:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 07:55:11 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 16:55:07 +0900
Message-Id: <DJ3I8RJ6EGIY.3LB3JDDN6XGP1@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Lyude Paul" <lyude@redhat.com>
Cc: <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <driver-core@lists.linux.dev>, "Miguel Ojeda" <ojeda@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 <linux-media@vger.kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Maxime Ripard"
 <mripard@kernel.org>, "David Airlie" <airlied@gmail.com>, "Benno Lossin"
 <lossin@kernel.org>, <linaro-mm-sig@lists.linaro.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Mukesh Kumar Chaurasiya" <mkchauras@gmail.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v18 1/4] rust: drm: gem: shmem: Add DmaResvGuard helper
Content-Transfer-Encoding: quoted-printable
References: <20260604192740.659240-1-lyude@redhat.com>
 <20260604192740.659240-2-lyude@redhat.com>
In-Reply-To: <20260604192740.659240-2-lyude@redhat.com>
X-ClientProxiedBy: TY4P286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4214:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e4667c-d446-4403-c0b9-08dec53343f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	vFOBrfSnTMTdUdRdCNjxCT2RPJp2w03PE3Q7tsH0A68+W4BsfmWBuDJx08u+NJqqvwr0e+ZpaRwl2A4SeGPPT627bR5PVNdjn+LgzL8iLsy+QJbNFO7NyZdX2tDJ3aYaY0o8f0WXF8T8CyNDwRzXi3mfT+s3J2RsWN5/KwBGaLRdxYc0rdfLde+xS0po1yCgd8iZoY0X5KX3DyNqpUUJeXYzI63zectF2uoxvXLk9vxHHU7Jy6HljQTPWemLUCrVf59bq+EnUvP4c6GJUjPyvTFYAMglrCVVtMMP4GAXwF0ZNSQtg40nSFwoqMiUY2FIqsEcUxXrsntXiddVJcx5m3fumFZCbLHeHKNL0354zHwVe/bvB6EFPQJFoa9RB+KDm7zb7H9aDCNCg4fpgQn1Z5rpgcwsYWkPt6wrpxIUGqr3WG7NVRsrcYcv8pb20SGtkX58AvGQZJxZF+1Bh+UQYWD8Vop/9vVr23NZ8424xGjJOAUi+OX6SpAcjVYdAkEiliTB5mOzNbw68v/YGA4ooSckUh7jkG8C8PJEoJ6F8o6tXKJapUletPjRUlG8zZvThq9spd6PpSdx/EnV7rU/v3jDY36F5cK7twYmJJkqwB4W2oh60TLMJH3lhyboerJJXf8jqVb7EwjYHeOAXDtpc2CFNYVakuWg5A4M3B+YyHdbAxwFV5Koh1gBxbRaGGoY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUJHK1B2K3NSbGhCWGFWTDBRS1lYWlc0NXIwOENlS2dua2FsZFhZb3NqYktY?=
 =?utf-8?B?U2Y2T1NtZmFDcnN0UkVkMDlTTU53V0lzM2VGdytZNGE2YU44dFFEMC9KNEJH?=
 =?utf-8?B?TmxQQ29MOVRsdytJZXpnZ0YzME1JVXZUVm9zZlVuU2FBQUFwMEtlYnJMdG5I?=
 =?utf-8?B?Smk1TTdvL2VJbmlHaldtcldpTWZNMHZSZXNpSG9HTjNseE9KbWI0NmVwblJW?=
 =?utf-8?B?MU8xYzhhTVoveEJlQmJJR0xzT0RVWkI3OTI2UDV2dENEbGxDQUNHUFZSa0ta?=
 =?utf-8?B?bkU2bEkwendXWFM1ODRUTzZ0YWlKK1d5VVlSWFlYZUw5TCtiOXNLdzlyTHZL?=
 =?utf-8?B?M3I1WVlDZWg4L1VjWHNoOEYrem1KZmZLblhSWVFmUWRzV3Qyd253VHl6a1NF?=
 =?utf-8?B?QmFGM2dWcVNmaGxaYTVNY0ZJRFJISVNpcXA2L0NtUnFYUVhNakpmQStESjY0?=
 =?utf-8?B?Z3VSYWV6MEowRjV6MWRpU0FVY0k0Yytxc1VpZ3ZjY0ZnOURRN2ErdEtTbGNO?=
 =?utf-8?B?OS9VY2ZXZGlNSzNxYTZwTE42TmR6c1h2b2lNdWFxTTRLWnd0cWtCbHZ0amtD?=
 =?utf-8?B?SC9zc054UVArRjNVZ0pnVlo5ZmNUNk5JczVWSG5WUTBhU1ZRaGM1cnMyRWlW?=
 =?utf-8?B?ZUhvOEZnNzJkaXBqU3JVbzVOc2tGZWJkT1hwVktva1hFOHorcjZUcXVscGZz?=
 =?utf-8?B?Q3dwajdjbGoyMzZPemMzY1g1Rm9SdVlwTWJ0WFdrUmdEdTFLNENBbnRpeld6?=
 =?utf-8?B?YTE5eFhUc1lWcXFXbGQrc2hCZndVVXE1YzdjWUVzSlBsOFpqT3JuRmFzdXpy?=
 =?utf-8?B?ZXR6QTIxci83SzJaSm4rOFp1TDA4WGI0MzFOdXF0V1k4aENNelYxY2dzSXp2?=
 =?utf-8?B?T3JpTWQ5R3BSMGVjYjM2M0JRbFB0MFhkakpTS0wxdDdPVmpkUkx4bks5TkpQ?=
 =?utf-8?B?U2pWMlY0Q0xmanF6QllMZCt4OU1xWGpqdmZadWZBMk1EdTlGQktVWnMwdERJ?=
 =?utf-8?B?c3V6c3JsQmZQWWltN29pQjRwVE5FdSt4UlYvVitFQitwcTB2d1gvQXdGbk1U?=
 =?utf-8?B?N3h0b1NmREpOVFYzZmdKQkhnekU0YVBvV0RNUnA5TUQ1VUFaRjhSQkVrMnZy?=
 =?utf-8?B?bjVQMzk2UXZTRFRTMnZNVjE2MFpIUk9BbTBJYUUyZ3VGdHpsNTFLb3E1SEwy?=
 =?utf-8?B?bFVEMzZJNGtsWkF1cFI0MHZjVVZLQ2RjQ1JWV3ZmV1lnZnBGUVJxc3hkSGV2?=
 =?utf-8?B?WnhYMUh1cGNBV0JTUC9wb05xYkY2ZHZiMmM2WWdHNWJHYWEyaXhRN1BPZHhR?=
 =?utf-8?B?cFFJYzlMZHljUW00NW13YldYYnovRGhVL1ZHMCt0cmUwVzBmTHdMWDRLWEZT?=
 =?utf-8?B?UG9WUkVJRjgxK3VzSUw5a3lPQklJcWUzUTcwVjF0cTA5NWhkdlVoeEp4TEZX?=
 =?utf-8?B?aEg5MWJuMkt2czEzbk9kZW5icXZsdDNZS3VTYzdYVE9rS294OFdEQmlUakMy?=
 =?utf-8?B?L0dLZHJ5NzhFSDBYSXkrT0JTSzhkYlM5RFppOTJxV040VHlWZ29YcEUwWWl5?=
 =?utf-8?B?SjAxcWw0M29sTEo0cStWL2MzaVp4VEtuaGp2bzZTd1NtMWFEWHlKMjlyWEh4?=
 =?utf-8?B?UUNHUnNYZDFmUkFNQm5JVmQzMk1haGZHTlFpTklsZW9nQllLMGxRYmdUcE9P?=
 =?utf-8?B?VU0yc00yMmNicXV1YWUwSVdJVzFuNU1tN0xFcE5MTUl2aG1BdWhCNW4vdXdo?=
 =?utf-8?B?K0xhWEIya1M5SUxlYzBzU09lSXZhYklkOE9wMkhEMHBoS1ZGblhaNnV1dTV4?=
 =?utf-8?B?elJEY1hueG5EMnNIY1ZmQm9XSFRYdnpQSmoydHUvYTRkRGxMLytXNVlWZmRR?=
 =?utf-8?B?ei9xN0gxN2s0TzI1ZmRtcHZvV2dPK1VscW5OcUZBNmZiT2JUc0owdFkzZ040?=
 =?utf-8?B?aHhLQm8xZEFlVVhmQ0dBTGJlcXJSVWloT1ppQVNTZlFicjRxa095ZEc1MUpn?=
 =?utf-8?B?MEJDNlIzQmY2TktISXNFdG1iemwwT1JsdkFhbVEzWVpQRUQyaEpvbTl5a1dR?=
 =?utf-8?B?OGZRd04yc29NaU51aXVVcC9sVzhSY0pmbTVPV3VsYktUWkhTckdYVnlRZHl5?=
 =?utf-8?B?WklMK2VFL2I5VVBqd2llOFhjaElnRm1kbTVUNUNqZVp5bzdheHNtRWNScFhB?=
 =?utf-8?B?QmFBYUNMMUlEdEQ3M0l0aTYyeEtzTVdxVGhjS2VBZ1FaNVkrOHpseXFFLzZa?=
 =?utf-8?B?Z2JsWlNSNXVzUm0zdHZ3Tkl3c0svYjU3c2g0V2JpdDZOaUszUlNyWE9NaEww?=
 =?utf-8?B?YkNzaEsxWDNNQVB6elNESEgxYkhTc0VoWlRDRGxnWTNSNlQ0NUpQRmZmWkF6?=
 =?utf-8?Q?SrrfOFgCZZc7SxmEzi39EFE2boT7oD+ojlk7LyasPLILt?=
X-MS-Exchange-AntiSpam-MessageData-1: ToRl13rezFOYrw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e4667c-d446-4403-c0b9-08dec53343f8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 07:55:11.0644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTAXglt9SUuxeNZKt/rFpqXaNduBOYw2EMzgMvqIaA4dgihXSMB/TLGa0xlRpy+acnVu90h0EA5ZHefgAlmxyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4214
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64145-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[acourbot@nvidia.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:dri-devel@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:gary@garyguo.net,m:christian.koenig@amd.com,m:driver-core@lists.linux.dev,m:ojeda@kernel.org,m:maarten.lankhorst@linux.intel.com,m:aliceryhl@google.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:rafael@kernel.org,m:tzimmermann@suse.de,m:mripard@kernel.org,m:airlied@gmail.com,m:lossin@kernel.org,m:linaro-mm-sig@lists.linaro.org,m:dakr@kernel.org,m:mkchauras@gmail.com,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:lina@asahilina.net,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,garyguo.net,amd.com,lists.linux.dev,kernel.org,linux.intel.com,google.com,ffwll.ch,linaro.org,suse.de,gmail.com,lists.linaro.org,asahilina.net,collabora.com,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09470653C5E

On Fri Jun 5, 2026 at 4:24 AM JST, Lyude Paul wrote:
> Just a temporary holdover to make locking/unlocking the dma_resv lock muc=
h
> easier.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> ---
> V17:
> * Fix format of commit message title
>
>  rust/kernel/drm/gem/shmem.rs | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 084b798ce795b..650c34dd8b7a4 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -30,7 +30,10 @@
>          Deref,
>          DerefMut, //
>      },
> -    ptr::NonNull, //
> +    ptr::{
> +        self,
> +        NonNull, //
> +    },
>  };
>  use gem::{
>      BaseObjectPrivate,
> @@ -244,3 +247,29 @@ impl<T: DriverObject, C: DeviceContext> driver::Allo=
cImpl for Object<T, C> {
>          dumb_map_offset: None,
>      };
>  }
> +
> +/// Private helper-type for holding the `dma_resv` object for a GEM shme=
m object.
> +///
> +/// When this is dropped, the `dma_resv` lock is dropped as well.
> +///
> +// TODO: This should be replace with a WwMutex equivalent once we have s=
uch bindings in the kernel.
> +struct DmaResvGuard<'a, T: DriverObject, C: DeviceContext =3D Registered=
>(&'a Object<T, C>);

Should this be made `NotThreadSafe` as suggested by Alice? [1]

[1] https://lore.kernel.org/all/ahbglxo5yePyjE81@google.com/

