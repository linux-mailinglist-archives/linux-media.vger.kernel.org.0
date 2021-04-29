Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA8236E4FC
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 08:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238726AbhD2GpA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 02:45:00 -0400
Received: from mail-co1nam11on2087.outbound.protection.outlook.com ([40.107.220.87]:19297
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238495AbhD2Go7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 02:44:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9XmFZ+67nz0V3OjKJA6aD0Qwpv9Pdt3ndYIAfVW+DwgDf9dsj+c334HvME6pZOOiB01v2IXtevLZMPia0RyxTlh1hftWKIKwXNnqTBSLFi9m6GKNe3LEsHEVeY3mit77qiHjUWGnBxc3FGusjRjcCuEsZHNoPkMsqaKx3ejCV1+ocTgWHH2Oq1bnUbGvrxAJ1WNzTLokBF2C7F+pe96521baP5He3CVE1HzbjURjGm2ZOo1TXTq6ui3agtrlGiDgM+dZoqGTmh/eeilpWLTc6qWv6ORFGTWCK9aWUQq848yTgzuQKZaRNmfIfOTxepVsUpr+qOA/r/46MpiY+6ULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwcRAjK8DHCEaEtJrKc3vqItwfLVZX65swC0ByycDKc=;
 b=O3353KzJfO+DyLxf60OALZeAONElsAvkYrQyQr7vrZ1rbcvlx215W9P13l6z0BsAJSk3DwoI+jDs1izglfGsnDmLzQQzgZUI4n+4t/Jdz7obtZL4Wyy3rSnKv0HcOkAf4R7YYtf2K0XptkRWYfkvZIpzXrk7B1PScwFEzatd7WcWv6wXHkiGSAYvwlMMBp84BPhMUh++C1zzXDKPd/G/AQzETWrFSJLEjt2Rhgr8twmC1NfduGIQejawTfWoTdOeJMHRz3VoH1OvU2CO5YJwKWF1X0r9J82WXBzU4/kaktOFE9X26vsJA8kQ7a/3Bx82XaL3rpxPxxKmew6OdTFrcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwcRAjK8DHCEaEtJrKc3vqItwfLVZX65swC0ByycDKc=;
 b=W1BGBs5AYalEJjxT3ogNx2jP86u/7F5QV6nP8O/fHxNdA7Y4ml++ThEMRoGRd+7cPxPwxj2Z0xHoj0CuvtATd+5LpnxSq8zZeLkFo6a8YMzd/GOkKw92qDh0YC/s3JQE1YGRv93TVjwpAB0hho9/TS8y31+OofBTdhEm4oqxRI4=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 29 Apr
 2021 06:44:10 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 06:44:10 +0000
Subject: Re: [PATCH v2] drm/amd/amdgpu: Fix errors in documentation of
 function parameters
To:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "open list:AMD KFD" <amd-gfx@lists.freedesktop.org>,
        "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
References: <20210427112738.15869-1-fmdefrancesco@gmail.com>
From:   Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <ef0a9c9d-4a7e-b1ce-05ef-29dca0c020a7@amd.com>
Date:   Thu, 29 Apr 2021 02:44:06 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210427112738.15869-1-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YT1PR01CA0120.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::29) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.19.228] (165.204.54.211) by YT1PR01CA0120.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25 via Frontend Transport; Thu, 29 Apr 2021 06:44:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e510f0e2-48cc-49f9-7da3-08d90ada3174
X-MS-TrafficTypeDiagnostic: MN2PR12MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4470EE72C831C0076242F383925F9@MN2PR12MB4470.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3tJcSlLsPtKVNHcWuZqpM7uLqBbQdx2k7qFMxrCbes9Iv71Zg2dtZtfenXE/M4X1s2ioWyCVnlaRSEh9Vdv+h9BZM7ItpzfliR6+NQiWJfPx41DwfQaTk9riFPZHBBiJfER1HZrRVyh18XFnmzm2F8Qp/Cf3J+TwJDMEp0DDQDFyqwFxxocMHgW91xj5SW4LF241hg0n5HC4XALinrYYLvxooNvuHFXuIRaN0b+BW6eYy+rRcrUHfajMXA09Ji7w7YHeghh+b55s5mUCwvs9kdlTiGGVK3pP5/KFNtCt+MF6XlNGtu+F0X7dq5kyBqjP/gnxlqCdrylE5SbcJVzP+eQWO2hCnYpt7UlAoJ1LkrqXg3EB28No5zu6nzTKiQ5rA+3AljqOiHy0qaBJtyV9FoqGf3O7CV2gStfFfopVwOh+OZ6gEMsQfPTl5mw0NxE81XdFs7OSvO2f/34qQhhcQPhfXZjNJFjaXE3va5AwKwcdQacE8sHoj3OlrV8v9n5SdtHSy9FWlurw6Q/Zw4HlP6dVpO5U8dojloMsSBQl96vgXxMZe+mj8tV/evY+VNUmyWGsQEQqmJYF+Qo7UtlwYgorPpNkwmWr4KTE0Gn+XIzWjSxNUfrXokcdumItP5hooT+P81vt6c1GqvC0gpameYchFxmegQXlrvI+uppROYAw7ewnTXRQqXCYV6ReBw+GLKca1Dtv9LU0zt7gP8fbkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4948.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(44832011)(26005)(31696002)(956004)(186003)(6486002)(66946007)(16576012)(2906002)(316002)(8676002)(2616005)(31686004)(5660300002)(83380400001)(110136005)(38100700002)(16526019)(8936002)(66476007)(53546011)(66556008)(36756003)(478600001)(921005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K05lRjIzNGVBWk5mdTUyZExNRXFwTEpTWmVndjBveWpUT3BIMTMxV3hWdlpa?=
 =?utf-8?B?eGF5bGxIZ0ZwMmZqamVueXZCUWJZeVBGY0xwOEprVUNxelVNYWdPampxRm5O?=
 =?utf-8?B?WGJHK0pQekhEdXREZ090WUE3VUtxZ2dOUi9taHZ0TndyWVRHWk5QZW5OUlpp?=
 =?utf-8?B?RTBmUkNUR0IxV2RvVWd0LzlmZHdmcFZtVHUwRVNvQVV1MWpRcDV0dWFPZVY4?=
 =?utf-8?B?NnpqUjcrcTNFYWFISDRwekplM0Z5NEw0cDlqaVVtV3VvL2RvOTNLN2lkVzAv?=
 =?utf-8?B?QTl6aThpdUlVNVEzbG9paVFaWC9hMEt3UUJtRkdSb0pUdnVVWEdPbzZCTVl1?=
 =?utf-8?B?QWdXNTRNbGl0NHY2TEVDZUw0M0czV25Ba0dFWFJscEVTeHJEeTIrbnJZbmRM?=
 =?utf-8?B?ZmdaV1dwZ1h3OWtEQnB0S0w5WjZ1RjI0Q29kRnBnemdjVnRNRXp0M3hKY3VG?=
 =?utf-8?B?TWo0dkhjMEJxKzVpaWcveWlrVnltV0trek5HZE54Z29VVnQ1UDdXT0trbEo4?=
 =?utf-8?B?L2c5TXNHOFRxRkZqcE9abTRGdXB5SW5UVlZEZ212MjFid3orTHBQT3BOVTBR?=
 =?utf-8?B?MmFJdDZ6YU4zYU5Fd2pMREdBeWtkWG4wOWZpdzB2ZCtCeUswK3V6aTJRRXAw?=
 =?utf-8?B?VEhqajQ2Y0kwYkF1aUtIcjgvWE5kTmVVQ2ZzSzZmYmJLYlZEMk1CWHJ1bEFs?=
 =?utf-8?B?R0tiZTVLZ3ExOUIyaVJyUFZhQ0pHTFZXL0I2cnA5T1F5Ykxwc0kxVHpsbVlz?=
 =?utf-8?B?eGJsTGgvM1JUcjVxbDQ2QjFpMVJyQnluU2hQdklVcm9TN1NTVWlFaW80b2Y4?=
 =?utf-8?B?UVZNQ3YvU1I1NlBCRmVWeVJlam9qc29DRyt0UGRCRENKcWVyZ3hwOTFVLzlp?=
 =?utf-8?B?UG9ZVTVoUDNVa2M5MllGQU4rZTdvMjdwM3dpNkE2dnJBUTFpd1FoQ1JwbG94?=
 =?utf-8?B?YytMa0hPNkcrWDR1QVY4NVRlaFNxMHpwb3pFSjNyQWxJSVoyWEpvNFZROThC?=
 =?utf-8?B?Zm93N1ZjOTZwQzZER0ZNNERNMGNUc1Y1NXJWNFdoTzNYc0hkeThpWkYvNDVx?=
 =?utf-8?B?bG5Ud0RmbllPZWljSmlHSXdFMmxWZWg2Zkoxd0VLOXBPSGtvWDJhd280bnY0?=
 =?utf-8?B?MEhjTDFBV0ZYUlNpeUhmTmROb1VMR21qcnhSRHh0dnlGenpaajJlRjRXVnJL?=
 =?utf-8?B?TnNtU21KS28rSHJ0RkRxTFF2OGMxQ25iQW5YYm4ya0gybVBCdWQ5RUplOG5r?=
 =?utf-8?B?WDgvbFVkejliYXFMWkwweHJwOGxKNFBmcnp4R2ZBYjl2ZXZZMVdOa05DRjFK?=
 =?utf-8?B?RW44K1NQQnZmSi80OXJhMjdmMXgyVmlrUG53OW0wTjRaUUU4WGR6UlZ4U3h1?=
 =?utf-8?B?OHViTU1uWXd0b2ZJK0tJMzJUKytXYlVyZ2lKYktmK2tuS2lONjh4bVZ1eC9x?=
 =?utf-8?B?dFVsRW1maUhIYUIyK09ua3ZYdDNzZW5LblIxS201VGl2VXRSRmJHbyt5b1FW?=
 =?utf-8?B?QWFSOGNuTDVLMENCMCtPVlk3WlRBQURvSG9ha25XeGhmQ0F2eFBmaUgxNEgw?=
 =?utf-8?B?RkU2dTJtbDZyV0JRSmdpTXJlMmQ0TzRCMFBsa2RtL09ZWVNmRnpaUTk3UU9W?=
 =?utf-8?B?c0RjeWFKSkpGNWtmQlV0Nm4vMFJkRWZLazlIbm5OSW8vVmJ4VFdHY1JYWHpu?=
 =?utf-8?B?UnZTMkZtS2ZSRnlhUk4xaEJPc29YbDcxRnJNckZ6dGJHVS82SVk4TkFEVXFG?=
 =?utf-8?Q?gvWsZ9r0zYUKq9M3y3TBYVieMiNof0WN4aOdANy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e510f0e2-48cc-49f9-7da3-08d90ada3174
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 06:44:10.0921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fl3XGpkvBibTOF7aowOvtiH5lFTKIia1CtI+2JC6hCIfLk//qECnuq3HKdEGo8vbGd6mTvzy6Uth4cxT/xMbew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-04-27 7:27, Fabio M. De Francesco wrote:
> In the documentation of functions, removed excess parameters, described
> undocumented ones, and fixed syntax errors.
>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>
> Changes from v1: Cc'ed all the maintainers.

Looks like Alex already applied V1. So this one doesn't apply. "git am 
-3" tells me:

Applying: drm/amd/amdgpu: Fix errors in documentation of function parameters
Using index info to reconstruct a base tree...
M       drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
M       drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
M       drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.

Regards,
   Felix


>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c          | 12 ++++++------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |  4 +++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c |  8 ++++----
>   3 files changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index 2e9b16fb3fcd..bf2939b6eb43 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -76,7 +76,7 @@ struct amdgpu_atif {
>   /**
>    * amdgpu_atif_call - call an ATIF method
>    *
> - * @handle: acpi handle
> + * @atif: acpi handle
>    * @function: the ATIF function to execute
>    * @params: ATIF function params
>    *
> @@ -166,7 +166,6 @@ static void amdgpu_atif_parse_functions(struct amdgpu_atif_functions *f, u32 mas
>   /**
>    * amdgpu_atif_verify_interface - verify ATIF
>    *
> - * @handle: acpi handle
>    * @atif: amdgpu atif struct
>    *
>    * Execute the ATIF_FUNCTION_VERIFY_INTERFACE ATIF function
> @@ -240,8 +239,7 @@ static acpi_handle amdgpu_atif_probe_handle(acpi_handle dhandle)
>   /**
>    * amdgpu_atif_get_notification_params - determine notify configuration
>    *
> - * @handle: acpi handle
> - * @n: atif notification configuration struct
> + * @atif: acpi handle
>    *
>    * Execute the ATIF_FUNCTION_GET_SYSTEM_PARAMETERS ATIF function
>    * to determine if a notifier is used and if so which one
> @@ -304,7 +302,7 @@ static int amdgpu_atif_get_notification_params(struct amdgpu_atif *atif)
>   /**
>    * amdgpu_atif_query_backlight_caps - get min and max backlight input signal
>    *
> - * @handle: acpi handle
> + * @atif: acpi handle
>    *
>    * Execute the QUERY_BRIGHTNESS_TRANSFER_CHARACTERISTICS ATIF function
>    * to determine the acceptable range of backlight values
> @@ -363,7 +361,7 @@ static int amdgpu_atif_query_backlight_caps(struct amdgpu_atif *atif)
>   /**
>    * amdgpu_atif_get_sbios_requests - get requested sbios event
>    *
> - * @handle: acpi handle
> + * @atif: acpi handle
>    * @req: atif sbios request struct
>    *
>    * Execute the ATIF_FUNCTION_GET_SYSTEM_BIOS_REQUESTS ATIF function
> @@ -899,6 +897,8 @@ void amdgpu_acpi_fini(struct amdgpu_device *adev)
>   /**
>    * amdgpu_acpi_is_s0ix_supported
>    *
> + * @adev: amdgpu_device_pointer
> + *
>    * returns true if supported, false if not.
>    */
>   bool amdgpu_acpi_is_s0ix_supported(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> index 5af464933976..98d31ebad9ce 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> @@ -111,6 +111,8 @@ static const char *amdkfd_fence_get_timeline_name(struct dma_fence *f)
>    *  a KFD BO and schedules a job to move the BO.
>    *  If fence is already signaled return true.
>    *  If fence is not signaled schedule a evict KFD process work item.
> + *
> + *  @f: dma_fence
>    */
>   static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
>   {
> @@ -131,7 +133,7 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
>   /**
>    * amdkfd_fence_release - callback that fence can be freed
>    *
> - * @fence: fence
> + * @f: dma_fence
>    *
>    * This function is called when the reference count becomes zero.
>    * Drops the mm_struct reference and RCU schedules freeing up the fence.
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> index b43e68fc1378..ed3014fbb563 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> @@ -719,7 +719,7 @@ static void unlock_spi_csq_mutexes(struct amdgpu_device *adev)
>   }
>   
>   /**
> - * @get_wave_count: Read device registers to get number of waves in flight for
> + * get_wave_count: Read device registers to get number of waves in flight for
>    * a particular queue. The method also returns the VMID associated with the
>    * queue.
>    *
> @@ -755,19 +755,19 @@ static void get_wave_count(struct amdgpu_device *adev, int queue_idx,
>   }
>   
>   /**
> - * @kgd_gfx_v9_get_cu_occupancy: Reads relevant registers associated with each
> + * kgd_gfx_v9_get_cu_occupancy: Reads relevant registers associated with each
>    * shader engine and aggregates the number of waves that are in flight for the
>    * process whose pasid is provided as a parameter. The process could have ZERO
>    * or more queues running and submitting waves to compute units.
>    *
>    * @kgd: Handle of device from which to get number of waves in flight
>    * @pasid: Identifies the process for which this query call is invoked
> - * @wave_cnt: Output parameter updated with number of waves in flight that
> + * @pasid_wave_cnt: Output parameter updated with number of waves in flight that
>    * belong to process with given pasid
>    * @max_waves_per_cu: Output parameter updated with maximum number of waves
>    * possible per Compute Unit
>    *
> - * @note: It's possible that the device has too many queues (oversubscription)
> + * Note: It's possible that the device has too many queues (oversubscription)
>    * in which case a VMID could be remapped to a different PASID. This could lead
>    * to an iaccurate wave count. Following is a high-level sequence:
>    *    Time T1: vmid = getVmid(); vmid is associated with Pasid P1
