Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0E764B785
	for <lists+linux-media@lfdr.de>; Tue, 13 Dec 2022 15:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235622AbiLMOgL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Dec 2022 09:36:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235621AbiLMOgI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Dec 2022 09:36:08 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92DDD13D6F
        for <linux-media@vger.kernel.org>; Tue, 13 Dec 2022 06:36:04 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id m19so17976052edj.8
        for <linux-media@vger.kernel.org>; Tue, 13 Dec 2022 06:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FvB7MtetQWVy4gpQjKQUoehBeWEkd2f6NLqciuJ/UA=;
        b=a07UG2F1mEaOU+rcH4QvgYNzKNzFe9RCVowEPRQ2GEaa6UpV37hXVOvsNsv0WRkxTr
         QSml1QV9DD3ArrZKWjULnA+kU2iKaeh6VkQ5E/9/djOD3PtiBxzXlb1Cpkx6fV058FkX
         pW6bk/Z03oO9ZBAzBLvf48kGNqIP6VbvOCL9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FvB7MtetQWVy4gpQjKQUoehBeWEkd2f6NLqciuJ/UA=;
        b=OW8x2uumBwKSL6SCrWvJ8cbXXWf1tO4bQudb9miZeY4mRbEvucJaC+mSmsSag6NKpX
         rc3UnO6k0cK2H0Gfpf/3BUHPQ+jzrG4gl65pt4N4poEB4IHQfjXo2jFPelgpJqiKBfKR
         Lrv3hRn6xDsaKEvnzLcdAHKg7yRWu7BinIkrBYMu3XQum6/hGaK43tmk4sdkgclJQx6h
         jp+7ET924Pz16uU25GlTSqjd+A10nXDadKU66J/jBfwHxzZJZMSu8fZNavEoTmfPOlH1
         Qlnnhy2ZUuRKD/7qsLMCvUCEpG4m6cc6mq5xrlCAHkZveWb2l3gJ8Xa6NZ/5NPWQSDFI
         GoEQ==
X-Gm-Message-State: ANoB5pkXG9190KjmnLa97yhRuT3vXZKU7KcnYGBbd9NleJXPLQXSwDCe
        vgGCy6Akk7DHEHlzhPNLyI94BSG4ERFEQztz4QI=
X-Google-Smtp-Source: AA0mqf5SjDyZ2mWJxLa9+ZRJllGjc7t9Ddd1BX3T0tc9vPw117pdT4S6reXRBYhxZXB+71bd8vaE9Q==
X-Received: by 2002:a05:6402:1ccc:b0:461:8a1a:271f with SMTP id ds12-20020a0564021ccc00b004618a1a271fmr19408522edb.11.1670942162928;
        Tue, 13 Dec 2022 06:36:02 -0800 (PST)
Received: from alco.roam.corp.google.com ([100.104.168.209])
        by smtp.gmail.com with ESMTPSA id kv17-20020a17090778d100b00781dbdb292asm4613960ejc.155.2022.12.13.06.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 06:36:02 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 13 Dec 2022 15:35:30 +0100
Subject: [PATCH v2 1/2] media: uvcvideo: Fix race condition with usb_kill_urb
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221212-uvc-race-v2-1-54496cc3b8ab@chromium.org>
References: <20221212-uvc-race-v2-0-54496cc3b8ab@chromium.org>
In-Reply-To: <20221212-uvc-race-v2-0-54496cc3b8ab@chromium.org>
To:     Max Staudt <mstaudt@google.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, stable@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=3069; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=6kvmCn7eEeTM0+R88QPjF6t0UZo7MMe7Xr8f2IbHo6E=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjmI3Nfh3FShn9Zm/bK1NkD4oeuhLal1kJLCxQ/VKk
 dw1x0UmJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY5iNzQAKCRDRN9E+zzrEiDu6EA
 CblzFoF5m/MDm9R7vQsjAvJXV5xk0xBsUMXBY4L77c7L+gZundJHeVCKQf2g1O7gb4SbxpCHJ8bZQM
 g/OeEe9GEMoCrhNcwIywTZ/k6DkydcYpQZ1+vA/jdtLBMk3pwis7KwcNmFOdgN7/iGzq8dMREPYzsg
 sm+d1w3zbifczm48+Au0fPtzA6uIk2YcyTHfOW6jVM/Rq43nA1uqrxICMqYgr2cb3vTKGcPRx9DBPS
 chF3wg22j2krjbGG47I7U/XCt+42Q9zFiIOqHHXW+vCDz92cbwX2k3jRVLA4izf45LN1TTJUX/7zb1
 ftXXqaXZlMsUxzIvhHMwFTYGUwiiidScIjZM3XlS6sKQ2H66oTwpKIrQMkCxm8F2pQmfvWSqZZNHy8
 FRSxoEgoe2BDFkAw2KUV0NCvMhSu3PjpN4TklgcfOB9euq/SCMl/sr8QuauZ/43E0w/gkPr7c/z2Ei
 Bk67/0f2aAIjJQtKVGjHlX8Fe+wlfhEnq2qvBdPyxfiK4cHwGSiFWlSDOM5s+LtKUXDG6FVHhgA7vT
 DiAvIPTYTB5T5mm4dQPK5vXh2pWiIFaRYjsqe9kT0PSbblryx/IgoMz+ZHgXlNWfpThqpshOtGU3JT
 qH6Vf7t3g9lCUCwllEDB+UzFXJVmrccQGTcEjDw7IMpERhMdeknOd92oUYZQ==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

usb_kill_urb warranties that all the handlers are finished when it
returns, but does not protect against threads that might be handling
asynchronously the urb.

For UVC, the function uvc_ctrl_status_event_async() takes care of
control changes asynchronously.

 If the code is executed in the following order:

CPU 0					CPU 1
===== 					=====
uvc_status_complete()
					uvc_status_stop()
uvc_ctrl_status_event_work()
					uvc_status_start() -> FAIL

Then uvc_status_start will keep failing and this error will be shown:

<4>[    5.540139] URB 0000000000000000 submitted while active
drivers/usb/core/urb.c:378 usb_submit_urb+0x4c3/0x528

Let's improve the current situation, by not re-submiting the urb if
we are stopping the status event. Also process the queued work
(if any) during stop.

CPU 0					CPU 1
===== 					=====
uvc_status_complete()
					uvc_status_stop()
					uvc_status_start()
uvc_ctrl_status_event_work() -> FAIL

Hopefully, with the usb layer protection this should be enough to cover
all the cases.

Cc: stable@vger.kernel.org
Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 3 +++
 drivers/media/usb/uvc/uvc_status.c | 6 ++++++
 drivers/media/usb/uvc/uvcvideo.h   | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index c95a2229f4fa..5160facc8e20 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1442,6 +1442,9 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
 
 	uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
 
+	if (dev->flush_status)
+		return;
+
 	/* Resubmit the URB. */
 	w->urb->interval = dev->int_ep->desc.bInterval;
 	ret = usb_submit_urb(w->urb, GFP_KERNEL);
diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 7518ffce22ed..09a5802dc974 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -304,10 +304,16 @@ int uvc_status_start(struct uvc_device *dev, gfp_t flags)
 	if (dev->int_urb == NULL)
 		return 0;
 
+	dev->flush_status = false;
 	return usb_submit_urb(dev->int_urb, flags);
 }
 
 void uvc_status_stop(struct uvc_device *dev)
 {
+	struct uvc_ctrl_work *w = &dev->async_ctrl;
+
+	dev->flush_status = true;
 	usb_kill_urb(dev->int_urb);
+	if (cancel_work_sync(&w->work))
+		uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index df93db259312..6a9b72d6789e 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -560,6 +560,7 @@ struct uvc_device {
 	struct usb_host_endpoint *int_ep;
 	struct urb *int_urb;
 	u8 *status;
+	bool flush_status;
 	struct input_dev *input;
 	char input_phys[64];
 

-- 
2.39.0.rc1.256.g54fd8350bd-goog-b4-0.11.0-dev-696ae
