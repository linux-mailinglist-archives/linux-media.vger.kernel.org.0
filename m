Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23E433CB6D
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 14:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389085AbfFKM1M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 08:27:12 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59113 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387563AbfFKM1M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 08:27:12 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190611122710euoutp0211d8760587e23576796d79edb636d73d~nJJe8ZsNG1060310603euoutp02J
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 12:27:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190611122710euoutp0211d8760587e23576796d79edb636d73d~nJJe8ZsNG1060310603euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1560256030;
        bh=WSFfx7GN3YUfh2U+Ekpv/r1PvcfiQ5E0lbbBRtIqemc=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=aI8PF7nD+a/xewZn5WEBQBhi8bRWCoRBoqEVXR1f2mQF1lVWdSiWEr7CzyxX8Vt8E
         ZA0W5t4wEpB9WB5FToFq6HFxBtMGAfkw5r/Nt1GArsHR1zqq5Zd9/Nb9M+jmbMLlzh
         NZ4jgXwfyw+vajWlGimOVQlyOvCVZuNzdxgNKUD8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190611122709eucas1p2de92f0aee9a7c6999a706ed6d9c31def~nJJePKMxT0601606016eucas1p2S;
        Tue, 11 Jun 2019 12:27:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 9A.15.04377.C1E9FFC5; Tue, 11
        Jun 2019 13:27:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190611122708eucas1p2094287e24e71b25f367b47d540352c7c~nJJdXlcn43235532355eucas1p2v;
        Tue, 11 Jun 2019 12:27:08 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190611122708eusmtrp1251fbb4732d83be406442cfe6f804e57~nJJdIAj0B1051710517eusmtrp1D;
        Tue, 11 Jun 2019 12:27:08 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-eb-5cff9e1c881e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 1D.7B.04146.B1E9FFC5; Tue, 11
        Jun 2019 13:27:08 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190611122707eusmtip29496cd5f6afafdee88a125f67cbf3a63~nJJcxtwMb2472924729eusmtip20;
        Tue, 11 Jun 2019 12:27:07 +0000 (GMT)
Subject: Re: [PATCH v2 1/5] media: vb2: Introduce a vb2_get_buffer accessor
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Pawel Osciak <pawel@osciak.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <d6bf3a55-9bd2-5baf-52a3-a3bb870b1781@samsung.com>
Date:   Tue, 11 Jun 2019 14:27:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610205526.2629-2-ezequiel@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsWy7djPc7oy8/7HGBxdYmlx+swpJoudG76w
        Wyz5uYvJYvO5HlaLs01v2C16NmxltZjy9ie7A7vHlN8bWT123F3C6PH410s2j74tqxg9Pm+S
        C2CN4rJJSc3JLEst0rdL4MqYsX8bc8EK3oo/J44yNzBe4epi5OSQEDCR2L90PlMXIxeHkMAK
        RonLj9ZDOV8YJf6ev8sI4XxmlJh/8DsbTMvtQw/YIBLLGSV2vnnHDOG8ZZTov/KBGaRKWMBb
        4tOhA4wgtohAkcTb5evYQYqYBaYDdcydxQ6SYBMwlOh62wU2llfATmLCxrdgNouAqsSFl29Y
        QWxRgRiJr/uvMkPUCEqcnPmEBcTmFLCWmND/GCzOLCAvsf3tHChbXOLWE5CPQE7dxC4xc7kG
        hO0i8XjRPBYIW1ji1fEt7BC2jMTpyT0sIMdJCDQzSjw8t5YdwukBBkfTDEaIKmuJw8cvAl3E
        AbRBU2L9Ln2IsKNE49qPbCBhCQE+iRtvBSFu4JOYtG06M0SYV6KjTQiiWk1i1vF1cGsPXrjE
        PIFRaRaSz2Yh+WYWkm9mIexdwMiyilE8tbQ4Nz212CgvtVyvODG3uDQvXS85P3cTIzANnf53
        /MsOxl1/kg4xCnAwKvHwHpj+P0aINbGsuDL3EKMEB7OSCG/X938xQrwpiZVVqUX58UWlOanF
        hxilOViUxHmrGR5ECwmkJ5akZqemFqQWwWSZODilGhgD/Ja2au+byj+72tz8y7mFWgnPWv7c
        9Nrnk6P2/P70m2ePaO5Xm6C0yf7zl3ePfCbvS75QtdTAfJPZl/T1L9kvV5ypZCm71WwjpjPx
        ZdFdltVdmW2W6ttPfeb8v9FK+cCnDIm2VzXqIud6F+3MeNm55pyk66WDGiFnZn4LcLK+xrHX
        ysYq4W+nEktxRqKhFnNRcSIA0lbaST8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsVy+t/xe7oy8/7HGOy5y2Rx+swpJoudG76w
        Wyz5uYvJYvO5HlaLs01v2C16NmxltZjy9ie7A7vHlN8bWT123F3C6PH410s2j74tqxg9Pm+S
        C2CN0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MuY
        sX8bc8EK3oo/J44yNzBe4epi5OSQEDCRuH3oAVsXIxeHkMBSRombE+czQiRkJE5Oa2CFsIUl
        /lzrgip6zSjx4nIrWJGwgLfEp0MHwGwRgSKJe5/usoMUMQtMZ5R4MGctK0THfkaJieufsoFU
        sQkYSnS97QKzeQXsJCZsfAtmswioSlx4+QZsnahAjERf4woWiBpBiZMzn4DZnALWEhP6HzOD
        2MwCZhLzNj+EsuUltr+dA2WLS9x6Mp9pAqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucWG
        esWJucWleel6yfm5mxiBkbft2M/NOxgvbQw+xCjAwajEw3tg+v8YIdbEsuLK3EOMEhzMSiK8
        Xd//xQjxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjAp5JXEG5oamltYGpobmxubWSiJ83YI
        HIwREkhPLEnNTk0tSC2C6WPi4JRqYNTq7N16jeNI6plv98tPF8976irH3nDhqD7rb1bZhUcb
        +BlnbnlS/9T4PMdEkbJ9oYblsy4wy2Xm3Al/2jHT+IpM0uqpk83r7j+YvrDe8nxU76cm80NX
        nhx8X6h9WcEspOP+mZz21ubM4wZPBE65vZQw5o8Jb/vL9eRLtcT+X+0zLMT6FxvUJyixFGck
        GmoxFxUnAgAf9U2K0gIAAA==
X-CMS-MailID: 20190611122708eucas1p2094287e24e71b25f367b47d540352c7c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190610205545epcas1p26cb4185406dedd3372fd0518b61f6c32
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190610205545epcas1p26cb4185406dedd3372fd0518b61f6c32
References: <20190610205526.2629-1-ezequiel@collabora.com>
        <CGME20190610205545epcas1p26cb4185406dedd3372fd0518b61f6c32@epcas1p2.samsung.com>
        <20190610205526.2629-2-ezequiel@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2019-06-10 22:55, Ezequiel Garcia wrote:
> Some drivers need to access a vb2 buffer from its
> queue index. Introduce an accessor to abstract this,
> and avoid drivers from accessing private members.
>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> Changes from v1:
> * Drop redundant num_buffers > 0 check.
> ---
>   include/media/videobuf2-core.h | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index c03ef7cc5071..640aabe69450 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -1163,6 +1163,24 @@ static inline void vb2_clear_last_buffer_dequeued(struct vb2_queue *q)
>   	q->last_buffer_dequeued = false;
>   }
>   
> +/**
> + * vb2_get_buffer() - get a buffer from a queue
> + * @q:		pointer to &struct vb2_queue with videobuf2 queue.
> + * @index:	buffer index
> + *
> + * This function obtains a buffer from a queue, by its index.
> + * Keep in mind that there is no refcounting involved in this
> + * operation, so the buffer lifetime should be taken into
> + * consideration.
> + */
> +static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
> +						unsigned int index)
> +{
> +	if (index < q->num_buffers)
> +		return q->bufs[index];
> +	return NULL;
> +}
> +
>   /*
>    * The following functions are not part of the vb2 core API, but are useful
>    * functions for videobuf2-*.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

