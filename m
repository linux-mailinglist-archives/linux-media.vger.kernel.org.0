Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A071A3624AB
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 17:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236696AbhDPPzT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 11:55:19 -0400
Received: from mail-eopbgr760053.outbound.protection.outlook.com ([40.107.76.53]:20952
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237976AbhDPPzI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 11:55:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLEB7OSvUgWUoMCucnSpBXeBeitMFf5Y145hnMbZk0h3vYemA697Q2ND+gKtaQ/LQ6rXsu7Rl+PfVJIVJaVoifdk+CC4rtlESHgm9F5seZlVhXYCo6ZIRHk4GbyKlzVJN4ZK9O5SGQdUm6dT8QvXHS0hqE7nv5nMRLekFrSEMw7pY803KrPjNysxJnt8ggxLENeHEc3Z5b9hqllMLkmTb+ENDYMOWx2w9arDpfeOJO1YwOyUFP3hNELmpCIbyqJRENni5oz4df2ViU5vtLVoUyjDcnHX6Zh7a1iohceXTpoOkZW4MoIJfT+YlxE/YoEL+YLslbLfTP4MM/0QA+Nb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4XHr1wkCAWvriaoORnVrAea3swL2x2WlwtL16pD5ZQ=;
 b=bBkfF1abVmSlA6WJPPTd7gryjYkx5Jksni9+oXQAkQqWAnGProyFoUDP7Ej9DZKnuI7ktiltv3l/DaF8mJHyNPJdKj9X/qblJReMjDrXU93Qp/JRPx7jifFvnyFecQhcUF5OY3e0U/LSEOlbE6zm+AbU6bHpyEI6Y9DlscMsK0EAaP+eN/os6Zf1bjRjcSzxy0YX78ZgNmqKJCvS0z/FhzzB1cJQF8dAOK3LeXr/kOoveyQwjtFmrTGKfdmSzOJfnnnwhnPzKUwr2Gt3qqA6QjgwuzXcH3qUAUe/V5lxE7dEllmYpBMg0IC6AAiEieVt1x3W9+Q27zHGQM0EZPRgGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4XHr1wkCAWvriaoORnVrAea3swL2x2WlwtL16pD5ZQ=;
 b=RjPctRNktwosBS723WZuqGvwkBDhhFmAR5KXlt9JeT+jFZiHs2OZp43mFUl3Pq83npWaItHeknBMuCpubN3c+PXfStgErpzq1q65eimBdVZwt6dOqNIF7YdvPGc1D+WHLvc5gLTTw8sQsvKFyOmhLjfwOuL59OOVEneq9cDjSm8=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3696.namprd12.prod.outlook.com (2603:10b6:208:169::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 15:54:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.025; Fri, 16 Apr 2021
 15:54:41 +0000
Subject: Re: [PATCH 35/40] drm/amd/amdgpu/amdgpu_cs: Repair some function
 naming disparity
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jerome Glisse <glisse@freedesktop.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-36-lee.jones@linaro.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <59a21fb5-224e-882f-5d2f-e337e78eb7db@amd.com>
Date:   Fri, 16 Apr 2021 17:54:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210416143725.2769053-36-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:5d8d:1198:63ca:8fe4]
X-ClientProxiedBy: PR0P264CA0208.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5d8d:1198:63ca:8fe4] (2a02:908:1252:fb60:5d8d:1198:63ca:8fe4) by PR0P264CA0208.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 15:54:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5375584f-5984-4251-d93e-08d900eff22e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3696:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB369615548A406E3DF790C59A834C9@MN2PR12MB3696.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SUKBAfIx5QEu+s7pUQccVHigRSkcPjn6HfzkIfOeB5gwT/UBLaMAVUf3FplYOf3IFuDWnUvYaAr/mbsYHIBTFzalfcjkHLMsTP8ZoQfBHG9C7yYhuxm3k8py/A/cSOPGOTIeLOSdgj/Hlh97KwKoTn66R9K8RLo/2MLv7mCJdxgf4gj1H7aFqAkc9xjS10FGewtGED2xr63m8OdnSDP7LpeELMvpAO5iTCFJ28z3gtBX3PDWPqLaEhkOPDVKlRSMbwoVxIb2K9WkOrCBYeNgE35kGIEmOcoFC9+caKqfG9eYIc9UxSRyDYe7O9ZENnr4Lnb3WoJtCCmUx3i7GY2LWek1Rf2YXngeT8CTKJ39NhUG060P8AurZy5F6BW+e0OYsx+H8mOG76f6qlZfpzbyJGLzuo5muca0GGTC52Y9WsKsMmjNSLR1BrZdQBWN3QkDbXYFcD+HF2Fft16NDKQ+QJNgHjPUyzak0A4aBY6bs2lHhEukcvXhiW2Zfh6Qr60MiIaKAAfya56ppc4RitgETDCvNfDUdAG3kVJ3ohDeFPteNUTaEesUR/e3Paqgm++MC5ZY9BqYoCMlAh9KH5pASS5YYt0tAH/S5oyx4i62NMxY7up/M015VrV9PbNGg8lxie+2H2Wia+YqG1Wh9wGo6GE6/XmusrgGBsiABaBzqKW6d5dm7xa/nlCvvVWbswqh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(5660300002)(31696002)(478600001)(4326008)(8936002)(86362001)(66476007)(66574015)(66946007)(66556008)(7416002)(6666004)(31686004)(2616005)(6486002)(2906002)(54906003)(186003)(16526019)(316002)(8676002)(6916009)(52116002)(36756003)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?LzNxekYrTUJsem9KRHBXK1pOczQzOUtnMnV1dlptZ3hGWXRIRkZjQ2tscGgz?=
 =?utf-8?B?NmpobGN1OTd5anU0YlI1Mm1XS1hrSUlxNzVMTTdkWXBVTU9nYi9TNHIrSXY0?=
 =?utf-8?B?cFh0SUUvT0Q0VVJyWVVOUlJDY2cwejk3L29kR1lOL3Q1aDhlb3dneFNQMFF3?=
 =?utf-8?B?aWhXb1A5MU9uU2c4aUl0ZmdsdW1TMzMvbmpEYzIyWGN3SUhMWjVJWmV3czds?=
 =?utf-8?B?SjNNYXBubERtK1BmQmp3MkhQK0s1dzRub1doanBxWnN4S2o0Mjk0ajdMU1lk?=
 =?utf-8?B?M2phZFEzcUJmeDV6Yis2enhINCtPdThxVkVYaFFZT1VhMU91NUZSampRSEJp?=
 =?utf-8?B?dFFGcWR1Ymg0RmRhTzNzb2xjQ2hqY0YvSXY5blR4NXpoSWUxOFcwRWkzNVg5?=
 =?utf-8?B?eENBYzNRWGw4OUxwRjN0WGM0cDRDMEVIZDNPNTcvSFprMW9UMWhQYUJpTEdS?=
 =?utf-8?B?RXN3Y0M2WEkvTjFvOWxkVDZuaDRua29xVU9Cc3JTNWtueTMyWGduWG11eWVq?=
 =?utf-8?B?c1lkVHNhUmdha29MSDRRUmpIUmFzOWpndkRYRE1hN01zcllGaXVLRHZvc0lW?=
 =?utf-8?B?ZDdNNFhmTHdSZ1hsZ0xUME44ZWp5WEdRamJZRkVELzNjcGk2eHdYdWpuUVlO?=
 =?utf-8?B?TjlQN0ZqMHdhRnhySkgvbVB0RStjQ2lTTHczL0hFM0I3dWNwNmZPbVpsLy9M?=
 =?utf-8?B?OVQ2VlZzVHkzVFBNNkJqd3ZvNzFLSkFOQk9rYk5kK2krYnc0dUdPU0xndHR4?=
 =?utf-8?B?M0ZSU3FIWUtIL3lsQnFBV1hKMUlIWHBkQ045SXJuWDY3Z216Mis1WXVpZ2ZJ?=
 =?utf-8?B?VDhuRnpBaVoyUFRweXJlN0VJME10b3RhT3RnMjJ4WXdrczlncjBoek1iMnAw?=
 =?utf-8?B?VEtObXh1SjhNOTE1MWp5d0RMREErWmZpekFCTVBvRzZnWXlmTzNKT3RoVi9w?=
 =?utf-8?B?TFRkWWhmSmxHSWR0amZPOEFVMkFFb0UvZ1RhUG15OUQ2NHV5ZnR2d2ZQTHM1?=
 =?utf-8?B?dDIzdUZNNHQ4eXphd0sxa0hPTG5aaHZWNmx0eFVWTGRwdGJaQnVxMytVRUtO?=
 =?utf-8?B?ODZrRTJIY1BZWCs4cEdjdWNoNHVlQktlQ3ZQVkhFSnNTZ0VDNmtFcWVkRWJO?=
 =?utf-8?B?TFlzL3FFNVFJMllvcHZuUmY3dml0OUJQMXVMbFhtM2JrS0hYT3VidGUxdG05?=
 =?utf-8?B?cis0QWd6bTRDR3VjUGhsYmk5b0xUTkJNOUlNUjZhdnJtV3U5T1hHaDdxQk1N?=
 =?utf-8?B?Vm1DdVhFZDNobnNQQ2NaVXhSWitnUS9KWUVRQ3ppTG5WVSswS1B0TU5xZ1JT?=
 =?utf-8?B?RkJMZVRuaStCSDBwYng1RDB6cHl2elptMFRqOWJaUy90a3VQTjNzMGxLdWx5?=
 =?utf-8?B?aTl2ODRzSCtKWXV1dDM5Nm9YdEs0S3Y3c01GdmVqcVBLaE1wb3ZDUGhDMDVk?=
 =?utf-8?B?N2Uza01TUnMrdmxOU0x1dXlHTk5CbHppYkFudGNFdHBUZDFGYU5KUnVnQzRU?=
 =?utf-8?B?ZUUvRXMzR1duU21jWWlZLzcyWnpVUXBXZStjaGdyU3JvcmZFSWNsZUJOdDM0?=
 =?utf-8?B?dEwzTjdJbHluVnZ4S2JUMmRtZFJaaUFaa25kODRhaUw3eUp1TkdLOEl6b2hk?=
 =?utf-8?B?eDJ5YXpUcmZURVJKTVozQ3pPc2JSSTVNbk9qeGZpZ2o3LzIxclMzTWNkVFZy?=
 =?utf-8?B?cElNYnQweStWSkFOQU9pZjJsNnR0R0hCTXZKU0t6ekpndTcrUjVqN0M3V1B4?=
 =?utf-8?B?ZS9Kb1BUenk3UjZTQXFHTVJrVHFIdUs0dW5BRHJKS1VJNU1kRHgrUEZTVmZ4?=
 =?utf-8?B?WXZNcFdhOFBHenI0L1QvaFRrcTlibjhGM0dEODQwQVNOc1NrQXNaOHhVZm9q?=
 =?utf-8?Q?2qBsbsWclS29g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5375584f-5984-4251-d93e-08d900eff22e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:54:41.2654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNXWEPIApTHtWa2GrKqQOsG3SyLigWwQjRYErEn7ShmI3y66eChP06Jtj463tbS/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 16.04.21 um 16:37 schrieb Lee Jones:
> Fixes the following W=1 kernel build warning(s):
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:685: warning: expecting prototype for cs_parser_fini(). Prototype was for amdgpu_cs_parser_fini() instead
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1502: warning: expecting prototype for amdgpu_cs_wait_all_fence(). Prototype was for amdgpu_cs_wait_all_fences() instead
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1656: warning: expecting prototype for amdgpu_cs_find_bo_va(). Prototype was for amdgpu_cs_find_mapping() instead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Jerome Glisse <glisse@freedesktop.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index b5c7669980458..90136f9dedd65 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -672,7 +672,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>   }
>   
>   /**
> - * cs_parser_fini() - clean parser states
> + * amdgpu_cs_parser_fini() - clean parser states
>    * @parser:	parser structure holding parsing context.
>    * @error:	error number
>    * @backoff:	indicator to backoff the reservation
> @@ -1488,7 +1488,7 @@ int amdgpu_cs_fence_to_handle_ioctl(struct drm_device *dev, void *data,
>   }
>   
>   /**
> - * amdgpu_cs_wait_all_fence - wait on all fences to signal
> + * amdgpu_cs_wait_all_fences - wait on all fences to signal
>    *
>    * @adev: amdgpu device
>    * @filp: file private
> @@ -1639,7 +1639,7 @@ int amdgpu_cs_wait_fences_ioctl(struct drm_device *dev, void *data,
>   }
>   
>   /**
> - * amdgpu_cs_find_bo_va - find bo_va for VM address
> + * amdgpu_cs_find_mapping - find bo_va for VM address
>    *
>    * @parser: command submission parser context
>    * @addr: VM address

