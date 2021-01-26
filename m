Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F9A304CCE
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 23:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730810AbhAZWz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:55:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388645AbhAZT1X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 14:27:23 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39309C0613D6
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 11:26:43 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id n7so7812933oic.11
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 11:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension-cc.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dv4lXzmt4h2upH0m750ZD4tfLxGnmwl8dB4kFxsaTlU=;
        b=00STeiLNgEWNoSgl80ZXLoqXic1S3TLlgbWYrUp2pfgPYPBIZufIwPI27ZWOJgywIg
         l8uOdZ8Jx0admluc3IBNx6+OysdsTYKsERD2PurUxwkT6jGje/Dutlx8CooQ8U9VTgYF
         U99JJuqOUgN01sfoB6Ggd9SdB4PpSpCvAUoNFx7McURwLgtMTbtVx5fdCOiEU8J1doM6
         oc3Pw+4ForKaRNE85JGnedpj8yPKgAzQ9UhQUdK0L2ooSPHCDoOF+pGqJrIN8A3mSG70
         eru4x774iYiUzYyImvAZLiqymCWTP932gGxSMpP9sx2R/YdSLRVnANp/PD1UGJz/Wg7f
         /vuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dv4lXzmt4h2upH0m750ZD4tfLxGnmwl8dB4kFxsaTlU=;
        b=m1UGEJnd5OJ4YnzNTG7L1ZQlHYTPyrKUj6dKxKYcRNOvEPchlbJ9e+JuQc5rAwrLkq
         TshiRB2kfsLIB/dkzRk2mX+4QokcRC87aFZllQ597D4fr4zl4Ty3Ztb2FxRx5o+3TYrJ
         z9JNNSmtBQO/+DMZ+/2V84/2048QV5HrVYr0Fcrt6DboSyZ7B5AJzE/vbRUPvtX905J6
         3uS8F6MKD1xraB69TW0rSTRbG2vOfthnQV7lAWQGKNe8TD4p/t6J2FX569/XrTiyXCDr
         IeicWAQS4hN0z8cAmRIyknYj0zu8BgC6IWkS1HbF1FysFYgWanF6CIdVQOppSrmRQMNi
         3MIA==
X-Gm-Message-State: AOAM531F0yA6LHqWLSb+ZIll2vfviQqYMKyLf9YWtYYsQWeXbi3y/LE3
        RXAGAs/yEYC2plcluPuuT+jJz+TW1AyUsrYh
X-Google-Smtp-Source: ABdhPJwZgAF/ALE9W0VIinpxh3Qx1br/MnoN+XBITssx7YkVxU3o3lncJwj2wRqmwJfg5xrYwl6NMw==
X-Received: by 2002:aca:3c57:: with SMTP id j84mr790992oia.41.1611689202393;
        Tue, 26 Jan 2021 11:26:42 -0800 (PST)
Received: from localhost (66-90-181-52.dyn.grandenetworks.net. [66.90.181.52])
        by smtp.gmail.com with ESMTPSA id p132sm4225750oia.41.2021.01.26.11.26.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jan 2021 11:26:42 -0800 (PST)
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org, sean@mess.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH 0/4] MaxLinear mxl692 demod-tuner / Hauppauge usb QuadHD
Date:   Mon, 25 Jan 2021 19:54:12 -0600
Message-Id: <20210126015416.5622-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200612183937.10952-1-3126054018@nextdimension.cc>
References: <20200612183937.10952-1-3126054018@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Bus 003 Device 004: ID 04e2:0404 Exar Corp.

The ATSC portion works fully, the QAM portion needs some TLC,
and is therefore not listed in the DVB capabilities.

The driver is based off vendor provided GPLv2 source code.

I have left the few long line warnings as is, due to recent
developments/statements regarding this topic. I do not feel
the driver would be made any clearer by arbitrarily
splitting up the remaining lines further.

All endianess issues have been sorted out. The driver is verified
fully working on a (ancient) powerpc Mac Mini running current
mainline kernel.


Brad Love (4):
  mxl692: MaxLinear 692 ATSC demod/tuner driver
  em28xx-core: Fix TS2 active led
  em28xx-core: Fix i2c error debug
  em28xx: Add support for Hauppauge USB QuadHD

 drivers/media/dvb-frontends/Kconfig       |    9 +
 drivers/media/dvb-frontends/Makefile      |    1 +
 drivers/media/dvb-frontends/mxl692.c      | 1378 +++++++++++++++++++++
 drivers/media/dvb-frontends/mxl692.h      |   38 +
 drivers/media/dvb-frontends/mxl692_defs.h |  548 ++++++++
 drivers/media/usb/em28xx/Kconfig          |    1 +
 drivers/media/usb/em28xx/em28xx-cards.c   |   46 +
 drivers/media/usb/em28xx/em28xx-core.c    |    4 +-
 drivers/media/usb/em28xx/em28xx-dvb.c     |   26 +
 drivers/media/usb/em28xx/em28xx-i2c.c     |    6 +-
 drivers/media/usb/em28xx/em28xx.h         |    1 +
 11 files changed, 2056 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/dvb-frontends/mxl692.c
 create mode 100644 drivers/media/dvb-frontends/mxl692.h
 create mode 100644 drivers/media/dvb-frontends/mxl692_defs.h

-- 
2.28.0

