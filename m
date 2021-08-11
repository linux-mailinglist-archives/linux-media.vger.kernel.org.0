Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF0A63E8B3B
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 09:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235506AbhHKHtN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 03:49:13 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:14661 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235820AbhHKHtL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 03:49:11 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210811074839euoutp02c9e1b4c8ea7abbd752e66f416e63e4f1~aMQaMe0Se2116721167euoutp02S
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 07:48:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210811074839euoutp02c9e1b4c8ea7abbd752e66f416e63e4f1~aMQaMe0Se2116721167euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1628668119;
        bh=DoS7VwqVEY7si/arzXA67QqMqLXzWuTJyXjfwQavEKI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=OO7WpvM6tl6/VKSahV9zDfPr9LFDjX4oJYiq0sFpdXYV0qarq6f0fIyVpCTQDGSr+
         I+U9bgcTTvot5iUU3GeEcCcvn+HO+zPnsqfylO3pL7vO/BcYSjDElLdwmoxYIAoQ2T
         UmeKixGdUiGifaLTLt7PUQHxiISTSHHSLFdovPxE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210811074839eucas1p1afe377176532dacb7e2c1949eb119502~aMQZ6EI_F1097010970eucas1p1P;
        Wed, 11 Aug 2021 07:48:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id A0.97.42068.6D083116; Wed, 11
        Aug 2021 08:48:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210811074838eucas1p2a0e8625af27c10209d9bcfc732254ae7~aMQZSeMAa2296622966eucas1p2I;
        Wed, 11 Aug 2021 07:48:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210811074838eusmtrp12b96e3be81292867bb2850717bde3170~aMQZRfLaE2180821808eusmtrp1V;
        Wed, 11 Aug 2021 07:48:38 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-b3-611380d6fbdb
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 47.A8.20981.6D083116; Wed, 11
        Aug 2021 08:48:38 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210811074836eusmtip1c9a534ded8f8fb98cebd51b31092192a~aMQXuLLz_1325113251eusmtip1Y;
        Wed, 11 Aug 2021 07:48:36 +0000 (GMT)
Subject: Re: [PATCH v1] media: camss: vfe: Don't use vfe->base before it's
 assigned
To:     Robert Foss <robert.foss@linaro.org>, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Kernel Functional Testing <lkft@linaro.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <0b694e24-5cc8-4944-d3a2-115306ae7b89@samsung.com>
Date:   Wed, 11 Aug 2021 09:48:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210810103336.114077-1-robert.foss@linaro.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMKsWRmVeSWpSXmKPExsWy7djP87rXG4QTDRYYWJx7/JvF4vT+dywW
        F2feZbE4NfkZk8XE/WfZLS7vmsNm0bNhK6vF1wNcFss2/WGyuPWJ3+LTrIfMFoemTGNz4PHY
        Oesuu8emVZ1sHneu7WHz+LxJzuPU18/sAaxRXDYpqTmZZalF+nYJXBkvT21gKTjCW9Hzp5Gp
        gXEqdxcjJ4eEgInEpHkrmboYuTiEBFYwSnx51QTlfGGU+D5/PRuE85lRYtLdNYxwLcu+M0Ik
        ljNKXO1YzgySEBL4yCixcIYBiC0sECpxY9EkdhBbROA0k8SOrZYgNrOAqcSPzXvB4mwChhJd
        b7vYQGxeATuJdZN3sIDYLAKqEpe3XQezRQWSJSY+mcQKUSMocXLmE7A4p4CtxM05y1khZspL
        NG+dzQxhi0vcejIf7AUJgf8cEhMvX2OGuNpF4tWL0ywQtrDEq+Nb2CFsGYnTk3tYIBqaGSUe
        nlvLDuH0MEpcbpoB9bO1xJ1zv4BO5QBaoSmxfpc+iCkh4Chx66ochMknceOtIMQNfBKTtk1n
        hgjzSnS0CUHMUJOYdXwd3NaDFy4xT2BUmoXks1lIvpmF5JtZCGsXMLKsYhRPLS3OTU8tNspL
        LdcrTswtLs1L10vOz93ECExXp/8d/7KDcfmrj3qHGJk4GA8xSnAwK4nw7pQTShTiTUmsrEot
        yo8vKs1JLT7EKM3BoiTOm7RlTbyQQHpiSWp2ampBahFMlomDU6qBKZf5Ho/ZhCNiHeoPNXsC
        5p9/fzTp5CODtJiwqIPd4Wu0PMSnb379b4WETanyhvPxteGSd+MeqNUYK57u+Kl4yOTk9rsK
        PdHM4jG/9hdphorb/ek1is/ea/esYuMdT7mzlaUnTWUOOy+4VGAyZbvB/d91ygnBT6yrRY8F
        /imYmVHTtTB+YULV34kBPKensmtactbp636TWVGmpTJnCY94mcjpbzZhu6QsvRvPTqvrFqy+
        c2X/qkzu58w3V7B96lv8ytPm+9Lefm+umVWN/DYuV1UdMtmT4ncnM+z9dSyE63FsBceuRfwH
        btlYCVS8n/x19Zb3rzQiH3Qt/s8s5ON3Vv/6/+3Mj3/+qsy0EZFWYinOSDTUYi4qTgQAKOgZ
        3cYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsVy+t/xu7rXGoQTDf79l7A49/g3i8Xp/e9Y
        LC7OvMticWryMyaLifvPsltc3jWHzaJnw1ZWi68HuCyWbfrDZHHrE7/Fp1kPmS0OTZnG5sDj
        sXPWXXaPTas62TzuXNvD5vF5k5zHqa+f2QNYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws
        9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyXp7awFJwhLei508jUwPjVO4uRk4OCQETiUnLvjN2
        MXJxCAksZZT4ffwTC0RCRuLktAZWCFtY4s+1LjaIoveMEhsm/mcDSQgLhErcWDSJHSQhInCa
        SeLZi0VgCWYBU4kfm/eyg9hCAjYST1/vB4uzCRhKdL3tArN5Bewk1k3eAbaNRUBV4vK262C2
        qECyxIfTS1khagQlTs58AhbnFLCVuDlnOSvEfDOJeZsfMkPY8hLNW2dD2eISt57MZ5rAKDQL
        SfssJC2zkLTMQtKygJFlFaNIamlxbnpusZFecWJucWleul5yfu4mRmCUbjv2c8sOxpWvPuod
        YmTiYDzEKMHBrCTCu1NOKFGINyWxsiq1KD++qDQntfgQoynQPxOZpUST84FpIq8k3tDMwNTQ
        xMzSwNTSzFhJnNfkyJp4IYH0xJLU7NTUgtQimD4mDk6pBiZ+z28zC46E/BZVj3hyNbD2g6h0
        37FVoWEsrTUW/8VF3ggUfQm7x3Pvy9Yry5beN9uSo3uXKbVq8rrYt35Hs/dciq7Z4nP3qvuk
        Oc8crk5Wbj+92OAMS3Cfa5PZcZ9jZ545hp/xmtc0uT5vU/QFbrfjU+xYuK5pFFgt18k8Y3Sa
        zeiK+OzXIkITnbh4XYrmTpu5Y1/4rPi7Xx4WPZ42YdbNCT7Gzb/e7urpjltj+uX0qqbug+E+
        Kf8dRRM0XuQyH1h88N5Lv/wdu5MZY6YauypeO/h/h7Wc+ZUzz65sEIu/t243899ba7W6ZpWJ
        yqv1BmscYnn6U8U45ui2rKcmM7aLfCxVM5p2bEtj9sWLy0yeKLEUZyQaajEXFScCAJMKzLVb
        AwAA
X-CMS-MailID: 20210811074838eucas1p2a0e8625af27c10209d9bcfc732254ae7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210811074838eucas1p2a0e8625af27c10209d9bcfc732254ae7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210811074838eucas1p2a0e8625af27c10209d9bcfc732254ae7
References: <20210810103336.114077-1-robert.foss@linaro.org>
        <CGME20210811074838eucas1p2a0e8625af27c10209d9bcfc732254ae7@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10.08.2021 12:33, Robert Foss wrote:
> vfe->ops->hw_version(vfe) being called before vfe->base has been assigned
> is incorrect and causes crashes.
>
> Fixes: b10b5334528a9 ("media: camss: vfe: Don't read hardware version needlessly")
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

With this patch applied on top of linux next-20210810 instead of the 
NULL pointer dereference I get following error on DragonBoard410c while 
loading kernel modules:

[   18.480608] qcom-venus 1d00000.video-codec: Adding to iommu group 1
[   18.536167] qcom-camss 1b0ac00.camss: Adding to iommu group 2
[   18.600373] Internal error: synchronous external abort: 96000010 [#1] 
PREEMPT SMP

> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 6b2f33fc9be22..1c8d2f0f81207 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1299,7 +1299,6 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>   		return -EINVAL;
>   	}
>   	vfe->ops->subdev_init(dev, vfe);
> -	vfe->ops->hw_version(vfe);
>   
>   	/* Memory */
>   
> @@ -1309,6 +1308,8 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>   		return PTR_ERR(vfe->base);
>   	}
>   
> +	vfe->ops->hw_version(vfe);
> +
>   	/* Interrupt */
>   
>   	r = platform_get_resource_byname(pdev, IORESOURCE_IRQ,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

