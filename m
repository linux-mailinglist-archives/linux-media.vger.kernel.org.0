Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458BF33C45C
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 18:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbhCORge (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 13:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232795AbhCORgN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 13:36:13 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73BCC06175F
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:36:12 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id mm21so67601816ejb.12
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pfFjLIspJMD6JWhPLQLwaYmctbTWBrYbT3cxyzN10po=;
        b=W+0qM46epmi/4IREYm3kaETWt2RjH/hJxIPDMLbTLeDDKfRErmpluus3BR+QU7YfdT
         LroVhM/C+UzqdQuvXdYCykd4uTBqHcl2hQJ54H+EUYF56QVE5iP0/vX8aC/aRxBHFazj
         Vn/4SIL1SUfpiYQ8gySAJMfwQPKfYVf74jGtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pfFjLIspJMD6JWhPLQLwaYmctbTWBrYbT3cxyzN10po=;
        b=oUrOC+WszMBeQgdOHD1hO+5dUXAen13FWWS3hV4NEnZ5RrsZBLonvRv+1f0ZDoSLN/
         uxYEvAFIYlLzxPBUW+289wRdJoud7cKzEa6ILnyNdDsD3SVFtmlNXMCBGdJP887HzWj/
         i0rNp9KDI8L5pyah2v6xxTsRX87wq5NZ8ZqJrfS3gWpdfrCHxQ+CMV5DWQu6C91Q0UJW
         3m1besQEPr+DhVut6fIkU4KW2p4NI18rzjMgyY8mGgoa57udZ/I+jP7wDqgUPD0ABAsL
         skqDE2bZBPAKohVDu3WCKKHTzBG3iAPUnsuWQwAGdEw05lvtvEXLhTZyh++Ff71Cb2Ag
         VQtw==
X-Gm-Message-State: AOAM533ib47FNYQLTDcfyt295ueZfVNAYApgB4F5nGRNJKCKxKKvUajK
        NhGZgq12LT4Q4xms6qxHLUlCGQ==
X-Google-Smtp-Source: ABdhPJyUtkTlZ+uiLxlSmxk7OCwopar9Tl1WIdJTld4H/1dwhZtBTa5FZ+gTEgd3xCBCnrTySPjSDg==
X-Received: by 2002:a17:906:1a44:: with SMTP id j4mr25244493ejf.401.1615829771736;
        Mon, 15 Mar 2021 10:36:11 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a3sm8109239ejv.40.2021.03.15.10.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 10:36:11 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 00/11] uvcvideo: Fix v4l2-compliance errors
Date:   Mon, 15 Mar 2021 18:35:58 +0100
Message-Id: <20210315173609.1547857-1-ribalda@chromium.org>
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
Total for uvcvideo device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 3
Total for uvcvideo device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0
Grand Total for uvcvideo device /dev/media0: 108, Succeeded: 108,
Failed: 0, Warnings: 3

With Hans patch we can also pass v4l2-compliance -s, but it is a WIP.

Changelog v3 (Thanks to Hans and Laurent)

- Return -EACCES on inactive controls
- Change unique name of the entities
- Increase metadata buffer size

Hans Verkuil (1):
  uvc: use vb2 ioctl and fop helpers

Ricardo Ribalda (10):
  media: v4l2-ioctl: Fix check_ext_ctrls
  media: uvcvideo: Set capability in s_param
  media: uvcvideo: Return -EIO for control errors
  media: uvcvideo: set error_idx to count on EACCESS
  media: uvcvideo: refactor __uvc_ctrl_add_mapping
  media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS
  media: uvcvideo: Use dev->name for querycap()
  media: uvcvideo: Set unique vdev name based in type
  media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE
  media: uvcvideo: Return -EACCES to inactive controls

 drivers/media/usb/uvc/uvc_ctrl.c     | 154 +++++++++++++--
 drivers/media/usb/uvc/uvc_driver.c   |  22 ++-
 drivers/media/usb/uvc/uvc_metadata.c |   8 +-
 drivers/media/usb/uvc/uvc_queue.c    | 131 -------------
 drivers/media/usb/uvc/uvc_v4l2.c     | 283 +++------------------------
 drivers/media/usb/uvc/uvc_video.c    |   5 +
 drivers/media/usb/uvc/uvcvideo.h     |  36 +---
 drivers/media/v4l2-core/v4l2-ioctl.c |  25 ++-
 8 files changed, 210 insertions(+), 454 deletions(-)

-- 
2.31.0.rc2.261.g7f71774620-goog

