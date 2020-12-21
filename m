Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75F32E0036
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 19:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbgLUSmz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 13:42:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbgLUSk4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 13:40:56 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F3BC061793
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:40:15 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id x22so10793295wmc.5
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kP8yYt31i5ONWl1LfXGzW6cFigEjf/TbpTOooi2m/ec=;
        b=kE8Vb5B4Zev9IefCltuuQwNxOVTpBzcStyZwon/c/qNBWWargTnjd8ekd9XjkCUlcu
         /NaM5J8fkc06TjZDglePQ5DgUKbFw2YWUsidoliiRexnyED37+0Dg7w7hO7uyrikyE+y
         gIoRIk0EwqZyWaxEc5dpfUjOgHbqQtJVq66uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kP8yYt31i5ONWl1LfXGzW6cFigEjf/TbpTOooi2m/ec=;
        b=Ev2ZUU/6E0Bg0yJ10VL8JldyYW/CxwrXMtjffe/aLkJS5f/lV8aQde0jNc9I+A8IKj
         81cLkz6pNWKybBgRXP/UVhcepp4BQbI7C8SRq49S5VmhpdEfwfQUdj4KYcEsHrVdeG2Y
         dW5cjgBUlqTBprrx45KTh4FNgFrDBX8QjW8j1fjg1+ed/MNrzCdI1MaF/51ohckjQV4I
         52ooLtUhvgp/qaj6ONOOlx758VVvuHIfUWthMu8EBVC+k2MWvcMx1AquOFhzu2tLf8vx
         kuXBpgk3fezJmtXvvkgslbS6Jmlzgpf8678ipDsxJcN/b6rRJpMeIy/L7wT0c7xjCLW5
         y+MA==
X-Gm-Message-State: AOAM531imoP+7otleKk6e29B6k7r9r8VDKPWb+QjXg9WNk96UvqxbTa/
        +AW5Wen9yS8JhJ0Vpc9VDtVVcK3UH0UqyGCt7Kg=
X-Google-Smtp-Source: ABdhPJxslxLVGEOuROyEdv8KQAorJoPoMR/GHeNPyPsE7RYTrpRJIouIyPUS4mCv1DvbUKXJUzcmUw==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr16820996wma.17.1608569302884;
        Mon, 21 Dec 2020 08:48:22 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o125sm24581109wmo.30.2020.12.21.08.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 08:48:22 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 01/12] media: uvcvideo: Fix race condition handling events
Date:   Mon, 21 Dec 2020 17:48:08 +0100
Message-Id: <20201221164819.792019-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201221164819.792019-1-ribalda@chromium.org>
References: <20201221164819.792019-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The control and its data needs to be copied to the workqueue at the same
time to avoid half-updates of the events.
This is, events reported to userspace were the control id does not match
its value.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
 drivers/media/usb/uvc/uvcvideo.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 011e69427b7c..aa18dcdf8165 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1332,7 +1332,7 @@ bool uvc_ctrl_status_event(struct urb *urb, struct uvc_video_chain *chain,
 		return false;
 	}
 
-	w->data = data;
+	memcpy(w->data, data, ctrl->info.size);
 	w->urb = urb;
 	w->chain = chain;
 	w->ctrl = ctrl;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index a3dfacf069c4..0db6c2e0bd98 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -678,7 +678,7 @@ struct uvc_device {
 		struct urb *urb;
 		struct uvc_video_chain *chain;
 		struct uvc_control *ctrl;
-		const void *data;
+		u8 data[UVC_MAX_STATUS_SIZE];
 	} async_ctrl;
 };
 
-- 
2.29.2.684.gfbc64c5ab5-goog

