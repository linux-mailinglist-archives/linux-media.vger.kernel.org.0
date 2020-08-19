Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37192491A0
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 02:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgHSAEG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 20:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgHSAEF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 20:04:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938BCC061389
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 17:04:05 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB24E29E;
        Wed, 19 Aug 2020 02:04:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597795444;
        bh=gFVlUNedLRM9dcB1b5fMAtrbXurHc5HS08iMUfEOjl0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F290HH7mdmK8MUmP1HEejIywCXLHyb0kOfTw4f/XW4ruFsbbwssy4cG9luLu7aEcD
         Tjjr6GIm+6KPazppIhoXfceEbCX/sf1DREaDkstS0cxhOEeQ/HmMaiM+r92OutKmCd
         m/h0ObVR57O+7A0Iq1hyz5r3oeVjJvF6Pds/vkWo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Bart Van Assche <bvanassche@acm.org>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: uvc: Silence shift-out-of-bounds warning
Date:   Wed, 19 Aug 2020 03:03:40 +0300
Message-Id: <20200819000340.11616-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200818235406.GE2360@pendragon.ideasonboard.com>
References: <20200818235406.GE2360@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

UBSAN reports a shift-out-of-bounds warning in uvc_get_le_value(). The
report is correct, but the issue should be harmless as the computed
value isn't used when the shift is negative. This may however cause
incorrect behaviour if a negative shift could generate adverse side
effects (such as a trap on some architectures for instance).

Regardless of whether that may happen or not, silence the warning as a
full WARN backtrace isn't nice.

Reported-by: Bart Van Assche <bvanassche@acm.org>
Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 6c37aa018ad5..b2cdee0f7763 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -773,12 +773,16 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
 	offset &= 7;
 	mask = ((1LL << bits) - 1) << offset;
 
-	for (; bits > 0; data++) {
+	while (1) {
 		u8 byte = *data & mask;
 		value |= offset > 0 ? (byte >> offset) : (byte << (-offset));
 		bits -= 8 - (offset > 0 ? offset : 0);
+		if (bits <= 0)
+			break;
+
 		offset -= 8;
 		mask = (1 << bits) - 1;
+		data++;
 	}
 
 	/* Sign-extend the value if needed. */
-- 
Regards,

Laurent Pinchart

