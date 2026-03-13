Return-Path: <linux-media+bounces-55689-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANgbNBgZtGkihQAAu9opvQ
	(envelope-from <linux-media+bounces-55689-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:03:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D8528471C
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 70CA33151B29
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888343A4501;
	Fri, 13 Mar 2026 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="s973ffBy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B11C3195EF;
	Fri, 13 Mar 2026 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408578; cv=fail; b=nxYxsIJ4ixNdqrSvqCJx4LW+ddpSsRZ4yXSp3pHTgdgL+b0nLolKgazLlXf0T7INyXp9Bkpav1kmoMSbqtPZsWlrhy+YsyZLmrZ5dNd4n56VtetEqgJzDpY/kfpc9YyQnelzzoaqASJ8Z7YUlhkCNVU+fcZ4bRPnbP9EwSnTULk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408578; c=relaxed/simple;
	bh=9JlVfPKMiJD1CaFE68cnjLOeuNjdb6iTJg6v4qdhxyA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SawyQdrfVN9Bs62OrjSRdVrYcszrT+Sh6dP0iP3CRyH2/Yw/qg3p5/mbCjZWKu2T1X53jXqDwswDDdjhN8yIFCNKbCjL/Wdiu3ZKKNqghESN9cARKcrXpdaBqFq8E/Kjiv/uELmCH+tN4OowdNhqpZkFYdaATS5+wMeg4ur8LHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=s973ffBy; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8KK432106567;
	Fri, 13 Mar 2026 06:29:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=sRxiw1itkZJY4wqSUs1hscUlPOT8spK/PrGm946cWk4=; b=s973ffBysAen
	cEfo/aKcUfFgg/tccYVQaVqCpAtptZWMXQcdfo5zlH/JxQNAYOWEPvD4qeV/dqWR
	W9sm/WJAGGdziAjYgr8RWWvhv/2XTpD1DAY6E7I+56sbetMgwy/ID07ccjFGr08/
	I3gOVYL7NRHCAjCmxicy9oYYIOCW2vioqgbOP1c+xHWpXSCJMYC1IuJ9YBBXpkfT
	OpKWTL/HrreKtzSlWpsggG5+UoezOz+BSM3CcPgRDb7OEZ1UfowGVmubSqu+uCIe
	2McHthQcLcIwvoMjIVnEHkeDennrA++K6/6+yClcZPbPQN2MEkhKiD/0NuDHT2dS
	5ascSgDMbg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4cvf00ttg2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 06:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=beEsewfrJOFNmEn/r6hMn3ZVsdth56YlzolKGh7ghg+o0FwRCRkqABnO3vVrishAuEXXtEOUQGpeFcVdpVCu982KWrYDAycAz5XsWEUbg2nAkkvLy35ZtjvQqWoC3ugotNawwJyOgAiL0i8CAYF3baYZ9m4EF9FImvucxYzmJw5PuLFYjLlJyekZmgAkbU8m8uLi0NDHP5EwvvKZUHIBLxUSZ4FYlV0Sh+P+3GdaiAqI5gSfoURlqGlMX0t2a7bxmosZzPe0EIrGiAYxim9UahH8XIAAmrn9OkK9rbE1HD0EnDNFrixncjuxDkxOmr3Qlt8la6gpMViJ4Zw2YY9ikA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRxiw1itkZJY4wqSUs1hscUlPOT8spK/PrGm946cWk4=;
 b=kAAbXsX+7TgK2hMqDSCy72YPnijut95oUC20Xw5Di9luabrfo15XxUXb1dOu3oRJ9g7TLdCyglCO8Cqxzbdh7B7gLV8PhXLg4kryrQw6+ptza9bZCUGog9Xtp0fDJOq6dy2ja/xfCYjf6xeNOyjoTNGNYBcLri3+bIsYXhu2L0dISiy5l7A1RmujhhVvlIpppizvZDAhZw5NzKEVtS2VSkoqCAHDxA1w3TGUHgf59HdXhSElTZ8kGw6c6YEjOf11Zh1ZOMCyE2R4VgieIMnEaQY+CP7AY4znYl0QRzurW7oijY5EA/sTeNBDuWU0bjED04iz7KGTBmAYa9CldgdXyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from PH0PR15MB7038.namprd15.prod.outlook.com (2603:10b6:510:38d::10)
 by DS0PR15MB5724.namprd15.prod.outlook.com (2603:10b6:8:144::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 13:29:18 +0000
Received: from PH0PR15MB7038.namprd15.prod.outlook.com
 ([fe80::617b:b77c:494d:de19]) by PH0PR15MB7038.namprd15.prod.outlook.com
 ([fe80::617b:b77c:494d:de19%3]) with mapi id 15.20.9723.008; Fri, 13 Mar 2026
 13:29:17 +0000
Message-ID: <967e1169-a95f-4c4d-88cf-d0c467762139@meta.com>
Date: Fri, 13 Mar 2026 13:28:59 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 PATCH 00/10] vfio/pci: Add mmap() for DMABUFs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
        Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
        Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>,
        Pranjal Shrivastava <praan@google.com>,
        Alistair Popple <apopple@nvidia.com>,
        Vivek Kasireddy <vivek.kasireddy@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        kvm@vger.kernel.org
References: <20260312184613.3710705-1-mattev@meta.com>
 <22eaf986-3fa5-4904-a7ad-dc7316aa1165@amd.com>
Content-Language: en-GB
From: Matt Evans <mattev@meta.com>
In-Reply-To: <22eaf986-3fa5-4904-a7ad-dc7316aa1165@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0050.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::14) To PH0PR15MB7038.namprd15.prod.outlook.com
 (2603:10b6:510:38d::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR15MB7038:EE_|DS0PR15MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a60dc3-ad02-43d5-adf8-08de810486de
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+8LFyxR/NfbGBegNJETgSDHV5QD970WGvQvZv9W9BjeU/+H+UtR9LZjOAkaOw8Q2itucWe+2v0kYVEwceVEKyszkMBfChkonzOmH2M+fuRDHHw1ZSes4B23u3ftp00xhr2PFb5AUD9uqFhtFOM6i1b3HL5kfThZ63xrt+QZFzU6Jv2AUHlDnP46D7Ld2VldF6Iz9ATPu2cK9J4+lc225QHUo5y6CBng14ynSj1meI8jFYTgcaeIx+QzJSEVc937qBLEi+hgyqEV9kQXBCP2Ijnr2W94qhrK8Hi+C3OQsazvo+zLuO6WBQEa786ILPlTAz+cuPi1l6et+kJjsEWHEDDIDQ5b2dpotj3AUPLiHFlyEO9azuH3aKc3jE7b1aTAUybtuxLd0Ojz+uynVnSDK9LAAjfQgsSp+eR+AuCLCA+SOoLAjlkYbURRvuSsoEtk3XVwo/71Ur+EBfK2hfyQ4U59q9IySt75bmFgx6uGOn0Z5kNgWn6q93odPFHz8bHvBJFUqExOKUdnuvQOq8ng1Mgn5oU6b9Efc8fpQ6tz3PxEI1mILOTWJr2YzNjidRz6kCbN0Zj8YGsLEw7DvF1L+p1ujoaDuohK4W/y3BYuWC+BfcxfH8bfweTw3bkWNOT3ZlPd6oZdywVgfzXzEgAUhN+l/0ub8+L2AitH5qkBjCd+34F/07OMBcYAMfQkxkCEsqWhmPwKLenNNqY7ZyxgEwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR15MB7038.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnJ3L2JPWDJmYWkwenowODU4Wk1SZGdNM0VPRWJEblZ3a1QzbUoyc003OUc2?=
 =?utf-8?B?V2orYlg3UFBxSWx5NVF4YStIU1lPQVZxUlFmUDlFY3laTzZRLzRrWnpDOEM2?=
 =?utf-8?B?cEVsRzgxUkV1MWJoU2hOTllnZVE0QTZ1bDRnYmFLTExxQkhuSDF1blFYek94?=
 =?utf-8?B?UXljcTNxZG5yS2RkTTdrMVNJVkFHTUZWWUVmVDFtUG5Dbnc5U3E5cmlwdGdK?=
 =?utf-8?B?THo3MnNFMnJGTDQ0Tms1d0NoL0FGWmQzVmxOZHZWYjc0RkZ1dElEN1lPZTll?=
 =?utf-8?B?Zno4Q1R2Zm00d1hPTkZJMTQzck9FTzQ1Nm00WnN5SFh5ODFXUi9Yd3AyMVNq?=
 =?utf-8?B?S2N0aVZmNTJTdGtzd0VMRTcvZEdCQy9Ed0Fqdk55dHRCOGVKeEV6R1NndEVk?=
 =?utf-8?B?TlNrbVoyYWJ6QVF5cXlPZW5GWC9iYkhHZVo5SE1DQ1g2Y2FzazYzblBMLy9H?=
 =?utf-8?B?RTZYL2NMdWo3anRFTThGWVViRHhTeHMvUXNUMmRrSE1qa2ZydktnU05EaE5x?=
 =?utf-8?B?bGxRU0pXVTBpZTRqZEYzY1JTZTJlN1BVRW1QbDdKcVFvQnJLUlJTZGM4Y3Ni?=
 =?utf-8?B?MitpOEk3KzRKQ0hyMGpPM3ZPZ2ZXNCtLYzVhQmZXVEdyZHBoblQrVDlwSUd1?=
 =?utf-8?B?MHJBdEpIajZKd21va0ZFRlBNaEQ4WHUySmlhVU1UbmphY1Jlb1RUSkY5UUQx?=
 =?utf-8?B?VW9PaFE5d0dUL2tjMkhnV3NhcTNFbmRJWU02eTVubitTK1EwVjVXeGdqdklY?=
 =?utf-8?B?QW5lTHpSaW4vOHFSNzdwOFFGU2dvNDZ5Nml1aVBzTllRVDRlQnZOTzdFU005?=
 =?utf-8?B?Mm9NRnVzZWhhazVQa2Y1a0svSlJmTFRGaFo4dGVwYUowR1FRN3Q4a3FaWlpk?=
 =?utf-8?B?SDRidzJ6RklYV1YwY1pId0VoWVhCT0RzUTFTdEVrZ3k2bUV4MDlxZHRQNmJZ?=
 =?utf-8?B?YXVObWtZM0FLYnJ3cUl6eUttUGtBbWF5N1RETEcyNlJMRVpybjZYRmNVKytk?=
 =?utf-8?B?WEhhdGZVRS9paCtiaFVFWUZybkpNa2lCTVp5dk83NVBIOU5oNkc5MkE5NnhV?=
 =?utf-8?B?QkxsTVBOTnlhei9zTHRYeHBVM01LRmZjbjFnSVlVQ2hXaFc2em50Snd3eHp3?=
 =?utf-8?B?c2JFN1BhcWpLZWhpSjMrSExlS1NDVU9IZUdUTmw5QXdFYXU1eGJnbXh3YjhH?=
 =?utf-8?B?WCs2RlVGWExBOTFaYkk0UTI0ZE9PT0x5aVYzRjNmblVsdVI4UTZleUN1Mm1y?=
 =?utf-8?B?TG01QlVnYVRYUjNZcDNxWlVrSXIzSFZkRHhkSm1jY1Y5M1BBN1hoMjY5QWFo?=
 =?utf-8?B?L3I3eVR5OGdnZEp3OGoySWtodGZ4a3UvVkFRMUdTQ2trRE5jNUNuSzZqRVkv?=
 =?utf-8?B?aURUU2tjcG0yaG1weER1S2M2N1ZKYzM3eUd4bVIyTGRnVmJMNkwxS1REK3Yr?=
 =?utf-8?B?VGhtNzBueXpOMTBsQ0lZalI2SGY2UEI0MklPNk5mMk8xcERkdWV1RjdwV3Ns?=
 =?utf-8?B?TFNnVTlIMXIzYmtpWTkyYk1wZXZQcUVvM29SUHgzK3MxMDNmbXJ2ci9MVkRE?=
 =?utf-8?B?SC9FZDR3eFJLc0ZBSlRsTmROUW8yWHN6Y3R0N08zaHp0cnhtRXdMUHpWVi81?=
 =?utf-8?B?bFlPSDhJRU5BMDRoZzh2Y1ZHTHE3YlBBYVBEVktkV0lPaFBmYWd0TlkwRmhn?=
 =?utf-8?B?bmpyNGI5eFVvKzlpWVdJNzlyTXpWOThxdEFPeDhiU2QrQzZaNWNna0RxWDIv?=
 =?utf-8?B?TkhmODNFdmY1aFlKWEVtZ0pGeWF1QVB3eUE5MmN3RkJHYTZEV1p6Z2VSaDNx?=
 =?utf-8?B?UHhFamNST3JmMXBwRVRkVU5RMkxjZmd3QlpKbldYU282SjFqQ0E0QjRCM2FQ?=
 =?utf-8?B?NE83MnkzcUxsYVk0NU53RElPUDZKa3E2Y3lHaHBSU3B1WGJ1MUtvRGtwSm5q?=
 =?utf-8?B?SXdKcFVaVWxORGlhTGt1QnBPVVBBLzBSSkpQWkdvdktwZDFxbENVeVNLdGt0?=
 =?utf-8?B?M1lmb3ZhVk55Vko1clVQek1CdTJwcEM5Y1VoL25qMjVMdjhaS3ovR3BRaWJ6?=
 =?utf-8?B?VTVYSXJNOFRtUk5JSml6WC9uQzRtRTlxYWNFQUlUNkJRbXJRYWdNMHBaeGJ2?=
 =?utf-8?B?akJFOTdYdEtQZHYwaURjQy9nNm5uVjBlNlZJU3ZkUGlQcDZDN3ZFcW5rM21S?=
 =?utf-8?B?NVdSZEhEc3dJS1kyaXc1MHRFaGozeWV1SXhyV011bjYxWDB3c2ZLKzFMY2dE?=
 =?utf-8?B?V3lJYkQ2NS95aTBEdzVhUjBnckZ5UHpxWkZ3d3JpcDh5enFncjNaK3lsa1lq?=
 =?utf-8?B?QXdVSnlhUnZqNXdzWEtPODFrV2hZQ1Bva3Jvb2pGZGFlbEd6d0dVdWJaOXJU?=
 =?utf-8?Q?Acw5+ypWkcICVz/32HSuZCRoBG0pXWsTRTMsV?=
X-Exchange-RoutingPolicyChecked:
	iTfNl8dW9iDC8z5YJ+Kj2mWyGZDCy43n84B2zns9T7wz/+QxUMgV+IzHsZJJ9qIzQltCpRJHpWDh21/ErrEM1FVi+Q/4KtMWbF8MbJtvSlN2SThtaO+tTO6V4wuJShtjeDA9NnQwl4vQZBHP49H2Xr7Z6WQfLtxE/Rz+1/WrtkNy4Wf+sn0Qwmo35LJkLfHrLA1fqm0VtvmNhPt5ag8dcm9aLbOaKZNVj2IM5zO+rDQgGx3iJivpbwqwPXBEdAg2G4pEKmBuBwQFW4ynTIRh85otfPP1GQzRwecIXum6/LT/4OO8acR9Tq5atDxI+o2Q/Tyoah/7yQ5uJFi0WqvZCQ==
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a60dc3-ad02-43d5-adf8-08de810486de
X-MS-Exchange-CrossTenant-AuthSource: PH0PR15MB7038.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 13:29:17.8236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJxJPpR0nM6ockRyGhouvD8LOD0q4MxjQ0/q8lC6RuZ9T5fF+GHu49SLlhJ8rMI6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR15MB5724
X-Proofpoint-GUID: 0ae6gC1EeOe4itiZ0BfycFZ0UoNl9bv9
X-Proofpoint-ORIG-GUID: 0ae6gC1EeOe4itiZ0BfycFZ0UoNl9bv9
X-Authority-Analysis: v=2.4 cv=cJ7tc1eN c=1 sm=1 tr=0 ts=69b41130 cx=c_pps
 a=+kBkz34/1DjdJIz+AnMsKg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22
 a=VwQbUJbxAAAA:8 a=FOH2dFAWAAAA:8 a=VabnemYjAAAA:8 a=bG7EhGF5pE8zC5nVodEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNyBTYWx0ZWRfX/DtC+384U2Mb
 Lf2SCi+SJD4fWc+4ftHGRK45sFU4BZgQnMWJM9LDOcM1+DPpAzYPknI2S+mXeneiR4SEa/NUQCE
 mihZPNdKuto6JF/806wDgmjganfMJt3yKgSJSozYtCegqJc406IQRjAWCT2kTq0fPp8O3QfZICO
 XQT+WodNlu6HcWVrUkUaj0x8AudpGTahOExpyB5EzsPvwFPuOMfufEuhdPmFHguIz3t6tlGEa4w
 IQT30r8qxmJlTTUJ8saBViK45UGnEXTrUhOfEBBKusIJmOKECVAn6jJLwGo1GoN1qrq+ZsnYP+f
 lMWz4MCKJzBWzOfZ/0HGS8//nxY5raKaqZCYFkionj0ig0HKYAqYhEg2iJY+6W2eyXfhY0gCLWY
 hpmOOHLA4sD4UU89NGqDc57Fk3YjMiSRNNslYeFERvKKHqqxx9hjSqa15RSCI7EzBHatAxdS58+
 tRIS4p2zlrDxq9BxqPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55689-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:dkim,meta.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[meta.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3D8528471C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Christian,

On 13/03/2026 09:21, Christian König wrote:
> On 3/12/26 19:45, Matt Evans wrote:
>> Hi all,
>>
>>
>> There were various suggestions in the September 2025 thread "[TECH
>> TOPIC] vfio, iommufd: Enabling user space drivers to vend more
>> granular access to client processes" [0], and LPC discussions, around
>> improving the situation for multi-process userspace driver designs.
>> This RFC series implements some of these ideas.
>>
>> (Thanks for feedback on v1!  Revised series, with changes noted
>> inline.)
>>
>> Background: Multi-process USDs
>> ==============================
>>
>> The userspace driver scenario discussed in that thread involves a
>> primary process driving a PCIe function through VFIO/iommufd, which
>> manages the function-wide ownership/lifecycle.  The function is
>> designed to provide multiple distinct programming interfaces (for
>> example, several independent MMIO register frames in one function),
>> and the primary process delegates control of these interfaces to
>> multiple independent client processes (which do the actual work).
>> This scenario clearly relies on a HW design that provides appropriate
>> isolation between the programming interfaces.
>>
>> The two key needs are:
>>
>>  1.  Mechanisms to safely delegate a subset of the device MMIO
>>      resources to a client process without over-sharing wider access
>>      (or influence over whole-device activities, such as reset).
>>
>>  2.  Mechanisms to allow a client process to do its own iommufd
>>      management w.r.t. its address space, in a way that's isolated
>>      from DMA relating to other clients.
>>
>>
>> mmap() of VFIO DMABUFs
>> ======================
>>
>> This RFC addresses #1 in "vfio/pci: Support mmap() of a VFIO DMABUF",
>> implementing the proposals in [0] to add mmap() support to the
>> existing VFIO DMABUF exporter.
>>
>> This enables a userspace driver to define DMABUF ranges corresponding
>> to sub-ranges of a BAR, and grant a given client (via a shared fd)
>> the capability to access (only) those sub-ranges.  The VFIO device fds
>> would be kept private to the primary process.  All the client can do
>> with that fd is map (or iomap via iommufd) that specific subset of
>> resources, and the impact of bugs/malice is contained.
>>
>>  (We'll follow up on #2 separately, as a related-but-distinct problem.
>>   PASIDs are one way to achieve per-client isolation of DMA; another
>>   could be sharing of a single IOVA space via 'constrained' iommufds.)
>>
>>
>> New in v2: To achieve this, the existing VFIO BAR mmap() path is
>> converted to use DMABUFs behind the scenes, in "vfio/pci: Convert BAR
>> mmap() to use a DMABUF" plus new helper functions, as Jason/Christian
>> suggested in the v1 discussion [3].
>>
>> This means:
>>
>>  - Both regular and new DMABUF BAR mappings share the same vm_ops,
>>    i.e.  mmap()ing DMABUFs is a smaller change on top of the existing
>>    mmap().
>>
>>  - The zapping of mappings occurs via vfio_pci_dma_buf_move(), and the
>>    vfio_pci_zap_bars() originally paired with the _move()s can go
>>    away.  Each DMABUF has a unique address_space.
>>
>>  - It's a step towards future iommufd VFIO Type1 emulation
>>    implementing P2P, since iommufd can now get a DMABUF from a VA that
>>    it's mapping for IO; the VMAs' vm_file is that of the backing
>>    DMABUF.
>>
>>
>> Revocation/reclaim
>> ==================
>>
>> Mapping a BAR subset is useful, but the lifetime of access granted to
>> a client needs to be managed well.  For example, a protocol between
>> the primary process and the client can indicate when the client is
>> done, and when it's safe to reuse the resources elsewhere, but cleanup
>> can't practically be cooperative.
>>
>> For robustness, we enable the driver to make the resources
>> guaranteed-inaccessible when it chooses, so that it can re-assign them
>> to other uses in future.
>>
>> "vfio/pci: Permanently revoke a DMABUF on request" adds a new VFIO
>> device fd ioctl, VFIO_DEVICE_PCI_DMABUF_REVOKE.  This takes a DMABUF
>> fd parameter previously exported (from that device!) and permanently
>> revokes the DMABUF.  This notifies/detaches importers, zaps PTEs for
>> any mappings, and guarantees no future attachment/import/map/access is
>> possible by any means.
>>
>> A primary driver process would use this operation when the client's
>> tenure ends to reclaim "loaned-out" MMIO interfaces, at which point
>> the interfaces could be safely re-used.
>>
>> New in v2: ioctl() on VFIO driver fd, rather than DMABUF fd.  A DMABUF
>> is revoked using code common to vfio_pci_dma_buf_move(), selectively
>> zapping mappings (after waiting for completion on the
>> dma_buf_invalidate_mappings() request).
>>
>>
>> BAR mapping access attributes
>> =============================
>>
>> Inspired by Alex [Mastro] and Jason's comments in [0] and Mahmoud's
>> work in [1] with the goal of controlling CPU access attributes for
>> VFIO BAR mappings (e.g. WC), we can decorate DMABUFs with access
>> attributes that are then used by a mapping's PTEs.
>>
>> I've proposed reserving a field in struct
>> vfio_device_feature_dma_buf's flags to specify an attribute for its
>> ranges.  Although that keeps the (UAPI) struct unchanged, it means all
>> ranges in a DMABUF share the same attribute.  I feel a single
>> attribute-to-mmap() relation is logical/reasonable.  An application
>> can also create multiple DMABUFs to describe any BAR layout and mix of
>> attributes.
>>
>>
>> Tests
>> =====
>>
>> (Still sharing the [RFC ONLY] userspace test/demo program for context,
>> not for merge.)
>>
>> It illustrates & tests various map/revoke cases, but doesn't use the
>> existing VFIO selftests and relies on a (tweaked) QEMU EDU function.
>> I'm (still) working on integrating the scenarios into the existing
>> VFIO selftests.
>>
>> This code has been tested in mapping DMABUFs of single/multiple
>> ranges, aliasing mmap()s, aliasing ranges across DMABUFs, vm_pgoff >
>> 0, revocation, shutdown/cleanup scenarios, and hugepage mappings seem
>> to work correctly.  I've lightly tested WC mappings also (by observing
>> resulting PTEs as having the correct attributes...).
>>
>>
>> Fin
>> ===
>>
>> v2 is based on next-20260310 (to build on Leon's recent series
>> "vfio: Wait for dma-buf invalidation to complete" [2]).
>>
>>
>> Please share your thoughts!  I'd like to de-RFC if we feel this
>> approach is now fair.
> 
> I only skimmed over it, but at least of hand I couldn't find anything fundamentally wrong.

Thank you!

> The locking order seems to change in patch #6. In general I strongly recommend to enable lockdep while testing anyway but explicitly when I see such changes.

I'll definitely +1 on testing with lockdep.

Note that patch #6 doesn't [intend to] change the locking; the naming of
the existing vfio_pci_zap_and_down_write_memory_lock() is potentially
confusing because _really_ it's
vfio_pci_down_write_memory_lock_and_zap().  Patch #6 is replacing that
with _just_ the existing down_write(&memory_lock) part.

(FWIW, lockdep's happy when running the test scenarios on this series.)

> Additional to that it might also be a good idea to have a lockdep initcall function which defines the locking order in the way all the VFIO code should follow.
> 
> See function dma_resv_lockdep() for an example on how to do that. Especially with mmap support and all the locks involved with that it has proven to be a good practice to have something like that.

That's a good suggestion; I'll investigate, and thanks for the pointer.
I spent time stepping through the locking particularly in the revoke
path, and automation here would be pretty useful if possible.


Thanks and regards,


Matt


> 
> Regards,
> Christian.
> 
>>
>>
>> Many thanks,
>>
>>
>> Matt
>>
>>
>>
>> References:
>>
>> [0]: https://lore.kernel.org/linux-iommu/20250918214425.2677057-1-amastro@fb.com/ 
>> [1]: https://lore.kernel.org/all/20250804104012.87915-1-mngyadam@amazon.de/ 
>> [2]: https://lore.kernel.org/linux-iommu/20260205-nocturnal-poetic-chamois-f566ad@houat/T/#m310cd07011e3a1461b6fda45e3f9b886ba76571a 
>> [3]: https://lore.kernel.org/all/20260226202211.929005-1-mattev@meta.com/ 
>>
>> --------------------------------------------------------------------------------
>> Changelog:
>>
>> v2:  Respin based on the feedback/suggestions:
>>
>> - Transform the existing VFIO BAR mmap path to also use DMABUFs behind
>>   the scenes, and then simply share that code for explicitly-mapped
>>   DMABUFs.
>>
>> - Refactors the export itself out of vfio_pci_core_feature_dma_buf,
>>   and shared by a new vfio_pci_core_mmap_prep_dmabuf helper used by
>>   the regular VFIO mmap to create a DMABUF.
>>
>> - Revoke buffers using a VFIO device fd ioctl
>>
>> v1: https://lore.kernel.org/all/20260226202211.929005-1-mattev@meta.com/ 
>>
>>
>> Matt Evans (10):
>>   vfio/pci: Set up VFIO barmap before creating a DMABUF
>>   vfio/pci: Clean up DMABUFs before disabling function
>>   vfio/pci: Add helper to look up PFNs for DMABUFs
>>   vfio/pci: Add a helper to create a DMABUF for a BAR-map VMA
>>   vfio/pci: Convert BAR mmap() to use a DMABUF
>>   vfio/pci: Remove vfio_pci_zap_bars()
>>   vfio/pci: Support mmap() of a VFIO DMABUF
>>   vfio/pci: Permanently revoke a DMABUF on request
>>   vfio/pci: Add mmap() attributes to DMABUF feature
>>   [RFC ONLY] selftests: vfio: Add standalone vfio_dmabuf_mmap_test
>>
>>  drivers/vfio/pci/Kconfig                      |   3 +-
>>  drivers/vfio/pci/Makefile                     |   3 +-
>>  drivers/vfio/pci/vfio_pci_config.c            |  18 +-
>>  drivers/vfio/pci/vfio_pci_core.c              | 123 +--
>>  drivers/vfio/pci/vfio_pci_dmabuf.c            | 425 +++++++--
>>  drivers/vfio/pci/vfio_pci_priv.h              |  46 +-
>>  include/uapi/linux/vfio.h                     |  42 +-
>>  tools/testing/selftests/vfio/Makefile         |   1 +
>>  .../vfio/standalone/vfio_dmabuf_mmap_test.c   | 837 ++++++++++++++++++
>>  9 files changed, 1339 insertions(+), 159 deletions(-)
>>  create mode 100644 tools/testing/selftests/vfio/standalone/vfio_dmabuf_mmap_test.c
>>
> 


