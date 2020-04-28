Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825E51BCECC
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 23:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgD1Vey (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 17:34:54 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:49085 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgD1Vey (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 17:34:54 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MORVA-1jp5vy03UE-00Py7I; Tue, 28 Apr 2020 23:34:32 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: ti-vpe: avoid gcc-9 warning
Date:   Tue, 28 Apr 2020 23:34:19 +0200
Message-Id: <20200428213430.3419189-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:laZaSS69dZZdVv23QiUyMzGBmD8IJlkLbL88EVgS9i+1BLw8fCj
 +1blN9GbEgLlOyTP3xWSc6gXyHPrPHoVs9wOra691yM+8m56CMng9nyLWqcl/DrhTf3YWpH
 piug/Cb6yUL5YLQ6qbBMmIHbMFpxK8M0tHYSUkAtSTUBMIZFtkc+qIfW8fmhfhgo9XwWsMw
 sXlEEkM5CwzFIgDpb4zjQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:J8mzMUcgKM4=:Rq019EP3rAGH2vQcoy1QrG
 6MW9Rc6VNJe4yAjrV4ffUYj4MYHwB3gQF354n87+Z86Hk9jZPcGlrAGKK8eBcmpz7NeaaN//S
 fN+m/firO37USpjEyIA2hnljveMFfYzxICbSUiwxjckp5zEG+i/Xewd/5nZ8Q+z6fS8PONYzz
 i5IgNzg/B9s1PH3N4wQ9JnpKhHEcOSkRHgfPYykcvKOs+44mzYvQaEaLcEFqdLoQJs0gBOr6R
 NYkGrmC99t73dy72Tq5am/YxhsH8oGJYQkcby2q7Szx1HWcQD62tEm3SD3jPXAjv2UCaYrUcW
 cYDmieOuXjdFP/u7yTayljjG20q2Pav1mduZhzeIHuIzF1y7jR8ACry60mer+2K059ArxWRgn
 /804vLTP0BB2kdkrXuN3p+JpsjC8zx7vAd3VNuG4xpn87+ewrYsRfG1wCfgDB5RkgB2eLGcsW
 uxV4QY0v469n5OtYMDwT8l5LZ7EOJfJuXD7pV8OKmNKs5VA2Jt8G0jWjIca4N5AZ6bpu2Ipae
 1Q7Z5Z0byV4rHOFaTVIaVCC/sQoDNeiri3bJifoA3MpfO7+UsOOYIGrGWlrsI8uQPMtRr7ymO
 TiamRvmQrcgkhYOmuHASIMvOcgheSg78fbi8NCshrVcJTXfQQPY4kH/3jAZJHLdGzpH2p4eAY
 Efny7fLPFsIhtk1wXHAsrbBXZRRJoqRAs/0E2TcIS/nvHniB1XFzUFcEh18wEOhVDlbVB2vI/
 /kmeNDvggAadpCkGacqFvrktAC6ioQDXkx8iaCoSnHUVwxGWxWg6gSilaKLHGGQCD0a0ZVwIk
 el7cGq7SL0gzSgk2hN60VnHPyfMajbK6krHUDOdYHHJUXpW55I=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

gcc warns about empty array declarations, which we get in this driver
when compile-testing without CONFIG_OF:

drivers/media/platform/ti-vpe/cal.c:2194:34: warning: array 'cal_of_match' assumed to have one element
 2194 | static const struct of_device_id cal_of_match[];

Since all users of this driver do need CONFIG_OF anyway, there is no
point in making the array definition conditional to save space, so
just remove the #ifdef and move the array up a little.

Fixes: 343e89a792a5 ("[media] media: ti-vpe: Add CAL v4l2 camera capture driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/ti-vpe/cal.c | 46 +++++++++++++----------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 49204872e711..9b18db7af6c3 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2237,7 +2237,26 @@ static struct cal_ctx *cal_create_instance(struct cal_dev *dev, int inst)
 	return NULL;
 }
 
-static const struct of_device_id cal_of_match[];
+static const struct of_device_id cal_of_match[] = {
+	{
+		.compatible = "ti,dra72-cal",
+		.data = (void *)&dra72x_cal_data,
+	},
+	{
+		.compatible = "ti,dra72-pre-es2-cal",
+		.data = (void *)&dra72x_es1_cal_data,
+	},
+	{
+		.compatible = "ti,dra76-cal",
+		.data = (void *)&dra76x_cal_data,
+	},
+	{
+		.compatible = "ti,am654-cal",
+		.data = (void *)&am654_cal_data,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, cal_of_match);
 
 static int cal_probe(struct platform_device *pdev)
 {
@@ -2413,29 +2432,6 @@ static int cal_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#if defined(CONFIG_OF)
-static const struct of_device_id cal_of_match[] = {
-	{
-		.compatible = "ti,dra72-cal",
-		.data = (void *)&dra72x_cal_data,
-	},
-	{
-		.compatible = "ti,dra72-pre-es2-cal",
-		.data = (void *)&dra72x_es1_cal_data,
-	},
-	{
-		.compatible = "ti,dra76-cal",
-		.data = (void *)&dra76x_cal_data,
-	},
-	{
-		.compatible = "ti,am654-cal",
-		.data = (void *)&am654_cal_data,
-	},
-	{},
-};
-MODULE_DEVICE_TABLE(of, cal_of_match);
-#endif
-
 static int cal_runtime_resume(struct device *dev)
 {
 	struct cal_dev *caldev = dev_get_drvdata(dev);
@@ -2462,7 +2458,7 @@ static struct platform_driver cal_pdrv = {
 	.driver		= {
 		.name	= CAL_MODULE_NAME,
 		.pm	= &cal_pm_ops,
-		.of_match_table = of_match_ptr(cal_of_match),
+		.of_match_table = cal_of_match,
 	},
 };
 
-- 
2.26.0

