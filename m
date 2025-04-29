Return-Path: <linux-media+bounces-31322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5EDAA0DBD
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 15:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC6B816D67E
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 13:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BA02D1931;
	Tue, 29 Apr 2025 13:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WgLUFuyH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960BB258CE9
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 13:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745934450; cv=none; b=sCVB4q/U7DlWj9m63/pnSVd3rhtJrxnBoqxb9xVVvsKkE6aAFkf8BGIr0sawm7jgjTfg7l1nhZBkKSQV3sjivpGp/H2lTu29WRM3lMwgP80klcjkY5ovh1kRJ9lM0MYML8TTKQh2rqJGlO9g1Vpr+iAeKZmdEv0GFPibOXG2U98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745934450; c=relaxed/simple;
	bh=tvXj/8rx64ijoXhOtmAnIb9Fi4Y6gjX35eb37RtSql4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lfdcbnVUAzouVJ1GFecgRxQyhG5UtK0ILD2+azBF/ZzibfV01HaSyg4hwEXkpnyRrmD6d9QwadoKmnZdVq2BfajiMQWwOoh+Ysh2hr/i1itF9zGKp8HVs24On3A2DBJPg4VydmdyODzh7/naA1I1vt8+RoY6QoTZig8mPzWoObQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WgLUFuyH; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54d98aa5981so7744864e87.0
        for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 06:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745934447; x=1746539247; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A3Hi0LYp5dyA1fp6qe7HoQbmwzewNO4kWw/hCtK7URU=;
        b=WgLUFuyH5LPbbXOB0WyRCTDsnfhJWZbBxC0Z1jJQHBsPibF7g3wwHhyNEBpxqdbPxh
         LCx0xZhhASHtrsV8RyjudFpOkaAuYWabHpmA8giT0BtjucMg/O5Aqi/gEhsUJ5uXCQWs
         I3jeQCbqQYdUGCwLlfRBcjBKg29AGLjyUCUUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745934447; x=1746539247;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3Hi0LYp5dyA1fp6qe7HoQbmwzewNO4kWw/hCtK7URU=;
        b=nfrkBfQGyRja/1hbmuhRZcECCiS4FonG3NagmIWYb1kKG/HeVgl8vh9TFYnkBQxLhe
         l5jBvv+PZGbonUQjHGVaK4OoiWyymqJ7FKEuATWsUxtGjYIFnTRdipLpejmQW4/GK96Z
         4IbZWOcuDePHu+vb9ifyXDyaah0AZKjsqY6PI57Hryos5G7Wee45sV9Cy9tNwJBnJQzS
         51fbPKbuKiAXpTZYF4zSZdzidvPmX/JfuzFFvPmL0u/INScXsZeIupS+tFWNKQHJvugv
         CK7dG0N9YXTUvHlNJYpFStuOD/LX+NJl9oLRbCOR603puutTxhXiuOIZf6piySBBg+wE
         7S4w==
X-Forwarded-Encrypted: i=1; AJvYcCVAZoNF8v4ijgsAjS2u2BftgtQmE1RBoLYKaY9tpkqvh7U6jUhMBxNdcL6nBOgmsoUkWb5yZHlcbrDK/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqfeTqWmDm31W3vxQS5Um3gaA8XNjePz2UeVrW9i+dLLV372z1
	vQn4MxbuizIlE3J8yCbIRqUcTodQktoM5fYmsqPg5J/NoYexvsGxn7f3p/rTT8CPX/r8XYUA3Ic
	=
X-Gm-Gg: ASbGncv/hxuE2Qx71AocvN7LBeUbZxPgA29ABNeczm5BCv5zJl+CXKaKTsr7gDNlQiy
	jTLkyHP8CM9bn+OMAD817mikNz6mCLGzdxKNimjZhec/GSoim5vdLNTFOgWkE8mdrB+Tqx8MDEu
	pyTDJPvjx/iQSM8jVGr9mAYueOKMgf8QPrbo2oWbWZdTMPYznclp9KzwQFruP+t7VRvrr8aw5kG
	rG0IxvxmtLgU++Vs+fW80Le8P22qxEtCxuGfuQskKzjwOwhnglhpKUR54WeoYYT2DoayZ5XOigP
	fgG4HmdA9AFWGaZKoGPcN76Ofh2QhUBA1xfZF+L0bJXKsSMeyj/K1SgwVvBfx9WCaheh28qyozS
	WMRoIyH8MAsl9pMUcaynl
X-Google-Smtp-Source: AGHT+IE4Zb03U5eee3TPY4BPRFjLYpPyelIwBzJ9ysPxiJSxEPB080mVbDV3/bDpkBeg2i1IWc4j8w==
X-Received: by 2002:a05:6512:3d17:b0:54e:8172:fb6e with SMTP id 2adb3069b0e04-54e9db16893mr990549e87.54.1745934446615;
        Tue, 29 Apr 2025 06:47:26 -0700 (PDT)
Received: from ribalda.c.googlers.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb2626fsm1902375e87.46.2025.04.29.06.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:47:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/2] media: uvcvideo: Enable keep-sorted
Date: Tue, 29 Apr 2025 13:47:24 +0000
Message-Id: <20250429-keep-sorted-v1-0-2fa3538c0315@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGzYEGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNL3ezU1ALd4vyiktQUXaPEZLM0E3NLM3MjMyWgjoKi1LTMCrBp0bG
 1tQAy4N4RXQAAAA==
X-Change-ID: 20250429-keep-sorted-2ac6f4796726
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hans@jjverkuil.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

When committers contribute quirks to the uvc driver, they usually add
them out of order.

We can automatically validate that their follow our guidelines with the
use of keep-sorted.

This patchset adds support for keep-sorted in the uvc driver. The two
patches can be squashed if needed.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (2):
      media: uvcvideo: Rewrite uvc_ids for keep-sorted.
      media: uvcvideo: Add keep-sorted statement and sort uvc_ids

 drivers/media/usb/uvc/uvc_driver.c | 660 +++++++++++++++++++++++--------------
 1 file changed, 409 insertions(+), 251 deletions(-)
---
base-commit: 398a1b33f1479af35ca915c5efc9b00d6204f8fa
change-id: 20250429-keep-sorted-2ac6f4796726

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


