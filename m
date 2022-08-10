Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0357058E8DF
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 10:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbiHJIhW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 04:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbiHJIhV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 04:37:21 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529D82666
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 01:37:20 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id d65-20020a17090a6f4700b001f303a97b14so1420810pjk.1
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=+8Zc8rYa4ZxEs+Ek2Veiq0PdTVu1ampOcuivxciZFJ0=;
        b=4P/ZUbIZjm73r78BXFNP71nshS+JXMhpGurRsQ6u30PLvyV1/jSisEnt/wjw70iAKt
         dbh2AvaMkGOastO2TZ257O6ZVKxQWDR0KL5qIXa0Mx9LCRikzecreU8jOwNx+uM4neCb
         BpEyCCUL2HRor7KNQw1a3Nz/Wo/IG2uALiV+QuAgudl+/4gw9szJq4W0WMYtd9pZNEUM
         FzU9L1H0ONwYmZXIwHYOhU3vqV5WoQGf0klR64xK4iuiFGTS66Ydrwv1JPT3ojk8z41+
         xM51EvsgwdoJtAakJT1+9ueQ9RJl2T9JgoRafmqQIMP+PBz2OaDffRI8Ytka40vffp4B
         FBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=+8Zc8rYa4ZxEs+Ek2Veiq0PdTVu1ampOcuivxciZFJ0=;
        b=cRuuBusmaYv4lbaTmuP26Uk3sZG+ZeKfxBHhoO84jOPt9RlGNntt8lfCNI+MPF22dr
         MB/0IEfvEOeCVALOCfN2vFY0agMaTHMfHyzJejFkq31ZI4cZrgsGEA9QWQ0qCAH4RJbZ
         +r3MvTlXkgL4sqeKXPHq6oKHDRkc4kvoeI8O9XDrunvEnJBUFVMEs+Frw8D3VuVCnhta
         SnMw2N12hcjZGoZH1VTqpoqIP8Q/SC7ZcuqoNplJE4HKSFWroPCnsYeMF49+2XWCN3mQ
         S3D63uqyabReDXjgcXyOE2gEijw9tDhT5KLaHVcyWvtCa6jYXwUcA2Eo4pgTY3k730Ly
         tUpw==
X-Gm-Message-State: ACgBeo3pB0oYrdQ54zYskQW+7NfMr07klw0nKvdPIDEt2q0EnA86dNr4
        2YmliyLthpLxsYOcBolzSSZiSmBLYS53iw==
X-Google-Smtp-Source: AA6agR7L3QFrswCxE+ExkFevYhjKCaNMiyRwotJVapBpfZHxZ7APHHcKeHV4wMY7XBjhMm3S/Q8xBQ==
X-Received: by 2002:a17:902:f548:b0:16f:9649:be69 with SMTP id h8-20020a170902f54800b0016f9649be69mr21690874plf.134.1660120639828;
        Wed, 10 Aug 2022 01:37:19 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id f1-20020aa79681000000b0052d63fb109asm1323607pfk.20.2022.08.10.01.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 01:37:19 -0700 (PDT)
From:   Takanari Hayama <taki@igel.co.jp>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, mchehab@kernel.org,
        Takanari Hayama <taki@igel.co.jp>
Subject: [PATCH v2 0/3] Add DRM pixel blend mode support to R-Car DU
Date:   Wed, 10 Aug 2022 17:37:08 +0900
Message-Id: <20220810083711.219642-1-taki@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The series of patches adds support for DRM pixel blend mode to R-Car DU
driver. The current R-Car DU implicitly supports "Coverage" only.

Unfortunately, this changes the default blending mode of R-Car DU to
"Pre-multiplied" which is the default when pixel blend mode is
supported.

v2:
 vsp1:
 - Add a premult flag instead of blend mode enum
 rcar-du:
 - Support DRM_MODE_BLEND_PREMULTI via the premult flag
 - Support DRM_MODE_BLEND_PIXEL_NONE via format override [1]

[1] https://lore.kernel.org/linux-renesas-soc/20220704025231.3911138-1-taki@igel.co.jp/T/#m3351cb5965cd5bf2d416fa5ca5007773260205bd

Takanari Hayama (3):
  media: vsp1: add premultiplied alpha support
  drm: rcar-du: Add DRM_MODE_BLEND_PREMULTI support
  drm: rcar-du: Add DRM_MODE_BLEND_PIXEL_NONE support

 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         | 26 ++++++++++++++++++-
 .../media/platform/renesas/vsp1/vsp1_drm.c    |  2 ++
 include/media/vsp1.h                          |  2 ++
 3 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.25.1

