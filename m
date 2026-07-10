Return-Path: <linux-media+bounces-67293-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pzdHHornUGrl8AIAu9opvQ
	(envelope-from <linux-media+bounces-67293-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 14:37:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D573AD59
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 14:37:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=E7PjSRYM;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67293-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67293-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 510883004266
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981DC4279F3;
	Fri, 10 Jul 2026 12:34:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012055.outbound.protection.outlook.com [52.101.48.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A487F426693;
	Fri, 10 Jul 2026 12:33:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686841; cv=fail; b=I5B2sdRoz/yMplfUkpv6JmZjav/wSomoYMwQ2CtlSuJIG2PuasOUddWzDCIteCTl9n7I021V+uP12Yl2CP8GVF0483ZOj+ina33n3vVrvlzq58DRiIB2o56RLS7c4tcNsCwbXFeBtjNc4CWVGrPPReOBjpTc1+lRJzPJzbi+0X0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686841; c=relaxed/simple;
	bh=JcWNzlm92HYuZD+5fE+pAyGwNNVein6glAt2sFGJgeE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o/yoOItc+ZgbPoaIJFOtb5WyeCYUAcB8LD3TgXA7lA4DxFhvRe57ZCG+VyyDKI4WKzNnceHznkxa6HRxGI/m9Py2lzhwsPUhJMKItD1LkbDJfm7VlGDOXaHjp81LW+RH6698OSl2xVpsTw7piSijNDyEE78bOiuZBjcgaAKKuR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=E7PjSRYM; arc=fail smtp.client-ip=52.101.48.55
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1mhNoS002StjmPlaGrpNYIlD5qe2RO+5FueH4ZV39+kYYgeJOjZ1iOSofeuiiOw20rgziZOYrBsBCHTCoudZhP6zLbTPVPjUDmWEqwan58oHCBi1WxtkXxGeutDA3BTLULZ+fvGanv5q+qQx6d8ieyK4ZYjIW9p1ZwE+LMzSRCpMNm6qU5Ns/no2TBikMF9LSaV1uHLXe9lh+hODxVlvMJ2EfXXIpU8XJQcnl9oq6UFtYETHdJQjfBKW9P0iVTZm0RJ0ufJ+maT25gSU3wambewB/wJkmRXEPk6fHSAXz5YfsGY2e56NwLlTGEtX5zUP2eSeL9L3kgqNArd1kwy6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fJc2XVqGPSsolcEvXw6vulA0PYq460fs5OE7e+JzSg=;
 b=N0+NfiX6h83hT2ofpgKTBSn7fbQTF6y4NhPLtxtSkt4NldUvTcNbFQDG41qfvilP85kWvM+pnD6fYcREXSFFk8WRo0IQSAT8fb1fC5JAQrieXlQCvlKevf+m6nlAQPkBTPSAfgy33A9sjormOXeWaDuZEWWpG4lK7ZOKSZYVg6mylUD1auI+iG2uterUWyvw+5tHnp5BHA+ioO3VTKCJQ0vBXp3FTi/s4BzLpzgrux3EcX9iqTGZOyTQSsaaHKRCMN+TCN8EK58efqijY8Sl4RMf9EdqYJmFQl6XXhlNu/lvPttv8MCoolmEnIjCRy79xczvxcO1JrvffF9lQz8f9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fJc2XVqGPSsolcEvXw6vulA0PYq460fs5OE7e+JzSg=;
 b=E7PjSRYMPC2RxuxXUO39HO0+0KzS0UTl+4b0sKAIc9dn1eTlP0ArvqiCAshl0MKG8M/3WvfFzmNIHBhgyoYxhgw+J48+JubjrKDQKxF2vBwYy37H69vWqo0ucHI5a5ItoutDYKfxWqg4qM3Ah+vcwcoBHNT7x8OIYTKZFhZ0iD0=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5807.namprd12.prod.outlook.com (2603:10b6:510:1d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 12:33:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0181.008; Fri, 10 Jul 2026
 12:33:53 +0000
Message-ID: <99679491-8dae-460b-b662-81b130829956@amd.com>
Date: Fri, 10 Jul 2026 14:33:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dma-buf: dma-heap: don't publish fd before
 copy_to_user() succeeds
To: Baineng Shou <shoubaineng@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>, Sandeep Patil
 <sspatil@android.com>, "Andrew F . Davis" <afd@ti.com>
Cc: stable@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20260703080922.1838362-1-shoubaineng@gmail.com>
 <20260710105740.3080070-1-shoubaineng@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260710105740.3080070-1-shoubaineng@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0271.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: cda1c5e9-33a2-4a13-828a-08dede7f808d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	lSpjfg3siqAMVAqRhwSH+QXiGJRX+N4fpvTrJY63SrgV6INrdP9SJqlcTTW0O5bBToIzeBUc8RjKgcyCY16wfoqk5EmHWM6KLpvpfmDH02XLPeU2lHMVwu0ywMqkiJCxxk0L7pJykR94qShFbE74xQy0ktJTpZ/F5AFwGhHNc5paocRWS5Ui5/cmNTz6/j2vpVDqMCNt82KbOB84iSm7K8V8xYUq2wg7CnvziCpH66Irjh6vlZZ8NOAYZDon0QgFlLBC3csPGBowGwUBuFpn4bP505OJBTR+z/qps0QTx47tjgWXVClxTLG61x851QmkM0AYIEwWBXHu7l/sRUuBppJodCgfdLzrrpyzFEbvkfBPln2N7RqHFJ8u4Pqw4EIP6goE5pIc1RNxGxm1NwQqjRYHPsJRYJ3W7cYCDIoY4D0AgH0Mg6b0ow1aSSrICzQSbtc2G7s9XufHUU7SKe6wLoilEhPrl140geTa9wGixKml5MpSegXjCuo0Aj+jlp4+L5dNKRi/pAlde5UDhtYtP1fIFLaIx6W9djfy3BG+FsElBPGj3zuVKjashpnhmnpAwgzmL77TDkDX1gs25rULQQh9ATjYtXYwzCH+MNVNrXcAP+QHxptYQtZUTr3EimVDz+YOK+76Sz5Yiy3i53tGy0bn9vNllfjZYixg9CI8XV4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXF4dkk0R0RSemRYejVoZGlqODRNZ2V6MzBIRHYzLzhFSXpkNCtoL1ZoYkow?=
 =?utf-8?B?bXlqSkdYMlhFenFHMTV5Y3hGNENMSXpFN2xNSkZhaXpvb3BGbG1qcUxmV3JV?=
 =?utf-8?B?Slk0NG9FV1dvVmMyNUJFUGlrWWgyLy8xQklZblI4cHJicGpkajhUWUFSY0JH?=
 =?utf-8?B?OHFFZXFsNDZlU0ZYQnZQdXFTWkgvdVlUUmptQURIT2hiVFJDdW9LaUg4eFlE?=
 =?utf-8?B?NTJFTHI4Sno5UGVKTXNPdFhoanoxUlpaK1JvTFZsYU1RdkpseUN2Q1RZYkFz?=
 =?utf-8?B?THJNbVBSQ1V2Y0pQRkxFMTZYTUdqYkRZS1hTYUVkR0JXbWRKREVvcW5tWk5H?=
 =?utf-8?B?bW1KZ1Z3VkVNODdGRnUwNE1adDVmdTh5eWxvNkFYamZ4cnc3Qi9qQ0hNNmNM?=
 =?utf-8?B?c2EyVTVOUlJzcDZpWWxvbjZoTmxWSkpZdTMvZHRsLytHYStVQjB3ekl0T05l?=
 =?utf-8?B?YzRYT21JVHZwYkJob2ttd0lxWlNhTjdhR00yMlphK2hBTHJKMGtyclJUMjdB?=
 =?utf-8?B?N0FOc21oVUFhUFhkalRzdklDYllEQ1Q0MXB0SFZmcWloT3V0WHZ3d1hLU0F0?=
 =?utf-8?B?ZHJJK0ZzZWpuNVBaZGcyU3d0NkYxZ0RxQVdXc2tyYnBmZ0tsRnZVMEtpY3gv?=
 =?utf-8?B?VkRDK0FRd3k5K0tpZnpEYmc1UGRXVjNiZUF3K0JacFhmYkp1Y2dneGxJY3BM?=
 =?utf-8?B?ekNpTVoxVGltOS9EZkZzQktXaW80Q0J4N3FKNzFzWkh6SExKSHF1USsvWGRF?=
 =?utf-8?B?ZzZPMGJ5dXE0Ny9QazkzUFRGZ1ZadE16dHdoVng2NmJRcVRqV25TdU9nV2Uw?=
 =?utf-8?B?cncvUjdEblN0K2ZyaWVFek10NFZpYlN5ZkNTSG5sWkdQSm9oL1prRVIzTHEx?=
 =?utf-8?B?SUFYS1psVWhqYjZ1RUpMOWVQbXNWckkxeUxqRDRTNkg3Y0s3dy8zWW50dFBz?=
 =?utf-8?B?TzBIS1NyZ0xCSmJQZ3BpK05ML29oM1M0UWhYcmxtUWJBRU5BMmdjZm1MbU1u?=
 =?utf-8?B?S01pT2UvQyt1YWlvM1JNUVE0YWp2aEpSSkpnOUhQSVczeU1YdUxDK0RjcnpH?=
 =?utf-8?B?cldCdTE0ZHdtWkVFRXRMeDNDVEZEcW9wWXNLVzVxZTZKZTV2SE81eU96YUFQ?=
 =?utf-8?B?WVdjdzUzelMyVnNNWm04b2NUU1hOM1VjdmdZMjRHai9uVElDZVJrUFdnNWZ2?=
 =?utf-8?B?akNjU3RkMnpNa202Z1RqZ2ZKUlNTNzRaVktndWRQeVg1MFFFQnlwYlA2a21Q?=
 =?utf-8?B?TkcvcVRtOXdNcm5XSDJwaTFYR2ZyUXRmemhsN0Z5ekZOMzNhWDluUkxLNEVv?=
 =?utf-8?B?K2dIY3Bia1Z6eGNGVVJxMVRCMkNnRWR5dG9SZDh6a0JYRWVxTHZyT1BENUFq?=
 =?utf-8?B?SmE4RVFKTmtZaHNpRnJmcGlhR1lsRzJReko0OWtOSzFnQVNXT2Myb0k0c2lt?=
 =?utf-8?B?T29UUEJiZVFKS0FUOS9pbFZYMWZ0U2lWRkNPTit5cVB0N1hXM3FnYllxZ3FH?=
 =?utf-8?B?VXBVekhIbDVBRm9xZy9FbVN0aUlTdzJkTHVDNXpHZG5CRm1na2tyMW9wZ1NS?=
 =?utf-8?B?R1RJcXpNei96aHRYdkQ1dXBLQnlzNm4xZU9hMXNvV3laUjRDbUVvcGFKeEQy?=
 =?utf-8?B?b1BKVnJRNlBFSDRWSlo1b2ZQMTZMTzdpR0VkM25NSVNmWFE1aDliOGxnd0h1?=
 =?utf-8?B?VmNRWjBXWmkveVRsdFRhUUlOc1NFYk10dWlRNWdEYzVlVTJreExYNXo4LzVN?=
 =?utf-8?B?Smp6V1V5dUVHZFVEOTIzbTdyWjRaNkpiVVdENG9oTytaSGJhNFNxSVpJa1pw?=
 =?utf-8?B?M2JCNytDT2tYMnJjeDlpQUxUcGg2TVZWeTUxRCtyWUYzNWc2TjdRUWQ3Y3dP?=
 =?utf-8?B?R0dYd3RPUjMwUG9EMTJ1K21keVYzbFlXbEdqNlNGaEJVaWZnelVYanB4RGg2?=
 =?utf-8?B?MzMzRVN4L2tkSEhJeXJEVWhRSlBScVNIVWFHb3BsSTlNaU1JMldUb3YwNDU2?=
 =?utf-8?B?bFdtd1UranhCM3ErSCtneTNuTXlweitrUUFrNXF0a05aRW5mR3BZMXdEVE84?=
 =?utf-8?B?NlFiUUg4bEpwRCt0VmJGMUkvUklteXRmYWtPWEJEdlZBUVhyWnh1Y2JPMDQ0?=
 =?utf-8?B?T1ZGeUFXdkJrL1hac0hneGhsRUhvY1c2c3JWbnZzakp0NDNSUWEycHFLa0lm?=
 =?utf-8?B?QkdicElYZlY1OFNYcHVOdXRpeUpieno3ZndzUVFYVHA5eFI0MFlnN0tSWUVC?=
 =?utf-8?B?OXJmc1lDYVpNYXhKbE1DZnFkQmp3Snc4TGJtQ2FGbFBpTTVIZmlQYmJLSGpW?=
 =?utf-8?Q?Xaxau7IaGEwN1pxUZe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda1c5e9-33a2-4a13-828a-08dede7f808d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 12:33:53.6700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1+7sFmQT0YwDru0A1ovKAYpiI8/6/xuGbRRAlM+hu6eQp8VZQPPkz+pKht5hp9h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5807
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67293-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:shoubaineng@gmail.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:sspatil@android.com,m:afd@ti.com,m:stable@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,collabora.com,arm.com,google.com,android.com,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 266D573AD59

On 7/10/26 12:57, Baineng Shou wrote:
> DMA_HEAP_IOCTL_ALLOC allocates a dma-buf and installs an fd into the
> caller's fd table via dma_buf_fd() -> fd_install() before
> dma_heap_ioctl() copies the result back to userspace.  If the trailing
> copy_to_user() fails, userspace never learns the fd number, but the
> fd (and the underlying dma-buf reference) are already visible to
> other threads in the same process and are leaked for the lifetime of
> the process.
> 
> The obvious "close it on the failure path" fix is unsafe: once
> fd_install() has run, another thread can already dup() the fd, send
> it via SCM_RIGHTS, or close() it and let its number be reused, so a
> subsequent close_fd() from the ioctl path can operate on an unrelated
> file.  This was pointed out by Christian König on v1 [1].

IIRC it was Greg who pointed that out numerous times, I'm just repeating what I was told.

> 
> Restructure the allocation path so that fd_install() is the last,
> unfailable step of a successful ioctl:
> 
>   1. heap->ops->allocate()      creates the dma_buf.
>   2. get_unused_fd_flags()      reserves an fd number in the caller's
>                                 fd table without publishing it, so
>                                 no other thread can observe it.
>   3. copy_to_user()             delivers the fd number to userspace;
>                                 on failure the fd is returned with
>                                 put_unused_fd() and the dma_buf
>                                 reference is dropped with
>                                 dma_buf_put(), leaving no user-
>                                 visible state behind.
>   4. fd_install()               publishes the fd -- from here on the
>                                 ioctl cannot fail.
> 
> To make this possible, dma_heap_ioctl_allocate() is refactored to
> return the struct dma_buf * directly (returning ERR_PTR on failure)
> so the caller holds the dmabuf reference across steps 3 and 4.
> The fd is written into the kdata buffer before copy_to_user() so
> the reserved fd number reaches userspace atomically with the install.
> 
> The failure at step 3 is easily reachable from userspace: pass a
> struct dma_heap_allocation_data that lives in a page whose protection
> is flipped to PROT_READ between copy_from_user() and copy_to_user()
> (e.g. via mprotect()).  Before this change each such ioctl leaks one
> dmabuf fd; after it, the fd table is unchanged on failure and only
> /dev/dma_heap/<name> remains open.
> 
> No UAPI or heap-driver interface change.
> 
> [1] https://lore.kernel.org/dri-devel/175e98de-f414-47d7-81c1-c0fe0a8f7f62@amd.com/
> 
> Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
> Cc: stable@vger.kernel.org
> Signed-off-by: Baineng Shou <shoubaineng@gmail.com>

Patch looks sane to me, but somebody with more background in DMA-buf heaps should probably take a look as well.

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/dma-heap.c | 80 +++++++++++++++++++-------------------
>  1 file changed, 40 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index a76bf3f8b071..0a9bf62eb06c 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -55,33 +55,6 @@ MODULE_PARM_DESC(mem_accounting,
>  		 "Enable cgroup-based memory accounting for dma-buf heap allocations (default=false).");
>  EXPORT_SYMBOL_NS_GPL(mem_accounting, "DMA_BUF_HEAP");
>  
> -static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> -				 u32 fd_flags,
> -				 u64 heap_flags)
> -{
> -	struct dma_buf *dmabuf;
> -	int fd;
> -
> -	/*
> -	 * Allocations from all heaps have to begin
> -	 * and end on page boundaries.
> -	 */
> -	len = PAGE_ALIGN(len);
> -	if (!len)
> -		return -EINVAL;
> -
> -	dmabuf = heap->ops->allocate(heap, len, fd_flags, heap_flags);
> -	if (IS_ERR(dmabuf))
> -		return PTR_ERR(dmabuf);
> -
> -	fd = dma_buf_fd(dmabuf, fd_flags);
> -	if (fd < 0) {
> -		dma_buf_put(dmabuf);
> -		/* just return, as put will call release and that will free */
> -	}
> -	return fd;
> -}
> -
>  static int dma_heap_open(struct inode *inode, struct file *file)
>  {
>  	struct dma_heap *heap;
> @@ -99,30 +72,42 @@ static int dma_heap_open(struct inode *inode, struct file *file)
>  	return 0;
>  }
>  
> -static long dma_heap_ioctl_allocate(struct file *file, void *data)
> +static struct dma_buf *dma_heap_ioctl_allocate(struct file *file, void *data)
>  {
>  	struct dma_heap_allocation_data *heap_allocation = data;
>  	struct dma_heap *heap = file->private_data;
> +	struct dma_buf *dmabuf;
>  	int fd;
> +	size_t len;
>  
>  	if (heap_allocation->fd)
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  
>  	if (heap_allocation->fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  
>  	if (heap_allocation->heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
> +
> +	len = PAGE_ALIGN(heap_allocation->len);
> +	if (!len)
> +		return ERR_PTR(-EINVAL);
> +
> +	dmabuf = heap->ops->allocate(heap, len, heap_allocation->fd_flags,
> +				     heap_allocation->heap_flags);
>  
> -	fd = dma_heap_buffer_alloc(heap, heap_allocation->len,
> -				   heap_allocation->fd_flags,
> -				   heap_allocation->heap_flags);
> -	if (fd < 0)
> -		return fd;
> +	if (IS_ERR(dmabuf))
> +		return dmabuf;
> +
> +	fd = get_unused_fd_flags(heap_allocation->fd_flags);
> +	if (fd < 0) {
> +		dma_buf_put(dmabuf);
> +		return ERR_PTR(fd);
> +	}
>  
>  	heap_allocation->fd = fd;
>  
> -	return 0;
> +	return dmabuf;
>  }
>  
>  static unsigned int dma_heap_ioctl_cmds[] = {
> @@ -138,6 +123,8 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
>  	unsigned int in_size, out_size, drv_size, ksize;
>  	int nr = _IOC_NR(ucmd);
>  	int ret = 0;
> +	int fd;
> +	struct dma_buf *dmabuf;
>  
>  	if (nr >= ARRAY_SIZE(dma_heap_ioctl_cmds))
>  		return -EINVAL;
> @@ -174,15 +161,28 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
>  
>  	switch (kcmd) {
>  	case DMA_HEAP_IOCTL_ALLOC:
> -		ret = dma_heap_ioctl_allocate(file, kdata);
> +		dmabuf = dma_heap_ioctl_allocate(file, kdata);
> +
> +		if (IS_ERR(dmabuf)) {
> +			ret = PTR_ERR(dmabuf);
> +			break;
> +		}
> +
> +		fd = ((struct dma_heap_allocation_data *)kdata)->fd;
> +		if (copy_to_user((void __user *)arg, kdata, out_size) != 0) {
> +			put_unused_fd(fd);
> +			dma_buf_put(dmabuf);
> +			ret = -EFAULT;
> +		} else {
> +			fd_install(fd, dmabuf->file);
> +		}
> +
>  		break;
>  	default:
>  		ret = -ENOTTY;
>  		goto err;
>  	}
>  
> -	if (copy_to_user((void __user *)arg, kdata, out_size) != 0)
> -		ret = -EFAULT;
>  err:
>  	if (kdata != stack_kdata)
>  		kfree(kdata);


