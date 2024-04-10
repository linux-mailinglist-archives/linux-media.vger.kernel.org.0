Return-Path: <linux-media+bounces-9019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F5F89F1F4
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 14:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F350F1C21BB2
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 12:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEF015B155;
	Wed, 10 Apr 2024 12:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KXD8jncI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E2515530C
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712751881; cv=none; b=NCOa5MReFdWETKZHjAVnVokPHC6F0a9YodyRbXDRVdFoC3kkw4Te0U1SgntY8gjumbobC+PwOdXr1xq4Atxi0tObCwkUaEkwyWT/PvCywwBwQJV5T7AhIjyL879Oy7prvjyNcM8nD79WT6QiU59eX65YnWToEJ+ECDhvSqLbYb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712751881; c=relaxed/simple;
	bh=1pJNgHja5lINwwCyP7IMrT5P1uTkgu8caHFcfR0b+eI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FYUBW+J65SjqvPM3qEsFXSWAptFqXGVFhwvxzx4MH4aY8CEHUO7bmXtnEu/2Z+KWcsenjKUpM3mZOaX7nKbmdZ+BSqSbF3k9aGp061hL0c/14jGKdf2qP6/i+q7dAb/PqM3+nq5OktWhKcFlBu2V9CXRL3i4G6Y50K6dtWRS074=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KXD8jncI; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de0f9a501d6so3145045276.3
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 05:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712751879; x=1713356679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e1+CFsAZcxsXAsqWL11G58KQqX/CKeYd932ouf9LqRw=;
        b=KXD8jncI/3XJV4PxdjplDy/Xed3t4+H/znLLSCf1GH4BGdxhpqv688NpvZgVlH38PV
         ks4VvsWpMdGHPt92RRZMlRolody//7cpo1lIq1KubaUMlr/wUoIwrZ+syBzj7Jt/Cwz0
         z5JGy2iGsmgREua0N+BAOfefJJzZTz28jWT3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712751879; x=1713356679;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1+CFsAZcxsXAsqWL11G58KQqX/CKeYd932ouf9LqRw=;
        b=PxR4gNmCSiJKCjVx+EWDfMSUZr9xkvgkZNhiWPFeQiZ8A3ajQeNx5mSnhh2LmhAJBN
         FZHho8yqsxNtKxgMNL1v1zwvWkYoCehCeAcRC6Ahf7FQkRq74+a9FsUeNfJm3vuWuRnu
         tNW7dYfK+FvXV5T6lPEidZ+qUxaablr9kYb2RclZFEHAQ+rR+0aipt57UeGu0W9j0Dba
         pkFcS2McKZCmiEM7oXFESUNRm7sDwicNTLT7vjmmPirbAfKvsy+FZw7ESsmQSCsOG5RR
         I7XfDhaFCxptinO5W4YDzlOxjFEGP4iPD5HAxT95R96yBVEnJzUetPHZ3mYvkkgqi8MM
         V9SA==
X-Forwarded-Encrypted: i=1; AJvYcCVFFz6Rv7YybNL2t7qV/opNHYx3/cuhx/WuzrjqE9BXCf6C3oXDuZh9/TUpyFpXo0jmVAc10LgavgA6WDWhO6cK751qIj/nPhYIq/4=
X-Gm-Message-State: AOJu0Yzhnfa06whZwuI/dZKV5v0CKnuNXlxPoE9i6ic4gMz7aLPvXhSz
	RQV4dq9P+KkqDEGXAe3wpfS6+7uqorhu3E4L7DYX3kB5DpiqivUaXwIG2JMpzA==
X-Google-Smtp-Source: AGHT+IGvW8CkuVTktKKdjqs+rbBISn9XmK8a9ITx0Plcjoh/1m4SUh13KgaX8czR0naFY6oxRsKJlw==
X-Received: by 2002:a25:60c2:0:b0:dc7:4ad4:c977 with SMTP id u185-20020a2560c2000000b00dc74ad4c977mr1293698ybb.25.1712751879270;
        Wed, 10 Apr 2024 05:24:39 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id jy14-20020a05622a818e00b00434ce53c664sm1921579qtb.80.2024.04.10.05.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:24:38 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: Fix missing warnings for llvm am32
Date: Wed, 10 Apr 2024 12:24:36 +0000
Message-Id: <20240410-pack-v1-0-70f287dd8a66@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAWFFmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDE0MD3YLE5GzdVHNDy+SUtESDRLM0JaDSgqLUtMwKsDHRsbW1AJtUSA5
 WAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

When we were building the project with llvm for arm32 a number of
warnings where shown.

This is passing the ABI check:
https://gitlab.freedesktop.org/linux-media/media-staging/-/jobs/57432144

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: dvb: as102-fe: Fix as10x_register_addr packing
      media: dvb: Fix dtvs_stats packing.
      media: videodev2: Fix v4l2_ext-control packing.

 drivers/media/dvb-frontends/as102_fe_types.h | 2 +-
 include/uapi/linux/dvb/frontend.h            | 2 +-
 include/uapi/linux/videodev2.h               | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: d8c9a6e204f1466d228428174ce6d40ccdfb583e
change-id: 20240410-pack-e719cdfa0a6f

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


