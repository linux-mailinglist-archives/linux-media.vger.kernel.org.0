Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 939DFB911C
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 15:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728655AbfITNvm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 09:51:42 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38532 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727339AbfITNvm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 09:51:42 -0400
Received: by mail-ed1-f66.google.com with SMTP id l21so1684282edr.5;
        Fri, 20 Sep 2019 06:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zzaqmGC6wxNlQltAaSziAmgfeYMOLEcN0iMAfB2KiLo=;
        b=S6wOZAjtst1iG0D+YO/7iRqpOYtcmynnJpWg3GaJDD2o74HPlEI+egUzKDblU092+G
         9tVICbJTypbiS6bcPgI07XdDMe5V/Uim3KttAqbqR7q/KWPHVaUtw/uHMIUuhSlB8GFl
         77kxk9b/8b8kLpx/xyOmVeWgs4nt0YdhDcVXmiEFwf55MjshC7hV4M6P+gSMptJfpXXX
         NmbVeWElj7vZnIS+bbUQNWcBgQ3pzq8WN8G1QpsTUXzsP+VJ6rv48vdaNeOviVj//7Hw
         V25cSDVd7Qrdg1YOJZH2PkurGndPie9QQlnqGvRFaGXfFgpaaU20bX5+ANO8u198aI8+
         Tfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=zzaqmGC6wxNlQltAaSziAmgfeYMOLEcN0iMAfB2KiLo=;
        b=VKgF04RJyvvQLn6T//ZoCOuJc8Vh6xnSdVT3VFz0By49GILkbXR3SFUljESTEOr47Y
         xGZXqdd6Bgmr5IQM91Abb3/j0gbac0/kIWIWvSbc9rkEaeJXh/9eZnhKlOeZ8WG9LmSq
         NLscuDVzpHAWNOXk8Lk2TbvPSDEciZrjO9bHItH9cKF6ocvbIG4/43E/slUBrWeBPwC/
         0a68OyLxWtGjfv/iH676A1GypF7H0sZ5STK0ZfVPMZClIFyybtmZJTZlEyrG5uBzj8OO
         l2/OpVHGn1GUeeROC40m6BZR3aVm+7e9QLOSs3MKIkYfa46oOs9BbGgRiP990VQjgASB
         ku2g==
X-Gm-Message-State: APjAAAWfrWu0VSEPKvWUGD/Zrb2w7dVF5RhbGfe5JUBdOzgcPqNW8yAA
        v+ntdEu3oxkgfEzC6T1BV7XSkNxOl/4=
X-Google-Smtp-Source: APXvYqw2sG+ppEIWzUFe8BwLLtB4wUdIuAFHJpeQars0N4aye5r562iMbJZMMN0/4DaqrIdZghMrzQ==
X-Received: by 2002:a17:906:e28f:: with SMTP id gg15mr13435058ejb.182.1568987500263;
        Fri, 20 Sep 2019 06:51:40 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id t30sm337673edt.91.2019.09.20.06.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 06:51:39 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ricardo@ribalda.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v6 0/7] Implement UNIT_CELL_SIZE control
Date:   Fri, 20 Sep 2019 15:51:30 +0200
Message-Id: <20190920135137.10052-1-ricardo@ribalda.com>
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

https://github.com/ribalda/linux/tree/unit-size-v6

v4, v5 of this patchset never reached the mailing list.

Ricardo Ribalda Delgado (7):
  media: v4l2-core: Implement v4l2_ctrl_new_std_compound
  Documentation: v4l2_ctrl_new_std_compound
  media: add V4L2_CTRL_TYPE_AREA control type
  Documentation: media: Document V4L2_CTRL_TYPE_AREA
  media: add V4L2_CID_UNIT_CELL_SIZE control
  Documentation: media: Describe V4L2_CID_UNIT_CELL_SIZE
  media: imx214: Add new control with V4L2_CID_UNIT_CELL_SIZE

 Documentation/media/kapi/v4l2-controls.rst    |  9 +++
 .../media/uapi/v4l/ext-ctrls-image-source.rst |  9 +++
 .../media/uapi/v4l/vidioc-queryctrl.rst       |  6 ++
 drivers/media/i2c/imx214.c                    | 12 +++
 drivers/media/v4l2-core/v4l2-ctrls.c          | 76 +++++++++++++++++--
 include/media/v4l2-ctrls.h                    | 63 ++++++++++++++-
 include/uapi/linux/v4l2-controls.h            |  1 +
 include/uapi/linux/videodev2.h                |  6 ++
 8 files changed, 174 insertions(+), 8 deletions(-)

-- 
2.23.0

