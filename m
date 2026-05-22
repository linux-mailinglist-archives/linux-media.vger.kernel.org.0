Return-Path: <linux-media+bounces-62566-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA1fNh0PEGpQTAYAu9opvQ
	(envelope-from <linux-media+bounces-62566-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:09:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB655B05CA
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D708F3008D79
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 08:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5960B3A6B64;
	Fri, 22 May 2026 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PCT/EjH+"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012000.outbound.protection.outlook.com [40.107.209.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13292349CF6;
	Fri, 22 May 2026 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779437336; cv=fail; b=bGxGGHMgJ2Gi2B1Vkb3af2Qu8Z1qt+CCg7mqyVm4okBhwu1Fqru/nZ1+V7dQDXa84pqeUx0UE3UUqQC/rublX1F75OA1pFrR/Z3iNjJvSozyPOI+sAuweHF1S1zOmKcga4O1VzinTXu7S6s25DW45M8Bo1AhnnWOda6CVhVbJRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779437336; c=relaxed/simple;
	bh=MV8eNZoutYwzGwmVyXN608OJpJBawgvJ7U/JgcMXePY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AD5g8tQU0veTKg0KZTW5gqXcLmIadmpMECRnKabt8o5PpHK1dFM39kYDccEbSgMTD+yd3ApUXY4tXcZRhDyLUoLTc5yL3LMWqrMU5Lrpn9pJ2vCNpRz4Ub9QEn6YOYfDTIK8cEtTttkq8TjkYw2mLKhmKTOFh7EeraXY9WQTr5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PCT/EjH+; arc=fail smtp.client-ip=40.107.209.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFZe2hzLoBaN0jNaMRMnABuzyMmwfo5Wptev15gGj1PgfcxeqDpXXAs0PceIDCVMerhCC+kb2Kov+aSSHRjB48hZgbz6rgdji/Q3KRSDpUWSNnymWzl8UQKKFn3ZzDXUYyIhjsov8jaltXolS6O7kyK8fem3cJmZ6IYk5d3a+CTINJvyKPOnrM4xUuAJMX7NuIq+80gNU1tLkQdnKHj+5vcDMr0VW5gvGdGjoYqhd1mPDtFKztXhab7edXE4nWKRKtM77kSO7dG6uwNHfKoe68YI/tZwlNPJAMy63GYzxEauBwqMqTuyBsao+0aZp/rgZT9k0hKqOPy/o7BEkAtzRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK+nwwrpwnmp6whvIkoctKmXDToHcmbrG4oaYV8yGLQ=;
 b=SqgyLDpArUT82+oZxZnToOlp/iBD2s8dhQfzWZyDdaEMXW5XGV5ibJ75d1K7D/F1ECwhONhNHTelmK0407M8eCdzT9Ng8uODIx8Vc+zprOair3NuvcKTaemNud5rJsa+0ZN1/V8MPExlorOktfTSpgUZOHvKoIXhaWEYP4ovTrP3+BCrxLIJKRTfVt6Y2ml+ENL1k58SfMvEFB/2Xc2qVLGH2tgD9APKbpJbElFhnaNe41XT1ZZ/1NoKwa1GFe3t5NoMM5wRtDuhomqUYl5pLNXMgRFxt+t3+eNRBX+oN0VYBL6AGYbvvC5iAMH54MOX5wgkUmh6K0U45gHxgP8Caw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK+nwwrpwnmp6whvIkoctKmXDToHcmbrG4oaYV8yGLQ=;
 b=PCT/EjH+Aq0kQboMwkreaV6Y0fw22/b0tktGgNoO42nBto18O4IiNSF4BbA7t+sZRxWuVGvXfCtakj7O/seOnjs1NEnF3hUa/xJyjHEeK9s9xgwypnwwFiWw73/3PkBZwCOmrjK+3aX7n+/6YL7SylFE3AU9wA94uwdSGOu82+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7214.namprd12.prod.outlook.com (2603:10b6:303:229::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Fri, 22 May
 2026 08:08:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Fri, 22 May 2026
 08:08:45 +0000
Message-ID: <55aee3e4-9003-4694-b0fa-277a8c2bbbc4@amd.com>
Date: Fri, 22 May 2026 10:08:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/amdgpu: fix recursive ww_mutex acquire in
 amdgpu_devcoredump_format
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260521104335.28978-1-mikhail.v.gavrilov@gmail.com>
 <20260521150841.20625-1-mikhail.v.gavrilov@gmail.com>
 <20260521150841.20625-3-mikhail.v.gavrilov@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260521150841.20625-3-mikhail.v.gavrilov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0381.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 275d3b5b-6a23-4a89-5cf1-08deb7d9585d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|3023799007|22082099003|18002099003|56012099003|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+jvkC5kI4mBLPRUWdcYQE19yCVx7sQxZFdzf5sVjHo5GTko4NZv6AdYpnyeeJam9P/cVt7GrsiCH/VcYYE8dLINihSsuKTLiE57/HrsngHAGz/T0PiId0//ht/0v1+VVV3+3DspoPYvdGBaKjaKD1qWJbPpzdbQ3ic6FE7tWX0KOidq6QQbK9gNoKfIrPSl3XeSkJyZYJg4DW8ppO+TA8v48gPtq/jwgzWaOiaebRbXxVn3kBt9X4EIW2jDP3Fu3mPDPnb0pWNdoTWe+lxM7RMtjXy2LkPqqwwxVY+cHAmLvLtY7HOxCMO05vpY+FSrL6FQNdyqB5EgwB2QabFJNOYHTt2N7Alje4yH+DFvxPgvZJoRkHyh8O6zB/bebuMCt6x3RfpaEKv7MNmvt0To8DPDdwMJztTIu1wNfZw0SLw1aAiYN46vo4n3MeBdXZ4+JJlsnJKcGqO9pcoofcQgBANccM94BtzTHD3nOwq2bJ4AcvmLy87WR8KNOB4VhjxGUv9F2Rz6XNamB++Kkqbj2coSHxiSZ34SQk6EVzMnS2vDGPocZPH/kjBTjxXv9Yn2e24XEQRGgbXy5ScRQGAWZnq1yg1QesBHkmf0XNV5SkeP2jIvasLzdI74nxO6ThTFIMjpZ8rWM1zkhmWs24eUf489krfmulx86qxSQe5vyPSTBw5daJS7ThxxMogflm3eI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3023799007)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlRST29VbkdqQlh6bjVubXo2NFhCK29XcDRhNU5qTGVyR1ZaTlhYQzdhSXpD?=
 =?utf-8?B?RlZVVXRuSmYra05TY3FqUHgrdGY4L2RsbDJWa1hSRnNXTGw2RTdSR3B3QWlx?=
 =?utf-8?B?NUFqeW5aZnRwME1ELzBlRW1kQlVtQ2tNaUtyZGV3UFNGS1VVK1g4a3R5N2tE?=
 =?utf-8?B?bXh6Q1hOYllCamI5Z2p4Y2xPVVJBRDJ2VUR5SmVDYmEzZU4vN0ZjWGxaWmZl?=
 =?utf-8?B?WU1wSXJuRFRhTDRuKzVwYmc2YjZKdGI4VEh4VlJRa09hYjRHU291REZaMXBU?=
 =?utf-8?B?cGdncUpTZkQ2T014ZVJZWThycU5tR0tqYUJNbHJ4d2tSV1lKMnBiT2c4UWV2?=
 =?utf-8?B?OHpHWWNaQ01kT1I4ZTh6cXU1YUdzdUxMckxhVVN2anV4cHVLUW40QWdqR2F4?=
 =?utf-8?B?dXVSd2YxOGRnVlhqUElGN01pQ3ExbFZlb3R4TDVoTU04ZUpmcjJGekRzai9S?=
 =?utf-8?B?YW9GYmNuaW9ueXFmeTl2MzhMb0pEK3FuVDM1QUFGOGpRMUt4TCt3eVRmYUhR?=
 =?utf-8?B?bVZBYVdibG1RUDNtQmlIVDdHcUN4TWFEMm5kTnFQRzZ2dHFJczlleW5Vd3ZN?=
 =?utf-8?B?andIeHJSa3pNSk94cXlJSDNPemNoV2hFR3dKMVdoaFlHRVdqQUFObVBjQVR6?=
 =?utf-8?B?WWVMVXFYMVo1V0ZLV1g0QzBoMjhZWDFYTXhrWml3R0dZU3g4amt1T0RUQTQy?=
 =?utf-8?B?UGtBM1RRZkwvTHVlOEV6c0xrMXNSNlE3aU9abzNTTktnZmNxTVFvMlJ1R1BX?=
 =?utf-8?B?QThIZmpmMXBUVG91NkQyeDA3MEtwa1lBWGUwOHlCMm9jZ0ZYR1o4L3ZZTWpm?=
 =?utf-8?B?bG9kbHhlRUtkNUlVZE5YcFRlZjJkRFdSRFFLdHY2a3dKdzhZSHBDNEYvZGZJ?=
 =?utf-8?B?K283bFBLV2o5Y1FvSldBb2lFUHFjVmxjMThmSjRlN3dITXRydzMyQ1lGNmhn?=
 =?utf-8?B?eElPbnZ4Z0JhaGNXL081UTU5M2QyRGd0V2M1SFRYbFJoKy9NdmFEQ1UrQzlq?=
 =?utf-8?B?YnI1OHl6dWRSV1kwVzM2N0NtcjNXVlAyZzRrU2h3N3VTTmQrWDVpNDVxRWVF?=
 =?utf-8?B?aVhXMTM5ZkxJZWhtRXhVOUZwR1JBZnJaSVJNeXkrMlJ0S0xCZWFzcHlmNi9z?=
 =?utf-8?B?T0IzOStIUXFicmNBS1dsQ2s1bkpYQ2p2Wjh2RXlNVlFwZG84SGppTC9rMkRn?=
 =?utf-8?B?QmZ0WFlwcENZaGgzRmtSOWRCdFNkR3ZCTTNQQ0xIdm1GTzlSam5TUkpnV3FM?=
 =?utf-8?B?d2xvSVhhYXgwcFIvM25rMXc3cHRkTWlySGRKcWUzVVZoVzh2SVdCaWZCbXVo?=
 =?utf-8?B?NEh6a0wwTDZlK2F6S0Rad1JHRko2RzhHc0w1RlVXZ0YvZFg5aVlaaCt1M2di?=
 =?utf-8?B?a0lBM0hQS1ZnaU5hTnhIdC9Ra2ZpOElVMHROeXZ2K3dvOHVyS0JiaHdJMnNx?=
 =?utf-8?B?aG1Zc3dQWmFxcUh2YWM5UTN1eXBGYUwyVkoxaDJzZ2ZXUGd4QjFoRmR4NWIr?=
 =?utf-8?B?VnRnaEFwMTE0RGdTTDJJMW9pNURNaXVuQVo1ZzNHUUdQdkpGS0k2M3QzYU1t?=
 =?utf-8?B?NG0xUnJSMmYrNEdFSFBiRHhtalBNRExFb0ZRNWVWdWVJMVFaZGdKUnI2MVlV?=
 =?utf-8?B?aDBWWko1WE96WHdKakZkRHBZM2V1dTUvL0NvdXZrRmRDUEEveXJLSjRxZHZj?=
 =?utf-8?B?SGFmcm5aTWlTUzk3V1pKRE40VEV4Rnlxc3lmMVg4NHJ3Q1JzOHVTZHpQZ2dS?=
 =?utf-8?B?NklNazluYi96SXVUQUgvcXM5ZzAvRjNVN0J4Z1NMemRBWkNPMXdVckZ3eVZk?=
 =?utf-8?B?NHU1c2wxczV4aUNXOEdHaStxTWZZMmhtQ1F2NUp4aGxPbkh3SmlkTm1Zd09V?=
 =?utf-8?B?MGZKZkswNWY0SVcrOFMzRkxsRTFlZmN2YW1ma3N4djVrOEpUbDhZOUFaaDZF?=
 =?utf-8?B?ZU9HbHc0TVhVUWZvRnZObUduei9RakdXUTcyWGtoV3VqUW1TQTlid242cUkr?=
 =?utf-8?B?d2F0SDA1cHZybUtDdTVyQ01mNkNIeWZ5MU0rTWpmcno0aWovK2dRSE9STDhT?=
 =?utf-8?B?b21uQzJDN0hJQUlFbW02WExJQUY4enlHOGU3ZUppTUZNdnp1aXNXOXhaR2p1?=
 =?utf-8?B?NG9ZbkZLaG9KblRJTmxRSW1IQjJEM0VoMGFsbWxTL2VTeDBxYklKSHFuMlcx?=
 =?utf-8?B?SXRuMmJhTjJsdkV6bmczZVZuYmtkOUVpbjNWZjJTNUtvK2E0UXNQeEJhUmRC?=
 =?utf-8?B?UkdOMVVzSFg5LzlteVJpMWZCRUIvZzVGNFY0cFBValhXL2laQ1dEc2c3SHg5?=
 =?utf-8?Q?x/j/UZnC0zsIELjSnz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 275d3b5b-6a23-4a89-5cf1-08deb7d9585d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 08:08:45.3038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FzHmsVXpcGCJ9jgJzgfTMT5JD1w/AzndLwhD+6W3XlTEVS3dNxU20F+VH/qS8Yv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7214
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62566-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org,vger.kernel.org,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7FB655B05CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 17:08, Mikhail Gavrilov wrote:
> When dumping IB contents from a hung job, amdgpu_devcoredump_format()
> acquired the VM root PD's reservation via amdgpu_vm_lock_by_pasid() and
> then, for each IB, called amdgpu_bo_reserve() on the BO backing the IB.
> Both reservations are reservation_ww_class_mutex objects and neither
> used a ww_acquire_ctx, which trips lockdep:
> 
>   WARNING: possible recursive locking detected
>   --------------------------------------------
>   kworker/u128:0 is trying to acquire lock:
>   ffff88838b16e1f0 (reservation_ww_class_mutex){+.+.}-{4:4},
>     at: amdgpu_devcoredump_format+0x1594/0x23f0 [amdgpu]
> 
>   but task is already holding lock:
>   ffff8882f82681f0 (reservation_ww_class_mutex){+.+.}-{4:4},
>     at: amdgpu_devcoredump_format+0x1594/0x23f0 [amdgpu]
> 
>    Possible unsafe locking scenario:
>          CPU0
>          ----
>     lock(reservation_ww_class_mutex);
>     lock(reservation_ww_class_mutex);
> 
>    *** DEADLOCK ***
>    May be due to missing lock nesting notation
> 
>   Workqueue: events_unbound amdgpu_devcoredump_deferred_work [amdgpu]
>   Call Trace:
>    __ww_mutex_lock.constprop.0
>    ww_mutex_lock
>    amdgpu_bo_reserve
>    amdgpu_devcoredump_format+0x1594 [amdgpu]
>    amdgpu_devcoredump_deferred_work+0xea [amdgpu]
> 
> The two reservations are on different BOs in the captured trace, so the
> splat is a lockdep-correctness warning, not an observed deadlock. It
> becomes a real self-deadlock whenever the IB BO shares its dma_resv with
> the root PD (the always-valid case, see amdgpu_vm_is_bo_always_valid()):
> amdgpu_bo_reserve(abo) re-acquires the same ww_mutex without a ticket
> and blocks forever.
> 
> With amdgpu.gpu_recovery=0 the timeout handler refires every ~2 s and
> each invocation produces this splat, drowning the kernel ring buffer.
> 
> Now that amdgpu_vm_lock_by_pasid() takes a drm_exec context, lock the
> root PD and every IB BO together in a single drm_exec ticket.
> DRM_EXEC_IGNORE_DUPLICATES handles IB BOs that share a dma_resv (e.g.
> always-valid BOs, or two IBs backed by the same BO). Every lock is now
> a top-level acquire under one ww_acquire_ctx, so the recursive ww_mutex
> condition is gone, and the per-IB amdgpu_bo_reserve()/amdgpu_bo_unref()
> dance -- including a BO refcount leak on the amdgpu_bo_reserve() failure
> path -- is removed.
> 
> Reproducer (~150 LoC libdrm_amdgpu): submit a single GFX IB containing
> PACKET3_INDIRECT_BUFFER chained at GPU VA 0 and wait for the fence. The
> TDR fires within ~10 s and the deferred coredump worker produces the
> splat above on every invocation; with this change applied the splat is
> gone.

That commit message is a bit to long. It should describe the problem and the solution and not necessary how to reproduce it.

> 
> Fixes: 7b15fc2d1f1a ("drm/amdgpu: dump job ibs in the devcoredump")
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 105 ++++++++++++------
>  1 file changed, 71 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index d386bc775d03..456ea9911d48 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -24,6 +24,7 @@
>  
>  #include <generated/utsrelease.h>
>  #include <linux/devcoredump.h>
> +#include <drm/drm_exec.h>
>  #include "amdgpu_dev_coredump.h"
>  #include "atom.h"
>  
> @@ -214,13 +215,9 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
>  	struct drm_printer p;
>  	struct drm_print_iterator iter;
>  	struct amdgpu_vm_fault_info *fault_info;
> -	struct amdgpu_bo_va_mapping *mapping;
>  	struct amdgpu_ip_block *ip_block;
>  	struct amdgpu_res_cursor cursor;
> -	struct amdgpu_bo *abo, *root;
> -	uint64_t va_start, offset;
>  	struct amdgpu_ring *ring;
> -	struct amdgpu_vm *vm;
>  	u32 *ib_content;
>  	uint8_t *kptr;
>  	int ver, i, j, r;
> @@ -343,43 +340,84 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
>  		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>  
>  	if (coredump->num_ibs) {
> -		/* Don't try to lookup the VM or map the BOs when calculating the
> -		 * size required to store the devcoredump.
> +		struct amdgpu_bo_va_mapping *mapping;
> +		struct amdgpu_bo *abo;
> +		struct drm_exec exec;
> +		struct amdgpu_vm *vm;
> +		u64 va_start, offset;

It's probably a good idea to put the IB dumping into a separate function.

> +		bool locked = false;

Drop that variable and handling, it is superflous.

> +
> +		/*
> +		 * Lock the VM root PD and every IB BO together in a single
> +		 * drm_exec ticket. Reserving the IB BOs one by one while the
> +		 * root PD is held would be a recursive reservation_ww_class_mutex
> +		 * acquire without a ww_acquire_ctx, which trips lockdep and
> +		 * self-deadlocks for IB BOs that share their dma_resv with the
> +		 * root PD (always-valid BOs).
> +		 *
> +		 * Skip locking entirely on the sizing pass: it does not write
> +		 * IB content, so the size estimate doesn't depend on whether
> +		 * the BOs are reachable.
>  		 */
> -		if (sizing_pass)
> -			vm = NULL;
> -		else
> -			vm = amdgpu_vm_lock_by_pasid(adev, &root, coredump->pasid);
> +		if (!sizing_pass) {
> +			drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES,
> +				      1 + coredump->num_ibs);
> +			drm_exec_until_all_locked(&exec) {
> +				vm = amdgpu_vm_lock_by_pasid(adev, coredump->pasid,
> +							     &exec);
> +				drm_exec_retry_on_contention(&exec);
> +				if (!vm)
> +					break;

This should use goto error handling, when we can't find the VM we should abort here.

> +
> +				for (int i = 0; i < coredump->num_ibs; i++) {
> +					u64 pfn;
> +
> +					va_start = coredump->ibs[i].gpu_addr &
> +						   AMDGPU_GMC_HOLE_MASK;
> +					pfn = va_start / AMDGPU_GPU_PAGE_SIZE;
> +					mapping = amdgpu_vm_bo_lookup_mapping(vm, pfn);
> +					if (!mapping)
> +						continue;

That's also an error, it could be that we just want to print the IB start address in that case.

> +
> +					abo = mapping->bo_va->base.bo;
> +					r = drm_exec_lock_obj(&exec, &abo->tbo.base);
> +					drm_exec_retry_on_contention(&exec);
> +					if (r)
> +						break;

Dito 

> +				}
> +				if (r)
> +					break;

And here as well.

> +			}
> +			if (vm && !r)
> +				locked = true;
> +			else
> +				drm_exec_fini(&exec);

Don't call drm_exec_fini() here.

Regards,
Christian.

> +		}
> +
> +		for (int i = 0; i < coredump->num_ibs; i++) {
> +			bool emit_content = sizing_pass;
>  
> -		for (int i = 0; i < coredump->num_ibs && (sizing_pass || vm); i++) {
>  			ib_content = kvmalloc_array(coredump->ibs[i].ib_size_dw, 4,
>  						    GFP_KERNEL);
>  			if (!ib_content)
>  				continue;
>  
> -			/* vm=NULL can only happen when 'sizing_pass' is true. Skip to the
> -			 * drm_printf() calls (ib_content doesn't need to be initialized
> -			 * as its content won't be written anywhere).
> -			 */
> -			if (!vm)
> +			if (!locked)
>  				goto output_ib_content;
>  
>  			va_start = coredump->ibs[i].gpu_addr & AMDGPU_GMC_HOLE_MASK;
>  			mapping = amdgpu_vm_bo_lookup_mapping(vm, va_start / AMDGPU_GPU_PAGE_SIZE);
>  			if (!mapping)
> -				goto free_ib_content;
> +				goto output_ib_content;
>  
> -			offset = va_start - (mapping->start * AMDGPU_GPU_PAGE_SIZE);
> -			abo = amdgpu_bo_ref(mapping->bo_va->base.bo);
> -			r = amdgpu_bo_reserve(abo, false);
> -			if (r)
> -				goto free_ib_content;
> +			abo = mapping->bo_va->base.bo;
> +			offset = va_start - mapping->start * AMDGPU_GPU_PAGE_SIZE;
>  
>  			if (abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS) {
>  				off = 0;
>  
>  				if (abo->tbo.resource->mem_type != TTM_PL_VRAM)
> -					goto unreserve_abo;
> +					goto output_ib_content;
>  
>  				amdgpu_res_first(abo->tbo.resource, offset,
>  						 coredump->ibs[i].ib_size_dw * 4,
> @@ -391,12 +429,13 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
>  					off += cursor.size;
>  					amdgpu_res_next(&cursor, cursor.size);
>  				}
> +				emit_content = true;
>  			} else {
>  				r = ttm_bo_kmap(&abo->tbo, 0,
>  						PFN_UP(abo->tbo.base.size),
>  						&abo->kmap);
>  				if (r)
> -					goto unreserve_abo;
> +					goto output_ib_content;
>  
>  				kptr = amdgpu_bo_kptr(abo);
>  				kptr += offset;
> @@ -404,23 +443,21 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
>  				       coredump->ibs[i].ib_size_dw * 4);
>  
>  				amdgpu_bo_kunmap(abo);
> +				emit_content = true;
>  			}
>  
>  output_ib_content:
>  			drm_printf(&p, "\nIB #%d 0x%llx %d dw\n",
>  				   i, coredump->ibs[i].gpu_addr, coredump->ibs[i].ib_size_dw);
> -			for (int j = 0; j < coredump->ibs[i].ib_size_dw; j++)
> -				drm_printf(&p, "0x%08x\n", ib_content[j]);
> -unreserve_abo:
> -			if (vm)
> -				amdgpu_bo_unreserve(abo);
> -free_ib_content:
> +			if (emit_content) {
> +				for (int j = 0; j < coredump->ibs[i].ib_size_dw; j++)
> +					drm_printf(&p, "0x%08x\n", ib_content[j]);
> +			}
>  			kvfree(ib_content);
>  		}
> -		if (vm) {
> -			amdgpu_bo_unreserve(root);
> -			amdgpu_bo_unref(&root);
> -		}
> +
> +		if (locked)
> +			drm_exec_fini(&exec);
>  	}
>  
>  	return count - iter.remain;


