Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9980D2B7138
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 23:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbgKQWFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 17:05:34 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53566 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728720AbgKQWFe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 17:05:34 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201117220507euoutp02369292bd3d0625c891e8ccce46a5d81d~Ias_ucKzY1813418134euoutp02R
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 22:05:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201117220507euoutp02369292bd3d0625c891e8ccce46a5d81d~Ias_ucKzY1813418134euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605650707;
        bh=s1acGkiU17hKCSykFbk+G0PZnrQvq6K5WtZ7m735Qk4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=ls4sSV8LIT7AfkoiieKmO6dCo1nM9aiq30gjELoG17WzYc1Ee/r2goyF0VChrDfLP
         BH2/8OzFO7KKn6dm9VIIqAamCVvFVu/4N3t7OLHPyBbsktediaXFa39Jojs0X1q3IU
         +TeDfzqucy0Aqpwe85+Iynvvs3FHK9h7i7AMcj0Q=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201117220456eucas1p2d38f386cfb73eceaef043c7c1881f22e~Ias0TZXvL1657516575eucas1p27;
        Tue, 17 Nov 2020 22:04:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id EB.09.44805.80944BF5; Tue, 17
        Nov 2020 22:04:56 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201117220455eucas1p20293e57fd8be5d19ed9bccdb43475e6e~Iasz_Cp7U1656816568eucas1p2h;
        Tue, 17 Nov 2020 22:04:55 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201117220455eusmtrp2be865bee49aead0b4f8643917761cd33~Iasz9ZTr61350513505eusmtrp2Q;
        Tue, 17 Nov 2020 22:04:55 +0000 (GMT)
X-AuditID: cbfec7f4-b4fff7000000af05-f0-5fb449089c67
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 3E.9E.21957.70944BF5; Tue, 17
        Nov 2020 22:04:55 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201117220455eusmtip13a53a59ab9300e1cd452fa0bc734bc0e~IaszXe3Kw1885918859eusmtip1y;
        Tue, 17 Nov 2020 22:04:55 +0000 (GMT)
Subject: Re: [PATCH 3/4] s5p-mfc: Use display delay and display enable std
 controls
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <5d3f86a5-7fc5-bbcb-bb26-560abd364ad8@samsung.com>
Date:   Tue, 17 Nov 2020 23:04:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201109173541.10016-4-stanimir.varbanov@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djPc7ocnlviDZbvYrXYueELu8XFmXdZ
        LGaeaGe1ONv0ht1i0+NrrBYT959lt7i8aw6bRc+GrawWu77cY7NoaTvC5MDlsePuEkaPO9f2
        sHlsXlLv0bdlFaPH501yHleONLJ7nPr6mT2APYrLJiU1J7MstUjfLoErY9GptUwFlwQqjkxd
        wNLAeIK3i5GTQ0LAROL/joeMILaQwApGibb5ml2MXED2F0aJLcvvs0A4nxkljrTOYoHpWP14
        NhNEYjmjxIJjFxghnPdAzv3drCBVwgKhEtdeLwBLiAjsYJT4tHQOmMMscJ1RomXzAjaQKjYB
        Q4mut11gNq+AncSeyY3MIDaLgKrEt5YfYLaoQJLE9i3bWSFqBCVOznwCdAcHB6eAk8Sny3wg
        YWYBeYntb+cwQ9jiEreezAc7T0KgnVNi1r5JTBB3u0i8b13BCmELS7w6voUdwpaR+L8TpqGZ
        UeLhubXsEE4Po8TlphmMEFXWEnfO/WID2cwsoCmxfpc+iCkh4CixaVUWhMknceOtIMQNfBKT
        tk1nhgjzSnS0CUHMUJOYdXwd3NaDFy4xT2BUmoXksVlIvpmF5JtZCGsXMLKsYhRPLS3OTU8t
        NspLLdcrTswtLs1L10vOz93ECExap/8d/7KDcfmrj3qHGJk4GA8xSnAwK4nwuphsjBfiTUms
        rEotyo8vKs1JLT7EKM3BoiTOm7RlTbyQQHpiSWp2ampBahFMlomDU6qBKc+Sof5d/IZH9/8d
        MXSxUV51uLsz5sO2nuCj7ondr+IdmJRMSp4LH3At6sjf8vS96Lau1pijHqt5XY9kXGtmy9D4
        dv2I+wzeGgWjL6VbZld9+3SzQ2d6056ABU+nfH9/1G+T8k/WDJVd1yJ91PS97UyjJSOTrW2n
        cHgKaM2ew71G7VSiSl+wQci5yVUr+nbcdNYtO112XKY7euk95rs/9q5kveUwZ0JoWUDJxnaH
        e8JW3DaLK/YkBPssnObxWT6lgOfk4a/8Z7pS9277Mb3V+GRd5v1Ff/qO/L+376laWbZSftkZ
        n+B4g7qivvgi1xVuR6Njj/4VsOw9O2vm9FdN/7NjD3wOMDywtsfT6wanEktxRqKhFnNRcSIA
        bRToaMkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsVy+t/xu7rsnlviDV5N0bbYueELu8XFmXdZ
        LGaeaGe1ONv0ht1i0+NrrBYT959lt7i8aw6bRc+GrawWu77cY7NoaTvC5MDlsePuEkaPO9f2
        sHlsXlLv0bdlFaPH501yHleONLJ7nPr6mT2APUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jE
        Us/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY9GptUwFlwQqjkxdwNLAeIK3i5GTQ0LARGL149lM
        XYxcHEICSxklTm8+xg6RkJE4Oa2BFcIWlvhzrYsNxBYSeMsose6QJogtLBAqce31AkaQZhGB
        HYwSz7f2MYM4zAI3GSXmXZ3ECDH2LKPEnX2bwUaxCRhKdL2FGMUrYCexZ3IjM4jNIqAq8a3l
        B5gtKpAkMfP4WXaIGkGJkzOfsHQxcnBwCjhJfLrMBxJmFjCTmLf5ITOELS+x/e0cKFtc4taT
        +UwTGIVmIemehaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiM023Hfm7e
        wTjv1Ue9Q4xMHIyHGCU4mJVEeF1MNsYL8aYkVlalFuXHF5XmpBYfYjQFemcis5Rocj4wUeSV
        xBuaGZgamphZGphamhkrifNunbsmXkggPbEkNTs1tSC1CKaPiYNTqoEpsYDTpapY4sKvRfos
        N3xm/b6+38vn3bmpe+wVnTddEz8Zdi7vpKWHivaErzU3lA0OXc+b4LBwxrJfwtvbvovNTlnI
        zBO0R8wgd8Wl2db/AkznfxIR84k+a77MoeSAoqicSlDOntlryz5enHLB6PGlWZmTH/D3Pdnk
        wrBgU4nCetmD9d+9K7S297ZVm4p48Vi9ald/98T9Ru3Gdxe2X2rUeSKx+I8r+5JPAm0/t5vc
        ODpvQr+Kivv1az5xL6O65XsnrT42/yzrv42mtw8HLfxx3nn7nz9W9lqcIrc9vXx3vHA6GKK9
        98fKX9dfu7lOrr740ETme4lZ+FSpEznnpqQV+hf/sfsjFX5p2QchxvqkdCWW4oxEQy3mouJE
        AEiAzEFcAwAA
X-CMS-MailID: 20201117220455eucas1p20293e57fd8be5d19ed9bccdb43475e6e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201109173610eucas1p224a00875f3768b16661171ee1c2c27dd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201109173610eucas1p224a00875f3768b16661171ee1c2c27dd
References: <20201109173541.10016-1-stanimir.varbanov@linaro.org>
        <CGME20201109173610eucas1p224a00875f3768b16661171ee1c2c27dd@eucas1p2.samsung.com>
        <20201109173541.10016-4-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09.11.2020 18:35, Stanimir Varbanov wrote:
> Use the standard display_delay and display_delay_enable controls,
> the legacy private MFC controls are kept for backward compatibility.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/media/platform/s5p-mfc/s5p_mfc_dec.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> index 61e144a35201..4a3e8e9bbff2 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> @@ -167,6 +167,13 @@ static struct mfc_control controls[] = {
>   		.step = 1,
>   		.default_value = 0,
>   	},
> +	{
> +		.id = V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY,
> +		.type = V4L2_CTRL_TYPE_INTEGER,
> +		.minimum = 0,
> +		.maximum = 16383,
> +		.default_value = 0,
> +	},
>   	{
>   		.id = V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY_ENABLE,
>   		.type = V4L2_CTRL_TYPE_BOOLEAN,
> @@ -176,6 +183,13 @@ static struct mfc_control controls[] = {
>   		.step = 1,
>   		.default_value = 0,
>   	},
> +	{
> +		.id = V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE,
> +		.type = V4L2_CTRL_TYPE_BOOLEAN,
> +		.minimum = 0,
> +		.maximum = 1,
> +		.default_value = 0,
> +	},
>   	{
>   		.id = V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER,
>   		.type = V4L2_CTRL_TYPE_BOOLEAN,
> @@ -690,9 +704,11 @@ static int s5p_mfc_dec_s_ctrl(struct v4l2_ctrl *ctrl)
>   
>   	switch (ctrl->id) {
>   	case V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY:
> +	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY:
>   		ctx->display_delay = ctrl->val;
>   		break;
>   	case V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY_ENABLE:
> +	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE:
>   		ctx->display_delay_enable = ctrl->val;
>   		break;
>   	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

