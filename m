Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D346528665
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 16:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243947AbiEPOFO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 10:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244176AbiEPOFN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 10:05:13 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3B03A1B2
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 07:05:12 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-2fefb9975c5so20927157b3.21
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 07:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=X7dpd1WzQMMTLM1YGTJwqle4Y2PeA42jODH2znjzRMM=;
        b=emjXSyr/EKAsypnNPo0mO0BpbWLIMbD3yysJbImOHab4831FtW1EhpvNaYOpyyf/ev
         51Rcwf13ZJIi8Ys/OJhncVXOClVfm3nsVKqZ8n65QmJD9qETNXi6ShH4mPfYJW6jAhev
         TvqTZHY3kefDJebO/N+HzWYMme9+4E5BRKG/j6I/ZJ5/dp9dWDzQxdYeOz2+S3QBf22e
         hon8a33vTBpIDrSls59qTMpnWKqW9usqVZDCDQC9JfbmVoBp5KUwwF3A6+/2ALCI4e/h
         60sBCtlNXctqzjCpY1yrJGQgdzQ880XU4jzwLyqZAozHHmgwCywcZP77tw46g/HGborb
         AVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=X7dpd1WzQMMTLM1YGTJwqle4Y2PeA42jODH2znjzRMM=;
        b=78TBm6yLNGWawINcSnNQS3ZPeGd8DE32Y5Q0S501qSoqKer7LWLyfz0tXGu3s5Rgq2
         n+Okhld11pX2EMiI1r03YE6o4EPtOuF6XbkI5XOUFdpah0K7AV/Gp9SdxghwF2opHHzK
         xhwM2XZEWSfz5SLnQH6FvUAaI+nNScNiPBnOQXGQUY7CcuUZ2Jai/qPFCnwHHVgMTaSt
         FKQzO36aDzM9v8ufK3RCvfrhe719IqOYIqZOZS7ny1EGCWeVHRp03+o0V96enFY76LTa
         gq/2SYyaMVurmbqDBIUCt7EdF//gGYJTodg6w4wzK1axXrFgKDKcpgUDjAusji880uiu
         2g2Q==
X-Gm-Message-State: AOAM530g3Pmr/gQAOZpf5Dcty4Ykwj4qK5LzGeC+ILsrb2RcpdAEsMgT
        D5ICBIkeLJcuzuWVxU77Axu8vMLZr58=
X-Google-Smtp-Source: ABdhPJwAovHBC8NW+xj+gXXgWb8WAmivcGO1/iguNx3ZL6bWOTkZStOQafunf8Ot8VTk4Mn2gnACMdXBK3Q=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:2bd1:4151:d530:8b73])
 (user=yunkec job=sendgmr) by 2002:a25:3545:0:b0:64d:a20c:6006 with SMTP id
 c66-20020a253545000000b0064da20c6006mr5870148yba.503.1652709911455; Mon, 16
 May 2022 07:05:11 -0700 (PDT)
Date:   Mon, 16 May 2022 23:04:33 +0900
In-Reply-To: <20220516140434.1871022-1-yunkec@google.com>
Message-Id: <20220516140434.1871022-6-yunkec@google.com>
Mime-Version: 1.0
References: <20220516140434.1871022-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v2 5/6] media: uvcvideo: Initialize roi to default value
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
Changelog since v1:
- Fix a build error introduced in rebasing.

 drivers/media/usb/uvc/uvc_ctrl.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index c3d816985f13..2e37bb8c784c 100644
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
@@ -2517,6 +2551,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	const struct uvc_control_mapping *mapping = uvc_ctrl_mappings;
 	const struct uvc_control_mapping *mend =
 		mapping + ARRAY_SIZE(uvc_ctrl_mappings);
+	const u8 camera_entity[16] = UVC_GUID_UVC_CAMERA;
 
 	/* XU controls initialization requires querying the device for control
 	 * information. As some buggy UVC devices will crash when queried
@@ -2537,6 +2572,11 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
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

