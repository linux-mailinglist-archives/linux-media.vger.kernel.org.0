Return-Path: <linux-media+bounces-62949-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EZGOf8JGGpBbAgAu9opvQ
	(envelope-from <linux-media+bounces-62949-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 11:25:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CF45EF8AA
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 11:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43D5132A745A
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 09:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B683A7F55;
	Thu, 28 May 2026 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kcWzvgsk"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA113A6EEB;
	Thu, 28 May 2026 09:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959683; cv=fail; b=aDyjTZlU/1ib/PfX0j9aPQsueYqGuhM52+i8sKfEtDxsipW2DenTi6NwsSBYGfQSm/CsYRwuBjGDnPX67JO6FdMZUhQ8+mYGaME6VSqvjeG3sNKR/MpPDHFSd8ZtwzmTvL3W0Cx+Y24tAEtOngV5q95Dl6f1XzR6YW8iM5U66bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959683; c=relaxed/simple;
	bh=oNLCIOTIylZTsEz2s7iX3J+U/NFG4Ne5DHURSGXxAN0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aBAsBeULW/LsbDmnywFVis0ZP+7N57jsOY5K+BjH1lFmCCISHZz5sdCgQjyQugelbnMpJKZdFUShZvWU3MDzLfKoJnIEyZHPHDNbORhvVYx2HWdWFrVHT2nccQYESbnvxlSVYlq+UD9+3mnEI7/WAW1wb6U14FFWj2r9wPuWkDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kcWzvgsk; arc=fail smtp.client-ip=52.101.61.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vnh8L8DO2XHFBlOEzhS7USq5YEO40MKI2YrpT88xdoy29U31JiHHLdL65E3ljb1Uy9KM/DA9QmIPRAcxAJeW5+CyVnMBgst49k21QmGkarjrM1rT8X4rJQEsc/8SY05IIhGD+ihXpdsJu7RQnGnT04LEbN4Z7UOPnlG//mylI3ure0Xa3QD37mud1thjJnqfKQM9cfiKXpR75guF0swqs+2kYYDQL2Pannx6VJXIO7dMY9xi+MpyYSRwJ307xV81iB1/9eQlkcJF8HWbkIhjHXDdsRFA9VGR+MxbS3spjkFUg8+Grj8VK0VLaijVh7X4T2WOF4ldKAcbDmzY48Cg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWOxMJQONzhI0cs4N1MlVuiw42Ffn+es+On8Pn6LyS8=;
 b=catlaNm8d6lTgmeDe46ki4a2IbU0Q5xl+ftuHdA8rleAymeA1VGug9MbS/UDvw/QL6QeluBK42hjArAciJ/j7fxID0Sfyh0eziKmMKs7b6QMwMiNcpMUSSyjjFOiPT45A2fYJ+nZYJVpgHGGpL8dD8EzB/gIYZy1u49jg9MmeNQq83vgrluLX9/xdw48Pc/af6cT9uAaM/ixQaUO2Sagc71+EXDYGu8jE+I8AhFDN/dbyai/tceoqv9UnmkaRrcFCEAmh+9DiwBZG7CK6Xu3DOzm/qDTLX8PmZnnfT4K7uOL5f9q6ETEa4f2U646HqleTpOmc5QZ3qtj+M1jB9nfWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWOxMJQONzhI0cs4N1MlVuiw42Ffn+es+On8Pn6LyS8=;
 b=kcWzvgskklpaGUiOcAGeNO5SqRUle833lBIhjpXzof5XALcbqNi6ZItqjLYNUECD3AgXaOZWZgNam9H7bbTLth5e1emKKDZVvm84R6bB8chxyGAztd9zDDia+rK45FlVM/7z8hdl/j6tVApwo+iLVAXDM+VIZIp6OE1grOUKMkU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8197.namprd12.prod.outlook.com (2603:10b6:8:f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 09:14:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 09:14:38 +0000
Message-ID: <0e12ce28-f5b7-4ffa-849c-df9ad1796e22@amd.com>
Date: Thu, 28 May 2026 11:14:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/prime: Fix unsupervised rb_tree corruption in
 drm_prime_remove_buf_handle
To: w15303746062@163.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 sumit.semwal@linaro.org
Cc: jeffy.chen@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Mingyu Wang <25181214217@stu.xidian.edu.cn>,
 stable@vger.kernel.org
References: <20260528082912.1051262-1-w15303746062@163.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260528082912.1051262-1-w15303746062@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e7f744e-4304-4a92-0986-08debc998ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	78pmr9sfa4PcUSTZMoVU/faa66zNjhuU4t++Sv3lc3WFvIGOpJRvwyrC+xvu41gBICpq1FZQd9g15HJA936E96Y2NvHcV5vS14XQUNUj/Un7XjmLp0IzM1PB1ZStthp1c1A9ZHOGwZONaaRQ7Z8en2p1+dYCuhTk53BUiKAJIa6eIPdU5zGY8+RzVAvuPrZtgxQZQvAdfJCl/BXOFZVTAZsrIqoZKRmaD365WDUR15Hf+XzZn38+9V4GGBF7I1VVHxz2D7SioK0SYCD4e3Oho5hW+E696isnRwoGnHKlV2HWfjisno+JgmaAPVTbXSOpmqyiMpODPImEgAqjxp4EP9vdzX8Nh8Fq406U/WXSgDLXXvUOstjr2W3P1vhyZ8ueF7K1hZuG0cnn+g3oPOm4LugQWXIko4GPIsDNhz+ucOG5oAcZhMeSak8v86i9Xn8pP22JBAJTb2qn6npI/byn7guNolzwz3N279RyP25BP7B2alQbH+uPOeyTffo7xX68VbcApmPzbiwBAQMoaLXP5vPobGTuREuxHbGuA/Oe+scNVs9xvPtgPkCCx+L7o0p4e4zAVfVugIzjeOT33Fdp+SBzFudL8HeZXKu7bPMwxU5nFb6SeyIHYfxVW6TG70svAkB/1SjxxCiDKWtRb1Yf03OgtZFRBojW9W+bKpxd+/M8LvQRo6bbd5++QcHowUgU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFZMY2U0NjFQSUlIcjR5UDFCZmZkanNNMkZjblBXZFlUeDNyYjRaZDlibVRG?=
 =?utf-8?B?N3Q2WTVjQVZCUzRSSVZ6dDdyeFA2VVhpcElpMFJPVGxSbVFqSzNWSVl4bzdx?=
 =?utf-8?B?TjRqQzRRdFdGS3JWeEczM2JLeEo5UHgrOU9ZN3FKVWVaTlRtWGRWWldEeE1o?=
 =?utf-8?B?SEphSGh1MmpXUFdHbFVHVnd0ZXlHRHpmUERNT3B2YksyYkp1d3RSNWRqZVVu?=
 =?utf-8?B?S1lMWXdHaFF4Z1NDU0w1WEVvMEtaYzJyUXVrMEEwQzhwOUd0UUF5WkxrT0pJ?=
 =?utf-8?B?UlFqRWhuYk84TU1TZHQzd0ErVTBOMTIya2s3aTNqVHp1REtkbkZmWkZVcmxl?=
 =?utf-8?B?cEx5TXlZa1NJTTFkMG1zNDFUc3Y1UEZ3L1p4YUZSdGN6dnA4U1RxclBpaGVs?=
 =?utf-8?B?TnQvckpNbnB1TVMrdVp6UHRGcENaZVc2N2VEQU5PQnhZdzFoV2Jqd3JxLzA3?=
 =?utf-8?B?SU11OE5BNm9scGdvOE5iRXJwU0djSkxBSEYyOGZ6WGpwdjRHRGd0Ujg2U2JH?=
 =?utf-8?B?bWxPK2RicFRVcm1IT0FXOEFBaVFIc1R5U0dQNCtYWXRSeXBkSEtMNUlsWlUy?=
 =?utf-8?B?MUN3MlBHS214UG1MMWpjakUxMUNRTmorM1JNNjhDcmlhdzQ1VkxvN0FrR05W?=
 =?utf-8?B?S25Hd2V3SFF0OUw2RXBUaERCR0hsTEhibWltY2RtaDQ5Sm5odlVHSVBOU2pI?=
 =?utf-8?B?alg3YXdhSENJN0pLVHVGSXVvNE9ONk1CbVMwYWNZZjNwT1h3Q3A0SkFyZ3RW?=
 =?utf-8?B?azFia0NpVmMzL0d2TGJrS0hpNU8xc2pURWpqT0RsOHBOWmlkMlA3eDk4ZUxo?=
 =?utf-8?B?dmEvcWVEL2VzQUtJWWxiOEs3d05sT01xYm1SK1FMdTBSQ1FyeE1hRVpQYWlY?=
 =?utf-8?B?dndqMll0VktRVHdyWjBxNytsQzdqWDdGc3pNV3lURUhndEdiemJleTRFazU1?=
 =?utf-8?B?eXBaN3FIUlhmdUZSZFA2dDRUdWQxdmJSN2kzeW15eVEvWnZhOCt6Z1Rsa29M?=
 =?utf-8?B?L0tzdEdHdHRwSWpLeUk0dEJvaEh0ZlpWQW9ZZW9CQzdSOG03VERYODlTbnZ2?=
 =?utf-8?B?TW4wS3JKS3RKQlg2VEdzTmJEa0FaT0NLdE5tU3ZTbFlUMW8rMFVtTWh5bHF1?=
 =?utf-8?B?THJzZ0Z0c3ArQTFhY0dFR3RDS3ZTMnoxTi9BZGRrQkEzRXMvd0I0K3dqL1Nv?=
 =?utf-8?B?NHZ0b004ZDZKU1R2ZnJmUEQvTTBRRzJtb2tyT1NjQUVFdnNQekxwZWloT1RV?=
 =?utf-8?B?Q0hVQmprZDgxSEhKUHBiYkZqbHBiTmNuSGVNamNkYXphMUUyQ1lTRnBFUlM0?=
 =?utf-8?B?MkJjVnBGazJURzM3dXV0emlzcUxwNHBpTXdFZytCRnZsbUp6OVUzRlRHVXZ3?=
 =?utf-8?B?QWVNVFFYMTE2OEFBWlM3Ny9hNnpsMVU2VzQ1Rm1Ta1FHZ2tLWHNTaEVvY0ND?=
 =?utf-8?B?MEplSCt2NFRsRDJWVjRZS1NZT2ZBam5lVHZvalY0ZlhkK3JGanFyZEI5aWk5?=
 =?utf-8?B?UnJLQ2tTSmpKeUNZTVIvMzgvQjM0djNoR2ZrK2NVeU93dHRUcDdVRnVzTEFJ?=
 =?utf-8?B?QTkxT01VbHRaUFdGWHdRejJhOEswTk1WZllNbG1XYitxN1BId1ZzSi9lU2s1?=
 =?utf-8?B?OEc5RitKV0d0V0N2WTIzV2lxMzlEK0JXS3pEeWVkeTBSdGlkTmxYWUZNdmty?=
 =?utf-8?B?WVo0UERmdlUwVWw0VzJJbDExSnV4VG43TjJaempMbHdUSWVaSHpXdzBYbHEv?=
 =?utf-8?B?MDg4SWtTT0J0SWRWZk1EY3BmTGwwN0I4SnFlUXJWd2h4ZnkyaytOZmNMRXFz?=
 =?utf-8?B?b1FCcDFHVGY1K3d0Nll0Z3BrKzd4R1lMc1VCK0pWMXlNT3JHOGVDMTVKd215?=
 =?utf-8?B?UStkQ0g0bTU4MFZCc0taSnZJVjJLMnRlMUx0ZFJVeDRoMUZqOVNlOElOMFNL?=
 =?utf-8?B?dElYMWpvQjFUSzBFRCs2Znl1VmVycncyT3V4YzBreHZkTmRnazZPUDVNaHNr?=
 =?utf-8?B?MVJ2N215OHlyV2hqdzk1bUJvRW1raUVIV1U1SWplOTc0NXNlRzl3dmdPSHd3?=
 =?utf-8?B?TlUwc3NCVnBlZHdBWVp6bjROS2lEbkNSa3ZzQnZ5SzlSTWJBWTlUTHo2d0pi?=
 =?utf-8?B?ZlYwempzOHUybmlRVDdTSUtEQUFpYjgwcUducDBzSEZJS3BJY2dueitRUVUr?=
 =?utf-8?B?ZUowZUdldUtYTW1wVE5DKzROSG9Vdkp3a3E0UmRpZHZGSUE1VEVwYnFIZko5?=
 =?utf-8?B?NVFERU1JOWJlTEZvOGgzSUhkdGJkMjVlOEw0UUxPa3p4eGZMTmQxVjhjNVN6?=
 =?utf-8?Q?g3Xg3oDSWyy8kYyBUw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7f744e-4304-4a92-0986-08debc998ae3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 09:14:38.1681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zT4FWnKElPuqmRbry7C4OtwgDBGDX7MP5k3AxQfrA3cnMqcxNXr4cbiKCO/LjfMj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8197
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62949-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[163.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 53CF45EF8AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/28/26 10:29, w15303746062@163.com wrote:
> From: Mingyu Wang <25181214217@stu.xidian.edu.cn>
> 
> Syzkaller fuzzer triggered a kernel panic via a WARNING in
> drm_prime_destroy_file_private() due to a non-empty prime rb_tree.
> 
> The root cause is a complete lack of synchronization in the teardown
> path. While the import path (drm_gem_prime_fd_to_handle) holds the
> &file_priv->prime.lock during lookup and insertion, the deletion path
> (drm_prime_remove_buf_handle) traverses and mutates both the 'handles'
> and 'dmabufs' rb_trees without acquiring any mutex.

That's just simply incorrect, drm_prime_remove_buf_handle() is called with the lock already held.

See drm_gem_object_release_handle():

        mutex_lock(&file_priv->prime.lock);

        drm_prime_remove_buf_handle(&file_priv->prime, id);

        mutex_unlock(&file_priv->prime.lock);

So the patch you propose here is just nonsense.

What tree are you working on? Could it be that this is something specific to a certain version.

Regards,
Christian.

> 
> When multiple threads concurrently close GEM handles or interleave import
> and close operations, the pointers and balance states of the rb_tree
> nodes get corrupted. As a result, certain members are erased from one
> tree but remain orphaned in the other. Upon process exit, the final
> sanity check triggers the WARNING.
> 
> [    448.919314][T19739] ------------[ cut here ]------------
> [    448.945387][T19739] WARNING: CPU: 0 PID: 19739 at drivers/gpu/drm/drm_prime.c:223 drm_prime_destroy_file_private+0x43/0x60
> ...
> [    449.056535][T19739] Call Trace:
> [    449.056544][T19739]  <TASK>
> [    449.056553][T19739]  drm_file_free.part.0+0x805/0xcf0
> [    449.056652][T19739]  drm_close_helper.isra.0+0x183/0x1f0
> [    449.056677][T19739]  drm_release+0x1ab/0x360
> [    449.056719][T19739]  __fput+0x402/0xb50
> [    449.056783][T19739]  task_work_run+0x16b/0x260
> [    449.056883][T19739]  exit_to_user_mode_loop+0xf9/0x130
> [    449.056931][T19739]  do_syscall_64+0x424/0xfa0
> [    449.056977][T19739]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> [    449.057268][T19739]  </TASK>
> [    449.057295][T19739] Kernel panic - not syncing: kernel: panic_on_warn set ...
> 
> Fix this by acquiring the prime_fpriv->lock mutex around the rb_tree
> lookup and erasure logic. To respect the locking rules and avoid potential
> deadlocks with driver-specific memory cleanups, assign the target node to
> a temporary pointer and defer the dma_buf_put() and kfree() operations
> until after the mutex is safely dropped.
> 
> Fixes: ea2aa97ca37a ("drm/gem: Fix GEM handle release errors")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mingyu Wang <25181214217@stu.xidian.edu.cn>
> ---
>  drivers/gpu/drm/drm_prime.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 9b44c78cd77f..26319c638e0f 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -190,6 +190,9 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>                                  uint32_t handle)
>  {
>         struct rb_node *rb;
> +       struct drm_prime_member *found = NULL;
> +
> +       mutex_lock(&prime_fpriv->lock);
> 
>         rb = prime_fpriv->handles.rb_node;
>         while (rb) {
> @@ -200,8 +203,7 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>                         rb_erase(&member->handle_rb, &prime_fpriv->handles);
>                         rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
> 
> -                       dma_buf_put(member->dma_buf);
> -                       kfree(member);
> +                       found = member;
>                         break;
>                 } else if (member->handle < handle) {
>                         rb = rb->rb_right;
> @@ -209,6 +211,13 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>                         rb = rb->rb_left;
>                 }
>         }
> +       mutex_unlock(&prime_fpriv->lock);
> +
> +       /* Defer resource release outside the mutex to prevent deadlocks */
> +       if (found) {
> +               dma_buf_put(found->dma_buf);
> +               kfree(found);
> +       }
>  }
> 
>  void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv)
> --
> 2.34.1
> 


