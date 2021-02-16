Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33B9C31C69D
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 07:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbhBPGqO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 01:46:14 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33144 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhBPGqK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 01:46:10 -0500
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 036438F2;
        Tue, 16 Feb 2021 07:45:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613457920;
        bh=IRH7S2omRxJNyFo0KwIdZEuMt7pE4HA+DlQQVVk6hGo=;
        h=From:To:Cc:Subject:Date:From;
        b=ocNXT3xXPm7Ko1od4VuUiH5RJb3RqdemocakyDXPyrIpcwTxxgpRCV7c/4VlMU7bd
         y8zqfR9Q9M8+/tcaDg+hva2C7Hm1G1kDFfozE6JzE7ZHgK6r15u+1v1u4ZAegU12mL
         MBI4yQgmz/4x++MYsz2h6vca+fX9JbDR+FsIXBto=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] media: v4l2-subdev.rst: two typo fixes
Date:   Tue, 16 Feb 2021 08:44:55 +0200
Message-Id: <20210216064455.18235-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix a few minor typos in the text.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/driver-api/media/v4l2-subdev.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index bb5b1a7cdfd9..f413b11e70de 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -207,7 +207,7 @@ begin to form a list of subdevice descriptors that the bridge device
 needs for its operation. Subdevice descriptors are added to the notifier
 using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
 takes two arguments: a pointer to struct :c:type:`v4l2_async_notifier`,
-and a pointer to the subdevice descripter, which is of type struct
+and a pointer to the subdevice descriptor, which is of type struct
 :c:type:`v4l2_async_subdev`.
 
 The V4L2 core will then use these descriptors to match asynchronously
@@ -225,7 +225,7 @@ contain several subdevs that use an I2C bus, but also a subdev that is
 controlled through GPIO pins. This distinction is only relevant when setting
 up the device, but once the subdev is registered it is completely transparent.
 
-Once te subdev has been registered you can call an ops function either
+Once the subdev has been registered you can call an ops function either
 directly:
 
 .. code-block:: c
-- 
2.25.1

