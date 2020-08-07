Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D73123EB62
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 12:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgHGKVX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 06:21:23 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50871 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbgHGKVW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 06:21:22 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200807102120euoutp01dc7c88206669e14038b66205c5ef4fcd~o9TYO00Iz0816808168euoutp01C
        for <linux-media@vger.kernel.org>; Fri,  7 Aug 2020 10:21:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200807102120euoutp01dc7c88206669e14038b66205c5ef4fcd~o9TYO00Iz0816808168euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1596795680;
        bh=X0ZsoWqQvvoThq5jga7Zo1jwWSEllmlTdtkyzLuIfMQ=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Is6RCFe/qNjEGTXKMNqzrb9/xTmIV0dR/UwCJNInaMwL+rkUUnTfgJC+4NTY2wVSW
         yParLRTQqz/cUp7crxGwLQp59LUwc3GDnv2ixRS6BuFEmwXiC0+ZdoW+zOuzRooG/c
         Ku/5FHJsZvGuSywpM94jfGo2LPdjHZsUAk2lWPco=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200807102120eucas1p115dd9eaa8fc4b76db601915cc9d9acfe~o9TX4MiFP1623016230eucas1p12;
        Fri,  7 Aug 2020 10:21:20 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 34.CE.06456.F1B2D2F5; Fri,  7
        Aug 2020 11:21:19 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200807102119eucas1p21c07d7e8f24ca4e7e2b28b2e8216ff28~o9TXjJczw1148811488eucas1p2C;
        Fri,  7 Aug 2020 10:21:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200807102119eusmtrp2c9ff9e397912066a2c601485875eaca9~o9TXidIeP0661206612eusmtrp2Y;
        Fri,  7 Aug 2020 10:21:19 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-ae-5f2d2b1f1b40
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 18.09.06314.F1B2D2F5; Fri,  7
        Aug 2020 11:21:19 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200807102119eusmtip11dbe245183b70fca3926b4cc7ebb8ffc~o9TXIYNpa2935329353eusmtip1f;
        Fri,  7 Aug 2020 10:21:19 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: exynos_defconfig: enable platform media drivers
Date:   Fri,  7 Aug 2020 12:21:03 +0200
Message-Id: <20200807102103.30796-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsWy7djP87ry2rrxBu9v2VhsnLGe1eL8+Q3s
        Fj0btrJazDi/j8li7ZG77BbtT18yO7B5bFrVyebRt2UVo8fnTXIBzFFcNimpOZllqUX6dglc
        GSc+XWYr+MBdsf/nVcYGxt1cXYycHBICJhKnN19j7mLk4hASWMEoMf3tBHYI5wujxOUbU6Cc
        z4wSC7e8ZYdpuT7lEhNEYjmjxLcrV9jgWt79P8cCUsUmYCjR9baLDcQWEXCSWDjrL9goZoHd
        jBK7P84BKxIWcJV4vGAP2FgWAVWJvg3rmEFsXgFbiTM3DjNBrJOXWL3hANiFEgIH2CQaL8+G
        usNFYvn862wQtrDEq+NboOIyEv93zmeCaGhmlHh4bi07hNMD9FLTDEaIKmuJO+d+AXVzAN2k
        KbF+lz5E2FHi7N+XLCBhCQE+iRtvBUHCzEDmpG3TmSHCvBIdbUIQ1WoSs46vg1t78MIlZgjb
        Q+Lb4Ydg9wsJxEpMX3uPaQKj3CyEXQsYGVcxiqeWFuempxYb5qWW6xUn5haX5qXrJefnbmIE
        xvzpf8c/7WD8einpEKMAB6MSD2/FH+14IdbEsuLK3EOMEhzMSiK8TmdPxwnxpiRWVqUW5ccX
        leakFh9ilOZgURLnNV70MlZIID2xJDU7NbUgtQgmy8TBKdXAaMrsHLUo7atxUvyja4wMwm21
        ex/o/+Rsi42seOu4d8envetfVLWKPfZtjd3qWLO5TG3jzZnM9RFdTLM/RapyNTWcCgh+LXX6
        3pRZktEHF2U49jU4eorfcGcUcSn4/+zrRZ6l5lL6H+V/HbR02LMlKvp1enVHSJmm6Nw0qaUF
        ok+MXSQln2QpsRRnJBpqMRcVJwIAUfy6HvUCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGLMWRmVeSWpSXmKPExsVy+t/xu7ry2rrxBj8mKVtsnLGe1eL8+Q3s
        Fj0btrJazDi/j8li7ZG77BbtT18yO7B5bFrVyebRt2UVo8fnTXIBzFF6NkX5pSWpChn5xSW2
        StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GSc+XWYr+MBdsf/nVcYGxt1c
        XYycHBICJhLXp1xi6mLk4hASWMoocfDmGUaIhIzEyWkNrBC2sMSfa11sILaQwCdGiebNYDVs
        AoYSXW8h4iICLhL79zxlBhnELLCXUWLh16lgzcICrhKPF+xhB7FZBFQl+jasYwaxeQVsJc7c
        OMwEsUBeYvWGA8wTGHkWMDKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECAyzbcd+bt7BeGlj
        8CFGAQ5GJR7eij/a8UKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1JrKxKLcqPLyrNSS0+xGgKtHwi
        s5Rocj4wBvJK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTBOOXXT
        qO7EdklxHcY5q86HiETLsLS8YGC1dwia1/Jxkv+tGZGbnpvq3uRc4L784qmJnKZJl3S5ls5v
        Ot3fzCT7XuWKSaMNu3/4iau5YjfPW2/++4KX5dnsV2I5J289n338TPXvKxP5v13SObnspd2O
        tjbVyyHSvUt/vKjSXcqnbq909MuGbXmlSizFGYmGWsxFxYkA4WcgxkkCAAA=
X-CMS-MailID: 20200807102119eucas1p21c07d7e8f24ca4e7e2b28b2e8216ff28
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200807102119eucas1p21c07d7e8f24ca4e7e2b28b2e8216ff28
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200807102119eucas1p21c07d7e8f24ca4e7e2b28b2e8216ff28
References: <CGME20200807102119eucas1p21c07d7e8f24ca4e7e2b28b2e8216ff28@eucas1p2.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 06b93644f4d1 ("media: Kconfig: add an option to filter in/out
platform drivers") introduced a dependency of all platform media drivers
on the new CONFIG_MEDIA_PLATFORM_SUPPORT symbol, so add it also to
exynos_defconfig. While touching this part, update the media related
configs to the current layout.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 6e8b5ff0859c..cf82c9d23a08 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -191,11 +191,14 @@ CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_S5M8767=y
 CONFIG_REGULATOR_TPS65090=y
 CONFIG_REGULATOR_WM8994=y
+CONFIG_MEDIA_CEC_SUPPORT=y
+CONFIG_CEC_SAMSUNG_S5P=m
 CONFIG_MEDIA_SUPPORT=m
+# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
 CONFIG_MEDIA_CAMERA_SUPPORT=y
-CONFIG_MEDIA_CEC_SUPPORT=y
 CONFIG_MEDIA_CONTROLLER=y
 CONFIG_VIDEO_V4L2_SUBDEV_API=y
+CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
@@ -210,9 +213,6 @@ CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_V4L_TEST_DRIVERS=y
 CONFIG_VIDEO_VIVID=m
-CONFIG_CEC_PLATFORM_DRIVERS=y
-CONFIG_CEC_SAMSUNG_S5P=m
-# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
 CONFIG_VIDEO_S5K6A3=m
 CONFIG_VIDEO_S5C73M3=m
 CONFIG_DRM=y
-- 
2.17.1

