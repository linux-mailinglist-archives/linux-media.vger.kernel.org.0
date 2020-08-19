Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5CAF24A58B
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 20:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgHSSFB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 14:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbgHSSE5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 14:04:57 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96720C061383
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:04:57 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id i10so6231790pgk.1
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kKcbDGsNXR/gUklWkntLlTLukPDw/mCQ/tOLvh4gtJ4=;
        b=Vmzz/Jtfk2Larct/OXM2pnmdcVgqLMnpREk70dA9TyIm/f662ExqccWAvE4DUqtkxO
         /s0gT7nsm5r4NnV5uSzed/Gt56BKj5QYl6Zm4xvVgBAluEeFTQArvf8i3Sq6qDmqSiyk
         Byn7r1F1RZ39UKGAsozjBnRv5rIa+1JUSpiDgattAQYK3LqG1WCcdWKuBCmdsES1GPN5
         ONBSaT6mm9czyXVttvVu5GQwdLir3b5FY2un8oQz95jR2A/qbNQT3z7bg8GuvZbdUlS2
         g2tA1bkXxbGC6IydU00lA5tx9U/1tDS8eSe35CBQwPQxaTxbYTerwaBmHv7cDSaRGlxe
         5joQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kKcbDGsNXR/gUklWkntLlTLukPDw/mCQ/tOLvh4gtJ4=;
        b=HOCyJab0gmzom7sgb8dvzpFa/NLMqnwM1VYE4EUB0zdsAigd0q3+e8+CGyvc9fAhER
         PG4aLFab+nkXP/PHRQ0GK33WByQASQJklAc6ZhOaCbwr1J0cwRZOasu/3CX1ZYdtvRTW
         uWgqd3O4bZolqJqlwzgp/U4C0Sb+LBm1W8mLlGGz1iN5nDcegoYuztg7/Eq0F5dD6Tgu
         wz5mXaf2sJftOaPk+wYX7FQVnQ+QsmgajsxxVVQc1XvM9RIHafkySe2a0oCqFaqzuvw/
         XmkoFR+Qkasjk5DaOMmXqJ4nf4SOwzrjaa0icabgq//eELJt1SxEJ7K5KliWcSslmnOC
         NQig==
X-Gm-Message-State: AOAM530pgBglwfwwkFgIFVSvquZN0tGS70nNL7xOPA4yW8L9xOQtYtTL
        jIppTN9eH/g9M2Pm6hSkKX8IAg==
X-Google-Smtp-Source: ABdhPJwVu6qVxIIVFgfKqWQWjA2uJZVuytQa+8PmCKDyu8yT7laq5ieXz5k4k76qnd5zlf9kiFNoAw==
X-Received: by 2002:a65:4148:: with SMTP id x8mr17294005pgp.245.1597860296649;
        Wed, 19 Aug 2020 11:04:56 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.179])
        by smtp.gmail.com with ESMTPSA id o15sm29967669pfu.167.2020.08.19.11.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 11:04:56 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v3 0/9] media: vimc: Multiple stream support in vimc
Date:   Wed, 19 Aug 2020 23:34:33 +0530
Message-Id: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds supoort for two (or more) capture devices to be 
connected to the same sensors and run simultaneously.

Changes since v2:
	- This series introduces new patches, namely patch 1, 2, 4, 5,
	  7, and 9 to shift multiple captures to operate at a single
	  thread.

Kaaira Gupta (7):
  media: vimc: Move get_source_entity to vimc-common
  media: vimc: Add get_frame callback
  media: vimc: Separate starting stream from pipeline initialisation
  media: vimc: Separate closing of stream and thread
  media: vimc: Dynamically allocate stream struct
  media: vimc: Join pipeline if one already exists
  media: vimc: Run multiple captures on same thread

Niklas Söderlund (2):
  media: vimc: Add usage count to subdevices
  media: vimc: Serialize vimc_streamer_s_stream()

 .../media/test-drivers/vimc/vimc-capture.c    |  42 +++-
 drivers/media/test-drivers/vimc/vimc-common.c |  14 ++
 drivers/media/test-drivers/vimc/vimc-common.h |  21 +-
 .../media/test-drivers/vimc/vimc-debayer.c    |  26 ++-
 drivers/media/test-drivers/vimc/vimc-scaler.c |  25 +-
 drivers/media/test-drivers/vimc/vimc-sensor.c |  17 +-
 .../media/test-drivers/vimc/vimc-streamer.c   | 213 ++++++++++++------
 .../media/test-drivers/vimc/vimc-streamer.h   |   2 +
 8 files changed, 271 insertions(+), 89 deletions(-)

-- 
2.17.1

