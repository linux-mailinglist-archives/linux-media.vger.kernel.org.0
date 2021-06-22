Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B22913AFC05
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 06:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhFVEi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 00:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhFVEiZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 00:38:25 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D89C061574
        for <linux-media@vger.kernel.org>; Mon, 21 Jun 2021 21:36:09 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id c15so9700493pls.13
        for <linux-media@vger.kernel.org>; Mon, 21 Jun 2021 21:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UO2qGHCa2e5pNbvwtK9K5+O/XaNWTMTTl06t2z3PnuU=;
        b=WFCVy+4YPyE8bb/jAQGiU8eS/3CW2J0hl1tAkxyI8fhPBc6jkKj31yYa3RoKVu5FlC
         sdsU5vkbCYoKjecQe2snm9fnHtj16PWLxnjoVjP1ItEiLJ/zUQ4KNXxdJQb0jy4tvBzQ
         inE0Ja4+BsYZgK0hNG+tebMSiUCwAESI0bo+qcjtK2Oohm9Rzup4paSqyFUvz8E7kUqj
         A4YFBGAFI79L8Gj+nrfF/Q1lx+mGrBqUm3CfYkBLzs9sQZm2oj1qbNbEpzh17SDBMuKG
         LoIQw9Y5xpS34ImL0pV3HzsXDfrcn7uXnYd9MudIptcfx92lMDamDWaJt88ogi+9S+Kx
         EvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UO2qGHCa2e5pNbvwtK9K5+O/XaNWTMTTl06t2z3PnuU=;
        b=M8QIFcVCZ0ReZl7IpsnuC69Z6sk3kT87pPQOV82/boxdb83MLgPtj/p+H9IcJ2R+e3
         QKbo8T1DLmqZB6vVqEd41n3HbGlTY3k4vG5tOcBdGJEe60RSaYMUMP5ENBUgRSEWAsiT
         sYJkMwNPZ4KDlSi5pQJNv+BH9ZtSW90FDlvygsKFItrj2TL4v/qYl61tLWio5NODOcCj
         APv2YUvDIybdI2jhyetsbMGNuAdMyGN58TFgdv8AR81R+gNBMYE/ezCRFzjcVjvaMvXH
         iZV3zk8+uEOaTMVHvVkp2h0QVbICLnuQEp07XObX7WZg4HtSM28kVspd+LlApbm8kf0u
         f2Wg==
X-Gm-Message-State: AOAM531YI0l31dR/PhGVBVWWWQqtcr9FVsA2PX9Hm6wTVOGKWzsC9xYe
        sB2BWy8u9IPbuITGJqFUUbZyufQqeglj+Q==
X-Google-Smtp-Source: ABdhPJwm2O62lNT8sXvCPhiZhBopBYphDJrhS2GGYuRWGuhXPJn/M4V5cJRIUXVo1qhQcqfD1Koigg==
X-Received: by 2002:a17:90a:206:: with SMTP id c6mr1934175pjc.174.1624336569277;
        Mon, 21 Jun 2021 21:36:09 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id g4sm2152562pfu.134.2021.06.21.21.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 21:36:08 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v3 0/3] cec: One Touch Record tests
Date:   Mon, 21 Jun 2021 21:35:58 -0700
Message-Id: <cover.1624336366.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is part of an Outreachy project to expand the testing of
One Touch Record messages as handled by CEC adapters.

Changes since v2:
	Patch 1/3 cec: expand One Touch Record TV Screen test:
	- replace numbers with corresponding defines

	Patch 2/3 cec: expand One Touch Record On/Off tests
	- rename commit to reflect expanded scope of tests
	- increase msg timeout for reply to 10s
	- rename helper function and invert return value
	- use primary device type to identify remote follower
	- use logical address type to identify remote initiator
	- limit range of accepted external plug numbers to 6
	- disallow external physical address source
	- keep track of whether the device is recording
	- add additional invalid tests

	Patch 3/3 cec: add One Touch Record Standby tests
	- new patch

Changes since v1:
	Patch 1/2 cec: expand One Touch Record TV Screen test:
	- add space after 'switch'
	- add "return" before fail
	- check analog broadcast type and broadcast system operand
	- add a comment when follower ignores message
	
	Patch 2/2 cec: expand One Touch Record On test
	- new patch

Deborah Brouwer (3):
  cec: expand One Touch Record TV Screen test
  cec: expand One Touch Record On/Off tests
  cec: add One Touch Record Standby tests

 utils/cec-compliance/cec-compliance.h   |   5 +
 utils/cec-compliance/cec-test-power.cpp |  63 +++++++
 utils/cec-compliance/cec-test.cpp       | 211 ++++++++++++++++++++++--
 utils/cec-follower/cec-follower.cpp     |   2 +
 utils/cec-follower/cec-follower.h       |   5 +-
 utils/cec-follower/cec-processing.cpp   |  14 +-
 utils/cec-follower/cec-tuner.cpp        | 119 ++++++++++++-
 7 files changed, 388 insertions(+), 31 deletions(-)

-- 
2.25.1

