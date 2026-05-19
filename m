Return-Path: <linux-media+bounces-62110-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBGlOPkgDGphWwUAu9opvQ
	(envelope-from <linux-media+bounces-62110-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 10:36:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 685CA57A390
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 10:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9572131F6053
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF593E1234;
	Tue, 19 May 2026 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b4Pc0BWI"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012020.outbound.protection.outlook.com [52.101.53.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9085127E045;
	Tue, 19 May 2026 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179278; cv=fail; b=sr55KiH5pIeBg00+iERY5s6zFl6pqhbOMeXn4svXj179MLreFhgI2/quNKMgg6A/yi5VSa7wUZBHnaTYsvHWNiudC+sxhGhq0cnwRVD+9bK4n/s9vObW6mpJ0b/NQquBoemcmyyc3T86cmIGIy0g49dKr8VfRxuPDn/zO9iXks0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179278; c=relaxed/simple;
	bh=LHG9vNhdTVoSMuR6mQg1ZOCZ4sz80oPJBhK6FWBY/x8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QyFa7Tqkx4VQxHwKjt+rI8mGBbf6jjaI8xFu5hNjW9dKGpPb27CSnf5qmsxvl6BlEclzkLvTaGXL7McUUx4lknAoBZO33QfFnLgQZiE8QBmvEqb9tsif3SjRn0rOO68IjJsLn/G+1M0DyrQrg6wLfu4P8hwy+7rJWp8mRAR7TzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b4Pc0BWI; arc=fail smtp.client-ip=52.101.53.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpRVxp9bfal3fCxlvYilPEMHDb8StKdHLvztyzTOKVVdegtpvPyNN+3QAUPe0SCjOvugQg9uaK8wg6Mrj1wJ3QiI8GlvH8K0P4ehak1pRGH2tVj/PWRUpEW7b2jMDK+LDJM31QmRvRgsNADnSaeWGnmxowXOZnQG9+u7PTXY1NzHpRE3LmjPoLC0FS2eHCCDkgRYDbniQjestCCcFQf6i9cqcJisTOemNia8yNKiuELhZUwqkfWV00N4U80bsGlYv/WwnqB+cvEO0Gyse3o1mxN84d+pBczEqJhiygtkmgpsWon2OUqvn0G+0GlMtE2n9TVSVVSa3DWSaFInJzReUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khgnd2J/NfM3FdTrjeJdecxWGUdAAWxq4KXDkQMU/2E=;
 b=G+r6jw3G5QHtCG9JZp6wILUOGA1Y4oyD30Rs1vyJjGoAVFpnLtpIJB8jPHSggmiMDcS+GUIagDjjzFvrf6Jc7YORUBkwzTKJuU5vVb3cVy+2JzcD9BxUQeG4U2Sx+VAQngMO2SlVbsgPWE1i31BCdjcO3zukWfzeeSqlFu4F+K/FPp9fWj4lDEikwrxv1n8RMrEoDC7R499ZoXNLk6VtYy9rsy24adZSa6aEYQJX/yLptcK5AizXe3SlcbJ+Ray20b9fvHFY9zzeg3L4+q7/GrQ8OKw/SJm4vXg5RYZNsjYJeaDU2hdxbDJV5teTHhdVfWCLyIhrtIQbG5R8WXJ9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khgnd2J/NfM3FdTrjeJdecxWGUdAAWxq4KXDkQMU/2E=;
 b=b4Pc0BWIKmdKxXrZnEK1/qPhJcxcBGaC0TTqA7nQGMDDjNGhalL1ye6pviCo3yl7s1L0+wa2zUJW62TQCySR2amF3E5aHTtV5fMVrpa6ckTJZjD5n4FOmySzI68/OgB0O7zCA5E17gceqsWqO3vvZmjF3iLuNbvfCgr//J2k+Jo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6062.namprd12.prod.outlook.com (2603:10b6:8:b2::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.11; Tue, 19 May 2026 08:27:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 08:27:50 +0000
Message-ID: <2e23513c-9d59-4891-acfe-9f1fbcbce778@amd.com>
Date: Tue, 19 May 2026 10:27:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/virtio: use uninterruptible resv lock for plane
 updates
To: Deepanshu Kartikey <kartikey406@gmail.com>, airlied@redhat.com,
 kraxel@redhat.com, dmitry.osipenko@collabora.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20260519082247.34470-1-kartikey406@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260519082247.34470-1-kartikey406@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: IA4P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: ffbf0897-b395-446c-69b1-08deb5808373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|22082099003|56012099003|11063799005|921020;
X-Microsoft-Antispam-Message-Info:
	XV+PGKAUVR3e3TDqV14/tL+sWDEi3NyHOL6hTFYZJgyqjtWemglBUuFzbIFGpyg/KncCHv1pwZbDMF4a+jEG9Ie/DAcylPtPyHW4ybaHp4GLxkHy8utN7/wzAtAYTWVL+Cup18ZNNGAtEGZTc/SWB+LxxcIyKX3tVET3emBacAK4GJqTdeoJk1LJ/1IzurqzK4h4VauDSlDSprAUudFGBnd6y9FRKrivepNJ8exGqQiU50S6ivQWK5tFwhIN1uKGhFi692H5nk5m8ZXgDDJe3/2Oho01oaZSQ2jAcsepYqTsDl027lQf4CqfCYtPfIw/K0d4+7jLmF/CGjGnrPS2OSqVjQhVa1W4JuBUXOKVET++hwSROjpVEWdXL/qKWpFX6nWb9r2dSZNE6rrSMEDdiFkTPy9RRFRNzE6KkVkuiq8BWW53VIcWKcarRqrlQw5fuqca8MGchI6FYmV7fQUwQ2UDJY4BJx2onqbrmouVpZ62S8B0GDptvKm0S0mayEXC5jQJDUqvr70mxUr71LhOmV+WDvfXeLhNL48V+ZRBNKGm6s9zJRhzNzvpOKB0VTZj4bSWG97K5WGNT0LqoZjPjfxKItdGjKi2x89JwQuvth1ePbGneYcs9WqI5KMiyPxMCJkhFMc/67R+AN1ttSDE3QHyUnMz8FsB2YHHjYh03CFjTAgn8V1jvx7oRRvpAFin
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(11063799005)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjRzY0pFdmFORGNLYVdwSldxS2JOeW1KaDdWRStVR0lmRnpZNnEyMU1sbmtx?=
 =?utf-8?B?TzFYRWxsVVV2Y083bmJUcUJYaHdad0U0QzlWM0FaMzhYMWlKYkpCVXZraGQw?=
 =?utf-8?B?Y20zQ0JteTdIVi9OejJjWW9lRW9PaHp2S1FueWhEdStnbmVoaTErb0dDdWtu?=
 =?utf-8?B?ZjlKSmFmUXFjaEYzYXlvdUpiVUxTbEk4VlUzNXdYOGNDeFh0TjAvcGs4RmdR?=
 =?utf-8?B?SFVtcXQvaDMzcUFIeW1jT0NzMklJZlVrdFBWWTJmcXVYRGVPSTU1OTZoZ2Nk?=
 =?utf-8?B?OVdIZUxVY281c3RvZGJwWU92QVlJTUxSRXBvWXMwWHJaaXlxY0N6b3hDRzhQ?=
 =?utf-8?B?V1p4QWg0TjJaSTBCZ0ZES1ozWFhlSXdWNitxckNwVkMzQ2ZVYXVxUkFmdDhw?=
 =?utf-8?B?ZFR2RGx1ZDJYVDNRTmNSNUlxYWxGaFZSd2F0K1p4SXNWRnZuOGY0dmZVZ2ZJ?=
 =?utf-8?B?VjVEZE0zcGs2YjhLMUtXTDRtbStLbHBQaVlqanhyM3o0OWVhWW51WWpWekg3?=
 =?utf-8?B?ZWFaeURrY1hkSlN3YlFCNlNyQjc2Y05FdDlMWStKZFpLRUt6bVd4QzBuMVh6?=
 =?utf-8?B?T3BXb2JwbnhUUFl4S1NxSkcxVlNQQVhuZzEzQzB0bWZrcEwyRit1a2dzYXdC?=
 =?utf-8?B?YlpHcEpMSlF6RGx1RUYxZXk1N0VROVhVRkg4ZEZnVzRaN0NZYmtPVzk5ZzFt?=
 =?utf-8?B?V2VUS1JwWTI2Q2NOUi9QbyswZXVuVC9ld0l1ODd3dTJZTEVZWEcwY3BrRVNp?=
 =?utf-8?B?Q3Y3NHRyQ0JYQ0UvWk9Td1Z6ODFtU2FHYjZjclduSHJLZmUrb29QUWZNZTky?=
 =?utf-8?B?RmZxaDAzQkhlQ29HclZMdnBBTjJvaWRIT1MwemNwbnM0UVdBWXh5ZkR4MmY2?=
 =?utf-8?B?VmMzVGJyUGNUeFQ3TnJwTldqdTl0ZW00bEprbDhOQnZXd2xKQlVtSHlOK1pO?=
 =?utf-8?B?c00zSDEwaEFSRWZRMm9KUlZQTHpXMWp1OTcrSEVLNFZlZU5WNUwrNW9Kd3My?=
 =?utf-8?B?RkRlT1RVN2puNmRLdi9sWDdpcm9QT3dYYlM5cGFUeXZvbFM1WHNrRUQzQ2Ro?=
 =?utf-8?B?SGcydTdxRnJ4d21iVGF3QVBQSzR5bWUwWVZBQ2lFRkE3R2JweFcxdUUwbXR5?=
 =?utf-8?B?Tm5PK0NHQXBjbmFDYVk4NDNhUGtBTGNVTFI3QVR2SkY5VjFWaFZ1L01PeXU1?=
 =?utf-8?B?T0ozN092L0dUZFlZNkVqc0h5NFZvZlo0TXp4UzlaeERqQVpZL1hDZ3ExMmd6?=
 =?utf-8?B?b0NFZG05YVdzMkJLZ04rb0hIQmdFQXgySWxobHpwcE9pbFVjQ1NicWNUZTRW?=
 =?utf-8?B?RTk5YTdwQ1lrbDIyd3VxV3BGRDl3WnB6WHdOaHNzeEhVdjZxbDg4azR6ZzhZ?=
 =?utf-8?B?d2NmT3h0QTBkMWZGblhTT0cxTjRta2J1Qk9oblBQZzU1bVBaZlJIQ2ZUSzBp?=
 =?utf-8?B?Tk9odVpUNUpXNjkvZFZtTFl5eEtEeDJLeHpFblhQUm1ZWG10d0xKSXNEZ0l0?=
 =?utf-8?B?VkR5VnVCTnVZT05lMUVIdDlpSmd0MGhWMFlrdllKOW1XVFhlb3NOcVdGc2VJ?=
 =?utf-8?B?b2pVd2VBNDR1RmMrdjRpZDVZV1J0QUx6MGpUMzFQYnVHWHhMRTZPK1NMdEkv?=
 =?utf-8?B?Ukt4Qjc5TVhtNFhXOUxIRmIvdGxMb1hOL1dIR3VxdjAvMVF4d0RIYnU5WDRt?=
 =?utf-8?B?UFd3N1BTRC9rZVRwK3E3UWl0MStIS1FqdXcrMkx2eGx3UlMrcHdaaWxoWjhl?=
 =?utf-8?B?cU1QWkVnb3JKOTFTZ0c2TDFrVkwwRS9IWFB3QmFNRW9tSmpBdUo3Q1ZQL3VF?=
 =?utf-8?B?eVA1UDd1K04xOVpScktkVytES0t1RXFjY2JZSWdqelgya1pYZHFWUURDUlRV?=
 =?utf-8?B?N1lGZjhBSHBla3ZIMlBjQU5RTGQ3Z1VYYi9CWGprbjhkcElidGtESmVETmZ2?=
 =?utf-8?B?WkJiNGxNR29RUDJGNzY1aDEwRkIwZ053cXRac3dYODVhdHpES3JrcGxvNDhI?=
 =?utf-8?B?end4UGVGTGdTNFRPZEpOWjVVY1ZCUThWQkdjeXhmemRtWlJDWkJtaUdPa1VH?=
 =?utf-8?B?YmM3UGxnbnNCTXBERjJ2YzNhMi85UVRuWGd2RmZieDNCOXZSV0tsYmlVUStq?=
 =?utf-8?B?NWkxZitCbE43RkJSSUVuWTdQRE1oMmVMNmpaTkhLaWhLd3dCRDAvb3JaMnNK?=
 =?utf-8?B?LzhlL25OSTRnUGtvUHJjdW5VMkFaYm1oeTJ1amlzRENSM1FnVEpBcWFOVGdw?=
 =?utf-8?B?OFFWMm9mWVoza1kwY1pWYzZ2Y0FMRUtsMXVjRGN0OGk1WSs4eXlHdStnbk1w?=
 =?utf-8?Q?pdKabc7IItZJbY9aMd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbf0897-b395-446c-69b1-08deb5808373
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:27:50.0208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +42WUGeqgbA4TKZvAeHcJN2lho5/vLiBhahxQFdgqK7qS1Zf+8YT9fiREETlQOlt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6062
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62110-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,72bd3dd3a5d5f39a0271];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,syzkaller.appspot.com:url,appspotmail.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 685CA57A390
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 10:22, Deepanshu Kartikey wrote:
> virtio_gpu_cursor_plane_update() and virtio_gpu_resource_flush() lock
> the framebuffer BO's dma_resv via virtio_gpu_array_lock_resv() and
> ignore its return value. The function can fail with -EINTR from
> dma_resv_lock_interruptible() (signal during lock wait) or with
> -ENOMEM from dma_resv_reserve_fences() (fence slot allocation),
> leaving the resv lock not held. The queue path then walks the object
> array and calls dma_resv_add_fence(), which requires the lock held;
> with lockdep enabled this trips dma_resv_assert_held():
> 
>   WARNING: drivers/dma-buf/dma-resv.c:296 at dma_resv_add_fence+0x71e/0x840
>   Call Trace:
>    virtio_gpu_array_add_fence
>    virtio_gpu_queue_ctrl_sgs
>    virtio_gpu_queue_fenced_ctrl_buffer
>    virtio_gpu_cursor_plane_update
>    drm_atomic_helper_commit_planes
>    drm_atomic_helper_commit_tail
>    commit_tail
>    drm_atomic_helper_commit
>    drm_atomic_commit
>    drm_atomic_helper_update_plane
>    __setplane_atomic
>    drm_mode_cursor_universal
>    drm_mode_cursor_common
>    drm_mode_cursor_ioctl
>    drm_ioctl
>    __x64_sys_ioctl
> 
> Beyond the WARN, mutating the dma_resv fence list without the lock
> races with concurrent readers/writers and can corrupt the list.

Well why are you trying to add a fence on an atomic mode set in the first place?

That is usually an illegal operation here.

Regards,
Christian.

> 
> Both call sites run inside the .atomic_update plane callback, which
> DRM atomic helpers do not allow to fail (by the time it runs, the
> commit has been signed off to userspace and there is no clean
> rollback path). Moving the lock acquisition to .prepare_fb was
> rejected because the broader lock scope deadlocks against other BO
> locking paths in the same atomic commit.
> 
> Introduce virtio_gpu_lock_one_resv_uninterruptible() that uses
> dma_resv_lock() instead of dma_resv_lock_interruptible(). This
> eliminates the -EINTR failure mode -- the realistic syzbot trigger
> -- without extending the lock hold across the commit. The helper
> locks a single BO and rejects nents > 1 with -EINVAL; both fix
> sites lock exactly one BO.
> 
> Use it from virtio_gpu_cursor_plane_update() and
> virtio_gpu_resource_flush(); check the return value to handle the
> remaining -ENOMEM case from dma_resv_reserve_fences() by freeing
> the objs and skipping the plane update for that frame. The
> framebuffer BOs touched here are not shared with other contexts
> and lock contention is expected to be brief, so the loss of
> signal-interruptibility is acceptable.
> 
> Other callers of virtio_gpu_array_lock_resv() (the ioctl paths)
> continue to use the interruptible variant.
> 
> The bug was reported by syzbot, triggered via fault injection
> (fail_nth) on the DRM_IOCTL_MODE_CURSOR path, which forces the
> -ENOMEM branch in dma_resv_reserve_fences().
> 
> Reported-by: syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=72bd3dd3a5d5f39a0271
> Fixes: 5cfd31c5b3a3 ("drm/virtio: fix virtio_gpu_cursor_plane_update().")
> Cc: stable@vger.kernel.org
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> v4: Rename the helper to virtio_gpu_lock_one_resv_uninterruptible()
>     and reject objs->nents > 1 with -EINVAL. The v3 helper's
>     multi-object branch used drm_gem_lock_reservations(), which is
>     interruptible, contradicting the "uninterruptible" name; both
>     fix sites lock a single BO so the multi-object path is dropped.
>     (Dmitry Osipenko)
> v3: Drop the prepare_fb/cleanup_fb approach from v2 (it deadlocked
>     against virtio_gpu_resource_flush(), which also locks the BO in
>     the same atomic commit). Instead add an uninterruptible variant
>     of the resv lock helper and use it in both
>     virtio_gpu_cursor_plane_update() and virtio_gpu_resource_flush().
>     (Dmitry Osipenko)
> v2: Move resv lock acquisition from .atomic_update (which must not
>     fail) to .prepare_fb (which may), per maintainer review of v1.
>     The v1 approach of silently skipping the cursor update on lock
>     failure violated the atomic-commit contract with userspace.
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 +
>  drivers/gpu/drm/virtio/virtgpu_gem.c   | 17 +++++++++++++++++
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 10 ++++++++--
>  3 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index f17660a71a3e..2f3531950aa4 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -317,6 +317,7 @@ virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents
>  void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
>  			      struct drm_gem_object *obj);
>  int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs);
> +int virtio_gpu_lock_one_resv_uninterruptible(struct virtio_gpu_object_array *objs);
>  void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs);
>  void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
>  				struct dma_fence *fence);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index f22dc5c21cd4..435d37d36034 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -238,6 +238,23 @@ int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
>  	return ret;
>  }
>  
> +int virtio_gpu_lock_one_resv_uninterruptible(struct virtio_gpu_object_array *objs)
> +{
> +	int ret;
> +
> +	if (objs->nents != 1)
> +		return -EINVAL;
> +
> +	dma_resv_lock(objs->objs[0]->resv, NULL);
> +
> +	ret = dma_resv_reserve_fences(objs->objs[0]->resv, 1);
> +	if (ret) {
> +		virtio_gpu_array_unlock_resv(objs);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
>  void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs)
>  {
>  	if (objs->nents == 1) {
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index a126d1b25f46..652352424744 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -215,7 +215,10 @@ static void virtio_gpu_resource_flush(struct drm_plane *plane,
>  		if (!objs)
>  			return;
>  		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
> -		virtio_gpu_array_lock_resv(objs);
> +		if (virtio_gpu_lock_one_resv_uninterruptible(objs)) {
> +			virtio_gpu_array_put_free(objs);
> +			return;
> +		}
>  		virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
>  					      width, height, objs,
>  					      vgplane_st->fence);
> @@ -459,7 +462,10 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
>  		if (!objs)
>  			return;
>  		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
> -		virtio_gpu_array_lock_resv(objs);
> +		if (virtio_gpu_lock_one_resv_uninterruptible(objs)) {
> +			virtio_gpu_array_put_free(objs);
> +			return;
> +		}
>  		virtio_gpu_cmd_transfer_to_host_2d
>  			(vgdev, 0,
>  			 plane->state->crtc_w,


