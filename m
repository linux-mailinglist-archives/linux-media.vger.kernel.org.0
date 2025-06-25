Return-Path: <linux-media+bounces-35881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF322AE87EF
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 17:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 807404A7EBD
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 15:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4852D5C90;
	Wed, 25 Jun 2025 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GmLd/q/a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9282D5437
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 15:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864955; cv=none; b=VNWp9mRn9wbEzHqEW2PzxNHl3eRqjIhQAPZhWhy8x5GtWh9r0KGZ810OTtQhL1rydmGZ88Ofq7iJKK26VHoEpfTILLHkOpIpvFbI4zJeZCBwr18HeF+RV5yDIsa3z2MPBZtYC5+WLToHZeyAYuxf2b7nIWtbeyV9sGljXRVGCwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864955; c=relaxed/simple;
	bh=yCYdZbO+dpu/mVZGwv9i1PkdqA5piWFDPL5hOs2zx7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kYEZWAOmqCqfo/W4fRVxwWQ7MjkMecmLqmjC3zpSDqrSNGNIyWs6zSw//2dki3iRRidK2X6zZttongtfONYqW+Yx8o6T85coQ6bfdTWYNsQ72Bx1weicBSB5LvnVHDZHL2njADjm+oHuZ7egc2SUKvmPItTQErMdJ9b8E53ocEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GmLd/q/a; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-60efc773b5fso865573eaf.3
        for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 08:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864953; x=1751469753; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nF0VBzbDTNCK1Xw9av27PYfa00tvOG6PAv4XXmzSQFU=;
        b=GmLd/q/akNfHtLQW8btOv1hf8CsiKeAy+BoKZO0k9DGJ/Ez1SkYSsrx/drYZDwhLTu
         9DCxPnJ5cwOoY8Km3KWnZ+/t039ctWPTZ9ARuDZhlzTTR44YEA6+fhQkanxt2k48Q+pS
         6kQKx6wtOV26LWlARfPU8lHKhzrmZqdIrH5JxW5Sk/Hz/cXVZzkgeirBm1dcLGjpm8xy
         bhrfPwWgt2f2VPPoWPWcQI4LcGlOswkRiF8QM0ikbX4YoVoYAfo08Aee8Fx5R0pDacRu
         a3gGsk+GnckLpqJZ7BcL7KxGpiJgFjs9f55jhL3Zq9aMCAzz6VdBcXnU/mf+H2orTgVI
         zQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864953; x=1751469753;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nF0VBzbDTNCK1Xw9av27PYfa00tvOG6PAv4XXmzSQFU=;
        b=mS7T9FUfTGEMFZ8+GML7z+eVCppaa/VgzkJGesUdvfB0z+eaL6KlTKfJvzoHPbMF74
         MWcOlkDew2lPoVMtWI2vw2fjgwfivlBRS7ZV4YbMj8hqYSQmrTeC1K2QxWPv3KJb/z8y
         /3Kiz49Y9O5UJlCZb7pEv8IqYz05e9F4jedCXpZLJvEXR/fMfOesyjGwzBmDhSTHLQOI
         6/mKJL9whYywfVWelsksly3vTPO7rW7vDVq+yHAQfhLtXES1063ImSJMLozaC2g09MUS
         EwQZYoMUr41V5fJ+8YroooMxeBWYtRNklVh/pn54bIXXR1rhf8frmcAnEKEV8dhT7fpk
         zHLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJvwv4ZvxN9arSjjivoybC9sxNOsJJzeztLbzqRznl9O1hrO6YNs9+/pY8cyQ+xIw1BuwHP7qiRB8ybw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya5GXiDmNrUjmRSl3JBoaYiRaX37KoFaeseIAUBBFTM8fYuSNC
	TFQc/+0zi9xJzvgsLEHa3aaoAm2bWsmFmLvRYCmA9/oaOi14GV8UIk5C8WPVbPOXjuc=
X-Gm-Gg: ASbGncuAYL0OQN9TRzKlLAKWLlkSqEWFlbkLnZIaaCchDs24bnzXS3ujHSQNNAgeW1g
	COmTZIrO3we16ye7YChCiO90jf+/cTzpl0uGhPi8BC8AK01zsFYeu/HaOYlUq5Lp2w4yqgQTGf4
	BBJWLKRpcGkb/sjqoadvsYlyxUnXFqUih9r1OLgMZH4zmakoUHcFI27+ZDn0iKjPIc98carPzoK
	LTBHsSMwKgGrXI909IAbVzoG3CRCNAnZ+tD29w3A86FG+Sw1aJZay55mm98YcZ9AaBEHGQ3SuuL
	ykC/9s6lR0Pd3enuHOQpc7dPAQFMW7xOcIwAi6i/OHJfybqknj79qtJvWKyXMxVCEKuiZw==
X-Google-Smtp-Source: AGHT+IHuQoqa1u0DUHvl6z0O9mvk8424s2tdSOokLX0655c7GkLUoXhQQnFWEefCze0j3O7DZKz2Sg==
X-Received: by 2002:a05:6820:99a:b0:611:6fc6:e6ee with SMTP id 006d021491bc7-611aa3f4864mr221261eaf.1.1750864953563;
        Wed, 25 Jun 2025 08:22:33 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-6115b7f813dsm1629279eaf.40.2025.06.25.08.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:33 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:22:32 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.Li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
Message-ID: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This was returning IS_ERR() where PTR_ERR() was intended.

Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 6501843ae72d..3a4645f59a44 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -966,7 +966,7 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 
 		base = devm_platform_ioremap_resource(to_platform_device(dev), 1);
 		if (IS_ERR(base))
-			return dev_err_probe(dev, IS_ERR(base), "Missing CSR register\n");
+			return dev_err_probe(dev, PTR_ERR(base), "Missing CSR register\n");
 
 		state->phy_gpr = devm_regmap_init_mmio(dev, base, &regmap_config);
 		if (IS_ERR(state->phy_gpr))
-- 
2.47.2


