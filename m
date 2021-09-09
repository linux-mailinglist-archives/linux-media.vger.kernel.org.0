Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3FC64059F3
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 17:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237208AbhIIPC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 11:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239400AbhIIPCL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 11:02:11 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1387AC061788
        for <linux-media@vger.kernel.org>; Thu,  9 Sep 2021 08:00:53 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id n10so538377eda.10
        for <linux-media@vger.kernel.org>; Thu, 09 Sep 2021 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PFa3KJ/BqHh5hC+Ov9xT5eV0V5cc5CCGELgN2fPTVp0=;
        b=jbhHCUQjc2diNmHYzs9tbDzI97+sRa1m/MSxSz5EBAExSlhEilTdoS3b/J610OmToi
         QahEcOeeiNaStZafdlezPWS7bcqcAXu3WN3Rv14vg05MfUHchIY+alnfn2rz7aWvyEnm
         bKKFZcP4qLJKWy0fd6THt0vFFeGVSQQnQBt2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PFa3KJ/BqHh5hC+Ov9xT5eV0V5cc5CCGELgN2fPTVp0=;
        b=3FysiAvXhvTBbV9YaJLnN6dChxrzks3qe5UqiTzoFghynZf98YyqmW2K2VpZGVJERP
         yH9SumwotSUfacDAbIoQYQbcOBvebn6JsiaHYsNkEis0Ii1hxO9CY+s2FqFf/MR20U/y
         sr/RUjLkvvFhTAMbfPOlcQIrAnnyGbawiyhA9XH9PkYUWDaPbcYTnKnmhd6v9Xfthq3q
         ihcw04cwGgARCkyJFj8o+EO5PNjtvjk7GYMxKv9Rdvpruv5lLCRSbnHNbQ5tzaWOFtAe
         eNUeC6ZPY68VIO9eh8SD8Zu3t6mzEpUSnvBnhKOthtK3wyF59QEZe8ZJVhrS2LawflWp
         uN9g==
X-Gm-Message-State: AOAM533wgUdZjUIfxdk7fITDIyZC5Wo9aD3Nfy7HjTTffoaWouR4xabR
        VAjxDaFKh4UcQQUEP9/qYVGhX5veLQzOiQ==
X-Google-Smtp-Source: ABdhPJxA5iOmaIfeq5tgbjv83HOAY6NE9mxTugPZiHmhyaAw7QXJqkWEdYZ4Zx4ZpN10GjZyrxxOpw==
X-Received: by 2002:a05:6402:c90:: with SMTP id cm16mr3671319edb.170.1631199651678;
        Thu, 09 Sep 2021 08:00:51 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h8sm1139644ejj.22.2021.09.09.08.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 08:00:51 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH 3/4] media: uvcvideo: Return -EACCES for Wrong state error
Date:   Thu,  9 Sep 2021 17:00:45 +0200
Message-Id: <20210909150046.57615-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210909150046.57615-1-ribalda@chromium.org>
References: <20210909150046.57615-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For error 2 (Wrong state) return -EACCES instead of -EILSEQ.
EACCES is a much more appropriate error code. EILSEQ will return
"Invalid or incomplete multibyte or wide character." in strerror(),
which is a *very* confusing message.

Suggested-by: Hans Verkuil <hans.verkuil@cisco.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index dfea967309f2..8423941cfc95 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -108,7 +108,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	case 1: /* Not ready */
 		return -EBUSY;
 	case 2: /* Wrong state */
-		return -EILSEQ;
+		return -EACCES;
 	case 3: /* Power */
 		return -EREMOTE;
 	case 4: /* Out of range */
-- 
2.33.0.153.gba50c8fa24-goog

