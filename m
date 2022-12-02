Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD1B640B04
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 17:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbiLBQpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 11:45:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbiLBQpS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 11:45:18 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58CACAF96
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 08:45:17 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id b2so12843665eja.7
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 08:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9YuQZPfQH7INMeWnExg9RJB6GIXNP96OMFwpn/eTk0=;
        b=MFAQf7MRaeF6KI0xct23Zt6cZ9beHfQ45/YQn5TJoIhPQAiC8wo3T8Xs4AS3lfFwCO
         /ZcwqonocuQ2ZbJcawBO4jwbZQvugo9TgWTqlj7Kr4VDENcfxy9D3RHNt/4OUHSmKAh5
         WxIzYnLBNIeIzCdahNIOBKU4xnGtJn/uSOer0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9YuQZPfQH7INMeWnExg9RJB6GIXNP96OMFwpn/eTk0=;
        b=wKoWGydikry/by3xF7SfFASKZVRi3NdKo3mkdvO9mxW9Emk6iEoKCuiwa30DzD36cj
         POo0YN5SErk54NOje+Y83IWPAxfURul4ekKSvNnq3RaVpiHV9QzINlCLEPbaIkFKJlQA
         asxgvm7YB+HpUcPaHTKnQpIK5iY975gAFiY9ol1tWhhfn1u/kQBpEMri4bQRmONDIUA2
         ln9OSxDdNBN5x2z/vbSQ3XE29JPbjO0sa/POqDEJUxtRYtKTZUn79GNH0cmDnshmnJ15
         ISFgKNMhP4pY7qOxo1AgpWtjGerebksjXWiqgrTsaA4wbBveVVMMreHSShG2aWQTRjfS
         yo4g==
X-Gm-Message-State: ANoB5plWT3EZRibsiPumt/dYtxQQ5+/jHRvCAuMTj1oo21YeCqpUoR/A
        5p7jbiamHZzYBDhFdtqcKh9R4VoMW1G+1nqb7rI=
X-Google-Smtp-Source: AA0mqf6cQ5WOWMt57lHhYnHV9mp2aDSiTgBEhoH5l4mEIFJCrL/eOwevZFeeDU+3wya5iYPvuNZZHA==
X-Received: by 2002:a17:906:28d6:b0:7c0:817c:3d38 with SMTP id p22-20020a17090628d600b007c0817c3d38mr17459544ejd.63.1669999516162;
        Fri, 02 Dec 2022 08:45:16 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t15-20020aa7d4cf000000b0046c53c3b2dfsm111981edr.38.2022.12.02.08.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:45:15 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 02 Dec 2022 17:45:06 +0100
Subject: [PATCH RESEND v2 1/2] media: uvcvideo: Limit power line control for
 Acer EasyCamera
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221101-easycam-v2-1-ffe3e3a152df@chromium.org>
References: <20221101-easycam-v2-0-ffe3e3a152df@chromium.org>
In-Reply-To: <20221101-easycam-v2-0-ffe3e3a152df@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=p2q94kR+vhAMdPTWu0QPZfb6YaqxhRkENb+/7vNPhJY=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjiiuXkfHKoKbGsfejnSL9XOArIlm3zi731T00oRh6
 MZmU7QaJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4orlwAKCRDRN9E+zzrEiGbGD/
 9dJlDD4glfqsu2BFSqEpdWEJB5+aIi2c37rimUb+0zr/GzV9+1JjZiWl7YIQVI1EmcmD82hs2T11aK
 oZDjJwC4OqgsLgAtlEOKmHr6+qGTKbWi3u5NBN+uhN+uYea01lKMjWeeibpfAwQ1nYyiM2d74/Tpud
 gD1X74V5QZVsMuB2StZg8HfUwhE310bPB0cgyw212v2dHUPRzIGWzaAXk8dPxnwMuV/vlQnXtdmMFN
 MT5T0mue6Ba3ohg5ERAtw63hA4mhMNRYH3++3ClRjgJ/KMwFZqQasScO18ZeFQX2VQvguPk0V1eSkr
 qbcQko+663P2S06W1ekrPAIlrSJGntZOV7vmlzuRrJnMX77VFcWb4qCM2dZjOlKUrAKlXVWOYdR5B4
 1t2Ez6qvw300rZQhrUpLsNU5l6k/Zce9UT1Jw/Jbs2Zoph01kkA90uyz7WxuNxTrHQZiqONUS2aVLG
 vckY+Z0s+PehvHbqNJ2rKVpnxq0XIO+aywap0qpRrxMoNa5n135PiGv4mJefFF9PI7KmhvhppSt+vR
 jAv1NM2dzK9em1yxIOck5aVC23vC/VSSwwrvdoSoTzz3rYY4E+xCRhhhUP5FfMSP4vrW2YTTIb20gx
 aPPAjJnU+hh4mTrMOKdQosoZv/+uO4HByupsDy6lB5ae1OgG7TEQnVgySPvw==
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

The device does not implement the power line control correctly. Add a
corresponding control mapping override.

Bus 003 Device 002: ID 5986:1180 Acer, Inc EasyCamera
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x5986 Acer, Inc
  idProduct          0x1180
  bcdDevice           56.04
  iManufacturer           3 Bison
  iProduct                1 EasyCamera
  iSerial                 2
  bNumConfigurations      1

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 215fb483efb0..cca3012c8912 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2994,6 +2994,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
+	/* Acer EasyCamera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x5986,
+	  .idProduct		= 0x1180,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
 	/* Intel RealSense D4M */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,

-- 
2.39.0.rc0.267.gcb52ba06e7-goog-b4-0.11.0-dev-696ae
