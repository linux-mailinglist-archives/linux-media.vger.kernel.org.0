Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B75226CD1B
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 22:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgIPUxo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 16:53:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:44520 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726601AbgIPQyH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 12:54:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=cantorsusede;
        t=1600264263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=URjknDmbSImuyku/1xafsgyr5xseibwZWMHvYI3vi64=;
        b=ZVM03/lQvZ9FvT4heQQDEUqALXOaH014/tASz1f6pVIPFqp7gj+2UPfhm0Yk0JA4qC/a1l
        AicmEIKVjGnThDcUPYpcYNzZHE144rUlf6+V9RY6U+ioktv07c9lDUhygmuJ1AQB5Q9cjD
        8glG0wBPJtBnTb86PkNMuMTNuU8Hw6v/8XDZhLUP2FDHawGEBxuknGAEseAbz6DzC6lSKW
        Khey8ZZJ0z0zPXxT2k+GTv3qUlji/KLJbZ9rvq2azjxggUDRlh90cRabRKrVpHfVBJnBCU
        6O0tOFy0RxIWmyxUzvzndQQ8tYZOYYnPg31Ous8MxOUp718V2u+enzk7DSuAGQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 74511AC83;
        Wed, 16 Sep 2020 13:51:18 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     sean@mess.org, mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] ati_remote: sanity check for both endpoints
Date:   Wed, 16 Sep 2020 15:50:51 +0200
Message-Id: <20200916135051.15398-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If you do sanity checks, you should do them for both endpoints.
Hence introduce checking for endpoint type for the output
endpoint, too.

Reported-by: syzbot+998261c2ae5932458f6c@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/ati_remote.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/rc/ati_remote.c b/drivers/media/rc/ati_remote.c
index 9cdef17b4793..c12dda73cdd5 100644
--- a/drivers/media/rc/ati_remote.c
+++ b/drivers/media/rc/ati_remote.c
@@ -835,6 +835,10 @@ static int ati_remote_probe(struct usb_interface *interface,
 		err("%s: endpoint_in message size==0? \n", __func__);
 		return -ENODEV;
 	}
+	if (!usb_endpoint_is_int_out(endpoint_out)) {
+		err("%s: Unexpected endpoint_out\n", __func__);
+		return -ENODEV;
+	}
 
 	ati_remote = kzalloc(sizeof (struct ati_remote), GFP_KERNEL);
 	rc_dev = rc_allocate_device(RC_DRIVER_SCANCODE);
-- 
2.16.4

