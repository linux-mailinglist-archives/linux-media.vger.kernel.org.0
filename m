Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF2C55CB2D
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 14:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237473AbiF0PFA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 11:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237211AbiF0PE7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 11:04:59 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD61B17592
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 08:04:57 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id i25so7973054wrc.13
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 08:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n2jsRBQt/as88KnizPDABOC4Rxp2adLjCepzZaIKHw4=;
        b=alhgb7zjFNA2DChp05P9W6U97OR3JUxFxOuLocZTHoA50Kq3TB1FjiYYmf4ocBmry9
         GOqGXS2fBITZMwEjSE+jWZJDzZRIUC2PfhXiR5uh0PqYfWSTXjKadJ8lpBJqi3Y2TKmW
         Yn5clXjLGwiK7q/SEQopZao8lJPj1CsshnoCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n2jsRBQt/as88KnizPDABOC4Rxp2adLjCepzZaIKHw4=;
        b=LXNCK7AvQaOwBghIl9OgetDJf3KIi4vBIV49eGiY+qu+dZUmkg+UNBGc8mWxMB5IuG
         mRNYhjro1nQP7fc0x+Hl8+ArhWUivH1mcp7ySdNu/VFxg25Qx+dBZhKYrBBU8P5rDgCY
         msBZLBJjtAtdN5RMyH7Sr4aUabISatUZGjk+iv0rk3kDJlH6IGg7e9RZYOujOw0M0/zZ
         QpsR1Sc2F0wk4UgEP89aAe2FHEAgWYDzRY9JfQY1XNqQ733Ocm85t2qu1wKH8lsufnGt
         AD50IBJe/3vQV/STZtx9QBLV8rMoQIaoxh9+wRgh3DIMp8Une8IPz2rCX/mrTE0q+3p0
         tggQ==
X-Gm-Message-State: AJIora+/R+71hHKpBToMGHq0MqamXnVKIWkelbQSB+Ca8R3S1at6hc5E
        bcYfprLLgKPlGFe/HGC//XMWmg==
X-Google-Smtp-Source: AGRyM1vjbzImBeyzjCT33qexRbsSGOojEv7XQ5hl+VQMUrn7xV7wiU9d6d6Kp/0ACop06AB39WMlcg==
X-Received: by 2002:a5d:50cd:0:b0:21b:a288:f987 with SMTP id f13-20020a5d50cd000000b0021ba288f987mr12566123wrt.146.1656342296444;
        Mon, 27 Jun 2022 08:04:56 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id d18-20020adfe852000000b0021ba3d1f2a0sm10581250wrn.48.2022.06.27.08.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 08:04:55 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] media: ov5693: cleanup code and add dts support
Date:   Mon, 27 Jun 2022 17:04:46 +0200
Message-Id: <20220627150453.220292-1-tommaso.merciai@amarulasolutions.com>
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

Hi All,
This series cleanup code on ov5693 driver and bring up dts support, also add
documentation for ov5693 camera sensor

Inspired by recently Quentin series:

 - https://patchwork.kernel.org/project/linux-media/list/?series=64807

Tommaso Merciai (7):
  media: ov5693: count num_supplies using array_size
  media: ov5693: add dvdd into ov5693_supply_names array
  media: ov5693: rename clk into xvclk
  media: ov5693: move hw cfg functions into ov5693_check_hwcfg
  media: ov5693: rename ov5693_check_hwcfg into ov5693_get_hwcfg
  media: ov5693: add ov5693_of_match, dts support
  media: dt-bindings: ov5693: document YAML binding

 .../bindings/media/i2c/ovti,ov5693.yaml       | 108 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/ov5693.c                    |  86 ++++++++------
 3 files changed, 161 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml

-- 
2.25.1

