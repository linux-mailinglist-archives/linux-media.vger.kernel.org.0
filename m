Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B240B456566
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 23:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbhKRWMV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 17:12:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbhKRWMU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 17:12:20 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29856C06174A
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 14:09:19 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id c4so14325462wrd.9
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 14:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JTsp53tMG7c1WYigqpHa7U4JwCnUiTdLt5OKqZdpE/U=;
        b=ZrQrGOewZOM2JOZ0fc/lZhdfQjvkOFZS9t8wGvymD0J1R5JGn3xSwK5YDff0AixfvH
         muBRMYOWPymI3E5wwZkYd9K2Z3yGFzLn2VvlrJxP3fa7eqQ68K2A2h4VdOk6ce1m7a+B
         OPRq3Dx3ifRAZOHztRkopHTZrJIHjUP8MGUnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JTsp53tMG7c1WYigqpHa7U4JwCnUiTdLt5OKqZdpE/U=;
        b=PyGeynH4gLYBBekP8Ds8EKXYCe4X532u6cOKZOuVo0uF1SXSj0aqWu4yW7miksBzc4
         HnKbuXIB5ZXpdeu1BTeOqN+BEv/nijXdLNaXUt4mM7IOr7LXzPzvtlwgK+XEnj0H/FXk
         qeu5vN6CraHmqhCWIceOh40wjHqSZfcR3Q5aR84QiGAvr2nelHlw3V9hWz9+BYxYbyHI
         Bgi/NC5C1ofxHivQm+eZ8QDyQ2QA+qZagm/s38QmQ68kB3F6KgwgdpvN+zIwcmH52IES
         a/r0IIGCMiVdMZTcFRfBCEUnHhI7f2lWel7A4sRkF6eAWO7WF3MuiyCPd5U+dtzZhcsj
         RE7A==
X-Gm-Message-State: AOAM532qttfyfs0Ld6e2VflOBSMoRbmyCpvbkTIIBdcd5qsKEPB3yLnX
        auk6rMvBRtXIPYiZb/53hzfaMg==
X-Google-Smtp-Source: ABdhPJxYWk2F67e5oLqA7SNo38Sf2FWRjG55q9cJZ9UDcqhJEYKCaehKtu7jjaPygK3HJCcTSBm+Cw==
X-Received: by 2002:a5d:64af:: with SMTP id m15mr1037233wrp.267.1637273357738;
        Thu, 18 Nov 2021 14:09:17 -0800 (PST)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id f7sm13305180wmg.6.2021.11.18.14.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 14:09:17 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        "hn . chen" <hn.chen@sunplusit.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 2/8] media: uvc: Allow quirking by entity guid
Date:   Thu, 18 Nov 2021 22:09:07 +0000
Message-Id: <20211118220913.299978-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
In-Reply-To: <20211118220913.299978-1-ribalda@chromium.org>
References: <20211118220913.299978-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When an IP is shared by multiple devices its erratas will be shared by
all of them. Instead of creating a long list of device quirks, or
waiting for the users to report errors in their hardware lets add a
routine to add quirks based on the entity guid.

Tested-by: hn.chen <hn.chen@sunplusit.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 7c007426e0827..bb1cc8643161d 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1473,6 +1473,28 @@ static int uvc_parse_control(struct uvc_device *dev)
 	return 0;
 }
 
+static const struct uvc_entity_quirk {
+	u8 guid[16];
+	u32 quirks;
+} uvc_entity_quirk[] = {
+};
+
+static void uvc_entity_quirks(struct uvc_device *dev)
+{
+	struct uvc_entity *entity;
+	int i;
+
+	list_for_each_entry(entity, &dev->entities, list) {
+		for (i = 0; i < ARRAY_SIZE(uvc_entity_quirk); i++) {
+			if (memcmp(entity->guid, uvc_entity_quirk[i].guid,
+				   sizeof(entity->guid)) == 0) {
+				dev->quirks |= uvc_entity_quirk[i].quirks;
+				break;
+			}
+		}
+	}
+}
+
 /* -----------------------------------------------------------------------------
  * Privacy GPIO
  */
@@ -2435,6 +2457,9 @@ static int uvc_probe(struct usb_interface *intf,
 		goto error;
 	}
 
+	/* Apply entity based quirks */
+	uvc_entity_quirks(dev);
+
 	dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
 		 dev->uvc_version >> 8, dev->uvc_version & 0xff,
 		 udev->product ? udev->product : "<unnamed>",
-- 
2.34.0.rc2.393.gf8c9666880-goog

