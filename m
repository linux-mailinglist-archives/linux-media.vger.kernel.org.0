Return-Path: <linux-media+bounces-62152-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHUiLUZ6DGoSiQUAu9opvQ
	(envelope-from <linux-media+bounces-62152-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 16:57:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F317580FC7
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 16:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51043306666A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3AC31E844;
	Tue, 19 May 2026 14:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bCHlGGqz"
X-Original-To: linux-media@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011053.outbound.protection.outlook.com [52.101.57.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2993242CA;
	Tue, 19 May 2026 14:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202618; cv=fail; b=DH9jyHunuo2XmgR4AKHytAPYpWTQtUv5zL2jOaEhacUXecZ9OgxFqnJuHAADk2VqiVJ30YiUDdafgO4v+mlE81IZlxC49jeIMI/+AXkle3hHGdYoMKhPzqFS34Nr6NgNE1G+DhEw41ysHgDE1OkgKM9cNKDXoKiO1QnKsPoCvhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202618; c=relaxed/simple;
	bh=IRec6ZH41qyyCpTBDcOCrgL85SExVq7sdisVmxlQCNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Thg6bHlEmi+LSAhm+fUUr+ClvIyBrd1aSBTgsXsTsLdRFrYm0JSvD8sj2JEoW4+AiJinyHDiaN7LMb06rYNXsjDOnh44i6JeSvVL+czzlUCfEWYW/4jjWCbVRFrv8MxNYJAGtY71coRzM+/b/EFj6y5fmOAGLw6ygUpCLroJTxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bCHlGGqz; arc=fail smtp.client-ip=52.101.57.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJ4Q4LaGvDPUbM9b9PCCV3Weke6z79L7SzKl5o7AZPtQxvUofTAMCU56w3goHqzu8Yy23uh8kkg4V6BUTq9zu3LYHRaD5cwHVCO6i4awu747ldSTF7sShHBKiHiQPKj1N4C1ACKJs4OaJaHdmOpLcUybfx4JFxf70dcyPMvweA4HSb+u/HPv98uCOS3xamTUF6MJ1f4g3SBeYyTHgu03R28HAejsKDnipjAURMchflWVfK6uOkN01JrkYU4G2B+0E+t1Mcu44WGEC5eiSxIznHYdxWvDL8fBx2BQgS47iOqRUa0vaj8aac3hp5XcZ159LrBF1ZVLkHJ5EEkBcPoOYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftv5J2n61PMhLXfdW/djuMLo9CFFUDPP14l0Nl3WZmY=;
 b=C1SSWzyB9FqpDmH0otdenQjV46oL5/QtqADLyL1Kzt2DFPjCayMiZos0fUfIfl89s3VQqrIXQ3rh0OVr9fPLUL0OGt78WxZEmdDKkzQBtufFXs1nARBQZHJsNuSooq4oQovmEADwtvLhrkBrDbDPrp7DUMsp9TkO5ne+n9iW63lRTxOh+Ll0GKHSI1tvSOXB/AEFzru6rUVzcxIFMmsAMyzdIaekftjSwTnOxyF+N+a8ExiQpznUc+mA26GOCGkz22DPHmxoqEFUjGifW5JUuL1gxukEoIA2Wa2h6acORu2SoRbKEquVm2IWKsaa5eoY3cTMTdGuuuwe2IQz6ptZCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftv5J2n61PMhLXfdW/djuMLo9CFFUDPP14l0Nl3WZmY=;
 b=bCHlGGqzHak8zGulSEvENW74jMMCT8Guif2luMll39cGl9SH3BbGXrQj6QvwkQB8mzsh8mYMq4UAVPYXlSh45J4mSTJdRVe9Pk46HJcJjMyuQUyvjytYdbOIzHkCE9xa2CaDItz4hZjqQGr9HSlp0HmXNbNMLq2SNevT7t6oSmy1rY9r9AnaYD/H/+htBrr5fAT9kI8HLy7c9GggC+03dWNhmRfuOKBiEv8/pKOUVxXlgDIlx9/qzPauKFIi3Gowxz4LsNNfRfpudBVi4+24lKdD3ekTw+DSkfxldQ3tcMlAA9ew2OP2NSGwx+CGKqiWSGpnP+HNmMyNSXSvL+5BKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS0PR12MB7801.namprd12.prod.outlook.com (2603:10b6:8:140::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Tue, 19 May
 2026 14:56:50 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 14:56:48 +0000
Date: Tue, 19 May 2026 11:56:47 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matt Evans <mattev@meta.com>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
	Alex Mastro <amastro@fb.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH 3/9] vfio/pci: Add a helper to create a DMABUF for a
 BAR-map VMA
Message-ID: <20260519145647.GA3602937@nvidia.com>
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-4-mattev@meta.com>
 <20260424182426.GG3444440@nvidia.com>
 <c598a21e-ee50-42d9-98dc-2959e84ace50@meta.com>
 <20260430171106.GA6829@nvidia.com>
 <2d0eb275-64ef-4710-806b-36f6b32f7122@meta.com>
 <52162da4-e1cc-4f90-a95a-218d6089cd71@meta.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52162da4-e1cc-4f90-a95a-218d6089cd71@meta.com>
X-ClientProxiedBy: YT1PR01CA0129.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::8) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS0PR12MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fdb41bb-ff17-4994-6556-08deb5b6da2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|56012099003|3023799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	1AtSy38tdOQ+JzXGVnaifU1g78CiGJ2FMC/SqIgAOL2dos4clgrzUvgGOcZYIfZTubGp/Im0k5pHdaPe2aJQK5YtIhecYJ0XKWdyxlavLFRip4fwcnCVTAspkx93UV1YarYcUfx81LuCUFHQVgPs2hKx+FC0XYew/I3tGvV9wZPJ0y0eSl3Y1mfxpxDcmVj66V2FpbHCPZVCXHc5jWHh9wk3URrVUh2tp2vMP5SITMp6RDA6X98cIaIoFwiOiaWsZ09LQlIG3UixYmfSaD3X+WQqm7JArofdhqriBPs1Luo49eOKRZAPOXg1oepyeRkCQOwzcM+2dY6t7IN9QKdj/dvLRQpPJQsLzEMv+Ls2EBB4jR4XF8sIX1vdKqIflvuslG06xwNk5cBLQ4rwtZ1oY4CemQzrWxfOp6dih1p8MTnZ1ZhdYjMHlXqH31m8a7gkbgEr0olWhyVX491BAgB2XHvMupW2ieUQ7XdDP0tKW2Q5dObeWJelEBZ5vUTS5wRWWMCKXpgFIBCHU5wc95LutM96eBmw5gNqhbHCI00viTe6b5anOBLUJpwJc72vc9TZGNQQI7eAIqyiQW11eEshoUUGJEdtDtD3d8h+JVgSoZM5pCFF+SbzLyG4y4VCoHZu2jtiEWw6BwwalGzx2Yh7cHB5ZlNYbFj7WMzVGwaj/PkTOBjgIuquA9RnlclM1LSS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(56012099003)(3023799003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXdnL0hmUmExL1BZSzdVamlxRjU2cnJyOGpGbTB3ZDFPVmVUMDVTNE5YVzBX?=
 =?utf-8?B?VDBNajZwajBlS1J1VlZjVmlVd2tSNW04MzlWOVN3Y1NyUm5ZU1NrbHRiRVZt?=
 =?utf-8?B?bUhtZ1Rvdk9GNk5EQnljN2IrdFg2WFIzNWlXS2xOVjBZNm1aNWQxaXVRMXlE?=
 =?utf-8?B?L2VBTXFMYW0ra1c1VmFTM2V6NVNnWTA3TkZsN1M4OWI0RGIvcWJtV3hxVFV2?=
 =?utf-8?B?aHFMZUxUa3RGbFNINFVNeFdkRDFzdTJMS25RZS9rZk83NmRyOWlYNGZsaWFU?=
 =?utf-8?B?aG9LRjdDcTNSV0dOWmpIU3ZQRFY1MWdGSExBc3F2T0VUZS9QeVdmak9HYWcx?=
 =?utf-8?B?YmRSd2hxVmVJVE9TVFZJVHNmL3lnLzlnVGtVM0wySFB0dDJONWxYaDdQZTR0?=
 =?utf-8?B?ZXRib1FKU3NjOUtKN2t6TU9xZ1NFdGMrSGVlYUc2Zm9kTzNRbUExUTg4S00z?=
 =?utf-8?B?bGJvY1pXd01ILzVGZjJVYkt4d1hodWszL2dsYWk2bGh3Y1dUTlp6V3hEREtM?=
 =?utf-8?B?YzQxOExCaWNOV0hBUmZKelFmN3h6MEwwcXlzNU8zNlR6V3QrSXBMTjFQRUt6?=
 =?utf-8?B?OHdQMHpPQjRZRmwrSmJGdHh2L253LzZscENEQzVCd2UzZ0RHNjlqMTVEZ1RD?=
 =?utf-8?B?VjJEVWJhZ0pDWngvL3BxNUFpVENxQ2N3VFdkTHlxSlEwU01pckt6aC9LTm9p?=
 =?utf-8?B?MmlXMGFLRUVUZGdzOWhkVVJoVUdaWUpST1RSTzNnbGxJUHpmNTZBZXRHNmp1?=
 =?utf-8?B?eHRKTnZGZUN4TU41WEdac2VSZEhONGlHWEZ3ZDJjZm9DSEJpSk9IbjBOL0xO?=
 =?utf-8?B?ZjdFY1o0K1c4V056VjMyYlpNMzBQOGpwZHJ3aUwyMzV0Zzl4MU5CbVZmUXE5?=
 =?utf-8?B?NzllYy9jYjBJQ09ybDFRZDRvMU41SHhDLzNGaWMzRG9zZ3hyUjhPVW51UkJt?=
 =?utf-8?B?UHpXR00zZEcvc2JaUzJPRG8yR2w1YisxMFIrNHdvSTl1NVJ5SDFPSUxkNlhB?=
 =?utf-8?B?MVJ1Y3orZ2p5aGszZW1JWFZjKzdUcnRvZ2Q2SGFUNXF5Ny9WQ2M2MnlOcDk1?=
 =?utf-8?B?aEFkalJ3Tk03a1ZDUysrOGNFTzF6SGk5ZjdicSttUHpHS1FMTnphYXZtYm1H?=
 =?utf-8?B?ZlJrcGFJN1RyQ21PWWsvYTkvbnRUdkxncFhYM1pOeUdzT1UyS25QbXJUV2FG?=
 =?utf-8?B?dnJHemdCVnJ0b2c1ZS9kK2tsZnB4R3pOTnQxbk1HLzBNRXc0NzRwNnJZcGwv?=
 =?utf-8?B?OTNEcVUxYmFoY3V6a2dMRXZvNEJVa1M1Z0g4bXZsT2Z5Q2tPSGVjY2RKMyts?=
 =?utf-8?B?Q3hkMzRwSHF0dnJkaS9XR0p6eU1uUzFzb2ZBbGNqVTBqR2gzOFdxYmVyaFdt?=
 =?utf-8?B?VjFIcG5MMXd2U001VGZmSmJSRE5RdHBmbjFNWGgzK2FLSUpRY2pyMjB2TjR6?=
 =?utf-8?B?SVJNUnVvbzBGVlVSanFKYkoyKzl3RkNjd3RJRGZrRi85aDBnU2cwZUN3clJp?=
 =?utf-8?B?cVZlNFhVWTRNekdlSjR3UCt4V21MQklrSFBMK3AxRmVldWJHMmZBcnJDTVh1?=
 =?utf-8?B?cHNqVjFXNGVqVGhCaWNpYlFZSXIwdUhJSk8xaUhSRitvMzNudk5sYlZZdW5r?=
 =?utf-8?B?S3AremhWVFl5TU92NHFHMjVtZDU0Skg4d1cyeWE1eWk3RHByUFFVWFdwWXgr?=
 =?utf-8?B?N3RjcU1qMFRJNDcvbkRZam5IRE1udHFxZExaZlRrTWZycmF3cEJpRHZQeDh6?=
 =?utf-8?B?bnVPZ1JPVU5TOTMvdlhVVEt2Z3h1QzJLOGVxclNmZGp0dld5RVcvb09iN2x1?=
 =?utf-8?B?RGZrd0VySVRoTzZSRjhHRUNpTjRJUjFIdTI1aDkzSHpkS0xYQWgyZjc2c2Uv?=
 =?utf-8?B?dk9xemhPUGlrRkllVHNGQ1FLVWtLZDNmZlVtZ0w3OHNPczQ4VHE5NlZWV2hD?=
 =?utf-8?B?TTVrZHZpOUxWRDI0ZEx5aVpPQTZZbWNKU0h2MHF0aTB0TlNuNHdjWXM5QnNS?=
 =?utf-8?B?a09Xay9aakZNZmpkdEdnYXpBd2xvbnFnOEU1NGNuNWZEQ3U5NkdKdjFHbnZV?=
 =?utf-8?B?aFBCQlpvQWNPVWl3c0liZysvWDZGUCt4MXVPK0o4WlB3T3RjdExrYURHdzFm?=
 =?utf-8?B?NTRaVG1HdVp4SDlJYkhsV3JWUlhwdlhrNTF4YnRLcWEyU0d1a3lGcC9Idjlm?=
 =?utf-8?B?a0lveTNLelcwVG5SYjl2MXNhT0NHVzMxT2dweVFuOE5CNzk5LzNqQTVKNEsr?=
 =?utf-8?B?bHdGb2NXdFV3UUlNUWNkSDU3N211cmdGUW01NWdNaGV4QU9MV3JWR28raTEw?=
 =?utf-8?Q?WoA+CwPMDtnqUFETPW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdb41bb-ff17-4994-6556-08deb5b6da2a
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 14:56:48.4371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4+ZqnSD2aY56MLvI0UBGpclLaLJWktGZz9XW4HVV5G8YHjeWjMjeqU3BE0njyxr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7801
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62152-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 2F317580FC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 06, 2026 at 08:03:08PM +0100, Matt Evans wrote:
> > > > > > +    /*
> > > > > > +     * The mmap() request's vma->vm_offs might be non-zero, but
> > > > > > +     * the DMABUF is created from _offset zero_ of the BAR.  The
> > > > > > +     * portion between zero and the vm_offs is inaccessible
> > > > > > +     * through this VMA, but this approach keeps the
> > > > > > +     * /proc/<pid>/maps offset somewhat consistent with the
> > > > > > +     * pre-DMABUF code.  Size includes the offset portion.
> > > > > 
> > > > > I'm not sure I understand this comment?
> > > > > 
> > > > > For the old path vm_pgoff for byte 0 of the bar starts at some large
> > > > > offset
> > > > > 
> > > > > For the new path vm_pgoff for byte 0 of the first range starts at 0
> > > > 
> > > > Glad you asked.  :)
> > > > 
> > > > This is trying to achieve keeping /proc/<pid>/maps (or similar) somewhat
> > > > as informative as pre-DMABUF BAR mmap, in terms of keeping the VMA
> > > > vm_offs column useful.  Before this patch, say you mmap() two slices A
> > > > and B of the same BAR:
> > > > 
> > > >   struct vfio_region_info bar_region;
> > > > 
> > > >   vm_a = mmap(0, 0x1000, ..., device_fd, bar_region.offset + 0);
> > > >   vm_b = mmap(0, 0x1000, ..., device_fd, bar_region.offset + 0x4000);
> > > > 
> > > > ...you'd see something like this in /proc/blah/maps:
> > > > 
> > > > fffff4000000-fffff4001000 rw-s 10000000000 00:07 148    
> > > > /dev/vfio/ devices/vfio0
> > > > fffff5000000-fffff5001000 rw-s 10000004000 00:07 148    
> > > > /dev/vfio/ devices/vfio0
> 
> Looking at this again, I/we got this backwards and I mixed up two things:
> 
> The goal of this patch _is already_ to make sure the VMA's vm_pgoff (whether
> viewed in /proc/<pid>/maps or elsewhere) still matches the mmap()'s offset.
> 
> (For a mo, ignore the resource index encoded into the offset.  Consider just
> the offset into the BAR itself, inside the VFIO_PCI_OFFSET_MASK. I'll come
> back to the index encoded into the upper bits.)
> 
> > > > then the VMA's vm_offs would need to be thunked back down to 0 (since
> > > > the fault handler then treats vm_b + 0 as the first byte of the DMABUF).
> > > > That works/adds up, but then the vm_offs of both VMAs A & B both have
> > > > offset 0, and it's harder to differentiate in /proc/blah/maps.
> > > 
> > > Yes, and that would be correct.
> 
> Why?  This paragraph was outlining a hypothetical alternative implementation
> that creates the DMABUF the size of the VMA and starting from an offset into
> the BAR based on vm_pgoff, and then compensates by setting vma->vm_pgoff = 0
> so that the fault doesn't re-apply the offset again.  That would make byte 0
> of the VMA access correct:

I see, I mis understood what you were suggesting

> This patch is supporting that property by instead creating the DMABUF so
> that the VMA's vm_pgoff (which is maintained and the same* as passed from
> mmap()!) indexes the DMABUF so that byte 0 of the VMA accesses the same
> address above in [1].  The DMABUF spans from the start of the BAR so the
> fault handler maths (which indexes the DMABUF by vm_pgoffs) is common for
> all buffers.
> 
>  a = mmap(0, 0x10000, ..., device_fd, 0x4000);

>          +0           +0x4000
>          +------------v------------------------------------------+
>          |               BAR                                     |
>          |                                                       |
>          +------------^------------------------------------------+
>          .            .
>          .            +--------------------------+
>          .            |  VMA                     |
>          .            |  vma->vm_pgoff = 4       |
>          .            +--------------------------+
>          .            .                          .
>          +------------+--------------------------+
>          | invisible  |  DMABUF                  |
>          |            |                          |
>          +------------+--------------------------+
> 
> Same* externally-observable behaviour as the old mmap().

Sure, but it is a mess..

You should create the dma_buf that is the narrow one that only covers
the requested mmap. The vma_pgoff should be exactly what is passed to mmap.

And then have a simple 'vma_pgoff_adjust' that fixes up the pgoff to
be 0 based for internal operation of the fault handler.

It is nonsense stuff like this:
+	priv->size = (vma->vm_pgoff << PAGE_SHIFT) + req_len;

That is really objectionable, the size should never have anything to
do with a pgoff.

Jason

