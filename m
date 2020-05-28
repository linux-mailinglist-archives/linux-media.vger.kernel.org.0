Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC03D1E632A
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 16:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390800AbgE1ODl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 10:03:41 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39505 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390779AbgE1ODj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 10:03:39 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200528140337euoutp01a9c70f596783d4c5cc5e1dbade4f8792~TNiMjSazt2909329093euoutp01-
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 14:03:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200528140337euoutp01a9c70f596783d4c5cc5e1dbade4f8792~TNiMjSazt2909329093euoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1590674617;
        bh=BoBpzWtQk0bQcFWn1Zb2vxzp/8/yk26E0UGKv9aCJSo=;
        h=From:To:Cc:Subject:Date:References:From;
        b=XecfCbPHF5bLQNxvT6fZyIUa+UszSUKVUIXwvi/J5NwPW5oHsuuuYzF7aVIxgHC9+
         y6h4VzR0akHuJa0Y0nFlK+cdnvn4HNShF+GqUqN20cd9qKbTfXqVhJQJbCajRRwggi
         n2tSsJ1DCNhMAsacYelPdgAuercBy6N49WmFX4bQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200528140337eucas1p19cd023d3486e172d7496c49f21dd7f0e~TNiMPY7tb1292012920eucas1p1K;
        Thu, 28 May 2020 14:03:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 1E.6F.60679.9B4CFCE5; Thu, 28
        May 2020 15:03:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200528140337eucas1p2499a623f10d9bedf568f3a9bf55320f7~TNiL7ONs93205532055eucas1p2a;
        Thu, 28 May 2020 14:03:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200528140337eusmtrp1ba85f890c39986f4c037b6f1d4bdcf79~TNiL6k3I40180301803eusmtrp1m;
        Thu, 28 May 2020 14:03:37 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-53-5ecfc4b929a2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 51.C1.07950.9B4CFCE5; Thu, 28
        May 2020 15:03:37 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200528140336eusmtip2fdcb6bfbd262b20784ff45201ae2a627~TNiLfEGfU2018020180eusmtip2k;
        Thu, 28 May 2020 14:03:36 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH] media: s5p-mfc: Properly handle dma_parms for the allocated
 devices
Date:   Thu, 28 May 2020 16:03:26 +0200
Message-Id: <20200528140326.5215-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsWy7djPc7o7j5yPM5jZq2hxa905VoueDVtZ
        LWac38dksfbIXXaLw2/aWS3Wz7/FZnF8bbgDu8eda3vYPPq2rGL0OH5jO5PH501yASxRXDYp
        qTmZZalF+nYJXBlHDzxnKvjAUzH17Eb2BsYvXF2MnBwSAiYSPyZtYgaxhQRWMErMe+DXxcgF
        ZH9hlJjbuJoNwvnMKHHi7HMmmI6vf6ewQiSWM0o0zH/DDNeybv4RVpAqNgFDia63XWwgtoiA
        k8TCWX/ZQYqYBS4zSlzf94wdJCEsECbx4/QcFhCbRUBV4taTT2AreAVsJM7O28QKsU5eYvWG
        A2AbJATOsEm0XHjMDpFwkTj//TbUTcISr45vgYrLSJye3MMC0dDMKPHw3Fp2CKeHUeJy0wxG
        iCpriTvnfgHdxwF0k6bE+l36EGFHiQVn97CDhCUE+CRuvBUECTMDmZO2TWeGCPNKdLQJQVSr
        Scw6vg5u7cELl5ghbA+Jzg//mSCBGiuxddlF5gmMcrMQdi1gZFzFKJ5aWpybnlpslJdarlec
        mFtcmpeul5yfu4kRmAJO/zv+ZQfjrj9JhxgFOBiVeHg3zDwfJ8SaWFZcmXuIUYKDWUmE1+ns
        6Tgh3pTEyqrUovz4otKc1OJDjNIcLErivMaLXsYKCaQnlqRmp6YWpBbBZJk4OKUaGANn/GyN
        WS+29+76d1f/WHm8ZX0g9KDK1MpQ03d/d+lRU49GIeX1t788E7MP+JKb83ta9c1eh5Nvg9j+
        G979r+HqnPfXky38ifz2HxOZDEyFVlpvmFRytdGc24dvx+bqm2fUlZxLfC1VX1+ousK6mstg
        xoRf+x7cYzkfwvVu3Y2dOz3PJk7k81BiKc5INNRiLipOBAAwvHGm/QIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrALMWRmVeSWpSXmKPExsVy+t/xe7o7j5yPM5h0mcfi1rpzrBY9G7ay
        Wsw4v4/JYu2Ru+wWh9+0s1qsn3+LzeL42nAHdo871/awefRtWcXocfzGdiaPz5vkAlii9GyK
        8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DKOHnjOVPCB
        p2Lq2Y3sDYxfuLoYOTkkBEwkvv6dwtrFyMUhJLCUUeLUrIPMEAkZiZPTGlghbGGJP9e62CCK
        PjFK/Ji3hA0kwSZgKNH1tgvMFhFwkdi/5ykzSBGzwHVGiVtv34F1CwuESDzZ+ZYJxGYRUJW4
        9eQTmM0rYCNxdt4mqA3yEqs3HGCewMizgJFhFaNIamlxbnpusZFecWJucWleul5yfu4mRmDo
        bTv2c8sOxq53wYcYBTgYlXh4N8w8HyfEmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8+KLS
        nNTiQ4ymQMsnMkuJJucD4yKvJN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwf
        EwenVAOjt1+otWo9U8WswMyUfdr9604z612YYjbfe331vDsnXBQy5wrqLV8lHfDl0Z69YVkZ
        lu8PsG/xfJ1m3/a73tCb3ZHPO9TtVI3E/fiPJU+PT1m25PW/z/kOCXaRNS/YNXkMGh/G/0lj
        ybop+XDhMj2xm3curP/6PnmR5qfFMhZTXSuKvM4fT2VWYinOSDTUYi4qTgQACnNFPFMCAAA=
X-CMS-MailID: 20200528140337eucas1p2499a623f10d9bedf568f3a9bf55320f7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200528140337eucas1p2499a623f10d9bedf568f3a9bf55320f7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200528140337eucas1p2499a623f10d9bedf568f3a9bf55320f7
References: <CGME20200528140337eucas1p2499a623f10d9bedf568f3a9bf55320f7@eucas1p2.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms for
platform devices") in v5.7-rc5 added allocation of dma_parms structure to
all platform devices. Then vb2_dma_contig_set_max_seg_size() have been
changed not to allocate dma_parms structure and rely on the one allocated
by the device core. Lets allocate the needed structure also for the
devices created for the 2 MFC device memory ports.

Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Fixes: 9495b7e92f71 ("driver core: platform: Initialize dma_parms for platform devices")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/s5p-mfc/s5p_mfc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
index 5c2a23b953a4..eba2b9f040df 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
@@ -1089,6 +1089,10 @@ static struct device *s5p_mfc_alloc_memdev(struct device *dev,
 	child->coherent_dma_mask = dev->coherent_dma_mask;
 	child->dma_mask = dev->dma_mask;
 	child->release = s5p_mfc_memdev_release;
+	child->dma_parms = devm_kzalloc(dev, sizeof(*child->dma_parms),
+					GFP_KERNEL);
+	if (!child->dma_parms)
+		goto err;
 
 	/*
 	 * The memdevs are not proper OF platform devices, so in order for them
@@ -1104,7 +1108,7 @@ static struct device *s5p_mfc_alloc_memdev(struct device *dev,
 			return child;
 		device_del(child);
 	}
-
+err:
 	put_device(child);
 	return NULL;
 }
-- 
2.17.1

