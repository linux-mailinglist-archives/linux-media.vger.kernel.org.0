Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D2136BDBC
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 05:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234055AbhD0Dau (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 23:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhD0Das (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 23:30:48 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EFF2C061574
        for <linux-media@vger.kernel.org>; Mon, 26 Apr 2021 20:30:06 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so6380879pjh.1
        for <linux-media@vger.kernel.org>; Mon, 26 Apr 2021 20:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=2GFtd/q/vbWqyp1qG+N7eUSvYLCEp1AwDpTpKUbXMqg=;
        b=I8JsRWuMS5mZdqp1BGbNjPhYApQUGXBBn0+NBPIBOJMsqklCPeRVCFmEXc7AH5PB3U
         CgqmgSNQvmlZgnN15GzSsXokkTbqqq3t0nKHiIpL/b+SUpwdmrC1xX3Rz+JIyMAxxRyz
         f6W8oyehL+8k39neXyjq46s908h3UCr4sh5K4Jw5qWgiFCeyCrHcnyBL4caKXPhMdu9f
         FwlfyTFF0D4RCsJOrYxR5PADZWIrpN+yAmPs46RCAUMnZ1ULHxw2tet8AGJl/8oMC7wO
         xLXZVs5F8UZ7gxtHhoqM/3Ziq2MHomc+gtNBPBwOl9eLw72hujYZINsqZjF3av27yf4L
         yuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2GFtd/q/vbWqyp1qG+N7eUSvYLCEp1AwDpTpKUbXMqg=;
        b=AVLY/R1+lAU1RmNaclURizI+1v2a6VkHoeUNIR7g7rqmR7tuKeu52yD7jSQmPdeEMD
         7j8L3r7LmvCq2griHV/i4mPk3+jmxP5RucVY3kDHra6OWTRsM0TfaeJ8lJ5Q0MD3EpUx
         SA7wAU0DMCBWVGknHSQD6MY/5ko4/edqJfL7Wam6bP1hBH42UukZHhK3zcvDJcQPtihK
         00f58/Nz+tORiJZsOyD/2j0NUyxDYDtvS0UcLpwww8zmxLmY3zDX3TRZzIX+cl1gQQYT
         mMqjs7wPZcH+OgH/KFxWGwZ4ZQ1HPDoefjrNsLlPecgc5EljK3d1lGgyUbMnHH5B8mvA
         I1SQ==
X-Gm-Message-State: AOAM532WIQys+MnFW8zKDZBfFwaaE+7nhSmZdZr69hUoxVCRqZrGVJuu
        FfRvR8UMtPer/PhzafTDOXVE6vFoG4oFFw==
X-Google-Smtp-Source: ABdhPJxyhdjK43bR0iPVl9nhDSiGoZLPJVhkDgd6o6mKL2mJ6ujaC0mnIQJIznK6zWHfJaCrUYlKjQ==
X-Received: by 2002:a17:902:d884:b029:ec:9fcd:2311 with SMTP id b4-20020a170902d884b02900ec9fcd2311mr22065107plz.80.1619494205793;
        Mon, 26 Apr 2021 20:30:05 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id jx20sm666851pjb.41.2021.04.26.20.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 20:30:05 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v3 0/2] cec-follower: increase accuracy Audio Rate Control
Date:   Mon, 26 Apr 2021 20:29:46 -0700
Message-Id: <cover.1619492378.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v2:
* Patch 1:
cec-follower: increase precision of Audio Rate Control active sensing
	* Add the unit (nanoseconds) as a suffix to the define name.
	* Write the defined value as a multiplication of seconds times
	  nsecs_per_sec.
	* Add ULL to help cast the expression to an unsigned long long.
	* Note: for the sake of clarity in the diff, a blank line before
	  the if statement is missing but it is subsequently added by Patch 2.

* Patch 2:
 cec-follower: detect the cessation of Audio Rate Control messages
	* Remove double negative in comment.
	* Extend comment to specify (i.e. state.last_aud_rate_rx_ts != 0).
	* Make warning message more succinct.

Changes since v1:
* Patch 1: cec-follower: increase precision of Audio Rate Control active sensing
	* new patch

*Patch 2:
	* Keep the aud_rate_msg_interval_check in processMsg to avoid missing
	  late messages that arrive between periodic interval checks.
	* Swap arguments so that struct node appears first.
	* Add blank line for readability.

Deborah Brouwer (2):
  cec-follower: increase precision of Audio Rate Control active sensing
  cec-follower: detect the cessation of Audio Rate Control messages

 utils/cec-follower/cec-processing.cpp | 30 ++++++++++++++++-----------
 1 file changed, 18 insertions(+), 12 deletions(-)

--
2.17.1

