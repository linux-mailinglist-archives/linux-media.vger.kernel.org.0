Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9413D2F809A
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 17:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729399AbhAOQVk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 11:21:40 -0500
Received: from mail-dm6nam11on2043.outbound.protection.outlook.com ([40.107.223.43]:29920
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726137AbhAOQVj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 11:21:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Prfu3zA6+BUplEZEsU26v7caoL3mrxJJQ6VBKorjuyIudf++dHWJ8xzoNeYg8cSpfCvgn3DnICI0/GDH6IwSRvOLfD31RtPdTGemHd+1OrhlOIB7zFcFjVxZqxrNW+WeWYuY4XVpj+byUYFF0gflcCEYd4BwcbjRGXfNV5dvUfyPTPk5XSyMYe1IUdh1WSUyuDDdygnvf4qf8Gj64jWXGir1dkUFdJQ17a1aFx0Ui0tlZDNdNQepxEP4RgK9HE4vvR2V8B+obIlGSz283fFyT0Pxv8e49fZVVtBkgbqFSr8BkVJDq6SGbzRFcQij4kQJngWI8suOog1KeL+zKFenQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6ASaopxxJHj0qGsFR3vRweFhAPvF4JWAO8tw4IdLjk=;
 b=a1KYcmJqIgN8908Z0cFl8RfyIxtyOrTYWvEyBYm+KWE4++AMhWgbnuV1c+cNNMnQBV1pH/YVbjEwngA56lFVIgWTFGKKm9YcVYvl+wJGGd3dCF5izFJyy4P+lAPROAFxriCkZ1j2W2KV+zSffvF1Zsv2TQKj/Xg86BNJOo/to5DW6MgLKyUVOraDCEX93XTGm8ttW7GFJ9GkTdHs1tNuoHJjqyBBidWYwHjLtJavXlnoZZew9EraOJqFrrjXeT98olrRaeMgbacUMDR3KMVcr9U0ozKrsjs/xpoFRlrsy3oUU1RiM9WSPlVuprS7T7rAbqZY20EooKkyH8vuHSiZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6ASaopxxJHj0qGsFR3vRweFhAPvF4JWAO8tw4IdLjk=;
 b=xyZo9EAQWlr4Rb2T2HwDKd2l9FN7P8Xfv4XN8vJnON6WPtSy5DnQzONtF710bNYhn5k1So+dI/JWsJPimeCi0t3vMoVORvQJrq0kk2FsD8tFwPQmT1mVQtJU+FZ2Sr1Ic9hEw5mllLe8qFntvnJdlE2XMMx5DbQ3Iq4zxnq7Ouc=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4253.namprd12.prod.outlook.com (2603:10b6:208:1de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 16:20:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 16:20:45 +0000
Subject: Re: [PATCH] dma-buf: Add debug option
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        David Stevens <stevensd@chromium.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20210115130219.3915789-1-daniel.vetter@ffwll.ch>
 <20210115155226.3943181-1-daniel.vetter@ffwll.ch>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a91ce968-0633-cfc6-1d7a-f1ac20c64e07@amd.com>
Date:   Fri, 15 Jan 2021 17:20:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210115155226.3943181-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR03CA0089.eurprd03.prod.outlook.com
 (2603:10a6:208:69::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR03CA0089.eurprd03.prod.outlook.com (2603:10a6:208:69::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Fri, 15 Jan 2021 16:20:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 637871c4-f534-41e5-8c8f-08d8b971833f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4253:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4253476913896B8D82FB36E883A70@MN2PR12MB4253.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 19WQ06YqJxXLScyLKaUy9E3RE/xP3Z+6Nku0FaGBv8OYR4VJuN5dqkgFW8o10xNy0pkLIBTvRsUD/XkL+5Nugal+nraCgXTYJUroQJp6flrP6wsM7Z54A85Q4/3VGAeKCqVwU7/2LdTKhVTGCJ4MJ43ECzY1RTebhKObcd7qQjyr4pf9wxMzh8igvTTFu4GDTYkOaw37xiff5220m7fLgcOiGI82kIKrddARXRHIXtFVEW6QVnCfj5e2R/lVoWE3Khu4j/l7JiUH2WJCpzpKafTTF33QwagDms/B5YOWvkuJXL9Vm+os++irHCA9PThZdn0pSg3CDBq24g7FEuDzbxXvQj0rHEjDy3vhu6MKlnAD/xJDx20TwmKCpyojPyL+pva3Cc9RzWp3ymRGmmKSp2+R+HM1cg6Ksz0w2c3PqrprPpmof71/mntLzH1vA696JQYrdnEJ0UhvPriuHC47Y2GUmrMYktgjbYUpHsww44c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(31696002)(83380400001)(66574015)(110136005)(66946007)(66556008)(66476007)(52116002)(2906002)(31686004)(316002)(54906003)(478600001)(4326008)(6666004)(86362001)(186003)(2616005)(36756003)(5660300002)(8676002)(6486002)(16526019)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OVQwU1hFNFNJejlsaEZFRm5SVjZYWEY5bkRDYWtyZ0JnNGJ2L1N5NHJ5K1N2?=
 =?utf-8?B?T3dLTWdMVjk0TkE5SjQ5L3FpUnJRbFdxbHdENkE1VHZVU0VCNDRRWlNsRHdZ?=
 =?utf-8?B?ZnpJdStiUXFib2dnTDVjMG9UaTNSWTlad25zSDdTRGhsTGtmaitLbmxkMGRs?=
 =?utf-8?B?VFNjdVhna2xZc1RyOXl3U0xsZVB3OXEzR3U1MHd2bVc2S014SU1iamJOVnZQ?=
 =?utf-8?B?cExHejFiUm9hZDE3cVdLSVB0UU1Xbm1STVhDRjF5RElhY1Mzc2lDRlFtQW1t?=
 =?utf-8?B?V3k4U2U0S0ZkSk5vdW1xcGkzWW9uMCs5OCtjWDgyQnNJclRITTJubmc5VmdB?=
 =?utf-8?B?RUR2cDRqdjV5Vk14WklMS1NwTDlDRXRvSHVwMkFkK0ZyOHlCYUFYS1hzUzBB?=
 =?utf-8?B?MHZmM0NkU2o3bDhiYWdFRDNRRkpIQmRpNzV6SWxHTHljdk9YZlZMWkdRVDVO?=
 =?utf-8?B?YkYxakxPdHBXampQU0p0TUhXU0J5VXFkZFh0R2xkU1JyUStSQjY0RDNGakhZ?=
 =?utf-8?B?L1pFMVk1V0FvVmE3aE9Wd0lTSC80NjVCK3lzQWtOcU84L2xONUNpWHl3UHk1?=
 =?utf-8?B?eFI0dzJQZzM2cGJTMDN3L3hTWVhCUEhBSUVhOEhkQVZPdXA2QjIyU1k0Rmtl?=
 =?utf-8?B?SzZLMjA2ZWZvd3BmeE5jTzAvaVdrSENzMmx1U3BjOGlFczBjdHpLMm82OWNr?=
 =?utf-8?B?cml0cGZLTG4vSTFpbFZCMU5nY1k2bVdzYlUrRytGenFJQlh5N2M0S1V6OVVr?=
 =?utf-8?B?R1ArbzVlS0xPT2UvMk1DMUgvam02cUJrZWllWCtIdUFmRTVIUHdGbEpUOEtv?=
 =?utf-8?B?RGRqTHcwY2wvY1c5ejJoUEZNOVFjNStvZG8relQzNUtWZExQVDhtQkhiNkhy?=
 =?utf-8?B?eFlEZXRuUm53YmQ5d21Zblp3VXAwRVNzUkl2NlVQWFRIVGd6aWZ4UEszSTNE?=
 =?utf-8?B?MkkxcmlPS0VmTWxhaUQzYW9aU1p6ZzBLaFJFZkJYTmxzTUVYZ1dzNzFnU2lx?=
 =?utf-8?B?c3haN2o5THc1MkVNcmZWRDIwRlJ4Zng0U2Y2VVd3UEVvaWxwbklCUDhJWXc3?=
 =?utf-8?B?V2RLeEFCZDlsVVVQZGhUbTUwenk2cm9tRFp2cEFCTVcyb1FCUlhPUDZZRDEx?=
 =?utf-8?B?eXlRR21YS3BKekVpVGMwUS9hNVlSc08rQXpyQ2FDM2JLUjRyS1RMbWtYclRw?=
 =?utf-8?B?VDk0TXlxSnlpOG9JMjVreDE0dmFBUFRoUTU0MGd5V1dURnl1VDBRWjNWRjZm?=
 =?utf-8?B?NkRKREhvUHcyRW14TzMvRGlmZXBlUUpIeG5uVVVVWG1ZdTZOQXNLRW9pcWNo?=
 =?utf-8?B?Y3F1OWpIM0JrY2JTdXE2WlhRWlZCMS92bXVicFZzN05YR2JvcE5lTmNiMTVo?=
 =?utf-8?B?QWI0SVU1RERaN0lMcy9DTHNCeUFhS3NkNDJHWXpTemdpYVNUM0tDaWxoeWM2?=
 =?utf-8?Q?CigBb1tr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 637871c4-f534-41e5-8c8f-08d8b971833f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 16:20:45.9127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+dsEGsW37x4biaAQam/wA8n/juhFCLlwNwukBk18x0D3nm4bZayL+scmYdYWCYD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4253
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 15.01.21 um 16:52 schrieb Daniel Vetter:
> We have too many people abusing the struct page they can get at but
> really shouldn't in importers. Aside from that the backing page might
> simply not exist (for dynamic p2p mappings) looking at it and using it
> e.g. for mmap can also wreak the page handling of the exporter
> completely. Importers really must go through the proper interface like
> dma_buf_mmap for everything.
>
> I'm semi-tempted to enforce this for dynamic importers since those
> really have no excuse at all to break the rules.
>
> Unfortuantely we can't store the right pointers somewhere safe to make
> sure we oops on something recognizable, so best is to just wrangle
> them a bit by flipping all the bits. At least on x86 kernel addresses
> have all their high bits sets and the struct page array is fairly low
> in the kernel mapping, so flipping all the bits gives us a very high
> pointer in userspace and hence excellent chances for an invalid
> dereference.
>
> v2: Add a note to the @map_dma_buf hook that exporters shouldn't do
> fancy caching tricks, which would blow up with this address scrambling
> trick here (Chris)
>
> Enable by default when CONFIG_DMA_API_DEBUG is enabled.
>
> v3: Only one copy of the mangle/unmangle code (Christian)
>
> v4: #ifdef, not #if (0day)
>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk> (v2)
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: David Stevens <stevensd@chromium.org>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>   drivers/dma-buf/Kconfig   |  8 +++++++
>   drivers/dma-buf/dma-buf.c | 48 +++++++++++++++++++++++++++++++++++----
>   include/linux/dma-buf.h   |  6 +++++
>   3 files changed, 58 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index 4f8224a6ac95..4e16c71c24b7 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -50,6 +50,14 @@ config DMABUF_MOVE_NOTIFY
>   	  This is marked experimental because we don't yet have a consistent
>   	  execution context and memory management between drivers.
>   
> +config DMABUF_DEBUG
> +	bool "DMA-BUF debug checks"
> +	default y if DMA_API_DEBUG
> +	help
> +	  This option enables additional checks for DMA-BUF importers and
> +	  exporters. Specifically it validates that importers do not peek at the
> +	  underlying struct page when they import a buffer.
> +
>   config DMABUF_SELFTESTS
>   	tristate "Selftests for the dma-buf interfaces"
>   	default n
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 1c9bd51db110..f676bab64f55 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -666,6 +666,36 @@ void dma_buf_put(struct dma_buf *dmabuf)
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_put);
>   
> +static void mangle_sg_table(struct sg_table *sg_table)
> +{
> +#ifdef CONFIG_DMABUF_DEBUG
> +	int i;
> +	struct scatterlist *sg;
> +
> +	if (!sg_table)

At least in the map case the sg_table returned could also be an ERR_PTR().

Might be even better to drop the __map_dma_buf wrappers and call the 
mangle after the error handling.

Christian.

> +		return;
> +
> +	/* To catch abuse of the underlying struct page by importers mix
> +	 * up the bits, but take care to preserve the low SG_ bits to
> +	 * not corrupt the sgt. The mixing is undone in __unmap_dma_buf
> +	 * before passing the sgt back to the exporter. */
> +	for_each_sgtable_sg(sg_table, sg, i)
> +		sg->page_link ^= ~0xffUL;
> +#endif
> +
> +}
> +static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
> +				       enum dma_data_direction direction)
> +{
> +	struct sg_table *sg_table;
> +
> +	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
> +
> +	mangle_sg_table(sg_table);
> +
> +	return sg_table;
> +}
> +
>   /**
>    * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
>    * @dmabuf:		[in]	buffer to attach device to.
> @@ -737,7 +767,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   				goto err_unlock;
>   		}
>   
> -		sgt = dmabuf->ops->map_dma_buf(attach, DMA_BIDIRECTIONAL);
> +		sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
>   		if (!sgt)
>   			sgt = ERR_PTR(-ENOMEM);
>   		if (IS_ERR(sgt)) {
> @@ -784,6 +814,16 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_attach);
>   
> +static void __unmap_dma_buf(struct dma_buf_attachment *attach,
> +			    struct sg_table *sg_table,
> +			    enum dma_data_direction direction)
> +{
> +	/* uses XOR, hence this unmangles */
> +	mangle_sg_table(sg_table);
> +
> +	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
> +}
> +
>   /**
>    * dma_buf_detach - Remove the given attachment from dmabuf's attachments list
>    * @dmabuf:	[in]	buffer to detach from.
> @@ -802,7 +842,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   		if (dma_buf_is_dynamic(attach->dmabuf))
>   			dma_resv_lock(attach->dmabuf->resv, NULL);
>   
> -		dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->dir);
> +		__unmap_dma_buf(attach, attach->sgt, attach->dir);
>   
>   		if (dma_buf_is_dynamic(attach->dmabuf)) {
>   			dma_buf_unpin(attach);
> @@ -924,7 +964,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   		}
>   	}
>   
> -	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
> +	sg_table = __map_dma_buf(attach, direction);
>   	if (!sg_table)
>   		sg_table = ERR_PTR(-ENOMEM);
>   
> @@ -987,7 +1027,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>   	if (dma_buf_is_dynamic(attach->dmabuf))
>   		dma_resv_assert_held(attach->dmabuf->resv);
>   
> -	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
> +	__unmap_dma_buf(attach, sg_table, direction);
>   
>   	if (dma_buf_is_dynamic(attach->dmabuf) &&
>   	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 628681bf6c99..efdc56b9d95f 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -154,6 +154,12 @@ struct dma_buf_ops {
>   	 * On failure, returns a negative error value wrapped into a pointer.
>   	 * May also return -EINTR when a signal was received while being
>   	 * blocked.
> +	 *
> +	 * Note that exporters should not try to cache the scatter list, or
> +	 * return the same one for multiple calls. Caching is done either by the
> +	 * DMA-BUF code (for non-dynamic importers) or the importer. Ownership
> +	 * of the scatter list is transferred to the caller, and returned by
> +	 * @unmap_dma_buf.
>   	 */
>   	struct sg_table * (*map_dma_buf)(struct dma_buf_attachment *,
>   					 enum dma_data_direction);

