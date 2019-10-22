Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECC7E0397
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 14:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388940AbfJVMHj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 08:07:39 -0400
Received: from jpvw.nl ([80.127.100.2]:40206 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388106AbfJVMHj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 08:07:39 -0400
Received: from jp by jpvw.nl with local (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1iMswr-0008NZ-FW; Tue, 22 Oct 2019 14:07:37 +0200
Date:   Tue, 22 Oct 2019 14:07:37 +0200
From:   Jan Pieter van Woerkom <jp@jpvw.nl>
To:     linux-media@vger.kernel.org
Cc:     Sean Young <sean@mess.org>
Subject: [PATCH] media: dvbsky: remove unused code
Message-ID: <20191022120737.GA31677@jpvw.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

remove unused code

Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
---
diff -ru a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c	2019-10-22 13:15:31.598029247 +0200
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c	2019-10-22 12:57:19.841571173 +0200
@@ -592,16 +592,7 @@
 static int dvbsky_init(struct dvb_usb_device *d)
 {
 	struct dvbsky_state *state = d_to_priv(d);
-
-	/* use default interface */
-	/*
-	ret = usb_set_interface(d->udev, 0, 0);
-	if (ret)
-		return ret;
-	*/
-
 	state->last_lock = 0;
-
 	return 0;
 }
