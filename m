Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 591BF467FB7
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 23:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383348AbhLCWQ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 17:16:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241447AbhLCWQ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 17:16:28 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2881EC061751
        for <linux-media@vger.kernel.org>; Fri,  3 Dec 2021 14:13:03 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id a9so8542227wrr.8
        for <linux-media@vger.kernel.org>; Fri, 03 Dec 2021 14:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TeaVVat+uqXQ9a2d42rwWaESeZknVMt1u7vcRb14yTA=;
        b=utJN1xVDTrixRELo/ED+ayOLJH6xtbwjNn53cW0GcHy+IqqYlHUvpBlg/GeY9ayiZi
         aC8rIIa6bKoFwDTQhr0o0WLHILIKRd9kMHMCTHoCZ4iItqndxWodr4tSvCczwHtaAdqN
         Ghkevcs+gktN5ZHeOemMLBfy3SErZG6Bo4RlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TeaVVat+uqXQ9a2d42rwWaESeZknVMt1u7vcRb14yTA=;
        b=zPMa4kFvx5wPN7I3rN0iOOKr879mMjX8lt0Kd6MajqgvgsdZci06kKEATgxnUuiTHj
         Avp8o48D+iD62I9w++xnv6r9TxA1J9OM035xDavABPzeJbA4Zrevvw2WlfX4akPkjYVv
         5tfORR4ELuhuNuS8OU3GY8EEU7C5I1CSkVZRPyEcFfV3NimYKqqVQPzXczl7qL5DOo97
         EsVL6Yn+Rgz7GWiIj5vEwoYGsMe/RhCx0SeZ6A6WRTYNgPv7WUeDrrmod8v61nW863PR
         NPFEIyqY4dE4DSNraGkrPxulOeiT7OjofBXzLYhk0NbzaXokm5Ab2seoVRZXySYL7zud
         BfSQ==
X-Gm-Message-State: AOAM531eH8oP8gyAS3QxQsWHIDlpgI2SiswDrRx+mpoqIH3HwU1yRcoV
        Cegw8yey4IuyQyimH2q3gkUIDKlukx8Yww==
X-Google-Smtp-Source: ABdhPJzyzpGAFgrt2yUMTsorFqX0BexlucMItVislU8X+Smf2u9G+h1D5X83OEf1dO2NmWPQEOhtZQ==
X-Received: by 2002:a05:6000:15c8:: with SMTP id y8mr3007303wry.305.1638569581554;
        Fri, 03 Dec 2021 14:13:01 -0800 (PST)
Received: from taos.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id f7sm7849710wmg.6.2021.12.03.14.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 14:13:01 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [RFC PATCH 0/5] omv6211 linux kernel driver
Date:   Sat,  4 Dec 2021 00:12:42 +0200
Message-Id: <20211203221247.46324-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds ovm6211 driver into the staging directory.  It also creates
media/i2c entry, where ovm6211.c lives for now, to mimic the generic media
source tree.

It is also marked as RFC because i expect some insonsistencies with V4L2.

Petko Manolov (5):
  adds ovm6211 driver to staging
  adds ovm6211 entry to Kconfig
  adds ovm6211 entry to Makefile
  adds drivers/staging/media/i2c/Kconfig entry
  adds i2c/ explicitly to Makefile

 drivers/staging/media/Kconfig       |    2 +
 drivers/staging/media/Makefile      |    1 +
 drivers/staging/media/i2c/Kconfig   |    9 +
 drivers/staging/media/i2c/Makefile  |    1 +
 drivers/staging/media/i2c/ovm6211.c | 1156 +++++++++++++++++++++++++++
 5 files changed, 1169 insertions(+)
 create mode 100644 drivers/staging/media/i2c/Kconfig
 create mode 100644 drivers/staging/media/i2c/Makefile
 create mode 100644 drivers/staging/media/i2c/ovm6211.c

-- 
2.30.2

