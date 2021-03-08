Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60733330BBA
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 11:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbhCHKwi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 05:52:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbhCHKw0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 05:52:26 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E10BC06175F
        for <linux-media@vger.kernel.org>; Mon,  8 Mar 2021 02:52:26 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id v13so13954183edw.9
        for <linux-media@vger.kernel.org>; Mon, 08 Mar 2021 02:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nu5tkdFsaHazmRd4/55M771FR4RELHyaxuVaBLaaiaE=;
        b=nPiYOkvqpxOFvenVXbshjw+7ue8UcdngITP3Sc2q0OMxuvLvE1iLAgDD0kEXI1Oi2X
         iVoxHCNlKRcZ1UDTmVoy1EddhAVFAXQp7fDPOHnQ5rVwN4uOtw0Ios0vhPRiioS4LjDT
         UQT7+jt3RP9nIau/UNZKAey75BzkItjF/yEYXERQWRE34VICWmsEGMjSlS5MQkPrANDz
         zl47MnYwfHTb2utiHgCFg/PxM7bfqBuUp/VF1/Nb1zVPQf5prUFWFooMVBpEC5U07K07
         Ic0wQxw9y7463ThW4pGK2htYBvJ/foc/0VtJM+z35a0/EVsfiiQ5CPeMVL69WjVW1B6Y
         K8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nu5tkdFsaHazmRd4/55M771FR4RELHyaxuVaBLaaiaE=;
        b=IbOnaVGnbWakiaZnlEkLvf9zTeXyWB/d1ZTXDoD5H3Og1y6iqkUEEc3S7K57rCKah+
         cWd35/CkkQ2zaLF/BwCg2RuRTmG6m1mCYE5sU2YNcNKru2zyOnsSyeoQpPRvSgDv8TSl
         1UeFrabE9dpOnw8PP6DG5kwzH96VRd3sdjKbfe4vByPLDM8CYiYhD/dt/BP40fHf2lLk
         ABVltARDiRptYTcuF2ym9ylVf2txkeJBOEbTEoA5g8go+j86FDuKhivYPk9BFE6gFYae
         OJlbV88b4GBXEe/BYRAPWa5K8/oD8mJFzudiZ/W80aXwWxhZE1jc9LZXmxmbLGanaWxU
         k8mw==
X-Gm-Message-State: AOAM532ASDAhSTiIn0hjI5NU7zeIl3L07VJIg/UkShubYxhAZQGRj4e8
        YoxuLDxmyJ5p8QqzXkp7dss5nr0m5FFd2g==
X-Google-Smtp-Source: ABdhPJwtB41uQgy6Aa0WZYDSOeWQN28nOY9y1x3RwRq26SVOFIPISX2rp1z0BBMxNVTeul4+0cePHw==
X-Received: by 2002:aa7:cb8f:: with SMTP id r15mr21684254edt.130.1615200744772;
        Mon, 08 Mar 2021 02:52:24 -0800 (PST)
Received: from localhost.localdomain (95-43-196-84.ip.btc-net.bg. [95.43.196.84])
        by smtp.gmail.com with ESMTPSA id y9sm6386297ejd.110.2021.03.08.02.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 02:52:24 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 2/5] venus: hfi_parser: Check for instance after hfi platform get
Date:   Mon,  8 Mar 2021 12:52:02 +0200
Message-Id: <20210308105205.445148-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308105205.445148-1-stanimir.varbanov@linaro.org>
References: <20210308105205.445148-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The inst function argument is != NULL only for Venus v1 and
we did not migrate v1 to a hfi_platform abstraction yet. So
check for instance != NULL only after hfi_platform_get returns
no error.

Fixes: e29929266be1 ("media: venus: Get codecs and capabilities from hfi platform")
Cc: stable@vger.kernel.org # v5.12+
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index ce230974761d..5b8389b98299 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -235,13 +235,13 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
 	u32 enc_codecs, dec_codecs, count = 0;
 	unsigned int entries;
 
-	if (inst)
-		return 0;
-
 	plat = hfi_platform_get(core->res->hfi_version);
 	if (!plat)
 		return -EINVAL;
 
+	if (inst)
+		return 0;
+
 	if (plat->codecs)
 		plat->codecs(&enc_codecs, &dec_codecs, &count);
 
-- 
2.25.1

