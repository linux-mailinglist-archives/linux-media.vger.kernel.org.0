Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E0D36C65B
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237743AbhD0MrP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:47:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45396 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237632AbhD0MrK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:47:10 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D72361838;
        Tue, 27 Apr 2021 14:46:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619527584;
        bh=AuAKBt3BDpGpx9UkgTjJfBQbEclqgvLFviea8XQtxQY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XCDDqijQysMb2Zmb2U3HWgeL6cGkizDz0ZWzeRp4B7OHu+EJ5dKMluCyqRrm7+zGP
         iXZGU++4gYGxhKWu1xuekOFx9/XfKchSMA/HkAnx+OZjPbQhte0W281GwrWsZ8MFto
         fdwmoWRQ8xaeS0WkbZLas6fJOhML650y41jCSyDQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 22/24] media: uapi: add MEDIA_PAD_FL_MULTIPLEXED flag
Date:   Tue, 27 Apr 2021 15:45:21 +0300
Message-Id: <20210427124523.990938-23-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a pad flag to indicate that the pad uses multiplexed streams. A pad
with multiplexed streams won't support pad format configuration and e.g.
VIDIOC_SUBDEV_S_FMT should return -ENOIOCTLCMD.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/userspace-api/media/mediactl/media-types.rst | 6 ++++++
 include/uapi/linux/media.h                                 | 1 +
 2 files changed, 7 insertions(+)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 0a26397bd01d..d1dca50649f9 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-PAD-FL-SINK:
 .. _MEDIA-PAD-FL-SOURCE:
 .. _MEDIA-PAD-FL-MUST-CONNECT:
+.. _MEDIA-PAD-FL-MULTIPLEXED:
 
 .. flat-table:: Media pad flags
     :header-rows:  0
@@ -382,6 +383,11 @@ Types and flags used to represent the media graph elements
 	  when this flag isn't set; the absence of the flag doesn't imply
 	  there is none.
 
+    *  -  ``MEDIA_PAD_FL_MULTIPLEXED``
+       -  The pad has multiplexed streams. A pad with multiplexed streams
+          won't support pad format configuration and e.g. VIDIOC_SUBDEV_S_FMT
+          should return -ENOIOCTLCMD.
+
 
 One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
 must be set for every pad.
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 200fa8462b90..bdaadef80cbd 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -211,6 +211,7 @@ struct media_entity_desc {
 #define MEDIA_PAD_FL_SINK			(1 << 0)
 #define MEDIA_PAD_FL_SOURCE			(1 << 1)
 #define MEDIA_PAD_FL_MUST_CONNECT		(1 << 2)
+#define MEDIA_PAD_FL_MULTIPLEXED		(1 << 3)
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */
-- 
2.25.1

