Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83973372E7E
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 19:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbhEDRKu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 13:10:50 -0400
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21322 "EHLO
        sender4-of-o53.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbhEDRKt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 13:10:49 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620148182; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=JGbDoXdCLlqGA1OO5uC8QlBGaIQQT/WUwHts9dFRO/tUTk364G4JggA9DvqR5zpBdOS39btX08RRLuJFXANwy+ZNESQJjDCEKZuU4HWC+npwksC5RCgmkXO4Z1XZJzbcH4g0yoXAljGGFhQgQa/V9GVOojUBJvm6d/tgukHV8C8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1620148182; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=bP5q0oCy6JjgM/bUrdYdiiOBH0QufNCdsTsJImsXwQs=; 
        b=lC9k/Kf2JokY3mMPUumOYxyWinTtfhLf8ZD2sMHgeMeJXhNDOaNfdEQm3XJVU3Or3Zx/xnWjsoxAp8eGUwjRiy2nzsdxvQep5628JFTRJzsQrYZ7jJCHpcsJR4Lri+TOqiw+oNYGK7x+Vy+trfMh29fHuRpxX5t/Iy4TKbSrUz0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=anirudhrb.com;
        spf=pass  smtp.mailfrom=mail@anirudhrb.com;
        dmarc=pass header.from=<mail@anirudhrb.com> header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1620148182;
        s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
        bh=bP5q0oCy6JjgM/bUrdYdiiOBH0QufNCdsTsJImsXwQs=;
        b=bHkpEaY3QRRksQpbitMoxmi0wyZsZkvywxg8OLsKVNP/9tueaWk59cdk1OUbwanG
        MjQuAbZU5/zf4Qxnl1WDTN0ncMjAR7FcxguF23kbJMTDRu+Rq/wLfKR48mrPItd+o+s
        8zu2kNKlMZLHbClbt5jF+5TL2+xpVrSB5BuPNR5o=
Received: from localhost.localdomain (49.207.214.96 [49.207.214.96]) by mx.zohomail.com
        with SMTPS id 1620148175776768.7889874703077; Tue, 4 May 2021 10:09:35 -0700 (PDT)
From:   Anirudh Rayabharam <mail@anirudhrb.com>
To:     Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Anirudh Rayabharam <mail@anirudhrb.com>,
        syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 resend] media: pvrusb2: fix warning in pvr2_i2c_core_done
Date:   Tue,  4 May 2021 22:38:58 +0530
Message-Id: <20210504170858.23826-1-mail@anirudhrb.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has reported the following warning in pvr2_i2c_done:

	sysfs group 'power' not found for kobject '1-0043'

When the device is disconnected (pvr_hdw_disconnect), the i2c adapter is
not unregistered along with the USB and v4l2 teardown. As part of the USB
device disconnect, the sysfs files of the subdevices are also deleted.
So, by the time pvr_i2c_core_done is called by pvr_context_destroy, the
sysfs files have been deleted.

To fix this, unregister the i2c adapter too in pvr_hdw_disconnect. Make
the device deregistration code shared by calling pvr_hdw_disconnect from
pvr2_hdw_destroy.

Reported-by: syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com
Tested-by: syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
---

syzbot test run result:
https://groups.google.com/g/syzkaller-bugs/c/ZRtPuAv8k7g/m/_MIsLKJtAAAJ

Changes in v2:
- Corrected typos in the patch description
- Added the received "Reviewed-by:" tags 
- Retain the call to v4l2_device_unregister() in pvr2_hdw_destroy()
  since pvr2_hdw_disconnect doesn't call it as pointed out by Hans.

---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index f4a727918e35..d38dee1792e4 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -2676,9 +2676,8 @@ void pvr2_hdw_destroy(struct pvr2_hdw *hdw)
 		pvr2_stream_destroy(hdw->vid_stream);
 		hdw->vid_stream = NULL;
 	}
-	pvr2_i2c_core_done(hdw);
 	v4l2_device_unregister(&hdw->v4l2_dev);
-	pvr2_hdw_remove_usb_stuff(hdw);
+	pvr2_hdw_disconnect(hdw);
 	mutex_lock(&pvr2_unit_mtx);
 	do {
 		if ((hdw->unit_number >= 0) &&
@@ -2705,6 +2704,7 @@ void pvr2_hdw_disconnect(struct pvr2_hdw *hdw)
 {
 	pvr2_trace(PVR2_TRACE_INIT,"pvr2_hdw_disconnect(hdw=%p)",hdw);
 	LOCK_TAKE(hdw->big_lock);
+	pvr2_i2c_core_done(hdw);
 	LOCK_TAKE(hdw->ctl_lock);
 	pvr2_hdw_remove_usb_stuff(hdw);
 	LOCK_GIVE(hdw->ctl_lock);
-- 
2.26.2

