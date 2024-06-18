Return-Path: <linux-media+bounces-13559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B88890D358
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8795D286224
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799131779BC;
	Tue, 18 Jun 2024 13:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mq2qWFNO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7E916EB63
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717882; cv=none; b=FtzwAObPgKHTmh+YcWdNb6+cD1TiRiRI0+zDWnmjAKfXC8pqaM8pI2EazKL4A41rCbn9gny3c+wlsGp/7koBlrNCVmFatQrJgDEY4JGNEATM7+zl8bTpuCzKhQSee3MTw0j85bmBxhYLZMmbPpZ2h4yNZHVyEvSWgNN8nsXOTS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717882; c=relaxed/simple;
	bh=n7rLzzBBfHOdiSuzszfNn/euo2ePzTmy1Jk7b4uNXQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=shk7/ffjzjNfuclSUngJCDKi1n38vdOwotrgCdc8PilFZb/hcbfmYx4xzV7j1Rl6R+XnrHNUTW0knowcscmNIHdJLD+U7xW/ZrujlF1e6LIlSt+4OnteJmfotmPYwlMZOQRRRBorZeT+t7TgRTl3ImMY9Gmg3I32M7+kVpA3jy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mq2qWFNO; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3d23a0a32afso2952638b6e.3
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 06:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718717880; x=1719322680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/eq9KiqE9DhkH+J1pTk62wzUPV+ZFcAncSfE/zn07s=;
        b=Mq2qWFNOBV+XDeAiig97C0zvDRN7YUgzl+hkOr7jX2lwSGymaMVphRHukfuOOz4hOm
         7YClKFW/3PC7hqu+w62Nm2x/19MXN1ZSVwccH1zxJBN1ExGPIDwT59VEPTzPAxInObJP
         XZ+J/6lbiBavT9y4A7fwHp+q0rnrXF3FbRx8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717880; x=1719322680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/eq9KiqE9DhkH+J1pTk62wzUPV+ZFcAncSfE/zn07s=;
        b=jAq1TXxd5xP+AAToSKBEoJ0JLhBY9VhAcr26rcuX28Lvj0SVFr5GPIW7CWAQzusnsP
         NHu2a+KCtz7gQnGvn+8+bNewt6tMH4YbrvTEcvqK1KhWN62GnmxQCe8okGRNk7FhQdcA
         yj/OV0O+SCtWTWx/xgVWG/zZwYM2ZM4PEIhGsM2wshgOUZ8mOGDDwR3ogCwj0oBQpMON
         COL/jxMyFwYQDvqhOI5PMG7NeudMdWVbQysCAVrRFDD+Xwo7X6CK+G/R61qAqBaqosTS
         SMbTD+5d61RmY8GjFQ5fGzOE5KkociQbHoAE1iuscI+5ZRtUCnsOvvyOMmqtNRUTVg6W
         ljiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTxwElh4RtiIFHg35zogQidPO7TSOnjjlYyXbIlUu0q/LTUN43benTnWt1ae1Cqj16SM0mfcL7HBp2P4x61LKzjin5X4UWwVQnyOg=
X-Gm-Message-State: AOJu0YzLG8sZXH8MMpApBvo0XryZkioGkoZa6oi4VSldcNz3jyLnVV3o
	cQShqfwgHPm5f1Ftsqt/2MRy9lhKSLxd7gLFoC3hqAJduInxwpMjXJXVGV8FJBJ7RoQVBlc5eYc
	DG3Gy
X-Google-Smtp-Source: AGHT+IHK+MUXA9aHTIKx+La/+tL6XuNAxNsBHd2w0eK2r23/Txk8tr8Eu/lANB+LjBHcJGZuZjo8hg==
X-Received: by 2002:a05:6808:1520:b0:3d2:2356:d273 with SMTP id 5614622812f47-3d24e8a9973mr15936428b6e.6.1718717880067;
        Tue, 18 Jun 2024 06:38:00 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abc06e93sm521666385a.82.2024.06.18.06.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:37:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Jun 2024 13:37:53 +0000
Subject: [PATCH v5 10/10] media: venus: Refactor
 hfi_buffer_alloc_mode_supported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-cocci-flexarray-v5-10-6a8294942f48@chromium.org>
References: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
In-Reply-To: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
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
index 6202dcfc467a..242a3ba94555 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1223,7 +1223,7 @@ struct hfi_interlace_format_supported {
 struct hfi_buffer_alloc_mode_supported {
 	u32 buffer_type;
 	u32 num_entries;
-	u32 data[1];
+	u32 data[];
 };
 
 struct hfi_metadata_pass_through {

-- 
2.45.2.627.g7a2c4fd464-goog


