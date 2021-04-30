Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC21736F938
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 13:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbhD3L1I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 07:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhD3L1H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 07:27:07 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AD7BC06174A
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 04:26:19 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id f11-20020a17090a638bb02901524d3a3d48so1549508pjj.3
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 04:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EkTyMd3fqCBBv4Wwr4P1rErcM9uEjejcW+0ZhgpoQpw=;
        b=I05y6Tr8dAPswoxUR+I2YMNcjW/rP+zuRZLWCGeD/YhQI4o78bukVpRzMQziw4TTz7
         /zibhpD9CFsZCqBa4GF89+4kGCs9CZBg41N8ITSxHafuQt0mGuaQ2Ob58M+f7GNMopwL
         NG2fn2gl/cUiOOrJkXoMAM3svhFWqU1BwErZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EkTyMd3fqCBBv4Wwr4P1rErcM9uEjejcW+0ZhgpoQpw=;
        b=l/Wu2vLCHb0DOHdALQWalnaKH5CoLxMPDgGvh4JkGo+AkqsiZ7dNkAgElx7t/gDIJN
         ylMzEvT43UkIqkldw16nRrnA6B+GcOLD2pijfHa6ogle5BfsyPwm8HuGv8hPtz0KpY4y
         Qi/oZ6WW2h+5TekojaXFaa2zN4xgSh27NelanA6frGMLIetFDAcPZngitEHkohfP2o7n
         A+v2YqsBw9IyM45BEiwm8+rrVqZ1xiDvNGAmpGiaJdT0FukmFlfcWLmpRj7dJdwFWXLF
         2X0xDUSQryyWpUsVTmXyfyrv/UXrWNS3/P5n2D45KwF/shKjEBuKIIMMwNzKZhUL6qq/
         mcPg==
X-Gm-Message-State: AOAM530scmYwuiViHDumjEdRoUS4p/kS82pxJEcRnMcY/L3Kpe/l41ov
        4NgaHtoCNKmuAG6SlW0+a2SRqA==
X-Google-Smtp-Source: ABdhPJyD8fThwL8MTsk/JrHK3LtPnup9yQcEV9jKiM43GUoIvXfnp1O6y2m6AhTQ0c44IOBYjs6Kvg==
X-Received: by 2002:a17:90b:f82:: with SMTP id ft2mr14444595pjb.0.1619781978184;
        Fri, 30 Apr 2021 04:26:18 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:2c33:77c9:7bef:267e])
        by smtp.gmail.com with ESMTPSA id l10sm1809457pjy.42.2021.04.30.04.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 04:26:17 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 0/5] media: uvcvideo: implement UVC 1.5 ROI
Date:   Fri, 30 Apr 2021 20:26:06 +0900
Message-Id: <20210430112611.475039-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

	This patch set implements UVC 1.5 ROI using v4l2_selection API.

v4:
-- split ROI rect selection API and auto-controls
-- handle very large ROI rectangles: limit to frame dimensions

Sergey Senozhatsky (5):
  media: v4l UAPI: add ROI selection targets
  media: v4l UAPI: document ROI selection targets
  media: uvcvideo: add ROI auto controls
  media: v4l UAPI: document ROI auto_controls
  media: uvcvideo: add UVC 1.5 ROI control

 .../media/v4l/ext-ctrls-camera.rst            |  23 +++
 .../media/v4l/selection-api-configuration.rst |  22 +++
 .../media/v4l/selection-api-examples.rst      |  27 +++
 .../media/v4l/v4l2-selection-targets.rst      |  24 +++
 drivers/media/usb/uvc/uvc_ctrl.c              |  19 ++
 drivers/media/usb/uvc/uvc_v4l2.c              | 185 +++++++++++++++++-
 include/uapi/linux/usb/video.h                |   1 +
 include/uapi/linux/v4l2-common.h              |   8 +
 include/uapi/linux/v4l2-controls.h            |   9 +
 9 files changed, 315 insertions(+), 3 deletions(-)

-- 
2.31.1.527.g47e6f16901-goog

