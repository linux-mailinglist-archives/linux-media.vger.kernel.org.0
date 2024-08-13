Return-Path: <linux-media+bounces-16210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB8A950512
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 14:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92BDF1C225DB
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BDF19DF95;
	Tue, 13 Aug 2024 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CiYd1YOO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BCC19D8B4
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552298; cv=none; b=f/OBl9hKYm9XPkrTkwTOsgi0bdQFv5ixxyssLP1vNEf8S3Se2B8NIja2WpfIHlbC7rb8Yzs8ceVkBj5ND+Dow5LBstmExmQsxF6omRM0aO9j3F3eTURGoMb8Wy9+8gbZJPwKUvOO7f9At9p/JPj4R7mvWyF+ALnuYaSfixuBc6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552298; c=relaxed/simple;
	bh=2G5axLdjt8/znqK8sczk5VikDq1NXPTZO4Dwxvg8Dbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kc8MD92s3qneyGSBvJa2M3WHknXEGGfOnDrOZeZbdfIW0T2ZiKkwQuEmwEQSw6Sfxes9wm4kHWGGpPP525odvvvOGVKlRFHqaXKcFXDjV/xwbuDOFZWj9O6fFZAqWIGqnq+9iGC7wdaIDcKkbFBEgC18m0zej5f8t4Vu09lebT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CiYd1YOO; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a20b8fa6dcso329891285a.3
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 05:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723552296; x=1724157096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0W5qW56HRdoH3DHUCwvvl2OkM1BfHpuAL0bk81ubPZo=;
        b=CiYd1YOO9tQ7fdL9U+iSBgtiixe0dx9zX+7eN2VCvqxWYCO6b4kSq1ZLnlXktkXF2h
         786IJB6u4mqduFlFeK6CvWf7p6VM80+oQk1QR6d5SK7eQX2jIkE++24hKh+8xNuJDJSF
         ol8TF3Cf/MILeef9BoNjg2Eduf4UhvUv77QTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552296; x=1724157096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0W5qW56HRdoH3DHUCwvvl2OkM1BfHpuAL0bk81ubPZo=;
        b=ANcFtWwbpRphF5v/gTBBiObHnykaWjYOYdSB57SsJsNl/ZSAffm4VsstgOqmvAjldq
         soFLOgarDlti/VpKlicQFITNi7QmbWAdKbmWvahA4os7S3PwzWkoChBHM/7MczBUZwYW
         K21mEHajFStcTsTF63IHY6+80gfLxzfQ7DLty7XofDT7fsVo4ITAce4KUFEzRAY6nVb2
         vvHvrvJW9Lm5J+wHVB272YIC/dAJMyT2U6hFWw3UWF+amuocuV8oSvx2vKCIq0gj2gUI
         OPl6GZuXkbrouwSTDztZ3Rm3tBbt5DApyl6Rrgn9DX8uXjKzVjDDZKHMipVYMW0G5gbt
         t7FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrmWWFzv4Yz3f0qZmU6gGCT6myI0FObQvyIZY9Z3gls9E5yvtk2JswA+w1bfd07ikGccoYl++kUs76zdeykqqolw4+1nzOiod3Hg8=
X-Gm-Message-State: AOJu0Yx91oDxFKEbhmT6oDTz+PJ1rvGC9U+N+eNcC8oC2yvWUJ3biRqI
	rt4FMEv/rfVKA0m3C2y0Fh32EkPQjiDAzJoJUR6C+cmcW8mbh9bx8/+Id2+f3w==
X-Google-Smtp-Source: AGHT+IEpFFQrr7nGY9feezV5QErFzlaHGDASr5/SqGvMjPOvkfIPG/a5NQ6X8RFSpTboNcExdfbKhQ==
X-Received: by 2002:a05:620a:2456:b0:7a2:ce2:5ae2 with SMTP id af79cd13be357-7a4e152cb17mr405801285a.17.1723552295658;
        Tue, 13 Aug 2024 05:31:35 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d66093sm337126685a.12.2024.08.13.05.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:31:35 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:31:29 +0000
Subject: [PATCH v6 09/10] media: venus: Refactor
 hfi_buffer_alloc_mode_supported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-cocci-flexarray-v6-9-de903fd8d988@chromium.org>
References: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
In-Reply-To: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Replace the old style single element array at the end of the struct with
a flex array.

The code does not allocate this structure, so the size change should not
be a problem.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_helper.h:1233:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 3edefa4edeb9..755aabcd8048 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1264,7 +1264,7 @@ struct hfi_interlace_format_supported {
 struct hfi_buffer_alloc_mode_supported {
 	u32 buffer_type;
 	u32 num_entries;
-	u32 data[1];
+	u32 data[];
 };
 
 struct hfi_mb_error_map {

-- 
2.46.0.76.ge559c4bf1a-goog


