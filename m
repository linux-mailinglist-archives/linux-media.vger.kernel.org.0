Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A9B352472
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 02:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236174AbhDBAZu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 20:25:50 -0400
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21318 "EHLO
        sender4-of-o53.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233677AbhDBAZt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 20:25:49 -0400
X-Greylist: delayed 14403 seconds by postgrey-1.27 at vger.kernel.org; Thu, 01 Apr 2021 20:25:49 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1617280451; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=Hphq8jqHjlxUUzmfeGTplrmlvxjbDQfagXj6aFK0A5e7DjRI5x6IddOZIm8iLLJaNUzyWGglzTgtR4Fl74SWXWlQx7xkBF6iHkJDnizzZql9bxFPnyhVmrG4dQwJ2bpg3HebLi0OijLixVT/OF74A11aC94DdRKWfRDdt+XQ31E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1617280451; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=FmOnjU0+A8QfoCamxd5H0OwzMaGlHS8vAIU7QBMAShY=; 
        b=dBIP7hwIM//OWpxAsFrN3jSMxFd+fE9Du15ZDgq42QKJ7stEVS+gYHxUFW2yItYJR3EI2NIrDkmeUHgR6F/pwWHlRj6KisrzxtziOy/c3NlhOd6ZY5BKOVcGodTjrdOGAMOcq9Mg4hX6T3jqL+2shKolxtC73jzvwt3hchpF/JI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=anirudhrb.com;
        spf=pass  smtp.mailfrom=mail@anirudhrb.com;
        dmarc=pass header.from=<mail@anirudhrb.com> header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1617280451;
        s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
        bh=FmOnjU0+A8QfoCamxd5H0OwzMaGlHS8vAIU7QBMAShY=;
        b=lkVz8x40dot3CU1cFJ4F1+JLyCuA1XESqq3I03UjLCnDsVrPBjyT8z/On9Ejamjz
        mAaIsMwLrJcxaaJOgjL+z/09tg2cc38o7dIM+IVb9hVJXjvyaaXSnbBnV12r29TYIHy
        VztKp8sl4T8cemv7J9Q5j3EA2UzeDaL0qrcMojXk=
Received: from localhost.localdomain (106.51.106.233 [106.51.106.233]) by mx.zohomail.com
        with SMTPS id 16172804475521015.1822725426097; Thu, 1 Apr 2021 05:34:07 -0700 (PDT)
From:   Anirudh Rayabharam <mail@anirudhrb.com>
To:     Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     gregkh@linuxfoundation.org,
        Anirudh Rayabharam <mail@anirudhrb.com>,
        syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: pvrusb2: fix warning in pvr2_i2c_core_done
Date:   Thu,  1 Apr 2021 18:03:38 +0530
Message-Id: <20210401123338.3937-1-mail@anirudhrb.com>
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
not unregistered along with the USB and vl42 teardown. As part of the
USB device disconnect, the sysfs files of the subdevices are also
deleted. So, by the time pvr_i2c_core_done is called by
pvr_context_destroy, the sysfs files have been deleted.

To fix this, unregister the i2c adapter too in pvr_hdw_disconnect. Make
the device deregistration code shared by calling pvr_hdw_disconnect from
pvr2_hdw_destory.

Reported-and-tested-by: syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com
Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index f4a727918e35..791227787ff5 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -2676,9 +2676,7 @@ void pvr2_hdw_destroy(struct pvr2_hdw *hdw)
 		pvr2_stream_destroy(hdw->vid_stream);
 		hdw->vid_stream = NULL;
 	}
-	pvr2_i2c_core_done(hdw);
-	v4l2_device_unregister(&hdw->v4l2_dev);
-	pvr2_hdw_remove_usb_stuff(hdw);
+	pvr2_hdw_disconnect(hdw);
 	mutex_lock(&pvr2_unit_mtx);
 	do {
 		if ((hdw->unit_number >= 0) &&
@@ -2705,6 +2703,7 @@ void pvr2_hdw_disconnect(struct pvr2_hdw *hdw)
 {
 	pvr2_trace(PVR2_TRACE_INIT,"pvr2_hdw_disconnect(hdw=%p)",hdw);
 	LOCK_TAKE(hdw->big_lock);
+	pvr2_i2c_core_done(hdw);
 	LOCK_TAKE(hdw->ctl_lock);
 	pvr2_hdw_remove_usb_stuff(hdw);
 	LOCK_GIVE(hdw->ctl_lock);
-- 
2.26.2

