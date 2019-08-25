Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE2579C613
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2019 22:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728935AbfHYUTy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Aug 2019 16:19:54 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46065 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728467AbfHYUTy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Aug 2019 16:19:54 -0400
Received: by mail-pf1-f195.google.com with SMTP id w26so10216287pfq.12;
        Sun, 25 Aug 2019 13:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=XguKWnDffzr7AqoRgU/VQBvkCeOmZ8YXW620WGCFcfo=;
        b=YW3QSgHDV9Q2oB/DaRTgLqHVpp+tb6/qlnDXjS2FGkD6nSJnfy85oNTBk4etP2NHi3
         +/0gDN3m4D/SWDQUC6gS5oGiRubMmb0zJkpJyAhtr4qVjisX8t41DTDewaBa7/v2LlgZ
         lAK2N19JKUUSpcbFyToNtakgdN/fkGdQiPrXKLMT97a4dAxoiD59i4KI+Vn88Sn9cLo2
         3xMYRj9uVtPW7x6/ba6NBtijD8tCARpJ0KjIu2ZYSPRKaRLsEyiNXFqrHup3sWaucqZ3
         xl43vSKzuCcRtKHY+JGb9Ui6/faN0TWeoGBJR5LUcQaDF4LSha1nTCeXcrhWvPUI0/Yt
         AdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XguKWnDffzr7AqoRgU/VQBvkCeOmZ8YXW620WGCFcfo=;
        b=OkC8AF+ek4PrScEIgyIEcYZAFDh0ol1G8WVHqqfYq3zqNySRR+Qh4y8BBpc1VwoOe0
         MezFknV2edJI3I3etKlxuOWevkxhsJGrN2lxl9n8hj55GM/WKc9JhMPUVPI6FBzZawhw
         t+9mTEQTi7VQOjcP/tlLDg+OYjNHKGByyvYtnUxnbcqbNtBypHQbqDllpY0xKK0yVvGd
         VyU5KGDUIMGV/nSnLjTmnOy5gebUdh8w/H5zlUaezsTjXafuDAuaPQLjHkrApTxBgF2r
         cJaOaKMzJnq18DXGdQsz0K2aREuYdmIQsnh+pgBbkU3Sj83GvR1Zy0FFzz56zR8KJ+G6
         jmTA==
X-Gm-Message-State: APjAAAU/11+hQOAvVcvJJeOFXDpxR0WJYT6sNhf1tj/eMWMXS5jmkILf
        hV0v+0sVVeaRqLbLsMNrfKc=
X-Google-Smtp-Source: APXvYqwutof2ugAF94wxlwY8EOnF+gDFNVgBVVKkkiKWFiP78nVn7Hqb1sA7FARFx1DjCN/P5MXV8Q==
X-Received: by 2002:a65:6846:: with SMTP id q6mr13510455pgt.150.1566764393672;
        Sun, 25 Aug 2019 13:19:53 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([106.51.17.2])
        by smtp.gmail.com with ESMTPSA id 4sm10855710pfe.76.2019.08.25.13.19.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 25 Aug 2019 13:19:52 -0700 (PDT)
From:   Souptick Joarder <jrdr.linux@gmail.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org,
        rfontana@redhat.com, sakari.ailus@linux.intel.com,
        tglx@linutronix.de
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH] [media]: usbvision: Remove dead code
Date:   Mon, 26 Aug 2019 01:55:41 +0530
Message-Id: <1566764741-20098-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These codes are commented since v4.2-rc1. If there is no plan
to enable the #else part in future, these can be removed
forever.

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/media/usb/usbvision/usbvision-video.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/usb/usbvision/usbvision-video.c b/drivers/media/usb/usbvision/usbvision-video.c
index 93750af..896837f 100644
--- a/drivers/media/usb/usbvision/usbvision-video.c
+++ b/drivers/media/usb/usbvision/usbvision-video.c
@@ -967,7 +967,6 @@ static ssize_t usbvision_read(struct file *file, char __user *buf,
 	       __func__,
 	       (unsigned long)count, frame->bytes_read);
 
-#if 1
 	/*
 	 * FIXME:
 	 * For now, forget the frame if it has not been read in one shot.
@@ -976,15 +975,6 @@ static ssize_t usbvision_read(struct file *file, char __user *buf,
 
 	/* Mark it as available to be used again. */
 	frame->grabstate = frame_state_unused;
-#else
-	if (frame->bytes_read >= frame->scanlength) {
-		/* All data has been read */
-		frame->bytes_read = 0;
-
-		/* Mark it as available to be used again. */
-		frame->grabstate = frame_state_unused;
-	}
-#endif
 
 	return count;
 }
-- 
1.9.1

