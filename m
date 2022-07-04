Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C252B565130
	for <lists+linux-media@lfdr.de>; Mon,  4 Jul 2022 11:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiGDJoq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 05:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233550AbiGDJoo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 05:44:44 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89235E94
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 02:44:43 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id t24so14848026lfr.4
        for <linux-media@vger.kernel.org>; Mon, 04 Jul 2022 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LmdZpfhul7AYz3qW3RlxL4bqH00e3NuUlI2WNhk7Mn8=;
        b=U2yH96tWFNOybcVxh4dfrZVVAFCcl7ZROLLuLwli+5ycQKzpJvOPETxhUeMAyQpGZe
         tj56S0OmYqEXjBJP43yz5iaxytRUTRZ6w3/VFTWUW/PbSDKSMrfG642JDXHkUJ/Wa2Hr
         X8EMGxirynH79U9Wdwq4CcL8nYicrSD4BR0FZ9HZaWH2Uds/C7oOLvDAEnobo9EECQxt
         P93EKZpNRgYdnpsaeLjWa1rGvc2CXaPVLnxBgn37wmZzeRNaLqQj6iTFhKrsKXNd9s+2
         MablvIJbAuqFQv8xRJesVmbuPX+AQVtXVglm03BfLM/2pA+dcIt5IlSjyqfApm0+L7RY
         Odtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LmdZpfhul7AYz3qW3RlxL4bqH00e3NuUlI2WNhk7Mn8=;
        b=byNrTICz6Ccwk7KbxRFRxnNNgevREInyGoszXDMPtqhH4G2M40YivAOhIpXY3SAJfh
         eoZ/V5aI41omtVgwoL9hyChdBTMcskzlWYRqkfpoyb6y3cXzq5ushPe21i3MFAXtSrPF
         ggsjBDgGfsgfDpz3OBqfsrzpWxwL7QWvBJ5vYppC0+2HYHCQqFMEOayzMN8ycy+eO3a3
         Ratp2SAJOsQT6axAtla/vaEmPx0M8Ztv1SbExG4U7Ngv1IiCNLJHPOz/S/tkRvOb0Ur9
         25TY4Wtqmx3VK0zMFOq5D1qtfRDfd0R3RryBplhv2bmQtzygBSGBtNAD+tdB5Czbvfd5
         +xYQ==
X-Gm-Message-State: AJIora9nvqJAWieb1SW3NJPfbzvOPF9HCeiEKBv1rL0ustRn9QYsIyq3
        OfQtpNZC7E94sJTBmEF66aycSw==
X-Google-Smtp-Source: AGRyM1tYuNf56EgZ3K5y1zSmnh/3A9NAy3fnjug/zGIClMQdPs9SY7ng7KgVHxFZ0ZOuqKsOB+0AKw==
X-Received: by 2002:ac2:596f:0:b0:481:1aa9:aa4e with SMTP id h15-20020ac2596f000000b004811aa9aa4emr18535519lfp.84.1656927881877;
        Mon, 04 Jul 2022 02:44:41 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id u9-20020a2e1409000000b002554b7b9a16sm4872619ljd.73.2022.07.04.02.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 02:44:41 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] media: camss: Clean up received buffers on failed start of streaming
Date:   Mon,  4 Jul 2022 12:44:37 +0300
Message-Id: <20220704094437.468395-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is required to return the received buffers, if streaming can not be
started. For instance media_pipeline_start() may fail with EPIPE, if
a link validation between entities is not passed, and in such a case
a user gets a kernel warning:

  WARNING: CPU: 1 PID: 520 at drivers/media/common/videobuf2/videobuf2-core.c:1592 vb2_start_streaming+0xec/0x160
  <snip>
  Call trace:
   vb2_start_streaming+0xec/0x160
   vb2_core_streamon+0x9c/0x1a0
   vb2_ioctl_streamon+0x68/0xbc
   v4l_streamon+0x30/0x3c
   __video_do_ioctl+0x184/0x3e0
   video_usercopy+0x37c/0x7b0
   video_ioctl2+0x24/0x40
   v4l2_ioctl+0x4c/0x70

The fix is to correct the error path in video_start_streaming() of camss.

Fixes: 0ac2586c410f ("media: camss: Add files which handle the video device nodes")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index b5f12ec5c50c..d272ffa02112 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -495,7 +495,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	ret = media_pipeline_start(&vdev->entity, &video->pipe);
 	if (ret < 0)
-		return ret;
+		goto flush_buffers;
 
 	ret = video_check_format(video);
 	if (ret < 0)
@@ -524,6 +524,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 error:
 	media_pipeline_stop(&vdev->entity);
 
+flush_buffers:
 	video->ops->flush_buffers(video, VB2_BUF_STATE_QUEUED);
 
 	return ret;
-- 
2.33.0

