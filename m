Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D572B82800
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731267AbfHEXfk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:35:40 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40762 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731252AbfHEXfj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:39 -0400
Received: by mail-pl1-f195.google.com with SMTP id a93so36998057pla.7;
        Mon, 05 Aug 2019 16:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zrm8LxDqKTEIfziOzXkM6e2flIMXktLlvnyDC/cWAXU=;
        b=E8PFWAlEca7XGp/ypYPJskiPyA9K+7OS18DItOnG2Bfl6FCKtkimS9/DnRw/hE1zFu
         OouSg6pW06IaMrrAq2zQYNzh3HlvYNDC7/+6Pd2pGb73nYxYAiOzuLNakyx/gs/0ne7M
         tOiWcZ32wmqRG7rODw5zO3uH76Efd0ztx6BR2HX5j+4+nFvZGQKj+AqMcwtpxFdu2Jqn
         D0zHlOtu7eB9PrDypfvevuW51VXdxNfXi2g+oXIyE+i8StDi8QWlJbqn41x/0jmmJhZn
         Uka/xY8sq5AdPsUB/yIUOTcehc9mCEBwQG6nlixCt38ifTG1RaeP0DX+8kwp+yp8gMOv
         Oc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zrm8LxDqKTEIfziOzXkM6e2flIMXktLlvnyDC/cWAXU=;
        b=DfbWyIK2OkV8YyCNosXYLucQn8E5zNTW7T5K92a7NP3P8J00cpuVyWT1rGl5fFrunI
         t2x2g57tC1JEUAYn4WtY3a0O1Er6KYNq/W2zGGsPQtvR+JOa19JYS/fSeyWgKTuIULaR
         +xr3oG39uZaTiXtE5hx6BfduDVd5EfZ2jNgBrjg2MAAhLo84+GoCD+ZgxhE8YeVsR7a8
         Sgxu7nbMiD5xx9eM1g0PeZeCf1lSEHF//uc4gJ7/i0aZuFpUSxHd/2iXI0ztUfye1J+s
         TgGplSrosiZ+TRrNItXPqj4nvSSgk64kXHShFZQXisEnD7C5mUHY+dz+NOvmQsm8OTfD
         iypQ==
X-Gm-Message-State: APjAAAXjIgPNl6VORf5fpyzG9Vk8MEBlr6HHfo45gogvWmCmYfQS7sFZ
        sZD9Ht09CMun8AfHm5ItGLsHmtRw
X-Google-Smtp-Source: APXvYqyH8CdkrHUQnPTNSLlBsJ0vtRNhSprKbx26bouPjx5BmsIKdhqcv08x/6Q/83cWW2HTKFyUEQ==
X-Received: by 2002:a17:902:5a2:: with SMTP id f31mr277744plf.72.1565048138734;
        Mon, 05 Aug 2019 16:35:38 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:38 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 20/22] media: imx: Add is_ipu_internal_subdev()
Date:   Mon,  5 Aug 2019 16:35:03 -0700
Message-Id: <20190805233505.21167-21-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a convenience inline function that returns true if the given
subdevice is one of the i.MX5/6 IPU-internal subdevices.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index d75b3c80101a..c42a2cafb8fb 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -282,4 +282,12 @@ void imx_media_capture_device_error(struct imx_media_video_dev *vdev);
 #define IMX_MEDIA_GRP_ID_IPU_IC_PRPENC BIT(14)
 #define IMX_MEDIA_GRP_ID_IPU_IC_PRPVF  BIT(15)
 
+static inline bool is_ipu_internal_subdev(struct v4l2_subdev *sd)
+{
+	return sd->grp_id == IMX_MEDIA_GRP_ID_IPU_VDIC ||
+		sd->grp_id == IMX_MEDIA_GRP_ID_IPU_IC_PRP ||
+		sd->grp_id == IMX_MEDIA_GRP_ID_IPU_IC_PRPENC ||
+		sd->grp_id == IMX_MEDIA_GRP_ID_IPU_IC_PRPVF;
+}
+
 #endif
-- 
2.17.1

