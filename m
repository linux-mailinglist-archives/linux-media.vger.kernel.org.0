Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4851F505E
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 16:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727221AbfKHP6M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 10:58:12 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:37159 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727159AbfKHP6M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 10:58:12 -0500
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id D5D4310000A;
        Fri,  8 Nov 2019 15:58:08 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v5 07/11] include: v4l2-ctrl: Sort forward declarations
Date:   Fri,  8 Nov 2019 16:59:40 +0100
Message-Id: <20191108155944.1040883-8-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108155944.1040883-1-jacopo@jmondi.org>
References: <20191108155944.1040883-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Before adding a new forward declaration to the v4l2-ctrls.h header file,
sort the existing ones alphabetically.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 include/media/v4l2-ctrls.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 7db9e719a583..cf59abafb0d9 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -25,14 +25,14 @@
 
 /* forward references */
 struct file;
+struct poll_table_struct;
+struct v4l2_ctrl;
 struct v4l2_ctrl_handler;
 struct v4l2_ctrl_helper;
-struct v4l2_ctrl;
-struct video_device;
+struct v4l2_fh;
 struct v4l2_subdev;
 struct v4l2_subscribed_event;
-struct v4l2_fh;
-struct poll_table_struct;
+struct video_device;
 
 /**
  * union v4l2_ctrl_ptr - A pointer to a control value.
-- 
2.23.0

