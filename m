Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E30811925F2
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 11:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbgCYKk6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 06:40:58 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42204 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbgCYKk6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 06:40:58 -0400
Received: by mail-pl1-f195.google.com with SMTP id e1so650377plt.9
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2020 03:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DvKg2IHi3Qj70iBHg+WUL8Lkjl5cn54XoVnrEhL3Mm8=;
        b=jjB2X695zwinTyCqhhpHsSpEM1BFt/EQHCZAQkZrno2Ypr109M5Xwhg20kV0IpfCqs
         y0terG7TofI2Q9YoV1N7NVeZ74FBif6BvbIVxdnIdXBHZWnUtMGkRPfdtsBSW1RAFlnx
         CTblKpJvHFL+XYXDBQHhLGUh3VBAfgLTAF4+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DvKg2IHi3Qj70iBHg+WUL8Lkjl5cn54XoVnrEhL3Mm8=;
        b=eBxwxP+6CxZtwn3SiszKNx2KujvaNmNTwmIpQhyG2/wNy6u04w25/SaSgxKMILM61O
         WrPPe4IxMz1qIYm9lK3xMo0ZouokcP6OlXeEm9E5Q1V+VTtA3D70qOd8Q+0+7j4trC2S
         ix/qNNAqnSPn16w8U66HCxMFKsLsD+bmGlNhRdexXhVxbniwjV2rqkoqDV8i7pUeWnzt
         tKCgINBDe+6tqWoBjRgpE4wOIGytdOJRC4MubPCL26qIzG1b31KT++5NKKo2whzxolsP
         Cj9flECLe/xvo7+6kmJoJmnBmUfLgzo/Q8RtunGADIyKpgz2Tw6dtZDneB0oxAK3DV7J
         IHNw==
X-Gm-Message-State: ANhLgQ1DjBmbY/VCtz+LSIg4RqLMsi5Dp7zj+JtssKxKAXfKvpaXXP3K
        YKmf1wQnT1RuFrdsAdjiQdjONQ==
X-Google-Smtp-Source: ADFU+vvXebHRwUAL4QYgPA/E5Nymgdnz5gpZduRO6NtNGffciBeXDeNZkR6KYzkdrkpatyvnsfHqjQ==
X-Received: by 2002:a17:90a:6501:: with SMTP id i1mr3013827pjj.32.1585132856562;
        Wed, 25 Mar 2020 03:40:56 -0700 (PDT)
Received: from keiichiw1.tok.corp.google.com ([2401:fa00:8f:203:863a:e217:a16c:53f2])
        by smtp.gmail.com with ESMTPSA id v26sm5150320pfn.51.2020.03.25.03.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 03:40:55 -0700 (PDT)
From:   Keiichi Watanabe <keiichiw@chromium.org>
To:     virtio-dev@lists.oasis-open.org, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Kiran Pawar <Kiran.Pawar@opensynergy.com>,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Nikolay Martyanov <Nikolay.Martyanov@opensynergy.com>,
        linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        acourbot@chromium.org, alexlau@chromium.org, egranata@google.com,
        hverkuil@xs4all.nl, kraxel@redhat.com, posciak@chromium.org,
        stevensd@chromium.org, tfiga@chromium.org
Subject: [PATCH RFC 0/1] Support virtio objects in virtio-video driver
Date:   Wed, 25 Mar 2020 19:40:38 +0900
Message-Id: <20200325104039.196058-1-keiichiw@chromium.org>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This implements a feature in virtio-video driver to use exported virtio
objects as video buffers. So, the users will be able to use resources
allocated by other virtio devices such as virtio-gpu.

The virtio protocol for this feature is proposed by [1].

This commit depends on the following unmerged patches:
* Virtio-video driver patch [2]
* Patch series for virtio cross-device resources [3]
* ChromeOS's local patch to use data_offset for offset of multiplanar
  format [4]

[1]: https://markmail.org/message/wxdne5re7aaugbjg
[2]: https://patchwork.linuxtv.org/patch/61717/
[3]: https://patchwork.kernel.org/project/linux-media/list/?series=254707
[4]: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/1057eb620ccd3da4632c14df269d545cb9a1ccb2

Keiichi Watanabe (1):
  drivers: media: virtio: Support virtio objects in virtio-video driver

 drivers/media/virtio/virtio_video.h        |  26 +++-
 drivers/media/virtio/virtio_video_dec.c    |   1 +
 drivers/media/virtio/virtio_video_device.c | 131 ++++++++++++++++++++-
 drivers/media/virtio/virtio_video_driver.c |  25 +++-
 drivers/media/virtio/virtio_video_vq.c     |  81 ++++++++++---
 include/uapi/linux/virtio_video.h          |  15 ++-
 6 files changed, 243 insertions(+), 36 deletions(-)

--
2.25.1.696.g5e7596f4ac-goog
