Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4392C5542
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 14:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390009AbgKZN1b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 08:27:31 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:57765 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389558AbgKZN1b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 08:27:31 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id iHIrkPCQhN7XgiHJ2kYrWD; Thu, 26 Nov 2020 14:27:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606397249; bh=dCQz//By4jQEl1k+Li7IHuXjXxaF1rPXRPP/nDZZb+A=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=VlrA+gxXyE0enrPBG8AeQw8pU3Dv2sxS1TS2zcOKcA8MdKcwxl4G6zhBBHbfC0VLB
         qYR2aAC1X5MTD/Bx282cMcMDxJj9y8bQ5uHQGzlhYhztV8TzWrOg/gsrEJaJosfHvh
         hLwTCmrxlHVQgSDwrBQtKT+G9CFh64RI/eIJhSa+Tksv8nTc/06CdGrsOZCfVmFC9J
         VgwkmVtMl1NZ+rOIwGrNhLhC5Dl1UGqTJFV9vY8ZCcHqJSYwoLb6VzGhiHVP2fJUyu
         KmIipLGVaY+s8o46HFtO1P0CcCn1tuLxq/WyDGWo/J8gOFJ01CiEs5WJ1Yo3Ekbjog
         9FL9rkCRKLMaw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 0/6] Stateless FWHT de-staging
Date:   Thu, 26 Nov 2020 14:27:11 +0100
Message-Id: <20201126132717.1216907-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPKsg8oJiWG9OdslvPLewlhgUU054b3LqQP4rktgPBMGRZ8Vt+F3eBeqw9An1OHSIcFptow873r56aX/AXRSfpyhXVJzRDqTBTgWN9Ju6qgMMGIUt7XO
 kwR0j9UCgbt4kcopm48/NzppU36y+Q5wYVkU3Ox0so0eoTYMZhasq2hZJEJHTnp6fhsWXQOuIcKvjbrwHJr/NbaVRgGZjmNlqtwneSlfu6kC2RLULZjf8slu
 Ln5eonuYoEJ+8qukcZlq2A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series sits on top of Ezequiel's H.264 de-staging series:

https://patchwork.linuxtv.org/project/linux-media/cover/20201126093618.137292-1-ezequiel@collabora.com/

The first patch does a rename of the FWHT version and FWHT flags,
since these will become part of the public API. No other changes
in this patch.

The second patch moves all the FWHT-related API elements to the
public headers and deletes include/media/fwht-ctrls.h.

The third moves the FWHT stateless documentation to
ext-ctrls-codec-stateless.rst (no other changes).

The 4th and 5th patches clean up some formatting issues, not
related to FWHT.

The final patch documents V4L2_CTRL_TYPE_FWHT_PARAMS and p_fwht_params
and improves the V4L2_PIX_FMT_FWHT_STATELESS description.

Regards,

        Hans

Hans Verkuil (6):
  vicodec: add V4L2_ prefix before FWHT_VERSION and FWHT_FL_*
  vicodec: mark the stateless FWHT API as stable
  ext-ctrls-codec.rst: move FWHT docs to ext-ctrls-codec-stateless.rst
  pixfmt-compressed.rst: fix 'bullet' formatting
  vidioc-g-ext-ctrls.rst: add missing 'struct' before the types
  userspace-api/media: finalize stateless FWHT codec docs

 .../media/v4l/ext-ctrls-codec-stateless.rst   | 120 +++++++++++++++++
 .../media/v4l/ext-ctrls-codec.rst             | 121 ------------------
 .../media/v4l/pixfmt-compressed.rst           |  12 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  18 ++-
 .../media/v4l/vidioc-queryctrl.rst            |   6 +
 .../media/videodev2.h.rst.exceptions          |   1 +
 .../media/test-drivers/vicodec/codec-fwht.c   |  13 +-
 .../media/test-drivers/vicodec/codec-fwht.h   |  32 -----
 .../test-drivers/vicodec/codec-v4l2-fwht.c    |  88 ++++++-------
 .../media/test-drivers/vicodec/vicodec-core.c |  46 +++----
 drivers/media/v4l2-core/v4l2-ctrls.c          |  20 ++-
 include/media/fwht-ctrls.h                    |  31 -----
 include/media/v4l2-ctrls.h                    |   1 -
 include/uapi/linux/v4l2-controls.h            |  70 ++++++++++
 include/uapi/linux/videodev2.h                |   3 +
 15 files changed, 310 insertions(+), 272 deletions(-)
 delete mode 100644 include/media/fwht-ctrls.h

-- 
2.29.2

