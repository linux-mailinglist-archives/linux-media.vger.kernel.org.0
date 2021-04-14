Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33DC35ED06
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 08:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349157AbhDNGOp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 02:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349110AbhDNGO3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 02:14:29 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F9E8C061756;
        Tue, 13 Apr 2021 23:13:54 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso4921466pjg.2;
        Tue, 13 Apr 2021 23:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UXAwnWVl9FGK5e7NxTb7oKp8bz3pEFOyiNZQXN930zA=;
        b=V4QkjOheC7dts5+4UpWNzDlKBdjSFRD4zma0L5y3hgfERKigAEm4wO/Z+H0FK/4S/m
         A0SMN052Kedg+Ciqnp/ymjwwPF1Udl4kNyh2bwZpzB6RCm6Fg14h2+cwjOTfug68eTM/
         VTx2u5XALzMcQMOKwYTdFtDX0BCz9Drp/dmfroXiN0iOl7HbMdMB9Ur0T38YOunj5tCH
         OWXGjE2SpQzm6fY/j5m1pXcZj4vtcN8D8Jgur6hB81Yp/dFHPYalT6txnbYbv46Gsqun
         QMs7WiOAMNP0OaKOPGhmKTI19iE2Mdu3QE+nZEgBCmwE58boaoxFpZShk916061YghsK
         XVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UXAwnWVl9FGK5e7NxTb7oKp8bz3pEFOyiNZQXN930zA=;
        b=XIJ1OCPoPHHb/8Qc/hRvlcZefHJQD4zaVZAMVcatR2qnfyiRETvzilBrZx0fQ/IkUo
         3gaWpGhdsBSqnZxrX4zz19A6mLgA7Iq2mpC/vC2sncJx4UlGV1WwYXOMhyD7Gjr13y+n
         EnKKpj7LxMI7Lhf8BkGbJwY8ddthfsCoR8XUG8db8xOFeyvAztlUmQT/W2R7O5jm++Cm
         11EWakF4jfVb0UKgC2oB6eyw8cU7uXq+CEm/OHL9Spo3R3xUTQHV/sDMxprU0jb7Eq3/
         7bKFZVz0X7xSOKAdEETZQ5RqU8bLz5RTRDZHME7QLm10YHsXubRg1uwGPTKWf03jCysK
         JS7A==
X-Gm-Message-State: AOAM531flR+JgbHkwORtXkEpiFP/uPqM3g+wP4PwKqsCeC3ictTu+aBd
        u6B0efM3o4esPmW60c+ZEjw=
X-Google-Smtp-Source: ABdhPJy/iTG5Q/Z0DWceNV1USVKc4qBVBjAGqSRzh6Jf+PUYXqgXQflOfQTuArQzGT0UNS30SYt3QQ==
X-Received: by 2002:a17:90a:17ea:: with SMTP id q97mr1836880pja.71.1618380833855;
        Tue, 13 Apr 2021 23:13:53 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id d17sm13629071pfn.60.2021.04.13.23.13.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Apr 2021 23:13:53 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     robh+dt@kernel.org, shawnguo@kernel.org, krzk@kernel.org,
        linux@rempel-privat.de, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        prabhakar.csengg@gmail.com, mchehab@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v1 0/3] arm: imx: Add i.mx6q DaSheng COM-9XX SBC board support
Date:   Wed, 14 Apr 2021 14:13:44 +0800
Message-Id: <1618380827-16056-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

This patchset aims to add kernel support on DaSheng COM-8XX SBC board
optimize ov2659 driver to handle xvclk on/off at proper stage to save power

changes based on master branch, since commit id:
89698becf06d341a700913c3d89ce2a914af69a2

The DaSheng Com-9xx is and ARM based signle board computer (SBC)
featuring:
- i.MX6Q
- 2GiB LPDDR3 DRAM
- 8GiB eMMC 5.0 FLASH
- 4MiB SPI Flash
- USB 2.0 Host/Device
- Multiple multi-protocol RS232/RS485 Serial ports
- microSD socket
- 5V DC power input
- HDMI1.4a,1080p@60
- RGMIIx1 Gigabit Ethernet
- CSI0x1, connect with ov2659

dillon min (3):
  dt-bindings: arm: imx: Add i.mx6q DaSheng COM-9XX SBC board dts
    support
  arm: dts: imx: Add i.mx6q DaSheng COM-9XX SBC board support
  media: i2c: ov2659: Add clk_prepare_enable(), clk_disable_unprepare()
    to handle xvclk

 Documentation/devicetree/bindings/arm/fsl.yaml |   1 +
 arch/arm/boot/dts/Makefile                     |   1 +
 arch/arm/boot/dts/imx6q-ds.dts                 |  18 +
 arch/arm/boot/dts/imx6qdl-ds.dtsi              | 465 +++++++++++++++++++++++++
 drivers/media/i2c/ov2659.c                     |  24 +-
 5 files changed, 503 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6q-ds.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-ds.dtsi

-- 
2.7.4

