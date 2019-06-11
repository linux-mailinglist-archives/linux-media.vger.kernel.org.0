Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6022E3D075
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 17:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404483AbfFKPKd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 11:10:33 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39074 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404447AbfFKPKd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 11:10:33 -0400
Received: by mail-wr1-f65.google.com with SMTP id x4so10816291wrt.6
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 08:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dKk4lwmcZdnDRALP2wx/m8WSxyBG2vgW/OCx0FzeC8c=;
        b=aUHoFIhHG/QLKjJygOhwGp8+6I04xXhwq/HrXO6TimaAtLUW8fIdmB5FLW0pNLDp5g
         bDZ2Q+sJyfolXXv3+POVpRiP4D5LvcCwky4UT4hyFSrMK75uv3oaSNmSEk1kERzYQugE
         /V/+AJTS+AxOtnXxaawbc9m2pFom9K99iSFvnaaymu1iaQBKf9RpKlRWFjUaNNQSXu6x
         zpNhzt0OHVxhdJCXdxrje6owCLWvM00igzgqWtkGujwakvAPiuO2vWBBe6x1bX46W5JR
         OMBCUITF3SYb35+yILh/hy9vqjTpt0fp3GKFoMeg3o64WwGvtOZmh4wQSfO5Uz+89B6m
         tuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dKk4lwmcZdnDRALP2wx/m8WSxyBG2vgW/OCx0FzeC8c=;
        b=ozWCRV/ucaJhVRJfTC2TR2opZ3F1lY/qAMSspw68jZ7PcpxIprbcsS2zASa4Ncxgpk
         Kx76JyIW3y4eEEAiVzKre6Gs/ECNn98iEDz1sx6ZpeRj8eJ9KEKwEQy8pYnk0PmDdLK7
         h1fwJna6TLCMN1e9yr9YIwqwaSUsafyoz+M/6kddkcyBfTfEBRP+42bRGjN2twLes7Q7
         ZemnYHJMXYxlRG0e34sRBYCzi5qUk+Q7aets4Z1L2XZA2djPg+j9bRM1gNi2wj7LrhSv
         f8MHcfQ+NnzII+tDSBQ60kQqMjJ5wd7iHIbJAUv19hT0vJpm9vtH0MIw5PKkYcGv4Vyi
         KDNQ==
X-Gm-Message-State: APjAAAXnvxdta26JKGGli0TD7afzygrI/BaejK0xMAU6ed7Bx6ST+Wn2
        3+sa0IoaFrivF6JkYXtAK+kAog==
X-Google-Smtp-Source: APXvYqx6qzDWYsQg+EbEYINrwOIGD8QFQzs+oEdV/iehclrDu2Mz+uEg5lvWrK1kvPzcqdukTeurwQ==
X-Received: by 2002:adf:ea44:: with SMTP id j4mr36676403wrn.123.1560265831937;
        Tue, 11 Jun 2019 08:10:31 -0700 (PDT)
Received: from arch-late.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c17sm10756281wrv.82.2019.06.11.08.10.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 08:10:30 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Sebastien Szymanski <sebastien.szymanski@armadeus.com>
Subject: [PATCH] media: imx7-media-csi: get csi upstream endpoint
Date:   Tue, 11 Jun 2019 16:09:55 +0100
Message-Id: <20190611150955.8038-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the upstream endpoint is neither a mux nor a CSI2 module, just get
the source pad directly upstream from the CSI.

Fixes: 05f634040c0d ("media: staging/imx7: add imx7 CSI subdev driver")
Reported-by: Sebastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/staging/media/imx/imx7-media-csi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 9101566f3f67..8979ee0c8202 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -442,6 +442,14 @@ static int imx7_csi_get_upstream_endpoint(struct imx7_csi *csi,
 
 	src = &csi->src_sd->entity;
 
+	/*
+	 * if the source in neither a mux or csi2 get the one directly upstream
+	 * from this csi
+	 */
+	if (src->function != MEDIA_ENT_F_VID_IF_BRIDGE &&
+		src->function != MEDIA_ENT_F_VID_MUX)
+		src = &csi->sd.entity;
+
 skip_video_mux:
 	/* get source pad of entity directly upstream from src */
 	pad = imx_media_pipeline_pad(src, 0, 0, true);
-- 
2.22.0

