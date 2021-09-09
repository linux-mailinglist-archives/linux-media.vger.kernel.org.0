Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96124059FE
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 17:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241121AbhIIPE1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 11:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239166AbhIIPCG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 11:02:06 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A6FC061762
        for <linux-media@vger.kernel.org>; Thu,  9 Sep 2021 08:00:51 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id z19so3059894edi.9
        for <linux-media@vger.kernel.org>; Thu, 09 Sep 2021 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WTzgTP74nfsbUD8pXywJsWRsF+0Cf9A+HA+Kb2BopBE=;
        b=R/Vgfcw6MK4tC9u39o9s2xl8piCTG3LboA0HV9RsUYCCVHMEh8YlD7W0jjIBEodGYW
         Mr1MN3r5v+KtwTA3yitJ1S7EqUl8yvkd/xWXXjyI5/3IaBSWBuGeJkwNC4HrAgnqxxQN
         VLBZJyyMcuG6yJBH7cPKkPFgASZGSyg8eFP7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WTzgTP74nfsbUD8pXywJsWRsF+0Cf9A+HA+Kb2BopBE=;
        b=XOKqR14d1wL9eQmdby7c8dxSbAIY0qQYFkLWbBgo5vZ6tW2UHao13oQc6ZoAseRpsB
         a+CJVV5kVspF8guZsGnT+wIFRti40DBX1Ezfqn5lXoExBso29hWYAZHKqpKRiVk+/0eb
         3oC5+Aojp7zeWWF6fLurrBPOV49eabGrwX7YleWogSFY5N2tNGAF7xToOkV8AbzeN2Pj
         NsjCRU8AOPs9pSZJ1AkzhxqBOLktnGjdRin2b1HOdDOXqEhfbMU9Ma8Xzy6YZYEPcfhe
         NhiaOct8U0db14LNH/Bs0fv25YQoB6Acd9KbpAkr1e3K5P/sCbOF0glDnWBy4zUJTrGV
         GH/Q==
X-Gm-Message-State: AOAM533JUg0pFKsi5MjWY4+E4Q/p6hmDC4DKQfVsWmzJSECHyIjwWfp7
        LmIv6CDC2wN8TY/i0KO8CRkGepzfBD2bIQ==
X-Google-Smtp-Source: ABdhPJxPtD3zlOJOvoAcxE4VY+AtuUYjtJPNpERApArGwo1R1+FBk55g0g5DQGarX00o7sZ2Rzz+0Q==
X-Received: by 2002:a05:6402:2686:: with SMTP id w6mr3648595edd.231.1631199649537;
        Thu, 09 Sep 2021 08:00:49 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h8sm1139644ejj.22.2021.09.09.08.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 08:00:49 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/4] Follow-up patches for uvc v4l2-compliance
Date:   Thu,  9 Sep 2021 17:00:42 +0200
Message-Id: <20210909150046.57615-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset contains the fixes for the comments on "v10 of Fix
v4l2-compliance errors series". In particular to the patches

-uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
-uvcvideo: improve error handling in uvc_query_ctrl()


Hans Verkuil (2):
  media: uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
  media: uvcvideo: improve error logging in uvc_query_ctrl()

Ricardo Ribalda (2):
  media: uvcvideo: Return -EACCES for Wrong state error
  media: uvcvideo: Do not return positive errors in uvc_query_ctrl()

 drivers/media/usb/uvc/uvc_ctrl.c  | 47 ++++++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvc_v4l2.c  |  4 +--
 drivers/media/usb/uvc/uvc_video.c | 15 +++++-----
 drivers/media/usb/uvc/uvcvideo.h  |  3 +-
 4 files changed, 58 insertions(+), 11 deletions(-)

-- 
2.33.0.153.gba50c8fa24-goog

