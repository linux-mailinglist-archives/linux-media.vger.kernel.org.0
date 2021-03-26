Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE1F934AD3B
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 18:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbhCZRRv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 13:17:51 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:61460 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbhCZRRl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 13:17:41 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210326171740euoutp02f767d4eea02c6dae1a518c1ee9687011~v8-0-M--O0047800478euoutp02v
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 17:17:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210326171740euoutp02f767d4eea02c6dae1a518c1ee9687011~v8-0-M--O0047800478euoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1616779060;
        bh=H+2OLIX542Ham/Tue6GfRgTpUqzBcEfDf6HHWZIb4Pw=;
        h=From:To:Cc:Subject:Date:References:From;
        b=emcJxrfBRl7YB0Xh/9bxhqYVRDBqsh6Zx6ziPe/YDLcnFhYKWNItwWbVTsKJRmKXz
         EFmN7Q+5HKQ1Fh/uqsjiRiIh0QcCXkyIW/mXPYCyBhdWxu3U01nSM6S5nw/H5pMq0p
         DVuAO6CldtfPbzwpZfl4z0eNDiD8wMxIuu4cjK+4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210326171739eucas1p2d2df828918f0f859f32c10fc652ed9c0~v8-0ON3J-2398823988eucas1p2s;
        Fri, 26 Mar 2021 17:17:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 24.57.09444.3371E506; Fri, 26
        Mar 2021 17:17:39 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210326171739eucas1p1a1d2dfd4772ca11faab60e8336d6685b~v8-z6N8Hp0779907799eucas1p1A;
        Fri, 26 Mar 2021 17:17:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210326171739eusmtrp2652ef09ee79b82754dfaaee3c29acba1~v8-z5n6T22679526795eusmtrp2-;
        Fri, 26 Mar 2021 17:17:39 +0000 (GMT)
X-AuditID: cbfec7f4-dd5ff700000024e4-fd-605e1733bb1a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 33.99.08696.2371E506; Fri, 26
        Mar 2021 17:17:38 +0000 (GMT)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210326171738eusmtip13f940f177ae68c3b1bc1ad205869812d~v8-zml6ld2987129871eusmtip1Q;
        Fri, 26 Mar 2021 17:17:38 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] media: exynos4-is: Fix kernel-doc entries in fimc-is.h
Date:   Fri, 26 Mar 2021 18:17:25 +0100
Message-Id: <20210326171725.7581-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsWy7djPc7rG4nEJBr1/xSxOTX7GZNGzYSur
        xeE37awOzB59W1YxenzeJOdx6utn9gDmKC6blNSczLLUIn27BK6Mpj3T2AvuK1Z8nHSUsYFx
        g0wXIyeHhICJxPfTy5m6GLk4hARWMEpM+rmfGcL5wiix6eo2qMxnRoldc9+yw7Tc3L6YBSKx
        nFFi/Zr1jHAtU/4sYQGpYhMwlOg92scIYosIyEs86b3BBmIzCzhLPJ71hwnEFhZwl9j/7zGY
        zSKgKvH012Swel4BK4l18+awQGyTl1i94QDYTRICl9glrl2ayAaRcJHo7dnDCmELS7w6vgXq
        PBmJ/zvnM0E0NDNK9Oy+zQ7hTGCUuH98ASNElbXEnXO/gCZxAJ2kKbF+lz5E2FHiwaVzLCBh
        CQE+iRtvBSGO5pOYtG06M0SYV6KjTQiiWkXi96rpTBC2lET3k/9QN3tILLnfCnaakECsRM+t
        G+wTGOVmIexawMi4ilE8tbQ4Nz212CgvtVyvODG3uDQvXS85P3cTIzCmT/87/mUH4/JXH/UO
        MTJxMB5ilOBgVhLhZT0dmyDEm5JYWZValB9fVJqTWnyIUZqDRUmcN2nLmnghgfTEktTs1NSC
        1CKYLBMHp1QDk9ByfsNG+SNiigVXa2yzzrqoMHBoP33u/eBQ67fEWiH7hXkNYZeFIt69d/Gp
        8lgSM/dxhNLDLRe7Zx2zWb6J6eecmo/z9N1evHzeL89+asX7t9Pmb2Hubl1y0Jrr4JejSTOO
        HPi88+PdH/temd6N83rmtXNOsNeRB6p5PTWuO+Sj/9gwt20WTWiwOZmSci5TeY9SvPnF51Wm
        /VPuFN3UK955uXFDY2/166PCvHMV63OPz9TtiVfY9rdS6MyJ84vVjHf+Xp7y6vkd84cn9sUU
        XCt1lJhcLq+9YtP6F1ssv/C8uPvUZfuBJ/6pK49/fhgsF3T6ZNPuhxZ2gUl8MqIO/dnndn34
        PYFjjfKOMKltNsuVWIozEg21mIuKEwGKb8cTWAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsVy+t/xu7pG4nEJBh2tNhanJj9jsujZsJXV
        4vCbdlYHZo++LasYPT5vkvM49fUzewBzlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGx
        eayVkamSvp1NSmpOZllqkb5dgl5G055p7AX3FSs+TjrK2MC4QaaLkZNDQsBE4ub2xSxdjFwc
        QgJLGSVu7O0FcjiAElIS81uUIGqEJf5c62KDqPnEKLH80UxmkASbgKFE79E+RhBbREBe4knv
        DTYQm1nAVeLDiZtMILawgLvE/n+PwWwWAVWJp78mg9XzClhJrJs3hwVigbzE6g0HmCcw8ixg
        ZFjFKJJaWpybnltspFecmFtcmpeul5yfu4kRGEbbjv3csoNx5auPeocYmTgYDzFKcDArifCy
        no5NEOJNSaysSi3Kjy8qzUktPsRoCrRvIrOUaHI+MJDzSuINzQxMDU3MLA1MLc2MlcR5TY6s
        iRcSSE8sSc1OTS1ILYLpY+LglGpgkmu4tsrrw57z6ZcfOF6vfeJx+HbguVCZQ8v1Beac65cu
        nrvw/IfoWkl/iZKbjzqstx/rLLCy1WlNWuF84MfVQqVrF5JmmQWuWfzx7mUdkWzNfOdVvosi
        dvv9MRbV+z/Rxr6m94lyV0ZJ7YFbU8JcorYX6+sLSG5dasozt3nBu6Q766PPr57v+8KRy/T7
        v+NWIfv1kjl/nvoU7jGFOYSj8mON/Jc8VXbVWxXb9q/8d1v/A+/0LQ9vJ/6dzi6Rm87yafLM
        +QpP/Dj4I+f+tuxnMDn8IWqucoCGqtTOABPO5enX+eo0u+5zrZbhCWRevamlqvKoe2Kj6MwJ
        de8ZnnLmGaeKsk98OS39mTh7n1+gEktxRqKhFnNRcSIAsuqSuqwCAAA=
X-CMS-MailID: 20210326171739eucas1p1a1d2dfd4772ca11faab60e8336d6685b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210326171739eucas1p1a1d2dfd4772ca11faab60e8336d6685b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210326171739eucas1p1a1d2dfd4772ca11faab60e8336d6685b
References: <CGME20210326171739eucas1p1a1d2dfd4772ca11faab60e8336d6685b@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes scripts/kernel-doc warnings:

fimc-is.h:286: warning: Function parameter or member 'fw' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'memory' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'f_w' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'isp' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'sensor' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'setfile' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'ctrl_handler' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'irq' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'sensor_index' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'i2h_cmd' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'h2i_cmd' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'fd_header' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'config' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'config_index' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'is_p_region' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'is_dma_p_region' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'is_shared_region' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'af' not described in 'fimc_is'
fimc-is.h:286: warning: Function parameter or member 'debugfs_entry' not described in 'fimc_is'

The f_w field is unused so remove it.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/media/platform/exynos4-is/fimc-is.h | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-is.h b/drivers/media/platform/exynos4-is/fimc-is.h
index ce30b007bc55..06586e455b1d 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.h
+++ b/drivers/media/platform/exynos4-is/fimc-is.h
@@ -232,15 +232,33 @@ struct chain_config {
  * struct fimc_is - fimc-is data structure
  * @pdev: pointer to FIMC-IS platform device
  * @pctrl: pointer to pinctrl structure for this device
- * @v4l2_dev: pointer to top the level v4l2_device
+ * @v4l2_dev: pointer to the top level v4l2_device
+ * @fw: data structure describing the FIMC-IS firmware binary
+ * @memory: memory region assigned for the FIMC-IS (firmware)
+ * @isp: the ISP block data structure
+ * @sensor: fimc-is sensor subdevice array
+ * @setfile: descriptor of the imaging pipeline calibration data
+ * @ctrl_handler: the v4l2 controls handler
  * @lock: mutex serializing video device and the subdev operations
  * @slock: spinlock protecting this data structure and the hw registers
  * @clocks: FIMC-LITE gate clock
  * @regs: MCUCTL mmapped registers region
  * @pmu_regs: PMU ISP mmapped registers region
+ * @irq: FIMC-IS interrupt
  * @irq_queue: interrupt handling waitqueue
  * @lpm: low power mode flag
  * @state: internal driver's state flags
+ * @sensor_index: image sensor index for the firmware
+ * @i2h_cmd: FIMC-IS to the host (CPU) mailbox command data structure
+ * @h2i_cmd: the host (CPU) to FIMC-IS mailbox command data structure
+ * @fd_header: the face detection result data structure
+ * @config: shared HW pipeline configuration data
+ * @config_index: index to the @config entry currently in use
+ * @is_p_region: pointer to the shared parameter memory region
+ * @is_dma_p_region: DMA address of the shared parameter memory region
+ * @is_shared_region: pointer to the IS shared region data structure
+ * @af: auto focus data
+ * @debugfs_entry: debugfs entry for the firmware log
  */
 struct fimc_is {
 	struct platform_device		*pdev;
@@ -249,7 +267,6 @@ struct fimc_is {
 
 	struct fimc_is_firmware		fw;
 	struct fimc_is_memory		memory;
-	struct firmware			*f_w;
 
 	struct fimc_isp			isp;
 	struct fimc_is_sensor		sensor[FIMC_IS_SENSORS_NUM];
-- 
2.25.1

