Return-Path: <linux-media+bounces-23006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0934E9EACC9
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CCE91613AD
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532462343D5;
	Tue, 10 Dec 2024 09:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PLz7bCwU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E9B2153CC
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823778; cv=none; b=I9l6257Yg+aDTt+MVvpc83BgYu/k0Ha3hW0IWF6blYY0n2axF3P3R8dTKL0ACrbw7PC0w4YJGB+R3kgUkECAZ3swUhjtrLZNMhDCUNG95k6Iubt+MUkxq8AYw1Whix+KiO0rMPt0tnY37ixx+Sl7vDGaX1xA3cbHSjXsMNLPKXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823778; c=relaxed/simple;
	bh=u449lsO4Hxwuzsi+uevB0tOEaOX42zxpyNVYt6QiE+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pjGRvWgJmc9wkv+tGRguZENpTblghnokdC31M97r3rm1pKtHyyBziXulk1vvAwTKFhVal/jS7dLT/R1rl7v/6+1rJoVFxpmoJ7xIX+boysrOpgLu8usisc1zR+/iRt/fJwOq5/KUw0zPalOcN20Q5dALdBHtnjX4ldaJpK3aYAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PLz7bCwU; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-46753242ef1so34989241cf.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733823776; x=1734428576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWfbsZInLShg4gyqs0rpMPp74K9ThJEcDiTxSB3xYgo=;
        b=PLz7bCwUPOjzxNjoeP4Zhx6RcnEpz6azTb0zg1/H5aVLr5fPrUKaZbzYNebuPZQrmO
         /AtSsiJY7cUyiCcvMXyR0aG/m9OoQ7PHBiyMOQcsDsvCdaKgF/+qiAdbmDJG9466jo5Z
         7Gft6p6Y5qQHem+zOsHlvz9CzAuiqG7kb39xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823776; x=1734428576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWfbsZInLShg4gyqs0rpMPp74K9ThJEcDiTxSB3xYgo=;
        b=qiDVB1VIkXLhDw7fvhxaLULjmKhmb07fdFBtEw7ti+js/3MMWEtSF9q4WK/1n4Ggj5
         5dNOG7bNgUnTybOxJNiy8AhVIfb6Z0cwJVQfXtcf5++LmNUoZPa07GSPRA6R2H+oKYBV
         mAfscFA7z7p3xRfRUt6aOvPs2bF+4HBoKSQUaholk8m9RFPfHGCNa03mWnFbZXyNDQ85
         yPiei8meC1Adv9Q0IN2FAgNFBSU1rolPpeAf2YpX009UFxHCqZ2TTezauZDEvknSx+Wj
         o/Q0Op6CpkiGV0hNwXkyXd2ENr+STiFI1xoYVicotJZTbzh/Pk4Iuq83nY9nJQ2F5mMH
         KpNw==
X-Forwarded-Encrypted: i=1; AJvYcCWzSZ6jNgv/GLT7Q0ewoWFHOpM950I/nOj7kLxhPYBoOtx2+8gLSaNQEhO/aTNxE33el692sSNJhostFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrYFyUautaVfko5U4KXsVtZywIQf9lzaKR7mjJAwuBtM1LApEw
	96IwzjZI4xjU5umvhoNXLJTPI1x1zegOtYhJC6c0/Mqf6hdGYp/21xJgu+IRhQ==
X-Gm-Gg: ASbGnctiqSFvJtyJSPeqd7gKaHbLAfn/q7XcSSnm/dYby42MvuF4OXmPtEGcz0ICB/B
	ZGAaauwTQu2TlAzVlekzCEhM5cTKgs00EAZA/vs3jV7HqRr1hRwhLHwgiqJsKH4uTj0Fsal6wnX
	p8Wwx13ytcGXM+0EtmtCjgFpxJSuGd+OW4dSa55E4RWzyiKt+8R4mm+0TGcpI0ne6jRm/gAYJ7o
	q5Huz32TDkR/Y7O/oLrEpZUeq/uLApgGuErvuhDJQP5y5kG2/Obc/dGzJMJHx4NzUEnLzVdbg+X
	rROh5kijiMmpf/ZGpBmLU1j35rBl
X-Google-Smtp-Source: AGHT+IGuOmp0WbqkpDp2dV3LPmaXUEWbDVLaY4faBYplusjjW5QMSEy+Ggl5P5GPgFHXeQMWUS+EDg==
X-Received: by 2002:a05:6214:5087:b0:6d8:8d16:7cf3 with SMTP id 6a1803df08f44-6d91e43ce55mr65152556d6.40.1733823775842;
        Tue, 10 Dec 2024 01:42:55 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d92f7c2bc1sm773326d6.83.2024.12.10.01.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:42:54 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:42:42 +0000
Subject: [PATCH v16 06/18] media: uvcvideo: Handle uvc menu translation
 inside uvc_set_le_value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-uvc-roi-v16-6-e8201f7e8e57@chromium.org>
References: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
In-Reply-To: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>
X-Mailer: b4 0.13.0

Be consistent with uvc_get_le_value() and do the menu translation there.

Note that in this case, the refactor does not provide much... but
consistency is a nice feature.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 77f7058ec966..987a9700bed9 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -939,14 +939,22 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
 	int offset = mapping->offset;
 	u8 mask;
 
-	/*
-	 * According to the v4l2 spec, writing any value to a button control
-	 * should result in the action belonging to the button control being
-	 * triggered. UVC devices however want to see a 1 written -> override
-	 * value.
-	 */
-	if (mapping->v4l2_type == V4L2_CTRL_TYPE_BUTTON)
+	switch (mapping->v4l2_type) {
+	case V4L2_CTRL_TYPE_MENU:
+		value = uvc_mapping_get_menu_value(mapping, value);
+		break;
+	case V4L2_CTRL_TYPE_BUTTON:
+		/*
+		 * According to the v4l2 spec, writing any value to a button
+		 * control should result in the action belonging to the button
+		 * control being triggered. UVC devices however want to see a 1
+		 * written -> override value.
+		 */
 		value = -1;
+		break;
+	default:
+		break;
+	}
 
 	data += offset / 8;
 	offset &= 7;
@@ -1988,23 +1996,23 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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


