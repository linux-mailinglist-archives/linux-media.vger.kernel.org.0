Return-Path: <linux-media+bounces-22570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE969E2DFC
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 22:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A536163564
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 21:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECD920B81B;
	Tue,  3 Dec 2024 21:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EHUBukod"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515DD20B803
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 21:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733260830; cv=none; b=GF5b/pWZAUO5a1026EKFHNt7LvwF9eeziJIcD7h905Jo2jPA7iMfdvInuTcrpRgRoalIN5OcWzlvqmuiPoBGGODqq5tJMkvEozlxxygYOZ5rI6FjHbM0VNp+Bttt8qEnVXV6bHeGZEnCWHU7xH8q/nKHL5eY/ECseGRGwKUH2qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733260830; c=relaxed/simple;
	bh=9X5eIMvV46W8qWA8ZhdVfchZUxJMWj63sIIb96EFcB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B4o1QZT8QiOlyxCWDWIW6jTWZWdzluF2xICk1wphbOPB2bt1/KYp3vjlN5fzWII4FKJezjSIDnERNokTx+VOmWjkMjzy5nBHlJq1OcGGptxqXCNmMdwGvvDsPCYUkz0+8rYVRV3k7KabeZlLSFsY/kG8hQr4sBPG6TiIMeuZiTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EHUBukod; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4af09420293so1910804137.1
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2024 13:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733260828; x=1733865628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uy+WksCKY0gvDpLPtmZnEMUkklb+4A0f37uyRA+CFY=;
        b=EHUBukodyLCUlXFgla1ljTvMtqfT0HDw6Pqn1Ma+XA0lgBvEOPgeV+itcdpTDLE3YD
         ja81cqalQCJJmOYm17L6Z05FtLHpk+FdjQwv1XJqsGWRAqIQC3U4l4FdYXaGFjE0Ftgb
         dTETW7f1RH0f89JDYP/abGa66MrTx2UfDocoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733260828; x=1733865628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uy+WksCKY0gvDpLPtmZnEMUkklb+4A0f37uyRA+CFY=;
        b=IHSP22MSB9hR/VlGDM9ZGYNBBea/sWl2cw52iJElK29g+TGpxiPiMbf5XoAqDCJmfg
         gbv5S+hzx49sFZmEL8yFODkf7skJbaQUbRsuF+ZQFv/xDRzIFvjnAozQaOxFAPTd8ytI
         r3ZHeNRlEwFLU/NFSuKwpXlYpfAR9QkUMo7xtopMQWz82TgPEFmrml4ET6F7erART3HO
         FZHWPdnYoRsNweJ8XiQE9R/ojFamD5gbSPvhLcAHGPmfQGPLQLV26i3lW5Jb62+PlkmJ
         PgQH5lMuqdA8FwbzwTQdGcVUwcP+kYUwkPHLQmn8sQ59JBkRIUH6dE0P5fA5mF+PUPB5
         vqqA==
X-Forwarded-Encrypted: i=1; AJvYcCWLQdFowPB1s255wLdN8ECgWtdOHWzVgvs8Vs/X/d2FWTg/OM59SBuf2mLAYMz6M8fA47SBwcSVRH3TAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpZ/mXtKPsE7hVGwlcx6O59P0NwCnqHyMBJ670ihqTS0pHs4NH
	WsXOnKioRh7EFlLPhi82LfbnDXbw5B57IuGqDua37rjToHAbwONwtlj2KKktOA==
X-Gm-Gg: ASbGncveFDAXe5RBzpXqsuBoDrN0pMqe2L3Nxq/gaaDYQnug2AyXhJFIoC+gCMONoP/
	4ke3CZ4r0XQgTPKSE+ktJhEFaZH/MabSJM7WSFItApAD/s7P2zuSk727KcUZXESzCkXpGvBObL0
	iXw3v/HFiHavrhxmjSHUey7KEPxh01yIEA5Y/bazJJOypp2OZfGSh8uTg9x9DTZCYPzgLu+hHAl
	fT4oDs0FjfC9pHvy+spCF7zor6ZHg1vgLCeklXNJpEdz5dFSGlurE2tPnolCf83iB4UntoCp/YR
	CxYakP2wgOiS54DQJSDYEB8x
X-Google-Smtp-Source: AGHT+IHRabdBjEHecDYvRcDdxhxnXbNb23cpwrgd+owBsDEQqOzvydhJ6thhewZyJGu/Nbu+3cfgmg==
X-Received: by 2002:a05:6102:9c4:b0:4af:5f6a:e73f with SMTP id ada2fe7eead31-4af973111b4mr5826942137.24.1733260826831;
        Tue, 03 Dec 2024 13:20:26 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b82a89d5csm2140364241.8.2024.12.03.13.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 13:20:24 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 03 Dec 2024 21:20:11 +0000
Subject: [PATCH v6 4/5] media: uvcvideo: Annotate lock requirements for
 uvc_ctrl_set
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-uvc-fix-async-v6-4-26c867231118@chromium.org>
References: <20241203-uvc-fix-async-v6-0-26c867231118@chromium.org>
In-Reply-To: <20241203-uvc-fix-async-v6-0-26c867231118@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Make it explicit that the function is always called with ctrl_mutex
being held.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index def502195528..3dc9b7a49f64 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1981,6 +1981,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	s32 max;
 	int ret;
 
+	lockdep_assert_held(&chain->ctrl_mutex);
+
 	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
 		return -EACCES;
 

-- 
2.47.0.338.g60cca15819-goog


