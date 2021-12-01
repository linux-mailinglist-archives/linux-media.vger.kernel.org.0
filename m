Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F88465998
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 23:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343872AbhLAXAj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 18:00:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353738AbhLAXAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 18:00:37 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99F70C061574
        for <linux-media@vger.kernel.org>; Wed,  1 Dec 2021 14:57:04 -0800 (PST)
Received: from localhost.localdomain (unknown [IPv6:2a00:c281:1409:4a00:c103:6980:2c3:d021])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4CA2A1F45FAF;
        Wed,  1 Dec 2021 22:57:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1638399423; bh=VehMaKrQ5cJPSKu8eXGQs0BFd0zT2aRY3eoYfnNA9UM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eZ2j89wITLDlwqe4Q0BSs1qAyOwXUran8KdW5GYmj07Qy9XRQ0Q+HydD6oy42juCL
         uIdZOICUj9wPhDxTrKZh+S5cFOtAxySfpc6vV7x6fBMBjz49NDqLRt35YwTnk8SuzV
         ww2HhpuVksczx6MqmGPR5i0RXY/e20zKJwVfC7G8Y3mgG3xMzKr18koOXl+0r2c/G+
         AeiRs/fDnpwl0TkZWmJqL1u48siC3VquEdmojsD5PBatIMfoNk7dndIcBj03viNS9X
         BzrNDGyrgBLpU/RlgWeEUNoQHdb3bSrOrun1yJE0pJNcbRCi3BAo9u0GNsH0sfKTCM
         cc9mdvF+o63Ww==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: [PATCH v3 2/2] media: videobuf2: add WARN_ON_ONCE if bytesused is bigger than buffer length
Date:   Thu,  2 Dec 2021 00:56:51 +0200
Message-Id: <20211201225651.29830-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211201225651.29830-1-dafna.hirschfeld@collabora.com>
References: <20211201225651.29830-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In function vb2_set_plane_payload, report if the
given bytesused is bigger than the buffer size,
and clamp it to the buffer size.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 include/media/videobuf2-core.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 2467284e5f26..5468b633b9d2 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -1155,8 +1155,15 @@ static inline void *vb2_get_drv_priv(struct vb2_queue *q)
 static inline void vb2_set_plane_payload(struct vb2_buffer *vb,
 				 unsigned int plane_no, unsigned long size)
 {
-	if (plane_no < vb->num_planes)
+	/*
+	 * size must never be larger than the buffer length, so
+	 * warn and clamp to the buffer length if that's the case.
+	 */
+	if (plane_no < vb->num_planes) {
+		if (WARN_ON_ONCE(size > vb->planes[plane_no].length))
+			size = vb->planes[plane_no].length;
 		vb->planes[plane_no].bytesused = size;
+	}
 }
 
 /**
-- 
2.17.1

