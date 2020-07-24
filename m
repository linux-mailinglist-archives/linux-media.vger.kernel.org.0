Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C2F22C485
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 13:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgGXLse (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 07:48:34 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49720 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726280AbgGXLse (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 07:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595591312;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=IHdQGmbVWrAUu87m/Q+jwwttRLKkPH3itijfnWn0QuE=;
        b=g87+3aOe7JQec/7W5OCiZArnEUKTN3xlsZRSBuBF4pco49L9RlwCasx9EaQyxnfFo1anp9
        zX99Wxu4c4hltkza4gAtUtMnlffQytGhqEUBez+4SMXwHJmRSNxKMsCO/zUe0/F1Rx9H8L
        ydRwTQxzdQtqHoufCi5rZx7JTA25qkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-fc8YqbGPOTqM4ROcjK168w-1; Fri, 24 Jul 2020 07:48:28 -0400
X-MC-Unique: fc8YqbGPOTqM4ROcjK168w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A042F107ACCA;
        Fri, 24 Jul 2020 11:48:26 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-10.ams2.redhat.com [10.36.113.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3DF4669326;
        Fri, 24 Jul 2020 11:48:24 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH] media: uvcvideo: Fix uvc_ctrl_fixup_xu_info() not having any effect
Date:   Fri, 24 Jul 2020 13:48:23 +0200
Message-Id: <20200724114823.108237-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

uvc_ctrl_add_info() calls uvc_ctrl_get_flags() which will override
the fixed-up flags set by uvc_ctrl_fixup_xu_info().

This commit fixes this by adding a is_xu argument to uvc_ctrl_add_info()
and skipping the uvc_ctrl_get_flags() call for xu ctrls.

Note that the xu path has already called uvc_ctrl_get_flags() from
uvc_ctrl_fill_xu_info() before calling uvc_ctrl_add_info().

This fixes the xu motor controls not working properly on a Logitech
046d:08cc, and presumably also on the other Logitech models which have
a quirk for this in the uvc_ctrl_fixup_xu_info() function.

Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e399b9fad757..4bdea5814d6a 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1815,7 +1815,7 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
 }
 
 static int uvc_ctrl_add_info(struct uvc_device *dev, struct uvc_control *ctrl,
-	const struct uvc_control_info *info);
+	const struct uvc_control_info *info, bool is_xu);
 
 static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
 	struct uvc_control *ctrl)
@@ -1830,7 +1830,7 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
 	if (ret < 0)
 		return ret;
 
-	ret = uvc_ctrl_add_info(dev, ctrl, &info);
+	ret = uvc_ctrl_add_info(dev, ctrl, &info, true);
 	if (ret < 0)
 		uvc_trace(UVC_TRACE_CONTROL, "Failed to initialize control "
 			  "%pUl/%u on device %s entity %u\n", info.entity,
@@ -2009,7 +2009,7 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
  * Add control information to a given control.
  */
 static int uvc_ctrl_add_info(struct uvc_device *dev, struct uvc_control *ctrl,
-	const struct uvc_control_info *info)
+	const struct uvc_control_info *info, bool is_xu)
 {
 	int ret = 0;
 
@@ -2029,7 +2029,8 @@ static int uvc_ctrl_add_info(struct uvc_device *dev, struct uvc_control *ctrl,
 	 * default flag values from the uvc_ctrl array when the device doesn't
 	 * properly implement GET_INFO on standard controls.
 	 */
-	uvc_ctrl_get_flags(dev, ctrl, &ctrl->info);
+	if (!is_xu)
+		uvc_ctrl_get_flags(dev, ctrl, &ctrl->info);
 
 	ctrl->initialized = 1;
 
@@ -2252,7 +2253,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_device *dev, struct uvc_control *ctrl)
 	for (; info < iend; ++info) {
 		if (uvc_entity_match_guid(ctrl->entity, info->entity) &&
 		    ctrl->index == info->index) {
-			uvc_ctrl_add_info(dev, ctrl, info);
+			uvc_ctrl_add_info(dev, ctrl, info, false);
 			break;
 		 }
 	}
-- 
2.26.2

