Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80697287396
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 13:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbgJHLvf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 07:51:35 -0400
Received: from mail-eopbgr60075.outbound.protection.outlook.com ([40.107.6.75]:25063
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725802AbgJHLve (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Oct 2020 07:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUnMQeVBHNNwwOFK96sCZrwik5wfrA06k2VPZWESuSo=;
 b=ZGHPhlKTxZpc9HbBiuQ7+XgB3i2cF6bZGDOXtsROvkH/se8mn72lZ7kN1pMtKgniHxZCJUJl8IXqqmYiqyvZlFjYHEY2WJFqv0f3D41f6uXohpaU+nvdnQ+EE8Kb42VDNyOqAj1cgozuQ6AB2TKRfKnUUYPIRL0b2UCjdPNy9eE=
Received: from AM5PR0201CA0012.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::22) by VI1PR08MB2878.eurprd08.prod.outlook.com
 (2603:10a6:802:19::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Thu, 8 Oct
 2020 11:51:14 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::10) by AM5PR0201CA0012.outlook.office365.com
 (2603:10a6:203:3d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Thu, 8 Oct 2020 11:51:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Thu, 8 Oct 2020 11:51:14 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Thu, 08 Oct 2020 11:51:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b7d36334b07587d
X-CR-MTA-TID: 64aa7808
Received: from d10d8e74682b.2
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8F9993AB-C26A-4133-A878-2B9017FCF1DB.1;
        Thu, 08 Oct 2020 11:51:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d10d8e74682b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 08 Oct 2020 11:51:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfCdPeukGxZP49F/YoLemIF3xNLTWIdhyNNeaRrSctxg11+vAn0MvMPxfG+lLnUG6vxew2myHmKSxhPHjEPBXrFsTXF8oDxZorXF90p3WuZ68KQZd/pMid51hfPndxXiG220YK5bMQIsz8AeaMQMgELSQUOHO8L5bL3ZBDv5sLcficJw+kbYYUu571yatwbzQyRzWiI1ZK+8Fm1p0LGXT5XEA0+9VIYWbmmYP45Qxk6+74eILTzn6OX95eIntXQDvTwKj/XTXWRuOfV8+za398tpkiok8wGN5H+mbRzMf67ZbV1BTi9oTJ4yy/LBQmxgWmPY/9WWO0QyKR1ljFWacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUnMQeVBHNNwwOFK96sCZrwik5wfrA06k2VPZWESuSo=;
 b=JmZjSAnKrvOJYAujPbjA/YUrsKsJpwsQWher64ODVeLHOtjonteAR4nxIXtC9JT8Td5uVFBwHpA5zjsEA1FAbhqKZqcv2/maDkCoKWKd8250YSuTLAEWSYKKMkNesmBtHK4aRNvmP7IVbAN2H+jiE/ap/A6BIo1VIx+kfe7by5dQL7fYfM7U4Rqra3cbnLFnYNA29XGUpRWP1q6ePQtltMQA2pXRrQkXWbpEDB7bQTqqKPo32O60RfRLZVMAhjFr7jhE+e2gA792kv1wxM//PLI8sQCNGEzJUyvW09s6ople9tCl4sJaiNVwBCrDgC4LZ0VpEbC3moqpH0quxOO4cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUnMQeVBHNNwwOFK96sCZrwik5wfrA06k2VPZWESuSo=;
 b=ZGHPhlKTxZpc9HbBiuQ7+XgB3i2cF6bZGDOXtsROvkH/se8mn72lZ7kN1pMtKgniHxZCJUJl8IXqqmYiqyvZlFjYHEY2WJFqv0f3D41f6uXohpaU+nvdnQ+EE8Kb42VDNyOqAj1cgozuQ6AB2TKRfKnUUYPIRL0b2UCjdPNy9eE=
Authentication-Results-Original: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR0801MB1849.eurprd08.prod.outlook.com (2603:10a6:3:89::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.21; Thu, 8 Oct 2020 11:51:04 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::5034:ca82:7e1:7e6f]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::5034:ca82:7e1:7e6f%7]) with mapi id 15.20.3433.044; Thu, 8 Oct 2020
 11:51:04 +0000
Date:   Thu, 8 Oct 2020 12:51:01 +0100
From:   Brian Starkey <brian.starkey@arm.com>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?utf-8?B?w5hyamFu?= Eide <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, nd@arm.com
Subject: Re: [PATCH v3 7/7] dma-buf: system_heap: Add a system-uncached heap
 re-using the system heap
Message-ID: <20201008115101.4qi6wh3hhkb6krg5@DESKTOP-E1NTVVP.localdomain>
References: <20201003040257.62768-1-john.stultz@linaro.org>
 <20201003040257.62768-8-john.stultz@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201003040257.62768-8-john.stultz@linaro.org>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0343.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::19) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by LO2P265CA0343.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:d::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend Transport; Thu, 8 Oct 2020 11:51:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7cb258fd-ed85-4656-8442-08d86b8075a6
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1849:|VI1PR08MB2878:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB2878822A5A3CFECC0B2C1820F00B0@VI1PR08MB2878.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WpDxVnf4wLbQ+fmFomyUA4LCOm72Hn928UwM3Sy28kiA+XwSTYPDISRub9fa0fGxVhqaKWea/h0vMIJNzQAGVvUZcJdpTUbeTM+lydAJacDWUP2yYnixVa7JiAsG0HHR+EmGZSWwY664yfB3zJNmEQqoPyvahAtFT04Ho7x2GShAdUqf6eZzf4m6IjClLK82wRju4v9+H/5Ouj4/2B6fCgEDvoNqeUTAe8LbCqsIEWcAdOMt4lekUp1am1n+xrLZKVTAmC91Gz/mTZQIQIfcFHHiRqNNArYPnTQSTmWMsgB2t2K4+/Xp4F2yPU5hrBvHEa6vmHnV2WKt69+2lTt8oGqdOiBr+217Z3HT5QdskKNK70/+X9aLHUEmYDHEV+ghwk608RMkuDGjmT/+RsptVA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR08MB2890.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(478600001)(44832011)(1076003)(2906002)(5660300002)(30864003)(86362001)(6916009)(7416002)(66946007)(8676002)(8936002)(54906003)(316002)(83080400001)(9686003)(6506007)(52116002)(7696005)(26005)(186003)(16526019)(4326008)(83380400001)(956004)(966005)(66476007)(55016002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ZFskJ9WJQw6w357cuFBVvgxQsQIpX6Chk4ai4wOucsyK8ER66zuaNKkGlKqWAiGGYJZHpmjtgfpxI7OuCpazHo1WkmDTLIHPm7ngIjmIxFBI/o6773UtR2uwqdV37b421m4UqmAYwd886x9uyHhIOAYICsM5L4SkZ20v+jjTNNpFdqvK98XrjRuULNvc2xrpl+9gILnQeH6//Nyq4+VXbEyI79QSmf7T9nTu0LzTBmC8T7hwlNH2UtGjMnLAF2JNv5VSzb+fBIfnJdj704dKA5vURhE9rJxqTa8he64hijI6PJkMPf071eUZ6GBs3BlqaPkWeS+PwxgweP7Oujq5V3gpHsQYHFGmljVq3MIEREZzw8cHd04OPX8H9p2X0qpNdGce8qeyCmXlJav7lgL51Zh2Xz/osdmP8kq3dcHioeQaPoLzIaRHc+nHINQuX1fwDWoNcwCyWR7ubNyWHjJZ5u4a9OLFzBPinJIOVSc4yP8br1h9srNUqTyZSaZU1WcxKJkTtDDJ403uMX/80BdjZruJJpwi/JcC55CKiUiixr4R8NXOHzeeXB0odxP/SejSXdkn55AB6glTd93ZnMRI+cdwxlawCQUrpQlnpvqZGSkzuWjb9r5TMzPNqSX5YZRc/HVZLcHPAoNG076xSUzGFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1849
Original-Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 54f05849-4a35-4dd5-fa18-08d86b806f5d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sL8ofjSRUvHCQlzipx8Ah9hZ7iCf2qF3x21fMsPb0cbQ0qKJI5pPC3ZqrN5l1uZXBCbbkFWKw49s/QN5xD0yG6z54Pmhxp2/PPQvHCAChU7ZmJUxgF2a3Xi4/U6mmYGp3U+Slc4x4viqvw+C5uRbGQTwHNZsQoPIdzg9v6j0q4p+0iQV36aQ/wfTlKlAACa+aOreKTksFE9SxAXUhV2e+AXlu4BzREevFtK35xGGx6iZc1QOP9HH/57QbbwnCJ1Kpr6Fyn+/qQ0MUR/8LMRT9lBcHRJomMmpGXu50Iv/umplw3r9lOhp0BdI4tnyhRdmGhQiynO0+wTYaPn/HJJzjCHQHS0D307UzyaikuYxUCacWm9pbuzNJKv9c1wh/L/PSllPrUQCzGVhp8cIul8Surl7Ya8Pd79B+rhsXPaJeIHYOD3sbLkcJ5NDq5Z+MvYYdnDRVfmMTyZSKRCumjDAeyMxQcNb+SOGsfQR5deJz1g=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(478600001)(83080400001)(316002)(7696005)(5660300002)(8936002)(81166007)(1076003)(186003)(30864003)(16526019)(336012)(356005)(6506007)(2906002)(956004)(44832011)(36906005)(47076004)(450100002)(4326008)(8676002)(26005)(70206006)(9686003)(70586007)(83380400001)(55016002)(86362001)(54906003)(82310400003)(6862004)(82740400003)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2020 11:51:14.5268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb258fd-ed85-4656-8442-08d86b8075a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2878
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 03, 2020 at 04:02:57AM +0000, John Stultz wrote:
> This adds a heap that allocates non-contiguous buffers that are
> marked as writecombined, so they are not cached by the CPU.
> 
> This is useful, as most graphics buffers are usually not touched
> by the CPU or only written into once by the CPU. So when mapping
> the buffer over and over between devices, we can skip the CPU
> syncing, which saves a lot of cache management overhead, greatly
> improving performance.
> 
> For folk using ION, there was a ION_FLAG_CACHED flag, which
> signaled if the returned buffer should be CPU cacheable or not.
> With DMA-BUF heaps, we do not yet have such a flag, and by default
> the current heaps (system and cma) produce CPU cachable buffers.
> So for folks transitioning from ION to DMA-BUF Heaps, this fills
> in some of that missing functionality.
> 
> There has been a suggestion to make this functionality a flag
> (DMAHEAP_FLAG_UNCACHED?) on the system heap, similar to how
> ION used the ION_FLAG_CACHED. But I want to make sure an
> _UNCACHED flag would truely be a generic attribute across all
> heaps. So far that has been unclear, so having it as a separate
> heap seemes better for now. (But I'm open to discussion on this
> point!)
> 
> This is a rework of earlier efforts to add a uncached system heap,
> done utilizing the exisitng system heap, adding just a bit of
> logic to handle the uncached case.
> 
> Feedback would be very welcome!
> 
> Many thanks to Liam Mark for his help to get this working.
> 
> Pending opensource users of this code include:
> * AOSP HiKey960 gralloc:
>   - https://android-review.googlesource.com/c/device/linaro/hikey/+/1399519
>   - Visibly improves performance over the system heap
> * AOSP Codec2 (possibly, needs more review):
>   - https://android-review.googlesource.com/c/platform/frameworks/av/+/1360640/17/media/codec2/vndk/C2DmaBufAllocator.cpp#325
> 
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Daniel Mentz <danielmentz@google.com>
> Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Cc: �rjan Eide <orjan.eide@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: James Jones <jajones@nvidia.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 87 ++++++++++++++++++++++++++---
>  1 file changed, 79 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 2b8d4b6abacb..952f1fd9dacf 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -22,6 +22,7 @@
>  #include <linux/vmalloc.h>
>  
>  struct dma_heap *sys_heap;
> +struct dma_heap *sys_uncached_heap;
>  
>  struct system_heap_buffer {
>  	struct dma_heap *heap;
> @@ -31,6 +32,8 @@ struct system_heap_buffer {
>  	struct sg_table sg_table;
>  	int vmap_cnt;
>  	void *vaddr;
> +
> +	bool uncached;
>  };
>  
>  struct dma_heap_attachment {
> @@ -38,6 +41,8 @@ struct dma_heap_attachment {
>  	struct sg_table *table;
>  	struct list_head list;
>  	bool mapped;
> +
> +	bool uncached;
>  };
>  
>  #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
> @@ -94,7 +99,7 @@ static int system_heap_attach(struct dma_buf *dmabuf,
>  	a->dev = attachment->dev;
>  	INIT_LIST_HEAD(&a->list);
>  	a->mapped = false;
> -
> +	a->uncached = buffer->uncached;
>  	attachment->priv = a;
>  
>  	mutex_lock(&buffer->lock);
> @@ -124,9 +129,13 @@ static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attac
>  {
>  	struct dma_heap_attachment *a = attachment->priv;
>  	struct sg_table *table = a->table;
> +	int attr = 0;
>  	int ret;
>  
> -	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
> +	if (a->uncached)
> +		attr = DMA_ATTR_SKIP_CPU_SYNC;
> +
> +	ret = dma_map_sgtable(attachment->dev, table, direction, attr);
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> @@ -139,9 +148,12 @@ static void system_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
>  				      enum dma_data_direction direction)
>  {
>  	struct dma_heap_attachment *a = attachment->priv;
> +	int attr = 0;
>  
> +	if (a->uncached)
> +		attr = DMA_ATTR_SKIP_CPU_SYNC;
>  	a->mapped = false;
> -	dma_unmap_sgtable(attachment->dev, table, direction, 0);
> +	dma_unmap_sgtable(attachment->dev, table, direction, attr);
>  }
>  
>  static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> @@ -150,6 +162,9 @@ static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>  	struct system_heap_buffer *buffer = dmabuf->priv;
>  	struct dma_heap_attachment *a;
>  
> +	if (buffer->uncached)
> +		return 0;
> +
>  	mutex_lock(&buffer->lock);
>  
>  	if (buffer->vmap_cnt)
> @@ -171,6 +186,9 @@ static int system_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
>  	struct system_heap_buffer *buffer = dmabuf->priv;
>  	struct dma_heap_attachment *a;
>  
> +	if (buffer->uncached)
> +		return 0;
> +
>  	mutex_lock(&buffer->lock);
>  
>  	if (buffer->vmap_cnt)
> @@ -194,6 +212,9 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
>  	struct sg_page_iter piter;
>  	int ret;
>  
> +	if (buffer->uncached)
> +		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> +
>  	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
>  		struct page *page = sg_page_iter_page(&piter);
>  
> @@ -215,8 +236,12 @@ static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
>  	struct page **pages = vmalloc(sizeof(struct page *) * npages);
>  	struct page **tmp = pages;
>  	struct sg_page_iter piter;
> +	pgprot_t pgprot = PAGE_KERNEL;
>  	void *vaddr;
>  
> +	if (buffer->uncached)
> +		pgprot = pgprot_writecombine(PAGE_KERNEL);

I think this should go after the 'if (!pages)' check. Best to get the
allocation failure check as close to the allocation as possible IMO.

> +
>  	if (!pages)
>  		return ERR_PTR(-ENOMEM);
>  
> @@ -225,7 +250,7 @@ static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
>  		*tmp++ = sg_page_iter_page(&piter);
>  	}
>  
> -	vaddr = vmap(pages, npages, VM_MAP, PAGE_KERNEL);
> +	vaddr = vmap(pages, npages, VM_MAP, pgprot);
>  	vfree(pages);
>  
>  	if (!vaddr)
> @@ -278,6 +303,10 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
>  	int i;
>  
>  	table = &buffer->sg_table;
> +	/* Unmap the uncached buffers from the heap device (pairs with the map on allocate) */
> +	if (buffer->uncached)
> +		dma_unmap_sgtable(dma_heap_get_dev(buffer->heap), table, DMA_BIDIRECTIONAL, 0);
> +
>  	for_each_sg(table->sgl, sg, table->nents, i) {
>  		struct page *page = sg_page(sg);
>  
> @@ -320,10 +349,11 @@ static struct page *alloc_largest_available(unsigned long size,
>  	return NULL;
>  }
>  
> -static int system_heap_allocate(struct dma_heap *heap,
> -				unsigned long len,
> -				unsigned long fd_flags,
> -				unsigned long heap_flags)
> +static int system_heap_do_allocate(struct dma_heap *heap,
> +				   unsigned long len,
> +				   unsigned long fd_flags,
> +				   unsigned long heap_flags,
> +				   bool uncached)
>  {
>  	struct system_heap_buffer *buffer;
>  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> @@ -344,6 +374,7 @@ static int system_heap_allocate(struct dma_heap *heap,
>  	mutex_init(&buffer->lock);
>  	buffer->heap = heap;
>  	buffer->len = len;
> +	buffer->uncached = uncached;
>  
>  	INIT_LIST_HEAD(&pages);
>  	i = 0;
> @@ -393,6 +424,16 @@ static int system_heap_allocate(struct dma_heap *heap,
>  		/* just return, as put will call release and that will free */
>  		return ret;
>  	}
> +
> +	/*
> +	 * For uncached buffers, we need to initially flush cpu cache, since
> +	 * the __GFP_ZERO on the allocation means the zeroing was done by the
> +	 * cpu and thus it is likely cached. Map (and implicitly flush) it out
> +	 * now so we don't get corruption later on.
> +	 */
> +	if (buffer->uncached)
> +		dma_map_sgtable(dma_heap_get_dev(heap), table, DMA_BIDIRECTIONAL, 0);

Do we have to keep this mapping around for the entire lifetime of the
buffer?

Also, this problem (and solution) keeps lingering around. It really
feels like there should be a better way to solve "clean the linear
mapping all the way to DRAM", but I don't know what that should be.

> +
>  	return ret;
>  
>  free_pages:
> @@ -410,10 +451,30 @@ static int system_heap_allocate(struct dma_heap *heap,
>  	return ret;
>  }
>  
> +static int system_heap_allocate(struct dma_heap *heap,
> +				unsigned long len,
> +				unsigned long fd_flags,
> +				unsigned long heap_flags)
> +{
> +	return system_heap_do_allocate(heap, len, fd_flags, heap_flags, false);
> +}
> +
>  static const struct dma_heap_ops system_heap_ops = {
>  	.allocate = system_heap_allocate,
>  };
>  
> +static int system_uncached_heap_allocate(struct dma_heap *heap,
> +					 unsigned long len,
> +					 unsigned long fd_flags,
> +					 unsigned long heap_flags)
> +{
> +	return system_heap_do_allocate(heap, len, fd_flags, heap_flags, true);
> +}
> +
> +static const struct dma_heap_ops system_uncached_heap_ops = {
> +	.allocate = system_uncached_heap_allocate,
> +};
> +
>  static int system_heap_create(void)
>  {
>  	struct dma_heap_export_info exp_info;
> @@ -426,6 +487,16 @@ static int system_heap_create(void)
>  	if (IS_ERR(sys_heap))
>  		return PTR_ERR(sys_heap);
>  
> +	exp_info.name = "system-uncached";
> +	exp_info.ops = &system_uncached_heap_ops;
> +	exp_info.priv = NULL;
> +
> +	sys_uncached_heap = dma_heap_add(&exp_info);
> +	if (IS_ERR(sys_uncached_heap))
> +		return PTR_ERR(sys_heap);
> +

In principle, there's a race here between the heap getting registered
to sysfs and the dma_mask getting updated.

I don't think it would cause a problem in practice, but with the API
as it is, there's no way to avoid it - so I wonder if the
dma_heap_get_dev() accessor isn't the right API design.

Cheers,
-Brian

> +	dma_coerce_mask_and_coherent(dma_heap_get_dev(sys_uncached_heap), DMA_BIT_MASK(64));
> +
>  	return 0;
>  }
>  module_init(system_heap_create);
> -- 
> 2.17.1
> 
