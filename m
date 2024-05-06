Return-Path: <linux-media+bounces-10927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC33E8BD6A1
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 23:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55BCD284274
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 21:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2EF715CD42;
	Mon,  6 May 2024 21:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ti5kdVUC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B808C158D7B
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 21:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715029832; cv=none; b=UINL48nCIOFyZCBUS2+UdGFn8rr6B5Da9rmTuWppQUQJbOFrRUS3oJmC/FVbY1EN5SKza+GSAlV0fvusGIeVKbm7me5F27Q8zqVaGwSbQ6ivVKs27kgaTfd/0YAvWciMUNb7k7IdM83/LarAdPhc/+5lYQs3Dv/RAp28C7VhJk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715029832; c=relaxed/simple;
	bh=hlKSh3+fVOYGLqDRFhNN2z7IDlVFYJiY/t1NMzneb+s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bhZ+Sf6bVtl8pcizOJWYLM/qKN2RFOQf4NxhGtSx0unblFNQXQHQozMaX+qEbiW29Q0uDKoqozqNhxzekkhrsBJwQuu9br6wZG0rt74XueYionUcXZTycYcdhOIWOdv4Onk80Hhz0W/yfn6LNmDo1hTdkTl8Ut2x7kzqQzef4dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ti5kdVUC; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7928c5cb640so230742585a.1
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 14:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715029828; x=1715634628; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJlz3tHuOCtShrTLnbsBX1r1HOOY5sBoGqISo2aDg5g=;
        b=Ti5kdVUC9xXZOHSyp/F0NmfrWMF67MVVgdwsipcX2pKQCF6HdqoQPMVZ1FeCJjjboX
         U9ulxGej8qLL1Qc3Eel96jO2KEtTm8RBd7ZHpvrFUorGvU07dnKqIZmZFxZvAO7osooi
         r9eWruWdg0uyFNHZ3oTWS1L8QvZEokS9bFMiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715029828; x=1715634628;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJlz3tHuOCtShrTLnbsBX1r1HOOY5sBoGqISo2aDg5g=;
        b=ttWyvEaRTmRyu73ELmjKdKc9AZ+jDYd/m/SjjtuTOqJNWhYLKqwrgEFF32yP0rE8TO
         lQlIRChOJDhnJIP9OFdG8MKvVGbgd4GqDuEKIDdb80Wgtq2hIyoZG1/GrQ4wfI9vvJV8
         I2Pb8/r3frhdYuKOHFeolpbSPNnBCwe9VOGtaCvWYnFqgx+1E01I4Ksi2ml2QWNhijf9
         UtUnzT1ptfnEs35T8FOfdJr1aOA02aePFXItfStHBwnzMJ8GZ2ozKUZpANiDsmmSSeBL
         L0P8ytOCqGElPkwbFSl8T/gqnl1Hxx/anY5QlGApSbK/9SBEGouWXw8/5HU2IHy+W/eh
         sV8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUyfBvq5XLBb/GEepbNk623mGVISBDNbk/X3xRfw1oJzq2ZZZyOd4rq//igd3NAJaLBPkLaEyNo62PzU8I4zo4zpEFmFAtAvBVEsE=
X-Gm-Message-State: AOJu0Yw5yxrqnf/OS0Hp4IA9/KDM8rjzKu8unzj7BbJwbXAD8pc2ip1e
	GL0slhnMnSlb6XG5NagkMMtfDWWqw0jedWnLYpOt0gjotnjlN6wX/F9fnPpwSA==
X-Google-Smtp-Source: AGHT+IFqXcvbB+ZXiX7sQ5ikGKKxOv5UTqaRx5oADWm5KdYHjiCmw8tdCy4Ec0oH5QsjMbZl9k8Kkw==
X-Received: by 2002:ae9:c316:0:b0:790:ed33:5b91 with SMTP id n22-20020ae9c316000000b00790ed335b91mr12288745qkg.56.1715029828406;
        Mon, 06 May 2024 14:10:28 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id pa20-20020a05620a831400b0078f13e59dc9sm4224921qkn.102.2024.05.06.14.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 14:10:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/5] media: Fix some cocci locks warnings
Date: Mon, 06 May 2024 21:10:25 +0000
Message-Id: <20240506-cocci-locks-v1-0-a67952fe5d19@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEJHOWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwMz3eT85ORM3Zz85Oxi3dQ0oyTzxGQzS2PDVCWgjoKi1LTMCrBp0bG
 1tQA7SIPqXQAAAA==
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, 
 Jarod Wilson <jarod@redhat.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

After this set is merged, there are no preceding lock warnings.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (5):
      media: ivtv: Factor out schedule functions
      media: imon: Fix race getting ictx->lock
      media: dvb-frontends/stv090x: Refactor tuner_i2c_lock
      media: go7007: Refactor Adlink PCI-MPG24 i2c mutex
      media: drivers/media/dvb-core: Refactor dvb_frontend_open

 drivers/media/dvb-core/dvb_frontend.c | 116 ++++++++++++++++++++--------------
 drivers/media/dvb-frontends/stv090x.c |  37 ++++++-----
 drivers/media/pci/ivtv/ivtv-fileops.c |  66 +++++++++++--------
 drivers/media/rc/imon.c               |   5 +-
 drivers/media/usb/go7007/go7007-i2c.c |  30 +++++----
 5 files changed, 149 insertions(+), 105 deletions(-)
---
base-commit: e695668af8523b059127dfa8b261c76e7c9cde10
change-id: 20240506-cocci-locks-ef2b7ac6931e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


