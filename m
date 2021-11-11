Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF7DE44D928
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 16:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbhKKP3t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 10:29:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233870AbhKKP3r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 10:29:47 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4BE6C061767
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 07:26:58 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 9F7A51F45B80
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1636644417; bh=im5TwRqP67CXb6q3nnGqqgSDbaqGQZgMSbXQ7ad7PiU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Tkp0d5dRtBZUJamXgszI36LWKg8V9P6USRhL2U+67eDXnGCcDWthU6FbdQXKSGkkT
         PG2xRN9G87CUoE4/vnXb4ugFClqGZ6hbnW08tMqvhBacxATrL3+e8jBmBC3+Wz19zM
         itTiKxrDGjWTkbg8WWowckPhwUNR5EieX3aNtSSEsCbhj6dqhzxcI1mG9fhqLIU/d4
         +o9WUEnk66ieVaD2TJL1IJsgTJgrPyTVDSaHhSqz1b1ctw5i3EyK5CoM2W2JgyOI6h
         R8INkXsxvPM1IhA0gduHpG+m3aOmEg0el5ACyzTHDSE2YwNbg1D3r9s04qwjIOut2p
         w3DqJ3bApRPFA==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, dafna3@gmail.com, sakari.ailus@linux.intel.com,
        mchehab@kernel.org
Subject: [PATCH v2 2/2] media: videobuf2: add WARN_ON if bytesused is bigger than buffer length
Date:   Thu, 11 Nov 2021 17:26:40 +0200
Message-Id: <20211111152640.1537-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211111152640.1537-1-dafna.hirschfeld@collabora.com>
References: <20211111152640.1537-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In function vb2_set_plane_payload, report if the
given bytesused is bigger than the buffer size,
and clamp it to the buffer size.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 include/media/videobuf2-core.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 2467284e5f26..e06c190265f0 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -1155,8 +1155,14 @@ static inline void *vb2_get_drv_priv(struct vb2_queue *q)
 static inline void vb2_set_plane_payload(struct vb2_buffer *vb,
 				 unsigned int plane_no, unsigned long size)
 {
-	if (plane_no < vb->num_planes)
+	/*
+	 * size must never be larger than the buffer length, so
+	 * warn and clamp to the buffer length if that's the case.
+	 */
+	if (plane_no < vb->num_planes) {
+		WARN_ON_ONCE(size > vb->planes[plane_no].length);
 		vb->planes[plane_no].bytesused = size;
+	}
 }
 
 /**
-- 
2.17.1

