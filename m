Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B19463580A1
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 12:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhDHKbh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 06:31:37 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:37135 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229721AbhDHKbh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 06:31:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id URwWlT41kgIC3URwZl9IKf; Thu, 08 Apr 2021 12:31:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617877883; bh=LMC4WXmjpzZZXeUalQ7rtqZETnrjqQMthAHjG2jLztU=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=U+DvKXzqjWMg+38Y7GD8JqIzHDpTsDzL03QSwStxvusgpDrmqE+ZKvUyqMZXQpVgg
         qd/Ii6Idrc9EV6i0hQLI//gck4QV/XL30yY/UywquVjnCBaiNHpdbmzU4V6SvSH607
         rf4qg+BuEMK4jeEzC91xTVUJawa9xQXaerICgC0VFJ96Xud9talrurApxOKgm0vALm
         hRalnncmk9YKCdN/5rsY+4lRYj96tdyS7o0i+I0aYdEGcIDmKSErogXQeJXBF1PnNA
         5fQ9HxW3ObqbH5FepdtYhS+XafcIjY8K5WhxqtHMbXFHKHSJEFMR5mGoaimLDGJw0B
         iHi4gTEGeMWRw==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] gscpa/stv06xx: fix memory leak
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <d54f28c2-0ce6-8027-743f-b4cab9e73516@xs4all.nl>
Date:   Thu, 8 Apr 2021 12:31:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEOkdl2qW8JwsNXYcXBRsVANwwalwMi4ckv9Nx2OxgwlOPYC/vLdhBGRl31oqQd9CkHf0hIL5DAPSojGfFGJPmtNkRmCld3qV8DLQeFY7w8sPjQZ0Qon
 iSyfvaiizoa/Wgh0sdrJ7ZzVVCeWYmp/1/gMjjJSqvPfcj+OOruN4SUwnvIklc3JW8YQC2UsVequwjonmfk4JvK8tvMo9XTciYLwSMInoaQqXANltQdqKu1u
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For two of the supported sensors the stv06xx driver allocates memory which is
stored in sd->sensor_priv. This memory is freed on a disconnect, but if the
probe() fails, then it isn't freed and so this leaks memory.

Add a new probe_error() op that drivers can use to free any allocated memory
in case there was a probe failure.

Thanks to Pavel Skripkin <paskripkin@gmail.com> for discovering the cause of
the memory leak.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-and-tested-by: syzbot+e7f4c64a4248a0340c37@syzkaller.appspotmail.com
---
diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index 158c8e28ed2c..47d8f28bfdfc 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -1576,6 +1576,8 @@ int gspca_dev_probe2(struct usb_interface *intf,
 #endif
 	v4l2_ctrl_handler_free(gspca_dev->vdev.ctrl_handler);
 	v4l2_device_unregister(&gspca_dev->v4l2_dev);
+	if (sd_desc->probe_error)
+		sd_desc->probe_error(gspca_dev);
 	kfree(gspca_dev->usb_buf);
 	kfree(gspca_dev);
 	return ret;
diff --git a/drivers/media/usb/gspca/gspca.h b/drivers/media/usb/gspca/gspca.h
index b0ced2e14006..a6554d5e9e1a 100644
--- a/drivers/media/usb/gspca/gspca.h
+++ b/drivers/media/usb/gspca/gspca.h
@@ -105,6 +105,7 @@ struct sd_desc {
 	cam_cf_op config;	/* called on probe */
 	cam_op init;		/* called on probe and resume */
 	cam_op init_controls;	/* called on probe */
+	cam_v_op probe_error;	/* called if probe failed, do cleanup here */
 	cam_op start;		/* called on stream on after URBs creation */
 	cam_pkt_op pkt_scan;
 /* optional operations */
diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx.c b/drivers/media/usb/gspca/stv06xx/stv06xx.c
index 95673fc0a99c..27a87f360704 100644
--- a/drivers/media/usb/gspca/stv06xx/stv06xx.c
+++ b/drivers/media/usb/gspca/stv06xx/stv06xx.c
@@ -529,12 +529,21 @@ static int sd_int_pkt_scan(struct gspca_dev *gspca_dev,
 static int stv06xx_config(struct gspca_dev *gspca_dev,
 			  const struct usb_device_id *id);

+static void stv06xx_probe_error(struct gspca_dev *gspca_dev)
+{
+	struct sd *sd = (struct sd *) gspca_dev;
+
+	kfree(sd->sensor_priv);
+	sd->sensor_priv = NULL;
+}
+
 /* sub-driver description */
 static const struct sd_desc sd_desc = {
 	.name = MODULE_NAME,
 	.config = stv06xx_config,
 	.init = stv06xx_init,
 	.init_controls = stv06xx_init_controls,
+	.probe_error = stv06xx_probe_error,
 	.start = stv06xx_start,
 	.stopN = stv06xx_stopN,
 	.pkt_scan = stv06xx_pkt_scan,
