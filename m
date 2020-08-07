Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 910F723E907
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbgHGIgY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgHGIgW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:36:22 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3198C061574;
        Fri,  7 Aug 2020 01:36:21 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id g26so1047579qka.3;
        Fri, 07 Aug 2020 01:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u028S+fFJt0WDonYhSla2H06FxGLv3HsaKZA8/NTV3U=;
        b=fct+j866dTT8yhxVu4p9BEWAQWfFg7B1WCsLXzxCzK09fIdLuMwjGk68JmeTb3tE4C
         xcvtrZeDQqSqy6jQsezFEUSkc02Dnw6hBbdyBWgDV+Y7sPKSIc7MwAqpgAU3xwWUcAME
         X73HVkl3wmRsDWIf4KDsKmIPyXt20gUJbJ0uGxQQCUscnWy7rd5/UWPYfz6b3m5R4sEe
         JF2EVkvKTv871stwctscNYzvA6asYKpk5q3qZZgzoAVLIjrZY8e2+GeyJYnN+DOhcRjv
         TMEVhtQ5qfazVfO0ULSzP5+YHuoImkUmuuRi5MXkDxjfeFN3Ef6Isl8ob8HXQQiBuHtI
         F5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u028S+fFJt0WDonYhSla2H06FxGLv3HsaKZA8/NTV3U=;
        b=CdlxnbmHZGS5jNgvcv0ChG9nL5IXXzPiFSA9PQlRJlpvexC5pgoJ7UffgZ4iPaTtht
         nTdSkY03Z8FzKgGzWySZTkOcgerWXH65IvKy++WTr+J4S+WMVs4uHYEyLyxy9kcGRbK1
         slKsyOuGSPJjG0GgRvQQnBP9VuTp7DKcMSRsfef9aY9WFiXByDpMeFjbdTg/CJjjzHZu
         uRgoBEaOtaG1MBwsjYrBy+K17flVB0kHFi7s30SG+gI3v/LXWjh2VhAQzi90pE3SROwh
         p62IKsuRmlOYjuqrhFGEYKwANLpMLVncPT8yYCjzw6w5VkkGyI3Tv4DBZBvBvX5VR2vO
         hbtw==
X-Gm-Message-State: AOAM5305heLgYlBaUTs4iKmQUuYxUvPblLAedRl0KhsGYUnkpP1+9wx/
        DvxTYAXAv/1mWMONPzC7WFc=
X-Google-Smtp-Source: ABdhPJz50fMdpFDgtUWwmwGngCI6hJXZBt/UYJZ0cpWN3OJDgTRM+sNwM4b69Xolannxoz+E7GKSfw==
X-Received: by 2002:a37:4391:: with SMTP id q139mr11994311qka.118.1596789381200;
        Fri, 07 Aug 2020 01:36:21 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:36:20 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/20] media: uvc: uvc_v4l2.c: add temp variable for list iteration
Date:   Fri,  7 Aug 2020 05:35:31 -0300
Message-Id: <20200807083548.204360-4-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fixes the following coccinelle reports:

drivers/media/usb/uvc/uvc_v4l2.c:840:8-13:
ERROR: invalid reference to the index variable of the iterator on line 836

drivers/media/usb/uvc/uvc_v4l2.c:851:5-10:
ERROR: invalid reference to the index variable of the iterator on line 843

drivers/media/usb/uvc/uvc_v4l2.c:851:22-27:
ERROR: invalid reference to the index variable of the iterator on line 843

Byy introducing a temporary variable for list iteration.

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 0335e69b70ab..7205ef13c2e1 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -826,6 +826,7 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
 	struct uvc_video_chain *chain = handle->chain;
 	const struct uvc_entity *selector = chain->selector;
 	struct uvc_entity *iterm = NULL;
+	struct uvc_entity *cursor = NULL;
 	u32 index = input->index;
 	int pin = 0;
 
@@ -833,18 +834,22 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
 	    (chain->dev->quirks & UVC_QUIRK_IGNORE_SELECTOR_UNIT)) {
 		if (index != 0)
 			return -EINVAL;
-		list_for_each_entry(iterm, &chain->entities, chain) {
-			if (UVC_ENTITY_IS_ITERM(iterm))
+		list_for_each_entry(cursor, &chain->entities, chain) {
+			if (UVC_ENTITY_IS_ITERM(cursor)){
+				iterm = cursor;
 				break;
+			}
 		}
 		pin = iterm->id;
 	} else if (index < selector->bNrInPins) {
 		pin = selector->baSourceID[index];
-		list_for_each_entry(iterm, &chain->entities, chain) {
-			if (!UVC_ENTITY_IS_ITERM(iterm))
+		list_for_each_entry(cursor, &chain->entities, chain) {
+			if (!UVC_ENTITY_IS_ITERM(cursor))
 				continue;
-			if (iterm->id == pin)
+			if (cursor->id == pin) {
+				iterm = cursor;
 				break;
+			}
 		}
 	}
 
@@ -1519,4 +1524,3 @@ const struct v4l2_file_operations uvc_fops = {
 	.get_unmapped_area = uvc_v4l2_get_unmapped_area,
 #endif
 };
-
-- 
2.28.0

