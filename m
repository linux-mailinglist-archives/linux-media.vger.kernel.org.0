Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B86584CE66B
	for <lists+linux-media@lfdr.de>; Sat,  5 Mar 2022 19:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231510AbiCESiq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Mar 2022 13:38:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbiCESip (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Mar 2022 13:38:45 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08on2066.outbound.protection.outlook.com [40.107.102.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4CB460DD
        for <linux-media@vger.kernel.org>; Sat,  5 Mar 2022 10:37:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8Hh+R7Xo3JeL/sQJMZl5f3uLTX+MZcfzvW01lfmpZUlNiNlZurC4/ZJn5mcDRaG3dMTt+CfT5rQ6rIoXV+EIqs9qVeTNTCyJgS3lkDZ8X3Qvh3g1sRFaDu9ObtHFDa/j4FEQ61aGmkAfzVmWuAEO90yp7hRkrQcAYu/tj6yfWfM1SI40OnWO3Oz4zBKUqQpQZegIDl+4r44qpLXr8mQppJrb5n8P/Kye1SQJwdhZAto+4E6gPsLP4Lo/zZj1L6Gowz1KyYtmjCzHw/hVc/BOpXc0Xo/27pZpbD5af5dmLNDxsjbrnc9GEw7vPmCMUSk1miKWt6PBW97wLRhNPp2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5CsByx4rRnGEOSyBew7eSVakTjVO3LfFoZuxIpjlhY=;
 b=V4zGn9kepjG2h8e2M9/b1VxUU3UbA++ZQtu5mfU6u6Pqg19/r5SxRHTNM7k4lyi3h35FlkYWlIMTd7+0NE2VWngwG1KYURs09TcWktxz+T4/FnwODKH6iLA93sswTqpCA0x81sb37EDuL286k/m4ydXEnexycZuaqllrj9eCSIwq6MtVXrn/sJSUfVjAI2ak4ES6lksyioMc8M8gmysQ3Xds8PnTmfFxRCQgKUbQ0bDABRwQHHpYmoA9NRb5/G/WhZ+ovQVeUpUPL0HSGVoR4l8nEI2oIiaPSFjIkNSimXzAxGSFVdlyhSP8ABDS3t0bA4wrZ0eONzw1cEpfCZ0AoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5CsByx4rRnGEOSyBew7eSVakTjVO3LfFoZuxIpjlhY=;
 b=DpGkIabazjkKuP4dhlylCYopggIdxb3kPZ6Atn+XhlZGPnY1oLhnmcfpbO3sVn0FPE1Q/gxe846J0umD+YV3Dx1YoO9gFL1fScgUE68vFra+2GyErIX7DEjyfvXQwWLRi5self5khmxEznSof2OwGVyYRuE/a/jlk2Wi2EAxyZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW3PR12MB4492.namprd12.prod.outlook.com (2603:10b6:303:57::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Sat, 5 Mar
 2022 18:37:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.5038.023; Sat, 5 Mar 2022
 18:37:51 +0000
Message-ID: <1f1a3c67-5617-eded-6dfc-028304091ce7@amd.com>
Date:   Sat, 5 Mar 2022 19:37:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dma-fence: fix free sync object incorrectly
Content-Language: en-US
To:     wangshumin <pdsrazor@gmail.com>, sumit.semwal@linaro.org,
        gustavo@padovan.org
Cc:     linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20220305121703.17041-1-pdsrazor@gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220305121703.17041-1-pdsrazor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0021.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eb8a57e-f2f2-4a6f-351d-08d9fed740e3
X-MS-TrafficTypeDiagnostic: MW3PR12MB4492:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB449244E456904408CCC402FB83069@MW3PR12MB4492.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wqWzJ86Y4giotPjiiuZrBb1mEeBy4gqdixWUnarHDG++GpOc6sY41lJJINnRIyzLcfJ80qUozJEtW4eOyGa/RgegaAo+w7FSfysawwsSPGIf65Pa1ZkUFlljZboj34xQpaxhQlIdQO+DDw909314tOkrRZlSlD3Y3ce/pXEOu5JN5EWM9ssI+4/ef+BRhPugyYaMcHzcAid8f0GdHays/TtamFQjGDE/DabMiBsDQ423WlxH71vu9XSSkExWwT9FQhmKErg4UgCZlJtZPcH0kc0Y6BR/kKz8ufqsjI53giQqGMLkryfeQPRxxR/ACazupOUD7U2PypoJCQkZNDAxgLuwxxYnUQXEifCS1KWUAllmTMRkYG/S6oieLrfHMvOB+sA6keNl6ENJ1qdAuZWPix7ryiplGoru7S5jJ6M6XpdrOb3l2U54zCvKVfWzevKvoX3qtnIxSCArJZL/yHF1ro/z/9dou33WkmjAidX2j/nGUrhp/pAl7fp+x+4KjfoQLC4vLUvSLtca2mnkyO5EqrY/qBQwL+57TooylhcOGnawMt1PAnK+EY6yVne/rQ8fJpt/FFEuw5+wTVOIQleQatzhAAqFRFdg44U1MI6xSUj34teQdKQFmcct2d5E2qqQLuYheDwevOkJiRHOnmleaf5zXy7dO9AGpUjXrSlnhJRM4IitAlGd+WuRwQqL5d6XzfyjUYOiNyGEQBuyDS3jtCQKbzjcTYNSX3wsCKE+KIo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3587.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(86362001)(6486002)(38100700002)(31686004)(8936002)(508600001)(316002)(2616005)(8676002)(4326008)(66556008)(66476007)(31696002)(2906002)(5660300002)(6506007)(6666004)(36756003)(6512007)(186003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TURGUlVycDN6bGxqMnN2TVVBZ2VQWFRwT1p3eWttRUZXbGhqd2hmcTFuR29C?=
 =?utf-8?B?cURTV2p1TXVyUGgrc0ZrUGk3cW82M2lkVlhmQzRhU0YraWN1ZkR3YjNBeUJW?=
 =?utf-8?B?WUprTndERk4wa2RpSkJLMTBLR1lCU1dyWGE2aGM3WFFrcXFxOHhTL01McnVh?=
 =?utf-8?B?L0RYOG9COG1HWlJMWHFDR04xQ3M0eDJiSGRtckZBSUVxbkdiSjh6cGdtZFVH?=
 =?utf-8?B?UkJ0YzB3akU4eG1VK2ZvTnFLQVowaFBENHJlSWhRbUxSeml3M216WFNEUng1?=
 =?utf-8?B?RzBHeE9yLzl4bDQxME1xV1JsbXVlTHRVOWxza1ZhZm0vNldLdUZHRFFlVmZh?=
 =?utf-8?B?ZzBZdlNrdkY5d1RheFVNRVRmZWpxNUZub0FJVUE1dFhuUWpPMk9SVzZpbExP?=
 =?utf-8?B?N1I3WjFKVE1raFo5NG4yT3RILzcwNnVUa25qZzR1d0V4R2V6TkFPUEFyd01t?=
 =?utf-8?B?NGRZalNQMW41S2Y2VE5WSXVxZW5LOUlqcDRaamoycnY2UGtjcUd1dUhLQVVm?=
 =?utf-8?B?eWlwVzVCT0dFSEgvTU5zQUtJRjBBR3FjRVNVcUU1Y2RTTmVCOFBWd29VSFpq?=
 =?utf-8?B?NEpBdHcvNU5JblRGNHBSYndMTk5VL0JmRW9tcmliNTRPRno0TEFGM0tGMU5a?=
 =?utf-8?B?WjI3M3dzNkRqaTg0aThiNFJWdGtJNmw5U0NpRHRGb1h1TC9oVnQ5Z2FZZTIx?=
 =?utf-8?B?eDNTalRRa051dzN4aHBhbzhqV0tiTkxuTVZmZE9xQzR4NGlnbmw1c1NHWVZ0?=
 =?utf-8?B?VWtHSU5HdC8yNlRvMEJUS09kNDVVVnJ5cWhGLzR4YmQzNDN5eGxWdTN0SGN4?=
 =?utf-8?B?YVNLUkUwYStVZWg2WVdxNmdDSVJvRy9xbEg0Y1A2aXljOUJqWVQ0K2EweXgv?=
 =?utf-8?B?Z2hiS2Z3bmNHRXU5U3FwT1ZJekZPTTVES2l6ejcwa2lMdGFQK0J5dERNNEhj?=
 =?utf-8?B?QzhCYk5hUnFhL28wN0x1Q1lMdTlTUCtTb0tnMEFvK2IxWEFKQmFkUmcvMDdo?=
 =?utf-8?B?U25jU295SGpVZWpIb1NzNXhaVzkwZ2Q0ZEhsblZGUVNDUFF2eE15V3p0NFha?=
 =?utf-8?B?REhVckt0T1JrclVPa09vc1U4Qm5GMkpmNWM2b05BYndOeGltd01NMURtWUlm?=
 =?utf-8?B?ZEtIcER5VUlCTkxWcGZONTFkRHlJRUI3ZGp6RzNXQzlLRWhtMDF2cmVMMExv?=
 =?utf-8?B?SlA4d0tTRC9BVG1TdnJvbTQ3eTZJb3NrYW5wbzg3VXNaYzVrcnFSc2t2VWlI?=
 =?utf-8?B?N2dXZU1YbTdxaGFIc0pEZk15NjlGRWZMdFpZM042aHJXb3M4V1JxOElVZ0N2?=
 =?utf-8?B?TkRKU0NtWll2QWJQbzFGeEQ1VHlUazlzTmtiQ051QVhZYlFLbnpaa3FJS01L?=
 =?utf-8?B?bEJha2p2a0t0ZFBXRHlkaVFwTXo2TFlQdHZsbC82NkhoQ1pjazRFV2swUi8r?=
 =?utf-8?B?MGdUREZBd1lBQmJtNmRQUUdJdGRkWFJtUkNKQmNtcW5DYWdad0RSbkNPRjUx?=
 =?utf-8?B?KzRaWWQ3Mkg3TjRtVEVoakphWUMyc2MxeTIyVm1aODJLRVc2SUNwTnhqWnBr?=
 =?utf-8?B?ZTRvWmpxbDBxSTE5OVVEaDNRZnB0MEhzUWRLL2VtVUpwK3hZYWQ5bFhyNzFw?=
 =?utf-8?B?UXdxeU1zSkx4RHRLWWY1QVcwN3hLYTcrcmhjNHZxNmtTK1YvMFF5WG8wWTdq?=
 =?utf-8?B?djhtdCs1UEwyU1laQkJIT3MvUU5rV1ZLamo4K0Y0RGNQd1VVSDZzN2pDcTNO?=
 =?utf-8?B?YWZNZTdxZWt4dEhQWE5HQjY2NUd2eTJ3ZzZEaEFlbEUweURhRDdTTEUwWEdw?=
 =?utf-8?B?VHdaT0xNVTd4T1R5ZnVMeXAreDN6U0c3MXlCTUsyTmErN016M1NXR3RnYzdC?=
 =?utf-8?B?VjlxOGZPKy95Sm5tM2VGWmJaRkwwNmRldk16OTAxU09FRzB2eGpSWUY4U1cw?=
 =?utf-8?B?UlZ4K2VINlJLdkFMRzN6SUJLaSthUlZub1BtWVpobFNsbndlUDd2RFZYbkUw?=
 =?utf-8?B?aDZjL3dPNjVoSG1GUDlKMkJXNHBsNm5rMllEclJURXNRVXJpbmF0b0RSVEtq?=
 =?utf-8?B?OEVSK2M4bklJZEdlZFphd3BweWRXRHBnczdnUW16dm9jam5GeWNBQzhsa0I1?=
 =?utf-8?B?M2t6eFArK3pKbDE2cUt5TEV6a2toR0NaZUEwbys3US9VM29ybVdnL3J4eHQ2?=
 =?utf-8?Q?Cri8bIsvEAP4bSMRaX+Y+8g=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb8a57e-f2f2-4a6f-351d-08d9fed740e3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2022 18:37:51.3128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLxPhxTeGWGb4HVP4i1BeXV4dIZKObvtor3k6u4tSG9aR0qVEVXMw2zNNETxtlgj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4492
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 05.03.22 um 13:17 schrieb wangshumin:
> The function dma_fence_free() works fine because
> struct dma_fence is the first member of sync object.
>
> Use `kfree` make it more reasonable.

Well, NAK. You haven't understood what this is good for.

All dma_fence implementations must free their memory RCU safe. In other 
words they must use kfree_rcu() using the rcu member in the base 
dma_fence object.

dma_fence_free() is now a wrapper around that to better abstract the 
functionality.

Your patch would break that and cause hard to debug memory corruptions.

We could potentially rename the function to make the functionality more 
clear, but this here is just bluntly nonsense.

Regards,
Christian.

>
> Signed-off-by: wangshumin <pdsrazor@gmail.com>
> ---
>   drivers/dma-buf/dma-fence-array.c | 2 +-
>   drivers/dma-buf/dma-fence-chain.c | 2 +-
>   drivers/dma-buf/sw_sync.c         | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index cb1bacb5a42b..fc52d837e579 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -120,7 +120,7 @@ static void dma_fence_array_release(struct dma_fence *fence)
>   		dma_fence_put(array->fences[i]);
>   
>   	kfree(array->fences);
> -	dma_fence_free(fence);
> +	kfree(array);
>   }
>   
>   const struct dma_fence_ops dma_fence_array_ops = {
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 06f8ef97c6e8..b29e1f22f08e 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -203,7 +203,7 @@ static void dma_fence_chain_release(struct dma_fence *fence)
>   	dma_fence_put(prev);
>   
>   	dma_fence_put(chain->fence);
> -	dma_fence_free(fence);
> +	kfree(chain);
>   }
>   
>   const struct dma_fence_ops dma_fence_chain_ops = {
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 348b3a9170fa..80432eeb58c3 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -142,7 +142,7 @@ static void timeline_fence_release(struct dma_fence *fence)
>   	spin_unlock_irqrestore(fence->lock, flags);
>   
>   	sync_timeline_put(parent);
> -	dma_fence_free(fence);
> +	kfree(pt);
>   }
>   
>   static bool timeline_fence_signaled(struct dma_fence *fence)

