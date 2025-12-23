Return-Path: <linux-media+bounces-49407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BBACD8B59
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 11:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 516683024252
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 10:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1987933D6D9;
	Tue, 23 Dec 2025 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OkDKRS/H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA4732B997
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484185; cv=none; b=dPC520Awn71qGvTKDGyPxe1ePfMZuQipbbQecCjzdQEsr+FTN16AzQO+89seb+9NdduSkPdurIXOB+ixvdlmmtRNPwQwpijaOLobicOLPu8UL53vbGsLds+ugIYDE3L5c3vDvmSYwuvofqqLabiJfKquc+EBJvGsm/5/8kYg/CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484185; c=relaxed/simple;
	bh=nx8K6tan/QNn5EfUUSAPfg7W+/XmRXBvuTSqrm3XyOk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pWMB0vzTuu0Sns885+5koU7g7ycRzGiqPe4Jf54X70puBFpNNH62Pl0Z65sdRP1SBpEdU9bSdsCICYiCWccAO27C+nnezMkIc+WPIIOZuTq+hAnaRKBCsb7WHXM2hy4BV2+Lgj5z7XCCJ6CLew+hMfkjR6z/tSnlSPobMFfayrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OkDKRS/H; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-598eaafa587so5368918e87.3
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 02:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766484179; x=1767088979; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MPOJWhWUbwj4+YmlyGL0cehSqlyWaUBDHW9FsBALQFU=;
        b=OkDKRS/HJHI2xKgiUO4pccgSzsLMNrv5stWqo1H8UCvZE+sspEqoplhXp/P8IoI2AS
         p9yeP5NrF0oKhk/PDXnsHwZVhQwQJYZoqrfjFqHjuGs8mFTB9vHucuV3F2rkkX25y7hV
         snMkC2h2xcwDJh89oc+QHS7JexnEuYvQnZCOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484179; x=1767088979;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPOJWhWUbwj4+YmlyGL0cehSqlyWaUBDHW9FsBALQFU=;
        b=VzpYWzwJy6txRCoAaf8n0baxxS/PcztT21ueHS+XEGZr3V8tJyqvxHOZLmplLJVao5
         ARQ09zTENQG3WB63caKuWofcRdw7Tj40JHFOM6Xn9tB0UIvsKWwCDE4SuSoxeGoLf9O9
         xMXceDjQAYqsKrNozRs12o41ujQfo572raMPW0sOazcwiV3v6bAdUzm+9PH0tMuxpfpb
         MBEyIky+yMZWzUpqT3ZRD//AhXPyVB+F7dQvCd9MG5dved1DzYjN5Ys3oJyQOiUZUs9b
         2ZUqxttBV8kQ4dGpLV0+VakxoSF2dpS31Cxi4RjjYZWimBcEsUFDnEtkxXq0V9NOQZmJ
         Un1w==
X-Forwarded-Encrypted: i=1; AJvYcCX+cKkZKjjVy45OlxSrF+5hn/pm9NUF3F9qjokmtB1lupObxcEzw02S80gLmYrVe8EPihXRjt3fbbFPlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl76kYK2aS3aOD2/Axqs1cslEjo48rIKFKdFCyl7TYBD8S40ck
	2BZkhO26WE8HvfTI/XepBf106SIxAfA5m8AwvPPbKigy8peiQSMF/uMq/O1V+5iYjcnoW4ediXr
	Kih7omA==
X-Gm-Gg: AY/fxX4taxYRoabJdVQ1jzDUMSQ6FXFP+XEdpBeSSlsx5QpVjBqO/CIudpssI4NPdWT
	TeTV7wpBfPP/3UJ1jKctyELubSwV2Iw/ARmW4LjCDIdMaF0KpvrN4cpru/1jexGR669RDfDEAAI
	Z+Hg6F4V6JB2WoMJboEiQ1onPkgzksfw0hZ94Js47bu2+MWsTTW9S+eZiATNP7MT3cTeCdKyznD
	EyBOrtuXPj4GOO58VSwvfyUK0CtuYLM2bxY4ak5vjiJBP3CUC8KyxNQUc/ocpOJN9944VFbrxNZ
	UMCEHetoZEsubkZmIS3JOKA6e+hf/5mXu1+vzDTU2FflY9B6BQSIcAlsRNVRBMeQU7Xp5yli3DG
	L+lLujbWVuqgMSbrXOJHqXH/RYh1vpfuXo2T4H102qPCTxN+U8QGiCGYHxvMJye0eXX25L0Aqw3
	RACmdXdo6Pp4O2vZOe1iY3ogGuLS95PRjoQkNtarFJhD0BR1poCAiFw2SFsho7yG2K28LcwycPi
	9ezdCjL
X-Google-Smtp-Source: AGHT+IGzEUd9T1bHHSjyJsHhgmQBU/RZOEDVaI8g/q+eVpi+sAPzZe8RKm13yx/8116PkYRSagGCnw==
X-Received: by 2002:a05:6512:1113:b0:598:eed5:a218 with SMTP id 2adb3069b0e04-59a17d74470mr4577598e87.10.1766484179512;
        Tue, 23 Dec 2025 02:02:59 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea248sm3891990e87.43.2025.12.23.02.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:59 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/2] media: Fix CI warnings for 6.19
Date: Tue, 23 Dec 2025 10:02:56 +0000
Message-Id: <20251223-warnings-6-19-v3-0-e8f56cb204ec@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANBoSmkC/13MTQ6CMBCG4auYWVvTn1DAlfcwLqAMMAta02rVE
 O7uQGJi2EzyTvI9MySMhAnOhxkiZkoUPIc5HsCNjR9QUMcNWupC8RGvJnryQxJWqFrUVnZ1ayv
 r+h54c4/Y03vzrjfukdIjxM/GZ7V+f5LZSVkJKXRhZIXK2NY1FzfGMNFzOoU4wIpl/Qcouwc0A
 wyXBZoOHZY7YFmWLwX7INjuAAAA
X-Change-ID: 20251202-warnings-6-19-960d9b686cff
To: Keke Li <keke.li@amlogic.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

New kernel version, new warnings.

This series only introduces a new patch:
media: iris: Document difference in size during allocation

The other one has been already sent to linux-media or linux-next ML,
but they have not found their way into the tree.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3:
- Fix fps calculation (Thanks Dikshita)
- Link to v2: https://lore.kernel.org/r/20251216-warnings-6-19-v2-0-12075e3dece7@chromium.org

Changes in v2:
- Remove already-landed patches
- Use ->inst in Document difference (Thanks Laurent)
- Simplify division (Thanks Dimitry)
- Link to v1: https://lore.kernel.org/r/20251203-warnings-6-19-v1-0-25308e136bca@chromium.org

---
Ricardo Ribalda (2):
      media: iris: Document difference in size during allocation
      media: iris: Fix fps calculation

 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  7 ++++++-
 drivers/media/platform/qcom/iris/iris_venc.c             | 15 +++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)
---
base-commit: b70886ff5833cf499e77af77d2324ce8f68b60ce
change-id: 20251202-warnings-6-19-960d9b686cff

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


