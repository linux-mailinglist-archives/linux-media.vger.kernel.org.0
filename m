Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E193EC879
	for <lists+linux-media@lfdr.de>; Sun, 15 Aug 2021 12:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236837AbhHOKBz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Aug 2021 06:01:55 -0400
Received: from m12-16.163.com ([220.181.12.16]:44977 "EHLO m12-16.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232507AbhHOKBz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Aug 2021 06:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=xKpF5
        6X2k0Nr3erfZDKZWfdeSwOqdA1sIRQNeUSYI64=; b=ZC/aBBZb90ZaE94RF8mPi
        xEq/4SEeZ1C7dW7o8sx3piVpX2HRjlmt0t2BjPARwpXq3wvv9IXgG56aoIVCGKRW
        80eB/D2Wn2caCVWM9vXk5/mKmCwc3Pc03fxfcOY6v1a7JGStrhclimrgXpU7DpJ7
        /1R2caWHRVsFPTeehy3wrw=
Received: from nilus-desk (unknown [120.229.1.29])
        by smtp12 (Coremail) with SMTP id EMCowADXRDvm5Rhh66a47g--.17265S3;
        Sun, 15 Aug 2021 18:01:10 +0800 (CST)
Date:   Sun, 15 Aug 2021 18:01:09 +0800
From:   Nil Yi <teroincn@163.com>
To:     crope@iki.fi, linux-media@vger.kernel.org
Subject: [PATCH] media: usb: dvb-usb-v2: clean the freed pointer and counter
Message-ID: <20210815100109.GA70768@nilus-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CM-TRANSID: EMCowADXRDvm5Rhh66a47g--.17265S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFy5Gr4kXF4xCr1DXrW3trb_yoW8Gry8pa
        nxKan5tFy7Ja43Jry3t3ZIkF1rKay8Z34rKry3uwn8Zr48Gw13ta48Kw4rKrn29rWIva4r
        JrW5Z3y8Ar1jgr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j3nYwUUUUU=
X-Originating-IP: [120.229.1.29]
X-CM-SenderInfo: 5whu0xxqfqqiywtou0bp/1tbiHQbvElSIr4778QAAsR
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After urb was freed, the pointer and counter need to be
cleaned.

Signed-off-by: Nil Yi <teroincn@163.com>
---
 drivers/media/usb/dvb-usb-v2/usb_urb.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/usb_urb.c b/drivers/media/usb/dvb-usb-v2/usb_urb.c
index 2ad2ddeaf..08ba2d138 100644
--- a/drivers/media/usb/dvb-usb-v2/usb_urb.c
+++ b/drivers/media/usb/dvb-usb-v2/usb_urb.c
@@ -143,8 +143,11 @@ static int usb_urb_alloc_bulk_urbs(struct usb_data_stream *stream)
 		stream->urb_list[i] = usb_alloc_urb(0, GFP_ATOMIC);
 		if (!stream->urb_list[i]) {
 			dev_dbg(&stream->udev->dev, "%s: failed\n", __func__);
-			for (j = 0; j < i; j++)
+			for (j = 0; j < i; j++) {
 				usb_free_urb(stream->urb_list[j]);
+				stream->urb_list[j] = NULL;
+			}
+			stream->urbs_initialized = 0;
 			return -ENOMEM;
 		}
 		usb_fill_bulk_urb(stream->urb_list[i],
@@ -173,8 +176,11 @@ static int usb_urb_alloc_isoc_urbs(struct usb_data_stream *stream)
 				stream->props.u.isoc.framesperurb, GFP_ATOMIC);
 		if (!stream->urb_list[i]) {
 			dev_dbg(&stream->udev->dev, "%s: failed\n", __func__);
-			for (j = 0; j < i; j++)
+			for (j = 0; j < i; j++) {
 				usb_free_urb(stream->urb_list[j]);
+				stream->urb_list[j] = NULL;
+			}
+			stream->urbs_initialized = 0;
 			return -ENOMEM;
 		}
 
-- 
2.17.1


