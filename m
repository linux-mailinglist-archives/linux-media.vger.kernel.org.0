Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6086100312
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 11:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbfKRK6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 05:58:55 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48488 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbfKRK6z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 05:58:55 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191118105852euoutp0256ffb5437054c1468ee0c27f7f8831a3~YPKEuAuOO2987829878euoutp02W
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2019 10:58:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191118105852euoutp0256ffb5437054c1468ee0c27f7f8831a3~YPKEuAuOO2987829878euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1574074732;
        bh=NZqfmyfP25JsH8BQrWpc9JilNbl+Bcjb8JxncGubu+E=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=OgzMAmUSWsFXj8apcelrs1fh9jAD1ypmQxbo7iObNJdrl/z9hh0QzpsY1hV8tYaFP
         dRl7v/Qb4OU8AQfWptlRqYYCqdtKTtD4hbaNEbM4wYaT2trp57PRhaxManxnDr7baV
         SpgS8exCq9ZWEwil6oTNk7kYp+BPqMyNluRJPOv8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191118105852eucas1p10b665400f76ed2027dc2d9799924819b~YPKEh40ys2789327893eucas1p1H;
        Mon, 18 Nov 2019 10:58:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 49.4D.04469.C6972DD5; Mon, 18
        Nov 2019 10:58:52 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191118105852eucas1p25e6e4b06ad12cb199c78986d0345069f~YPKEFExh_0959909599eucas1p2q;
        Mon, 18 Nov 2019 10:58:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191118105852eusmtrp1ff37fbd245366a4bae4ff33e48637079~YPKEEbGWM0970009700eusmtrp1i;
        Mon, 18 Nov 2019 10:58:52 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-98-5dd2796c94fb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 6F.FA.04117.B6972DD5; Mon, 18
        Nov 2019 10:58:51 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191118105851eusmtip2b91825cba6c1df3773282d0b80348218~YPKDmJ3N81761717617eusmtip24;
        Mon, 18 Nov 2019 10:58:51 +0000 (GMT)
Subject: Re: [PATCH 11/15] media/videobuf2: Drop dma_buf->k(un)map support
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Pawel Osciak <pawel@osciak.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <92138822-1b8c-dcbe-a25f-6f3567b14437@samsung.com>
Date:   Mon, 18 Nov 2019 11:58:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191118103536.17675-12-daniel.vetter@ffwll.ch>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7djPc7o5lZdiDTpPylosfHiX2WL5mXXM
        Fle+vmezmD1hM5PF2aY37BY9G7ayWkx5+5Pd4nPrPzYHDo/ZDRdZPPZ+W8DisXjPSyaP+93H
        mTwe/3rJ5tG3ZRWjx+dNcgHsUVw2Kak5mWWpRfp2CVwZ9/99Zi6YpFhxt38DSwPjO+kuRg4O
        CQETidtnLbsYuTiEBFYwSvxsm8EK4XxhlHj2exs7hPOZUeJR/xpmmI6+aQEQ8eWMElPfPGGB
        cN4ySrTu+QRUxMkhLOAl8WHLMXYQW0QgXuLwjNVgNrPAL0aJN/erQGw2AUOJrrddbCA2r4Cd
        xM3/F9lBFrAIqEpcWewIYooKxEp0LM+AqBCUODkTZBUnB6eArcSuj3/YICbKS2x/O4cZwhaX
        uPVkPhPIORIC59gl5h7cCFYkIeAi8e/IN0YIW1ji1fEt7BC2jMTpyT0sEA3NjBIPz61lh3B6
        GCUuN82A6rCWOHz8IivIRcwCmhLrd+lDhB0l2j7OYoIECp/EjbeCEEfwSUzaNh0aVrwSHW1C
        ENVqErOOr4Nbe/DCJeYJjEqzkLw2C8k7s5C8Mwth7wJGllWM4qmlxbnpqcWGeanlesWJucWl
        eel6yfm5mxiByen0v+OfdjB+vZR0iFGAg1GJh/dB+cVYIdbEsuLK3EOMEhzMSiK8fo8uxArx
        piRWVqUW5ccXleakFh9ilOZgURLnrWZ4EC0kkJ5YkpqdmlqQWgSTZeLglGpgNDsudmzvdU6J
        N9m8XgvYjlgnPisvWDjjN8sxoUevfOwCGft7vq8/krqp3Ovyg/jwWZUqZ4rjzrg0+E9fNbfr
        evQ+z2s5adNqPKe39yplTlhxsSgxSfquR9qdHGWz3zEOqcoqRlGGPAyZ3dWXDmV8ld3/2ZP3
        MpPphM4DSx54bzn/IyrzV5KcEktxRqKhFnNRcSIAXEgjhkoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xe7rZlZdiDU68sLFY+PAus8XyM+uY
        La58fc9mMXvCZiaLs01v2C16NmxltZjy9ie7xefWf2wOHB6zGy6yeOz9toDFY/Gel0we97uP
        M3k8/vWSzaNvyypGj8+b5ALYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV
        9O1sUlJzMstSi/TtEvQy7v/7zFwwSbHibv8GlgbGd9JdjBwcEgImEn3TAroYOTmEBJYySryZ
        XQpiSwjISJyc1sAKYQtL/LnWxdbFyAVU85pR4uaFy0wgCWEBL4kPW46xg9giAvESnSdOM4IU
        MQv8YpT4cvEDE0THIUaJxqlPwDrYBAwlut6CjOLk4BWwk7j5/yI7yBUsAqoSVxY7goRFBWIl
        vq/8xAhRIihxcuYTFhCbU8BWYtfHP2CtzAJmEvM2P2SGsOUltr+dA2WLS9x6Mp9pAqPQLCTt
        s5C0zELSMgtJywJGllWMIqmlxbnpucVGesWJucWleel6yfm5mxiBEbnt2M8tOxi73gUfYhTg
        YFTi4bWouhgrxJpYVlyZC/QfB7OSCK/fowuxQrwpiZVVqUX58UWlOanFhxhNgX6byCwlmpwP
        TBZ5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYDx29JzKFWyiz
        R23O9R51plWPGpwOqm39WNJ/K0XvYd2COUzrwi3F2wx9krm/LuGX5l8uPYG53If38XfV5Va6
        viIpWdpnzp5v0bdqlblh4buF6VyI0OX0BWcnulrorng0/4z7J7a9x9Q/yzUIJEzSvl8XlRdz
        y7bZ6cKG58q/Xr6Tu3pf9sxfJZbijERDLeai4kQAcX1Fzd4CAAA=
X-CMS-MailID: 20191118105852eucas1p25e6e4b06ad12cb199c78986d0345069f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191118103637eucas1p2d585172b0e802c12a2deb53163e9115a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191118103637eucas1p2d585172b0e802c12a2deb53163e9115a
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
        <CGME20191118103637eucas1p2d585172b0e802c12a2deb53163e9115a@eucas1p2.samsung.com>
        <20191118103536.17675-12-daniel.vetter@ffwll.ch>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 18.11.2019 11:35, Daniel Vetter wrote:
> No in-tree users left.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Pawel Osciak <pawel@osciak.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Cc: linux-media@vger.kernel.org

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

> --
> Ack for merging this through drm trees very much appreciated.
> -Daniel
> ---
>   drivers/media/common/videobuf2/videobuf2-dma-contig.c | 8 --------
>   drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 8 --------
>   drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 8 --------
>   3 files changed, 24 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 44cd0e530bbd..d0c9dffe49e5 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -335,13 +335,6 @@ static void vb2_dc_dmabuf_ops_release(struct dma_buf *dbuf)
>   	vb2_dc_put(dbuf->priv);
>   }
>   
> -static void *vb2_dc_dmabuf_ops_kmap(struct dma_buf *dbuf, unsigned long pgnum)
> -{
> -	struct vb2_dc_buf *buf = dbuf->priv;
> -
> -	return buf->vaddr ? buf->vaddr + pgnum * PAGE_SIZE : NULL;
> -}
> -
>   static void *vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf)
>   {
>   	struct vb2_dc_buf *buf = dbuf->priv;
> @@ -360,7 +353,6 @@ static const struct dma_buf_ops vb2_dc_dmabuf_ops = {
>   	.detach = vb2_dc_dmabuf_ops_detach,
>   	.map_dma_buf = vb2_dc_dmabuf_ops_map,
>   	.unmap_dma_buf = vb2_dc_dmabuf_ops_unmap,
> -	.map = vb2_dc_dmabuf_ops_kmap,
>   	.vmap = vb2_dc_dmabuf_ops_vmap,
>   	.mmap = vb2_dc_dmabuf_ops_mmap,
>   	.release = vb2_dc_dmabuf_ops_release,
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index ed706b2a263c..6db60e9d5183 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -470,13 +470,6 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
>   	vb2_dma_sg_put(dbuf->priv);
>   }
>   
> -static void *vb2_dma_sg_dmabuf_ops_kmap(struct dma_buf *dbuf, unsigned long pgnum)
> -{
> -	struct vb2_dma_sg_buf *buf = dbuf->priv;
> -
> -	return buf->vaddr ? buf->vaddr + pgnum * PAGE_SIZE : NULL;
> -}
> -
>   static void *vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf)
>   {
>   	struct vb2_dma_sg_buf *buf = dbuf->priv;
> @@ -495,7 +488,6 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
>   	.detach = vb2_dma_sg_dmabuf_ops_detach,
>   	.map_dma_buf = vb2_dma_sg_dmabuf_ops_map,
>   	.unmap_dma_buf = vb2_dma_sg_dmabuf_ops_unmap,
> -	.map = vb2_dma_sg_dmabuf_ops_kmap,
>   	.vmap = vb2_dma_sg_dmabuf_ops_vmap,
>   	.mmap = vb2_dma_sg_dmabuf_ops_mmap,
>   	.release = vb2_dma_sg_dmabuf_ops_release,
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index 04d51ca63223..4d5af352e249 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -319,13 +319,6 @@ static void vb2_vmalloc_dmabuf_ops_release(struct dma_buf *dbuf)
>   	vb2_vmalloc_put(dbuf->priv);
>   }
>   
> -static void *vb2_vmalloc_dmabuf_ops_kmap(struct dma_buf *dbuf, unsigned long pgnum)
> -{
> -	struct vb2_vmalloc_buf *buf = dbuf->priv;
> -
> -	return buf->vaddr + pgnum * PAGE_SIZE;
> -}
> -
>   static void *vb2_vmalloc_dmabuf_ops_vmap(struct dma_buf *dbuf)
>   {
>   	struct vb2_vmalloc_buf *buf = dbuf->priv;
> @@ -344,7 +337,6 @@ static const struct dma_buf_ops vb2_vmalloc_dmabuf_ops = {
>   	.detach = vb2_vmalloc_dmabuf_ops_detach,
>   	.map_dma_buf = vb2_vmalloc_dmabuf_ops_map,
>   	.unmap_dma_buf = vb2_vmalloc_dmabuf_ops_unmap,
> -	.map = vb2_vmalloc_dmabuf_ops_kmap,
>   	.vmap = vb2_vmalloc_dmabuf_ops_vmap,
>   	.mmap = vb2_vmalloc_dmabuf_ops_mmap,
>   	.release = vb2_vmalloc_dmabuf_ops_release,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

