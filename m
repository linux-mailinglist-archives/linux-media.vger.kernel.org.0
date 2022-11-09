Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8117622884
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 11:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbiKIKay (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 05:30:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiKIKax (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 05:30:53 -0500
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B1C714088
        for <linux-media@vger.kernel.org>; Wed,  9 Nov 2022 02:30:48 -0800 (PST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20221109103046euoutp013cd79afbee727259caa2b61b9be93b61~l4_2C9rG81904919049euoutp01a
        for <linux-media@vger.kernel.org>; Wed,  9 Nov 2022 10:30:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20221109103046euoutp013cd79afbee727259caa2b61b9be93b61~l4_2C9rG81904919049euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1667989846;
        bh=/etd5kD9w8L90TlDqlXrxnt7UM33SVVOSuXkHYCsYRY=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=p/27teNcpdieHnGqIiNQye6RYVh1wI03lcexjMbNlBFx40qgdrnUYK6Gaz5vYOKbI
         dihwb16txyvqTpBuVvCJf2Ubu39OZH4QCZft0mKTiyHoG11S9S05jE2maiLNI3lmjc
         /oYb6UthmZ+JWtxCTIVdIjVUFaPrQZqrxcv7swGY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20221109103046eucas1p2a25b14d877f2b2aab5f8ae726df7ed8e~l4_1z5QtS2008220082eucas1p2I;
        Wed,  9 Nov 2022 10:30:46 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 29.CE.10112.5518B636; Wed,  9
        Nov 2022 10:30:45 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20221109103045eucas1p15c8385866dbbbe53df1a83a5a5faebe4~l4_1N4Lg60284602846eucas1p1G;
        Wed,  9 Nov 2022 10:30:45 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20221109103045eusmtrp2e8e5d0c896d6bca1e929174b39117cbf~l4_1NQ43R3025830258eusmtrp2I;
        Wed,  9 Nov 2022 10:30:45 +0000 (GMT)
X-AuditID: cbfec7f4-d09ff70000002780-36-636b8155ca0f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 1E.EA.08916.5518B636; Wed,  9
        Nov 2022 10:30:45 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20221109103044eusmtip2aab04283d0849c46b47cf4d795660227~l4_0xiBLR0848208482eusmtip2N;
        Wed,  9 Nov 2022 10:30:44 +0000 (GMT)
Message-ID: <3588b0c4-032c-dd8c-bfff-912ae3816f38@samsung.com>
Date:   Wed, 9 Nov 2022 11:30:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
        Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] media: exynos4-is: don't rely on the v4l2_async_subdev
 internals
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-media@vger.kernel.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <Y2tzBUXHnZmZNClM@valkosipuli.retiisi.eu>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsWy7djPc7qhjdnJBi3X1Cy2HX7HanFq8jMm
        i86JS9gtejZsZbWYcX4fk8XhN+2sFmf2r2RzYPfYOesuu8fsjpmsHoe/LmTx6NuyitHj8yY5
        j1NfP7MHsEVx2aSk5mSWpRbp2yVwZfT/XMZesJ+zYunUyywNjH/Yuxg5OCQETCR+XuDqYuTk
        EBJYwSjxbGpBFyMXkP2FUeLuswlMEM5nRomG9rVsIFUgDZ8evGSGSCxnlJi0vpMRwvnIKDH3
        1SQmkCpeATuJj83fWUBsFgEViUkrr7JAxAUlTs58AmaLCqRI7O7eBmYLC4RLHGztZAWxmQXE
        JW49mQ82R0RATeLppocsIAuYBbqZJGbufMcMkmATMJToetsFdhKngJnEy+U3oJrlJba/nQN2
        noTAEw6J03ufQd3tIjHv4AJmCFtY4tXxLewQtozE/53zmSAa2hklFvy+D+VMAPr6+S1GiCpr
        iTvnfrGBgoxZQFNi/S59iLCjRNfcVcyQkOSTuPFWEOIIPolJ26ZDhXklOtqEIKrVJGYdXwe3
        9uCFS8wTGJVmIYXLLCT/z0LyziyEvQsYWVYxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIE
        pqPT/45/2cG4/NVHvUOMTByMhxglOJiVRHi5NbKThXhTEiurUovy44tKc1KLDzFKc7AoifOy
        zdBKFhJITyxJzU5NLUgtgskycXBKNTBtS/hxZMqV0x8VAhbOjn48Zc0l40tXT5ZIx529wbcg
        Y8r7iyczcisqDdxeBvzMeGtWvt4rhTmex8NLaGHnA5YMMwaf7h0iL0r4Tj98U376cqVefrHq
        jDxpq29nXvHt7ZIzT5hyhb99/4Gj+eYfn2UluWkEqU2axtL6/s5nLv/cAxvt7Nljp//+rH8g
        NC5w4d2+dRnrBU6X/nOXuTPh7MqcmRfPZjr6fvVRWjx/y33ttblrfFqcKowP9U0wWShZqueo
        78rHXiZwMy5pn9VppifntR/63wxjmT1tPa9wsWbaLK2Ui7O8lb7eujD1w6qK+EBZ0WXX5+yT
        lm1OEmP9K3st7oniWk3py+cfTJtZc+CfEktxRqKhFnNRcSIA67rI7bYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xe7qhjdnJBsemCVpsO/yO1eLU5GdM
        Fp0Tl7Bb9GzYymox4/w+JovDb9pZLc7sX8nmwO6xc9Zddo/ZHTNZPQ5/Xcji0bdlFaPH501y
        Hqe+fmYPYIvSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3S
        t0vQy+j/uYy9YD9nxdKpl1kaGP+wdzFyckgImEh8evCSuYuRi0NIYCmjRO+di2wQCRmJk9Ma
        WCFsYYk/17rYIIreM0osu3AVrJtXwE7iY/N3FhCbRUBFYtLKqywQcUGJkzOfANkcHKICKRLf
        ztWBhIUFwiUOtnaCzWQWEJe49WQ+E4gtIqAm8XTTQxaQ+cwC3UwSe/d+YIFYtpxJYsuMF2BD
        2QQMJbredoFdxylgJvFy+Q2oSWYSXVu7GCFseYntb+cwT2AUmoXkjllIFs5C0jILScsCRpZV
        jCKppcW56bnFhnrFibnFpXnpesn5uZsYgRG47djPzTsY5736qHeIkYmD8RCjBAezkggvt0Z2
        shBvSmJlVWpRfnxRaU5q8SFGU2BgTGSWEk3OB6aAvJJ4QzMDU0MTM0sDU0szYyVxXs+CjkQh
        gfTEktTs1NSC1CKYPiYOTqkGJrW1vLumngl5trZA3lmnLpJRsXxa5Ke/Fzr335uRZbO7LKvB
        /Oz8PptrJdsX7eb9ePtz8pRE2zIJTfs7WbpmTfPEi9QkTc1nK0nPCdjpseXBgYPhL59Er8l1
        Z0oLK2BXVqta9vpwTta3cw+MCme7Bt/i0Bb8eJB5c5XbzQmP2KojszUPnzh35uCPsKcZtTW5
        T57naMj96X/GFt3nIcKdmychZvEnd67GNFYLBfGQYycO/pao9lpfEXEuvfma7F+byPBrzZdu
        bJO9Gsn/8cWEvr31l1oXmWQ2+UtPY5nrePrKB9dP69SKWTqWeBz4mvrtqbQC3x2pmfEy61c5
        1pYUzDn3T9H06m77zIV/Dp/SUGIpzkg01GIuKk4EAJcQRg9JAwAA
X-CMS-MailID: 20221109103045eucas1p15c8385866dbbbe53df1a83a5a5faebe4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220923094232eucas1p1deb3985c9637a0876609c75967175e9b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220923094232eucas1p1deb3985c9637a0876609c75967175e9b
References: <CGME20220923094232eucas1p1deb3985c9637a0876609c75967175e9b@eucas1p1.samsung.com>
        <20220923094201.18047-1-m.szyprowski@samsung.com>
        <ad5d4efb-c31f-585a-cdc5-c66744deee59@samsung.com>
        <fa77dbaa-e62a-b365-3b54-357e2074932f@samsung.com>
        <Y2tzBUXHnZmZNClM@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09.11.2022 10:29, Sakari Ailus wrote:
> On Tue, Nov 08, 2022 at 03:14:14PM +0100, Marek Szyprowski wrote:
>> On 05.10.2022 16:47, Sylwester Nawrocki wrote:
>>> On 23.09.2022 11:42, Marek Szyprowski wrote:
>>>> Commit 1f391df44607 ("media: v4l2-async: Use endpoints in
>>>> __v4l2_async_nf_add_fwnode_remote()") changed the data that is stored in
>>>> the v4l2_async_subdev internals from the fwnode pointer to the parent
>>>> device to the fwnode pointer to the matched endpoint. This broke the
>>>> sensor matching code, which relied on the particular fwnode data in the
>>>> v4l2_async_subdev internals. Fix this by simply matching the
>>>> v4l2_async_subdev pointer, which is already available there.
>>>>
>>>> Reported-by: Daniel Scally <djrscally@gmail.com>
>>>> Fixes: fa91f1056f17 ("[media] exynos4-is: Add support for asynchronous subdevices registration")
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Gentle ping for merging this fix.
> It's in my PR to Mauro:

Thanks for pointing this. I missed that. Sorry for the noise.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

