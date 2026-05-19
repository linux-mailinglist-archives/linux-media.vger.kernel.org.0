Return-Path: <linux-media+bounces-62106-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEtOG40fDGqoWgUAu9opvQ
	(envelope-from <linux-media+bounces-62106-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 10:30:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA92B57A0FA
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 10:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8661230F781D
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DF33E169E;
	Tue, 19 May 2026 08:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="En9+xbes"
X-Original-To: linux-media@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011055.outbound.protection.outlook.com [52.101.57.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BCB3E1228;
	Tue, 19 May 2026 08:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178934; cv=fail; b=gVqhyv+JPfCfhmH0p0y+24R7qzj1RD7lY60I0uoFGSV+9IN+igL/szbQPxtR/GIs5PcrPMznGkIChKTKZXqGFsWx9MQQ/VotDhhzz/M2icZ6787Vj91Xd+BE9lopuKrTPehF+cwDKCQncC26vhBYkQf1ykkHyY8GSw1i3yP5ZOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178934; c=relaxed/simple;
	bh=jfocddZn6GI+lmv79G0vfC91kmBUN6kqFdPn1nPZj+k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FxRDoXfQgC8jlsUcsxcQsOmM9CvgI9BWFNJWXbSjHXJuWFKQuyTawXbUo4RGe2gLfhdCFAw5T9fHnB3j1DRDeya9jCLYY3JMLfo78h6AaGIDuoMBKQGHZeNEnDmuQ2AwtDlPu65FHPKTYeZM4FeJebA+Ha1dHedoWQyL79e+XTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=En9+xbes; arc=fail smtp.client-ip=52.101.57.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9Vpc6YXcRyu+c2nKAdx7T9Kt55UFOaYXjMLsBnCmyEvL7lcYu/vZaZofvlJZQIucNalDhZAULPSRJ5apgpauXW6KzGNcJidkudnoo7aeqO2CkgOfg7bhCU+vR9TPxOOcvNhjPer0HsCughAN3R20x4kv3NYycl89gDzlCgQ60/trJlPIUbdyKtFdSc2gPDI1UMzdwzMkS7Rprwru5k7d4w8eAe3FZOEIfyVT62xfOr4AH5/GKhzaRsCY6BPGRl4WMbS0Q6WbYd7VB820f1pf7nwJMW9BsAxLkxMhLtwxDDDc179+bIEChHL9s+dlfVJXu9bKORYf7r7Qjhs2XuRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKh+7P0HDQ0PfuWo+GKupzSirfilj/v6ccO+J+nfnsA=;
 b=VPvTiIl3ubzudDifD32s0+HiTGMxWDWLaLuexmzPvNuOoGPORXNG02Igj/932IJ/GkI2ToTLU8+GTT8BBi4H2HHugu2h0ZhQSwSREv9gu2EpGMqnzb6T70Cb7hvCgYf1/MtXMRQnYHuYWi7lxXae+JkNRqL0pnp14Z8EvBgDVEDp0j8Oir/iPYy6Ds3fQDD5DpI0GVjw3fhjEqDSSzc2RQtZnW/7Wybvnxyy1GKgz9m6TUdrhGej8irX0sU44UWVcD1+JdhzWdhLbf6gy2DVVptVYfPbcEpIbTEoy8jgrcalG+0kp8D/146QcvKs8xHODzMw17BN9x+DNKp7ue6Bsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKh+7P0HDQ0PfuWo+GKupzSirfilj/v6ccO+J+nfnsA=;
 b=En9+xbesejnE2BiE3I/ax+I77UELq3QcRXbQ8hyBYt9VMdQLxal/KFI4dRKzrf+P1Z23Q6UOIkT9s2Eho/wlbDKbsGaYmyjBt/aKpfDoo/ETQUypf8Mb+OhargQTCs68A7AwsA0nh7bep4jCKhMpj/RwE2BZBDVeYnh4tSRA10U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4195.namprd12.prod.outlook.com (2603:10b6:a03:200::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 08:22:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 08:22:09 +0000
Message-ID: <7e7d3966-313f-4d73-96ff-facb667b8836@amd.com>
Date: Tue, 19 May 2026 10:22:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] drm/syncobj: fix resource leak in
 drm_syncobj_import_sync_file_fence
To: Julian Orth <ju.orth@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <20260516-jorth-syncobj-v1-9-88ede9d98a81@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260516-jorth-syncobj-v1-9-88ede9d98a81@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN1PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:408:e0::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4195:EE_
X-MS-Office365-Filtering-Correlation-Id: d2935b3e-f06b-487a-3cb5-08deb57fb83d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|4143699003|11063799005|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DgRYlf4Ri0aqLZXDhkeGAQgsyq3g8ub8qCvn35vL9RIdrJgAtVxuw2CBvnTBprS/p0fV1yPphi0Uo5bOArD1xYveYJ00rb1XqEeWKLahNxN/ZuFYATEzlK6Gri7SsQE9oUJ8tFpF1OOCwk4yY+z8eT16epqSlAK+0YjOd47B0IVswcoHf2gdRLgfigj3qOUUCUvZju3O22WGQUq1057wOaBJFyS7Ajb6xZt+5JJbB25fneitZI7cISHHQUvrS+45V9fV9KBvit1KjRhUTnlIIRdaJQze0G/yXZ97aBifvv6nWXe5cB15KFB0kqg+hH9+nG1K0sAQN/9vAkKmo8jOzgK6+LoNTdD/ZmpXbD0uzFKp2SaEgL51d0o2ghWAnbcAJsaOehMx64VqFRjJtieESeXpKvf5X4ErRxSTo1QNW5om8FWt0rHej+PHdkR1BxOtIFoB7nMSbIY9p2pZyKCufh1gneOR+nTY5CZh/TK8Z4jUqYDb0GCsEOaKBov2dV529ptHPqmPdAq4EO03dpvvjpi1k09R5uX0JO9Ittx2V1vIG+uaSxW8v2kXGbJGE9VZjM/bZ1mWXYdZykGNUzxY3DF2GWdziAYI+JhVDqjeotEH7c3F5o+qg5DKLAowpOdMYvV0cndHrOGdIRYwth1/+poewv1dOtPxpIdnvZRfzjijE7kemtjbdi3+E6cjqMzuwFL7cfpv957XyNnqo8RbHAMKLvPVOdDpGm+HcXvC/lM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(4143699003)(11063799005)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWE3STZDUTUxWmV6dC84V3BDTksrMHdiVlZKcHNIZFhWZDM1K2hVMzh4c0ts?=
 =?utf-8?B?cGE5TGVYYXhOT2hZVmZSenoySWVlNmR2akxPMENQQ0JXalRyeGY1MXpydmVG?=
 =?utf-8?B?UEx6NTc5cUoxS1BmTnpxUjhMb3FBZm5ia25mWWwxemg0Q0hkUCtQY0E1SHhH?=
 =?utf-8?B?eTEwamlBNE9YNEt3Q2RKMjhCNE5CaFpGb1JQTXMxeDVHMzlWeFZYV2NuU2J6?=
 =?utf-8?B?QStramtzNTEyNzMwZ2hSejJuSU9MeFJuMGw5T1VZNHV5TXN1RWVFaU5hYnVw?=
 =?utf-8?B?VkY5UVpZRWNoK1N1WFpZeW90T1IvQTVQMzk1UmJ6K2RDbUlNM3Z3VFJOUUM1?=
 =?utf-8?B?Wlg0ekhXNXJCWlNOZ3phVThZZm1pdW5IZEdwdXhRZ3B5blNkemNBVGhIOGdT?=
 =?utf-8?B?RWlxUEpqaWpoL1ZtSjY4RXJjNDZnYVNuTzFpdklETkFONERJdmxCQ0F1eUxo?=
 =?utf-8?B?ZWdpTzFxZXFVTkNUb25PVDRGbThyR0FDbUlQVHN2ZXJlRVcxVWtOS0pyZCt6?=
 =?utf-8?B?NlQrOTM3N25hQmZsTVBBL09wSVlCdnB0WWk0MUZ6WnZFTG92V0IrQjF2WXlG?=
 =?utf-8?B?S3VmUzJDT1JPVUh0VGt2aHE3QmJIRSsvRm1ONTN4OFlkaldmeC9aWS9pOHdJ?=
 =?utf-8?B?Z0JDTkEzMDRpQkh1ai9tekk4emJqN0s3TzlOalhBSytORUxzSFpSMnp1bzN1?=
 =?utf-8?B?cHpTZDU1ekZKZG0xVmxGTWpNTU9SRFNuR2owSkNpOXNEYVNXK0trcXhMZXVw?=
 =?utf-8?B?bTZOZjFrRisycW1MQlU1R1FxVW9mVHZmT3Y2aVZxeXpTWVc2SXRXVWJ2bjdQ?=
 =?utf-8?B?am5ub1l3WnVOT0tEYW82UENUMi9LRWhRVVVaZkxNUjNUZ3lPT0ZGT1lFVXlR?=
 =?utf-8?B?Ykd2Tml1czlPUWZTcDFPM0dudm1EbjFnc0JQTE56TkdxWWE4T0lNbTBVaklp?=
 =?utf-8?B?a2N2bnBJRnVvenFWRThIN1V6c1M1M2Y1RjZZQnpRdFNHTDhNbGN5dThtUjdM?=
 =?utf-8?B?cXdwTGorelc3b0N0NjhmQVRYNjZaS2s1dURseEhBcURRRUVFUG14WkVRSGpl?=
 =?utf-8?B?VCtkajZZV2pyWGRZS3BHZzJaUWtsa2VNRzlaOU43VTZyanhmdHMvTHpqWGNr?=
 =?utf-8?B?YkpuKzEzV2tSK0JuZ1RranNaUHZBSkxaRHlIMmJra3dEbm1KMUdkVE9LcW9P?=
 =?utf-8?B?L0NxMngySE9VWjNyTkpEM0Ywc1dML2t3OXVDV2tKSVpTM1RPVVM0UVl6RSs0?=
 =?utf-8?B?WEppc0pCOXg2UWVLNTJyYWRUTWpsYVF0TDRGOThhRllUYlFRMHpZRnJsWDlB?=
 =?utf-8?B?VCtJOFlvUDhENEJFbVZ2RXJDS0tndXFiOUJYQThiQlhVSjBiNXhraG44dHJ1?=
 =?utf-8?B?Nlh2T0doZ2dFUDEwNzBJRk5nbmFiVmZwd3NmcW9PcktVR2hLTXU1U01keThR?=
 =?utf-8?B?dWJiTjhkN3JOZ2UzNC9MT1E3Q1NhRVhxbVJ5YTZRMmtkakR3SkgyaHprdEZT?=
 =?utf-8?B?emo4d0pZQVFtZFBhWHR2UG9BVnhWV2JvL0prcldZc0YzVG5wUnVLK1Ird0FM?=
 =?utf-8?B?b3NFRS85UGNQWHVRWlFOM2hIbUZmUVpUbkF3U0dBNmx3dGpXcjZaRTFkZG5w?=
 =?utf-8?B?ZEhOSHpFbVI5emhnU2p2WnRhR0FrYTQ5dXpLd1NYRGo4c3duajhxQmJtN2dn?=
 =?utf-8?B?S1ZBMmxuZFlIamxWS25PckxyV21KTE5tZW5zd2ZhZ0xkaHlueGNVMHhQM1BB?=
 =?utf-8?B?Z1pSaG1vVWRPTHBSUjg3eWVkeWhxUTY0b1Jsb3daSlRtVVh4SWxXNTY3aU0w?=
 =?utf-8?B?ejV4cDFpMmY0Wk9UdXV2K2lSTkk2U2NYUVJEQkpSTXQ0SU5qcG5NUE5EQjI0?=
 =?utf-8?B?U0VucXRvSHZhMU1lZE9URjZxQmdzWnZvUE5QVEF2RFFqU3ZBMytVTHV3RFRK?=
 =?utf-8?B?b1dGTG56ajFOV2RxRmpVciswaSs3RWwwTTExcnRqdDVvY25ndkRuT01FalNT?=
 =?utf-8?B?djBkaVhoWGhXVjdiQURNbURlN1lWTUJ3aWNyYW9STnhlRGo0MklZRkx4REJ2?=
 =?utf-8?B?VFMxU05Ld1hsYStVR3dObFVFR2ZZemNiWjdSN014Vzk2dXQ1ZXQzSDZ4aGdh?=
 =?utf-8?B?T2prdmZBVFBlMlg4ZTFZdjY2cm5Kd2U0Zjk2VkNDNWhhR3RlWm51SmVxS1Ju?=
 =?utf-8?B?NEZhZXJCVWZsM0xkck91MEdpQmFSeGdxcjhFdm9ydVg2UFh6WERzOHcvK2ZM?=
 =?utf-8?B?VkZ0OHR0eWU1eWZrWWg4cURRT1pGaEg1a3kyQXhNTXpYWUVtVG9qQTdKRVFm?=
 =?utf-8?Q?7DkKfxcS+VeV2i9C1E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2935b3e-f06b-487a-3cb5-08deb57fb83d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:22:09.1971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nn+CKF/xwVmCbrZwuxfYM3eEaUf+SXo6WYHgV+BiGBeZ/PGWImh7CK0isijEdkwB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4195
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62106-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,lwn.net,linuxfoundation.org,arndb.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: DA92B57A0FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/16/26 13:06, Julian Orth wrote:
> Previously, if dma_fence_chain_alloc() failed, the syncobj and fence
> would be leaked.

Since it is a bug fix that patch should be send out separately from the patch set.

> 
> Signed-off-by: Julian Orth <ju.orth@gmail.com>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 9b7ecc2978f5..1da96e23dfc0 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -767,30 +767,35 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
>  {
>  	struct dma_fence *fence = sync_file_get_fence(fd);
>  	struct drm_syncobj *syncobj;
> +	int ret = 0;

Please don't initialize local return variables, initialize them when you know that the function is successful.

Regards,
Christian.

>  
>  	if (!fence)
>  		return -EINVAL;
>  
>  	syncobj = drm_syncobj_find(file_private, handle);
>  	if (!syncobj) {
> -		dma_fence_put(fence);
> -		return -ENOENT;
> +		ret = -ENOENT;
> +		goto err_syncobj;
>  	}
>  
>  	if (point) {
>  		struct dma_fence_chain *chain = dma_fence_chain_alloc();
>  
> -		if (!chain)
> -			return -ENOMEM;
> +		if (!chain) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
>  
>  		drm_syncobj_add_point(syncobj, chain, fence, point);
>  	} else {
>  		drm_syncobj_replace_fence(syncobj, fence);
>  	}
>  
> -	dma_fence_put(fence);
> +err:
>  	drm_syncobj_put(syncobj);
> -	return 0;
> +err_syncobj:
> +	dma_fence_put(fence);
> +	return ret;
>  }
>  
>  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
> 


