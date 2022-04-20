Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360D450806D
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 07:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349743AbiDTFOk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 01:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232351AbiDTFOj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 01:14:39 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C850333E1A
        for <linux-media@vger.kernel.org>; Tue, 19 Apr 2022 22:11:52 -0700 (PDT)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220420051151epoutp0429bf2b101821032f8b8d30ab505606be~ngrcGChqc2207722077epoutp04H
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 05:11:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220420051151epoutp0429bf2b101821032f8b8d30ab505606be~ngrcGChqc2207722077epoutp04H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1650431511;
        bh=AkboBTl1T63+/eHjjq5Ukj4jzXHO3ubdVjK2Hd3G60A=;
        h=Subject:Reply-To:From:To:CC:Date:References:From;
        b=SRkykIInRaBzKF+W4e5YkRsRakS+uRSJOeol4FUnIpRgaohW9KXpusJDds/h5ReOG
         iYbSzswZ5dXfbu76RkZ8ZdnrybST2fI7N6CQ87z6BUBg1+x/BzlJG4sh76p/qrcHG8
         RcQvTrJSJKW7pqpKZbGrN7sbxB1Ioj700QqKfoL4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20220420051150epcas1p3f3323a57633a7d22e6e3fd07984d16ad~ngrbwoLRx0406904069epcas1p3G;
        Wed, 20 Apr 2022 05:11:50 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.38.234]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4KjpgT44GFz4x9Q1; Wed, 20 Apr
        2022 05:11:49 +0000 (GMT)
X-AuditID: b6c32a38-001ff700000049ed-50-625f9615806b
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        89.6B.18925.5169F526; Wed, 20 Apr 2022 14:11:49 +0900 (KST)
Mime-Version: 1.0
Subject: [PATCH] media: exynos4-is: Fix compile warning
Reply-To: k.son@samsung.com
Sender: Kwanghoon Son <k.son@samsung.com>
From:   Kwanghoon Son <k.son@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        ALIM AKHTAR <alim.akhtar@samsung.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20220420051149epcms1p469ac91524037074586d368fe901e0964@epcms1p4>
Date:   Wed, 20 Apr 2022 14:11:49 +0900
X-CMS-MailID: 20220420051149epcms1p469ac91524037074586d368fe901e0964
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLKsWRmVeSWpSXmKPExsWy7bCmga7otPgkg74tshYP5m1js9j7eiu7
        Rc+GrawWM87vY7JYtukPk8XhN+2sDmwem1Z1snncubaHzaNvyypGj8+b5AJYorJtMlITU1KL
        FFLzkvNTMvPSbZW8g+Od403NDAx1DS0tzJUU8hJzU22VXHwCdN0yc4CWKymUJeaUAoUCEouL
        lfTtbIryS0tSFTLyi0tslVILUnIKTAv0ihNzi0vz0vXyUkusDA0MjEyBChOyMxrfPWEs2MZe
        seDRfbYGxuNsXYycHBICJhJdN44ygthCAjsYJS4cN+li5ODgFRCU+LtDGCQsLGAuMfHSEXaQ
        sJCAtMSHi7ogprCApsTzDkeQCjYBdYklbWuBKrg4RAROMErcWTeZBcRhFuhilLg/YzkrxCpe
        iRntT1kgbGmJ7cu3MkLYohI3V79lh7HfH5sPFReRaL13lhnCFpR48HM3VFxKovXMdiYIO1ti
        5oyVUPESif17JjKDHCchoC9xbJs0SJhXwFdi5eZesDEsAqoSU8+ehzrBReLaweNgrcwC8hLb
        384Ba2UG+mv9Ln2IEkWJnb/nQpXwSbz72gP3yY55T5ggNslL3Ooshzn+zNOP0HD1kHg0ezU7
        JFwDJdYtP8s8gVF+FiJoZyHZOwth7wJG5lWMYqkFxbnpqcWGBSbwyEzOz93ECE53WhY7GOe+
        /aB3iJGJg/EQowQHs5IIb8+S6CQh3pTEyqrUovz4otKc1OJDjKZAH09klhJNzgcm3LySeEMT
        SwMTMyNjEwtDM0Mlcd7eqacThQTSE0tSs1NTC1KLYPqYODilGpgUF8ccWDN72ze3cx43Znwp
        17s26w5HY75o57xnc/e7GpW37HO2rbjNyJoe/yfH6KHJdeXLdw3mSgnw7DBNEKtsd34y4+UC
        hqX7vyR7VXjfs1juc2K/NDv3LvFZ8X5tLhd495vaxzSYMMq55WaaBfqoz0tfuKrqceKb+1qZ
        Ot8Zg3vmV3q4cN2Zmp43R213w/rPnZfXbvL3PP3H9t02cUvvN/uqGaqtN/w+8+CSyxlP94nH
        m+LFCqczXKmYLsYUL7pO/K/gcxu+Dx4ND+YYxjAt/ZdVszlQ9EGAbsh6wdoXJddWPwrpm+Y3
        8Y6u0KywNzXG1wsK4169eums+266leMK9279SZx9js9PpV0LeKHEUpyRaKjFXFScCAA2e/R/
        AAQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220420045732epcms1p7bdaf82873a4328153b456ee4e3a5660a
References: <CGME20220420045732epcms1p7bdaf82873a4328153b456ee4e3a5660a@epcms1p4>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

declare 'static' to fix warning message from
https://lore.kernel.org/linux-media/202204192315.ZHbOex51-lkp@intel.com/T/#u

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Kwang Son <k.son@samsung.com>
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
