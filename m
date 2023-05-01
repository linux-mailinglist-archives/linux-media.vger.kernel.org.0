Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5536F3044
	for <lists+linux-media@lfdr.de>; Mon,  1 May 2023 12:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbjEAKjV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 06:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjEAKjT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 06:39:19 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6E2B5
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 03:39:18 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3010889c6ebso1319675f8f.2
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 03:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682937557; x=1685529557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qoKfxkFCc17p3ym+nE35o+to4M3ZNlziHRTvLpVgt8s=;
        b=wLi8Heaurv0eP1LGRSDRoaOdrV41HiIg50YcEOx2xUbsaFXci5LK9HRc6/YP/rmPdI
         TIiP/uuvM9LAT3gOLZBLga6S7Wxy3QXl6Xmgdi6FQNHN9PXbkWSUN8EkAf14ek1LAJRx
         o/oB8ANMqcAkEwlWycs4EOvwTZoslPB5w64NiAimEH6u51rZB/bvrOF+zP8ziut7Js29
         ehctXc9dm2sCeiJqvQiz7GG345rTGv+5ZdvFt0FvShBH5RV7nisQo7GE0jQa3W6G82xA
         zRrHopC7BrwZgZnljCU2PMkw9FhtGS3HaLujvUfEiL/4vizumnhP0pyUvMCaxCeeMMjq
         GluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682937557; x=1685529557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoKfxkFCc17p3ym+nE35o+to4M3ZNlziHRTvLpVgt8s=;
        b=aEkTHYNTuISkHWb9F3Kd9OT2yCwOIscCUKJFpT/nfIajYvXnORSYVkEXB0CCUr+qEC
         MuRgqKkur4OHTw6NCq2B+mTfengzM1cDpj5D1LOEjMPyEXKRxdNqInEArY52e5/dtKvZ
         InQQ4H4ztQCWuOfgC98ADRou4j0L4Mr88TyEtd29Jnzdyg3S9iiiKGRvJmbAcJ2xFtSz
         2ZJivsGP8pdM3Ltzaqhx4Oav6VSV/PjCs9r7D+AuEaG9Z4mlJfaLxqluf5rs1zpSG0RP
         ALKzOda6TY+UhkbqRrZKe/vxvKi8yLuimRxIygvbVaRXTqJLyZxsmmI11XUT2MFo7/ka
         YosA==
X-Gm-Message-State: AC+VfDzgeoyDf1VdEuMniG9G5TOZq3ZX+XZvj7eLAW1Xkf/F3QZvuu/d
        ZJz+id9TWUFI8MDCD9RvR/xuEkmIIFRK4AZWy9o=
X-Google-Smtp-Source: ACHHUZ4bCn1GKAghfFAkQ/mgwytbtbz5hbc3F2LoZNzKFm43jKIs2+GAjb8/ICCch0uoCQzLcVEOcw==
X-Received: by 2002:adf:e78f:0:b0:2f4:e0e5:aaf8 with SMTP id n15-20020adfe78f000000b002f4e0e5aaf8mr9798189wrm.68.1682937557122;
        Mon, 01 May 2023 03:39:17 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k10-20020a5d428a000000b00306337e5464sm31718wrq.44.2023.05.01.03.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 03:39:16 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     laurent.pinchart+renesas@ideasonboard.com, broonie@kernel.org,
        dorum@noisolation.com, javierm@redhat.com,
        quic_bjorande@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH] media: MAINTAINERS: Add myself as Venus reviewer
Date:   Mon,  1 May 2023 11:39:14 +0100
Message-Id: <20230501103914.962874-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I'd like to be looped in on changes to venus so that I can help ensure no
obvious regressions creep in. I'm happy to run some simple tests for venus
on the hardware I have access to

- db410c
- db820
- rb3
- rb5

and one of rb1 / rb2 in the future when they are delivered.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 713422f465365..e63b1725b5ada 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17546,6 +17546,7 @@ F:	include/dt-bindings/usb/typec/qcom,pmic-typec.h
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
 M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
+R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.39.2

