Return-Path: <linux-media+bounces-11320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9C78C25F0
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01001B2200D
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 13:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C763912CD8A;
	Fri, 10 May 2024 13:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQBqv7iR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5DA12C80F;
	Fri, 10 May 2024 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715348412; cv=none; b=X5VbAjlInWnbqedcsUOqzjRVdd05yLbqvJYo9Q986CZLABomGdMCMq9DQRpzKwHfjdTejGyEVR0gOvaUXiYFfxPfiWHANo4lnfSYaMe9KCEXKbK8JhMcd+GSctEVJCNy22yq5gv15n415ALS2v2icw7lSRuNM59VraPLLaxbRKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715348412; c=relaxed/simple;
	bh=1XGNUjPVitKhhjXuO83/2GVp0nYJ0Aeb9pCB5XMr1n4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UtTFctQfOdYrFaosMNtGlVjn8OKnWeL5KgxOyiJIb82pVcOdP2YEXq0f3U9SZZbXQ7CyOMy2aau/P3ld6HwZ5HIQOnTOOkDS0QosmERLxRHUk1lKE2T4LcbKTLstrZBZjDftTWD2Lfy5BeXowWcFMWtnPCtngsHW/b9+hEg52sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQBqv7iR; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2b2bc7b37bcso1834832a91.2;
        Fri, 10 May 2024 06:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715348410; x=1715953210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S1ijVzsoPBDrirJugKDkdAFNChA4uJX+cHWvWwlSmVM=;
        b=MQBqv7iR9b/GCAYx3H8JNHap0meSYO95MUqBybNpW1cpmWcjXOkjSrfGcGyg09YF3T
         lpS1br+VlL2/cFvUvAB3u31voAoyLzIOEIAJXJbJ3fBRndglJIUYPctFttrz5/hmfX2H
         qKpjRlxbxijWeQdzw3tmmIoX/Sf6MGUhqLOSi/uTsy7EWKTEtWvHITwIy4e0rVVMmZfP
         znrGwc3bCIVETF8z9yWMryzcOKUQS2MPfhwoTf0Ec7r0VY530Xnp5fvlyEFTrAgclmqM
         wAjy98ntw1DOsyG6zH9xqe7yz4Ofo6BTCnJzxFFDtiC6ut+eXkQyh6b5EbBV4J5retE1
         J6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715348410; x=1715953210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1ijVzsoPBDrirJugKDkdAFNChA4uJX+cHWvWwlSmVM=;
        b=BTKCwWPXc+hRLoT34o4ydu0zaYgRtZuJaIsjZw6sESc75kiIllKAaKcRhA22osOXof
         kZgZzjEe34k4FcECK8K/9VUcxdNRnsfsAPuMiCghn4l0hHRE4V/L53qQ8WfHqc34sNY1
         SeOCcSDJXMERJZQU/bhnGnhyNtwgmTFV/v07JgCbuH1poHmLDkcNU/FIsvlSxTAhtvOc
         g/aIlJ6KP+D2KpPOojbR0mNQrf1s4IiUOA+TUJspXZbUmlbSDWwvKYAcctoAGwMkiMna
         +Q3GKCzPpaDVZ3wfW0MuMHL3KP5/uzfPF7Zg9QFp4nKTRQEqNhYMNquHUjeEfYjWJM8G
         u1qg==
X-Forwarded-Encrypted: i=1; AJvYcCV1LpS1kgpSwZRh24HbHtqr0shmsGFxzEaXgq++hXInceJnGlmkDW3jrDfYfObhZbNx6YGTCcref5/73SULzk8kPHJJJrqJQmW2fR2/K4KF6c9cBXX0DHOcU+CMGKMBy4dRhM5ffU5d7pU=
X-Gm-Message-State: AOJu0YwWA6nTyK6YgVydhkwZVvuKX4nB64JT0xUYFgkbskomOvHY3PG0
	ZDkYdbyjLfNqTIwKbEJgN1kORw4PlbIc/6+m8OiN1WnseAe1T+nQdXIbAjwz
X-Google-Smtp-Source: AGHT+IFUrsug2vB+Pywt/1aiWlfZ+P8BRoZJhjnnpH2KLKhCUWHRA1t0jNHtItXsQrecDk+9Y0YsEg==
X-Received: by 2002:a17:90a:9281:b0:2b2:b99f:4d5b with SMTP id 98e67ed59e1d1-2b6cc454828mr2539648a91.18.1715348409574;
        Fri, 10 May 2024 06:40:09 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b628ca5109sm5074148a91.38.2024.05.10.06.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 06:40:09 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hpa@redhat.com,
	andy.shevchenko@gmail.com,
	gregkh@linuxfoundation.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: atomisp: Fix spelling mistakes in atomisp_platform.h
Date: Fri, 10 May 2024 19:25:00 +0545
Message-Id: <20240510134000.23848-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Codespell reported misspelled streams and corresponding in
atomisp_platform.h. This patch fixes the misspellings.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 .../staging/media/atomisp/include/linux/atomisp_platform.h    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 487ef5846c24..9f55f0b65864 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -134,7 +134,7 @@ struct atomisp_platform_data {
 };
 
 /*
- *  Sensor of external ISP can send multiple steams with different mipi data
+ *  Sensor of external ISP can send multiple streams with different mipi data
  * type in the same virtual channel. This information needs to come from the
  * sensor or external ISP
  */
@@ -156,7 +156,7 @@ struct atomisp_input_stream_info {
 	/*
 	 * if more isys_configs is more than 0, sensor needs to configure the
 	 * input format differently. width and height can be 0. If width and
-	 * height is not zero, then the corresponsing data needs to be set
+	 * height is not zero, then the corresponding data needs to be set
 	 */
 	struct atomisp_isys_config_info isys_info[MAX_STREAMS_PER_CHANNEL];
 };
-- 
2.34.1


