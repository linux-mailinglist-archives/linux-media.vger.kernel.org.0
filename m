Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1D1C1ED8
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 12:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729415AbfI3KSr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 06:18:47 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46749 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727025AbfI3KSr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 06:18:47 -0400
Received: by mail-lj1-f194.google.com with SMTP id d1so8797635ljl.13;
        Mon, 30 Sep 2019 03:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bZNzr1dgkucQCVVEkgGqjf+3w/3xGUMtlMptL7wciSc=;
        b=S6CUmYDtIdl1ZHkF7wE8ThyH+wHmq+adXR20XvdewNaExW+uvUrj6QE1MSG1I4WDhG
         HK1+PuSrQnd3aZPSal7uy/CrkNrBbSwp9kkjk7I3vKlJdSfVmEA2V9gdT26/8R6fxb1L
         nH7Mxkk6E0oiLYmyAL15n9kSXC6K//EDQFzKP6iI0VFu39b9qoF2GKKIjyxaIb5K7Udf
         UJIwkVxtqEVCh7rOOWK7OMnvv+RSdPuScOPFYdolV0fDfeAbrjmjS79qJUCM81astZvr
         rguOZrfgYithfDTDx2+kxI7GgZAWqKkperREHX76MYp/BkMzswAP9eQzfko+nTXYbF16
         SvuA==
X-Gm-Message-State: APjAAAVquJNAOt8IFQ5YsqN0GNWBueRDS3Wl13NW/YsZy94C+9DxqNqr
        q6nKVGgbvk/PPpW4H6jB8r0=
X-Google-Smtp-Source: APXvYqwGKjGXxQeVz7Vo7k0Tt1BJVEtXcP5VyWfhr+EsgqlHXPpdkmjRK7DcZgYvU/BBPEDLDOFMVA==
X-Received: by 2002:a2e:918c:: with SMTP id f12mr11882442ljg.121.1569838724768;
        Mon, 30 Sep 2019 03:18:44 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z8sm3805970lfg.18.2019.09.30.03.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 03:18:43 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v8 0/8] Implement UNIT_CELL_SIZE control
Date:   Mon, 30 Sep 2019 12:18:33 +0200
Message-Id: <20190930101841.19630-1-ribalda@kernel.org>
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
  media: v4l2-ctrl: Add new helper v4l2_ctrl_ptr_from_void
  media: imx214: Add new control with V4L2_CID_UNIT_CELL_SIZE

 Documentation/media/kapi/v4l2-controls.rst    |  9 +++
 .../media/uapi/v4l/ext-ctrls-image-source.rst |  9 +++
 .../media/uapi/v4l/vidioc-queryctrl.rst       |  6 ++
 drivers/media/i2c/imx214.c                    |  9 +++
 drivers/media/v4l2-core/v4l2-ctrls.c          | 76 +++++++++++++++++--
 include/media/v4l2-ctrls.h                    | 74 ++++++++++++++++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 include/uapi/linux/videodev2.h                |  6 ++
 8 files changed, 183 insertions(+), 7 deletions(-)

-- 
2.23.0

