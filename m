Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27A9F353519
	for <lists+linux-media@lfdr.de>; Sat,  3 Apr 2021 20:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236885AbhDCSJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Apr 2021 14:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236578AbhDCSJF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Apr 2021 14:09:05 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDEFAC0613E6;
        Sat,  3 Apr 2021 11:09:00 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id g8so11704249lfv.12;
        Sat, 03 Apr 2021 11:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=/DHc77qHzF47tIzabn/XC2E6zkbwQgwze0m6zhIGO0g=;
        b=TgArWY+LrUkDahwrOlfzPf1xYluBXZ9jZjo29rEJU2zde5ZhPVsCYLwv0sUuVy83B9
         2Lu0jZfrS1qKM/crA5xu8y4bBDvyxPxhRWqPRn0U8+RllfBK1zSXL0k/DS2t4s7UeFFL
         FYtCR0hG6s/UYqVrXsOK1myctGSnCCiXrozP0H32bIS4MgLmx5QETtnFr9J+hpTuAVjR
         O1cBXn/gr8lgFxIY1bATqyVTva/kVFfzctLeddRBaAZHpTOE+YJ2EDAAYB0QmF8SmCoa
         wztynjZOaJqRdOHAqce4Oh4IOp3qJtfz25PGwPwYqknvO5TEzoxU9XdQinKE8Zab722m
         ceLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=/DHc77qHzF47tIzabn/XC2E6zkbwQgwze0m6zhIGO0g=;
        b=jgUAqQFti5pT5Q3WAlThqq76cW7PxR9LL3diCivVg7m9dphXsoWMmj1/TxGRaasIs7
         QvfxgrYBPTM2VR5Y++6pd2sB6FHtoACHChD/w/7yvjpEyuwvH4RakZFm1TxDQI0Dj8QS
         m4jw578dv6u2Z5rvzzohAITAJC4Th58xU4VoMpkeiv4kqdV1AGl5ducpooK8RBCd492Y
         wQHmMUrO39tY6NVS2Z6j/qFu++ZQ3u/sYtJkeNxzZ9ciwuvRULzVSoPYLRbY8GWhm31O
         DmsoO03P5Lz0t0pbwY3JI64iS3lXROGpPSOj55m6y0BrCBH4R0uMjyZHkRMS9/3HdTTc
         bpSA==
X-Gm-Message-State: AOAM532ybgw35GIFh05G9HZdhI47U8FslZ2YVtIa/c9KVACwJhZM/3IG
        1Dfnfr1ZCCwvTt5oKEPT3WlA9HBGpA04F9qP
X-Google-Smtp-Source: ABdhPJyUKBSE506Agpa1pHJ2jcmU6rDw8dlvIeCJ6ybjHFzhs8Re4o1xtcRSKSVvbE0SP212eNZzdQ==
X-Received: by 2002:ac2:5312:: with SMTP id c18mr12411768lfh.618.1617473339502;
        Sat, 03 Apr 2021 11:08:59 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id v10sm1202850lfb.238.2021.04.03.11.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 11:08:59 -0700 (PDT)
Date:   Sun, 4 Apr 2021 00:08:57 +0600
From:   Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 0/7] staging: media: zoran: Eliminate camelcase
Message-ID: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset fixes 'avoid camelcase' warning by converting local variables to lowercase and separating words using '_'.
Renaming of each variable is implemented in separate patches.

Zhansaya Bagdauletkyzy (7):
  Rename 'HEnd' to 'h_end'
  Rename 'VEnd' to 'v_end'
  Rename 'DispMode' to 'disp_mode'
  Rename 'VidWinWid' to 'vid_win_wid'
  Rename 'VidWinHt' to 'vid_win_ht'
  Rename 'We' to 'we'
  Rename 'He' to 'he'

 drivers/staging/media/zoran/zoran_device.c | 48 +++++++++++-----------
 1 file changed, 24 insertions(+), 24 deletions(-)

-- 
2.25.1

