Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCA32A1868
	for <lists+linux-media@lfdr.de>; Sat, 31 Oct 2020 16:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbgJaPGC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Oct 2020 11:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgJaPGB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Oct 2020 11:06:01 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B217AC0617A6;
        Sat, 31 Oct 2020 08:06:01 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id a64so4308570qkc.5;
        Sat, 31 Oct 2020 08:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r3BCGj3C/4k9OjwTa/exoIeLVH3IWgVh4YgNa/s9o/w=;
        b=DjjxHoqMs3i8d7hTv0raGxsHvfU0if+6RQHN5j61MQRdpP74wWrmy89fthESuCFEdy
         bvDUYCZDagOerpYqIfdAY3GZqQtlvbwRA2lNSdlsPLyTgoIo+AXCWoj+1lDXt0Lf/nEq
         KaSns5ISpVZ/tDuuvv2J+JqMhvY+HDxtLXJRGrsIPYjmK5sVt5wJk8Q1FLhyYqt8YIX8
         D5yy77N4iXbLRbB6DttkbuvB3GYvzQNH13kdaKpBcAqKz0dPxD+Eh3DVt1lN5fLjBtnc
         M58ccxaPYPOKUHUsXlz7r+hYiKZNXpxwS6dlU02ZmlDouiGV4dDcGGTZCesW1ccGlHU+
         UrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r3BCGj3C/4k9OjwTa/exoIeLVH3IWgVh4YgNa/s9o/w=;
        b=e9wR2hjcJFwmVTAcRXve/8XeifrEKFOv6at3biQ7y12OpaWQBfln+OgkEvHsayKfN9
         PKUSYSGBL8avJ65rMEyMybpSvRyo5GtySTINbxGG+4Uu0OBHE8LE9YRc9p1ojPMRe71h
         23BQ++E+7ZyPjCgoacjLqTAU74P8NB0NaQfDAOiOkkAntIWzaXS5Ix4fy92QuLsZy0x0
         KcPze0C5koXZepe2ikMaqhEfesWtlDU3Hb2buror++OyatDmVvGyc8l0Y6BBoLYeTrPE
         jqM6P5M1eja3FbtQ3nTxl74GZhlONz/GeaGQG2c0kLDqzSOzLs51c4OHo1chqfFmhTVG
         YJ/w==
X-Gm-Message-State: AOAM530+4yF3l+RVD03AExjFGq1GA2MbiFYj1KXfXltrwGIxKL7BPE2D
        mrgqPttXJFos2vaMYl0is4tN6qm5udTMNg==
X-Google-Smtp-Source: ABdhPJyaTt9+4OWhS1aI3woLrkS9QdLAkRnDNYHBoLAw29rPafj+veutMJTHAddNZMp0U7PyLZIinw==
X-Received: by 2002:a37:aa49:: with SMTP id t70mr7254043qke.165.1604156760736;
        Sat, 31 Oct 2020 08:06:00 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id z125sm2317030qke.54.2020.10.31.08.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 08:06:00 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, r.verdejo@samsung.com,
        nicolas@ndufresne.ca
Cc:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] media: vidtv: Add support for more MPEG PSI tables
Date:   Sat, 31 Oct 2020 12:05:46 -0300
Message-Id: <20201031150552.663598-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Implement support for more MPEG PSI tables (i.e. NIT & EIT).

While we're at it, fix a few minor mistakes in the PSI generator.

I initially sent this without a cover letter and as WIP but I have
now tidied it up and it's spotless. I tested the driver on a kernel
with KASAN & Kmemleak and tested the output on DVBInspector.

Daniel W. S. Almeida (6):
  media: vidtv: extract the initial CRC value to into a #define
  media: vidtv: psi: add a Network Information Table (NIT)
  media: vidtv: psi: Implement an Event Information Table (EIT)
  media: vidtv: psi: extract descriptor chaining code into a helper
  media: vidtv: Move s302m specific fields into encoder context
  media: vidtv: psi: fix missing assignments in while loops

 .../driver-api/media/drivers/vidtv.rst        |   8 +-
 .../media/test-drivers/vidtv/vidtv_bridge.c   |   4 +
 .../media/test-drivers/vidtv/vidtv_channel.c  | 130 +++-
 .../media/test-drivers/vidtv/vidtv_channel.h  |   3 +
 .../media/test-drivers/vidtv/vidtv_encoder.h  |   3 -
 drivers/media/test-drivers/vidtv/vidtv_mux.c  |  29 +
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |  11 +
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 678 +++++++++++++++++-
 drivers/media/test-drivers/vidtv/vidtv_psi.h  | 240 ++++++-
 .../media/test-drivers/vidtv/vidtv_s302m.c    |  25 +-
 .../media/test-drivers/vidtv/vidtv_s302m.h    |   3 +
 11 files changed, 1083 insertions(+), 51 deletions(-)

-- 
2.29.2

