Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E19669439B
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 11:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjBMK5I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 05:57:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbjBMK4s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 05:56:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947F014E81
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 02:56:43 -0800 (PST)
Received: from pyrite.hamster-moth.ts.net (h175-177-042-159.catv02.itscom.jp [175.177.42.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBC79501;
        Mon, 13 Feb 2023 11:56:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676285801;
        bh=DEeq0lgwCh9iuB4BQf/DrwA1bYDVekwpl6KvMqt7sP8=;
        h=From:To:Cc:Subject:Date:From;
        b=Time+E0a7QSHY99lbu2DFfHsZzAEr6cd3Y4i6DzNeFLyPKDsgGbexJFamdNperxt4
         qHoqxkMHUBt9e9/HsFYEvJ5MvWyFUvbvpBxqq+OImoaaCC5IflK0GOcxD5uF2JHbpF
         IgF7+c00qpBdxzcjCJg60ddDDYtUvYJJ/ntNNZ3M=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH] docs: media: v4l: uapi: Fix field type for SUBDEV_ENUM_FRAME_SIZE
Date:   Mon, 13 Feb 2023 19:56:28 +0900
Message-Id: <20230213105628.1275084-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The documentation for the VIDIOC_SUBDEV_ENUM_FRAME_SIZE ioctl
incorrectly refers to struct v4l2_subdev_mbus_code_enum as the
parameter. Fix this.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 .../userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
index c25a9896df0e..e07d48319683 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
@@ -39,7 +39,7 @@ ioctl.
 
 To enumerate frame sizes applications initialize the ``pad``, ``which``
 , ``code`` and ``index`` fields of the struct
-:c:type:`v4l2_subdev_mbus_code_enum` and
+:c:type:`v4l2_subdev_frame_size_enum` and
 call the :ref:`VIDIOC_SUBDEV_ENUM_FRAME_SIZE` ioctl with a pointer to the
 structure. Drivers fill the minimum and maximum frame sizes or return an
 EINVAL error code if one of the input parameters is invalid.
-- 
2.35.1

