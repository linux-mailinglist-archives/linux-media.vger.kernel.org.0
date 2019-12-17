Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C51F123622
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 21:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbfLQUAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 15:00:44 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51754 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbfLQUAo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 15:00:44 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id B206E28D001
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-kernel@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, lkcamp@lists.libreplanetbr.org,
        kernel@collabora.com, Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH] media: v4l2-rect.h: fix v4l2_rect_map_inside() top/left adjustments
Date:   Tue, 17 Dec 2019 17:00:22 -0300
Message-Id: <20191217200022.2075972-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

boundary->width and boundary->height are sizes relative to
boundary->left and boundary->top coordinates, but they were not being
taken into consideration to adjust r->left and r->top, leading to the
following error:

Consider the follow as initial values for boundary and r:

struct v4l2_rect boundary = {
	.left = 100,
	.top = 100,
	.width = 800,
	.height = 600,
}

struct v4l2_rect r = {
	.left = 0,
	.top = 0,
	.width = 1920,
	.height = 960,
}

calling v4l2_rect_map_inside(&r, &boundary) was modifying r to:

r = {
	.left = 0,
	.top = 0,
	.width = 800,
	.height = 600,
}

Which is wrongly outside the boundary rectangle, because:

	v4l2_rect_set_max_size(r, boundary); // r->width = 800, r->height = 600
	...
	if (r->left + r->width > boundary->width) // true
		r->left = boundary->width - r->width; // r->left = 800 - 800
	if (r->top + r->height > boundary->height) // true
		r->top = boundary->height - r->height; // r->height = 600 - 600

Fix this by considering top/left coordinates from boundary.

Fixes: ac49de8c49d7 ("[media] v4l2-rect.h: new header with struct v4l2_rect helper functions")

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

 include/media/v4l2-rect.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/media/v4l2-rect.h b/include/media/v4l2-rect.h
index c86474dc7b55..8800a640c224 100644
--- a/include/media/v4l2-rect.h
+++ b/include/media/v4l2-rect.h
@@ -63,10 +63,10 @@ static inline void v4l2_rect_map_inside(struct v4l2_rect *r,
 		r->left = boundary->left;
 	if (r->top < boundary->top)
 		r->top = boundary->top;
-	if (r->left + r->width > boundary->width)
-		r->left = boundary->width - r->width;
-	if (r->top + r->height > boundary->height)
-		r->top = boundary->height - r->height;
+	if (r->left + r->width > boundary->left + boundary->width)
+		r->left = boundary->left + boundary->width - r->width;
+	if (r->top + r->height > boundary->top + boundary->height)
+		r->top = boundary->top + boundary->height - r->height;
 }
 
 /**
-- 
2.24.0

