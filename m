Return-Path: <linux-media+bounces-49022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F17CC96A8
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 20:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D71F73016373
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 19:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0ACB2E54D3;
	Wed, 17 Dec 2025 19:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lvqCx7sh"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011052.outbound.protection.outlook.com [52.101.52.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AEC2E0920;
	Wed, 17 Dec 2025 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765999798; cv=fail; b=OBU6wqA7Pe10Eb1C6qL+HEwcZKu/S5Gj1uw4rmwxwHlO2a3Srbytp3B4nfhtpvCjSLQfFiuHxs9mOMGK7gfHc5MFwUK1WoyercYYJVecVq67Ti3Ofe8/HkViqP4kxawVI/LlheU079JWAr9+0l/cAf5UlLJp3kglFi9aE2Pg+LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765999798; c=relaxed/simple;
	bh=YAmnkDE+OupOZ5TWQhjvPzDBIyzI9OPOIH+xzVU7CqI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fXdBKKI66lSPMimNjljpoG6t89GaJCwB6uvNMlIcSbPpVnoV4xG0ro2Aiqo8mgLOM0gfXXFEmhhyyaYoGsWurJ2+cg2IjD4jpzWVYAKkJ58HN3qUwLGeSnD36UC7kuV9FuTia4NSIiNOgVN2WQk1grAPc9z4UnkxPyKrb3UgVs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lvqCx7sh; arc=fail smtp.client-ip=52.101.52.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZX3aPkDz0zyYrG8UMd1/r0qkYstcuM0xAuoSLJ35w9MI1hi5kTB6TWggVptYZqaf1TKKaa7mt04AmTo2MeXl3b2LDKiTnnCO3KIcxXn6yhw43peGxRTi50Ac/e5usCJJZMmPUfSMzEQhU3WQZzNi4z9vzH/m/SF1pFGJeUqVeBeyj/jzLd7g/yyYpTmS0Ukwce3WBrxLXJTTebQYyZcFYa8Bn8o4a1I2YvKkWctxJShZNmy3/1AYs/khL0PO2TT5+wWDkhZBERwHhCbprJxKG63EdKJnWnDTMevFxKD5a0vzo7g+Nd76rvk9Fi4H2+XLi8/ayHHCkGKcg3aPNyub5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kS6QlIuOd1G7xfg38OhxwDaRL8hrG3LpZdNn+Z2la44=;
 b=jogMZCy4SD0B3MZG5d3TSrmo3bjcbvfOKh+WLGN6S3U8zH+fJRfoOfA0jqz+QVtM1RUVfU1YctBWURTpXA46Cbz4Fpwr9SkoxjLgFpbk8Bz0EJKH8Ha+H+H42ssGG5/pbeaRWfdeqfHFIAor2YWyHSVuAmrS1dG/TsfZ8doFQMJv5ml2gVPmoUh3hOfg6AWsalzIBRn/CkwkHP65uj7a/nLxzKz+QG3X+sedZ89/FIE9G4xJeTsGjlCk+LrfI/UiTcrhuuisepCu8dkpdfeAG/owWYKE7/wBWcZtf2T48RpvHA4CyXJndfeglb1UkTucMnq2ohNQYrVVv561/Bm0fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kS6QlIuOd1G7xfg38OhxwDaRL8hrG3LpZdNn+Z2la44=;
 b=lvqCx7sh6N92qubAqD3pjQIDYFdZg93GvS5mgYn4ydnLTFacdt24cWGCTc3SdbeKT5oyXBKaVLIy/P3/frbsYk9GA/9368fELvTp+ZzY0rqwu7Qkq/RphqTSgnkF9HmOX445xuGpcGiLSkSy3SfWfGtSNO9Dr9xwsif9CfG3xEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV0PR12MB999093.namprd12.prod.outlook.com (2603:10b6:408:32e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 10:55:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 10:55:30 +0000
Message-ID: <74b416f0-5bc4-40a3-93c2-ed5c5d2b56b0@amd.com>
Date: Wed, 17 Dec 2025 11:55:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: really enable DMABUF_DEBUG by default on DEBUG
 kernels
To: Lukas Bulwahn <lbulwahn@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "Michael J . Ruhl" <michael.j.ruhl@intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20251217102522.2790298-1-lukas.bulwahn@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251217102522.2790298-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV0PR12MB999093:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8cb680-4923-40fa-afd6-08de3d5acb93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFZNZ05LZzJFREY4ZzVSeFQvS2k2ZWlBaGhnUWVHcUF4dmdZaFZpdnlvRDd2?=
 =?utf-8?B?MGM2aWExODdNejBja3hpcFVGVDdLaUs1OWtTcFQwZ2lZKys4NlNXMjlMQmhm?=
 =?utf-8?B?dzhuRUZadCtJdmFQeSt6U2NMTENTcnRCQjJvRzhLOTg0cTZzVFBRNFVLRURk?=
 =?utf-8?B?MjBpRUtnZ05HbW5iRUxEcElvWUREdHV6eUF1NVVlMk8ycUNXSHcvV2R6ZFNq?=
 =?utf-8?B?R0ZnbjNxaHlzdGhWK3BwTmk1VHpwdVlhTnREc1RYay9oWitUb1JpMzJaZXBT?=
 =?utf-8?B?Q3g4YW1MR1pNSHRrd09rQ3duOFBvUWhmMzdWblI1Q1pSRXNubUR1VmY5ZER0?=
 =?utf-8?B?QUd3YWVrSENMNTAycXIybkZyNmdCOFN0dkV1SHVhMkNaRnlyWkx1VEcyejlp?=
 =?utf-8?B?aTVvTldGcUY4cEd6SW9kaDZaWC9IemxYU3EvM3h5YXRKSDJaaVFhU1J2UHc3?=
 =?utf-8?B?UWo1L0NGc2VFSnpuS2xuNlpiNmk0U0w3M29MQVNuRmhUUHdkNGNGbENlQkZh?=
 =?utf-8?B?dkZQTzBuUzhHRmFnUXVBLzFEVVkxUHY5RGx3VWFlZkkzZUpWL0JCNko1Vmpm?=
 =?utf-8?B?d1I2d3dHUnltNHhTSnBWbWpGc09UZjRxdk9mZXVoQ1VCQWI5S25jZExQWFN0?=
 =?utf-8?B?WCtGaFh1QjBjbUVpWVQvMEdKeHVBd09kZC9OMXUwbU1tZkZxQ1ZjZm4wajNR?=
 =?utf-8?B?am1wVklnQnFxVUpEUFgxR1JBejUvZHZZRVpPbGhMR0xzaHZ1b0E1K1BTVkZs?=
 =?utf-8?B?Mmw2djRoR0ZJQkZLYmxaaXFjL3Q2ditrQ2hMN1hnZlBXQTZIdytZTlhsUkZx?=
 =?utf-8?B?MmlrSlVsQ1dVbUpFS0RxT1dRV2YvaWVZUFlaUnZyWXBTRk5OLzZncE1ZQ3I5?=
 =?utf-8?B?RFIybExUTStnL2V5cG1FT3R5QWNFM2p5TERFRW9EUFAvbUx4VjJNOFFEQTVT?=
 =?utf-8?B?MUFwSlA5TmI3bEYxWXhLcFdXRUZQT2Zhc1lxUEZRMHliZ3BVbTNaRkpSSlpT?=
 =?utf-8?B?Qm5XYjl0eXMzRTNDaHozYmF1cmwxSi9XQUFZK2xzcU13Vm5Xa1BLemk3RXBW?=
 =?utf-8?B?VFJub0dtWU1vcGdPcnc3UnhITmFXRXFqR050bEF1a0x2TG8xM0tGSUQrdUJ2?=
 =?utf-8?B?WVdjam90dzNGbWErQkdXbjBiSlVXTEZSSXc1VGREUW1IOHQ5MFFDblZOR1Bh?=
 =?utf-8?B?Zi9wQzZmQkhFM2twSDkvd2wraWlVRXE2YjFHTlRCd24rckFCNXNXUWEwZGw5?=
 =?utf-8?B?MlE1ZHBXOVFrYVVpU2ZiWW4xQ3NKNVdGcXhydlRJd1p4ZkdxbVFqVllhWTU4?=
 =?utf-8?B?TGhuUk9YSVhGaHVkSURiaGxiOTlZU0JkeVJ6RVQxcXNOUTFXV2xxaVdpNkt5?=
 =?utf-8?B?RGxmZzU3cDdySFlLd21KcnFXaFZXOFl0cDlYUkk5THprNVlzclFHYTJxSnNQ?=
 =?utf-8?B?ZlZsdUkvYk01UFZjdnB6SnBudWJ6aUFKVmRBaFVJaU9oMW81U1pNcEo0dFdT?=
 =?utf-8?B?c2N1Y2YwdzBONzdKdS95bldKS3J0dC9PMHh3cU5BdENvZGxKa2MvbjlmbTY3?=
 =?utf-8?B?b09PK2I1KzJPcVc2cTZHU01QVUtWYU96U3hsTS9ZZjRRVG40ZHpCUUtkamNo?=
 =?utf-8?B?QXc5N2dFdzl0NkZtOTRvMFV5Y3RCQXdGdTI0WkhTNUNXNi96MXQvWlRuRmNw?=
 =?utf-8?B?cFIvNnFLbjIxV3dISkV6ZTR2Y09hcnZkelV3MDlGcVNwWnppNzAyR3VsT055?=
 =?utf-8?B?S3d4OHczbmFnTVZLN3REcS9PeThZc25ZV1ZHbzJKN0lMajJFeEpKdjVaVVhk?=
 =?utf-8?B?aEFMdXdaSVNlZ0hBbHRRMWYxc1BJMDVTRDlBR3FjbWtGZlNIRW90bzNNM3hC?=
 =?utf-8?B?djlybHA4blQxWlArK3RiNmsrTlNTQ0lYTUJSU2phVzJjcGhVTFNQZnJxeW5l?=
 =?utf-8?Q?Ff0yf2AsbcxBFZ5T5pYlT6TC2TEuKTc0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWVqSHA2dEtTcFlCVW5TTmhsalNFNXVrVkg3RWlMbS9DQURoZ2JrWEFSb2k1?=
 =?utf-8?B?eURkSC9MQ1lJWi9WSEtBcTZ2NVI0bm5LQlo0RXFQd0hkYmdKek12SGQ1NEls?=
 =?utf-8?B?Wnc4NVFSMTBUS0RmeVZJenBPUnlUNVZpQzdRR2NaK3EzRGRsQW9ZajYwYitS?=
 =?utf-8?B?bjlCN1FHNFBHRTMyb1pML2ZEb3ZnTThQNzBocXZOVnBRMm16SjA4TENlSUQv?=
 =?utf-8?B?cnQydk85VDNzbWRJUWdBSVgyRkRJTVk3RSsxU3IxU2tzM21WOTN1bVJsSzk0?=
 =?utf-8?B?bndRS21EaUpmSWVnc0lIa0w4NlI3elE3Q2szL0FsRDVOMnhQVG43Y2FRbXNY?=
 =?utf-8?B?ZVlQZzFNMDUraDNETm1ySnJCV3JpMXorMCttL1J2ZjdOUFRIaEhJYlJDVTUv?=
 =?utf-8?B?d1Q4OUN3a1RxSCtaVlJCOURBTmpGVVVVVDRISkNUR0RKYm5Pc0ZFQ29OTEpU?=
 =?utf-8?B?KytUeHlpR3VpMGxPdVFVUGQ1UG9hVHlpMTZvWnk5MU1oalF6eVB6VktvTStC?=
 =?utf-8?B?bDhMK1N6WE5Xb3QweHpLSkp3U3BZUitPZURwOFk2NHV2U0pMNm44UWdjckY5?=
 =?utf-8?B?aFJNb1N3aEZlaXh4R3R0MXZ6NXdzTlpjSjE1WHdJSy8vS0RrelJoeFFINFZS?=
 =?utf-8?B?dkxkQXA0V0NkTTNKSHh3aVY5SEVwRFA0dWg1RE5Vb2tLcHhoaitHaTZpWmxj?=
 =?utf-8?B?TXIwSGR4WDBENjdad0NUWnptYkJFS28vOExRMlBVU1QxN0lGOGxrektZWFNv?=
 =?utf-8?B?NlFjUDBtSTgxNlJGUGIyam1FY1ZZbkYzVE9oMGlWN3pJVm1rOWFLMm85b0FM?=
 =?utf-8?B?aUp5ckNpbzNzWXV1N2hQNHQ5WEhPeE9Fb2VVdDZuSTBEY3hpanNPZnlkcUNu?=
 =?utf-8?B?VE0weHVDTmQ2czN3d041cHZxWTVRdzZwcVgvOXpoRDR3UlVhWFlWT282NktG?=
 =?utf-8?B?ekpOWHZnV3JkVG5jN3A0MTI0NGQ2UEhlM3lCMHlXYXR2LzFQME50ckQ4ZEo0?=
 =?utf-8?B?Y2JXRkZZM0pCTHhNYTRaQ0hsTHd3d1hlSU1Eay9rbDYzY1BEZllQQ1RBSHZQ?=
 =?utf-8?B?bFc4UVFneTBhbFhucUw3RWROdCtEdGE0byswMVppdTdhT0xFZ0kzWXFVZ3Rs?=
 =?utf-8?B?T3NsVW52bmNYTkY1N0w3L0VqUEVCTjZyVnZJbHNzTXlxUDA0K0ZUb1h5ZjRB?=
 =?utf-8?B?bW4rMnNtdjJtYWZ4Z2gwK1hldyt6STgwRTNlcExHbmFqbnF5UVBpd2VmajlJ?=
 =?utf-8?B?K3pUOEdjVWhhaHJNWUpDeVNwbEowVkcvb3FsaW5TaGNyK2dCU0VrVE1jWXkw?=
 =?utf-8?B?VXJQVTVkNEI2a1djQ1Q1Wk1yQmJoSTFLWkw5WTJFajQrNHBSbldRd2tJekI1?=
 =?utf-8?B?cTA5M0pVblpESGk0aVEyUlBtSHVKQXN3ZC9rTlllUFpVTFo3VzZLZTYzdEVx?=
 =?utf-8?B?SFVPTWdHckZYN0c0OGxKbVZOc3NTVWFvV3NWeXNzRnRPajZrTEVEaFRuZ3dY?=
 =?utf-8?B?MDh1eUc1WkJUdzkzRm81d1FmWDQ0UHo1cFpsNERvRTg1YU5Qc1VyVi81bmxG?=
 =?utf-8?B?NkFPZFNCQWpBQWRhNG1HM3FETTNOaHFvSWVxQks2Tjgzam9FL0pSMDljREUv?=
 =?utf-8?B?RER6ZDRkT1pMQzhJRkdSVEUzL1FHSy9mZFYrVGFZMFI4RVI2ZWpjaktndU4x?=
 =?utf-8?B?aDE3NkhLTDJ6NEllU2tBKzVqa2pzMk53YzJyeXJoUVBSUWNxOTFzSFJNWGps?=
 =?utf-8?B?L0RUVEQ5VXFzRFI0WkZMWWNlditLdVZEMFd5d2Vld2txYXNQU2xkQml5enN6?=
 =?utf-8?B?OFYxdEhIdXRrcjFVeGJyTVJ0WmVEM24vY0RVN25rTXNQUWs2ckJtem9hRVU4?=
 =?utf-8?B?bmFBV09udExpUEZVRmZ4Y1RuTm1Wc1FYYXdobmNaaVFmdFRId1hROHM0Q2Uv?=
 =?utf-8?B?UVMxZFlyYklSVS92ZmhMTHZteFVwWFdiNUJXcWFaSEF0aXAyREwva0FoYXd6?=
 =?utf-8?B?enNadGFhMjVhbFJFUHV5NVBvOGZWdy80SEpKSzlWcWM4UTBFb1ZrYmx3WmEv?=
 =?utf-8?B?VU84endPdStwczZaeXBJcUxKQllSZ2dDSFBiVkp6b3MzMmZvenhJa3I0eEZs?=
 =?utf-8?Q?XyXBM3IFFg6GTiitoZL9y90Og?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8cb680-4923-40fa-afd6-08de3d5acb93
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 10:55:30.6806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qtros2h6YJ+O1hxPqR3hhDqxPd/epO21m9Anx32uQNQxFSV6d1u/akcN6+8XjN3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999093

On 12/17/25 11:25, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> The intent of commit 646013f513f3 ("dma-buf: enable DMABUF_DEBUG by default
> on DEBUG kernels") is clear, but it mixes up the config option name. The
> config option for kernel debugging is named DEBUG_KERNEL, not DEBUG.
> 
> Fix up the DMABUF_DEBUG definition to use the intended name.
> 
> Fixes: 646013f513f3 ("dma-buf: enable DMABUF_DEBUG by default on DEBUG kernels")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Ah, yeah. I mixed up the C define vs the config option. Thanks for pointing that out.

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index fdd823e446cc..426c9ad3364f 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -55,7 +55,7 @@ config DMABUF_MOVE_NOTIFY
>  config DMABUF_DEBUG
>  	bool "DMA-BUF debug checks"
>  	depends on DMA_SHARED_BUFFER
> -	default y if DEBUG
> +	default y if DEBUG_KERNEL
>  	help
>  	  This option enables additional checks for DMA-BUF importers and
>  	  exporters. Specifically it validates that importers do not peek at the


