Return-Path: <linux-media+bounces-65713-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KCqIGfZuPmojGAkAu9opvQ
	(envelope-from <linux-media+bounces-65713-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:22:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD15D6CCF0F
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:22:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=yxqzl6JY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65713-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65713-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B72ED301487D
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 12:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852893F4DCA;
	Fri, 26 Jun 2026 12:22:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010063.outbound.protection.outlook.com [40.93.198.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D284317142;
	Fri, 26 Jun 2026 12:22:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782476531; cv=fail; b=fRJxqGBaeOWY7n/kH0XB8cLcbQYKFUStuQ5ScoRR3M3QFemINg4rr+vygN9Glu9Ihk9RnUY8YpgOuayEgyOdGPlJu9hiAw+OuGkhdE1Wty7d9Br4VZTL8he2InWmwrWFE7kqJIh79X23cfEsq7Lh5yM7/gVS3nRSydLAjsi+kcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782476531; c=relaxed/simple;
	bh=kqqFKviwj9XbAiuLjxomOeWdEBN3FriqZBh4KQrCDI8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W1D+hEexa3vtcqi7jfH6opvBMJo8+S1Op6oVzNcRPPrBCip8us12iiwHcWRa5PT90iQak42aZyf5RuTAmnklZPvHMQwFiltvHzdydc2Wv9+2VipeWfOkiObZxtSEiuHSk8Xbn+sngl5HXhRFKakVps2e7tc/B+sLcvhUWEhtJxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yxqzl6JY; arc=fail smtp.client-ip=40.93.198.63
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySah26RMzLTd0eupgPzgQoWDSxCGqyN07NgMpOy/8lQU793E6FILTNxbNaX9m3YK3rrkkbOxobWqAhHvzoPSefFubZNhK0/mAwXnhZUUJNvKE7R37mJYtDvqZdVpeCDwDgOqy+7IhNCdZ6TRhS97cv4NiQ6zpkcdT3XDLyKaernrbUfk0PZgeOBxoQMi4TCWSgvcEgHZy6pGQFvoi1DNq9RidqPtfqSD9SwZC0SEUely761qvBt/IqXqOB/NI7Wn+jrBLb927wwljhif2jKBy19o9hP3ntLbJS8M09X/w6LySwpJ4N6L6i2R74UH4g4Qp+SP2/V++/J2rOjigXhLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEQBeWbkOT7ptvnj9ICW1bo8aS2tF3EjAsIfAYnzta4=;
 b=dp/vm6gwVPE7D0b5gdUk36+r7/j+coqU2uBA33ZpC3H4YH0scN4yP5jm0ObWrZ4tEtra0wDnYmeF9ueBcMX72Vzf86djcdQSkJiKVH6vWVhBY3In3jOCoqXueAQhFGrFvvsOvJmQIJhKRvzRKiwZ84AAJqjSOgns2g8V7bY9R9poHDIpbi8XKEDvWcn8odHVv0dRr9jR1TSvY76mdqdSUVG4QWwegDss2g9SV/Les/H/S0Sk6K8ju7ngr9mTTyXx/e7hAGJ+xL8NRomAbar8bWPDT8TOSp7JGdBV7HixKgqRpgJEpx50/6YwBhgIbdXDEbbPq2mIFHpIClLNmIcO7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEQBeWbkOT7ptvnj9ICW1bo8aS2tF3EjAsIfAYnzta4=;
 b=yxqzl6JYuQ0bRO2XAAsqhU86FmfVmPg2ld0n3us7q45CY1deukhLv6wP+24fLjd2NajOc65mQzJZUuZnyQm0CGVX1LkaJvUKau9Fsxog//76GlRGW+GqMvCRs/wUDVLh+F370sADZ3Bm5v9gdvNaSgDPPzA1/TiebvnFOkyknuA=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8808.namprd12.prod.outlook.com (2603:10b6:a03:4d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 12:22:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 12:22:02 +0000
Message-ID: <cfc287ff-6ab3-4cb3-bddc-6d0e32235847@amd.com>
Date: Fri, 26 Jun 2026 14:21:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: dma-fence: Fix potential NULL pointer
 dereference
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
 "Paul E . McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260626100442.2202221-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260626100442.2202221-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: c4bde4a2-659b-43f2-2740-08ded37d86de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|3023799007|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nE0turpB5mOw2ybuL/RS2CTIbdQIvjycfwrEm41Ul44oNsrAwHAW+BpYL0PJ+qTvl0p5SFlqXZv2HClxH2rNXgY0szWC1RZhr21B4ajFIqJkqZTjtHbmZvG2wyuhcBCXPweVxbwZfgWJEaIu/Mg9IrUm4uzX3GeVLdgVHfkQd3z4AC1t6BaEZRu3Yv1LyX2LGYW8lngB6ieLHZeER9bwodxOWt4IVsbA938mX1y6GaoWJu92veCtVu5Tog7ZdEZeQJFR5KKhpvkH+smV/eVccQ3ZKfLbTrt3R89yHKNKLQhzhyUkCUANrkVyAA694FtBwryRWcUFA8nF32I+THzIbVTvD12eU5aZIb3JpTqDegspx4LBH8gPbIxUKN9qr8gYG6CN2OlgRnTGqCkM8NxPCrj5XRcBkbacxyFBo8Oq3s417AQSknvbYtcwlGtwc8nvASl9tTLPZ42K6Kb1ChCALjxV8fTqcxP/CNVNZ+yUsOQ0ejtlvT3sNJ9DteJb7IcY/bwBYsdggTxeMQKhzmbZYFYkQ6P4aThniPhEsrkM056+n6cFXIbqK2Ts9BKgtu8peYMfv2t6/gc03jzIkt/W0KyqXNRcr1KBpe98ic0rGAG3c9DxKVdjs13+PUOjDcRRQpDxIYf9jc7Tk6eDUre5Cn+9RHw+arLvvYUmZja6a08=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(3023799007)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHZBSnF2QXNkOWhHU09MZ0hDZWJUNnQ2TTFqSXRYakZVYStlSWdnY0REd21k?=
 =?utf-8?B?Z1h6MXN2NTU0SzFIaEdsMCsrSU43T1hnWm9ESzN3eUVSMUVVOUZoRjlVd3V0?=
 =?utf-8?B?Y3l3SXgrc21aeXZ1SlMrSmVaa0trV0xEbDBiV0dnck5MWHJ2N0NvVWF4THhN?=
 =?utf-8?B?WlBRVnRNa3JRWDZoeFkrWXd5c0Z2ZHl6VDlrTW40Rml0QnBhaW9QTDlIaTFX?=
 =?utf-8?B?Q3ZVMitaY2Y2WHNzKzViak1VOW9MbGlMb1E4cjRKWmNDNkhlWVVZV2dyVS9T?=
 =?utf-8?B?VDJ0c1ZLNEMycEduY0plVnVQOW1qUjlBdk0zajhtRXk1blA5T3k1aFA4THF6?=
 =?utf-8?B?NEdtRTIwTGJFU3BQdFo5WUR0TVBQVmIrRGFPck0vaW4vU3ZLbk9WZGlpMFZl?=
 =?utf-8?B?bDcvbHY5ZE1ibmQ3ejBML1FWYUdrNDdHZ1dWZmhSZVhwaGhkQ2ZiajgvNmJ6?=
 =?utf-8?B?WEd3NEpLeHpRa3hMVlRWdnF0Sm1QSmtES3VpWWRPREpOTEpoT2pCWTA1Sk9k?=
 =?utf-8?B?eHJGVFZDS05yL3ZiQlRHbEhNMm1BM1hLdWpXaGk5MVEzTzNvUEtZSlNqbkha?=
 =?utf-8?B?TnJ5MUF5b09HOFMxUm1TdTVWczIzcWNHMmFxY2FSWWJjU2dxMVYxaHZickJZ?=
 =?utf-8?B?OEdlSy9oczE4ankrOXJhSGVYdHFkWkMrTVR4b0c1OXhjU0t3YisybHZrZG1R?=
 =?utf-8?B?dGdhZ05DSk0xTW1TdmFtMkx6Uk51MWNFdEhwZ1Q1OXF6d1lyQ05IcFYxbjhl?=
 =?utf-8?B?MG1lWWV0dHdqdVY2clQyMTFsOWVjVklRVVk1MlNsbVk3MkQ2N2ovYmxBZ0FT?=
 =?utf-8?B?NDR1anlFWjhhaU8vUk9nVzZTcmZqVE1VNmlvZFdrby9vQUNaTjJGR3RWZXJQ?=
 =?utf-8?B?dk9aT0hzZmg3U3FYQ1ZjN0wrdHNYa0tVcGlFN1M0SUlZVHNBUUNqdDljbVlQ?=
 =?utf-8?B?ZG9XNTQ4QXpFSENrVWpreldSN1BBNkxmdkRkL3F6ODZuSWNra1I4RXBGYmlW?=
 =?utf-8?B?TWdtdW9wdkcrckw5RS9Pb25GNnFtL05Fc1pGbW5BUklFbmJPM1cyWXRkeWlk?=
 =?utf-8?B?akF4TUsyQUFvVzViR2RpUnlSK1hIck8zYWpTbEhObHRFNmM2TUI0MjkxYXVr?=
 =?utf-8?B?ZzNxOFF5UDlXQTNlOHlWTmlwVWFCNXR2Z0MrWWplZDh5YnY5bExBM3pJM3JK?=
 =?utf-8?B?MGZGeXpVK0NKbHovWTZvNnhDSWJQWnEwNzdXbHZkZ0Yxc3F6OXZ1enQ1S2pJ?=
 =?utf-8?B?K3FPVVNzQnZDc0hCN05Vb29ZTEVpb1R4bjBKNGdMenpQdXFNL01FaXdyZWJs?=
 =?utf-8?B?T0xKRURHYzVrZDkzaDZFaFBBV1pUQTAwUFdxNTZNaVZtODhBSnUxbEYvVWpF?=
 =?utf-8?B?MGJiMWxDN0swanBraXJ3Wit2SnM5RDE4YWNPK0JWb3RHMElxbUpEN0Vxbi9O?=
 =?utf-8?B?Zjd6L2xNOFN3WGhRbDFMdlFRUU1vSkN2akZ2Lzdlc05sSDdFWUorU052akNy?=
 =?utf-8?B?ZXp3WHVWMmJpOEx5OHlZOUtPK3V4UWlHNTBMOEx4Rkd1WDZNR3R2YTJENzF5?=
 =?utf-8?B?S2dsY2VqVHNERUtObVdzbUVJaWlEb3p1Zno5MGtUZktzMm1SUzBRM1h2aVBX?=
 =?utf-8?B?cG9mYk5MSGNDWG56M1MrK2UzNjhQZ3BoR1NvQ0xTRnR5amxrOWZvTnVFU0Rv?=
 =?utf-8?B?WldJVHlJMHRnZmRMbzNscXVHK3lxNXgxYjJtQ2l0dEU3cUNCTGZ2eWMzb0ZW?=
 =?utf-8?B?Wkpxd1FDTkptRnhJaUMrNFBrRG84L0tTT2xSREd5bmE1enZzUmV6MDBBbTMv?=
 =?utf-8?B?a2orUUtWb2ZtVjA3VG04SEZUKzRzdTZQOHVkWldXSExVWll4SXQvYzUyRkdS?=
 =?utf-8?B?MWNvYWhoUXA5TmRaSERKVWN6Zm42cGJjaDFjemtGZmhmaktHeVErNi8raXFP?=
 =?utf-8?B?RFZDWWsxSG5ZM3ZBZjNBMUwxeTllYTdzWWkvSjBQelVYRHhtYlo0emhWYm40?=
 =?utf-8?B?UmtUUFg4M1NwbTVjaUtjOFlIRUJwblllem1qeERPOFVJdjB1U3lxZFdwZ2VK?=
 =?utf-8?B?NjdDSkM3dXR4aWc2Uzh1UzBMM01VbEU4eGU5MkZIWUZleVpKSmNWYUlmMS9a?=
 =?utf-8?B?ODVxenF5TmRmeHlncjVQckZUcVFLVU1ZTFArRXVGb0Y3OUNLaXl0K2IybUZL?=
 =?utf-8?B?Vmd0YnhiUDJkYjJFRmNmLzgvR2tjWkhYOEJXb1NXaVdVeWo5Z0hEL21iZlBz?=
 =?utf-8?B?L3dGOGNndjhPTHJnRUo1bmJ6LzByMmlpZ1VLa0djVk5aUlVkM25ZeDMzNllp?=
 =?utf-8?Q?ejvcox2jHxsK/M5ONX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4bde4a2-659b-43f2-2740-08ded37d86de
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 12:22:02.2906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unGqEwxav7bQYiU3PULfi/auaQoWFV+RL5ubP57rwz2x5jDkawW9zoYgDFS6Q0S1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8808
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65713-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:tvrtko.ursulin@igalia.com,m:andre.draszik@linaro.org,m:dakr@kernel.org,m:gary@garyguo.net,m:paulmck@kernel.org,m:boqun@kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,amd.com:dkim,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD15D6CCF0F

On 6/26/26 12:04, Philipp Stanner wrote:
> The commit mentioned in the fixes tag below introduced a mechanism
> through which fence producers can fully decouple from fence consumers.
> This, desirable, mechanism is based on the fence's signaled-bit as the
> "decoupling point".
> 
> A sophisticated interaction between RCU and atomic instructions attempts
> to ensure that fence consumers can still interact with fence producers
> through the dma_fence_ops, callback pointers into the producer.
> 
> This is the desired behavior: to check for decoupling, the signaled-bit
> is first checked. If it's not yet signaled, RCU ensures that the ops
> pointer cannot yet be NULL.
> 
> Hereby, dma_fence_signal_timestamp_locked() first sets the signaled-bit,
> and then sets the ops pointer to NULL. Readers first load the ops
> pointer, and then check through the signaled-bit whether the pointer can
> legally be accessed.
> 
> These set and load operations could occur out of order on weakly ordered
> platforms. Hence, we need to enforce strict ordering all the time.

Ah! Good catch, now I've got what you mean with that.

> 
> Add the appropriate memory barriers.
> 
> Cc: stable@vger.kernel.org
> Fixes: f4cc3ab824d6 ("dma-buf: protected fence ops by RCU v8")
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Tested with dmabuf and drm_sched unit tests.
> 
> Memory barriers are notoriously difficult, so I would appreciate if some
> of the more experienced folks can check this. Notably, I am not sure
> whether the smp_wmb() is necessary.
> 
> The documentation for test_and_set_bit() makes the mysterious statement
> "This is an atomic fully-ordered operation (implied full memory
> barrier)", but the kcsan_mb() seems to be some sort of debugging
> barrier, and in any case the docu doesn't make it obvious to me whether
> that "full barrier" comes before or after the bit setting takes place.
> 
> Moreover, in my opinion we should order dma_fence_is_signaled(), too –
> but if we agree to merge Christian's new series [1] that need should
> disappear.
> 
> 
> [1] https://lore.kernel.org/dri-devel/20260624122917.2483-1-christian.koenig@amd.com/ 
> ---
>  drivers/dma-buf/dma-fence.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index c7ea1e75d38a..2e80b01499de 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -363,6 +363,18 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>  				      &fence->flags)))
>  		return;
>  
> +	/*
> +	 * Fully order setting of the bit above with setting of the ops pointer
> +	 * to NULL below, so that all parties can use the signaled flag to
> +	 * detect that the fence decoupled from its ops in a safe manner.
> +	 *
> +	 * The counter parts of this barrier are in dma_fence_timeline_name()
> +	 * and dma_fence_driver_name(). All other future parties that rely on
> +	 * the signaled flag for valid access to the ops pointer will need a
> +	 * memory barrier.
> +	 */
> +	smp_wmb();
> +
>  	trace_dma_fence_signaled(fence);
>  
>  	/*
> @@ -1170,6 +1182,12 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>  
>  	/* RCU protection is required for safe access to returned string */
>  	ops = rcu_dereference(fence->ops);
> +	/*
> +	 * Fully order the dereference above with the flag check. Otherwise,
> +	 * ops could be dereferenced as a NULL pointer. The barrier's
> +	 * counterpart is in dma_fence_signal_timestamp_locked().
> +	 */
> +	smp_rmb();
>  	if (!dma_fence_test_signaled_flag(fence))

Instead of adding the smp_rmb() I think we should check the ops pointer here for consistency with the other cases where we call the ops functions.

>  		return (const char __rcu *)ops->get_driver_name(fence);
>  	else
> @@ -1203,6 +1221,12 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>  
>  	/* RCU protection is required for safe access to returned string */
>  	ops = rcu_dereference(fence->ops);
> +	/*
> +	 * Fully order the dereference above with the flag check. Otherwise,
> +	 * ops could be dereferenced as a NULL pointer. The barrier's
> +	 * counterpart is in dma_fence_signal_timestamp_locked().
> +	 */
> +	smp_rmb();
>  	if (!dma_fence_test_signaled_flag(fence))

Same of course here as well.

Thanks,
Christian.

>  		return (const char __rcu *)ops->get_driver_name(fence);
>  	else
> 
> base-commit: cdeb2ccd993ed8647adbbda2c3b103aa717fd6f7


