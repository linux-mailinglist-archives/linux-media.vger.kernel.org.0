Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52C655280C4
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 11:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240904AbiEPJXW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 05:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238242AbiEPJXT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 05:23:19 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2EF26105
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 02:23:18 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-2fef1441caaso19977567b3.6
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 02:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=XYcszPVY+/p86mgF6I7vbvgFO/hmQYAS3gPe49Smi58=;
        b=OAriJZPnh9cWu5KKCXWbOBK6rUmmppd8ZnsaqyNBkGcysh+/FTeOBQTUSUo318nRui
         VL3IgBEuEh74XklUrPX6OTC5K0tsIm/rGBqRH5gEnlEUvYWtM1QC947pMuU1VzLIg3IL
         Oaf7aTmvSEk54vImBOBuD7SRyPuGzGhMgf6si4pNsBXF44NuyV2JNHyIUGnzA1AKKVpx
         ca7wDJXkzYRUsGXizVO2tAp5vUTp+l3h1eR1fHZo2n9IXBcg+qi7InP/ieGg5Rmk95uh
         TjPJ3239Nlak5OPhTiCbTXIbMCwUXPeo2ZKcodgirkX09jWDI/Zgd4/Y9/WYngkHwelF
         5q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=XYcszPVY+/p86mgF6I7vbvgFO/hmQYAS3gPe49Smi58=;
        b=H3vv5SOf+etazmil3GBzncqMrVQpIJW64B9/th5HhOVqh9RyoETfk0PgsFl+0IC7E5
         B8VmL84vHJUUCJJwFf9C7HNM+h/x1sWApxDjQxH+Fc5ykcFunTEM6wyJQxOLzCXmF2Qf
         2yEKCHL0lKTS4AX6S1RCJIiwDgMsSetsDnYKnjxW0ynJiPvPxWbDrhFi9a9OpxQyiZpx
         GTVRNmrC6kptC44erx7giifRcbR/NZLVfE1KBsZP2mhWYt6NzjT0EP0bEqwVE2dUPI29
         c7aywNhhRlfZJNpfcT3yMj4zdNJtF3GHYjJbe8qDcOTHj4to/YFUcWmY9aI20AZjQsXh
         QHsw==
X-Gm-Message-State: AOAM530y/BQmAsFSufGoTaXVfmDGiXWvNEOaXOhwj4pgvGb2NdNXUqHj
        99HSXj6MZ9/QjdDHL4WgdDwlXtV1ICI=
X-Google-Smtp-Source: ABdhPJwz2wnNurX8uH0kRfuBWLKzkAKTi32jWJY3hKi31FUTKbNB1kWGP16Fy/DgrQ/reYoueQhJZswEWyA=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:2bd1:4151:d530:8b73])
 (user=yunkec job=sendgmr) by 2002:a0d:e704:0:b0:2ff:1177:d942 with SMTP id
 q4-20020a0de704000000b002ff1177d942mr1005759ywe.277.1652692997675; Mon, 16
 May 2022 02:23:17 -0700 (PDT)
Date:   Mon, 16 May 2022 18:22:08 +0900
In-Reply-To: <20220516092209.1801656-1-yunkec@google.com>
Message-Id: <20220516092209.1801656-6-yunkec@google.com>
Mime-Version: 1.0
References: <20220516092209.1801656-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v1 5/6] media: uvcvideo: Initialize roi to default value
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For the devices we tested with, firmwares have wrong initial
ROI configuration. Initialize roi by setting to default value.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index c3d816985f13..f90b425a0a20 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2505,6 +2505,40 @@ static void uvc_ctrl_prune_entity(struct uvc_device *dev,
 	}
 }
 
+static int uvc_ctrl_init_roi(struct uvc_device *dev, struct uvc_control *ctrl)
+{
+	int ret;
+
+	ret = uvc_query_ctrl(dev, UVC_GET_DEF, ctrl->entity->id, dev->intfnum,
+			     UVC_CT_REGION_OF_INTEREST_CONTROL,
+			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
+			     ctrl->info.size);
+	if (ret)
+		goto out;
+
+	/*
+	 * Some firmwares have wrong GET_CURRENT configuration. E.g. it's
+	 * below GET_MIN, or have rectangle coordinates mixed up. This
+	 * causes problems sometimes, because we are unable to set
+	 * auto-controls value without first setting ROI rectangle to
+	 * valid configuration.
+	 *
+	 * We expect that default configuration is always correct and
+	 * is within the GET_MIN / GET_MAX boundaries.
+	 *
+	 * Set current ROI configuration to GET_DEF, so that we will
+	 * always have properly configured ROI.
+	 */
+	ret = uvc_query_ctrl(dev, UVC_SET_CUR, 1, dev->intfnum,
+			     UVC_CT_REGION_OF_INTEREST_CONTROL,
+			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
+			     ctrl->info.size);
+out:
+	if (ret)
+		dev_err(&dev->udev->dev, "Failed to fixup ROI (%d).\n", ret);
+	return ret;
+}
+
 /*
  * Add control information and hardcoded stock control mappings to the given
  * device.
@@ -2537,6 +2571,11 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 			 * GET_INFO on standard controls.
 			 */
 			uvc_ctrl_get_flags(chain->dev, ctrl, &ctrl->info);
+
+			if (ctrl->info.selector ==
+				UVC_CT_REGION_OF_INTEREST_CONTROL &&
+			    uvc_entity_match_guid(ctrl->entity, camera_entity))
+				uvc_ctrl_init_roi(chain->dev, ctrl);
 			break;
 		 }
 	}
-- 
2.36.0.550.gb090851708-goog

