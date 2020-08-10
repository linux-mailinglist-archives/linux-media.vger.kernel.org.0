Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9028240986
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 17:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729238AbgHJPdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 11:33:09 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39961 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729148AbgHJPdG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 11:33:06 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200810153301euoutp01ad742d128b5a220a64f16c07b4ff0a03~p8fYJSQDH1331113311euoutp01T
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2020 15:33:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200810153301euoutp01ad742d128b5a220a64f16c07b4ff0a03~p8fYJSQDH1331113311euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1597073581;
        bh=xGW/Eb8TLGr6LjioWPTb6swHWqJ0i4j0PwmnzrrwdBk=;
        h=From:To:Cc:Subject:Date:References:From;
        b=TkriTn3vTmgATouWrcg4S2R0Bji7ANOe0LxUlgs5QpGNiRKF+Xds1v1+iIY3Ls7G7
         6OlH1dpwRw99iEDhqcZehvmMHIqEN+1APlH+2EU2JvmewJdxK4uLTFVrZ0EaHn6l9R
         s4v524jG5cFkDpfBXy6BRt3hOzLzqZm6TSY6A2HQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200810153301eucas1p1514acd8de8ac631d4431bda243638f2c~p8fX1rjTU2756927569eucas1p1Z;
        Mon, 10 Aug 2020 15:33:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 13.4D.05997.DA8613F5; Mon, 10
        Aug 2020 16:33:01 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200810153301eucas1p2684476145e627ba124ba4740ef204712~p8fXYl1XF0867608676eucas1p2G;
        Mon, 10 Aug 2020 15:33:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200810153301eusmtrp2b3a126ce1cd7e02421bff081eb9eef19~p8fXX6rRk0085100851eusmtrp2L;
        Mon, 10 Aug 2020 15:33:01 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-a3-5f3168ad24a3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id BC.C2.06314.CA8613F5; Mon, 10
        Aug 2020 16:33:00 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200810153300eusmtip29723c347483cb5ac7b9a1c407d0ee3ee~p8fW3v-uZ3149731497eusmtip2T;
        Mon, 10 Aug 2020 15:33:00 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     linux-media@vger.kernel.org
Cc:     hslester96@gmail.com, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/2] media: Revert
 "media: exynos4-is: Add missed check for pinctrl_lookup_state()"
Date:   Mon, 10 Aug 2020 17:32:39 +0200
Message-Id: <20200810153240.23827-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBIsWRmVeSWpSXmKPExsWy7djPc7prMwzjDR5Ok7XYOGM9q8XsQy+Z
        Lc6f38BusenxNVaLy7vmsFn0bNjKajHj/D4mi7VH7rJbHH7TzurA6bFz1l12j02rOtk8Ni+p
        9+jbsorR4/MmuQDWKC6blNSczLLUIn27BK6MHQ+mshRM4ay4MukhUwPjU/YuRk4OCQETiZev
        GsBsIYEVjBKt99W7GLmA7C+MEguPLGWCcD4zShxdsh2u43XbOlaIxHJGiUnTJ7LBtXxbuJ4R
        pIpNwFCi92gfmC0iIC/xpPcGWBGzwHdGiZ3nfrOAJIQFUiXmv+hgBbFZBFQlnjyYDWRzcPAK
        WEt0fMmD2CYvsXrDAWaQXgmB52wSm75eZIZIuEg8PTKdBcIWlnh1fAvUeTIS/3fOZ4JoaGaU
        6Nl9mx3CmcAocf/4AkaIKmuJO+d+sYFsYxbQlFi/Sx8i7CixqPEY2BESAnwSN94KgoSZgcxJ
        26YzQ4R5JTrahCCqVSR+r5rOBGFLSXQ/+Q91jofEl7/HGSFhGisx7dMitgmMcrMQdi1gZFzF
        KJ5aWpybnlpslJdarlecmFtcmpeul5yfu4kRmB5O/zv+ZQfjrj9JhxgFOBiVeHgLrA3jhVgT
        y4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyIUZqDRUmc13jRy1ghgfTEktTs1NSC
        1CKYLBMHp1QDI/+pCcucju0p5GE4vDg8LpbJ/FPaLSvRBT/kfm+bzOy7d8W8zEvfNHj1NL9c
        8f74c8rEF2yMwtXFEqW/WbI45epnTJj9ef5ZvzMxwTffGv+87uV4Q2sjo6nDxS29kc43rjyp
        eXs3pf6YU6n6x28+Dcc/PL55dHUK66LJS08asi2cwGfXU/GJ+5cSS3FGoqEWc1FxIgA9j6I7
        CwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsVy+t/xe7prMgzjDXqvWFlsnLGe1WL2oZfM
        FufPb2C32PT4GqvF5V1z2Cx6NmxltZhxfh+Txdojd9ktDr9pZ3Xg9Ng56y67x6ZVnWwem5fU
        e/RtWcXo8XmTXABrlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpO
        Zllqkb5dgl7GjgdTWQqmcFZcmfSQqYHxKXsXIyeHhICJxOu2daxdjFwcQgJLGSWaX91k6WLk
        AEpIScxvUYKoEZb4c62LDaLmE6PE3WP/mEESbAKGEr1H+xhBbBEBeYknvTfAipgF/jNKbJx5
        gxlkkLBAssT7VxUgNSwCqhJPHsxmBQnzClhLdHzJg5gvL7F6wwHmCYw8CxgZVjGKpJYW56bn
        FhvqFSfmFpfmpesl5+duYgSG5LZjPzfvYLy0MfgQowAHoxIPb4G1YbwQa2JZcWXuIUYJDmYl
        EV6ns6fjhHhTEiurUovy44tKc1KLDzGaAu2eyCwlmpwPjJe8knhDU0NzC0tDc2NzYzMLJXHe
        DoGDMUIC6YklqdmpqQWpRTB9TBycUg2M8Twx07Z09ayJcC72twth5rh56X+re+jxFmsHpmfK
        k1uL/2wW6Xv4wlc36EO1yA4tJea48r+y3qIbmNqPCxTszrG0c59XlG7i/dMhpOns6+97D3AG
        KWlz7Jhw+tcke/6eTs3E6J2dIWfYk8Je/0ve8q7ge2xW1p5OhbTO/WuPeO6f2ZI0I0yJpTgj
        0VCLuag4EQDAswvbXwIAAA==
X-CMS-MailID: 20200810153301eucas1p2684476145e627ba124ba4740ef204712
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200810153301eucas1p2684476145e627ba124ba4740ef204712
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200810153301eucas1p2684476145e627ba124ba4740ef204712
References: <CGME20200810153301eucas1p2684476145e627ba124ba4740ef204712@eucas1p2.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "idle" pinctrl state is optional as documented in the DT binding.
The change introduced by the commit being reverted makes that pinctrl state
mandatory and breaks initialization of the whole media driver, since the
"idle" state is not specified in any mainline dts.

This reverts commit 18ffec750578f7447c288647d7282c7d12b1d969 to fix
the regression.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/media/platform/exynos4-is/media-dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 16dd660..9a57523 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -1268,11 +1268,9 @@ static int fimc_md_get_pinctrl(struct fimc_md *fmd)
 	if (IS_ERR(pctl->state_default))
 		return PTR_ERR(pctl->state_default);
 
+	/* PINCTRL_STATE_IDLE is optional */
 	pctl->state_idle = pinctrl_lookup_state(pctl->pinctrl,
 					PINCTRL_STATE_IDLE);
-	if (IS_ERR(pctl->state_idle))
-		return PTR_ERR(pctl->state_idle);
-
 	return 0;
 }
 
-- 
2.7.4

