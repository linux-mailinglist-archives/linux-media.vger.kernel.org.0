Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318CC3623FB
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 17:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343730AbhDPPca (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 11:32:30 -0400
Received: from mail-dm6nam11on2077.outbound.protection.outlook.com ([40.107.223.77]:34145
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235563AbhDPPc3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 11:32:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flxsHG1PhYiW6lSyYItVQrxFtuNj7iRDAjbhtPazBepFX3Z4rRgzuJtrk0yuKWwox0zzNHKuw1DCQe1Z/JGdMwkCN167wWcJkj9dD1oPRDcRbQ43jttmOGe7BlobZxGyA63h6hGmMunQqAs9cUjuBCC5InUOuwtSYjvzPIpvq9vGwh/usvm0ltb/nJ8AUiLYDlhietk8EV4ZMTupC08m/0eMGGHRCnZNi/bhmi4NV93cGHkwhqhzfmxpfjB+Y1n9wIK4D6+4Lf5VOjLczXkKOks/o161kdyFgfu8BOA+j4IiePzdjRsCmQbFrl7jxkbO0g4t/WxI3QtXm9D02qtyoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mqWZL5jC8CIuJxQeXjaoreWgn8GfchdINwWOWFLs6w=;
 b=EfBDkOCHdtSm4lFpvR5va1jpCrWzgs2ApWnB08zeNpy8PZvr0wMq7NElaXvOE9in0/7dojHYQISIhi3XvvnfYctzJqy/k2jOaokmvOaBOq5yjIxJ9LEZlGNvN+V8fCuNkNZzAZuiUS+Ne8bXrM2oBnePazCg6eSImNgBnG5jjfDfqaiQqUCxHHtcZzsv+3367In5KuUOWHyv5WGCMyK42xOd0OTKVn1dBvXv3+kAjqwRJFSIxFmZU83ZEwFP66w/HnBQ24uUFjuKmpUiysaO3gzgAT4Z1d+n5P4aeyTUjE3ltQzX6GPVXR0ctwX6fVAQUxDJDlR755P/Y0l1oSYfuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mqWZL5jC8CIuJxQeXjaoreWgn8GfchdINwWOWFLs6w=;
 b=1783WjZw7rnG87yta4YWh+yiA8PO6/2voE0jFI6bYOISmemvH4ofLpIEd1WXy1Y5W2piTT/1SvEwbhCiCFOMGtk+5K/LokJN9DmETc/SFIykqx2v1Apt8Iu70YP/Pyv0xOGvvPTMzuLkO1i1KYUJttNR/VxTzEfyLjapc4/axdQ=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 15:32:03 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.025; Fri, 16 Apr 2021
 15:32:02 +0000
Subject: Re: [PATCH 23/40] drm/ttm/ttm_bo: Fix incorrectly documented function
 'ttm_bo_cleanup_refs'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Huang Rui <ray.huang@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-24-lee.jones@linaro.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5035dd00-45a9-80c0-7bcc-8035167a8e0d@amd.com>
Date:   Fri, 16 Apr 2021 17:31:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210416143725.2769053-24-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:5d8d:1198:63ca:8fe4]
X-ClientProxiedBy: FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5d8d:1198:63ca:8fe4] (2a02:908:1252:fb60:5d8d:1198:63ca:8fe4) by FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.7 via Frontend Transport; Fri, 16 Apr 2021 15:32:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42b1fd54-7807-4e94-a42c-08d900ecc887
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4222528C4E1DA443FB2B810F834C9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cilYuwvUDirLesQ8Z1/45UkYTW66EIZxqUolKO33EiICZKSfPmBaJNr85+KGoCq6GQdf5hBWMuGcw4kOaN8B1h0RhWVGuSqt6QwiTFUksGTJ5UXxMp/9NdQseVk1q1gdkOFs53ZomK6QDBMG80oESVsGYLxyb6cBAlnQtMgaMvE2R5wD3O+Cce9fPPHfIlJA1vbyrlcsr12iEEy7FUNvItI2VMI29gxohWaZkU+jNWO8ximijK059LCB4+k6/cfgc7gDEoTzmxBSo6TmAskMfEH4uTcbhCqJ3PtFxLJrMUFRYB34hh0BFkDf2epOk4tKvKOGqypEoJcSI2TggDuCK4hQGrz8aN5qht+71TWo6yuNmSsQGN0FsvwIwA4EgjsrbZ1Y5u6rECD64tnCNjcdeYZaf7KKxbHUzLzyz6G+AXkV/b2PIPaSuyEcqeuGF0rUepGbkpmaHOhvywzWVjPNIgYFJ+1IQ9is4bGyN110ApDz9bg+pHD0sWYr5qIShqlLurMhjbQpHMeuVWcaEK6ORSG0Rj7mzdcGK+BNWoyWHHGts+vZYcYGP+RpJdzD0ro27B4eoeXa5+9w6mXwWTWpLIsPZa4GVYX3ph2RbKLCeLz6EkT0ayjTi3ZW98I273TsjDFwHoXvirj/+oRs0WtoIC/XqH7nP1nbwUUTmVj8UxiE9Ef3JEngTS0mMAhOYe16
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(38100700002)(52116002)(2906002)(86362001)(31696002)(2616005)(6666004)(8936002)(4326008)(31686004)(54906003)(5660300002)(66556008)(83380400001)(36756003)(66476007)(8676002)(16526019)(66946007)(186003)(66574015)(316002)(6916009)(478600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L1dtbk1Bd1crZDNPV1pzM1pxZ1BrbE5BWlJJaEQ3cXl3SGRWY0wzTkt2Z0c3?=
 =?utf-8?B?YWVEelluZVc1aUs2ZHVCTTltaDRUc09MVHMwQ0o0Y256V244RHlOclpLTm5o?=
 =?utf-8?B?eC9JS1hyQ3l5cHhCMnhCMkpUV29NSmhZa3RSV085WkpkUW9sVXA1YVJ0L0Ns?=
 =?utf-8?B?K0ZsTkErdjk5cE4yRWRUQ0xSdWhqenFJRHl3T2dLc3RPWlJIQy9WN3Y3YVJW?=
 =?utf-8?B?TFR1M1I2M05iamhxS0wzZFRneG1aM0hpUHJYL2kvUHBkbVgvMzRlRldXN0xJ?=
 =?utf-8?B?MmNZbVBwRW5UaDBOdHJtN0RhYlMwSjdUMFJaeEhZNFBIL0tHTGRiTkhBL1Vj?=
 =?utf-8?B?SnQ5b3FVbmh3TEducVlqVmk4M1VSaVJkaXpQM2pOc1kzRlZYUnBpR0VmdC9G?=
 =?utf-8?B?b0JTdnFmTXVMK2NLRDhIMXkvMHdYVmFIRGREbVE3WmFIb2puNnhzZk10a2Z5?=
 =?utf-8?B?bHVWL1kwREIwQUMyeE1qQmtiL1dyaWpxcGcyZUJURjhqdm5PRHZ3WTdPRDJp?=
 =?utf-8?B?NGt3MWd6dE9xcUI5NUcxaW9Md2p3c3QvQmlxamN1czkzRzJ2dkl4TUpCdk9w?=
 =?utf-8?B?RE8wUzg2eTM1aDRYelZmUmtxaFExREtseGJUOC92RDJaOUJRYS85RWdWUzJz?=
 =?utf-8?B?RjhNS0NNL2FSbExiSkNsYjVYanJiU3Q0SWhiYUl6c3VnY2dQVGRES0ZZblJw?=
 =?utf-8?B?bXZKVFZMMUhSN0JWalNUSVp4R0g0M2dUdmkyUmQ0OGxrOWN5VHY4YW52alRD?=
 =?utf-8?B?VUxGdytvei9Lc3F2U25QODUrcDVacWFxWkczQjZidkNJd1FOdTNwYUtEZ1BF?=
 =?utf-8?B?V1Z1cS9YUHBueGx6RzE5T1VBa003TnhSOTA3a1gyL1JPZzFMQUo1RjAvMFlR?=
 =?utf-8?B?S3RPZGJjd0dmV1k3ZmIwbTFLb1RKV29rb1pGK2JVVlhOU0ZKVjJqV05vUnJL?=
 =?utf-8?B?ejRQT2xPaHJEWit0N3hQN1pRNG5PZld1NjdOZVZhZ29HTHhISFhWOTlxeFBo?=
 =?utf-8?B?SkMvMFJJNElKZ29FeXIrbi9uU0UrYS9YNmNwalExUnNaYWtwYnBHUFVxRHlo?=
 =?utf-8?B?TjJ3aVEzb2RCSkRuclhKSm54dWhiMDNGbFhBdU1JbXY3VXR5UGRLZEphSUcw?=
 =?utf-8?B?eW5pVmtESVlGK1FneFZmbWNMOHpFU3BVa2M3MVhXQk5SeDZCRXRpa3BLU0tY?=
 =?utf-8?B?L3N1bGJUUnRNb1QvajRlS1Fjak9MK09PZVBlYU5uamhiK2N4M1dLK2d1L3RN?=
 =?utf-8?B?eVR6YjlTUTEzTFRKbWtlb09hdVI2YXJUeVB6KytCNmVPbk05OGZsK3M3K3Yr?=
 =?utf-8?B?OEdZdzdPSWRBSHNhQkl2RWw5V1FQQkNNQnpnRXZ5bVZaOGJnUlE4VjVnd0NS?=
 =?utf-8?B?TDRZK3dHZGVjVTNVZk93Wm9qaEFHaXBnS2x4T25aVjZqVTRHU2w5Qm0xSzNW?=
 =?utf-8?B?UUhTZ2tXV05xcW5PVUNRa0VmSVdMazU0TG9YNFY4QVJ4Z3p5c05pQUpSY2cv?=
 =?utf-8?B?dFVuSWJzOXc5RDliM2F6MHhaRkQrZkdNa1lKQ3hUQlFkUHprbHRVNUNhUDlG?=
 =?utf-8?B?M3pDT3M5bWdlcGxZQzR4NVNkNEU1RVpiQ0RMVVZoQXpRWnBVNndub1MwaVo2?=
 =?utf-8?B?WjU3cDFNNUhoOEg3QTkzcHhTSEtuaXNhd3QzVTZNNmZKRzVjdEtvZEkraXMx?=
 =?utf-8?B?Sm11eFVBWTRUaWhlWDg5amJ6T2xGcGpvdEhGaWxCdVRGb09rMmJORVJEMjlh?=
 =?utf-8?B?VVJIUjNGMlY4MUdsUjdHUHdyT2FnM1pXcEVXQ2NzU25kZ3laWlQ4ZnloZUh5?=
 =?utf-8?B?alRnM2xyYjludGNUMTVpWXBxRDlHNmhvcnR1MzRwRW5hVWdaYmVSTldMd1Y1?=
 =?utf-8?Q?a4T45QyKZx0BT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b1fd54-7807-4e94-a42c-08d900ecc887
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:32:02.8199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/9rY83na1EolVrkuEySaNcT4wVj7ZQHLDfu8UOKHm9jGqmAU+3sVC8YFNCwPH/M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 16.04.21 um 16:37 schrieb Lee Jones:
> Fixes the following W=1 kernel build warning(s):
>
>   drivers/gpu/drm/ttm/ttm_bo.c:293: warning: expecting prototype for function ttm_bo_cleanup_refs(). Prototype was for ttm_bo_cleanup_refs() instead
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index cfd0b92923973..defec9487e1de 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -274,7 +274,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
>   }
>   
>   /**
> - * function ttm_bo_cleanup_refs
> + * ttm_bo_cleanup_refs
>    * If bo idle, remove from lru lists, and unref.
>    * If not idle, block if possible.
>    *

