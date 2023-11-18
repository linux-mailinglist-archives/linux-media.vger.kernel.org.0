Return-Path: <linux-media+bounces-536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF857EFF64
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 13:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2247280DD8
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 12:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3955710A2A;
	Sat, 18 Nov 2023 12:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ANdJnKFM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30595D5D
	for <linux-media@vger.kernel.org>; Sat, 18 Nov 2023 04:11:40 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-4083f61312eso3487265e9.3
        for <linux-media@vger.kernel.org>; Sat, 18 Nov 2023 04:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700309498; x=1700914298; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1tqY3E3gRmP482a4I9SyEm7K69jCzqs5aXA0CUIn8z0=;
        b=ANdJnKFM1xVJwQR92qSWezV5UGGSfdug4s7lKnDXpUvdFTtKIMYqdDs5PrUP1so25z
         /EgzDWBDGO70O1Ffv164mRKpKQbSjPqe7V+EIYrA9G4PYd8xKslMse8jj0lUMgtOOi+y
         NjPtLU0MZKTTjT0a03ZFyUQXgYb0DqTkCn63+YZMS9Tw8c1Ctoy2xLi2GJ/VKqu24xMM
         OCQRb2DNBW/c5pFJwatg2yhUE6ZvtwdIKindpgUzGgD4i+bYwMl6EpX1fRj/P3CP7iPh
         sNRALY3a4JZF3N48ubJ6s7bfHzAwEGKR/y1xlIjP/+cLII29gcybe0V5VcE0A/B8nRUi
         kPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700309498; x=1700914298;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tqY3E3gRmP482a4I9SyEm7K69jCzqs5aXA0CUIn8z0=;
        b=h0sSDK0IPPLO2a1HQ+WCI9ZgDIuQ+pElG8sdm1lVAFNz0useZOYrNAvkhl/Oz5K5KU
         yab5wAde/bD/LeC7kHn2r5XNLH8MetID0p5lb+8ZEi14BIDvDHD53Y98aK2blp9wFdYb
         4A/WlJW4dPzthTXQepz4W/9IlF99cGeo8sM5yo3e51YrDdoSSqlEAOmKFrUZQjYNUsn3
         GGK/L07w6aemPzVevnKTHqGYrtgU9c/P+2Q9Zqfuoh4q5SUrE5ZYn0MhWypWiZ8C7XkZ
         Ho+kxN+tmF/cMSO5O8jfi0iSdqAewCX4HUKCMvpPyrVamGWJbfsAOlqBjrOeEQhrShL0
         vohQ==
X-Gm-Message-State: AOJu0YxaW4Nu+WxXrWKJbl7DIqGej/ewJ6pcI4fFv7a1nDEqX7cuBE3a
	huWBgGKi4imoNCTU/yn9JgKHZA==
X-Google-Smtp-Source: AGHT+IHiLyoXO4n3y7ykbqPRj5MIL7yp3tpQI1akwP+V55X/Ooujwxsm5tHqRL2+8dvTvcSCDebl3Q==
X-Received: by 2002:a05:600c:4f05:b0:409:2f7:d771 with SMTP id l5-20020a05600c4f0500b0040902f7d771mr1747817wmq.4.1700309498534;
        Sat, 18 Nov 2023 04:11:38 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c3b9200b00407efbc4361sm10955775wms.9.2023.11.18.04.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 04:11:37 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v5 0/7] media: qcom: camss: Introduce support for named
 power-domains
Date: Sat, 18 Nov 2023 12:11:34 +0000
Message-Id: <20231118-b4-camss-named-power-domains-v5-0-55eb0f35a30a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPepWGUC/4XOQW7DIBCF4atErDsWDJAoXfUeVRdjwDZSzURD6
 jaKfPfidOOusnyb7/13VZPkVNXr4a4kLblmLm34l4MKE5UxQY5tK9RojbYGegeB5lqh0JwiXPg
 7CUSeKZcKISAFPCF6Z1UjLpKG/PPg3z/aHoRnuE6SaIfi0XivHXbem1N7aB9yo9Jx5MLj9JXeP
 nMh4Y5l3NAp1yvL7ZG82I3+g4x+UrdY0ND3cfADojsi7eEtb3F7zT7RXNOspbP21p9jH/5p67r
 +AsnbFLdcAQAA
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com, 
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13-dev-26615

V5:
- Adds Konrad's RB -> b4 trailers --update
- Amends comment and control flow disjunction for readability - Konrad

- Link to v4: https://lore.kernel.org/r/20231103-b4-camss-named-power-domains-v4-0-33a905359dbc@linaro.org
Link:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/b4-camss-named-power-domains-v5
sm8250-testable: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/b4-camss-named-power-domains-v5+sm8250

V4:
- Updates camss_configure_pd() to use has_pd to determine if
  a VFE has a pd instead of comparing to vfe_num
- Brings in is_lite fixes from Matti
  The determination of IS_LITE() has been a running sore in this code for
  some time.

  Named power domains remove magic index dependencies.
  Similarly adding an "is_lite" flag to our resources removes the last
  of the magic indexing sins, so this is an opportune series to add it in.

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/b4-camss-named-power-domains-v4
sm8250-testable: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/b4-camss-named-power-domains-v4+sm8250
Link: https://lore.kernel.org/r/20231101-b4-camss-named-power-domains-v3-0-bbdf5f22462a@linaro.org

V3:
- Includes bugfix reported on IRC
  genpd_link and genpd should be checked for NULL on the cleanup path.
  Matti Lehtimäki 
- Retains NULL check before dev_pm_domain_attach_by_name()
  I experimented with the suggested drop but of_property_match_string()
  chokes
  Link: https://lore.kernel.org/lkml/883ce8a7-80e1-4065-a957-424d0b4a6535@linaro.org/T/#m10e5a43d0245f13eca177ef2f65b24259c641030
  Konrad
- Fixes spelling caught by codespell - Konrad

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/b4-camss-named-power-domains-v3
sm8250-testable: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/b4-camss-named-power-domains-v3+sm8250

V2:
- Incorporates Konrad's suggestion re: removing 'id'
- Adds RB - Konrad
- Adds in a flag to indicate if a VFE has a power domain.
  As I rebased this series I realised we had some magic indexing for VFE v
  VFE Lite, which isn't the root cause of my bug bear in this series but is
  the same sin - inferring functionality from indexing.
  Once we transition fully to named pds we won't need a 'has_pd' to flag
  which VFEs need power-domain attachment and which don't.
  That transition will require populating all upstream dtsi with pd-names
  and then deprecating the old way.
  has_pd is a far better choice than inferring from indexes so, I've added.

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/commits/aa45a2b58aa1e187a2698a65164d694251f08fa1

V1:
At the moment the Qcom CAMSS driver relies on the declaration order of
power-domains within the dtsi to determine which power-domain relates to a
VFE and which power-domain relates to the top-level (top) CAMSS
power-domain.

VFE power-domains must be declared prior to the top power-domain. The top
power-domain must be declared last. Early SoCs have just one top
power-domain with later SoCs introducing VFE specific power-domains.

Differentiating between the number of power-domains results in lots of code
which is brittle and which we can mostly get rid of with named
power-domains.

The reliance on declaration ordering is in-effect magic number indexing.

This series introduces named power-domains for CAMSS and refactors some of
the code in CAMSS to support the new named power-domains. We continue to
support the legacy indexing model with an intention to remove after a
reasonable transition period.

New SoC additions should use named power-domains from now on.

Tested on x13s, rb5, db410c

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-10-23-camss-named-power-domains

Bryan O'Donoghue (5):
  media: qcom: camss: Flag which VFEs require a power-domain
  media: qcom: camss: Convert to per-VFE pointer for power-domain
    linkages
  media: qcom: camss: Use common VFE pm_domain_on/pm_domain_off where
    applicable
  media: qcom: camss: Move VFE power-domain specifics into vfe.c
  media: qcom: camss: Add support for named power-domains

 .../media/platform/qcom/camss/camss-vfe-170.c | 36 --------
 .../media/platform/qcom/camss/camss-vfe-4-1.c |  8 +-
 .../media/platform/qcom/camss/camss-vfe-4-7.c | 36 --------
 .../media/platform/qcom/camss/camss-vfe-4-8.c | 31 -------
 .../media/platform/qcom/camss/camss-vfe-480.c | 36 --------
 drivers/media/platform/qcom/camss/camss-vfe.c | 77 ++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h | 16 ++++
 drivers/media/platform/qcom/camss/camss.c     | 87 ++++++++++++-------
 drivers/media/platform/qcom/camss/camss.h     |  7 +-
 9 files changed, 156 insertions(+), 178 deletions(-)

--
2.42.0

---
---
Bryan O'Donoghue (5):
      media: qcom: camss: Flag which VFEs require a power-domain
      media: qcom: camss: Convert to per-VFE pointer for power-domain linkages
      media: qcom: camss: Use common VFE pm_domain_on/pm_domain_off where applicable
      media: qcom: camss: Move VFE power-domain specifics into vfe.c
      media: qcom: camss: Add support for named power-domains

Matti Lehtimäki (2):
      media: qcom: camss: Flag VFE-lites to support more VFEs
      media: qcom: camss: Flag CSID-lites to support more CSIDs

 .../media/platform/qcom/camss/camss-csid-gen2.c    |  31 +++---
 drivers/media/platform/qcom/camss/camss-csid.c     |   5 +
 drivers/media/platform/qcom/camss/camss-csid.h     |   7 ++
 drivers/media/platform/qcom/camss/camss-vfe-170.c  |  36 -------
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |   8 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c  |  36 -------
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c  |  31 ------
 drivers/media/platform/qcom/camss/camss-vfe-480.c  |  69 +++---------
 drivers/media/platform/qcom/camss/camss-vfe.c      |  84 +++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h      |  26 +++++
 drivers/media/platform/qcom/camss/camss.c          | 116 +++++++++++++--------
 drivers/media/platform/qcom/camss/camss.h          |  10 +-
 12 files changed, 236 insertions(+), 223 deletions(-)
---
base-commit: 48016737a9af47328dd321df4dd3479ed5e2041d
change-id: 20231031-b4-camss-named-power-domains-cc2ac2722543

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


