Return-Path: <linux-media+bounces-21855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6E39D6595
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 23:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7346282416
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 22:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0D91BD9F5;
	Fri, 22 Nov 2024 22:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrbKjt0c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B9B19E970;
	Fri, 22 Nov 2024 22:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732313636; cv=none; b=ZQwmaRORjSlDCSCnv9KV3och64MmRhrF3zPxTHLM8blAT9JqR8KDvqy80LINwK4Yw+neTEFGFyQUNQt1Af0CXFND+NvvFPUuQX2lnM6/XzjIdSPzDmDPBwEUR9YY0FU7Cs8A03Iz+Do+DBX80lXR9eEWKe/u9rkFS5T1LVPqGac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732313636; c=relaxed/simple;
	bh=DpdC7/ZNvEIudhQajmJyElOpUZpYIkpkt/AxbbUhDTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E9mD4LYBmgmpGP50VC7Vmj2ntMZwReY93KgnnSwRovCn0Xxkjd/EZkrHOR02w2URhU3MFYI2TpNzsU7uro5titlJ0MoJ1+TSnp9rHEZ6T2rg9BmPMHoORoX6z1R4QGRO9zmJM+nYOWLtNzUI85rYkLIvY8Km+RdlRD/t+zU+4vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrbKjt0c; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d41176505fso22507166d6.2;
        Fri, 22 Nov 2024 14:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732313633; x=1732918433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjggllig1lhdLdqzta4VRtbrfyvu0W/JksHC0TyvPxI=;
        b=WrbKjt0ck5/mtZruwNQvXnhLQ5lLLkFxq1Ed0wU5UpEUs83zpKBp3tv4g31FQH/5VA
         jEARx20Jwbl89iwTG7IgqI6vOmUc6GIWaRcnrLueVeF25JM4sS8X3GsX1/DaXBkcorla
         9sLXcI4w2JNmTDuRKvFk4OCPadZeOqZ3S4XXow1o7ZQOUlOIhzMmnmRCwVem06nOCjLh
         csk+oDNwfOdyNb4QZPep5LjN5BqS9i4Oq9UzSIsvqle2ZWvVNewebps/r0pegHLDVY6x
         aH7/P2+AiUBDzE7g+iPmZefIhjjCoHBe7T48ZAI46+mvoHtfx3wBRlES+yC/3BsmyPAV
         icxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732313633; x=1732918433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjggllig1lhdLdqzta4VRtbrfyvu0W/JksHC0TyvPxI=;
        b=ix5Q1cD3S9uwwbR4kR6+ryR1BiNoj0OOQr6MCywTtAuTvZWqZBTJUg1tfL1MAh65pw
         RuVqmIxn1WJFFGLQozQmfeyoKKeITKw9c9xfK1K9fLsBtln27K9nVJYAD+dX7pnESEIt
         Xm19SnOKZPFSnkpjfJlgsELLtY/kFlhfL3QSANJ7kSZktxNZ2B5TR+O22qYpkVGj5UOB
         cPvgKsgXaWiy/QtRIj0wV9YGIqPiFNqMEzbCvDuDsWlNgbIt4ZtWCYtbQOxwD2OtSw5B
         o5gT+0Y+T5w5O7Tbnt/zUP6j9CFhwLAzq5iaDagJeY5Ds5OFsYM4gbYsRFnkUV4CQw/i
         VgOg==
X-Forwarded-Encrypted: i=1; AJvYcCU8mdHERCVA/o2ptC5Zfrz1TWfafMLCVPsZnbLG3/2M4J/MhQ90//cvl2nDHbSO63E7oSR2MFcoVe3LuWo=@vger.kernel.org, AJvYcCUfygcAOM8+lpyzsDLfLhEo/RUaf7uD2YDY6PzZfUGQg4JtvLkA/Sq/Fj5nhgH9ApWq2TSN7RiHXLcRFJo=@vger.kernel.org, AJvYcCVmdwxBx0/sGnFwf8ONug/T+CDHLQugD8gVET50tUihJUM+puCraxcBbppiH6dnur7LmOEds3wAK8AlFU/SCEN+XIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjcqkrYsPPEjDbf+sxF2pHo2GXCaW4kj+yCampz3JJYiPvdVZ3
	HDCZfKPFzw4hSd1v51kjjoozq/xSiTItzA+vzoqHS54qn4JxlrWbltgvzg==
X-Gm-Gg: ASbGncuV+fAGBJLy0NXC1nc3fXR1+sfLsbXW4/qSx/skZgt2/YkI80HIaZPCHl0k7jZ
	qyU09aPPK5UZ0XLdqZc6+oH3MYbfcH/Oj9mtai5twedXTj5vZs/EhhlDRXIQA8VuPGemx4UwiQ8
	FZOnS1+GKKHr5eyBfs2Pbr/CdsNgtLwYPTkgttToKJwiAkhE0rT/bMZBI354mYDfmmX68h926tk
	F5L7HV4liG9DZbQaUYG92wf0oX1Be9Bws9WPKJp7daVF7up14mnPvw1M0GZV5ueOoWlh6qm
X-Google-Smtp-Source: AGHT+IHgahotrjDkGCxkLTqv0ks7LfpHmWKZFhzn74QSP3dQNY6KwyiDyyINS/ZltTaefntCRc+JvA==
X-Received: by 2002:a05:6214:d81:b0:6d4:2a73:846f with SMTP id 6a1803df08f44-6d450e7b40amr61235776d6.11.1732313633452;
        Fri, 22 Nov 2024 14:13:53 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b513fa5feesm130646485a.30.2024.11.22.14.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:13:53 -0800 (PST)
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
Subject: [PATCH v3 1/2] media: mipi-csis: Add check for clk_enable()
Date: Fri, 22 Nov 2024 22:13:48 +0000
Message-Id: <20241122221348.3998-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241122221348.3998-1-jiashengjiangcool@gmail.com>
References: <20241122221348.3998-1-jiashengjiangcool@gmail.com>
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

1. Correct alignment to match open parenthesis

v1 -> v2:

1. Power off the phy and disble regulators when clk_enable() fails.
2. Remove a redundant space before the label "unlock".
---
 drivers/media/platform/samsung/exynos4-is/mipi-csis.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
index 63f3eecdd7e6..452880b5350c 100644
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
+					       state->supplies);
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


