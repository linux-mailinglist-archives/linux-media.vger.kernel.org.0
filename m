Return-Path: <linux-media+bounces-10407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAE38B6C2C
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 09:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADCD41C2206D
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 07:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434424502F;
	Tue, 30 Apr 2024 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YnGcqBPQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C6514AB7
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 07:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714463494; cv=none; b=ol/Ws+BreMsJP9izNNTBQIML9GGGTbKc0iljU6cBFZyOek0BZGKN8MQdt42HfBpVk4ojyNTXi4NCDXd0zMsOpaZogfSxHTr2wr3HRnQqoSFxwIlP6T7prUuLiozRukmynmTFse1w95qg4dCLObFWdj5DJK5b5JLecAfMyVj+zws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714463494; c=relaxed/simple;
	bh=HZeobOuRJfmb/+xBUYIK1ybuEld0tGBVBD2NIR/ZHq4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rFsUoH1fTIENsWzYWZvAgm6EyntiFBN+cctO4bzyc/+qFvRTQpR6Ja9xEROPENnyb7Fc9Aeyxi9Dl/VucZc4WZEuTprGrTQXrbCIk8wV149uq3oGnCkv/fIBB3CUK6C5MRSHOHzqaxE16iTort4q2pS0cuwtIRRLsA+W9Sb9CgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YnGcqBPQ; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-436ee76c3b8so42463501cf.1
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 00:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714463491; x=1715068291; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Av9Ebx1j4vPRRB4vZ4jqNgLNeyuiwbH2PH8z4rELaY=;
        b=YnGcqBPQ7k5RGiu1BWicl3KT7cdmcWTJdDdL7LGBB8FzOZppKLAbZM+hbDvyg8OY9s
         o1cZgaqC1yWBrhvIVJ2xTzcrWNJg7hQyGjL1i7GBw9iDa3IM9vW0CTd3Sy9muqcj0to5
         pSlnGqEqR0nlxdhLdpi8ZWE9pY43wNpnImc3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714463491; x=1715068291;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Av9Ebx1j4vPRRB4vZ4jqNgLNeyuiwbH2PH8z4rELaY=;
        b=k/tAb7LDPdWFr0t9koBRGs27yBEP21esrDwMQLQJMx76OW05wn+5ICECzldO3PCuQO
         O892tYFB6YGhiwwxDC62OPD1RjH8c2MSSNm8q4Okj3N+1sYjx86Wfn7vvDOsDPxhVBHG
         EnIG38wymED9hHxrpqQtX0zX23YJPzQ4d0/rYUX7HLhL5zs2zWrVw7k9s3B5XHVAuy/H
         S+MNW9Qlh3QDXd8V8oelJu47F70EGhF2AP5aFEdl2OHaUg+v1BXK/SFYTpn4S+Cw5V5U
         Y2afpNgzmCs0Thy8hGzeleK8gfCsA/HfCj8qCK4Mv/YxexEwIxRmyKMVigPkMXI1gzmO
         +9Ig==
X-Gm-Message-State: AOJu0YznY/WloZHluQ3vrlV8SS7Z8PCoY8iCWPCuIu/iLJBs+KfqNy4p
	wUHCHb6dZ05bMrAyEn6YUm1Rrg2f8zc/0Bb6ev2HOsBTk260Wi+fjiRZru0BHQ==
X-Google-Smtp-Source: AGHT+IEyG5YcY6j7jfDsETTOEF8AdovY39d93OJj2uCRcI6sLWzCh70qxqFuRIJJQAYauJh1BEq+Lw==
X-Received: by 2002:a05:622a:20d:b0:43a:ecf9:c179 with SMTP id b13-20020a05622a020d00b0043aecf9c179mr6487425qtx.52.1714463490874;
        Tue, 30 Apr 2024 00:51:30 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id z11-20020a05622a124b00b00437b4048972sm10634547qtx.18.2024.04.30.00.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 00:51:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: bcm2835-unicam: Improve error handling during
 probe
Date: Tue, 30 Apr 2024 07:51:25 +0000
Message-Id: <20240430-fix-broad-v1-0-cf3b81bf97ff@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP2iMGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDE2MD3bTMCt2kovzEFF0TS4PUJMNEY0tzUxMloPqColSgJNis6NjaWgD
 t7SS2WwAAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Improve the error handling of the irq errors. I am not sure why the
retcode was replaced always with -EINVAL, so I have added that fix as a
follow-up patch.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: bcm2835-unicam: Fix error handling for platform_get_irq
      media: bcm2835-unicam: Do not print error when irq not found
      media: bcm2835-unicam: Do not replace IRQ retcode during probe

 drivers/media/platform/broadcom/bcm2835-unicam.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
---
base-commit: 1c73d0b29d04bf4082e7beb6a508895e118ee30d
change-id: 20240430-fix-broad-490eb1a39754

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


