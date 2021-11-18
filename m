Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC72D456562
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 23:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhKRWMT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 17:12:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbhKRWMS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 17:12:18 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E519C061748
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 14:09:18 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id a9so14347302wrr.8
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 14:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8F5qdm3ybEdW5Uy32cxwiH+8yxtt0dvI8EoeBZUz2hM=;
        b=U3a4+FUrrk0N3+aDnRQJtc9Yo9LbnSpoqLFTW8qK/sY94i8woy0tbmLZI5//4uaZxz
         /3gNkaYOloKAEcrXDv9f45HQvgDIbeBC4KFUnYNNPoiQTXwPcQFOGQSj/8/gK5ii/S9V
         yezQZvLvMhS87qpMAcezojFu0O7bJ4Mj4e1uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8F5qdm3ybEdW5Uy32cxwiH+8yxtt0dvI8EoeBZUz2hM=;
        b=5Xr6bjWUGoi1hBT5ZU+txOUbwNkALYx/k845T8AkSChWui2QvIpcboXDweBIV4quNL
         8ukp+4+BiQvniMdW5he0c6o3m/ZfuZucjSG1JweO+TJ+CayQdOMcv48UP2vOnjI8svBC
         VB1hhIgOUM89z+2xz7UyKEqPuY5dWwtBcLmeCGBs8VXo4s8phO6JLiszS7CYDEfg49Um
         UQjXI5tXmFvjwGrSFL5AWfSdFwJOc+XjqaMXJumYj4uVDfSIiniij/Yg+Hgh9R8wgAAL
         3lGBi3DSLZUCVdKe1VrR0pTzoOjrgg1YkAvii/BnB0gBe77HlwoLiejfBUK4jfsb6RAc
         tO0w==
X-Gm-Message-State: AOAM531juvFMbjFNvNHJxXe2jGndZESESh1Dukn8w1erBzJits4L6VL1
        2y+IjClc0G87VvYhB2r4+mroAw==
X-Google-Smtp-Source: ABdhPJwzPu9lxfYVngVKF84nS3de+w1uAgNhi+8suRRgDBhSY06IXWjBkLJIcJjxofCpXHcnFezr/w==
X-Received: by 2002:adf:f08d:: with SMTP id n13mr1045300wro.395.1637273356534;
        Thu, 18 Nov 2021 14:09:16 -0800 (PST)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id f7sm13305180wmg.6.2021.11.18.14.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 14:09:16 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        "hn . chen" <hn.chen@sunplusit.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/8] uvcvideo: Fixes for hw timestamping
Date:   Thu, 18 Nov 2021 22:09:05 +0000
Message-Id: <20211118220913.299978-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add some fixes for fixing hw timestamp on some Logitech and Sunplus
cameras. The issues have been previously reported to the manufacturers.

Also include a patch to fix the current hw timestamping logic for ANY
uvc 1.5 model running at under 16 fps.

Ricardo Ribalda (8):
  media: uvc: Extend documentation of uvc_video_clock_decode()
  media: uvc: Allow quirking by entity guid
  media: uvc: Create UVC_QUIRK_IGNORE_EMPTY_TS quirk
  media: uvcvideo: Quirk for invalid dev_sof in Logi C922
  media: uvcvideo: Quirk for autosuspend in Logi C910
  media: uvcvideo: Allow hw clock updates with buffers not full
  media: uvcvideo: Refactor clock circular buffer
  media: uvcvideo: Fix hw timestampt handling for slow FPS

 drivers/media/usb/uvc/uvc_driver.c |  63 +++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  | 119 ++++++++++++++++++-----------
 drivers/media/usb/uvc/uvcvideo.h   |   4 +
 3 files changed, 142 insertions(+), 44 deletions(-)

-- 
2.34.0.rc2.393.gf8c9666880-goog

