Return-Path: <linux-media+bounces-62210-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAJCJQlfDWpuwgUAu9opvQ
	(envelope-from <linux-media+bounces-62210-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:13:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 012F2588BA9
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AFCE305B459
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 07:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745F9376462;
	Wed, 20 May 2026 07:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rQMY7kQl"
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010055.outbound.protection.outlook.com [52.101.201.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3770D2D7DF1;
	Wed, 20 May 2026 07:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779260938; cv=fail; b=R0i6M7TQeLPBtHhSAQ89y0ktW5sgssmLD8xq0gu/5aVmIcuZRAPPaIEN678d7NjUWtK0tiImBPDEGVWSYDfNZU+CPprPecLohC3n9qaOxzSHsO9Zym+AFczyOJopSC+IQbwMD71kMGyU1IAxbkvJ1bOd2ecdTYJrg61C/ggX/OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779260938; c=relaxed/simple;
	bh=l3BSKwvg72gle21bzF+RiIKDxaZ8xCMuX/vckZ1fhTY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FUzigduWfCRcq6M9ULIdX5o8UKXPMFQj8da4lsEqr78HOLfl+kSB8MbPDFJOXFh/rHIPHXxXrrwUV4oSVyk0jSES3RBAf66zxuVSLHWw58hfQM/GEF2m86HlyliUsZW8pdfAxOoIAMOnrokcfD5pLuW8K6GnuOTGgXUbA5cTQVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rQMY7kQl; arc=fail smtp.client-ip=52.101.201.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XL6jIbXt7UNNYp8D4LXRKxHRVr9NKpkBT4ELYun7w6gH3zOfPLx3IjhwwnH/MUt6+VwI0zy/EdKp02UjNssEoZnq9TgpQAMDNgColrcSSdhsh0zj9BY+/uRk7zzZHkhiHHD8hexs+66y9/4NmTkB03mdgv535rK7ahNEo0bQlG7fdWdnb3sfcgyiABFC3OIL4LM2CaZguwq8y4+3knvWK3sz/iXd/lM8k82xYmlnfpVg9Gi4jAjBSDoIkAwttHlF2b/3GB2kVLT9iTaZ/6htECza+zn2GM8LSfGRHs1vj/zNZlwshl4IPAAhJFTT3W6qSFVRA8wPwMcnHZS9847Ugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psP5VBwIyijk16ie4WQ6y3HH2weWRHFe+Ku3ngbG1fo=;
 b=hiXUYfulbpXou0pRIqDnpDO5vVxx/VuYgFm2ucP9h7vexEouwkNk5DmRHQGT0S/5WtPKT6kFSlEuMPtiqDmsG4rMiMJKXI2j7vbOtcvuLmCfyS+q8rKejyonYYAfKEpMq0dUcNyf5qeN3OnSkx45AIkdPbR+ggcuM8dYWqjDdbV8oH7qP8wxxFzlWWZlsojKw2xex68v86y4MiBeJp/EmHaC+8Zj22h+Y3WT4OhTq0BB+k+7pbXBeAh8VnzCKl3Crm2Tq860IqsKToK5eX6IzITm4ZNJt2384ScQrVZl4uhGpo+OW+EhpdpHpdO1I/5NtdgOJp12469Ylt8ZGV7NiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psP5VBwIyijk16ie4WQ6y3HH2weWRHFe+Ku3ngbG1fo=;
 b=rQMY7kQldOR4HLCcCO2CO9Ud9MIHN5QwgJxwazYSSmIRvyYiLGnMb9MYsE/RpeZ5ktIWerkhRqtKwt++yzPaX+jiJow6lannierDUiT3NfCS/6NVnr+/6vSLDTHrunVaoOdW2jYoSduHySqL2F++L5SgpHD2S4cFJR6j4dlaZvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB5603.namprd12.prod.outlook.com (2603:10b6:303:16a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 07:08:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Wed, 20 May 2026
 07:08:53 +0000
Message-ID: <45bbcc75-f852-46c2-bcff-8cacb9413376@amd.com>
Date: Wed, 20 May 2026 09:08:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: fix recursive ww_mutex acquire in
 amdgpu_devcoredump_format
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260429143743.50743-1-mikhail.v.gavrilov@gmail.com>
 <20260519161541.19994-1-mikhail.v.gavrilov@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260519161541.19994-1-mikhail.v.gavrilov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0288.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: 23130090-d1b5-4942-96ac-08deb63ea6aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003|11063799006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	jtkB3aHWnB3dmj9Z1nQ+zycjs4xTeAF7b/wxd6IAY7YP64HeNmb3BfjoNoxpm6xC++SnECZB58Hixpno+JZWy/6SCEB1ZH1uHhuel8gFc9lOInw8qiMkwYp6AsQpnUU1Gdud0L8CUx1A98mG6Vqd7S9I+cGdlAOMgDvlGpaZIDpjdmSZsKyaEAnhLtysel5gD+EG5DALheQb7T/5GU08JcsGEtn1W94PGIn36WQAhyYZAlu9YI57KfV8mq348D3fVZwE7zksRtreZpeafeNfXvUzAkyIcpSki+qoGkU2HktpXUHLkra1Q7YuJ/+P00moHUrWY9DXCs1gnmsHciKM1pL+uE4MXNcYj33+0rZSn7OiaSI/kWmwHKs8fvjxcA/PpNbqy2W99N7V1sjMfvOvqd4Xi/YjzvkXi3qF8zGoXALsDdCKKt7SL9rUYy/aTxx/qgPO5AWN2Gdpzg3bHw4N2K9iqbJXQ3qG6o6lC4cFFjSLSoP6ACMZGlVl1HldXUjjbo5p3UataU+sCUyTJvu+VhAbG7AUWyjDz6TiLTNR2raarDLIn+ypypAj20af+JuUdJqdocGJR0tUKwETdiM0ya4xmJxHl5zUPebAbgrFjGgyQjadvVXtXKFMoitC2a6jQSwnl97TYktkXashKQ0VA3z00a76v9OPMhNCbSglvAPYaPe7asLayC1ZqFSgt6q7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(11063799006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmxMMnlvUkxiREZlZEVXa1FYVThwcHpnbTNKeEVnZ0xwYzBzTXpQdGxpN3JT?=
 =?utf-8?B?LzRQNGRVd1ZsZ3lEK2lyTzZRNE4vS1hXRzd3VnVLMjdlTDdYUWN5ZHpzK0dM?=
 =?utf-8?B?anZrYmlvUVkxclpjZ2hFRVBGTlR3bmFmRlpPTmVncVZFUjRwM2xrUEZTc1Vn?=
 =?utf-8?B?dVM2UnZFeWFhWGVqVW9TUmRZRmMxYWt3RUt0dlFkSjhSdE1Ec29xSW9DdEdk?=
 =?utf-8?B?QXdFSlVUZE5zTFkySlZIZnlpaS9KWmk1SWZzQTVpZnBoUWFJVEFUTmk2Wk0x?=
 =?utf-8?B?YTNBMlBTaW1YVHB3ckNpbzRrOXBjaHVyVTJHV3FUeUYxSXRURmlHOXVSRlNP?=
 =?utf-8?B?U3ozcFZvU2xCSFJidjlTTWJuenJrbVhtOTNBOUpKdHl1dVo1WHNrdEtGK3hV?=
 =?utf-8?B?NUdVYVI2SDZUVTY0MTc0U1UyK3BhZUE0bVlEUGcyQjBiR1IzTTMrUDdIeUxE?=
 =?utf-8?B?U1ROaUg3R0FFaml0dDRtMHpFcERTUFlkTTUwNzd2U2RsM3VYY0FGYjNiS0JV?=
 =?utf-8?B?UGlaK1NlbUxwWHdVU1RSRHQvSWJrNnZFOE9ha3M3em1kTG54NUtubU5JcVF4?=
 =?utf-8?B?NWloRUZyb1F3b09tK0Z2RzBEeHN5WVRzb1dvVWY2TXJ5bTBxNGZ2NDFiZmVw?=
 =?utf-8?B?UExiNStTRTRnY2ZQbFBxUTdOSDZTdVhxT2ZmRHdyaU56YUVQWjNlcGZRbFc4?=
 =?utf-8?B?elNFRE9ycUdISTBXT2NZZUc0bjZtMTBXWVg0ZkJqVmJCbmg3VDlXWXZFdmVU?=
 =?utf-8?B?NExON0VTd1N6cHFKZmRNMGJhR2VZVXZoSlJ5MUpPUEJXZ0hySzd5WWFuVTZB?=
 =?utf-8?B?cjQ3UmJaU3ZFVjEvOGV2c2g2dnJGaktyOE1oWVBYaE5qU01PV05hcVVNSEJH?=
 =?utf-8?B?V1AxQlhzaytLUzV3ZkF1ZHkrc0gyZW1nQzlZaGZOZjRZRmhJRXdnQjVjYXp6?=
 =?utf-8?B?ZWFVVXM3ckYwRnJRMW1OQnlMY3VydksyYVhYTVY4WDJHSGZleGFKTHVuVWlJ?=
 =?utf-8?B?bjk5V2RDTnFHbFNrWmxxSnRTYmNDUTlZbkhHckNreVpGQStUemozSmgwRFVR?=
 =?utf-8?B?NzBUZ1pvLzViWmEyN1hCSGdmLzVnQUphdDJONytwUS9INmdZemRyeG55Tlp3?=
 =?utf-8?B?OHkzZ0d4OU9QQ1Q0ZEpaRDBHNFdGakdkbTJWaDluN2FZVGYyL1hib0doV1pP?=
 =?utf-8?B?bTZnQktoMkRabSt6S3MyaldyOVd3THFFUTg5ZkJiOTd6enpUSGxweGhSblcr?=
 =?utf-8?B?NVZxQytaKzZNU0p2OVZoNmpxNlhHamE5UmRBYjVsZk5xc2dGeEZXbWpWR0lt?=
 =?utf-8?B?dTJZeUkyWUM4VUFKR2F4Zm9nSWdXbHpCT3Bud3JKSWhoQzlxR3hVTE03b040?=
 =?utf-8?B?aFYrdFErTkJQQ0NVOEdyVXFuZWFVamRtNVZaSTBwKzh3OHJtQ0tJWkhtdWhv?=
 =?utf-8?B?MWJxSUs4azdQRCtTTGJOMVBNbUg2QWMwNWgzdVBrMnJQd2pXNCtUMERjS0Ir?=
 =?utf-8?B?d3RoTkNLOEgvdWkzbEd6Uk9MYnpmM2lDSEhwTVlpanR6Tyt0L1UvTy9rc2Js?=
 =?utf-8?B?b2FkemxhYnVBRkc2VjI5R1hNc0Y5dDlXTTJ3WC9TdW16UlNXOS9KZmwvOGpZ?=
 =?utf-8?B?NGZtWXp2a2tPV1N3NnlRR0tzeXZkTXpzdGJSQkF0dE82akNxdld4UFN3cUFt?=
 =?utf-8?B?TXlXOU5pUTQvVWNtUFRZZEVoUEUwYmNLcFhhbHlyNmtHdXVQRTVXQ0tEb0dB?=
 =?utf-8?B?OWY1b1MveWNKdzJ2aTBKMWQ5dE9XMFJWZ2gyREttL0piUmlZWk9PRVhLT2R6?=
 =?utf-8?B?ekZ2akgxQ2dWb0lSTVROQk1aR0l3a2pveG0vNVJNdXljUmFOQTEySWd5YzRz?=
 =?utf-8?B?Q29QdHFBMDVpTUhOcTZMakYrQUFRNVZxdVdhRTFwM29WcDNJbk5LT3dkYi9F?=
 =?utf-8?B?TE1vUWE5OEQ5YTRSdzhScGhZRkZObGI2MXNCcWx5cXBBYVNVRlRTRENkdXgr?=
 =?utf-8?B?QnJGMElNOGwwTzUwblgxSlFOS29xVEZXMk9XZjc3ZFBlTGI3QU1MSHUxL2po?=
 =?utf-8?B?UnFoUE9pdjNyUEtJS0Q2WkFMZkRKY2RXSVcvQ3pBQWNMWGsrb3R0cFBmc043?=
 =?utf-8?B?dHBOODM0eGI0enlCTmlQUmc4aVJsZWJJUVViL0Q2OENSeDZ2MGl5Y2E3YjE3?=
 =?utf-8?B?UU1NU1F5RzJCM0FLTTNOZmRqeUpuOWZuMnV1YStpS0tIamVXOFlZRWFQR05T?=
 =?utf-8?B?dlRLUXBvVjJ0cGd3dmdaelFrQXUxc3dTM3gwL1JkZkt6QWFzZzFjbjhJM0Rq?=
 =?utf-8?Q?tjpeF1Td47R6QfCLK8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23130090-d1b5-4942-96ac-08deb63ea6aa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 07:08:53.6303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/CDL5l0XafP/oX/zs5zjmMCc0wpFdQVosLXFMX4Mhp8YirNeVIhpaSZ4aoWuhtO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5603
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62210-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org,vger.kernel.org,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 012F2588BA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 18:15, Mikhail Gavrilov wrote:
> When dumping IB contents from a hung job, amdgpu_devcoredump_format()
> acquires the VM root PD's reservation lock via amdgpu_vm_lock_by_pasid()
> and then, for each IB referenced by the job, calls amdgpu_bo_reserve()
> on the BO that backs the IB.  Both reservations are taken on
> reservation_ww_class_mutex objects but neither uses a ww_acquire_ctx,
> which trips lockdep:
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
> splat is a lockdep-correctness warning, not an observed deadlock.  It
> becomes a real self-deadlock whenever the IB BO shares its dma_resv
> with the root PD (the always-valid case, see
> amdgpu_vm_is_bo_always_valid()): amdgpu_bo_reserve(abo) re-acquires the
> same ww_mutex without a ticket and blocks forever.
> 
> Fix it in two steps:
> 
> 1. Collect per-IB BO references under the root PD's reservation, then
>    release the root before locking the IB BOs.  The walk over the VM
>    mapping tree must remain under the root lock (mappings can be torn
>    down without it), but the actual content copies do not.
> 
> 2. Lock all the IB BOs together using drm_exec(9) with a single
>    ww_acquire_ctx.  DRM_EXEC_IGNORE_DUPLICATES handles the case where
>    IB BOs share a dma_resv (e.g. always-valid BOs).  Each lock attempt
>    is now a top-level acquire under one ticket, with retry-on-
>    contention handled by drm_exec; the recursive ww_mutex condition
>    is gone.
> 
> The collect/lock/release logic is factored out into three small helpers
> (amdgpu_devcoredump_{collect,lock,release}_ib_refs) to keep the main
> function readable and within the kernel coding style indentation
> guideline.
> 
> This also fixes a BO refcount leak in the original code: when
> amdgpu_bo_reserve() failed, control jumped to free_ib_content without
> running amdgpu_bo_unref().  In the new structure the per-IB BO refs
> are released unconditionally in the cleanup helper.
> 
> Reproducer (~150 LoC libdrm_amdgpu): submit a single GFX IB containing
> PACKET3_INDIRECT_BUFFER chained at GPU VA 0 and wait for the fence.
> The TDR fires within ~10 s and the deferred coredump worker produces
> the splat above on every invocation.
> 
> v2: switch from per-IB amdgpu_bo_reserve() to drm_exec for the IB BO
>     locking as suggested by Christian König; the snapshot approach
>     for collecting BO references under the root PD's reservation is
>     retained.
> 
> Fixes: 7b15fc2d1f1a ("drm/amdgpu: dump job ibs in the devcoredump")
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 187 ++++++++++++++----
>  1 file changed, 148 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index d386bc775d03..9ac958cf09fd 100644
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
> @@ -207,6 +208,108 @@ static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
>  	}
>  }
>  
> +struct amdgpu_devcoredump_ib_ref {
> +	struct amdgpu_bo	*bo;
> +	u64			offset;
> +};

> +
> +/*
> + * Walk the VM's mapping tree under the root PD's reservation to obtain the BO
> + * that backs each IB and pin it with a refcount. The root PD reservation is
> + * dropped before this function returns; the caller can then lock each IB BO
> + * via drm_exec without nesting reservations on reservation_ww_class_mutex.
> + *
> + * Returns an array of num_ibs entries (each ib_refs[i].bo may be NULL if its
> + * mapping was not found), or NULL on allocation failure / VM lookup failure.
> + * The caller must release the BO refs and free the array via
> + * amdgpu_devcoredump_release_ib_refs().
> + */
> +static struct amdgpu_devcoredump_ib_ref *
> +amdgpu_devcoredump_collect_ib_refs(struct amdgpu_device *adev,
> +				   struct amdgpu_coredump_info *coredump)
> +{
> +	struct amdgpu_devcoredump_ib_ref *ib_refs;
> +	struct amdgpu_bo_va_mapping *mapping;
> +	struct amdgpu_bo *root;
> +	struct amdgpu_vm *vm;
> +	u64 va_start;
> +
> +	ib_refs = kcalloc(coredump->num_ibs, sizeof(*ib_refs), GFP_KERNEL);
> +	if (!ib_refs)
> +		return NULL;
> +
> +	vm = amdgpu_vm_lock_by_pasid(adev, &root, coredump->pasid);
> +	if (!vm) {
> +		kfree(ib_refs);
> +		return NULL;
> +	}
> +
> +	for (int i = 0; i < coredump->num_ibs; i++) {
> +		va_start = coredump->ibs[i].gpu_addr & AMDGPU_GMC_HOLE_MASK;
> +		mapping = amdgpu_vm_bo_lookup_mapping(vm, va_start / AMDGPU_GPU_PAGE_SIZE);
> +		if (!mapping)
> +			continue;
> +
> +		ib_refs[i].bo = amdgpu_bo_ref(mapping->bo_va->base.bo);
> +		ib_refs[i].offset = va_start -
> +				    mapping->start * AMDGPU_GPU_PAGE_SIZE;
> +	}
> +
> +	amdgpu_bo_unreserve(root);
> +	amdgpu_bo_unref(&root);
> +
> +	return ib_refs;
> +}


That whole infrastructure is superflous. You just need to modify amdgpu_vm_lock_by_pasid() to take a drm_exec object to lock the root BO.

Regards,
Christian.


> +
> +static void
> +amdgpu_devcoredump_release_ib_refs(struct amdgpu_devcoredump_ib_ref *ib_refs,
> +				   int num_ibs)
> +{
> +	if (!ib_refs)
> +		return;
> +
> +	for (int i = 0; i < num_ibs; i++)
> +		if (ib_refs[i].bo)
> +			amdgpu_bo_unref(&ib_refs[i].bo);
> +	kfree(ib_refs);
> +}
> +
> +/*
> + * Lock all collected IB BOs together using a single drm_exec ticket. This
> + * eliminates the nested ww_mutex acquire that lockdep flags as recursive
> + * locking (and that becomes a real self-deadlock for IB BOs sharing their
> + * dma_resv with the root PD).
> + *
> + * Returns 0 if drm_exec was initialised and the BOs are locked; the caller
> + * must call drm_exec_fini() on success. Returns non-zero on failure, in which
> + * case drm_exec is already torn down.
> + */
> +static int
> +amdgpu_devcoredump_lock_ib_refs(struct drm_exec *exec,
> +				struct amdgpu_devcoredump_ib_ref *ib_refs,
> +				int num_ibs)
> +{
> +	int r = 0;
> +
> +	drm_exec_init(exec, DRM_EXEC_IGNORE_DUPLICATES, num_ibs);
> +	drm_exec_until_all_locked(exec) {
> +		r = 0;
> +		for (int i = 0; i < num_ibs; i++) {
> +			if (!ib_refs[i].bo)
> +				continue;
> +			r = drm_exec_lock_obj(exec, &ib_refs[i].bo->tbo.base);
> +			drm_exec_retry_on_contention(exec);
> +			if (r)
> +				break;
> +		}
> +		if (r)
> +			break;
> +	}
> +	if (r)
> +		drm_exec_fini(exec);
> +	return r;
> +}
> +
>  static ssize_t
>  amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_info *coredump)
>  {
> @@ -214,13 +317,9 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
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
> @@ -343,43 +442,52 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
>  		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>  
>  	if (coredump->num_ibs) {
> -		/* Don't try to lookup the VM or map the BOs when calculating the
> -		 * size required to store the devcoredump.
> +		struct amdgpu_devcoredump_ib_ref *ib_refs = NULL;
> +		struct drm_exec exec;
> +		bool ibs_locked = false;
> +
> +		/*
> +		 * Collect the BO that backs each IB under the root PD's
> +		 * reservation, drop the root reservation, then lock all the
> +		 * IB BOs together in one drm_exec ticket. This avoids nesting
> +		 * amdgpu_bo_reserve() inside the root PD's reservation, which
> +		 * would be a recursive reservation_ww_class_mutex acquire
> +		 * without a ww_acquire_ctx (lockdep splat, and a real
> +		 * self-deadlock for always-valid BOs that share their dma_resv
> +		 * with the root PD).
> +		 *
> +		 * Skip lookup/locking entirely on the sizing pass: it does not
> +		 * write IB content, and the size estimate doesn't depend on
> +		 * whether the BOs are reachable.
>  		 */
> -		if (sizing_pass)
> -			vm = NULL;
> -		else
> -			vm = amdgpu_vm_lock_by_pasid(adev, &root, coredump->pasid);
> +		if (!sizing_pass) {
> +			ib_refs = amdgpu_devcoredump_collect_ib_refs(adev, coredump);
> +			if (ib_refs) {
> +				r = amdgpu_devcoredump_lock_ib_refs(&exec, ib_refs,
> +								    coredump->num_ibs);
> +				if (!r)
> +					ibs_locked = true;
> +			}
> +		}
> +
> +		for (int i = 0; i < coredump->num_ibs; i++) {
> +			struct amdgpu_bo *abo = ibs_locked ? ib_refs[i].bo : NULL;
> +			u64 offset = ibs_locked ? ib_refs[i].offset : 0;
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
> +			if (!abo)
>  				goto output_ib_content;
>  
> -			va_start = coredump->ibs[i].gpu_addr & AMDGPU_GMC_HOLE_MASK;
> -			mapping = amdgpu_vm_bo_lookup_mapping(vm, va_start / AMDGPU_GPU_PAGE_SIZE);
> -			if (!mapping)
> -				goto free_ib_content;
> -
> -			offset = va_start - (mapping->start * AMDGPU_GPU_PAGE_SIZE);
> -			abo = amdgpu_bo_ref(mapping->bo_va->base.bo);
> -			r = amdgpu_bo_reserve(abo, false);
> -			if (r)
> -				goto free_ib_content;
> -
>  			if (abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS) {
>  				off = 0;
>  
>  				if (abo->tbo.resource->mem_type != TTM_PL_VRAM)
> -					goto unreserve_abo;
> +					goto output_ib_content;
>  
>  				amdgpu_res_first(abo->tbo.resource, offset,
>  						 coredump->ibs[i].ib_size_dw * 4,
> @@ -391,12 +499,13 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
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
> @@ -404,23 +513,23 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
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
> +		if (ibs_locked)
> +			drm_exec_fini(&exec);
> +
> +		amdgpu_devcoredump_release_ib_refs(ib_refs, coredump->num_ibs);
>  	}
>  
>  	return count - iter.remain;


