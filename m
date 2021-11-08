Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88778449C9D
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 20:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237743AbhKHTmd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 14:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237727AbhKHTmd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 14:42:33 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E4DC061570
        for <linux-media@vger.kernel.org>; Mon,  8 Nov 2021 11:39:48 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id E11AB1F4470D
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1636400386; bh=zIvAnhC7j9snbB3t2KDvPfgYWGMQ0Ua69j/4q12L82k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nwb+f/ebSQOkF57W452ISckQY8IQ/4v9u6n53ACVJmnUftzraxjP8bCkyMHuJ5H9X
         Dl2fSaA0UhgldJb5kxE6MgaanRyhxzykcS0rupSqZtOm15C6mBkX+gMIZX8+QwYR4L
         vZwVmuWHohmmXmqYpyURQMFzTvtLmRj545k/hU4UrXgYAx0rXZ+Gi2MkAOCt9XW4+x
         TrFn+aA0zRxRhCfEJeNR1wekXTQmn8lnwfLx9q9PIl4gp1uvQjivJ8o6eUhk8siJDM
         vs0X2PDJKLPyq6dMh8a9e9Zo6RsSKjVfHvhsFpQpBNkeDaY96moXTREH7t+/2jRaVE
         R1kiPXTyJTh9A==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, dafna3@gmail.com, sakari.ailus@linux.intel.com,
        mchehab@kernel.org
Subject: [PATCH 2/2] media: videobuf2: add WARN_ON if bytesused is bigger than buffer length
Date:   Mon,  8 Nov 2021 21:39:33 +0200
Message-Id: <20211108193933.20369-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108193933.20369-1-dafna.hirschfeld@collabora.com>
References: <20211108193933.20369-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In function vb2_set_plane_payload, report if the
given bytesused is bigger than the buffer size.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 include/media/videobuf2-core.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 2467284e5f26..ffaa1f3361c3 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -1155,8 +1155,10 @@ static inline void *vb2_get_drv_priv(struct vb2_queue *q)
 static inline void vb2_set_plane_payload(struct vb2_buffer *vb,
 				 unsigned int plane_no, unsigned long size)
 {
-	if (plane_no < vb->num_planes)
+	if (plane_no < vb->num_planes) {
+		WARN_ON(size > vb->planes[plane_no].length);
 		vb->planes[plane_no].bytesused = size;
+	}
 }
 
 /**
-- 
2.17.1

