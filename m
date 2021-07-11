Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8CE3C39AB
	for <lists+linux-media@lfdr.de>; Sun, 11 Jul 2021 02:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhGKAk2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Jul 2021 20:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbhGKAk2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Jul 2021 20:40:28 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97AEAC0613DD
        for <linux-media@vger.kernel.org>; Sat, 10 Jul 2021 17:37:41 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id v14so145620plg.9
        for <linux-media@vger.kernel.org>; Sat, 10 Jul 2021 17:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1S82jB2glc6MuXCSx+F6qcMcinaDMIJFtHSSuuKoZrw=;
        b=DyCR6QNCzeST6aFJs3AcbpWgpUe3OmQEJ4S8uC3MUsPl+1SkQtLEtlDsDrbEz5I9CX
         ZksRRxLemJdB2lorzvQI9akz4ORiqoofd0953qpAIKnKPmtjS5QH6/3jwBIX/JBbaF7a
         ih1LKFgVDmaXYhbDqMG+XEMuEsPrE2oGnFxyL9UUn3dIT8nUV261wyz1U3R1DNyVjxov
         r0JRV3/1BludQQvKDADwAX4WdjDvWUkFWTXWdC06R2w4D7+k7A+u62iMtLhB4FZtGI8y
         fTxCHNKdxJnxTc7Dold/ArL19tqLn9xpX2e6nZ8W1ptPm0XvFIj+J4SKymXYUk2Gz1gi
         dC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1S82jB2glc6MuXCSx+F6qcMcinaDMIJFtHSSuuKoZrw=;
        b=W1U7rJkx0HufmEzeF8JqTc3iRf2xhCrJ0NlUX5d2CuDp8mDi1VK1rE7l+OpNwb6L+r
         aOxMAbAVenunhooE9Lg4+r9q07rolbhzLbZmwFbiL28RgGUqNP/WEoJ2dEZyhl01UHcw
         PgHdAvQhT2Y5sGqeTZQy1slCd36MbzG4ZLvkQjDxMD1/RT/90aPAtqNTZCFfGoNTDX9K
         k3dOapjmIbpiDPAn4kaFvXHVqon3quLBxFleF0DnouaQckGk5csTPZz8bnJKB+N1QBNA
         b6moERcdRL+UPBWhD2brgSb1KexL1fpeJ/0Yh9DwVi3Y/TS0VC0E9cOf+ukF9uyE4CRn
         UXvA==
X-Gm-Message-State: AOAM531nszSHr9+VlIoYtoqREGNKtLhh9gpKzZ0ZIXSN/Eec7d68Y0g2
        1iYqV0fXdUjLNIAUrhJBqGNxdIYPwI650g==
X-Google-Smtp-Source: ABdhPJy+L6HOclNxxBjmQAMBjF+en9xAOPWh5ShgcFon4nyDWHTTwSrmOKR/1F73GTr3lmsg8zpu4A==
X-Received: by 2002:a17:90a:b110:: with SMTP id z16mr45574207pjq.170.1625963861106;
        Sat, 10 Jul 2021 17:37:41 -0700 (PDT)
Received: from dbcomp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id j2sm10794130pfj.168.2021.07.10.17.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 17:37:40 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v3 0/2] cec: Timer Programming
Date:   Sat, 10 Jul 2021 17:37:34 -0700
Message-Id: <cover.1625962440.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is part of an Outreachy project to expand the testing of
Timer Programming messages as handled by CEC adapters.

Changes since v2:
	Patch 1/2: cec: expand Timer Programming tests
	- use 3-character abbreviations for months
	- in set_timer tests, simplify the method for finding "tomorrow"
	- use fixed dates for timer_error tests
	- use full leap-year algorithm
	- add source type and recording sequence as ways to compare timers
	- add source type and recording sequence to print_timers()
	- replace timer field end_time with duration in seconds
	- replace timer_duplicate function with std::set::find
	- do not truncate overlapped timers, just set them with a warning
	Patch 2/2: cec-follower: emulate programmed timer recordings
	- new patch

Changes since v1:
	- rename functions for clarity
	- set most test timers as a function of current time, not fixed times
	- use time_t instead of struct tm to hold start/stop times
	- use std::set instead of std::list to hold timers
	- add repeat timers (recording sequence) emulation

Deborah Brouwer (2):
  cec: expand Timer Programming tests
  cec-follower: emulate programmed timer recordings

 utils/cec-compliance/cec-compliance.cpp |   1 +
 utils/cec-compliance/cec-compliance.h   |   1 +
 utils/cec-compliance/cec-test.cpp       | 512 ++++++++++++++++++++----
 utils/cec-follower/cec-follower.cpp     |  59 +++
 utils/cec-follower/cec-follower.h       |  44 ++
 utils/cec-follower/cec-processing.cpp   |  56 +++
 utils/cec-follower/cec-tuner.cpp        | 245 +++++++++++-
 7 files changed, 824 insertions(+), 94 deletions(-)

-- 
2.25.1

