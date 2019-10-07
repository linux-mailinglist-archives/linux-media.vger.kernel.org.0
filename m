Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1C3BCE660
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbfJGPGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:06:42 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43686 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbfJGPGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 11:06:41 -0400
Received: by mail-lj1-f195.google.com with SMTP id n14so14020878ljj.10;
        Mon, 07 Oct 2019 08:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GsFzbtlEjI40iHeoj37GLeSUtkxa6C+qH+g4nhXPR6k=;
        b=koxnV7gjU+m9ACGX/aFXzZcLlFhm8q0HSzI2kxnuFcJdgSg/iRLC/9mNkORXojhPMK
         r6LXr+j//7txnd0AEmLl7LAXevRB9zVqud12CJWlaWLAl8l05PtXXyZ9ACLJjs/FxWvG
         LT7TJPHEP8V6xRyBs83Atxd5q/gJ3jdjpSZZ5yNX5DdTyPFDro9/SjA/F3j9Jfg+rDem
         kPsgs3nDAlx4TK20UEaPOdbvHXNk9h5MlenPAVvXqMXBTP7NiH9VH0yja1z9dFwGT3mp
         sEyFeiIaNnGNbXkAv1akmHzKZOrWMIv50GlKgF2lICTwCh4pdXmarJHdukJNbvt19I1n
         JBmw==
X-Gm-Message-State: APjAAAW/CDScsVcZDHlQhVW42M5DNbR64+H3IhTR87uPI6eKzlNvn0P2
        Is5Nk7h7ZAQ44tpC82yOAkA=
X-Google-Smtp-Source: APXvYqwI6F13OY21HTN0kKWRCvwFIio3MTsCskiUu0tR42CE6CuJCqArkM+Mgwrj84tYwFuia38KDw==
X-Received: by 2002:a2e:8907:: with SMTP id d7mr18234089lji.15.1570460799470;
        Mon, 07 Oct 2019 08:06:39 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id n2sm3145517ljj.30.2019.10.07.08.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 08:06:37 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v12 0/8] Implement UNIT_CELL_SIZE control
Date:   Mon,  7 Oct 2019 17:06:28 +0200
Message-Id: <20191007150636.16458-1-ribalda@kernel.org>
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

v12: Fix htmldocs warnings (Thanks Hans!)

v11: Fix documentation related to binning

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
 .../media/uapi/v4l/ext-ctrls-image-source.rst | 10 +++
 .../media/uapi/v4l/vidioc-queryctrl.rst       |  6 ++
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/i2c/imx214.c                    |  9 +++
 drivers/media/v4l2-core/v4l2-ctrls.c          | 76 +++++++++++++++++--
 include/media/v4l2-ctrls.h                    | 75 ++++++++++++++++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 include/uapi/linux/videodev2.h                |  6 ++
 9 files changed, 186 insertions(+), 7 deletions(-)

-- 
2.23.0

