Return-Path: <linux-media+bounces-17154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B25964B84
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 18:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B923EB28246
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 16:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73C01B530C;
	Thu, 29 Aug 2024 16:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="znJzsXMR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B9438F9C
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 16:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724948367; cv=none; b=XziapHC6ukao2vgZfFJCO7espUpC81Ri3vdinQAQgypWMGWwErUUTH45CIf8e4rbDf+Bs4XDijPJ3sxwwzwrl08w/jQ3rM8oYaO69KZOmUYB4jT8dXkyYpOzHUsTMQSNNoFmoDbgPd4bowEjCbV2b05OY1nxx7PLSv6XmxONWjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724948367; c=relaxed/simple;
	bh=+uOlpQ0J2VrbeZAocdSGFU6CEoIf8QiCmdwUWB6M/Eg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=saaubWzOpwbAvxx1H5CAn+MHvvqOfins9GFIIQ5ZcZwXdE0EVhujJNLBdPRHeVlvJl5/FXBHnZ+Yvl1RwG7GeqiAgSvrn5HWT6MB6VDfN6qs1tLwZUyqh/eAESeOrOjexCq8wibEtoppq+SdSjQXb86BDKdia6vI9M1fq3QhNR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=znJzsXMR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bb6d93325so75e9.0
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724948364; x=1725553164; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JIx/HdAS9L+v6kcy5uXIn5+SpwFH/cXtqq0x+Bbtmtg=;
        b=znJzsXMR3M8xgVD3XVZbgRJ8uO2PZVcpKt6Ez4LFCSwuEkUuOO0CDYjyspDVahe66F
         S+sMx6NnI1djwy+4js5YvRz745x/Ky1qiuCt93o7zgI4ylLHgmOtZqDww+mUlTKcfcTO
         TTaztCHWedD7w0Pz5zexu2zubkNnLCxI7oZ7FDLpDYK3fIZ23802wASa4J5ducXfZSvO
         x4/d6gSG/wBe6Uc/6EhXYn4gb/0ZuKxhHd1mJM9CR1WT/XDtAaBJQhw0CctNPPJPPSdn
         ynU3gs3uGq8MicT9WiD0z7E/QBMYRMGR+/ObwX1xfBfCbCO/Rl5GttRK/AmbV3QTgZ3k
         GBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724948364; x=1725553164;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JIx/HdAS9L+v6kcy5uXIn5+SpwFH/cXtqq0x+Bbtmtg=;
        b=alP7NYtMJ9JqAgPG45arT5RFHqzOlX282eQt6KK9cvZkDNIdslcJApUG0PgV+rkLWM
         WnBLjUMLkuuYZnXzzB8AcxB4SEny4LoMgcxEMAwvOkDzj+G6WFIWVBZdyII8/SXao3wk
         xzsz2v7R9CTEOor0O+Ul/gujaA7ow++zSURpBcjcItC1hlp+wpP0LFGKWVHXorDJaCkG
         Fox5R1gJdF/S40lfd7MHVJLLCdOs2VTaQre0HS9DV3JNETSToFcIpKqgDr6lH61odHiM
         HlhluWzE2eJ+wn/rFy+JCBUs9eloDfgAVqdszu6IEocBOiE70E0duQ0e8CzOLASDKxVi
         RYCw==
X-Forwarded-Encrypted: i=1; AJvYcCUP0JUqyKAWWGp9rnl6QPEVBtFH2KGtxionExm1xC7yGjgg0cxTguuOConyyhnmtEVPnFf9PMqYvqjNVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsit1N70Z7w5p3WNREj888NQFV0DXoRss/jnTcJNQddMtE+PiO
	Rg3JteVXIoW9NdDh4gOx77Dr8BKAaaAtiS6/ZbJaK0kbmDctiw6jOFNoz1Zq6F5fifwkUTEQq/m
	IIxEk6A9+2+6Ipzfrh/OTkPFm84awvF2T+ABJlVBNmi5PaeqXtk0=
X-Gm-Gg: AV9I1ZRxBNwnaOEIipA614ougtBSq/ogPRXZIddOrMznn3LJnqKeAc4S4NK2PxORNlc
	oLqd6ZIgRt3l1mfszlBmd5J9yuS89QKZbiSU3vAXHU90rwrLv2sSwz5LlLjc=
X-Google-Smtp-Source: AGHT+IHDKtMRQFGOa36AubqoYkJGrBLNd6MjbrqiIZkJ8DTptIPnLPcEmiVNPdaVtXKqLOYNkeS3QZujgRcS4ueimtQ=
X-Received: by 2002:a05:600c:3ace:b0:427:f1a9:cb12 with SMTP id
 5b1f17b1804b1-42bba08b177mr7195e9.0.1724948362737; Thu, 29 Aug 2024 09:19:22
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Joshua Pius <joshuapius@google.com>
Date: Thu, 29 Aug 2024 12:18:43 -0400
Message-ID: <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
Subject: [PATCH] ALSA: Add logitech Audio profile quirk
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Specify shortnames for the following Logitech Devices: Rally bar, Rally
bar mini, MeetUp and Huddle.

BUG=b:362311751
TEST=aplay -l
TEST=Observe codecs listed
UPSTREAM-TASK=b:362958780
Signed-off-by: Joshua Pius <joshuapius@google.com>

---
diff --git a/sound/usb/card.c b/sound/usb/card.c
index 2d6c2f1394c18..6bfbd22152819 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -375,7 +375,12 @@ static const struct usb_audio_device_name
usb_audio_names[] = {
        /* Creative/Toshiba Multimedia Center SB-0500 */
        DEVICE_NAME(0x041e, 0x3048, "Toshiba", "SB-0500"),

+       /* Logitech Audio Devices */
        DEVICE_NAME(0x046d, 0x0990, "Logitech, Inc.", "QuickCam Pro 9000"),
+       DEVICE_NAME(0x046d, 0x0898, "Logitech, Inc.", "Logi-RB-Audio"),
+       DEVICE_NAME(0x046d, 0x08d2, "Logitech, Inc.", "Logi-RBM-Audio"),
+       DEVICE_NAME(0x046d, 0x0867, "Logitech, Inc.", "Logi-MeetUp"),
+       DEVICE_NAME(0x046d, 0x087c, "Logitech, Inc.", "Logi-Huddle"),

        /* ASUS ROG Zenith II: this machine has also two devices, one for
         * the front headphone and another for the rest
---

