Return-Path: <linux-media+bounces-11012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A5C8BE3CD
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B97728A221
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 13:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CA316D9DB;
	Tue,  7 May 2024 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KBC519u0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8884816D308
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 13:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087919; cv=none; b=HjRG1p9wnuqQzwMpcK7vqISfEJclrDr/9pVYm1OX1anR2QG20hJ3Bf5k9kOXQpNxR6sbPnmCkgLHvBzcHQmIw9057tN1b8ecyqPEkiHShH3TmUhx4p/NfjyaL40tUHsFSlFCrc1mJyGqLq+sU631zwG4yNVFQ+lduY27c5SrpUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087919; c=relaxed/simple;
	bh=ENYjVBtJ4EPS9w/ftPm8y0fja8ouSlg/VUcwtfy4KyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFc+Pk//34pY0Tb5ThoIsX+Y/y1kJyf5t7svlNCtOhdfkIk5uDMo8gMx2w+dtKyt1hAeR4AfdcafLWiiSWmIIfznjNe8sdXNmzSmWk9lSUR6eNwTBfcqcg0MZpjOF6+BxbOTNpPiVE8Cu2q6xbEk8lCTYWVLZ00jkkiCpeiMIys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KBC519u0; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3c963880aecso1112943b6e.3
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 06:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087916; x=1715692716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bajBIKBKiGkzVrECr+DrCDdr2oyOzpQYYR0WAIoyaos=;
        b=KBC519u0YUZRmCX814fdQKpA9DlYSwz1bySNckmrtHfZxffY9CGzwwo3nEWshOn0lS
         8v9an28RN3ZuLUZoNoPCjNSUaymk5IwXUr1AI4Qmfzc6ZauF9dmvpstHrufZVgY5PRuy
         ZmGawl0KywrAVsBanr0/J+DjkUIek1bN8rc0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087916; x=1715692716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bajBIKBKiGkzVrECr+DrCDdr2oyOzpQYYR0WAIoyaos=;
        b=fYR+uomcxPb7yehcHYqMLD1uxwaSLxSOFCpqXO8MfVrDp8QrTODqvYB0W1Wtz8/QeD
         uWrMaFNrwk/Yd8K3PPCvhuE4e0G6LBAMDQGndaYPyrmW8C6uFM/iZ5B2ElmZTY39OXb0
         FcDDuMMjvZml0X7D+B7NJ2ICz65U4aTp6nwIts2hiKwDQo1SiGvRnqhPFphnCdeiMUd+
         2ZYrdiX+AlXf6gc9D9DPs32G+JORBd2rXXT0KYsY9bpnPh2NEIyDbeaASEp5ZRRtKXLk
         ld2yISLOp2L/DJpP0BqCscHPGRs3Wl5A2LghmHz4+ycYE2j7ev2YWY9fbyQIWDfhGthv
         XZqQ==
X-Gm-Message-State: AOJu0YxDB77nLuDrWZC1ZG3LSXFwFc7/YcZb0ePljvs4QiVFcjObKVaI
	F77S12tghet8C7M8iv5wvRC/rhnWGUk8MNAGOTsERUWNwR3fbjAF7P61weA8O2G42J5AxcnlGUw
	2mA==
X-Google-Smtp-Source: AGHT+IEfgZc+3NqAZNZgDbuMWn1SodDQc1fgSaycXBKpVQJhCw/vqcobpSG60CD78oLq4SUhp6OVxQ==
X-Received: by 2002:a54:4195:0:b0:3c9:6e70:cf99 with SMTP id 21-20020a544195000000b003c96e70cf99mr5053014oiy.57.1715087916576;
        Tue, 07 May 2024 06:18:36 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:35 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:33 +0000
Subject: [PATCH 07/18] media: siano: Remove unused structures
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-7-4a421c21fd06@chromium.org>
References: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
To: Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

These structs are not used in the code, remove them.

This fixes the following cocci warning:

drivers/media/common/siano/smscoreapi.h:1049:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/common/siano/smscoreapi.h:1055:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/siano/smscoreapi.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
index 46dc74ac9318..bc61bc8b9ea9 100644
--- a/drivers/media/common/siano/smscoreapi.h
+++ b/drivers/media/common/siano/smscoreapi.h
@@ -1042,20 +1042,6 @@ struct sms_srvm_signal_status {
 	u32 request_id;
 };
 
-struct sms_i2c_req {
-	u32	device_address; /* I2c device address */
-	u32	write_count; /* number of bytes to write */
-	u32	read_count; /* number of bytes to read */
-	u8	Data[1];
-};
-
-struct sms_i2c_res {
-	u32	status; /* non-zero value in case of failure */
-	u32	read_count; /* number of bytes read */
-	u8	Data[1];
-};
-
-
 struct smscore_config_gpio {
 #define SMS_GPIO_DIRECTION_INPUT  0
 #define SMS_GPIO_DIRECTION_OUTPUT 1

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


