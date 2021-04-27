Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B2836C462
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235489AbhD0Kwb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:52:31 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32396 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235366AbhD0Kwb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:52:31 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210427105147euoutp012aa480e7bbc37f4b0bc4c83dd58411b2~5sYCotl_D0058200582euoutp01v
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 10:51:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210427105147euoutp012aa480e7bbc37f4b0bc4c83dd58411b2~5sYCotl_D0058200582euoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1619520707;
        bh=MmJTBavg50WYCw5G5bAhWOcAElm9GsFqPn5LIgQ0ruU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=G2B2GOjKxrmOdQLVdLPwDtqWAxYe66OyDuqAdn6o5Pnmm9BYqCOuIJT2r3UcNngzT
         hV313dB62KcOhSCgZP9tARMojECw3Sz7R7bboeVLjObSOd7eEnhBG/75i6zNcTxqCh
         oHHaQpiT8uaUXeQY5XSCemDGJN95LSvt5PK0XAbI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210427105146eucas1p1d10460066990d6527d5e0e82da79eb26~5sYCLucy82238822388eucas1p1O;
        Tue, 27 Apr 2021 10:51:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 49.D8.09439.2CCE7806; Tue, 27
        Apr 2021 11:51:46 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210427105146eucas1p1d7af1a3496b71014d4307cbe66e3e2b9~5sYBmqb3q2025320253eucas1p1Q;
        Tue, 27 Apr 2021 10:51:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210427105146eusmtrp211b7430c7c6e871639a1e634d862e1a1~5sYBl5MQZ0543905439eusmtrp2P;
        Tue, 27 Apr 2021 10:51:46 +0000 (GMT)
X-AuditID: cbfec7f5-c03ff700000024df-b2-6087ecc2cd8b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 69.31.08705.1CCE7806; Tue, 27
        Apr 2021 11:51:45 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210427105145eusmtip2766d6df03a761c7e769ef1d4b03fd687~5sYBAGyxk0657306573eusmtip2q;
        Tue, 27 Apr 2021 10:51:45 +0000 (GMT)
Subject: Re: [PATCH v3 13/79] media: s5p: fix pm_runtime_get_sync() usage
 count
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <ae9e751a-be29-4ff8-b566-73c4f258d5b8@samsung.com>
Date:   Tue, 27 Apr 2021 12:51:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <fd173b0ac00a31630bc60edaf47c2231970a87ed.1619519080.git.mchehab+huawei@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf0yMcRzHfZ/nueeeuzmerqyPJOsW86M7P8o8+RnDzsYolmLopmdp6uLO
        ldhoflZoJ1M61zrmx3WVdEtx0eUc11XEUkNCNEtzqVXzWzw9TP+93p/P+/P9/NiXwqVmgR+V
        oN7DatSqRBkpJioffG2SOz4ej531yh7IPMlvJ5hmm5FkTl6/IWDONdVgzL3yRowpdbYLmWOm
        ZpLpON+CmCvWH1i4SHnE6REorZZMUpldYUHKfmuAsn6wX7hOsEm8MI5NTEhhNTMXx4p3uL+a
        yV35o/d+M7UJ0lGuOAtRFNChYBhaloXElJQ2I/iUWYnxYgBBR9lZPAuJ/oh+BDWeYI65goIv
        bSRvuoqgou6VgBd9CEo77gg5lzcdAQWu1yTHPvRceN6dOfwsTudiUFNeJ+ASJD0bTt3PRhxL
        6MVw0T1IcEzQkyGvp3m49Th6OzS9axHyHi9w53cOe0R0LDwZyB5+B6d94UVnIcbzJKjyGHGu
        GdC9FAz1dZP83Msht78c8ewN3a4KIc/+MHSrEOMLDiM4Wd0m5IUewWuX6W/FAnj56BvJnQyn
        p0GZbSYfXgrn3tcS/CXHwDOPFz/EGMipzMP5sAQyjkl5dxB8t+RhPPvBic4hQo9khhGrGUas
        YxixjuF/XxMiLMiX1WmT4lltiJpNVWhVSVqdOl6xPTnJiv58poZfrsGbyNzdp3AgjEIOBBQu
        85GQtqOxUkmcKm0fq0neptElsloHmkARMl+J7UbJNikdr9rD7mTZXazmXxajRH7pWJTjoWZl
        8ZsLtq4NYeaylUsPoVB5ZFjhfFEOUzLFfLfSrWeKTZEHZT+7Ho8tKnkTRmwMmqN3GC/rbcWj
        qh+sfbd/xntRamv8mcasvWycLnLgSObb0MBZzv0x/vXJh/wVMQn2FJtzFL6i1nTKOybqU5Hm
        VtUGP8Wqg4KA4B4yhMg5s2iuK3yFYck88WYfXU605fzqCb8Oj9tZHz2jZez14LCJqem+n3en
        GO32H1ERzqje+/PldVs+9DYEtL70MnZ9vJy7rOTSxcLb1vX72msCFR21t+02iBgvb6zefeL0
        prtri8oyrh1Qp6V5tja0P4dFU0evyYiWG8JbS6ue9rr1DTdDr8gI7Q7V7Om4Rqv6DS5HY8O7
        AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRmVeSWpSXmKPExsVy+t/xe7oH37QnGDR8sLK4OPMui8XlXXPY
        LHo2bGW1mHF+H5PF4Y1nmCzWHrnLbtG24DKbxcPZVxktlm36w+TA6dFy5C2rx6ZVnWwefVtW
        MXp83iTncerrZ/YA1ig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TU
        nMyy1CJ9uwS9jJM/V7AVzOSp+LXgNmsD4zSuLkZODgkBE4m5P26zdTFycQgJLGWUuDpzOlMX
        IwdQQkpifosSRI2wxJ9rXVA17xklPuz+zAySEBYIlJh7/D4biC0iYCpx81UnE0gRs8AMJokr
        j3YxQnQ8Y5T4/PgMO0gVm4ChRO/RPkYQm1fATmLRya8sIDaLgKrE9HeXwaaKCiRLrP69mRWi
        RlDi5MwnYDWcAgkSF7/0gcWZBdQl/sy7xAxhi0vcejKfCcKWl9j+dg7zBEahWUjaZyFpmYWk
        ZRaSlgWMLKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECY3HbsZ+bdzDOe/VR7xAjEwfjIUYJ
        DmYlEV62Xa0JQrwpiZVVqUX58UWlOanFhxhNgf6ZyCwlmpwPTAZ5JfGGZgamhiZmlgamlmbG
        SuK8W+euiRcSSE8sSc1OTS1ILYLpY+LglGpgCnVbX3rEuH5abv/p6rwCDcOzb/sW7Jlp9pMj
        qcolUszcQcGlrWv9q3DN+ip180j+J8eenLyQasyrm3VB6kf2wow5IdO3p7H1sLMmMX2d439m
        x/qEuTIXmP31D2xfMCF04+onDzs2O3Wlz5228pjZ0j9HisokT9b+DL/5ye8168dNz1xuMcSZ
        T/U6ULTx/Lc/Kt03th30K3Iu5n/qvIDJomutj8D/56Ivp76yNWxa1vamNOB908bDAjJKX47f
        D3026Yvf14oFCU8OLd5pK56zvLp88mnJi5lR2542BczlUgl95+75PULj86QS5VeTG+4d3vXG
        /MHSwhNFtZIHTip4Pd70uGjnWVtR0z0iCipeh5VYijMSDbWYi4oTARj8n49OAwAA
X-CMS-MailID: 20210427105146eucas1p1d7af1a3496b71014d4307cbe66e3e2b9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210427102755eucas1p2a4dd2a52b8bebd76c6a8fac9fa17c284
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210427102755eucas1p2a4dd2a52b8bebd76c6a8fac9fa17c284
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
        <CGME20210427102755eucas1p2a4dd2a52b8bebd76c6a8fac9fa17c284@eucas1p2.samsung.com>
        <fd173b0ac00a31630bc60edaf47c2231970a87ed.1619519080.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27.04.2021 12:26, Mauro Carvalho Chehab wrote:
> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> Replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter and avoid memory
> leaks.
> 
> While here, check if the PM runtime error was caught at
> s5p_cec_adap_enable().
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/cec/platform/s5p/s5p_cec.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
> index 2a3e7ffefe0a..2250c1cbc64e 100644
> --- a/drivers/media/cec/platform/s5p/s5p_cec.c
> +++ b/drivers/media/cec/platform/s5p/s5p_cec.c
> @@ -35,10 +35,13 @@ MODULE_PARM_DESC(debug, "debug level (0-2)");
>  
>  static int s5p_cec_adap_enable(struct cec_adapter *adap, bool enable)
>  {
> +	int ret;
>  	struct s5p_cec_dev *cec = cec_get_drvdata(adap);
>  
>  	if (enable) {
> -		pm_runtime_get_sync(cec->dev);
> +		ret = pm_runtime_resume_and_get(cec->dev);
> +		if (ret < 0)
> +			return ret;
>  
>  		s5p_cec_reset(cec);

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Not related to this patch, it seems there is bug in the second
'if (enable)' branch, where pm_runtime_disable() is used
instead of pm_runtime_put(_sync)().
