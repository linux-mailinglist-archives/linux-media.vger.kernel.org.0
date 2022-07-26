Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 688D0580956
	for <lists+linux-media@lfdr.de>; Tue, 26 Jul 2022 04:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232129AbiGZCPC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jul 2022 22:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbiGZCPB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jul 2022 22:15:01 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05ECC28E30
        for <linux-media@vger.kernel.org>; Mon, 25 Jul 2022 19:15:00 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id m17so17997602wrw.7
        for <linux-media@vger.kernel.org>; Mon, 25 Jul 2022 19:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JcNX8fG1dwva4LlOpTaC4VApjkm3Aw/Dm01zM0YkCwY=;
        b=t9AbUMvqmldhfPkMsR/5ay9pW5OnTV+P8MfsOseiIwQJjGKbVDms+fBOJ98IRGZMpO
         SIxV+tHDoFLxIE8H907L6E/seCQGzeF/KoEqQYVvaj1uv3LZhkDGYwADRavPOijxxEFe
         dZ7+6AbeIqqLOIvC+GX5bYyg2FxB4YFmRotw/q2BG5D6uRlGm6JZ3vcELCZB0xmNlI9z
         jJVzO+P2sPX2S7kKp2mG07J5Qp0Xpuq821fvCiPNio06ZW6KgTfSZWJdqEeOafzTadVK
         Z2GNr8t5b/M5xHmSpY5uLnwp9FfM62J1+zaSZCGYjAxUNQh68u9S5oAY4/f1N1RdcUvk
         G6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JcNX8fG1dwva4LlOpTaC4VApjkm3Aw/Dm01zM0YkCwY=;
        b=YW1rqrwc1r4YT+nsJ7vlXLeFbo/W32fNemLUuef3oQxbt2M0KIPG33Zs0I0zn1R2N3
         gT5PU+g+lnMRHz1Qu7/wXi35OrLl2QiCS95MJpf2jtokZa3gubvkQp/Jy+qmI5cWI7wg
         YGDlj7UDl8UzZncb8gznrmFvsIIqOjj7mZMmhIhKFS1gotaSFxxE08irvzihtKmEj0N9
         vUM9rHHD8GZXXTno9OCdvQwDUKJAsG1tsR+n2dix9cNhoq4ooFNNChNy9mrXScG+cU9Z
         U9KjQiH9MtxFnEyAj1b1u282HsgI/P/NuuTHMzCvh58XgY0NoH548BZMIbauYdr9TGKk
         Zmxw==
X-Gm-Message-State: AJIora8RrDfPsKbjgtLp8pB4hlXZBRc85IBdr3ZZWDKQvbp/7p+YgD8v
        rXIkHGWTOX8eZ7R4Cc/gEirElQ==
X-Google-Smtp-Source: AGRyM1u6/Md8Aekm2rKwAv7/ymhelInKvSnTAIncrYzAq28g4evHyjrHx+ZaF8iwHpYBigRZL1Uazw==
X-Received: by 2002:a5d:62cf:0:b0:21e:6e8c:34a8 with SMTP id o15-20020a5d62cf000000b0021e6e8c34a8mr8191525wrv.154.1658801697932;
        Mon, 25 Jul 2022 19:14:57 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r67-20020a1c2b46000000b003a308e9a192sm20005984wmr.30.2022.07.25.19.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 19:14:57 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH 1/2] media: venus: dec: Handle the case where find_format fails
Date:   Tue, 26 Jul 2022 03:14:54 +0100
Message-Id: <20220726021455.1814096-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220726021455.1814096-1-bryan.odonoghue@linaro.org>
References: <20220726021455.1814096-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Debugging the decoder on msm8916 I noticed the vdec probe was crashing if
the fmt pointer was NULL.

A similar fix from Colin Ian King found by Coverity was implemented for the
encoder. Implement the same fix on the decoder.

Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index ac0bb45d07f4b..4ceaba37e2e57 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -183,6 +183,8 @@ vdec_try_fmt_common(struct venus_inst *inst, struct v4l2_format *f)
 		else
 			return NULL;
 		fmt = find_format(inst, pixmp->pixelformat, f->type);
+		if (!fmt)
+			return NULL;
 	}
 
 	pixmp->width = clamp(pixmp->width, frame_width_min(inst),
-- 
2.36.1

