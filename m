Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E51DC7DDFDE
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 11:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232836AbjKAKzc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 06:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbjKAKza (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 06:55:30 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E8288F
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 03:55:24 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32f7db21967so2995903f8f.1
        for <linux-media@vger.kernel.org>; Wed, 01 Nov 2023 03:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698836123; x=1699440923; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sVvzUyrgxrkAks6+jlJSOWv+m3kqCzBTwwL0DU3rvPY=;
        b=Kuw+I9ePyQlo1JOYC+MwMYzgPR6JIZ2LuPt+gzrxDhKAKo7ov5KorLBdNrq/MS7pbK
         cLJI4RdQVOe/xpmg4S0ng2CR0UZlMOM511Z4hbrwQAUYKC0asZn7Z8j2bs/+49heMu7x
         Qe004aUpiaW0Fm4qbZ8wE2X/efKMr80hJHAoVUq/aYaI0GVGLuBJ+sYjNkxt5Dpl01fz
         iA4q8gq0sLBHf9cgtKRDIVouqFjBSCDUBBEQxd/bwDbWhL2qkuyll4WnKnhccoEcDXTN
         PR4j01NW5L27BGeXwUMEuA/IxEeWtY++eWiw/6FwN/EpoYN1iFZ8XamLqiqsStbpuqvy
         +c3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698836123; x=1699440923;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVvzUyrgxrkAks6+jlJSOWv+m3kqCzBTwwL0DU3rvPY=;
        b=OratdERgFLNDXKvD9/9ZH1ZZGonUF/ne+s74d11V07LTvm73NL1u9Tt2KjsQ3ap72I
         1JvyrF7yHe64H8lJ7aAIo4f+y3lAn0EIQ8o5X/o2k6Gt+UYn+Zfkm27nUTsAlUk7fUu8
         6VqJfgCyBjgprqD9i2a+O86b15s115Eok0M2EQXwygL6wcnOAbbgfW88vGuGJaFysVzh
         ScwLIad9idzfiTh6Buxs3+GuTopZE4jXit79Uh1Q7BaYX6+MffxyzRaXk8dwCydNws0X
         SwddHf8lt46jbWSCXoF4z+9cO39nxceMsIElVhR5mx7HDp4hNuMk5loqMyHO7RLqK+lg
         ZrUQ==
X-Gm-Message-State: AOJu0Yw25JAwwFyUpWgPNhsueVaSRaGMKrK8l5dM/+CHCO8vpf8LFf26
        3fOF70II2dMFqH/71BRV3rSokg==
X-Google-Smtp-Source: AGHT+IHPtGGTtM+A+wdMKNsYBf0AdmQ2EFXwXE0SEDpTBR2APepPhqzaoEkeieqU3Rg9PeRQ0cTUHw==
X-Received: by 2002:a05:6000:156c:b0:32f:7908:63cd with SMTP id 12-20020a056000156c00b0032f790863cdmr12719295wrz.18.1698836122979;
        Wed, 01 Nov 2023 03:55:22 -0700 (PDT)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d6542000000b0032d09f7a713sm3830948wrv.18.2023.11.01.03.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 03:55:22 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 0/5] media: qcom: camss: Introduce support for named
 power-domains
Date:   Wed, 01 Nov 2023 10:54:30 +0000
Message-Id: <20231101-b4-camss-named-power-domains-v3-0-bbdf5f22462a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGYuQmUC/03NPQ7CMAxA4atUmXHVOg2VmLgHYjCJ20YiMXL4V
 dW7EzExvuV7qymskYs5NKtRfsYSJdewu8b4hfLMEENtgx3avrM9XAbwlEqBTIkD3OTFCkESxVz
 AeySPI6IbrKnETXmK7x9/OteeVBLcF2X6Q3HfO9cN2DrXj/VQH/qh3EqQLPPy4OM1ZlJpRWezb
 V8sB/7IswAAAA==
To:     hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        matti.lehtimaki@gmail.com
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.13-dev-26615
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
Bryan O'Donoghue (5):
      media: qcom: camss: Flag which VFEs require a power-domain
      media: qcom: camss: Convert to per-VFE pointer for power-domain linkages
      media: qcom: camss: Use common VFE pm_domain_on/pm_domain_off where applicable
      media: qcom: camss: Move VFE power-domain specifics into vfe.c
      media: qcom: camss: Add support for named power-domains

 drivers/media/platform/qcom/camss/camss-vfe-170.c | 36 ----------
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c |  8 +--
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 36 ----------
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c | 31 --------
 drivers/media/platform/qcom/camss/camss-vfe-480.c | 36 ----------
 drivers/media/platform/qcom/camss/camss-vfe.c     | 79 ++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h     | 16 +++++
 drivers/media/platform/qcom/camss/camss.c         | 87 ++++++++++++++---------
 drivers/media/platform/qcom/camss/camss.h         |  7 +-
 9 files changed, 158 insertions(+), 178 deletions(-)
---
base-commit: 48016737a9af47328dd321df4dd3479ed5e2041d
change-id: 20231031-b4-camss-named-power-domains-cc2ac2722543

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

