Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDB413F4853
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 12:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235998AbhHWKLG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 06:11:06 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:21434 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233444AbhHWKLF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 06:11:05 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210823101021euoutp02785796274c47a6a26e8a5bd14153e31b~d57jTT-u-3031330313euoutp02Y
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 10:10:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210823101021euoutp02785796274c47a6a26e8a5bd14153e31b~d57jTT-u-3031330313euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1629713421;
        bh=cA0itXHqiYCDgaU8URgOfahdXEJJ9QK6rrh9i/8Z65M=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=BJwug3xcqCUoHbI4TxwWa5T1rXHIBVJpEinqcFvlDF7bRNvApZn+Xrh8M0zwsXCCV
         i4XHpytizrVVHZ8CE0taGEgPSdTzd4NLR5utbEUTFvVWQPf+Lvmh7FtRcqZjCNfrY/
         rGoNQ6rTRRrLcdf6ee/2ebgqtwQl7/M1aR0d+iSo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210823101020eucas1p15e8f21c1bb732c41b3337d059f841477~d57i9ZnPM1499014990eucas1p1U;
        Mon, 23 Aug 2021 10:10:20 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 60.1F.56448.C0473216; Mon, 23
        Aug 2021 11:10:20 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210823101020eucas1p279a20f312326f22d203054ff8069f1a8~d57iiJKc32542525425eucas1p2d;
        Mon, 23 Aug 2021 10:10:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210823101020eusmtrp10900369d810e949a647d7a587f939f8d~d57ihUMMf3074430744eusmtrp1I;
        Mon, 23 Aug 2021 10:10:20 +0000 (GMT)
X-AuditID: cbfec7f5-d3bff7000002dc80-59-6123740cd9f1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 26.E1.31287.C0473216; Mon, 23
        Aug 2021 11:10:20 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210823101019eusmtip2c4906cd21be2b84695c5d76c814c28d7~d57hyXQpD1026210262eusmtip2D;
        Mon, 23 Aug 2021 10:10:19 +0000 (GMT)
Subject: Re: [PATCH v2] media: camss: vfe: Don't call hw_version() before
 its dependencies are met
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     Robert Foss <robert.foss@linaro.org>, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux Kernel Functional Testing <lkft@linaro.org>
Message-ID: <e0f79e99-61b1-b98e-e7c5-0fc9c1f0b943@samsung.com>
Date:   Mon, 23 Aug 2021 12:10:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4f2e8d19-8c89-53d4-37d3-97dead170065@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7djP87o8JcqJBvv/a1qce/ybxeL0/ncs
        Fhdn3mWxmLj/LLvF5V1z2Cx6Nmxltfh6gMti2aY/TBa3PvFbfJr1kNni0JRpbA7cHjtn3WX3
        2LSqk83jzrU9bB6fN8l5nPr6mT2ANYrLJiU1J7MstUjfLoEr4/rcj4wF73grlp2bx9bA+I67
        i5GTQ0LARGL2vgb2LkYuDiGBFYwSr6dvYYNwvjBKrNqxjBHC+cwosbRvNRNMy7bPvxhBbCGB
        5UBVK1whij4ySrTuOgBWJCyQIjGzbQJYEZuAoUTX2y6wsSICK5gkbm/qZQFJMAuYSvzYvJcd
        xOYVsJP43bqHFcRmEVCVeHK4lxnEFhVIlpj4ZBIrRI2gxMmZT8B6OQXsJWZN2MoKMUdeonnr
        bGYIW1zi1pP5TCDLJAR+cEgcXPSdHeJsF4nzD+6yQdjCEq+Ob4GKy0icntzDAtHQzCjx8Nxa
        dginh1HictMMRogqa4k7534BdXMArdCUWL9LHyLsKLFs2jx2kLCEAJ/EjbeCEEfwSUzaNp0Z
        Iswr0dEmBFGtJjHr+Dq4tQcvXGKewKg0C8lrs5C8MwvJO7MQ9i5gZFnFKJ5aWpybnlpsnJda
        rlecmFtcmpeul5yfu4kRmKpO/zv+dQfjilcf9Q4xMnEwHmKU4GBWEuH9y6ScKMSbklhZlVqU
        H19UmpNafIhRmoNFSZx319Y18UIC6YklqdmpqQWpRTBZJg5OqQYmddbFfY2vtm14f7vIU0Y/
        Z/6X18emsy/ffS89rF3sh8L52T66J4ri/uk1X84oKP3xwVbN01/PfWvEvzPG/+I0NyecWnTh
        Dh/3O6NOIVe3uf7rJs9r+yt9Y1WdxETmjsczpljxTHu//M+DDo+siQJVbyayttyQrW/wOyNt
        dHdO1sp7a9nfrzNb8X2G2MlaSU6PVT0re/7onZx2olt4jrHKyVqnC6rHDpp81/Jdx/TM4epZ
        W+OYHcYdd66bhUzn0ZzHlesisIg5W1OrddaJxFevpxsW382erbnvl1azksfxHK8ui5QjP5au
        n6KxcU2Y9F7eGoUNPNP+17NsSnM09DjH+e+3Y4azmMzBOuUgpY2pSizFGYmGWsxFxYkAr7b0
        jMQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsVy+t/xe7o8JcqJBvf7BCzOPf7NYnF6/zsW
        i4sz77JYTNx/lt3i8q45bBY9G7ayWnw9wGWxbNMfJotbn/gtPs16yGxxaMo0Ngduj52z7rJ7
        bFrVyeZx59oeNo/Pm+Q8Tn39zB7AGqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5r
        ZWSqpG9nk5Kak1mWWqRvl6CXcX3uR8aCd7wVy87NY2tgfMfdxcjJISFgIrHt8y/GLkYuDiGB
        pYwSZz+dZIJIyEicnNbACmELS/y51sUGYgsJvGeUmN3I28XIwSEskCLx92okSJhNwFCi6y1I
        CReHiMAKJomtM7+wgySYBUwlfmzeyw7Re5RR4tImsDm8AnYSv1v3gM1nEVCVeHK4lxnEFhVI
        lvhweikrRI2gxMmZT1hAbE4Be4lZE7ayQsw0k5i3+SEzhC0v0bx1NpQtLnHryXymCYxCs5C0
        z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6hUn5haX5qXrJefnbmIExuW2Yz8372Cc9+qj3iFG
        Jg7GQ4wSHMxKIrx/mZQThXhTEiurUovy44tKc1KLDzGaAv0zkVlKNDkfmBjySuINzQxMDU3M
        LA1MLc2MlcR5t85dEy8kkJ5YkpqdmlqQWgTTx8TBKdXAFGtq8MIlsObTFQ2b7NypKqufKR36
        oT5X4af61a3K1zP17y1s3Onrx9d353F7y3+LdIO5m86bTmx3+Xw5PX7a3EwB8XmvFR7mXXoz
        RX3JIYbvYlHzmS7f+zuPPc56ExvrhSYnD8u527x5NF/riE3kit6pv2buNZPFVp9Mbriom2QK
        bpsWrhp/l+F+6eTd/7X/5POUfCiecniGzdwlJ42keSZWu1zr5gi7YHDBPPqdR0rHDZsqkbpi
        P86tG7Q/snonbH+2jFNKUiWyvapEP844wEIjOvHL7H1+3YXCQg1fjoXr1594+kJWPCBT8Yv6
        wRgt33pDncWXP/7q2GG/jSXM0CuoLmbnh2iPxLmqUe+UWIozEg21mIuKEwHdhozxVAMAAA==
X-CMS-MailID: 20210823101020eucas1p279a20f312326f22d203054ff8069f1a8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210812092201eucas1p1ba2165a230084f99e3a858827788cf54
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210812092201eucas1p1ba2165a230084f99e3a858827788cf54
References: <CGME20210812092201eucas1p1ba2165a230084f99e3a858827788cf54@eucas1p1.samsung.com>
        <20210812092152.726874-1-robert.foss@linaro.org>
        <4f2e8d19-8c89-53d4-37d3-97dead170065@samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12.08.2021 12:16, Marek Szyprowski wrote:
> On 12.08.2021 11:21, Robert Foss wrote:
>> vfe->ops->hw_version(vfe) is being called before vfe->base has been
>> assigned, and before the hardware has been powered up.
>>
>> Fixes: b10b5334528a9 ("media: camss: vfe: Don't read hardware version 
>> needlessly")
>>
>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

This restores old, well tested code path.

Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>

>> ---
>>   drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c 
>> b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 6b2f33fc9be2..71f78b40e7f5 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -604,6 +604,8 @@ static int vfe_get(struct vfe_device *vfe)
>>           vfe_reset_output_maps(vfe);
>>             vfe_init_outputs(vfe);
>> +
>> +        vfe->ops->hw_version(vfe);
>>       } else {
>>           ret = vfe_check_clock_rates(vfe);
>>           if (ret < 0)
>> @@ -1299,7 +1301,6 @@ int msm_vfe_subdev_init(struct camss *camss, 
>> struct vfe_device *vfe,
>>           return -EINVAL;
>>       }
>>       vfe->ops->subdev_init(dev, vfe);
>> -    vfe->ops->hw_version(vfe);
>>         /* Memory */
>
> Best regards

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

