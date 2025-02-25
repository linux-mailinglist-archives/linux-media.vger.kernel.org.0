Return-Path: <linux-media+bounces-26911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F31A438E4
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 10:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AF3B17AD8C
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 09:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEC3263C7C;
	Tue, 25 Feb 2025 09:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vVchH0s5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8403E264A8C
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740474321; cv=none; b=DtEfRszyHaMB1XWrbPCrYIXa7exemVsK24LifOAyW5WntmFOG5L2fp3Mi/LmEnfjFcn/OCwZDDlSYOsXI9CLYILzBVdfTLswxH8DmHxonbehInKnQgYJCWDTTSoGxd9oP5Hb72Ro8CUQJLufrwnL0ogtPnhmeZNCGrtokBbg0jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740474321; c=relaxed/simple;
	bh=LWZm3qxOUw3fitXbbaWTsu2JiZ5EMZfR2LJDHZNP51k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jyUck9Q6Ql8HGMqN2MeE8nNXkt4Yhg1YVAHCR1MbSTWOVlIRRG+2Vartn6QGU3kNSOQuVmx03yT3GM0KQc7XSfhT1nELLXHIDnTu5T2/IqFaDrfmwJCktUzv8EVYdCPVn6ravKjAUC7hQnGnQfmgMDtDvd+2Tybm241rLOhYsPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vVchH0s5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so36131535e9.3
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 01:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474318; x=1741079118; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wwPYgop4hULDaYUF/JcCRqqdpLFOGbL0rjLbDvH553g=;
        b=vVchH0s5nblLPTgKQMJO/yzqERDtZUtpLLPDjdRI0rYX8i6W/urSrxE4LgsmRTLtyA
         xrmFabJbONDM2A4JFq7mGDlen/ZBIMEm4ELssPiRW+KORrhOS//ZZMM6S0Rg/NXSnwxs
         R5JqImPZZKNRk8DBnEupclS4xj337iuAl5h0Gv66XEo7mAXzkQyuxuLam32p9/5UTobn
         Kmhxun1wzJoLzZrvrq/ui/tSMda6xc436CSSCtJ1Nyp+3R21bBEcpq8CSTE0ZiVJ7hMY
         Zhb7z4s52d6VGm2p4//70+G/zjGTLBl1zlsSBZEKZiEMb8O40RbVSvZOOmOusObKNOfE
         Hwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474318; x=1741079118;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwPYgop4hULDaYUF/JcCRqqdpLFOGbL0rjLbDvH553g=;
        b=gVQ0qQ/ev0M6PdDz4F3X+nwLoIwAI08VUxVqwKNvvUFrIcMvxYHQOwcWR5LVWuAkWq
         YtlK5gkwrrFBwzACQzPXtzF1XNAayXuGxg6zii95QhOKv8PnsFc5fVEu1r7n2B1p5vy6
         uaUexMfCH87q52B2W0c+XyU9C8dulZdSY67UNVZpzV1p15y/FHao9wnwrT+g+pilQepF
         F4m0xxKnsTEpYV5bwJl8YD0so8o5a8bm7Y3kJiA2ZKctxBRQut0xVFqSCy0EC7Om5phQ
         dACMqTeFUb37tHr/Z+udb4ZCaStLMip4tk4nSJQw0P3BLd45zCSrupMmngeuSH8kr+hm
         imkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTBo4iqHDRrDDKPI4y5vhQWteq7V9GKKejVeNnKAfuh0qr/8vXejpo+p7r42ROkpjUuA7YxjvGDH9Ndw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRLkjgEIXagAGmYsT4xmrpIypY3+IbOiscwsdiZWkDk/epAoab
	RPc8VyuoqMAFNZ4q1LeOUHlda633bP4lpklSdJLVPbu48EVunHBFkw/xlVOZ2QY=
X-Gm-Gg: ASbGnct8jYyXeBxZezKxeey0CaiZ6VMh0TE/VJ7v5YKxhI18VbHpzqHB3GpO8XIx9Lb
	82V59xGMekCOeGegoCLXWCPepwM4ijKgj442ZvldawQvPNG+BPzEtygvMRYmKi5dCN8axj+wquR
	5/uuKFA/DBmLG6jIN++QH695sALztwP8bH/CTvZ/ZC23xwbrlgY/h3PzYsg2jmkNJzmEdRKSH8O
	XIyrhmudiVzz7HVW5oxOqmMGDu6DM81tg8fa5Hs8DtJR5yFj/2HbCY5cdAHsjdpBOsobaXWmqZu
	/8MAWcdJ/WTEDRIpURzVi3FAhE/x9D3aZtFi5QG5D0122B8=
X-Google-Smtp-Source: AGHT+IEEOAMHJtTh9A7UnsNCkf+awn98CeW+x9MzjDDROY5cvK9I7y+Ghubo1xqkoT5BOeZsJ2kCWg==
X-Received: by 2002:adf:e7c7:0:b0:38f:309c:2c5f with SMTP id ffacd0b85a97d-38f6f085f21mr9216442f8f.34.1740474317834;
        Tue, 25 Feb 2025 01:05:17 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86c93bsm1573540f8f.26.2025.02.25.01.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:05:17 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/4] media: qcom: iris: add support for SM8650
Date: Tue, 25 Feb 2025 10:05:08 +0100
Message-Id: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMSHvWcC/x3MPQqAMAxA4atIZgNtsFi9ijhUjZrBHxqRgnh3i
 +M3vPeAchRWaIsHIt+icuwZtixgXMO+MMqUDWTIGSKH13HKiLr55AxKFMXbGgxkm8EHP1R1Dbk
 9I8+S/m/Xv+8HjbvaYmcAAAA=
X-Change-ID: 20250225-topic-sm8x50-iris-v10-a219b8a8b477
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=LWZm3qxOUw3fitXbbaWTsu2JiZ5EMZfR2LJDHZNP51k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnvYfL9d0m3GtptH/raw/Nj0mRgdU+dGYg0VUAAxMN
 V/HKUjSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ72HywAKCRB33NvayMhJ0bYID/
 9dO9wSJsdpJvsCAi8Et8yNY/PfEJAU766vwxZx4nUpVDqDjelnL4qbhSEUMwYizMXM+B9lyIeg0m1e
 LuKlcri9s/nEnLHujqI9wzXc5mcGbDn0KvoCtMtIjg1bels/QfSpTNXdJXTKfre/5XsTX3wtg6WOlF
 qn98wUxqAQHfQrgWFh2LuO97meulSzwsbph/EweNAhVzBBheXGPC+5a1wBspcTDyKJ4UP51XXaRfDY
 EAJs06RpScdtwhk1Ls4xwEJFvn+TZyE3OyT1hLzvdqnyynwobQ35sTK0LFkSJktjECrHS+nnvPST/3
 uWz3tDKqoGhBVWBfZQYQ0ksDKYPCteK17LvpxD5fB2DD44V919R59H66PrDRT38JObxGPYdNtVD3+k
 zOnaXRPRXDG8fT9UkyEn+P6k97fkb9q3k2BcffAME3BElt8vVk/R17tzdMFeM2IjNcxu3YNlrjaLPi
 FUWM628BYTWCJVZsvi8rV8JMhF4dTcCvJAcuB+NDxCdrv486rv9ukemqUAUvuBXp2f2MZPKx4mfnTT
 ri7WZp+a8/pehCu7s5CykpNkGVTAUc6qzqkroRqF+OgDkVmJm5+lR62D62odob1IC+lhjhSEYjxsSw
 ikohUb++XtjIvP673umb0zFousBzDp6nnLvW4nOPBOTV5yLGka9Z5KUS235Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the IRIS accelerator for the SM8650
platform, which uses the iris33 hardware.

The vpu33 requires a different reset & poweroff sequence
in order to properly get out of runtime suspend.

Based on the downstream implementation at:
- https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver/
  branch video-kernel.lnx.4.0.r4-rel

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (4):
      dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS accelerator
      media: platform: qcom/iris: add reset_controller & power_off_controller to vpu_ops
      media: platform: qcom/iris: add support for vpu33
      media: platform: qcom/iris: add sm8650 support

 .../bindings/media/qcom,sm8550-iris.yaml           |  33 ++-
 drivers/media/platform/qcom/iris/Makefile          |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../platform/qcom/iris/iris_platform_sm8650.c      | 266 +++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   2 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       |   2 +
 drivers/media/platform/qcom/iris/iris_vpu33.c      | 315 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  14 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
 10 files changed, 635 insertions(+), 9 deletions(-)
---
base-commit: e2e6906b4ed2aae7441754b28db63dc7ce84d779
change-id: 20250225-topic-sm8x50-iris-v10-a219b8a8b477

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


