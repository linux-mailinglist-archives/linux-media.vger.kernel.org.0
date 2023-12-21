Return-Path: <linux-media+bounces-2830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CD781AC96
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 03:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F8D41C22B9B
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 02:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A68D185D;
	Thu, 21 Dec 2023 02:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYh3DS8G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03305660
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 02:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-28be52a85b9so197177a91.1
        for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 18:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703125361; x=1703730161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WXiH2nYEIlfz6QCIXUwPqX1hfsgqQWFCU3y2KJwTN/U=;
        b=QYh3DS8GuuizHYHnZs58iKLOqnKUwFCqXQ65Swep4OAtWxDgpQ77iIM7svoy0cVIgK
         1lTWSoaNLAUCddfJ8YlrYMaFyZNhMHYcHrL7ZKDI6wlMTFeLcX1uwa05JUHHG4/THkSU
         A0tv564u/4nUBHlD80D97NYRkB8wiGy20i0VsvEMhrM5e3kInXO/Q+7iu0BL627Hf1Nc
         pqze5IhMBSho3L3bcArtuwBSH7JL+NwXTDuiSdaov7GPNSqgRBLHFFKuO62/t+Igbfft
         MVIRnkN4dic8QBlmdfSbZ7j4bgg/zub45uYOvBXUNn/KuHwhKU73Bjx3EfmUzgKmVEqu
         OJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703125361; x=1703730161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXiH2nYEIlfz6QCIXUwPqX1hfsgqQWFCU3y2KJwTN/U=;
        b=ehIbFKzkC5tAkIM0k+Q1XZP7tH1t3/tbIWxu2ehm0b0nhYn9Ae12GeBj4hnGQKztvm
         5Bo0nbv8fV7eht2aZszDp2ew3Yq1ojxN08DlrGYx8EbfBb0lht5DkaoHoEORlqfeaZ6W
         SUq6wzfT7nJPN9aiXGrODxrBLGTu/bC+kktvjf/LOkxe6kFwRRnL1tf3mh7wwuGU+pKe
         zU3Z3MVPOUKmH3ZEejYfvLMpl6xL3A6baZP1NEeZZd+0QNtcERj6YAMKs1i4uegtFN/F
         AwUy34sgTDwm0LCnLxLPMCSMFBfO/QENsPKUFqBnphXOYC5agz9uc21+A7sFRj5gukup
         uFUg==
X-Gm-Message-State: AOJu0YwqFhT8uW3mX53BB01tKCP1mp+p9uv6YekiGNplbKIbtC/DKAmE
	7Z8uJ0AjJERCs+1ohAc7Oxk=
X-Google-Smtp-Source: AGHT+IEdzjEQYESg9hUzKGLd2EnxzgVKRSRLXZb/GpzQX4PCudfPZSkfoEn2jYFjiqzbdIpC/G8GAg==
X-Received: by 2002:a05:6a20:42a2:b0:18c:55b4:df2a with SMTP id o34-20020a056a2042a200b0018c55b4df2amr518406pzj.2.1703125360920;
        Wed, 20 Dec 2023 18:22:40 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-121.windriver.com. [147.11.105.121])
        by smtp.gmail.com with ESMTPSA id e3-20020a170902b78300b001d051725d09sm389875pls.241.2023.12.20.18.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 18:22:40 -0800 (PST)
From: Kevin Hao <haokexin@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Mike Isely <isely@pobox.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 0/3] media: Use wait_event_freezable() variants for freezable kthread
Date: Thu, 21 Dec 2023 10:22:25 +0800
Message-Id: <20231221022228.548473-1-haokexin@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch series replace the wait_event_interruptible() variants with
wait_event_freezable() variants for the freezable kthread, so we can
eliminate a call to try_to_freeze().

Kevin Hao (3):
  media: dvb_frontend: Use wait_event_freezable_timeout() for freezable
    kthread
  media: msp3400: Use wait_event_freezable_timeout() in msp_sleep()
  media: pvrusb2: Use wait_event_freezable() for freezable kthread

 drivers/media/dvb-core/dvb_frontend.c   | 13 ++++---------
 drivers/media/i2c/msp3400-driver.c      | 20 ++++++--------------
 drivers/media/i2c/msp3400-driver.h      |  2 +-
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c |  6 +-----
 4 files changed, 12 insertions(+), 29 deletions(-)

-- 
2.39.2


