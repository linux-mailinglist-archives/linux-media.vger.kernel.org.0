Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F48D3B985A
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 23:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234344AbhGAVya (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 17:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234275AbhGAVyZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 17:54:25 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D53BCC061762
        for <linux-media@vger.kernel.org>; Thu,  1 Jul 2021 14:51:53 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id e3so2054446ljo.6
        for <linux-media@vger.kernel.org>; Thu, 01 Jul 2021 14:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=phystech-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a3IX/2KuwHeMRcmciK0Z/zcjVGMIarf1/EXwo1sUcpU=;
        b=0/G8HqauhtiyYpibqNVecNYum5ecxe3IiMbygluzJPZOdzvWwW9vBN56yOOSDNv0eN
         7ENGMx4jiGbO4xReSZS8rQFd62bvkl9RS+/aAN8jqFo0vy/fi35Ry6WbULuIxxLHAY+1
         aLP1u8XhKEEcxhEN8mtj/XZZ25FVHLP/9IkcRf85IQY3R/3Zj4i/utnEz0/eMFfYMY8k
         IF8DEdriWA8EWU8TuOCSPwCZ4jRsNU/JqjmiUbhrtu29fcj+06N1DrVb1kV9Cv5jn4aO
         omaKfF4+mrdwJpaLeWs4OVyJ3Hl+rcMW/kO8wbBTVUzSLAcVW2A8d3yVId4ZN5uSOCN2
         waSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a3IX/2KuwHeMRcmciK0Z/zcjVGMIarf1/EXwo1sUcpU=;
        b=mo3ALg765ZbXRPN/sSI2Is7me1gdgCWquG/pSdZvm6saZSUCZLd2nRYcfKfZw2GFsu
         MfIfa1awEdQdIELOFUNYLzINRE5cVJ76Xg3hepZtAbqQurc2eGg0ZnLt7f6M3ljAVbyn
         Oku8VLi8VR9FrlJPNgYmOLPgg+LDhMU0hLFs7vp7S2N5d3/qpVa+CAALfCfaEFyKTFEl
         KJHfnXJDZjEfEbdfaV/d1NCfhSmnUBFmXV/dTbP2YAZnHojsLVdt6eK9bsyE3LD4/zTf
         8dH4/BKtRRe/Qp/9ZVfgBRqzDT4dAxesjN17v5peQOl4p7GbXNWiD9XD0SE/0PnMGmhk
         f36Q==
X-Gm-Message-State: AOAM530SF7lrlfcjKGibQJUMSBPknh7dO77jhXdGdPxORbTBMvdUapSn
        LpTamj4Ofu/AwTZcDpBu/gin5w==
X-Google-Smtp-Source: ABdhPJwFe3YY1ET2LKfFqWQ/0/xLKXQAv2E0/Kf2SXy1asZumMFcF3weWH7KiGXFHN5kVlXaSX2ieg==
X-Received: by 2002:a2e:bc26:: with SMTP id b38mr1230428ljf.345.1625176312222;
        Thu, 01 Jul 2021 14:51:52 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:4d3d:fdb7:f150:ee77:eba5])
        by smtp.gmail.com with ESMTPSA id q17sm138623ljp.3.2021.07.01.14.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 14:51:51 -0700 (PDT)
From:   Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To:     sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, narmstrong@baylibre.com
Cc:     jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com,
        Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH 0/2] media: rc: add support for Amlogic Meson IR blaster
Date:   Fri,  2 Jul 2021 00:51:30 +0300
Message-Id: <20210701215132.16317-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

this is a driver for the IR transmitter (also called IR blaster)
available in some Amlogic Meson SoCs.

Viktor Prutyanov (2):
  media: rc: meson-irblaster: document device tree bindings
  media: rc: introduce Meson IR blaster driver

 .../media/amlogic,meson-irblaster.yaml        |  63 +++
 drivers/media/rc/Kconfig                      |  10 +
 drivers/media/rc/Makefile                     |   1 +
 drivers/media/rc/meson-irblaster.c            | 433 ++++++++++++++++++
 4 files changed, 507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
 create mode 100644 drivers/media/rc/meson-irblaster.c

-- 
2.21.0

