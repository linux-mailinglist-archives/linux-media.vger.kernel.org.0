Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F45F1F7D01
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 20:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgFLSjx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 14:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgFLSjw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 14:39:52 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9A8C03E96F
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:39:52 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id 25so9547771oiy.13
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension-cc.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9NhezEOlYZOE4xrAF7aFVWPoiw7SuxoGGuk6rNqxZAs=;
        b=CctSf85VfYtFEeeiegDM7S+1L9WRlBUI4moIQhxugF6TSmKuwt4GoyD1R4SRTWZfH3
         HD5Q/gWUYpNR5sFOdRTuiZHHIkmctC3qitad4N6OxEQNuyuFqtPHKqQV5eJbP5ldHL9A
         /lmz+AkUTfg1Q+5XXCIafUID51ggAuotGEh14mnt2C4am8Uj7nqfry+GSC99+lvkup9+
         R7yxL6HzDXLZMTZAPKawJTnLbxu6cj6kXawkEfL0UsPVXda/vWwmZZwX81j2EY8h/qHy
         7z+uiZqYyUacpFTV6tZcldCof6n94cd5IKQdAU8woJKWZm4DzYH3uu4ltTyxXPAnq/OL
         otEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9NhezEOlYZOE4xrAF7aFVWPoiw7SuxoGGuk6rNqxZAs=;
        b=sztBt42It+xUvqD3E3KC2qIE8yQs9MYUIwA5Hb5HfgbFkTRLGn34rBMHIFCV/sL9nd
         KW1ew1DjXFkGI/Kvsies7batM/IMI/aRPcrFdjhMbc5YrXZVRFR3ome1QluuyMGY/hZS
         MrrCeA2iaidPaOwq9TYo1LVHxEtScDq3IMmaJ1qEKhEFf45PoDzLCoixtC/bQebpsVDY
         gGOuJf0maetSDVCBNnpAk4CV46uvm/pjD+FLPGoziAYwtTk89DvQ5XkU513035KgZAlI
         h66/Z6bSX1dT5Kjbrcmo8zI4kJwQI6GnZZqqknkQj/6febrjmTWe8r9SmR/zBvMlkOal
         qlyQ==
X-Gm-Message-State: AOAM530i+e0ca/+2bsolQEyyYq/p1x/k/1oUcHmjaq9scoC4J8NoWKog
        4mkPG4m7JNQmFMsA80/P3BA2oECv6uIpSA==
X-Google-Smtp-Source: ABdhPJx1+SfhN4H/RMnuoZikRKzjFLRBSh1F8ks7F86KM6fokawkyYaVxCt6T1R+9UKEbssZPI007A==
X-Received: by 2002:aca:b9c3:: with SMTP id j186mr255324oif.2.1591987191938;
        Fri, 12 Jun 2020 11:39:51 -0700 (PDT)
Received: from localhost (66-90-181-52.dyn.grandenetworks.net. [66.90.181.52])
        by smtp.gmail.com with ESMTPSA id k14sm1494196oof.48.2020.06.12.11.39.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jun 2020 11:39:51 -0700 (PDT)
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH 0/3] MaxLinear mxl692 demod-tuner / Hauppauge usb QuadHD
Date:   Fri, 12 Jun 2020 13:39:34 -0500
Message-Id: <20200612183937.10952-1-3126054018@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Attached is a new driver for MaxLinear mxl692 ATSC/QAM combo
tuner-demodulator. The driver is used by em28xx based
Hauppauge USB QuadHD.

The Hauppauge USB QuadHD contains four instances of the mxl692,
configured as two "dual tuner" em28xx devices.

Bus 003 Device 006: ID 2040:846d Hauppauge
Bus 003 Device 005: ID 2040:846d Hauppauge

The ATSC portion works fully, the QAM portion needs some TLC,
and is therefore not listed in the DVB capabilities.

The driver is based off vendor provided GPLv2 source code.

Note: there are a number of LONG_LINE warnings. I have left them
as is, due to recent developments/statements regarding this topic.
I do not feel the driver would be made any clearer by arbitrarily
splitting up the remaining lines further.


This is just a v1, if there's any comments/questions/concerns
let me know and I'll sort them out.



Brad Love (3):
  mxl692: MaxLinear 692 ATSC demod-tuner driver
  em28xx-core: Fix TS2 active led
  em28xx: Add support for Hauppauge USB QuadHD

 drivers/media/dvb-frontends/Kconfig       |    9 +
 drivers/media/dvb-frontends/Makefile      |    1 +
 drivers/media/dvb-frontends/mxl692.c      | 1363 +++++++++++++++++++++
 drivers/media/dvb-frontends/mxl692.h      |   38 +
 drivers/media/dvb-frontends/mxl692_defs.h |  493 ++++++++
 drivers/media/usb/em28xx/Kconfig          |    1 +
 drivers/media/usb/em28xx/em28xx-cards.c   |   46 +
 drivers/media/usb/em28xx/em28xx-core.c    |    4 +-
 drivers/media/usb/em28xx/em28xx-dvb.c     |   26 +
 drivers/media/usb/em28xx/em28xx.h         |    1 +
 10 files changed, 1981 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/dvb-frontends/mxl692.c
 create mode 100644 drivers/media/dvb-frontends/mxl692.h
 create mode 100644 drivers/media/dvb-frontends/mxl692_defs.h

-- 
2.23.0

