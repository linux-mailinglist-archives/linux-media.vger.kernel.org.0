Return-Path: <linux-media+bounces-21851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 346609D64B1
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 20:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C90FEB23551
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 19:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8F51DFE24;
	Fri, 22 Nov 2024 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erJsjfeW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41874175A5;
	Fri, 22 Nov 2024 19:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732305209; cv=none; b=srHLpkQDtH2iBPEF7Bq7D6Ouc8JONPyc/q0MDs/835yfpOeWxZVsrL/RK2XmtFQDGflAlrBr6q7dhNAqTBvfwjGCgA5XOsRod5damJUte/f0oryxgAiuCCJuam1k4mAAASXZlVIrCmZureKAkFSnRBCvII/GqAX7u0iHZpEVyYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732305209; c=relaxed/simple;
	bh=ZZtZHYA/IIm7LQvrI19Jp2brzd9znJvddYJCiGGW06I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J1/8bQsLLdASTFxc+svORW7qCDxp1BW6LBjdBVh7A5ybREa0bUJdAeG44fNK8NECCHSnNY/7GVyzhq26o9pRvf8QdA5uYbtZGIeMoCHXVKiRtWe/TWFkjPl/qSiqiQSJGJA2W7T/Ba/FDjgn05EeuKuva33AAYXrbyQnzq4Okzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erJsjfeW; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-460af1a1154so15160271cf.0;
        Fri, 22 Nov 2024 11:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732305207; x=1732910007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CF/HRhep9JBi7dLu2TPvpQtWrqcbCsu76aTE4DvPvS8=;
        b=erJsjfeWCI3E9eT0RVkPjQigloK8SHDDZXFmo8hY0YdbcWs+pJduuWvXr3MCcy/W2/
         ehhl1LpJlgLf4+oi+/6xJXNYZRtPVze2fDPNSvU1W8P8rdPCQiHh1i16Goiz8i4+r5Ox
         gGYFW96dQuHhBSrtVFKGpwj1vyVCcQVTfyTaAZFwrw/nXfoUMezX2z3oriBn4UeuLobF
         VH58SIkMg2eSrG/F/INn/IjTTToeZhJOozSEjqUgM/q7BRfR3NNNC6OABDoCrTkgVnE3
         FQMvs6Jbz2shjEgjxIOllWoXnVhc7TKtaYoPsxnl5CN6qHTnKN0iNnmYnshykpxFlFtQ
         StQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732305207; x=1732910007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CF/HRhep9JBi7dLu2TPvpQtWrqcbCsu76aTE4DvPvS8=;
        b=KKf7PFAVwZCovCiIGEmDOialMN9bK41THXj3omw8a+ecOYGjeY1rVDaolmXKQGcPgQ
         jg3kKf4p9UDy0w5Xt31FBKX0TCy7pfFEYOQ/PvCnDxIXzXQyorLnOjlPHuTKpj/33wi2
         pgBXl8eC+fGY+80l9Dyts7qQ7xAH/5BcTURVNdBoOvnCZ13Xb3RVxM3/GQo8TC0RERiP
         pMtjp1S0fB54wa8s1d8qwtvuxGCd7oBXk9H7fw//EfTLysBE3onVT7GN2n3Me+OfvFz2
         2b2aoKfg+rQz1ZjS69ep67wL3H+JvCKR+qc/kqjtw7bJlstrIyPp6wji7UpCHv54ICHw
         9aFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm1jqM9zYn6kziX7S8Abg/0jqDbngSUM6WjjE8ks5dpeHYW/8jMBiq1eRkdLaPqRj+BzzGyEm7YtFa8v0=@vger.kernel.org, AJvYcCWxamZ8atHkzaGt0e7OR6TGcJXBHoLrSKufdRffNCFzkRtaDsxTt5OrNK52OukNDTh7KfcJWsS5IUS1gA6ZIm1xwfs=@vger.kernel.org, AJvYcCXyzfBjnAAVa+G1gdNpOLu857RzjwuTI0Sl2JmxFdWq6gnsO2m17rrQ2rShVg2vsBU3zr3rx4MMPxw1XpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC6OzqGnp7AWVedJws1nLaQ+eXH/ri9rv1C7pnPdDkS0v1RrGj
	rO0cCL6B0f3LaJ+90tdtPqPV6ruJCoPhALpeBXxAI83XnQ2ZdjXA
X-Gm-Gg: ASbGncvbnQuRuyTMv1aozwSqQUhHOOP3uryd1VNJv6XGZKMdEKwBhmqqz9XU9h4IJQI
	1IyoD3UQHY+amPAGQRwCGz6NZ++LaUyuugWIdFVr2o97P3C7AsWAZKPgiUe3WyrTJF4oJjeMGkb
	FMvfUr556HZLyR1VqSd452WikDBJsopDGafs27O32CqJsbTQWSbFbTLoluZUlQvzw+1ZfUTaQNa
	TF046sdK1MjuL/RyDpbeuAmuQwWzqbF0wSTlkdLixa/oOmCRb8EJcph+avXA3/T1O+s8hav
X-Google-Smtp-Source: AGHT+IGWS/TRquPL6ThkLaNpCv/OoH1M5+ix8LlZG/vqWDvFWeRjvAxoJJc+WnPkQLUTQ/pMdaugqA==
X-Received: by 2002:a05:622a:5c98:b0:462:ac16:e72f with SMTP id d75a77b69052e-4653d5302ecmr60216091cf.8.1732305207048;
        Fri, 22 Nov 2024 11:53:27 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c3ee8cesm15535781cf.25.2024.11.22.11.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 11:53:26 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: krzk@kernel.org
Cc: sylvester.nawrocki@gmail.com,
	mchehab@kernel.org,
	dron0gus@gmail.com,
	tomasz.figa@gmail.com,
	alim.akhtar@samsung.com,
	kyungmin.park@samsung.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v2 1/2] media: mipi-csis: Add check for clk_enable()
Date: Fri, 22 Nov 2024 19:53:22 +0000
Message-Id: <20241122195322.42289-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241122195322.42289-1-jiashengjiangcool@gmail.com>
References: <20241122195322.42289-1-jiashengjiangcool@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() to gurantee the success.

Fixes: b5f1220d587d ("[media] v4l: Add v4l2 subdev driver for S5P/EXYNOS4 MIPI-CSI receivers")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2:

1. Power off the phy and disble regulators when clk_enable() fails.
2. Remove a redundant space before the label "unlock".
---
 drivers/media/platform/samsung/exynos4-is/mipi-csis.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
index 63f3eecdd7e6..47b8e043aae9 100644
--- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
@@ -940,13 +940,19 @@ static int s5pcsis_pm_resume(struct device *dev, bool runtime)
 					       state->supplies);
 			goto unlock;
 		}
-		clk_enable(state->clock[CSIS_CLK_GATE]);
+		ret = clk_enable(state->clock[CSIS_CLK_GATE]);
+		if (ret) {
+			phy_power_off(state->phy);
+			regulator_bulk_disable(CSIS_NUM_SUPPLIES,
+							state->supplies);
+			goto unlock;
+		}
 	}
 	if (state->flags & ST_STREAMING)
 		s5pcsis_start_stream(state);
 
 	state->flags &= ~ST_SUSPENDED;
- unlock:
+unlock:
 	mutex_unlock(&state->lock);
 	return ret ? -EAGAIN : 0;
 }
-- 
2.25.1


