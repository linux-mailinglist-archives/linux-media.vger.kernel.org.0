Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65911552A4D
	for <lists+linux-media@lfdr.de>; Tue, 21 Jun 2022 06:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233633AbiFUEfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jun 2022 00:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiFUEfT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jun 2022 00:35:19 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9819812ADD
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 21:35:14 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id b13-20020a170902e94d00b001692fd82122so7211706pll.14
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 21:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=dhfNNpZBcofaDHIRL1Sr8D1lbXTukD4S3IHTxmUp7vk=;
        b=tDDtifyghjMe+43lbAidkIucTxCfKfvw5YMLjspUCtsLmZ726fzBZ7mGrVUZfy5sFr
         VrnErwMBaGFnDGyHMvvMYJiR//LRdgALBJYsFo9nRhTfxPG6dZoMa08HTk16uWe5GZLs
         xFuZB0lH7SEC8u348ddWgGysjGx/FyyRi7d/TLiO76tRf+eb8vcKorkcRBzaAIp7pnwZ
         mluUfA3T2hRihW+AWtbrxNO/f3Ry4vnYUgZS+uhqw/ctXEQL8BjIFcNQn3+C60BcBx3D
         gFmRUiZHR+++93Uvo+LWY/46zCBHHpV7xjSvgqS446fvfX7WMBSNnYIm7UAyaH1nBV6k
         Mt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=dhfNNpZBcofaDHIRL1Sr8D1lbXTukD4S3IHTxmUp7vk=;
        b=aarZlah2LnuZMrLMnRSHzMh15LssJlEZdwhDGQkn/g4lN4snKdltnvgth0Kd+BEfQT
         vLS4hNQa8VG+TkDcO/iZfKyuuzMIFo10RVDEFGzXDSBT2FZj07OI/OTSiJhxMHoC1Qa/
         wWW5YKQ0ujIrV8H2NmlelKrGsNNTO+Rxed1AaODc/JFGmE85r6Mc9Coeix4Z1haeWcgs
         kN2vLasIc9uGReg6Zd6I8b5zvH+1x6pXZxJkGvnc+akHkQWL2Atjcv2MfrWmeHWp7bDn
         OIdUP2lOgVPXvZ3wUOfxIfaRcZILwt+TettAKiZ5FyNm+F6bk2h86OaJFSxaKcHGZlXY
         ChDA==
X-Gm-Message-State: AJIora8XQFGMFv2cCUvQROClzgIxDP0i59Wd41AILKF1TUjWkLCOvzuD
        HtRgC+GhVoYwf5pwlv859gs3VW6m7IA=
X-Google-Smtp-Source: AGRyM1su+u3lDyMPBRNVNMdsw5cs4PgOh+/b4qhVIxOO0G0Ps9kzx+M8sYfjN34feKYRIKnhFLh6QYzHYCc=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:86ad:34d9:2b8f:477])
 (user=yunkec job=sendgmr) by 2002:a05:6a00:1344:b0:51b:e3b5:54e2 with SMTP id
 k4-20020a056a00134400b0051be3b554e2mr28224184pfu.6.1655786113965; Mon, 20 Jun
 2022 21:35:13 -0700 (PDT)
Date:   Tue, 21 Jun 2022 13:35:06 +0900
Message-Id: <20220621043506.1142851-1-yunkec@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
Subject: [PATCH v1] media: uvcvideo: user entity get_cur in uvc_ctrl_set
From:   Yunke Cao <yunkec@google.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
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

Entity controls should get_cur using an entity-defined function
instead of via a query. Fix this in uvc_ctrl_set.

Fixes: 65900c581d01 ("media: uvcvideo: Allow entity-defined get_info and get_cur")
Signed-off-by: Yunke Cao <yunkec@google.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 0e78233fc8a0..54c047019313 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1787,15 +1787,21 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0) {
 			memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
 				0, ctrl->info.size);
+		} else if (ctrl->entity->get_cur) {
+			ret = ctrl->entity->get_cur(chain->dev,
+				ctrl->entity,
+				ctrl->info.selector,
+				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
+				ctrl->info.size);
 		} else {
 			ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
 				ctrl->entity->id, chain->dev->intfnum,
 				ctrl->info.selector,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
 				ctrl->info.size);
-			if (ret < 0)
-				return ret;
 		}
+		if (ret < 0)
+			return ret;
 
 		ctrl->loaded = 1;
 	}
-- 
2.37.0.rc0.104.g0611611a94-goog

