Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E84BC6B24AD
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 13:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbjCIM5s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 07:57:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbjCIM5X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 07:57:23 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8EDE6FCC
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 04:56:44 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id a25so6749753edb.0
        for <linux-media@vger.kernel.org>; Thu, 09 Mar 2023 04:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678366567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BPyhUJo2IJ440ycAVWGg+bKDSXaxq1Jdyu36gyWJDY=;
        b=YZLhQdWqvwOgjs2qhMAhjeIEdYmdTlly6E2NEFhNCqQGfVxSZJb6jyvQ9yHWVcz7RK
         u/HbhcBpT2tu2AReoXK/zQ3s10jZUTTHqbwkZIOSdLJzd15cI2YGYBTOz1hKPSNH/cKD
         Jrjp3qErHgGDC2UUB5T+F7QORkstD1JRuzk0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678366567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BPyhUJo2IJ440ycAVWGg+bKDSXaxq1Jdyu36gyWJDY=;
        b=hQRz6+g3Q7DH8MxDXDvng4rFo1wLGmb6/ERpkC59P5wbirGL8ts0Z212ul2/wa8eFU
         iOWgs0Vm5na284jmUugnyVfJaMGFjWibwwHU9L1On1OZf1YmdJNu4TH80xs4nOizK5MD
         JrHU5LBDpAvqJCsCAFA/dsO2/C+ltNVajY32MeR/ultyP+erCtHhToiYVlKNtCL+P1cm
         U7i2s5hPVXJVxCIhKd4NExHPZVwtSZ4unlmgypbxwu5nyehJ3V6B2fHGlIiJh9kGL5pj
         9sh1QpI8eqtpczb3d1CeO2Xu5EWdAigi4/exLWSjTpnAtxbkf3Np+O6wBmfuChqXDiyR
         eVHA==
X-Gm-Message-State: AO0yUKXHjk+T1SKEdtYwbWjrU9J9964ujCewbD+lPFNXxIcwv0i0Gbb2
        zWJKCPXOLrJbphORQQkqgA47Cg==
X-Google-Smtp-Source: AK7set8SN8FvH9jdAWZud723TIgdHEgjavhvV6AhlBWvVb1Jmp3vgyDF2BJF5J/G+GafV3avxBVnvQ==
X-Received: by 2002:a17:906:4953:b0:877:a2d1:7560 with SMTP id f19-20020a170906495300b00877a2d17560mr21050758ejt.27.1678366567425;
        Thu, 09 Mar 2023 04:56:07 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:1645:7aa4:a765:1966])
        by smtp.gmail.com with ESMTPSA id hy26-20020a1709068a7a00b008d92897cc29sm8799523ejc.37.2023.03.09.04.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 04:56:07 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 09 Mar 2023 13:55:16 +0100
Subject: [PATCH v6 2/5] media: uvcvideo: Quirk for invalid dev_sof in Logitech C922
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20220920-resend-hwtimestamp-v6-2-c7a99299ec35@chromium.org>
References: <20220920-resend-hwtimestamp-v6-0-c7a99299ec35@chromium.org>
In-Reply-To: <20220920-resend-hwtimestamp-v6-0-c7a99299ec35@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=5174; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=fGx/5pJOYEPLRnhXYtWOAWi9O15PTHo6OOgt4cGK7yM=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkCddddQCIr5C7jKmLOkFpRpHdWv8bbDzhCJSv2M/g
 PKKCSlaJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZAnXXQAKCRDRN9E+zzrEiP9mD/
 9zlYoO8h4dC+jcmYihHBzBS9RdW7yKbgTaKf9nrlZS1DSO0u4J1vZYdtVH/UOWdyE/q2HK5+FDLvKQ
 xUx/4ovpYJrrISliy9NjXK/Wb5jlJbMPmFiYscjtgO52I1MxdhZL4iD5QRiakdLMd2ydbHirsbdpdc
 urJA0+Y/h7yBiBOEyjQQZzEWVnFC+NYbd810uVGOWFpLvH2mLxdYDDEtnEOKZzVgIFQ12G819H2QYH
 tTC9cwoUNj86Z7fK+bvTtLu9rVj+xlOCd62/vxjCM5Qf9ziksIFGYakwE1tMWmxoWESWhZFUdYkMos
 3dlEh4sT1MGu8rVuOu8mycMhZidlukrf4crG4KUtF5AZkTCGvRerO5bMdJpaLT6U8K5q+AXggIWNlL
 sS5k5ZOO150sLuJUqAlbHB1vGFUc+AxruemjodnS22jYzG8uBFMTnxR2zMRSfCrGuRMRy85V+iyJuI
 Uc+NbdYQ2nAmVEvBOwxHxKYMDyoyIsf7oZEOVO5spjffSMdTTCarMx4S1dl1tOaQ+UonOdcsXjB05Q
 0uH6oU2LZv11I+GshDtvXzWix1nKc4ovd02QxqxQSfNu6y/4LDC0d/WaL/nfJwBx9NI0975CgpEz6+
 C2NwpayhDMnMLIe2cjluso2zFt2tIzwSX4U5xLyRYIQCc7I0zmlkVN9RJUXQ==
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

Logitech C922 internal SOF does not increases at a stable rate of 1kHz.
This causes that the device_sof and the host_sof run at different rates,
breaking the clock domain conversion algorithm. Eg:

30 (6) [-] none 30 614400 B 21.245557 21.395214 34.133 fps ts mono/SoE
31 (7) [-] none 31 614400 B 21.275327 21.427246 33.591 fps ts mono/SoE
32 (0) [-] none 32 614400 B 21.304739 21.459256 34.000 fps ts mono/SoE
33 (1) [-] none 33 614400 B 21.334324 21.495274 33.801 fps ts mono/SoE
* 34 (2) [-] none 34 614400 B 21.529237 21.527297 5.130 fps ts mono/SoE
* 35 (3) [-] none 35 614400 B 21.649416 21.559306 8.321 fps ts mono/SoE
36 (4) [-] none 36 614400 B 21.678789 21.595320 34.045 fps ts mono/SoE
...
99 (3) [-] none 99 614400 B 23.542226 23.696352 33.541 fps ts mono/SoE
100 (4) [-] none 100 614400 B 23.571578 23.728404 34.069 fps ts mono/SoE
101 (5) [-] none 101 614400 B 23.601425 23.760420 33.504 fps ts mono/SoE
* 102 (6) [-] none 102 614400 B 23.798324 23.796428 5.079 fps ts mono/SoE
* 103 (7) [-] none 103 614400 B 23.916271 23.828450 8.478 fps ts mono/SoE
104 (0) [-] none 104 614400 B 23.945720 23.860479 33.957 fps ts mono/SoE

Instead of disabling completely the hardware timestamping for such
hardware we take the assumption that the packet handling jitter is
under 2ms and use the host_sof as dev_sof.

We can think of the UVC hardware clock as a system with a coarse clock
(the SOF) and a fine clock (the PTS). The coarse clock can be replaced
with a clock on the same frequency, if the jitter of such clock is
smaller than its sampling rate. That way we can save some of the
precision of the fine clock.

To probe this point we have run three experiments on the Logitech C922.
On that experiment we run the camera at 33fps and we analyse the
difference in msec between a frame and its predecessor. If we display
the histogram of that value, a thinner histogram will mean a better
meassurement. The results for:
- original hw timestamp: https://ibb.co/D1HJJ4x
- pure software timestamp: https://ibb.co/QC9MgVK
- modified hw timestamp: https://ibb.co/8s9dBdk

This bug in the camera firmware has been confirmed by the vendor.

lsusb -v

Bus 001 Device 044: ID 046d:085c Logitech, Inc. C922 Pro Stream Webcam
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x046d Logitech, Inc.
  idProduct          0x085c C922 Pro Stream Webcam
  bcdDevice            0.16
  iManufacturer           0
  iProduct                2 C922 Pro Stream Webcam
  iSerial                 1 80B912DF
  bNumConfigurations      1

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 drivers/media/usb/uvc/uvc_video.c  | 8 ++++++++
 drivers/media/usb/uvc/uvcvideo.h   | 1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 7aefa76a42b3..678a5736c9df 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2549,6 +2549,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT) },
+	/* Logitech HD Pro Webcam C922 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x046d,
+	  .idProduct		= 0x085c,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
 	/* Chicony CNF7129 (Asus EEE 100HE) */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index fc7f8b6fda85..e363a71dd190 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -547,6 +547,14 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	stream->clock.last_sof = dev_sof;
 
 	host_sof = usb_get_current_frame_number(stream->dev->udev);
+
+	/*
+	 * On some devices, like the Logitech C922, the device SOF does not run
+	 * at a stable rate of 1kHz. For those devices use the host SOF instead.
+	 */
+	if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
+		dev_sof = host_sof;
+
 	time = uvc_video_get_time();
 
 	/*
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 9a596c8d894a..07b2fdb80adf 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -73,6 +73,7 @@
 #define UVC_QUIRK_FORCE_Y8		0x00000800
 #define UVC_QUIRK_FORCE_BPP		0x00001000
 #define UVC_QUIRK_WAKE_AUTOSUSPEND	0x00002000
+#define UVC_QUIRK_INVALID_DEVICE_SOF	0x00004000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001

-- 
2.40.0.rc0.216.gc4246ad0f0-goog-b4-0.11.0-dev-696ae
