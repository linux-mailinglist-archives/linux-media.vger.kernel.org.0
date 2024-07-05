Return-Path: <linux-media+bounces-14677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC3B928728
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 12:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C395F284FAC
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 10:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59801149C42;
	Fri,  5 Jul 2024 10:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYVtJWxU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4628B147C76;
	Fri,  5 Jul 2024 10:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720176835; cv=none; b=ZqKQQK0/FQ580iB9oR00zxwr+Nqt01YN+aKxLmtvVeYGhfyk0kTj0UvszCV7JcEC5MUsuFF4mD4hqosTSfZ2VNBg4Zfl6nLL2krFkdcUDdPy6MYSOyu15yPpKG+7BiUxRb2e++ZwKweGz+L2goEHh/vGqCWUT8LLULeitUlqxRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720176835; c=relaxed/simple;
	bh=rNQrF8xvwQ9KpATrbh0AScVdjtNlm1iA2ntYLtlTHXI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fj90OooH70Yh+di9kAM32nA8+eBqblLxOIcYDBfVD7qg7XkZVcNayn+ECs3NSmhlHbg+vTQijWpTs/VC4jmcc3QF0sPKto59LmXmkpwjE3FD5+IhlXWPJH9dRSoxJ+D/ehvgoy9gJt9Jv7YHRTj2MfcyDEh4K2MfAwdyBnekAIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYVtJWxU; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a77c2d89af8so128681966b.2;
        Fri, 05 Jul 2024 03:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720176832; x=1720781632; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rHsHeF1fMFcYvJ4SEMT/J+MbPjx6peYz/DBrkKx0ZIc=;
        b=nYVtJWxUm2lmSRwaw+9BIyBOrCyrkM+23n8wFcDHuYJIZ+GC5yPX2h+hWkSsw3S37a
         AHn+mfgYl+xck3qHIOyNTdAHhi40fQMPKDenxLZ4IBKmBH5yW1qi7u0a6b5RLwpoJfo+
         FbTKHqb6WhJjwLZ3aamAfxor4QgofBtaenMi1hsB4/0bmiXEnf5XJjcxGvPTs9rQxro1
         q6/MpMtHLXTbC+VsdcoP91QvOEmKyFy70zir4lgiINlNJpEIvXIkILhXNtLLkb5f3eKN
         qLjn4/1asQVWNrft7BqvHDHPIvQ75VrCr0vWCvIi5rXS6sfr4hzS40Y/Tg9pv8AgekKN
         71nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720176832; x=1720781632;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHsHeF1fMFcYvJ4SEMT/J+MbPjx6peYz/DBrkKx0ZIc=;
        b=MNKQYjBHBVmv0MG6+Ud4J5EGZKhRFcwyw9sjAdE26cKCtgw+b3aasRijFxoCIc0WYP
         lC+lWB0YBJjUjTacHJsAExZnf/YeUD3g62BNgN3tooLceiavdczVf0siWg9H7Sy34c4J
         zuCGmszY1zuR16CP/RhrXJX5Ep31X8wit6GybhTnLDFnS7NBfOe1uCJNsxsAPjThgZJ/
         gEu9+aZoBA3tATug202x8d++r0gH0ATc166lFBJiqHfTSHSPqE6hmVz6Zx+PyYdfyhx7
         LByLNH9TXCMivkH+sVa+LPHeBuT2CKs9BSFr323V9ReOoD4ztw+NO4wstMQMz7Y5N2Oi
         7Xog==
X-Forwarded-Encrypted: i=1; AJvYcCXquonyLPShnT9w3UOnD4rmmYmje60CgKBa2FpfTdCcK6AB0URip+qHwdeQo/wqykzoAufyeB71JDYvz1wKGABSNOevwoymogIPHW0f
X-Gm-Message-State: AOJu0Yy5rl52FGpT3xYLh2bzp6lemknyD/Xr9ioouFsLmffIAHJj8Xf9
	zZXvwtMTSpZr9/1/MfJbaqGs+CZimV3w1dB5s8NOfu4ARFsTSE7d
X-Google-Smtp-Source: AGHT+IEaiRLO32mFwxNPYvH9VGxh9rOX48WG2G7HX9kOUIZzEPbD0zyZ/GRYbqAHYKWI3EbJTWcNJw==
X-Received: by 2002:a17:906:b809:b0:a77:dbf0:d25 with SMTP id a640c23a62f3a-a77dbf00e74mr14260766b.33.1720176832408;
        Fri, 05 Jul 2024 03:53:52 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf1bbcbsm670756266b.36.2024.07.05.03.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 03:53:52 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] media: Constify struct regmap_config
Date: Fri, 05 Jul 2024 12:53:49 +0200
Message-Id: <20240705-media-const-regmap_config-v1-0-56881442bb30@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3Qh2YC/x3MywqAIBBA0V+RWTdg78evRIToaLNIQyOC6N+Tl
 mdx7wOJIlOCSTwQ6eLEwWeUhQC9Ke8I2WRDJatG9rLFnQwr1MGnEyO5XR1rhmWHYzsYa+pedrW
 G3B+RLN//e17e9wPtVcRBawAAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720176831; l=781;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=rNQrF8xvwQ9KpATrbh0AScVdjtNlm1iA2ntYLtlTHXI=;
 b=i8l6YFzHcjaaxryYXC9w/H+GSgxUuF/lubt5WfmITKZex/mc7mrCbJUxyxq7qfCGHvc2kHroN
 MgDpyak7mP/D2RRXl0nRc1K7u2cbeCxLABQYcmRs5hKc2p8LtN3Rt/C
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series adds the const modifier to the remaining regmap_config
structs under media/ that are effectively used as const (i.e., only
read after their declaration), but kept as writtable data.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      media: i2c: tvp5150: Constify struct regmap_config
      media: platform: allegro-dvt: Constify struct regmap_config

 drivers/media/i2c/tvp5150.c                       | 2 +-
 drivers/media/platform/allegro-dvt/allegro-core.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240705-media-const-regmap_config-958dfd37063c

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


