Return-Path: <linux-media+bounces-43341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B380BBA943F
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 15:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF3831886381
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 13:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308EA30505E;
	Mon, 29 Sep 2025 13:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dEDcMOwV"
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010037.outbound.protection.outlook.com [52.101.85.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6F12FF660;
	Mon, 29 Sep 2025 13:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759150947; cv=fail; b=jVuFQ2EVMutiZnd8qRk/d0L0c4sU/il3ppkeNybh6cIAF4qWC/J63iHJYwjOLfMCvxP8IMhcFS3mG670pglPziEgNHOkNO6PPR2rw7E2QOLNIhRUsRFh4WkFUZqH7PnXugcBf+3KuAM9+tUFBv1771DDZn3xGKxej7adYmZjdYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759150947; c=relaxed/simple;
	bh=3qG0n/Gp6HZTsRXptEqtUR4xwhaFlngi0LGNKk6z0Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X8uANJP/D8U6foeE0NC1EAYf4aIGS3GbN3XrT0EFATkWxR5ulGD7HlY0ckxX6xlePh10wzw4ZAppWjzvEQ4af2Ir3PwFzBTRLYVD10F+Ta4OZfIY4eHO+EeB5IvwoXqXiYy+SigEnJk1W9JwmtO/UgbNWe+BAaHoZKfWjJR83+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dEDcMOwV; arc=fail smtp.client-ip=52.101.85.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iwdjv/s9LemI94C7RY5Mt8f95hZ1Q94bIt+EqhXl2CZ5axussoaO0M59NLaB07VL7aBDMi81Y3FU2qq5Vu6Uy20BK34EXUseIeRdMDIfBeLrwWmZPU52vNVWHW4v1c30PPVJ8Ao6JDvmVPhczKog4MWzH+vk4YLV3yVhq/vsQI3szbUL/mW0sRMnptReKj5+gdegLlCpHPXSOijzwZoxwos4jiLln5WD0OeRH7IQyAn3kJpaArLZ+uHxLpRERXE5xVi40IUS0cSjUbpLGZniPuSCgmP3OQbidUn09g3ZeOliTCyBWv7425W3TpKjxJmZVoAj8tefHHmvjs1jr8tbTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXovXJ4yHi1y2HxqGD3Uf6qWlWHFvrFoEqfCVF0MMz4=;
 b=MUdME8yvDouFz/mIRg1a1v3yt4thq9xEzDDc1ERzCFjCdXgq3iCgH0ytMp3s7UZ9yvkkozZxpUIa9MYXku39F3ysFPbxMu0fwfOoHMZzHd//A8/+jp719pBVtt9RUi+5Dq7p02BM0BcaIUxLiPe5OqC2dnh63hTW7rxLluMng1ndatfIfFREsAd5MFYWjPTPLP88oCNwNLjI4yq1s3SkVU2CriEZejypj4Hn4ziwmUVJzztlYACrrLL5YSH0IEJC79UczIQ7zhee7Kjd82feHFmjdBKuGO/SHulFXm+ZjzVJbSEqFpCSSP3T9tmMOholPhXKHE/yIeME1MODiah8qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXovXJ4yHi1y2HxqGD3Uf6qWlWHFvrFoEqfCVF0MMz4=;
 b=dEDcMOwVx38xzI1VbPzVLeMb11aIaCO1uW/JlA6wUgAuIHl49vH7kF1cWcaoqLdXd3gYK6ZRF0NXZCHfQRYQAluslGOF+TutUTG08x44F1EQgTvAQEgD02h+9rWssqrxxKHgZ54uoCJ7O9/15j6PA+OAl/xnAlS4MAGChbH0j3TumYWsOqM0T8/nYRcZMctv5Oo4E4ADXIOrmp+BlVzUKg1crFl6Vs4RtdS1bhzCcik8J+iexNokQFOVpY47zKhdFGTrNowd/U/k+Dr63rRC6OBRuG1NK1Pk6taOQfqM9tS2h0JNA6E3Um3l5kjW/MpgUQXNTY7Tbx5wnSJQCMieoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by DS0PR12MB9323.namprd12.prod.outlook.com (2603:10b6:8:1b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 13:02:16 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 13:02:16 +0000
Date: Mon, 29 Sep 2025 10:02:14 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: iommu@lists.linux.dev, Linux Kernel <linux-kernel@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] iommu: __iommu_attach_group: check for non-NULL
 blocking_domain
Message-ID: <20250929130214.GK2617119@nvidia.com>
References: <9a3ebe9b-518e-49ef-b87d-925d951a446f@kernel.org>
 <20250929120734.GG2617119@nvidia.com>
 <58aabb55-0030-49df-81ed-d4a68174b57e@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58aabb55-0030-49df-81ed-d4a68174b57e@kernel.org>
X-ClientProxiedBy: YT4PR01CA0211.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::14) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|DS0PR12MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: 9887aa36-76b8-48ee-f45f-08ddff586a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D6o9rJvFbPRTWGuCkW29yCp6EmUIRtVdVqGFTqr18SnMnq8s63H481Cqx7iY?=
 =?us-ascii?Q?gjXwY3i/9aCm6ECC8CZ9i+UFO+dMbDqJNxtSGgNw1nJRAZnSTR8t9OnaoB7o?=
 =?us-ascii?Q?V+iNyb/2EuUc0DW0I66DJS6i5J98bQAOcN7wIfEJyQ2rrBpL8QLyScw9wuWe?=
 =?us-ascii?Q?zEHrbSnZhuvAGsDwyn8ybPp+vw9wtj6du9yNgQBfq6YMOlSiwt3WUwf3Sbcw?=
 =?us-ascii?Q?q8I1Jqco8sVMj7Qm+MihDSGknjqa4j512FFyS0hKFZaeblOJqzcN2L/rGZdj?=
 =?us-ascii?Q?Sl87uj73w79Ohv6jRc9gSA5qKSt8Sa4DbGDESpL7ZOY6nFbmAgqRztjWGpw0?=
 =?us-ascii?Q?D2bi2RG5BqvHBTck4WbZ9Y2OnTG4SW1TJDMfVqAFyju+DC96xwJtzyajnrMn?=
 =?us-ascii?Q?vHxuic9f+AxHvYA/veskAa0K7w7YIDus+liNGV5JRgYdDbAlz7vMW+00aLvT?=
 =?us-ascii?Q?ItIXmWUWhfl8S5v1gIOAVQBZglJDHUE38VcKlH00oaHPdkpgJuTUKFWe7jn1?=
 =?us-ascii?Q?L0Cq+ep0wY8MwICCNgYGpA3j4tCwjsoIqT4cfNalPE8IXc9S2bZKq5FZ/Npl?=
 =?us-ascii?Q?IHVpT6rIe5FpSzQGzk2ZG4c+zjIsj7xsmOnThbUNlsyFYh+KrZzaVpaqy5iv?=
 =?us-ascii?Q?LIPfVZrmc/gq4t2v9bGF4OUSxZwsUD9YqGi4L8KAnpGb2EZuJY31n8ogf3si?=
 =?us-ascii?Q?aXs4Bvew6vlmmtpeqipsXy0BVwO/fKTvCEEG2lTOMYBNaucHFef5kHQTC/h/?=
 =?us-ascii?Q?XnEPjXIWAQeW7MYlbeQZfjs4v3M8ZRdDL7XV1EYRAahvevxfOfwh3t5eo0Ow?=
 =?us-ascii?Q?U6A5upQxJJLSgibuoRF8JTZ3GN9ui8m5WdgpYa9xjOeo/CgrDotWv1gg2ZeN?=
 =?us-ascii?Q?Alx8eNEKh5242dTbsyh8WIsDfqxsim8/RKiFN5JDejsMSisOb84o/h2TRbNe?=
 =?us-ascii?Q?Sd6ue0lzm06BoW/KUOPm/97IsTud3klKzvpUyLjE1+Oz6jAjZxrn43Dr2BIy?=
 =?us-ascii?Q?Zf2qF1EqY4jxmEPdPzG6MJ8ik0o04pILUa1WUejcAB1SH0Jbs5hba6UcaY91?=
 =?us-ascii?Q?ja8vuCHClbZiw/o9r0SKBLhFYUwNRsvQ7DXTh/4sa3+GNtetAvEvVIr94GGo?=
 =?us-ascii?Q?ruTfJnBHtpqDqSf+FZuGTcEhka6eiHtsJBTOQb2vurawySwkRSWxlSc44DBY?=
 =?us-ascii?Q?WGoCTqXbjxvw1o39SGJkUc+vkh9ssaE6UiUaclMsSOWPSqWIP2GGPaXX8wY2?=
 =?us-ascii?Q?MbkBPs9L+W4fvcMk18KlL1P/pI4FjGd9FN6DoRraS1FM1qAe70sWQl8VWN1L?=
 =?us-ascii?Q?UJfHC8qm94W+yXbMZ/K/+beAHRXaVPTNtZ3WwpA3z79E/ir0sAzKCFwJvQFA?=
 =?us-ascii?Q?ooS6BoG8z/SRxPC+PF/hK8e0PBOZsbQSZz4rv7JdspomaMh92sc/AkHgJzBx?=
 =?us-ascii?Q?54HeDpR+H1IcIHCGJDGF74Wqrp0X16lK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LNyja5cIImYY5wLvMXYqWJw34U+/zE4vLKtQKPyRHjvLr+XZgrhhatSB+Y2U?=
 =?us-ascii?Q?iWFVbvVQI3FZ9d6gxXeDCh1Yt++5DsgKBNUV7cd3SUA7R1KSb05ejBubZ7X1?=
 =?us-ascii?Q?Ddq2ypGhzc8DxfCPVHk2Ua2FaV7A+opbgV1LROJ2UKhmWNqGDitoOj3o3cmB?=
 =?us-ascii?Q?4g26qeDEi44+4x1f8XZG1c5k1rY/g4EhjAGlBYa4e8vv/wedpe1II+S8mzxN?=
 =?us-ascii?Q?MrF+ctwW+gB5NU3Oq/FjH7lj3n/gb+dLXgkBmy4mh0qOp0TuYc8oczgp4Ho6?=
 =?us-ascii?Q?Dq7Ej5uVMXh1NYxyN65/duzT15fwIMarJmkcMDcbo/Ew02KdBw3a4DAcxnxH?=
 =?us-ascii?Q?relJVxqaKt9tagexRz9lN2hSCRHEfx8hfcJv2TEhEuxzPkdOSfAz9NkU3VXz?=
 =?us-ascii?Q?VJJsBXW+hSiACJvDMXu/mETm3L9FSyMOzQlxa9y4DV/pBl/z42g7Wt3U3QXB?=
 =?us-ascii?Q?4dVPHuOlIK96PmGjukclCCbPlsrFOSR67Q0kBK9a3DeSHb7PtEtBRbbZVwgO?=
 =?us-ascii?Q?QE9HzA5xnxCkfKqCD2WJFBDWeQPCHN0EN/4M89tzhWQNrMdKSMEOCGwrUfye?=
 =?us-ascii?Q?wI5GpNVFsKYeTwa8aaV0J5GQcRmQEtryTIdTWRZxx2TaCe8iFi3kiZDrYgSn?=
 =?us-ascii?Q?uzCnEXWd064ZHYMNsoPu2ZHolNLaDA+i/siBWOYcdC5dE15WJyGNaoVkv9ob?=
 =?us-ascii?Q?GQ596a72d28TvcD5jcsC0OWo3FBnAJ3XtCEM660KTBCQZwO7bdy5SgF8eLSr?=
 =?us-ascii?Q?pnUv9FXRotZQg/jz+40ULjDzoPPgvzVilA5/bPttLLfgtDvgjpKxtb85KT3k?=
 =?us-ascii?Q?VVPfpIy2VNDDBRml0wZmXn8fIi4Q4j66XuxemUv2ra7YdoX5p8Fuwt/5t/NP?=
 =?us-ascii?Q?rw0QV1WFrh1AnOD/SZF8RpVfeCGztFUd/IZ1zYRqay0dTG/x/ZSI5s57ked1?=
 =?us-ascii?Q?QWzx7x2CI1NSQQbBA/lo5A5EriSj6sNYXekr8xJlhNkTwEf5E0isvyago6zb?=
 =?us-ascii?Q?Vrg7oTx0y9J4QuF2RttivJtesHNzCcBI7fNDSNv8QihGkxTSop+JmCES9Iti?=
 =?us-ascii?Q?VFvaO5eYaj2voxM5+BBlG3WmmYu48cATj3UAHwLhT7m6Nm8XZx6suJgD0IGQ?=
 =?us-ascii?Q?TBNLgKZdN9ZTzOrxdA51Z4kicHDMjJ+ZH9YhlTVi9boHO5Hqp2ZHj1wZ8YP6?=
 =?us-ascii?Q?pxh04DYyNCW9WrixtP4IjFfDkXE5/xrq1mgSleg61f7cfDgkjWM1X7hXaA+W?=
 =?us-ascii?Q?s+fb2HwwC38/uCSkjcJOXjV0hktlIZ19joil93cita5p+wcTMOilKkkWQ//Y?=
 =?us-ascii?Q?1JKPreqPDzwQ2Kd8tL/eclXXBzAMGY4pqnf0gKCeATCkORXd6Fkuh7xg2Jtj?=
 =?us-ascii?Q?3x8NR55QY2V4d6Vk27znJOM0/atk2J2MxKRhN7hBnGF8RDXatYVezWk2Pd12?=
 =?us-ascii?Q?p0ioxNHbPdKqFnUHSdpaAGEZSYthivxiz0Lkkrtwyy+wUZAqZc9rSaAUXPfk?=
 =?us-ascii?Q?uwDQ9F8fL6FnTeZWaU9XGoD91+nWluLq8xoLuNkymPxKn+tT5NkYil1toiyG?=
 =?us-ascii?Q?QjbGVZOsasW+jIBB/SY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9887aa36-76b8-48ee-f45f-08ddff586a3a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 13:02:16.2343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3OqciB+8+GAcXVJeRetBP/yTzEJnIArhy5p4dpwkbDpBVoExkbZ1lUM5g3MrRbu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9323

On Mon, Sep 29, 2025 at 02:18:50PM +0200, Hans Verkuil wrote:
> On 29/09/2025 14:07, Jason Gunthorpe wrote:
> > On Mon, Sep 29, 2025 at 10:23:47AM +0200, Hans Verkuil wrote:
> > 
> >> Since I am unfamiliar with the iommu core code, I am uncertain whether I am
> >> just papering over a bug elsewhere, or whether this is really the correct solution.
> > 
> > It is papering over something, group->domain is not supposed to be
> > NULL at this point.. That probably means the iommu driver has not been
> 
> It's group->blocking_domain that's NULL, not group->domain.

Er, I thought you were hitting a false positive on this:

  group->domain != group->blocking_domain

ie NULL != NULL

But I suppose the whole expression is checking for group->domain
already.

All your patch does is entirely disable the safetly logic :\

What is isp_attach_iommu() trying to accomplish? It does
arm_iommu_detach_device() and then arm_iommu_attach_device() ?

Why?

Is this trying to force a non-identity translation for ISP?

Jason

