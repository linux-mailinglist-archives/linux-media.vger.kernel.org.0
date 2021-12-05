Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A91468A35
	for <lists+linux-media@lfdr.de>; Sun,  5 Dec 2021 09:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232654AbhLEJB4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Dec 2021 04:01:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhLEJBz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Dec 2021 04:01:55 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E836EC061751
        for <linux-media@vger.kernel.org>; Sun,  5 Dec 2021 00:58:28 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id y12so29884823eda.12
        for <linux-media@vger.kernel.org>; Sun, 05 Dec 2021 00:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vviFp8R+mKvvJ3Tpeo+BaEAA5ijg2S7egf2A2msWf3s=;
        b=nhEfxdbhi8NpeOzmmgXrGBY4ynzWeGgEBKxE7fwDMw/5kup1zdo5nULqF69nSxlA82
         dASMTrO4YWnbH59EoP6/nbrIGn91u+hZlP1OJuI1yBUGQ6wHo1evlqTLs/7WWMxlHD7k
         y4Hvsd3oMuEY3iFjIAbQPJ/9BQHfLml2KUchY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vviFp8R+mKvvJ3Tpeo+BaEAA5ijg2S7egf2A2msWf3s=;
        b=8Ow4+vXjZTHKhUMBzIgOIDbR8k7ONGb6SI3ejxc1n3wuxLjtM9mZztHr/bhJS5zLTN
         psy/ebbEwDsR3tURPnE8vQVMMuKiD7ZBfLFFDYsmdf2SSp7i7gch4obEg8qwlRnDNxeI
         dBMunvFGShG3O0TVtoYYzjNf/CORNFIAsCBRnVp1C//OlA4zaxJhMIBOYl4W2I5EYKDr
         pYR2QIe9lSd2HBBXkHWULYSjQuw+uAhhnRC61vT5BSE7efL6qs4MbjcgXozTyMKYvH0h
         XqUVjVcSayEADB5z6OnQy/rcQtFOUfCLDv88M5ggHn6SSatGqa5EOjRZ83h29Cly036t
         MjNQ==
X-Gm-Message-State: AOAM5314Jgkuiy/IRmP25Pn/PiPbOYexxksPtAptgS0rVXZmhYhTwqlY
        f/IlzeVI7i4yD40HEOgXN2ZfVcpsjGmr/w==
X-Google-Smtp-Source: ABdhPJwcBhZVL1MzHacFNWtlZ48XLXgqIdpWJJPcwPtT7XiQPNPHJp8j8ssbE022rp3br1fMPybY6w==
X-Received: by 2002:a05:6402:35c5:: with SMTP id z5mr44957524edc.166.1638694707416;
        Sun, 05 Dec 2021 00:58:27 -0800 (PST)
Received: from taos.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id r13sm5355478edo.71.2021.12.05.00.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 00:58:27 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [RFC PATCH v1 0/5] adds ovm6211 driver to staging
Date:   Sun,  5 Dec 2021 10:58:22 +0200
Message-Id: <20211205085822.5135-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v1: Removes an unused function (ovm6211_set_pix_clk) and this patch series is
now based on media/master;

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
 drivers/staging/media/i2c/ovm6211.c | 1143 +++++++++++++++++++++++++++
 5 files changed, 1156 insertions(+)
 create mode 100644 drivers/staging/media/i2c/Kconfig
 create mode 100644 drivers/staging/media/i2c/Makefile
 create mode 100644 drivers/staging/media/i2c/ovm6211.c


base-commit: 1f1517fafda598839a02e39968c5063ddcfa51fc
-- 
2.30.2

