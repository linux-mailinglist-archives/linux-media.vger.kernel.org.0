Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18F294B368
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2019 09:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730996AbfFSHy3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jun 2019 03:54:29 -0400
Received: from resqmta-po-08v.sys.comcast.net ([96.114.154.167]:53978 "EHLO
        resqmta-po-08v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725946AbfFSHy2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jun 2019 03:54:28 -0400
Received: from resomta-po-19v.sys.comcast.net ([96.114.154.243])
        by resqmta-po-08v.sys.comcast.net with ESMTP
        id dVOmhfo4o1iPKdVQKhKxhX; Wed, 19 Jun 2019 07:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1560930868;
        bh=/foo8Bjds6ItfHQLdSY6ZBRbSey/iX0Y/DLCgtdahVs=;
        h=Received:Received:From:Subject:To:Message-ID:Date:MIME-Version:
         Content-Type;
        b=c2/rTkidt/DkPXE0e+3p6eFzpdC0Bdmc0ktCfyl/U4IoWCVVv2iv66u9igtp5lIB1
         bd+5qhnodggIuGyokOiPunZ0zoS2Tr95kWzfXFjKmBZW2Q6HxXm93i7ZB3NML9COXF
         C8ueLGjl1hQhehTNNhOwt/AyH6C0F41EWL8hc5fIF8K4O5fRPzhKN2Mcd8as5DMbjv
         JmcKMYH7TVbwDY++cy6goZ6JzSxPS46UiTKy9iOHceE+Xsb2F9ObwWxQuCGcGUzQez
         cLGoyy0zmVUcWkw5JzTQU1xOD3bKQ2Tf9+uCJeg61QKW25H4jHtGsS4sPWlPjlxOzD
         PIeOhWH/S7pOw==
Received: from [192.168.4.4] ([73.248.220.215])
        by resomta-po-19v.sys.comcast.net with ESMTPA
        id dVQIhWr4NmPHJdVQJhr4yh; Wed, 19 Jun 2019 07:54:27 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgeduvddrtddugdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffuvfhfkffffgggjggtgfesthejredttdefjeenucfhrhhomheptecuufhunhcuoegrshdutdeffeigsegtohhmtggrshhtrdhnvghtqeenucfkphepjeefrddvgeekrddvvddtrddvudehnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrgedrgegnpdhinhgvthepjeefrddvgeekrddvvddtrddvudehpdhmrghilhhfrhhomheprghsuddtfeefgiestghomhgtrghsthdrnhgvthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgvrghnsehmvghsshdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-Xfinity-VMeta: sc=-100;st=legit
From:   A Sun <as1033x@comcast.net>
Subject: [PATCH v2 2/3] [media] mceusb: Reword messages referring to "urb"
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <999ae5cd-d72b-983f-2f96-5aaca72e8214@comcast.net>
 <43f4ef6e-2c64-cd7a-26f7-3c1309b68936@comcast.net>
 <20190606095337.jfhmc6jqgyhmxn4q@gofer.mess.org>
 <2548e827-1d11-4ce2-013f-bf36c9f5436e@comcast.net>
 <20190608083729.bw47vkplpf3r4e4b@gofer.mess.org>
Message-ID: <7e0c816d-c7bf-a3bf-a9f3-8c61605dbb17@comcast.net>
Date:   Wed, 19 Jun 2019 03:54:21 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190608083729.bw47vkplpf3r4e4b@gofer.mess.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Clarify messages referencing "request urb" to mean "tx urb"
(host transmit/send (to mceusb device)).
Qualify messages referencing plain "urb" to mean "rx urb"
(host receive (from mceusb device)).
Add missing "couldn't allocate rx urb" error message.
Clean extraneous "\n" in dev_dbg messages.

Signed-off-by: A Sun <as1033x@comcast.net>
---
 drivers/media/rc/mceusb.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index 0cd8f6f57..efffb1795 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -796,13 +796,13 @@ static void mce_async_callback(struct urb *urb)
 		break;
 
 	case -EPIPE:
-		dev_err(ir->dev, "Error: request urb status = %d (TX HALT)",
+		dev_err(ir->dev, "Error: tx urb status = %d (TX HALT)",
 			urb->status);
 		mceusb_defer_kevent(ir, EVENT_TX_HALT);
 		break;
 
 	default:
-		dev_err(ir->dev, "Error: request urb status = %d", urb->status);
+		dev_err(ir->dev, "Error: tx urb status = %d", urb->status);
 		break;
 	}
 
@@ -822,7 +822,7 @@ static void mce_request_packet(struct mceusb_dev *ir, unsigned char *data,
 
 	async_urb = usb_alloc_urb(0, GFP_KERNEL);
 	if (unlikely(!async_urb)) {
-		dev_err(dev, "Error, couldn't allocate urb!");
+		dev_err(dev, "Error: couldn't allocate tx urb!");
 		return;
 	}
 
@@ -1268,13 +1268,13 @@ static void mceusb_dev_recv(struct urb *urb)
 		return;
 
 	case -EPIPE:
-		dev_err(ir->dev, "Error: urb status = %d (RX HALT)",
+		dev_err(ir->dev, "Error: rx urb status = %d (RX HALT)",
 			urb->status);
 		mceusb_defer_kevent(ir, EVENT_RX_HALT);
 		return;
 
 	default:
-		dev_err(ir->dev, "Error: urb status = %d", urb->status);
+		dev_err(ir->dev, "Error: rx urb status = %d", urb->status);
 		break;
 	}
 
@@ -1544,27 +1544,27 @@ static int mceusb_dev_probe(struct usb_interface *intf,
 		if (ep_in == NULL) {
 			if (usb_endpoint_is_bulk_in(ep)) {
 				ep_in = ep;
-				dev_dbg(&intf->dev, "acceptable bulk inbound endpoint found\n");
+				dev_dbg(&intf->dev, "acceptable bulk inbound endpoint found");
 			} else if (usb_endpoint_is_int_in(ep)) {
 				ep_in = ep;
 				ep_in->bInterval = 1;
-				dev_dbg(&intf->dev, "acceptable interrupt inbound endpoint found\n");
+				dev_dbg(&intf->dev, "acceptable interrupt inbound endpoint found");
 			}
 		}
 
 		if (ep_out == NULL) {
 			if (usb_endpoint_is_bulk_out(ep)) {
 				ep_out = ep;
-				dev_dbg(&intf->dev, "acceptable bulk outbound endpoint found\n");
+				dev_dbg(&intf->dev, "acceptable bulk outbound endpoint found");
 			} else if (usb_endpoint_is_int_out(ep)) {
 				ep_out = ep;
 				ep_out->bInterval = 1;
-				dev_dbg(&intf->dev, "acceptable interrupt outbound endpoint found\n");
+				dev_dbg(&intf->dev, "acceptable interrupt outbound endpoint found");
 			}
 		}
 	}
 	if (!ep_in || !ep_out) {
-		dev_dbg(&intf->dev, "required endpoints not found\n");
+		dev_dbg(&intf->dev, "required endpoints not found");
 		return -ENODEV;
 	}
 
@@ -1584,8 +1584,10 @@ static int mceusb_dev_probe(struct usb_interface *intf,
 		goto buf_in_alloc_fail;
 
 	ir->urb_in = usb_alloc_urb(0, GFP_KERNEL);
-	if (!ir->urb_in)
+	if (!ir->urb_in) {
+		dev_err(&intf->dev, "Error: couldn't allocate rx urb!");
 		goto urb_in_alloc_fail;
+	}
 
 	ir->usbdev = usb_get_dev(dev);
 	ir->dev = &intf->dev;
-- 
2.11.0


