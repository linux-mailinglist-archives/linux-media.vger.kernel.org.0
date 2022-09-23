Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B43F15E777E
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 11:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbiIWJn1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Sep 2022 05:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbiIWJm5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Sep 2022 05:42:57 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38657EE669
        for <linux-media@vger.kernel.org>; Fri, 23 Sep 2022 02:42:35 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20220923094233euoutp01596416caa021a71d12e1267a0e7e61c1~XdAVk8FVR2365623656euoutp01M
        for <linux-media@vger.kernel.org>; Fri, 23 Sep 2022 09:42:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20220923094233euoutp01596416caa021a71d12e1267a0e7e61c1~XdAVk8FVR2365623656euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1663926153;
        bh=3N/10Z3eYKa4uqUpmb2xmKRNSg6VSTYifd8bIQi9eew=;
        h=From:To:Cc:Subject:Date:References:From;
        b=ZBHQdoXApxt6MSU+moFpFzKOQPnhc5C5ysh67TmEB+qAEa/PVNZEO7xTv+/vBET3A
         /jY+0O+kBB/38pgVQU/odLyXq7JZmhoSQ6EooUkScgTlcRiBfZaUIbJdRiZltsVdCs
         PEGeLcpnjn/NK7aLxsqLMi+kz6tY5MaAVxOCvcY0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20220923094233eucas1p12d158b8fe9f94a507479071895ed5465~XdAU_axMQ0230902309eucas1p1M;
        Fri, 23 Sep 2022 09:42:33 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 8A.09.19378.98F7D236; Fri, 23
        Sep 2022 10:42:33 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20220923094232eucas1p1deb3985c9637a0876609c75967175e9b~XdAUj3bcK3070430704eucas1p1A;
        Fri, 23 Sep 2022 09:42:32 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220923094232eusmtrp2e3614e1a98beb959b984a7579ca68817~XdAUjN1rJ2354823548eusmtrp2s;
        Fri, 23 Sep 2022 09:42:32 +0000 (GMT)
X-AuditID: cbfec7f5-a4dff70000014bb2-58-632d7f893357
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id AF.7F.07473.88F7D236; Fri, 23
        Sep 2022 10:42:32 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220923094232eusmtip2025fc5ded37ac99d53a56e04e2ab8dda~XdAUHF7Zn0306903069eusmtip2M;
        Fri, 23 Sep 2022 09:42:32 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] media: exynos4-is: don't rely on the v4l2_async_subdev
 internals
Date:   Fri, 23 Sep 2022 11:42:01 +0200
Message-Id: <20220923094201.18047-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsWy7djPc7qd9brJBh+msFpsO/yO1aJz4hJ2
        i54NW1ktZpzfx2Sx9shddovDb9pZLc7sX8nmwO6xc9Zddo/ZHTNZPQ5/Xcji0bdlFaPH501y
        AaxRXDYpqTmZZalF+nYJXBknOl6yFDzmrli5u7qBsYOri5GTQ0LARGLb4afMXYxcHEICKxgl
        lrVdYIRwvjBK3DpxjgXC+cwocaeziwWmZWLzalaIxHJGiX/f/rEgtKxqZAKpYhMwlOh628UG
        YosIREk83HKFGcRmFrjPKPHitCqILSwQLPH92XZ2EJtFQFXifFcT0G4ODl4BW4lbGwUhlslL
        rN5wAOw+CYG/7BKLNv1ihki4SGx6eIoNwhaWeHV8CzuELSPxf+d8JoiGdkaJBb/vQzkTGCUa
        nt9ihKiylrhz7hcbyDZmAU2J9bv0IcKOEl1zVzGDhCUE+CRuvBWEuJlPYtK26VBhXomONiGI
        ajWJWcfXwa09eOES1GkeEue7v4OdJiQQK3Gscx7bBEa5WQi7FjAyrmIUTy0tzk1PLTbOSy3X
        K07MLS7NS9dLzs/dxAhMBaf/Hf+6g3HFq496hxiZOBgPMUpwMCuJ8M6+o5ksxJuSWFmVWpQf
        X1Sak1p8iFGag0VJnJdthlaykEB6YklqdmpqQWoRTJaJg1OqgWm1pIm96b5pblPVencs23Uo
        c0rOhUM7uBUXugeGBDUvfnsqjuvBIS6v6UxGjVLr/WekrxDed6Bp9d6arZeWz6yfXH9m9vL+
        onNPq3bmvDwve3ZzcNTkmRXajBNfL3VIf5NatpzVS/3kB7kmr+vGE3ZeZajjY1n7PsrGLkph
        H7/DV/XFUoV5k2NqNc+qvdtc7FblmiY7i6//7a2+CKmZ+wqmtB/NDVM18vusUPb70KFld76s
        DNT4eDVZIavDWMSq25b/kuH3ryH80xjE2CNLVUw8F13Z9Pjrz6n73ZOvqXEwBfDyHF1wjnmm
        6sv2fF/v9weaXB95v5E8PYft0/8ovucSe7p/XX+VN6/56yZ/ZyUlluKMREMt5qLiRADwfl7a
        dAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKLMWRmVeSWpSXmKPExsVy+t/xe7od9brJBl9va1psO/yO1aJz4hJ2
        i54NW1ktZpzfx2Sx9shddovDb9pZLc7sX8nmwO6xc9Zddo/ZHTNZPQ5/Xcji0bdlFaPH501y
        AaxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehkn
        Ol6yFDzmrli5u7qBsYOri5GTQ0LARGJi82pWEFtIYCmjRMezGoi4jMTJaQ2sELawxJ9rXWxd
        jFxANZ8YJZ6f38sMkmATMJToeguS4OAQEYiSWPjQCKSGWeAxo8T3WV3sIDXCAoESc1a8YgKx
        WQRUJc53NTGC1PMK2Erc2igIMV9eYvWGA8wTGHkWMDKsYhRJLS3OTc8tNtQrTswtLs1L10vO
        z93ECAy/bcd+bt7BOO/VR71DjEwcjIcYJTiYlUR4Z9/RTBbiTUmsrEotyo8vKs1JLT7EaAq0
        biKzlGhyPjAC8kriDc0MTA1NzCwNTC3NjJXEeT0LOhKFBNITS1KzU1MLUotg+pg4OKUamCYc
        iN5d/vXADb/pb4InSL88wSF38uT9Sx0JvgXP+Z7wys5y2zdZxabyfXXg22/hmZ/MpfJzTuos
        bdv7S3zZ30bL1HIBjzitY+Jmt1vP3deKbF//IkZDfnuiS55lxpN2lZY3icofai6Fh79aeunl
        EutGnejWe8duSvapdDZeulHv0JoiceK7boHic8M/v12FTyv37pFOO1FXwWDvry187a2NnM6x
        pefqGou1v1dWOX/U/CPazL93M+eD3Qvm+1feVlxpff7ku+XHTmR1iB71Xv74zHKfCyc2tzu2
        JrQ/FVEXWsIVu89PYZ3P9wkJuTH+Sj3vMuZlxRTdMg5cKnysvXm38AKP1I8bs4OZt3hIKLEU
        ZyQaajEXFScCAHN+rTnIAgAA
X-CMS-MailID: 20220923094232eucas1p1deb3985c9637a0876609c75967175e9b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220923094232eucas1p1deb3985c9637a0876609c75967175e9b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220923094232eucas1p1deb3985c9637a0876609c75967175e9b
References: <CGME20220923094232eucas1p1deb3985c9637a0876609c75967175e9b@eucas1p1.samsung.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 1f391df44607 ("media: v4l2-async: Use endpoints in
__v4l2_async_nf_add_fwnode_remote()") changed the data that is stored in
the v4l2_async_subdev internals from the fwnode pointer to the parent
device to the fwnode pointer to the matched endpoint. This broke the
sensor matching code, which relied on the particular fwnode data in the
v4l2_async_subdev internals. Fix this by simply matching the
v4l2_async_subdev pointer, which is already available there.

Reported-by: Daniel Scally <djrscally@gmail.com>
Fixes: fa91f1056f17 ("[media] exynos4-is: Add support for asynchronous subdevices registration")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/samsung/exynos4-is/media-dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index 52b43ea04030..412213b0c384 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -1380,9 +1380,7 @@ static int subdev_notifier_bound(struct v4l2_async_notifier *notifier,
 
 	/* Find platform data for this sensor subdev */
 	for (i = 0; i < ARRAY_SIZE(fmd->sensor); i++)
-		if (fmd->sensor[i].asd &&
-		    fmd->sensor[i].asd->match.fwnode ==
-		    of_fwnode_handle(subdev->dev->of_node))
+		if (fmd->sensor[i].asd == asd)
 			si = &fmd->sensor[i];
 
 	if (si == NULL)
-- 
2.17.1

