Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E292B2B9D20
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 22:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgKSVub (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 16:50:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgKSVua (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 16:50:30 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6997C0613CF
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 13:50:29 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id c9so8553632wml.5
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 13:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zOlDw3xAtBO2wRxDpudGLYAgtj4GYNudNiFuGERnAjQ=;
        b=OcG+6ZXdy+PQO9GK7Nw/wczVsoutxZ1M3eanuJ7kt69pL4SHrH/xal6OVYAbPJ3GEX
         bwP/pVEqa0IvEttvhnJGpczgh1hVXhex6bywvdrS/pn3E5PJWKdHei7jpq8uvLsfIhC3
         YabrY2RVvcJdnGquxSn0V/Y09N17mS8cZOOHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zOlDw3xAtBO2wRxDpudGLYAgtj4GYNudNiFuGERnAjQ=;
        b=IghyoRXOg5tqRzbSZbg+GC0uX22Kk/hvCVwyd3c+YdZZ5f/jpQqhp/9F4EXFid9AxZ
         9FF+7b1b7ttEIFJS0YLkzuzSfl5YNNBIx360ZKH/ee4zokir0jwWQi/tbzZYVVxLZaNR
         6ULsqHf+sse/pjhZke5rgKDobvzfx0w0t84+Ovd5cXlPWXII5qE2FPqy1MVJ36VQ7NLc
         3hVy8r7MOcDj7olhze2HKn+a3ilmOzf4HoutHM7+YM5VLy4M5d6YuDxwfXZtUWCDSb3E
         4NVAvB0E0VZyssYSfNRg+goM/mhTBDn4+0IN4u/9fh3yNsRInxKPxjFerG8jXEu5QhLB
         Jdwg==
X-Gm-Message-State: AOAM532v33akbim8twsHg/1Z+ysH1dbInUQEyJ+Q4i7V/dOsCBJSksq2
        Swi+N6TrB49FXE83Si8vx575XA==
X-Google-Smtp-Source: ABdhPJwThvKiCdR+FOWM2aS+lAsiSpMLYOX5XIBtHyibvCm1PLYmlw0vayTKCFMrhzQ0wQCRGVNwPw==
X-Received: by 2002:a7b:ce84:: with SMTP id q4mr6438582wmj.26.1605822628600;
        Thu, 19 Nov 2020 13:50:28 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t136sm1818859wmt.18.2020.11.19.13.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 13:50:28 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 3/8] media: uvcvideo: Allow entities with no pads
Date:   Thu, 19 Nov 2020 22:50:15 +0100
Message-Id: <20201119215020.508487-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
In-Reply-To: <20201119215020.508487-1-ribalda@chromium.org>
References: <20201119215020.508487-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Avoid an underflow while calculating the number of inputs for entities
with zero pads.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 9f4451a2e0a6..534629ecd60d 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1033,7 +1033,11 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
 	unsigned int i;
 
 	extra_size = roundup(extra_size, sizeof(*entity->pads));
-	num_inputs = (type & UVC_TERM_OUTPUT) ? num_pads : num_pads - 1;
+	if (num_pads)
+		num_inputs = (type & UVC_TERM_OUTPUT) ? num_pads :
+								num_pads - 1;
+	else
+		num_inputs = 0;
 	size = sizeof(*entity) + extra_size + sizeof(*entity->pads) * num_pads
 	     + num_inputs;
 	entity = kzalloc(size, GFP_KERNEL);
@@ -1066,7 +1070,7 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
 
 	for (i = 0; i < num_inputs; ++i)
 		entity->pads[i].flags = MEDIA_PAD_FL_SINK;
-	if (!UVC_ENTITY_IS_OTERM(entity))
+	if (!UVC_ENTITY_IS_OTERM(entity) && num_pads)
 		entity->pads[num_pads-1].flags = MEDIA_PAD_FL_SOURCE;
 
 	entity->bNrInPins = num_inputs;
-- 
2.29.2.299.gdc1121823c-goog

