Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B84036C1CC
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 11:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235049AbhD0Jgw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 05:36:52 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29211 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbhD0Jgw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 05:36:52 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210427093608euoutp02566465cd887c9bbe46fe2076a4eb249f~5rV-XnfDI3066530665euoutp02h
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 09:36:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210427093608euoutp02566465cd887c9bbe46fe2076a4eb249f~5rV-XnfDI3066530665euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1619516168;
        bh=vbfrbVBOyIlUJ+I6Dc0yiwS4FSTAhz1Zs/zM64zfLRA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=bFmaVCJ3WDRp0FL5LjPhVH/d0YTLlZpqIQFIdjWetXe4TS4WY2DNG1NBrEAqWdEgq
         tStStJiUzyfYS3RcprIhrNFxEhzbL2dmDjvMggCfUAllyQGAu2q7Dv3f5rW3+FSLL8
         7L62kotskXbN74ugDscGkr6HzwnoHHG/OPoJSzIM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210427093607eucas1p175cdac982511e8eec88e000ed5d419ca~5rV_7uvC31509215092eucas1p1V;
        Tue, 27 Apr 2021 09:36:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 9F.76.09444.70BD7806; Tue, 27
        Apr 2021 10:36:07 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210427093607eucas1p267096317e64f2a5851033f20daa67044~5rV_lNb8C1962419624eucas1p2A;
        Tue, 27 Apr 2021 09:36:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210427093607eusmtrp1cd3eb863516316850b78ed4f4394ff99~5rV_kdwte2593025930eusmtrp1R;
        Tue, 27 Apr 2021 09:36:07 +0000 (GMT)
X-AuditID: cbfec7f4-dd5ff700000024e4-fd-6087db073df1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 82.10.08696.70BD7806; Tue, 27
        Apr 2021 10:36:07 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210427093606eusmtip100478afd2a2b72b80ea65b14e92a988a~5rV_EDACN2180121801eusmtip1c;
        Tue, 27 Apr 2021 09:36:06 +0000 (GMT)
Subject: Re: [PATCH 73/78] media: s5p-mfc: use pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Andrzej Hajda <a.hajda@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <b7fcbc42-a78c-50cb-803f-cdd99cd26404@samsung.com>
Date:   Tue, 27 Apr 2021 11:36:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f01c6e2c5e61bc198443ecb82cd8a6eb6961b6d7.1619191723.git.mchehab+huawei@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsWy7djPc7rst9sTDKY3aFjcWneO1WLT42us
        Fpd3zWGz6NmwldXi8MYzTBZtCy6zWTycfZXRYtmmP0wOHB4tR96yemxa1cnmsXlJvUffllWM
        Hp83yQWwRnHZpKTmZJalFunbJXBlzJ45hbngDXPFqhlLmRsY5zF3MXJySAiYSFyavpW1i5GL
        Q0hgBaPEwYl9zBDOF0aJy5ffs0E4nxklrq78yQLT8vLuDEaIxHJGiTerdkD1f2SUOLOxgRWk
        SljAS2J913uwJSICphI3X3UygRQxC7xglLjf/hdsFJuAoUTv0T5GEJtXwE7i2q23QEUcHCwC
        qhJ7znmAhEUFkiXOP77KDlEiKHFy5hOwVk6BBInD9yeAzWcWEJe49WQ+E4QtL7H97Ryo555w
        SExa6Alhu0j83bKOCcIWlnh1fAs7hC0jcXpyDwvIbRICzYwSPbtvs0M4E4AOPb6AEaLKWuLO
        uV9sIMcxC2hKrN+lDxF2lJiy/gArSFhCgE/ixltBiBv4JCZtm84MEeaV6GgTgqhWkfi9ajrU
        CVIS3U/+s0xgVJqF5LNZSL6ZheSbWQh7FzCyrGIUTy0tzk1PLTbKSy3XK07MLS7NS9dLzs/d
        xAhMRqf/Hf+yg3H5q496hxiZOBgPMUpwMCuJ8LLtak0Q4k1JrKxKLcqPLyrNSS0+xCjNwaIk
        zpu0ZU28kEB6YklqdmpqQWoRTJaJg1OqgakwSs3cY0PCPOaaXxnX/h7v18ow9tHpOuk+jSPl
        rvTrhOkX15asehzj2mXvcOBne/Zf7lTnr93Sj0vfZsQ0lG672qZsOj1wY835MIkXa7LMrswU
        sOpmeXf4qb8zV0VWokHmdl350MXPCrx31nQyhNzyYU1xdwxz1Lsw57D0vcNpa08W/FZeqqmp
        6JscP+e9ZczT5VqnGrcWnn/iK2ZlpHzin+f6HOHzwnGZaxO1Oro77hyZFeV56ns+y/yewN+R
        /281HZxbZup6U/iTiU1Xnl1qkhvXpslW77yvH3ZanfGa4dbbzVv5Lx/VXup1R9YjMuupyIk1
        yamczqt8Hmgtijm9O7jm74opdWetajOalViKMxINtZiLihMBrdp5GLUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsVy+t/xu7rst9sTDNov8FvcWneO1WLT42us
        Fpd3zWGz6NmwldXi8MYzTBZtCy6zWTycfZXRYtmmP0wOHB4tR96yemxa1cnmsXlJvUffllWM
        Hp83yQWwRunZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunb
        JehlzJ45hbngDXPFqhlLmRsY5zF3MXJySAiYSLy8O4Oxi5GLQ0hgKaPEwqs/gRwOoISUxPwW
        JYgaYYk/17rYIGreM0o0fp/OBpIQFvCSWN/1HmyQiICpxM1XnUwgNrPAK0aJ1dNDQGwhgWeM
        Eis/WILYbAKGEr1H+xhBbF4BO4lrt94ygexiEVCV2HPOAyQsKpAssfr3ZlaIEkGJkzOfsIDY
        nAIJEofvT2CGGK8u8WfeJShbXOLWk/lQa+Ultr+dwzyBUWgWkvZZSFpmIWmZhaRlASPLKkaR
        1NLi3PTcYiO94sTc4tK8dL3k/NxNjMDI23bs55YdjCtffdQ7xMjEwXiIUYKDWUmEl21Xa4IQ
        b0piZVVqUX58UWlOavEhRlOgdyYyS4km5wNjP68k3tDMwNTQxMzSwNTSzFhJnNfkyJp4IYH0
        xJLU7NTUgtQimD4mDk6pBia9lhD9kw1R3/IiWo5cr44NtFCpeHRj7mq3ec9X2KdzPO2Zzl6U
        seTnFH2toAmOm1gjzB5/LNTzfy7yTeX7i1/HPDbxsd9oXb6eXaey882+644/n1wy4JjxTvGT
        jGxmg+FKTsOOpl9cIu3B7QHulrnzo39c95kXnzZTJGa3TvX3gh+f9szifqLi8aRXe8kme/VT
        JyfIVuRJlz0IqPXbJ16vcr3P5dy/Z0x2q/rXiq6/plO1QMy48c62OMY4u51n5b/fWfYpNWvB
        nwOfLoQcWpmYc/+Heo3mVF3jWVfqIiY3HL7KMNPgdPL/NfGbHyt0bjNjFhP7UDfRqq5tX+kf
        d2unx9w2GRZTzv8PeSbIoa7EUpyRaKjFXFScCADldAlMRQMAAA==
X-CMS-MailID: 20210427093607eucas1p267096317e64f2a5851033f20daa67044
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210424064654eucas1p21309858fa610e3cb3a796fabe685e457
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210424064654eucas1p21309858fa610e3cb3a796fabe685e457
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <CGME20210424064654eucas1p21309858fa610e3cb3a796fabe685e457@eucas1p2.samsung.com>
        <f01c6e2c5e61bc198443ecb82cd8a6eb6961b6d7.1619191723.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24.04.2021 08:45, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thank you for the patch.

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
