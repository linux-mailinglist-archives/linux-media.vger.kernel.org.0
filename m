Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F4536C448
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237999AbhD0KiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:38:03 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:22468 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237910AbhD0Kh4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:37:56 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210427103650euoutp02f9a31dbb0649c0c42a7cdb8f6021d7b6~5sK-9JFJv0153801538euoutp02u
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 10:36:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210427103650euoutp02f9a31dbb0649c0c42a7cdb8f6021d7b6~5sK-9JFJv0153801538euoutp02u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1619519810;
        bh=mANH7tTH04X3dFXQCSD1zcErw8cdEnMWUTeUUbO8YxY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Aj/Sa//wDo0nwPXf6ccU/WhwAxu3SoFbMvRKJgDfhomyx2pM0aFoGkMWA7QUi9/Pj
         gI7C1HgS8ADykh6b4bcoypPm09lEX235BUtkkFFkb0ZNNxS1UWdsezbRM5uQa9K4I6
         sqMSdWSTrcO35gaETyM5ZvUGZB7KG/dXxskvtdO8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210427103650eucas1p2602dd021aa402118bedbe1bed64a131b~5sK-jLjSV2393023930eucas1p2H;
        Tue, 27 Apr 2021 10:36:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 4E.71.09444.249E7806; Tue, 27
        Apr 2021 11:36:50 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210427103649eucas1p21dfd3b737fc9fe4ba1bde49f608222a4~5sK-EAuQO2212422124eucas1p2d;
        Tue, 27 Apr 2021 10:36:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210427103649eusmtrp1f2b9dfc770997354b651c2a22c2ea542~5sK-DNShy2758027580eusmtrp1Y;
        Tue, 27 Apr 2021 10:36:49 +0000 (GMT)
X-AuditID: cbfec7f4-dbdff700000024e4-a8-6087e94297ac
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 13.0F.08705.149E7806; Tue, 27
        Apr 2021 11:36:49 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210427103649eusmtip10e59d633f3dc0790f8f4f90d3a44f0f3~5sK_j47l_2953829538eusmtip1B;
        Tue, 27 Apr 2021 10:36:49 +0000 (GMT)
Subject: Re: [PATCH v3 13/79] media: s5p: fix pm_runtime_get_sync() usage
 count
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <0abb1249-fd61-4c6f-a92d-22d0120ef61d@samsung.com>
Date:   Tue, 27 Apr 2021 12:36:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <fd173b0ac00a31630bc60edaf47c2231970a87ed.1619519080.git.mchehab+huawei@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRmVeSWpSXmKPExsWy7djP87pOL9sTDHbNlbS4OPMui8XlXXPY
        LHo2bGW1mHF+H5PF4Y1nmCzaFlxms3g4+yqjxbJNf5gcODxajrxl9di0qpPN4/MmOY9TXz+z
        B7BEcdmkpOZklqUW6dslcGV8W3COpeAMd8WG212sDYwnOLsYOTkkBEwkJl69yNLFyMUhJLCC
        UWLz1HOMEM4XRonuo5+hMp8ZJZ5de88K0/Jq71WoxHJGiSu9t6FaPjJK9Kw6yQZSJSwQKDH3
        +H0wW0TAVOLmq04mEJtZ4CWjRNupNBCbTcBQouttF1gNr4CdxOttz5hBbBYBVYn5e5+B1YsK
        JEucf3yVHaJGUOLkzCcsIDanQILExS99rBAz5SW2v53DDGGLS9x6Mp8J5CAJgTscEj93b2KH
        ONtF4v3FlcwQtrDEq+NboOIyEqcn97BANDQzSjw8t5YdwulhlLjcNIMRospa4s65X0CncgCt
        0JRYv0sfIuwocfLLPWaQsIQAn8SNt4IQR/BJTNo2HSrMK9HRJgRRrSYx6/g6uLUHL1xinsCo
        NAvJa7OQvDMLyTuzEPYuYGRZxSieWlqcm55abJSXWq5XnJhbXJqXrpecn7uJEZiGTv87/mUH
        4/JXH/UOMTJxMB5ilOBgVhLhZdvVmiDEm5JYWZValB9fVJqTWnyIUZqDRUmcN2nLmnghgfTE
        ktTs1NSC1CKYLBMHp1QDk+R9xcqG9FwbOfOddQn+ng4HBdWWuvwTUFPzO738P0Oi/fMzagxT
        /fg9npvXiZevlrp7I4qBYenTn61XtnjJ1Nw585BlRdfqlXO82I9/9e+L8K+a9tstc5/Qpttv
        T31WsngZZFqy6UbLraqm++4lV9ny/990nv6qWjmfS2JaT+dfFfu1PvIRfnr53y1Emt5tTPlS
        s44vLVw42m/xpj/zXl1KFZzZeU7C/tnjWT+XNOaURkrvSr5YbsEV3VPDaPqVJ+TA/HDjBq1V
        apJbPA9d2C5WYn/oiMjB4BtvH5sWlhRw1R2qN7R/oXxoxrXAg2b3f63YF/T3j86u71M3Xk7e
        LFruVlz70rtl56aHwlxtSizFGYmGWsxFxYkA8zbd3rIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsVy+t/xu7qOL9sTDBonmFlcnHmXxeLyrjls
        Fj0btrJazDi/j8ni8MYzTBZtCy6zWTycfZXRYtmmP0wOHB4tR96yemxa1cnm8XmTnMepr5/Z
        A1ii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DK+
        LTjHUnCGu2LD7S7WBsYTnF2MnBwSAiYSr/ZeZeli5OIQEljKKDF90h5GiISMxMlpDawQtrDE
        n2tdbBBF7xklJjZtBCsSFgiUmHv8PhuILSJgKnHzVScTSBGzwEtGidUXJrFDdDxjlLjZdwNs
        FJuAoUTX2y6wDl4BO4nX254xg9gsAqoS8/c+YwKxRQWSJVb/3swKUSMocXLmExYQm1MgQeLi
        lz6wOLOAmcS8zQ+ZIWx5ie1v50DZ4hK3nsxnmsAoNAtJ+ywkLbOQtMxC0rKAkWUVo0hqaXFu
        em6xoV5xYm5xaV66XnJ+7iZGYORtO/Zz8w7Gea8+6h1iZOJgPMQowcGsJMLLtqs1QYg3JbGy
        KrUoP76oNCe1+BCjKdA/E5mlRJPzgbGfVxJvaGZgamhiZmlgamlmrCTOu3XumnghgfTEktTs
        1NSC1CKYPiYOTqkGpv2520RNry7cIyq64Up/xNfZWoKXe571zirauOf4J6mAa2r+M5hDrNwz
        DLefjd+qF7fqaBxv3MlEvk2TNM84bLb4fHiGcVAYzwZmzYv8icXFtm3/1jQ77WgM1TFWNLdp
        jn2ouvDvV/PVp/b8zGqY+9hk1fcwRvaQ4xf2W73x/fzC5G5nFsPed42H18W4dt6c+6myS31f
        C4/OfK3DiU72E4tf102oLr6llZI6P+3jU5b5yle/vHR9ozuXpSRIbe3aX+b3z7QvcTsy45x7
        t32JuDTDuvDZtep3LrNMqxO7uU6lZskxRaO8V4qT/vK3duafCG3meW7wRWji2uiFi85J60Xp
        dq0uiOZ1iXkVOuXwZyWW4oxEQy3mouJEAK4KedBFAwAA
X-CMS-MailID: 20210427103649eucas1p21dfd3b737fc9fe4ba1bde49f608222a4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210427102721eucas1p2d828bb14976b4e4ead4c014fe5fb1533
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210427102721eucas1p2d828bb14976b4e4ead4c014fe5fb1533
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
        <CGME20210427102721eucas1p2d828bb14976b4e4ead4c014fe5fb1533@eucas1p2.samsung.com>
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
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/media/cec/platform/s5p/s5p_cec.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
> index 2a3e7ffefe0a..2250c1cbc64e 100644
> --- a/drivers/media/cec/platform/s5p/s5p_cec.c
> +++ b/drivers/media/cec/platform/s5p/s5p_cec.c
> @@ -35,10 +35,13 @@ MODULE_PARM_DESC(debug, "debug level (0-2)");
>   
>   static int s5p_cec_adap_enable(struct cec_adapter *adap, bool enable)
>   {
> +	int ret;
>   	struct s5p_cec_dev *cec = cec_get_drvdata(adap);
>   
>   	if (enable) {
> -		pm_runtime_get_sync(cec->dev);
> +		ret = pm_runtime_resume_and_get(cec->dev);
> +		if (ret < 0)
> +			return ret;
>   
>   		s5p_cec_reset(cec);
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

