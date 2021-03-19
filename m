Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2829C341716
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 09:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234259AbhCSIHk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 04:07:40 -0400
Received: from mail-dm6nam12on2076.outbound.protection.outlook.com ([40.107.243.76]:63969
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234178AbhCSIHP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 04:07:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMJBwyqf5KwR+6lSekc8BfwCQ3dyJ/PlLE4Rdjf68dnryhUm401XPcHcRYFNHslFczPyDtvo8csjZhrjyYUHrI1xIREyzZjLEHMKPPoKMozULkrXI18WrNl5A8tBP6wPIpAKdehKZuJwKZCp/tMa85D5pmWl67MJZGJ3w3+FEED7eteDkcAAaHuIw3GeRE2x420M1W3iSDfa8BT+BK3nmuwWLO8JwphQEI0c13Hkkicz1EOKDlOOaeqzDW5n9+fZTzzXDUatT0QrhK04PSWMHDRtJhJf4j5ppjsyHfLX8LHqrj28EC8TBaxec8kaW2R1jqe8GNePCfcKHK+nvQAPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihpR9Cuc7ttazcWAjsyoXujsRSfHjWg32L9sTYnXA4E=;
 b=D5GjYv5jxYgHWlwyDTKeTxXCKC/wN4YWe9Wsj/8K0pVbnEZBZmdVOS150CNRsRrbS0J7dGjWwtSGIDBmhCaQLG/eerVOKVeoj6MJGj+i4dgJD98dzaUo0g2tXlhwESe2uR1NCkKkuJrjfMYxSIOk397m7N8oxC6QfXDLKqD8SOfO87D8eiB18xRiPuic6yqIwWVahk2yKF3bjDBdofFSpsgYoAvMZr0iwcwuQxSschAoe6OvmdxX4IXVXL+/AOsncV+kpEIp2HVxIl/LeQlT4MSXjV7WlaWjcx6EKhiABO2u6rqs/ZN18X+j9poPCxRFUa8YVi0vIsEKzIrnUNLysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihpR9Cuc7ttazcWAjsyoXujsRSfHjWg32L9sTYnXA4E=;
 b=pV3Nlx3y2dg4NIn4j8f8JibStEh5HwVkKwnZNCD5jQu156J+fRH68IfxqkUvzSeO0Vu6XhrQabF2gIaogN2us2S1VRQGIzzH8CIg5h/ih6AWK1sO80u3afgweMXmDx1X3cSFmcmK1yexjRzvr34TKlmFzlIlFFElkYAaYgp+5nw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 08:07:13 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 08:07:13 +0000
Subject: Re: [PATCH] dma-buf: use wake_up_process() instead of wake_up_state()
To:     Wang Qing <wangqing@vivo.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <1616122734-11581-1-git-send-email-wangqing@vivo.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d7932bf4-611d-99c4-e138-549b298739f5@amd.com>
Date:   Fri, 19 Mar 2021 09:07:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <1616122734-11581-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:708:f70d:90a6:a94e]
X-ClientProxiedBy: AM0PR10CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:708:f70d:90a6:a94e] (2a02:908:1252:fb60:708:f70d:90a6:a94e) by AM0PR10CA0056.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 08:07:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d5e2a546-fed8-448f-e1a3-08d8eaae00ca
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3999338A653EE85E2559103483689@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ll656+GHFDcFPvEiAK/UgtU+sN11lZDJG+Bl/hG59uaoTNxNwEABwHNq8VroOQ9o2U+vMXR9gvJuSBBC4J8VAnIgZUiXIll7biEEka9bIGNhSrRDQG3SBid7AYT2PGK1SyxgG+OrXeTgYaLpH7IbVpm7eYg0zp/VSAvGZLVoDxcUxtmBxE1WcpwmxXlWY4lxohw78cYcZ2ueUK6jKnnvGsjqCWDr6XK4s9VhNhEINjk/RgpsKxWeEFoKp40M8EZ1NK69H3EOltk30ncC+HvLLKYS6J5SK/1ybok1NJzyBEGnHgyKEBsA6+ATcKKjofNGekVJgHl0SYMAKam9YhAC/KrpcvZmUWL3d/9jJslJux2OKfloJkrP/ol8YvX1PNJm4p4DNXhQXCXKpQVLEiemJojgB/yk0O9T87ASn4JYnfcK2pRVBjiQMb9lkZyDR8J4rNbLVDhWSr2xWXjNjLPPORGq5iTWEUwNXqWXfS+K5fZbCF5c92VQWyjC+kHIHBT5Q2I8qfGFSlY+KeCIFKaYsQ9XGypYDV1z/CbrAm51t8jY3raoQwKasw84EqA8bqlj5uomv5ZH2TOITqhSi2M2Cvr8SL69KUS5Sf62n3Q5r6Ex0PjBelbXjFAVqDTBEayaQsvoxmGMnwdm/fDnabWtAD+BwDfdh57J20cdGVr5qQXJdACdxrQjJhgUI/ztEymUgrx68U3IbaTvbFbvy3IkqSLSYT5S1y/HJ2Y9xJweyc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(52116002)(8676002)(66556008)(66574015)(110136005)(16526019)(4744005)(31686004)(83380400001)(6486002)(6666004)(8936002)(2906002)(66946007)(31696002)(478600001)(5660300002)(36756003)(186003)(2616005)(316002)(86362001)(66476007)(38100700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eCtJbkdzRXY0dGtTU1pjTE1hTG1yZnViT2IwWGY2STNCeW5VeFJXdS9aekNw?=
 =?utf-8?B?bmxUMGp2MUpkUFAxUE1qV1FCT3NrYW01eS9wNHM0MmZXMSs3ODAyN2JPQkR5?=
 =?utf-8?B?S2lnVWVaaHRXWnozTTAzV1hTSkRIdDVaUUtjMnVlbWdXa3lOdkwwK0pCK3Zj?=
 =?utf-8?B?RlJYTDYrT2N0cnJsNmt2L1NZclhtRXRObVFkdHhjYmVHYS9zTHdwcm9GbGEz?=
 =?utf-8?B?NFNmQmU4czgxTGRMTnhoM1psdmVsU2RMOGoxeHpDQ2FjaVBMR3pJaGZVWDkz?=
 =?utf-8?B?MTg4Mm9tOC9vMUt4dUNnWDU5ZmUzbnd0ZjdtaElSMkZJNUJWVEd0U0xEeE1T?=
 =?utf-8?B?RXNGbVJOeGU3d0R1S1VxTHdzYWFkVEFhd3FYeUxXZHhkS05xVWdQbGNBSEZ5?=
 =?utf-8?B?TFZmSGtOS2NjL3V4bzVLb1BvbkEyRkM1UmI3VlJlMlpRNVBtUms0NnRkUmRK?=
 =?utf-8?B?U1JaKy9DKzdMK1A2dGFqQXFON1d1QWtEc25aQ1lVdTJiWnBIa3hHU1MwSkNx?=
 =?utf-8?B?ZkdyL0JUbU1QODR4WkdjUnZhL2ExbmVqVk42c1ZvV2UweCtKenRwRGR5LzJr?=
 =?utf-8?B?TVJkRkZkUEJvaUxuYzdobVQ0NTZuaWhlZy9JbHRmbDdBVmpsYms2bWN3aitq?=
 =?utf-8?B?VytBMHhlS2E0eHVKZ1lPM2JrRjdDZjBYOHpKZUFhelBpTSttWFpYR1F5ZWs0?=
 =?utf-8?B?MnpLZ1cxcTlaVjJhN1FvMWlweDIydmdDbExLeXdUaGlsOXF0SFErWFZrKzZ5?=
 =?utf-8?B?emI3Z3MzTlNMTkg5Mjd6aG0wYkttaEhtMzA2d0pzcThITWVNZXhTTUxsRGc0?=
 =?utf-8?B?cUJUOVMzcFRqZzdnRnZIdjZuSnZ3ZVA3TU0wTG1LNlJrMjF2a3FmaUlpYklM?=
 =?utf-8?B?Q3lCR3dJTU1jTkFJaTJRamY2dHZxTnJoQ0lwaC9CaVZNcmxBeWF4MHdtWEsy?=
 =?utf-8?B?QS9xOGZla1VWYmpDaWFDWHloRnNyOXFvdzNITGJhM1k1R0d0b0YxZkxvM2hJ?=
 =?utf-8?B?cXRkR3d1MnIxRXpsa1JXekxzQXVTSU1pZ29VL3NIWFhnc0VrM3hyN1YwOWhO?=
 =?utf-8?B?VnhTVi9GVCtNUHVHN0luL2lHUU55S3N2WHBHR1gxa3RGRWluM1BkZENQNWlB?=
 =?utf-8?B?TTBiUUFBK2FDMmQ4ZGFuQVhvQk51ZndPc1FvTEVvY0hLcTVXY1BCenp6cDlS?=
 =?utf-8?B?VXhaRHF6SVdVTHRpdlJGeXY0SExBcjhFOG1rMUR4THJpYTlrWG1DUjRwN1A0?=
 =?utf-8?B?eTRuTEQyWU8rYW5rWDhmMXk5OStCU0EySUd6NnhXRC9rbDNaeWE3NW1aSXgx?=
 =?utf-8?B?UnY3eWdLazMzL0hNbXNqb3p4M24rTm9VN1pMVVNKR2x1NGluT2pJV0RlQ3Yz?=
 =?utf-8?B?Y2ZveWJhajNjWVpqLzFBSmQrZ2p0eGFIM0pwOTI1MHlOVDhnckdtU3NyMWJy?=
 =?utf-8?B?K2EvMXcrSXVUSkxMRVpwdmlSSGplM2ZnZnhCR1lQdFRiL0xXYmtTSC9sS2hj?=
 =?utf-8?B?MWo5Vk5rY3ZSZHpEbVhjOHJSeDNtclZrRDAwT3VZN2VadjU3WExPVzNMZjVx?=
 =?utf-8?B?UXFMYlRMcmFWRTNhL1dVbWxsY1RNWlUzM0NiOFc2bnNpV0FpTzZlVjgzemxM?=
 =?utf-8?B?bytmckw1UHMra2ZVWDVZRkdIV2dSK0p1ZHhwSXpWT0tleGR2cHN6ZGg3VjEx?=
 =?utf-8?B?UVlWOWp1aytodjVhV2RBS2tKeVhZZmhBNXh2NkJRdXVBOVUrVjllQUcvVXQ5?=
 =?utf-8?B?Z1lSc01lRENNUUFZb0V1YnF0a1NPbFhjSWVuc2ZRZVh1OWxEaG9KSnprYTVl?=
 =?utf-8?B?UWJaakVlQlArcTJYZ1p2bXZMOEFkRlczc3ZrbnpDYmZmdDZGMG8yZ2w0bjRx?=
 =?utf-8?Q?rIKYVpTnnV5fZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e2a546-fed8-448f-e1a3-08d8eaae00ca
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 08:07:13.3479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6YEXVfwEypOKcUzWWwIVBdTScvGJgNhjhbnj0RheuOPrHcqIiNWRxRYqhQnVTat
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 19.03.21 um 03:58 schrieb Wang Qing:
> Using wake_up_process() is more simpler and friendly,
> and it is more convenient for analysis and statistics
>
> Signed-off-by: Wang Qing <wangqing@vivo.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Should I pick it up or do you want to push it through some other tree 
than DRM?

Thanks,
Christian.

> ---
>   drivers/dma-buf/dma-fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 7475e09..de51326
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -655,7 +655,7 @@ dma_fence_default_wait_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>   	struct default_wait_cb *wait =
>   		container_of(cb, struct default_wait_cb, base);
>   
> -	wake_up_state(wait->task, TASK_NORMAL);
> +	wake_up_process(wait->task);
>   }
>   
>   /**

