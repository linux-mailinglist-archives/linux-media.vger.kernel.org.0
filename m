Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0D0510DCF
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 03:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348478AbiD0BUr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 21:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344391AbiD0BUp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 21:20:45 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF0E2E08C
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 18:17:31 -0700 (PDT)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220427011725epoutp022c8f7af14b2b6da3a824a0575333d4c4~pm-wvPTxc1734417344epoutp02b
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 01:17:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220427011725epoutp022c8f7af14b2b6da3a824a0575333d4c4~pm-wvPTxc1734417344epoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651022245;
        bh=uzhbH2zy5cwN3mEIjX2YDGLDE6JC4X/Hl2T2HtN8AMc=;
        h=From:To:Cc:Subject:Date:References:From;
        b=QjAWxzz8wLkpz7vlodGMKo/guMAmCR055FjmEi/nAj0UtZwAkZbNVKO1YCCEFBD+N
         ZhQSm73Mdo3LHNiUGfrs9mAThqHzxeC1X3HldXllj3tIh27lyAqKg1y+6zZ5OMZiy2
         QJf3Aal2AQr4DwoYT4OnFXHOwDCrG29pd4b+1cHc=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20220427011725epcas1p3e9ea0948991e2f807117b41a37e095c5~pm-wX2YnY1319113191epcas1p3X;
        Wed, 27 Apr 2022 01:17:25 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.36.136]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4Kp17m3mXsz4x9QF; Wed, 27 Apr
        2022 01:17:24 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        41.0C.09785.4A998626; Wed, 27 Apr 2022 10:17:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20220427011724epcas1p2478c9e7a74aabe87e5b621b9292be4bd~pm-vFGrQy1291412914epcas1p2Y;
        Wed, 27 Apr 2022 01:17:24 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220427011724epsmtrp2c4f45caaa4142f44aeee0c812dedd6f4~pm-vEaIOd2433424334epsmtrp2A;
        Wed, 27 Apr 2022 01:17:24 +0000 (GMT)
X-AuditID: b6c32a36-c87ff70000002639-8d-626899a452c9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        DA.AD.08924.3A998626; Wed, 27 Apr 2022 10:17:23 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.112.149]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220427011723epsmtip110e15a4f87994d5166a6637510cde225~pm-u07Sop2594925949epsmtip1Y;
        Wed, 27 Apr 2022 01:17:23 +0000 (GMT)
From:   Kwanghoon Son <k.son@samsung.com>
To:     mchehab@kernel.org, s.nawrocki@samsung.com,
        krzysztof.kozlowski@linaro.org
Cc:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Kwanghoon Son <k.son@samsung.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] media: exynos4-is: Fix compile warning
Date:   Wed, 27 Apr 2022 10:16:45 +0900
Message-Id: <20220427011645.30607-1-k.son@samsung.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmru6SmRlJBjM/SFv0rrnKZLH39VZ2
        i54NW1ktZpzfx2TxqvkRm8WyTX+YLA6/aWd1YPdYvOclk8emVZ1sHneu7WHz6NuyitHj8ya5
        ANaobJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoDOU
        FMoSc0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQWmBXrFibnFpXnpenmpJVaGBgZGpkCF
        CdkZz6e0sxc0cVRsb3jC3sDYyt7FyMkhIWAiMWHWUiCbi0NIYAejxKb3b5ghnE+MEl/uzWEF
        qRIS+AzkvHSH6bg9dSorRNEuRomd7VtZIJwvjBKrH+1hA6liE1CXWNK2FmyHiECARNfRW2Bj
        mQW6GCVmt90CKxIWsJJo+L+dBcRmEVCV+HrzGBOIzStgJnHzE4QtISAvcb53HTtEXFDi5Mwn
        YPXMQPHmrbPBhkoInGKXuLD4BQtEg4vE9/6NzBC2sMSr41ugPpWS+PxuLxuEnS1x9COMXSJx
        fdYiVgjbWGL/0slAizmAFmhKrN+lDxFWlNj5ey4jxF4+iXdfe1hBSiQEeCU62oQgTHmJW53l
        ENWiEmeefoQa7iFx8e8jZkggxkpM6z/FPIFRfhaSZ2YheWYWwt4FjMyrGMVSC4pz01OLDQuM
        4JGanJ+7iRGcErXMdjBOevtB7xAjEwfjIUYJDmYlEd57ihlJQrwpiZVVqUX58UWlOanFhxhN
        gcE7kVlKNDkfmJTzSuINTSwNTMyMjE0sDM0MlcR5V007nSgkkJ5YkpqdmlqQWgTTx8TBKdXA
        tEH7R84bdqElmrpp1u8Fa5P3H9L8OK+Ad3HP/R2qmY2d/13MX8oveTZBI/35viVv04QNcp1U
        ef90RW53Vr8e3ffLzjE3eK1lVfVGpXkXcuYWbl43c+quhlebk2MtvzAZXXm+7tXsZT+rakL8
        48w37a3V+hSwXLMod767zrXmcPVpM39+nfTi5dmWi2xdlt1bwhQqlpf8MpA36Z6Ueltr1i3H
        vujbCjrSixSW7rB+uOfL4ie5pYzsxkvOFS4tffD4pp80i4Lgomt10wQ2Bdppmoa6nv91xvx0
        2Wsd+W8vWY9+cvsYoHDc5INFT/M0lfAnp7NOrdYNnBgX+9hxwwwv0wL/hYH/fn+XuKte/481
        XYmlOCPRUIu5qDgRAJ3UBOASBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPLMWRmVeSWpSXmKPExsWy7bCSnO7imRlJBt3nrC1611xlstj7eiu7
        Rc+GrawWM87vY7J41fyIzWLZpj9MFofftLM6sHss3vOSyWPTqk42jzvX9rB59G1ZxejxeZNc
        AGsUl01Kak5mWWqRvl0CV8bzKe3sBU0cFdsbnrA3MLaydzFyckgImEjcnjqVtYuRi0NIYAej
        RPuCTqiEqETH5UbGLkYOIFtY4vDhYoiaT4wSb/70sIDUsAmoSyxpWwtWLyIQJHFi8RZ2kCJm
        gT5GiWkvZoAVCQtYSTT83w5mswioSny9eYwJxOYVMJO4+QnClhCQlzjfu44dIi4ocXLmE7B6
        ZqB489bZzBMY+WYhSc1CklrAyLSKUTK1oDg3PbfYsMAoL7Vcrzgxt7g0L10vOT93EyM4TLW0
        djDuWfVB7xAjEwfjIUYJDmYlEd57ihlJQrwpiZVVqUX58UWlOanFhxilOViUxHkvdJ2MFxJI
        TyxJzU5NLUgtgskycXBKNTAx1WV+Ybn4yIxxfXYen+thq5NZIffO7/b98Oyh78VHC7Z0KeZr
        6WybNbEqVc9hqYnTP98TUh3dHmb6xq5KN65sDn52q0XRq27/xG+v2VQ2nNgY+iHwOYNBodMd
        w/MWBhrtnFVlJtZmPYtEL+SYbTMqkDuRW5mQIuefXJ3AWMuzUvOf+qx8gym30u4cFDrG8D3a
        YoWmntsdd7fzBfGfHvutDZ7UIbSIN8r3kzSvQ07ruaBKzatqGRbfPlq4a4vJ6nWa6Eu/5fOY
        VL1Y812KQMYmlTVmQT+/C977FtHmvufM/ylFPeXMLybFaznLlvyZUmJw5lTogvuO63+VaSdd
        Cb0WNuXpnN0Xcgrryz55KLEUZyQaajEXFScCANYFRKrCAgAA
X-CMS-MailID: 20220427011724epcas1p2478c9e7a74aabe87e5b621b9292be4bd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220427011724epcas1p2478c9e7a74aabe87e5b621b9292be4bd
References: <CGME20220427011724epcas1p2478c9e7a74aabe87e5b621b9292be4bd@epcas1p2.samsung.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Declare static on function 'fimc_isp_video_device_unregister'.

When VIDEO_EXYNOS4_ISP_DMA_CAPTURE=n, compiler warns about
warning: no previous prototype for function [-Wmissing-prototypes]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h
index edcb3a5e3cb9..2dd4ddbc748a 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h
@@ -32,7 +32,7 @@ static inline int fimc_isp_video_device_register(struct fimc_isp *isp,
 	return 0;
 }
 
-void fimc_isp_video_device_unregister(struct fimc_isp *isp,
+static inline void fimc_isp_video_device_unregister(struct fimc_isp *isp,
 				enum v4l2_buf_type type)
 {
 }
-- 
2.20.1

