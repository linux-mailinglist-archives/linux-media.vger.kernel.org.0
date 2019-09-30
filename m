Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1868DC1AB8
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 06:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbfI3EaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 00:30:21 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:44940 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfI3EaV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 00:30:21 -0400
Received: by mail-ot1-f52.google.com with SMTP id 21so7123455otj.11
        for <linux-media@vger.kernel.org>; Sun, 29 Sep 2019 21:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vUmXUA+fbcqORWWYQ1xxORS1tm+ozwjVXpF/lUdJk1Y=;
        b=byeOd+OY+HCkUtlweXRx1mRXW5Bwp82nugGhsbc53UOE0DkyhYuYQ47gmttNwEAcBY
         dJJCKIupwWnpEtb4G/bmsrAWPU6x2/sEuRsoCyTXCnHLRfC49lmBPqGhhoUn8HxU8h25
         WY5CZYp+R95T58WGbymAZRnS1EpAIKeXymPUbLjSvIaq1rQ1TX0uVZ2aYW0Lu4DB89Z6
         s8kLinklKZrkzNNic6wXsN6KDGdLBNSi8vaOjf+DGqWOhdOmXM0msaBuBeVox5Wrtg8K
         eIWkd9RpXbxobP4b/xXvqe+FDFKG9qiedEUjsjtijujo9Rc4uIOCvo5FroIMN+ZG8mRa
         /4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vUmXUA+fbcqORWWYQ1xxORS1tm+ozwjVXpF/lUdJk1Y=;
        b=pph8PPko/zO4EEtm09rmxUgiQVeaZmziUmFYyTvmRM0C+DB6QgfLRSJkQITkxzq8YK
         cVqireQCCHQrfeGQ/HkJl5A90qPHFVlZpfSzw5nWK781pJbDpINj0N8LflWmVj5LIWIp
         159G14C9R+CDNoT6bC61kDgxS7yjtv5xrQ0em9xkQnzXZ7TOBgkyNW0UHSnORFLv/zHJ
         f+FR5x3ZrEj8AI1rYOyhQL3do7EiY5K4zbQkwdmNAipooOh1E5c+t3ghm4M9uB3efp/O
         jQMJNi8Iat9tOPz8c2Ic56KnlcIyuBqiJKpgYNi9K8fXXmfQz+xvgHcjV726kjWlaTyG
         NpJw==
X-Gm-Message-State: APjAAAXf/6/ibLiySNNfofJGhCJ5fICbiDJHaZjGmIrlAY9umlK2wPVd
        ns0Y8Hr2jlRsOfwZiRKKDpjHYtm3
X-Google-Smtp-Source: APXvYqxoyx4M7JpmcsyTrot4ClQsSuyA5AO0wpInu1PnHLaaMyBpBh6ugoFRT6lxALEitO46XKqdeQ==
X-Received: by 2002:a05:6830:1bda:: with SMTP id v26mr12611969ota.139.1569817820444;
        Sun, 29 Sep 2019 21:30:20 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id w20sm3509017otq.72.2019.09.29.21.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2019 21:30:19 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v3 0/3] cec-compliance: tuner control
Date:   Sun, 29 Sep 2019 23:30:14 -0500
Message-Id: <20190930043017.474025-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924192445.93575-1-c0d1n61at3@gmail.com>
References: <20190924192445.93575-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series implements analog tuner step increment/decrement as well as
performs cec-compliance tests.  Tests where refactored into a single function,
tuner_ctl_test(), to test all tuner features.

---

Changes made since v2:
  - Fix bugs for tuner emulation
  - Add freq_idx to cec-follower state
  - Refactor tuner tests into a single tuner_ctl_test()

Changes made since v1:
  - Remove redundant error checking
  - Add circular wrap logic to tuner step increment/decrement

Jiunn Chang (3):
  cec-follower: fix bugs for tuner emulation
  cec-follower: add tuner step increment/decrement
  cec-compliance: refactor tuner control tests

 utils/cec-compliance/cec-test.cpp   | 184 ++++++++--------------------
 utils/cec-follower/cec-follower.cpp |   2 +-
 utils/cec-follower/cec-follower.h   |   3 +-
 utils/cec-follower/cec-tuner.cpp    |  93 +++++++++++---
 4 files changed, 135 insertions(+), 147 deletions(-)

-- 
2.23.0

