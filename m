Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8557B45DC80
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 15:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348433AbhKYOn7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 09:43:59 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:39116 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1345359AbhKYOl6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 09:41:58 -0500
X-UUID: ed2e66f832074a38b1cb8cb7595e47c5-20211125
X-UUID: ed2e66f832074a38b1cb8cb7595e47c5-20211125
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <kuan-ying.lee@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 968845543; Thu, 25 Nov 2021 22:38:46 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 25 Nov 2021 22:38:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Nov 2021 22:38:44 +0800
Message-ID: <aea1ed6da66c9ec8eaf8323f5b856feafc6de702.camel@mediatek.com>
Subject: Re: [PATCH v2] dma_heap: use for_each_sgtable_sg in sg_table
 release flow
From:   Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To:     "guangming.cao@mediatek.com" <guangming.cao@mediatek.com>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>
CC:     "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
        "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "john.stultz@linaro.org" <john.stultz@linaro.org>,
        "labbott@redhat.com" <labbott@redhat.com>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "lmark@codeaurora.org" <lmark@codeaurora.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        wsd_upstream <wsd_upstream@mediatek.com>,
        <kuan-ying.lee@mediatek.com>
Date:   Thu, 25 Nov 2021 22:38:45 +0800
In-Reply-To: <20211125134951.62002-1-guangming.cao@mediatek.com>
References: <85eb9053-0ce4-2514-06dc-58b8910dc5f7@arm.com>
         <20211125134951.62002-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2021-11-25 at 21:49 +0800, guangming.cao@mediatek.com wrote:
> From: Guangming <Guangming.Cao@mediatek.com>
> 
> Use (for_each_sgtable_sg) rather than (for_each_sg) to traverse
> sg_table to free sg_table.
> Use (for_each_sg) maybe will casuse some pages can't be freed
> when send wrong nents number.

s/casuse/cause

> 
> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-
> buf/heaps/system_heap.c
> index 23a7e74ef966..8660508f3684 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -289,7 +289,7 @@ static void system_heap_dma_buf_release(struct
> dma_buf *dmabuf)
>  	int i;
>  
>  	table = &buffer->sg_table;
> -	for_each_sg(table->sgl, sg, table->nents, i) {
> +	for_each_sgtable_sg(table, sg, i) {
>  		struct page *page = sg_page(sg);
>  
>  		__free_pages(page, compound_order(page));


If this is a fix, I think we should add Fixes: xxxx ("...") in the
commit message and Cc stable.

Thanks,
Kuan-Ying Lee


