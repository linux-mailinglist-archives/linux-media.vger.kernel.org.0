Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27C133C468
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 18:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236357AbhCORgq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 13:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236233AbhCORgS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 13:36:18 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0FA0C06174A
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:36:17 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id mm21so67602254ejb.12
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n2McJ4orme7TVFFGukUYbf60VW2rOQ2iPSbtsUX6k5Q=;
        b=AO2/KGij2aPAHkO/yr2Ehk3P6lxoenzqfDpfMTQ7oxOggTyhqYUS/zEpqx3G/lmMpj
         LFb+EUVL9D5P/YEHZHpikmK9yaXLKVjlQ9jwuhbHpljEfl+VRAUnbenkYOiwMk09U/yR
         sa9Trqqlr+RyD67n/tKoONGNeA5dja3YXOwv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n2McJ4orme7TVFFGukUYbf60VW2rOQ2iPSbtsUX6k5Q=;
        b=Y+kU54o5D02oqF8SBBwawfU+6tUHfaHSDVDtZ2Gl71flfhiQkNpokrA6uPCtMq0LSB
         jjwdDfGsj13CgbbMrwoTvzu+haHdtjXf0Qs1SZEM1QwuS4565kpqDp3ndIwQuFEo28KI
         57peMM4fP9Do20HOajGnZmCj5nnEB5I3wCHyQ7y6jGJscPO/nTz0YYugvimLM16rLk+z
         Ca/aUOK9Pm2KYasOp66Aax7HbXbDR55S8qwvItcMOODE4zeGZuxCaZyIRiP00o6DYHCY
         Y4t81sRKKMwwUshlat2++xVyHCycWNIult0JLJ3gJEXF09rQWwCF76dFhppFit+P68UP
         xKYg==
X-Gm-Message-State: AOAM530rKMSqLeF98dx30AmBZ+Dx9uAkDM2vyEConX6+ZOKnNehPEpfZ
        TjZU+W574v7MIuVb+1xhnzocgQ==
X-Google-Smtp-Source: ABdhPJzAvdUAySIVBlaFpoNwC963sAo4TgCnw4pIvRT6jX8JVydquT0R1+zLBMycJ+PTDNN7JTZUUw==
X-Received: by 2002:a17:907:98f5:: with SMTP id ke21mr25016488ejc.552.1615829776633;
        Mon, 15 Mar 2021 10:36:16 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a3sm8109239ejv.40.2021.03.15.10.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 10:36:16 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 09/11] media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE
Date:   Mon, 15 Mar 2021 18:36:07 +0100
Message-Id: <20210315173609.1547857-10-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210315173609.1547857-1-ribalda@chromium.org>
References: <20210315173609.1547857-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans has discovered that in his test device, for the H264 format
bytesused goes up to about 570, for YUYV it will actually go up
to a bit over 5000 bytes, and for MJPG up to about 2706 bytes.

Credit-to: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvcvideo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 1f17e4253673..91fc00ff311b 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -528,7 +528,7 @@ struct uvc_stats_stream {
 	unsigned int max_sof;		/* Maximum STC.SOF value */
 };
 
-#define UVC_METADATA_BUF_SIZE 1024
+#define UVC_METADATA_BUF_SIZE 10240
 
 /**
  * struct uvc_copy_op: Context structure to schedule asynchronous memcpy
-- 
2.31.0.rc2.261.g7f71774620-goog

