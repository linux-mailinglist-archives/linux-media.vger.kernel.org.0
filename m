Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61A45240983
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 17:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729242AbgHJPdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 11:33:10 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39977 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729226AbgHJPdH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 11:33:07 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200810153306euoutp01904aa6287d6d0058e4e469bf36d67ba4~p8fcDrLuL1049810498euoutp01X
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2020 15:33:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200810153306euoutp01904aa6287d6d0058e4e469bf36d67ba4~p8fcDrLuL1049810498euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1597073586;
        bh=dcuOjA1HpR3QZxk+5y9E1beTjB3I0OMJo34ZTTvNx74=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uI5x7w77V0hlEiLCla0KH1IQoSmGmbYuC4fAz6ZsFgnyW3sXx7rQHIh86xOB47Mf3
         dJ9pJLsqpk0VKDRxhOatLItyzEvIwsl+NTgbPhzHnlmyZy6N0trosS6fA7spQ/Sjhq
         kFz6YvU4cXA8hDKvZCp3t0XpezLKcZmnAR4dMK2Q=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200810153305eucas1p273be5417e848f874295c32d64362b8f4~p8fb4tnVd0872108721eucas1p28;
        Mon, 10 Aug 2020 15:33:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 78.FE.06318.1B8613F5; Mon, 10
        Aug 2020 16:33:05 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200810153305eucas1p2246d0e265d6548789cd24557fcd0d6f4~p8fbj793P0868908689eucas1p2E;
        Mon, 10 Aug 2020 15:33:05 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200810153305eusmtrp25510ee1efc4bf1ed22997012ea49e917~p8fbjYGyE0085100851eusmtrp2Z;
        Mon, 10 Aug 2020 15:33:05 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-bd-5f3168b10773
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id BE.C2.06314.1B8613F5; Mon, 10
        Aug 2020 16:33:05 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200810153305eusmtip2ae761a2d74747ddc4303c2fdffbfb64e~p8fbIb6WA2897228972eusmtip2O;
        Mon, 10 Aug 2020 15:33:05 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     linux-media@vger.kernel.org
Cc:     hslester96@gmail.com, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/2] media: exynos4-is: Simplify the pinctrl code
Date:   Mon, 10 Aug 2020 17:32:40 +0200
Message-Id: <20200810153240.23827-2-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810153240.23827-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjleLIzCtJLcpLzFFi42LZduznOd2NGYbxBs/mGFtsnLGe1WL2oZfM
        FufPb2C32PT4GqvF5V1z2Cx6NmxltZhxfh+Txdojd9ktDr9pZ3Xg9Ng56y67x6ZVnWwem5fU
        e/RtWcXo8XmTXABrFJdNSmpOZllqkb5dAlfGya/fWQuWylfMeDCXpYFxmlQXIyeHhICJxMu3
        S1i7GLk4hARWMEp8WX6fDcL5wiix8Ww7VOYzo8SvU8+ZYVomfdrBDJFYzijxfPk6JriW9bsm
        MIFUsQkYSvQe7WMEsUUE5CWe9N4Am8ss8J1RYue53ywgCWEBR4nbqy6B2SwCqhKzdt5kA7F5
        Bawlzlw9wAixTl5i9YYDQOs4ODgFbCQWX+YHmSMh0Mwu8fr/K6iTXCSuTH/ACmELS7w6voUd
        wpaR+L9zPhNUA6NEz+7b7BDOBEaJ+8cXQG2wlrhz7hcbyAZmAU2gF/Qhwo4SL9etBAtLCPBJ
        3HgrCBJmBjInbZvODBHmlehoE4KoVpH4vWo6E4QtJdH95D8LhO0h0XlzLjQY+xklvt6YyTSB
        UX4WwrIFjIyrGMVTS4tz01OLjfNSy/WKE3OLS/PS9ZLzczcxAlPH6X/Hv+5g3Pcn6RCjAAej
        Eg9vgbVhvBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xovehkr
        JJCeWJKanZpakFoEk2Xi4JRqYFwxt3flQYNaV1X2hc+a7r33b632O3J+V8z0opCwJ7szfdg+
        1Ait3LIrXNkhbOnOx94POCetD26/r35T5nLFW+lcDnX1VdH+D3QNn2ndOPkpa9+vR8aGJ/cJ
        Nb14YCBwWvH899tiZ+ZeinRUrtULl9nzxEZro8zerC9Pb88/EykftL9Mc6ePzH8lluKMREMt
        5qLiRADVR4kNGQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsVy+t/xe7obMwzjDRoOKFhsnLGe1WL2oZfM
        FufPb2C32PT4GqvF5V1z2Cx6NmxltZhxfh+Txdojd9ktDr9pZ3Xg9Ng56y67x6ZVnWwem5fU
        e/RtWcXo8XmTXABrlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpO
        Zllqkb5dgl7Gya/fWQuWylfMeDCXpYFxmlQXIyeHhICJxKRPO5i7GLk4hASWMko0PJ7M1MXI
        AZSQkpjfogRRIyzx51oXG0TNJ0aJg3PWsYMk2AQMJXqP9jGC2CIC8hJPem+AFTEL/GeU2Djz
        BjNIQljAUeL2qkssIDaLgKrErJ032UBsXgFriTNXDzBCbJCXWL3hADPIYk4BG4nFl/lBTCGg
        kvvb/SYw8i1gZFjFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGMLbjv3cvIPx0sbgQ4wCHIxK
        PLwF1obxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EaAp00kRmKdHkfGB8
        5ZXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYOyP3G3Uvt1119Yq
        BeUApj9Fu8JCkzl81stN4udnFFi+6c6Vj7xth1q/dF18Jvi+657Xtr8vq/PDSs0yD8RF/C6x
        710qtrVyx18vw93v31ivy57a9Xndy59fLh1oUqrgveBxXs25RmarwxfDDQGzXl8znX3RLTVs
        mpGzT9ndhI/tsiHrWA6X8yixFGckGmoxFxUnAgCVk/EUdwIAAA==
X-CMS-MailID: 20200810153305eucas1p2246d0e265d6548789cd24557fcd0d6f4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200810153305eucas1p2246d0e265d6548789cd24557fcd0d6f4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200810153305eucas1p2246d0e265d6548789cd24557fcd0d6f4
References: <20200810153240.23827-1-s.nawrocki@samsung.com>
        <CGME20200810153305eucas1p2246d0e265d6548789cd24557fcd0d6f4@eucas1p2.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no need to request the "idle" pinctrl state in the driver as that
is implemented in the driver core and the pinctrl_pm_* API can be used for
switching between the default and the idle state.

Simplify the pinctrl code to only request and check for the mandatory
"default" pinctrl state.

Switching between the default/idle pinctrl state is not yet implemented
in the driver and this patch doesn't change that.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/media/platform/exynos4-is/media-dev.c | 27 +++++----------------------
 drivers/media/platform/exynos4-is/media-dev.h | 11 -----------
 2 files changed, 5 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 9a57523..6df2796 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/types.h>
@@ -1254,26 +1255,6 @@ static ssize_t fimc_md_sysfs_store(struct device *dev,
 static DEVICE_ATTR(subdev_conf_mode, S_IWUSR | S_IRUGO,
 		   fimc_md_sysfs_show, fimc_md_sysfs_store);
 
-static int fimc_md_get_pinctrl(struct fimc_md *fmd)
-{
-	struct device *dev = &fmd->pdev->dev;
-	struct fimc_pinctrl *pctl = &fmd->pinctl;
-
-	pctl->pinctrl = devm_pinctrl_get(dev);
-	if (IS_ERR(pctl->pinctrl))
-		return PTR_ERR(pctl->pinctrl);
-
-	pctl->state_default = pinctrl_lookup_state(pctl->pinctrl,
-					PINCTRL_STATE_DEFAULT);
-	if (IS_ERR(pctl->state_default))
-		return PTR_ERR(pctl->state_default);
-
-	/* PINCTRL_STATE_IDLE is optional */
-	pctl->state_idle = pinctrl_lookup_state(pctl->pinctrl,
-					PINCTRL_STATE_IDLE);
-	return 0;
-}
-
 static int cam_clk_prepare(struct clk_hw *hw)
 {
 	struct cam_clk *camclk = to_cam_clk(hw);
@@ -1429,6 +1410,7 @@ static int fimc_md_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct v4l2_device *v4l2_dev;
+	struct pinctrl *pinctrl;
 	struct fimc_md *fmd;
 	int ret;
 
@@ -1465,8 +1447,9 @@ static int fimc_md_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_v4l2dev;
 
-	ret = fimc_md_get_pinctrl(fmd);
-	if (ret < 0) {
+	pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(pinctrl)) {
+		ret = PTR_ERR(pinctrl);
 		if (ret != EPROBE_DEFER)
 			dev_err(dev, "Failed to get pinctrl: %d\n", ret);
 		goto err_clk;
diff --git a/drivers/media/platform/exynos4-is/media-dev.h b/drivers/media/platform/exynos4-is/media-dev.h
index 4b8f9ac..9447faf 100644
--- a/drivers/media/platform/exynos4-is/media-dev.h
+++ b/drivers/media/platform/exynos4-is/media-dev.h
@@ -27,8 +27,6 @@
 #define FIMC_IS_OF_NODE_NAME	"fimc-is"
 #define CSIS_OF_NODE_NAME	"csis"
 
-#define PINCTRL_STATE_IDLE	"idle"
-
 #define FIMC_MAX_SENSORS	4
 #define FIMC_MAX_CAMCLKS	2
 #define DEFAULT_SENSOR_CLK_FREQ	24000000U
@@ -109,9 +107,6 @@ struct cam_clk {
  * @media_dev: top level media device
  * @v4l2_dev: top level v4l2_device holding up the subdevs
  * @pdev: platform device this media device is hooked up into
- * @pinctrl: camera port pinctrl handle
- * @state_default: pinctrl default state handle
- * @state_idle: pinctrl idle state handle
  * @cam_clk_provider: CAMCLK clock provider structure
  * @user_subdev_api: true if subdevs are not configured by the host driver
  * @slock: spinlock protecting @sensor array
@@ -131,12 +126,6 @@ struct fimc_md {
 	struct v4l2_device v4l2_dev;
 	struct platform_device *pdev;
 
-	struct fimc_pinctrl {
-		struct pinctrl *pinctrl;
-		struct pinctrl_state *state_default;
-		struct pinctrl_state *state_idle;
-	} pinctl;
-
 	struct cam_clk_provider {
 		struct clk *clks[FIMC_MAX_CAMCLKS];
 		struct clk_onecell_data clk_data;
-- 
2.7.4

