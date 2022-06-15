Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23B5554CC44
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 17:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242206AbiFOPNH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 11:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232609AbiFOPNF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 11:13:05 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E97BF7B
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:13:03 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id g25so23868597ejh.9
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CWp/TDlLu0meMSWNP84sM360EY/f//zy8MWpOQZwKh8=;
        b=ZNe6rwXJn3bHt44oLsRQa1i5nHLJStfTICRqKaLQxhE65qqAXXBppV1CVQXVrIXJQB
         pO2ZMGtFeABXYMZ6NVA9GLS3mQwMVZMmBBzdZX+XCT+YHAPPEXQq3N7RJjiInXbRxKdL
         VyvN3L5S1SuTJNPBrteYlDPSCVJepp+gJtrdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CWp/TDlLu0meMSWNP84sM360EY/f//zy8MWpOQZwKh8=;
        b=Vy6LR9Op0OXl7nQ+py04v4naJSglu3fr2q4OggFk+Bwgw2LdavacyQ3g3o4ORdxWir
         ozb4DX5vPC4Rv9bqLF+HlwdKJOz2c7k+Td6BbEHmqMiy2/QF6fLfy3lG05SWjn4kDvnU
         OsbZQFvqk2dThiJWoglUvR6tzKXJron9nV+9y+GyPEpUjnBNg05kqAjIqLmREz/QZ5yD
         u3y0ha3Of8Ei9QBpFLXSqpxhmBqtpmnAc99m5enkaSH6hSzxyRhTuRzsIs2zeYEzRg+3
         rYjjV+wHsY4I3pnuvQuAGUT3fDoABhXCSu5JlTjdw5m8QpdEkV/9CqLkdbuWyz4heEl6
         1atQ==
X-Gm-Message-State: AJIora+WMZKVvvuEIJO6YnjIO5YbyJxXRsVClqIoxEUURa7YwMAuieb5
        m4oZi8uQd++8sXHG8sFCPXvnyQ==
X-Google-Smtp-Source: AGRyM1uJ98C4yp94uHU1gHvutdCx0hDu8ZwbNr65v6nhoOGvJ6VJP2sVFgDRX5HKNeCh3l55vLOD7Q==
X-Received: by 2002:a17:907:9727:b0:6fe:d943:312f with SMTP id jg39-20020a170907972700b006fed943312fmr239230ejc.263.1655305981887;
        Wed, 15 Jun 2022 08:13:01 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id b25-20020aa7cd19000000b0042bd2012196sm9610264edw.85.2022.06.15.08.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 08:13:01 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, senozhatsky@chromium.org, yunkec@google.com
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 0/8] uvcvideo: Fix handling of power_line_frequency
Date:   Wed, 15 Jun 2022 17:12:51 +0200
Message-Id: <20220615151259.77825-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series is a new version of "[PATCH v3 0/7] uvcvideo: Fix handling
of power_line_frequency", with an attempt to generalize the
UVC_QUIRK_LIMITED_POWERLINE quirk that it introduced and turn it into a
control mappings override mechanism.

The goal is still to support the UVC 1.5 power line frequency control
extra option (patch 1/7), and work around an issue with devices that do
not implement support for disabling the power line frequency (patches
2/7 to 7/7).


Changelog v8:
- Add support for per-device control mapping overrides
  Fix invalid memory access
- Support minimum for V4L2_CTRL_TYPE_MENU
  New patch
- Limit power line control for Quanta UVC Webcam
  Fix id


Ricardo Ribalda (8):
  media: uvcvideo: Add missing value for power_line_frequency
  media: uvcvideo: Add support for per-device control mapping overrides
  media: uvcvideo: Support minimum for V4L2_CTRL_TYPE_MENU
  media: uvcvideo: Limit power line control for Quanta UVC Webcam
  media: uvcvideo: Limit power line control for Chicony Easycamera
  media: uvcvideo: Limit power line control for Chicony Easycamera
  media: uvcvideo: Limit power line control for Quanta cameras
  media: uvcvideo: Limit power line control for Acer EasyCamera

 drivers/media/usb/uvc/uvc_ctrl.c   | 87 ++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvc_driver.c | 89 ++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  2 +
 3 files changed, 163 insertions(+), 15 deletions(-)

-- 
2.36.1.476.g0c4daa206d-goog

