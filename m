Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A09397300
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 14:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233764AbhFAMK0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 08:10:26 -0400
Received: from gofer.mess.org ([88.97.38.141]:32949 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231201AbhFAMK0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Jun 2021 08:10:26 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A58D9C638E; Tue,  1 Jun 2021 13:08:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1622549323; bh=c75HU7gSCv2j0DiUFuks4AxvIXEOFfhhUaF4eC6V5Ig=;
        h=From:To:Subject:Date:From;
        b=YASebteYQfM7ATocAvh58EEh3o9o1NUc/cr2gPcu4fMbtYCz4zh5DCG16ekFP43A6
         Q7ni8scI/DGFbV6tpBoY2bvVUomtFhBcrJq9Do8BiauQtemXSwxle014C4YMXUYCq0
         AuZjEdiJMvAG839BWq4HlScp6P8zbt/fEip6s5rftK6rYVBd8LVYNwexIcaJ7ywICZ
         4Jv6BdQLzsD5T/WsuOy9d1oVJz+EUk6w1iQ3PH1dI49uYcVb1xmxM246Ugi1rx9nHg
         dblajaDwX8jkcoR4HdknijEK68Ywix+Jj5U8QSjlN0BIZBfCyVZ+QPQi9W5ZWURi6O
         5eqYt5kn27GGg==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: cinergyt2: make properties const
Date:   Tue,  1 Jun 2021 13:08:43 +0100
Message-Id: <20210601120843.14973-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The dvb_usb_device_properties can be const. This makes it clear that
the static can be shared across threads.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/usb/dvb-usb/cinergyT2-core.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/cinergyT2-core.c b/drivers/media/usb/dvb-usb/cinergyT2-core.c
index 4116ba5c45fc..23f1093d28f8 100644
--- a/drivers/media/usb/dvb-usb/cinergyT2-core.c
+++ b/drivers/media/usb/dvb-usb/cinergyT2-core.c
@@ -29,10 +29,8 @@ struct cinergyt2_state {
 	unsigned char data[64];
 };
 
-/* We are missing a release hook with usb_device data */
-static struct dvb_usb_device *cinergyt2_usb_device;
-
-static struct dvb_usb_device_properties cinergyt2_properties;
+/* Forward declaration */
+static const struct dvb_usb_device_properties cinergyt2_properties;
 
 static int cinergyt2_streaming_ctrl(struct dvb_usb_adapter *adap, int enable)
 {
@@ -84,9 +82,6 @@ static int cinergyt2_frontend_attach(struct dvb_usb_adapter *adap)
 	}
 	mutex_unlock(&d->data_mutex);
 
-	/* Copy this pointer as we are gonna need it in the release phase */
-	cinergyt2_usb_device = adap->dev;
-
 	return ret;
 }
 
@@ -205,7 +200,7 @@ static struct usb_device_id cinergyt2_usb_table[] = {
 
 MODULE_DEVICE_TABLE(usb, cinergyt2_usb_table);
 
-static struct dvb_usb_device_properties cinergyt2_properties = {
+static const struct dvb_usb_device_properties cinergyt2_properties = {
 	.size_of_priv = sizeof(struct cinergyt2_state),
 	.num_adapters = 1,
 	.adapter = {
-- 
2.31.1

