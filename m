Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1294D150580
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 12:41:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgBCLlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 06:41:25 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:41263 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728065AbgBCLlZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Feb 2020 06:41:25 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ya6RiS69Jn7E5ya6Wi3UGc; Mon, 03 Feb 2020 12:41:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580730084; bh=+x+7RnP2PllLF1QdhupoYAPM2J/xKvtBUFN1NCfKBYo=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=V2LcBzAaANSoIJWLTrxsm3EPFwLoWWqfgf0Ti8QYlmbpsStVd2MWpyUtHmi/OI91f
         XcB0DXbWBs5nqsp9TLuK27aso8KzIh8axTvvPtek6QV29oyK2jsAZ8r58maFxXJrg2
         ar2dmZ0/I+nm+OwiBLf6oYsI92FWcek8G6XL+i8HTMPUd2o2Va5sF2htxvglLOGwIC
         QsDLS7FPIEiQ6/NpNH4R05ZQ5AXiRxTCJnNxtQjmcQbTnQV4A41V2O8H2RUPjDtstk
         ZNWISY0DAvhe7NpWUXe7aWCCBEvVmNsENWiUlTc3x+xucu2BUFhZJiM4QHZxEhlC1l
         MaEHXREvIkMxA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 02/11] gadget: uvc: rename VFL_TYPE_GRABBER to _VIDEO
Date:   Mon,  3 Feb 2020 12:41:10 +0100
Message-Id: <20200203114119.1177490-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
References: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMYQBx7nC6D3KGDzpS6tqLjATMx7ndUsOT+3rfJyigb0kZdy8hcF589QdhH4omKlqR2++UDGVQ5yWi+dvGWwGhrBql31kNTuqlpDuC13BeeVqJB1Sd+Q
 5yfkH6xFxvFGEjpoyjZykd33F/wu2J+j7k3HNx8rj7pT4Wy92dJ+ycbrzIc3W4Quw5Zykn29sDaqorFbliS2uEeg4i7n8mYmpo8Z6yQ3RpN0DhBRT33VkPTa
 x6FzErjNhLsJ1AkM+Bq84efDC+WdMnGBb6RWUjG4nJA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'GRABBER' is a weird name, all other types map to the /dev
device names. Rename to 'VIDEO' to be consistent with the
other types.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/usb/gadget/function/f_uvc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index fb0a892687c0..0b9712616455 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -428,7 +428,7 @@ uvc_register_video(struct uvc_device *uvc)
 
 	video_set_drvdata(&uvc->vdev, uvc);
 
-	ret = video_register_device(&uvc->vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&uvc->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0)
 		return ret;
 
-- 
2.24.0

