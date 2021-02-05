Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88E48310C15
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 14:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbhBENqE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 08:46:04 -0500
Received: from mail-dm6nam10on2062.outbound.protection.outlook.com ([40.107.93.62]:7008
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231380AbhBENny (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Feb 2021 08:43:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGpJMTEzhbTr/HpSlF0+l67uBpQxYDVVExMgmAEKr7W5apPfEIsyrJ029tj5Ld9OncQKpR1L3/KZqhP2rMG6fMfkuzWotI37hypx3QMNRTc6NHyeOYsdgqUEZV7z+iUvWrXQw1OnNpQ60PYmWlXyNshgdXziMgiqUtdyQtNRIJQQGob6lFyl01o1AW0iQfHyC4zQwxa6VEWuFUME8kIiY+RkIyf5jc/X/v4Vxw0wH4C/YBmLji8fIfKUiXd3lWuv9OCNXAgKJYMfFBgsoZhbrrkw00U1M0+g8CKLIfI56vjm3HOJX3m3M+LwmcnpqN5qdBDk2o5SJxXXzEFn1hXyGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjVWEuEVnyOrPQWQCeMB0wiDyAzt6X7M1bsOn/SFlNs=;
 b=S80COPBLaEIDcqO9AzDJGaQ3sMLWu191VWWQmMAQGPkYcSVqvv8H3a6qogdlNwRjhndVOJ6YCRYCyTZRQsQJ8DxMFfMcEpKist7zNrOhS5JAr5PqcSaN7fHzpMB1pFls7hluuKFO8gGbsN7lWS55fHxxqDQyt704/902nbEBzCe1wgE3kq24oLMTI1tqtvo4LNRn0T/1OV3tHlTbfJ5450b3pbyhAp1IqPB4dyVpXeK7xZj7sgJQ2BNPSPBvuJApfOnusVyhufjKTrjhXhUp1ks3AuGQQ8gz6fXGMpgtvGwfqnBGlztPFtZX84e+CgFeN4wbBlCwx37HvAgRcu4YyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjVWEuEVnyOrPQWQCeMB0wiDyAzt6X7M1bsOn/SFlNs=;
 b=ij1SJubhGnAUpyHdsu2yZfUrROzCQGsWU4/OtnrjeVv8R0vXvo44S8E+WQ+kOMGG8NM5x/ui7LERVbe2I//3pVy6OxPSkWIATpHJ7lhLfppQBh9cMil2IQ4NVAEWxclL7FNF93bdRACe2f1Cebd8pud8yjg0mdS/zBNUCFLmzq4=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2356.namprd12.prod.outlook.com (2603:10b6:207:4d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 13:43:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.023; Fri, 5 Feb 2021
 13:43:00 +0000
Subject: Re: [PATCH] RFC: dma-buf: Require VM_PFNMAP vma for mmap
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
 <20210205134113.2834980-1-daniel.vetter@ffwll.ch>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <847246c4-e1e7-ad27-41b3-8a13064fbd31@amd.com>
Date:   Fri, 5 Feb 2021 14:42:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210205134113.2834980-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0087.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::40) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR10CA0087.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 13:42:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 400de312-0410-45ea-3985-08d8c9dbf3c0
X-MS-TrafficTypeDiagnostic: BL0PR12MB2356:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2356C58C2E663D210352021F83B29@BL0PR12MB2356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aWU+yhuNU+He8/3s/RIm7/27ItRojnS7MwbaANlpVtiYr7Pgb6fQ723iLlDtYQ019z3GGszOsuckah/ZBisIfns7SVlnfO9oS5D90xdxSqSXoSE7HBmS6LzJkfQ8EdWFR2RvMvWbI2AZXOtAZOA07y1aIe9kC51r+8wL0PLY2f1njdsCbv2GcWzQn6lgZgasARCqeR17ouiIQee3rnvsfCDHg2Ndd7kToIJFNiqFoohoFAv2EodExoc2scy144b/W6ihfrElRDOUc+6Xuq5/ML8fcHwK16jf5gAWS3ZR3ZyIA3hE+1K/vr1SePbGdx9ng4KKJIDm7v6imsk2OT2gO+Psnszjte4KY9RDYLnDCpWfPSwLJyWs9LEsDhxGLFks2hdoVetd9Y/9bR91sDzM8MhG0zh3POGPo5F4wpOa5W+/gdTtCqueKv6eApCG71Cy1nPBcDJKpIyGsqW5qeJk2DAnrYFiKpVx1aFfYGmT7MCkGVVlOiah85MzQDZ953ch0OTe4q1QhZJRsipBh/xtCFQHOOFraaYvQa6XAcXvwAh7vsHAFDWotwLS3GW+l8KPDtg6Hbb1zvi41/9+bpJhpIRPk6HR/InXCXhJCoh7mN/FGp0YB2D3vzP5mcXFckQc2nLI7uodKIQsPqt1FcJ0f/7vV5G2vtCoZ09NewtHdJomHMsU7RKeMyDx9m9mm8eS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(966005)(66556008)(31696002)(110136005)(6666004)(5660300002)(31686004)(52116002)(83380400001)(4326008)(6486002)(8936002)(8676002)(7416002)(186003)(316002)(54906003)(45080400002)(36756003)(86362001)(2906002)(2616005)(16526019)(478600001)(66476007)(66574015)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VEQyOCtXbUNpNmpOTjNnU2QvVmtqS1d1a3ZaZHUxbzc2STRLUk5UcWFkdXF1?=
 =?utf-8?B?anl6TkY5Nzl2Yk5GUStNVEUvYUFxUWtqbUpLaFcvMm9vcFdGbkJCK2s2dHVh?=
 =?utf-8?B?dTZlYmQ2cStrNzVCTTFxMC9aOXYreWpnWTE2djN5Tkk4T3BDYUlkWlJhRGto?=
 =?utf-8?B?aTFPWWQ1L1QvN3h0ei9wMHk0UnVYZTJ0U2VaWHBoQnF3czJxQyt0Y0NFTnZP?=
 =?utf-8?B?NzVpTURoQ3RlUnhia2tjT0RuZlBwZDRScGlFWlAwRDUwQWc4bzFMalFFWGpG?=
 =?utf-8?B?R2xiWUdPbGVrSUlja1dqZGwzTks5TU5NSnVBeU9MZkxZck42d1FhYTh0QW53?=
 =?utf-8?B?dlJmeGUzQkRZRzh4SHkram1MdlFscUx6WGY1dXdVeldzQkxmYlA2TFBIS25u?=
 =?utf-8?B?TDNvOUVwVDhmNjl2U1ZhM3FxL0dWU1BkSm04UVd4Skk4bW8zdEJ1SDZrKzZn?=
 =?utf-8?B?cXRxNkNNc0J0aGdFVXh3amFyUkI3clNsYlBZM2JjZkkzYXh6WlZqaVJraXB5?=
 =?utf-8?B?c0JTQzhnc1VUNlFDbkJ1YzRkc3NTV1dmMzg1TUdmQTIrd2JZaFhZVjBSVnNq?=
 =?utf-8?B?S2tReEMwY2h5dlVHUmkvUE4vdit4ZmdsbVpnenhoRklEajNnM3NuMmZ5NmtH?=
 =?utf-8?B?T1dhUEdjWlM5eG4ydDVBTzBKQ2VtbU1zNHlSZ2pjamhVUGhHMllZNFREL01Q?=
 =?utf-8?B?elAvQ2NPUld5U2lPVWNWYVRkQzdCZm9LOCttelZ2clAyaHlaTkwxTFZxU2Zw?=
 =?utf-8?B?SzV3WmxKbFhweE1zRFYzdHVVVUppU2N0a05rTkJKb3hlZ2VldStoOEt4djZm?=
 =?utf-8?B?TmpoNGQyVUR0UURSU0hSZXBhTVg2VHVJWGxBdVRET2E1OFA3NEdVc2tLZFdF?=
 =?utf-8?B?T0FTcWJ5T3k1RTlXTDRadWY4R3JIZHlQTFVFT09ZY2tpM0U0N2g0a1laazk2?=
 =?utf-8?B?NWhLNFBmb1JRdjRzTmllN29jcnM1bVlOOXRsWnBKbTFmS3dNcmdwMFZEcWNr?=
 =?utf-8?B?aFgyd2hrS0pqUkl4YkFwSk51a1dJdXRqSEU1ZXRqMzVRalVqZE5NUjdtSExt?=
 =?utf-8?B?WDNzL0piWlE3NjZKTlpEeGtXZnRGTnV4RkxYZ0xVcjYycUNzS1A2ZkhzK3NK?=
 =?utf-8?B?NDlKcFllcHI1cTZpNVAvTjZhNmk4aGxzMUVKQy9vV2pxN2NHaGZRMEljQVFP?=
 =?utf-8?B?WGZuVjY3ZFVRcWlZYnQyUjE1ejU0a0l4QUNrcnUvSW5tV2Nqck5HYWhzaFlS?=
 =?utf-8?B?aFhqaTFZOHNCUVhUZlhOa0pURkxLYS9JMkJIbUdNSGM1bVROblFCQmFzOHY1?=
 =?utf-8?B?NjJ3VVNPcVFJUWhqVklSakZ6TFVQbmNLNTg5K1Fqd2JHSm9pMGRVQ1VtRXIr?=
 =?utf-8?B?Ync4WkxsYzdIbDFpbDNEbEFiNVMvejdoQmV0TElxMk9tV0J3S3E3WDR4akZq?=
 =?utf-8?B?ZnB2bTBMYis5Ykh4TjZYMkxvNDdSZ2RiY2Nja3YydFJtd1hOVTJmTGJrK2tM?=
 =?utf-8?B?cit4VnpZdUhHL2ZVVXpFM1FCY2VKR3FYMHM4V3NISTFpL3hsTVkxTXRjNU1l?=
 =?utf-8?B?cVZZNFFqQnE3RWhrbi8yQmJERzY4dXNMZWY4cEZZOFFrZWlKWWc1OE5hL25q?=
 =?utf-8?B?L0pkOGNTTnFHbTVxNWs3S1hsSTNEZ3dzbmQ0UUxxbm9QbXRNb2puektjR2pB?=
 =?utf-8?B?bjFHZDZGVllrankxN2RWYkdKODZOVlBVVm1NeGliUnQ2NERWcjd3UDJGVExE?=
 =?utf-8?B?MVo3YUhXeVo2V2NvL1FEeE5kTlkrZGN3T291WXpMUjFLUUR2MHNKblFvSU5w?=
 =?utf-8?B?aVZlR0k1dFdlcFh4OGYzV25IbFBnaXZsRXQxT1gwekxINTI4dHZaNU9TQ3hH?=
 =?utf-8?Q?1IFX7k7IAulev?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400de312-0410-45ea-3985-08d8c9dbf3c0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 13:43:00.2574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBEh/08xcZtsyzufU3ZXpz1xZZrZjiMY0dcx5q+aLp/sKlouu67tGjqdZA6l+DWT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2356
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 05.02.21 um 14:41 schrieb Daniel Vetter:
> tldr; DMA buffers aren't normal memory, expecting that you can use
> them like that (like calling get_user_pages works, or that they're
> accounting like any other normal memory) cannot be guaranteed.
>
> Since some userspace only runs on integrated devices, where all
> buffers are actually all resident system memory, there's a huge
> temptation to assume that a struct page is always present and useable
> like for any more pagecache backed mmap. This has the potential to
> result in a uapi nightmare.
>
> To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
> blocks get_user_pages and all the other struct page based
> infrastructure for everyone. In spirit this is the uapi counterpart to
> the kernel-internal CONFIG_DMABUF_DEBUG.
>
> Motivated by a recent patch which wanted to swich the system dma-buf
> heap to vm_insert_page instead of vm_insert_pfn.
>
> v2:
>
> Jason brought up that we also want to guarantee that all ptes have the
> pte_special flag set, to catch fast get_user_pages (on architectures
> that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
> still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.
>
>  From auditing the various functions to insert pfn pte entires
> (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
> dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
> this should be the correct flag to check for.
>
> References: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2FCAKMK7uHi%2BmG0z0HUmNt13QCCvutuRVjpcR0NjRL12k-WbWzkRg%40mail.gmail.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ca8634bb0be8d4b0de8c108d8c9dbb81c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637481292814972959%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=8rylgsXhWvQT5zwt1Sc2Nb2IQR%2Fkd16ErIHfZ4PErZI%3D&amp;reserved=0
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-buf.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index f264b70c383e..06cb1d2e9fdc 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -127,6 +127,7 @@ static struct file_system_type dma_buf_fs_type = {
>   static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>   {
>   	struct dma_buf *dmabuf;
> +	int ret;
>   
>   	if (!is_dma_buf_file(file))
>   		return -EINVAL;
> @@ -142,7 +143,11 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>   	    dmabuf->size >> PAGE_SHIFT)
>   		return -EINVAL;
>   
> -	return dmabuf->ops->mmap(dmabuf, vma);
> +	ret = dmabuf->ops->mmap(dmabuf, vma);
> +
> +	WARN_ON(!(vma->vm_flags & VM_PFNMAP));
> +
> +	return ret;
>   }
>   
>   static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
> @@ -1244,6 +1249,8 @@ EXPORT_SYMBOL_GPL(dma_buf_end_cpu_access);
>   int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>   		 unsigned long pgoff)
>   {
> +	int ret;
> +
>   	if (WARN_ON(!dmabuf || !vma))
>   		return -EINVAL;
>   
> @@ -1264,7 +1271,11 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>   	vma_set_file(vma, dmabuf->file);
>   	vma->vm_pgoff = pgoff;
>   
> -	return dmabuf->ops->mmap(dmabuf, vma);
> +	ret = dmabuf->ops->mmap(dmabuf, vma);
> +
> +	WARN_ON(!(vma->vm_flags & VM_PFNMAP));
> +
> +	return ret;
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_mmap);
>   

