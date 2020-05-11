Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEC4E1CD768
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 13:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729435AbgEKLOX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 07:14:23 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4328 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725993AbgEKLOX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 07:14:23 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id B94A1FEFA1A624C5B161;
        Mon, 11 May 2020 19:14:18 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 11 May 2020 19:14:09 +0800
From:   Samuel Zou <zou_wei@huawei.com>
To:     <mchehab@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <skomatineni@nvidia.com>, <linux-media@vger.kernel.org>,
        <devel@driverdev.osuosl.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Samuel Zou <zou_wei@huawei.com>
Subject: [PATCH -next] media: tegra: Make tegra210_video_formats static
Date:   Mon, 11 May 2020 19:20:15 +0800
Message-ID: <1589196015-8945-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following sparse warning:

drivers/staging/media/tegra-video/tegra210.c:589:33: warning: symbol 'tegra210_video_formats' was not declared.

The tegra210_video_formats has only call site within tegra210.c
It should be static

Fixes: 423d10a99b30 ("media: tegra: Add Tegra210 Video input driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Samuel Zou <zou_wei@huawei.com>
---
 drivers/staging/media/tegra-video/tegra210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index 2045609..3baa4e3 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -586,7 +586,7 @@ enum tegra210_image_format {
 }
 
 /* Tegra210 supported video formats */
-const struct tegra_video_format tegra210_video_formats[] = {
+static const struct tegra_video_format tegra210_video_formats[] = {
 	/* RAW 8 */
 	TEGRA210_VIDEO_FMT(RAW8, 8, SRGGB8_1X8, 1, T_L8, SRGGB8),
 	TEGRA210_VIDEO_FMT(RAW8, 8, SGRBG8_1X8, 1, T_L8, SGRBG8),
-- 
2.6.2

