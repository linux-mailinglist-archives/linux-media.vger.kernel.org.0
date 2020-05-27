Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04FE61E49C1
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 18:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730360AbgE0QWH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 12:22:07 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:45287 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgE0QWF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 12:22:05 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 24D1A3C057C;
        Wed, 27 May 2020 18:22:04 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vs0wsIMLj1_6; Wed, 27 May 2020 18:21:59 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 29AA33C0579;
        Wed, 27 May 2020 18:21:59 +0200 (CEST)
Received: from vmlxhi-121.localdomain (10.72.94.22) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 27 May
 2020 18:21:58 +0200
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Michael Rodin <mrodin@de.adit-jv.com>, <michael@rodin.online>,
        <efriedrich@de.adit-jv.com>, <erosca@de.adit-jv.com>
Subject: [PATCH] [media] v4l2-subdev.rst: correct information about v4l2 events
Date:   Wed, 27 May 2020 18:21:32 +0200
Message-ID: <1590596493-17682-1-git-send-email-mrodin@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.94.22]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove description of non-existing v4l2_subdev.nevents and replace the
undefined flag V4L2_SUBDEV_USES_EVENTS by the correct flag
V4L2_SUBDEV_FL_HAS_EVENTS, which is already documented in v4l2_subdev.flags

Fixes: commit 02adb1cc765b ("[media] v4l: subdev: Events support")
Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
---
 Documentation/media/kapi/v4l2-subdev.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/media/kapi/v4l2-subdev.rst b/Documentation/media/kapi/v4l2-subdev.rst
index e1f0b72..a4e9769 100644
--- a/Documentation/media/kapi/v4l2-subdev.rst
+++ b/Documentation/media/kapi/v4l2-subdev.rst
@@ -304,8 +304,7 @@ The device node handles a subset of the V4L2 API.
 	events can also be reported by one (or several) V4L2 device nodes.
 
 	Sub-device drivers that want to use events need to set the
-	``V4L2_SUBDEV_USES_EVENTS`` :c:type:`v4l2_subdev`.flags and initialize
-	:c:type:`v4l2_subdev`.nevents to events queue depth before registering
+	``V4L2_SUBDEV_FL_HAS_EVENTS`` :c:type:`v4l2_subdev`.flags before registering
 	the sub-device. After registration events can be queued as usual on the
 	:c:type:`v4l2_subdev`.devnode device node.
 
-- 
2.7.4

