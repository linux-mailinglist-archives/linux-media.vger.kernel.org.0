Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3339255A48D
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 01:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbiFXXD2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 19:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiFXXD2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 19:03:28 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4248A51E54
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 16:03:27 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id u15so7497945ejc.10
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 16:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6cfkuZG7idfXo7IqBBshTVExV9f6nwYcsNi86Vc+VE8=;
        b=Jf1umRNAJXGAzvx2aJhV3LYpMPhv/cfl14mkSkn8vPCrmkBv73d/1y4FxzhU2iKUV+
         yjY1dRKmznA3df5MGwSaDALIRD4DIyoJ32nqJX70v9kIBUHzxFl1EqPXdDy4ZR3SLFii
         J7WoRYTVujZIbofiVaxjYVSe/PlXMPbIKrUzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6cfkuZG7idfXo7IqBBshTVExV9f6nwYcsNi86Vc+VE8=;
        b=6NWUKx2U/9r4G4qp3CnD4pLzCcoWcB76u4xT6fFxV5kznBqM493rWU6m6nlh5c8s+A
         GpqxWpIu3TSnKv31J+zvcF9LyRZVRAkb3v8XF/3L5p2vGphCH1GlACbxN/LXj//ENgNh
         eUXFmHlg/prA67MA+4F5BsqOg7u57/VIQoy5csln4bkgfZDhs6+reG+PHfJBkJBq31b7
         4n/NY3STFHBf5RFB84P1dVB/BgZigryzdXtXBDzPPCF0yyppsAIWw8COXBPVlAKjx3th
         qNDe09uQDzv3EJxuidovk4cEbxXLDur/aiwGcr/LaVDh4kdvX8q/9ovEZWXo8lGMfzFj
         CMVw==
X-Gm-Message-State: AJIora8qzbuHt299RTnN7eZ+rwSKzF8lVa7J4El/VMsZdYhPyUBfM94d
        GnT0b9aT+rJMPp6aXcqMHM98uQ==
X-Google-Smtp-Source: AGRyM1uiH+TA8mgLMRLqrxaoa3+Ka0nZye81F+GVBEctnrrpf+eLxawoxqVb0gaqMbAmVOudU1TWcw==
X-Received: by 2002:a17:907:6e8b:b0:726:2b16:d1b4 with SMTP id sh11-20020a1709076e8b00b007262b16d1b4mr1366379ejc.27.1656111805779;
        Fri, 24 Jun 2022 16:03:25 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id w1-20020aa7da41000000b004356a647d08sm2880291eds.94.2022.06.24.16.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 16:03:25 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] media: ov5693: cleanup code and add dts support
Date:   Sat, 25 Jun 2022 01:03:00 +0200
Message-Id: <20220624230307.3066530-1-tommaso.merciai@amarulasolutions.com>
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

 .../bindings/media/i2c/ovti,ov5693.yaml       | 123 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/ov5693.c                    |  86 +++++++-----
 3 files changed, 176 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml

-- 
2.25.1

