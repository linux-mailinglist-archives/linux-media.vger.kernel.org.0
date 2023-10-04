Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17BB7B7887
	for <lists+linux-media@lfdr.de>; Wed,  4 Oct 2023 09:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241376AbjJDHT7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Oct 2023 03:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjJDHT7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Oct 2023 03:19:59 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F96AC
        for <linux-media@vger.kernel.org>; Wed,  4 Oct 2023 00:19:55 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99c1c66876aso322872466b.2
        for <linux-media@vger.kernel.org>; Wed, 04 Oct 2023 00:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1696403994; x=1697008794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vDQoG5ysT8EDNxnOtjtwrzyiSEy0xvqDP37xVnx8+0I=;
        b=petNBZmJe0LvZEadkQ6j7b7cxj7dQIXmmYmhdtWcfd12Uy3dL2jwqh30O86TL5oEE1
         fqlsNPmi20rTtbYLlUxrRcxoqtBz15S1pH3ptTBcEZAgXV9a+iIR3pptd6/KE6gZn8/V
         7eKq3jvq6DAZCH3wQyPP5D9c/dPuEY2NsOZj8qOxuNd8u+GLtWTG+m+VYs1gog7j3ghA
         x+1IP8hQLBiPV3lYmCoz/oQx6RhnUu/23C5J6c2P173RsJsfjVN7AO06TnwdtYpVFub2
         Kx0EbN2ok3ER+6oBnOKLJbD0aaV/sfI1JkhCvZ5Utpuep8ro7qzLTsDbDSNkTSfsfWAp
         aBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696403994; x=1697008794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDQoG5ysT8EDNxnOtjtwrzyiSEy0xvqDP37xVnx8+0I=;
        b=rgyLviveSJIIUHTLRs6M2+xr1vJ5vTefIn5SUfkyoeIkyBNUaJbYfQperEn1+sZ1Id
         AHKayWxhlEPktBp3IYZaUqMGpcpXXXk6+gfYC0uujl8BpI7SCl3kALS9+LUfPjKzK7o6
         rxYtMBUNYR9wL8f7IeGCtr1nR1tQBW5pxou/n6DfU5+qEhi/XKGkchtoWl1WP0IoeoU6
         mQ/rX05K54N0npICvSPE1NJtgGzvAjxJx+xqzGwmqJTsYPJWj2rv2h9+sYi9OQW/Mkjm
         JNmIiI8TJsPV02vqbm1761eenCv5/0t6F3MLZvkxBJelCm3CWWOUnf8FIL8nu/7lFPmY
         Ej5w==
X-Gm-Message-State: AOJu0YyOEOPTgkkBB9zok0O1pB14cAPYYwqxSiGOsHuOfxdi/XolJtj8
        03jye0NSDsX5Sfs4dL/YlprrHyVsPQlcMwI58xK4NIlMppiCte5ZB0MPvxArTKYJsniXM6wd1GB
        8YqiAcPpvHHw1QgMVFqAwV9mIvsEBw3lZEjKpPMdeKXxKIhBR9jtoZVmMAGKIYvQANneG8XLw6R
        +Gqw==
X-Google-Smtp-Source: AGHT+IG2ZRIUTt96YLhXGElyvkDUYr9bPzO4uyFOod84PFk/Qr+XhxT0lqHsgt12EVGjJMPnDnxDPg==
X-Received: by 2002:a17:906:3094:b0:9b7:2a13:160c with SMTP id 20-20020a170906309400b009b72a13160cmr1191779ejv.69.1696403994223;
        Wed, 04 Oct 2023 00:19:54 -0700 (PDT)
Received: from melexis ([91.192.181.19])
        by smtp.gmail.com with ESMTPSA id d18-20020a50fb12000000b0053801ca9a09sm1953928edq.33.2023.10.04.00.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 00:19:54 -0700 (PDT)
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     <linux-media@vger.kernel.org>
Cc:     Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Volodymyr Kharuk <vkh@melexis.com>
Subject: [PATCH v5 0/8] media: i2c: mlx7502x ToF camera support
Date:   Wed,  4 Oct 2023 10:19:39 +0300
Message-Id: <cover.1696347109.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all,

This series adds support for the Melexis 75026 and 75027 Time of Flight
camera sensors, with DT bindings in patch 7/8 and a driver in patch 8/8.
In patches 1/8, 2/8 and 3/8, I've add ToF controls as separate
ToF control class. Also in patch 4/8 there is changes which allow to
modify range of control with array type.

v5:
- MHz to Hz for V4L2_CID_TOF_FREQ_MOD

v4:
- fix output mode
- forbid array for menu and warn if validate_new return an error
- add enums to custom control OUTPUT_MODE
- update doc
- minor fixes

v3:
- move FMOD, TINT, PHASE_SEQ to common V4L2 as ToF common controls
- FMOD and TINT became dynamic arrays
- remove PHASE_NUM, use dynamic_array for PHASE_SEQ,
  ctrl->new_elems pass number of phases
- remove leden-gpios, will be used gpio explicitly in library for now
- remade probe: use probe_new, no power on during probe
- remove autodetect and wildcard
- make all supplies to be required
- remove trigger ioctl, will add in separate patch series
- remove temperature ioctl, will add in separate patch series
- add documentation about custom ioctl
- style: 80 cols
- minor fixes device tree

v2:
- added external clock to the sensor
- added all regulators required by the sensor
- added posibility to choose sensor type in device tree
- added prefixes to all custom types in device tree and driver as well
- style fixes

Volodymyr Kharuk (8):
  media: uapi: ctrls: Add Time of Flight class controls
  media: v4l: ctrls: Fill V4L2_CID_TOF_CLASS controls
  media: Documentation: v4l: Add TOF class controls
  media: v4l: ctrls-api: Allow array update in __v4l2_ctrl_modify_range
  media: v4l: ctrls: Add user control base for mlx7502x
  media: uapi: Add mlx7502x header file
  media: dt-bindings: Add mlx7502x camera sensor
  media: i2c: Add driver for mlx7502x ToF sensor

 .../bindings/media/i2c/melexis,mlx7502x.yaml  |  126 ++
 .../userspace-api/media/drivers/index.rst     |    1 +
 .../userspace-api/media/drivers/mlx7502x.rst  |   28 +
 .../userspace-api/media/v4l/common.rst        |    1 +
 .../userspace-api/media/v4l/ext-ctrls-tof.rst |   56 +
 MAINTAINERS                                   |   11 +
 drivers/media/i2c/Kconfig                     |   13 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/mlx7502x.c                  | 1747 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |   25 +-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   20 +
 include/uapi/linux/mlx7502x.h                 |   28 +
 include/uapi/linux/v4l2-controls.h            |   14 +
 13 files changed, 2059 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/mlx7502x.rst
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
 create mode 100644 drivers/media/i2c/mlx7502x.c
 create mode 100644 include/uapi/linux/mlx7502x.h


base-commit: 2c1bae27df787c9535e48cc27bbd11c3c3e0a235
-- 
BR,
Volodymyr Kharuk

