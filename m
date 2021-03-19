Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC1934151B
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 06:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233929AbhCSFyM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 01:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233930AbhCSFxs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 01:53:48 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E35C06174A
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 22:53:47 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so6196404pjc.2
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 22:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DzC04AgKpS+/8wk1fqCI0DBCCPddOjDutyiB6l+CoiE=;
        b=GG1r+PUpSUiCsiWA/rhCnrpIqujWnH8XG5CuSMVNSsPbXIOhHzOZ9ztfkb7+fxHrZW
         uBrUs9UdI+6tcYmrMdOY3ZOqDwii5pO9R78eSf2SkOFhh5hTqe0PdJd5x+6ob9+XvB2e
         7blnZbg+F3+0FHdDJiWvGxqPl2mX5MzRXVHbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DzC04AgKpS+/8wk1fqCI0DBCCPddOjDutyiB6l+CoiE=;
        b=K36fM79a/xyo54EjDhgpIJrpyAtSDZCVqh3iuIwr9UrDwjRuzl40QwskkdwXTMHctV
         jxb8ktp05LduCU8SgSAOAI/Q0B2PeWtibUb+xznSv4eAEw3A4+9Gg873mDQKgpqbr7PJ
         wmS2h4Y2U5yNp/N9NaE4AsotKQryJx/aodCnz1C6QGKzVQZnVT50N2okf3Dysc/ndQoY
         It4Sn4MymWcIj45TCVTlPwBlnr7vghydxkIWT8a/73dALzPqecSUynIaT9TA1jZVGqJm
         AgmLRKjwHfLUyLo1eazYp1gMGl7ovHjLbONv85PVafFR1KgCclhfKwsgeRc/VZ7oya9V
         w1mQ==
X-Gm-Message-State: AOAM533Gxj65WyXCrhZdHrgQVK76BhHHU38064riTcYnRLfISybrqSqm
        Q61mGtHryJiwUYIBTSPLbPNLHQY9tZmAKw==
X-Google-Smtp-Source: ABdhPJxD8/Kt3DGZx+0I4wu1sOGDa3KUEYnOOk0Pv/0VTPvK6ObfOyt93+p0/VHmKlBbwIqYn2urKw==
X-Received: by 2002:a17:90b:d85:: with SMTP id bg5mr8072905pjb.230.1616133227483;
        Thu, 18 Mar 2021 22:53:47 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:6577:f83d:5865:dfac])
        by smtp.gmail.com with ESMTPSA id o13sm4043704pgv.40.2021.03.18.22.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 22:53:47 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 0/6] media: uvcvideo: implement UVC 1.5 ROI
Date:   Fri, 19 Mar 2021 14:53:36 +0900
Message-Id: <20210319055342.127308-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

	This patch set implements UVC 1.5 ROI using v4l2_selection API.

V3:
- reimplemented ROI. We dont' use split controls anymore.
- Ricardo's feedback

Sergey Senozhatsky (6):
  media: v4l UAPI: add ROI selection targets
  media: v4l UAPI: document ROI selection targets
  media: v4l UAPI: add ROI auto-controls flags
  media: v4l UAPI: document ROI auto-controls flags
  media: uvcvideo: add UVC 1.5 ROI control
  MAINTAINERS: update Senozhatsky email address

 .../media/v4l/selection-api-configuration.rst |  22 +++
 .../media/v4l/selection-api-examples.rst      |  28 ++++
 .../media/v4l/v4l2-selection-flags.rst        |  40 +++++
 .../media/v4l/v4l2-selection-targets.rst      |  24 +++
 MAINTAINERS                                   |   8 +-
 drivers/media/usb/uvc/uvc_v4l2.c              | 147 +++++++++++++++++-
 include/uapi/linux/usb/video.h                |   1 +
 include/uapi/linux/v4l2-common.h              |  18 +++
 8 files changed, 281 insertions(+), 7 deletions(-)

-- 
2.31.0.rc2.261.g7f71774620-goog

