Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7B552B264
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 08:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbiERGZF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 02:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbiERGZB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 02:25:01 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61DBD411B
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 23:25:00 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-2fef1441caaso12236967b3.6
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 23:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=XIMSQQojLkdvAm2rzbsF1owAymz5ZvXn1U0KlTv+Ci8=;
        b=HGf5o/ipNpDLUcmBii10EQjpjYAG1tUzrcxqkqoFBUrQIQOXfiAJJ1sPTRlSzRx0li
         sB7tyz3CaqOAk4qWlVVGYOE0LayfAKZBofnxvx6+1eDYV0V/9hQXOsf9R0S6LNgrrF/a
         RZ+648Ra+zd9rFcWOt2CMfJ9/A5OG5D3DCqW6xsgy0u7AtEVNGFmJXwLErchG+zg+K7k
         1DYRQmMyABEHpJnQVFsXuC9VNj14RlsJhp4AiRmpY2o9MitPIbIS7LzcLRnk/HQbCI9/
         /hw4a9JlDT3+SWuJIkMVV1suFzeZme95y952xh/0itFGBAlpQKil9ynkiuvbGHeDOpO5
         0TGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=XIMSQQojLkdvAm2rzbsF1owAymz5ZvXn1U0KlTv+Ci8=;
        b=w5CmFICQMTiq21JY7avEqSGFHvW/101OxrKKnVnvMfOoVH3626syyUNcBPPgJ4uNck
         rv/985iKoegXC6T+XYWdWw2GNfsH745iuvnzbdv4mXylw/JxyI9MKdJ5GdPmy5TQnmtM
         rCAh9qIlD8CtE59QG9kxjTgkhjMorfiqRX+KwCk50+tp1AUgcuPb9woiVj8t25vOrhWp
         d0NatFJggxNt+j8qLZms/ch6Vx5VDNqjwo1hUhOqxfh4tLvUHSDK8ZhmQk8kO7iZ1kIw
         mX/r8eob3pR4yctM9SGr95Z4OergAi+pIrEPprvEnuo9HeyyVAdGHvzyq4BRKlLWdI7g
         9AeQ==
X-Gm-Message-State: AOAM5332fgz2RojB88/PQRU/7VAfgyDfrUiN4hNmSMa+5IRx/au9MaWn
        1RmsP5+k7TGAsvYGWqo7DaC9Zqw0kw4=
X-Google-Smtp-Source: ABdhPJz2qITwtSPHl/L83KwubWyAMXHiTmnBTJ+AVp0EqR+YWFgGWobQOzzkr9zyxxihO1NVYqOUCPVCxo0=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d4d4:2a73:fa69:7d32])
 (user=yunkec job=sendgmr) by 2002:a25:df10:0:b0:64d:8400:3a0a with SMTP id
 w16-20020a25df10000000b0064d84003a0amr16386255ybg.324.1652855099968; Tue, 17
 May 2022 23:24:59 -0700 (PDT)
Date:   Wed, 18 May 2022 15:24:11 +0900
In-Reply-To: <20220518062412.2375586-1-yunkec@google.com>
Message-Id: <20220518062412.2375586-6-yunkec@google.com>
Mime-Version: 1.0
References: <20220518062412.2375586-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v3 5/6] media: uvcvideo: Initialize roi to default value
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
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
 drivers/media/usb/uvc/uvc_ctrl.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 0abe174231ab..f7aa97aa3772 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2506,6 +2506,40 @@ static void uvc_ctrl_prune_entity(struct uvc_device *dev,
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
@@ -2518,6 +2552,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	const struct uvc_control_mapping *mapping = uvc_ctrl_mappings;
 	const struct uvc_control_mapping *mend =
 		mapping + ARRAY_SIZE(uvc_ctrl_mappings);
+	const u8 camera_entity[16] = UVC_GUID_UVC_CAMERA;
 
 	/* XU controls initialization requires querying the device for control
 	 * information. As some buggy UVC devices will crash when queried
@@ -2538,6 +2573,11 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
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

