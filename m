Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29EB67073B0
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 23:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbjEQVOm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 17:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbjEQVOh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 17:14:37 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D4847DA3
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 14:14:35 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ad1ba5dff7so12940611fa.3
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 14:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684358073; x=1686950073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gG/GQ4bkNLXJnem7GziPpF9ACnuRetCT8nUsDWFQHk=;
        b=vSIj1+oZFAYVRtwioBnGxGaAXDLfKXNpJfbu5/rANdjHYWUiK6Bj0df1uAHEXBy8Qv
         tOH5d33onrkYsznkSUgVGz4FrKk57R91ULfaaMyeKoS+h59UARWZbmN+3siNEK9hZ/wn
         RZ7d9X05HOFVMxhAQvPZxTkhC/QROoYGWu7ZCMcQ1mEOH1+e0B8oDJq/Tr5jMYXveRPK
         sRACF9P4AfpZ8RkHZO5jsdWoayleb56OaNGtyGEetPFpfBdxes2W2xyZ8KnlkreNJkDj
         0m1dvIP8HCW/9CTDdk7VmOUrhAQdACGjb6UJWwXorM/ggkLbd5Y2vBLsswz0Vjbv3xWo
         3KTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684358073; x=1686950073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gG/GQ4bkNLXJnem7GziPpF9ACnuRetCT8nUsDWFQHk=;
        b=bdBUEd7qSDJ0EaoilamElogF1DPYWnGUloZ/3SW8Z9Vr05icOZKAw5xNyR2EP2/Jpo
         iUAPSyHZgZfekgSVyVYBMxYcrBLqo+JDbW4Lpb5HJ1EteAoys9+zx8WtyX0m2VTLWc4y
         bkTHdcyTIZR6IHNRMf050URAidO70hva7YwkieLqZQdcdtjibupRYuP9IjI3vdbGCvfS
         cRK9MOJLwFtYh292Y9cedGZNODVy73ROKLh49kvBue2brGEcdHAAxrNPjoHwJjKbjdWq
         YpQtL1Dsfx6fnvZelPCzQ59erlKaetL0pvXdtA4hhJEJpSnNtMA//ch1v93I9tYxmKnz
         BBcA==
X-Gm-Message-State: AC+VfDxW7UqEhtnWj+T1zPF+YW/QI4SXkDKx0Cqc4Ayz79pS0OVTtarT
        zNgGqYH0238YpMepETe5pr1EYQ==
X-Google-Smtp-Source: ACHHUZ47dPN/yUfwtzFPQBsQNanqaTYmTSNJxzPm79fAGqBsWTcsMzZKpz0zDi4cW3weMgUcpFodJg==
X-Received: by 2002:a2e:2405:0:b0:2ad:fef4:94f8 with SMTP id k5-20020a2e2405000000b002adfef494f8mr5031112ljk.6.1684358073668;
        Wed, 17 May 2023 14:14:33 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8345000000b002ac88e29049sm4781142ljh.43.2023.05.17.14.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 14:14:33 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 17 May 2023 23:14:18 +0200
Subject: [PATCH v3 05/17] media: venus: firmware: Leave a clue about
 obtaining CP VARs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v3-5-6092ae43b58f@linaro.org>
References: <20230228-topic-venus-v3-0-6092ae43b58f@linaro.org>
In-Reply-To: <20230228-topic-venus-v3-0-6092ae43b58f@linaro.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684358064; l=1589;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=v9h9rG/TP42x17XwYSGnOJ0sfKKqjUawup8lEKzjmAc=;
 b=A5EEgQQqTZxOi6ejKxEA9oEfEBDTipRgEQMr+gx/nVDMyy8fYOae7ciOxHIEMRchnCpypoJqM
 GqjWy6f5X3ZDuoLE5VcFWurfDeNy8W4RY+BXSVuLaFeVC9vRYGz+5yj
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The qcom_scm_mem_protect_video_var accepts two sets of <addr size>
pairs as arguments. They describe the virtual address ranges of the
CP (Content Protection) and CP_NONPIXEL regions. It is however not
immediately obvious how to obtain these values.

Leave a comment explaining how one can translate the vendor device
tree properties for use with the mainline driver.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/firmware.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index cfb11c551167..572b649c56f3 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -241,6 +241,16 @@ int venus_boot(struct venus_core *core)
 		return ret;
 
 	if (core->use_tz && res->cp_size) {
+		/*
+		 * Clues for porting using downstream data:
+		 * cp_start = 0
+		 * cp_size = venus_ns/virtual-addr-pool[0] - yes, address and not size!
+		 *   This works, as the non-secure context bank is placed
+		 *   contiguously right after the Content Protection region.
+		 *
+		 * cp_nonpixel_start = venus_sec_non_pixel/virtual-addr-pool[0]
+		 * cp_nonpixel_size = venus_sec_non_pixel/virtual-addr-pool[1]
+		 */
 		ret = qcom_scm_mem_protect_video_var(res->cp_start,
 						     res->cp_size,
 						     res->cp_nonpixel_start,

-- 
2.40.1

