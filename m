Return-Path: <linux-media+bounces-22175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C23389DA796
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 13:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B3E3B2DCA8
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1F21FA856;
	Wed, 27 Nov 2024 12:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X5pAqEZf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BCC1FBCBF
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 12:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732709701; cv=none; b=V/03hckG6mjsRt4UAAcy96f14GiBb298yuvjYiLAfg2WO3oKFz1CGETMjvmOjJkWyVPdJLmoHxxYnGAoWHnjzi2wy8x0HMiWPQqZ901wJ+EzxVMZzKM9/UBi5FVzIc2G3U/FYlpVBpFt1qNFxMSv1drtQmi0qceYsjzfehRXd7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732709701; c=relaxed/simple;
	bh=VcsvfSq12DS0fnYrIgZKD+Xjd35yhix6s3hD7aEJjAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YbtjoqIQu4DzKBOBCKzc0tdLMpbSTVOoTlvrcgoQApIz3LOSSk6Hp+BaRKhoqES/iBeeAU8XXRczTPPxlkOZIayibGa+jpANAmxLmaeXhHoIaxrMbAYYJAdOCjC0+euDxg9UEBWEQ+9JwGZGuXkr+YODX8U4iJHP5emj7nyICEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X5pAqEZf; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e3882273bdfso7071393276.0
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 04:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732709699; x=1733314499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nuXBj4+Zy+PgIyL5ZNHJXV9meQjmyhtl3lnhIKUIXQ=;
        b=X5pAqEZf+zMnnErlWNuJLro7DwZWjwm90MDDu+qimjLlhAqD3eNN/YTh60zN5b3fIE
         /1wLi+vhJarn5TqgvKjIA9JG6nmTvDqB24CRYDzg77tkElUi98gSnSaP+IyzC2kJc/Kr
         SKagbPKh5/ap8i9jcKQ8xySS0ZXLNkTSvrqUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732709699; x=1733314499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nuXBj4+Zy+PgIyL5ZNHJXV9meQjmyhtl3lnhIKUIXQ=;
        b=wUDZIXZ01J457fa/4aBnGueijBstUimgX9Q4WglJl9CC6we3OAm1aZYvFNFGcs4lNQ
         8qzyAKsHLaqeWyVVkWi5gol75IBP/tVUuEIMNhVnAZlFuTh+pgTN2zuOgW8vwMhEPlMq
         MFzdrQheZXtSB09WFTW3UI5CPFZe6WVmWBPvlDyPEoThgY8eR9QClQ5ezAWf8ICfxM5K
         gbcGGwGFuQjNSSv50erYu+bGQXi9eF7R1M+XOoEIGAybnbgjCfBUCIp6sbYdrH6DSgkL
         2u7o1rwc/TBjYMeeMEJzt/O49prG6n9yfMuW7h5+Ytq967ze1Ev/vPuum+Z1odE6MJTi
         sBUA==
X-Forwarded-Encrypted: i=1; AJvYcCVdyM/WufD7BpF6GCTPsySlTKJA93ZZzO6jepgw+9T0IDI/dhZmA4dUzefzLbUsYuKySLEN+XXuN48WeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsXKQcriSKLPbKA0wkqj54yx55n1POwQW2dOg4wyaKJK5nnHVN
	tH3QM9dC+DPaI3Xea/9E9n2Y38ng3FaZhgl845Ing3Ug8Nsd02aOlWyUyCIWGQ==
X-Gm-Gg: ASbGncsdDhJF69yWJQxWwO2DZXr/0Ea/qazTj4MhMC/ZXxoK+JKdDa4YuGI5VFH13Mp
	C3c6fTCJq4MpHvxNqGgpDkn7YcyCBZoKMiKxGYtNoz9waRAO0obd/+J4Dgdc4RoNWUmCy63+jof
	j6qMI+uwTVj1fiFQj2hBGG0HUyZwzYSmN0t+ko+NYBi3p088DaG83zDjY7j4NM830Rbz+WaFFlk
	7Dz54XaAzpzGYCFYc6lu8F1kyDK5XqU/h68ocMd+zmWRueu3YF1UmLJjenZuNcXYY+gEoili0zT
	J4zc9vGCB+Jm+QfhvQcJqby4
X-Google-Smtp-Source: AGHT+IGLxdpsvDUuDyS/a7VxdrSBPvc4g30hV96tMr/MAEAPEAJCmKtRun3PxzyerPPec80HnLUxYg==
X-Received: by 2002:a05:6902:f81:b0:e38:9b5f:58a6 with SMTP id 3f1490d57ef6-e395b957461mr2580029276.46.1732709698809;
        Wed, 27 Nov 2024 04:14:58 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-466be77cf7bsm371171cf.89.2024.11.27.04.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:14:58 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 27 Nov 2024 12:14:50 +0000
Subject: [PATCH v2 2/4] media: uvcvideo: Do not set an async control owned
 by other fh
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-uvc-fix-async-v2-2-510aab9570dd@chromium.org>
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
In-Reply-To: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

If a file handle is waiting for a response from an async control, avoid
that other file handle operate with it.

Without this patch, the first file handle will never get the event
associated with that operation, which can lead to endless loops in
applications. Eg:
If an application A wants to change the zoom and to know when the
operation has completed:
it will open the video node, subscribe to the zoom event, change the
control and wait for zoom to finish.
If before the zoom operation finishes, another application B changes
the zoom, the first app A will loop forever.

Cc: stable@vger.kernel.org
Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b6af4ff92cbd..3f8ae35cb3bc 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1955,6 +1955,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
 		return -EACCES;
 
+	/* Other file handle is waiting a response from this async control. */
+	if (ctrl->handle && ctrl->handle != handle)
+		return -EBUSY;
+
 	/* Clamp out of range values. */
 	switch (mapping->v4l2_type) {
 	case V4L2_CTRL_TYPE_INTEGER:

-- 
2.47.0.338.g60cca15819-goog


