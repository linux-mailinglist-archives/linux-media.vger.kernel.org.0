Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 340C6688FA
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 14:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730001AbfGOMhw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 08:37:52 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:57763 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728933AbfGOMhw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 08:37:52 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190715123750euoutp01a19bab46a29955e2610e55afcef220f9~xlOgu0lyI1324413244euoutp01Y
        for <linux-media@vger.kernel.org>; Mon, 15 Jul 2019 12:37:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190715123750euoutp01a19bab46a29955e2610e55afcef220f9~xlOgu0lyI1324413244euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1563194270;
        bh=sCi2C6jHNAiryBoYO1Z58xrSXApINFyFLxfg7ffsZDA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=CCbTFCxWL2jSCz8JtLEhX0n46xqumZ13057SadZqPYW9Ya6DNKfPo10xduXbd39P6
         LPFJv536MNDsXa8dkLcQ1Qta1LwU1PKFuNYf5b/ttY2caOaa6YMOOrwZm9FfkmmRgo
         iAfvhagG0FPVboRa0yxMO8wiet3JMB5zDBNZudo4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190715123750eucas1p2c52203451622dfa27608066277399006~xlOgRYSyP2806628066eucas1p2S;
        Mon, 15 Jul 2019 12:37:50 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 43.CF.04325.D937C2D5; Mon, 15
        Jul 2019 13:37:49 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190715123749eucas1p240f9d6e4ed69b28fb8b7b424a320caa5~xlOfgRkyw0907409074eucas1p2q;
        Mon, 15 Jul 2019 12:37:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190715123749eusmtrp1e037096cbe77eb9ec740510c295c8f86~xlOfSRSpG3224832248eusmtrp1C;
        Mon, 15 Jul 2019 12:37:49 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-2f-5d2c739de6dc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 9F.5F.04146.C937C2D5; Mon, 15
        Jul 2019 13:37:49 +0100 (BST)
Received: from [106.120.50.63] (unknown [106.120.50.63]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190715123748eusmtip193ad5f995208a057a185b608ddec04b5~xlOfAP3Au0714107141eusmtip1G;
        Mon, 15 Jul 2019 12:37:48 +0000 (GMT)
Subject: Re: [PATCH 4/6] s5p-cec: use cec_notifier_cec_adap_(un)register
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <88cfae9b-3722-f795-7882-e23b4447ba9b@samsung.com>
Date:   Mon, 15 Jul 2019 14:37:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190715103054.84849-5-hverkuil-cisco@xs4all.nl>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djPc7pzi3ViDc79MLRYcnwlo8XFmXdZ
        LHo2bGW1aH/6ktmBxWPBplKPTas62Tw+b5LzOPX1M3sASxSXTUpqTmZZapG+XQJXxoaHD1kK
        dolUfLzWxNrA+FCgi5GDQ0LARGLKCYcuRi4OIYEVjBLNN/ewQjhfGCWert3FAuF8ZpSYdesz
        UxcjJ1jHy8+NjBCJ5YwSnYtns0E4bxklrk3ewgxSJSzgIbFp/USwDhEge/esKewgNrNAlMSP
        AzfBatgEDCW63naxgdi8AnYSbQ93soLcxCKgKnH+njpIWFQgRmLnmx5miBJBiZMzn7CA2JxA
        5c975jNDjJSX2P52DpQtLnHryXwmkHskBLrZJToeTmGDuNpFYue0jcwQtrDEq+Nb2CFsGYnT
        k3tYIBqaGSUenlvLDuH0MEpcbprBCFFlLXH4+EWw65gFNCXW79KHBJ6jxMy2CAiTT+LGW0GI
        G/gkJm2bzgwR5pXoaBOCmKEmMev4OritBy9cYp7AqDQLyWezkHwzC8k3sxDWLmBkWcUonlpa
        nJueWmycl1quV5yYW1yal66XnJ+7iRGYVk7/O/51B+O+P0mHGAU4GJV4eB1StGOFWBPLiitz
        DzFKcDArifDafgUK8aYkVlalFuXHF5XmpBYfYpTmYFES561meBAtJJCeWJKanZpakFoEk2Xi
        4JRqYNTJEbg5a+WLmjZjrwfxzlpc7mwxLZEBC7prWOYHTDLwnORlUpmXvn96iXfQjl0x3zId
        f93K0V9xp+z8mTA7l/b1zmt2JGdFzMk++YOvfmr/LoaTah9VwiqWa/5UV34ivWl974+mPoPE
        GauaF9W5vpGKuTP/h/jiPpkpP5dWfzsr1HnG7aYypxJLcUaioRZzUXEiAJWwC9wnAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xu7pzi3ViDZ6XWSw5vpLR4uLMuywW
        PRu2slq0P33J7MDisWBTqcemVZ1sHp83yXmc+vqZPYAlSs+mKL+0JFUhI7+4xFYp2tDCSM/Q
        0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS9jw8OHLAW7RCo+XmtibWB8KNDFyMkhIWAi
        8fJzI2MXIxeHkMBSRol9Tz4yQyRkJE5Oa2CFsIUl/lzrYoMoes0o8brvKgtIQljAQ2LT+olM
        ILYIkL171hR2EJtZIEpi8rzXUA1HGSWmbdkClmATMJToegsyiZODV8BOou3hTqANHBwsAqoS
        5++pg4RFBWIk9p3Zzg5RIihxcuYTsF2cQOXPe+YzQ8w3k5i3+SGULS+x/e0cKFtc4taT+UwT
        GIVmIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiMpG3Hfm7ewXhp
        Y/AhRgEORiUeXocU7Vgh1sSy4srcQ4wSHMxKIry2X4FCvCmJlVWpRfnxRaU5qcWHGE2BfpvI
        LCWanA+M8rySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYzmqYLL
        7X/N7ow+9i9k2WqXU++O5btxLJK9o2lld1Lv1nvvxv7Itzu4Z6ncFkjNdD1gt736oX+w9JFN
        uTVHd5hMmO7z8Fpxj8/EMwt0jz2+k3fEUn/JNf1YTeaMk34F7p91ZWLPHmxWC3pdX78yaJOm
        ddrOSc/rHJc+CtzkK1wgeO1tdazUjWYlluKMREMt5qLiRACmweO2ugIAAA==
X-CMS-MailID: 20190715123749eucas1p240f9d6e4ed69b28fb8b7b424a320caa5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190715103101epcas2p1239ff37ab39f14ba228f742c849d501f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190715103101epcas2p1239ff37ab39f14ba228f742c849d501f
References: <20190715103054.84849-1-hverkuil-cisco@xs4all.nl>
        <CGME20190715103101epcas2p1239ff37ab39f14ba228f742c849d501f@epcas2p1.samsung.com>
        <20190715103054.84849-5-hverkuil-cisco@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 2019-07-15 12:30, Hans Verkuil wrote:
> Use cec_notifier_cec_adap_(un)register instead of
> cec_notifier_get, cec_notifier_put and cec_register_cec_notifier.
>
> Also enable the CEC_CAP_CONNECTOR_INFO capability.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Sylwester Nawrocki <snawrocki@kernel.org>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>   drivers/media/platform/s5p-cec/s5p_cec.c | 23 ++++++++++++++---------
>   1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/s5p-cec/s5p_cec.c b/drivers/media/platform/s5p-cec/s5p_cec.c
> index ea6231b387ed..6ddcc35b0bbd 100644
> --- a/drivers/media/platform/s5p-cec/s5p_cec.c
> +++ b/drivers/media/platform/s5p-cec/s5p_cec.c
> @@ -214,21 +214,23 @@ static int s5p_cec_probe(struct platform_device *pdev)
>   	if (IS_ERR(cec->reg))
>   		return PTR_ERR(cec->reg);
>   
> -	cec->notifier = cec_notifier_get(hdmi_dev);
> -	if (cec->notifier == NULL)
> -		return -ENOMEM;
> -
>   	cec->adap = cec_allocate_adapter(&s5p_cec_adap_ops, cec, CEC_NAME,
> -		CEC_CAP_DEFAULTS | (needs_hpd ? CEC_CAP_NEEDS_HPD : 0), 1);
> +		CEC_CAP_DEFAULTS | (needs_hpd ? CEC_CAP_NEEDS_HPD : 0) |
> +		CEC_CAP_CONNECTOR_INFO, 1);
>   	ret = PTR_ERR_OR_ZERO(cec->adap);
>   	if (ret)
>   		return ret;
>   
> -	ret = cec_register_adapter(cec->adap, &pdev->dev);
> -	if (ret)
> +	cec->notifier = cec_notifier_cec_adap_register(hdmi_dev, NULL,
> +						       cec->adap);
> +	if (!cec->notifier) {
> +		ret = -ENOMEM;
>   		goto err_delete_adapter;
> +	}
>   
> -	cec_register_cec_notifier(cec->adap, cec->notifier);
> +	ret = cec_register_adapter(cec->adap, &pdev->dev);
> +	if (ret)
> +		goto err_notifier;
>   
>   	platform_set_drvdata(pdev, cec);
>   	pm_runtime_enable(dev);
> @@ -236,6 +238,9 @@ static int s5p_cec_probe(struct platform_device *pdev)
>   	dev_dbg(dev, "successfully probed\n");
>   	return 0;
>   
> +err_notifier:
> +	cec_notifier_cec_adap_unregister(cec->notifier);
> +
>   err_delete_adapter:
>   	cec_delete_adapter(cec->adap);
>   	return ret;
> @@ -245,8 +250,8 @@ static int s5p_cec_remove(struct platform_device *pdev)
>   {
>   	struct s5p_cec_dev *cec = platform_get_drvdata(pdev);
>   
> +	cec_notifier_cec_adap_unregister(cec->notifier);
>   	cec_unregister_adapter(cec->adap);
> -	cec_notifier_put(cec->notifier);
>   	pm_runtime_disable(&pdev->dev);
>   	return 0;
>   }

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

