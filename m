Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED77C6A512
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 11:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731855AbfGPJkw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 05:40:52 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47479 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbfGPJkw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 05:40:52 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190716094050euoutp029c05fac3cde23aad218ac1e9bc7f41e9~x2dQJquuO1131511315euoutp02E
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 09:40:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190716094050euoutp029c05fac3cde23aad218ac1e9bc7f41e9~x2dQJquuO1131511315euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1563270050;
        bh=4P3Jw10vI45G8o8zvxexxy/Knp2v/fQqjY5A5U703Ss=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=n7f8nsJo7Bs9ZZwDPk55BPAMuEBuaXeeb5/3JPwgryWXT+3SaQI02cDU6HyJuQ2I3
         jhU2LIkknUVwVbaRQDi7snRq57mfPIp2DFAZ3gCmcrUrtrdBKwZDI+mP2EPWVGB2iN
         oCzfruPQayqTyyAXh8uey/VXSFxjEro3Coix5PZg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190716094049eucas1p23e2386f06c86feedf67c2e32f338d2c2~x2dPbjFyG0174101741eucas1p2L;
        Tue, 16 Jul 2019 09:40:49 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id B2.D9.04298.1AB9D2D5; Tue, 16
        Jul 2019 10:40:49 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190716094048eucas1p1872f951113978b9d605981ba26d19a5e~x2dOsxOIO0071000710eucas1p1D;
        Tue, 16 Jul 2019 09:40:48 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190716094048eusmtrp2b32ff2c7919da2fe6d3578e34453823a~x2dOeuWeh3128431284eusmtrp2d;
        Tue, 16 Jul 2019 09:40:48 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-72-5d2d9ba14f48
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id CB.F6.04140.0AB9D2D5; Tue, 16
        Jul 2019 10:40:48 +0100 (BST)
Received: from [106.120.50.63] (unknown [106.120.50.63]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190716094048eusmtip1c9fb8160d2493e4f45ed72d8fde2417e~x2dOBUJ250488404884eusmtip1S;
        Tue, 16 Jul 2019 09:40:48 +0000 (GMT)
Subject: Re: [PATCH v2] media: vb2-dc: skip CPU sync in map/unmap dma_buf
To:     Lucas Stach <l.stach@pengutronix.de>,
        Pawel Osciak <pawel@osciak.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <b3d6ed68-45b6-de91-3aa2-b4eedfbbf3ca@samsung.com>
Date:   Tue, 16 Jul 2019 11:40:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190708130742.11151-1-l.stach@pengutronix.de>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMKsWRmVeSWpSXmKPExsWy7djPc7oLZ+vGGjzrELU4NfkZk8WqqTtZ
        LM42vWG3eDD3JpNFz4atrBbLNv1hsjh28C+TxZS3P9kdODw2repk83j86yWbR/9fA4++LasY
        PT5vkvM49fUzewBbFJdNSmpOZllqkb5dAlfGwQMdjAWrxCvuTZ3M1MD4WaiLkZNDQsBE4uKV
        v2wgtpDACkaJj61OXYxcQPYXRomd7w8xQTifGSUuzPvGBtMx9c82FojEckaJp3POs0M4bxkl
        5i8AaeHkEBbwlHjyeRpYQkRgJqPE8SsfWUEcZoEmoFlT/rKAVLEJGEp0ve0CmsvBwStgJ7H9
        TSGIySKgKvFrmRhIhahAjMTONz3MIDavgKDEyZlPwDo5BWwkPr6YwQpiMwvIS2x/O4cZwhaX
        uPVkPtjZEgKH2CUe7zzLDHG2i8T1xqWMELawxKvjW9ghbBmJ/zthGpoZJR6eW8sO4fQwSlxu
        mgHVYS1x+PhFVpDrmAU0Jdbv0gcxJQQcJRb0akKYfBI33gpC3MAnMWnbdGaIMK9ERxs0qNUk
        Zh1fB7f14IVLzBMYlWYh+WwWkm9mIflmFsLaBYwsqxjFU0uLc9NTiw3zUsv1ihNzi0vz0vWS
        83M3MQKT0ul/xz/tYPx6KekQowAHoxIP74k9OrFCrIllxZW5hxglOJiVRHhtv2rHCvGmJFZW
        pRblxxeV5qQWH2KU5mBREuetZngQLSSQnliSmp2aWpBaBJNl4uCUamAM09ln+INPIej5Qd9b
        L7u3i5u/yvzfJXjE8IDcocX/quf59Vsf2rZZqPiyx5fGj8sup/VekF3u02LawsHpc1bn9OFN
        gY7K5svl3mdLmbPvlepmWLIosWTrkvK7d5yTXRsfXJ9heTnhhG7hHge27ELj//YLT93X8BLT
        2+tW0CRhsnXzaeFbBjFKLMUZiYZazEXFiQBP1ZFHRgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xu7oLZuvGGsx4ImdxavIzJotVU3ey
        WJxtesNu8WDuTSaLng1bWS2WbfrDZHHs4F8miylvf7I7cHhsWtXJ5vH410s2j/6/Bh59W1Yx
        enzeJOdx6utn9gC2KD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSc
        zLLUIn27BL2Mgwc6GAtWiVfcmzqZqYHxs1AXIyeHhICJxNQ/21i6GLk4hASWMkoc+v+aFSIh
        I3FyWgOULSzx51oXG0TRa0aJ888PMIEkhAU8JZ58nsYOkhARmMkoMePnLrBRzAJNjBLrXrWy
        QrT0M0rsXXqKBaSFTcBQoustyCwODl4BO4ntbwpBTBYBVYlfy8RAKkQFYiT2ndnODmLzCghK
        nJz5BKyTU8BG4uOLGWAXMQuYSczb/JAZwpaX2P52DpQtLnHryXymCYxCs5C0z0LSMgtJyywk
        LQsYWVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIERuK2Yz+37GDsehd8iFGAg1GJh/fEHp1Y
        IdbEsuLK3EOMEhzMSiK8tl+1Y4V4UxIrq1KL8uOLSnNSiw8xmgL9NpFZSjQ5H5gk8kriDU0N
        zS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MJ6d8fhX8ULdk+d5q0N3OHnL
        LKl+5vjRiWHKnDClo2rmNp3CWUp86z1PPd+yTsWqceKSe+YfJqvtr/tl8zladU+xeVVPSKQj
        4x7xF6+vLVx19Z31y61Hr9r0e9Rql2fs8Hvx+ssGRV43hlz2874npuodMmkT7NNscthquuLE
        Ag/3StOUo3FBc5VYijMSDbWYi4oTAZ1TabDaAgAA
X-CMS-MailID: 20190716094048eucas1p1872f951113978b9d605981ba26d19a5e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190708130749epcas1p352c01d83a61efe0fc2128aa442fa847e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190708130749epcas1p352c01d83a61efe0fc2128aa442fa847e
References: <CGME20190708130749epcas1p352c01d83a61efe0fc2128aa442fa847e@epcas1p3.samsung.com>
        <20190708130742.11151-1-l.stach@pengutronix.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lucas,

On 2019-07-08 15:07, Lucas Stach wrote:
> This is rougly equivalent to ca0e68e21aae (drm/prime: skip CPU sync
> in map/unmap dma_buf). The contig memory allocated is already device
> coherent memory, so there is no point in doing a CPU sync when
> mapping it to another deevice. Also most importers currently cache
> the mapping so the CPU sync would only happen on the first import,
> so we are better off with not pretending to do a cache synchronization
> at all.
>
> This gets rid of a lot of CPU overhead in uses where those dma-bufs
> are regularily imported and detached again, like Weston is currently
> doing in the DRM compositor.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2: Add comments why it is safe to skip the CPU sync.
> ---
>   .../common/videobuf2/videobuf2-dma-contig.c   | 23 +++++++++++++------
>   1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index ecbef266130b..1b8f86366290 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -267,8 +267,14 @@ static void vb2_dc_dmabuf_ops_detach(struct dma_buf *dbuf,
>   
>   	/* release the scatterlist cache */
>   	if (attach->dma_dir != DMA_NONE)
> -		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -			attach->dma_dir);
> +		/*
> +		 * Cache sync can be skipped here, as the vb2_dc memory is
> +		 * allocated from device coherent memory, which means the
> +		 * memory locations do not require any explicit cache
> +		 * maintenance prior or after being used by the device.
> +		 */
> +		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> +			attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>   	sg_free_table(sgt);
>   	kfree(attach);
>   	db_attach->priv = NULL;
> @@ -293,14 +299,17 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>   
>   	/* release any previous cache */
>   	if (attach->dma_dir != DMA_NONE) {
> -		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -			attach->dma_dir);
> +		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> +			attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>   		attach->dma_dir = DMA_NONE;
>   	}
>   
> -	/* mapping to the client with new direction */
> -	sgt->nents = dma_map_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -				dma_dir);
> +	/*
> +	 * mapping to the client with new direction, no cache sync
> +	 * required see comment in vb2_dc_dmabuf_ops_detach()
> +	 */
> +	sgt->nents = dma_map_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> +				dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>   	if (!sgt->nents) {
>   		pr_err("failed to map scatterlist\n");
>   		mutex_unlock(lock);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

