Return-Path: <linux-media+bounces-7914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE50188D8CD
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 09:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6599C1F2B25D
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 08:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C25D374EA;
	Wed, 27 Mar 2024 08:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jkP+KvMh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B46339A8
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711527894; cv=none; b=P/MENBlFj9wiaPPeJ5VBiaT9SUV2QCEfW+7Zo1jWxMHA+RqTSR8ePZMy0LAM2hzQ8XQq67EQ+JyTtp5CO+vm0d4zJ+Oc5rwLOKsoT+/OX3cxBopAw+iHP2CsjUf8rT1GlHT3XXxYMkTPH2qgqcl3NIp6INtib7SWrG0n4GTXGXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711527894; c=relaxed/simple;
	bh=bRmG+R4WpzyKvUI1uUWRSJ67hIlvwT6pr/FQGV/U1XQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bcQfxWUbELhB1cGbV/ZzfZY3AZ6i3uwYOHY/hILnvOTqIS2/ugBL69117Ov1wMX4QhHA4loclat/X4mOX9eoNAmzRG8S2xVX7MLd36vlAMSIk/6LaCXobmQ9PD3MW3ZCi7lh6QLT8bBtKNs+Ah2rVJiwLOEq1AWRiPeFUPUVoc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jkP+KvMh; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-429f53f0b0bso42773601cf.2
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 01:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711527892; x=1712132692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q91fMluof7ru1htcNbZ7jN0/AlY71gRdn67Zo4X/cIc=;
        b=jkP+KvMhRa+iIrcyrjHIyHuqg1kadBEvLfW7cBoys16ubuivXLDfWkCqhkC2RdhIp1
         DfvHqqqKr9LQdEAs7M+w8khg8z4E/V1zFFw+LWiDntjTsNm3yt1U2vRBoUvu2LVPM2Bh
         3o/RZAdqWaNZslHNOb/nhBduu+614DoxNh0eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711527892; x=1712132692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q91fMluof7ru1htcNbZ7jN0/AlY71gRdn67Zo4X/cIc=;
        b=wB81p48OzMUYCD00I7sB7Z0/48cybRDykoBZJ9/Pb9NsZNiB51oBXQFArk08UGkiIZ
         civRAXJkNFB8AX9AYtqSaNUg+pFX50ygp9FWNTG8Z5ZH+nnVfs3aLKDE9rMtJltJwPoq
         SvGeeXWk2pTv2RtFJ93mohguYnwrWvtCNmo2WCoAQjo6dMieUAajRO+9eU5A3xvV7YQM
         WaaFeV9lIX2joJ0ECSH5tvTnXioUjriT2qfttDCip4EZDsajTzQ9W9AurAEkkqgu5ObG
         JnG3eFHASt1MjTNg5E38OlvE0SM8NNg2MIb+jaoduRGfr3+fZw+BXgkMIiJtXBF/C32J
         lPYA==
X-Forwarded-Encrypted: i=1; AJvYcCXDNwFMqHRhk56xNWeIIE8zA9PBQ9r0mSeWtkjTxMe33aqLG9nKLgOYUjzzpmFO2B24qh7gotk1HLvftPRf/fZhrV0fF8+dHUH0bJU=
X-Gm-Message-State: AOJu0YwYyOPiubYsdJ9cMWkW7qDYc4OHs4B2+CBzKMw3edorApM0gCKX
	fCF586WITiHar6pl+Wx6pJ2vWl9tFQZLu8VvWPWLHWTocGchwfrCWybs0uUdaQ==
X-Google-Smtp-Source: AGHT+IFeyiFHPVw9YcXiAwhqjUitPd4tkGsUFvfkwVfV8A2FB+olpwurffx057UQmDPwxHVVXdKZRQ==
X-Received: by 2002:ac8:5b93:0:b0:431:5e50:ac0b with SMTP id a19-20020ac85b93000000b004315e50ac0bmr3849716qta.3.1711527892288;
        Wed, 27 Mar 2024 01:24:52 -0700 (PDT)
Received: from denia.c.googlers.com (131.65.194.35.bc.googleusercontent.com. [35.194.65.131])
        by smtp.gmail.com with ESMTPSA id ca9-20020a05622a1f0900b00430ea220b32sm4581691qtb.71.2024.03.27.01.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:24:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 27 Mar 2024 08:24:47 +0000
Subject: [PATCH v4 4/4] media: uvcvideo: Exit early if there is not int_urb
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-guenter-mini-v4-4-49955c198eae@chromium.org>
References: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org>
In-Reply-To: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Max Staudt <mstaudt@chromium.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.12.4

If there is no int_urb there is no need to do a clean stop.

Also we avoid calling usb_kill_urb(NULL). It is properly handled by the
usb framework, but it is not polite.

Now that we are at it, fix the code style in uvc_status_start() for
consistency.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_status.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 8fd8250110e2f..9108522beea6a 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -308,7 +308,7 @@ static int __uvc_status_start(struct uvc_device *dev, gfp_t flags)
 {
 	lockdep_assert_held(&dev->status_lock);
 
-	if (dev->int_urb == NULL)
+	if (!dev->int_urb)
 		return 0;
 
 	return usb_submit_urb(dev->int_urb, flags);
@@ -320,6 +320,9 @@ static void __uvc_status_stop(struct uvc_device *dev)
 
 	lockdep_assert_held(&dev->status_lock);
 
+	if (!dev->int_urb)
+		return;
+
 	/*
 	 * Prevent the asynchronous control handler from requeing the URB. The
 	 * barrier is needed so the flush_status change is visible to other

-- 
2.44.0.396.g6e790dbe36-goog


