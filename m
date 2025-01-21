Return-Path: <linux-media+bounces-25071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A66A1871F
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 22:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A54E2161D88
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 21:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B611F890B;
	Tue, 21 Jan 2025 21:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A+pvBThc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEEE1F791C
	for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 21:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737494099; cv=none; b=HAok/Ufna6h3q5cNkhrJLSIH39ITNDFqSvhyAxNPPSj0lhBXEi8Is/c/ykKF9oH62jl0eUOnyN5ASwa6z6Em4Q7tsVxg5tSCqLOXNbytlcKYMXdIP0oBkqIQFDiEcjGX5eqBBA/esdOmwkzhMm8DI+Sgdon5NCkUflZuAQFrBwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737494099; c=relaxed/simple;
	bh=kK/OufzQmQI4XPHyamMFXi0pV8mkYyucQJnxY3oRAPo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t1TRJpqVLUePR7RPQ+eP+B3J0Ox1zIh9+3520D4dIO8XACflQuS2CwN7RzBLKJfiL1z6GT8dGxbECBk2hzCRKxVqd1r7cOvQZONbd636nZgnEa93wU6S2B9wfhn1OhlxJKRoLlWDJEl12dxU5ZUu6dfDs1tFZRmdcBgTW1BYg9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A+pvBThc; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6dd420f82e2so37489786d6.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 13:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737494096; x=1738098896; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rQuSQ7bovNI6GEsgzAgDtL6O/sCAbswELfNsKv2rreI=;
        b=A+pvBThcevOQSX8rSJZLGxwp7AVqfRTK3Ct+TqadbDOpColpGiTy+YT39dPnbZrwWS
         k63xI/S54Ur7Ft4vRfYJJFqV2Q6UnoSAjaj+4Hns840lnyDVno0jjNtHsLwNneCThbwx
         bLJ8Pjsf7ixt/GYFHeIaePEXhzDzXgxMy2lBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737494096; x=1738098896;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQuSQ7bovNI6GEsgzAgDtL6O/sCAbswELfNsKv2rreI=;
        b=Bl1nKZ9nTBvhrOHuInj+d6dxT1Ln6pbFtBXf7EkB7o5pGB5FNv9Z+IZatfez5iVb7d
         ONOifxyYNAZsemwTNZSUIALEdaeyHOjdL4pZRNHByUgCEwR8WtMWafqB8iA5kdhyFgqp
         /dhUNCzvTs27lYzxV2siVFvatTLNlh6woffptcY7r2IyeFHslxDJ9mBfbDBhh41B7bdM
         kowXcHhZ+YkOdgd0VfArbcOJ0zkI37yEjIT6CYSpokeZNzL8vqdvVykhjMPJ16vTacvE
         a8A5kv1fQdKEUERUpEObEdZ1tFp7bXR0ZpoyKaizdj+a3JDPhpUx77xwViCAwYbyYcmB
         G0iA==
X-Forwarded-Encrypted: i=1; AJvYcCUMVXnJ1+qLuxTCMQlVge6TCCW64DBkY4OBtLlzlOScU7voLWymFVTj13BRW70ChoxbewNDohbLdj9AFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxti34fqwoEHAS6PoQyUXqAmbiCOKcZrAuI8FLrMrhbYTeZX0BT
	4y76fjoaXVUM3Mtw5ZZishe1hbMo+7R/82Kim+NLwOwCmbcI29uFAl7Edghoig==
X-Gm-Gg: ASbGnct6lxuDtr8WLhfqSFyaXJ0x0N1SFYnV0AI+rMzEtVmH0A0vATAsrnd9sc+sf1f
	0et7cWHGNRxMR1CvwAXRTFSa6QrtQ4rZrpxAOKkCRExag838QqJ7z4cNf95JlmoXf7mP/i0IGZr
	qistLj5p7KTkBqXlDQHd4iBECuOq49e6iRizdq4QK2RcVW1wwqnNfROhPaFtTM927+Xfi+sE0NR
	EvgAve3los2Y3KcI67QsR1xSZGyHpVemgzzJEAmDEd+y8sTL1JnPhyKmT+bKR60NSY3jxuQcjrL
	9frYEb9J+us4Jy7C2gG+Lo16dM0jhyEn1Elj+0Avq83+GbqucA==
X-Google-Smtp-Source: AGHT+IFVRDtX4xLCSgnndPd/KmBxnL9FoLZx0NyA+ZEg2Wgowuj2xhPVpo4f+zf+P1TtX9DKiJhurQ==
X-Received: by 2002:ad4:5747:0:b0:6d8:9be9:7d57 with SMTP id 6a1803df08f44-6e1b222e66amr323757436d6.37.1737494096451;
        Tue, 21 Jan 2025 13:14:56 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc28f84sm54790186d6.63.2025.01.21.13.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 13:14:55 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/4] media: nuvoton: Fix some reference handling issues
Date: Tue, 21 Jan 2025 21:14:49 +0000
Message-Id: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEkOkGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyND3bzSsvyS/DzdtFQLc4PkpNS0tCQzJaDqgqLUtMwKsEnRsbW1ABh
 h0VdZAAAA
To: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marvin Lin <milkfafa@gmail.com>, linux-media@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

When trying out 6.13 cocci, some bugs were found.

The fixes without using cleanup.h should be backported. The last two
patches make use of cleanup.h to avoid this kind of errors in the
future.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (4):
      media: nuvoton: Fix reference handling of ece_pdev
      media: nuvoton: Fix reference handling of ece_node
      media: nuvoton: Use cleanup.h macros for device_node
      media: nuvoton: Use cleanup.h macros for put_device

 drivers/media/platform/nuvoton/npcm-video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---
base-commit: c4b7779abc6633677e6edb79e2809f4f61fde157
change-id: 20250121-nuvoton-fe870cbeffb6

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


