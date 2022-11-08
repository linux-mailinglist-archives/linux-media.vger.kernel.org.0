Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDE696215B8
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 15:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235316AbiKHOO3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 09:14:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235334AbiKHOOW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 09:14:22 -0500
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3043912627
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 06:14:20 -0800 (PST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20221108141416euoutp019328c0764673953b4209e7c5755c4c19~loYtC2eIk1433114331euoutp01G
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 14:14:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20221108141416euoutp019328c0764673953b4209e7c5755c4c19~loYtC2eIk1433114331euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1667916856;
        bh=yfRquXsgl4DPwfb4YyfvsQR+6RqICoP4tXe77OfL+SA=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=gd7foAFdn2MRlAzJU4EntzvR4afhdg/q7bS+qh+VilDJ5p91sT61U3plIRMZagiNu
         /+Cr24pEV6HsxNoHORMzhDAtx+0oU9oaTnFQEp4dAa49uRJUpijiDoKghUidrX90aK
         eyHig7W+82ckAqEDZRCFC5onxfNKO2XzgMvSP1rA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20221108141416eucas1p1d530e957493e99850c53c40cc0a4d38f~loYswJVRI2722927229eucas1p1d;
        Tue,  8 Nov 2022 14:14:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id FF.8B.09561.8346A636; Tue,  8
        Nov 2022 14:14:16 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20221108141415eucas1p2fa88f294c9b8907c0fa5d4cb6a79863e~loYschiRs2558625586eucas1p2w;
        Tue,  8 Nov 2022 14:14:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20221108141415eusmtrp23cf4ea3c9ff0bd0509452dd17cd438bd~loYsbucCC2746727467eusmtrp2d;
        Tue,  8 Nov 2022 14:14:15 +0000 (GMT)
X-AuditID: cbfec7f2-0b3ff70000002559-c9-636a643837fe
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 88.9F.08916.7346A636; Tue,  8
        Nov 2022 14:14:15 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20221108141415eusmtip16a94a1c4d182eb5e8a212095612568c1~loYr_A7T60032600326eusmtip1A;
        Tue,  8 Nov 2022 14:14:15 +0000 (GMT)
Message-ID: <fa77dbaa-e62a-b365-3b54-357e2074932f@samsung.com>
Date:   Tue, 8 Nov 2022 15:14:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
        Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] media: exynos4-is: don't rely on the v4l2_async_subdev
 internals
Content-Language: en-US
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-media@vger.kernel.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <ad5d4efb-c31f-585a-cdc5-c66744deee59@samsung.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsWy7djPc7oWKVnJBr0dnBbbDr9jtTg1+RmT
        RefEJewWPRu2slrMOL+PyeLwm3ZWizP7V7I5sHvsnHWX3WN2x0xWj8NfF7J49G1ZxejxeZOc
        x6mvn9kD2KK4bFJSczLLUov07RK4MibO7WUquMZesXr/YtYGxr1sXYycHBICJhKz/m9g7WLk
        4hASWMEo0f1uNTuE84VRonH7ZqjMZ0aJrnfdLDAtM/dNh0osZ5T4tnYfC4TzkVFiyZ12dpAq
        XgE7iX07zoHZLAIqEh8alrJAxAUlTs58AmaLCqRI7O7eBmYLC4RLHGztZAWxmQXEJW49mc8E
        MlREoJNR4sCXnYwgDjPIhbtuLwObyiZgKNH1tgvoDQ4OTgF7iXW/XSCa5SW2v53DDFIvIfCE
        Q6Jnw0pGiLtdJO5NuMwMYQtLvDq+hR3ClpH4vxNim4RAO6PEgt/3oZwJjBINz29BdVtL3Dn3
        C2wbs4CmxPpd+hBhR4muuauYQcISAnwSN94KQhzBJzFp23SoMK9ER5sQRLWaxKzj6+DWHrxw
        iXkCo9IspHCZheT/WUjemYWwdwEjyypG8dTS4tz01GLDvNRyveLE3OLSvHS95PzcTYzAlHT6
        3/FPOxjnvvqod4iRiYPxEKMEB7OSCK9ITWayEG9KYmVValF+fFFpTmrxIUZpDhYlcV62GVrJ
        QgLpiSWp2ampBalFMFkmDk6pBqbaUEa3h7qmi6b9yLyRLNuXduG1Fod6T0PGpsu8lgf5NwV7
        nmDK6K8Mvzmhdb8ED/vHJeHJ1fLrOZ//Zu+RY23kVt577/P6lRZa3D4u7w68zfpuZHTr2+0n
        DutFuhbf2hZivVU3zGjjcmYPpyzfowHC4bs9b8md2bRFdtKNJ7M+mq6ZLvU/RkvqlEOrqZvK
        JzbZy7KML3IfVnJ+Mcyw//eyNMQ/f+qhO3xr3A45LLSyexty7nvTSbbADyY/tFp3f/c/GndV
        peTEAZ2vhgX7SqL2FDoHrfv6jHVJVHDK9/8ZkU4F2w9ym3KXcM9onMu44YvPuj+FC4wKfoUp
        lucI/eK6KXDbvruP70M5+9qGVCWW4oxEQy3mouJEAJxpIrq4AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRmVeSWpSXmKPExsVy+t/xu7rmKVnJBvP7dC22HX7HanFq8jMm
        i86JS9gtejZsZbWYcX4fk8XhN+2sFmf2r2RzYPfYOesuu8fsjpmsHoe/LmTx6NuyitHj8yY5
        j1NfP7MHsEXp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp
        2yXoZUyc28tUcI29YvX+xawNjHvZuhg5OSQETCRm7pvO2sXIxSEksJRR4sTmHVAJGYmT0xpY
        IWxhiT/Xutggit4zSvSubAFL8ArYSezbcY4dxGYRUJH40LCUBSIuKHFy5hMgm4NDVCBF4tu5
        OpCwsEC4xMHWTrBWZgFxiVtP5jOB2CIC7YwSuzeygMxnFljBKNE45yDYTCGBY4wSH147gths
        AoYSXW9BjuDg4BSwl1j32wVijplE19YuRghbXmL72znMExiFZiG5YhaSdbOQtMxC0rKAkWUV
        o0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYPRtO/Zz8w7Gea8+6h1iZOJgPMQowcGsJMIrUpOZ
        LMSbklhZlVqUH19UmpNafIjRFBgUE5mlRJPzgfGfVxJvaGZgamhiZmlgamlmrCTO61nQkSgk
        kJ5YkpqdmlqQWgTTx8TBKdXAJNAcOsnnbllq7M3Qr6Wh7oXMO+xeP9puJL+nUlKvf+MOM/fb
        IpJOfnF92WzVazz2KkzUmrN7v9RX+V83DMuPxb9feubGaWGRKmV5h5BtkbXh9vXdCXO/zPqg
        sPfB7jkzVvvO5VXmfbl7adPvDVc9Pkyxf8KSfn1H3gl2A8VP+2eo2Fftc3uf+CB9k+ipaNnq
        m1W955sP3bE6NOH55FMnukMbvzSzKjhH/fJnvNpvtTTrZkKGmbG+UtKi84qPisuZP/I8Ut7R
        kvVgecAy7rkRHv8mcS5ZopDz/e4t+QNt3m0qx04+MTuRl/bTqTc4welVcvZGhsTonYeY5U4d
        edY3+6AQp1zBrpTfZ5TvLnedocRSnJFoqMVcVJwIAJpU949HAwAA
X-CMS-MailID: 20221108141415eucas1p2fa88f294c9b8907c0fa5d4cb6a79863e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220923094232eucas1p1deb3985c9637a0876609c75967175e9b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220923094232eucas1p1deb3985c9637a0876609c75967175e9b
References: <CGME20220923094232eucas1p1deb3985c9637a0876609c75967175e9b@eucas1p1.samsung.com>
        <20220923094201.18047-1-m.szyprowski@samsung.com>
        <ad5d4efb-c31f-585a-cdc5-c66744deee59@samsung.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05.10.2022 16:47, Sylwester Nawrocki wrote:
> On 23.09.2022 11:42, Marek Szyprowski wrote:
>> Commit 1f391df44607 ("media: v4l2-async: Use endpoints in
>> __v4l2_async_nf_add_fwnode_remote()") changed the data that is stored in
>> the v4l2_async_subdev internals from the fwnode pointer to the parent
>> device to the fwnode pointer to the matched endpoint. This broke the
>> sensor matching code, which relied on the particular fwnode data in the
>> v4l2_async_subdev internals. Fix this by simply matching the
>> v4l2_async_subdev pointer, which is already available there.
>>
>> Reported-by: Daniel Scally <djrscally@gmail.com>
>> Fixes: fa91f1056f17 ("[media] exynos4-is: Add support for asynchronous subdevices registration")
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Gentle ping for merging this fix.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

