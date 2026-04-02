Return-Path: <linux-media+bounces-57981-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OjEFDmfzmlZpAYAu9opvQ
	(envelope-from <linux-media+bounces-57981-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 18:54:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A510738C38C
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 18:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9824530166C4
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 16:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F73B29ACC5;
	Thu,  2 Apr 2026 16:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yNEp1dg9"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010054.outbound.protection.outlook.com [52.101.193.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E703DA7E6;
	Thu,  2 Apr 2026 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775148407; cv=fail; b=WTORVEdRS9vtclLQ/f5YgxN4U1c9+XFSjIyTMmyBwxnleY9IIbp+SSi1lu+xs7a5yo3ZORg7pAsAJtbB9PQNPALHa485rEudbzhUNa9sszZkHrRTs10WZhSjutzUNk9532Xq4z7POwvZZTiWOCSuJZM3yot+6lXU7Q9jn6Wlx1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775148407; c=relaxed/simple;
	bh=7w2fJT77AQBRl16kQL5/2fbdE+jXHtrRSJR+2BMA9R0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qGvYB8qT2KyMkOEC+7i1I4lyTQivj6hD3rEAvWPE1+a3Y2xvW4g4FXyoMUQAWwP3zZ8LWwUgVOyy+PfkGVcdMVScq0mcR2hWZYmzzqzgjm5XsTD6PO/KjdH9IYIONQxqk79+LLnPl2JNFy3Wx/q920+O3NQOyZOapGZQG/jYERA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yNEp1dg9; arc=fail smtp.client-ip=52.101.193.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/blLPM/brIawKymmyJrYTJ26juC/WgSIh7mG1/bUZywnZ4JOB+I5Q3PFSaPMBPPYQE4MzyELTuEtb0V0puzzXBcxMBCjIevh25tpEIp+uT7E7qWxjCUkmkt5e+00nPKPb/6MRYvXwrdsWwAlUtuMIvlkLrbzkfktouuvE1gszrfnyfg+fWfEN1hpryyEZKm2+MtT3lxZzKLvBvM1Og9ZaKDCkLXWBfb5mpNi3ENOvjZiwhT9YqlbvhUS/3YZl2urugMRjcZA8tDI8GpNlDXnWyk2WrqsoDxXO5TtLCOJ6Sf5Tk7yHyL7I1Uxkn90Yj5YpkKc4pGwLWUsw+PadWAIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uw+BV0JDkpZ42U81FKUHF3dOWAEz0NyTCVAYhf9+HXw=;
 b=L4UTBqkMwepLVWlfvdew4dAT/TLFVPkynm22gkoP90DlpA6IP8wVf7jG3ydqkCikqRdDkA8v5k2907D9WNzXnW/wCMJb8Ns/VObJNL8voq4OdaqEJgmiU7zby/vErDY8c6yhLrgHgJG8rXRlX1DyHNegHuMn2CI25ppMPvTOQIaR7H7C8GAtDuYXQ0RnYLeA43y/kT5rdcSgmhqOBQv0ng6fgelI0h+h2XUNzN0LNgZdluLpioEPznrzJt0G2+zDrzMvOQwuS3EHSj2sIek5PAkQpDsRZ+KOMt/ALZtgSXJxzPqL19LTM7EKKlxTR5H43ZUDa8mQjytKklDVa6K06g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uw+BV0JDkpZ42U81FKUHF3dOWAEz0NyTCVAYhf9+HXw=;
 b=yNEp1dg9k4HlLCq52AfsV0K0zbWd4DOvGf5zHGQbRE+z1UaieVPsLpqju/yZrApt/QBdF1EKJHGb+2W/yMwtU8kvUsK8dPxbB80ajjT2SsRPOrz/8SdCctCoGCVMtpaEy0hkn4HmH0x0XwjdcoxHOo9gZK5ZEr3k8w+KT/c3dMY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7171.namprd12.prod.outlook.com (2603:10b6:930:5c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 16:46:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 16:46:31 +0000
Message-ID: <f55ffabd-5f6e-4c53-b2b2-ffea4eccd60e@amd.com>
Date: Thu, 2 Apr 2026 18:46:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/shmem-helper: Add lockdep asserts to vmap/vunmap
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence.csokas@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
 Asahi Lina <lina@asahilina.net>
References: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
 <20250318-drm-gem-shmem-v1-1-64b96511a84f@collabora.com>
 <c8dbb9e2-f1a1-469e-a0af-ba3a5e3a651c@arm.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c8dbb9e2-f1a1-469e-a0af-ba3a5e3a651c@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a321f1-8893-4e3a-65bb-08de90d7649e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dgSE/9slcA8JWHhBPN2cSm+KpMzkO6iUWId2nRoAvQFpS2RTNAFFRo597XpwlXZHvOG9izC4Mh3OlOczxvinD9BALzevisIXRw/3v0ykVvdZDyHlwK81SP5phZlqdoTz45i7StpFz+H/eno0lEXpoZVxUPAiZaWC6WUCy+0n5qAMm/1U0eDseIGvouY4r/rXTr2wjxTXz7A55gIzZ/xoePjkD7XhotZxzmjRb0T9/KDU2hr7jQvA11Uj2zmWndYSbHi1968yG5rLp5spZuVaSSA8ceUiOPGZEzyqjIPUppwUb4i3qfHhVLMmBrfg+HIRmP3lBifXUlfGHL/H5pUTGWCuXrne8mFZ8scP6hPpoD6M/bxspBU0igaFlIFLt1wkdegb7jFf7Ffsf29ODDQ3vgS1Ncvcxg6WW4vQMb8chlra+rOgAYplux6y5my2ghU10SC63IGV2fRgl/ePFZHdyiUWmbuhZsL5djQq8YvqL6dqfIeTMe1wP3ZqgowiviMGAYAHngogCOs3nwCFf/aRNP+WJxxjqi6+bb9hCCceUE3dr//dFbJa5g5BT7Y+bZIF/4BJY2xYkz4FXxqNUD+UA9BBnx23xyD8NYpbh/p3w6+8ZMyfWdMYKR8G4dVnTlOOj8grn152wYgBkYLDfu0Gtsfpp073C7XASTRcr2HnLDxW7b3Ijw0aQi1qedi/F38lEs0X3c6T38Y40k5bk0QUIFY8wBrk6r0YClFhZFNoQNwQklLJ9aH7BNfpFKhcqSOTXSGASKyWhHfbEn/yQndEbLZF4bGB0EIGWabFYBNuIIE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjdHOGNaUTdGVWRmZCtsWk85bFFERVR1UzQyem1TRW5ZMlVURHhFTDY3T0tV?=
 =?utf-8?B?blZSdytqWUowUXd4S3NTTkFQc1ZmRXpMcm1IbzNzOE5OSG1qTHEvZ3YzcEtQ?=
 =?utf-8?B?SHNSb2Q4M1FmaTgzSk9Sai9NVUpUQXZNMlI0NWljTTdFbGFRQlM1MURxeXEv?=
 =?utf-8?B?MHVkOEdzV2NGc092YjRORzRrdmFUZUVwUDZabFpNak51NE1oWjJHU0dmdzVk?=
 =?utf-8?B?bWVoVDNDTm9mSmlwQmhWWjZTV1lhdXlaaEk4clVySk1zY2VJbDZWenE0S2I0?=
 =?utf-8?B?aVhBNzdsNFFZN3ZoQk9qeHMrVVJLTlZLR1pQNzRtbTZJZFRmTmVvcjU3aGU5?=
 =?utf-8?B?Z0tTVVFtL0crTlFrSXpjd1JyT2ZHMmdyamVUakZJazdTNWJLNTN1WTJYZHNK?=
 =?utf-8?B?RGR6WWhiSHlleE1tNXR1QktoNmhXRnl0LzBqNXVSTUxHSE5tdUFVN2JQRWY1?=
 =?utf-8?B?ZmwvcVgzekN4cGE4b2JnRC9idGxnUEFzYlo4YTAyakErN1IwVjRZdGp5ZDVL?=
 =?utf-8?B?UHBtL1FQajA2aE5hUTByZjJ2dXdaMTdNRmJ4NFpxVm51SmYvbVNFWFFWNnVs?=
 =?utf-8?B?QW56dnltdXJvZkdUTFhxLytOeksyUzhSYmFsV3hjUzdURlE4ZGhIRkxZaUJD?=
 =?utf-8?B?UEdsT2hHWnIyL0ZZcTFkYmhWRG5ZYUZYMjhpRjhnRWRqS0hveDBxZHZsdE1k?=
 =?utf-8?B?SG03R0RUM1N5VXBYRCtvazZkbWQvdnhzRDhGY2o4UVVZWEMyL2VoRkt1cGRM?=
 =?utf-8?B?aFV6bFEyWmp4bTZQR1Zub0hUY1JXZkR2N24ycmdCYTZHVDRvbUJKMlpJSEx2?=
 =?utf-8?B?T1U1KzJxTEJxay9nazVxVS9vRmx3SW52cFpkRnRUSWg4bXNoWVZINWlZQWcv?=
 =?utf-8?B?OEovT01xeGpNYXRFSDVOU1VwNE80bm9EMXR1b0xtM2Q4QW5yUHk1R000SDVn?=
 =?utf-8?B?Q25PNGZNM3pFQklubmYvTnhGTVo4SGhySUVkS2ZqazBmU2ZRTlhNdDlWVlJq?=
 =?utf-8?B?d2pUNVJBaDMxTEtWcUVralVaRzFpcDFxTXhhTTVkcVVjYnlHSXlXamdQcE1h?=
 =?utf-8?B?L25xTndCVTJDQStKTVdTajRTdjZxUTF6ekZnWjFJb0lPdEdERzRMcVFTT1V3?=
 =?utf-8?B?K2dkNEFBT2xVcHg2cmUrdXMrZ0ZIQ05UTnBmbDdjV2RaYXJpWWlDOUdKbmMv?=
 =?utf-8?B?dFFrb3ZnTmZQQTJRQVhMM0tsbDl2eVdQd0ptOWpMQk04c3hJVk9hK0dtWkhL?=
 =?utf-8?B?Q21HVjh1elArUWRZU2V3Y1FKQ1NBdmNGVUtoTWZaL2dYa0ExbytmOFpGQk9r?=
 =?utf-8?B?L3I0TXpOMk5lSElQQWVteXA2VzJUQkZETDcwVEFacERlWitqcEZObFBpQ1Ur?=
 =?utf-8?B?NTBhRStCaFZYSWltYVl3QnNSSHp5ZXNueVNUSy9TY3l6RjgrRkhRaW1SYitt?=
 =?utf-8?B?YjR3ZmFEQnJUelRSbWZjTmV6UnFXcldaUHFHMlh4Nk1DSUdIWVFMWVlUUW9s?=
 =?utf-8?B?MGlidEZBcTRibkxXWHJ5WmpLSlExM2pKeDVwOER0TGhOZGpYanRsS1RxaGpw?=
 =?utf-8?B?SldOeFJNVTdSQTNhN25VcmlHWCswUUJSTzhkRUJNUWhRQVg1N3VqR3d3RnNz?=
 =?utf-8?B?Y1pRQXljQW9nNTRrajljUHQ0ckcwMXdIZURQRFBDRVhyOTEwZkdPck1oQjRT?=
 =?utf-8?B?V1huQStUOEJiUWlrQzdOMWpRNVlURmNRVjF4RGU4bTJWMld0VVl6S0NuWkVt?=
 =?utf-8?B?endRYTNnWmxmcTBhbmZqMCt4YldxTU1mc0pkU0JGR1FrUTc4a1hDZiszZWxD?=
 =?utf-8?B?MlNtWFRqMkg3Z2ZzQkxlOEVmT0pQdTZ3MVFoSUpFdmo3Q0NvZmgzaTlmUjd6?=
 =?utf-8?B?M3o3Q1VnZUF6WWJNRS9lQ0pxZnd5bUE2Nm5yY2dzUWhTT3JGcDVhdXJtLzBm?=
 =?utf-8?B?UFc3Z3F5UEVJNEJkcFQvbk5kSkY2ZWFObU9hQnRPRFJPazFTTkkwRUNvWjFw?=
 =?utf-8?B?ZWRkNlFleld6NHE4MnpPcExHVGhLb3E5WDQxSTg0Mm1xcy9qMUhWRWVSMU92?=
 =?utf-8?B?b29nODFtSDJIbzR3MXh0bUZEdzJEK2pLVTJOa1lPNXN0YlZ3VUxHZkNRTlZV?=
 =?utf-8?B?c2ZtUHduL2tzRHY5UVBNLzltVGgzWm83WUo0Vm5rYXZRbjF1MUVqWERUclVK?=
 =?utf-8?B?TVRpc2c2NkdHMjNGSFQxZDRJdHpxYVRNZjdXcnhXa1JmcmZEQktPcDlQK29Q?=
 =?utf-8?B?a1lZNWl1L2d3Z2V5L1hZcVU4azBZTlpNcUU1NG5WNlI3L0JudDhDSk9ueGJq?=
 =?utf-8?Q?ai6h9UE9d3y4z2k5Yf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a321f1-8893-4e3a-65bb-08de90d7649e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 16:46:31.5235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uozu1pnEa8dcR9cxctJnOS9r913UtJU8qnJDEybD00KqZ/nL5jKI1HPCQ6I8uO2/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7171
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57981-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,garyguo.net,protonmail.com,proton.me,google.com,umich.edu,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,amd.com:dkim,amd.com:email,amd.com:mid,asahilina.net:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: A510738C38C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 18:13, Bence Csókás wrote:
> [Sie erhalten nicht häufig E-Mails von bence.csokas@arm.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi,
> 
> I just came across this commit while researching something else.
> Original patch had too few context lines, so I here's the diff with `-U10`.
> 
> On 3/18/25 20:22, Daniel Almeida wrote:
>> From: Asahi Lina <lina@asahilina.net>
>>
>> Since commit 21aa27ddc582 ("drm/shmem-helper: Switch to reservation
>> lock"), the drm_gem_shmem_vmap and drm_gem_shmem_vunmap functions
>> require that the caller holds the DMA reservation lock for the object.
>> Add lockdep assertions to help validate this.
> 
> There were already lockdep assertions...

Good point, I completely missed that.

> 
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Lyude Paul <lyude@redhat.com>
>> Link: https://lore.kernel.org/r/20250318-drm-gem-shmem-v1-1-64b96511a84f@collabora.com
>> ---
>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index aa43265f4f4f..0b41f0346bad 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -341,20 +341,22 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_unpin);
>>    *
>>    * Returns:
>>    * 0 on success or a negative error code on failure.
>>    */
>>   int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>>                             struct iosys_map *map)
>>   {
>>       struct drm_gem_object *obj = &shmem->base;
>>       int ret = 0;
>>
>> +     dma_resv_assert_held(obj->resv);
>> +
>>       if (drm_gem_is_imported(obj)) {
>>               ret = dma_buf_vmap(obj->dma_buf, map);
>>       } else {
>>               pgprot_t prot = PAGE_KERNEL;
>>
>>               dma_resv_assert_held(shmem->base.resv);
> 
> ... right here, and
> 
>>               if (refcount_inc_not_zero(&shmem->vmap_use_count)) {
>>                       iosys_map_set_vaddr(map, shmem->vaddr);
>>                       return 0;
>> @@ -401,20 +403,22 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_vmap_locked);
>>    * drops to zero.
>>    *
>>    * This function hides the differences between dma-buf imported and natively
>>    * allocated objects.
>>    */
>>   void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
>>                                struct iosys_map *map)
>>   {
>>       struct drm_gem_object *obj = &shmem->base;
>>
>> +     dma_resv_assert_held(obj->resv);
>> +
>>       if (drm_gem_is_imported(obj)) {
>>               dma_buf_vunmap(obj->dma_buf, map);
>>       } else {
>>               dma_resv_assert_held(shmem->base.resv);
> 
> ...here.
> 
>>               if (refcount_dec_and_test(&shmem->vmap_use_count)) {
>>                       vunmap(shmem->vaddr);
>>                       shmem->vaddr = NULL;
>>
>>                       drm_gem_shmem_unpin_locked(shmem);
> 
> Or were those insufficient for some reason? If so, should we keep both
> of them, or should the older ones have been removed?

The dma_buf_vmap()/dma_buf_vunmap() functions require the caller to be holding the reservation lock as well.

So it kind of makes sense to move the assertions to the beginning of the functions.

Regards,
Christian.

> 
> Bence


