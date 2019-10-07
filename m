Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 064D6CE092
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 13:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbfJGLfH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 07:35:07 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42807 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727376AbfJGLfH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 07:35:07 -0400
Received: by mail-lj1-f193.google.com with SMTP id y23so13215036lje.9;
        Mon, 07 Oct 2019 04:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9OkHrCrmsq5rv5ybBjtQNnmB2o3XGmppMHCT3GiUxYk=;
        b=COe86PyqWVgEpFeXo0R7JBjwVWO9PX5nbAXdPNfo2livMfwfQ5uybkLc6zzphK4Lr/
         SrfEgdLWnglHmz87YKVz59ION4pyAajspxHtDvwrCZsjqCc8lgUO7D238Pwd9rQa3SmV
         rNrM2RIdwrG1jGw00F2QqE1k8HwC9V66xkYyqMBIg6DVLAOiF993In1MlaPiXbN3vvq3
         rMtwIII8Jhv68o1yIe9FRg9gvu6GmS/uyTDfGqyB4E8oQfl5My1FEy/jr+fyDdZhP11V
         FEeiHu62sTdMjA9MPJjXDaR4YyKvnYUv14KYX+u3u/OE45HBkwQwR9AaaVWm3rHo1sv6
         5UcQ==
X-Gm-Message-State: APjAAAXYEcTcESGG2hMXSiSJUkugoywqiXnLpPy8+F6fHXhdgLFI+dq4
        mu9KidnH/qeu3mYMJI4VwaI=
X-Google-Smtp-Source: APXvYqzV+N7AAf0iyf2cJ9iFIfWJiUrxBNJ+mfUx9sP6xnWrueohhVdJH4ARnWyyWW2P2j5USK7d2g==
X-Received: by 2002:a2e:9f52:: with SMTP id v18mr17618144ljk.166.1570448105444;
        Mon, 07 Oct 2019 04:35:05 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id b25sm3666047ljj.36.2019.10.07.04.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 04:35:04 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v10 0/8] Implement UNIT_CELL_SIZE control
Date:   Mon,  7 Oct 2019 13:34:54 +0200
Message-Id: <20191007113502.11746-1-ribalda@kernel.org>
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

https://github.com/ribalda/linux/tree/unit-size-v10

v10: Typos in documentation and minor color style

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

