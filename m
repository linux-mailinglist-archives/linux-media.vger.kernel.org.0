Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAAFC2C47
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 05:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731847AbfJADS0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 23:18:26 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:40861 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731164AbfJADS0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 23:18:26 -0400
Received: by mail-io1-f42.google.com with SMTP id h144so44023333iof.7
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2019 20:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vJhViXhFWH1AZFFJQ2qOgkLYKNNPjN6rsAK3+QHVkrY=;
        b=qWT0Q6hBOkjUKHu/p2pQB1PMeuIyCwLVCrvSyQVldFj+O+DhbOseSyHxIEDuqP2NQx
         /w9LNrU7h2VhnlqV2I1jrObWEflXcpwPNuzFQoy4sw4srl4dp3c3+pU4toCZQtcT34/k
         fVvSstmgZejZLiMSsr5+MnoH8tvEdwAqHBg4zFY08328T9fqfNzxeLKA0fDfj+XIjEeU
         HOSHcXW4nqjN9mFOMmAzsXCjHL3g9+B1rq448T+gP7/FAHXn2To8okaG9HXgLsaCyoP3
         BSt3zHWRReqlkZiyYmp2eujHl27YNVLpBxeM9XdlqDqohsA9sBaNoMGP1+yA9DiJn/4v
         W7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vJhViXhFWH1AZFFJQ2qOgkLYKNNPjN6rsAK3+QHVkrY=;
        b=DVP24DGEZZDxeytOeITB2tcGDLDJw38ly1eMqbyg1SqiJnDyw+BBApTlkuZSxpW4Dm
         qzvpboLwTrswAQhPC2eEdUtoca7oNnwl+htV0l+Gu50cNeF6qKxQPff3+6J6/0N96lYt
         krmq+6S6rzKMZxgXTBTlgqfLfa49pORbKVIUeo/udfrpyVP4Qm4v2jw+yO04/waaK4Jb
         dWNo0Ipx26XOmlEdwyE10+/jfMj72KrN9rHMCjUI/YU/OD29fKHp5y09Od5LmLfVPa1F
         sD2O7jjMevzHBUmaJgD77vRm1lBlw/TmVY2ZqumNGFshf4hwNDo5vbTEQ2ydHlZ5dRNc
         7ryA==
X-Gm-Message-State: APjAAAUDnqy9EVZVaPhUgtLqvK07z3pzaYcKcu7i0LhE8UeyqRKw8iKS
        jGNrecgIdu3CqPidlw9E22KClpTp
X-Google-Smtp-Source: APXvYqxt+nLEwaDdadCpB9+9YOtEqq8ffJwZ2vHrA+DggFuAyQUkDETMxSr+4JYfHH8LXzCqNHG1lQ==
X-Received: by 2002:a92:d610:: with SMTP id w16mr23085579ilm.246.1569899905000;
        Mon, 30 Sep 2019 20:18:25 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id l82sm8719452ilh.23.2019.09.30.20.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 20:18:24 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v4 0/3] cec-compliance: tuner control
Date:   Mon, 30 Sep 2019 22:18:20 -0500
Message-Id: <20191001031823.312020-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930043017.474025-1-c0d1n61at3@gmail.com>
References: <20190930043017.474025-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series implements analog tuner step features and cec-compliance tests.
Added tuner_ctl_test() to test new tuner features implemented in the cec-follower.

---

changes made since v3:
  - Correct commit message for tuner emulation bug fix
  - Refactor analog_get_nearest_freq_idx() to return freq index
  - Refactor analog_get_type_system_idx() to set device info
  - Add macro ARRAY_SIZE_ANA_FREQS
  - Refactor tuner_ctl_test() to use std::vector

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
  cec-compliance: add tuner control test

 utils/cec-compliance/cec-test.cpp   | 91 +++++++++++++++++++++++++++++
 utils/cec-follower/cec-follower.cpp |  2 +-
 utils/cec-follower/cec-follower.h   |  3 +-
 utils/cec-follower/cec-tuner.cpp    | 73 +++++++++++++++++------
 4 files changed, 150 insertions(+), 19 deletions(-)

-- 
2.23.0

