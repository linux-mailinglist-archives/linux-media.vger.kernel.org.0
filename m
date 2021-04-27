Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B608F36C73C
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 15:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238263AbhD0NtN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 09:49:13 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60310 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236520AbhD0NtC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 09:49:02 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210427134817euoutp02379d1da12a81256d6cda9b705679ed8b~5uyJi_S7p1089010890euoutp02l
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 13:48:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210427134817euoutp02379d1da12a81256d6cda9b705679ed8b~5uyJi_S7p1089010890euoutp02l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1619531297;
        bh=+aMkihQAegdyYigDg5mTKEVlkZ0cCX26e295FbA7/c4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=luzNfxdmq97U7KOg8p8w5ASR/axvNyf2feBt95AhaJ6OhgTcMj8g9ok+WcY5hXAfx
         soEyeW7EbX4TAAKFrWHdkVIxOBUvbA5Wqy9jbw8z85KFyfS36araVVSnJVA4uKRI2u
         YhftITChGSOkGxFqnqRKGL9Z8ZXWQ66T/v+o71Yk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210427134817eucas1p14b7bfd014b63c7b594cace4fa0ee0cef~5uyJbN-xJ1269612696eucas1p1_;
        Tue, 27 Apr 2021 13:48:17 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 8D.3A.09452.12618806; Tue, 27
        Apr 2021 14:48:17 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210427134816eucas1p124e5a78b5beb7a70ca8090cdc6fdae5d~5uyI8tOvA1709117091eucas1p1j;
        Tue, 27 Apr 2021 13:48:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210427134816eusmtrp14b957a6c7bef52e5fb24cd7239c97fe5~5uyI8Ap2B0501305013eusmtrp17;
        Tue, 27 Apr 2021 13:48:16 +0000 (GMT)
X-AuditID: cbfec7f2-a9fff700000024ec-b6-608816212bb8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id F7.2C.08705.02618806; Tue, 27
        Apr 2021 14:48:16 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210427134816eusmtip12b5181d017d7d87d37fdb46567de99be~5uyITggT02529925299eusmtip1Q;
        Tue, 27 Apr 2021 13:48:15 +0000 (GMT)
Subject: Re: [PATCH v3] media:exynos4-is: Fix a use after free in
 isp_video_release
To:     Lv Yunlong <lyl2019@mail.ustc.edu.cn>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org, krzk@kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <ed80a3f0-048a-17df-4dff-e9d52b777699@samsung.com>
Date:   Tue, 27 Apr 2021 15:48:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427132734.5212-1-lyl2019@mail.ustc.edu.cn>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsWy7djPc7qKYh0JBntfclmcP7+B3WLT42us
        Fpd3zWGz6NmwldVixvl9TBb737ezWCzb9IfJgd1j06pONo/NS+o93i/4zezxeZNcAEsUl01K
        ak5mWWqRvl0CV8aanxtZCg6yVixq2cncwHiVpYuRk0NCwERi9fPHzF2MXBxCAisYJU5N2cII
        4XxhlPgy6zMbhPOZUeLl3busXYwcYC2fljhCxJczSjz6NBWq4yOjRO+R2WBzhQVCJfbM2MkI
        YosIaEpM+drJBFLELLCeUaLp8GQmkASbgKFE79E+sCJeATuJe8+fgNksAqoSM7ZdZwWxRQWS
        Jc4/vsoOUSMocXLmE7AFnAK2EhdefAezmQXEJW49mc8EYctLbH87B+whCYEbHBJ7Hr9ghDjb
        RaL5cjDE08ISr45vYYewZSROT+5hgahvZpTo2X2bHcKZwChx//gCRogqa4k7536xgQxiBnpn
        /S59iLCjxJnusywQ8/kkbrwVhLiBT2LStunMEGFeiY42IYhqFYnfq6YzQdhSEt1P/rNMYFSa
        heSzWUi+mYXkm1kIexcwsqxiFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQITDyn/x3/tINx
        7quPeocYmTgYDzFKcDArifCy7WpNEOJNSaysSi3Kjy8qzUktPsQozcGiJM67avaaeCGB9MSS
        1OzU1ILUIpgsEwenVANTUub0Ys1X/OtebvkQUyjOcOz0ztOMBgvcFKI/PKhtmpRn/qJL3z5j
        +h+mv3uOei67XaLx+mnyq+YDO87p+xxuzKvNuCUo75h4RYCrOuLUIwXplwHvo5PiWk5eK1nx
        wD/5peWrAqG5S/IqnVw3ZGsy+3zW/SukYiqkNbmiQnzFrM1Ht+85tpNp6vHtip/OzVzRdKHu
        6LcJSy7t//Dm9Tbe7dseMpnqen823JBe+SFfc2deSdFaue+xjZ78XrzrbbMiXny9ciatbb+v
        5Plj1+YLzX20Jt31kkEDSxqfEqfmH+Ofjmd8POc72TL5FnBXyXDNLz+4XSH7ysyvlTa7uTc2
        xv48aFy01/5CFBN/YuU5JZbijERDLeai4kQAruGl0qsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xu7oKYh0JBh9XqFicP7+B3WLT42us
        Fpd3zWGz6NmwldVixvl9TBb737ezWCzb9IfJgd1j06pONo/NS+o93i/4zezxeZNcAEuUnk1R
        fmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsaanxtZCg6y
        Vixq2cncwHiVpYuRg0NCwETi0xLHLkYuDiGBpYwSD3t/sELEpSTmtyh1MXICmcISf651sUHU
        vGeUeNW1gQUkISwQKrFnxk5GEFtEQFNiytdOJpAiZoH1jBL9O44xgySEBCYwSix8LQliswkY
        SvQe7QNr4BWwk7j3/AmYzSKgKjFj23VWEFtUIFli9e/NrBA1ghInZz4BW8YpYCtx4cV3MJtZ
        QF3iz7xLzBC2uMStJ/OZIGx5ie1v5zBPYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hQ
        rzgxt7g0L10vOT93EyMwzrYd+7l5B+O8Vx/1DjEycTAeYpTgYFYS4WXb1ZogxJuSWFmVWpQf
        X1Sak1p8iNEU6J+JzFKiyfnASM8riTc0MzA1NDGzNDC1NDNWEufdOndNvJBAemJJanZqakFq
        EUwfEwenVAMT4wGBRoZSEctbN3LbC8sN3Xy99V2/3/YU9wgSPlr7e8GkqhyWbXHRcx4f//uo
        b/fzD5q1B95cDJze6LldoHxlgLjL28/7lWcUXpjT32nSLjhnSdmzSL9VIutLSi6bLSkOvHu7
        wPa7/Y4KruyAr5FWwrKemhfiF9w+8shZ8OZqG+2E7bZVlwodXCNueWwP4lNmdLleJLbS/uu/
        jM/Z0kzGKml35X5HH5nHHlmbb3QpPPGnU5hs5rLdjxc/tf0fZWd1uL+Arf7H7RnTLfKnaGus
        ma60/Fmlxyu7X2/komwYX32N+7D64AedgOSpi+d8mmRqGynvmxi+WX77YbMGQ3EP5u+l7id2
        51T1lsr4piqxFGckGmoxFxUnAgCSgdzLPAMAAA==
X-CMS-MailID: 20210427134816eucas1p124e5a78b5beb7a70ca8090cdc6fdae5d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210427132754eucas1p21042e4e176135e7b3f7b540dc9aadfbb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210427132754eucas1p21042e4e176135e7b3f7b540dc9aadfbb
References: <CGME20210427132754eucas1p21042e4e176135e7b3f7b540dc9aadfbb@eucas1p2.samsung.com>
        <20210427132734.5212-1-lyl2019@mail.ustc.edu.cn>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27.04.2021 15:27, Lv Yunlong wrote:
> In isp_video_release, file->private_data is freed via
> _vb2_fop_release()->v4l2_fh_release(). But the freed
> file->private_data is still used in v4l2_fh_is_singular_file()
> ->v4l2_fh_is_singular(file->private_data), which is a use
> after free bug.
> 
> My patch sets file->private_data to NULL after _vb2_fop_release()
> to avoid the use after free, and uses a variable 'is_singular_file'
> to keep the original function unchanged.
> 
> Fixes: 34947b8aebe3f ("[media] exynos4-is: Add the FIMC-IS ISP capture DMA driver")
> Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>

Thanks,

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
