Return-Path: <linux-media+bounces-921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A977F64B3
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 18:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98985281A9E
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 17:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC6D3FE39;
	Thu, 23 Nov 2023 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cgbb1ky+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F127519D
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 09:03:03 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-32deb2809daso704359f8f.3
        for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 09:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700758982; x=1701363782; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qi5AXV/XPQXrVfNewbrlXLY53GrreaMJsBTTjyU4Bcs=;
        b=Cgbb1ky+sYF4BMkZeysrpY17NOMdDD+vnWcg9nYX6xdn6jRsnVxUvcyaTXfxDGi+Qq
         CyqJfg/cMztuaygVYBFRXJKU//uGFmlwgkS/+XQAw/gpCQApIisFjldCJbH3PQbQMUIT
         dq64xqpM0O8XzBPpeFS4+VICRwLN1cdP/fx1U/7+Y/fbDoeC0/3UyUVZYIyIU/hFdbOP
         PFTsq1pom1PhdrXMXXpDcLNckVb+HWnsIUcbA1zsS7jmateU/2gwBdryaOqc6kJv2Hfp
         SuXqFHfTPEgi3JSe4Aa09i/ut/faML8mCEfSlBYxMX4wH28Jep+4Kp6pe1ahcPb8EnxZ
         CqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700758982; x=1701363782;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qi5AXV/XPQXrVfNewbrlXLY53GrreaMJsBTTjyU4Bcs=;
        b=CL6srFXIbu3RPdKpU7LtD8a0EzAPRJIVA9nnuyu56mTSQxsPz8mK76fbaZ7aNs471i
         r30DeGcjLxLl16ToPGlh1MteYqI6G6cNwuvB4YyMbV+/hLUjR5N2sKwHGOwnaGKQKXLo
         2yJKGRGljJ2V6+MsN0k7cNSWsLsz8iln5MzVXYLhjdPPJvJbFV4m1hnXiaB6NuKCqW/9
         Lb74mvRjFbmPnXwWvj1isgjPg2VDBLNpZ+SWNSM51jYYsAoXktu9zJ2tlGx159rQlYoG
         H2UEfgUw1193XQ+CY+AW0TYxjxbsg1tjCfrsWMOivDlCN4kDxKC8gApXwodKfWLIrlN/
         f7rA==
X-Gm-Message-State: AOJu0YweJGc+bYFLCy1uyNWlbUVvjZgKaSKjicoPK97W9UEyR+VwoY08
	HDyfiF/NnoVlC8gHp4IdJfWV1H1HJeztICEUGS1qdkPDoAw=
X-Google-Smtp-Source: AGHT+IESZ6d1/HEHFMW7dMhL1SwiOK1YYBjKW81PevEAr4Rf9KVsywsiC+8z12DRYExaVh5Y1+3qMg==
X-Received: by 2002:a5d:40c8:0:b0:332:de0f:d7be with SMTP id b8-20020a5d40c8000000b00332de0fd7bemr60189wrq.18.1700758982359;
        Thu, 23 Nov 2023 09:03:02 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id f9-20020a0560001b0900b0032196c508e3sm2172585wrz.53.2023.11.23.09.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 09:03:01 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v6 0/8] media: qcom: camss: Introduce support for named
 power-domains
Date: Thu, 23 Nov 2023 17:02:59 +0000
Message-Id: <20231123-b4-camss-named-power-domains-v6-0-3ec2fd9e8e36@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMOFX2UC/4XOQW7DIBCF4atErIsFM4zTdNV7VFmMAdtINUSQO
 o0i37043bjqwsu3+d7/EMXn4It4OzxE9nMoIcU62peDsCPHwcvg6hagALVCLTsjLU+lyMiTd/K
 Sbj5LlyYOsUhrgS0cAcigqMQl+z58P/mPc919TpO8jtnzBoVWEykDDZE+1of6ke8cm+RSTMP45
 d8/Q+ScmpSHFR1DuaZ8fybPuNK/kFY7dTNKJbvO9dQDmBZ4C695s9lquKOZqiHySRHSyXX2n0Y
 bTb/uaFQ1It+pHolR/W1bluUH3Ck7faoBAAA=
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com, 
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13-dev-26615

Changes in v6:

- Kernel test robot sparse spalt fix - kernel robot

- Imports an additional patch to switch on named pds for sm8250
  I debated including this with myself and didn't opt for it.
  Happy to pull it in based on feedback though - Konrad

- Changes code in patch #4 newlines, returns.
  Christmas tree's per suggestion barring placing ret last - Konrad

- Moves switching off of TITAN gdsc to last.
  This is how it "ought" to happen logically it is simply happenstance that
  TOP is the parent of the VFE gdscs that the ordering of the switching off
  is irrelevant but, the code should really make the call per our
  conceptual expectations - bod, Konrad

Link: https://lore.kernel.org/r/20231118-b4-camss-named-power-domains-v5-0-55eb0f35a30a@linaro.org
Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/b4-camss-named-power-domains-v6
Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/b4-camss-named-power-domains-v6+sm8250

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
Bryan O'Donoghue (6):
      media: qcom: camss: Flag which VFEs require a power-domain
      media: qcom: camss: Convert to per-VFE pointer for power-domain linkages
      media: qcom: camss: Use common VFE pm_domain_on/pm_domain_off where applicable
      media: qcom: camss: Move VFE power-domain specifics into vfe.c
      media: qcom: camss: Add support for named power-domains
      media: qcom: camss: Add sm8250 named power-domain support

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
 drivers/media/platform/qcom/camss/camss-vfe.c      |  81 ++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h      |  26 +++++
 drivers/media/platform/qcom/camss/camss.c          | 119 +++++++++++++--------
 drivers/media/platform/qcom/camss/camss.h          |  10 +-
 12 files changed, 236 insertions(+), 223 deletions(-)
---
base-commit: 48016737a9af47328dd321df4dd3479ed5e2041d
change-id: 20231031-b4-camss-named-power-domains-cc2ac2722543

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


