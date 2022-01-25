Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D801949ADCC
	for <lists+linux-media@lfdr.de>; Tue, 25 Jan 2022 09:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238665AbiAYIGK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jan 2022 03:06:10 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50318 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378397AbiAYICz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jan 2022 03:02:55 -0500
Received: from localhost.localdomain (unknown [IPv6:2a00:c281:1137:e00:5903:19ba:8e99:7984])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 52F391F43DE9;
        Tue, 25 Jan 2022 08:02:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1643097771;
        bh=z5cpRrq+M90SlUwIcdV/JtyKwadHJkQq+rVo5L6BqQg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XtEInJch6+MVTpcb+72mVboGvG/DM713Iq9asV5fJibxfSwDUjSp54EE8DlvAYOby
         tBHlgxshv1l0UvsExFZaNyMqC1+8sbUIjT9BLmGSBCA88oWKGkBqft3/6Z5a9W5/GC
         Th8JK5aGY26zwWNzY8GUPF5XX9IqEexWU/0tTx6I3Af4ff133kowGkwxyeHQgBWUln
         EHGMK6QcLm+FcZVQQUtYjo7Z26bZWSb6foPwiN5249+hW9NOmZhikhhBKWE8k563L6
         Hj6QMUk7ddEmbXPJm/2WEwxl/7d8JZ+xrNgBc5Aw+aysb+WlbVe9UgzaEru2uvpOZu
         rQkvSyu7z1Syg==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     ezequiel@vanguardiasur.com.ar
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        ribalda@chromium.org, tfiga@chromium.org, senozhatsky@google.com,
        hch@lst.de, dafna3@gmail.com
Subject: [PATCH v2 1/4] media: stk1160: fix number of buffers in case not all buffers are created
Date:   Tue, 25 Jan 2022 10:02:10 +0200
Message-Id: <20220125080213.30090-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220125080213.30090-1-dafna.hirschfeld@collabora.com>
References: <20220125080213.30090-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In case we fail to allocate a transfer_buffer then we
break the buffers creation loop and update the number of
buffers to the number of successfully allocated which should
be 'i' and not 'i - 1' nor 'i + 1'

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/usb/stk1160/stk1160-video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 202b084f65a2..92c8b1fba2b0 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -511,15 +511,15 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 	usb_free_urb(dev->isoc_ctl.urb[i]);
 	dev->isoc_ctl.urb[i] = NULL;
 
-	stk1160_warn("%d urbs allocated. Trying to continue...\n", i - 1);
+	stk1160_warn("%d urbs allocated. Trying to continue...\n", i);
 
-	dev->isoc_ctl.num_bufs = i - 1;
+	dev->isoc_ctl.num_bufs = i;
 
 	return 0;
 
 free_i_bufs:
 	/* Save the allocated buffers so far, so we can properly free them */
-	dev->isoc_ctl.num_bufs = i+1;
+	dev->isoc_ctl.num_bufs = i;
 	stk1160_free_isoc(dev);
 	return -ENOMEM;
 }
-- 
2.17.1

