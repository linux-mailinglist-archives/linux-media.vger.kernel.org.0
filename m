Return-Path: <linux-media+bounces-11082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9618F8BE910
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABC311C23F2D
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C5F17F372;
	Tue,  7 May 2024 16:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kijo11kH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D445117108F
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 16:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099247; cv=none; b=rGvtM5RDcDGSDaminJHjlGA+O+ETEL24cc46jh8O8lPpnsYwo+dPOy8mvNtF8LKgZcA0e1PphRm7duZFCsG/93m94KKxV+sqGSXmn7VPHSOCuelc51upZRq8KBUCAby4a+Vk3oy6r0zwZoljUFOknnoj5mP6R7gkBp7ecWUDBQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099247; c=relaxed/simple;
	bh=xx+wxFNs3ZuqK7Hxds/mLdbM5HIFghI8UQG5DaBamLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6FwvxWYF61XDaeKAVP1Exwq+Ha0RKEVflZXGUQahvhZ9COncD7cYNKorkiSP3oYcsgUlR+uV7XGref/RWJGPUDXDtWCm0qsfx1D6e2DWLnF4OvWf/H76map7h/UDMIufeTlqW3FeXjdW9s/G1z13vkR2vHhSSDm8M575yRXOoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kijo11kH; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-43d4a2d0a0bso16204521cf.3
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 09:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099245; x=1715704045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24yjDTHuOCF+C8SbX9O7bVVIA87jnk99ezK2b/3Gma4=;
        b=kijo11kHp2VAvCMSD4iUw/+pq4P4CA+f7MIsCw0/FUSb+XujX+hkKeCu264OA5aDBA
         5wdUM8cO+wONlCxMUKFSKDh721ktw7XSngbs7+Rd90021jKDJMZvbRBUegNR6CIVvnz2
         Rkgqrs9ZYugnUb5sh1vbaYj7t8FOMVc1EvYRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099245; x=1715704045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24yjDTHuOCF+C8SbX9O7bVVIA87jnk99ezK2b/3Gma4=;
        b=sVx0y+KQwlg2Zcf9e+Iqq0BgMkJE/HAr3w8/C3Oz4wHYxfHUcXnwEFdRV5R+RXMmVG
         hN0yJ11u7eCeBCINnHQvklS1NCw+rCNOvyFAHiALBhcUGu+0f7+4EH/hNpHr3KX3o8NM
         Bv3IkBnEGCffKsZ/l3RaF7JuVhAliUQyIYjP3bdCdIihU/Dag2z4eepbONqZyVGia2TV
         FoPOjxgM8wLHwOw/4+JQuEUDumO2hu3s9oLeJSDYtnsTRX3VuoZq2JPoFmVyh4aJKQ+x
         RPhum2zPUp5sbw3pQU8SpONUPHeiq14cZuwJpuTv+huMpLEObgeTult773LA4trF9pSu
         xjFw==
X-Gm-Message-State: AOJu0YzTS/zBCweIZoq7aH6fCJwXfFnwaCKnmjeMcV2PIR61KCgu9Rs6
	3Rn3KhOZVAUJbsBgHDW8CU+6cRFNWjLbeADFuLd9ECP++7/eTuiZt7KfDA0nAw==
X-Google-Smtp-Source: AGHT+IFXk9TiPGkyPd47b/0bfL7TWw3sW2kfDIDAt+NnUsqL7Hhdu3EhERFFZlCigfyFh6dM5Cuiow==
X-Received: by 2002:ac8:7e8b:0:b0:439:dfc7:aca4 with SMTP id d75a77b69052e-43dbf868fd7mr1746031cf.63.1715099244908;
        Tue, 07 May 2024 09:27:24 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:23 +0000
Subject: [PATCH v2 18/18] media: venus: Refactor
 hfi_buffer_alloc_mode_supported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-18-7aea262cf065@chromium.org>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
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

Replace the old style single element array at the end of the struct with
a flex array.

The code does not allocate this structure, so the size change should not
be a problem.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_helper.h:1233:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index dee439ea4d2e..9545c964a428 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1230,7 +1230,7 @@ struct hfi_interlace_format_supported {
 struct hfi_buffer_alloc_mode_supported {
 	u32 buffer_type;
 	u32 num_entries;
-	u32 data[1];
+	u32 data[];
 };
 
 struct hfi_metadata_pass_through {

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


