Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16DF27D5E5B
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 00:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344466AbjJXWnP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 18:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344484AbjJXWnO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 18:43:14 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7B110C3
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 15:43:11 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-408382da7f0so40995975e9.0
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 15:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698187390; x=1698792190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pJhmv+TQSjKHEo0DycCEGNE2CWl5ZIeQ2W8fUwi7t7A=;
        b=dw97K+ntoUbQBcsfLDVTvMWA3gofaLKOjXBJ2fZ+bp3fkgU4EV24+/p6oR9Ft0PYpc
         msFadSNfqXj9mGEK/ZxV7Y7soPbWTQ9eYf72Q9ZvzPpd/pUWwS0pdrHjyZAa0pEY7HIb
         DoO0530KVMBchwrtY7gn7rNwGhhBTrd8908D/+NDLow+K+bqZCCPofo/VOWCxSeZyT3k
         kOWHuO0fQI6WhCbXvRDgztojhf5ZcUk9z9lsCOd1DFP0EURFOCrYfQvJHNnaG2mYQvbe
         b+2Xik3v/CwZ12CMk9JrcO3O4x2K3yBGsFLcWnk078FQ81HJrSTf64ht3AEjgX9LlbYC
         tfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698187390; x=1698792190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJhmv+TQSjKHEo0DycCEGNE2CWl5ZIeQ2W8fUwi7t7A=;
        b=rT9c52Z4C0s32xkY0+Ppm+C3wSwS7KZIknwor3tNgwo5CYVVeJPSigmmVPGzzsNJPG
         y2+947yK8zrE+SRNBeUgu/t1svrs7rb6I/xq51KxcKS539DFW7/t8Nv9EmBXV2PFn5JF
         WZm9J5GEl5Ynp+zQ9hKSP8K0Lx0gKLDFtnKv50Dd76siax4uH+Ppry7gvXHhA1a+FngV
         WJFiUVNsOnw67gwrhNBPifsXxZ64LV++uEn8HA7zTrQqdySfNlxVOhYW/ZQfj5Eze4+x
         IWfeRJ/cvH2UjSytkhg0vjWbqRPSbHmYAcggfUs8yIOkpw44Hqf18vLEgp6av7XR7tNr
         X9aA==
X-Gm-Message-State: AOJu0Yxe2hhUNA7HsKiY9fiPg5SBgROVbig+QhX7q4dDasCxSqBTMwMW
        QvQotZM9v4I6QhI+v0AFE7za+pwtumkIjPg/JSXkbw==
X-Google-Smtp-Source: AGHT+IG4zV9bbHEG0COlZgIjz9Ddl+HZ6m3yJbeEiXmsOGqHi650xa+ImIgOsPZzHvsbNAUXkbrFHQ==
X-Received: by 2002:a05:600c:1911:b0:409:351:873d with SMTP id j17-20020a05600c191100b004090351873dmr5266406wmq.31.1698187390277;
        Tue, 24 Oct 2023 15:43:10 -0700 (PDT)
Received: from sagittarius-a.nxsw.local ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c190600b0040641a9d49bsm13049531wmq.17.2023.10.24.15.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 15:43:09 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        rfoss@kernel.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/4] media: qcom: camss: Introduce support for named power-domains
Date:   Tue, 24 Oct 2023 23:42:51 +0100
Message-ID: <20231024224255.754779-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

Bryan O'Donoghue (4):
  media: qcom: camss: Convert to per-VFE pointer for power-domain
    linkages
  media: qcom: camss: Use common VFE pm_domain_on/pm_domain_off where
    applicable
  media: qcom: camss: Move VFE power-domain specifics into vfe.c
  media: qcom: camss: Add support for named power-domains

 .../media/platform/qcom/camss/camss-vfe-170.c | 36 ---------
 .../media/platform/qcom/camss/camss-vfe-4-1.c |  8 +-
 .../media/platform/qcom/camss/camss-vfe-4-7.c | 36 ---------
 .../media/platform/qcom/camss/camss-vfe-4-8.c | 31 --------
 .../media/platform/qcom/camss/camss-vfe-480.c | 36 ---------
 drivers/media/platform/qcom/camss/camss-vfe.c | 79 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h | 16 ++++
 drivers/media/platform/qcom/camss/camss.c     | 79 +++++++++++--------
 drivers/media/platform/qcom/camss/camss.h     |  6 +-
 9 files changed, 149 insertions(+), 178 deletions(-)

-- 
2.42.0

