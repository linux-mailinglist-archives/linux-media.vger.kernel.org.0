Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 914883EC6C1
	for <lists+linux-media@lfdr.de>; Sun, 15 Aug 2021 04:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbhHOCuO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Aug 2021 22:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbhHOCuO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Aug 2021 22:50:14 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4CB0C061764
        for <linux-media@vger.kernel.org>; Sat, 14 Aug 2021 19:49:44 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id r6so18637512wrt.4
        for <linux-media@vger.kernel.org>; Sat, 14 Aug 2021 19:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ChIbjxPC/3cMynWSf7mvKQOps95HwYUJwOFzuOj4DI=;
        b=O0WtdZXzwKh3+1sHDaKVnzN6oIAE5Lqx0/h2SMV/XCxoFzP4wKTu9VLjM48cXEEriv
         6OVyDean67NXOJTx/Ie2R2v8SjWqhlSymmpZr39IUtDhWd2aUjf8XNVkrTh8fEacvHZA
         2fVWSh38HGAYDhPI0eeDOqAF8aJ+2Bg8X9GRSPn1s/Jm9Z0jX3gFKDR8zF+rKjQ4a4Jo
         pE1DVDHGEX4RktvjWmDqlq9FghdBDUDeh2u0KNer0I0FelnmNqW3KQfAnnD9B8y4l4kG
         Qs9EvEYaoVyUJRaV+47qFYdHDlGCwVLE3Ssbk/55OQiIq23SI4jTibaE/Tnhz/CASrnC
         RKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ChIbjxPC/3cMynWSf7mvKQOps95HwYUJwOFzuOj4DI=;
        b=ojTwXPMNKzVDA6SMKsKWKg9OLXtrbdq/U4QbcKnOoud09ukHVh8cYQn98vsrpemqxO
         FKn4SfdaGnIGmEk7K31m9IRyAZyWB4dFaDufnHCb2wNfS3GUrmBn9Z146w/XPC8IlZdF
         rpE45Zd7bz2//umi38RkkyH57LjPfAlErWqoU2wHeacybmH1N8eewXh9IoAp6lLoHHYo
         7q4C5kQe9rWxZOWodlUl+eHit2FQIgWFQ7c7EiqdYDFL0lSYPH8J3gu9cJ7Ydzi7Zzl8
         fYQmAiyLXVfL2uK2YBGbSHayI86r08r6cIHmg2iJt9Xq2zV3ldJQzlsDOs02iaWFKEAK
         VOHw==
X-Gm-Message-State: AOAM532YDbJrhjo45tOeeUn6V7KlER1GzlBVA4DSSDt4GKTSAzidY9ZX
        dHHI9QDINsffzPDYYKAdLNJtVw==
X-Google-Smtp-Source: ABdhPJyqjCVOlRlhVSd1rLnh5SyLGI8AgdsMhIV5kMB6qIFDHyAlpHRmiBgJCaKT81Au5sHlehQkyQ==
X-Received: by 2002:a5d:508d:: with SMTP id a13mr10883227wrt.172.1628995782912;
        Sat, 14 Aug 2021 19:49:42 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id h9sm5866342wmb.35.2021.08.14.19.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Aug 2021 19:49:42 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] rcar-csi2: Serialize format cfg and improve mutex handling
Date:   Sun, 15 Aug 2021 04:49:13 +0200
Message-Id: <20210815024915.1183417-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
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
2.32.0

