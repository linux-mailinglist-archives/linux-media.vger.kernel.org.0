Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEEF230891
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 13:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbgG1LWV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 07:22:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48706 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728988AbgG1LWV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 07:22:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595935339;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QcKwcnIHe1V5eFZ1SVGNcadWZV+wUuaqXZ3S8T0mtXs=;
        b=OvPeO7ldZOuSTpAPAl01Vpps49XMwg5k0wvPWAieT6+GfTJbb8P/aI6wX3jRAyKy1m17Uf
        KImXWDYfGH2LV5fiMg9xE1f4D0I2MlMHJVzFD7klSWhim84kGmvGYv1bg8FkQ9JKpfqMtd
        jVMli14s7NnxdYHyw/AURX7H4iloZKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-tT4Kzh5uP8ixZ6FSmKxsdw-1; Tue, 28 Jul 2020 07:22:17 -0400
X-MC-Unique: tT4Kzh5uP8ixZ6FSmKxsdw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEFDE8015F7;
        Tue, 28 Jul 2020 11:22:16 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-116.ams2.redhat.com [10.36.114.116])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 80E8D7BD60;
        Tue, 28 Jul 2020 11:22:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH v2 2/2] media: uvcvideo: Cleanup uvc_ctrl_add_info() error handling
Date:   Tue, 28 Jul 2020 13:22:09 +0200
Message-Id: <20200728112209.26207-2-hdegoede@redhat.com>
In-Reply-To: <20200728112209.26207-1-hdegoede@redhat.com>
References: <20200728112209.26207-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is only 1 error exit in uvc_ctrl_add_info(), so using goto style
error handling is not necessary. Also the kfree(ctrl->uvc_data) on error
is not necessary, because the only error exit is for the kzalloc() of
ctrl->uvc_data failing.

Remove all the error handling cruft and simply do "return -ENOMEM" on
kzalloc() failure.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- new patch in v2 of this series
---
 drivers/media/usb/uvc/uvc_ctrl.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b78aba991212..dbebc6083e85 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2011,18 +2011,14 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
 static int uvc_ctrl_add_info(struct uvc_device *dev, struct uvc_control *ctrl,
 	const struct uvc_control_info *info)
 {
-	int ret = 0;
-
 	ctrl->info = *info;
 	INIT_LIST_HEAD(&ctrl->info.mappings);
 
 	/* Allocate an array to save control values (cur, def, max, etc.) */
 	ctrl->uvc_data = kzalloc(ctrl->info.size * UVC_CTRL_DATA_LAST + 1,
 				 GFP_KERNEL);
-	if (ctrl->uvc_data == NULL) {
-		ret = -ENOMEM;
-		goto done;
-	}
+	if (!ctrl->uvc_data)
+		return -ENOMEM;
 
 	ctrl->initialized = 1;
 
@@ -2030,10 +2026,7 @@ static int uvc_ctrl_add_info(struct uvc_device *dev, struct uvc_control *ctrl,
 		"entity %u\n", ctrl->info.entity, ctrl->info.selector,
 		dev->udev->devpath, ctrl->entity->id);
 
-done:
-	if (ret < 0)
-		kfree(ctrl->uvc_data);
-	return ret;
+	return 0;
 }
 
 /*
-- 
2.26.2

