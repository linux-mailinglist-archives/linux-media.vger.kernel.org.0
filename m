Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52DD73EF001
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 18:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbhHQQMl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 12:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhHQQMk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 12:12:40 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93AB7C0613C1
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 09:12:07 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id i6so32311465edu.1
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 09:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lV5/yBJAE61dtnQkRvtjI+pYiYb2DR7Vqp0AekIo3ec=;
        b=VOXnKmjFnFmS1xfKUWg3NtHjtWJEbd6idd3gAUR/1VBdcSTc8oC4UM+b4nayT8eW4g
         7jHHzs2TDIfGlnegUD2E9dJ6Npla5VNgRnWWjPCYRZqUK54TW24BsjiD0h+UoSdokOTf
         Ec3SRY5zEXEfFlXiB/DvCxHHmWV1uEBm2mJfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lV5/yBJAE61dtnQkRvtjI+pYiYb2DR7Vqp0AekIo3ec=;
        b=cFpYYacxi9ejyEwCE0mROz70MbfU3B1PlnbONvAcrTUlV/LPsNJzpWaRej6WyPsU7B
         ccUb+XX4ZKUF4//oyfK1PM3e+wrrGU4I+WT3ZDfkxHD8j4FxP5quO/SuivHH3l4TvQis
         P6ZYtoX3gdtJFDKs0iUzt9L5KsWpHpG+DwPEH3yRRQkwPrX1oNBxvxtvt2V53uFG02a8
         EJ8mmFAo/7LIy8mkjkkZXBgyvi1HXoAsPzFlZYHFphMs+durMAFoTetwAjP6bQhQotg5
         1bLUiKu4p2sz0pZx5oGUH6X8IJSi0Ecdb/HmH40RCIX+QENyN4MUY0JEx9BynvtPpNoF
         W9mQ==
X-Gm-Message-State: AOAM532GWuH0sS8zq+QfTHQZRu6h+iXuxmho3fDWtfjmFMl0vAx37V98
        eS2KNcDdyyK74xgtOx1TLCTzbA==
X-Google-Smtp-Source: ABdhPJzkrrlqxI3kGBOiaOnn1xEGGmjshJ1ndvFgiALEGi1Tv7L8akzppYHNOJtc9v1+4uctkfssaQ==
X-Received: by 2002:a50:9b06:: with SMTP id o6mr5085509edi.284.1629216726174;
        Tue, 17 Aug 2021 09:12:06 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id b3sm945080ejb.7.2021.08.17.09.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 09:12:05 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] media: uvcvideo: Support borderline implementation of hw timestamping
Date:   Tue, 17 Aug 2021 18:12:02 +0200
Message-Id: <20210817161202.49560-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some cameras do not set pts and src if there is no camera data in the
buffer. They do this without clearing the PTS and SCR bits of the
header. This is probably done due to a strict/borderline interpretation
of the standard:

"STC must be captured when the first video data of a video frame is put
on the USB bus."

Eg:
buffer: 0xa7755c00 len 000012 header:0x8c stc 00000000 sof 0000 pts 00000000
buffer: 0xa7755c00 len 000012 header:0x8c stc 00000000 sof 0000 pts 00000000
buffer: 0xa7755c00 len 000668 header:0x8c stc 73779dba sof 070c pts 7376d37a

Support those cameras by only decoding the clock if there is camera data
in the buffer.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e16464606b14..6d0e474671a2 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -490,6 +490,18 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	if (len < header_size)
 		return;
 
+	/*
+	 * Some cameras when there is no camera data in a buffer, do not
+	 * handle properly the pts and scr. This can be due to an borderline
+	 * interpretation of the standard: "STC must be captured when the
+	 * first video data of a video frame is put on the USB bus."
+	 * Due to their internal design, their firmware cannot clear the
+	 * UVC_STREAM_PTS and UVC_STREAM_SCR bits. Which forces us to use the
+	 * length of the buffer to decide if pts and scr are valid or not.
+	 */
+	if (len == header_size)
+		return;
+
 	/* Extract the timestamps:
 	 *
 	 * - store the frame PTS in the buffer structure
-- 
2.33.0.rc1.237.g0d66db33f3-goog

