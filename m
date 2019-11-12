Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0D2DF8BA0
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 10:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727206AbfKLJXi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 04:23:38 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:55727 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725944AbfKLJXh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 04:23:37 -0500
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id USOaib7fZQBsYUSOeiAXCw; Tue, 12 Nov 2019 10:23:36 +0100
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com,
        Sean Young <sean@mess.org>
Subject: [PATCH 5/5] dvb-usb/dvb-usb-urb.c: initialize actlen to 0
Date:   Tue, 12 Nov 2019 10:22:28 +0100
Message-Id: <20191112092228.15800-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112092228.15800-1-hverkuil-cisco@xs4all.nl>
References: <20191112092228.15800-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJJDACBvYcV75QWCDMASdH7vjiFdBSEQhZzCQUjzXkuQE26rMMhRcNRgXfuYbIisQLJLbNnpqXJrz0exZq6ota4fRwS/VAHKN4BnxJ4VgOXzV0P5E9ez
 nlTKa5yW4ueN5chEbohoqOg5tUkbyyGhxIOroyywohNxSgH3RL7QFFKV5jBjjmU79mUFbqyK+X/dyl0OQXxZhHgIkGQ5R6QQYE4RG02eLNLKCH4uSR6mbn6s
 JL28dvULHCx63aZCp9x9tbhs7qkkTbhWFTCsyYV5QCW8YV/SYvKgh/u+eTBpxSt1XRJIbfdBeYSF4+7UDdyz+bnKP1nv3iGIOP/O/rzRmx0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This fixes a syzbot failure since actlen could be uninitialized,
but it was still used.

Syzbot link:

https://syzkaller.appspot.com/bug?extid=6bf9606ee955b646c0e1

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-and-tested-by: syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com
CC: Sean Young <sean@mess.org>
---
 drivers/media/usb/dvb-usb/dvb-usb-urb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb-urb.c b/drivers/media/usb/dvb-usb/dvb-usb-urb.c
index c1b4e94a37f8..2aabf90d8697 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-urb.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-urb.c
@@ -12,7 +12,7 @@
 int dvb_usb_generic_rw(struct dvb_usb_device *d, u8 *wbuf, u16 wlen, u8 *rbuf,
 	u16 rlen, int delay_ms)
 {
-	int actlen,ret = -ENOMEM;
+	int actlen = 0, ret = -ENOMEM;
 
 	if (!d || wbuf == NULL || wlen == 0)
 		return -EINVAL;
-- 
2.24.0

