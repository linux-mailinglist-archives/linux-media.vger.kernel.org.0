Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB0AA1FBFC8
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 22:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731617AbgFPUPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 16:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731605AbgFPUPe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 16:15:34 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D401C061755
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 13:15:34 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id p20so23031223ejd.13
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 13:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=BGLMp6W0PR9qbVRtwHUKF+M1BRjphrKCWDg7JcAuzh8=;
        b=jvHnsL6FO0nWv5PfrJ24t5VsXUCFOqcjn3Ozon0RDmFMvOkTS3/XJzzO74pb0VasjP
         CXUPPP88Ukda5TstCi2Ty3Oe+7uXTkTnSs4AGx8/ldkA/3SMIp2/RKLgbSdUnxhxU2rX
         asuUs3XoLqx7OPDxINGwZUvDoDUst7f4VfLzKi6psp+3pXm1uG5hv1UqNgTrMf2jMG1a
         r0akPFCRVDZ4JSKCrTHZBAaUDL3fHuSItz1g0q21t8jr0zjv7/dQAeSWzEVquCNjEc+I
         l125Lmov0FEVJcMqt8Kh9arLLN48PXL6KZWXv+/MGtfNQmBmL44dixfGPWKOnUVZTj+P
         B5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BGLMp6W0PR9qbVRtwHUKF+M1BRjphrKCWDg7JcAuzh8=;
        b=d1YGVlWs8MN17h6ewAeaMHRYBHOQifA8eXF1KPACXyGCIvKHDTZ9GxPvMwfHtEnwMa
         jY6bh2h93jmBsR1EYen52Hzf9wY+Bt4LLZvFXkdgQvIadplS/YXYfWKMuR661fM9RcjZ
         69tmmifiC4p2/FIgBPPVTRVFj95t4FSFQNmM5Lhu9LpVFvMknB1h1jmZlRGlSmYjLooF
         iFCxwOuGJm2/DHr+hS+ruIjPEQt+JD3I0e0F6a0i5beFj47EaEdzRW6EkOolMQ9EKTOq
         QmJI+nPq+5VS/di6j09uDilNrbc5TX3jbma0k8DloxxZtBIkRrZUIM8aZ+emiJs972l8
         gQtA==
X-Gm-Message-State: AOAM533t/ArhbvIf40W4XYi7CA2MQ4pKlxYgmFacWkHvYmCzd82Kdx6A
        w87Q4k0BBauMQ+NtGGJJmMHsPzozKe1D5w==
X-Google-Smtp-Source: ABdhPJw3mYvV55HBtHNA9JjObUxPC2W7cjqDapIoSTI4JGxIsAd0Yy6Jz3LUKISoUNz+Uy0YJR3RHg==
X-Received: by 2002:a17:906:6b8a:: with SMTP id l10mr4131943ejr.465.1592338532832;
        Tue, 16 Jun 2020 13:15:32 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.gmail.com with ESMTPSA id b14sm11602658ejq.105.2020.06.16.13.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 13:15:31 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/4] Add two new v4l controls and implementation
Date:   Tue, 16 Jun 2020 23:14:42 +0300
Message-Id: <20200616201446.15996-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Here is version 2 with following changes:
 - in 2/4 added HFI property to set frame quality.

Comments are welcome.

regards,
Stan

Maheshwar Ajja (1):
  media: v4l2-ctrls: Add encoder constant quality control

Stanimir Varbanov (3):
  venus: venc: Add support for constant quality control
  v4l2-ctrl: Add control for intra only decode
  venus: vdec: Add support for decode intra frames only

 .../media/v4l/ext-ctrls-codec.rst             | 19 ++++++++++
 drivers/media/platform/qcom/venus/core.h      |  2 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  | 37 ++++++++++++++++++-
 .../media/platform/qcom/venus/hfi_helper.h    | 10 ++++-
 drivers/media/platform/qcom/venus/vdec.c      |  7 ++++
 .../media/platform/qcom/venus/vdec_ctrls.c    |  9 ++++-
 drivers/media/platform/qcom/venus/venc.c      | 14 ++++++-
 .../media/platform/qcom/venus/venc_ctrls.c    |  8 +++-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  4 ++
 include/uapi/linux/v4l2-controls.h            |  3 ++
 10 files changed, 108 insertions(+), 5 deletions(-)

-- 
2.17.1

