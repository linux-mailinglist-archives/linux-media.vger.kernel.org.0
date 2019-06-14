Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA404625B
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 17:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfFNPQa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 11:16:30 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:39028 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726297AbfFNPQZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 11:16:25 -0400
Received: from [109.168.11.45] (port=44258 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1hbnwE-000D1q-Qn; Fri, 14 Jun 2019 17:16:22 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-media@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v2] media: docs: v4l2-controls: fix sentence rendered in a nonsense way
Date:   Fri, 14 Jun 2019 17:14:29 +0200
Message-Id: <20190614151429.15191-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This sentence renders as:

> Since such compound controls need to expose more information about
> themselves than is possible with ioctls VIDIOC_QUERYCTRL,
> VIDIOC_QUERY_EXT_CTRL and VIDIOC_QUERYMENU the VIDIOC_QUERY_EXT_CTRL
  ^^^^^^^^^^^^^^^^^^^^^                          ^^^^^^^^^^^^^^^^^^^^^
> ioctl was added.

This does not make sense. Fix by providing an explicit link text. This
results in:

> Since such compound controls need to expose more information about
> themselves than is possible with VIDIOC_QUERYCTRL the
> VIDIOC_QUERY_EXT_CTRL ioctl was added.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Documentation/media/uapi/v4l/extended-controls.rst | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/media/uapi/v4l/extended-controls.rst b/Documentation/media/uapi/v4l/extended-controls.rst
index 0e9787072a41..655362483730 100644
--- a/Documentation/media/uapi/v4l/extended-controls.rst
+++ b/Documentation/media/uapi/v4l/extended-controls.rst
@@ -85,11 +85,10 @@ be able to see such compound controls. In other words, these controls
 with compound types should only be used programmatically.
 
 Since such compound controls need to expose more information about
-themselves than is possible with
-:ref:`VIDIOC_QUERYCTRL` the
-:ref:`VIDIOC_QUERY_EXT_CTRL <VIDIOC_QUERYCTRL>` ioctl was added. In
-particular, this ioctl gives the dimensions of the N-dimensional array
-if this control consists of more than one element.
+themselves than is possible with :ref:`VIDIOC_QUERYCTRL <VIDIOC_QUERYCTRL>`
+the :ref:`VIDIOC_QUERY_EXT_CTRL <VIDIOC_QUERYCTRL>` ioctl was added. In
+particular, this ioctl gives the dimensions of the N-dimensional array if
+this control consists of more than one element.
 
 .. note::
 
-- 
2.21.0

