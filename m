Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6E40561BCC
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 15:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235446AbiF3Ntq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 09:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235441AbiF3NtI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 09:49:08 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E2531392
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 06:48:41 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id z19so26594038edb.11
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 06:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1bQ5xBUeicswiCyCgoWOXSzl8HXEc/zsS/C+nRnRHLw=;
        b=FYPKAXuSoTr/pMKp4RvhWnyGlLtp90twSuBp/iBj4eIj3fVN9w+LsouFvEl1UVQ8vv
         71HKPlK/2jh+30LY04HOMHM0eihUXFrVc3ZszOxBIPyeqm1k8LXLQp8fe45E1eDFGTA7
         tNFBUd7M8UFxcYtw4iKqOyLz3Ts6dSUc3Ivkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1bQ5xBUeicswiCyCgoWOXSzl8HXEc/zsS/C+nRnRHLw=;
        b=gTUaePEnL+ar+Viod9z7t6T8iVXf99t58kyANDNRM7MrdMMxRAPkfrvAUgtYqVYLrQ
         A4hKBO63GhE0mQZxqmT50pDAXhuYxoYw+Eis7jiSSV0fou+V89W9CGJGd4wlfLxFfY8f
         /w84g5oW1DdWjD6S5KozDaty4UzeXhhXBMuSIQXV8Tp6yU8YdBc8FHPukLsnQkXTQ8dR
         9aGHd7i72AdMe21xASsBj5P9tC8lj2FmDrF6jqlP/V/mUfijIaV1TA1QU5lIdOBMsGgj
         zy6a1gisOAsgSoCuexDXP/5+Y2oIG3kUdsWWflJkEEDhHK0cYGjnuSjqHIMF2GkxdcVr
         xDAw==
X-Gm-Message-State: AJIora+bTrEFh5vMkZ4yyCHaLlBuDYDARNc1m7tf7YBPf05NnNtYlpIN
        ZOKZpUv4vtLQbQBzaV3SW4S7IQ==
X-Google-Smtp-Source: AGRyM1upBLoVyqghPmQtiro4gzAKQ/URWaCeD52UiF/wQJ0HVewQwXPKMd3EhTbaqcWGHlvX1Ctijg==
X-Received: by 2002:a05:6402:2051:b0:435:71b5:b627 with SMTP id bc17-20020a056402205100b0043571b5b627mr12005536edb.267.1656596919851;
        Thu, 30 Jun 2022 06:48:39 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id k5-20020a1709067ac500b006fee526ed72sm9130288ejo.217.2022.06.30.06.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 06:48:39 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     tommaso.merciai@amarulasolutions.com
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/6] media: ov5693: cleanup code and add dts support
Date:   Thu, 30 Jun 2022 15:48:29 +0200
Message-Id: <20220630134835.592521-1-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,
This series cleanup code on ov5693 driver and bring up dts support, also add
documentation for ov5693 camera sensor

Inspired by recently Quentin series:

 - https://patchwork.kernel.org/project/linux-media/list/?series=64807

Tommaso Merciai (6):
  media: ov5693: count num_supplies using array_size
  media: ov5693: add dvdd into ov5693_supply_names array
  media: ov5693: rename clk into xvclk
  media: ov5693: move hw cfg functions into ov5693_hwcfg
  media: dt-bindings: ov5693: document YAML binding
  media: ov5693: add ov5693_of_match, dts support

 .../bindings/media/i2c/ovti,ov5693.yaml       | 106 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/ov5693.c                    |  86 ++++++++------
 3 files changed, 159 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml

-- 
2.25.1

