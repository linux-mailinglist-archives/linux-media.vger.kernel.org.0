Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8083370EAE4
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 03:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239027AbjEXBhw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 21:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232881AbjEXBhv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 21:37:51 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156CF130
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 18:37:49 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d41d8bc63so209830b3a.0
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 18:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684892268; x=1687484268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zCzvrQaL+ZK8VN+OcuUjeLDq59sA2AvqOzpryPavW3w=;
        b=MRTAIbQSVAmZzKFAGMU+rSDjFetQ6Q8oMvlfyKznyj8uiEE9HXTq7huwXaoUArQLIB
         nceN1wjym22ODNiT8IxPMqNxNUhFctm+rc0CKZ6Tluwx6RW+vFQgxfRIJfBGy8kzJ00S
         upI9V7rK2KvpYLnlDW9fPmbmZputwD43RhMt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684892268; x=1687484268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCzvrQaL+ZK8VN+OcuUjeLDq59sA2AvqOzpryPavW3w=;
        b=VD+Rn2xZCKgt/Jj/xIeWFoBt0h81abS8ml+IOQ9bZrfukf1N1vj5lP/1uojrvLMks9
         MkgoaUc7r048tK27N2rNNGmwhP5Hi7MdYtWbus2p8u6Yvs911wZOg2WAqiganU1J2psi
         8R/3TECFVenbKulczd+6vtiu65Icp9oYIQdsVqxLyDARUptglJQ+riPuOrrK0lpUzojv
         7aa3ovB8X002hGLwlEaY9xASK9DHs5z1nqa7FBWboc2xQCvf01FjMySctG2noZ3RP6ck
         Mgb+6CiDGSAk/PUMJQl9a8NnoMupDUTwddtIjoHHtX+9fh9bj1RIFLK+nZU8wHloLMOL
         mCPg==
X-Gm-Message-State: AC+VfDzkwZvvhiephq5N6D/ifkM6ONtLIdOjVHIrKe3YOWYvDFq47L1u
        U9gCYZ9zzRyhT68tA2iFkv65sg==
X-Google-Smtp-Source: ACHHUZ5htJ/9VW+/8ZIPtOotneIBtDOl+h9mtHjeqD5fcHt4Mb8XS+WkB5hJ/yCAB6DfqyXelyQ+Qg==
X-Received: by 2002:a05:6a00:1746:b0:64f:49ee:1a61 with SMTP id j6-20020a056a00174600b0064f49ee1a61mr1398469pfc.34.1684892268496;
        Tue, 23 May 2023 18:37:48 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:9a0f:9704:f5b2:168b])
        by smtp.gmail.com with ESMTPSA id c17-20020aa78811000000b0063f00898245sm6231619pfo.146.2023.05.23.18.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 18:37:47 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] media: venus: provide video device lock
Date:   Wed, 24 May 2023 10:36:57 +0900
Message-ID: <20230524013732.2503561-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Video device has to provide ->lock so that __video_do_ioctl()
can serialize IOCTL calls.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 1 +
 drivers/media/platform/qcom/venus/venc.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 51a53bf82bd3..90b359074c35 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1767,6 +1767,7 @@ static int vdec_probe(struct platform_device *pdev)
 	vdev->vfl_dir = VFL_DIR_M2M;
 	vdev->v4l2_dev = &core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	vdev->lock = &core->lock;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret)
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 4666f42feea3..e6b63ff5bc0e 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1565,6 +1565,7 @@ static int venc_probe(struct platform_device *pdev)
 	vdev->vfl_dir = VFL_DIR_M2M;
 	vdev->v4l2_dev = &core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	vdev->lock = &core->lock;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret)
-- 
2.40.1.698.g37aff9b760-goog

