Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E74A06BB28F
	for <lists+linux-media@lfdr.de>; Wed, 15 Mar 2023 13:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232876AbjCOMhV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Mar 2023 08:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232576AbjCOMhG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Mar 2023 08:37:06 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFF59F236
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 05:36:09 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id eh3so18980715edb.11
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 05:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678883757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmbQJ7O/6JS/WmDJaNmVYSgRY/QPgP7mF5MHe8za06A=;
        b=PFCpFqjiqIYZYC4iO9lzTESvAbW9pwjL3bpvWpgplyx+BTtFDFpwsNFEXAJl717pak
         ZOpFbOFllwVsXGELIa9NjexnQP7jDQZQOgStfNv6fdFvOcdI+qsImy5YZhlM4qdpanIH
         s9qUfAAUcIT2mXa1MqHNozS5Jt5A9KDGfynVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678883757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmbQJ7O/6JS/WmDJaNmVYSgRY/QPgP7mF5MHe8za06A=;
        b=YHl4PvOsnZZPWbaVxvODarJt5Rl9zKttxxLqq1H7oJ8UYhpsFACpgcJvfwxuHmZutG
         lG3KRI4/Vjla9ZqC7tNXulNQoEGxVLa0nU4t6UrpuXU+60+H8AEA9WinmzbvxyduM/tl
         htou7MyHODZ+UWX00hLHDCKJZdSDc4GRltEA0IPXnuYZkiX7JO0UdlYBCmput36TU15V
         eywDFFHs+KhuN/20D6bbbGIZEFcGxOkIO7vngqKDD8emBes9b4F3nO4zsxPA3acfi/Re
         sL9bSLJIqmOd2MDnR5AejWjv+qD5XpKZoqbUBfyYsmJZB27Mh3K4IvMnwyax0tVqRKKf
         xuCA==
X-Gm-Message-State: AO0yUKV41Cw46GGPvWF8IdlgqD9KKQ00n+HfC1HiWs7IFa+KcWVKWVgd
        +o6H6jMxDLF9k2E2Nw1EHOk+GuJ7oNo7gle0naM=
X-Google-Smtp-Source: AK7set/iibasOIWFAw1GofhKQYU9qg0EbmQJ3920bLEA8G6wi1qXEVO462PZjGkwEcCD0Dl5T9d/3Q==
X-Received: by 2002:a17:906:1952:b0:91e:52a8:9efc with SMTP id b18-20020a170906195200b0091e52a89efcmr7426685eje.43.1678883757726;
        Wed, 15 Mar 2023 05:35:57 -0700 (PDT)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:491c:f627:27f0:1c4])
        by smtp.gmail.com with ESMTPSA id w3-20020a50c443000000b004c30e2fc6e5sm2363256edf.65.2023.03.15.05.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 05:35:57 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 15 Mar 2023 13:35:37 +0100
Subject: [PATCH v8 1/6] media: uvcvideo: Fix negative modulus calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20220920-resend-hwtimestamp-v8-1-0edaca2e2ab3@chromium.org>
References: <20220920-resend-hwtimestamp-v8-0-0edaca2e2ab3@chromium.org>
In-Reply-To: <20220920-resend-hwtimestamp-v8-0-0edaca2e2ab3@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     "hn.chen" <hn.chen@sunplusit.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=A9fEA5iTFV9nHf0HSMuMBzuGKXvge+iAmSWSfQdkDBc=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkEbugupcIaw0geteY56cHFpS8HuBVC+DUluIeJ2uy
 +NjN5raJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZBG7oAAKCRDRN9E+zzrEiA6GD/
 wOEaWHot8B1ooRlrzHary8T4QxwMhOVnOtKIi1W0knaxjtWv6b8OowzDJ+qYjTTjsbJRV0JM2h+6N5
 yGw1e+hSHXGQobiGbrr33oPSlT+3r/3kpedecDoOHVZCz0WC3WORXZgtq4Psr9FtusjR4V4yFTRUDD
 Pgnh+eczipCh5MC2Cpm9L6vXTLkeZbYf760nGR40taH/r6KhjZ2ThpkMTtnaKeZ2J0eIJV38MWpT3X
 pjvbKmCcOs6V7hAqbUMSKo0G//256XraLGK3q7R7nXW/dvKrZJlAK6OpHRqQigClWZlR+MiWWuBga0
 MIc1TWE8SFcbi3uSCuh1ZmljFT/yo9rAMvgcSHGY7+BNQJy3JAlSmQatOwSDQOffc3HdqnM0DIrUZ6
 hqN5R5t8qmzKKa+sfHf7QLCG+oMNaNmRzcmE6EB3z9JoQk4KoIcCJFwDKsE254d5nAjFj7GLOmz0A1
 Lsi7ldmUiaCOglFLY7J1H0lsfKQcCJU0e8yFSSigOVSeGPWHjLKdkrxmd7idIlUGtWioJwh+eAIYhW
 zHM2OUBCoSl00EeIDT3gqOGtInTe1jcZgdanVv+02NuYYSY64wYDTuR2v3GgALJOGn8Y+SzUajjsoi
 mUwSFkakI0aahCFtsSThKfpxpWGZKdHr+bIfTZmHc71JPel7JZCmIQmEl5Ng==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If head is 0, last will be addressing the index 0 instead of clock->size
-1. Luckily clock->head is unsiged, otherwise it would be addressing
0xffffffff.

Nontheless, this is not the intented behaviour and should be fixed.

Fixes: 66847ef013cc ("[media] uvcvideo: Add UVC timestamps support")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index d4b023d4de7c..4ff4ab4471fe 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -732,7 +732,7 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
 		goto done;
 
 	first = &clock->samples[clock->head];
-	last = &clock->samples[(clock->head - 1) % clock->size];
+	last = &clock->samples[(clock->head - 1 + clock->size) % clock->size];
 
 	/* First step, PTS to SOF conversion. */
 	delta_stc = buf->pts - (1UL << 31);

-- 
2.40.0.rc1.284.g88254d51c5-goog-b4-0.11.0-dev-696ae
