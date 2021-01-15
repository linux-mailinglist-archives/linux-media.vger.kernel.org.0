Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53F212F84D8
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 19:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387906AbhAOSxz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 13:53:55 -0500
Received: from mail-co1nam11on2063.outbound.protection.outlook.com ([40.107.220.63]:32738
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387842AbhAOSxw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 13:53:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vq77cquOzrYPLeYWFW7FP6ig1wiOh94e68ejFHNtE+SeDLu6e2phdzMhk4tNT9AH2SS5V+3YWXIZ+RDZ4IOzBtyRmU3ReO+CMiIL+0V+iAuqBK7a+sROf3SM8mPR2RZ410Zt/ANQbApsYdVgeM1e7ghLjCcIQ2l7C8k3qa2LHg+MF3DnVKfGvf9VjNHMdvbde3IwiqHtU4zW/BRJZGuJt7cvw5jPk38ZU2l3gNmz3xtVxVS+tbVPpnsdyJ0VWqxjdXrQ959PoVMmyp5QIR1Lq9daXrWRrEUoaQFOW926lp64oUudZBk2Yczydr5qcciF8gaf9MExS+kosZj7X73DPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OE5uFZlnfgT15snBSwiSHJiK4F/bnZNDlv5ug1PNPRc=;
 b=cJgqCfqkrLirei3e5ckqjxFaz2Vsm2C5dC0/9KrgU5DWroinU46dR1Dii0NrItH5XwXIPc7NbHDlMvfX+YbrOsDZkY806rJzLZL7Z5famXKL6YlgYR59jOGQIGGPhluJir3HHMSZFATnFI91Hkh4bAztQZ1rag6xnqlhcxwxubQg/Ndc0DvoPUkqjzQHjRvSDie4uoLkoVrG3qswHtnKwME8bCS1Q/FzuhmKdxCc/QfRIkTjYe8MFj0XbBJGp9hJebW1EquJFf9JNsL0bKIfWi7mTHncNS+JLY5cSmr5pMScL2mFJUl1kpsSXhI3OeJzE51Cpvv/UuNVua4uUTODDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OE5uFZlnfgT15snBSwiSHJiK4F/bnZNDlv5ug1PNPRc=;
 b=oLMfv1CBakujSJHkeWAlDKsp9rlDFo95tU9As7ka/80TK2iLyGZb0Qvzlq5Am2PMcvMyZp+qDot4asg4Gtm7QgRw+Lyj3NWklpVoGMy6LXMKECmPAY21ech1S962fzpydvJpg8FuKK0mCOBeJ9SO9WRhr6bER49GA83NPT7+SWU=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 15 Jan
 2021 18:52:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 18:52:59 +0000
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
 <20210115164739.3958206-1-daniel.vetter@ffwll.ch>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e2e5a693-6e8a-7712-b5e9-93d7dc1c3c08@amd.com>
Date:   Fri, 15 Jan 2021 19:52:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210115164739.3958206-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.4 via Frontend Transport; Fri, 15 Jan 2021 18:52:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 72e26c86-9d8d-4cdf-6ea6-08d8b986c6e0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4391:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43911E1E59B67B28B3FEE4D483A70@MN2PR12MB4391.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ejGmDIsQXQNp+UP+1sar+TtflQmRgFCy0XZ6nh4EFlitPpr81VAACxhAsJFd5zzzPB/e9bIPv1ateJZYUiSvPqarhIcXxUoy3+Zx+cXq1dH5psbyX+GjqfJ/3fWiRJiqepFkzW7aoBckgvrfNujSh8c8uJoA1fM/mpBmg5DVhy+H3WCB4sTHUcDSynEVhh3eXG2yY+sCYQjxPKGoBmICs4iPI+ToPPeF7CkSjtZV850p3Kw1gezeXfrMA6+uCwOxdXrNH9AtS/t4dB3ZdLlHkoYWOZDPzLSQ3xBI5be5SZ/T1fKjbBrGANM+O9TMfbaqMX+1gXlxvv+uL9djk6CB8VQ24vscAZMNq6K8p0x4jkAgjPLwj6vrma+PZyKtFO+iUoxCPm1gRawkH8CSA3JxVR5Ek3qqHyeXW3i4pyKKCwh1koVHM9LryXryprB3hCySVgRBJ/bNgHhdHiWH24ck/TeYh3c4hIWSFx/INkS7axU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(31696002)(6486002)(52116002)(83380400001)(66476007)(2906002)(16526019)(86362001)(66556008)(66574015)(5660300002)(186003)(8676002)(110136005)(6666004)(316002)(36756003)(2616005)(478600001)(54906003)(31686004)(4326008)(66946007)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TzcyZ25vMm5nbUo0ZkZxc2taSVgvNzlHRTZqQVBydjJ4NXZMRFduMnkyeVlB?=
 =?utf-8?B?RTl5S1M2NURPNERSQ3ZrUjFOOHpOWW0yaVRVcExzQW5xNmZxdTQxZlpQUDNj?=
 =?utf-8?B?WHV5RDhxNmVOOG94ZFpnNUlnR2k5d296eCtuUmVyUUNXWWJwV09XaDRaWGlX?=
 =?utf-8?B?Z090UnRJZVlpaUIwTnU5S29Lc0NqSERCNGRMbHpISFZaNXdVcUlVcEl1QldG?=
 =?utf-8?B?NndxNDFadEhYdlhHY3R5d0tnbis1Z3JxZlk5cWdMVWw2MkUzMXpqUjduSkJi?=
 =?utf-8?B?VFVWSk1zdlV4R0NQcFVPTXgxYVJvdm1VeStEVCtRZjY2MzU2UTRkRmM1c0xw?=
 =?utf-8?B?TlhySEhaK0VUb0s1QWFhMGplcVlXZytDNEhwM3BQYnU5R1FuK21ZMkYvd1VJ?=
 =?utf-8?B?K0syOHl5eGtlTW1yVVV5YkJXRDJ6UUE5S044d1k0QWZEbmZlMENhN2NheWEv?=
 =?utf-8?B?YmErV1ZyVThveXpRWlBlRGlYOE8vYmo5M0oydkJtK2dsbHNVM0tZbzIwSzNM?=
 =?utf-8?B?NEx2NkpaS0hDMnRub0YyekMzSVF2TE5QU1RTWVRYWHVTSTQ0UnhPY2wzSVRQ?=
 =?utf-8?B?M3ZKaXh1WnlDWVc5NU92Y29kL3BDWEVnSlEwN0FtQ1p5SVIxN0p0aGdWM250?=
 =?utf-8?B?eUNua1BmUHVyU1BVYVdma2t4VUhWWitoMnd1dGU0OG1CMEJqeS9ua0hWeGFv?=
 =?utf-8?B?M1FCUDlmZlVqekN4cndDL09aYXRxVWorVy83dVc2SitEQWI2VnNjSXZsMW90?=
 =?utf-8?B?MUNZRmEwZHJVMUx1NDh2YlIvMEhzL2xBeURZL2xuUkNIRmFycStRNTZsdUc4?=
 =?utf-8?B?dU91ZDJGUGFRcFZ2ZHNZL1lkZysyLzF3dms1cDJCSkFidGV4a3A1MkpmcnNN?=
 =?utf-8?B?cURnaGEzWG9yNExXRjVPNHJ5WGFXQ25haW05SkJGL2NSUEh0R0pidmdGa3oy?=
 =?utf-8?B?YlNnV3dTWU94ampzeXc1Z1FYb2RydTZFSkFuYXlYMW9ZU1Vjb216U3pLNzI1?=
 =?utf-8?B?NEV2T05namdxSWFPaTRndXkycDdzUGZaeWdOZ09FNjJhZ1hzaHFZNFdPbXhF?=
 =?utf-8?B?aStHaUhqQnZoYU1GS0xoRnpGOTdpTXBMU3pUTmNTT2p3S3FZZVk3OGNSODZs?=
 =?utf-8?B?N05JOHhtNFJzU2VmVFp1Q2hrQlI2eFFTS2s2cHk4NzBGNmFmbytvNHZDbnE2?=
 =?utf-8?B?RzFZSkQwMlhTWnh3QW5BZVFQM0xPREtNN1hlV2c2eTNNV2o0OE9YRUpmNldI?=
 =?utf-8?B?UEUwc3E0Tk1yMkE5ZHN2K0drNldUVTlCL2JHanJzN0NQTktYL2lUWC80cStj?=
 =?utf-8?B?QXVxK3owV0JnSTY2L0U5cHkwYkw5alc2d2ZuKzd0Z3FCR2Rpd0x5Qm1JZEli?=
 =?utf-8?B?R1NYWDlpb3BBVVlQQktKMk13SC8wZldERkpNUFhKbHVwOG8va3Y4WGJtRmxo?=
 =?utf-8?Q?nkxAO/Ts?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e26c86-9d8d-4cdf-6ea6-08d8b986c6e0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 18:52:59.0566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJy01zudz7xpwtD3ObECsX1wJMnn6Q5ImuieQQvhex18i/gEosT2x3+sWPtU1b83
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 15.01.21 um 17:47 schrieb Daniel Vetter:
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
> v5: sg_table can also be an ERR_PTR (Chris, Christian)
>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk> (v2)
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: David Stevens <stevensd@chromium.org>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/Kconfig   |  8 +++++++
>   drivers/dma-buf/dma-buf.c | 46 +++++++++++++++++++++++++++++++++++----
>   include/linux/dma-buf.h   |  6 +++++
>   3 files changed, 56 insertions(+), 4 deletions(-)
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
> index 1c9bd51db110..f264b70c383e 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -666,6 +666,34 @@ void dma_buf_put(struct dma_buf *dmabuf)
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_put);
>   
> +static void mangle_sg_table(struct sg_table *sg_table)
> +{
> +#ifdef CONFIG_DMABUF_DEBUG
> +	int i;
> +	struct scatterlist *sg;
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
> +	if (!IS_ERR_OR_NULL(sg_table))
> +		mangle_sg_table(sg_table);
> +
> +	return sg_table;
> +}
> +
>   /**
>    * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
>    * @dmabuf:		[in]	buffer to attach device to.
> @@ -737,7 +765,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   				goto err_unlock;
>   		}
>   
> -		sgt = dmabuf->ops->map_dma_buf(attach, DMA_BIDIRECTIONAL);
> +		sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
>   		if (!sgt)
>   			sgt = ERR_PTR(-ENOMEM);
>   		if (IS_ERR(sgt)) {
> @@ -784,6 +812,16 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
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
> @@ -802,7 +840,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   		if (dma_buf_is_dynamic(attach->dmabuf))
>   			dma_resv_lock(attach->dmabuf->resv, NULL);
>   
> -		dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->dir);
> +		__unmap_dma_buf(attach, attach->sgt, attach->dir);
>   
>   		if (dma_buf_is_dynamic(attach->dmabuf)) {
>   			dma_buf_unpin(attach);
> @@ -924,7 +962,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   		}
>   	}
>   
> -	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
> +	sg_table = __map_dma_buf(attach, direction);
>   	if (!sg_table)
>   		sg_table = ERR_PTR(-ENOMEM);
>   
> @@ -987,7 +1025,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
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

