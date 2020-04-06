Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C863719FA41
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729488AbgDFQjV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:39:21 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39278 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729228AbgDFQjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 12:39:20 -0400
Received: by mail-pl1-f194.google.com with SMTP id k18so2368pll.6
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 09:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GGsMnuxk2gJDp/aOpwPQ3q/o+VY3xYfPVYwKvgoS0OQ=;
        b=HpIlku9UfsSrIDOauCDW7UPlJLoJsoAYRq2ub2WyHf8fLdin9obQnMFa8zYPo0Y9Lu
         zUtBsBt0HwUZ9Yar+z5Xd+0Ms7+zVvP+hLHa9I380XiSOXrxcZVoXNwutkGHdSsWmGUX
         mwbFYKHdyNquEOUeJ2JpZZXFCRLpkSam1/2uSMpjOwY2+IuFfbN4rboo8dky5x92KVpA
         BgSVO1O9GF2wfMrw9ePIR6z6ydWx4vmRLkU4/6DyvxjibgpyJJLG2efgUWjm17Em8jWb
         xgiQaOiMA2NiNn4iqDjT8yn/T3sJ8vqwtj63sW7WdJg1D9mqlMd3gUae9fNdo9++4leV
         qKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GGsMnuxk2gJDp/aOpwPQ3q/o+VY3xYfPVYwKvgoS0OQ=;
        b=DJfOv8QkKEPfgagsavn/Yrw/HJStCcZCoFA4HNVbYQHrRNcgqZ8U0kJOvrCQY/iOh6
         7Yg6tiBWP7nx3SNYG10ehOiCocQ5wqkrVsW5JwvoMIfMvc53QA33RaH8+ewp1QRX+dCa
         sLMpuezIBXvn3YviYWy/P7ef9w1hvP0YIrFU+evTZqL7c/J3S7YT8zmd9ZdaZoa9MUQt
         AH9MCP0gg6dClOcREV0RYr2tvAs0fubWdbPTQ8F61zQNt8eKU5ctDSyYpwH64+xVbkeo
         HLZT45fqnL071gOv7SoO+BmH3GkmpNS8PghY++pQF2uLEAPlhPyyW224e3BSlddPOhh5
         QAJQ==
X-Gm-Message-State: AGi0PuZ39ZRbbY1ixi5c0MhtgWA4K5qHFghpO90MU7iFF+G7yqrQWBsQ
        6rExQzEqLcMdmov/oAAFJyp9elYBj48=
X-Google-Smtp-Source: APiQypKT1dC2TP5Ds/Lp+uy+370+BpetHv5Dm1FpfBwBDvBLzrH9L2h8NMdQLygx5b/BCFregeyFfg==
X-Received: by 2002:a17:902:6a87:: with SMTP id n7mr21733540plk.80.1586191159108;
        Mon, 06 Apr 2020 09:39:19 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id w29sm11165131pge.25.2020.04.06.09.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 09:39:18 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v7 05/11] media: imx: Fix some pixel format selections
Date:   Mon,  6 Apr 2020 09:38:59 -0700
Message-Id: <20200406163905.24475-6-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406163905.24475-1-slongerbeam@gmail.com>
References: <20200406163905.24475-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- imx_media_capture_device_register() needs to use CS_SEL_ANY when
  finding the format from the attached source subdevice, because the
  source can be a CSI which supports bayer, and the CSI may have selected
  a bayer format when it registered.

- Likewise, imx_media_init_mbus_fmt() is called from the CSI, so the
  function may be passed a bayer code. Use CS_SEL_ANY when locating
  the format.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 2 +-
 drivers/staging/media/imx/imx-media-utils.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index fe1c49a33fd9..970f54960cac 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -792,7 +792,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 	vdev->compose.width = fmt_src.format.width;
 	vdev->compose.height = fmt_src.format.height;
 	vdev->cc = imx_media_find_format(vdev->fmt.fmt.pix.pixelformat,
-					 CS_SEL_YUV_RGB);
+					 CS_SEL_ANY);
 
 	v4l2_info(sd, "Registered %s as /dev/%s\n", vfd->name,
 		  video_device_node_name(vfd));
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 5552039a9d7e..852badd55bd1 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -402,7 +402,7 @@ int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 	mbus->field = field;
 	if (code == 0)
 		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV);
-	lcc = imx_media_find_mbus_format(code, CS_SEL_YUV_RGB);
+	lcc = imx_media_find_mbus_format(code, CS_SEL_ANY);
 	if (!lcc) {
 		lcc = imx_media_find_ipu_format(code, CS_SEL_YUV_RGB);
 		if (!lcc)
-- 
2.17.1

