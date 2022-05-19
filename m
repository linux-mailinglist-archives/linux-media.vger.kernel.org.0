Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7332A52DA38
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 18:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242027AbiESQ34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 12:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242030AbiESQ3y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 12:29:54 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC29D80BD;
        Thu, 19 May 2022 09:29:51 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id t144so3833282oie.7;
        Thu, 19 May 2022 09:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nb+0LTfVaj8me5eEZibYeHxpIZnXgwjVRTYa6w5qhzY=;
        b=NYj5CO2VsMSeZfNk5uQQDLZWkX1iD5+rTQlPxO2qRHZTTl85aPPJ06nmfxTMPs65KE
         u9DnkncSOpJMFJw7zRUxMgaFdjFqcO15dzXKBAuTgrQdzp4XtIuDikbxor3m9vHMkyJE
         bBPtwqX0ReAgQlPzMdLZcXyU2kIJ0VPp6m7kc+tPavyKFrUeiGUxIvBq6MciM2GJgL7b
         yHOMmU7x5L/3ic91Y62JHVbn0bM9DB3xIoAzVP1j0MLnSx+1yOrKtom3IDEeC3pGaQJI
         JB6tSgYHnmLUF4g5JTMh5YtIL2faD/iQSK2+WfD51liOK2vMxcd+RiuhZ4xkAL8sXp6q
         Vk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nb+0LTfVaj8me5eEZibYeHxpIZnXgwjVRTYa6w5qhzY=;
        b=F+ZqeZRkA01LyMgHGrwcOa1F2EwRl269Uxrqo8MrOul3hUTaOjsFmTcPchUMLwI9JN
         OdejTVxJPVGk1/pPJeYx+bv3yDkxCWKpFqSiNByXsokHIoXgyuSxf0IJ0RT8ygn8TFMZ
         uY566SdJHH57oymLVjVmf7d6/ebzndr6+iS2o3c8XSCIv0TaJ4zImTkoZGHoC/8p/JtS
         wbLnYcs9hJu9xp030YEwsl3MmxuE0r5ZMJ9xoPwI6wRJOJdWjHexlI5fYgC0Htcs11wO
         NcfEbNTBnJEp42/wX0bVQLSOp2AUB6AiKeIvGRV1mUEQCmNn4mUGfclzw3j1JMjXlz5n
         gfLA==
X-Gm-Message-State: AOAM530DXzK7Zn6Jqt+mjmXqH3g17RBv4jVG9YysbbS7dwR4JZ6y9ubv
        uoFVc4aYIFOf7qXsJYMJ98valYGXvbnvlg==
X-Google-Smtp-Source: ABdhPJwDVr9wsNlcIGh7UsCVXq9QcbbDq+mPnQX5EXGmcbCwnYewaZLTbFKIopObZcvOGyloWf9phg==
X-Received: by 2002:a05:6808:140c:b0:326:cd8f:eb71 with SMTP id w12-20020a056808140c00b00326cd8feb71mr3296913oiv.257.1652977789643;
        Thu, 19 May 2022 09:29:49 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id n4-20020a056870844400b000e92295f8acsm36562oak.2.2022.05.19.09.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 09:29:49 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org,
        emma@anholt.net, mripard@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [RESEND 0/6 v2] Support Geekworm MZP280 Panel for Raspberry Pi
Date:   Thu, 19 May 2022 11:29:29 -0500
Message-Id: <20220519162935.1585-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

This patch series is to add support for the MZP280 panel for the
Raspberry Pi. This panel requires adding support for Mode 3 of the
Raspberry Pi DPI connector, which necessitates a new media bus format.

This patch series has been tested on my Raspberry Pi 4 with version 1
of the panel in question.

Changes since V1:

 - Added documentation for vendor string.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Chris Morgan (6):
  dt-bindings: vendor-prefixes: Add Geekworm
  media: uapi: Document format MEDIA_BUS_FMT_RGB565_1X24_CPADHI
  media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
  dt-bindings: display: simple: add Geekworm MZP280 Panel
  drm/panel: simple: add Geekworm MZP280 Panel
  drm/vc4: dpi: Support DPI interface in mode3 for RGB565

 .../bindings/display/panel/panel-simple.yaml  |  2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 .../media/v4l/subdev-formats.rst              | 37 +++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++
 drivers/gpu/drm/vc4/vc4_dpi.c                 |  4 ++
 include/uapi/linux/media-bus-format.h         |  3 +-
 6 files changed, 76 insertions(+), 1 deletion(-)

-- 
2.25.1

