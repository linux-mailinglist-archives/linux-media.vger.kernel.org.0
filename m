Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0C44CBF92
	for <lists+linux-media@lfdr.de>; Thu,  3 Mar 2022 15:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233890AbiCCOLT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Mar 2022 09:11:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233880AbiCCOLS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Mar 2022 09:11:18 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C0418CC19
        for <linux-media@vger.kernel.org>; Thu,  3 Mar 2022 06:10:32 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id y5so3268401wmi.0
        for <linux-media@vger.kernel.org>; Thu, 03 Mar 2022 06:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tz0v8Gkwf2UF0vx6sGeIa617YAcjQhkWG8mkpG1CJNs=;
        b=xukswhfzj+I8Z8GeKn1vhUViacvrF1x0aoe72Ax7uy04TWKURJ0QNK3SZczsaSUy6H
         3Zi0NB6Dh1tZt40SAeHeDT9M9J67VO6CwBqI16ONsq0htarsh0SePEyQWkh73CiA8Drj
         LkhSTbnmDxZyFNHgOZm7tLB/cg46NV+6USMODfjQbaENgK9q79P7uiLvLOqRlQWohQPJ
         EFTF3EXZDp+RaIr7yL3u1dpvBJDC5aIF0fOi/XArCzzfB6/9P63XXY3KSYFSO5hbOPQ2
         nZl+CgzM+cCRzDa2wP3nIoUwri1UY5hIZHVObJIm7si4exxM310bgHx1dyxPPi5aat97
         FwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tz0v8Gkwf2UF0vx6sGeIa617YAcjQhkWG8mkpG1CJNs=;
        b=6I/VzmAFOzYn29/XkKqscZNOUUBGQvUlkcUVJtU7uChl/21VsJMc2PS5dWBvOc9dAb
         plTJraIU3Z7UaSAUwuvzteq+lOMlp0JNABzTzJh9/wh2kXTThkgIOJ4RDS+MUu/CW18N
         R49Tg9eFygmFEPSyEvtxCVsb7uw53/mHepc7y5Oc6pOfg1d8Jp41oGGYiA2qbZ2MdqxV
         jm3uaorfhFyfCVzCZ6ddbre8Tqev3FYTSbBSGRfKqKJuquhYJ/s7jyUHxYGHw9Fb/sjB
         JcO+n2hDiYTUNPX7Sda9q3xAlBcLOHfOsPA9SiQiysEbWHWSM5cEZ2eHoRdSkkrCDJyt
         y2Og==
X-Gm-Message-State: AOAM532bj30w9ZxJD+O+oJ30ZtgPx+Gqq3lRxlNpuSAZxL457HqcVGpJ
        pyay6z+nrbyDGXCxSkBcidsifhN9rEb1fpmS
X-Google-Smtp-Source: ABdhPJygf7IaKJmIEPjMoVa4/JDsQjl434uIxOZgPQAwxeeQUR1aDOoitT8pT6J0v2OvcYuPwjqXSw==
X-Received: by 2002:a05:600c:2241:b0:382:9bc7:4e66 with SMTP id a1-20020a05600c224100b003829bc74e66mr3888363wmm.21.1646316630532;
        Thu, 03 Mar 2022 06:10:30 -0800 (PST)
Received: from localhost.localdomain (hst-221-13.medicom.bg. [84.238.221.13])
        by smtp.gmail.com with ESMTPSA id ba2-20020a0560001c0200b001f0653f1097sm194312wrb.69.2022.03.03.06.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 06:10:29 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [RFC/WIP v2 0/6] HEIC image encoder
Date:   Thu,  3 Mar 2022 16:10:04 +0200
Message-Id: <20220303141010.573408-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
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

Hello,

This is the second version of the RFC for HEIF HEVC image encoder aims to revive the discussion.

Changes since v1 include:

* change the new pixel format to V4L2_PIX_FMT_HEIF_HEVC (1/6).
* created a new HEIF control class and control IDs (2/6).
* add two additional steps in stateful encoder spec (3/6).
* improve the Venus image encoder (4/6 - 6/6).

Comments are welcome.

First version can be found at:
https://lwn.net/ml/linux-media/20210429132833.2802390-1-stanimir.varbanov@linaro.org/

-- 
regards,
Stan

Refernces:

[1] https://0xc0000054.github.io/pdn-avif/using-image-grids.html#fnref:3
[2] https://nokiatech.github.io/heif/technical.html
[3] https://github.com/lclevy/canon_cr3/blob/master/heif.md
[4] https://github.com/nokiatech/heif/blob/master/srcs/api-cpp/GridImageItem.cpp
[5] https://github.com/strukturag/libheif/blob/master/libheif/heif_context.cc#L163
[6] https://androidx.de/androidx/heifwriter/HeifEncoder.html

Stanimir Varbanov (6):
  media: Add HEIF HEVC compressed pixel format
  v4l: Add HEIF control class and control IDs
  docs: dev-encoder: Add additional steps for image encoding
  venus: helpers: Add a new helper for buffer processing
  venus: hfi: Add hfi property for enable grid
  venus: Add HEIC image encoder

 .../userspace-api/media/v4l/dev-encoder.rst   |    6 +
 .../media/v4l/ext-ctrls-heif.rst              |   47 +
 .../media/v4l/pixfmt-compressed.rst           |   12 +
 drivers/media/platform/qcom/venus/Makefile    |    2 +
 drivers/media/platform/qcom/venus/core.h      |   29 +
 drivers/media/platform/qcom/venus/helpers.c   |   21 +
 drivers/media/platform/qcom/venus/helpers.h   |    1 +
 drivers/media/platform/qcom/venus/hfi.c       |    1 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  |    9 +-
 .../media/platform/qcom/venus/hfi_helper.h    |    5 +
 drivers/media/platform/qcom/venus/ienc.c      | 1527 +++++++++++++++++
 drivers/media/platform/qcom/venus/ienc.h      |   14 +
 .../media/platform/qcom/venus/ienc_ctrls.c    |   99 ++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   10 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/uapi/linux/v4l2-controls.h            |    9 +
 include/uapi/linux/videodev2.h                |    1 +
 17 files changed, 1793 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-heif.rst
 create mode 100644 drivers/media/platform/qcom/venus/ienc.c
 create mode 100644 drivers/media/platform/qcom/venus/ienc.h
 create mode 100644 drivers/media/platform/qcom/venus/ienc_ctrls.c

-- 
2.25.1

