Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9284452A6
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 13:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbhKDMIo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 08:08:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:37176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231340AbhKDMIj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 08:08:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B371861246;
        Thu,  4 Nov 2021 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636027560;
        bh=2T0ZwNsJcy30Fl7Ibrebx0nzNGLAhY58MGxL/A03P6c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N3yNWtDZFdq0nWqZA6s/lgz4Rw4jC6r1hRfe1qcRFKFqgaz+FehNRNvfxrMmB3rQx
         KJWNtLLO03ojZk5XJBjBAxIcGruw9OUL31oAWpLxukRsYJx/Fa7xyLiPB1yYcfjM+f
         ibBSIWd/r8mAXExyni7mSmmQiehHCdN6x5bOWH6QAAgnRPAkdtVVexLbfz+Ll/WecJ
         g/wteL9UyYBE6MXBfqLkxjk9FWDNZjfiJyN1QyvQQuFZTMv0zDlti8NJdhRABGJPpo
         UWk5IouZFr9oRuLl2JsLHIf9R8Y0sxMIZvFjzZwzeo95IpBZ/1nhD09uPpyNpZ9GZi
         oUgEFC9hUpvzQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mibVG-005nHh-5q; Thu, 04 Nov 2021 12:05:58 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 2/7] media: atomisp: move a debug printf to a better place
Date:   Thu,  4 Nov 2021 12:05:51 +0000
Message-Id: <b068833be0d0ff71f63ab55f5c90d04ed514c90e.1636026959.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636026959.git.mchehab+huawei@kernel.org>
References: <cover.1636026959.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sensor width/height report is alread being printed after
its calculus. The only reason for an extra debug printk is
when dis is used. So, change its message to reflect and move
it to be inside the if checks.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/7] at: https://lore.kernel.org/all/cover.1636026959.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index feb75491a273..76c9e89afb48 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -5583,6 +5583,10 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev,
 				       pad, set_fmt, &pad_state, &vformat);
 		if (ret)
 			return ret;
+
+		dev_dbg(isp->dev, "video dis: sensor width: %d, height: %d\n",
+			ffmt->width, ffmt->height);
+
 		if (ffmt->width < req_ffmt->width ||
 		    ffmt->height < req_ffmt->height) {
 			req_ffmt->height -= dvs_env_h;
@@ -5593,8 +5597,6 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev,
 			asd->params.video_dis_en = false;
 		}
 	}
-	dev_dbg(isp->dev, "sensor width: %d, height: %d\n",
-		ffmt->width, ffmt->height);
 	vformat.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera, pad,
 			       set_fmt, NULL, &vformat);
-- 
2.31.1

