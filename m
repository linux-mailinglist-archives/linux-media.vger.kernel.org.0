Return-Path: <linux-media+bounces-41642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E481B418F5
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E967B1B27C47
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 08:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36402E8B69;
	Wed,  3 Sep 2025 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbVlfp2k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98F22DF13B;
	Wed,  3 Sep 2025 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756889106; cv=none; b=EtAKK4VGhaf9myfPkVOdo2PMpBFQIzbSxb8etn74yeYP/HN9IYlyYGcN0tTYFfzQ7QKV+fEWWgp3Iq+7CtQSfBlUOmpzvWCGRKJBck8BdbyTmZCICwI0RY6lzi5qB+evx+Pt+G9vPhO73+DXyjnOsdZdlYvA7F/r9tSrIR+/gj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756889106; c=relaxed/simple;
	bh=s7Pult1M8a65x3h8QtEBGWYKCQIOKeI7JSXX6UtHa6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IdPWxaMQjmFup7b8KCJ1gad2X6NShd0b//iL4TiTGsZ9KtmLO+k7hU4dc/u4CB91OEHJ0xEJ8N1aywTcvKzUa2Ke3+bbAnelArtpmI52Cp3wPikgDWg4LoKussBs0o08iGKdVNtg6HdYkjnHbmrqluJ5UeCEuaAmNvGQZSDqpw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbVlfp2k; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3df726ecff3so100214f8f.3;
        Wed, 03 Sep 2025 01:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756889103; x=1757493903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WYHkEns0w6Ce8syGafttWZHPhEvjpwV1bKqCXtix5iQ=;
        b=LbVlfp2kKDqUAziBvM3J9IdAlKdIEhRoRBuCCs69H4eVvs4lKv/nqVQAN1M5AKS3As
         upleaLIXzah86hGYVs3PuAoOuuiL1wfGZyYS84ZeWVodVCqORfj2aYyQr+4MboIXo/AR
         qLsm3FKo1SSC560dYKmGF3p3vSoLsoi5hjA5i95gEJSL72IaDo1ELAaWTgYLMJ27bG1J
         nkIFeYt0WeZ1YMRjGDzAB3O/e7MrLjZ5/CasdyzyyrOrwq2iEig9FARcWAr2lBjVfmtw
         fPjE7+Vd4Jj4eIcNEHdO5F5SDyDc2TePRTqJruHihjRBmDZoalZ3kMVQWBt+AZZ+vdB1
         raPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756889103; x=1757493903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYHkEns0w6Ce8syGafttWZHPhEvjpwV1bKqCXtix5iQ=;
        b=OShq+80v8yExYp87A9giy947xeE3cFMqybpOa+jX96L9847Q+1zjnHIgsc1DcCKWcL
         pZsJQmgG4tpOTTbh/pOxUB+Si6Oz2+QO0tFQqUmN+a4fstrh6zm8G6zvxlJAr7Ze9sSC
         l0mQzK45ilzepu9gxf9EnFkgFCuzZqUh79qYZZD4cNsroEUUCe561awwAMFQ5YWFB1Lb
         DQE/Ew3k52bu6Lc8leSEZB0Sz8zFcINXd/DKcrRYW9l3nKhLr3w0l2JCa3OU/lJMulza
         ZTiKcvfdzoQOLk4z7eX3zhyuK1n1Yhn6wfpzpc9bECwnZ70xOxfug5ochYyhLYvIOyIA
         r+lA==
X-Forwarded-Encrypted: i=1; AJvYcCW8OC5xLZKqfRi1hCEpEOdraFP7tRX4vBwk2WetvduLCvNsCyMn3NR4BD/eAQ7F/Se5/84Z3PVa/bw1AUE=@vger.kernel.org, AJvYcCWeJ0DkWvos4RSo9uU+TN9TZkEi1r2a7ykGQZJqump51E+UnP8ZRA5zuuYTqozsw1fXzUNjCrYoGXKowiY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3i1m5f8DNTe4nkVIzotrUDzsKrbET3tArltkdTIH5m5dOLoij
	U+uqX8exjwR3zebi6dcGWmQBslBBCYRgf7gfVtdMVgwX3j0pV7rQuo0CzcK6/lsFX40bug==
X-Gm-Gg: ASbGncvM7Ur6UYDvRjuhwP2lDE8cgmNqm1Xig9psOaXn0BEHHRnQf06IKFwodMJ/nFc
	ES0mmNxqSboImPGBHHPZwCrS7a8Ummk1+IJu60Rvbn/AtiFRczNMsgMIbVO1eiPf1jNEsZv1Lxg
	aSK+zOIWCIYdtzx1DQDuKEtn0JYVFZroeiI6RogvQ2XrKW0XNpngO4/nxAi6RpNy1wCixY/z0Wp
	PNRxbHWUOFefo+jpRVPTtzxLJD4JxomL4KqNZua1MMqqdutlgOl42ZwgaI+XWKx4GZ/HQw0VR9j
	SwC9DZF3sOnbxekbKxulruJ19a8XVw4sD286VcOStaR0x9fqMkPJf6kckcAO5IfrUx5hXwsDjeP
	nHoomYfQqM7yQfkjeuQdJh4JtvPj4sdQ=
X-Google-Smtp-Source: AGHT+IF22nicgiVDiy2hC205APiOr8T+5LxW0W4PlY0AvVydSMsH3eHiETff7xo0Q0o5ffWpxUYGJg==
X-Received: by 2002:a05:6000:22c4:b0:3ce:5408:3e9b with SMTP id ffacd0b85a97d-3d1de4bc312mr11355432f8f.32.1756889102911;
        Wed, 03 Sep 2025 01:45:02 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf33fb9431sm22654054f8f.44.2025.09.03.01.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:45:02 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Mike Isely <isely@pobox.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: pvrusb2: Fix incorrect variable used in trace message
Date: Wed,  3 Sep 2025 09:44:16 +0100
Message-ID: <20250903084416.2704362-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The pvr2_trace message is reporting an error about control read
transfers, however it is using the incorrect variable write_len
instead of read_lean. Fix this by using the correct variable
read_len.

Fixes: d855497edbfb ("V4L/DVB (4228a): pvrusb2 to kernel 2.6.18")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index f21c2806eb9f..81e87aa8d4de 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -3622,7 +3622,7 @@ static int pvr2_send_request_ex(struct pvr2_hdw *hdw,
 		pvr2_trace(
 			PVR2_TRACE_ERROR_LEGS,
 			"Attempted to execute %d byte control-read transfer (limit=%d)",
-			write_len,PVR2_CTL_BUFFSIZE);
+			read_len, PVR2_CTL_BUFFSIZE);
 		return -EINVAL;
 	}
 	if ((!write_len) && (!read_len)) {
-- 
2.51.0


