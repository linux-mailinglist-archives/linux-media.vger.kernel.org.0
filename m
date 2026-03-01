Return-Path: <linux-media+bounces-54019-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKcnBl+MpGlfkAUAu9opvQ
	(envelope-from <linux-media+bounces-54019-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 19:58:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDE41D12CD
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 19:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62915301C5AD
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 18:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731C62BDC16;
	Sun,  1 Mar 2026 18:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yn4EDM7R"
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AF828000B
	for <linux-media@vger.kernel.org>; Sun,  1 Mar 2026 18:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772391493; cv=fail; b=Jj+InlX7+w2wAx9p9LYU00XM6EO5viDi+qSTr6JWCZF7Zzx41al/wQsTrrD1uoFYqH+aThX8Lxj6zag1Jx2eD3ED3YGUXKcE8v2SrxuTJcy41e3uMCo+4nEUowvwv5khkcfJmmoDQb0b4b7VBhxobBitbYFzOx4TVf8GQnfii5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772391493; c=relaxed/simple;
	bh=sVdF82o+yUnoY6M3fznTRVtGg/h15YnV+uzaIxQE7Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OoKTqQ0R5KEm5FqLTR+0AnGK/dOK4JIroo/azwkk9/44S0QE2EhaFbmAUN45mDqu6wFXrgqgqhRb2nAwvtVz4XU387CdNwawisVZTcAl1JFyEnbgsB9gv9EbOkRqks+DHpyCnvXrm/vdlGpkZRTJiKBvD8/Ez3yVvaiyp77BWGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Yn4EDM7R; arc=fail smtp.client-ip=52.101.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spX+GVgnZ5bgMkMbbVtqGfYERd/1EykJCbeNb+l2anjzpNCrOl6WbMN0LBQUx39BN6/WhvtrgkydLk387nksMvDBKdG+SUA5e902MFWEtvvA9K3LlfifpK5jRq/e7chtQNWTL8B5uwjzLys3/wcAqfB+GxJ5kR2FbJx3AUNoyNy1PaoOYmF4xuDTpr8VA1dAB/2zrKz60kEBE0VsIX00U3YoXsoszf1WmBH4xSGucgNmDkbyw8VFc1uMeH+6/JjwH50hZuUCcftWuJiTnVQBhnD+f5mDYfv11TiuIfWou2u0GlHDNsZlSVj0e7EW5b5ZAW0Rw2EprtAuFwf+ucGb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80zMS60hsdJ7ItPrD+7bzS9Cfj6rMNVNXpv27z9H9Rc=;
 b=KP1Hc2L2aY6uZKuf9CMBtDeKZSz+uUIxQHdb3civvngGnVhQ7EvUmbTl5X8ddR1Z6oyAo/f6zH3dbNjtBUu7EuKUDv89/1VDj3t/zz42dLX3mhGDI0j58MpTk/4XhzVRCOPA9KEApqVeqdOEwZfHM4CdgXzqkbWxIsE/fvCLhfQsE+Dwz+G4pD2i3FKdHlPPx125hxRs71kPx5bLUGSq2bf3BumxpCFEXSOFcSso3s1r87jXooDJFwgBaM9Yf7pTZMDlhnHMQLN5Puu2BPqCOk4Qi8sgmr8CUYZizX+aWbORujYULgyuOMA6Y7VDYO7NWPS/uJynTxDWOXOs7IAS8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80zMS60hsdJ7ItPrD+7bzS9Cfj6rMNVNXpv27z9H9Rc=;
 b=Yn4EDM7R4uVv+Fv4QtDc2f1VDAxSPCMvo8TTrNrywy8DWe+xFX19ShHFFBwNwKAV3ClXbTv8BcivAE9+xzzdECiPnjyiFT6X/ZS7XDTx2uXAY57MZ6q+VO4kGbRNXz3fwOKFPfzvoUpkzlkWDacg2WVKj3zCJLjxsFogAjnoxz7QBOIlqg/LROA/eZe9DMApibs+5Z/sUdCSjlmRMKwSvaWHxsYkauW3eaD7lOoZ6/bPQyoDCXiskUgiT6WkOPu5P0WMPx47ejY+O+xhgpphmyQJuZ32kuagXDCj2vhhAQqMyVN04krTliucyKJQVHM9vUzNt3dI43F0R21UpB2xCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Sun, 1 Mar
 2026 18:58:02 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.014; Sun, 1 Mar 2026
 18:58:02 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@gmail.com>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Tvrtko Ursulin <tursulin@ursulin.net>
Cc: patches@lists.linux.dev
Subject: [PATCH 4/5] dma-buf: Change st-dma-fence-chain.c to use kunit
Date: Sun,  1 Mar 2026 14:57:56 -0400
Message-ID: <4-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
In-Reply-To: <0-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
References:
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0389.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::34) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BL1PR12MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ad3113-64dd-4532-6c2c-08de77c47545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	nA0K2GVUYrGN7t/uxKMQM3XB36FuR2w0DFh2Qf7VmiCxOrzleY6b2/Sl2M2b5I+CDcp0kMryPNEHcVR2P3z+BoInsZL3+vcO/AerbAWAYomX0GwSEz0EniDC+Da35CsRsXOMpuy7j3Ynl6D1qNavlKKponGGaY29cpPiFBr9Oe383vJoSXTPHM8GQ1orCgNrXZekGnUAnrUtw2DVDifzGyElf5lPqJmZw6lCA3AZx39l+TUjQm/0XV3gPbbeFx6o9WFLopVZzzsBZzB+Xqc0jQg5S36rzn5hRKYKRWxnGsVaw80BfM2Sm1+LIF5Tb0OxsFNVa1LFUyhpTVWqntOav1ByqRaLD1hs+fMh8q9ompiLCzK7KCymbpCjj6vCwTtx2onvKfADOffZ6J1uz8InXOMGOmq+O7PiwSjpl82VJEvRMMm8hTh6klFv08qTyvdO3OoMof8oVIqGVxZ14Ai4wP2hhwConGrb8Ik33ZEWJwbpKIlDbvR9WvQ9tYyG3mLNp3VB3VgTXpkjuNGfYWsfwzQbbTG3UolJZbHHPjkFi8eB3y/EayVYjv9PiCoG1/QG8VZ70ODHx91+OsgOV4W0Ts/47v5p8Qmt75sab6ck52xMaQVz55/sPFFyZXWTmUlW7J8Vsc/s4xbIzS/XVNo0GkEuazrvNyz7zlwBpfSEsBuvytncwjylCPqYmMwmhM+fv1NKFLkmlYOF9AM9uQGews+IwhzO5fCpitth2X4Xbaws+Gt+8kq4ySxgo8nf5kJq0pQvlHrQPowo518F/T8Vcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0xJYm1nUjhjS0lsMXMzeXVCQm1nY3dKbmpqWDBJWGRZU0tTRTFrV0MwTVZ3?=
 =?utf-8?B?ZHVFaGdWSTE4S1dkZStlcmdqY25DdTMrb1RRR0pUTGpFQ2daZWtNQ0tmTUVV?=
 =?utf-8?B?QjVpVDdFanhkUXZ4R25vUFppWSthQlJzdCttdzBEa2hkM3U0bXA0a3plV0lH?=
 =?utf-8?B?citEa2tadVlBdFp3VWFyWEVmc0hkU09qSklpL1I2dzhCQkxKZHFLK0sxNkcz?=
 =?utf-8?B?SmVHU01nODZ3WkwrRk81SjkxZGpFdFEwZkhuR2ZEdXI2UERpUXJNMGhSVmxQ?=
 =?utf-8?B?cUJyKzA0UnV1dkFBZzQxZUMzUk1ubjdJanVsYzJ4c2xGM3pWMDlwZHNzQzRl?=
 =?utf-8?B?aU5sY0R4bytYcVAwZEJpZEl0VElFRjVsdWFQK3FVT1pxeVkzVFpPS3E1UEhi?=
 =?utf-8?B?UHMybXY4VkFXNzVjYmNIRy9GL1lEZkI2SEJjNlJ6RHBBTmVkb0IwNXpiNmo2?=
 =?utf-8?B?UFk3S2ZQUmFCeFNJQUY1L1psZUtrTkxFbXRwYXg5SkIremxkMlpTZzlFbm9J?=
 =?utf-8?B?Q3R2OEZLcG05ai9YNXByekFwMVNoelhvWmd0dHlUcEJORnVHRkxZN0JzdGxi?=
 =?utf-8?B?amZFZlZjSnJmWHFDWjdFK2Q1ZS92emo5enA4eVd3cFNvMGJ1UmhDVzd1eFJ2?=
 =?utf-8?B?QjUxek1ISHBlUVlJUndmd21RWExadDdxWktMWmhQU2daRXpNUjF0WjJwcVhH?=
 =?utf-8?B?ZWxHY2xUejVlWFdHQUdIL1pVVWkwbm4zL2h3RGI4VkgvTUVKMXFyYzRva0lX?=
 =?utf-8?B?b2FPNFhiRVo4SDN1bkwvSXVzZ2l3S25VZHcvU3JnZDVHK2R1NmdEaWVUbTdO?=
 =?utf-8?B?THJ3ZGZoVmt1UkFTQVppb0FsT1VoNk1zcjJTU3drL3FsdmE0WlBpZ1QyMlgx?=
 =?utf-8?B?UFg2d2lMSDJoS1BJdElRYml3bGVlc2hpTTVFSTcyUndlclpKZzFMNGptUVV2?=
 =?utf-8?B?Nm52eHhBWTlsN2FvLythZVkxV0czbTN4YzNhK0Y0NE9UOGdjRmtYbEEybmRq?=
 =?utf-8?B?MjE1RFJKUHlYUUJES08vb1VXQVpWWmtoN1dnQmhLVmkxWUtHQVNmR2I5VDE2?=
 =?utf-8?B?emtrTkdIbXEzeVE3dmlvL3FGNEpOdEMwMVdTakplSzFiWlNHQ3BVYXFGTVZX?=
 =?utf-8?B?SzVQOUdVS2w3R1h5UzM0OVdjKy9wR1NRVU5BTjZ5bUV1aktSS1VpUVNXMGhm?=
 =?utf-8?B?Ym5ac0t4UUNuTDF6akpDdWhZalVaWjNpd0FRanUxK2hPMUZKc2NxTGtaMzh0?=
 =?utf-8?B?NXg2TjRjaFVBNUpFeXA5MjM5MXNQaUQ5OFVhZG03SXc1ZEFQaWp2L1JvSmlt?=
 =?utf-8?B?cm8rN1M5RDRDOEloem9rdVlQMVpCcFlDYVFjeFFaNWYxYlZaVGdVWWRRYlR3?=
 =?utf-8?B?Q3lCQUVucWRsRUVMSVNKWjJWVFlDcVhJdkViYlRldmZjSEg1VVRuaGN3ZS9s?=
 =?utf-8?B?MUc3N256RzFVT1JFMkZndnVHYnBPMW1qSFhGaWNUb0dob21tQmw1TWY3VUg2?=
 =?utf-8?B?Sks5UW05elhISDdCUElYMHU1b0xTL2xFbldTUkRrbnc5UkRCcGV6KzR6WHk0?=
 =?utf-8?B?d3BDTDQ1d1lwU004WXFGcUJTb0tvd1NPc2VQYVZ6bnJBMFNZdGtRNU5uTW5V?=
 =?utf-8?B?b3NTOTdmZDRiZ0E5SFBBd1p5dGJFUXN1MDZHL2VrQlFMVXo5blVkcTlzN0FB?=
 =?utf-8?B?SVVrZVVwNDlYc3BCVWtLcVN1d21LbnR5UkZkeFlFVzE0SmpBNFh4K3dDKzlJ?=
 =?utf-8?B?OEhVeDl1Tk1UZ2U4dVVhYmZWRU81V0RoUTBoZ1ZQNnROVUVYRDRuUmZOeVlz?=
 =?utf-8?B?L1YydlFxTDV1N2VBNU1nK1dTb1hhdG5hRTlyWW9ueTB4UXBQeHVoOXQ2bGg5?=
 =?utf-8?B?VGkxOTlSTklnNFRRVFp0S0MxbytWNUFBU3JuRUUxNE5MdVdXa3dxVUxxMERI?=
 =?utf-8?B?TU0vdEd0TTBvS25zQzU5Yk52cWxHY2FINWk1M21JcFZudkxjSEpvZjZITnJQ?=
 =?utf-8?B?ak5YSXNHTjJWajBaR1ErNmg5TnM3TTI0NHdxaC81WUxlM3ArV25GOTNacW5t?=
 =?utf-8?B?enJucDFNS0M3NFZsaU5QNzhyemhhM3B4N3NCOWZvNnBQTHBGMjJ3cVNtV3ZT?=
 =?utf-8?B?UkJySlpSV3hLZUV5ZDg0cFJERG4zdWhBUEhEaTNuZUlIYjRreUs5NGE5c094?=
 =?utf-8?B?bkhIM2NzZE9haWRKOWpGemlWM0loSGpTTi9EcXB5U09oYzc4U0tZeVRsL1Rm?=
 =?utf-8?B?LzVxd3pCQjZKTHdmNk5MY3czM3lnWGZWZmNvQ2tyRHlJcEt0UGM3Z0F4VEZx?=
 =?utf-8?Q?f08TYIBbj8w25xCaaB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ad3113-64dd-4532-6c2c-08de77c47545
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 18:58:00.6729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9mhPacgMT19sH8J9bJnmFIJtGya7jursMFXRq2EI+qLOlWKkx+HPFG/C0PCLSJM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5993
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54019-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,lists.freedesktop.org,linux.intel.com,lists.linaro.org,vger.kernel.org,intel.com,ffwll.ch,linaro.org,ursulin.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6CDE41D12CD
X-Rspamd-Action: no action

Modernize the open coded test framework by using kunit.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/Makefile             |   4 +-
 drivers/dma-buf/selftests.h          |   1 -
 drivers/dma-buf/st-dma-fence-chain.c | 217 ++++++++++++---------------
 3 files changed, 98 insertions(+), 124 deletions(-)

diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 65bda1b7cc73eb..c97ab2d01a7e68 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -8,13 +8,13 @@ obj-$(CONFIG_SW_SYNC)		+= sw_sync.o sync_debug.o
 obj-$(CONFIG_UDMABUF)		+= udmabuf.o
 
 dmabuf_selftests-y := \
-	selftest.o \
-	st-dma-fence-chain.o
+	selftest.o
 
 obj-$(CONFIG_DMABUF_SELFTESTS)	+= dmabuf_selftests.o
 
 dmabuf_kunit-y := \
 	st-dma-fence.o \
+	st-dma-fence-chain.o \
 	st-dma-fence-unwrap.o \
 	st-dma-resv.o
 
diff --git a/drivers/dma-buf/selftests.h b/drivers/dma-buf/selftests.h
index 7104cf0cce26d1..37b7251841278e 100644
--- a/drivers/dma-buf/selftests.h
+++ b/drivers/dma-buf/selftests.h
@@ -10,4 +10,3 @@
  * Tests are executed in order by igt/dmabuf_selftest
  */
 selftest(sanitycheck, __sanitycheck__) /* keep first (igt selfcheck) */
-selftest(dma_fence_chain, dma_fence_chain)
diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index 821023dd34df68..a3023d3fedc9d8 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -4,6 +4,7 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <kunit/test.h>
 #include <linux/delay.h>
 #include <linux/dma-fence.h>
 #include <linux/dma-fence-chain.h>
@@ -15,8 +16,6 @@
 #include <linux/spinlock.h>
 #include <linux/random.h>
 
-#include "selftest.h"
-
 #define CHAIN_SZ (4 << 10)
 
 static struct kmem_cache *slab_fences;
@@ -74,27 +73,23 @@ static struct dma_fence *mock_chain(struct dma_fence *prev,
 	return &f->base;
 }
 
-static int sanitycheck(void *arg)
+static void test_sanitycheck(struct kunit *test)
 {
 	struct dma_fence *f, *chain;
-	int err = 0;
 
 	f = mock_fence();
-	if (!f)
-		return -ENOMEM;
+	KUNIT_ASSERT_NOT_NULL(test, f);
 
 	chain = mock_chain(NULL, f, 1);
 	if (chain)
 		dma_fence_enable_sw_signaling(chain);
 	else
-		err = -ENOMEM;
+		KUNIT_FAIL(test, "Failed to create chain");
 
 	dma_fence_signal(f);
 	dma_fence_put(f);
 
 	dma_fence_put(chain);
-
-	return err;
 }
 
 struct fence_chains {
@@ -176,7 +171,7 @@ static void fence_chains_fini(struct fence_chains *fc)
 	kvfree(fc->chains);
 }
 
-static int find_seqno(void *arg)
+static void test_find_seqno(struct kunit *test)
 {
 	struct fence_chains fc;
 	struct dma_fence *fence;
@@ -184,14 +179,13 @@ static int find_seqno(void *arg)
 	int i;
 
 	err = fence_chains_init(&fc, 64, seqno_inc);
-	if (err)
-		return err;
+	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
 
 	fence = dma_fence_get(fc.tail);
 	err = dma_fence_chain_find_seqno(&fence, 0);
 	dma_fence_put(fence);
 	if (err) {
-		pr_err("Reported %d for find_seqno(0)!\n", err);
+		KUNIT_FAIL(test, "Reported %d for find_seqno(0)!", err);
 		goto err;
 	}
 
@@ -200,14 +194,13 @@ static int find_seqno(void *arg)
 		err = dma_fence_chain_find_seqno(&fence, i + 1);
 		dma_fence_put(fence);
 		if (err) {
-			pr_err("Reported %d for find_seqno(%d:%d)!\n",
-			       err, fc.chain_length + 1, i + 1);
+			KUNIT_FAIL(test, "Reported %d for find_seqno(%d:%d)!",
+				   err, fc.chain_length + 1, i + 1);
 			goto err;
 		}
 		if (fence != fc.chains[i]) {
-			pr_err("Incorrect fence reported by find_seqno(%d:%d)\n",
-			       fc.chain_length + 1, i + 1);
-			err = -EINVAL;
+			KUNIT_FAIL(test, "Incorrect fence reported by find_seqno(%d:%d)",
+				   fc.chain_length + 1, i + 1);
 			goto err;
 		}
 
@@ -215,12 +208,11 @@ static int find_seqno(void *arg)
 		err = dma_fence_chain_find_seqno(&fence, i + 1);
 		dma_fence_put(fence);
 		if (err) {
-			pr_err("Error reported for finding self\n");
+			KUNIT_FAIL(test, "Error reported for finding self");
 			goto err;
 		}
 		if (fence != fc.chains[i]) {
-			pr_err("Incorrect fence reported by find self\n");
-			err = -EINVAL;
+			KUNIT_FAIL(test, "Incorrect fence reported by find self");
 			goto err;
 		}
 
@@ -228,9 +220,8 @@ static int find_seqno(void *arg)
 		err = dma_fence_chain_find_seqno(&fence, i + 2);
 		dma_fence_put(fence);
 		if (!err) {
-			pr_err("Error not reported for future fence: find_seqno(%d:%d)!\n",
-			       i + 1, i + 2);
-			err = -EINVAL;
+			KUNIT_FAIL(test, "Error not reported for future fence: find_seqno(%d:%d)!",
+				   i + 1, i + 2);
 			goto err;
 		}
 
@@ -238,31 +229,28 @@ static int find_seqno(void *arg)
 		err = dma_fence_chain_find_seqno(&fence, i);
 		dma_fence_put(fence);
 		if (err) {
-			pr_err("Error reported for previous fence!\n");
+			KUNIT_FAIL(test, "Error reported for previous fence!");
 			goto err;
 		}
 		if (i > 0 && fence != fc.chains[i - 1]) {
-			pr_err("Incorrect fence reported by find_seqno(%d:%d)\n",
-			       i + 1, i);
-			err = -EINVAL;
+			KUNIT_FAIL(test, "Incorrect fence reported by find_seqno(%d:%d)",
+				   i + 1, i);
 			goto err;
 		}
 	}
 
 err:
 	fence_chains_fini(&fc);
-	return err;
 }
 
-static int find_signaled(void *arg)
+static void test_find_signaled(struct kunit *test)
 {
 	struct fence_chains fc;
 	struct dma_fence *fence;
 	int err;
 
 	err = fence_chains_init(&fc, 2, seqno_inc);
-	if (err)
-		return err;
+	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
 
 	dma_fence_signal(fc.fences[0]);
 
@@ -270,37 +258,33 @@ static int find_signaled(void *arg)
 	err = dma_fence_chain_find_seqno(&fence, 1);
 	dma_fence_put(fence);
 	if (err) {
-		pr_err("Reported %d for find_seqno()!\n", err);
+		KUNIT_FAIL(test, "Reported %d for find_seqno()!", err);
 		goto err;
 	}
 
 	if (fence && fence != fc.chains[0]) {
-		pr_err("Incorrect chain-fence.seqno:%lld reported for completed seqno:1\n",
-		       fence->seqno);
+		KUNIT_FAIL(test, "Incorrect chain-fence.seqno:%lld reported for completed seqno:1",
+			   fence->seqno);
 
 		dma_fence_get(fence);
 		err = dma_fence_chain_find_seqno(&fence, 1);
 		dma_fence_put(fence);
 		if (err)
-			pr_err("Reported %d for finding self!\n", err);
-
-		err = -EINVAL;
+			KUNIT_FAIL(test, "Reported %d for finding self!", err);
 	}
 
 err:
 	fence_chains_fini(&fc);
-	return err;
 }
 
-static int find_out_of_order(void *arg)
+static void test_find_out_of_order(struct kunit *test)
 {
 	struct fence_chains fc;
 	struct dma_fence *fence;
 	int err;
 
 	err = fence_chains_init(&fc, 3, seqno_inc);
-	if (err)
-		return err;
+	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
 
 	dma_fence_signal(fc.fences[1]);
 
@@ -308,7 +292,7 @@ static int find_out_of_order(void *arg)
 	err = dma_fence_chain_find_seqno(&fence, 2);
 	dma_fence_put(fence);
 	if (err) {
-		pr_err("Reported %d for find_seqno()!\n", err);
+		KUNIT_FAIL(test, "Reported %d for find_seqno()!", err);
 		goto err;
 	}
 
@@ -319,16 +303,12 @@ static int find_out_of_order(void *arg)
 	 * we should get as fence to wait upon (fence 2 being garbage
 	 * collected during the traversal of the chain).
 	 */
-	if (fence != fc.chains[0]) {
-		pr_err("Incorrect chain-fence.seqno:%lld reported for completed seqno:2\n",
-		       fence ? fence->seqno : 0);
-
-		err = -EINVAL;
-	}
+	if (fence != fc.chains[0])
+		KUNIT_FAIL(test, "Incorrect chain-fence.seqno:%lld reported for completed seqno:2",
+			   fence ? fence->seqno : 0);
 
 err:
 	fence_chains_fini(&fc);
-	return err;
 }
 
 static uint64_t seqno_inc2(unsigned int i)
@@ -336,7 +316,7 @@ static uint64_t seqno_inc2(unsigned int i)
 	return 2 * i + 2;
 }
 
-static int find_gap(void *arg)
+static void test_find_gap(struct kunit *test)
 {
 	struct fence_chains fc;
 	struct dma_fence *fence;
@@ -344,24 +324,22 @@ static int find_gap(void *arg)
 	int i;
 
 	err = fence_chains_init(&fc, 64, seqno_inc2);
-	if (err)
-		return err;
+	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
 
 	for (i = 0; i < fc.chain_length; i++) {
 		fence = dma_fence_get(fc.tail);
 		err = dma_fence_chain_find_seqno(&fence, 2 * i + 1);
 		dma_fence_put(fence);
 		if (err) {
-			pr_err("Reported %d for find_seqno(%d:%d)!\n",
-			       err, fc.chain_length + 1, 2 * i + 1);
+			KUNIT_FAIL(test, "Reported %d for find_seqno(%d:%d)!",
+				   err, fc.chain_length + 1, 2 * i + 1);
 			goto err;
 		}
 		if (fence != fc.chains[i]) {
-			pr_err("Incorrect fence.seqno:%lld reported by find_seqno(%d:%d)\n",
-			       fence->seqno,
-			       fc.chain_length + 1,
-			       2 * i + 1);
-			err = -EINVAL;
+			KUNIT_FAIL(test, "Incorrect fence.seqno:%lld reported by find_seqno(%d:%d)",
+				   fence->seqno,
+				   fc.chain_length + 1,
+				   2 * i + 1);
 			goto err;
 		}
 
@@ -369,19 +347,17 @@ static int find_gap(void *arg)
 		err = dma_fence_chain_find_seqno(&fence, 2 * i + 2);
 		dma_fence_put(fence);
 		if (err) {
-			pr_err("Error reported for finding self\n");
+			KUNIT_FAIL(test, "Error reported for finding self");
 			goto err;
 		}
 		if (fence != fc.chains[i]) {
-			pr_err("Incorrect fence reported by find self\n");
-			err = -EINVAL;
+			KUNIT_FAIL(test, "Incorrect fence reported by find self");
 			goto err;
 		}
 	}
 
 err:
 	fence_chains_fini(&fc);
-	return err;
 }
 
 struct find_race {
@@ -437,7 +413,7 @@ static int __find_race(void *arg)
 	return err;
 }
 
-static int find_race(void *arg)
+static void test_find_race(struct kunit *test)
 {
 	struct find_race data;
 	int ncpus = num_online_cpus();
@@ -447,12 +423,11 @@ static int find_race(void *arg)
 	int i;
 
 	err = fence_chains_init(&data.fc, CHAIN_SZ, seqno_inc);
-	if (err)
-		return err;
+	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
 
 	threads = kmalloc_objs(*threads, ncpus);
 	if (!threads) {
-		err = -ENOMEM;
+		KUNIT_FAIL(test, "Failed to allocate threads array");
 		goto err;
 	}
 
@@ -486,74 +461,67 @@ static int find_race(void *arg)
 			count++;
 	pr_info("Completed %lu cycles\n", count);
 
+	KUNIT_EXPECT_EQ(test, err, 0);
+
 err:
 	fence_chains_fini(&data.fc);
-	return err;
 }
 
-static int signal_forward(void *arg)
+static void test_signal_forward(struct kunit *test)
 {
 	struct fence_chains fc;
 	int err;
 	int i;
 
 	err = fence_chains_init(&fc, 64, seqno_inc);
-	if (err)
-		return err;
+	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
 
 	for (i = 0; i < fc.chain_length; i++) {
 		dma_fence_signal(fc.fences[i]);
 
 		if (!dma_fence_is_signaled(fc.chains[i])) {
-			pr_err("chain[%d] not signaled!\n", i);
-			err = -EINVAL;
+			KUNIT_FAIL(test, "chain[%d] not signaled!", i);
 			goto err;
 		}
 
 		if (i + 1 < fc.chain_length &&
 		    dma_fence_is_signaled(fc.chains[i + 1])) {
-			pr_err("chain[%d] is signaled!\n", i);
-			err = -EINVAL;
+			KUNIT_FAIL(test, "chain[%d] is signaled!", i);
 			goto err;
 		}
 	}
 
 err:
 	fence_chains_fini(&fc);
-	return err;
 }
 
-static int signal_backward(void *arg)
+static void test_signal_backward(struct kunit *test)
 {
 	struct fence_chains fc;
 	int err;
 	int i;
 
 	err = fence_chains_init(&fc, 64, seqno_inc);
-	if (err)
-		return err;
+	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
 
 	for (i = fc.chain_length; i--; ) {
 		dma_fence_signal(fc.fences[i]);
 
 		if (i > 0 && dma_fence_is_signaled(fc.chains[i])) {
-			pr_err("chain[%d] is signaled!\n", i);
-			err = -EINVAL;
+			KUNIT_FAIL(test, "chain[%d] is signaled!", i);
 			goto err;
 		}
 	}
 
 	for (i = 0; i < fc.chain_length; i++) {
 		if (!dma_fence_is_signaled(fc.chains[i])) {
-			pr_err("chain[%d] was not signaled!\n", i);
-			err = -EINVAL;
+			KUNIT_FAIL(test, "chain[%d] was not signaled!", i);
 			goto err;
 		}
 	}
 
 err:
 	fence_chains_fini(&fc);
-	return err;
 }
 
 static int __wait_fence_chains(void *arg)
@@ -566,7 +534,7 @@ static int __wait_fence_chains(void *arg)
 	return 0;
 }
 
-static int wait_forward(void *arg)
+static void test_wait_forward(struct kunit *test)
 {
 	struct fence_chains fc;
 	struct task_struct *tsk;
@@ -574,12 +542,11 @@ static int wait_forward(void *arg)
 	int i;
 
 	err = fence_chains_init(&fc, CHAIN_SZ, seqno_inc);
-	if (err)
-		return err;
+	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
 
 	tsk = kthread_run(__wait_fence_chains, &fc, "dmabuf/wait");
 	if (IS_ERR(tsk)) {
-		err = PTR_ERR(tsk);
+		KUNIT_FAIL(test, "Failed to create kthread");
 		goto err;
 	}
 	get_task_struct(tsk);
@@ -589,13 +556,13 @@ static int wait_forward(void *arg)
 		dma_fence_signal(fc.fences[i]);
 
 	err = kthread_stop_put(tsk);
+	KUNIT_EXPECT_EQ(test, err, 0);
 
 err:
 	fence_chains_fini(&fc);
-	return err;
 }
 
-static int wait_backward(void *arg)
+static void test_wait_backward(struct kunit *test)
 {
 	struct fence_chains fc;
 	struct task_struct *tsk;
@@ -603,12 +570,11 @@ static int wait_backward(void *arg)
 	int i;
 
 	err = fence_chains_init(&fc, CHAIN_SZ, seqno_inc);
-	if (err)
-		return err;
+	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
 
 	tsk = kthread_run(__wait_fence_chains, &fc, "dmabuf/wait");
 	if (IS_ERR(tsk)) {
-		err = PTR_ERR(tsk);
+		KUNIT_FAIL(test, "Failed to create kthread");
 		goto err;
 	}
 	get_task_struct(tsk);
@@ -618,10 +584,10 @@ static int wait_backward(void *arg)
 		dma_fence_signal(fc.fences[i]);
 
 	err = kthread_stop_put(tsk);
+	KUNIT_EXPECT_EQ(test, err, 0);
 
 err:
 	fence_chains_fini(&fc);
-	return err;
 }
 
 static void randomise_fences(struct fence_chains *fc)
@@ -640,7 +606,7 @@ static void randomise_fences(struct fence_chains *fc)
 	}
 }
 
-static int wait_random(void *arg)
+static void test_wait_random(struct kunit *test)
 {
 	struct fence_chains fc;
 	struct task_struct *tsk;
@@ -648,14 +614,13 @@ static int wait_random(void *arg)
 	int i;
 
 	err = fence_chains_init(&fc, CHAIN_SZ, seqno_inc);
-	if (err)
-		return err;
+	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
 
 	randomise_fences(&fc);
 
 	tsk = kthread_run(__wait_fence_chains, &fc, "dmabuf/wait");
 	if (IS_ERR(tsk)) {
-		err = PTR_ERR(tsk);
+		KUNIT_FAIL(test, "Failed to create kthread");
 		goto err;
 	}
 	get_task_struct(tsk);
@@ -665,29 +630,14 @@ static int wait_random(void *arg)
 		dma_fence_signal(fc.fences[i]);
 
 	err = kthread_stop_put(tsk);
+	KUNIT_EXPECT_EQ(test, err, 0);
 
 err:
 	fence_chains_fini(&fc);
-	return err;
 }
 
-int dma_fence_chain(void)
+static int dma_fence_chain_suite_init(struct kunit_suite *suite)
 {
-	static const struct subtest tests[] = {
-		SUBTEST(sanitycheck),
-		SUBTEST(find_seqno),
-		SUBTEST(find_signaled),
-		SUBTEST(find_out_of_order),
-		SUBTEST(find_gap),
-		SUBTEST(find_race),
-		SUBTEST(signal_forward),
-		SUBTEST(signal_backward),
-		SUBTEST(wait_forward),
-		SUBTEST(wait_backward),
-		SUBTEST(wait_random),
-	};
-	int ret;
-
 	pr_info("sizeof(dma_fence_chain)=%zu\n",
 		sizeof(struct dma_fence_chain));
 
@@ -696,9 +646,34 @@ int dma_fence_chain(void)
 				 SLAB_HWCACHE_ALIGN);
 	if (!slab_fences)
 		return -ENOMEM;
-
-	ret = subtests(tests, NULL);
-
-	kmem_cache_destroy(slab_fences);
-	return ret;
+	return 0;
 }
+
+static void dma_fence_chain_suite_exit(struct kunit_suite *suite)
+{
+	kmem_cache_destroy(slab_fences);
+}
+
+static struct kunit_case dma_fence_chain_cases[] = {
+	KUNIT_CASE(test_sanitycheck),
+	KUNIT_CASE(test_find_seqno),
+	KUNIT_CASE(test_find_signaled),
+	KUNIT_CASE(test_find_out_of_order),
+	KUNIT_CASE(test_find_gap),
+	KUNIT_CASE(test_find_race),
+	KUNIT_CASE(test_signal_forward),
+	KUNIT_CASE(test_signal_backward),
+	KUNIT_CASE(test_wait_forward),
+	KUNIT_CASE(test_wait_backward),
+	KUNIT_CASE(test_wait_random),
+	{}
+};
+
+static struct kunit_suite dma_fence_chain_test_suite = {
+	.name = "dma-buf-fence-chain",
+	.suite_init = dma_fence_chain_suite_init,
+	.suite_exit = dma_fence_chain_suite_exit,
+	.test_cases = dma_fence_chain_cases,
+};
+
+kunit_test_suite(dma_fence_chain_test_suite);
-- 
2.43.0


