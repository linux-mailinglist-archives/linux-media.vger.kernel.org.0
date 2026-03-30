Return-Path: <linux-media+bounces-57619-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JM1Let7ymlo9QUAu9opvQ
	(envelope-from <linux-media+bounces-57619-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:34:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EB335C0F4
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30A4330274BC
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A333D4126;
	Mon, 30 Mar 2026 13:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VxF0AyjC"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010004.outbound.protection.outlook.com [40.93.198.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172831F4180;
	Mon, 30 Mar 2026 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877400; cv=fail; b=R+1QoodAEs9i3t18w8EDkLOVdVFV3+3mbLJSGRL3kEn0/EvpO9ZE5u+OlDjvb7ghFDb9erAZy9IfYKl88sf4V12FHepo/sI0Ijym9/IgBfv+G4m3ULgK6LIWp5MdCiqmxcUgMsastiJOqOqGEJ+VZ+OE/KXBPdVBm1oGguUZc6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877400; c=relaxed/simple;
	bh=w317AzSJp5c7YEe37q/s+/DN8IQHq/cpFZPy45IGyFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jWDqBgiwXE7K0DOVrskSKLmN4MA9dMvN3VjHXecCGGU6WoI7VD0IEAhMkq7+vDwavr8yZh67bWafBitW/vQlc9BICG5CpQtm14+wMFXpk0Tfm/sP/4dCp+6X8MhABA/gPK5nI4R6aLDKL59ycUYJFsOF9wE0aTzgw0Uwi4XKwkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VxF0AyjC; arc=fail smtp.client-ip=40.93.198.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qia19ncz6iw9s0SVwq5f/wJDt5cFdzugaKZnNY7XxIXtC6okKM+75ekzRAhJrXLvSuodXJB44qW4jOWO214MZ+2cJEjErqhw1AzQ9IJDHZk/Y3z9PugnD82y84XIaBCKZciAtlkhA11v7yonfHeGU4+m9daFZ5bQAOsxqqOhc7F6r4Vpvz6kfhAxmyoan0XT3F/BdiO1mJ7xB21TRPTwHYWkyvRK+8Bux0wjZfLVbv3AtIqBgxxdsaO0LCyNQ77snsAaHFEMLOmGaI7sK2K2RLnAKsE6LVNoh6SUTi2unF/lP/F3vcb0EMeAbWtrNGcdHxx/t8KgaVBqSVSD//64Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHu7oARcXqcT/LqkwGigPTk9t6jPyJrXft+ZJ+vmMcU=;
 b=PIqI7pGGerNGIADOHBzyw2gZhpJ163Afp9l2RdXgtBtjVu2glQADqUEIEkHAjBeTJjMzr0BoVUE5TXDeYgUaHPULtDPweFw/Wl9OIDyy6LSKcJcLGRYeO4Swkn4O6F2AwLJKv2vk/EXGMqkHITpn7Fn1MGkapnHm8FXnuGYsE2O/4yb2OEyH6bfTG4+1hnDu6xLikvyDjlhcU2u2wvmgGS/KeMvcR7zzn9a6yznN9ioh2SI/fp1E6oP36NOI8lAbAvV6hqi3OAcoAK+7X+knBufBxsUfce3Ow+yynSf+sRBNKpWfrCEzL9WEkg3A3XxTWbgwdHKger6D1YBXH17bJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHu7oARcXqcT/LqkwGigPTk9t6jPyJrXft+ZJ+vmMcU=;
 b=VxF0AyjCz20eZ7BjTxW+KL4CZbGsdT7D7vL4EinTpMlBnW1UzwYpRd1QRXCYm8vcYmyg4Ck6eBAqdBCy6lHD1K+rrhWOFYVMQiSZaBOURYl8GSCTw+F0cHNHGzP/ClfxJTW1SQ0lvvFRwzMrd4+lhErK4Afb6mgOZs2m6DySI/MlL+IlV/pRvhMa0eNRYJVQG+IhpT9wHrDwmFLd249xLhEyKU5phhURmOg1sVlIcX0kJ+1GR0qH9rL9APx5f8h2B1J1V4/+9z5pNVlV2b5cs+mbVaOAjm90z5yCqTWGxdAzC35+tlieSC1vpXekXwhvZ1Qb31kYgqe6RJDNAD0PKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SJ2PR12MB8737.namprd12.prod.outlook.com (2603:10b6:a03:545::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 13:29:53 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 13:29:53 +0000
Date: Mon, 30 Mar 2026 10:29:52 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matt Evans <mattev@meta.com>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
	Alex Mastro <amastro@fb.com>, Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org
Subject: Re: [RFC v2 PATCH 02/10] vfio/pci: Clean up DMABUFs before disabling
 function
Message-ID: <20260330132952.GS310919@nvidia.com>
References: <20260312184613.3710705-1-mattev@meta.com>
 <20260312184613.3710705-3-mattev@meta.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312184613.3710705-3-mattev@meta.com>
X-ClientProxiedBy: BL0PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:91::14) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SJ2PR12MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: d98875ad-2983-4e78-1a78-08de8e606cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	M9J/TwJwDqumeOSsPEFp5Nsf0kvZfyF2qux7T8afKKg8obGy3427UAX1cr/7IJ5tS2T//8ekDw7zwFWd0gh4Kuq/NDSkPrbbrD/PSBQr+pupPwE4MFx7aBVRA0zmNZhNHxXnzfU2Rf9IyvK+qF1pvV0cgyD+QqrVmjYtmhakacef+Gm2DNK4wbtnVp0T2Jnk4Ka4U7EE3DARflaGrMHjAjcyuNwYGsnRX6Kf9KbR7LB/nxinSKtXqHoGRdQ08ZVSxc/MbwOu3UR0ZcB9FhhD1pfmJci3iGMtkOOJrO0Q+0ZBg0ZmG8hmeY/NetRD7D3c7hmSXTcs9QtL2M5v8YYL3WbwvXB3Mh2avPR9L7hmmDhWVtXq1zDFP2V3vyYsRyxTcgPNx6woYmnHaWhZj8pELKawxZvV/VGzdJXTNcg5zAejB3mAkTtqAVhg6kBJW4hXfpW6dFAw45cGM2Z9Xa2N99eLS+0hXOzxNfpyH31fUV1crEFnZ/PbkIrptrPZiN+wSWKejgDKNj8gsvf2NjvEeMC8j6gLBZ8BILVXkQt9ymuNOggjpDg29KKmO6S9RASz2RBjNESSdNWbOnXDzdhqXjDk70WEsgf8f4uy8a9mbbEYd7pOFvkOe5xabbjE68Ce0cTQOxl5P+EdTjlxBWXkPDoHLUtHmHar9sdErcN0yOjHnWBvVMYQU2JRKl1vcanwGncnTxCeWWAaz2CophYbNS8t9QME6HOEJcIwzBacWWw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tOxcbMQ/YsRPetYIOFGHqp3+2LYxMnEcNC1plELL1pidwjvFV2j0YTC8ecoe?=
 =?us-ascii?Q?+D7MLYV2a69zdM/22dny9NK3eziPtiMIZlAtSkkMOeKTucxW1Q2x7Zo+iqwP?=
 =?us-ascii?Q?crI/g9jrfhvhnEmdpPmGvw1/NDt+j0oZJenRVLccWEKNNCjN2Y74fxehPY+t?=
 =?us-ascii?Q?JQbbZuJJ/hg5L3LOQ2vrB4Lb4HqjLCMl5gO4YnvPdTg0+207bkblJtchWxJm?=
 =?us-ascii?Q?uLC5q4UZ8aNeIVh+uUwAIvZWAp6yhuped2PwrFwcaQOogK1Hkjik8p6S99Rr?=
 =?us-ascii?Q?JT2mbcUKuTxkib7YPtuGAlr/b4Hl8CZbJ79r0ztDyGYUQ5YOB1RB6kGpyLR8?=
 =?us-ascii?Q?wKhQna/Mk8r2l1Ch6aB4S8k8fLXQkOZo/zJrY94Vrc05NilPaK0ejNFnqhQR?=
 =?us-ascii?Q?cBWA3n0ccMsOmF4ks7yZVZpP7c5LfR9NQZWsJ5n1SzWKy28l0KRFXiQm+t/H?=
 =?us-ascii?Q?quo5A9u4x7QrC+xXWQc+M0laNAeBSHzC6g75dyVBG1qHeFCg/aM3+b1VBJmY?=
 =?us-ascii?Q?DImNdU/YLREY/4V4A31etNBlQr/+uEoZvlTBg1LlhYQNeNu16RfZeYttmylO?=
 =?us-ascii?Q?D31kWgt/lLBM8+WVjbSiYm97qW16/fJGXDHPBWTDidWzXtxkEpmFDt6tvKPI?=
 =?us-ascii?Q?dhAMMoKMghcDfeQp7CYtT6LX+V63SnXWZdtzNhZrPCgz3lnaGV2Fj//s3T3F?=
 =?us-ascii?Q?hI9E9/PcPVAKBXMqoFIK5gdT3eeU6v3EpZjROVOMLqE7s3rkz3Lt1QXnoOmB?=
 =?us-ascii?Q?270kqMDUHqcVgZKCACzDBECqsgBKR6aWO5NZXPvZ36EtYhZipl7PELFtKSlH?=
 =?us-ascii?Q?F+2IgqkOMr58T1ck62zZzly5vO/nX5hhumqeX39WsiJ8qpoTvhZcU3EmGWbO?=
 =?us-ascii?Q?ZqpCFQ1Qh0ggY0yhdOPvcu6jVKdfW9qeu9kfI3sM5UMOllRrM6aZNCuynq6g?=
 =?us-ascii?Q?OXK66pgCf3PtoL709ZUvose05Q3nQMBiwFyFL6jbpJN3E01oVVAIWh1bIoQG?=
 =?us-ascii?Q?4hKQ3xnX6OyoElUMBK3uz7b6FUWZu/mKHiflm1yIfLOYOjeuiveA7HxeYMgu?=
 =?us-ascii?Q?T6WzYzMlxHSN5e+vZJFwKnptZJppi6SguLaSy5DyageB7s8OZMCzh0gtLHVd?=
 =?us-ascii?Q?c62ex1ml6801/MoClo4Nx0wG7+P5eJQoIUZouqYQuRqSeMh3VJiUNgLtKR1b?=
 =?us-ascii?Q?DtN2T+DLMwwgZWGMPQHJGPsjMohmHrqv8MzblTJa2e6TgsSyj5ykSUukf2vN?=
 =?us-ascii?Q?Yii+1Qjry2nl6ozhqJhoOkGAKc9i2kwXLklnTOjzMOHMjOWzuaW7tv1nxBaz?=
 =?us-ascii?Q?P1mhCPLvLnvoK+7NtHsKIktftZgDCqmL7YnucWSrbuERObnK9tc0sNNQvr7Q?=
 =?us-ascii?Q?Mzrt5mznQjdZ9pE6NYKe6hD+6tXz/plx7qvGZtWrjnnkHfXDu2KyGu2fA2uN?=
 =?us-ascii?Q?l4qV37mxTf5DkZ6JqktveiNLKrEvw7D/zDaJRnozXreNmKoSYeUlZiECX+Un?=
 =?us-ascii?Q?tKzXnziP/wjx9gtXnez1Ub3sLrU5S2xqkOqQyYYpi4zlO3KoPT16VImdpQ3L?=
 =?us-ascii?Q?fFiXGPRbeLY8lRoi9nyUGuSa8w46k9LHmmj4b/K4UwhxPeKTT2LqVISKMgwf?=
 =?us-ascii?Q?2Vw1h6EYpq5pWDwgu/mtDmCkMa9RuaNrJLbkFgjrgbm3ZxcgmzcOKl8nq2Yc?=
 =?us-ascii?Q?/y5jSn/mjzxk0G+nZaCJ9aRanjONuT2PjC9xRhPLmIxDGiUr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d98875ad-2983-4e78-1a78-08de8e606cf0
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 13:29:53.2019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Am+YZVIU4IPxKM8pjflYcF38Cbw36CioUFMhtac5/BkltjqmOAkxBLVoLK9LWxP7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8737
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57619-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:email,nvidia.com:mid,meta.com:email]
X-Rspamd-Queue-Id: B9EB335C0F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 11:46:00AM -0700, Matt Evans wrote:
> On device shutdown, make vfio_pci_core_close_device() call
> vfio_pci_dma_buf_cleanup() before the function is disabled via
> vfio_pci_core_disable().  This ensures that all access via DMABUFs is
> revoked before the function's BARs become inaccessible.
> 
> This fixes an issue where, if the function is disabled first, a tiny
> window exists in which the function's MSE is cleared and yet BARs
> could still be accessed via the DMABUF.  The resources would also be
> freed and up for grabs by a different driver.
> 
> Fixes: 5d74781ebc86c ("vfio/pci: Add dma-buf export support for MMIO regions")
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

This seems like it should not be RFC and it should go to stable?

The normal mmaps are cleaned because they hold the file open while
they exist, dmabuf upends that and it does need zapping early.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

