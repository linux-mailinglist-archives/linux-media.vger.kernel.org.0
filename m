Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81E22A6C6D
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 19:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732239AbgKDSHx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 13:07:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732225AbgKDSHv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 13:07:51 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86159C040203
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 10:07:50 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id k10so21746930wrw.13
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 10:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VfhCDV/n9idjZ/d3QJ4jFPIhhk5FgusiEPH5kI39Shw=;
        b=CsTUsHFoi2cq5mlqNEg6Q8YdypKf+v8flbBmVvC2TFeHrP3SPfIp00pkrgMBBt4FL0
         a9Ulz06vG3ReIa2RC9wMhRau8jI1CF6/TBPVfn51WDviXxUh9+5mAUZoPRC2/2ENB082
         bXrjXU1J7l4yKtg6v2T6u8LZcWbh5J6f3b998=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VfhCDV/n9idjZ/d3QJ4jFPIhhk5FgusiEPH5kI39Shw=;
        b=R9cVytKtXlDt3WNujebIUjLGLUCcpRHHEa4b6ULmqwaQN4VdI8D9x16HvqqLcVw+Kv
         gnLjLa+/SZ1oEg6DhkXZVYNMno/LtMWoBY7hru83ngaMJ99BlR1l7349DiWJQzrLdiu1
         +8bqHn16qm1UZgc6TTHs/eVlwWcM0D/ScqZANWrkS5S0ZTVfzzMiLyWKC0IvWC81mpks
         /myAsiDFfZ9aPjlMjrYZVL410yZtuSpFjb1V0WJfpp+Q1Tw/mZqO7S66/uUPkRTzCQEp
         5QhDe7UsgnlcNolSbnx0jcwgCnkeIqDLToqD+GOPtQbgsBnpQfsVxLxajsAgovu+WkKY
         IEOQ==
X-Gm-Message-State: AOAM533RzRr2q+cW0dtc477BdSWgy19qR9okEeWBtIh4plrcQnXKTWQS
        DbPr9Y5ciWGBC70VzLpLoVnlWg==
X-Google-Smtp-Source: ABdhPJzzX85rrIcPc4D40s3Cht5BnMBvX0o1FGEgI1vk1Pl239321KjQC0eOL7x62pZeYBZOv4XeLg==
X-Received: by 2002:a5d:6cc9:: with SMTP id c9mr36246646wrc.276.1604513269347;
        Wed, 04 Nov 2020 10:07:49 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id y10sm3801841wru.94.2020.11.04.10.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 10:07:49 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 4/7] media: uvcvideo: Allow entities with no pads
Date:   Wed,  4 Nov 2020 19:07:31 +0100
Message-Id: <20201104180734.286789-5-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201104180734.286789-1-ribalda@chromium.org>
References: <20201104180734.286789-1-ribalda@chromium.org>
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
index 7a1b2decccc8..27acc221f0d6 100644
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
@@ -1061,7 +1065,7 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
 
 	for (i = 0; i < num_inputs; ++i)
 		entity->pads[i].flags = MEDIA_PAD_FL_SINK;
-	if (!UVC_ENTITY_IS_OTERM(entity))
+	if (!UVC_ENTITY_IS_OTERM(entity) && num_pads)
 		entity->pads[num_pads-1].flags = MEDIA_PAD_FL_SOURCE;
 
 	entity->bNrInPins = num_inputs;
-- 
2.29.1.341.ge80a0c044ae-goog

