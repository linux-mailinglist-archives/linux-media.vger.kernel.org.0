Return-Path: <linux-media+bounces-34965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAD3ADB570
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC2CA3AEE45
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B831F8BCB;
	Mon, 16 Jun 2025 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T1bBJ5YI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC9E20F09A
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087761; cv=none; b=m35reAdcB20xrMnRI5Ovp0XeT6WLHuZ2hZPVgLRGqrV8iWThtaffmMTY8YJI4nzGMAluQYfVG3wDjtE2KYLVhkOUyecpIvwacj/vJJhKg3oEO7GEnfgakoBFYa24ZBPhkK/9c85PcSqOGPvtvYfCkCGxzw55tI2o7B02JQTJLZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087761; c=relaxed/simple;
	bh=9mIEujvpvhTohHMZiy5M0YoUiMGbG6gmK8Vd0nLEiI8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tpKK9FmTzz8DDic3ZSJLVmbhFiA+V+/J2dw43/ubWHIODkGwf7JTZRxDk6g8protZv+63N6mP8IOs8Yu7Z2BntYAIfKTLoHSk1DQMmWiz8V8n6zyq9crF7QPG60Jt6SZtDoohVhXgTL+TNzPhTAqoMLzKkHVmLlXYhNYtOPoxKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T1bBJ5YI; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b5165cf5so2969732e87.0
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 08:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087758; x=1750692558; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GrYQ5RYm/ndWHeW4zKWZCLsfb835d3RGk3FNTjrEr7c=;
        b=T1bBJ5YImNROcy4fvQB2HLFNW2DWcsc+UdFfZrG+8qHaaCATHXqvhG8Y6l0Bnj5atU
         AKWcPIg+nzaOnxXeRjh48waIgUjvsrGz58xBf31sOQXHJaZzQys4QwuzkReSCStUDAMg
         8RI1ZEcZvZaltkTj/0Rs2FoI4JqN1BO+vrmKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087758; x=1750692558;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrYQ5RYm/ndWHeW4zKWZCLsfb835d3RGk3FNTjrEr7c=;
        b=UH/OvUhNbqXD8Z1iOI93VE09u8rQMXbvDzHh9niK3zZC5538GhX+9H8xCwEl5JCnDW
         C5dRwmK351OzPjjtMkku/xxUtfyY5KObCBOd8KRNxh1SyR8A+S5sRNUGIT0awd18tvG1
         tEkakNvlFa8Scou92wAiusjoyM6TFPUykrkc8cxho2lqurlDIa1HSyxWMaCrGQIuSZtg
         u6G/A1JY2pVBNLGx0hwKOUnc7oZ5wSctc3/CYF6aA5XyCkOivtIit80fLKeYscoK/uYq
         5ar4ioEUT2iQjuYW4HYKBzXBx6BfoKgx9567zm2oVcxZcdJtLNYXx17CdgEVrdzllr6t
         wa5w==
X-Gm-Message-State: AOJu0YwGSdoWJYDmABjHmGEYuF9g1XLHt3yOdsNGySx/oY/mKMGCVg9Z
	inc8HEDgt/DpStnxui7goictJF+HmnvxamR8KoI4mXH9Dcnz6gBW/CvpUHlk9XZgdA==
X-Gm-Gg: ASbGnctFn4EqaqD+qB6Ev9+1s9Uih//53+zHyhOLqWzUOVN93FBNyAE8v9xIiGo2bRS
	+3OwSpVr6CPNkbtdWY1PSMWktYaHstu8eqeukxQkxP15BfCaIOnkrsydeA+uZ95klpwhUs7arkt
	3lJwzUUAS95TIMOpb7HEWO49AuBeMyLsXE7chQG17qP8QwIJK6pMituZOth0CPVDsWHs7PHJ6Y8
	7Y6erwFt363Ri2exhMnPfggybrzpR9f/AHg/WjwAM91z/JlI1lx/ppAsPzx4erv/ZKgCEebhTM9
	ZTLu7jpP2tli1i6b10C3j5FNpxf7v1R0B01ULalyKsp0mFNoJqzjndBuu/FOzF7b53T4PMZivbc
	NTo7tgUTmFdm7asXhMLnAykn6sEx/R3hkbjku0dHusw==
X-Google-Smtp-Source: AGHT+IG8dwx90CB8xqMFS+LG9CbZSlFFxF8OJOXueRX1llJPl7IR0aw+2En90Yu09u+vcnLxI5GGLg==
X-Received: by 2002:a05:6512:3a92:b0:553:2edd:a7e0 with SMTP id 2adb3069b0e04-553b6e9c0e9mr2419431e87.16.1750087758451;
        Mon, 16 Jun 2025 08:29:18 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff5dsm1568020e87.31.2025.06.16.08.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:29:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 0/5] media: Fix coccinelle warning/errors
Date: Mon, 16 Jun 2025 15:29:13 +0000
Message-Id: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEk4UGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0Mz3ZLU4hLd5BRDgxQLQwsTQ0sDJaDSgqLUtMwKsDHRsbW1AP7ZUo9
 WAAAA
X-Change-ID: 20250616-test-cd10d8184190
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

These is the last set of patches to fix all the relevant patchwork
warnings (TM).

Changes in v7:
- Fix error in clamp logic (Thanks Vikash)
- Link to v6: https://lore.kernel.org/r/20250107-fix-cocci-v5-0-b26da641f730@chromium.org

Changes in v6:
- Improve comments for tda10048, thanks Kosta.
- Link to v5: https://lore.kernel.org/r/20250107-fix-cocci-v5-0-b26da641f730@chromium.org

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (5):
      media: venus: vdec: Clamp parm smaller than 1fps and bigger than 240.
      media: venus: venc: Clamp parm smaller than 1fps and bigger than 240
      media: venus: Remove timeperframe from inst
      media: venus: venc: Make the range of us_per_frame explicit
      media: venus: vdec: Make the range of us_per_frame explicit

 drivers/media/platform/qcom/venus/core.h |  4 ++--
 drivers/media/platform/qcom/venus/vdec.c | 23 +++++++++++------------
 drivers/media/platform/qcom/venus/venc.c | 24 +++++++++++-------------
 3 files changed, 24 insertions(+), 27 deletions(-)
---
base-commit: 4d2c3d70799f5eb210003613766bbd113bbebc1a
change-id: 20250616-test-cd10d8184190

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


