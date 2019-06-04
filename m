Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E102347C3
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 15:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727212AbfFDNNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 09:13:08 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44844 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbfFDNNI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 09:13:08 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190604131307euoutp013bb161621c53c3a4bb3d918b62f51769~lAQnAxTcM0089600896euoutp01s
        for <linux-media@vger.kernel.org>; Tue,  4 Jun 2019 13:13:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190604131307euoutp013bb161621c53c3a4bb3d918b62f51769~lAQnAxTcM0089600896euoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559653987;
        bh=lyseSmChPhhL2Cc2YdnxNWF9nw2n1LhhcsFzZ4EPZIs=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=B4KcWprAGjWvmoiogQ/66PY3uUY/BkLEFy6qY/FVkRjbxcKtdoqAqa61dNSFEprg4
         7CagmW1+j0xH+j74d5Xx0kUXSROY78mkBRqGnaMPmcKYGHMAFpQts4D2tbXRbXENEQ
         Y6spu2TZo4iqWC93wh+OgImMxUkUmTzD4ey6Glo4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190604131306eucas1p230996079b548f95f872607f1f4180ebf~lAQmWkmzq2329923299eucas1p2G;
        Tue,  4 Jun 2019 13:13:06 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id B6.1A.04325.26E66FC5; Tue,  4
        Jun 2019 14:13:06 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190604131305eucas1p160ce73971297305339b5c195c3dedffd~lAQlmI1aA0201902019eucas1p1_;
        Tue,  4 Jun 2019 13:13:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190604131305eusmtrp20e15eb5e55e8321e2dcb08b3575aa4d6~lAQlWaRva1748917489eusmtrp2S;
        Tue,  4 Jun 2019 13:13:05 +0000 (GMT)
X-AuditID: cbfec7f5-fbbf09c0000010e5-e4-5cf66e62f85b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 72.73.04140.16E66FC5; Tue,  4
        Jun 2019 14:13:05 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190604131305eusmtip195ecebe60a7b5e445bdab5c07502d95e~lAQk7CohB0184201842eusmtip1S;
        Tue,  4 Jun 2019 13:13:05 +0000 (GMT)
Subject: Re: [PATCH v6 2/2] media: v4l2: Get rid of
 ->vidioc_enum_fmt_vid_{cap,out}_mplane
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, kernel@collabora.com,
        Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <bdfca5c5-bf84-0622-95e9-7c93411b5b6e@samsung.com>
Date:   Tue, 4 Jun 2019 15:13:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190604070625.7664-2-boris.brezillon@collabora.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUhUYRTtm7fMc3DsOW4Xk4KXtJi5kOKjRSwUXvZHWiDMsqc+1NLRZtS0
        oGwTt0KlmBwNp5xM/ZONZS6oMGKDa0gkmpUVWiIpLqM4KZozz8h/55x7vnvugY/CFCbCnUpU
        pgkqJZ/EkDK84Z3l/f4Y5WKUX8ddF7ant1vC6i3NEnZGF8vW9xcSbF6xXsoW1r0h2CrDioSd
        627C2N72GpKdv7dKhsi4suwBnHu4/IrgGr/oEVeWW0pwHQtPcc5Qm0dy9RMFGDdv2B5BRcoO
        xwlJiRmCyjf4oizBaJnDUyfwzKrBNpSNCvB8ZEcBHQA9zxuk+UhGKehqBIbmxQ1iRlCpKd0g
        8wimB/TrhLI90RgZUX+BoLvPTIhkCsHwEx1h3etER0Hex1LMip3XcflCi82E0fUSqG412QYk
        7Q/3Ox8gK5bTwdCXM0taE3DaE/5UuFtlF/osmJsMGxZH6Cods91tRx+DpU8WWxZGu8Ftc80G
        3gFvp8oxaxbQX6WQ88hCileHQt9MhNjZCSZNr6Ui9oC1pgqJ6L+DoLBlRCqSIgSjJh0SXYeg
        wzRAWBdh9F542ewrykehv6JYIu53gKEpR/EGByhp0GCiLIfcHIXo9oTlWo1ExO5QMLaGFyFG
        u6mZdlMb7aY22v+5OoTXIjchXZ0cL6gPKIWrPmo+WZ2ujPeJTUk2oPXv1bNqWmhEbSsxRkRT
        iLGXz/CLUQqCz1BnJRsRUBjjLOdHzFEKeRyfdU1QpUSr0pMEtRFto3DGTX59y7dzCjqeTxMu
        C0KqoPo3lVB27tmoxMv7sTaENV5YPRG2y7Ny6QO2e7k8PZw5f/qk+Uqx2z6Sa7f/Pn5kvGGy
        63PddKCHz2hArKlzujXwlimEn9pprwnq0Mkzj7fDwXzf0fr5m0zoVjLkRpi3R2JQdGOk65m+
        odDG3j3UpYjwH4Ml5Su/f/4alvsVuZ4qFGYdU555LTO4OoH398JUav4vEn2H3VoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsVy+t/xu7qJed9iDGb9U7A4feYUk8WSn7uY
        LD4sSLbYfK6H1aJz4hJ2i54NW1ktlm36w2Tx6dROZosz+1eyWXxu/cfmwOUxu+Eii8eU3xtZ
        PXbcXcLoMbtjJqvH4a8LWTw2repk89j8opvZ4/MmuQCOKD2bovzSklSFjPziElulaEMLIz1D
        Sws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MQz8/sRS8YKlYdm0fYwNjN0sXIweHhICJ
        xPRDSl2MXBxCAksZJU5Om8kMEZeSmN8CFOcEMoUl/lzrYgOxhQReM0ocvGIFYgsLxEh0XgUp
        5+QQAbKXnL/JDDKHWWAzk8T81fPYIYaeZZR49XQjWDebgKFE79E+RhCbV8BO4mzbRzaQZSwC
        KhK/5kuBhEUFIiRm72pggSgRlDg58wmYzSngJPHj1k9WEJtZQF3iz7xLzBC2uETTl5VQcXmJ
        7W/nME9gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4Nz232EivODG3uDQvXS85P3cTIzBWtx37
        uWUHY9e74EOMAhyMSjy8HxK/xQixJpYVV+YeYpTgYFYS4U28/SVGiDclsbIqtSg/vqg0J7X4
        EKMp0G8TmaVEk/OBaSSvJN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwen
        VAPjwa+KNz5d+7T6I/+X08HRhR9Wf+NzK+RcZV7vvPao9erJr42zil4EmPk2Llba+VTf28A1
        bW1vW/eRyYy7v83saf9adXmP+UP5fVei2/aFv/WfeMZznseWqGCHY3/tGj5J38mMXGHqXhl6
        +OrliFoWVqba/vAXHb6bV5zguR9qXGntfD/+Qg+bEktxRqKhFnNRcSIAMLeD3+sCAAA=
X-CMS-MailID: 20190604131305eucas1p160ce73971297305339b5c195c3dedffd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190604070639epcas2p3aa05be6d5af4cb26c3372af13c66d888
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190604070639epcas2p3aa05be6d5af4cb26c3372af13c66d888
References: <20190604070625.7664-1-boris.brezillon@collabora.com>
        <CGME20190604070639epcas2p3aa05be6d5af4cb26c3372af13c66d888@epcas2p3.samsung.com>
        <20190604070625.7664-2-boris.brezillon@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/4/19 09:06, Boris Brezillon wrote:
> Support for multiplanar and singleplanar formats is mutually exclusive,
> at least in practice. In our attempt to unify support for support for
> mplane and !mplane in v4l, let's get rid of the
> ->vidioc_enum_fmt_{vid,out}_cap_mplane() hooks and call
> ->vidioc_enum_fmt_{vid,out}_cap() instead.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

For:
 drivers/media/platform/exynos-gsc
 drivers/media/platform/exynos4-is
 drivers/media/platform/s5p-mfc

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Regards,
Sylwester
