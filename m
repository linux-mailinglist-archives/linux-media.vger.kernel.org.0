Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 921E52C2C25
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 17:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389954AbgKXQA2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 11:00:28 -0500
Received: from netrider.rowland.org ([192.131.102.5]:32883 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2389913AbgKXQA2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 11:00:28 -0500
Received: (qmail 750208 invoked by uid 1000); 24 Nov 2020 11:00:26 -0500
Date:   Tue, 24 Nov 2020 11:00:26 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     syzbot <syzbot+44e64397bd81d5e84cba@syzkaller.appspotmail.com>,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: gspca: Fix memory leak in probe
Message-ID: <20201124160026.GA749809@rowland.harvard.edu>
References: <20201123215345.GA721643@rowland.harvard.edu>
 <0000000000004b629f05b4cd7124@google.com>
 <20201123222428.GB721643@rowland.harvard.edu>
 <c2cf1a80-ec47-69ac-c3e2-1b0e32447ef2@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2cf1a80-ec47-69ac-c3e2-1b0e32447ef2@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The gspca driver leaks memory when a probe fails.  gspca_dev_probe2()
calls v4l2_device_register(), which takes a reference to the
underlying device node (in this case, a USB interface).  But the
failure pathway neglects to call v4l2_device_disconnect(), the routine
responsible for dropping this reference.  Consequently the memory for
the USB interface and its device never gets released.

This patch adds the missing function call.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: syzbot+44e64397bd81d5e84cba@syzkaller.appspotmail.com
CC: <stable@vger.kernel.org>

---

This doesn't fully fix syzbot's test case, because the test goes on and 
encounters another memory leak in a different driver.


[as1949]


 drivers/media/usb/gspca/gspca.c |    1 +
 1 file changed, 1 insertion(+)

Index: usb-devel/drivers/media/usb/gspca/gspca.c
===================================================================
--- usb-devel.orig/drivers/media/usb/gspca/gspca.c
+++ usb-devel/drivers/media/usb/gspca/gspca.c
@@ -1575,6 +1575,7 @@ out:
 		input_unregister_device(gspca_dev->input_dev);
 #endif
 	v4l2_ctrl_handler_free(gspca_dev->vdev.ctrl_handler);
+	v4l2_device_disconnect(&gspca_dev->v4l2_dev);
 	kfree(gspca_dev->usb_buf);
 	kfree(gspca_dev);
 	return ret;

