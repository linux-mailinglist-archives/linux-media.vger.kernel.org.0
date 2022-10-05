Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65CCF5F56A9
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 16:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbiJEOrV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 10:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbiJEOrU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 10:47:20 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60B47AC06
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 07:47:16 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20221005144713euoutp014f7cb75c33c3dfa03369f7228f27c9e7~bM5xBepLm3197031970euoutp01l
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 14:47:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20221005144713euoutp014f7cb75c33c3dfa03369f7228f27c9e7~bM5xBepLm3197031970euoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1664981233;
        bh=Ye039QmgqeKuxWspm7Ygf/syGxRcSRD5GgFszgogIy4=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=Ub2Kx0ePQzP8m1givdXMe0u3oljWjXAZd2HSakYSfR6H9EbzaUmztK6hmpf8wz0pH
         DmBg+UlK+z2XvJYz9wfj/iA51k6ZhVfqaZdsGpOKKlcVM98yqnWJLHqrhYx383u3AJ
         Le6cgUDhrJa3QHZf9Ras3/BHh803GX8o/0fOzzxM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20221005144713eucas1p22207e580c9f8ab4e7376c3c1ffa44d4b~bM5wrGcuF1320313203eucas1p2h;
        Wed,  5 Oct 2022 14:47:13 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 03.5D.19378.0F89D336; Wed,  5
        Oct 2022 15:47:13 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20221005144712eucas1p23aa82d3dcb0467e7ecd527fcf9d7c88c~bM5wRkuea0208402084eucas1p2r;
        Wed,  5 Oct 2022 14:47:12 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20221005144712eusmtrp14ada2635f24107e5d0660c166a719050~bM5wQZU740943109431eusmtrp1G;
        Wed,  5 Oct 2022 14:47:12 +0000 (GMT)
X-AuditID: cbfec7f5-a35ff70000014bb2-6f-633d98f0fa4f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 1E.5E.10862.0F89D336; Wed,  5
        Oct 2022 15:47:12 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20221005144711eusmtip2dca47b809cfc98e626a99ed3e81ee53b~bM5vpYQZb0038800388eusmtip2y;
        Wed,  5 Oct 2022 14:47:11 +0000 (GMT)
Message-ID: <ad5d4efb-c31f-585a-cdc5-c66744deee59@samsung.com>
Date:   Wed, 5 Oct 2022 16:47:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] media: exynos4-is: don't rely on the v4l2_async_subdev
 internals
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-media@vger.kernel.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20220923094201.18047-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7djP87ofZ9gmG2xPtdh2+B2rRefEJewW
        PRu2slrMOL+PyWLtkbvsFmf2r2RzYPPYOesuu8fsjpmsHoe/LmTx6NuyitHj8ya5ANYoLpuU
        1JzMstQifbsErozZT/YwFqxmq/i6ej5zA+Mm1i5GTg4JAROJHXc/sHQxcnEICaxglHj+5xI7
        hPOFUWLXs6+sEM5nRokfx64yw7Qc6dsDVbWcUaLvySMmkISQwEcgpz0NxOYVsJN4MusXWxcj
        BweLgIrEwl8+EGFBiZMzn7CA2KICyRI/uw6wgdjCAuESB1s7wU5iFhCXuPVkPhPIfBGBTkaJ
        6T9WQCWaGSXamnlAbDYBQ4neo32MIPM5gXYd+mkLUSIvsf3tHGaQXgmBOxwSp1YeBLtBQsBF
        4tLBFIj7hSVeHd/CDmHLSJye3MMCUT+dUWLhTZCDQJz1jBIN89YxQVRZS0zYdAJsELOApsT6
        XfoQYUeJrrmrmCHm80nceCsIcQOfxKRt06HCvBIdbUIQ1SoSv1dNhxooJdH95D/LBEalWUih
        MgvJ97OQfDMLYe8CRpZVjOKppcW56anFxnmp5XrFibnFpXnpesn5uZsYgUnn9L/jX3cwrnj1
        Ue8QIxMH4yFGCQ5mJRHewhbbZCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8bDO0koUE0hNLUrNT
        UwtSi2CyTBycUg1MeZdu/OsyNp5Tclle3SvV+uPDfesnpf//vpL36iUfyxPlykzh13nu7DTW
        Ct7Kl1ewUSicveRh/LfW7eHfVsq9DXmfGX9Obu5zA16biCVWFx5X39G5vPF7g/4FKZYsn5wr
        xlayd8TPWR2J47c2L+jbNelwz7+/TSyGTstb8yzvMQqvk2g577XyY2SqVECO9b77wcduqNk0
        sfi27TkjaqbL/Wdukay9xfcvcS8OijkseL7YrSXp2Hw+ubQn2j4VpUeqyvS/z2R3ClSvTMgT
        a2BboTJrjjKL80OpbyZ7Dp7fwnd70yGGihl83vMO31g+2STsnOs93uslaXujpwfEHtkmLLR1
        7YOE5QEFdl8nBsxUYinOSDTUYi4qTgQAe8h+rqkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xe7ofZtgmG8zsVrDYdvgdq0XnxCXs
        Fj0btrJazDi/j8li7ZG77BZn9q9kc2Dz2DnrLrvH7I6ZrB6Hvy5k8ejbsorR4/MmuQDWKD2b
        ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2M2U/2MBas
        Zqv4uno+cwPjJtYuRk4OCQETiSN9e9i7GLk4hASWMko0XlnD1sXIAZSQkpjfogRRIyzx51oX
        G0TNe0aJ3527wZp5Bewknsz6BVbPIqAisfCXD0RYUOLkzCcsILaoQLLEyz8T2UFsYYFwiYOt
        nWCtzALiEreezGcCmSki0M4osWtiCwuIwyzQzCixYf4UJohtExklTp96wwjSwiZgKNF7tI8R
        ZBsn0OZDP21BTGYBdYn184QghspLbH87h3kCo9AsJHfMQrJvFkLHLCQdCxhZVjGKpJYW56bn
        FhvpFSfmFpfmpesl5+duYgTG2bZjP7fsYFz56qPeIUYmDsZDjBIczEoivIUttslCvCmJlVWp
        RfnxRaU5qcWHGE2BQTGRWUo0OR8Y6Xkl8YZmBqaGJmaWBqaWZsZK4ryeBR2JQgLpiSWp2amp
        BalFMH1MHJxSDUw1OzdN3661r/KwzaHoRMZZN09eMFCdr6frHZEoVfViacVzd7HKJD0Lrr/s
        OeYBWwLmNTWd36QembtLrWZl61GP0tzUA7GaZq2Pq94lvzBXP5TcaSIW9uObfsr8FHZR7cda
        Xq/vznl8YUJjxvwqEb0oHmmjZUeVVeQmvH3GOa1hwq01eU+cd+ZebuD9ln/0fuKrpGMLv5hu
        tbdnrz278QtfmEP+h41Bh5/Oil7x5a9Q5YTJGtf2GkvduS7OlBJ38Lnfp/kPL/L6B96M9/Dd
        WLNNfvamGbdlhLY+iL8QHiF3ZkrgIuGVhhW/51Rvn+yycsLc11WMUR+C/pnFzygzbKyQD1yQ
        d0ZvptVqnn+TGFWVWIozEg21mIuKEwE85xrxPAMAAA==
X-CMS-MailID: 20221005144712eucas1p23aa82d3dcb0467e7ecd527fcf9d7c88c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220923094232eucas1p1deb3985c9637a0876609c75967175e9b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220923094232eucas1p1deb3985c9637a0876609c75967175e9b
References: <CGME20220923094232eucas1p1deb3985c9637a0876609c75967175e9b@eucas1p1.samsung.com>
        <20220923094201.18047-1-m.szyprowski@samsung.com>
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23.09.2022 11:42, Marek Szyprowski wrote:
> Commit 1f391df44607 ("media: v4l2-async: Use endpoints in
> __v4l2_async_nf_add_fwnode_remote()") changed the data that is stored in
> the v4l2_async_subdev internals from the fwnode pointer to the parent
> device to the fwnode pointer to the matched endpoint. This broke the
> sensor matching code, which relied on the particular fwnode data in the
> v4l2_async_subdev internals. Fix this by simply matching the
> v4l2_async_subdev pointer, which is already available there.
> 
> Reported-by: Daniel Scally <djrscally@gmail.com>
> Fixes: fa91f1056f17 ("[media] exynos4-is: Add support for asynchronous subdevices registration")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

