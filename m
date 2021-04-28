Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E84F36DBAC
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhD1PcD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 11:32:03 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:61405 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235511AbhD1Pb7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 11:31:59 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210428153112euoutp029a35a6518e5e607af0948f3280f899c0~6D1TOdRSY3054230542euoutp02J
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 15:31:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210428153112euoutp029a35a6518e5e607af0948f3280f899c0~6D1TOdRSY3054230542euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1619623872;
        bh=m+hdeTbcfz9a40qWhK2Fq1g/AYhNVX0njgo14qtoNw0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=AaCgufP9a7a2yirkQ34ejQj9wQOjbjHnzxLEtzcahVcLWP0wtutxHc9Rq8JYDQsh9
         9B344Q7MZkaOqBfR5WrzPsm5GDm8HbRiiqUmHjoDgYBHmgnbw8JCQNIljkglTlMCyX
         r/GqhkdpZOaK9qqsc0sCFgxJCza550OpIzlMjdG8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210428153112eucas1p2ee5fee6a25d7b1a482615ee7d141c591~6D1SiOq5P1235612356eucas1p2c;
        Wed, 28 Apr 2021 15:31:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id CA.76.09439.FBF79806; Wed, 28
        Apr 2021 16:31:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210428153111eucas1p233b6dacedf6cdd669d7746e8afbdbf7b~6D1SCqEhu1225412254eucas1p2I;
        Wed, 28 Apr 2021 15:31:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210428153111eusmtrp26e7e41a6af6dd5e0872c733e54052742~6D1SB0VBM3196131961eusmtrp2Q;
        Wed, 28 Apr 2021 15:31:11 +0000 (GMT)
X-AuditID: cbfec7f5-c1bff700000024df-3b-60897fbf56f2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 1B.79.08696.FBF79806; Wed, 28
        Apr 2021 16:31:11 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210428153110eusmtip23c5b26d8e4b26c44f2bf31d3cf21afc4~6D1RWxEUa1021110211eusmtip2U;
        Wed, 28 Apr 2021 15:31:10 +0000 (GMT)
Subject: Re: [PATCH v4 02/79] media: s6p_cec: decrement usage count if
 disabled
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kamil Debski <kamil@wypas.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <944397f9-442d-1943-03fd-91a6fdc8a141@samsung.com>
Date:   Wed, 28 Apr 2021 17:31:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <2c52c48533f6eafdb7b9c72ee2f02747e851a983.1619621413.git.mchehab+huawei@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMKsWRmVeSWpSXmKPExsWy7djP87oH6jsTDLa+YrK4OPMui8XME+2s
        Fpd3zWGz6NmwldVixvl9TBaHN55hslh75C67RduCy2wWD2dfZbRYtukPkwOXR8uRt6wem1Z1
        snn0bVnF6PF5k5zHlSON7B6nvn5mD2CL4rJJSc3JLEst0rdL4MpY/H0rW8FNzoptay8zNzBO
        5uhi5OSQEDCRWPbgL2MXIxeHkMAKRolVUzawQjhfGCUaX61ig3A+M0p8vbaPqYuRA6zlZIc/
        RHw5o8TW74uYIZyPjBLz/l1iBZkrLBAo0bbkAhOILSJgKnHzVScTSBGzwA4mib+/JoIVsQkY
        SvQe7WMEsXkF7CT2717BBmKzCKhKbDr+nx3EFhVIljj/+Co7RI2gxMmZT1hAbE6BBImHF++A
        9TILiEvcejKfCcKWl9j+dg7YRRIC/zkk7m7ayQLxqYvE3pPvoGxhiVfHt7BD2DIS/3fOZ4Jo
        aGaU6Nl9mx3CmcAocf/4AkaIKmuJO+d+sYECgFlAU2L9Ln2IsKPEmx//GCHhwidx460gxBF8
        EpO2TWeGCPNKdLQJQVSrSPxeNZ0JwpaS6H7yn2UCo9IsJK/NQvLOLCTvzELYu4CRZRWjeGpp
        cW56arFxXmq5XnFibnFpXrpecn7uJkZgujr97/jXHYwrXn3UO8TIxMF4iFGCg1lJhJdtV2uC
        EG9KYmVValF+fFFpTmrxIUZpDhYlcd5dW9fECwmkJ5akZqemFqQWwWSZODilGpg6L+rM7ov9
        IaQREtLqPdn9xLYWS77meyG5+g1LJtQv+T9F8erF+MPelstjD5ptODmZiXfBr/gGzRV7dbO2
        qtu+P9+VwbXDuVj/kKbPey173f1bGkWUTq2Nm9TgIuRcXXE/gbmjLHdRusPDlSknfVjlPk/u
        tXfWFb1VUTtLc6qf6778lz1WE77rXzjbdeD+FbvFyWLVD8OqCtx2HJd0Dr1l/P/Ihq5bYRZN
        llNWPA2Y/3lp+ZaH659emfnmJ3edYkP7Sb/jqs+Dfqo5vdEqM0iNrkvz3/FYe9Pp8oKuHRus
        bjmZ3JD9ebLmwcQUtsWz3qt9MJw48fiL9EWL756re7lcqOMf99eoVa98+tyzzl1UYinOSDTU
        Yi4qTgQAHvjJzcYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsVy+t/xe7r76zsTDN4dUbS4OPMui8XME+2s
        Fpd3zWGz6NmwldVixvl9TBaHN55hslh75C67RduCy2wWD2dfZbRYtukPkwOXR8uRt6wem1Z1
        snn0bVnF6PF5k5zHlSON7B6nvn5mD2CL0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2
        j7UyMlXSt7NJSc3JLEst0rdL0MtY/H0rW8FNzoptay8zNzBO5uhi5OCQEDCRONnh38XIxSEk
        sJRRoqH5MjtEXEpifotSFyMnkCks8edaFxtEzXtGic+fvrCDJIQFAiXallxgArFFBEwlbr7q
        ZAIpYhbYwSQx8+9PsCIhgWeMEh+Ws4DYbAKGEr1H+xhBbF4BO4n9u1ewgdgsAqoSm47/B6sX
        FUiWWP17MytEjaDEyZlPwHo5BRIkHl68A9bLLKAu8WfeJWYIW1zi1pP5TBC2vMT2t3OYJzAK
        zULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yfu4kRGJvbjv3csoNx5auP
        eocYmTgYDzFKcDArifCy7WpNEOJNSaysSi3Kjy8qzUktPsRoCvTPRGYp0eR8YHLIK4k3NDMw
        NTQxszQwtTQzVhLnNTmyJl5IID2xJDU7NbUgtQimj4mDU6qBycCEly/owoeuUxGPbRr/mj+Q
        fhyR9sc4MdhV0Ll6msHRzhvnZ7w5mL1DmM1r2+PjQbMvCrUeDe42Wdaq8lcu9+DE0tItT8Va
        I1lVPH/W66bHZE10M2lnfHDZ6+GJghWRu+3Tvom7v5OvEg9S+fSa6erydVnntH+ZKez4y75w
        fn+lgf/29To2n16VVu6bfiV8e5LiUW2BByzPfiaVLuE91VwQc4yzRCD/41lD88ADHK3TOWw0
        wz5IJ9uwVjq9f3/on8e5ghc1z5ac+JW2PTFVeoGRxJ4dBoacn6seNTvFNS3dcHX1/bP/wt3n
        TSjc9tmcoW7Xg5vGZyr3HfjjtOo4K+u83aniTCvrhUz1L1e7KLEUZyQaajEXFScCABtOq15W
        AwAA
X-CMS-MailID: 20210428153111eucas1p233b6dacedf6cdd669d7746e8afbdbf7b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210428145500eucas1p14179acbadaef3168806f78cea20da6f8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210428145500eucas1p14179acbadaef3168806f78cea20da6f8
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <CGME20210428145500eucas1p14179acbadaef3168806f78cea20da6f8@eucas1p1.samsung.com>
        <2c52c48533f6eafdb7b9c72ee2f02747e851a983.1619621413.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28.04.2021 16:51, Mauro Carvalho Chehab wrote:
> There's a bug at s5p_cec_adap_enable(): if called to
> disable the device, it should call pm_runtime_put()
> instead of pm_runtime_disable(), as the goal here is to
> decrement the usage_count and not to disable PM runtime.
> 
> Reported-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Fixes: 1bcbf6f4b6b0 ("[media] cec: s5p-cec: Add s5p-cec driver")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks,
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

There is a typo in the subject, s6p_cec -> s5p_cec.

> ---
>  drivers/media/cec/platform/s5p/s5p_cec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
> index 2a3e7ffefe0a..3c7c4c3c798c 100644
> --- a/drivers/media/cec/platform/s5p/s5p_cec.c
> +++ b/drivers/media/cec/platform/s5p/s5p_cec.c
> @@ -51,7 +51,7 @@ static int s5p_cec_adap_enable(struct cec_adapter *adap, bool enable)
>  	} else {
>  		s5p_cec_mask_tx_interrupts(cec);
>  		s5p_cec_mask_rx_interrupts(cec);
> -		pm_runtime_disable(cec->dev);
> +		pm_runtime_put(cec->dev);
>  	}
>  
>  	return 0;
