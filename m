Return-Path: <linux-media+bounces-22443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7679E04D0
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07F7716131E
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354CD204F69;
	Mon,  2 Dec 2024 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="euxp1nGC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A61204085
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733149487; cv=none; b=R/6Gy191gGjSvWaXxvSgwqrKqSCciGGoOETQCyy+8/yp27rrNKAOKJycFWnlMAt2YvvYaIQQEdkaqNNDWC9a1i9KMCNhpT/bpZFEtNOKo/l4byqfGGVIX29Hvm9EZhvW6PqiUrJdDQpbMVZg9kQlUQvvPVBeGDcEYSm7mkfcKSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733149487; c=relaxed/simple;
	bh=8mMTjvFDHU6qYXM2tU7l/cSNhCgi8jgy/GoXdIYy7Bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UbZ98dipIOWJMz7Uv4UIO1yurApyLmQjbKqbOSpEQMNybizVe3i9rixdWll4cFnApnfaXsTrTWVNeWNIK3/2Wt6IQAZuSavqndUEvXf+Dsd+HkcMlQiZjq/TIY8ZNfd5nYyEYlICulS0eOXjhPrCOzKSxE6fx4BbMT13n2HTRB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=euxp1nGC; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-29e579b9e9aso776816fac.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 06:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733149485; x=1733754285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnebE8+2v8qetjaorjvm129bKYEMI0HgfTeiXkJjeWc=;
        b=euxp1nGCpJVikS6tJR+UYnjxcGljnUZZHWa/D3Qccy5qI1ykMNw/WqDQvOJNZK2S6j
         EW3C2akjxZfEBoR86F8YRRa1NBIUe36o4mlcALR5enr9tNStkn7qTEmuJ/OprEdC1w+f
         87LdhZxTTh+3+LD0kDjd1R7oGe26AZ1qahQ2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149485; x=1733754285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnebE8+2v8qetjaorjvm129bKYEMI0HgfTeiXkJjeWc=;
        b=nMXh/WjYS2EE0nwt/FznfAJvpAtNmHKNTkr3ZOPgjfLMbiWNSNpMI0FXmn/6rVT8bH
         oGxEM2cM2EeoTqFLmpyrKynDGmREPJmOKgzmw/1KLv2+bLYoePf0hyH428xAziMNvdcv
         5fgDi7h7aG4YpVSZmoUdF2I/HubOUGlsK83ykg4mUlxrJ3srhdR9Xw3AxMc3L453lzlG
         Za9PnkZnVnaR2VjhRJ2sKcRYef1nuinLmvs9cTjlz6wsEJ0DFWZ5h8CSQocMjoXy6dEF
         UIBe/XutTToHJqPZaVsNUraIVUTfJ5SMmG3vpiYGdHgY46b0PqNSPoXBFlmU0XYwp1AW
         E+0g==
X-Forwarded-Encrypted: i=1; AJvYcCWcENFK+hsdTpL7cj4JwrfDyKuALe9IFmfx2gQWpcBsshpS5yW3tK6t5ZuqoPUmDv0ULrddhwfe3J8+/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDoppZuYaHMXdhrNvpIY9o4yWFXzMxCyzaZR8pVKk2sCsToYtW
	aBwdcIbobIcjVYH1AzxyGJ8ntSuPiIIP9jsaTC7on6wobs4qaRlRLVDl9SBcVQ==
X-Gm-Gg: ASbGnctorIR8bpfiN0HCM6fsTIwmzoI0wx5eD9aOBpYuVtAXuP/fbzZNHJEQ15WezoA
	YP4048vqxTAlN3E2krL2v9d1eJk9DHiucoTb89PPCmyMRpEY6ceHUFXX5ztJo78cTGkqsGu5Asm
	Qz7Lxea7BI0r9MXi/D2iu5mrnlvMSGGlKQUegSa2BitMLEWZkUVgN9AHGH1K1tA4lcj5At4aKje
	mohx4fO97s9VwTH2RQqUQ9wYFQSJYcbAx2aKfwjydfevVZ3nwHramkSR5ln6Sjbnf+aYPQVJs7i
	+hrHs7Q7LfyWB9VHsrE3o36z
X-Google-Smtp-Source: AGHT+IG8wtRsazkhHnoGNG6oh5veDC6ueDZxet87nom+g1i/pY5lzKPixDtX55T/kdnxYkUvhY0dZg==
X-Received: by 2002:a05:6359:459d:b0:1ca:a872:e461 with SMTP id e5c5f4694b2df-1cab15854d1mr668540455d.3.1733149485090;
        Mon, 02 Dec 2024 06:24:45 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85be9087890sm179710241.25.2024.12.02.06.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:24:44 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Dec 2024 14:24:37 +0000
Subject: [PATCH v5 3/5] media: uvcvideo: Annotate lock requirements for
 uvc_ctrl_set
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-uvc-fix-async-v5-3-6658c1fe312b@chromium.org>
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
In-Reply-To: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
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
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index af1e38f5c6e9..576e3854be91 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1980,6 +1980,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	s32 max;
 	int ret;
 
+	lockdep_assert_held(&chain->ctrl_mutex);
+
 	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
 		return -EACCES;
 

-- 
2.47.0.338.g60cca15819-goog


