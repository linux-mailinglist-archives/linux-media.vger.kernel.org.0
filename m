Return-Path: <linux-media+bounces-21418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6849C923F
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 999D3B28422
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBAD1AC884;
	Thu, 14 Nov 2024 19:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ab3VSkGU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D171AA7AF
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 19:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731611453; cv=none; b=m4AdEAEFG+kZ8PmtE/6p/nOyFhq+1GR2NPZKu1K1sFyQLbzsrtNwQ6k91ZxskAU+hueMEo2Es8gVzPxJZfJYmNweDCqwAc9KN8G9N25rZEcGZijo5RXPavjcamyi7Dks/anx8nN+rFEEtHzF6vluAISsf0sDNzZB+031xdbY4qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731611453; c=relaxed/simple;
	bh=rPQhRflph/OInqLTKMInrEsUWj88dYYh+206vtmsiRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rsRYOLIGkx9Dl4CwWhneLdB073Kqu9CE1C92/uNE2bvCFEmRhlT1QjhWNBaWCwXBPczjNCE3ojI0vR4yaD6pCTos6r8lcchjsiDuhZrukhCIRfJP1C6wU+tD5J6nWO3EsnKn9pRXTV9c2ybvIZ+eSJbMZ4FMUCQpcJtfjpv9610=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ab3VSkGU; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b15d7b7a32so61824085a.1
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731611450; x=1732216250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pH1OuQ5/XwP0NAJGYmmTzFwWtNbM3f5Um97UBRgql50=;
        b=ab3VSkGUm3iJRXFp1KRbrezr7zk52+k68rw9vHTgPmR2Gni5OPfY1vcE0T+hsOTYna
         fJTDnSY++el4Pvs6+5XSPbGSUOOmJ+G/rmfyn11LjOz+r7a6dqEy0iBNYSRuGzhqzcmq
         qejw3zByGrFr23waC5XaABSh3r7lbzoJKGP8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611450; x=1732216250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pH1OuQ5/XwP0NAJGYmmTzFwWtNbM3f5Um97UBRgql50=;
        b=TtxAX+tdMW8BcDTIbuxowNT8ZTXmvzKU/DfSu0rmj5Ff8ClnvZWEfRIhbJbxi8j28Q
         HM6SkXWfAGmpNX1a786g/r2TLUruAN4UuawaaK1C352xlzmA+vv5tlZ3nXztQPgclMOu
         aWiS3DylF9D3BhTJDZDMG/WYisVNl9gAdaES4tieWErjY6Bqwey8K2vlA19/GNwRLtvP
         fO1gg47n/CCJrLIJImxVbXM3M1tOUBm0x2tijseir3RufeQVstdmO4S5GFCVAYxZqFWI
         C3pHlSGLxDG5Ge88qrZ0OJIFngI8xwVU+pXamyGMrZ40Rt0ZP3PWeqXpo1wiNduXr/Q/
         B6Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUJvZ30uIXmdeJxLqONtVN8S0uQ4u5lwPgDEHlbdRYeYaQrywtmJ4Z2pTBgFTw13Koa7hLschziKxS6rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAeKN8McgVRq8XdOktHHK6FJ/yRWaPGZ/V9E8jXjCq+XswB8Hp
	v3k7rscFZuVAvheHSRerJ31Fy/QvJwS6q3OTWNBzIxhZSNH/RuClRcSPymu0zg==
X-Google-Smtp-Source: AGHT+IFTGsrShBjgM848OqL1CfPKk91R3Op/+31v6HbDQXfgIAqpr7uyzdwQGXGarOa1YbiIhfrByw==
X-Received: by 2002:a05:6214:4347:b0:6ce:266a:85d5 with SMTP id 6a1803df08f44-6d39e14f151mr369822306d6.20.1731611450688;
        Thu, 14 Nov 2024 11:10:50 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee7cc7e1sm8857766d6.53.2024.11.14.11.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 11:10:50 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 19:10:35 +0000
Subject: [PATCH v15 06/19] media: uvcvideo: Handle uvc menu translation
 inside uvc_set_le_value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-uvc-roi-v15-6-64cfeb56b6f8@chromium.org>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Be consistent with uvc_get_le_value() and do the menu translation there.

Note that in this case, the refactor does not provide much... but
consistency is a nice feature.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 77f7058ec966..c975e0ab479b 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -939,6 +939,8 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
 	int offset = mapping->offset;
 	u8 mask;
 
+	if (mapping->v4l2_type == V4L2_CTRL_TYPE_MENU)
+		value = uvc_mapping_get_menu_value(mapping, value);
 	/*
 	 * According to the v4l2 spec, writing any value to a button control
 	 * should result in the action belonging to the button control being
@@ -1988,23 +1990,23 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		if (!test_bit(xctrl->value, &mapping->menu_mask))
 			return -EINVAL;
 
-		value = uvc_mapping_get_menu_value(mapping, xctrl->value);
-
 		/*
 		 * Valid menu indices are reported by the GET_RES request for
 		 * UVC controls that support it.
 		 */
 		if (mapping->data_type == UVC_CTRL_DATA_TYPE_BITMASK) {
+			int val = uvc_mapping_get_menu_value(mapping,
+							     xctrl->value);
 			if (!ctrl->cached) {
 				ret = uvc_ctrl_populate_cache(chain, ctrl);
 				if (ret < 0)
 					return ret;
 			}
 
-			if (!(uvc_get_ctrl_bitmap(ctrl, mapping) & value))
+			if (!(uvc_get_ctrl_bitmap(ctrl, mapping) & val))
 				return -EINVAL;
 		}
-
+		value = xctrl->value;
 		break;
 
 	default:

-- 
2.47.0.338.g60cca15819-goog


