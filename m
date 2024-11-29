Return-Path: <linux-media+bounces-22355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FC39DE933
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 16:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D2F3B21564
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 15:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B4F140E50;
	Fri, 29 Nov 2024 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4SoONsD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822355A4D5;
	Fri, 29 Nov 2024 15:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732893487; cv=none; b=TND/X/5k+uatMR6pGNM3olfjsjurahnH5vn3GscvN/mpa1s61rVBz0n/hyyqjynIrghqIBcTFsjXMqm/fSoJ9jXQ0bbPCWx1IB47VJMkqsozV0l7/DHbn0H/jUNlb3lLbz02r7fOhFyODARcQI6krG5fS21JgD99u8QnVZayGdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732893487; c=relaxed/simple;
	bh=Yb2gVHenwJRhK5FPsnY7yeRcPl8pDZtVid8vGUUOXG4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HNp9GniazYUFzpelq7GXybNRMu0d4lQQm14Ha/1SWS28JROTppkV4oIV70AYNdB+cnUfuAY9p3SdAYgjF85ux3/FexmIGh4L/zq1vhVXCz7eVQRNlFIPf5hFjeTyTDHXWaBih/oUVAZRNpEInB4K8FOO3JoELB4j4AvnXXs/jUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4SoONsD; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7250c199602so1672277b3a.1;
        Fri, 29 Nov 2024 07:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732893486; x=1733498286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DuACJOYzI5dREw1NaJp23YGQY6Cu1pZdm/B/azkQK2c=;
        b=H4SoONsDh+znXpDV2/KXqzVoij1CD9QgD/FZRw0mRDtUe9X3T4WbUKQHkgXLR18N7n
         HvxLQ5ud9PnB3rO0IcL84n5X0d+p8UGKgsOaF95iEuBaMreKCWGs7P/d2eFdZkDoZcBP
         tPnS7fVqXZSSOs9jP7v4KIUJIhUagTuK8GRIhCtvYmkSIiLoLsksOfDx0kNW2stxZ51d
         WoIMqDRlk8+yCU0IAwHLgjWoZqeO7A7L15rQFmgz/SZyGoXa2yNcwMpVRjhQyPjvft59
         /c9GwcBk96+E+ThyW50CxgiJ1XoSgNw3XN97DutPM2jgycR7vpr1lA0PghpwBxnqv1Qr
         7Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732893486; x=1733498286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DuACJOYzI5dREw1NaJp23YGQY6Cu1pZdm/B/azkQK2c=;
        b=uu5KX3+XwkMnuwnyJMCQM7MJQNjTtBtfpqKANnDE9KhLq9vm6g0tvyOdLOM0J6SGt7
         bca//PVoRIKMmuj3Itg7sUkRuaEpVQEqbN4Eh2969ZQXq1ZgrWZ3LV9AUMiKOEzvYMu8
         AJyr0E5CDytPZQ0WsP/7NLLT0AJ69ZvlxRBSCVz2HO/2fSHbre4g9/CeiHnMMyQ1A4Um
         7JiALdOV7zcATBLmLDRtAlZAoHZoeySgVftPVNfI3GuQ2IxIIlIJgtg0NiIFW4PwR5RV
         qrKJ8yqz/PlfLNfC9vumbmWZDGWmqN6mnsHkv7h5USTfUKaizCFJQ3SGcVA/hyJkZqh2
         OGSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUicBBswLfGMzzGB1EFekk1YM2KnblqEgIw0YtqqELGDOECTjHtACixYq+NT7Le1HcjICUKDQiMtec7NA=@vger.kernel.org, AJvYcCVm3A9NuzGlI2rF6iv8s6E7cgUGJl0vTm4+1oset0aS8ilYXtPgJQyU71qW46NgS2LHcU+QDrCSXX90j0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGxulc+x1aKraWSnol0jVNQcYiqNV4tuMcRJpfulzSmtz9U5VX
	EA+W3dShptY9HdDzHueOdUBWuv29ohYdVQQnAg46dooigWbSK0jE
X-Gm-Gg: ASbGncsPXBsh0IN7LKHNdH+DvqOK8WWq9rS12pCSrtidSe9NiRn7RGySj+x4AArBbKm
	K5sHeUuyGl4Z7ISvmXFbp4iwO9pszp00W4ZyX9MHv8axrxdfdgreRvSNvl8CzO1y0+HWJUczG3Z
	Uw8n2xtEQzFLDZtWh8H/DmBiBAP2pizBF+joZouCNXytrdDx7IsGREdBFr85idFNFI3zGys1ITV
	6Rw/KyscisRr2fv77IAl4mJByVxVEQxerWvDkIkOrAXU3aIbmS+lm/ltg==
X-Google-Smtp-Source: AGHT+IHPTs+Y8vwUfzcZTL14I0BvZXqIfGBydOMYS+uRq/lsJx5B9J52xSyNb3gVOncqWcH+PtiBvw==
X-Received: by 2002:a05:6a00:1956:b0:71e:8049:4730 with SMTP id d2e1a72fcca58-7252ffcbcf2mr15709438b3a.3.1732893485631;
        Fri, 29 Nov 2024 07:18:05 -0800 (PST)
Received: from localhost.localdomain ([123.114.6.245])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7254176fd7bsm3590612b3a.73.2024.11.29.07.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 07:18:05 -0800 (PST)
From: Xiong Nandi <xndchn@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Xiong Nandi <xndchn@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: uvcvideo: Use uvc_query_name in uvc_get_video_ctrl
Date: Fri, 29 Nov 2024 23:17:23 +0800
Message-Id: <20241129151723.48275-1-xndchn@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uvc_query_name was introduced to print query name in uvc_query_ctrl.
So we can also use it in uvc_get_video_ctrl.

Signed-off-by: Xiong Nandi <xndchn@gmail.com>
---
 drivers/media/usb/uvc/uvc_video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e00f38dd07d9..93cacd2c8721 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -297,8 +297,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 		goto out;
 	} else if (ret != size) {
 		dev_err(&stream->intf->dev,
-			"Failed to query (%u) UVC %s control : %d (exp. %u).\n",
-			query, probe ? "probe" : "commit", ret, size);
+			"Failed to query (%s) UVC %s control : %d (exp. %u).\n",
+			uvc_query_name(query), probe ? "probe" : "commit", ret, size);
 		ret = (ret == -EPROTO) ? -EPROTO : -EIO;
 		goto out;
 	}
-- 
2.25.1


