Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E36C52CD83
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 09:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234955AbiESHvZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 03:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbiESHvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 03:51:22 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0692D19F81
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 00:51:21 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id k126so2401296wme.2
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 00:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DG5A5GdlenYo4QJbOcBZwaKuyMdIzocKcvymvOTAtz4=;
        b=THg3bDf3aTaSXxJfRt8SwsQfDLodjKdY5hX+OyJS+2yxlLqtCRtAa5+9t88Bj2jCAz
         HbcQLXlRPrHeAmZhzyURbID9twuy9sQj92O8/u3Jv6u3sCHEuMqbyztNNSBnfikPtOf3
         OFE8zFxeslePa1TXY6cJ8sG0pb8eUALhMJZ9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DG5A5GdlenYo4QJbOcBZwaKuyMdIzocKcvymvOTAtz4=;
        b=RkhNvCUF//Hew98IrTMtRT7MtrSSsI1NbfFc8afhOwXjihFGziol7GURCYTyQEQx2U
         2E/xH32EgpAdzMXtRRpxa69cc9A2B8EMj6TDMLyRjAKes8fkBbg58BFHGl0MOnndOdXC
         Nh37U0XoZ6noeatBd6oBArYb9kKNm5e8Zsr3i5cPnGGd1LfJYTCrzTcarfOu50YVNS9+
         1G4NH1K7Eiu0DMXn+bf7T6iCV6CFlI5Hw63v49gRf8OPs3NA+7MTPCyl/aISgWctIp2u
         58YMaP2SLrx/NFt2z3AZHMJuoCdFZz033xIlm7mcpDIYMC8nC2euv3Sgm30NwxABEivo
         1fog==
X-Gm-Message-State: AOAM531EWrswhU+SefOMNz0WQODyFhu0dIrtEM39wamMfUe9N4gBpDDv
        Id8UxQCeS3dIUQplnLonC2X0fA==
X-Google-Smtp-Source: ABdhPJx6a7WsbgetELvNlkwQpwr8+mf5E5xPlk5wHymKuplq9hROxcf2dvtAXNwowawabAU8AGXX6Q==
X-Received: by 2002:a7b:cb83:0:b0:37e:bc50:3c6b with SMTP id m3-20020a7bcb83000000b0037ebc503c6bmr3129641wmi.67.1652946679492;
        Thu, 19 May 2022 00:51:19 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-53-154.cust.vodafonedsl.it. [188.217.53.154])
        by smtp.gmail.com with ESMTPSA id c6-20020a05600c4a0600b003942a244ebfsm3370254wmp.4.2022.05.19.00.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 00:51:19 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     tommaso.merciai@amarulasolutions.com, linuxfancy@googlegroups.com,
        linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: rockchip: px30: fix ov5695 camera probe
Date:   Thu, 19 May 2022 09:51:13 +0200
Message-Id: <20220519075117.1003520-1-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
This series fix camera probing issue of ov5695 camera driver for px30 evb.
Improve also the ov5695.c driver using using regulator_bulk_enable/regulatore_bulk_disable
function in __ov5695_power_on/__ov5695_power_off functions instead of for loop

1. use regulator_bulk_enable/regulator_bulk disable instead of for loop into
   ov5695 power_on/power_off
2. max drive-strength for cif_clkout_m0
3. add mux for mipi-pdn pad
4. use rk gpio naming convention for reset-gpio of ov5695

Note:
 - This series was tested on PX30_Mini_EVB_V11_20190507 board

Tommaso Merciai (4):
  media: i2c: ov5695: use regulator_bulk_enable/regulator_bulk disable
    instead of for loop
  arm64: dts: rockchip: px30: max drive-strength for cif_clkout_m0
  arm64: dts: rockchip: px30: add mux for mipi-pdn pad
  arm64: dts: rockchip: px30: use rk gpio naming convention into
    reset-gpios

 arch/arm64/boot/dts/rockchip/px30-evb.dts | 17 +++++++++++++--
 drivers/media/i2c/ov5695.c                | 25 +++++++----------------
 2 files changed, 22 insertions(+), 20 deletions(-)

-- 
2.25.1

