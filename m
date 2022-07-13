Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19A0D57399C
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 17:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236765AbiGMPFQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 11:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236756AbiGMPFM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 11:05:12 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4E741D3D
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 08:05:11 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id v16so15880125wrd.13
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 08:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iRLEgSOcMnD5VRR8cX+suFVDNUMCY/cUof/gMZBw2Zc=;
        b=U1CitEYugNvImZvTZkbjvZ/UNTsqIc++z2VQ4tSyw1wIsYLlYkZAjS6UyTseZ5RWHJ
         1uRT0qYzPong91R/txp1q3o8trUNlD36Mwi2TMSuE3fItL5qhoOPbv0Z/d6AJU5sBbah
         0X55bH7dUkeOL5CLvpXsHka7woqVewFiuXcWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iRLEgSOcMnD5VRR8cX+suFVDNUMCY/cUof/gMZBw2Zc=;
        b=wcMiUqcfaITakFTqnyH6NXnnTd4enwBrD/p/opBWMZ+6sjkjNxNTLV0X+zwGjztCU5
         oGzptsIELUn6MqYiXA9aL4G1iXlW2HZdDD460UkdkTQTH/hu8LwQlJNnnRmtpg0oKhqS
         CPpPLU69jxkbwttHFdKbNgqhgtPdg3VrNX3nJuofVnaxBeXh5mkYdM1aIhJcdl0+UmHy
         VRwM9S5P3VWXRratBlaVM0BxKoE3iS6vx+W+ubSJJM34NoQPaccg4BLCh2xeV2Kotd8T
         Xlr+psDRQWz1dGTOQaf7oe3eT2cvb70gOxQoamrFeB+qgZn22RWfGYmJFGYeZP6fP8dp
         pg0A==
X-Gm-Message-State: AJIora8Cwwt5eXp78CkXMvQGHhAMqrvHmQxajZT1b68QyGF6MYkU6ClY
        zfoNir55Hlfywr/zKzZeGmhQAQ==
X-Google-Smtp-Source: AGRyM1uiSyl+bGJ4usjfUCc61HYfpGYzfiXLS0/B1582Y9Cx0U2E3F/KZPL0FEDuLp3CGPNlfSv1pQ==
X-Received: by 2002:adf:ed41:0:b0:210:20a5:26c2 with SMTP id u1-20020adfed41000000b0021020a526c2mr3618173wro.603.1657724709557;
        Wed, 13 Jul 2022 08:05:09 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-51-7.cust.vodafonedsl.it. [188.217.51.7])
        by smtp.gmail.com with ESMTPSA id f17-20020a05600c4e9100b003a2d87aea57sm1465537wmq.10.2022.07.13.08.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 08:05:08 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     tommaso.merciai@amarulasolutions.com
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/6] media: ov5693: cleanup code and add dts support
Date:   Wed, 13 Jul 2022 17:05:00 +0200
Message-Id: <20220713150506.2085214-1-tommaso.merciai@amarulasolutions.com>
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
  media: ov5693: add support for acpi clock-frequency prop
  media: dt-bindings: ov5693: document YAML binding
  media: ov5693: add ov5693_of_match, dts support

 .../bindings/media/i2c/ovti,ov5693.yaml       | 124 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/ov5693.c                    |  57 +++++---
 3 files changed, 163 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml

-- 
2.25.1

