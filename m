Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03ECE5ADB92
	for <lists+linux-media@lfdr.de>; Tue,  6 Sep 2022 00:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbiIEWyw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Sep 2022 18:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232812AbiIEWyu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Sep 2022 18:54:50 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398DB14D3B
        for <linux-media@vger.kernel.org>; Mon,  5 Sep 2022 15:54:46 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id nc14so19551411ejc.4
        for <linux-media@vger.kernel.org>; Mon, 05 Sep 2022 15:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=AY38e3Y1B/S7L4VDN+SNO+YmSaywD4g+rBxdXKf89Dw=;
        b=qeaISqJZFXUCenSVew7J2ua/t8D3EvaKWs+XfN0Xyqh3oW0OlosmvAtWTIRCXm1K9b
         wdfrXzWgJGjagIwYbari7QTznPiukHbXic3eDwQDhqW9q3EQP2FCNx6e6VDtNZ3WgL1F
         0X7yxfJKF22Qfltjn9LZHz7zWszUeaIRNPJOPuYEJbcZI/keOmZVPZFPra/1GF3on2da
         MApPEccCnTWszPgg0ICQrT0cLCZ+Ekn2aNCtk15Zg7yCjedLo3Bu/fGIEbAODKhvmJYe
         o5uPzFWW+0+mdzqC9hclblmwFXrpeS5yIU0G9getqiXPOvUP2sWxs/l2C3x8HbFxWI4z
         yMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=AY38e3Y1B/S7L4VDN+SNO+YmSaywD4g+rBxdXKf89Dw=;
        b=Uz9UY/lJaSC9hmfoTkoBP99KAwx4sKToli/0Tzg+N8a/yMrjDKiOrILEDcb9DLLmyz
         fj0WpYdbazXAGf3t2a9dsamKueUjzEnfZDWRqYITdTxP2a4bR1DyOQN3JON6RFFzIquB
         RxWrclDJhIVKzzd76jyiSkbYULdRJcbQ9Vgrc0QkHM2ZkljQz4lJfgALHHF0v0I3mHpR
         p9Cn4d+R4F3lW06VrDCSfJ3Dt/IMyC8SSKmYirdlgCf6A7twh0wtf36na/cG8/sqM0lo
         oYMJ/f9hv24uM0r/Jwno2Kj9pzs8KbRBIi7CiojI9honCZ620xfGl1Eu/Is4or7J6Qcu
         4MCg==
X-Gm-Message-State: ACgBeo1E990A7XxAIAgQd7YxAON0x0b/f/H43ZMU6jobHNnSBRvGZj6E
        USzcxtPNFJgnOqVaLyqNDwwPZRGCpb+ADQ==
X-Google-Smtp-Source: AA6agR5IFIla6pZjvuCavVzJomKSsNap+WJvLy29eMi+GptGjmPGY7UtXEzOonUtdojOm4uVmbqlug==
X-Received: by 2002:a17:907:728c:b0:730:c005:5d93 with SMTP id dt12-20020a170907728c00b00730c0055d93mr37869071ejc.265.1662418485203;
        Mon, 05 Sep 2022 15:54:45 -0700 (PDT)
Received: from localhost.localdomain ([84.238.208.206])
        by smtp.gmail.com with ESMTPSA id ay2-20020a056402202200b0044841a78c70sm7090817edb.93.2022.09.05.15.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 15:54:44 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: venc_ctrls: Add default value for CLL info
Date:   Tue,  6 Sep 2022 01:54:34 +0300
Message-Id: <20220905225435.721588-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
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

Add default value for CLL info when creating compound control.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/venc_ctrls.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index cfcacdb797db..7468e43800a9 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -379,6 +379,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 		{ 34000, 13250, 7500 },
 		{ 16000, 34500, 3000 }, 15635, 16450, 10000000, 500,
 	};
+	struct v4l2_ctrl_hdr10_cll_info p_hdr10_cll = { 1000, 400 };
 
 	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 59);
 	if (ret)
@@ -606,7 +607,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 
 	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
 				   V4L2_CID_COLORIMETRY_HDR10_CLL_INFO,
-				   v4l2_ctrl_ptr_create(NULL));
+				   v4l2_ctrl_ptr_create(&p_hdr10_cll));
 
 	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
 				   V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY,
-- 
2.25.1

