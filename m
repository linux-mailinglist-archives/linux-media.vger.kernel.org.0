Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3140D52D80C
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 17:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241170AbiESPnA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 11:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241274AbiESPlY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 11:41:24 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E97E13F44
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 08:41:20 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id n23so7549402edy.0
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 08:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dnQaBZGKU69MTwRS8qWTSCDZ3R9++iPFedE4qLezN24=;
        b=G7MwAWrsF3KGXbnCiX64lpZaEv58Gq5Lv4QEGx6GLIkwE1e2uQwyshn1JeX9La5hhR
         BtwZEOgoX2vdWjguSOz05Ht9Nz/AJXePmkG4ji3Q1LiJSUT2lkWLFEeKxKu5p7lS7y0x
         tvXRyS3NOAMuYs7uVg9KJPVZQqY4H02kMhjPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dnQaBZGKU69MTwRS8qWTSCDZ3R9++iPFedE4qLezN24=;
        b=oAqPiaqL8d3xc6DEYbqMKEh/MBrlq2Sj803F4fk23DNeKppOrFcEWTTIXsFAUdBr4+
         M46tNSUzXpRNr2whunHZlcPjdIQ/ZWND3PBOUZAMlFHTnRF8tPNTTTWBGOnOc3GdujhU
         3M9/iQ92LhZrhHqMD0CI5vIIYxUwxgRFcGm+RegkLGOBWwnA0dbvdUVw8AW7nfRjvLa/
         RrMJNtI1ZF4f6Te8Q+H+4f8g1DkMgy+Kgfne42vOyBogg1Rgh1ZDll/cB1QyjCeEuNWF
         JUIMCuKaz7ZTrNVlJzu0e3jQKNZLVvUjDP1+sz7jdyYs7qMevNZhP/6vNr2BGeoZEJHF
         0w6Q==
X-Gm-Message-State: AOAM530CpEe9An4clA2rMAgCpPM+Rk2mJPJkORFLliJ5R36IMVVSZPSR
        SQ7GjGgL3eNJ1D7M4bN6xFXcyw==
X-Google-Smtp-Source: ABdhPJypS1rlHoxNjaPj41+APsPTv2k/LHJYFJ+iXvW2YCPP2gn8R0PSjPRZ/QYqrwnk7P0YpQ5uyw==
X-Received: by 2002:a05:6402:f09:b0:42a:be2f:ceeb with SMTP id i9-20020a0564020f0900b0042abe2fceebmr6090840eda.110.1652974878684;
        Thu, 19 May 2022 08:41:18 -0700 (PDT)
Received: from alco.corp.google.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id k24-20020a056402049800b0042aae307407sm2990092edv.21.2022.05.19.08.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 08:41:18 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@google.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/4] uvcvideo: Fix handling of power_line_frequency
Date:   Thu, 19 May 2022 17:40:55 +0200
Message-Id: <20220519154100.333091-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The uvc standard recognizes 4 different values for this control, but we
were only using the first 3.

Also add a quirk for those devices that only support 50 and 60 Hz.

Ricardo Ribalda (4):
  media: uvcvideo: Add missing value for power_line_frequency
  media: uvcvideo: Add UVC_QUIRK_LIMITED_POWERLINE
  media: uvcvideo: Add LIMITED_POWERLINE quirks for Quanta UVC Webcam
  media: uvcvideo: Add LIMITED_POWERLINE quirks for Chicony Easycamera

 drivers/media/usb/uvc/uvc_ctrl.c   | 28 ++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 56 insertions(+)

-- 
2.36.1.124.g0e6072fb45-goog

