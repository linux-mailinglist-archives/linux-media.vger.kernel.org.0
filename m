Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23B623EA2E1
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 12:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234700AbhHLKRM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 06:17:12 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:43875 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234587AbhHLKRL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 06:17:11 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210812101644euoutp02344c44dc7dc93b42586d07c2500ea084~ah6-kLaCS2590525905euoutp02u
        for <linux-media@vger.kernel.org>; Thu, 12 Aug 2021 10:16:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210812101644euoutp02344c44dc7dc93b42586d07c2500ea084~ah6-kLaCS2590525905euoutp02u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1628763404;
        bh=aDvlDTc5Am/kM4t+3zxEGs4PSPS4JExoeer8kWPVcXQ=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=b+U+Wl7SEQSWP9L56jD69u+OrXNqzaBR3lJUx2+GCjwXsDD2vewB6AA88SL4hX6O9
         8TbcOvkoS5sMepTqNv8n45HRU9Ayls92mmVMLVXPG5EGRjebnsDfhkiVWQtYybLs/Y
         /6QyG3c/5n2jR2irjGM38pTrdmwrVhUQ3YzD1Oac=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210812101643eucas1p2602dae638bdeb05ad8913d66aeaa5a3b~ah6_VOf6m0721807218eucas1p2D;
        Thu, 12 Aug 2021 10:16:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 1E.49.56448.B05F4116; Thu, 12
        Aug 2021 11:16:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210812101642eucas1p25c06a8060377dd8da6631c93c7ccb6ce~ah69zY1Tb0181701817eucas1p2J;
        Thu, 12 Aug 2021 10:16:42 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210812101642eusmtrp12f72c6b88de41052408511a9508a30cd~ah69ygLqH2835028350eusmtrp1T;
        Thu, 12 Aug 2021 10:16:42 +0000 (GMT)
X-AuditID: cbfec7f5-d3bff7000002dc80-61-6114f50b3c09
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 66.51.31287.A05F4116; Thu, 12
        Aug 2021 11:16:42 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210812101641eusmtip248f8edcccd67a41b4d6b5b62f4283cd8~ah68_4J6h2895628956eusmtip2d;
        Thu, 12 Aug 2021 10:16:41 +0000 (GMT)
Subject: Re: [PATCH v2] media: camss: vfe: Don't call hw_version() before
 its dependencies are met
To:     Robert Foss <robert.foss@linaro.org>, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux Kernel Functional Testing <lkft@linaro.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <4f2e8d19-8c89-53d4-37d3-97dead170065@samsung.com>
Date:   Thu, 12 Aug 2021 12:16:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210812092152.726874-1-robert.foss@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsWy7djP87rcX0USDX7uFrU49/g3i8Xp/e9Y
        LC7OvMtiMXH/WXaLy7vmsFn0bNjKavH1AJfFsk1/mCxufeK3+DTrIbPFoSnT2By4PXbOusvu
        sWlVJ5vHnWt72Dw+b5LzOPX1M3sAaxSXTUpqTmZZapG+XQJXxoRrE5gK5nJXfNncxNbAuJCz
        i5GTQ0LARGLa0desXYxcHEICKxglLmxZwAjhfGGU2H1yGjuE85lR4uKCA0wwLXsWvWKCSCxn
        lDi7opMVJCEk8JFRoqUvH8QWFkiRmNk2AWyUiMAKJonbm3pZQBLMAqYSPzbvZQex2QQMJbre
        drF1MXJw8ArYSTydngYSZhFQlVj59SdYiahAssTEJ5PA5vMKCEqcnPkEbAyngK3E2/MPoEbK
        S2x/O4cZwhaXuPVkPthxEgI/OCSeXLrGDnG1i8SZ/nVQtrDEq+NboGwZidOTe1ggGpoZJR6e
        W8sO4fQwSlxumsEIUWUtcefcL7BLmQU0Jdbv0ocIO0osmzaPHSQsIcAnceOtIMQRfBKTtk1n
        hgjzSnS0CUFUq0nMOr4Obu3BC5eYJzAqzULy2iwk78xC8s4shL0LGFlWMYqnlhbnpqcWG+el
        lusVJ+YWl+al6yXn525iBCaq0/+Of93BuOLVR71DjEwcjIcYJTiYlUR4d8oJJQrxpiRWVqUW
        5ccXleakFh9ilOZgURLn3bV1TbyQQHpiSWp2ampBahFMlomDU6qBKV/Bsm3ngdW97S9q3E4J
        nGVIn9MvGpcYcsHKj0Nz6QuXLSc8P91mkF/BfDA2paDMIc3t5p+DmRI2r4XEbZ46nS+asOX9
        qeBVx5MENJZ8NShYtnHRHm/mP/k92eXz7CKunJuz7KbB7uv71oecOMUgMLN/i+Ht6/my/HOc
        ZlaVqs+ddox7od7EL5cefnwwoUJIN3jnz+6VZgkcDl4TnOO47CdPPa9x8aq5wh6Hp99XWHNF
        nC6ZknQ9/0Pk0ryEsup3WnNO+GxOe6y9tDPDov3NnJ0CVy4v7fru6VQvopybKaDy7L5zQadp
        xBrlmWvz4rwuKZb8t57Q/O2QQqm5WC/fBsHKiTZxWT7qLz8xpix7oMRSnJFoqMVcVJwIALMv
        fajDAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xe7pcX0USDea907E49/g3i8Xp/e9Y
        LC7OvMtiMXH/WXaLy7vmsFn0bNjKavH1AJfFsk1/mCxufeK3+DTrIbPFoSnT2By4PXbOusvu
        sWlVJ5vHnWt72Dw+b5LzOPX1M3sAa5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXms
        lZGpkr6dTUpqTmZZapG+XYJexoRrE5gK5nJXfNncxNbAuJCzi5GTQ0LARGLPoldMXYxcHEIC
        SxklDn/6wQiRkJE4Oa2BFcIWlvhzrYsNoug9o8SKnplACQ4OYYEUib9XI0HiIgIrmCS2zvzC
        DtLALGAq8WPzXnaIhgmMEl17X4NNYhMwlOh6CzKJg4NXwE7i6fQ0kDCLgKrEyq8/wXpFBZIl
        PpxeClbOKyAocXLmExYQm1PAVuLt+QcsEPPNJOZtfsgMYctLbH87B8oWl7j1ZD7TBEahWUja
        ZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECI3PbsZ+bdzDOe/VR7xAj
        EwfjIUYJDmYlEd6dckKJQrwpiZVVqUX58UWlOanFhxhNgf6ZyCwlmpwPTA15JfGGZgamhiZm
        lgamlmbGSuK8W+euiRcSSE8sSc1OTS1ILYLpY+LglGpg0i64+vLIu5ydLFXOeTYf7Vh6dJc/
        53UUtE54W2fn6CXdxeu3YiNbeKXsh60TvjYabhWqY9p+ONR21ZEFdT7WrIynbxSuO1nY83t1
        2+oTvkLP17C/7di4NkBIkL1ZqE0mfNX5+LKV/DNnPfXxjWy57lcbLXFmy7tnR69rb9j6aSpD
        tN+bTRW5daGtH66vvrNxdUThK8Zk1aV87xZ8vvPmjt7UZwd9UuM7v95c7cnoUJhx5pWNXMDX
        eDv/LYfs1dvavaJXXopYdtrH9c6NyVZBaxp6Z31KfH2o5B2DiEQf7/tXfHuPNiZkzpskFfiK
        VX8tm/769z6L/Q3k/1w+l8rLkpElX1Adqqn7d59/w3VPJZbijERDLeai4kQAwqJ0KFUDAAA=
X-CMS-MailID: 20210812101642eucas1p25c06a8060377dd8da6631c93c7ccb6ce
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210812092201eucas1p1ba2165a230084f99e3a858827788cf54
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210812092201eucas1p1ba2165a230084f99e3a858827788cf54
References: <CGME20210812092201eucas1p1ba2165a230084f99e3a858827788cf54@eucas1p1.samsung.com>
        <20210812092152.726874-1-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12.08.2021 11:21, Robert Foss wrote:
> vfe->ops->hw_version(vfe) is being called before vfe->base has been
> assigned, and before the hardware has been powered up.
>
> Fixes: b10b5334528a9 ("media: camss: vfe: Don't read hardware version needlessly")
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 6b2f33fc9be2..71f78b40e7f5 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -604,6 +604,8 @@ static int vfe_get(struct vfe_device *vfe)
>   		vfe_reset_output_maps(vfe);
>   
>   		vfe_init_outputs(vfe);
> +
> +		vfe->ops->hw_version(vfe);
>   	} else {
>   		ret = vfe_check_clock_rates(vfe);
>   		if (ret < 0)
> @@ -1299,7 +1301,6 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>   		return -EINVAL;
>   	}
>   	vfe->ops->subdev_init(dev, vfe);
> -	vfe->ops->hw_version(vfe);
>   
>   	/* Memory */
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

