Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 401DA6B24AE
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 13:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbjCIM5u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 07:57:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbjCIM50 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 07:57:26 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A34F05D4
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 04:56:48 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id ec29so6578592edb.6
        for <linux-media@vger.kernel.org>; Thu, 09 Mar 2023 04:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678366568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oihws/oJVUk4/qcYiN1BQhjDRl1MZi40xXWGpNQ+ONY=;
        b=m6K1pinQpMXJ7zNjBGgM9palA2IOSgd1NQPJ0OqhN4sVXkjbA0bvTPp+WtAD2Fw+Ka
         GM6aZumoy9jelme0wMZr5QrTMQFiI4Dd68/wwGDbznCPspB25fjxZTtTot6PkHnzBrCI
         760PSlrpWXDpE292ciStrqHYub1wuZZbevkDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678366568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oihws/oJVUk4/qcYiN1BQhjDRl1MZi40xXWGpNQ+ONY=;
        b=nrFibZTqwjU8mxWnoTHVfOgPjOLk2UciynkCQMZ3w5j4BOuASck9S8pm5TvWqG7zlF
         WoHCVEIuz0nX1cWWjjoN/8gKuIGyRxXCsKcfk0fVBpYwCDNbF7xiWbyzWupoDUBxcq/D
         gE/D+/nCLwFlGCMPyolwdyz/fy868yOdB7/g92tiUIOn+B5YFyhNykn0ONZavCOyD8q9
         +t1NbeLNsowa8ROihxpwNs9Hm7YnqsCda/UiBJxXUQB6W/p5loxp1YKwsmA1p/U3BYcl
         hzlzZ2Bpf3uAoieVPFSBvwUzSIlUSGCc6/JfaPnYma17kLrM6hTv4yz1Qmz+4DbxEzdK
         9nHw==
X-Gm-Message-State: AO0yUKV4xFT8k5yjDZI+6Hu5OLFcM+6LT1UrLlegD0B3lL6ezMJBAjKP
        Kg0frajzd5J8bm59HoVQcSfleQ==
X-Google-Smtp-Source: AK7set/EcvjBf+pxFFgw55EEDuyMqiAPDmYfEIJVCYP9bCaUUy4txo9PbXNJYMcpL35AZh7qh/TRoA==
X-Received: by 2002:aa7:d305:0:b0:4c0:4912:2006 with SMTP id p5-20020aa7d305000000b004c049122006mr17708532edq.11.1678366568228;
        Thu, 09 Mar 2023 04:56:08 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:1645:7aa4:a765:1966])
        by smtp.gmail.com with ESMTPSA id hy26-20020a1709068a7a00b008d92897cc29sm8799523ejc.37.2023.03.09.04.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 04:56:08 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 09 Mar 2023 13:55:17 +0100
Subject: [PATCH v6 3/5] media: uvcvideo: Allow hw clock updates with buffers not full
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20220920-resend-hwtimestamp-v6-3-c7a99299ec35@chromium.org>
References: <20220920-resend-hwtimestamp-v6-0-c7a99299ec35@chromium.org>
In-Reply-To: <20220920-resend-hwtimestamp-v6-0-c7a99299ec35@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=GlVqUU92g3WKEyOK44VrS63EV0hOXZ0v4iXYGJQ5aOU=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkCddfTZKqE6aW7SvZIz5O9S+ai73EnKknqwCmNy6A
 J+lGGCiJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZAnXXwAKCRDRN9E+zzrEiP1fD/
 0XJLBl4y7+8jrIpqo6Dv+jQ23AUpjjv+62ILj8Ow8eNOCgvNd912V2bfQQpxDHIleMKurAA5n5Rio1
 //G2Wc2KLghDUNpMaiQ/zFKH7fktJYVS/3NSlPApRU40rzyQNz04efItH6EZTc7l1/jS/MAODRMFb0
 7cUR5EBvFFGTeeyHCNojHTff/xf15WJcX/T23z2YFmsJ/z/mhVSKw2nmwHWN0mR5W3e3WbGTyJ40uP
 pOX91r5lWUJ0G4VffrgnCBeED09KQmceScN6v7f8bo7lAtqc7FBdcYw0nvkQfzZGIB4xmYava0qaa0
 O5y/Q/amNkwtbZQtQrC8iECRE/pJEnW0+nmdIprWApia6kM4D7fHrGg2Jllt5wXpGtTojwpVr2ddC5
 nhpmVUBiMY6pMR8G6P3QlDSDhMBHHwPKI1xbGxF/TlEmo6cZHoPJ3WdQsnoUVEq0+ZBmgSGta+lV7G
 75g+/45/lwhaPEBETfMDg4q2dFbQLLZstxQaX9fEfjun1N6QUdrMyv8qVnm+2S5GTqSJCuaUUH7Edu
 kE3nNQTPpSrL2BWoYeDcgvrOifQPlNtvFkVOKU1NGVBdc6FdV+i/1p9p6SJZzTWxzoII45wHn1qWhq
 kqEBNN5zFIjs4jlwflslNg5R5tcQDh5hJyfHSUPb4GX0hoxTuvzxYWk+yaJg==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/media/usb/uvc/uvc_video.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e363a71dd190..d5fb0c1339a3 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -754,10 +754,10 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
 
 	spin_lock_irqsave(&clock->lock, flags);
 
-	if (clock->count < clock->size)
+	if (clock->count < 2)
 		goto done;
 
-	first = &clock->samples[clock->head];
+	first = &clock->samples[(clock->head - clock->count) % clock->size];
 	last = &clock->samples[(clock->head - 1) % clock->size];
 
 	/* First step, PTS to SOF conversion. */
@@ -772,6 +772,15 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
 	if (y2 < y1)
 		y2 += 2048 << 16;
 
+	/*
+	 * Have at least 1/4 of a second of timestamps before we
+	 * try to do any calculation. Otherwise we do not have enough
+	 * precision. This value was determined by running Android CTS
+	 * on different devices.
+	 */
+	if ((y2 - y1) < (256 << 16))
+		goto done;
+
 	y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2
 	  - (u64)y2 * (u64)x1;
 	y = div_u64(y, x2 - x1);

-- 
2.40.0.rc0.216.gc4246ad0f0-goog-b4-0.11.0-dev-696ae
