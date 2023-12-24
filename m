Return-Path: <linux-media+bounces-2978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C8981DB22
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 16:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5F8FB21343
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 15:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B20ACA78;
	Sun, 24 Dec 2023 15:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NxayP9rb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3E46AA7
	for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 15:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so342784866b.1
        for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 07:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703432670; x=1704037470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNd+wTCLOu2wQWwqwquwYCDRzJ5XXbRrd/Bj+DUUyIM=;
        b=NxayP9rbvEBR+WetGoHIjjxxdpaEiZUkqzxt3Mata+Re7PT0pqPs3Z/qvVyowbESCY
         xugOHVPwrMyYOVuadYEvpuhGhvJOzK8YO/0nczpJ0TzHxhoFiDPZyYw6sl9eYSgrnfsU
         f5i0dCKL+YLa5HryClV2at6XBqh5ztmSn21IJXMJ6IlQeU8Pf5a7A/elBU0QQIYfBs7/
         bOPlEQ01QOC5GoubExDOXQjsqzzq4IPHoXdfbBvfYUcLzY2QFhkscqboNQdkYjcKfw+M
         GHMislCR7nMtxWC4U4IJdeBFzWe9/wOtD6W6tYOaWqkfJaI5QcxcAW996AWTfelyFQWf
         E/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703432670; x=1704037470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNd+wTCLOu2wQWwqwquwYCDRzJ5XXbRrd/Bj+DUUyIM=;
        b=rOcIGW7V3fMNwaqxpr8Fl9HM1TCszyBtKWtZVrblF1vbZEAPwsGTBC6Y/ohqa0JZI2
         aN6pnSE+Muklb/urP1esFVBzewaMaHMB7P93qLGrCjPvmk/QhCRotXhN5FvjyisYjKEh
         3FPUa99zQfXZxVYVcimCt/v4NrWVMUDGczFXJJfsY8B79xQErEqPLtui7Nxxxy2AH+0u
         3D8A9bIBADL9HEXdKOCV6lYOOAW0BtgN7KR/9uH7enGs6c5zLXJ+m4hHbPFH0LIRZ1J3
         fSeM+LgAxXSyby1QLV18P5pI9G41lDlLGW2pzjD2VZ3SyvMDE1PUE0Ib/M5nyJRR+opN
         YKeg==
X-Gm-Message-State: AOJu0YynWfXwX0P+yKPaq6faoFNRI35S//jLIlEIXnLGNQbG0noEB+Y/
	RK4DNU6ERSK11PkFIwtcyhrNVQsDmdcwIGjdNpXF9GnORtQ=
X-Google-Smtp-Source: AGHT+IE4Eqhm+mVXAUZubJti24nq7Cqcl8a1TWf67Clpk2HjAZzxRkbxtOO/aqa2XhufK3wXiaMZJg==
X-Received: by 2002:a17:906:743:b0:a22:e2ea:4fb5 with SMTP id z3-20020a170906074300b00a22e2ea4fb5mr1926380ejb.19.1703432670410;
        Sun, 24 Dec 2023 07:44:30 -0800 (PST)
Received: from [127.0.1.1] ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id ge12-20020a170907908c00b00a26ac403032sm3325901ejb.65.2023.12.24.07.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 07:44:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 24 Dec 2023 16:44:00 +0100
Subject: [PATCH 01/15] media: s5p-mfc: drop unused static s5p_mfc_cmds
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231224-n-s5p-mfc-const-v1-1-a3b246470fe4@linaro.org>
References: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
In-Reply-To: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Aakarsh Jain <aakarsh.jain@samsung.com>, linux-fsd@tesla.coma, 
 linux-samsung-soc@vger.kernel.org, 
 Smitha T Murthy <smithatmurthy@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ljCRuYvdY6fAQtZBQEraePJKn70VsL4ULdAUKh6amZc=;
 b=owEBfgKB/ZANAwAKAcE3ZuaGi4PXAcsmYgBliFHO3p4eunwoaLcAVxKz9/D+Tnof16hQ5siIZ
 07WqzpDhHOJAkQEAAEKAC4WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZYhRzhAca3J6a0BrZXJu
 ZWwub3JnAAoJEME3ZuaGi4PXswkP/1SeouPDUcmwpq1k8OwdpUyxqA2rKAT8uC1bxSpCmb8tOwo
 UDBejhf7YSjqJdZNZ1ku5MAOaluQ3w2jZ+orHM4mFr10ys2AEQrxflPrua3NSzJA1K9phz1pMci
 TKvn89LFfRQ1qXBBbcmrI+YRBHALlKDke/knN3bXf7cJ1jWCnU5xTDcDX3LlMFWtcMmf1MHnego
 LtrrXK5Qfh36cU/RvU69xb44y/RfBYpL/wqFpBTb58DNLz4QVMVZ3pGyx3SqVrWS+dfho2juguN
 i8yEY11MOi0ADBfHR/hacukqLBeuFJxHdfKsnwiPgq/ha62urEJivFOQOBZlm+n1wZeMFq/R/TE
 3yXag3EBmTTqAOaMbw9mdoLT8Wv84fWI0uMjc58doSohlMvvOQhlXN4twaIZ9cCM6eN++ee7cun
 ZyV88mts/QhYBG9h694L4/9AwAcTd0FGH7hkhlLKeUZw6Ky33NtjByPS4wmxbOHcPTmc09ENsOx
 0Lh/XrzeuJMI9EjYQ/OUIpcgyF8DWNnTB7Q+0iEqr1a2zpuDdiZKyVLuF1PKVDIygrjBLNeWdxR
 WY5fV+gDp0dcK0Il9ck4hMTZ5J/rzFrws06JLrTYi2+DG8E1U7mDk7W5fiGJewVEAyZeUMW7CnP
 Fg3/CtwcWl1JxY1FnWykpk1ZEFB+rNlP9KpN0
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

File-scope static variable "s5p_mfc_cmds" is not read after assignment,
thus it can be dropped entirely.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd.c
index 774c573dc075..196d8c99647b 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd.c
@@ -12,14 +12,10 @@
 #include "s5p_mfc_cmd_v5.h"
 #include "s5p_mfc_cmd_v6.h"
 
-static struct s5p_mfc_hw_cmds *s5p_mfc_cmds;
-
 void s5p_mfc_init_hw_cmds(struct s5p_mfc_dev *dev)
 {
 	if (IS_MFCV6_PLUS(dev))
-		s5p_mfc_cmds = s5p_mfc_init_hw_cmds_v6();
+		dev->mfc_cmds = s5p_mfc_init_hw_cmds_v6();
 	else
-		s5p_mfc_cmds = s5p_mfc_init_hw_cmds_v5();
-
-	dev->mfc_cmds = s5p_mfc_cmds;
+		dev->mfc_cmds = s5p_mfc_init_hw_cmds_v5();
 }

-- 
2.34.1


