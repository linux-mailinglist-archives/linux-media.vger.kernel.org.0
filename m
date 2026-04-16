Return-Path: <linux-media+bounces-58875-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGE+Fve74GmIlAAAu9opvQ
	(envelope-from <linux-media+bounces-58875-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 12:37:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF9C40CFCA
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 12:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDBB83038ED6
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 10:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D993A5452;
	Thu, 16 Apr 2026 10:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Hug+r5Xn"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010025.outbound.protection.outlook.com [40.93.198.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9829F27B357
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776335859; cv=fail; b=KRWUjtJ8fCGgFgLeDo52KA1f/pVr79iV0eUnt3o6wTKX58UDlo4uMXCM0s2xdcgllA8HTDirAo0JprC6ACzR662E+v7jOB6rpqAqPIo3QstDv/ldM5ih0rRj6iaorbcQFvZR5Ec6FlHz2DW/1mKMP5hvSxW4RJiWshDwxxqoBYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776335859; c=relaxed/simple;
	bh=xvEywQE1bnkYsbRqenK5ofV6MFhUAF0QLd4JjdKvnAw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YHDdBqwGrerhPkByY76z0980cHYzN3RC5y7UbthZFY4YbgCrEWKmlLeuIfDJBj2kgnqbl4Xfggup9UTm+EeyYUw5fW67YPqkPYFc7RE9hr9HUAgy+xdG/q7spzJ6YE2JWLPVbe30hA1zBuX85iim3518CarICRkEhIuEWPUX65s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Hug+r5Xn; arc=fail smtp.client-ip=40.93.198.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgmnSPxN/hDhREj+dU73HYPQOKVZsW1EroSoeOA8XwCV3Ssn8ZZdOlywhJZDCKaPVzT9+O9tbQ+KD1amRUWaulZi7ZQeVpeEtwWMOEHy+ZzMQ4rneE8le45ZvGyiFhWXJ3COv+YfFvRhOHr6WLUoNFrIktGEfV4pHBTFL85OnGRjjiTb32v+tH5fdR4qLK+JkIWEDYaBsP72hAnG0VERTai8g1ytvtwluK6iQEfMcvGrbqmBk5owrnTsWfEwFTX9vHnoWQP6/38BY2A3z/pUIyL8+Wbc2BgSEkGZW5Jvsrs+w+bPOOzpa/uH6YYE5AmYiD9yQJgax/bzroGLm9uUCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEdq5FUUX4e2b437SIiHQ52xfPLn4zN586NhjmFQxTM=;
 b=kYVi9Nm1jrAsLHOX07UlHW/PuLj6zAD3LKGmP6UUt7+8oY/5YJwrjMfNzFXEC6RZDkHV/vbOM+EOs9W3XeDqZmXyFZTZKtg6SI0SQT7xaHI+WeKxwt4q9RM+9/6890nUDdXx9L8KmpdNhmRYlcjfQbELj/SAUf9Zrn54brg5K4jVhtdxOSo3hC+Ef+KTnZKrgDhbcTKnNpsmMdMGk43H07tzPoSj+Eg4YBfle8DcgXYssnxTJWtCRLZNROyOyO21r7Cx1zQsiEkV/676xFjQagQzcQDVC5hqdEMRYjCh7pYOzHSwYGlLMb1rJS7WejjCdtptg7Psz3UYZqnLXSkUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEdq5FUUX4e2b437SIiHQ52xfPLn4zN586NhjmFQxTM=;
 b=Hug+r5XnSYfnzr3gt9AM4XqiHSncRZiVRiKXqnS9xC3SEglvdVfAtHpEfSHia2m/QsCEEOyxqFPqcK9OqEh8LeqR8z9o8X8lBjfGGHbbxVwzBZAeOSQBc1fsKpY3URAEZdvdMpXyjYkh5qgYjFlRO1Q+r8YjZHaJF8+c50wUquY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4316.namprd12.prod.outlook.com (2603:10b6:5:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 10:37:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 10:37:35 +0000
Message-ID: <60cf4c5c-9a4e-4f1f-927e-75ae585d5e9d@amd.com>
Date: Thu, 16 Apr 2026 12:37:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Replace the dmabuf custom test framework with kunit
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Tvrtko Ursulin
 <tursulin@ursulin.net>, patches@lists.linux.dev
References: <0-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
 <7c30f527-abc4-43a9-a11c-9233015b0a59@amd.com>
 <20260302130113.GV5933@nvidia.com>
 <c088698d-0bb2-4b0a-acad-946ec3df5777@amd.com>
 <20260407123530.GA3395114@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260407123530.GA3395114@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0443.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4316:EE_
X-MS-Office365-Filtering-Correlation-Id: 447582d3-3ee9-472f-fc6a-08de9ba42c7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18096099003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GKCNS85OejOYdS98Pt0qYTwxGhiJLe28+ExsZKMUeE6f6ZpdyCNy5TPJhw1QZlX7H0QkhKd9QPFezLg70v/HWvc4GscX2fZfioSDLyFeVoYO/MmA/0EXfnGl+psZ9p+u1XBPA8Mx7GsilgmwYs1sa2vilAphmQIUiGYqq5ETcEMmk9TlEt3PThMG9BJbeHaZ+ozFPgYFyF/xqpSTBx/ewE0iH7j/gLbFCQrYCUCUOTwPsZsqnIUhumWmdzRdi60J+DMa4jX6hbskSZ3PZHDPA94+r2zMPgvBwHCdh0ylGmiOl62AmRIFWQYid7rBz/wDwMWk2tcnunb3v5+ZAQ0fNo/8MCSMXkxuwrW3VuJHJA5CDCiUKbbQPy67iNM6pzR546Ow4HDL7DcdiCEtWK0KX6dH+fEKyfrGe0iMOtwXRqwEsrHdDtkLXTAvvU0h5PHtZqIZ7o3/2msRmdB70bCvd01+Fq/PEqruxdKmFdT1GTd0aH6ESukPUqaYSaxKFlbmPSxgzaImrwkZbSA+ujMhncc/YDMRr8kezA9Y5MkMCl686PTYkShjuMPIfsmGLKN+cxhaTm8EG11PibbhylU3AOtQbTZZx96uROiwkuOlPng7RK+8Cs664ZqfSOGBBoJgtyM/Ph4p2mLCdICDgxtctjaVvkxDMrF8rbthDsQH5ajBFb1CsJPuNLWHLdG9C5qBXazHE9zpeZlzuYCX///j3FDWNSWYGVvZ0AwCMaruJKo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18096099003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clZFM3BTcEZ1RXYyM3RWWERaazF6OC9zem52OVlYNEVrNHY5b3RoRjdvMXpm?=
 =?utf-8?B?UHZPMlVSeUV4QVVoUEpVYXAvc0Z5K2J5WS8ycDNYTHQ1ZTM4NWdQZ0tMU1RX?=
 =?utf-8?B?RmE3RjR1VTlTQk9lenV3R29tdWFmRnFkbk90dVp5NVB1YTN5TFdQWTdIbGN5?=
 =?utf-8?B?YngwSDdPTUVHMU9UTnk2bGZxUU1PdW9yc1JhdlJpcHVkWCt2S1I3TG9WUDVL?=
 =?utf-8?B?c1M5RmtnQ1M1encwV2k4N2drbG91WXFJQzdzNkNGenFBempMSDlOZml4dC8x?=
 =?utf-8?B?QzBGbVFob25yUnN4RWZaTlJ2MFNHRysrRDZ4RDc4SFl0dWxpamY2NzFiV2ky?=
 =?utf-8?B?aUY4aDNoRmtvS3QyN3hNaDJhaitxZS9RNDY2N09VSWdPVXdaQWlZV2g4cmQy?=
 =?utf-8?B?dk5CN3FGMlh2OVkySXYwRTcycUVXNk1uT0s5TVF2WXRnZkNONkZnZXFyZ3Yx?=
 =?utf-8?B?bjJvNnRUMUtOSW1UenBPb0xnQ1lDOTJnV1hOQTVJMWdQcWRZb0l3eHlUMlZu?=
 =?utf-8?B?amVRRk4yY091ck9TSHcyemFiN3h2T1VtSXcwaXVNcTZYY0I1bzN2R0pGTkNO?=
 =?utf-8?B?SUpPektQOHFvcDdWVlNqZm80RkI1NStxVGRsaFowdkx5cVZoalhISC9MRXBu?=
 =?utf-8?B?VnV4Sk1Bc2g5UCtpTHVTci9Ea0svaHI1MGZBNXpPNldoSndOdWZXcml6OUR5?=
 =?utf-8?B?L1RSdWFKcm5QN08ra3FwZDl4T1puRzBBRDdFNThUTCs5WS8zVEluZ1h6cUJ6?=
 =?utf-8?B?WVJqN1RlRXNmSkxic0ZYenlsY2FVemx1RGx5SFcwK3o3YitxZ0lkVy9KMGdi?=
 =?utf-8?B?MzhnUE8vMURaRDUzdjlJL25uemlsaFNvVFJ4UlpmZmlCakxkNFRkLzdXVXVx?=
 =?utf-8?B?M0h6Q0ZNVERrallyZmE2dnVZRGNYWlF0bnpZMVY5Qkp4ZTg0ajVFTklGQll6?=
 =?utf-8?B?QjhHb0dFdnVEVXZQM3RhSHllUU9uaXEyUzlrMGJUVTFhcTU1OGVnS0hBZ3RH?=
 =?utf-8?B?Z1N2T2N0VUpBYlVadVN3eEFMeGlyTEtqSGxZdDFXMnU3Qm1xbGtmUGtnemo3?=
 =?utf-8?B?SWxiblIrbzIrSWt1Zk1zaXAwVEc1MFZueVpNTEQwcjV1Sy9IWk9NVHZtZElN?=
 =?utf-8?B?cVVEQnBGK0IxWExmaytVY3FQams3MVA4d0c3OW1WdXR3Z2U3SWFKYlo1UFlZ?=
 =?utf-8?B?N3E5ZTQ5alN0SEY4ZFExMzFnUkMxaGxBaWVvMUNGV01rS2xMeGdjcU9TZ1JF?=
 =?utf-8?B?QkNhTml6a05aancwa0FSR1hPN3dMU1FuWFlxejhXQklBY0lMWTZ1eW44a0RJ?=
 =?utf-8?B?dzNRNXJySENXMCsxUHIyaFI2aURYY3hUa00xcnBsTU1tcnZlQjZGbHBaTk9r?=
 =?utf-8?B?bGhLOVg0VTJtZkQvMVh0a0JSZC92SGdFVExZME14QkFzUUtPMHVtSnVOSWxM?=
 =?utf-8?B?OEkwQ1duN2E0b0dhbE0rU0V6NjlXK2Jtay9oUDFwVGZGQ3FodFJUcWRZSTB6?=
 =?utf-8?B?SlBVcUhXcHpjYlhpRHZpRkhGV0VZL3g4UkJlSFdmNmtNbmRkV2ROeVZEMHJT?=
 =?utf-8?B?R09YSjE3WTVaTWxyaHRhK3ZyK2F0ZWgzVUxjclRrcnVhbnRzOXhDTVhmck1M?=
 =?utf-8?B?ckZsQVZCZlFGVlFrV1hUL1ZaSzlOeEo0ZWd6NCttb2swVlExYnd5WWdoa25o?=
 =?utf-8?B?Mkw4a0JrZGo2SXgzcGpsZStKMi9qc2JMdVl4L2JKTzYvZm52SmVqOWQ4d2tQ?=
 =?utf-8?B?VW5oeXhiUWpPSHUyUUFEV3QvQnBHN29LRUlSeng4eCtJeENFZHNJa3hFUjVJ?=
 =?utf-8?B?R2ZQYnNkMUpmVTFQaUdnZ3V0OVFFb0ZRQmFyZURCNElCZzhMbTZOV0cyd2g4?=
 =?utf-8?B?OGpJMHlMR1Y1QmpEZFpVd0lSRnNvWWdSZGZ1SUV6dTF5aEkxc2NXeU10RkR0?=
 =?utf-8?B?MTlJM3NpZitqSEtlaDY1WFdxM21HTHk2NHZ6czFsMmJzTzhuNFNuMU5Hc2ZN?=
 =?utf-8?B?TXBEWkN0Y3JjVnpZbk9NTFVNOEhOMGRaM09SUDMzRnFvQ1ZRRFVuckJzVGZK?=
 =?utf-8?B?RVFRRkZoV0hjOGpqb1BWMVNJRFpkZ2Z5aGxCb2xBZ1N4cm5heUZRUG1KYzF5?=
 =?utf-8?B?VXhVRjl5OGpDaS9kbzI4eGZEVHplVnhQYkgvOS9MQmNEWXU0MGZJSFpmVUNr?=
 =?utf-8?B?NjFjUS9BUDNqbGR2UFQvd3Evcnk4UGlMWm1zTnhHd2c1Q3ZBNC9ZZUVJQ0hV?=
 =?utf-8?B?K2luamNNUWNndEpWTHNZcm9vNlNmMmUrU1FLcEtES0RuN0ZrT2ZsZFF5MFpP?=
 =?utf-8?B?TFlhczF0em90WEJFVzRkbEIwYWVUWlNwVHp0elNTRjJDVkZ3V1Y4dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447582d3-3ee9-472f-fc6a-08de9ba42c7d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 10:37:35.9107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lyv++wJSJqx70RuIFBJRMuwcBTUbReuTD92s64lNYnXQP9j/QiDiPML5x9ykvxZv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4316
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-58875-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,linux.intel.com,lists.linaro.org,vger.kernel.org,intel.com,ffwll.ch,linaro.org,ursulin.net,lists.linux.dev];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: EBF9C40CFCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 14:35, Jason Gunthorpe wrote:
> On Mon, Mar 02, 2026 at 02:58:55PM +0100, Christian König wrote:
>>>> No idea when or even if I have time to review that, but feel free to
>>>> add my Acked-by should that go upstream.
>>>
>>> I'm confused by this statement, aren't you the person who would send
>>> it upstream?
>>
>> Sumit and me are the maintainers for DMA-buf, but the
>> drm-misc-next/-fixes branches used to send DMA-buf patches upstream
>> are used by much more people.
>>
>>> It is just a kunit, I wouldn't expect an intensive review. The tests
>>> still run after all
>>
>> When somebody else has time to take a look over those patches I
>> think we can push them to drm-misc-next ASAP. I just wanted to note
>> that I'm ok with that as maintainer and those patches doesn't need
>> to be reviewed by me.
> 
> So, am I supposed to do something with this?

No, the issue is certainly not the patches those look really good to me.

> It's been a month, I didn't think this series would be an issue.

I've finally found time to review and test the patches and then pushed everything to drm-misc-next for upstreaming.

Sorry for the delay but at the moment at least I get flooded with AI generated bug reports which are at least partially complete nonsense.

Regards,
Christian.

> 
> Thanks,
> Jason


