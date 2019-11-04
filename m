Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6B5EDBD4
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 10:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbfKDJoT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 04:44:19 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:23567 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfKDJoT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 04:44:19 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20191104094414epoutp017695337547874942968e39a9896f4fa3~T7G6KML5y1937319373epoutp01v
        for <linux-media@vger.kernel.org>; Mon,  4 Nov 2019 09:44:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20191104094414epoutp017695337547874942968e39a9896f4fa3~T7G6KML5y1937319373epoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1572860654;
        bh=I33FRAuABnhzBEL6BkzZWgnreJd8Hq3wRo6aNc6KcsE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=t47Hd8/QQQJk+fQyNMXkUDPxThc1cfhGwvpRzqEx4D6BWsuiH/7S3wL9B6fpbETAO
         aXEoVX1qH1wcUkDJBXQmDJN2npyA6ccrAWgmHRWXW5JI50+LPr7+2+DjJ3IFUubCFH
         mxl1RVX4q7bcFhuJ3oWoHszJbLoOQiaKO+/2qung=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191104094413epcas1p21dbd8a6ae53dc6afdc32b1d8afa2136c~T7G5w71hd0323203232epcas1p2k;
        Mon,  4 Nov 2019 09:44:13 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.156]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4767DB07CqzMqYkV; Mon,  4 Nov
        2019 09:44:10 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        C3.6A.04224.ED2FFBD5; Mon,  4 Nov 2019 18:43:58 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191104094357epcas1p171fa65258ca760f93ade2d07082a48be~T7Gq0mD9A2878928789epcas1p1Y;
        Mon,  4 Nov 2019 09:43:57 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191104094357epsmtrp23e46ac55dcb2d1c55e3e51e49389fb98~T7Gqz7vKl2678626786epsmtrp2L;
        Mon,  4 Nov 2019 09:43:57 +0000 (GMT)
X-AuditID: b6c32a38-d5bff70000001080-d7-5dbff2deb702
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        41.E4.24756.DD2FFBD5; Mon,  4 Nov 2019 18:43:57 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.222]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191104094357epsmtip12945331407d22b43510d0f25292d3fc0~T7GqjPcUM1701817018epsmtip1J;
        Mon,  4 Nov 2019 09:43:57 +0000 (GMT)
From:   Seung-Woo Kim <sw0312.kim@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        s.nawrocki@samsung.com, mchehab@kernel.org, krzk@kernel.org
Cc:     sw0312.kim@samsung.com
Subject: [PATCH v2] media: exynos4-is: fix wrong mdev and v4l2 dev order in
 error path
Date:   Mon,  4 Nov 2019 18:46:32 +0900
Message-Id: <1572860792-4471-1-git-send-email-sw0312.kim@samsung.com>
X-Mailer: git-send-email 1.7.4.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLKsWRmVeSWpSXmKPExsWy7bCmge69T/tjDVafFLQ4f34Du0XPhq2s
        FjPO72OyWLbpD5PF4TftQO7kl2wObB6bVnWyefRtWcXo8XmTXABzVLZNRmpiSmqRQmpecn5K
        Zl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtBeJYWyxJxSoFBAYnGxkr6dTVF+
        aUmqQkZ+cYmtUmpBSk6BZYFecWJucWleul5yfq6VoYGBkSlQYUJ2xp4N59kK3olWnP63jr2B
        8aBQFyMnh4SAicT3puOsXYxcHEICOxglOn62sEA4nxglNt+/wg5SJSTwjVHi6wseuI7b/6E6
        9jJKvLyzjBHC+cIocWf/N1aQKjYBHYn9S36DVYkINDJKXD83gQUkwSwgJbFt6Xo2EFtYIELi
        9rczYCtYBFQldvb8B7N5BVwltjZ9Y4NYpyCx4N5bNpBBEgJvWSW+rukEGsQB5LhINE5lhqgR
        lnh1fAs7hC0l8fndXqjeaontE36yQ/R2MEr0tDeyQCSMJfYvncwEModZQFNi/S59iLCixM7f
        cxkh7uSTePe1hxViFa9ERxs0vFQkdh6dxAYRlpKYtSEYIuwh8fzIL2ZIYMVKrOs+wjaBUXYW
        wvwFjIyrGMVSC4pz01OLDQtMkCNpEyM4KWlZ7GDcc87nEKMAB6MSD+8Lzv2xQqyJZcWVuYcY
        JTiYlUR4L87YGyvEm5JYWZValB9fVJqTWnyI0RQYdhOZpUST84EJM68k3tDUyNjY2MLE0MzU
        0FBJnNdx+dJYIYH0xJLU7NTUgtQimD4mDk6pBsYtWhXa3EbfDs6/sUSbX7yL5eLpna92ld5I
        ZXJ0/n1qP7OY+Yewqet4C3TaU+qtFTY6u37oubnxhuav+09nvJCVubOxhWNiVrh43uZ5bze+
        sJpfbDElmGv7iVqPz59elugKeaX9/SES7zLHL7uY43WFdSfbkZl53MJr8ve3Wt3T/+fI5X/Q
        7qkSS3FGoqEWc1FxIgBBiqBJYAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDJMWRmVeSWpSXmKPExsWy7bCSnO7dT/tjDVZON7E4f34Du0XPhq2s
        FjPO72OyWLbpD5PF4TftQO7kl2wObB6bVnWyefRtWcXo8XmTXABzFJdNSmpOZllqkb5dAlfG
        ng3n2QreiVac/reOvYHxoFAXIyeHhICJxPfb/1m7GLk4hAR2M0p8+t3DDpGQkpj7bTtjFyMH
        kC0scfhwMUTNJ0aJa19nM4LUsAnoSOxf8husWUSgnVHi19abYM3MQM3blq5nA2kWFgiTmHbe
        AiTMIqAqsbPnP1gJr4CrxNamb2wQuxQkFtx7yzaBkWcBI8MqRsnUguLc9NxiwwLDvNRyveLE
        3OLSvHS95PzcTYzgMNHS3MF4eUn8IUYBDkYlHt4XnPtjhVgTy4orcw8xSnAwK4nwXpyxN1aI
        NyWxsiq1KD++qDQntfgQozQHi5I479O8Y5FCAumJJanZqakFqUUwWSYOTqkGxpQ5nmq3XZxc
        zLPNN94Wcpj8xq+Ud5NhG3+1jYegywn73a9exyz/lbHoS34eS+zvM+sKrbkbrNV7rh9QEJ6b
        MPvVF8MTwWfKF3f8jAhcziQbXmemHaMRWJhitSD4st2cc9L/5rf/5QvZEMrUflL91/XjuW1x
        x7bNlnXdVpnBsPmWaMppq2IVJZbijERDLeai4kQA3K+yig8CAAA=
X-CMS-MailID: 20191104094357epcas1p171fa65258ca760f93ade2d07082a48be
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191104094357epcas1p171fa65258ca760f93ade2d07082a48be
References: <CGME20191104094357epcas1p171fa65258ca760f93ade2d07082a48be@epcas1p1.samsung.com>
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
Change from v1
- add error handle for v4l2_device_register() as Sylwester's comment
---
 drivers/media/platform/exynos4-is/media-dev.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index a838189..9aaf3b8 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -1457,12 +1457,12 @@ static int fimc_md_probe(struct platform_device *pdev)
 	ret = v4l2_device_register(dev, &fmd->v4l2_dev);
 	if (ret < 0) {
 		v4l2_err(v4l2_dev, "Failed to register v4l2_device: %d\n", ret);
-		return ret;
+		goto err_md;
 	}
 
 	ret = fimc_md_get_clocks(fmd);
 	if (ret)
-		goto err_md;
+		goto err_v4l2dev;
 
 	ret = fimc_md_get_pinctrl(fmd);
 	if (ret < 0) {
@@ -1519,9 +1519,10 @@ static int fimc_md_probe(struct platform_device *pdev)
 	fimc_md_unregister_entities(fmd);
 err_clk:
 	fimc_md_put_clocks(fmd);
+err_v4l2dev:
+	v4l2_device_unregister(&fmd->v4l2_dev);
 err_md:
 	media_device_cleanup(&fmd->media_dev);
-	v4l2_device_unregister(&fmd->v4l2_dev);
 	return ret;
 }
 
-- 
1.7.4.1

