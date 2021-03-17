Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7132A33F5D8
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 17:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbhCQQp2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 12:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232349AbhCQQpP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 12:45:15 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F98BC06174A
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 09:45:15 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id lr13so3677642ejb.8
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 09:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h74gqB1Y/vuFqN5JHLgON2tiYeFodPESAJgeCk1Im4Y=;
        b=gJl4CScQ5xxAjZ0Lb4AmNPPfRO8qaD9IM+FJqk8bYqKI/wFejsVJZX+t40qPurLJAT
         2xQnYZII69UQ5p541vbJz4b1eQacLcWN+2MEyRBt8Zb12hWk8TEIT+hd+z4yKHDx1qkN
         qnawKj/X/+WYlzPol61qd40Gm9hJnJKGZo/+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h74gqB1Y/vuFqN5JHLgON2tiYeFodPESAJgeCk1Im4Y=;
        b=GjVj6+t1jaEH58js8vUCmhVGf2AkeHravw4IyaMBv3cfbScO+eaDN4IkAJ/WZ8WfV2
         bfLqZQsWDGzgLId8odqrcOuYNOx0eqaviNZ73khnjuW0Y8lbheh3RQ41t3MwMIzg2cWP
         uw0yn0f0N9kPeIl/2KFf6wyrsmC6A0vRbneHlKJsPVIf8HhiSOnFPeXE9H2zTwB8an8E
         1E/h+yvWPFsC497kohOGBDR8Tm2rL/guxz609i3wstw2WWj9EJxFKFI4vmLr6/uDIAyH
         ZFXi+OjlDiMtMEIERSGN/NsL7Mmyb8q8j0Q/IdupMG8cc+TL49fDIxxZWDslyS/G0q/B
         pRgg==
X-Gm-Message-State: AOAM532fFQAO0I5fHXDnW4MdqbgvDvp/fpAeFOiMWypyp/dnRuLNd04+
        OUg3BYOvhEUtmNxOr2J8bhoCJA==
X-Google-Smtp-Source: ABdhPJyBQoQDFZpVtee0bSzCUPuTjmlERyAlp2jaQhvY4r9qfrMCw6x76qu4SBWxcoEVHEz8N2VSyQ==
X-Received: by 2002:a17:906:f44:: with SMTP id h4mr35540656ejj.204.1615999514036;
        Wed, 17 Mar 2021 09:45:14 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id hy25sm12088128ejc.119.2021.03.17.09.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 09:45:13 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 00/17] uvcvideo: Fix v4l2-compliance errors
Date:   Wed, 17 Mar 2021 17:44:54 +0100
Message-Id: <20210317164511.39967-1-ribalda@chromium.org>
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

Changelog  from v5 (Thanks to Hans)
- Move more checks to framework
- Rewrite the framework check_ext_ctrls
- Rewrite ctrl_is_inactive
- Add function ctrl_is_accessible
- Use ioctl name instead of boolean values

Hans Verkuil (1):
  uvc: use vb2 ioctl and fop helpers

Ricardo Ribalda (16):
  media: v4l2-ioctl: check_ext_ctrls: Fix multiclass
    V4L2_CTRL_WHICH_DEF_VAL
  media: v4l2-ioctl: check_ext_ctrls: Return -EINVAL on
    V4L2_CTRL_WHICH_REQUEST_VAL
  media: v4l2-ioctl: check_ext_ctrls: Return the right error_idx
  media: v4l2-ioctl: check_ext_ctrls: Fix V4L2_CTRL_WHICH_DEF_VAL
  media: pvrusb2: Do not check for V4L2_CTRL_WHICH_DEF_VAL
  media: uvcvideo: Do not check for V4L2_CTRL_WHICH_DEF_VAL
  media: uvcvideo: Set capability in s_param
  media: uvcvideo: Return -EIO for control errors
  media: uvcvideo: refactor __uvc_ctrl_add_mapping
  media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS
  media: uvcvideo: Use dev->name for querycap()
  media: uvcvideo: Set unique vdev name based in type
  media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE
  media: uvcvideo: Use control names from framework
  media: uvcvideo: Check controls flags before accessing them
  media: uvcvideo: Return -EACCES to inactive controls

 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c |   4 -
 drivers/media/usb/uvc/uvc_ctrl.c         | 284 ++++++++++++++----
 drivers/media/usb/uvc/uvc_driver.c       |  22 +-
 drivers/media/usb/uvc/uvc_metadata.c     |   8 +-
 drivers/media/usb/uvc/uvc_queue.c        | 143 ---------
 drivers/media/usb/uvc/uvc_v4l2.c         | 352 +++++------------------
 drivers/media/usb/uvc/uvc_video.c        |  13 +-
 drivers/media/usb/uvc/uvcvideo.h         |  43 +--
 drivers/media/v4l2-core/v4l2-ioctl.c     |  59 ++--
 9 files changed, 366 insertions(+), 562 deletions(-)

-- 
2.31.0.rc2.261.g7f71774620-goog

