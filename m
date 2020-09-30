Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B63BC27E7E9
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 13:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgI3Lxd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 07:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgI3Lxd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 07:53:33 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E591C0613D0
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 04:53:33 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j2so1459291wrx.7
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 04:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3zdVvKUiJ3XeC/vkqQQH/4KWS4wblWtvBCpqUTc2vCY=;
        b=TCiL/Ow2l394SQAIf9E+NXOjWbI+WiUZG7czSxAutmvCNiJtnVGmyAKFcrIxA3P6TG
         iem9fGPWkXCjpFIzTsrLgfR626HY6Dh7O/ew2TTQLIy2ZNIHCeNp9b7Wl+HJk1EWv1Gj
         vqmTiip3ypcHhHa8hHcZCjbold9Ay6FWuC+t710keQKAnwnO7wWEs1lWQMUfMxNLsT/Z
         4mqvNWl0iEMvmKTsL/IRlRGh3Vl5KqJVxNjhMsOf2+m8p6v6ks5w4zXOyQaTezHxih6U
         Tgca1XosUIDPyHpReL6b1b1BJyH95NW2xkoyok6wGBC3xiSwPzTDPZH8AQSERNh9bCe2
         Gj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3zdVvKUiJ3XeC/vkqQQH/4KWS4wblWtvBCpqUTc2vCY=;
        b=VZBrEGGSDWJMXMVKBpsdJ+Cr3qXpDS0os4d6nu67YFAjM/ns0ZQoUovrfI+dbD4/zH
         KYITq1g1To+DJUBtY2+kvl4aE7ku2gLVIK98YhnpC3pxkcfsldi90XASc1oAP/MzxbAS
         vuZxVA/kyrAijIr2V4fueAPYl4ewpg0eZZ0d7w/iCljGzl/eJFWXxeKffnJDGCUqIMOM
         Engfx/oFsTo9ZCj/IPJfJTUOJpLBmmr8C4ep5zZrgLFNRpE9yBh+albrbHajM17krTGc
         nzLDet4beknqtUe6VCYMGGwtaQbIiGZeet2KSDL7+k6gpDY0UhV5zm6uxEF3/OJV11P6
         igpA==
X-Gm-Message-State: AOAM533RnVgaFzU7sCo2Ne0Fsy6AvvmVBYab1gkdpKNbavSurOVtOVMQ
        1/psTgAWq89gy9GY1dhJSgmMPA==
X-Google-Smtp-Source: ABdhPJynAyzrltVOO76tuR2J6MDfUIbi/vTOpYZLQJ7fsMqXMDV/uBFWBXb2toRs7bpZsX3qQln9GA==
X-Received: by 2002:a5d:554c:: with SMTP id g12mr2743183wrw.294.1601466811718;
        Wed, 30 Sep 2020 04:53:31 -0700 (PDT)
Received: from alex-xps13.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s12sm2222353wmd.20.2020.09.30.04.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 04:53:30 -0700 (PDT)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        jstephan@baylibre.com, stephane.leprovost@mediatek.com,
        gpain@baylibre.com, mturquette@baylibre.com,
        Alexandre Bailon <abailon@baylibre.com>
Subject: [RFC PATCH 0/4] Add a RPMsg driver to support AI Processing Unit (APU)
Date:   Wed, 30 Sep 2020 13:53:46 +0200
Message-Id: <20200930115350.5272-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds a RPMsg driver that implements communication between the CPU and an
APU.
This uses VirtIO buffer to exchange messages but for sharing data, this uses
a dmabuf, mapped to be shared between CPU (userspace) and APU.
The driver is relatively generic, and should work with any SoC implementing
hardware accelerator for AI if they use support remoteproc and VirtIO.

For the people interested by the firmware or userspace library,
the sources are available here:
https://github.com/BayLibre/open-amp/tree/v2020.01-mtk/apps/examples/apu

Alexandre Bailon (3):
  Add a RPMSG driver for the APU in the mt8183
  rpmsg: apu_rpmsg: update the way to store IOMMU mapping
  rpmsg: apu_rpmsg: Add an IOCTL to request IOMMU mapping

Julien STEPHAN (1):
  rpmsg: apu_rpmsg: Add support for async apu request

 drivers/rpmsg/Kconfig          |   9 +
 drivers/rpmsg/Makefile         |   1 +
 drivers/rpmsg/apu_rpmsg.c      | 752 +++++++++++++++++++++++++++++++++
 drivers/rpmsg/apu_rpmsg.h      |  52 +++
 include/uapi/linux/apu_rpmsg.h |  47 +++
 5 files changed, 861 insertions(+)
 create mode 100644 drivers/rpmsg/apu_rpmsg.c
 create mode 100644 drivers/rpmsg/apu_rpmsg.h
 create mode 100644 include/uapi/linux/apu_rpmsg.h

-- 
2.26.2

