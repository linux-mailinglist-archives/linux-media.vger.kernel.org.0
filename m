Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D492BDE1D8
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 03:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbfJUBzn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Oct 2019 21:55:43 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:17432 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbfJUBzn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Oct 2019 21:55:43 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20191021015540epoutp02dbce9d17b62fd9426f04124b570b11dd~PhrzQnVQT2899828998epoutp02L
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2019 01:55:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20191021015540epoutp02dbce9d17b62fd9426f04124b570b11dd~PhrzQnVQT2899828998epoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1571622940;
        bh=9f5YfBTEjPcmpONPEFF6bY/gVV1cnKBlwsBlV+Kzzn0=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Zog9zJpLhZpXD0sWKCixf6ToBOKhGa6RTT7pthl1btwnZY6lIZzGOhpgmITSq7J5H
         M1SSNE38O/tz2wthf98R8KIkk+Ez4I9KuLSLFEvw0FoeCuvQiwwLe38lfHdsKo4iIS
         l2HR2nKYlzkjYQupcz+1K/YjkXDHNfJmF8ZDCSvY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20191021015540epcas1p3af8daa9c5d261287142282ef5a8fdfde~PhrzA7qFX1008110081epcas1p3q;
        Mon, 21 Oct 2019 01:55:40 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.152]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 46xKV11RLHzMqYkn; Mon, 21 Oct
        2019 01:55:37 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        EC.2D.04068.8101DAD5; Mon, 21 Oct 2019 10:55:36 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20191021015536epcas1p3d9dc18f8f4e4a98de0dc7a9a84525cd1~PhrvPCvii0786507865epcas1p34;
        Mon, 21 Oct 2019 01:55:36 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191021015536epsmtrp22321d6bf6a0e03d4caf81819380078df~PhrvNtppe1327513275epsmtrp2L;
        Mon, 21 Oct 2019 01:55:36 +0000 (GMT)
X-AuditID: b6c32a39-f5fff70000000fe4-b5-5dad1018b538
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        C6.01.04081.8101DAD5; Mon, 21 Oct 2019 10:55:36 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.222]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191021015535epsmtip1c9e6f7bc54337a8a4c9fb4ce58263324~PhrvBhKYt0176701767epsmtip1Z;
        Mon, 21 Oct 2019 01:55:35 +0000 (GMT)
From:   Seung-Woo Kim <sw0312.kim@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        s.nawrocki@samsung.com, mchehab@kernel.org, krzk@kernel.org
Cc:     sw0312.kim@samsung.com
Subject: [PATCH] media: exynos4-is: fix wrong mdev and v4l2 dev order in
 error path
Date:   Mon, 21 Oct 2019 10:58:04 +0900
Message-Id: <1571623084-2705-1-git-send-email-sw0312.kim@samsung.com>
X-Mailer: git-send-email 1.7.4.1
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRTm3cd1Ssvb1DxMsnVLqNF01znbNMvIYpDRYBUkLbvpxck+2Z2i
        mbUkypnpSiLTIrGstA9t+BmY6NAITA3MILAf9aelBaVpoUnb7qT+Pef5eM/hvEfAFY3zxYJC
        i4O2WygTgUXwur3bEmWAP9HL31cmqMbHO8JU1R1dfFX9+AuO6r5nmaPyzl7yl3U+LBPTeNpc
        mKamsw1p5jzxWm6OcaeBpvJpu4S25FnzCy0FGcQBXe7eXGWqnJSRatUOQmKhzHQGkZWtle0v
        NPn7EpJiylTkp7QUwxBJu3barUUOWmKwMo4Mgrblm2xqWyJDmZkiS0FintWcRsrlyUq/8aTR
        sOSaR7ZX60pcCzVcJ7oSWYXCBYCnQGPtMFaFIgQivBfB17nXYWzxA8HSBWdIWUAwuVjLW43U
        tQ7yWKEfwfRgPWKLeQTu+VEUcGH4dhi4t8QPCNH4eQTvxtzBOBcXQ3dLOxbAUfgR8E2NBTEP
        T4Anrj/BsBDfB6Mzy6F2Emj68DU4B+Df+dBe8SwkZEH/ijeMxVHw5WVnCIth7ls/xuIy6HH/
        DmPDlQiqL50PhRUw0FLHqUIC/0TboP15Ektvgr6l24gddC18+1nND1gAF0LlRRFr2QJ9w9cw
        lhZDQ4eOpTXQfn2CE8AiXA+fXSscN9rQ8O/9JoTa0HraxpgLaIa0Kf//Jg8KHpNU3YtGxrKH
        EC5AxBph5o3HehGfKmZKzUMIBFwiWqhLb9WLhPlU6Wnabs21F5loZggp/cu7yhXH5Fn9p2lx
        5JLKZIVCoUohU5UkScQK9zxo0YvwAspBG2naRttXcxxBuNiJbnVOH3Z+f8pd/qyVzTw8ob17
        J+bLsEx68+1sGZNTkynLmI3azUwfHNH1aCXGfk7z7qxfW4+ntDSW+0Qfj6k/FKdNoZmSuDiF
        +EwfLp1a/BQfs/Jo8Kjv6LmKR7Kn6W/mvPKux+WGSXL60ObL8ubIU9dxQ2y0u1yqH50427NR
        N0DwGANFSrl2hvoL69OGjGIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLJMWRmVeSWpSXmKPExsWy7bCSnK6EwNpYg6k9rBbnz29gt+jZsJXV
        Ysb5fUwWyzb9YbI4/KYdyJ38ks2BzWPTqk42j74tqxg9Pm+SC2CO4rJJSc3JLEst0rdL4Mr4
        3fmFseCkYEXntz7mBsZe/i5GTg4JAROJySsPsnQxcnEICexmlHh9fgUTREJKYu637YxdjBxA
        trDE4cPFEDWfGCV+X5wFVsMmoCOxf8lvVpCEiEA7o8SvrTfZQRLMQM3blq5nA7GFBYIl9k0+
        BGazCKhKrO38ywhi8wq4Spx5/YcFYpmCxIJ7b9kmMPIsYGRYxSiZWlCcm55bbFhgmJdarlec
        mFtcmpeul5yfu4kRHChamjsYLy+JP8QowMGoxMPrMH1NrBBrYllxZe4hRgkOZiUR3mDrlbFC
        vCmJlVWpRfnxRaU5qcWHGKU5WJTEeZ/mHYsUEkhPLEnNTk0tSC2CyTJxcEo1MHYdO8NwQ15z
        w7IDUYpOXEV6vySWCZ7ddlHmt+1dnmMxVxR7DXefjr72LLNmbVz3WpNFPK+23lU2n77OYE7x
        bv6mFqHnz3Kapm7NEufSvrtC7+jOI/ue7XX6dsI3PXbvnMx1d08tvnJtH4cD7yR+caZkywV2
        jrducr3dyZJgKBe5dPcfK88Gj6lKLMUZiYZazEXFiQCb6bo0EAIAAA==
X-CMS-MailID: 20191021015536epcas1p3d9dc18f8f4e4a98de0dc7a9a84525cd1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191021015536epcas1p3d9dc18f8f4e4a98de0dc7a9a84525cd1
References: <CGME20191021015536epcas1p3d9dc18f8f4e4a98de0dc7a9a84525cd1@epcas1p3.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When driver is built as module and probe during insmod is deferred
because of sensor subdevs, there is NULL pointer deference because
mdev is cleaned up and then access it from v4l2_device_unregister().
Fix the wrong mdev and v4l2 dev odder in error path of probe.

This fixes below null pointer deference:
   Unable to handle kernel NULL pointer dereference at virtual address 00000000
   pgd = ca026f68
   [00000000] *pgd=00000000
   Internal error: Oops: 5 [#1] PREEMPT SMP ARM
   [...]
   Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
   PC is at ida_free+0x7c/0x160
   LR is at xas_start+0x44/0x204
   [...]
   [<c0dafd60>] (ida_free) from [<c083c20c>] (__media_device_unregister_entity+0x18/0xc0)
   [<c083c20c>] (__media_device_unregister_entity) from [<c083c2e0>] (media_device_unregister_entity+0x2c/0x38)
   [<c083c2e0>] (media_device_unregister_entity) from [<c0843404>] (v4l2_device_release+0xd0/0x104)
   [<c0843404>] (v4l2_device_release) from [<c0632558>] (device_release+0x28/0x98)
   [<c0632558>] (device_release) from [<c0db1204>] (kobject_put+0xa4/0x208)
   [<c0db1204>] (kct_put) from [<bf00bac4>] (fimc_capture_subdev_unregistered+0x58/0x6c [s5p_fimc])
   [<bf00bac4>] (fimc_capture_subdev_unregistered [s5p_fimc]) from [<c084a1cc>] (v4l2_device_unregister_subdev+0x6c/0xa8)
   [<c084a1cc>] (v4l2_device_unregister_subdev) from [<c084a350>] (v4l2_device_unregister+0x64/0x94)
   [<c084a350>] (v4l2_device_unregister) from [<bf0101ac>] (fimc_md_probe+0x4ec/0xaf8 [s5p_fimc])
   [...]

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 drivers/media/platform/exynos4-is/media-dev.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index a838189..3685c91e6 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -1520,8 +1520,8 @@ static int fimc_md_probe(struct platform_device *pdev)
 err_clk:
 	fimc_md_put_clocks(fmd);
 err_md:
-	media_device_cleanup(&fmd->media_dev);
 	v4l2_device_unregister(&fmd->v4l2_dev);
+	media_device_cleanup(&fmd->media_dev);
 	return ret;
 }
 
-- 
1.7.4.1

