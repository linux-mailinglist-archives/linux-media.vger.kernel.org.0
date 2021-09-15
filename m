Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E02240BD59
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 03:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbhIOBv7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 21:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbhIOBv6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 21:51:58 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A494C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 18:50:40 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id j17-20020a05600c1c1100b002e754875260so846638wms.4
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 18:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnzgP/qqicRIPZKqRt4/Yh4sXYnq0DWhZShP0b5lRgM=;
        b=qGWTMPesKciL+0EJnHbbQ39wpphg3YkpdaXhGnwwJ71iYesWBDPyaF5b4oW6+P0EGC
         MAjPWXtomc23Hb65Yw34YuDo+qG9UNFd4ES426Oy6zyNXGa5eUNtUG1h/p3aF9Za3eCJ
         UEuMMW79nCoQz5Q/q9fHyzz7KDcBEPeIzn8mRRUUQjElRzTK4GmGWHM7i86BPps3luXr
         jhpwQ7hNhvzKnmyqR/RHsW7fldykcmjayJPFEaFoBKkAIOnVVzDU49S1MA9IF89co2iG
         4LgimIa3bhuYzESTzUBnPRP7X6ReAY2I0gamupy3l5DW5yFeFlkwLed3clJoiD3ntIUD
         i07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnzgP/qqicRIPZKqRt4/Yh4sXYnq0DWhZShP0b5lRgM=;
        b=TcKsoOtPFgqgeTrvC0xhl0m3H+m0P/4D87uS3gbLB9GAIGqhVGsme83QcBMggPXpr+
         08c+wM+uDrWAFdzFRN46v/rN45iCZD/ojFrszP4DUFFsxhwOB8NDRh9Nq/NE2R/r7cgx
         pnQDD9esre/1rhgVk1efNaYTi3wsMgJVHJghRi9Ztg4kcPPLa2SKvlbWjjJ5yqJs5c6A
         3AziIxPRqw1n1bu4LzryakRNe5cR1QgrCVOjaMPfSiETubaLPFufVNgHJTkJQInPb3o+
         6eThauC1K/o+YUQie8MIGVirg14u2Fox39nH01iJbik7uzS0vlUNTWt+75wqOTQr7Get
         DWbw==
X-Gm-Message-State: AOAM533VxAQhWXzM27rz+gPPG0PJJ80WbCVmJqobZjymjlX04wTP6ilK
        Mk2ICkLM5GYo06WHWv8P073Wzg==
X-Google-Smtp-Source: ABdhPJzmthYhyrsatvMJ0KfmOl3k7yncZgLrZW6fx/cyUF1nWKmXQQRrE6/PEjN3Y/2/xdS6TXM5zw==
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr1827293wmj.169.1631670639067;
        Tue, 14 Sep 2021 18:50:39 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id k17sm3486863wmj.0.2021.09.14.18.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 18:50:38 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] rcar-csi2: Serialize format cfg and improve mutex handling
Date:   Wed, 15 Sep 2021 03:50:11 +0200
Message-Id: <20210915015013.3169934-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans,

This series improves the mutex handling of the R-Car CSI-2 driver. While
working with other drivers it have surfaced that drivers are responsible
to serialize format configuration.

Patch 1/2 adds a bit of housekeeping to the mutex used in the driver
while patch 2/2 adds the format serialization.

The series is based on the latest media-tree and tested on M3-N and H3
ES2.0 without any regressions found.

Niklas Söderlund (2):
  media: rcar-csi2: Cleanup mutex on remove and fail
  media: rcar-csi2: Serialize access to set_fmt and get_fmt

 drivers/media/platform/rcar-vin/rcar-csi2.c | 25 +++++++++++++++------
 1 file changed, 18 insertions(+), 7 deletions(-)

-- 
2.33.0

