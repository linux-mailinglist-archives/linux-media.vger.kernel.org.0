Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCB0262B70
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 11:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgIIJL5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 05:11:57 -0400
Received: from mail-bn7nam10on2080.outbound.protection.outlook.com ([40.107.92.80]:54369
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725948AbgIIJLq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 05:11:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0LUJoMKePu9v8+Z1gjLZH4dmakXxEFS+yC5Vo2sEH297quMiljfi4WdeMZX68CF2p4GP8wrxFn96qomA/YBJp5RVimsXEBCtM8+2esynayjyeGmJHXaQvxLspGdDn70trB3hCavyZ3/JW4DEUsQN/BuBU1ceeXiTxTDUAM23sjtURmroM6YQIBEHAKJj+w+9qfsRFIBqhGYMFyI2yXjUHmrXpzn+vSdXgtM9K48b9D44kuzFoEg0V545HCxv2/52MPKn+VXsUoWv0FVJBaDeQ3M3eCUoiQx4/XmRBE/Q0vWrl2Te0C9J6FW8i0Ql5DyEQBHvFoTccO2IIjJ9a2m1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojIVsDFW6K4dl4yoMYHQqEiv91LxnZ45+f7uNAnS8TI=;
 b=Hn7EH0qulfMidCVWFf9A/uOJZOEbi+ZxyNfc4ogAUd9RiBStAz5Zg26YV19u0Xcc8lGyOQ7aYb5myqwM4EPozZHbRfQF2JhnDI4f2OVhmXJzuPJS4mXiN8S2BMdrwSVVoVUI0LVvurUoF47VK9bfVYNZIECHCbSEbzAbFhApSYoRhBkEY1dklSwFGJkT9ZRBKxEwZ5Dz3GNH8A70juCQYOung5hrZ/r5HUkyyz6Uem1DNlAru7GXVe9trrLi7bSGqfEVGHSaibmfNgFrRl9YxqonaEaDsVsjEKPwnQTqSprmrQqpk/hhkN5P6W6/fHeYNXfKopLf4UVX2NhTMRMVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojIVsDFW6K4dl4yoMYHQqEiv91LxnZ45+f7uNAnS8TI=;
 b=mDbm5WVBZ9XKd7QoMKsd8wCjiyr/l94Nqdsj4D2oQ2lUZ8M4zgwna8/3zVjL9K8/c1fNE7SjE/Wk4qoFhB+KAL+Gm9YMotsYc2DdkTgmLe1j35UYoDM8//RurEZQbrgFGOIE1nlDPswBQ+g603pLGjKVZHQR4EJtBQA56tWJu+U=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 09:11:43 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 09:11:43 +0000
Subject: Re: [PATCH] drm/scheduler: fix sched_fence.c kernel-doc warnings
To:     Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie,
        daniel@ffwll.ch, sumit.semwal@linaro.org,
        alexander.deucher@amd.com, ben.dooks@codethink.co.uk,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Cc:     linuxarm@huawei.com
References: <1599638225-39300-1-git-send-email-tiantao6@hisilicon.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <665ed169-cc12-2e6e-11f9-bc1a69fdaad7@amd.com>
Date:   Wed, 9 Sep 2020 11:11:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1599638225-39300-1-git-send-email-tiantao6@hisilicon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR07CA0006.eurprd07.prod.outlook.com
 (2603:10a6:205:1::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM4PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:205:1::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.5 via Frontend Transport; Wed, 9 Sep 2020 09:11:42 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: edf31d65-cac3-4238-0920-08d854a05eb1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4470AD3C4CEEC0F07CC8924383260@MN2PR12MB4470.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eJegBLLNp6gJLKsK/c+RoQos7ztQiKShSWCE+xFIc69ZmFUMed34N6sqjIDFJzsB3ua72DUSuZ3Dp0d4NPmEddNqv2LqAl3L6ANDi3iGOYtzlAEdiOvGee146/ExCScRaRQ0pQ29H9wZun7Ec5ZjTo1OSJHaXpz4eMow2cnaxQjSi9/sgTPIPVofOgH/8LvsVgXbaDadcLvmhM7WqjhHnJ2GXt+kut3Rrwk+V/SaTzTS/51W7drWIhZJ8auKV8P0fQDkrSZddWrVfTA92/1Q7UH7BbW4bhLCF+oyRLzk+PbVeA/k+sgIu2eYxdtx4bAbDFO4u3E1VXV+LnqCP366PvGx2ZISVXmH2b7lAJVsHlTKDBHiIJyQ7wZIFpt6fDSv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39850400004)(346002)(376002)(396003)(4326008)(31686004)(6486002)(16526019)(8676002)(186003)(66574015)(478600001)(86362001)(83380400001)(52116002)(66946007)(66556008)(66476007)(36756003)(2906002)(2616005)(31696002)(5660300002)(6666004)(8936002)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: GxS7cBM4/HJbdS+7ujA46jRKSDsOSjlo4kUTpmp0/TbMCYfU5Mk8/ap7kkIGFRaOtK+qbjPGIBNrDrxEJn3JDwhkdxycPAAS0vtt9rFe7FJe7aLC0607cMuvd31SB3/WgDGN0IQz9vi/da4MVy9J97kGUV71wWrOsnOP8fVmMdUBIQl+eG7Kjbyq4B9eaj2OL/jKkTphoCLjFwpiqg2QOyqhZRDiDIAN5VMroMxM2gHy3gnbfb8b6Ovv09gwlhz5evkAHX27i9aOlmSq86IFfla9hcnVsyuMdMBJAEIe2rJ9u2/F9J3wSkZbiK5ePfI848Y6poQACvwQaMcicvopc7jlVx/P6O1jw0BQDaAQRaZJigTKboJet8MHscz3Pq+4imadfXYAEeYP/MRAlXWsMdwssKNYI+l1h0O2T3e3onJUSl0fgK/evNQjOqzSYG8O/qOQpSWREHaqPKs+QQ1CozfWNT+C54owJhpLAioEjYhlDzQWyIUZZMrtf3I1v38h4J1XUjsFTgzbFjw5yOu0OQ6q+BOPJJxxgr+zb8PE2MH0STNxS/K3qOnvyAKQ0FeERNPZ3tRqGADGFIo2HAQsmCjDfXCbNhN+RuEM/EoH/M3t5UDDUdr2H2yd6AxguH6072qFItkI7WUMjgX8XYr0Wm1uZSBhOk9iTZxiwXnL3qlb33OWz3j0fYC5PbHthMMFNcH/jwjFuyxAOV9jy3j8oA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf31d65-cac3-4238-0920-08d854a05eb1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 09:11:43.4465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsBV6xBsJ7ab3FaRPeu8HBzCeW7l8bfAtpHg4i+tOgzX5KKH7To9NZL+PKd1XVTN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 09.09.20 um 09:57 schrieb Tian Tao:
> Fix kernel-doc warnings.
> drivers/gpu/drm/scheduler/sched_fence.c:110: warning: Function parameter or
> member 'f' not described in 'drm_sched_fence_release_scheduled'
> drivers/gpu/drm/scheduler/sched_fence.c:110: warning: Excess function
> parameter 'fence' description in 'drm_sched_fence_release_scheduled'
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/scheduler/sched_fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 8b45c3a1b84..69de2c7 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -101,7 +101,7 @@ static void drm_sched_fence_free(struct rcu_head *rcu)
>   /**
>    * drm_sched_fence_release_scheduled - callback that fence can be freed
>    *
> - * @fence: fence
> + * @f: fence
>    *
>    * This function is called when the reference count becomes zero.
>    * It just RCU schedules freeing up the fence.

