Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAB6642675B
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 12:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239298AbhJHKID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 06:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238321AbhJHKIC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 06:08:02 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02D4C061570
        for <linux-media@vger.kernel.org>; Fri,  8 Oct 2021 03:06:07 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id ls14-20020a17090b350e00b001a00e2251c8so7397490pjb.4
        for <linux-media@vger.kernel.org>; Fri, 08 Oct 2021 03:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OzoTpc5FXnHcSloTlGi/7AXCgf7dBEC1jkxAe77KXeE=;
        b=LpauymSNX9w1tBNgyes0/5NF8kSaIGg2a8v9QUXm3LfmX6BZi2lrszHYLztN3+N9IQ
         Y6qkh4YrIAzDiF4g9Tr8AKSLLK/UP94QF5qqqZWmTKRwS60+cdl4GdvAzoWSNlScmDbg
         gK9gsL5va9SYEExcIy1UcpTF84Ay4Kx0pzZrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OzoTpc5FXnHcSloTlGi/7AXCgf7dBEC1jkxAe77KXeE=;
        b=KoouNVJNYwhiaAt3WWxOk5KYwAApnsispA/wiIidiHcZGi+RVyXgCVyE6g7IBErzWo
         M2rAficyQItxkBK0bLynTStGhc2yrignj2p5tVa7GldX+/me3AzR+KKaAfzPnzK0lX0n
         ec9OlQO2RcD212VHMbQnFErZA8hYPgb6MJkk4t7THCkjRM2C8zaE06kb2Rb0xKJc3E2v
         KIXxSsxdEsNxGHwU8MNweXq7VYD/hDoA+j5FmU24KZLLuipVKwqRxVWaV2eEy1CL3bYC
         zR7O6nHf/aapx+EG4dcbdULJ/Y8GD8u70HG3YYMWzwNESK+MqEiwR1qIcg03zkJ/T4Fo
         mFIA==
X-Gm-Message-State: AOAM531n9AxtZkWBvdTqtl5xAKSGU6xerjirCzzKV1Y0q+w9b89w20+D
        Z+8Ef6IrAdyNojrouqfUb6rtMA==
X-Google-Smtp-Source: ABdhPJzJVsYPcjlZMl4UGYSd/jIzybZRW4K3X481JHpKP8/MszRBdV0Jexrh0L7avTtIStwZrTWy8A==
X-Received: by 2002:a17:902:7ec8:b0:13b:9d7a:6396 with SMTP id p8-20020a1709027ec800b0013b9d7a6396mr8603898plb.86.1633687567030;
        Fri, 08 Oct 2021 03:06:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ad8d:f936:2048:d735])
        by smtp.gmail.com with ESMTPSA id a7sm2082255pfn.150.2021.10.08.03.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 03:06:06 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH 0/2] media: rkvdec: Align decoder behavior with Hantro and Cedrus
Date:   Fri,  8 Oct 2021 18:04:21 +0800
Message-Id: <20211008100423.739462-1-wenst@chromium.org>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

While working on the rkvdec H.264 decoder for ChromeOS, I noticed some
behavioral differences compared to Hantro and Cedrus:

1. The driver always overrides the sizeimage setting given by userspace
   for the output format. This results in insufficient buffer space when
   running the ChromeOS video_decode_accelerator_tests test program,
   likely due to a small initial resolution followed by dynamic
   resolution change.

2. Doesn't support dynamic resolution change.

This small series fixes both and aligns the behavior with the other two
stateless decoder drivers. This was tested on the downstream ChromeOS
5.10 kernel with ChromeOS. Also compiled tested on mainline but I don't
have any other RK3399 devices set up to test video stuff, so testing
would be very much appreciated.

Also, I'm not sure if user applications are required to check the value
of sizeimage upon S_FMT return. If the value is different or too small,
what can the application do besides fail? AFAICT it can't split the
data of one frame (or slice) between different buffers.

Andrzej, I believe the second patch would conflict with your VP9 series.


Regards
ChenYu

Chen-Yu Tsai (2):
  media: rkvdec: Do not override sizeimage for output format
  media: rkvdec: Support dynamic resolution changes

 drivers/staging/media/rkvdec/rkvdec-h264.c |  5 +--
 drivers/staging/media/rkvdec/rkvdec.c      | 40 +++++++++++-----------
 2 files changed, 23 insertions(+), 22 deletions(-)

-- 
2.33.0.882.g93a45727a2-goog

