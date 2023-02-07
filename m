Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9CB268D3FD
	for <lists+linux-media@lfdr.de>; Tue,  7 Feb 2023 11:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjBGKXs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Feb 2023 05:23:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjBGKXr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Feb 2023 05:23:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F2314E91
        for <linux-media@vger.kernel.org>; Tue,  7 Feb 2023 02:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675765380;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=kaGTXgzMg0XGfm10jL8cEFT/Bw3WHCNbxpsPm5Ff46U=;
        b=XSY7mx6L3jX9bQKe0qwtwVGRC9lS0FgJxup/NWXS1iZ9yFGfoRQ3+aMwl6zT09DiktbUO/
        vlOtFT4oI+R37cDA4ZVKLkh+9llXZJJd5mNB0XHg52GC8WOQv38pmDWn8b5pVVPMLkP9Bt
        J7B2yjUvc7Bwe1zyOm4grB7FZPSzjBE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-246-OEazth6XPTuvBgVH6bnzzg-1; Tue, 07 Feb 2023 05:22:58 -0500
X-MC-Unique: OEazth6XPTuvBgVH6bnzzg-1
Received: by mail-wm1-f71.google.com with SMTP id l31-20020a05600c1d1f00b003deab30bb8bso7036393wms.2
        for <linux-media@vger.kernel.org>; Tue, 07 Feb 2023 02:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaGTXgzMg0XGfm10jL8cEFT/Bw3WHCNbxpsPm5Ff46U=;
        b=VyI7icocBKen+ekuDqU2tm4Lb+WI7iOKeTVE41SDVUPnu1ABga4FU8X7vTvRtfo9Op
         aU1avkTG0Af8lZ7vcDxg9tpZF1L/ce/Cvk5RYZR4SjYkcsjHHv519rZOVG8RSIXTossK
         bCZxPT4GiVmOfPdTlM6JS4MT7FxCwfzBV6wBp6F7WqELsL6+uueflJ0X3qhtHRzwcD7r
         BCIfl70rv+LclDpf7wtKfV90azT+asA5Cvhx3WWjIAVjHIVmiiZNiMCdC6fS8OliC0yz
         GVdUOkNr5+iM4lwbDV7GpNkd59kFsatlZR/ZTl/RtlYHevlBQh+0XHfDXc77iV/0v0uK
         5AKA==
X-Gm-Message-State: AO0yUKUQHaxlNkD4Qjh1eMU2ckr0Kq4kRKLG39jl7BMHzMG0hrTQuR7S
        Ra6O0II3Udii50W02GYSphM238w0SMAhaAy47Wghxe5WwtfVMDP6szn8tvNiF297S5PINYddQBA
        UCgt6W6E7r5b3okYenlrthIs=
X-Received: by 2002:a05:600c:30d3:b0:3dc:2137:d67d with SMTP id h19-20020a05600c30d300b003dc2137d67dmr2548325wmn.16.1675765377522;
        Tue, 07 Feb 2023 02:22:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+kFJF3IIArixCkhseEqNzPTZb4cGYHwhhx51Ic3oP3/RY+LTlDYZBBIOlKPPts4sizqXDatw==
X-Received: by 2002:a05:600c:30d3:b0:3dc:2137:d67d with SMTP id h19-20020a05600c30d300b003dc2137d67dmr2548318wmn.16.1675765377333;
        Tue, 07 Feb 2023 02:22:57 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r16-20020a05600c459000b003e00c9888besm2632708wmo.30.2023.02.07.02.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 02:22:57 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Albert Esteve <aesteve@redhat.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] Revert "venus: firmware: Correct non-pix start and end addresses"
Date:   Tue,  7 Feb 2023 11:22:54 +0100
Message-Id: <20230207102254.1446461-1-javierm@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This reverts commit a837e5161cfffbb3242cc0eb574f8bf65fd32640, which broke
probing of the venus driver, at least on the SC7180 SoC HP X2 Chromebook:

  [   11.455782] qcom-venus aa00000.video-codec: Adding to iommu group 11
  [   11.506980] qcom-venus aa00000.video-codec: non legacy binding
  [   12.143432] qcom-venus aa00000.video-codec: failed to reset venus core
  [   12.156440] qcom-venus: probe of aa00000.video-codec failed with error -110

Matthias Kaehlcke also reported that the same change caused a regression in
SC7180 and sc7280, that prevents AOSS from entering sleep mode during system
suspend. So let's revert this commit for now to fix both issues.

Fixes: a837e5161cff ("venus: firmware: Correct non-pix start and end addresses")
Reported-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/media/platform/qcom/venus/firmware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 142d4c74017c..d59ecf776715 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -38,8 +38,8 @@ static void venus_reset_cpu(struct venus_core *core)
 	writel(fw_size, wrapper_base + WRAPPER_FW_END_ADDR);
 	writel(0, wrapper_base + WRAPPER_CPA_START_ADDR);
 	writel(fw_size, wrapper_base + WRAPPER_CPA_END_ADDR);
-	writel(0, wrapper_base + WRAPPER_NONPIX_START_ADDR);
-	writel(0, wrapper_base + WRAPPER_NONPIX_END_ADDR);
+	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
+	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
 
 	if (IS_V6(core)) {
 		/* Bring XTSS out of reset */
-- 
2.39.1

