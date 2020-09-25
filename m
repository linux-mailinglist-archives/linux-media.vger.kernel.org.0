Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92305279081
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729927AbgIYScm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729697AbgIYScl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:32:41 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4092AC0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:32:41 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 7so3285647pgm.11
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0rovwPvmS8/36q5dDn1a3LG+OYH5UJmxXVMPAQ9dEHM=;
        b=Wz5VqyMaLoP5zv1xtjWwZaV6vWDxog4V2ZHjj255CjAVaZLn8qJ8vvFpJkq9dWw0Lf
         +bsfKUhl7WDfo2ge/cGxIwsRXUbnWQi3+sm0oEoybpvIekZbAtdXDinF9nUnhXOkJGC2
         +19IJXQGYR0Qt6J/DI6OVi1qprWDpczQ/5p3lqnmJJFSZ9wA+/v0Eujxl5gO6YxcHPnd
         L5w9eSplFjaIPPOAt0AqdFh6L/y2OYVxmXSD2mAdhV09yeZXC/12KtLDxFD2L7lwFK7r
         iESZNGZotJQ8/m3SzODjAncct4/mdvN9BqqLuPyYRrBEAEUTj0pn7AESyrBHRnslD989
         9b4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0rovwPvmS8/36q5dDn1a3LG+OYH5UJmxXVMPAQ9dEHM=;
        b=IX6pu2KJfcL127/sr9UTdttWrsSNT5mvN0pT53Sx27s/9ZFqpTjFnaIWb++dOTpIup
         1wQG/NUTcSviHOIToffzW660s3g2xcLyA41j0fof8wpXFvvrjv9n3RfPzuyrWPJVK9oF
         SUsLkvXrhoCzjw4Ct8JkvTRvIfShaEp+DRsILQm4aq6HHitlPc/MVqe95ESc+SI12i9W
         vkETEVwb0VBFA1VGKrKIGemGDLzoaUHJ/lBD95DfoIyrMOeOldQYkZFLcjDlbqumUgqu
         9InX31wXFzI/g5JCLrsZZoBtG/0NjLlqtrw2UPxgODYxeUkqi/F4V3I0jsC0oaqnga8X
         d3mA==
X-Gm-Message-State: AOAM530qmegAjdp/kXV6nq7gcRJWaAcXfAfRkhK1qxWxfyd91b0R8XGc
        b5MVleoHtKzFJzdhWzF5sJwocA==
X-Google-Smtp-Source: ABdhPJyRbga0YgMv8IgWmr4NsJM5lMVhcRN0dmA71ZT694prdtpkKXABq2k7yQvL7e18LNDETZviOA==
X-Received: by 2002:a17:902:6941:b029:d0:cbe1:e76b with SMTP id k1-20020a1709026941b02900d0cbe1e76bmr739118plt.18.1601058760861;
        Fri, 25 Sep 2020 11:32:40 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.32.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:32:40 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 14/47] staging: media: zoran: use v4l2_buffer_set_timestamp
Date:   Fri, 25 Sep 2020 18:30:24 +0000
Message-Id: <1601058657-14042-15-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ns_to_timeval function is removed, so replace it with
v4l2_buffer_set_timestamp().

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 0d6c58a4161e..e74fd6a62606 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -1197,7 +1197,7 @@ static int zoran_v4l2_buffer_status(struct zoran_fh *fh,
 		    fh->buffers.buffer[num].state == BUZ_STATE_USER) {
 			buf->sequence = fh->buffers.buffer[num].bs.seq;
 			buf->flags |= V4L2_BUF_FLAG_DONE;
-			buf->timestamp = ns_to_timeval(fh->buffers.buffer[num].bs.ts);
+			v4l2_buffer_set_timestamp(buf, fh->buffers.buffer[num].bs.ts);
 		} else {
 			buf->flags |= V4L2_BUF_FLAG_QUEUED;
 		}
@@ -1228,7 +1228,7 @@ static int zoran_v4l2_buffer_status(struct zoran_fh *fh,
 		if (fh->buffers.buffer[num].state == BUZ_STATE_DONE ||
 		    fh->buffers.buffer[num].state == BUZ_STATE_USER) {
 			buf->sequence = fh->buffers.buffer[num].bs.seq;
-			buf->timestamp = ns_to_timeval(fh->buffers.buffer[num].bs.ts);
+			v4l2_buffer_set_timestamp(buf, fh->buffers.buffer[num].bs.ts);
 			buf->bytesused = fh->buffers.buffer[num].bs.length;
 			buf->flags |= V4L2_BUF_FLAG_DONE;
 		} else {
-- 
2.26.2

