Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4AAC3269
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 13:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731290AbfJALY3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 07:24:29 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39023 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbfJALY2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 07:24:28 -0400
Received: by mail-lf1-f66.google.com with SMTP id 72so9554563lfh.6;
        Tue, 01 Oct 2019 04:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bJlmEo9iub6gJcCMPackNCrhwDWuJREIy8LLjVw+0kU=;
        b=YqYZ1fdsgUNEo1R9a5uX7Ji2iML+iJt8eDyAsmBQxxBr2Ti+y0QiZtTBslxhv4mzlS
         +hUhW5MZQDWtlWewsMLrgNbx8kkzNVsJ/c7imciTUxEC4GOu/RySm2j6Rjx7a/IzBtn8
         PRv4V6hYC75q6PRmDWySLfKWLc0wFyxBWNDdU3hRsuXfGr/GWvUn8v79VtAH1Z+dcsYj
         dZ0iuJECo8P34WxjNMuIvM9ATfFO7d5jxZ9XXJMua+EhuoLofJwqQ9Qk1OC3ZAMH2Bir
         wTqOl9tk0crkXXmjnuEtTHI4crgZkJLjbMg5vPHWyDtQGNVb8jMoS3zK695l1hPUmKU1
         +AKQ==
X-Gm-Message-State: APjAAAVMOzilQykMNCiYkJEbNnW5PvhKnrvnoxhEVmClqi7P15DCdThw
        xh7NiodeB1Jtx9FHDZmyWLUz/znk5gc=
X-Google-Smtp-Source: APXvYqy4+xGC6JXuul1nT6uPpEBybkfSopWGqgt+ZIllXgMTSJOMX9DnyDL5uoWl6xmK3RV3Ux9YXQ==
X-Received: by 2002:ac2:48af:: with SMTP id u15mr15019232lfg.75.1569929065439;
        Tue, 01 Oct 2019 04:24:25 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 3sm3853894ljs.20.2019.10.01.04.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 04:24:24 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v9 0/8] Implement UNIT_CELL_SIZE control
Date:   Tue,  1 Oct 2019 13:24:13 +0200
Message-Id: <20191001112421.2778-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

UNIT_CELL_SIZE is a control that represents the size of a cell (pixel).
We required a bit of boilerplate to add this control :)
- New way to init compount controls
- New control type

Thanks to Hans, Jacopo and Philipp for your help.

You might want to see the series at my github repository if needed.

https://github.com/ribalda/linux/tree/unit-size-v9

v9: Rename helper to v4l2_ctrl_ptr_create

v8: Fix my email on some patches (sorry for the mess)

v7: Add new helper v4l2_ctrl_ptr_from_void

v4, v5 of this patchset never reached the mailing list.

Ricardo Ribalda Delgado (8):
  media: v4l2-core: Implement v4l2_ctrl_new_std_compound
  Documentation: v4l2_ctrl_new_std_compound
  media: add V4L2_CTRL_TYPE_AREA control type
  Documentation: media: Document V4L2_CTRL_TYPE_AREA
  media: add V4L2_CID_UNIT_CELL_SIZE control
  Documentation: media: Describe V4L2_CID_UNIT_CELL_SIZE
  media: v4l2-ctrl: Add new helper v4l2_ctrl_ptr_create
  media: imx214: Add new control with V4L2_CID_UNIT_CELL_SIZE

 Documentation/media/kapi/v4l2-controls.rst    |  9 +++
 .../media/uapi/v4l/ext-ctrls-image-source.rst |  9 +++
 .../media/uapi/v4l/vidioc-queryctrl.rst       |  6 ++
 drivers/media/i2c/imx214.c                    |  9 +++
 drivers/media/v4l2-core/v4l2-ctrls.c          | 76 +++++++++++++++++--
 include/media/v4l2-ctrls.h                    | 75 ++++++++++++++++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 include/uapi/linux/videodev2.h                |  6 ++
 8 files changed, 184 insertions(+), 7 deletions(-)

-- 
2.23.0

