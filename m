Return-Path: <linux-media+bounces-11019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A51878BE3E6
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 618CB28C3F7
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 13:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E6916E88B;
	Tue,  7 May 2024 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="obSyJrvw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D6B16E890
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087925; cv=none; b=OGmn/u5EFqXugTVTBzKSWvgcNy/e1j0lq00AmMeE48Qp3JkiorO1LehtmIx04E+9iEP0ihzUEDzgQtUb+cuzM28pstfSpn8ky4e9rcaUI1DCkYsxtZe7kSMpI5g0a+4McS2D/CH2ajHviQaaOKOO6lGvJbtxEHn/psOslYcn5wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087925; c=relaxed/simple;
	bh=ty0RG2AjLK5Y8dTp7JoVE8oXrIivf7wrKgPB1ia8aog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dg3/21+TnDpzGTrf7VZy3WJEtk8XQaSMNhxTC3v2W3/prxch3zmzR8pGrigowAE5OOHJjJ9hiI+p4j/2ce8Jp/GlkpAwQX5U7rCzwis+LmyCQNSjl81RrWwP+tMaSCArpwIQv0UtP3SqZ66CFfWDlxcCoxaq81x8OEKxCrfuF0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=obSyJrvw; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6a0ce3e823fso19358086d6.1
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 06:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087921; x=1715692721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqFGKWXdCy9k153fMpH4CQDZP31MGLQ/EHV/2T77xUQ=;
        b=obSyJrvw1dCDY3GDBwzEKkjnlj6UPysGGaSPXZ6xUOMQdUsEe8bA8J2OqNB0Xb2Esk
         A1sbLdCj+pLI2tJICTch1W9z28IuONUQbSSi4ZPcy6xAQk7SUY9a85KXHuuj+/7zaagK
         7AjXfLsmpxpduU+CC1WRMNS1COCFJMiotwhL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087921; x=1715692721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqFGKWXdCy9k153fMpH4CQDZP31MGLQ/EHV/2T77xUQ=;
        b=d2aaMUUG/Uvj5a8c9pxohV6EudD+vZLMb/QmSCht3yG6NihC3apLcieUIiQ+Em8lrH
         fAL5p1oDf23W3NrjlDLNa+oIZynaqgcO3MggDTYflpOtZo1nSh5pFPbS9GFVrOp1U93k
         g1Rqvy4PNFxmYFD6IR3t3Cti8ZXNJ5n6xyu9UyiWd3X5uavBt9gYZgNsRSMUbiQHvVo4
         UCrAmpEdwXLQGaiE0buFxy/oyqKGGdzmMc48aYz4eXwyfYNzOMBB44QHHt/i2pPuK0DR
         0HHBH/LOd3IB1Yrof/lsCImqRiMqE59kvr4QgZOhjcDLPEX4NEWLFi5X7Q1DQH4tWRFn
         Fwpw==
X-Gm-Message-State: AOJu0YwJz1ZomyIbO09KjDBNnF4fNcPALYruCDTHq7w9WyEp0kbdYjiH
	2R9eqa+OkRd2dlJHXDy1CEklTP/zINlXI2hkQeSJVK7HrmF4VLjr0Ys9ySUFZQ==
X-Google-Smtp-Source: AGHT+IE/nAbjO9kVczxA1gk0GPTE0dAFY7dS/lNzVrz9t9IGNz9TsBD03sWLikOngI39+ClQ/E7Uhg==
X-Received: by 2002:ad4:5e8a:0:b0:6a0:b705:27db with SMTP id jl10-20020ad45e8a000000b006a0b70527dbmr17551263qvb.13.1715087920745;
        Tue, 07 May 2024 06:18:40 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:39 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:37 +0000
Subject: [PATCH 11/18] media: venus: Refactor struct
 hfi_uncompressed_plane_info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-11-4a421c21fd06@chromium.org>
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

This field is never used, but if we remove it we would change the size
of the struct and can lead to behavior change. Stay on the safe side by
replacing the single element array with a single element field.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_helper.h:1003:43-60: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 7c0edef263ae..eb0a4c64b7ef 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1000,7 +1000,7 @@ struct hfi_uncompressed_plane_constraints {
 struct hfi_uncompressed_plane_info {
 	u32 format;
 	u32 num_planes;
-	struct hfi_uncompressed_plane_constraints plane_constraints[1];
+	struct hfi_uncompressed_plane_constraints plane_constraints;
 };
 
 struct hfi_uncompressed_format_supported {

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


