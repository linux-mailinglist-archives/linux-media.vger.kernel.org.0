Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 342F623457C
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 14:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733090AbgGaMMx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 08:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732863AbgGaMMw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 08:12:52 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C35E3C061574
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2020 05:12:52 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id F122029927E
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH 0/2] media: admin-guide: add documentation for rkisp1
Date:   Fri, 31 Jul 2020 14:12:41 +0200
Message-Id: <20200731121243.25882-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Two patches that document the rkisp1 driver in the Documentation
directory.

patch 1 adds documentation to the specific metadata formats
used by the driver.

patch 2 adds a documentation of the driver.

The documentation assumes that the patchsets:

"v4l2: add support for colorspace conversion API (CSC) for video capture and subdevices"
https://patchwork.kernel.org/cover/11642371/

"media: staging: rkisp1: add support to V4L2_CAP_IO_MC"
https://patchwork.kernel.org/cover/11680993/

were accepted and it documents the features that those patchsets add.

Dafna Hirschfeld (2):
  media: pixfmt-meta-rkisp1.rst: add description of rkisp1 metadata
    formats in pixfmt-meta-rkisp1.rst
  media: admin-guide: add documentation file rkisp1.rst

 Documentation/admin-guide/media/rkisp1.dot    |  18 +++
 Documentation/admin-guide/media/rkisp1.rst    | 147 ++++++++++++++++++
 .../admin-guide/media/v4l-drivers.rst         |   1 +
 .../userspace-api/media/v4l/meta-formats.rst  |   1 +
 .../media/v4l/pixfmt-meta-rkisp1.rst          |  49 ++++++
 .../uapi/v4l/pixfmt-meta-rkisp1-params.rst    |  23 ---
 .../uapi/v4l/pixfmt-meta-rkisp1-stat.rst      |  22 ---
 7 files changed, 216 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/admin-guide/media/rkisp1.dot
 create mode 100644 Documentation/admin-guide/media/rkisp1.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
 delete mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
 delete mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst

-- 
2.17.1

