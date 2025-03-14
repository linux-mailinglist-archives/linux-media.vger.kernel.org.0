Return-Path: <linux-media+bounces-28273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF374A621E6
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 00:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 755997AC916
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 23:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7224B1F9A8B;
	Fri, 14 Mar 2025 23:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDcmBHhS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39FD1F92E
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 23:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995367; cv=none; b=lm4WCa6T7bYferrnOPUZ8NA2sosWtBBlEcXcVfGvSXIE2/5E/+8L2dC3K2nZqGQ1ypYJMaftA/gNMj1f29/OlQy2kP+GKP3xZgG4jEpqK+hbNRjHJG5SSeLUKBu2JhVWenqC7B3hTRHZ9aZPVlbe/Yrk4Rb3Y2aUtOYiYFJVTVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995367; c=relaxed/simple;
	bh=XO8C73umzqB3ITQwScvoKWMaYVNcoaJRWUZeDGM5cGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZvsu7MhGcNjFZM3B/dxMl9rgUb3GjLQZxixbjTOLqL9CDM1LlUbrmZTQT8QVMgJ36mFGgmmRR2ksQQTo4MuLcDese2kAxd5N0PuVjY3iTlLw+p6TKpFjUWkkozpmjnr1hDFsBmbPRVHWl/iYQLFId/N3UZrozfuaAU0VR1ImPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDcmBHhS; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so399146166b.0
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 16:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741995364; x=1742600164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=keDpOrls9Sn/S+3SLtEEautMsDMOcPKZDVim3GD6wto=;
        b=DDcmBHhSVOsZrbN8iKOndyGIn3Rr/t57Aj6YdDVNjv4/K5Bf4qLG2LrT8V+ey4cO24
         izAthAgj5Mz2Ke4OaY1RvRO0TJ+xJjFohso8HQybJY4Vq6sWoDxrz/AepfcycfYi8jGw
         tijyDv2gc8Ywmy2fVHSVRxzkXFyz4OtE47zFlpKERTtAOqDs+3cXuq0mpebT7OjAkfqr
         HF8fAVqEuXm4fWVYsQo/CMWrsYB4DRJa8PapEbuvvcUg5ad/3wJ4h8Hqi053QcrLQK92
         xq73EmBzEJxSNQMaCqHnjYwPwivNrk/PFPkmxCc2Kur5bD0Vhj2Da+wA27XVIUJLlcjQ
         ovkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741995364; x=1742600164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=keDpOrls9Sn/S+3SLtEEautMsDMOcPKZDVim3GD6wto=;
        b=RVLHeLBAwG8tVmMRFIoHr9kY4K1VVtUqjC4zbOCH/TcyVmf2XbkmFh/yBAKKybMyGk
         vSD2UhLoX1y5S0jtF5FW6LX+BBOT7ALdrB1fcFl52+Ayp5M/3FLofdCovbOVhiyA6Fql
         YHCDmZd/0/b7vxVtHWf7RVO7h82bGbe336BR/rX5YyCL30s4DPKbYHXExdsVzaVHPoHJ
         ChtCoRwwzI6d09UpBtnP/AlFFHnioSTBOT1inAEYodz6kqN0JaZmf1zXVQRjMAZDIjvs
         2Vgjm13Q588hd1Lj0WWb27pc6NZCBsuITfqu/KFZ1nLF8VoXwdPQClpWtjQJ7sqxcy17
         EOTw==
X-Gm-Message-State: AOJu0YwBpzOBBKu0dBMfpSjQMzA50lMnz16agUg1lBOWxrbcghV5tyrI
	BMkC4rMhS1bm5L3gwZKE71HkT/vJE9C2Dp/iF2XqzXOVBpncmD3r5IV2FYtILBc=
X-Gm-Gg: ASbGncuTqfOi4fC8WnJPiVKOjwmByWI5bh9iSpJikWJweeqEqW7IO5mwfuxMLxmQGtA
	Vr2fbZ2luxYHjcpckhiml3k+3oSj+C8WcMPjyBWOwVUlP0AU7NxWiTwSTQOheeTQB7PwOX6uuuk
	MujeQhx7qrfD0vxp8CsZU/F4oyWzP2UAkQh2hRY808i3XHtV+fNjB0V9/XBmHNYlZs/Y+GVBI8q
	oUXBybU7oaAnpk3s3lIz7opS3vglNarF0tl97MANFduVQW1rg9f5euSNIqbZe2SdbxgXXM2UqKx
	kvmH0HwYXlHB8YTATMFG2LtKEMzxFE/rXNdLMtiuvBJ0s/UTTbrZRsYnAR92KdPurIwmKNBbX5d
	SFJToPuvhLp63i/ocugk+L2Ddv0+opzTLCeeTaZe1l9OqFn5yZAhx3itHURtSId9u2snm
X-Google-Smtp-Source: AGHT+IFAGvopC9aLmriQ1WG4E3B60V6ITUuBD1z/8RVghyGuUFJrHiuxKd9xoYGYLzs30GOUXV5ZOg==
X-Received: by 2002:a17:907:6ea9:b0:ac2:912d:5a80 with SMTP id a640c23a62f3a-ac3301dfbf9mr540041266b.5.1741995363804;
        Fri, 14 Mar 2025 16:36:03 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeadbsm284246966b.29.2025.03.14.16.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:36:03 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 14 Mar 2025 23:35:58 +0000
Subject: [PATCH v2 5/7] media: qcom: camss: Add support for 3ph CSIPHY
 write settle delay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-5-d163d66fcc0d@linaro.org>
References: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-0-d163d66fcc0d@linaro.org>
In-Reply-To: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-0-d163d66fcc0d@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2

Currently we have an s32 value called delay which has been inherited from
the CamX code for PHY init. This unused value relates to a post-write delay
latching time.

In the silicon test-bench which provides the basis for the CamX code the
write settle times are specified in nanoseconds.

In the upstream kernel we currently take no notice of the delay value and
use all zero in any case.

Nanosecond granularity timing from the perspective of the kernel is total
overkill, however for some PHY init sequences introduction of a settle
delay has a use.

Add support to the 3ph init sequence for microsecond level delay. A
readback of written data would probably accomplish the same thing but,
since the PHY init sequences in the wild provide a delay value - we can
just add support here for that delay and consume the values given.

Generally these delays are probably not necessary but, they do speak to a
theoretical delay that silicon test-benches utilise and therefore are
worthwhile to replicate if the given PHY init sequence has the data.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index a6cc957b986e16add9da516c2fcb3201f3a65f35..b44939686e4bbf400f145368d3ba015b56bfb187 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -59,7 +59,7 @@
 struct csiphy_lane_regs {
 	s32 reg_addr;
 	s32 reg_data;
-	s32 delay;
+	u32 delay_us;
 	u32 csiphy_param_type;
 };
 
@@ -600,6 +600,8 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 			break;
 		}
 		writel_relaxed(val, csiphy->base + r->reg_addr);
+		if (r->delay_us)
+			udelay(r->delay_us);
 	}
 }
 

-- 
2.48.1


