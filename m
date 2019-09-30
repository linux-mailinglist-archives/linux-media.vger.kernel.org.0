Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A157C1E9F
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 12:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730105AbfI3KGn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 06:06:43 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46711 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbfI3KGm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 06:06:42 -0400
Received: by mail-lf1-f67.google.com with SMTP id t8so6510683lfc.13;
        Mon, 30 Sep 2019 03:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VFP6T/UY1kBz/fU2pGhkSDeLxskM7XOcI1R8+JaOkwQ=;
        b=O+9dtRV9xI1/3zZ5smW7pEfhRfe4VUuw5pK0yehT9mXemRjjGNTecv+JVbS2saHgc3
         Qg3mAFWqvqZuKiTdmCDL5bNxJaVXkteLYixiHaZ5suBFWuqK9qV/ss/OIZHDZzmDE8Zb
         Gsxcve7fwG4LHRla5MA5W/DXJmsztIUY7kS7KCdytqCPD30ixr1mre2Lpy5seZ+ActVD
         gETDV9ffIqgThY1RwaCFpMnW3ahWGeT9efAP6rK1VcDgHACYMDKs6pHIVRk7MCZHB5vb
         AhNd7OZTi+M4SUw0W4m8GeZ5VwdACQxgAD28JeWi8tXEVa80d+44hxNLplj4APrXkjnz
         DaIQ==
X-Gm-Message-State: APjAAAUMJhFXxWaDdrvfEyDYqjIaIodjTIF02dYsajuPcdT4v7h1sR2X
        H2aKqYvX7RmweF300cgkt9g=
X-Google-Smtp-Source: APXvYqxel1nz6Gu3fKeKVnJ4xj68C0LQ255ViYVYbNHFbk95eEarLIHdIOtRrUBEoeBVwk14tJzWrA==
X-Received: by 2002:ac2:46ee:: with SMTP id q14mr10013553lfo.152.1569838000993;
        Mon, 30 Sep 2019 03:06:40 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z72sm3091580ljb.98.2019.09.30.03.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 03:06:40 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v7 0/8] Implement UNIT_CELL_SIZE control
Date:   Mon, 30 Sep 2019 12:06:28 +0200
Message-Id: <20190930100636.18318-1-ribalda@kernel.org>
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

