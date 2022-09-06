Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC045ADB99
	for <lists+linux-media@lfdr.de>; Tue,  6 Sep 2022 00:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232848AbiIEWyx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Sep 2022 18:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232875AbiIEWyv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Sep 2022 18:54:51 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E4B1571A
        for <linux-media@vger.kernel.org>; Mon,  5 Sep 2022 15:54:47 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id q21so5271680edc.9
        for <linux-media@vger.kernel.org>; Mon, 05 Sep 2022 15:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lj6svU5dIOGDkLU8LC4X7G03zfCjeMMEK2CginhPDGw=;
        b=DJILcdcn93s4ddaXMh/ZnTqT37hvVPWBgGKlwpihxbobUzSftFbE1551OGJiHQ4ODz
         5OcBIli49aGrtPyOJlPqD6s65pHKlMAyUppH4kk7PfIyVKY02ik6N/756zZZQkkilZZd
         r43rESiH1VdkyKDSQurBF1dPtEzKDN0fFUGTRZ+Oc1YcUeMqA22HwEw5qu/y1qnkEqWF
         +i023gAqL48bOkCsqSsfYS1Zp/l27CQtjqnKWKXGAMxunsB3ea81yCC430ueKNHH2JKH
         xnU8C9FwCT+s3bFrmotfu6vvAhy6jEd8xzK872BBLFW1yxpV6Ud8UmB/+jciKriwlD8l
         n8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lj6svU5dIOGDkLU8LC4X7G03zfCjeMMEK2CginhPDGw=;
        b=qosgGkkboIQxwz1r8C8nnXmFiIxr/1C412CSlf89d3mj7oQM/iZD5m1UF9KWDDjV0p
         CMx6oAnrD/3orr3pyHxL3GTGtT74u9B1+QI55Oj1lyRL9VSYUhcfz4PBCW97GJ/uz5fr
         WtBqcDVEtbNpQ2SUwesWtwE1KMV2d4rrsy3iU94D65SWu44DpIf5OZa0mDxJF7072heY
         CJybzJAvskIWZ1VSPD1IUSdLrkaXz1Xn5jPn+4USH9z//RO4N0+UPbkbiFWyknlVHDH5
         0Sej2IJ9HOTxYHOrr4jS6/IBMEufOzQPAB/KOyUADV9c3VmUmYWvnNOZAm6DbVeEwmYy
         xt/Q==
X-Gm-Message-State: ACgBeo27IRP1exk8E9hQaMFaWTUo1DWAhZ7XM9jP0emn1JcHTYiRlFLP
        UNi8Lv+ZKefuVElNVjcAhOYq8se+Nh6RDw==
X-Google-Smtp-Source: AA6agR5IL06y017aGaOnQpydEhv4hXA7RZ3ZuR6LVbuKnOsjoTw5ims2ScUYbh32/7TuIWxGjUywvg==
X-Received: by 2002:aa7:d150:0:b0:44e:3c06:d719 with SMTP id r16-20020aa7d150000000b0044e3c06d719mr8412150edo.265.1662418486013;
        Mon, 05 Sep 2022 15:54:46 -0700 (PDT)
Received: from localhost.localdomain ([84.238.208.206])
        by smtp.gmail.com with ESMTPSA id ay2-20020a056402202200b0044841a78c70sm7090817edb.93.2022.09.05.15.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 15:54:45 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: venc: Set HDR10 PQ SEI property only for MAIN10 profile
Date:   Tue,  6 Sep 2022 01:54:35 +0300
Message-Id: <20220905225435.721588-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905225435.721588-1-stanimir.varbanov@linaro.org>
References: <20220905225435.721588-1-stanimir.varbanov@linaro.org>
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

The HDR10 PQ SEI should be set only when the codec is HEVC and
the profile is MAIN10, otherwise some artefacts could be produced
on the encoded bitstream.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/venc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index cc08a3c8cd39..cdb12546c4fa 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -698,7 +698,8 @@ static int venc_set_properties(struct venus_inst *inst)
 			return ret;
 	}
 
-	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
+	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC &&
+	    ctr->profile.hevc == V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10) {
 		struct hfi_hdr10_pq_sei hdr10;
 		unsigned int c;
 
-- 
2.25.1

