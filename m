Return-Path: <linux-media+bounces-58789-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC7GIJJF32nzRAAAu9opvQ
	(envelope-from <linux-media+bounces-58789-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 10:00:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BF6401A26
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 10:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75B76308DC09
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 07:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0ED3BD226;
	Wed, 15 Apr 2026 07:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lWfEn2fS"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010033.outbound.protection.outlook.com [52.101.61.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB4137648D;
	Wed, 15 Apr 2026 07:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239773; cv=fail; b=NGH5KNlEvkcsT+zFlMJA3VXCwfDpxCiRtY1C56BNlgZ3oK/d9uUqKV2TYRM6KzJcyhOGJN1mNTYLsyThmcM/klp/RlrSnCf8m6kG4qDqNUy649O0MtTG2RiC3XtzrPyUUoSWb5nv/hvNEUbpUlarRc+iEXi3NxLlHeT1lGdOJNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239773; c=relaxed/simple;
	bh=47I6r3wuTgpuNWDmzWYziubl9SXeY1gCwLXGOMoeKtw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=smtwh7P0+kgvmJtaBzkRmV46dX0KidQo3hqI+8O2vSSXdj9LyiiMJC3g5ztHRrNRsZ1QjwxyNmEVeAdR2P0qrNTDDpnKqGGTJFHi88IvHyZrC9CiYAfwcbu0VMvhJcKtybTnOicDQEeC5mIJEtbxMpaZoRjL1yRstZsVxd8zpLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lWfEn2fS; arc=fail smtp.client-ip=52.101.61.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuPP4SfHBJ9djor/iN596XxlvxfPoOc2Caz8/GSBaxmLOrY3IMJAnEN2oT1Hq+XtLhRzsxgZ+DazcKYii8htXcULy6X085eetNkRX4q5gthaWCY9JFkpqMsRjJ42lSeyOk+YZf8dMyvihs5mm6TGo0cX2WEUwvFd0ZqCi91STXMKF/KC3nqI17xh+ogwdjapM3bWNu4KQKbraue9Cecrm+OfrXtEAxZS5y2Nk8rHXDy8xD8XHCiQpX1szuMA2WFNdDU3AG9JVycMHHWQIgIwOK8csmj3iuwHzVwNi4sEzTy0l31by5bj2V61znq//wVhtgtoVd+qpM1/IiQDCjaM3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ou7k4x6jV2bAcvBHxGpIx4E6yoKSPoiQzew/3c9mD0=;
 b=kkEVGOmssfvI2PgQR6UBdWd0tB4EOmEGQYoaupwbutxa/C07KaGRuf3zMn5h3zF0m+6p+GlxRLQNvUEcaPridRthdNUynTdQzRYVoQO70wgi1Lo1PSj0kxqcfvGETKjaN1TxeNvZZquzx/a0fQNOLivAUjaIh/Kdgwrbkd7bIakxG97JXcwQu5RGgesanGY/4ZAiPi1FIWjA705pGeYdw7AhSsg1btg0tJ9VCT6QujADEAS7FMSdsnXsmVxOwzS7dA1FySLgCePqurdw+RICSt8ODcqGlqwIpAfKOZtOXbnnHSBmxhfY9J98+7RRqIA/n9TC6ZLsErN8ZlZAz5pEpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ou7k4x6jV2bAcvBHxGpIx4E6yoKSPoiQzew/3c9mD0=;
 b=lWfEn2fSLPJaU+0CKRXNNMYLXUaC8SOdoLdr9vVi7yl/DF0zh2Epc1vvJUUNMxqJRuS06EWSoSQsvHdOeYc+BZejBx9mvlNGdEepvGt49kE7rKuHBOim/77DDZwX8mzg3neCwQk+t1ygCGLfa3yLnhTj+zbnEaEiFYbTVDCBs5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7204.namprd12.prod.outlook.com (2603:10b6:806:2ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 07:56:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 07:56:08 +0000
Message-ID: <9a33c8b4-64f1-400f-b8a0-0972ea5b5ecf@amd.com>
Date: Wed, 15 Apr 2026 09:56:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15901/15901] drm/vmwgfx: fix NULL pointer dereference in
 vmw_validation_bo_fence()
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: popov.nkv@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, lvc-project@linuxtesting.org,
 stable@vger.kernel.org, Ian Forbes <ian.forbes@broadcom.com>
References: <20260414105529.9883-1-popov.nkv@gmail.com>
 <ecf4cd01-b05d-4f51-943a-631cc4b27331@amd.com>
 <CABQX2QMH2XFcuz00DQQWU4uKw2B8OzE4rCE5=8LMXDg4t0AqWQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABQX2QMH2XFcuz00DQQWU4uKw2B8OzE4rCE5=8LMXDg4t0AqWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0758.namprd03.prod.outlook.com
 (2603:10b6:408:13a::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d8d91a-895c-42ad-4245-08de9ac47418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TRNlNBVd7YzQ96hjYh76StKmFryWS8JdzOcTc7jXEAiRJz7NKz5ElRrTec8m7OydoqmzQoLOnFYYEI8/5N1MltvxST32Aa1Vq2MB84GkWLrvXjbjsu8CEjY48mafKNIQav30WTjNZoYLfGzU3sIOqOs5qZeITp6apiaYxjQA1KiP/N8/Ez1m3AFDBXerxmOXKLB2DSJJ26EjH6HkMrOO9cfHGU1Q0NKanr1n/LLZ9IS9GzIR1O0MEGq6gEHtCrbomnQnrMcSx9H3wgNJR2P4VrczsoVRc2pp8ETCghPjI61CxZqnvLTNZXVercPn0mA39vZ4pvIV11GOYLMhiqOXlUGtJst4MWEMsIw7+XPLd0HVAtkH7UnSjtOvxKNRUMKKyq3bl7SwGWHWRXMSGKKIX6CYTaCv6ICqbbfBG00NF6FdCJlhaZXLUSL22owZUp4t5PoHE4bXF9a6zYqhGiDhaziE5gUiBm44In8ziVzyZR5bmmeeesHZhITgljNL682XXP1lgiMi7oILYequd24thZH/JbVACkA32ySpXHtJP+unzhLJM3pIAaHV9ccf634e3VfLW31KPIUiWtLvVXCQlCH8mFqon2y3f8TB0tIM6theuzOJ+Ved3c9/Me1qcTRPw5UEMu0QyYLgsD//Ei5LLm88/+TmIyFbNVxBiWcw2M6gnQe84P7Z9HzMqaAx08YhOgwoG+xOJwO5zfdryzCgUqumlXeDrRKayA8RuXspULY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?by9wdlk4dUNUSVgxYWIxWmI3bkI3YVJVV0V4cEFiYmRFaC90UFRVK0JoakZq?=
 =?utf-8?B?YTV0V3RpMENOVmQ4MTNPUUJtanpVVGlqMm9HaTdEakw3R1RnVjZ2STA5N205?=
 =?utf-8?B?NnUremtMbGJkTFVkdmRxRzhEVkc0SVFjbDVPVVRWV3VLTktBNWIxOU9KNHMy?=
 =?utf-8?B?Q2lVbzdIUmd0Rlp6T3VEYjFTckJvUXg5eUMzRncxM1JDWUo0bURkTStjTWpl?=
 =?utf-8?B?RmR0c2laOGx0MFpLQUxHTlhXNnhiM2NlSTZxWUFPby9jZFlMeWxpRkV1eXdI?=
 =?utf-8?B?KzNaOW4raHUzMlc1WldqNVdRSEFxYWxjQ0JsT3NaK0NWamR1OFQwUjJYc2Nn?=
 =?utf-8?B?ZFBHRDVxL3BPTTVkSTMrOVBzbDBBVW9kNU9rMFRqcHo4VmYxODAvY3F1L2hR?=
 =?utf-8?B?Y2Y4ZU55VjV6Um1QSE5IZGJzTjc2VFcvUEhzQ2djNm1nZWJ5RDAzYU9tSDhw?=
 =?utf-8?B?eVJRcE1aSjJLTjU5WjkrYWYzQ1p3NTVtTWRRUmg3d3YzblRnY2wzMDdFYWor?=
 =?utf-8?B?SVZaM0FjdURMb2dLYmJRNThxeGowNGhNL2NHS1B6WUJxcHVmYWRIV25rbGor?=
 =?utf-8?B?SklyajJzRGI3ZVBMcTJMdDA0anEwQzQ1MU03STQwU3BXTlRRTVU5bHVFZnVX?=
 =?utf-8?B?cFVQRW9rejBwbG1FWXRwblBJcnV2b2VtRUtndXZsK2FYVDlmSXZ3M01yamhw?=
 =?utf-8?B?dFpJay9CNVZxU3Q5dkFHaFFzU2pLb1E4SnluNnVGUzNqSUFPanlvK3BsQ3FZ?=
 =?utf-8?B?MHFoT29BRGE1ck9UNzk2NVVBUEg4a2dBb01tZWlVV3VHOTZWbTlhK0dQTnlT?=
 =?utf-8?B?NTRFaGdGdkx1b1FrQnAzYkVIaGlPVUtQS2pvbkprRTNlR25RU21vZmFhTzlM?=
 =?utf-8?B?ampHMHpERmIvZWZXamZ3SllLbW16UDl5RjE5MkdFaWVadnNhR2RnQjFGOXh3?=
 =?utf-8?B?OXBSUUFxSGg5T0JhKzhnb0l5bTJRcU1ubVdqbDVscXlnWi8zMnNTU2xXWmF2?=
 =?utf-8?B?dnE3UGF0a3ZqRXRlZnFER3F6eEdENXlLQ3c5OTlNR0FscnBvSWV2UVFrYWxO?=
 =?utf-8?B?ZjBGYTA1Q0dsaERmeGNUOFBiaW5VRHNJMVdtdzNqS25uRUE4ZHptWDZwZ0tn?=
 =?utf-8?B?bHlCaEIzaExGTk1UWWc4WFJnQndJWmZhNzhpcWFxRXQ5eUEvWlNCT0M5SnJJ?=
 =?utf-8?B?UlRhc3FNUURwbXdQcW5KSmg5ajdhQllTZlNTWjNTMzc0R0dJOXBHNHBvcGVu?=
 =?utf-8?B?WTRtbzdVR3o1N2lHdWtRZVo2Q01xdjNLTzBMMVdxa3R5bzlBeUllSm85aDFF?=
 =?utf-8?B?Z1BSUmxVTVhySjhwM0dJQU53N2V5WEFpTmJ5dlo1RnYrUG5TbVFLUzVRODJy?=
 =?utf-8?B?MXNhUjF5Ym9OR3R2VzJZY1d6dzVrOHFVY1JHWHZOMVA2aTVQT3VEUVQ4TTdQ?=
 =?utf-8?B?RW1adEREemJnTm9rK1RiV21jdHYxbk1Hemt4clZOZlRZcHllT0R0RXNNd1hU?=
 =?utf-8?B?RUxPcTBERVYzbDQrcHJmTVZJU0FVV0Yrei9LZmV1U3FzWEY0djhhOFFYK3Ri?=
 =?utf-8?B?MSswUlFTQkFUT2ppRFRHczhKKzh5QnJiR0Nqd2xYeVVrRng1KzRVeUZJWENp?=
 =?utf-8?B?ekdzNHhtTVUwMFFRenRvckFlNTEydGtnK1ljejhSa3lDQUJTQUprYzEzaS9S?=
 =?utf-8?B?MzZUNnFoc0wvTGw4aGkrbUYxbURlWTdvZ1NHRGFRUlhNK2tqYjVNdnFxOUc2?=
 =?utf-8?B?WW1ib3ZNYzJTSVdEK0ZaUkNyak5BV2JvVjVQNC9BZkkxVzB3UW1JVnFpdlpv?=
 =?utf-8?B?Mk5tY2ZGc3NxOFpYT1NXYU1Ib3VQNUhUcE1oYzBuWUhzcFVFNUhWaTdlRUlR?=
 =?utf-8?B?NHhhVExYejFaYW9hRjhoSXhnL3J3Mzg2NkR2Qkg3OWx1MFpyWkZQcmRYL2RX?=
 =?utf-8?B?bVZRWGswTThnZkd6MnhVTTNNTFgrclpBZUlRbG5YOHdTU1dMaFRXdHhoNmxk?=
 =?utf-8?B?YWZqS1AyQ0NraTRwNmdBWVdJTE5sci9sWUhuTFVpK2hMVktzTmdMQW05eEdE?=
 =?utf-8?B?UFk0TllvNFdwUS9jTlVHWGp0VW9ETEFIZ240c3cwaUlKMHV0Syt1dzN1VTBx?=
 =?utf-8?B?UVo4dnN3dTgwaDR5L2VPK05XYUVVemw4OXpvTmlneWlOaUxPRVc4WWowekFn?=
 =?utf-8?B?Y2M2NUtZRFdsSVVCenhLd3B1aXVPbmxqRUhkUnVsRStJR1k0SUZyU0NzSVFp?=
 =?utf-8?B?UGlacWtmdjlFU3c2bVdCTWlyVlROY1J1L1VaT3RSN1RkMEIxcmNkN2xsTTdw?=
 =?utf-8?Q?gEVXWpNAD9djGOdhSK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d8d91a-895c-42ad-4245-08de9ac47418
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 07:56:08.6981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xucFYftBaboysg8qv9Rg29tUbLVItlulborZrIusWBkl9IokFJfgiOxZ8yO33jTv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7204
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58789-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,broadcom.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,linuxtesting.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 15BF6401A26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 03:08, Zack Rusin wrote:
> On Tue, Apr 14, 2026 at 9:25 AM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> On 4/14/26 12:55, popov.nkv@gmail.com wrote:
>>> From: Vladimir Popov <popov.nkv@gmail.com>
>>>
>>> If vmw_execbuf_fence_commands() call fails in
>>> vmw_kms_helper_validation_finish(), it sets *p_fence = NULL. If
>>> ctx->bo_list is not empty, the caller, vmw_kms_helper_validation_finish(),
>>> passes the fence through a chain of functions to dma_fence_is_array(),
>>> which causes a NULL pointer dereference in dma_fence_is_array():
>>>
>>> vmw_kms_helper_validation_finish() // pass NULL fence
>>>   vmw_validation_done()
>>>     vmw_validation_bo_fence()
>>>       ttm_eu_fence_buffer_objects() // pass NULL fence
>>>         dma_resv_add_fence()
>>>           dma_fence_is_container()
>>>             dma_fence_is_array() // NULL deref
>>
>> Well good catch, but that is clearly not the right fix.
>>
>> I'm not an expert for the vmwgfx code but in case of an error vmw_validation_revert() should be called an not vmw_kms_helper_validation_finish().
> 
> To me the patch looks correct. This path is explicitly for submission
> failure and does BO backoff plus vmw_validation_res_unreserve(ctx,
> true). The backoff=true branch skips committing dirty-state /
> backup-MOB changes, which is only correct if commands were not
> committed. Here the commands have already been submitted; only fence
> creation failed. So I think unlocking BO reservations without
> attaching a fence, then letting vmw_validation_done() keep taking the
> success path for resources is correct.

Ah! I would just avoid adding more TTM exec code dependencies.

We also have the always signaled stub fence for such use cases. How about that change here:

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index e1f18020170a..8dcb8cd19e29 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -3843,7 +3843,7 @@ int vmw_execbuf_fence_commands(struct drm_file *file_priv,
        if (unlikely(ret != 0 && !synced)) {
                (void) vmw_fallback_wait(dev_priv, false, false, sequence,
                                         false, VMW_FENCE_WAIT_TIMEOUT);
-               *p_fence = NULL;
+               *p_fence = dma_fence_get_stub();
        }
 
        return ret;

> iirc the same helper is used by execbuf, and the shared-helper fix
> correctly covers both paths so this is probably not only a kms issue.
> 
> Untangling this code would make sense because it's confusing, but
> that's not something I'd expect Vladimir to do :)

Yeah fence memory allocation should definitely be move before submitting the commands.

But that is clearly more work.

Thanks,
Christian.

> 
> z


