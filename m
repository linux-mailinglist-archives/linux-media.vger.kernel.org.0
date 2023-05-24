Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 705BA70F821
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 15:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235625AbjEXN5t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 09:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbjEXN5r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 09:57:47 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2204B3
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 06:57:45 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-64d2b42a8f9so741709b3a.3
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 06:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684936665; x=1687528665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QH1xIkjrKZX3F59cGUOpHWW9Vjey4EzboES70oLYSZQ=;
        b=VUxLRQzNNKri4Tj0XK05U/xiTy3hIP2B+G8geCwkiVx+lypv4H+wmw7wUt3N2Y8EV5
         tSkRXnqUXK9yuVLKf65tCsMHdLJDFpRmI4vMw9W0ZRLJpfCGsG0vXIjuAyqw9pzU54IC
         0QEo48DudNfxdZDaVBmqStgRp88cGkN8W0NqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684936665; x=1687528665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QH1xIkjrKZX3F59cGUOpHWW9Vjey4EzboES70oLYSZQ=;
        b=CLlkic6zQu2blmso7yDt8HCm1Hr81gN4Ol6TTZOlhVBOA6HDvqAQGbPkVLCFLDsCZI
         mLE54Pb1V/fUPSlb17hgrhTyjL334HYYV2ZCv6138T/LC2B1U7Be0MM4kY5k6lSbvLS4
         xJKupsRpHp+RUyweCz/ln6wROT3mHE2i0QtsOddD3pzMFvr1fLD4zhiSosOMBh71xUn1
         rFJV2tHPSfeSTWEU98fulobb4wrxZveE/JQkPLVbsBpLVg80eAr0n7jYPZPHwJvQen3b
         J1iiiPxs2FKa503arzU3w3h6/jSr/VtVbkvdzHlrHFTE9Gbr7zu8eJpzJCzHHM0GGF4Q
         XTXQ==
X-Gm-Message-State: AC+VfDxEjYk9xW2dj6+3/Iqb/q7ALek7BW6oBITbobDQviuGffM2IWI8
        Nh4CednwfLBFACxI1EbPkuYoDQ==
X-Google-Smtp-Source: ACHHUZ7eRyyD0FFws1xLpCMbIUCsVCdWzhM2L/agesnoQb+eXQrXI+dV5EHW7fFQgcz4Fg9N5dHczw==
X-Received: by 2002:a05:6a00:158e:b0:64d:3e99:83a5 with SMTP id u14-20020a056a00158e00b0064d3e9983a5mr4375430pfk.26.1684936665348;
        Wed, 24 May 2023 06:57:45 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:9a0f:9704:f5b2:168b])
        by smtp.gmail.com with ESMTPSA id x42-20020a056a000bea00b0064f51ee5b90sm1480370pfu.62.2023.05.24.06.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 06:57:44 -0700 (PDT)
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
Subject: [PATCHv2] media: venus: provide video device lock
Date:   Wed, 24 May 2023 22:56:16 +0900
Message-ID: <20230524135737.2557837-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230524013732.2503561-1-senozhatsky@chromium.org>
References: <20230524013732.2503561-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Video device has to provide ->lock so that __video_do_ioctl()
can serialize IOCTL calls. Provided dedicated enc/dec mutex-s
for that purpose.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h | 4 ++++
 drivers/media/platform/qcom/venus/vdec.c | 2 ++
 drivers/media/platform/qcom/venus/venc.c | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 4f81669986ba..23259fa114c7 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -113,7 +113,9 @@ struct venus_format {
  * @opp_pmdomain: an OPP power-domain
  * @resets: an array of reset signals
  * @vdev_dec:	a reference to video device structure for decoder instances
+ * @@vdev_dec_lock: decoder instance video device ioctl lock
  * @vdev_enc:	a reference to video device structure for encoder instances
+ * @@vdev_enc_lock: encoder instance video device ioctl lock
  * @v4l2_dev:	a holder for v4l2 device structure
  * @res:		a reference to venus resources structure
  * @dev:		convenience struct device pointer
@@ -165,7 +167,9 @@ struct venus_core {
 	struct device *opp_pmdomain;
 	struct reset_control *resets[VIDC_RESETS_NUM_MAX];
 	struct video_device *vdev_dec;
+	struct mutex vdev_dec_lock;
 	struct video_device *vdev_enc;
+	struct mutex vdev_enc_lock;
 	struct v4l2_device v4l2_dev;
 	const struct venus_resources *res;
 	struct device *dev;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 51a53bf82bd3..7e9363714bfb 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1760,6 +1760,7 @@ static int vdec_probe(struct platform_device *pdev)
 	if (!vdev)
 		return -ENOMEM;
 
+	mutex_init(&core->vdev_dec_lock);
 	strscpy(vdev->name, "qcom-venus-decoder", sizeof(vdev->name));
 	vdev->release = video_device_release;
 	vdev->fops = &vdec_fops;
@@ -1767,6 +1768,7 @@ static int vdec_probe(struct platform_device *pdev)
 	vdev->vfl_dir = VFL_DIR_M2M;
 	vdev->v4l2_dev = &core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	vdev->lock = &core->vdev_dec_lock;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret)
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 4666f42feea3..8522ed339d5d 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1558,6 +1558,7 @@ static int venc_probe(struct platform_device *pdev)
 	if (!vdev)
 		return -ENOMEM;
 
+	mutex_init(&core->vdev_enc_lock);
 	strscpy(vdev->name, "qcom-venus-encoder", sizeof(vdev->name));
 	vdev->release = video_device_release;
 	vdev->fops = &venc_fops;
@@ -1565,6 +1566,7 @@ static int venc_probe(struct platform_device *pdev)
 	vdev->vfl_dir = VFL_DIR_M2M;
 	vdev->v4l2_dev = &core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	vdev->lock = &core->vdev_enc_lock;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret)
-- 
2.40.1.698.g37aff9b760-goog

