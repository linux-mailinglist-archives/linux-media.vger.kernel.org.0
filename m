Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C67463AA1
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 16:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234815AbhK3P4b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 10:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242231AbhK3Pxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 10:53:55 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A2D1C06175E
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 07:50:30 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id v11so45429001wrw.10
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 07:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ki71kgvDOv0KGrYuXh0nHXTuZUrKgQ/CTTcYFqAyUsg=;
        b=lKji71Xs/8y5DfDD7PvnNCgKeBARF8EgY+YS1H2YceR9q5672S7Evr8JOpkPbNUNjA
         8CR5t6tcqubqke4qPHKx0XB1mKgNSBfzZn3VE1UDfU+ktWacb2/q0IgfClvO50Fhx0l2
         FkRgnbMQnHw/SC3mQPHUraxkxtvQyuWhJtq1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ki71kgvDOv0KGrYuXh0nHXTuZUrKgQ/CTTcYFqAyUsg=;
        b=0UhtZcjAeU8N+5HkwgzNd7llTujA3DfLEmOcbMx1ffXoXgVk10Ug4Vi56P+IjoqlvI
         p/xv7IwBXSFpyOtHz4x0GJu/Aw7jXygCiiPoyXK3Nked5LRO3kR34zM10XWGhX3TcPJ3
         N8iaxNO06/FO6t5L7K1OrI80iy7t/m1Q75JXm3BpJBEuoywanmPt5ROaUVra2qL92W5E
         drdZpqNqn3/jtxmqMpmJ//SecDOtJ1zCh6O3ZTU6FNReth1RfwCtHnbqWD9P4luqNVjW
         ncGcERwUgV+MIz1iO3o2Jxejbp/EO8BgNtzgAb7r080lCKw9EvWxhFQz7naHxYUsj+me
         8D+Q==
X-Gm-Message-State: AOAM5311DlmIu+Up8io/lK6pqT9zhrLznySZP5ZjhwjWMIzTUfz6/pxK
        YKRdGJK3hNOITIYPc3iSJdnfMA==
X-Google-Smtp-Source: ABdhPJxjdpi4fGSp6dC1DdNHBxwP2B+1uYeTKIK3I9eW9J02Mr4OLGpPXYeQ069+IKh3xJ//I+Tj8Q==
X-Received: by 2002:a5d:4fcc:: with SMTP id h12mr43511564wrw.434.1638287428990;
        Tue, 30 Nov 2021 07:50:28 -0800 (PST)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id b13sm13555207wrh.32.2021.11.30.07.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 07:50:28 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 2/2] media: uvcvideo: Avoid returning invalid controls
Date:   Tue, 30 Nov 2021 15:50:26 +0000
Message-Id: <20211130155026.1082594-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211130155026.1082594-1-ribalda@chromium.org>
References: <20211130155026.1082594-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the memory where ctrl_found is places has the value of uvc_ctrl and
__uvc_find_control does not find the control we will return and invalid
index.

Fixes: 6350d6a4ed487 ("media: uvcvideo: Set error_idx during ctrl_commit errors")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index f7b7add3cfa59..f1f6bb14fb0a6 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1639,7 +1639,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
 				  struct uvc_control *uvc_control)
 {
 	struct uvc_control_mapping *mapping = NULL;
-	struct uvc_control *ctrl_found;
+	struct uvc_control *ctrl_found = NULL;
 	unsigned int i;
 
 	if (!entity)
-- 
2.34.0.384.gca35af8252-goog

