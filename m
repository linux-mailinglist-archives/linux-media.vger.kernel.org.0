Return-Path: <linux-media+bounces-23644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFD29F5863
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 22:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77E6E18933BB
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCF31F9EAA;
	Tue, 17 Dec 2024 21:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UHNK5P0u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BEA1F9AB2
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 21:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734469626; cv=none; b=ML6VeiuEspcq1TA684WFCMe7iHo4yEcXq16dSUhck6yCo54IbWrZixlFzWZ7eM4ki9kznOFIcOEBlQ0+qgMJg+eSgtvkrX0gvpkGl4w43OhbkdVMcukSpRJ0aJajCvpuRYcawJa4UgChlELJMOKo7dESCkHmrrDf/Ud6aH+vjaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734469626; c=relaxed/simple;
	bh=TMV/gS+pZ0eeGBOV266PLaY1f6B/qSj7zVYBiHN+BO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pFBqylrXW399IRGX2cvRcxqtAKqJ8pXK4m1dc8Uu7hLia9F22EFYlJ0Iqes5KI/WxITEelg2MYtOpAh1Y15QhszqNj9onGLuinU0oS/lBkDuU2yfN6MHTtrWgssRv/zkXVUyOIQEjiJGr0EVzbgb/CMGr4Pb8nZGGx1tr5fiLnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UHNK5P0u; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6d900c27af7so66088076d6.2
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 13:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734469623; x=1735074423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YaRXnJufUgA+sZgOmkVmsImy13QD0OXBethBAiDBkw4=;
        b=UHNK5P0u81QTCtcfRXwvvoYGD+vqqODGbdhZ8malQF6ZnJPejPHgGMeBagjks8zDXH
         Z6QOtwMmcSWsqmRm+t0r7y4W+AftOM+x1TfUrhh9HSSrXLrMZ8u1UILVoCft2IAhhNeI
         LO3H2/1pK7DBU3RwXYt9/mR8e8C4YYIR9Ul+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734469623; x=1735074423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaRXnJufUgA+sZgOmkVmsImy13QD0OXBethBAiDBkw4=;
        b=ir0pY9Y2j9cQK/+UKBsQwcU4Gp2fZMcRze4upS/AUSaPpU850948Zn9TbLRibH8s47
         cLzvhrUzBhXKzM4CZY5W/GmprhIWrf71xgkbBwFdWC9UL0f3XOExG4ASiMIVCh2Ii/qR
         d+nxO8Ntrq1NyAG/3T1AYisuodnFZScpPZRN9Q0ANlSkKP3mlOx7x7+ypMxSpVeH1VY7
         pS6jsi3R3WpOSjxsLq4Mqq04anFru/so/miKpti1hjXrTQdmqQrsFw2bPyuTqozsfLuQ
         vfX+b9sT1Sy8xyu5pPQLFuCkTlKLmdAnQaKFi3AElprhG4HILqBY2v5iZPd81Tl+zIpz
         kpaw==
X-Gm-Message-State: AOJu0YzM3qZ3qSksozpg2sLJEFGUBe+Kco3h+tCyJxRSbxXG+fkmMCN3
	RE0nOMe4m1Pxz08v4UZcvhnMJxR08B1jVEXsL5j3spOMvChhmBI+qxL++n2N3g==
X-Gm-Gg: ASbGncuWFoJkOp3chNmsBiKosI9SWXPnHkVw60OiyfXyCHZHOMaOKasbu8MPVcVcb5R
	scEnvtDEYTzsHcWSfx1EhbC9kst43ldGwR1jSL5MgKFtrHB9s0UmYBE5FQt91VZz6bkMSVy1fH7
	P6pDdKM9tl8ojWQQOpLfv+uvZrBrNd2WXYfn+cPoUvBlY0NcRc/opvwmMzOa08CTLx1TwbwpcDr
	Q1AxaTn2RW2YsdzPGZ+Nre4fD77xB0lmUSIw3d1IrOJoIXBJNyrdZtlXNahsxhRAPZ2xAYEyMIX
	DPpsP3jBTpEQr2PGrAgNhFqyreDhaY8=
X-Google-Smtp-Source: AGHT+IGEXrMxy1WDPRLI/fTTdd0pTFr9WF7IHUP8Q3LLmBM2sJDZT64JK/AWifyLauuM9iWm29j/og==
X-Received: by 2002:a05:6214:402:b0:6d8:9872:adcb with SMTP id 6a1803df08f44-6dd0923d060mr9539956d6.36.1734469623238;
        Tue, 17 Dec 2024 13:07:03 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd22f2a7sm42825276d6.27.2024.12.17.13.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 13:07:01 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Dec 2024 21:06:57 +0000
Subject: [PATCH 1/3] media: uvcvideo: Swap default value for nodrop module
 param
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-uvc-deprecate-v1-1-57d353f68f8f@chromium.org>
References: <20241217-uvc-deprecate-v1-0-57d353f68f8f@chromium.org>
In-Reply-To: <20241217-uvc-deprecate-v1-0-57d353f68f8f@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The module param `nodrop` defines what to do with frames that contain an
error: drop them or sending them to userspace.

The default seems to be to send them to userspace so they can decide
what to do with the frame.

Change the default behaviour of uvcvideo to match the rest of the
drivers and maybe get rid of the module parameter in the future.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index b3c8411dc05c..091145743872 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -32,7 +32,7 @@
 
 unsigned int uvc_clock_param = CLOCK_MONOTONIC;
 unsigned int uvc_hw_timestamps_param;
-unsigned int uvc_no_drop_param;
+unsigned int uvc_no_drop_param = 1;
 static unsigned int uvc_quirks_param = -1;
 unsigned int uvc_dbg_param;
 unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;

-- 
2.47.1.613.gc27f4b7a9f-goog


