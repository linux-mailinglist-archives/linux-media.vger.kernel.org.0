Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913432DB613
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 22:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728624AbgLOVub (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 16:50:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43626 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727930AbgLOVfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 16:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608068024;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=1sn/69GdVFi4Vp51nylA/c2c2ip9Xwheky54XVDZfBE=;
        b=JCm2gG3Fp2xY4anMbRx7adEQaG3E3wMpDJAT7Ic5BrXdJwL1yoT7r+kYLQXIJ80ctdEWIE
        KrGEdE/KKYDtBu8dv09/8imkFi2KFkFklqRCwOMCFb7SdmIJSpM+oYRZ/sCyVyfZe6jXuK
        C3RBnMVHIGwy2S6mj+jfYIvwigA901Q=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-ONgcChpGND69uazIteHemw-1; Tue, 15 Dec 2020 16:33:43 -0500
X-MC-Unique: ONgcChpGND69uazIteHemw-1
Received: by mail-ot1-f72.google.com with SMTP id w2so9854631ote.20
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 13:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1sn/69GdVFi4Vp51nylA/c2c2ip9Xwheky54XVDZfBE=;
        b=HCFbTtilktskhtr9BvVEvyLToCWEJHOS8NFSOg6PIIzWSo64NjVAD3L5PQXw0GBUW7
         ADA74vzoK3Z6HL3Dmy/WTDEu5B+jcvhDSePclzOtIrVAMEJKpyqudCxD3n1/qodmsQ3q
         3VfcNSFzfRjurcaPbrGIH3V8k0vofRxzi81/xPaPEewlsAAl/+LvM70/WwyOUK+Mktr1
         G/RxT3Q4lzXJOQc+trpsUyB5Et9OMVmfO50JQx9rSaNUcBtwhSqtwfV/FsfrY+yul1Ts
         ic1qU1aYJ6eSn5c3YCnqUnA9bLTarEziTHwwQvHefasKGZmqwIAEO2tcqGXIYKjqRHpX
         itbg==
X-Gm-Message-State: AOAM531cxYEpQPKd72c76B8tHQkRtEcCPDKElhnkEug2VYr85utJKqi4
        WfD1g30TgqxER/wIglB6lbGWt+1w925SegEZY26oRIz0VYh9wMt4YCttX/6W4TLLhxhiwg4yqnt
        OG60Sd6/XIcOuiZM41LqWyz0=
X-Received: by 2002:a05:6830:1d7b:: with SMTP id l27mr25009117oti.197.1608068022478;
        Tue, 15 Dec 2020 13:33:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXqMsWpREP9r/6aUlDixJjR5YIfnNpsgHUU3u/W+1tz6pwqdADkILb55beNmqkYrkJR/HPfA==
X-Received: by 2002:a05:6830:1d7b:: with SMTP id l27mr25009107oti.197.1608068022197;
        Tue, 15 Dec 2020 13:33:42 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x12sm5441153oic.51.2020.12.15.13.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 13:33:41 -0800 (PST)
From:   trix@redhat.com
To:     hverkuil@xs4all.nl, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] [media] radio-si470x: remove h from printk format specifier
Date:   Tue, 15 Dec 2020 13:33:27 -0800
Message-Id: <20201215213327.2091597-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

See Documentation/core-api/printk-formats.rst.

commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use of unnecessary %h[xudi] and %hh[xudi]")

Standard integer promotion is already done and %hx and %hhx is useless
so do not encourage the use of %hh[xudi] or %h[xudi].

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/radio/si470x/radio-si470x-i2c.c | 2 +-
 drivers/media/radio/si470x/radio-si470x-usb.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
index f491420d7b53..6a25c29d5d4d 100644
--- a/drivers/media/radio/si470x/radio-si470x-i2c.c
+++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
@@ -410,7 +410,7 @@ static int si470x_i2c_probe(struct i2c_client *client)
 			radio->registers[DEVICEID], radio->registers[SI_CHIPID]);
 	if ((radio->registers[SI_CHIPID] & SI_CHIPID_FIRMWARE) < RADIO_FW_VERSION) {
 		dev_warn(&client->dev,
-			"This driver is known to work with firmware version %hu,\n",
+			"This driver is known to work with firmware version %u,\n",
 			RADIO_FW_VERSION);
 		dev_warn(&client->dev,
 			"but the device has firmware version %hu.\n",
diff --git a/drivers/media/radio/si470x/radio-si470x-usb.c b/drivers/media/radio/si470x/radio-si470x-usb.c
index fedff68d8c49..ce0709aae4a0 100644
--- a/drivers/media/radio/si470x/radio-si470x-usb.c
+++ b/drivers/media/radio/si470x/radio-si470x-usb.c
@@ -681,7 +681,7 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
 			radio->registers[DEVICEID], radio->registers[SI_CHIPID]);
 	if ((radio->registers[SI_CHIPID] & SI_CHIPID_FIRMWARE) < RADIO_FW_VERSION) {
 		dev_warn(&intf->dev,
-			"This driver is known to work with firmware version %hu,\n",
+			"This driver is known to work with firmware version %u,\n",
 			RADIO_FW_VERSION);
 		dev_warn(&intf->dev,
 			"but the device has firmware version %hu.\n",
@@ -698,7 +698,7 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
 			radio->software_version, radio->hardware_version);
 	if (radio->hardware_version < RADIO_HW_VERSION) {
 		dev_warn(&intf->dev,
-			"This driver is known to work with hardware version %hu,\n",
+			"This driver is known to work with hardware version %u,\n",
 			RADIO_HW_VERSION);
 		dev_warn(&intf->dev,
 			"but the device has hardware version %hu.\n",
-- 
2.27.0

