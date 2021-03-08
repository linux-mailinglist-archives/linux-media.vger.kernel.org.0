Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB85330B38
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 11:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbhCHKcI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 05:32:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37352 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230509AbhCHKbi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Mar 2021 05:31:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615199498;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ds5jFmvyQupPjt3cx6TbR6tufIUZGD28MrXNdsUXFzA=;
        b=fIGC4qUHzwcyAcf+sjMny7hF/G1rWWqpv7JHonrDZQMZzQyZfXSuB1NnnRs9DFTXU7JyJ/
        NgzhCY37QSDpeOg+D3BGOW3CZHXgHKKnpieE/OxpmeMC/v0obWWzdoeatxS6l3ZB2fGlaW
        PL+F2o4S9glQBMUeMXO5Is8VmfMhnw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-aRtAoVujOqu-Cgimr_xPJA-1; Mon, 08 Mar 2021 05:31:34 -0500
X-MC-Unique: aRtAoVujOqu-Cgimr_xPJA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C92A1005D4D;
        Mon,  8 Mar 2021 10:31:32 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-220.ams2.redhat.com [10.36.114.220])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3028E62AF8;
        Mon,  8 Mar 2021 10:31:31 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org,
        John Nealy <jnealy3@yahoo.com>
Subject: [PATCH 1/1] media: uvcvideo: Support devices that report an OT as an entity source
Date:   Mon,  8 Mar 2021 11:31:28 +0100
Message-Id: <20210308103128.33173-2-hdegoede@redhat.com>
In-Reply-To: <20210308103128.33173-1-hdegoede@redhat.com>
References: <20210308103128.33173-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Some devices reference an output terminal as the source of extension
units. This is incorrect, as output terminals only have an input pin,
and thus can't be connected to any entity in the forward direction. The
resulting topology would cause issues when registering the media
controller graph. To avoid this problem, connect the extension unit to
the source of the output terminal instead.

While at it, and while no device has been reported to be affected by
this issue, also handle forward scans where two output terminals would
be connected together, and skip the terminals found through such an
invalid connection.

Reported-and-tested-by: John Nealy <jnealy3@yahoo.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 30ef2a3110f7..8df58f04dac6 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1716,6 +1716,31 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
 				return -EINVAL;
 			}
 
+			/*
+			 * Some devices reference an output terminal as the
+			 * source of extension units. This is incorrect, as
+			 * output terminals only have an input pin, and thus
+			 * can't be connected to any entity in the forward
+			 * direction. The resulting topology would cause issues
+			 * when registering the media controller graph. To
+			 * avoid this problem, connect the extension unit to
+			 * the source of the output terminal instead.
+			 */
+			if (UVC_ENTITY_IS_OTERM(entity)) {
+				struct uvc_entity *source;
+
+				source = uvc_entity_by_id(chain->dev,
+							  entity->baSourceID[0]);
+				if (!source) {
+					uvc_dbg(chain->dev, DESCR,
+						"Can't connect extension unit %u in chain\n",
+						forward->id);
+					break;
+				}
+
+				forward->baSourceID[0] = source->id;
+			}
+
 			list_add_tail(&forward->chain, &chain->entities);
 			if (!found)
 				uvc_dbg_cont(PROBE, " (->");
@@ -1735,6 +1760,13 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
 				return -EINVAL;
 			}
 
+			if (UVC_ENTITY_IS_OTERM(entity)) {
+				uvc_dbg(chain->dev, DESCR,
+					"Unsupported connection between output terminals %u and %u\n",
+					entity->id, forward->id);
+				break;
+			}
+
 			list_add_tail(&forward->chain, &chain->entities);
 			if (!found)
 				uvc_dbg_cont(PROBE, " (->");
-- 
2.30.1

