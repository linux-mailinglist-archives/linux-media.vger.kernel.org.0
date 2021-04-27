Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 908F336C457
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235385AbhD0KsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:48:18 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:30100 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234773AbhD0KsS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:48:18 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210427104734euoutp0208c1ed4f900dd7fe4f17f039fd59e971~5sUW6yzrD1313113131euoutp02Z
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 10:47:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210427104734euoutp0208c1ed4f900dd7fe4f17f039fd59e971~5sUW6yzrD1313113131euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1619520454;
        bh=V622SrPPFmIy1V6bcn7pkxIde3kMy91ETgSjyHGa6Cw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Lef71eWzquCMnRJPJSCHiAWdev4XmSsDZzQhJeVD4+7U5IElEPIzmI8KC3k9evcHO
         lqojCP7QX0F+KIlCYIMUhhzSdzlLyYD/cA1+7vS5EbOIGD4Rk1smMhHYWPaOPH6RIs
         Daq5Gsc33Fazlan4xTGZjI5LVXEMgcr1PIrHXP8A=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210427104733eucas1p24d7df6da5cde799771531742edcc1289~5sUWgAcXn2179321793eucas1p2c;
        Tue, 27 Apr 2021 10:47:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id B5.28.09439.5CBE7806; Tue, 27
        Apr 2021 11:47:33 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210427104733eucas1p156e0f6c6e13f82584b471c37e5493663~5sUWAiHqn2380423804eucas1p1-;
        Tue, 27 Apr 2021 10:47:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210427104733eusmtrp24d4bc735249b8e4d421fd0f3158945db~5sUV-xQ7I0359703597eusmtrp2f;
        Tue, 27 Apr 2021 10:47:33 +0000 (GMT)
X-AuditID: cbfec7f5-c1bff700000024df-78-6087ebc53196
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id F5.90.08705.4CBE7806; Tue, 27
        Apr 2021 11:47:32 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210427104732eusmtip1cdf0c5e5d139a850b32e85990dcc4992~5sUVPui_d2324223242eusmtip1j;
        Tue, 27 Apr 2021 10:47:32 +0000 (GMT)
Subject: Re: [PATCH v3 63/79] media: exynos-gsc: use
 pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <dafff234-b575-9c84-b5bb-d7e6e912a5f3@samsung.com>
Date:   Tue, 27 Apr 2021 12:47:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <5a8d3ca13956feb5e611cb1fe08195966be5edf2.1619519080.git.mchehab+huawei@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djP87pHX7cnGMy7I2+xc8MXdouLM++y
        WJw/v4HdYtPja6wWl3fNYbPo2bCV1WLG+X1MFoc3nmGyaFtwmc3i4eyrjBbLNv1hcuD22HF3
        CaNHy5G3rB6bVnWyeWxeUu/xeZOcx6mvn9kD2KK4bFJSczLLUov07RK4MjZcvM1acIG54uD1
        F2wNjF3MXYycHBICJhK3dx9k7GLk4hASWMEo0bbsGxuE84VR4vDkLlYI5zOjxIITT9hgWrau
        fcEOkVjOKPF2zgMmCOcjo8TjKbPBqoQFgiR+HjoOtkREwFTi5qtOJhCbWeARk8TZCbIgNpuA
        oUTv0T6g5RwcvAJ2EpM2BIOEWQRUJfYv6QcrFxVIljj/+Co7iM0rIChxcuYTFhCbUyBB4siq
        JSwQI8Ulbj2ZDzVeXmL72znMIPdICLRzSvTs3McIcbWLxOWO41AfCEu8Or6FHcKWkfi/cz4T
        REMzo0TP7tvsEM4ERon7xxdAdVtL3Dn3iw3kUmYBTYn1u/Qhwo4SbZumsIOEJQT4JG68FYQ4
        gk9i0rbpzBBhXomONiGIahWJ36umM0HYUhLdT/6zTGBUmoXktVlI3pmF5J1ZCHsXMLKsYhRP
        LS3OTU8tNs5LLdcrTswtLs1L10vOz93ECExap/8d/7qDccWrj3qHGJk4GA8xSnAwK4nwsu1q
        TRDiTUmsrEotyo8vKs1JLT7EKM3BoiTOu2vrmnghgfTEktTs1NSC1CKYLBMHp1QDk0qy56qX
        C/+c+peannpEc/X16RujJcWOXZOJfXhn/+Lit/WX5dlqn/VtuVfTydiVq6u3hXO5ki6Xj1pm
        3c6nCxbfqzUTnd/9JaZYo8qedxvjhNORSy893/5m1UvVNqvd/Ad6+Xhu96Uq1Ss8/nCdRber
        xfMxz6UGgQ9NJxSNtrXMXc367lp8kLmd/wN1pWO2zy8lXcxp815QfrR00nrTf/tcEhn3aCVm
        pvJec6l2OLjSeFKQt/ZGh387T36QWWa0mUXtGjfXx7SHl6VURBJPqnkUPcpvf9B8RGN3e9TJ
        xToNHyQVdsk56Hn6ztLSaOrQUfKv7vta+pCFy1LX1m+Kv+HySXXzD/q+uJhRvbleiaU4I9FQ
        i7moOBEAie2Q3skDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsVy+t/xu7pHXrcnGHy8Y2Wxc8MXdouLM++y
        WJw/v4HdYtPja6wWl3fNYbPo2bCV1WLG+X1MFoc3nmGyaFtwmc3i4eyrjBbLNv1hcuD22HF3
        CaNHy5G3rB6bVnWyeWxeUu/xeZOcx6mvn9kD2KL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxM
        LPUMjc1jrYxMlfTtbFJSczLLUov07RL0MjZcvM1acIG54uD1F2wNjF3MXYycHBICJhJb175g
        72Lk4hASWMoocXFXL2MXIwdQQkpifosSRI2wxJ9rXWwQNe8ZJW49O88IkhAWCJL4eeg42CAR
        AVOJm686mUCKmAWeMUksurgDquMZo0TL1AawKjYBQ4neo31gG3gF7CQmbQgGCbMIqErsX9LP
        BGKLCiRLrP69mRXE5hUQlDg58wkLiM0pkCBxZNUSMJtZQF3iz7xLzBC2uMStJ/OZIGx5ie1v
        5zBPYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMwSrcd+7l5
        B+O8Vx/1DjEycTAeYpTgYFYS4WXb1ZogxJuSWFmVWpQfX1Sak1p8iNEU6J+JzFKiyfnANJFX
        Em9oZmBqaGJmaWBqaWasJM67de6aeCGB9MSS1OzU1ILUIpg+Jg5OqQam0Nvz7xsrCq/NupW8
        NkOw8517cprxacOl7jI7N7+Z+slGxHGxzpM5oY2zXlb2pIdc59Lla1aSbGtrDSiR+CJ1Z8m6
        pdr/+60X7X7KOD/0q/+1z9t+X98t9u5Uwpz3WocW8zb90P/v4JDJvjBjFntnmsqCN3MO7mJp
        EZI+1BS3a8rsZrZFBxWPdy1jmH0u8/cnQaFLHNHWKhs7bXq/BzPteTs5zzyqKvfYlS+MjPy/
        Ajw3P+tWWrfxkPjbKSZ7O5Z/X8+yPTupcLKeY31kt6q21eENe46YBGef+aJeZrvIit36L5e9
        VdYNjZs1V6S3sq3yj33MzahiqsrYtbIzNKDQxbOYe/9+Jo77ewo+6KgqsRRnJBpqMRcVJwIA
        JJZT4FsDAAA=
X-CMS-MailID: 20210427104733eucas1p156e0f6c6e13f82584b471c37e5493663
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210427102804eucas1p175159e50b5d3431e6b0cffea7d52aaed
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210427102804eucas1p175159e50b5d3431e6b0cffea7d52aaed
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
        <CGME20210427102804eucas1p175159e50b5d3431e6b0cffea7d52aaed@eucas1p1.samsung.com>
        <5a8d3ca13956feb5e611cb1fe08195966be5edf2.1619519080.git.mchehab+huawei@kernel.org>
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
