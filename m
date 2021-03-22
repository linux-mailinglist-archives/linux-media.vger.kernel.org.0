Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F96344072
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 13:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhCVMGH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 08:06:07 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:34933 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230393AbhCVMFu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 08:05:50 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OJJalvdsK4XAGOJJdlXSi7; Mon, 22 Mar 2021 13:05:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616414749; bh=6pUkFObe3ry8c77h8z4qx7MulK4inSR5MqPc21LlajI=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RnogOnDlyN4dvn8EwVj80fT10Jjo0+cWmJ8tVwUaSvSotG9wODoLQ8nWALNbPe1AG
         GaHOh7xzC0D0il22hlqyvb1k/DYpj1Zc6D6egsfRolRNO3yp4gHWbvh4h8U9Z03nnk
         1n2n8RFC7SoiXh17IKYzqCTb2PnnWqTcH2yE/mvq4hua3snkUTLZkqRQmWJI09/YoC
         mKQ4t5P7VpnUT8eo7NPKOIR05/AsEIxYqNqjbEQ2qUiA9FR5EY+yUysRUIlDpre5mi
         BC+kiktb+OjbZUYtqZc/EhLp/YgscfZIHkihDFNM3DLxBsg+BaKFIkb3NVFkXYA/Tf
         J4jgegWpu/iyg==
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] uvcvideo: improve error handling in uvc_query_ctrl()
Message-ID: <347cdb4a-19a2-98ce-580f-5aba4abfb2fc@xs4all.nl>
Date:   Mon, 22 Mar 2021 13:05:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJnHV96s6WUWp7toBwGERHh9DqDEpAy+SFg3OumP8WBLslcPz/Wrs/kEMLzM89WRvJN6G8Q3rwqpTqYEnscrnGcbtBkZPzoTQm6gFkff0N/1EZMTvFmC
 F9SSOOXYnkZTOmolWN7dYkjGHZHD7zF2G59LkwZtFNiZonNSgC2UOryQzEGuaDQHqQXLchAR//iR+SAChTmcugfeUvYbu9yRF19H6OfDPYDoklgMV8Jgleop
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- If __uvc_query_ctrl() failed with a non-EPIPE error, then
  report that with dev_err. If an error code is obtained, then
  report that with dev_dbg.

- For error 2 (Wrong state) return -EACCES instead of -EILSEQ.
  EACCES is a much more appropriate error code. EILSEQ will return
  "Invalid or incomplete multibyte or wide character." in strerror(),
  which is a *very* confusing message.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
Ricardo, this too can be added to the uvc series.
---
 drivers/media/usb/uvc/uvc_video.c | 44 +++++++++++++++++--------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index b63c073ec30e..3f461bb4eeb9 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -68,7 +68,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 			u8 intfnum, u8 cs, void *data, u16 size)
 {
 	int ret;
-	u8 error;
+	u8 error = 0;
 	u8 tmp;

 	ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
@@ -76,35 +76,39 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	if (likely(ret == size))
 		return 0;

-	dev_dbg(&dev->udev->dev,
-		"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
-		uvc_query_name(query), cs, unit, ret, size);
+	ret = ret < 0 ? ret : -EPIPE;

-	if (ret != -EPIPE)
-		return ret;
-
-	tmp = *(u8 *)data;
+	if (ret == -EPIPE) {
+		tmp = *(u8 *)data;

-	ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
-			       UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
-			       UVC_CTRL_CONTROL_TIMEOUT);
+		ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
+				       UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
+				       UVC_CTRL_CONTROL_TIMEOUT);

-	error = *(u8 *)data;
-	*(u8 *)data = tmp;
+		if (ret == 1)
+			error = *(u8 *)data;
+		*(u8 *)data = tmp;
+		if (ret != 1)
+			ret = ret < 0 ? ret : -EPIPE;
+	}

-	if (ret != 1)
-		return ret < 0 ? ret : -EPIPE;
+	if (error)
+		dev_dbg(&dev->udev->dev,
+			"Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
+			uvc_query_name(query), cs, unit, error);
+	else
+		dev_err(&dev->udev->dev,
+			"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
+			uvc_query_name(query), cs, unit, ret, size);

-	uvc_dbg(dev, CONTROL, "Control error %u\n", error);
+	if (!error)
+		return ret;

 	switch (error) {
-	case 0:
-		/* Cannot happen - we received a STALL */
-		return -EPIPE;
 	case 1: /* Not ready */
 		return -EBUSY;
 	case 2: /* Wrong state */
-		return -EILSEQ;
+		return -EACCES;
 	case 3: /* Power */
 		return -EREMOTE;
 	case 4: /* Out of range */
-- 
2.30.0

