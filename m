Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470AC36C453
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235435AbhD0Kps (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:45:48 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:28198 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235544AbhD0Kpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:45:47 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210427104503euoutp02430609363927d41c197a13b54fc4ba15~5sSKSCqp40716207162euoutp02K
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 10:45:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210427104503euoutp02430609363927d41c197a13b54fc4ba15~5sSKSCqp40716207162euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1619520303;
        bh=V622SrPPFmIy1V6bcn7pkxIde3kMy91ETgSjyHGa6Cw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=l4sGz9gINEf1gotMF5ZXkYHkt5u6DqLl3nhuRy8l+LTj3O+nbm0MpgKp2M+Mn5FOd
         k1Rs5bw7yclH26aH6XqYD9bRHJT+NAvGuplG2y74s8LAiMJzwVroStU5PTenwTsa5D
         mSC7WOmbrI4qPxvB3a+llEMq7KwHbanbIraCfbEw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210427104502eucas1p268cfcf4790cf35fc77c8bf92f7be2a64~5sSJ8Skpf0429904299eucas1p2M;
        Tue, 27 Apr 2021 10:45:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 70.69.09452.E2BE7806; Tue, 27
        Apr 2021 11:45:02 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210427104501eucas1p14642dca05ea6627afa84173b89bbff58~5sSJShVZq1646916469eucas1p1B;
        Tue, 27 Apr 2021 10:45:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210427104501eusmtrp2143801aadf5bd52ec8635882417b8e55~5sSJRyrwf0230802308eusmtrp2s;
        Tue, 27 Apr 2021 10:45:01 +0000 (GMT)
X-AuditID: cbfec7f2-ab7ff700000024ec-0e-6087eb2e395a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 26.6B.08696.D2BE7806; Tue, 27
        Apr 2021 11:45:01 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210427104501eusmtip2c1aaacea69fdfa9ad989cb83885d1b96~5sSIqSE_S0122901229eusmtip2t;
        Tue, 27 Apr 2021 10:45:01 +0000 (GMT)
Subject: Re: [PATCH v3 62/79] media: exynos4-is: use
 pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <be384ba7-c657-ff3b-b21a-f8d2be96edaa@samsung.com>
Date:   Tue, 27 Apr 2021 12:45:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <834b16534ae8e18a29c734956e3eda671d455451.1619519080.git.mchehab+huawei@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsWy7djPc7p6r9sTDPo3KFicP7+B3WLT42us
        Fpd3zWGz6NmwldVixvl9TBaHN55hsmhbcJnN4uHsq4wWyzb9YXLg9Gg58pbVY9OqTjaPzUvq
        PT5vkgtgieKySUnNySxLLdK3S+DK2HDxNmvBBeaKg9dfsDUwdjF3MXJySAiYSHw+8oG1i5GL
        Q0hgBaPE++5ONpCEkMAXRonGT1EQic+MEqePX2KH6VjTCGELCSxnlDg0QwSi6COjxNO2LUAJ
        Dg5hgSCJpRdtQGpEBEwlbr7qZAKpYRboZZLYf+QlC0iCTcBQovdoHyOIzStgJ3F5+V6wzSwC
        qhLTfmxkBbFFBZIlzj++yg5RIyhxcuYTFpD5nAIJEv0fgkDCzALiEreezGeCsOUltr+dwwyy
        S0LgCYdE5+YGFoijXSTmTZvCCGELS7w6vgXqGRmJ/zvnM0E0NDNK9Oy+zQ7hTGCUuH98AVSH
        tcSdc7/YQDYzC2hKrN+lDxF2lFh0axtYWEKAT+LGW0GII/gkJm2bzgwR5pXoaBOCqFaR+L1q
        OhOELSXR/eQ/ywRGpVlIPpuF5J1ZSN6ZhbB3ASPLKkbx1NLi3PTUYsO81HK94sTc4tK8dL3k
        /NxNjMBEdPrf8U87GOe++qh3iJGJg/EQowQHs5IIL9uu1gQh3pTEyqrUovz4otKc1OJDjNIc
        LErivKtmr4kXEkhPLEnNTk0tSC2CyTJxcEo1MAXlu6zKUrhrGL9556yflS3cShb+u6es9lwn
        nvgh9oqtyOH3fjwPlp6eEykUtfzoqW0nBd4/YXs7/ci2zqMZGzsDTW+9eMEfkM9Q8t82fpbO
        5KCjj4PyD87w4Ng8z2jHt/J7D5qeKL/RcqlINf30u/+wZmDE49RFe5fzXRNQ+/gpa/Ol1Cx9
        sbce6VO5L874aynQ98x4Q7iyQpZAROaji8kLs+0SrdpmrJ3CKHmnf9Xxa4qRsSlr8vtL/Xkf
        7bxt7KQoYhj9nivKNko22W2de9nXG6UTHrmyh/jscWQ5a+ra/sLn6QN/14fFus4Xow6t0lJi
        LE2okXzIyWP8dMUbPpbvvp+c+LyORb2T+1ltocRSnJFoqMVcVJwIAIg0sGmzAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsVy+t/xe7q6r9sTDP7tM7c4f34Du8Wmx9dY
        LS7vmsNm0bNhK6vFjPP7mCwObzzDZNG24DKbxcPZVxktlm36w+TA6dFy5C2rx6ZVnWwem5fU
        e3zeJBfAEqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRv
        l6CXseHibdaCC8wVB6+/YGtg7GLuYuTkkBAwkVjTeIm9i5GLQ0hgKaPEtsWL2LoYOYASUhLz
        W5QgaoQl/lzrYoOoec8ocfz+JUaQGmGBIImlF21AakQETCVuvupkArGZBfqZJE50BELUP2OU
        mDsVZAEnB5uAoUTv0T5GEJtXwE7i8vK9bCA2i4CqxLQfG1lBbFGBZInVvzezQtQISpyc+YQF
        ZBenQIJE/4cgiPnqEn/mXWKGsMUlbj2ZD7VXXmL72znMExiFZiHpnoWkZRaSlllIWhYwsqxi
        FEktLc5Nzy020itOzC0uzUvXS87P3cQIjLxtx35u2cG48tVHvUOMTByMhxglOJiVRHjZdrUm
        CPGmJFZWpRblxxeV5qQWH2I0BXpnIrOUaHI+MPbzSuINzQxMDU3MLA1MLc2MlcR5TY6siRcS
        SE8sSc1OTS1ILYLpY+LglGpgiultXc3ZeYXpoX3/ixevdi54vNzi4J+N0xyMTFVVvUp8As56
        WZ06r2PUGP9SX+TgHVOp3qjspd/jfhg/+dTgflQkwWK6QntTN4/S3VnZvpN94ndVdJ2ezgN0
        2+97yUk1T6q3Ldm8K7Tu059/HVcbGe0arkkVaa6wniqX3zPd3+V39U+ZlVMcQxffcv/+r93X
        6GXr+kKn/AqdR38/y9jlGUr0fN5bI9XOqvptinh8xK6kczP1oz9mB/wubrPUfCfQ+LShXebl
        lYvzrl3+cK9sqcoujuwcRrEf0dKb0rWU3fZrnF9iELRw7rVQuW6bH9bHlLKtrkqddrA3e/2d
        fcMnZ1GuN4KHIs5lSYXc51ZiKc5INNRiLipOBACshdKpRQMAAA==
X-CMS-MailID: 20210427104501eucas1p14642dca05ea6627afa84173b89bbff58
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210427102817eucas1p189868733a2485301909918a76f56bed9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210427102817eucas1p189868733a2485301909918a76f56bed9
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
        <CGME20210427102817eucas1p189868733a2485301909918a76f56bed9@eucas1p1.samsung.com>
        <834b16534ae8e18a29c734956e3eda671d455451.1619519080.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27.04.2021 12:26, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
