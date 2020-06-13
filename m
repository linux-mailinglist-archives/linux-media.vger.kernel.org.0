Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8481F83D3
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2020 17:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgFMPJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 11:09:12 -0400
Received: from mail-eopbgr680063.outbound.protection.outlook.com ([40.107.68.63]:19937
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726289AbgFMPJK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 11:09:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6Tm5GcNw2xyOcKWhTpwQHdTkxXv08I1Q6kKgKFP8X4GmivrzsToTa3FPDRPnAkCVG0efY+6uV6jdp/6WYAcNRBxgscIG63tYfbd3jl1vFpvfH9EERtnRjHq4324iFx0mguWaduZbjwhZntLi+A8ebvAa0Rh7LFapLpwA5kdnyWk94tbsZnUPcj0v/bvzm3rmLPFxj1eX3jqDhVrcPosvHndzDyOUTohRyAew/RBXo7yCVaxsSnPD8KhrJhWoNm0toLM9pYzjt4l2RnuFm5/5q2t4AnXB7VEnLD3v3r/GVMBoYo5J/4JydTsPA9sYL5NvAJzv8B088n3OAMQn2uYFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfhsecbtgRwDfMbrbkhsyF5egVVlNKY3adIDorowvUU=;
 b=NzgVDC8xxRtM1PIEFiRUu9f+QPPkxmlnDHqQnFY4jdOKdqWXO/AKLpl8KoEuROnKUGUWAnV1TJLdWXYOgC6PvjhxchfY6DLW72xuUmJFzoY0aUxW+1Ee0YOVfJR7JlyC4JdCZZ4NLbXd6xWxL7i51jAdLWnJkr1wu1qMvrsFiLKlv6epZuPtqwMkQpeirGUvFY/nLzsKof6oqMzpJYcSJt6EvrGeU0jsBplGZ8SXlZrowAqL+/Ce3IXnOYVVl/ul+rc43kt5pRCZ1CVUjHxE9U8X+rke8jOAPjSDoKiSihFcgo9hEklr7/R8QUvS3zYZPlJxGttMsOG2ExLLRYnzeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfhsecbtgRwDfMbrbkhsyF5egVVlNKY3adIDorowvUU=;
 b=v8JqO46kXCIsSfs2KP59Ubk6rD0XMRApyoPo0a5lQN2pYR3rZURajuAeBaXYYwOy4Uy8X6r6zuZ2fxGutPpRA1cVLUq2YmSLkXAm6eJ6ln88kBA1hF3VUkjt4SOhUJShaCGUUZuJjke0Z3MXj7/yM1ZzxmplmBlYQrgkEsEVZjI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM5PR12MB1722.namprd12.prod.outlook.com (2603:10b6:3:107::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Sat, 13 Jun
 2020 15:09:06 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3088.026; Sat, 13 Jun 2020
 15:09:06 +0000
Subject: Re: [PATCH] drm/ttm: Fix dma_fence refcnt leak in
 ttm_bo_vm_fault_reserved
To:     Xiyu Yang <xiyuyang19@fudan.edu.cn>, Huang Rui <ray.huang@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc:     yuanxzhang@fudan.edu.cn, kjlu@umn.edu,
        Xin Tan <tanxin.ctf@gmail.com>
References: <1592051318-93958-1-git-send-email-xiyuyang19@fudan.edu.cn>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5f1e83d6-9d3b-f7dc-d3e7-4f8ca46e9855@amd.com>
Date:   Sat, 13 Jun 2020 17:08:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <1592051318-93958-1-git-send-email-xiyuyang19@fudan.edu.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0079.eurprd05.prod.outlook.com
 (2603:10a6:208:136::19) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR05CA0079.eurprd05.prod.outlook.com (2603:10a6:208:136::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Sat, 13 Jun 2020 15:09:03 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8528fb35-8da2-40d4-ef4b-08d80fabb6fa
X-MS-TrafficTypeDiagnostic: DM5PR12MB1722:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB172292AE407BB220A29CDC76839E0@DM5PR12MB1722.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0433DB2766
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aqKxlpNkos9fZauUbooL0+SIF8tGuA4FufO5jxiS/AQb/gwqPmIGNKgUHr3L3cA6TUGcG6NQY3TkByQdKclpYObpgdIe/umdC4cx2IlCdcvF5+aXSwoQnt5DhmF80rG8MefSAX9JVLXQfL2oidlUpH5M5M4JlIIMXmkv45MQFaXan+yQrdzS+uyJ0elS5EzUvupnrELjCMe3k5+EGMbWLYITLz6+KahZ+YLpBrXltuUTO2sIacYPN6lga+UC0C+XjKl2aU3PjjIgeIfkKO6cUKmQjssNOK+1BQEiX33te0F4TntHOpdRXcKwIouLgy2LcV0/ycQFjxXCIsbrTdzggdBevHqQtn3A/WFIt4vTnJsfrdToUCg/Fyh/LBB9ONmm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4401.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(66946007)(4326008)(66476007)(52116002)(186003)(6486002)(478600001)(31686004)(7416002)(8676002)(66556008)(16526019)(110136005)(6666004)(86362001)(5660300002)(316002)(2906002)(8936002)(31696002)(2616005)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: +inmjCYr7PhxtkFbVfHqqLL3C3FlZA+djhY0SNIhjpij3ht30taEixFtDuHXYhjY43VANVxqTez5yBHyzrpXgoi4BBjytCvBRNUSJVlFQp86ipPeButdQ8zsRwmBmtpovTZ4djlKejCxSEGJe3eMSs5C+afvC0zc1sdEiZDGbirVAimlNIcviD5L5eJL2/yhdbzMh+oDcKoSVqCUv7Fu0QpymBjYSwns8jgogCzwPmNiZOI9XRpdmr3MDCxKWO1LvEsUW1hogSilMv7dtTLuqM68RTydEEOVwj2HQJRyqxcrKAOXcQK7VxrJK2t5b6Y4XdRyzVq3WSMbeiZlIaZvuWFebzjhK2ZZJQ1m5QzWVZLUf2ECbkaZR2Z9ACSqXJmLDMR/WfHBWpVSZpElmo6GuPGaP8smCXquxzBHcA1HjvjEGY0tasWG6O/E+vB0DolCZagyoG4cpydES00Z51Wx0Cvv58g8EQuf0A/vQQjDyg/F9kWDo/Va41sS6wApjAayyE/dlcqFXR2tGyMklTMbM5t6BJJxkflBH89m/mFF1+vi/Q7fOn1DejB/yBwrXYXW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8528fb35-8da2-40d4-ef4b-08d80fabb6fa
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2020 15:09:06.0491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6diPGeQjFVc6UBsTuchrUEi0LgG5NnXDTdUnmmOTP+N4MUA0FQeINWFXOKphR0ar
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1722
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 13.06.20 um 14:28 schrieb Xiyu Yang:
> ttm_bo_vm_fault_reserved() invokes dma_fence_get(), which returns a
> reference of the specified dma_fence object to "moving" with increased
> refcnt.
>
> When ttm_bo_vm_fault_reserved() returns, local variable "moving" becomes
> invalid, so the refcount should be decreased to keep refcount balanced.
>
> The reference counting issue happens in several exception handling paths
> of ttm_bo_vm_fault_reserved(). When those error scenarios occur such as
> "err" equals to -EBUSY, the function forgets to decrease the refcnt
> increased by dma_fence_get(), causing a refcnt leak.
>
> Fix this issue by calling dma_fence_put() when no_wait_gpu flag is
> equals to true.
>
> Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>

Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>.

Going to pick that up for drm-misc-fixes.

Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index a43aa7275f12..fa03fab02076 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -300,8 +300,10 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   			break;
>   		case -EBUSY:
>   		case -ERESTARTSYS:
> +			dma_fence_put(moving);
>   			return VM_FAULT_NOPAGE;
>   		default:
> +			dma_fence_put(moving);
>   			return VM_FAULT_SIGBUS;
>   		}
>   

