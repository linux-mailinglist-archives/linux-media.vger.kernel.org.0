Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A3F240419
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 11:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgHJJfL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 05:35:11 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48403 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbgHJJfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 05:35:11 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200810093509euoutp0217896ef301a8c6d31897cd3cd446a90f~p3m6ecWxK0871908719euoutp02q
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2020 09:35:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200810093509euoutp0217896ef301a8c6d31897cd3cd446a90f~p3m6ecWxK0871908719euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1597052109;
        bh=edvJz2ZZ3QXBSofmUPraFKLzZ723QNG90nfRBWX41no=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=kwZcsjGJ0Nm+BDIyCWt6jmaJx6o66p65e0kUiaznpqofNPIBvy+59jXvyuwODyWLH
         lBjGRfOqFEVhoHq8ONjUs3aOF5l7Ukr1LBd9HDz1TF0ToejeyahCyJWjyRJsW4G/OA
         vhFJiHGjrXlxNLa6WOQ7VHpZvnm1/t9TjHJ9cs98=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200810093509eucas1p1f3736c98b3fd0bdd43b02fad5737c6c4~p3m6PgYHE2862028620eucas1p1i;
        Mon, 10 Aug 2020 09:35:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id F9.0F.06456.DC4113F5; Mon, 10
        Aug 2020 10:35:09 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200810093509eucas1p202a94c918063799dd0d8004b9379761d~p3m59Tjan2468324683eucas1p2R;
        Mon, 10 Aug 2020 09:35:09 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200810093508eusmtrp27fd89fb613177a3ec84c4e7831140b97~p3m58mfER0622206222eusmtrp2R;
        Mon, 10 Aug 2020 09:35:08 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-06-5f3114cddb2f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D0.C3.06314.CC4113F5; Mon, 10
        Aug 2020 10:35:08 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200810093508eusmtip10587ea053bd21f1d8d0a1ebfe62feda6~p3m5P62fI1475714757eusmtip1k;
        Mon, 10 Aug 2020 09:35:08 +0000 (GMT)
Subject: Re: [PATCH] media: exynos4-is: fix ptr_ret.cocci warnings
To:     kernel test robot <lkp@intel.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <8bd50e1a-b5ca-9add-eff5-15c7a853437d@samsung.com>
Date:   Mon, 10 Aug 2020 11:35:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200719134907.GA16381@c288844b3313>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0gUYRTtm5ndGbdm+VxNrw+KtqQyMh8VQ4aYVExEZdSvoGzLSSVf7LqW
        gWVaYW4+MELdTZNelj3WtqzshW2UpKyK5lvJfAS7ZZEmWIbm7CT575x7z73nno+PIVU2mTcT
        l5giaBM18Wq5gnr87lfjapt7UFSg6Z6SM1ntJFd/8TPB2QztiMsf/EJyTU1VNGfL/EpzlsF2
        GXehqlrGFTe9IjhH1oCcu2n5Q4TP52uMfTR/7YWd4C2V5+W8wTRF8Q+vn+LzHlUifsyyiK8f
        H6MjmX2KjdFCfFyqoF0TdlAR23+mkEy2U8dHs2rJDDRJ5iAXBvBaaH02SOcgBaPCtxAY7E1I
        Ij8RdHdlkhIZQ1DzrZ+YHXHkl8mlRgWC66d7KYn8QJAx2SwTVW44AjrulNEidsdx4OgcdopI
        fJcAR+1Dp0iOgyD3bd6MIcOwOAxqm7FYprAfjJpbnZKF+ABU17U5nVnsCu9LhigRu+BgKLlf
        6wxBYk/oHrpCSHgxPBm57Dwb8AgNr0dzSXE/4M3w2bRNSuAGjrpHtIR9YbpGnBX1WQguPO+h
        JVKA4GNdOZJUodDb+FsuLiLxSjA/WyOVN0Fz1ZRc2q+EzhFX6QYlFD4u+mfLQvY5laReBpOV
        Rf8e0RsMQ9NUAVIb5yQzzkljnJPG+N+3HFGVyFPQ6xJiBF1QonAsQKdJ0OkTYwIOJyVY0Mwn
        a5iqG32KxlsOWRFmkHoBu8InMEol06Tq0hKsCBhS7c5G2BoOqNhoTdoJQZsUpdXHCzor8mEo
        tScbctW+X4VjNCnCUUFIFrSzXYJx8c5AVzo8gm8rVrYvZfwG3hwPfUWfbNnZW+JVP96wfuKB
        a2nLh/DIs2xR9oaJO6YtR46ebKvf0b2qs1HpN5z9nbyRGrz1iTl9t29fqX57cmZX8J7QJR7m
        vdnlBcqwUwHC05B1+OXyWP/Mwt4Mr2q3eT3waUVp8XDF9K5LA/r36YSqJ8Tcp6Z0sZogf1Kr
        0/wFX0wSUGADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsVy+t/xu7pnRAzjDb7/s7SYfegls8Wpyc+Y
        LM52X2O06H/8mtni/PkN7BZnm96wW2x6fI3VomfDVlaLGef3MVm8an7EZrFs0x8mB26PnbPu
        snss3vOSyWPTqk42j+7Z/1g8Ni+p9+jbsorR4/MmOY9TXz+zB3BE6dkU5ZeWpCpk5BeX2CpF
        G1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GU8aJnEXPCSpeJT8wHmBsbfzF2M
        nBwSAiYSr/rnsXUxcnEICSxllHg8/QR7FyMHUEJKYn6LEkSNsMSfa11QNe8ZJXq/bWMBSQgL
        OElcXz2PHcQWEciUuD51IQtIEbPAGiaJjivfmCE61jJKfF3RwgRSxSZgKNF7tI8RZAOvgJ3E
        gQsCIGEWAVWJT+svs4LYogJxEo97/4NdxysgKHFy5hOwZZwCRhIz1x0AizMLqEv8mXcJyhaX
        uPVkPhOELS+x/e0c5gmMQrOQtM9C0jILScssJC0LGFlWMYqklhbnpucWG+oVJ+YWl+al6yXn
        525iBEbutmM/N+9gvLQx+BCjAAejEg9vg6xBvBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tS
        i/Lji0pzUosPMZoCPTeRWUo0OR+YVPJK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqem
        FqQWwfQxcXBKNTCKJ9ht+H1AO+um7qq8zdv8CmbJ7RH19nzpJ3Oy+19b2YqJz25+kttQKeSd
        16/2UeDUr9C6tub8yHMt544+OPNA1c4/8nLN1T/W9htZf3+2t+rKDzzTdOvNJR8O1ZKKtyHJ
        RxdsaHziEJ1rlZ7y/Yr871a9tT8c7N/OnZh74iPfHHtjxdrCbxeUWIozEg21mIuKEwF+YSeo
        8gIAAA==
X-CMS-MailID: 20200810093509eucas1p202a94c918063799dd0d8004b9379761d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200719135014eucas1p163f0baa93a13bd6e9eee1067ef9931a9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200719135014eucas1p163f0baa93a13bd6e9eee1067ef9931a9
References: <202007192158.9kUQhoax%lkp@intel.com>
        <CGME20200719135014eucas1p163f0baa93a13bd6e9eee1067ef9931a9@eucas1p1.samsung.com>
        <20200719134907.GA16381@c288844b3313>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19.07.2020 15:49, kernel test robot wrote:
> From: kernel test robot <lkp@intel.com>
> 
> drivers/media/platform/exynos4-is/media-dev.c:1273:1-3: WARNING: PTR_ERR_OR_ZERO can be used
> 
> 
>  Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
> 
> Generated by: scripts/coccinelle/api/ptr_ret.cocci
 
> Fixes: 18ffec750578 ("media: exynos4-is: Add missed check for pinctrl_lookup_state()")

The above commit is incorrect, I'm going to post a patch that
removes the "idle" pinctrl state handling code from the driver
so there is no need to apply the $subject patch.

-- 
Thanks,
Sylwester
