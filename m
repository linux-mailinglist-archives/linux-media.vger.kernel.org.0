Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEA470F864
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 16:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235459AbjEXONx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 10:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbjEXONw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 10:13:52 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8BA912F
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 07:13:50 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-64d2a613ec4so739795b3a.1
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 07:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684937630; x=1687529630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wO3RSNxA2bvcMwE7iGwPIm41zuTKHIjUu9E4v9/gL8E=;
        b=fgp9s7kSBrKrbjGdMoq4qs1uiIKiZHyebpai2HjRqwrXnPo1utEpsXXwaxX7uG8xp3
         aPZbk7/ylkmoPxU6R9MHJJ7G+zkppEUbVWbogyZAugWpkF/+hw3n196IrnY8/mY9/Hpv
         938OV0hPP1FEzTH0e6QWzScI0p1w5fsci0HCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684937630; x=1687529630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wO3RSNxA2bvcMwE7iGwPIm41zuTKHIjUu9E4v9/gL8E=;
        b=hFDnB/5V2sl9Yj6uOFPG1WXV0+C8634mBMl7NNodwYKknYs1VZaNyFqQIAl1EtNGJT
         gAXqzCZ80EX5wluJkTjNc0YbFYrEb+EaakqRIe4FnJYnTRLNYdLopsFF0F88quoy/iY6
         zDjDuxiny7ZexjpD9SsPTbrcnupFNE1+CQDAYlYqVhTU7FI60OluDPdfMuHYc9ahC5/o
         4lBgb/8bNQlLO7puQsQVzWuYBNKsYDE+81pa28PtvMAGaUrF/NQLNeCBS4KQtFWtr5Hw
         o4voiabQdkDtCp1puq0ecbVcFGc6tCIGh60UUXFCorkYCH04d1IIiQY7jCjVFnYsQWNW
         kLMA==
X-Gm-Message-State: AC+VfDwM0tJTlzafRY+1MEKMY2tr/w2HMbK2flN6k+MhDZtmSO/EqFf8
        9+L6a7kMge/lSsJKNAlKJslFUw==
X-Google-Smtp-Source: ACHHUZ4P4sRzt2TYQMCb9B1mSIsTqQyFCrQvyJYBiIM5XwQc3vp6t6VJD39OEfRbHyL/iuAVDfBSEQ==
X-Received: by 2002:a05:6a00:cd2:b0:63d:4752:4da3 with SMTP id b18-20020a056a000cd200b0063d47524da3mr4035715pfv.25.1684937630019;
        Wed, 24 May 2023 07:13:50 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:9a0f:9704:f5b2:168b])
        by smtp.gmail.com with ESMTPSA id 22-20020aa79116000000b0063b898b3502sm7528503pfh.153.2023.05.24.07.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 07:13:49 -0700 (PDT)
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
Subject: [PATCHv3] media: venus: provide video device lock
Date:   Wed, 24 May 2023 23:12:48 +0900
Message-ID: <20230524141312.2558810-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230524135737.2557837-1-senozhatsky@chromium.org>
References: <20230524135737.2557837-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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
index 4f81669986ba..b6c9a653a007 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -113,7 +113,9 @@ struct venus_format {
  * @opp_pmdomain: an OPP power-domain
  * @resets: an array of reset signals
  * @vdev_dec:	a reference to video device structure for decoder instances
+ * @vdev_dec_lock: decoder instance video device ioctl lock
  * @vdev_enc:	a reference to video device structure for encoder instances
+ * @vdev_enc_lock: encoder instance video device ioctl lock
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

