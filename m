Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC2CF23E905
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgHGIgT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgHGIgS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:36:18 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66389C061574;
        Fri,  7 Aug 2020 01:36:18 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id x12so744024qtp.1;
        Fri, 07 Aug 2020 01:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+JFdj4sPIeByfBYRmF6Vt6YCTyJ6MLJ/8TJDghwLhlI=;
        b=gCpC7fzeIm+LGpcHVTEPpJZ/qYf3NBmCWnEdXvNd8bPPSg3ETdXqAgp3s8CAu8vUCH
         FCZ0xIYvC/7P3l6/4C0rmj1aVAn122Ud91Yl6LYlwTFMNFb5mcSjXWHrg+5ISEcuWAsD
         4c4YpKeY7IbyHfR5FUWXRvWiX/LdCBeumzsaUKQu03DoftsTiOWj3il9XwjWHd9z2HLs
         fhpoXN8yLApN3YrAsNg84d0H/oiFYnnETzI1r1nNeA2IiH4JsirBEvmwhOllOBYZtlWJ
         u2peodGRjn+EWGQr98qp3/VjxL3hh8foOj9HdOlODegN1by7d+ouJP6zIu3okWe4oSAA
         IkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+JFdj4sPIeByfBYRmF6Vt6YCTyJ6MLJ/8TJDghwLhlI=;
        b=gD+duSO5tK0yTdyOWI0MT33c46Dqeyj1n+8T/U1V5zVw82rtd/akjVu31otlmhXQhQ
         G2XmFvObeu/XRqgIQrnc8xDPWbFaIh2B5AYRGNYtBCmFWl1BJfKJyrB5OkBxbCJTZ9VD
         Xnfza8G1j/RTh/QsMdrSgP6Pt2bGF0X1rDDH6V+4LKsNNkHaq11c0oZlKylH96g+7Uiu
         3UWtEKhr1o8epdIUHXFohycR+XJRA2KnzYHpJQgUU9iq+kXDA4wGRc7hSxZCjFVarm6f
         AB40iu76cnhVUzgKqc8A4moRx52NW25zX0z8unTsAzVimmvonxHwrk9AtTXf+SmG473T
         S0KA==
X-Gm-Message-State: AOAM531SE2y3tzQbtCT2eoqz/wd8YJ6DiDC94vfRLdtovaU4RnNlULLm
        4m0+c4+aHz5z2OH1wSpM0KU=
X-Google-Smtp-Source: ABdhPJx75PuruEt8qHJ8OOp1bhFr8Ltch/1Qp0AM1JHak/WmoG+fWRy+/rscLLvooLeS3Czxp7l7IQ==
X-Received: by 2002:aed:32e7:: with SMTP id z94mr13069624qtd.17.1596789377617;
        Fri, 07 Aug 2020 01:36:17 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:36:17 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/20] media: usb: uvc_ctrl.c: add temp variable for list iteration
Date:   Fri,  7 Aug 2020 05:35:30 -0300
Message-Id: <20200807083548.204360-3-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fixes the following coccinelle report:

drivers/media/usb/uvc/uvc_ctrl.c:1860:5-11:
ERROR: invalid reference to the index variable of the iterator on line 1854

By introducing a temporary variable to iterate the list.

Do not dereference the 'entity' pointer if it is not found in the list.

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e399b9fad757..567bdedc2ff2 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1842,7 +1842,8 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 	struct uvc_xu_control_query *xqry)
 {
-	struct uvc_entity *entity;
+	struct uvc_entity *entity = NULL;
+	struct uvc_entity *cursor = NULL;
 	struct uvc_control *ctrl;
 	unsigned int i, found = 0;
 	u32 reqflags;
@@ -1851,13 +1852,15 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 	int ret;
 
 	/* Find the extension unit. */
-	list_for_each_entry(entity, &chain->entities, chain) {
-		if (UVC_ENTITY_TYPE(entity) == UVC_VC_EXTENSION_UNIT &&
-		    entity->id == xqry->unit)
+	list_for_each_entry(cursor, &chain->entities, chain) {
+		if (UVC_ENTITY_TYPE(cursor) == UVC_VC_EXTENSION_UNIT &&
+		    cursor->id == xqry->unit) {
+			entity = cursor;
 			break;
+		    }
 	}
 
-	if (entity->id != xqry->unit) {
+	if (!entity || entity->id != xqry->unit) {
 		uvc_trace(UVC_TRACE_CONTROL, "Extension unit %u not found.\n",
 			xqry->unit);
 		return -ENOENT;
-- 
2.28.0

