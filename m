Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF34C2E006E
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 19:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgLUStB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 13:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgLUStB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 13:49:01 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929ACC0613D3
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:48:20 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id r4so11937549wmh.5
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=80KPby0xcz+iK59YkSpKMwmYMBDDjMUhltAQvUYuGYI=;
        b=PBUhAqFugSrK7CSnPkt/nRSA79ntpcvblfiGq0PCFSBHK4jYX9ZYrQjD2tDDQM+hK4
         vRXmKb5Vtzz6ervNwhcR6anPJGRNeJSRyB00KlORr2rUhygnNSh+nujwQde6jcoeAhPd
         ymmQpV1YZFOh+qGkiFbpAbe9QybGw763WvKv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=80KPby0xcz+iK59YkSpKMwmYMBDDjMUhltAQvUYuGYI=;
        b=X60AqBmoKAE9mZXVXdm1s8BbVOlAWyXVN9HYcOigYBa6eygE/XQRiNX+uxqqv33o3D
         2moX+RQc2Tivk/31LcPMZ6QLB3yKnU4+rNqDAY04urtZ/pTk5XN5Pra+Q18j/sd2ossh
         2Yvq13pYjwfCqjHNhbgAAZh2E4Iw+TwX2eU29gbvgiNeXI5yb0vnUiycI05fqrZRGr5A
         k+CP2suZS0TzAMcCdMZQEW0X/Ulchhn8BfdJp52E+Ma2/RslajBzxPvz+giRvR2wqLBa
         m82TKgXNbHCcFanyOOmGqlzCTtEU5Fqqv+vq9iJzuZNuIYuB9Grq3LMo143ZjE5R9Syh
         y/OQ==
X-Gm-Message-State: AOAM531+1P0cJ5MbkEsH+uKzVUkGlghX2SrIcgXcJN3nDyHhg06V72/L
        IuJ0ZEa/2xUpb2gXEMN2aoPgnupWyJ2vLFVSt0o=
X-Google-Smtp-Source: ABdhPJyTadWVI5YU5Jq8O4Budepa0tJFPD1wnTSdIcik689xVi5MtgGunTRsHnBgB4BEI8pFrC/8xw==
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr17324701wmh.88.1608569305892;
        Mon, 21 Dec 2020 08:48:25 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o125sm24581109wmo.30.2020.12.21.08.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 08:48:25 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 05/12] media: uvcvideo: Allow entities with no pads
Date:   Mon, 21 Dec 2020 17:48:12 +0100
Message-Id: <20201221164819.792019-6-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201221164819.792019-1-ribalda@chromium.org>
References: <20201221164819.792019-1-ribalda@chromium.org>
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
2.29.2.684.gfbc64c5ab5-goog

