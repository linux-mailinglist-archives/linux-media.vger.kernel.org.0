Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC2206B399E
	for <lists+linux-media@lfdr.de>; Fri, 10 Mar 2023 10:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbjCJJGz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Mar 2023 04:06:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbjCJJGZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Mar 2023 04:06:25 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60E387DFBE
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 01:02:19 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id u9so17703619edd.2
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 01:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678438931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sM9VHBcEDRumQi7DFlwhwQNZqP1X9niavDP72C2S7Eg=;
        b=TVlNXxSG8XHLd9IHtxlECmOJzD6guBdiBHWFuA2oRcTnWkiHEwH/DhlRlB4u3twMm/
         VQNL6Y3YXytpHhizGRely/Kkn9Kf29KV/ot84gRy6fd8cB8jZDrMTSLcCTEVbA2oEHLv
         n/TYbZ407vY6GEaEWyIUP+70D2BeyIk9wNii0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678438931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sM9VHBcEDRumQi7DFlwhwQNZqP1X9niavDP72C2S7Eg=;
        b=Bteha5wgxf8bkwCebGb8Fyx5dLTSlwocoLaFbDot+Kf2dfPsLBknUx9oL3jV4P3Fuj
         E3/xIpTqUsQFzS+fVtIUQ117rBy3BmjJ3Ek5n36DP9PK4ESw0Y3KI2sJaMPYGC2zFAUq
         A0S/dJxHLYT8xMXOp2LYKlqaw5sTn7aUFHBKo4WF8oK/6hTD3ULyUP+4FmzeDmBZ9w08
         QOuq7Wr2/6Qz7/e5Y723jbYilhTiH1hA3Ns0P8NdczLiZ01b8y00vE46p+rtWKvpBwJ6
         bvChVAYOoyWu2wPzhXe0iWy6VW0QuhqPkpbY9zI4yThkgvyJvr6TbgT76gCzBSGIUD5F
         UwMQ==
X-Gm-Message-State: AO0yUKXx4aTD6M+Jq+fSZ1okDQvslz6ErJy/foyUzTS/G/oc0Xxvkt1E
        pPpk1QgZ9L3IJtxvccrRarAhWg==
X-Google-Smtp-Source: AK7set9BK+XjIoADosdNMDa6cAcEn2PS1KMoGbx3MqO43xbv0IEReknN5FIEXyx5jot/PrEojx1TAQ==
X-Received: by 2002:a17:906:dfca:b0:878:7471:6da7 with SMTP id jt10-20020a170906dfca00b0087874716da7mr26254638ejc.66.1678438931628;
        Fri, 10 Mar 2023 01:02:11 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:ef69:7ab6:87ac:99f])
        by smtp.gmail.com with ESMTPSA id s5-20020a170906454500b008b23b22b062sm692931ejq.114.2023.03.10.01.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 01:02:11 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 10 Mar 2023 10:01:28 +0100
Subject: [PATCH v7 1/6] media: uvcvideo: Fix underflow addressing on hw timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20220920-resend-hwtimestamp-v7-1-cf1d78bb8821@chromium.org>
References: <20220920-resend-hwtimestamp-v7-0-cf1d78bb8821@chromium.org>
In-Reply-To: <20220920-resend-hwtimestamp-v7-0-cf1d78bb8821@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        "hn.chen" <hn.chen@sunplusit.com>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=Z9vWlYOlXeYS2ei5qnSybP3k1rYf5ivkf/cMeBsEyPU=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkCvIILFEZ+h9JBJEGf1HkEqI1CrPZiSpVEZYgh7Vw
 cvf169uJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZAryCAAKCRDRN9E+zzrEiBKlD/
 4kmB9H1te84VZ66FA71pBUtqzKWkX+f/iYsSMJBJ4Dk52qd2zBZNoj18Ybe8SlaSivaHRmWeYCAZsV
 7ZEg6ClLwZnTrjaFSAbdniaVoyRSEx/03c90MUSiEPjiR+q2h2RWm7zNuNP4BU4SmMlapZaGTBdkWi
 hVISXkDwG9+cFGP6EW73PNBgYPiKiqBRtJIxzU6pmm3N0QNzjma9ysmQgP6Ac2iABDbBSrNz9R08iG
 qSmObMdGjjF9qoX+6xCZn9q7lfEIzBLX6NGaKqIyr0geKk2VmZHzhFSTSxyvz65Z64yHPr5Mqyg7fj
 W6jlRoBEWAJWjPiHbAfvw/dunprnh4BOoMToYz18AbBjdzYDtVnQ57qJn3lf7i2rjpKb8J+iEMyxCs
 a0ynjFPW89A5JycwNZzRNl5RQykgT/rFyQzz5lSjZIRIve3YioWPthxoIIf7Wo3cSg33NXGbq9VMNB
 HFc/JNx6GhIygLvVNOj9DSWs981QsOjomlkODEyzinkpOgEVNz1vn687axiilzriSeKOREHIgR6nf8
 Io58irzLBEyzkm7AMDTaYRxe7SBWlTvzy9qwAoP/YmNYOiOYMrLGRgyGLEIysMEPWJChVdIJOHo42W
 qgqTkFExayDJBFCcIxsuy32KWL1oRgfaCel4l/kyr5oA43llpNHc6aQoEsjA==
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

If head is 0, we will be addressing clock->samples[-1], which will
result in undefined behaviour.

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
