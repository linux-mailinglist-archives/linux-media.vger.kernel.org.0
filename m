Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C939218C33
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 17:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730365AbgGHPr6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 11:47:58 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36904 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730276AbgGHPr4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 11:47:56 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200708154754euoutp0299174c615b57692a260f77de66021c04~f0Z8qI_hZ2529425294euoutp02b
        for <linux-media@vger.kernel.org>; Wed,  8 Jul 2020 15:47:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200708154754euoutp0299174c615b57692a260f77de66021c04~f0Z8qI_hZ2529425294euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594223274;
        bh=9RCC6Bq9UHVs2gWIMwAVdT5gpmR59p4oKdEH2xAR4GA=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=Aa32PbzdnuROX6RweaR2qjn1BIQUAPVn8ilaU0Vm4+CpvsUsL+6ygH1koxVbiYNWO
         y+/2bnJBSrm2m0JxfxofdBwq7b54//JDF1YmpPPI5A48mS0GN8pWH8gQ1x/EkGiYZ/
         MC8vMMHjt0qwuNz1vPe35UGiLz352c/zQ3Ijtm7c=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200708154754eucas1p26bfa70efe7e4eb04f8299fe5730c38b1~f0Z8cspZY0523105231eucas1p2H;
        Wed,  8 Jul 2020 15:47:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 90.4B.06318.AAAE50F5; Wed,  8
        Jul 2020 16:47:54 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200708154754eucas1p1c63ec4668c8b47f71bc01d0e84541fe7~f0Z8Ffuhq0164001640eucas1p1R;
        Wed,  8 Jul 2020 15:47:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200708154754eusmtrp245a45988657a0d753daf1113da217928~f0Z8E4Tzh2618426184eusmtrp2i;
        Wed,  8 Jul 2020 15:47:54 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-ba-5f05eaaaec08
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id E1.57.06017.9AAE50F5; Wed,  8
        Jul 2020 16:47:53 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200708154753eusmtip206cf2a0e8a28094d53862e9c6a0cc729~f0Z7ev9zB0661206612eusmtip2M;
        Wed,  8 Jul 2020 15:47:53 +0000 (GMT)
Subject: Re: [PATCH 08/11] media: exynos4-is: Remove inh_sensor_ctrls
To:     Jonathan Bakker <xc-racer2@live.ca>, kyungmin.park@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <6c0a40c8-cf23-241a-be75-1db1a25ef729@samsung.com>
Date:   Wed, 8 Jul 2020 17:47:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BN6PR04MB0660F4263807BBE9EF1DA26BA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEKsWRmVeSWpSXmKPExsWy7djPc7qrXrHGGzybLG7R//g1s8X58xvY
        Lc42vWG32PT4GqvF5V1z2Cx6NmxltZhxfh+TxbJNf5gsLk68y+LA6bFpVSebx+Yl9R6Lbv5g
        8ejbsorR4/MmuQDWKC6blNSczLLUIn27BK6M/0eOsxZ0MVWs/PyErYHxFmMXIyeHhICJxOr5
        m9i6GLk4hARWMEpcnLGbHSQhJPCFUeLdPnmIxGdGiWMrjjLBdCyb+pwFIrGcUaK3uQ2q/SOj
        xJXNF4Acdg5hAVeJT1IgYRGBZiaJZytmsoE0swkYSvQe7QNbzStgJ/Fk3mtmEJtFQEWi+fBn
        sBpRgTiJ9S+3M0HUCEqcnPmEBcTmFIiV2L30NFicWUBc4taT+VC2vMT2t3OYQZZJCGxjl7i9
        8RjQAg4gx0WiZwPUm8ISr45vYYewZST+7wTpBalvZpTo2X2bHcKZwChx//gCqA5riTvnfrGB
        DGIW0JRYv0sfIuwo8brpMhPEfD6JG28FIW7gk5i0bTozRJhXoqNNCKJaReL3qunQcJOS6H7y
        nwXC9pD41fWWaQKj4iwkX85C8tksJJ/NQrhhASPLKkbx1NLi3PTUYuO81HK94sTc4tK8dL3k
        /NxNjMCUdPrf8a87GPf9STrEKMDBqMTD+2ITa7wQa2JZcWXuIUYJDmYlEV6ns6fjhHhTEiur
        Uovy44tKc1KLDzFKc7AoifMaL3oZKySQnliSmp2aWpBaBJNl4uCUamBc+Wz5ocmdF8UFN4et
        vvbifkpXr7az96Vb1pFrVE9fYrCV+Wf1PfPyndXz5ojMzO1NPfuRh7OtZ3ri00TrME/XqvBP
        TIHiSoGVBfs1jU4ZtXQYHD5zVWTmN5OV8262Sp+uZXw4MVObjSP0wfaDTKbZnRNc1hjzblhk
        Xmfz//Rjm1Bprze32bYqsRRnJBpqMRcVJwIAkuKsGkUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xe7orX7HGG5zss7Hof/ya2eL8+Q3s
        Fmeb3rBbbHp8jdXi8q45bBY9G7ayWsw4v4/JYtmmP0wWFyfeZXHg9Ni0qpPNY/OSeo9FN3+w
        ePRtWcXo8XmTXABrlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpO
        Zllqkb5dgl7G/yPHWQu6mCpWfn7C1sB4i7GLkZNDQsBEYtnU5ywgtpDAUkaJRRPruxg5gOJS
        EvNblCBKhCX+XOti62LkAip5zyjReXEyUxcjO4ewgKvEJymQsIhAM5PE/+XbWCBq7jJKzP+3
        Bmw+m4ChRO/RPjCbV8BO4sm818wgNouAikTz4c9sILaoQJzE8i3z2SFqBCVOznwCdg+nQKzE
        7qWnmUBsZgF1iT/zLjFD2OISt57Mh4rLS2x/O4d5AqPgLCTts5C0zELSMgtJywJGllWMIqml
        xbnpucVGesWJucWleel6yfm5mxiBsbbt2M8tOxi73gUfYhTgYFTi4X2xiTVeiDWxrLgy9xCj
        BAezkgiv09nTcUK8KYmVValF+fFFpTmpxYcYTYGem8gsJZqcD0wDeSXxhqaG5haWhubG5sZm
        FkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGJfeSHJicEnIYyi7Iq+TLfJu5R7h/boznOfx
        Lbh4UlMo4e/vte73w00KrU0LQp6EZ8Voc1g8TOR4mLHe84odW8r+1o/hs3Z8WF7mwXr9/X0d
        v05V5XS+oDLP309PVPbN2mv3+1I4129uTbtrcUeMiyc8Zj338P7MPUcPMW/p8b2j+fHNc92g
        a0osxRmJhlrMRcWJAIYPiSzLAgAA
X-CMS-MailID: 20200708154754eucas1p1c63ec4668c8b47f71bc01d0e84541fe7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200426022744eucas1p14f30c8c515c0c3bf0bbd7e49f940c477
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200426022744eucas1p14f30c8c515c0c3bf0bbd7e49f940c477
References: <20200426022650.10355-1-xc-racer2@live.ca>
        <CGME20200426022744eucas1p14f30c8c515c0c3bf0bbd7e49f940c477@eucas1p1.samsung.com>
        <BN6PR04MB0660F4263807BBE9EF1DA26BA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26.04.2020 04:26, Jonathan Bakker wrote:
> This is a no-op as it is never set and is a remnant from non-DT days
> that can be safely removed.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
