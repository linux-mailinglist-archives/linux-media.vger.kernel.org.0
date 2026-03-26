Return-Path: <linux-media+bounces-57144-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEzqDmYsxWnb7gQAu9opvQ
	(envelope-from <linux-media+bounces-57144-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 13:53:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA2033588A
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 13:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F073730547D1
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 12:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4962023909C;
	Thu, 26 Mar 2026 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cyAxGiXa"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010051.outbound.protection.outlook.com [52.101.56.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F8421D599;
	Thu, 26 Mar 2026 12:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774529297; cv=fail; b=XcgNxVDUxDFYckdyUZ72IFzd8kEYGNJgkxTj4vcmElZHY9AHGeCTAiV8TeZ6D+yI2wBUgliHFJvUJG6oy6Ry4sefMQNzqZv5fD6zM2cIK2n794PqoEL6Z6Rgj9Y4YdviLrKYHzN42IXjddglqu9XarRDudIWHKXP7gkcm0GX5U0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774529297; c=relaxed/simple;
	bh=T51JGODEOhA0f41vprAJ4/0W/VhNTQfqNUDsenG44vs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NYtjGOpHp1/lzBoiSF30tuNjRWAjptypnFkNpzQVizHtsDcGL/8XJbFY2Yv3RmKvgYfOLpSwKDZgb4vz2O57DeRf6Bhb+8bmsb5SfxXw9bnnvFmLrvkibOuHPMf/RS2d17h+SbZgtNW04Oxa75H1Uo+yxR/z5oeNV2XAIMgQ0x4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cyAxGiXa; arc=fail smtp.client-ip=52.101.56.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRHLIavLkWzWX7Z/CcZa4n3WFrJIN6oi5X4pNIuI8jHHulCNHWeJkGVjiWO4sTcDl7T250N2yivBerPjpTz6eckMrsneeqs2LZKZIbYdO8r4JI1WmzildaK0Ob0CplYE+y4zMS1lTH6NXIjtWO/xUVMuVKI8fL2vqTqsxHZTiVni/GEt6wHZy5QlOxeHFYzg4iknCFGdjvjPXyqFjb6l3WcK6a68Lw6vcHCCCAF6vAURXtjsVHsIbWa88BPibbmcWS218wKeiPb6PCWaW4gCbefOWvG0Dse+8LeXPwSyTu+MJZYmTV10k1RoIrbGZhagKW5HokEIzY2EcoMmOhnKoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3O506dJcL1pShLqRQGTt0zwEjCwSVvtPKVRf9aHZLE=;
 b=AFPghjfDsEHD8TNeA/tkgtQE9aRvRLLFLN53C+vkT8fi/NnzsABcB0QJZatqfkGXIr9tdS+6UmUnIwzJck0cRE9T3ea6j2zWn/ymx65LfDZPzqumJSp9aybUNvvi0ZwAT5ZJ0D8/J5qlUTdmL6aH4gM/RaAiw1D3Rygek6IXpld4LvgPESNi6B/hRBI1Dgjs+7byZKBxdkMV+g8CzaIFtXkw9WQNCg0xOBi6gj42hKKrwz624kAcekBdp+bvb0aJ2MoivzytyZMF8gOBKC45Vvl6MxP2es7lXZyUWI/xLp1aqLnq/vsQeO6q1P0xMuoN5Is7hUwq7gQ++JgFCu+pjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3O506dJcL1pShLqRQGTt0zwEjCwSVvtPKVRf9aHZLE=;
 b=cyAxGiXaMcf+WW0w7dSMGyqQnNYQZbUM6ytEbsR9a6RUUiiyrfivswrI2EttHWLEu8aG3hppTOGc6clh3yOWzifmantrtSPKOnE5MUtb8Na/B+rPPFvnc5MuEHzb9DAEtgipgFDsELmeEGFWuzJoj4hwG5KWr6MfSDTbxvJ0Zwg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9207.namprd12.prod.outlook.com (2603:10b6:408:187::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 12:48:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9769.006; Thu, 26 Mar 2026
 12:48:12 +0000
Message-ID: <ca366b4a-ae51-4387-b0e7-86e9844b01e1@amd.com>
Date: Thu, 26 Mar 2026 13:48:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/12] drm/amdgpu: use all SDMA instances for TTM
 clears and moves
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260203102236.3456-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260203102236.3456-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9207:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b911031-1fec-4645-069d-08de8b35f0b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0MvPLb7L2ImW0qO5qq+dBxRNE0V1uSR5B4gTdSJLCcrrP1FB0KyQG4VnXMHETR/1bzRiS/7gO0T4hr6NsRdgafJIbCDHlQ/x2iUPtW+urDHNi6rTEUZZCUfNGMtLcAuxaA2m9Airw2qCVHYYRjoKDoQJgt+TkjG9uOUqA83ZcudBwfgIX8yf74k/c0hT1FbnHrnGfU3lXsUGv3H+8dP51Rw/re7U1Ham/KbJBDurkftNHt3fIg20vXaoTQ1UlU7h7HHRKlsItRl/EQc4eY3u0CvhSgJrR6qLuD/haEeBsGA9AZoVcsOZzycNfNHQVM8JfqD8Ai8f8/SPJ6EbysvUfEBcSZNQ7Km05sLYAkj+XQyepwkWZW3NG8drg13EWPrukF7CMAv3GAJZkv2GxebXbfvZdhy1DJunFhOTk/GJHdxZPRjeXY9DtYXnH23675m3xmsn80FAso2dHSk2nOBtAOX3oH4Cz6nu1BGQRSmbGDvJkP/48ObPlvEir1qWSeQ2Y7gDOfRD2b2+mhdbMsGvJNnIlZ3WPwHzZd5KQ2jxS8n9DLzPXMYLgoCNRgD0Mr4pgvddAYRHu7HeUotFJYZVUMqDqqatM2h+iNF1bXDTrqC2EiorWuC3hImpmuiSEGP/7ludmFbm2vk6e+VPs1HP0mBI02wjtNOVvR/orXxBJVboPcfipCzpZUPohHtIgGF/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V015NngvTmJmYWtKdjZ6ZzRKbzY5S1drWmhUUk82TjdDeFRZdGVuR2F0bWZa?=
 =?utf-8?B?UGJQdm05U2tZRUN4ZFArZkMrVWJsZ1phaUNsZXB4K01VbHhnZXdXbUpZY0sv?=
 =?utf-8?B?Nm5ybDJSMWZkY21iYSt1bTlJbDhTS2g1MjhBRVBjUTJZQWo2NElmRUhKd09l?=
 =?utf-8?B?U3Zucjk2Q0JXMFlvTzg2YWVra0JqWTZJYU5hdTh2SllGTi80Y3NoK2svU0hM?=
 =?utf-8?B?VnlIcVA0Q1RSUjYzeUIyaGZtdlYyeGM4YnEwcVVyT3N0TjZGNFloTy9qbWM1?=
 =?utf-8?B?Vjc1Z2xUWjlFM0ljMjBYNGIveDlva2QyNXRHNWxjS1FIUUVUUmIyWnEyOEhr?=
 =?utf-8?B?WXhBYXY5d1FtQ1ZLV2l0NDVJeVpEb2paemIyVUIrZEFlUENMbFdPS3VxN3ND?=
 =?utf-8?B?UndsRDBMN3dSb21VR0JtYVhHUkt2WkhFelY1UnY0REpHSW5UMlFKOTNXdjZY?=
 =?utf-8?B?NWM5a3VzdjRvcUlLdFV3V2tUbU15eE5GaUd2cEZYNWxIWS8vS3JkTVVsZjhs?=
 =?utf-8?B?cWFGcGpRS2tQR2IyYWhXM2x5M2MyZU5BTXh3cTVaQmFpejhuYlA5Vnp5bnVG?=
 =?utf-8?B?SUZvOXVWWENIMENKK3FZYitDdURyTHhmaXRSU3pqYVZrck5Sc3NrU2JoWVlC?=
 =?utf-8?B?TTJXM0J1UTJkdlQ1R0JuY3V2SVJydEtwU1pxNnNGQUNXNC94RWpBWGYwMTc4?=
 =?utf-8?B?UU9qVjB2OVlhSnVSc3lFd0MzYVkyKzVMY1JNWXFyQkh4M24zYTZnNklMMlVZ?=
 =?utf-8?B?VXpRZ3ZTVFdEZVpGSUU1US9jZWU3OUU5U2JmRmhPVXBWU2pMSVY2U3RjL0Zl?=
 =?utf-8?B?SmhhU0JrNHA2ejJtOFV3eXdJUElFcDlIZ01uaU94TGZ2bUg3RkkydUFSTDFG?=
 =?utf-8?B?ZWZYWVhLK2hZZHRWdXkwYkhGUDVYMnViYTFjRE1ybTkxQmcydWpVTGw2SDJ6?=
 =?utf-8?B?KzQyNnFFYWQyZWMvd1ZKdWlXdERsZXRYV2FVbEhmMnRON201cEtPcTF0NFJm?=
 =?utf-8?B?WVhMWjVhdHFnK2tLWURXbzFvdlkvK2RxenMyWTQzRk1mY3VUNUliaVJoQjhC?=
 =?utf-8?B?QWFPekcxYU9rOEhVdFNEY3hTcmVhOGFEd0NmVXdtb0loVm1lbkJwTGRSZkhP?=
 =?utf-8?B?Zmp4cDlHNDYxdEsvRTQxU0F5NmFmbWNzZk5DaGdYdStwSUVQeG9wRGdnRHB6?=
 =?utf-8?B?VmQ1VWhSaTRkZjBZVkhneDFmc0FSRDVxUVFPQk5GUjN5SXc5K3UyelJNYmVE?=
 =?utf-8?B?ZDIwVkowbmxZOWhIa0xVMTBLRU14K25TWkVQNlhrWXMyNnYwV1ordVNsSjBi?=
 =?utf-8?B?SDhMWGZHdVY1VjI1ZWlZZWZIQ1FNMnBWaDluUkdudTBnRWVmc0JzaXpzZWJC?=
 =?utf-8?B?WFRtLzByVkpHK2diQkhMVkFQVXJKOW4reGk4eHhCSUp4THJMOC9DZG1oNXV6?=
 =?utf-8?B?dVd2VFpGQXRYOWlqSkhTdytCVnhXUVh5bUZYUXUyTmwwczNxbGJXZ0l6cFEw?=
 =?utf-8?B?eE8xZWFRaE1ZQ1lBQldyTllZSGNLN2NHSUtMdHZ0Mi9HWGovdlVlMU1lQXE3?=
 =?utf-8?B?aWVOMnpZNFZ1U3ppUnlTZno2RW9aNjdmNlowODZUT2lYMHJrSm56Vi9xSHhj?=
 =?utf-8?B?T2M4aEdrQS85QmNHMWlRejE3dWdnMThmY0NJdUNLZG5kNWpmYWdYMDY2K0xD?=
 =?utf-8?B?UFNNcTkzRDBjY2xSSE5WMTdNT0NiMlV4NTZMRHNhZnBvV0svSjJSRmxUUFNn?=
 =?utf-8?B?V1dUcVY3bEhxZHhoUmRjZnZCYW5rUS9aZi9qenp4RWFkU0JFNllZeVlUVGNF?=
 =?utf-8?B?UWZPaGJabWdXOVdUQTJiRFN2b29HN0RuUklmT3NHUjIwNU9rV0ErS0gzaFNm?=
 =?utf-8?B?UGh4R1BPQkRTODVJeDYwV0hNdG13SGJ4dGFQWUthR0cyYVhCbm5uL1JpZXh1?=
 =?utf-8?B?S2dNdjFQR2M5ZGo3ZWJBNHg2R3hVVm9OTzVjbnR2eTBIR1FpZW16SmdMaHlw?=
 =?utf-8?B?WUxHdHNRbXAvYlVqZFUrSzJTdzBTYWVlOWFyOWNIbDl3TjhiTGlIQU5Rc3lW?=
 =?utf-8?B?VS9jWnloSXF2SUx0Q0xYanFDQ1hKVUlvNVBiTWlLTUdFeGtyeUw0MjkvZUxt?=
 =?utf-8?B?ckZpTkJVYnl2cVpmOGxOQUhDaXkzbklBYkptVVZZNEdlZXZEZ1grYzA5THU4?=
 =?utf-8?B?V2ZCL1BWZXBWcE13OFNaSlZQZ0N2d1lvanZSNFpxdDl0TUE2YlZmMTFKNHB1?=
 =?utf-8?B?S29hM3VRVTladEUvM0E1eW82eExvTVRsYkRmalNtZGJXSDd6SGFaZ0VabHBk?=
 =?utf-8?Q?95un2f+vJdrSB4s2UE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b911031-1fec-4645-069d-08de8b35f0b6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 12:48:12.4725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUWCJ9tyHaysMu419CKFN1/inIYO6ldAOgMag8ofZwhtVSb8UnWpjXrrATEqbeyQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9207
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-57144-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org,lists.freedesktop.org,lists.linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,amd.com:dkim,amd.com:email,amd.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8EA2033588A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Finally coming back to this patch set here.

Fell free to add Reviewed-by: Christian König <christian.koenig@amd.com> to the first two patches as well and then please start pushing the patches to amd-staging-drm-next.

I probably need to go over the last patches once more, but I think it would be better to have the first few upstream first.

Regards,
Christian.

On 2/3/26 11:22, Pierre-Eric Pelloux-Prayer wrote:
> The drm/ttm patch modifies TTM to support multiple contexts for the pipelined moves.
> 
> Then amdgpu/ttm is updated to express dependencies between jobs explicitely,
> instead of relying on the ordering of execution guaranteed by the use of a single
> instance.
> With all of this in place, we can use multiple entities, with each having access
> to the available SDMA instances.
> 
> This rework also gives the opportunity to merge the clear functions into a single
> one and to optimize a bit GART usage.
> 
> Since v3 some patches have been already reviewed and merged separately:
> - https://lists.freedesktop.org/archives/amd-gfx/2026-January/137747.html
> - https://gitlab.freedesktop.org/drm/kernel/-/commit/ddf055b80a544d6f36f77be5f0c6d3c80177d57c
> This version depend on them.
> 
> v3: https://lists.freedesktop.org/archives/dri-devel/2025-November/537830.html
> 
> Pierre-Eric Pelloux-Prayer (12):
>   drm/amdgpu: allocate clear entities dynamically
>   drm/amdgpu: allocate move entities dynamically
>   drm/amdgpu: round robin through clear_entities in amdgpu_fill_buffer
>   drm/amdgpu: use TTM_NUM_MOVE_FENCES when reserving fences
>   drm/amdgpu: use multiple entities in amdgpu_move_blit
>   drm/amdgpu: pass all the sdma scheds to amdgpu_mman
>   drm/amdgpu: only use working sdma schedulers for ttm
>   drm/amdgpu: create multiple clear/move ttm entities
>   drm/amdgpu: give ttm entities access to all the sdma scheds
>   drm/amdgpu: get rid of amdgpu_ttm_clear_buffer
>   drm/amdgpu: rename amdgpu_fill_buffer as amdgpu_ttm_clear_buffer
>   drm/amdgpu: split amdgpu_ttm_set_buffer_funcs_status in 2 funcs
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  16 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  17 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 329 ++++++++++--------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  29 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |   6 +-
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  13 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |   8 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |   8 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  15 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  12 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  11 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  14 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |   5 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c        |   5 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c        |  12 +-
>  drivers/gpu/drm/amd/amdgpu/si_dma.c           |  12 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |   5 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |   3 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |   6 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  |   6 +-
>  23 files changed, 300 insertions(+), 243 deletions(-)
> 


