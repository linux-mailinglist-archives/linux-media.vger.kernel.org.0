Return-Path: <linux-media+bounces-24335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E17A03D09
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 11:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27E1918861BB
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 10:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F99C1EE7A7;
	Tue,  7 Jan 2025 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OmYDnlDY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A601E1C1F
	for <linux-media@vger.kernel.org>; Tue,  7 Jan 2025 10:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247279; cv=none; b=hKG6AhYfTg8FGJha0dqSfXhZcXW8E5c/2iGmVBIiDaGcI3fWHCk1lEX+RIBgXsFrwiDjijg3olJytiYSm+1gsnwjSVqjKAJwIkeFqBo2oG3C5cNurU/rQW2aooyyhGE4C+PcoQoCq9ti1na3SJakA5H5TA5/JNivglqzKMRwL5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247279; c=relaxed/simple;
	bh=+5gKBR6lmCbLgDxwlcOKTLF2APbAil9sB0eDtQkBz/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAg6BMfTZfb8X5QM+Hivpf6/z7xtrptgafUrfKiAICtyoIA3ezbsApjZzhQu47L1Q/sRnr4bzlDsUznSzQ2/3QR1NTdUTM2Gy/G1YHGnRTKicv5TsRlZdmExVziGuN1/HtgktL/pw4SLEwYli8StgBJ2DqE0NBm0Prv3WaS2yyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OmYDnlDY; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4679ea3b13bso114472651cf.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2025 02:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736247274; x=1736852074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGXizJerOok0lDZxPeMPfVFSvShgmDlyLJgvxCS81kE=;
        b=OmYDnlDYdk/KuFj9tntNVbb0mjhr0Tlsf69d3jthYs7lazDlPW1KmPyMtj2epA/9hR
         ZidYI49re23KxMxOg23mgOThD3MRDN2sRnvUbCP1etLl8i+W8AUK0ZceWqU8vULe5oIP
         zxLOE9T94ciccTwrhOcnenUlfd19N7OBaDtq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247274; x=1736852074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGXizJerOok0lDZxPeMPfVFSvShgmDlyLJgvxCS81kE=;
        b=PBau1v4mIwCD9tgoSV75PQqJ7+Yu8AstU/1gL8M0cflkEcSUOZYf563kDZuzYZk4gb
         KhbNrtwBiciLiNOxrEmfpbLh1aFpNgRTCKpubfN35z5G1d/QQ9qBSYLy43zl8fcogNQh
         MX6HVsc3edcej/vEBHmnS4uLEbQh0qvxLtQvMVLSr2BNKk1mY0/QrOXuFDP9x1iFVI2z
         YNbmXnIyyfkyVcdtCfjRNdQbfMDe/rTo9VlFweoTbWy+C8Jwy0S/qIRF6aG2VZrQ5edm
         R0NdPcMD8ZZrSLbBmeGq5SlvL1x+Vwa+swoejzvnmU6ZpxmuaspqQrXTySsNNSwmO6iP
         lfjA==
X-Gm-Message-State: AOJu0YxR+tN6dvXw15oLmuV32TRXwIDc+26G3d9LuhrQEtqUigpzvFf8
	QfgZO9Jusyk2J5rzQJhYwqRb6ccvSHUdZ/uTUlsZMjtbfT2MeldUPVUMnc3S8w==
X-Gm-Gg: ASbGncsYAO6fyPCU+ago2pSZAYDdpfp0/kCEZxU2GB0sNrG1u2RzVJwCYJJtQ57T5Kk
	Ab19Xa26Qg4Rw1Bl5pESlYjqsmcqgE+9lUODR2kiKPWQgcmETO6E9B0yW/4lxyv4lv2kqtRRXU4
	31iXgBZfJxRtoCcv+I17+OBdVY4yP1SGDaRG8AWcY1x3lRAAJGQU7lFmG0s/82HeWMQzy11Lw7B
	Tb2peH4ThjcP2RXBdr6WT+aEkTLO+FNLquTqQbTaQBmeO76/RrbD3lU7BoiHbRzgXNoND8tR1D7
	2/uWqJiIqVYBLm8nfbMIVH5oAQWNXU5LtbV7
X-Google-Smtp-Source: AGHT+IHz199hYVLZJGl8XkV6sZ980/ECQyaTerXAnHVSgTk+59gGPDGHyUBPMp6JKsfQxJgo8zL/sQ==
X-Received: by 2002:a05:622a:11d6:b0:467:b625:b37f with SMTP id d75a77b69052e-46a4a9e2d94mr1239780591cf.56.1736247273768;
        Tue, 07 Jan 2025 02:54:33 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb30b97sm185094401cf.86.2025.01.07.02.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:54:33 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 Jan 2025 10:54:28 +0000
Subject: [PATCH v5 3/6] media: venus: venc: Clamp parm smaller than 1fps
 and bigger than 240
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-fix-cocci-v5-3-b26da641f730@chromium.org>
References: <20250107-fix-cocci-v5-0-b26da641f730@chromium.org>
In-Reply-To: <20250107-fix-cocci-v5-0-b26da641f730@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The driver uses "whole" fps in all its calculations (e.g. in
load_per_instance()). Those calculation expect an fps bigger than 1, and
not big enough to overflow.

Clamp the parm if the user provides a value that will result in an invalid
fps.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
Fixes: aaaa93eda64b ("[media] media: venus: venc: add video encoder files")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index c1c543535aaf..943d432b6568 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -411,11 +411,10 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
 	do_div(us_per_frame, timeperframe->denominator);
 
-	if (!us_per_frame)
-		return -EINVAL;
-
+	us_per_frame = max(USEC_PER_SEC, us_per_frame);
 	fps = (u64)USEC_PER_SEC;
 	do_div(fps, us_per_frame);
+	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->timeperframe = *timeperframe;
 	inst->fps = fps;

-- 
2.47.1.613.gc27f4b7a9f-goog


