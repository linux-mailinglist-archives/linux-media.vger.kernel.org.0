Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0B8C337267
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 13:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232907AbhCKMU6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 07:20:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232798AbhCKMUo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 07:20:44 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAFF5C061760
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:43 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id z1so2431543edb.8
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3jRi+DEoy6afFFrH4TaGBu+jvozxLIl07t3ElQ0Uqzg=;
        b=W84MXY0g7BeGZbqav9D2ApUEJDgeDSIr87M6l9HqItenIvfBcoe09i14yocBIc63dY
         s/cZ0VDpQSImLyOn8MD8/nsX75X6MbDzksh8vek5ygpdQs+f9mjceDVNhHa1IFtu5wBY
         JViLwckTVk8Ds0wzmwmsUrGuKg63jARipS/VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3jRi+DEoy6afFFrH4TaGBu+jvozxLIl07t3ElQ0Uqzg=;
        b=ZPJ+40MPc/TW07IxpBIzoBW/eQ6gjAylEQyUEUtkHpk3Cd52U3s36OvctVDRYh+MQP
         j9STc1yw+l6hIZrm42bP4w8G6/lmw+QGn2VWo4OUDRb9PSYG/ntEIpeB6VTbBi86geM+
         iPy1qyjUd45l5RsNXzvaKjpmCMxVuhVU9HWhJ/OoMukr4l2not/STVo4tNULjWIkKHTR
         Lf1WqzjYU2uTmVp6qpp4+kcx89T1+1qh8fWNUMbPsbVaQrUuZje0NHVH4qQuc0zmTybo
         tm/vyHR7tHpTK0KFz7KOkYDgYSVLQh+xDefugGJR5ugqUE2mVS4f2nqQaI73CCRnqAJe
         e3RQ==
X-Gm-Message-State: AOAM532yS0LYeeoVRrWvH1nHHHrSptoiq7FSF5j9KfboYMkEaJso+xLe
        C36FzGVGd1GkxKJJkpMlSfjj8PAomoZyAfoo
X-Google-Smtp-Source: ABdhPJwNxxK8lSrzbwQ/wpLDbrbSrRJobfv/Eh428DLx/XYkIb/Kyrljdna7HONC21/21wB/dClVHA==
X-Received: by 2002:a05:6402:2058:: with SMTP id bc24mr8327058edb.243.1615465242494;
        Thu, 11 Mar 2021 04:20:42 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id u13sm1264126ejy.31.2021.03.11.04.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 04:20:42 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 00/10] uvcvideo: Pass v4l2-compliance test
Date:   Thu, 11 Mar 2021 13:20:29 +0100
Message-Id: <20210311122040.1264410-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Current version of the driver fails to pass v4l2-compliance v1.20.0,
lets patch it it so some million cameras are compliant.

Ricardo Ribalda (10):
  media: uvcvideo: Return -EINVAL for REQUEST API
  media: uvcvideo: Set capability in s_param
  media: uvcvideo: Return -EIO for control errors
  media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS
  media: uvcvideo: Define Control and GUIDs for class ctrls
  media: uvcvideo: Implement UVC_CTRL_CLASS_UNIT
  media: uvcvideo: set error_idx to count on EACCESS
  media: uvcvideo: Always return a value on V4L2_CTRL_WHICH_DEF_VAL
  media: uvcvideo: Do not create initial events for class ctrls
  media: uvcvideo: Populate only active control classes

 drivers/media/usb/uvc/uvc_ctrl.c   | 59 +++++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvc_driver.c | 51 +++++++++++++++++++++++---
 drivers/media/usb/uvc/uvc_entity.c |  1 +
 drivers/media/usb/uvc/uvc_v4l2.c   | 20 +++++-----
 drivers/media/usb/uvc/uvc_video.c  |  2 +-
 drivers/media/usb/uvc/uvcvideo.h   | 17 +++++++++
 6 files changed, 134 insertions(+), 16 deletions(-)

-- 
2.31.0.rc2.261.g7f71774620-goog

