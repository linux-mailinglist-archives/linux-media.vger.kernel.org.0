Return-Path: <linux-media+bounces-65875-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DBUOGV0xQmo21gkAu9opvQ
	(envelope-from <linux-media+bounces-65875-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:48:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BACEB6D7A7F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:48:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Bal8FNjL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65875-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65875-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E4E8304DB81
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 08:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA483F8238;
	Mon, 29 Jun 2026 08:45:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011039.outbound.protection.outlook.com [40.93.194.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3352939D6FC;
	Mon, 29 Jun 2026 08:45:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782722736; cv=fail; b=hDXHrpLyTxnv9yFcSSjLj+KBzlTBoimlkdOr432LPcCmOArLS1cCNf5wTgIxFVOg/y0hDmF4x33I2RHfbHDBq8F+5iugz0Qdx6Pfk+FUlirZSps/kynvhDK5DRy3RZHzxIKOMx+BGYd8HDvb1MqcLT3MmewXfkUe2LyPtLyU5Lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782722736; c=relaxed/simple;
	bh=fcas130LkegMMuC6VmmE+oVSFoRaIbB9yR9ZLiFPKqQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NZhOGX6hy5+epVdAexfy9O5j3DzMAQ+kmWSEb2XJW7kR9NTRav9Ew0vwyoN5YpUaD3dwYufpzrzKTzsqUWjZk/StzWxl/KTo8asOavpJ8yaG/MOqLFzFqrvxztCBWbA930LgFYlt0wof3FTcHyUAWuemv3bQ1MXWCQHb3GvdPBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Bal8FNjL; arc=fail smtp.client-ip=40.93.194.39
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3iPGhjzgHzR/i8+JLN+tvpHR5Wir3e1ZEnQciwL5CNR7i8enkA5vQcDifooDw3lYkI93ATyUDPTjB/KsYjunMveUVq0lmGuKKnKBY+l3LSyX7KHu7MfHn1GUtUyWuL87ilkU0nG2JEaqYffyMDxdDv439XD1jvd0Hs0FQ9jY9CP4CzHDTWk1x0oZbJ7ueOeF7d8QP98AEooaKb0gphA5Jvdkum9MawYYzJJcMMY5GsEW9Fohzi9bjlon3KUCsrrp6X0R7J7BaCk1R9KDcfXE1vk2XAyUEoM8awwSm8jsN0WR71nSauVC+Nb9nL40nj1C4HVOjeBlPpihvS6ww8NVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyFi4cWhfmG6yEHKDlBzlSjelEj8KABaqY+V2GEuBAA=;
 b=HOrxNVBGKb7vjTdcxLLhjy4fXXJe39dmB3KIgy7OpKgX7U4+Rob6uWKEshllIwAL8mGzxMUdA5750AhuQrp9iI/JLPNJUWhsqttwzej8YFu4XZbWyHY28YclWOKLdRggjDkxqzpI5RJhh/jCcuo3Ni/WCCcLoyyiVn+32HxGWlUvP9QaHPWdPtAxJBCuTqzmovUXwSZNzcE4/4WkTvZK2THweribIgspzofd4mW/rnbL4DPj9qvXioxrEeSMmFO/kewa7k8/9B5y4m/qcl/xfsj3AzCBUyJDk1b9Mu2M6tSQlwJVdTJgKcRWzMqTXEm08ohmr0XpS+xUN3jEwFFjiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyFi4cWhfmG6yEHKDlBzlSjelEj8KABaqY+V2GEuBAA=;
 b=Bal8FNjLBv1jOkp5IPFlTxHf+JoE91Y3o76PKdtEUIXz1LB5tVVdE1fJTLbVH+uUXDhhG+jlsSvwca1Ge4L7XCVcGdWnblzMRwcU7HClWap4oUPdN13dPqATEavI+do4M7moAw8mikqI5VcOw9c4oKwUf5u/ks6kYMFKA9tuqEc=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7643.namprd12.prod.outlook.com (2603:10b6:610:152::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 08:45:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 08:45:27 +0000
Message-ID: <becd29b5-9e40-4104-b6c9-3d91e2ddddff@amd.com>
Date: Mon, 29 Jun 2026 10:45:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Make dma_fence_dedup_array() robust against
 0-count input
To: Baineng Shou <shoubaineng@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>, Akash Goel <akash.goel@arm.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260629031346.3875683-1-shoubaineng@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260629031346.3875683-1-shoubaineng@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR14CA0009.namprd14.prod.outlook.com
 (2603:10b6:408:e3::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 383a54a2-bdc5-4241-0323-08ded5bac4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Ld3jOEIOUE+6zjqgiFOdDIthMie+Nl3Wpi9+fv7m8abCUyMVUP/DjesKPQT+l0D+a05cWjIZGQLyJr8i0eMIrImxjiAQ4JWtsUZbWu1IN0YV2UBtGLDgqmvOjiQtvQazUfnHaRErWPIJJPSuSYTe3Ui3xEEWQvZUUEuyWAmledYCPxze3pf9V9cd8ZYT/lovZRgdQ9w21xAHnkuUh2GfIgSfmRFWMrFvxCkgaT5fnRbmecBvCXRntDftejiZAkGW6Vgo9aERJzcUgjvkQZ8PpY8BQqswr0xgcWHkKb0/DQbLZuOXZxSJTXGuAAyJ+hi34EmE68uDKiTDLh+c6JgvfZY0oY2s+/cN2/lKTjmlPwBUHxThcDWBH+np+jwGaGlfYQ0CoKjsZNwX7lD+SAsDbFPhLggwRxYxTbOzkIUile0MLjTTMVBi9FdE8vfHeXc+a+xAibZ9/2RMvK61aTQcLsNsfzmQUc/gnSor8zjjtfWuoqH/9mBIVlh+mGV4NGM/kA2IWRC/rcUeaBJCAZRkQfYLe5jTaFiERjLhXDLKtiXYs0BoNdY5+Uly9BCRdIwXGNaiZzKyzKBDcpoK1/G7u9qG5XIPaM4Bt2/WESOLLt08Kj8cbCkjxLtCJi1ns2pjZ585/CPGqfUCm8tgU2jwMNxfLoazrMxjTlXLMOsMt6c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckUxYW05ck9Zc0V1U20yMGxPYm9KdE43UWJ5UW1LMEFYUC9vREZTbnJqSE55?=
 =?utf-8?B?VUw5Y1U0WHlYS3IrUkZmZUdldEF5YjhvS2kvZmxPdjc0YW1VUjBvbk0rTXhv?=
 =?utf-8?B?THAzbmtiK1FuQWQzTVRlcXR3SWNadWt0YjFhczF2YnpJdi9TSVJubFRaNEZN?=
 =?utf-8?B?aTRTM2xkQ3RDNjllVEFlWHpmS0ZGOG5JQlRCRUd5N3VBVjdwR2FnYk8yRG1C?=
 =?utf-8?B?Ym1PcHlaTVorNHUxRzc0SzRuSjBCM25Lbi9IR0grK3ZRZC9Vd1ZGdTBMdFp1?=
 =?utf-8?B?alJqTW5aWlV6Ry9FRHV6WEVhcDVGV0hNTWd5V2JpbkRrRmQ1aEp4ZS9qVFpt?=
 =?utf-8?B?WnRNUzBGV1M3bjJlWldxRmxsSlhEaDVBRHBYL1ZzUytJZjQ1UzIrMlpzNDlu?=
 =?utf-8?B?WFYwZnRDZ2xOMHQwSUhvVUR3ajJTS3N6dDhpbWM2TVd5SnkxdWtWQk1SQWVt?=
 =?utf-8?B?bUZqL28xalJrYmMxa0RZMWRTYU42YUpaZWVoemw0VGxpOEJ5bzFUd3EwVHdh?=
 =?utf-8?B?SEFOaEFHTHoreHh6T0kxK1dIUGFqbW5KUmp5UWxDUCtIeXpDK2N6VXRiRnMy?=
 =?utf-8?B?ZmFjVjg5djFTM1VjUEVlc1BKcFFyeXhVTFhrVUhUdytjc3gwVnRpdjhzWW9s?=
 =?utf-8?B?UWhzVVFvb3EvanNsOUwxL3puTUNKbU00NWxwSHZMKy9qcUcyMC9PWXZDSzlu?=
 =?utf-8?B?aGswZzRLWmRZQUpsRjYvQU1nRC9VVkovU3ZlZXg3MjRMOVNQbWxzNXlwMFI0?=
 =?utf-8?B?YWF6U3B4QWsvVDBjWDlPMWZ4cDBXZ1NxTjFtTitmYXFwL0hCb09LZG8wVUxH?=
 =?utf-8?B?TlFFS0xPQjJSNmIvU2ZNWEd4dUp5KzRmQ0VobklSa1RkRitDWnhOZ2FIUFZH?=
 =?utf-8?B?YWk4QVZsaExLNXZCRFFxQUQ0MzNSTDZoaWxjVi9GZjRIaXFXdmtTYnJDZnRC?=
 =?utf-8?B?TUJGd2lmb3pSbFV1Tm9qa0svMnhFcFBxcVJSdDMwMys3N0FNM0ZlLzFtdDE4?=
 =?utf-8?B?cW0wWGRNNzkvdmFNZ0ExU05MYlhhWDFUaHpIUEhQMVQ3ZVBYa3d6N1VxMmI3?=
 =?utf-8?B?TnkxQUVRYTFLSlhybytScGZ5R2xHZnByVVNNWEZkcmVwaUJrN2FsSGtYcVho?=
 =?utf-8?B?VjU4ek9oY2VCanZ2ZnZnTEFyamJTSjl5U3V3UUN1T3VLSFlxNlRQOERxUGVy?=
 =?utf-8?B?WFlxdWVvVENSWXMzOVBYQllMeUlZdHM3b2dzRVQ0WGFPU3BoandNcElJanZL?=
 =?utf-8?B?bVZTaWtITjUwVWsxUEpKVldZR2lJM0tZSDBHVDlVQXZNMnFKQ2JkWDZ5UzR1?=
 =?utf-8?B?TEhsckJwdXV3OTRqZjhKbXQwVi9uTXI4U3pQd3RINHpuSk5tMDBsbjcyekFV?=
 =?utf-8?B?NXRBMGxjT0xqeXJoVGhFdEpaWHBndjBpVncvUzM4Y05aMDdmbGtpV1h3bXVi?=
 =?utf-8?B?N0FXL0VQbEppTVI5L0hQYk9mUkdpWTJUc0luMi9BOU5MY1Z0Z3ZGQWllL2x0?=
 =?utf-8?B?OVZzZE1FTHNjZ0NnV0FweXk3QlVCSVFmS05naEE1RGpjNkIzaUhnczUzWmpr?=
 =?utf-8?B?MEJUbVBTNWpsOHQyamtrbEVKMFpLeEdxNkhaTER0dDVFLzhPM3lXOFdPcUw5?=
 =?utf-8?B?bEZxMllUbGxjUyt6Zmt1QlhkU2xqWDVyTFZQUUdFS2xkdXpUV3YrdlltTUpy?=
 =?utf-8?B?VklwYkNnWnhnWnE2YUpMWFNiVUZGSm0xVVE5QXgzbHF0cHM4MEZob2hVSHFF?=
 =?utf-8?B?M2xkVDQ4aFE2OXhzamlUNE1USitBTG9qUVdFNit3SzVWWjM4K2dpVlJlTTlv?=
 =?utf-8?B?RkREdGV5WlRFdW14Tk14UUJLOVk1ZDI4U3FacjJSNDJmSmNKUVJWOTdzNmVs?=
 =?utf-8?B?TjdHZGRJNWRocTJqbEV1Sm0rcTd4L21xMTF6RWwvZzVvLzVxbW0zajMyNFFm?=
 =?utf-8?B?Q29GdTJyeWhLS0YxVWlVcGJMdTJueVYyZDhEWnlNN0JtS0pmYk9tWkxtMGZJ?=
 =?utf-8?B?eHhWd255OWZBMmowR2lwZ1hBemRQbGFkdUFrNXVXSWM3SWZXcXJ6RitmZWMx?=
 =?utf-8?B?M3FtVDd3OHZWeGN2WFc4QzNDd0F5bVdpK1hmVUUrZE1aQkpwVHlUdjhrRmxV?=
 =?utf-8?B?K0NxL1N6MUEzc2UwNnBpemdFenYyU1V2VXg3bjdLamF4aTkxU0xaVmlPS2gz?=
 =?utf-8?B?bnlDN1RWTHBhQUpSYm5Fb2ZJaVZsUllEZExJekVrdVczekttWXN4RkZuLzQ2?=
 =?utf-8?B?QldlZjJZSDA1M3U4T0Nxa3hPNVpKb1ZhNVdJbkV4VitTNmNvNDN3N3pOSU1r?=
 =?utf-8?Q?QZ7pKGJ8p1SNvX1RSc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383a54a2-bdc5-4241-0323-08ded5bac4de
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 08:45:27.8193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGv8LXfdfTH//CRHOR7UUtLuxh077pJqaKm6PAq3SfNlisPKnFwfTUYRc7CYzPkT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7643
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65875-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shoubaineng@gmail.com,m:sumit.semwal@linaro.org,m:tursulin@ursulin.net,m:phasta@kernel.org,m:akash.goel@arm.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BACEB6D7A7F

On 6/29/26 05:13, Baineng Shou wrote:
> dma_fence_dedup_array() returns 1 when called with num_fences == 0:
> the for-loop body never executes, j stays at 0, and the final
> `return ++j` yields 1. This contradicts both the kernel-doc ("Return:
> Number of unique fences remaining in the array") and the natural
> expectation that 0 input gives 0 output.

Good catch.

> 
> All in-tree callers currently filter num_fences == 0 before invoking
> this helper (__dma_fence_unwrap_merge() bails out via the
> `if (count == 0 || count == 1)` fast path; amdgpu_userq_wait_*()
> cannot reach the dedup call with a zero local count because the
> amdgpu_userq_wait_add_fence() helper guarantees num_fences stays in
> [0, wait_info->num_fences], and wait_info->num_fences > 0 is enforced
> at the ioctl entry).

That's not correct, wait_info->num_fences is just the maximum amount of fences we return.

It is perfectly possible that amdgpu never finds any fences to add to the array.

> 
> However, dma_fence_dedup_array() is EXPORT_SYMBOL_GPL, so any future
> caller that forgets to pre-filter the zero case will get a misleading
> return value of 1. Depending on how that caller uses the result, it
> could dereference an uninitialized fence slot in the array, since the
> caller's array may have been allocated but not yet populated.
> 
> Make the contract match the documentation by returning 0 early. This
> also skips an unnecessary sort() call on an empty array.
> 
> Signed-off-by: Baineng Shou <shoubaineng@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

I will add a CC stable before pushing to drm-misc-fixes.

Thanks,
Christian.


> ---
>  drivers/dma-buf/dma-fence-unwrap.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 53bb40e70b27..364cbf79ad73 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -97,6 +97,9 @@ int dma_fence_dedup_array(struct dma_fence **fences, int num_fences)
>  {
>         int i, j;
> 
> +       if (!num_fences)
> +               return 0;
> +
>         sort(fences, num_fences, sizeof(*fences), fence_cmp, NULL);
> 
>         /*
> --
> 2.34.1
> 


