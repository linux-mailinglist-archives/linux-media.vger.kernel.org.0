Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F24A3440DEF
	for <lists+linux-media@lfdr.de>; Sun, 31 Oct 2021 12:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbhJaL1j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 07:27:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:47128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230209AbhJaL1i (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 07:27:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C39660F56;
        Sun, 31 Oct 2021 11:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635679506;
        bh=5AQ4SFcPBrRu8r+f85REA1Qo7urIQufQynh/2GrVMLY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PminbNS/sScjp2Kr2IYaraoupgvxMecnhIyPC/YsRKar60GF/V2Hk+6IdS+hUFe4b
         ChDB+8uaoUzNsZfFKTpnzVjYR9hGs/G2ogqgC1tqN2tmhM5mVXJ1gT1qDstjA0JngV
         J9ykKaJCD/rhP965hzy1ES1o1UacHIoXlOOJCFHqBwdKyGkwhfDNfZhMJ9kHgb50os
         vdUlA7+7ldGvO9HPfoHLuAKxi9BxsOjoGXFxua9O92FJ041QCLKdzWzXdfRlChZ/2k
         Ww6EeP/ZNeAtv6Q/+Pr1sYPmGWzBPimR/3ERl1+2z7hylb4jT7GEyYrabpGkZW/kZl
         3AmcZ3SHo50Hg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mh8xT-003wZP-Em; Sun, 31 Oct 2021 11:25:03 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ingo Molnar <mingo@kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 3/3] media: atomisp: comment-out JPEG format
Date:   Sun, 31 Oct 2021 11:25:02 +0000
Message-Id: <b561275a4b10949ac06ff834e27243ec6ad6d546.1635679495.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <dc24ab2a6c9bb0831e1bb732d3377529fb0ead87.1635679495.git.mchehab+huawei@kernel.org>
References: <dc24ab2a6c9bb0831e1bb732d3377529fb0ead87.1635679495.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is already disabled on some parts of the code, and trying
to use it with current firmware causes an error:

[   53.799946] atomisp-isp2 0000:00:03.0: can't create streams
[   53.799962] atomisp-isp2 0000:00:03.0: __get_frame_info 1600x900 (padded to 0) returned -22

So, completely disable reporting it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c   | 2 ++
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 7 +++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index ff8640314f65..feb75491a273 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1980,9 +1980,11 @@ v4l2_fmt_to_sh_fmt(u32 fmt)
 		return IA_CSS_FRAME_FORMAT_RGBA888;
 	case V4L2_PIX_FMT_RGB565:
 		return IA_CSS_FRAME_FORMAT_RGB565;
+#if 0
 	case V4L2_PIX_FMT_JPEG:
 	case V4L2_PIX_FMT_CUSTOM_M10MO_RAW:
 		return IA_CSS_FRAME_FORMAT_BINARY_8;
+#endif
 	case V4L2_PIX_FMT_SBGGR16:
 	case V4L2_PIX_FMT_SBGGR10:
 	case V4L2_PIX_FMT_SGBRG10:
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d92d41dd0ade..936516daec7d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -492,23 +492,22 @@ const struct atomisp_format_bridge atomisp_output_fmts[] = {
 		.mbus_code = MEDIA_BUS_FMT_BGR565_2X8_LE,
 		.sh_fmt = IA_CSS_FRAME_FORMAT_RGB565,
 		.description = "16 RGB 5-6-5"
+#if 0
 	}, {
 		.pixelformat = V4L2_PIX_FMT_JPEG,
 		.depth = 8,
 		.mbus_code = MEDIA_BUS_FMT_JPEG_1X8,
 		.sh_fmt = IA_CSS_FRAME_FORMAT_BINARY_8,
 		.description = "JPEG"
-	},
-#if 0
-	{
+	}, {
 		/* This is a custom format being used by M10MO to send the RAW data */
 		.pixelformat = V4L2_PIX_FMT_CUSTOM_M10MO_RAW,
 		.depth = 8,
 		.mbus_code = V4L2_MBUS_FMT_CUSTOM_M10MO_RAW,
 		.sh_fmt = IA_CSS_FRAME_FORMAT_BINARY_8,
 		.description = "Custom RAW for M10MO"
-	},
 #endif
+	},
 };
 
 const struct atomisp_format_bridge *
-- 
2.31.1

