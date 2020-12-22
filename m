Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 369072E107C
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 00:13:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgLVXGL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 18:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728123AbgLVXGK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 18:06:10 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5830FC061248
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 15:04:52 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id r7so16646112wrc.5
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 15:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UvpyONwNGFK1cqijvX/a2/5UzH+LaYn5TNyYwWHAtHU=;
        b=PfQsqWri/hKgNl0nF1hq5MvL9I4M8x+jpaWzsXDrHWHdnwxMlSc1a9K2+IirTsCI6P
         QTalWNKVslAkaSv2t/Wd3RFMhMTXc69ox9W00Ft4l2+yUqXt03IdaXBnBEjcsKkWsynT
         DJWLxKUtWk0jq829P9coHpWV95N050r+4Gus0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UvpyONwNGFK1cqijvX/a2/5UzH+LaYn5TNyYwWHAtHU=;
        b=OP7O/Nnz/dpLJndbWLxPCF+jRXbVWS59VXAwrJll9cb2XtXeV5DHzvPXQZJgJaUg2N
         VJR/qyZYI22ce7unvD8gojb7T3+IF1iXIxf40m/cM3jfK80OQ0Xx59Pmqj93iFLHzO8a
         ai2UAVHffwhGYiQu3bxwjdBm0zsuZvv0TOC+c8BIGivHlax+e0PyigQdakN+iJfa82G7
         T59wDLBwnHatRPlLO5aJHErwOoy8EGd3S6tBmfQBVB8x/k37ZldQ+Ve9+lYK23NEd0fG
         ePbxi9kYewUSUNB8X1LI59wX/y3gYYsPp6ejNplR098ObGGCm0CM+6qH4/39e6AMA/8V
         p2qg==
X-Gm-Message-State: AOAM5326w/Ht1KAOQqHEnB+xiH/5b63ztEaxTymteAikM7n5+9um8x06
        242Mt96YjiU3v1/6RZHLIUKm+g==
X-Google-Smtp-Source: ABdhPJzAMjgZKZ5YBCR64KDyR43RuN7gKzJmCyrynQQv81rVO5TYtW9pt+bF0SFcpFEr3F0xt6xO6Q==
X-Received: by 2002:a5d:60ca:: with SMTP id x10mr27092842wrt.242.1608678291064;
        Tue, 22 Dec 2020 15:04:51 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id r16sm34463401wrx.36.2020.12.22.15.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 15:04:50 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 03/11] media: uvcvideo: Allow entities with no pads
Date:   Wed, 23 Dec 2020 00:04:38 +0100
Message-Id: <20201222230446.1027916-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20201222230446.1027916-1-ribalda@chromium.org>
References: <20201222230446.1027916-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Avoid an underflow while calculating the number of inputs for entities
with zero pads.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 82cdd1bb28dc..c0c5f75ade40 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1033,7 +1033,10 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
 	unsigned int i;
 
 	extra_size = roundup(extra_size, sizeof(*entity->pads));
-	num_inputs = (type & UVC_TERM_OUTPUT) ? num_pads : num_pads - 1;
+	if (num_pads)
+		num_inputs = type & UVC_TERM_OUTPUT ? num_pads : num_pads - 1;
+	else
+		num_inputs = 0;
 	size = sizeof(*entity) + extra_size + sizeof(*entity->pads) * num_pads
 	     + num_inputs;
 	entity = kzalloc(size, GFP_KERNEL);
@@ -1065,7 +1068,7 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
 
 	for (i = 0; i < num_inputs; ++i)
 		entity->pads[i].flags = MEDIA_PAD_FL_SINK;
-	if (!UVC_ENTITY_IS_OTERM(entity))
+	if (!UVC_ENTITY_IS_OTERM(entity) && num_pads)
 		entity->pads[num_pads-1].flags = MEDIA_PAD_FL_SOURCE;
 
 	entity->bNrInPins = num_inputs;
-- 
2.29.2.729.g45daf8777d-goog

