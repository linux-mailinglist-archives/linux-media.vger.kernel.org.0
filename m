Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76DD33DBD1
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 19:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239569AbhCPSAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 14:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239557AbhCPSAL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 14:00:11 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C6FC061756
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 11:00:09 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id dx17so73729500ejb.2
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 11:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ckk2erlqddqu+PG/7Bp2HBZ/AtQ6BgEsYvEVjbfanBw=;
        b=F4cmoL2cuQ7J+/UksOxy2Cyk73iLpsXM2Lw2bkdu0FlxwBhibMbM7bdd/OrqU5UAHp
         8+edCkQYZfQZzdpEZOSQ3rm2+upKBaeugDnkfNbmJ4xxRNwfCqM7uL1vjQW7RAa7fAFt
         +w33wVdBJnI6h+VhoT3mowWvdS/9K2eF9RSCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ckk2erlqddqu+PG/7Bp2HBZ/AtQ6BgEsYvEVjbfanBw=;
        b=q2rB/1y9HJIgoECXxbOqBbfUame7a25kbvNCQZB4qwZHn1KAL4Cl9YR8H1h+DzwkNe
         LUBncjc5HqpiLEIiPlsMFBixLLiTtuuicIsRHtl+0ceKP631X25O4ej5MHv9l+KbJPMz
         05997yEcfGQoGh5eHBI45RU4wcDTZW1i0WjxkrwasNH4mR3XEOK4tUCIOAFx2rk/1W7i
         iAvt7Wo5t71cr9lEm3AxWDobeSeKTnGZgWKY7Fb0uFt2qYCYRBLLuLz9JHPZS6HN99sq
         H5hWCYz5WiEFGYO8h2F6vK39DrvVM3MBOFcmGQ8bkb5MDiyVREW48ynOzuCNhTQ7OOxI
         V6fw==
X-Gm-Message-State: AOAM532mijRK+par7QzINao+g9xv+SwM85WCX3n80fLoiH/bKhJqACCg
        ZHfQ16t9WeqzG0AExhjihSsQgA==
X-Google-Smtp-Source: ABdhPJwc4piGP+4s8AlfA/HkFlkdi4TkpIECrDLX5CnIQAa932qG9uExuxIDNqGFTJNsXfcvxsx+aw==
X-Received: by 2002:a17:906:2db2:: with SMTP id g18mr31466097eji.73.1615917607893;
        Tue, 16 Mar 2021 11:00:07 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id c19sm10953182edu.20.2021.03.16.11.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 11:00:07 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 00/13] uvcvideo: Fix v4l2-compliance errors
Date:   Tue, 16 Mar 2021 18:59:50 +0100
Message-Id: <20210316180004.1605727-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2-compliance -m /dev/media0 -a -f
Total for uvcvideo device /dev/media0: 8, Succeeded: 6, Failed: 2, Warnings: 0
Total for uvcvideo device /dev/video0: 54, Succeeded: 50, Failed: 4, Warnings: 2
Total for uvcvideo device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0
Grand Total for uvcvideo device /dev/media0: 108, Succeeded: 102,
Failed: 6, Warnings: 2

After fixing all of them we go down to:

Total for uvcvideo device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
Total for uvcvideo device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
Total for uvcvideo device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0
Grand Total for uvcvideo device /dev/media0: 108, Succeeded: 108,
Failed: 0, Warnings: 0

YES, NO MORE WARNINGS :)

Note that we depend on:
https://patchwork.linuxtv.org/project/linux-media/patch/20210315172531.101694-1-ribalda@chromium.org/

With Hans patch we can also pass v4l2-compliance -s.

Changelog  from v4 (Thanks to Hans and Laurent)
- Use framework names for controls
- Check the control flags before accessing them
- Drop meta headers instead of returning error
- Fix error_idx handling in v4l2-ioctl

Hans Verkuil (1):
  uvc: use vb2 ioctl and fop helpers

Ricardo Ribalda (12):
  media: v4l2-ioctl: Fix check_ext_ctrls
  media: uvcvideo: Set capability in s_param
  media: uvcvideo: Return -EIO for control errors
  media: uvcvideo: Check controls flags before accessing them
  media: uvcvideo: refactor __uvc_ctrl_add_mapping
  media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS
  media: uvcvideo: Use dev->name for querycap()
  media: uvcvideo: Set unique vdev name based in type
  media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE
  media: uvcvideo: Return -EACCES to inactive controls
  media: uvcvideo: Use control names from framework
  media: v4l2-ioctl: Set error_idx to the right value

 drivers/media/usb/uvc/uvc_ctrl.c     | 209 +++++++++++----
 drivers/media/usb/uvc/uvc_driver.c   |  22 +-
 drivers/media/usb/uvc/uvc_metadata.c |   8 +-
 drivers/media/usb/uvc/uvc_queue.c    | 143 ----------
 drivers/media/usb/uvc/uvc_v4l2.c     | 373 ++++++---------------------
 drivers/media/usb/uvc/uvc_video.c    |  13 +-
 drivers/media/usb/uvc/uvcvideo.h     |  41 +--
 drivers/media/v4l2-core/v4l2-ioctl.c |  40 ++-
 8 files changed, 303 insertions(+), 546 deletions(-)

-- 
2.31.0.rc2.261.g7f71774620-goog

