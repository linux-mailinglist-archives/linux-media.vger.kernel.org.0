Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2293677E8
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 05:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234613AbhDVD2w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 23:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234495AbhDVD2w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 23:28:52 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B080C06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 20:28:18 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id f6-20020a17090a6546b029015088cf4a1eso196990pjs.2
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 20:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=M6xhasrQB0bhNZxI+j8eEvrhZoWo3vIz//86xx2p0Y4=;
        b=lgggSQDtQFrcggoYR9Zhlhv2UMpIRZQtw0AOY1W/7bc1CnbYPuQBABiwC7MK0snnPx
         q0eTm1vBGMDM6e9Jh1JilEtzi3K7reqQF2Tx6jl2JjJ8EAcZL28ur7rYFOAdGCyya4Hv
         o8AaPOCfHHnmiNXL7OaPhApcYAmJPSZh9Rq8kJUNMu2egMeazHll8KiG5W5UBPMKi75Z
         nzm1UVp4CYNOtiKYynMIOAeWqe24FQfaF//gp21yKOZA6sTP9GSzAPmtvVtOE6NNIShs
         Gd4X23AtK1Jbmk0AFCpnFqlADD8gYEMX7oi70i6oFku+T+txVKvqgvPJ8gF6c6IHGRkH
         sjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=M6xhasrQB0bhNZxI+j8eEvrhZoWo3vIz//86xx2p0Y4=;
        b=mdLl4OfRoz5ny+O62rE+IUMPRGtb+gRBYHT5mmRbOVmdcae53v7A9tkxh0DytvdT89
         RkNtCDasdZyV+bQa6LCl0I4EQPyhk3D/OJuXq1mduC5ZCgkbj4I4At5zG1w8Rnf9Xl0r
         N8sTiJKeMyiKIEV8t3jhpvzz8q8bYS+FnW/8NHkf3DujVHW6Oj0GBcxnC4TvKhkczfzH
         kUKbcklLpqyiJ9iBZDmohk0cTFF1trsUtLOqs6CMd1Qg7KybUvpTQ1GsBFMYevBfepgd
         0dNkmKyxVv2KGzBwyU+QYeXKIO4W3G3EWVlpGa7XpTBqHjX3M5dyM29T3UVbHN2dcxfG
         r9gA==
X-Gm-Message-State: AOAM533Q6aN2FsXpNDgkx+GUIkJN3mFZ+JZr13oQiOGjtAfED0OlX3S/
        vtDKUN3+fAWJ8sgbITKGO1g1iKssdqvXzA==
X-Google-Smtp-Source: ABdhPJyFvF6CbAv+6tS0cDJ4MWJdC4dw5oM06GziTwi1hMgSaITouazSKMNj5hcdfOC7wOFAG9MDAA==
X-Received: by 2002:a17:902:8487:b029:e9:a884:7450 with SMTP id c7-20020a1709028487b02900e9a8847450mr1194341plo.49.1619062097653;
        Wed, 21 Apr 2021 20:28:17 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id f3sm6266999pjo.3.2021.04.21.20.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 20:28:17 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v4 0/3] cec: add tests to Audio Rate Control
Date:   Wed, 21 Apr 2021 20:27:51 -0700
Message-Id: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update the Set Audio Rate test to include the Audio System source mask.
Add an active sensing test.
Add an invalid operand test.

Changes since v3:
* Patch 1: cec-compliance: add Audio System mask to Set Audio Rate
	* New patch

* Patch 2: cec: add active sensing test for Audio Rate Control
	* Remove comments indicating basic and rudimentary status of test.
	* Add Audio System source mask to active sensing test.

* Patch 3: cec: add invalid operand test for Audio Rate Control messages
	* Replace "parameter" with "operand" in name, commit msg and comment.
	* Add Audio System source mask to invalid operand test.

Changes since v2:
* Patch 1: cec: add active sensing test for Audio Rate Control
	* No changes.

* Patch 2: cec: add invalid parameter test for Audio Rate Control
	* Add indent to correct formatting error.
	* Change invalid parameter from -1 to 0xa.
	* Add check that message has not timed_out.
	* Add check that cec_msg_status_is_abort.
	* Add break at end of default case statement.

Changes since v1:
* Patch 1: cec: add active sensing test for Audio Rate Control
	* remove or add spaces to conform to kernel coding style.
	* add empty line to improve readability.
	* add and clarify comments; remove TODO comment.
	* change commit subject to refer to "active sensing".
	* rename function to audio_rate_ctl_active_sensing.
	* rename node state to last_aud_rate_rx_ts.
	* make follower warning more specific.
	* change control flow in cec-processing to avoid extra indent.

Deborah Brouwer (3):
  cec-compliance: add Audio System mask to Set Audio Rate
  cec: add active sensing test for Audio Rate Control messages
  cec: add invalid operand test for Audio Rate Control messages

 utils/cec-compliance/cec-test-audio.cpp | 62 +++++++++++++++++++++++--
 utils/cec-follower/cec-follower.cpp     |  1 +
 utils/cec-follower/cec-follower.h       |  1 +
 utils/cec-follower/cec-processing.cpp   | 50 ++++++++++++++++----
 4 files changed, 100 insertions(+), 14 deletions(-)

--
2.17.1

