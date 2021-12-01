Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAAA464677
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 06:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbhLAFZr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 00:25:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbhLAFZn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 00:25:43 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 148C1C061746
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 21:22:23 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id y13so96474114edd.13
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 21:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LInnp9x8u9mf0GXKU7WN+JMCjP6k+dFEFMGgm0Wllkk=;
        b=T+3a13C86m6lxe+Vsm+0x9Vwc7RYBkpYyzscbgqGWKMocZMZ8ZcZ2hb1KdU3mAE94/
         Jha7XRXScvPReRlmarW/oQD/h3+zY/N6HadMKi1HJkg43VMljfiQlE9Kh08wh/RlHUOC
         xa/WHLANqSL4IyhNv+poumaEOfQZqLN5/8mwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LInnp9x8u9mf0GXKU7WN+JMCjP6k+dFEFMGgm0Wllkk=;
        b=JmJFZCr0WNTnsrzM3ds121oynYX8nPhbHNrf81DSkE8qyVbAs/gS1AjOPWSiEFaW9Z
         vxY2kaqTqBI4EtE5+ucF87N/xKVt96thfj0Se1RI7R7lCSLhIgjqw5qkKc1Dxw054ccY
         bwYhAr4Be1q3vP4gixQbF5b5BVcCxNbWN7fHujDKVpwSoKfNhJHTtziB8LMsaI5sz2U7
         IVABWyR1l0EimJuGsD2V+4CvfBKKrKuQmwz5bxRWVmvfhGJGXSrqufzS39qYEaZPdnG9
         nAfkA9lqZlAe6kzE1VfgQcc7ik1WJta8I73UCw28ys8q8DIXdxYVPkKKE2hEbdBMK7kY
         gQpA==
X-Gm-Message-State: AOAM532Wde6vnsxn6YpIzkXhmAjrRLBcXDgB0PLyFW52PB5h/T3vJaiM
        GFTfOTTJtJtIxFs6Qn07iy8VmQ==
X-Google-Smtp-Source: ABdhPJxjp0Gn5G+5fT/4pb8K8kprP3eiPxr5a70TJ5mFWSHd6ZvORXfQMRvg+mvRk2I8hsFoAyQdAQ==
X-Received: by 2002:a17:907:608e:: with SMTP id ht14mr4361642ejc.259.1638336141630;
        Tue, 30 Nov 2021 21:22:21 -0800 (PST)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id c11sm13977663ede.32.2021.11.30.21.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 21:22:21 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 1/2] media: uvcvideo: Avoid invalid memory access
Date:   Wed,  1 Dec 2021 06:22:17 +0100
Message-Id: <20211201052218.689103-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If mappings points to an invalid memory, we will be invalid accessing
it.
Solve it by initializing the value of the variable mapping and by
changing the order in the conditional statement (to avoid accessing
mapping->id if not needed).

Fix:
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] PREEMPT SMP KASAN NOPTI

Fixes: 6350d6a4ed487 ("media: uvcvideo: Set error_idx during ctrl_commit errors")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 30bfe9069a1f..9a25d6029255 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1638,7 +1638,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
 				  struct v4l2_ext_controls *ctrls,
 				  struct uvc_control *uvc_control)
 {
-	struct uvc_control_mapping *mapping;
+	struct uvc_control_mapping *mapping = NULL;
 	struct uvc_control *ctrl_found;
 	unsigned int i;
 
-- 
2.34.0.rc2.393.gf8c9666880-goog

