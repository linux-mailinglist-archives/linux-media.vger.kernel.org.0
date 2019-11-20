Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 646FB1038BB
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 12:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729039AbfKTLbN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 06:31:13 -0500
Received: from mail-eopbgr760041.outbound.protection.outlook.com ([40.107.76.41]:17826
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728376AbfKTLbN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 06:31:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikLCu0WQFwjdpKT85uglUg6VaJ/s0BvB6kIDaHmiJzZI0mtdeu8GFLBi+JniBazBgnCBxEitCiVQ449ekLj+GA7rgO2YWFtRkw8TzkrnRiWlZVIMsmqoTpRK1mBM5roZY9W+2Dg9z7F5fnu+muNX6ovi51NagET6IE3rM49/Evfvxk5MDUp1vK7gy6u3Wt8oB/UW/kwtrXLRhHiki1JLwkaQWgEV8+MlTlhDrXe95lN9rYEIzEV1rmTY2Fix1gh+tQzmBK6tjQM/kibEEc9KHDl59yUP37afByCGcIZ8e8O9gtAMrBaRg7295yCeaa4eJSlI+dbkOuq3YQ/m5J5nyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCXxNyloWBorNsqO4fdCFq8jLjOvxrkCuCoU/NOYikY=;
 b=mGz4jTDSVyE12XREG4vkjv8/leAANR3uPqgr9elkwpfwWnFzmWfssckdKHBX9NkE/pmxujwoT2HYaXF//Ud1/0iHMBMwqRmpH2aL59NxshTrHShIiCCpiXdxRkIIllLlx33c+KhVmWSOW8JwPn9JMMAbtrSTNSUuGgi2S/reSCRrBPD5ah3bKwrsoLtXvS1mCIggA2lgjSFbeG1m8+y9fhwtsdPmI91fHmjyVbTWtN9P0PnXPyLibD67z1euFVCDAgo5loNEMSD/oXIniVDTzySSy7oEVG8N63ojFJ4/0DOcr5UhxyQgCL3bMRssjGhWynROYaXBvBb3Y9VMuisu1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCXxNyloWBorNsqO4fdCFq8jLjOvxrkCuCoU/NOYikY=;
 b=tF0bMginlZRvTf+v530TxrDwQAs/pzBSF7pntc14C/5In3LdjWHz09LCF581+D653GBHE/KJRwSVngBkNsaf6Au3TvKzQpDjzxh2kxqV2cAU4ZgnYGB1GS2P2vjyt2lC6Cdo+TY1B1yvj6TzAgd/HwI+CkuPYL+kwifh5xybI7o=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1642.namprd12.prod.outlook.com (10.172.35.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.29; Wed, 20 Nov 2019 11:31:07 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2451.031; Wed, 20 Nov 2019
 11:31:07 +0000
Subject: Re: [PATCH 2/3] dma-resv: Also prime acquire ctx for lockdep
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Huang Rui <ray.huang@amd.com>, Eric Anholt <eric@anholt.net>,
        Ben Skeggs <bskeggs@redhat.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Rob Herring <robh@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Daniel Vetter <daniel.vetter@intel.com>
References: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
 <20191119210844.16947-3-daniel.vetter@ffwll.ch>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7fb69a1a-170a-9afa-7de8-d511cbd20c39@amd.com>
Date:   Wed, 20 Nov 2019 12:30:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20191119210844.16947-3-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0116.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::21) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b56f851e-0204-479e-183a-08d76dad2260
X-MS-TrafficTypeDiagnostic: DM5PR12MB1642:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB16424A8F5A67034CE1CBC6A7834F0@DM5PR12MB1642.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 02272225C5
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(189003)(199004)(51444003)(52314003)(99286004)(65956001)(65806001)(6666004)(47776003)(23676004)(2486003)(386003)(6506007)(76176011)(52116002)(81166006)(8936002)(81156014)(316002)(25786009)(478600001)(229853002)(58126008)(110136005)(8676002)(54906003)(14444005)(186003)(2616005)(46003)(305945005)(11346002)(86362001)(476003)(7416002)(446003)(7736002)(486006)(31696002)(6116002)(66556008)(2906002)(50466002)(5660300002)(66946007)(31686004)(36756003)(66574012)(6486002)(14454004)(6246003)(2870700001)(4326008)(6512007)(6436002)(66476007);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB1642;H:DM5PR12MB1705.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6+7H5W/WD4L1/G6ZucWC5dIeK7zgoCTgqjAvLwwTk5s65AfrQKf8+musycxImN4W0cNWThUDRrS8GJ6dVXvHSqjZ1z6a6kAhB6KudJANDZrz90lOzrouq3uGTQ0NULZ+Txnzu3rMaorm2MwT8+q8CUuqXPtlh1XGMM99P9JZrIR2Lvj0j/H9ZvSe9/byzWYd4yYMgZwL178tK/7TV+6SqRpf8ZChlySdEGnxwEITg0TsQV02B0XUeLyQIRFm3tMaumy47p3w+fwIIUcITPH125hebs6orGTguwwi9EY/3AGOW6dJJ12Eh29i9uzMC+qmMImJTAYv0K2N+LQ9m0x+t4x97lIltMZl0qpDTjlodgABiK/UXW0Up3HlZqTE6lv/pb/aEOAVLJKGlKTIdZlGheuSuE1b2WEJieG/41pILg0GUc71k4rsr+kIOj3qSSXc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b56f851e-0204-479e-183a-08d76dad2260
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2019 11:31:07.3475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkSUknKuls1nXVg9VlYC+Jp/AEjoVVqtLnd9GbjduHApRr8hQTkoyxs46KzNFfj3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1642
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 19.11.19 um 22:08 schrieb Daniel Vetter:
> Semnatically it really doesn't matter where we grab the ticket. But
> since the ticket is a fake lockdep lock, it matters for lockdep
> validation purposes.
>
> This means stuff like grabbing a ticket and then doing
> copy_from/to_user isn't allowed anymore. This is a changed compared to
> the current ttm fault handler, which doesn't bother with having a full
> reservation. Since I'm looking into fixing the TODO entry in
> ttm_mem_evict_wait_busy() I think that'll have to change sooner or
> later anyway, better get started. A bit more context on why I'm
> looking into this: For backwards compat with existing i915 gem code I
> think we'll have to do full slowpath locking in the i915 equivalent of
> the eviction code. And with dynamic dma-buf that will leak across
> drivers, so another thing we need to standardize and make sure it's
> done the same way everyway.
>
> Unfortunately this means another full audit of all drivers:
>
> - gem helpers: acquire_init is done right before taking locks, so no
>    problem. Same for acquire_fini and unlocking, which means nothing
>    that's not already covered by the dma_resv_lock rules will be caught
>    with this extension here to the acquire_ctx.
>
> - etnaviv: An absolute massive amount of code is run between the
>    acquire_init and the first lock acquisition in submit_lock_objects.
>    But nothing that would touch user memory and could cause a fault.
>    Furthermore nothing that uses the ticket, so even if I missed
>    something, it would be easy to fix by pushing the acquire_init right
>    before the first use. Similar on the unlock/acquire_fini side.
>
> - i915: Right now (and this will likely change a lot rsn) the acquire
>    ctx and actual locks are right next to each another. No problem.
>
> - msm has a problem: submit_create calls acquire_init, but then
>    submit_lookup_objects() has a bunch of copy_from_user to do the
>    object lookups. That's the only thing before submit_lock_objects
>    call dma_resv_lock(). Despite all the copypasta to etnaviv, etnaviv
>    does not have this issue since it copies all the userspace structs
>    earlier. submit_cleanup does not have any such issues.
>
>    With the prep patch to pull out the acquire_ctx and reorder it msm
>    is going to be safe too.
>
> - nouveau: acquire_init is right next to ttm_bo_reserve, so all good.
>    Similar on the acquire_fini/ttm_bo_unreserve side.
>
> - ttm execbuf utils: acquire context and locking are even in the same
>    functions here (one function to reserve everything, the other to
>    unreserve), so all good.
>
> - vc4: Another case where acquire context and locking are handled in
>    the same functions (one function to lock everything, the other to
>    unlock).
>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-resv.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index d3c760e19991..079e38fde33a 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -100,7 +100,9 @@ static void dma_resv_list_free(struct dma_resv_list *list)
>   static void __init dma_resv_lockdep(void)
>   {
>   	struct mm_struct *mm = mm_alloc();
> +	struct ww_acquire_ctx ctx;
>   	struct dma_resv obj;
> +	int ret;
>   
>   	if (!mm)
>   		return;
> @@ -108,10 +110,14 @@ static void __init dma_resv_lockdep(void)
>   	dma_resv_init(&obj);
>   
>   	down_read(&mm->mmap_sem);
> -	ww_mutex_lock(&obj.lock, NULL);
> +	ww_acquire_init(&ctx, &reservation_ww_class);
> +	ret = dma_resv_lock(&obj, &ctx);
> +	if (ret == -EDEADLK)
> +		dma_resv_lock_slow(&obj, &ctx);
>   	fs_reclaim_acquire(GFP_KERNEL);
>   	fs_reclaim_release(GFP_KERNEL);
>   	ww_mutex_unlock(&obj.lock);
> +	ww_acquire_fini(&ctx);
>   	up_read(&mm->mmap_sem);
>   	
>   	mmput(mm);

