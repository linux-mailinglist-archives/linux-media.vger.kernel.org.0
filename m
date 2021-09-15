Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9895240CDB0
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 22:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbhIOUGz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 16:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbhIOUGu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 16:06:50 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E7DC061766
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 13:05:30 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id i6so7971860edu.1
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 13:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BjLYFZZ148fmfAZlDVlsACd8/NQCqdAo+DBWlqiMsXc=;
        b=IM7OsvtAwySR75pxRYcwbgXG7maTnvwX0lz3knM1WsuOhq56O+s4R2yjNaH2f9P80W
         Yi63kMB6ryWRzSfiBSytksl/Hsz8Vow1RmX0Tn0Dno1ZqHwe21BIjxGGHZ44g2I0ei7B
         OjJmZlNr7zRZL5IGximG7HG5ECMWf6+ulTW8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BjLYFZZ148fmfAZlDVlsACd8/NQCqdAo+DBWlqiMsXc=;
        b=LzPQvRavxTywXBG31XZxllFjJ1ka+H5fvsWjATD/8K0BznOSODaf9ZQLvqWPEsmnxW
         SLyTn2lIcvtFT5RRuIYM+ekbMAD/nNsVTw0ykdnhtk4FZ6qD5ZBHvhLkPCUoQIwMRgrV
         Q3Vtd/29j+X6/f6AWUsXXK+3R7HLS933vJDvltvoafgoZLShXYK5ixpLiuQGNXeRxTHQ
         M6BLiqGgdElMhiLSJpRu08y5m8xdBZABeUIbJPyQVPTHBG9jxIzfJukUcFpdNeT2PKHR
         dJFcuhMU9SrUjFPciKU5hsGHfPrDuj6KqdoN1Y0yk2K80hproYmVPxwKfxvDpndhRyVt
         zIYg==
X-Gm-Message-State: AOAM533d+kajnt9/lelBEyUiCfNBG6UZOnrZj+2kY1ubc1cdggiEvbqk
        AVW/fVtzIQrKwUab7XdvqIQmLw==
X-Google-Smtp-Source: ABdhPJxHjD9n5jY1VS3F3WSbKeetShzSBPAPrdZojcj+ksM7rzf9BoafaIo0gSWVbdMcbCd/Cxq8FA==
X-Received: by 2002:a05:6402:21e6:: with SMTP id ce6mr1914841edb.153.1631736329109;
        Wed, 15 Sep 2021 13:05:29 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id m17sm393336ejn.108.2021.09.15.13.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 13:05:28 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hn.chen@sunplusit.com
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 2/3] media: uvc: Allow quirking by entity guid
Date:   Wed, 15 Sep 2021 22:05:24 +0200
Message-Id: <20210915200525.448941-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210915200525.448941-1-ribalda@chromium.org>
References: <20210915200525.448941-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When an IP is shared by multiple devices its erratas will be shared by
all of them. Instead of creating a long list of device quirks, or
waiting for the users to report errors in their hardware lets add a
routine to add quirks based on the entity guid.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 9a791d8ef200..e40a8c4a410e 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1474,6 +1474,28 @@ static int uvc_parse_control(struct uvc_device *dev)
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
@@ -2431,6 +2453,9 @@ static int uvc_probe(struct usb_interface *intf,
 		goto error;
 	}
 
+	/* Apply entity based quirks */
+	uvc_entity_quirks(dev);
+
 	dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
 		 dev->uvc_version >> 8, dev->uvc_version & 0xff,
 		 udev->product ? udev->product : "<unnamed>",
-- 
2.33.0.309.g3052b89438-goog

