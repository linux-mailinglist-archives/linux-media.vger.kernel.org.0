Return-Path: <linux-media+bounces-30473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56480A920B0
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 17:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1092319E8305
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 15:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E12F25485C;
	Thu, 17 Apr 2025 14:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MM7rhJxa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3637253356
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 14:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901953; cv=none; b=kW1CFw0yHMt2oXFQICr5lVandjel99ZFwuXV5CdZBm7ng2DW86bz3rgaM/36bc8OHJ/eLjl8gGigOcgH4RKfJNndGMGEgzAYQ5+WbRB5pYlifYz4hdKbNOvpusjOirwbkYJ6750C7m9S0EPa0SzYq92mY1jVx7JZbvoTDwQ7sxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901953; c=relaxed/simple;
	bh=O1n9ZGon1tW89nP5AxkkAnhFJkmvU1gNvIer5n3oZ2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QLPLJ7opbUdfkBnwOZiVfSEd24XIOt4t5qv1K8+aoVB4yErIpoiPq5KOtmWS2+qbixifGAOFuMCct3LOGPPdj5pOb+TSUprRJu0HxlAlAfoE/dghdyegOusxmfFiZJMqMRW+w8p/6TApB9PjqdXAdVBCAC++vZwYQrgcjUciMhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MM7rhJxa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso6428955e9.1
        for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 07:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744901949; x=1745506749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4n33F861tnhB5yN6ZfC4Q2gxN/qYdWRlSL6Yjy0AeI=;
        b=MM7rhJxaIAtTjTIT2vhLncIGqK/Lk4wSvDeqogCnrazVks0DHv49Xy+3l3Dyz/Txa/
         8gX2W1Vi8FWZQ/2rnkARcus2vx7Z0c8X/Q/6/4Wb9iBhBvql1Bgf5AYW9CxLcR+eJkK5
         U3Gg4OKXmNn9M91jVeVsYquUZpaHHL7yYr6PO1krOfIolfaOxgp09eAOagaMb+5CbpsG
         mpypUoJbCcPGZ45yGuuM0jzzGTOgoeGhFoOhwW5T4HlJcxu5ePA3tf6E+XEokU1YjssE
         GGmo9ShXBz8N9v+B7qwdgGody7p8c6mUJe0IwWdgRY/VolGJR+outcKTGVDiVBc+ZzLf
         eedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901949; x=1745506749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4n33F861tnhB5yN6ZfC4Q2gxN/qYdWRlSL6Yjy0AeI=;
        b=DrG2sk2At0UK3qPY1qH7pLoEag4C76bzWUlENwkR9p6Yee49WqOJGi2elxrjjCZwUj
         uPe68FfdQxYd5PEBlPR0uyiPldh1zy8d1Q3lb3slJQnVdFDDZsJ4/nDUmF/neXWDb5wj
         ahl+KyVuVurogFhoKVs8FWpZI/XY+jLxSLqREivD4em6rW7tVNshQaamraDBYtoE9QVB
         YWJeC9teXj28WAOP1stj1UeUlDvTWrlfIZzabLQs6afM2nsQSGKoP2PSCpxUhPTVVUGR
         2DAxEmrS7x6+S9DwQBr4fnDjleiKpAIRsvBueF0w35brv3+vLv0lhrK5J4ewi3FL37Lc
         zB/Q==
X-Gm-Message-State: AOJu0YwhEvCqCg/l6BX+yINH3wMu6XANckQJFEdpeMDZwHm5ND1Pa8ZW
	dSbvK6UB2NnwOLWl7IiU5gQy5wCR2n9ZVYBIJa9tUlXUqr0AL2QWO+h4JHlUdfg=
X-Gm-Gg: ASbGncuCsJowF30RX86+fswp6GvKHblaKtmderSzU8PaPE5Zp2U5O9Rg8b85kNsqXuJ
	CsaZHX6xakXukEnkSvpBBJco81BTVLkqI7NxxJIvcSa9ZHn+T83qObSdqCzYqazxLszQjZHE9Nl
	Q+tjhYGHYHjGYPQE2+xOwdInmFKJXoxCjZ9pkTo9g5kyXqyaw2oO29g9OgD4wMNe92fwz6XS9S/
	J7rDX0jOSo25g5LX3kDJUrDbIz+Gj16M67F6CqX9w3mg0AXFolRnYcg/al1EwqTJHyfPBp+VhG6
	b6JYnvip5HKbyG9ZNlcn69KRDYjKlaR4aCqLVL/zfy/bBJkMR4Omya4mOWgVcw==
X-Google-Smtp-Source: AGHT+IFj6x35HlJfD9xaYC4z+nINlMgfOeT2GlEQjDIgUEU6u0g/HDb7/MrIcac3hrT/9QAc1NO3bA==
X-Received: by 2002:a05:600c:3b8a:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-4405d6cc4f2mr69553215e9.31.1744901948804;
        Thu, 17 Apr 2025 07:59:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf447914sm20497743f8f.97.2025.04.17.07.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:59:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 17 Apr 2025 16:59:04 +0200
Subject: [PATCH v7 4/7] media: platform: qcom/iris: rename iris_vpu3 to
 iris_vpu3x
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-topic-sm8x50-iris-v10-v7-4-f020cb1d0e98@linaro.org>
References: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
In-Reply-To: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1397;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=O1n9ZGon1tW89nP5AxkkAnhFJkmvU1gNvIer5n3oZ2U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoARc3HxmaU1ps6UnmFL9P/TOSqs2X26ZCm/VeI1hE
 3eaFljCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaAEXNwAKCRB33NvayMhJ0RkND/
 0ZTtTZkaO2zCZ2wWHEg/H6FBEORU/4KABNLhqfb8u4a4cLmFEqgp6a7Ka944zRmAaMrgT29SgOtOD9
 H3/bLeRRFjtFc95A2ROOI0I/G/K833VthViVbyzJAsIVohcbEvAg/Ya4qghCEOYk5pZNYqcU4cp8qg
 cXsSBVL9ratkrvdGs6Q3G0fuMpBda94ZbBBefPwcEpg6VuutYBBlV6IL0VCP8/KZYYk1ahbOt5WEjx
 Vh+byi08avn3mATT0ubxCdKs1w/P9XOaR4jjVxE6eHdMxxRIKYqxqVQjeX5VEIhotjRAPhnel9pydF
 jGkmODuTHsoNF7YjrZZZRNgumgk35K0Ti1E/fgCJKxPwMqGxnMlUT4Cty+rgjAbb/UXG4AYX3L5GlB
 E//yZ7LMrpi7vmbNHgrjh9gHIANLhQpM8+gC+Mf57O9UIO//0HO3+imQ1X1xdOk8TM+ftyVrND2Xx2
 Eb94lmqTW21L4P8w6y69OiJGOcYZZtv+UzAvZi+sENjVX/EkjzHeaRBXVxX7sAeQvec2IeV+gd9IlU
 w9IKoNZ5DWxE1fDzqVQsD69qa6Gapl2FUNOoMVU99qqgg90BW1eQlEJMz3bA2A/CG7HCRmZ1BytO8X
 2DndEEIrhGQ0sFrEyRJmNAlsAxb1ejShJUWGN9QBhUis+NNHJ8wlJMcB29mw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The vpu33 HW is very close to vpu3, and shares most of the
operations, so rename file to vpu3x since we'll handle all vpu3
variants in it.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/Makefile                      | 2 +-
 drivers/media/platform/qcom/iris/{iris_vpu3.c => iris_vpu3x.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 35390534534e93f4617c1036a05ca0921567ba1d..473aaf655448180ade917e642289677fc1277f99 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -20,7 +20,7 @@ qcom-iris-objs += \
              iris_vb2.o \
              iris_vdec.o \
              iris_vpu2.o \
-             iris_vpu3.o \
+             iris_vpu3x.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
similarity index 100%
rename from drivers/media/platform/qcom/iris/iris_vpu3.c
rename to drivers/media/platform/qcom/iris/iris_vpu3x.c

-- 
2.34.1


