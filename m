Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E738F2BA438
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 09:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgKTIBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 03:01:46 -0500
Received: from mail-dm6nam10on2085.outbound.protection.outlook.com ([40.107.93.85]:5600
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726154AbgKTIBp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 03:01:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bidqKMfKZ1hWfjTrLrga0/N96S/XhQSqGgxEcVftpUd10d3SVG8gQugnfbIRMB+5IUM83PPZ8AwjYRwxdbpqtCRE09wRuC91XAoFjRnHnvFWGeFjSJrmvhhdBh1ZZrZFcr+9Cki7kjLI2Z0MGy6FQQW/XnanRH8kqCJUvXpoJ+w2xaT1HuhxrT935C5F+7GYQQ9l/9x7/88xZ0EZGCIiKQysDqCrWsBBhs81Swevz2A8sjBKe8eJNodxAsgheJzdjix9C6mBkVjzxHHvwWNE6eXpcDjZ9a/iNcb0fZGgHLmf71GZabj0zZki3uqvcjbvPTAC2yI3EOfUKW7O81h1ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slZdSZId28huXdLG+blOKEou52m84PqKYC6WmPyFrRY=;
 b=VlSYfx/Z8Ici7Kmuh0RNerl9Og/w7lpVhGsW+baRG1/k8XVwmpFPeLUxKLyx9SaFNtPSjDkfuLzwckxFpRT1ahxHxu9+yPxr8tX3jT2CTrAFmI5/xkiTOFG4YK05rgCj8vL8/5ngLUn4SVsFRC7kjxZI3jFrCqB8hfHqSfbpNosSZWHjB67WUC5J/v2E2FgjPcjo4415D64SxsaTjZCKEPsJDT+qOe0hK+4OzcOylWfRzS++Yky7EkWNG1OF3DWlGi3yNX6m54e35tO8OyPsj3EP64D1aHjwImGraaQMTlAZJFMub9C5mj02f3uGVeIZrBj3+yazywhWlS7udrW2oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slZdSZId28huXdLG+blOKEou52m84PqKYC6WmPyFrRY=;
 b=BY02aIur8rj22jXsmmFOU18zVjD/uZd2MTte6z0SqQASEGzgsnEaUw4U4IzA8rU+JVxNb1J1O24XYZGQleVZcKCjYP/j6aNkx3uaEtPUF80JGQbfsWkaQ1Xxp+Yb6CmWenfC72f1dJkgSTN5+dhV2BS5CgA19beUb1ONKT/81TM=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4660.namprd12.prod.outlook.com (2603:10b6:207:34::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Fri, 20 Nov
 2020 08:01:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Fri, 20 Nov 2020
 08:01:42 +0000
Subject: Re: [PATCH] drm/ttm: remove unused varibles
To:     Tian Tao <tiantao6@hisilicon.com>, bskeggs@redhat.com,
        airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <1605854993-50218-1-git-send-email-tiantao6@hisilicon.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b01b7e6a-eb79-296e-7f65-2015f020b56d@amd.com>
Date:   Thu, 19 Nov 2020 21:18:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1605854993-50218-1-git-send-email-tiantao6@hisilicon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR06CA0103.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::44) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR06CA0103.eurprd06.prod.outlook.com (2603:10a6:208:fa::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 08:01:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 53e3935f-01b3-4331-4243-08d88d2a83b1
X-MS-TrafficTypeDiagnostic: BL0PR12MB4660:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4660DEB72304ABEEED70FC2183FF0@BL0PR12MB4660.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uYhq1YZG8pHDvrrzJxec/q2lsEpZphfrGwVBpNOzBXz6wbMLWZaHPc12Lhc2R8CLN1JjjoTpDk4PmUYy5zPPfu5TIWKjx11I9elTC5DTEjJeISapRlp+eQiMhej4Z1F70YpfqVqQvZGI7zm+gjt5F8d3mvhlXWXDfeH2bz1e+94LAYm5cmM1dGxORRFkilmPbJ/TnX2K0YlNR/2xvhQk/F9OWi7FnwzC/bAjl72abmL1vzoV5H0YwgJUi1P+B2jXPZpLdGxs/KSOGDVdKYZqvQGOq5ckkQVupyRcM4S8YGQiMzEwx13f9ja3maSwbewYT+dZr+rSG39AjQJHbzY0aTmi3e1OUgMLaJmfVdzV7PQ/ytwdnVQmoJQOvsinRrb7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(6486002)(7416002)(16526019)(83380400001)(316002)(36756003)(186003)(31696002)(66946007)(31686004)(8676002)(8936002)(4326008)(6666004)(5660300002)(66556008)(52116002)(66476007)(2906002)(86362001)(66574015)(478600001)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K3R0VlhEb21UelBHdlM1Z3lmMnA2T2FEZUhvR1ZMRi9pQTJNcERuK0d6Vk5U?=
 =?utf-8?B?MkNNSTcxb2EvNjRoTGlXTTdwZFAyL0FwRFZQOGlHNmdzMm9ySnA3VFVHRlFO?=
 =?utf-8?B?SEJRUFZpUjY5aE5DWGV4cXVsakVEZXl5ODFVQzFoUythWVJOQk84bUNnbElx?=
 =?utf-8?B?TllOdnA3UjRRQ0RvZ3oxL0N4ZmtBS3Q0M2Vlb3RDcFp6aUN5UHdxWEFVWk9Y?=
 =?utf-8?B?UDBCeGtUNXRlL2NsdHYva3RjemhpRWtSRGhuajkwVUw0Z1RJeWVPVm9PQUh0?=
 =?utf-8?B?M1llbHBveGFPdUJpMExwR0tjaDFHcU5CQlRmejh5eG41RTRXMEdRbnZpajAw?=
 =?utf-8?B?bThYWUxKbkl2dm9HWUZTaTNLVi9saGZOL2xOSWhLTFcvejg4bXE1QllrTjhn?=
 =?utf-8?B?dXJGTEV3YlFFM2UvbGRjc2h2NWt4V1g1YjB5OHZRb0hMaHBOTEtwT0NyVXkx?=
 =?utf-8?B?WjlHdWRXMFh2ZTBTeEdYb1VhWU82STZ0U2pMcEk0KzJmVTViZXJHQ01QdURB?=
 =?utf-8?B?QWEwMnA0Wld1UVRZOTFBWU5vQ2JGeVJVelVjaUE5RUp4K1lsSVJhZjNubXFh?=
 =?utf-8?B?bUpuUlh3RVhPZC8yMDV1RDZVbnNpUGpmdGtsR2ROaTZBU2hYNXRvRnMwTDk1?=
 =?utf-8?B?UzF5TTZzVVJwQmkyQjY4TEVaVkw2a0hkOEZib1FOS2ozRDBFNW1lMnVJbHZD?=
 =?utf-8?B?Rnp6UEFqNTlacS9VT0E3OHRuTnJad0V3RWNtRk1ZUUIrYzFQMmZmTGkvdmFQ?=
 =?utf-8?B?NSsrUmRkbGpEeS9jZ3JoYWMwRmdhQ01EU2EyeXpUVkI2cUtPT1JCc3pPbFlL?=
 =?utf-8?B?anhjS0VpYkZLSVh3YVRaTjhHVy9TYTV5UHdNK3d2M292ZWFtN0I4enlRdDRY?=
 =?utf-8?B?RnhQVC9pSkFhQW9hUEw2THZ0SWNqMHlxTnphNmY2RXNTelQ3Rm5JcEdMdFp0?=
 =?utf-8?B?VCs0ZFovQjMrYmUvOXNFQ3c0UGJtSEM0b3RFRXUxdTVwenNoeVpnSDNscDdW?=
 =?utf-8?B?SjNzWGRVcDc0WlJTRy9jSU1LdVVJSS92MjlieitsRXZwbnlXRG9sdEl0TGxu?=
 =?utf-8?B?NmxOOS90L2s3UThRVkFNK214RjFqUkdyblhGODE3K1JJdVIzNkx1bmFFQ3lK?=
 =?utf-8?B?eHVBYXRVL0s4VTl4aU4yVXY2M0VIT21Wa0RPaHFObE1vSUVUcWNOeUlJOFJE?=
 =?utf-8?B?NHlEQlY3dU1XSjNDSjZPZ2lXQy9FamJobnJJbFlhRjFkRnlpcU1rNkJiWC9K?=
 =?utf-8?B?TnhTcWNEVzJ0UzhKV3J2NmxBRW1IQzI2eTlBL25CYkVvelNTQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e3935f-01b3-4331-4243-08d88d2a83b1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 08:01:42.0984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lQ1C/WwxCior8HHMz1Xl5RdEXoBy1nawGq4qMZpHQft++uR3U6ySt5C9XtPrXLH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4660
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 20.11.20 um 07:49 schrieb Tian Tao:
> fixed the following warnings
> drivers/gpu/drm/nouveau/nouveau_bo.c:1227:17: warning: variable ‘dev’
> set but not used [-Wunused-but-set-variable]
> drivers/gpu/drm/nouveau/nouveau_bo.c:1251:17: warning: variable ‘dev’
> set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

The subject should read drm/nouveau instead of drm/ttm, but apart from 
that the patch is Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_bo.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 7aa4286..9465f56 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1228,7 +1228,6 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
>   {
>   	struct ttm_tt *ttm_dma = (void *)ttm;
>   	struct nouveau_drm *drm;
> -	struct device *dev;
>   	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>   
>   	if (ttm_tt_is_populated(ttm))
> @@ -1242,7 +1241,6 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
>   	}
>   
>   	drm = nouveau_bdev(bdev);
> -	dev = drm->dev->dev;
>   
>   	return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
>   }

