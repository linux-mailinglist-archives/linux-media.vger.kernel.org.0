Return-Path: <linux-media+bounces-20030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F9A9A9C9A
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 10:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C90DC1C23C17
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 08:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4107D16132F;
	Tue, 22 Oct 2024 08:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GAwhu8DB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF1F80BF8
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 08:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729585836; cv=none; b=LPxrdlD/Tg8DOyiURJxq8f9uv9X6CEiZnBvH9TkJxM1eMgSKzsMRstvdC8DfmmRqK8syW9L6/QB7O92YlqBWEgyvhP2aTUfjDteBG8GOBnKaMQGhcP09/DR7BF3I7giWVkgLfi6cXlAFrY+M6it0k0s76NsL0M7PRbFZ1yuRsJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729585836; c=relaxed/simple;
	bh=ABrP2T7wExOQyqkYpNLKLmOwDqn1+TlRIsQ7QCM1o28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UHGC5Rywaxi0+UWpJ7yAr7i+w6A0aUaoPLVZvmFERC+6lJ1vrSQEQDF7TdJEsggqPzolYPX3Mz3OnJ1pwlr51hJxuvfvqL1yhOtaOFfIiWpQgHREbcuIUK00EYfF+O2APAHO0+aiF3yGVAW2URCCEtyxsLuiSjOpFRZ9PjiDaTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GAwhu8DB; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6cc03b649f2so37299996d6.3
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 01:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729585834; x=1730190634; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jE1YL9r21lc0YZaBKWTuwm+nSpuAMUC4CZUF3FgCHiA=;
        b=GAwhu8DBliN+pMNHnyQv5jQXpVQm5egMXqj90kiofgpoCH1l96hv++o5ivPSZocZqs
         EQ16k0FYEsQ4mdK/9wfgYAE+CV1YtNNInHIg/z13W4TMqUOA3qZdpVhRK4Ey/xZM3fB/
         w24CMpSd49I3OXIFRkMPqvAfII5rv2tPgwYlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729585834; x=1730190634;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jE1YL9r21lc0YZaBKWTuwm+nSpuAMUC4CZUF3FgCHiA=;
        b=SQQ2ekezqvOwN/iTpDQ8GF/oFXSrMxZNdwk1rSVnr2qkgRzBxhcu/85tZg6LNytG+O
         kyCaCoZMhYYqgIKpk4CWvkqY1pngLWOtWs9bYYF1EjC93dZgcmZ20NKinGNUgFWwZleX
         iXdbtnIg/nnPddrov27JrtfQwuCP5W3xtdL31RvqsSlHfRFHYN7rzqx8rGXPBi07XvZ8
         g5drk7CBw1lblU7um5+QxEpgn0c2tj2/lFic1yxSS7xAtubc9b909q6agyWBRiERFLCZ
         YAS5iT6fdmyKpiDzlzOvF9y0INO3PHoHISVlCd435bWumZKgGaVUtkmrcgaKatbCtR8e
         MU4A==
X-Gm-Message-State: AOJu0YwhRldqTsI4YnqXGXi9nGHsDHHt2dsdVApdEZLrw0N5lHlZ/Vyl
	QBOMohqMo5JLGRWgzd4TitVUrLzcEoP3y+8uOFnsQm0EwsFuFzqHGNATjM0O3g==
X-Google-Smtp-Source: AGHT+IEqm+L95rwR0JZlT0tvAQ/2q+TGPaCEpoZTL9bpYQosz5c+FF4KsMLm3x5SAO1viUtEp/4mUQ==
X-Received: by 2002:a05:6214:3382:b0:6cb:e90c:7c72 with SMTP id 6a1803df08f44-6ce23deaa81mr19495736d6.21.1729585834117;
        Tue, 22 Oct 2024 01:30:34 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce009e287asm26350146d6.105.2024.10.22.01.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 01:30:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 22 Oct 2024 08:30:30 +0000
Subject: [PATCH] media: uvcvideo: Fix deadlock during uvc_probe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-race-unreg-v1-1-2212f364d9de@chromium.org>
X-B4-Tracking: v=1; b=H4sIAKViF2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAyMj3aLE5FTd0ryi1HRdC1MjS9MU07Sk1NRUJaCGgqLUtMwKsGHRsbW
 1AAdD5pxcAAAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+9446d5e0d25571e6a212@syzkaller.appspotmail.com, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

If uvc_probe() fails, it can end up calling uvc_status_unregister() before
uvc_status_init() is called.

Fix this by checking if dev->status is NULL or not in
uvc_status_unregister()

Reported-by: syzbot+9446d5e0d25571e6a212@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-media/20241020160249.GD7770@pendragon.ideasonboard.com/T/#m506744621d72a2ace5dd2ab64055be9898112dbd
Fixes: c5fe3ed618f9 ("media: uvcvideo: Avoid race condition during unregister")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_status.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 06c867510c8f..b3527895c2f6 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -294,6 +294,8 @@ int uvc_status_init(struct uvc_device *dev)
 
 void uvc_status_unregister(struct uvc_device *dev)
 {
+	if (!dev->status)
+		return;
 	uvc_status_suspend(dev);
 	uvc_input_unregister(dev);
 }

---
base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
change-id: 20241022-race-unreg-85295d5fbeee

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


