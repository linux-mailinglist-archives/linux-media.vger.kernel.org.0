Return-Path: <linux-media+bounces-24651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4694FA0A9D4
	for <lists+linux-media@lfdr.de>; Sun, 12 Jan 2025 14:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 533C91886F85
	for <lists+linux-media@lfdr.de>; Sun, 12 Jan 2025 13:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0381B85C5;
	Sun, 12 Jan 2025 13:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6ZejJQ8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C431F1957FF
	for <linux-media@vger.kernel.org>; Sun, 12 Jan 2025 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736689613; cv=none; b=iQRn8Kny3/u03kVLshA71CdmasXb1LkZfJRMSnY9DgdvZCkvt2gyaUP9c/7ftPfHq6r7zU8S2FfaLD5S0iWov0rW5971GKmbFLDY8UzMmiwIHA8Yy7gOCHC/G6LNhy7lfU1ajTpghFC/2VkBjbdNgYJyMzT5QJJMpPSmiqzxyxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736689613; c=relaxed/simple;
	bh=DkprYMhUWHPLt5iUCPkLzpdwnhGrzbjUxcoVc2jsAzY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TyEwXyUPbJpGOuTnuLxQHxQmIbylWnuGzj/L23ARgDIrzf0KzMB6pE4qXa4KmF33XA02MsPGJ59nEdLiSVG3qqP4LWFVa5deWsSUidCnqlS6eSjH0bcz0lz+o7DpZIG9dcYXu/pXL8giktE5aWFk4OF2OeYXiOzsAPXTbCUD6Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s6ZejJQ8; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3c1f68f1bso506828a12.3
        for <linux-media@vger.kernel.org>; Sun, 12 Jan 2025 05:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736689610; x=1737294410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bihnGP94eaeQUaekmzjD+5J1qI3HkeX+VAre8pIRJW4=;
        b=s6ZejJQ8nv3KmHPi0eSxegKn9FG2kXLdwB8bIBVotiWkNHMGGVvI+PfgBgqzxipgsw
         phOdqtCKUze8IUbvJkxFOOCqDF63RckeJ2bBVJ3pz4qGqCJqT9UsxFIc0F1I+iW+16IA
         UDzA2vS+fWMBwa+nSPD7njP/KTmZlqKewThDQobhg3BmwqsHjZlAWd7u9W73pXov1+1Z
         f/aiYI7HB552toXR5WzR2xaiC7BUS5lC9YMA+I+0oYfAeIOmKw4Q4WdvRQe3unikQyiN
         IVYh2K3vAguAkmWC+wI78cRElYHIVT4vS7kaKXNJI7Ruos5K5Ih8xVvLCjtqjYzoLVqg
         xNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689610; x=1737294410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bihnGP94eaeQUaekmzjD+5J1qI3HkeX+VAre8pIRJW4=;
        b=lAqFhX393tSk6QUzOjpgiUfam2uSrR2K34U0/nFys+wg3ouCSG4wGsdiUAcR0iA0AF
         CPZKDlxJeYycsOFHA097CORKgK0cjHAXDrnaRr+dtuTtg3i3Qv/jiSQAsInuq+NlpIaE
         PygfgHSmqDSgkfL7YmIE9OgXMzkNGDcM2Ebwzh1Qd8HfO4RCGdJwVtWMJV9N7TCWdV4K
         JIHEkY0AfnxTdU/AdsYcxgvwvVzWVjSB10WNEEfuz7vnfhnMTDMjuUFYYoMI3kIBNwt7
         73TAqo4NkEkSpyvKyM+KA9BHy7ep35KiYVV9rsjZBYPPh/NDjc3HDGokjY6y+offtjTb
         Es/A==
X-Forwarded-Encrypted: i=1; AJvYcCUvgEqsk5DPvlM1WquVPlWy6ircXjWgZ7Ac4HxyN/Bs/h5CGYxZVICYyzHY2Na9drifoY9gjZevDxww6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEkDX0bJdRKE0cfHn8/If5iJGfOSHmhe6+UuqVCALqNjhW4ba3
	0rfMcXi0PmAyJQKFAZ16kwPw1ZYkvmjJXDKwTnNb4P/9JBoWFmSYmg9jo1XqNOo=
X-Gm-Gg: ASbGncuOa4nlUW/VFgOa0bfOjfy9OwfNkd3EkIigDLgj/rxbaDTEysx4vTERo6UM73W
	KJmU5xbHYOQhdjUBPOK7RmTugmEgUO6uIPsbzoQ9glikDKFB85wYqnk7plenzYV8LJ9IUYVGTM9
	6bG/VeP0qbFPvKa/YdACklUFnFESjQEcwn0PXF/Hqn4GSUbeqc6GR42xXSPFhjC0HOrYBVfZ1zA
	mcfA2NqZIx4cSm0cAVCLRGZ5Dw/kHjbwnKh24ZZXpjk1WtD8NE4ZiH83ZrxmSUadggKyh8=
X-Google-Smtp-Source: AGHT+IEiCptt73i0WhbTwi8vzR6jzwQ5m0UVm81m7fDi7cTF7nOVMpip6nYH9DZPZQ9tTJ+R9Uctgg==
X-Received: by 2002:a17:907:1b05:b0:aa5:3e81:5abc with SMTP id a640c23a62f3a-ab2ab643defmr680675866b.1.1736689610160;
        Sun, 12 Jan 2025 05:46:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9136297sm381215566b.91.2025.01.12.05.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:46:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: omap3isp: Use syscon_regmap_lookup_by_phandle_args
Date: Sun, 12 Jan 2025 14:46:47 +0100
Message-ID: <20250112134647.46028-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/ti/omap3isp/isp.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index 405ca215179d..640cf7184224 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -2272,18 +2272,14 @@ static int isp_probe(struct platform_device *pdev)
 	if (ret)
 		goto error_release_isp;
 
-	isp->syscon = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
-						      "syscon");
+	isp->syscon = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
+							   "syscon", 1,
+							   &isp->syscon_offset);
 	if (IS_ERR(isp->syscon)) {
 		ret = PTR_ERR(isp->syscon);
 		goto error_release_isp;
 	}
 
-	ret = of_property_read_u32_index(pdev->dev.of_node,
-					 "syscon", 1, &isp->syscon_offset);
-	if (ret)
-		goto error_release_isp;
-
 	isp->autoidle = autoidle;
 
 	mutex_init(&isp->isp_mutex);
-- 
2.43.0


