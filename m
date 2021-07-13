Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 511D63C6A40
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 08:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbhGMGMX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 02:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbhGMGMX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 02:12:23 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33958C0613DD
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 23:09:34 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id t9so20696964pgn.4
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 23:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sGhWTKpq6YhtUun/daZ0OUpIYJIrCUDczyHVvl1NbFo=;
        b=VBvFSAI3guuzTDnAU+HSIxXiM0GdKzogCYCurpZPtoLuXN0q5ebT3GR1LRgN1feSM1
         KSPO0nAgm6QHbWanCQgoT5hqFoI/J87L209Ju5FB+q5febmnUXKEL7kLu4iI9NBWbSuG
         D1aCXBu3mZt+qwxRrse4gEthHIQAeIQnrG3uIVkTbmPyqqb0y+Lehsk7wru7L4s5//up
         K3FTpsHK+hpnqWYGKWV5aZ/ogKliXTjckDKCdnHAsy6nqDwDwF2IGTSTPB6iJR2Hfe7v
         YqVIjtY9UoTxLP+RjVCc/vkQhMFKDrExZnyhdT2qtQ9z9fHiSxPCHGW4HC5CK6CPzoEs
         B60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sGhWTKpq6YhtUun/daZ0OUpIYJIrCUDczyHVvl1NbFo=;
        b=W6LrE1pDw6ZG4RG7N1CDrQTmx3PDGt+54XCAz9/rmJbVS9OTW3jE94dhxI0WkvDJ2r
         6hiNfOdz435rphOm3h8xcn/Mu6j5a2OA+buIW5h7ivTtS5xc1QbNSVfr7nlQZ3XOn8Mu
         PfK/f6hcWkbLwDrXM/JvPn1oTkYPVrT28kjWxaw7dDT8QeD1IOP2k2fYCsDKtSNfTQXB
         /7NXBGTcApe0AgkQgptcPfdeopWhrIJvdKtqiVvHoPVvOKyD6b3WmKdRiFVDBLn33WHl
         kpEhCD5Y6wIbLFeUC45rxaJEgpitRo4ZAv7gEbwt5Es1HBOzEiRbXGGbErCeHlVnoats
         euug==
X-Gm-Message-State: AOAM530b4igjppp05LsAYiootwd7rSGpK6ueXeG4sXfgBfDFFfWsUMtD
        OiNyKlYXYNQna8/QIzimob9N9TgcQzmuiQ==
X-Google-Smtp-Source: ABdhPJzunxehrXoAiBQgyCeYHCG1S1fTscc9AHtiIuTsN16+HfopOj6f5scw0/+YR28IRh5PXCfw5g==
X-Received: by 2002:a63:f91a:: with SMTP id h26mr2803372pgi.234.1626156573479;
        Mon, 12 Jul 2021 23:09:33 -0700 (PDT)
Received: from dbcomp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id a13sm15878362pfl.92.2021.07.12.23.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 23:09:33 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v4 0/2] cec: expand Timer Programming tests
Date:   Mon, 12 Jul 2021 23:09:18 -0700
Message-Id: <cover.1626155911.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is part of an Outreachy project to expand the testing of
Timer Programming messages as handled by CEC adapters.

Changes since v3:
	Patch 1/2: cec: expand Timer Programming tests
	- revise error and overlap function names and return values
	- use struct tm as a pointer
	- increment year only when follower receives set time message
	- clear timers in previous year/next year if any
	- add helper functions to send and clear timers
	- add logical address Backup to device that may pass tests
	- add check for standby message received during recording
	Patch 2/2: cec-follower: emulate programmed timer recordings
	- add check for standby message received during recording

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
 utils/cec-compliance/cec-test.cpp       | 424 +++++++++++++++++++-----
 utils/cec-follower/cec-follower.cpp     |  59 ++++
 utils/cec-follower/cec-follower.h       |  44 +++
 utils/cec-follower/cec-processing.cpp   |  65 ++++
 utils/cec-follower/cec-tuner.cpp        | 295 +++++++++++++++--
 7 files changed, 788 insertions(+), 101 deletions(-)

-- 
2.25.1

