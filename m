Return-Path: <linux-media+bounces-40266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D38B2C31B
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 460121BA6169
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F01343D8A;
	Tue, 19 Aug 2025 12:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKCr8t3u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550C3343205;
	Tue, 19 Aug 2025 12:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605820; cv=none; b=euOm+3j1FjU+h+SjsJB7Gue+IXsyNdcjXcbrfzmg7CUQeccZbO0wiLivwrnBu1S8D5TR43UYgAeA5xnEPFwvrocFnWTNTUkNK/hf3rmRmaYzT/tYlFTOcfjrm/wvUXICqFC6fQqani5OOH98KtHdp6YMGHvgQLfet27wg6dWG7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605820; c=relaxed/simple;
	bh=osCItv1gM5PQB54g4FfDR02SJAqzIhc4j1K8ul5onL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGV+bUXTIqktKXNFwZKmXs0bOIzPfHRsTf8UKBN7tmmgbPYmuKZu8wXaOtMSydVOQfraw53gNQAp5aZdj5mKDu7mDeM4Fz9nQ/Uj8TJ5ZKIatI3O8BpaGqJ9AjSgwjgmEf+yO8/2u21iTNmAKnBg0jad+MKMnpbFupIMCK4AWKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKCr8t3u; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb78d5e74so886911966b.1;
        Tue, 19 Aug 2025 05:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605818; x=1756210618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X39bS8YQI5ECgqe9acCiMShhqwPzQXztY7zHETyiqVE=;
        b=gKCr8t3urhByiywmm+AlGT9LKFUCJgm7G+qzPH2CwgHQUp0ddOJz/1Ot2QpF9FSw79
         AELu3qWmWgM4wvGIAJDvakpZEa5p2Nhw/txfFEYh67yQl3TRvSupqjW6d6BhY1Zh0eAo
         nWgo6Axu9Mm9Y5BL++R0+ZYQ2Q0MNTCJiFEcesPC/74rF9lrE3ZbokGIKUHyzXRI0/2v
         M3KyBOgKNZhXlh7FFBAf/auW7keOCr5gPIrNyWe0LD60AoRmQafZ4dcxY4Tn3LzIv6HI
         amy6ZhIx/BDMzLXPQmPudYuA2ulx2s2oxYrr37QllORA1IK/+zLKsBDbdem2m+PCFyMF
         qmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605818; x=1756210618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X39bS8YQI5ECgqe9acCiMShhqwPzQXztY7zHETyiqVE=;
        b=ZsS427y4EQYctsKJSZG7RbZhay/yhRNl96J4aFJgV0f/i2ZI9C75427CLNXic9DdHb
         P6w0HSqpLcm76xlJZW9a5GFH/BCXL96jiPfzIix00z0tABfi7rsUsjv4OY7yl/pSr+0z
         MGLRLW9jF0YBWamDzIJFVe3DrnPDkLfQhqmSdiNLuH0YGwtO8mRBP+9w9VTQEU/g7zKa
         OEDpzQL8LMIks3URjhIbDWkD5S/bJUoNVyObWsPuu619VUIpwZ+y4UcUebEfsSyOnrY6
         g7JsIMMIXEDB+Xe17kN2TyhjiYwQgxQVZBBXYjasXLWzFj9/lItlggUiTJIxBsnBzDoy
         U93Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWiPPIXQw3wO2mJpwldaPASA2UBCWcqE+VwbSrsN7kcMp8qGy790XZ7gu0XWzMPXwijBSMrW/PLmrAq5Lp@vger.kernel.org, AJvYcCViuy17WbFuzQaSSkGBdZ26IeHMylkQlT+vDfYeBriVW7oc+OzrBMsE9nG6xiL5uBiMiKNxX677HZKFQEY=@vger.kernel.org, AJvYcCX/054iWtG76JDXtCmlFmH1SSmR100UPJbTsXZwKcjN9NfOVB8cCf8ChtpNk3dkuMsM8N0jK6r9wQGP@vger.kernel.org, AJvYcCXb0GtvPLwlpKWfeD2pPdg9XHnFlI2EVckto56+skCZqNVUpyyAIAbBlwPg4L2bBeSmi9XmnZlZHRyb@vger.kernel.org
X-Gm-Message-State: AOJu0YxmNRZv5RfgF2fEqDP8NVABrKNEKzOHMmDxGGkVsE0NVcVIc70y
	j4V49sMwHj+AQE/auVIQ09DDdp+UZpS+/yCvv+a/hAvbtRudc74PLp3g
X-Gm-Gg: ASbGnctqHlxDzPvoK0YVPO7RKdoz1DcJQlXogg2Z5vHSHxCgeRclFwgsUxOn6eM/Hk2
	EH1Gck06Cy2e1HY8RTh6jBFH73hAAxAtSVfWt05Lkjan0prAkgUvm1z3loT5vDZLWX/XRwAOmYb
	1WrPk62kE895QXqOsqrlqU5svNHvNYnzIpFUT/BjD/lU+eMsqGJCb279yyCwBaOXHn78dcrdmFs
	iB4UJCXsMITfuBBb4fXBYkXpaeqpWb91f1MI7T6zB6gqOc50OEPVJ9gvm3uo4t8MlHp8vpBj64L
	3zPL7ACJWFO9md7h4/xEBBMsGaliQ1phH3f6CChMEBa3wEkyuNY59XGFyOJzHwhykNolwE0cRCX
	HVugPQvEm+tIaeQ==
X-Google-Smtp-Source: AGHT+IGbpGm2q0e2vT/L5TwS5YIPOoZV60ORppzvUtAWrZ8nGwnpAAbMDs2G1YJK5NIJt0MUou8dFQ==
X-Received: by 2002:a17:906:6a25:b0:af9:6e4a:3b2c with SMTP id a640c23a62f3a-afddd1e8b70mr223480566b.43.1755605817641;
        Tue, 19 Aug 2025 05:16:57 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:57 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 09/19] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Tue, 19 Aug 2025 15:16:21 +0300
Message-ID: <20250819121631.84280-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add HFLIP and VFLIP from SoC only if camera sensor does not provide those
controls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 4f67adc395ac..61b65a2c1436 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.48.1


