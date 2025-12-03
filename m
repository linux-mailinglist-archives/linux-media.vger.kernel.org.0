Return-Path: <linux-media+bounces-48131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEA7C9E519
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 09:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 71DB4348C70
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 08:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862DC2D7DFE;
	Wed,  3 Dec 2025 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BczPEQLL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CCE2652AF
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752143; cv=none; b=KO7A8lEGj+epB2UshxH6LXERgrw8uhJidqSlLv0AEfmiRnxhT8k3+KwAxdziGJd4wRGGYM3TA8+ksvvBOahP3WrZQiRcZEO9VmQHXI9R7pvWJL5bOukMrN5H+vGfnqwe/v/LOFf1LLnGEcpGwEK9lFvljMb3ndm30WXy8JvvbzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752143; c=relaxed/simple;
	bh=WZwTc3WGipU1rxTNrNT9q0JuopH580L2gUZ5qc9A4bM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oYg4ALnijJbDBxPdJh0DzpC9RzSPcSdqmEF3u5tst5qO55Qa5Bm/w3ulxzt+7TyVauAqCuwDFlVhPmgfcnja57Kk07g82rchAC26PnWs9b1DbkU85xxC+NrHcXOtpTu32b0GOeryXRZMNUDrU8Epk6blpgp1ScKqEjXqc49xkoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BczPEQLL; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59431f57bf6so7253865e87.3
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 00:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764752138; x=1765356938; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLEuON7y1u9cDHc+MoWFTkLv0fcCZt0Zegqxsu+jQjM=;
        b=BczPEQLL7K9eG1OhP1XvbgvhWLu+ma8QxLl6c3Js09CIKt8o1hlW9zULnPOUF/QDc6
         qzaX97VtDkN7xqiGB/TUw/G70+fyedGpRyKHacjqJLxsS47yhvnx/OEahD3omBXhDXEl
         QE9a5Sjk8tCnh+5wer7eWih2tXxclpGYB+lkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752138; x=1765356938;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLEuON7y1u9cDHc+MoWFTkLv0fcCZt0Zegqxsu+jQjM=;
        b=iXXvwpc/CG8vVD2iptJy/GFPOLNZL1f9xo2fUPA7ykO/bU0JcuuR7P7jYptcgJ7Mx8
         7OSJe5W/0GZDBDlStKEPeCadwc0rcZwNsOWam/VMd2BVyexnsz5wF6DzEZItcvdEyPET
         oLKfv4pwPLnm74MgGiPbX+CPC+XQW+M/fQ/ESq/Smr7BF8l2nb+153f6ET+lyHK5cXjU
         fV1IA8XeYo5zgeOKBWKIAr98gYbd92+KmGH7d6Kzh5MKwT6moaBNCiwhuWaaeI58rkZQ
         AR/jqaKOsKv0v+KmyH8Ht6cuhaZ+LfggIyFisWYp0SKbtK8O+dLsh3qyJ/Qtf0pTp9Bu
         KTLw==
X-Forwarded-Encrypted: i=1; AJvYcCUAs961OYiMJj2dGKyQgPlpN1YICyq32zYUc8CgxTOZFmoThRLDIOSKpg//+9QDKFU/+Yxer7RCQ0+Y4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU6q5Ke1yzP0JxoHL4YoRHPtI6lI+94fQNZE8ZN3Y0QRiWz58W
	ldv2psduo9knMLSE02cIh4A//pBjUzz/yYx2ixJzYyfdJKdOpHwzJyWDvDIOAGmm3w==
X-Gm-Gg: ASbGncv5dTOkBdGGhCeUc5O3UalT495+f9Zf/2XFKlho2F0QOl6BWPXG5cNdbTx7YLh
	eDhIOKW8eRB2+PWaApujzijVepZHLnlXMznIywNzlKsICUh/X6FOf7py7V2UG8YZDo8NwFSK1CY
	tvEQphApV77Mxq78+kgQmb6V6OdkIcjmc4Nzbo8A+vEs7mDagA29n27zObB/06Qhrx01+jsSWcj
	ip//lUo64awck/2te+h+bFl4GSrONNzw/32Ra+hIxSc8QeVHCFtHpBrlKnHGFyukeesxGkAVQQB
	TZ3vP3CamiBEORwj4+wZab5wFE1MAIAF/iT5GDLBR9pofs6bxy/qtHzHrJR4kTQ+8YrzaP/5woA
	lsS0LjiZ19Dj/4OF1Cpz2N7x5fX2UX4zh8tK/4eb6NYhsJ33scFI5MFSG2YF4b+OGsIPYhMYGQl
	1ZTMXeflxa+DzA/JF0WGIp7HhCvPLru1xbuZw2YVaY4d0dWt6nOS4+kdTpF9SyD14GagLE9Q==
X-Google-Smtp-Source: AGHT+IFJK3gmRvM23rF/5dH2NkTCVXsct0rPtygHdd/7NJo5i6wrVlVL9QhzHou3oQOeS0kXE48mpw==
X-Received: by 2002:a05:6512:10c6:b0:595:8200:9f87 with SMTP id 2adb3069b0e04-597d3f63d64mr733419e87.17.1764752137618;
        Wed, 03 Dec 2025 00:55:37 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa43f3esm5315377e87.47.2025.12.03.00.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:55:37 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: Fix CI warnings for 6.19
Date: Wed, 03 Dec 2025 08:55:33 +0000
Message-Id: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAX7L2kC/x2MQQqAIBAAvxJ7bkGFJPtKdDBdbS8WChWIf0+6D
 MxhpkKhzFRgGSpkurnwmbrIcQB32BQJ2XcHJdQkO/CxOXGKBTVKg0YLb3Y9axcC9ObKFPj9f+v
 W2gf9dPQ/XwAAAA==
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
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

New kernel version, new warnings.

This series only introduces a new patch:
media: iris: Document difference in size during allocation

The other two have been already sent to linux-media or linux-next ML,
but they have not found their way into the tree.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Jacopo Mondi (1):
      media: uapi: c3-isp: Fix documentation warning

Ricardo Ribalda (2):
      media: iris: Document difference in size during allocation
      media: iris: Fix fps calculation

 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 10 +++++++++-
 drivers/media/platform/qcom/iris/iris_venc.c             |  5 ++---
 include/uapi/linux/media/amlogic/c3-isp-config.h         |  2 +-
 3 files changed, 12 insertions(+), 5 deletions(-)
---
base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
change-id: 20251202-warnings-6-19-960d9b686cff

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


