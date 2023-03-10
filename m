Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3BCC6B39A4
	for <lists+linux-media@lfdr.de>; Fri, 10 Mar 2023 10:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbjCJJHg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Mar 2023 04:07:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbjCJJGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Mar 2023 04:06:41 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80691112588
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 01:02:39 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id a25so17816250edb.0
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 01:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678438934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RN9dk0TN64Mo7WHVhpVGbABaRx7Q/q6Pwknupu3adDk=;
        b=auahc3+pJeuaf50PijN97Rc1bShULdg8glH6J/F2ecGmAk6HjZ2P6FY++By0j9Wzpy
         nzGKYmfnG32/bfAFFgwu0GVMYVf50UTIlIs6CrBFKzbRse2c1VFHSkaL9ewdJ0O6xAc+
         ws4F4we3XAVtEiiqgXTiluJxDHoCiZQwoYrGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678438934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RN9dk0TN64Mo7WHVhpVGbABaRx7Q/q6Pwknupu3adDk=;
        b=LHt4dN3FhnVTYOsEV0NnI566Abkq4wUHRzIgDQT0dvXhp/aPDPSQ27ZtzlwQCooA+N
         nu3H80F6tf0X+5fyLF57n0lgZneJknPfo//72AX7Ih8hGn788HsJinrsuOHGcazvN726
         gHKedcqROGozKAWHTJfT3LcQX0ZTMtzlwkg3sRCfnTvJcgKyDblvX26JCjZLdd8UWkOC
         xSkT8YwzQ+9DkeukKHLujqJ+1k7LhBhbNpe5RR8IXr9S2vJ5JfJ3Yy4n4RCV1gcHV7sf
         I3x+4AeQj/yDjLjqcX2MBaDeFy/HCveCX1GV/spQZYdM8VS8labs5rmICuNjL3ksyGR0
         OKpg==
X-Gm-Message-State: AO0yUKX/Bi69WycKuf6SYHPKwNiJhJd0m5dMu4sl2QfiNbGv9jyTJ6CD
        Iff69pGstKSDhs8pQ2QzP0Kryg==
X-Google-Smtp-Source: AK7set+87Q5e1RSPYfHWblm0WfYpLHROhntrXBZh3/riZlig+Bxp5XRgrD9ZYFOyZDJhWTg/FOJzgg==
X-Received: by 2002:a17:907:a808:b0:8aa:c35b:a34b with SMTP id vo8-20020a170907a80800b008aac35ba34bmr25771623ejc.20.1678438934536;
        Fri, 10 Mar 2023 01:02:14 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:ef69:7ab6:87ac:99f])
        by smtp.gmail.com with ESMTPSA id s5-20020a170906454500b008b23b22b062sm692931ejq.114.2023.03.10.01.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 01:02:14 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 10 Mar 2023 10:01:31 +0100
Subject: [PATCH v7 4/6] media: uvcvideo: Allow hw clock updates with buffers not full
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20220920-resend-hwtimestamp-v7-4-cf1d78bb8821@chromium.org>
References: <20220920-resend-hwtimestamp-v7-0-cf1d78bb8821@chromium.org>
In-Reply-To: <20220920-resend-hwtimestamp-v7-0-cf1d78bb8821@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        "hn.chen" <hn.chen@sunplusit.com>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=Ka10ItjemOVlrqrWVbbdhzTBAJcpymfvLrHEyyU17oM=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkCvIMxQ6NquFZoQQOCgrRDaCRelepwRKDHcV6hDD7
 +ALRcGmJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZAryDAAKCRDRN9E+zzrEiBQUEA
 CJkPTC56XQ5o/bYlLjZwg+MwUglsKtjo3UStrY7DZ82nwL3w0vF6A8FBKOODmvShxR17gikEdhhgi+
 4E5NUybANa4TrbHQ5T+dUmZFRvvk0kRLUkGcl6s4VDDNmD7a9FDmMhgOjkuK6VV6/f+XjhZVj2Dx3V
 x+8Gb5HcGdpUT3rYIzJPW8ASyVC6o9tUz+VQiJt8EyO0RAKNCeJVwxXsdvZ7NxyX5qEQNVZ/IO27bV
 FDxPm7w/5eAF5gd7CbJRZ/y7TCWRse6xU0bxM53OfJnXbBFOSLe8aYaXoyYFo828PTIYnSD+SH4NyV
 SSVVQ+dTW2k0918lsL8Fm6OvFCpeM1hQALewDDWE5jG70NWY2yrb0H+6FNhX7Zu5T2sVQztFCZKSRx
 j+c0QMLZ7EnSrHsDTKvLn8kP8kDDPTZw5s30PPoxfQ+qA29/83RUbueaAryTJF06kMPYz9DuFiqFBc
 yqdxdFYvj7yWgiogpjWZJzcYzYcsZxHkSrnQx8ZLahAQmbKb1vU0ArOeE2S+wxFs4sNT0a4a+pvGaP
 ItfdV7jSgdGo6mIGf3mFvL+FUXsTgrRPF768VzNpdXp3WDc4+7Sn2oVI0sfC+lgYFBZrf9hg9IylZ0
 I2t8DzZMMnzLKQ6UWbazGtMJLPwE2xnE4txXjYaLfqrSqVI/NuDGzCS5heZg==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With UVC 1.5 we get as little as one clock sample per frame. Which means
that it takes 32 frames to move from the software timestamp to the
hardware timestamp method.

This results in abrupt changes in the timestamping after 32 frames (~1
second), resulting in noticeable artifacts when used for encoding.

With this patch we modify the update algorithm to work with whatever
amount of values are available.

Tested-by: HungNien Chen <hn.chen@sunplusit.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 4d566edb73e7..6d0243ea0e07 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -754,10 +754,10 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
 
 	spin_lock_irqsave(&clock->lock, flags);
 
-	if (clock->count < clock->size)
+	if (clock->count < 2)
 		goto done;
 
-	first = &clock->samples[clock->head];
+	first = &clock->samples[(clock->head - clock->count + clock->size) % clock->size];
 	last = &clock->samples[(clock->head - 1 + clock->size) % clock->size];
 
 	/* First step, PTS to SOF conversion. */
@@ -772,6 +772,17 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
 	if (y2 < y1)
 		y2 += 2048 << 16;
 
+	/*
+	 * Have at least 1/4 of a second of timestamps before we
+	 * try to do any calculation. Otherwise we do not have enough
+	 * precision. This value was determined by running Android CTS
+	 * on different devices.
+	 * Dev_sof runs at 1KHz, and we have a fixed point precision of
+	 * 16 bits.
+	 */
+	if ((y2 - y1) < ( (1000 / 4) << 16))
+		goto done;
+
 	y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2
 	  - (u64)y2 * (u64)x1;
 	y = div_u64(y, x2 - x1);

-- 
2.40.0.rc1.284.g88254d51c5-goog-b4-0.11.0-dev-696ae
