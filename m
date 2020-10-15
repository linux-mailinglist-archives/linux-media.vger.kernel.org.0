Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97EE28F41F
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 15:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730240AbgJON7J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 09:59:09 -0400
Received: from mail-dm6nam08on2081.outbound.protection.outlook.com ([40.107.102.81]:15585
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729930AbgJON7J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 09:59:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYcC60ctnJOCLR4Kn5YaGE7u7pJBkfsGXlPsN90cs/Oa9MBEMg3YzSN7nQxPaEUCkXmUe8Y5vIPDeUrG4CL6/ykIAHlgPiVhq60Gfi20mZXbGPSDELp/QTL6/F86FKZgMLyTxqv0mOmGpGxbOpn2azQVVglfr5lSAN64IiN+Ruc5xEBoJjp+snIjCoaF69HKq2qb1e/ktzFxiko66MrTUJ6y+h/wAJ8WXjgTPW5K54p0r3je80Mtwj3yWIndt+ak00JoK0O+e68P9Z2XKdT6kIUTcxn4+UhDiwOb7TAy6E/iylRhBIW3zGGdYCCdfAKAQDBN+T7NbSfPnycw5FHCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/X6P3sHVYi8SGMfQVN4l2Td6iDIe836nU3EJJf7YeA0=;
 b=f6TstBHqAub+NROJZeHieUccD6TZRt5UdLse/UhFw7mmjbzPdgdFd5mvCRsMJCvdFBkd8LZHE5V1kWi8pZNh28T91y3W/epbdaCId+GCmgZaPjvhuEQPUu8Fxo1ZGOTNHl3HYeYRR855puUtHiFV6KG8tTLn7yqf2UmlRyNrCQMKRFShc8s2Fjpdq1liexpmU/gDoo8IIpOZK3L19mc2jJtobCmEB4inL8N8ENapHYznL6hgxAjNLs6eWjYH3+g0YIeay07xifTi9anPIsFREu39dUKMF0PnZZyyX31xwUqaAPo/CvHm78e9XprdFWCRD7vE2kDkVv02ll3BMsquEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/X6P3sHVYi8SGMfQVN4l2Td6iDIe836nU3EJJf7YeA0=;
 b=NBFuDf98/dVaJgBpw1yN6XHEhfcVFfVpF/b0k+VWHHRoVLn14NCY3Uz8g8ILK1VHLMyDfm5TP4RwXRMYayv0mqSl7Xevbum6QwaBUz4Zzhy9A87ZjclBF0f8t13YCEewUqvYThza4lvu57nbDhTWrWRa3oIFIurAYbKBh5CUHQo=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4690.namprd12.prod.outlook.com (2603:10b6:208:8e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 13:59:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 13:59:04 +0000
Subject: Re: [PATCH v4 02/10] drm/cma-helper: Remove empty
 drm_gem_cma_prime_vunmap()
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        alexander.deucher@amd.com, kraxel@redhat.com,
        l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
        christian.gmeiner@gmail.com, inki.dae@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
        yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
        tomeu.vizoso@collabora.com, steven.price@arm.com,
        alyssa.rosenzweig@collabora.com, hjc@rock-chips.com,
        heiko@sntech.de, hdegoede@redhat.com, sean@poorly.run,
        eric@anholt.net, oleksandr_andrushchenko@epam.com,
        ray.huang@amd.com, sumit.semwal@linaro.org,
        emil.velikov@collabora.com, luben.tuikov@amd.com, apaneers@amd.com,
        linus.walleij@linaro.org, melissa.srw@gmail.com,
        chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-3-tzimmermann@suse.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3ff4a9ce-ff3a-392e-e67e-a7687b0826e9@amd.com>
Date:   Thu, 15 Oct 2020 15:58:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201015123806.32416-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [80.187.123.114]
X-ClientProxiedBy: AM0P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.137.56] (80.187.123.114) by AM0P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Thu, 15 Oct 2020 13:58:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 36738f6f-d5b1-4021-227d-08d871127994
X-MS-TrafficTypeDiagnostic: BL0PR12MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB46909E3095D926AA8D9F1A5383020@BL0PR12MB4690.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFCzxu+oWIOFBXgbS3E40StWNNOeCeNWPlLvXZA+5gbsrbC2xkNWwcvRemVacRRDuVzuUdyL7WxKSE0WPdFD0PZdgyeezO+LSXbPHf4SEjMnkwrmKl7shDYUbD7OKC3rPyokPgIX8VSDCDCsabLArRfDSByNB2BlwsMF4hCQIrePHQ8MX22w5V5+MEPgfa4P8il1+GxxeOs1athAJEDJOmj2bc3YrtCMVlzbr953BQD1t7CiENrdbJkAORIg3f33nfiKHJUY6O3+NS+uHsal0f9N3WnWm/mFzGef5POsN7RPXpoALYHLqqwCQ4MWOdjTqa3EA+GQJZ6bb5GmW784W34oAkvv2/UxDRhAjz3Shm8dEqaO8HwEsrxRSEu0iqo2/mNAQ40vXmUiryKWwXkENSfgBMnq/NKN7HQW8vGbn6ljjUPef4GjHBNku3ZeVfLs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(956004)(478600001)(31686004)(8676002)(7416002)(4326008)(8936002)(7406005)(52116002)(186003)(2906002)(16526019)(26005)(6486002)(34490700002)(31696002)(83380400001)(16576012)(2616005)(86362001)(6666004)(316002)(66946007)(66556008)(5660300002)(66476007)(66574015)(36756003)(921003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 7iZTwAHhsdsOS5e7MZL4vxRacbuYzr8FU2IF5UhejhJjF/7EGTcSEc8HlZG4Pkwwngal1jOgTkSGvE8a5eUM5qd/6P7hv7/H6EgR9bAAbS5LKQthkFYR74FcX48KVEin9gFHDbSsG7dYgSKtani2Gh4TeTW0YyrhF72Zz+GOwZB6wG4rC/4Uc4aAPxAkdFDR/ykHYqQjDuq4rizHcy9ISqwF6MBeKo1tDItQ4hbGgbbEfmf2SIynuEQ/PaAgxmSFrbxO/1dwA2SMacW20lPA+D8B1jz6aVvspg5N3rSa6Yh/2bWPjAmmdTInrwEn7lkYHY5CGdtvDwRRrXi79AyC/7du+MmAL9jI0DUDlSeGIGeuVrpVZIYbOgHM7QSYPTi1MmBnyiNohLFQ+/NdSXqkqHTCbYdspkfKOUhESFRRTT0RsgW4Y5wNHNPkhydA2ugdWTB+SRRKctwDw2vB1RFLAZ/maad0a04CFvBuH/upzc6MKPlNKA80Tu0cvdEjpqRu6PadBmfhsonSjwj12oY/TnlDEQpBLd6piWHXlDohjR+wTIE+U8dnlhEi82n9YkltFBMCrBwmQSljGakUAhZqQY5CjInXWQQeFDM5AfnsIx3t8FUQQZS8BxSe0/Eu3un/mYtf/1ckN57XyDPWu8+4fg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36738f6f-d5b1-4021-227d-08d871127994
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 13:59:04.3772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYqzf6UaB495/1Q4rARdAUUDW8dyETsymTnQ8NutDz2IxispLaDQL4625w+jbCBN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4690
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 15.10.20 um 14:37 schrieb Thomas Zimmermann:
> The function drm_gem_cma_prime_vunmap() is empty. Remove it before
> changing the interface to use struct drm_buf_map.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/drm_gem_cma_helper.c | 17 -----------------
>   drivers/gpu/drm/vc4/vc4_bo.c         |  1 -
>   include/drm/drm_gem_cma_helper.h     |  1 -
>   3 files changed, 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 2165633c9b9e..d527485ea0b7 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -537,23 +537,6 @@ void *drm_gem_cma_prime_vmap(struct drm_gem_object *obj)
>   }
>   EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vmap);
>   
> -/**
> - * drm_gem_cma_prime_vunmap - unmap a CMA GEM object from the kernel's virtual
> - *     address space
> - * @obj: GEM object
> - * @vaddr: kernel virtual address where the CMA GEM object was mapped
> - *
> - * This function removes a buffer exported via DRM PRIME from the kernel's
> - * virtual address space. This is a no-op because CMA buffers cannot be
> - * unmapped from kernel space. Drivers using the CMA helpers should set this
> - * as their &drm_gem_object_funcs.vunmap callback.
> - */
> -void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> -{
> -	/* Nothing to do */
> -}
> -EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vunmap);
> -
>   static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
>   	.free = drm_gem_cma_free_object,
>   	.print_info = drm_gem_cma_print_info,
> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
> index f432278173cd..557f0d1e6437 100644
> --- a/drivers/gpu/drm/vc4/vc4_bo.c
> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
> @@ -387,7 +387,6 @@ static const struct drm_gem_object_funcs vc4_gem_object_funcs = {
>   	.export = vc4_prime_export,
>   	.get_sg_table = drm_gem_cma_prime_get_sg_table,
>   	.vmap = vc4_prime_vmap,
> -	.vunmap = drm_gem_cma_prime_vunmap,
>   	.vm_ops = &vc4_vm_ops,
>   };
>   
> diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
> index 2bfa2502607a..a064b0d1c480 100644
> --- a/include/drm/drm_gem_cma_helper.h
> +++ b/include/drm/drm_gem_cma_helper.h
> @@ -104,7 +104,6 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
>   int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
>   			   struct vm_area_struct *vma);
>   void *drm_gem_cma_prime_vmap(struct drm_gem_object *obj);
> -void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
>   
>   struct drm_gem_object *
>   drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size);

