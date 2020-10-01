Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E35280B35
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 01:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387683AbgJAXMh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 19:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387640AbgJAXMO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Oct 2020 19:12:14 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3539C0613E3
        for <linux-media@vger.kernel.org>; Thu,  1 Oct 2020 16:12:13 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id e2so357274wme.1
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2020 16:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=RilB0sLyopNSleOFSASFAums5syvHqEljZsZmvQUhag=;
        b=V8CkvytMD/1M9UHQ9uOPPwbRl6rrjH2A2A9eWl2w3K4NpcfcYnb87cUeTo3ZfZHFRm
         Z1qXH9rGsKpSeWBQlYAiJvOqEoeAgofpaeTMC0OqU2J2GiDWt8BH1VjDfUrLqy+vxxcl
         /egH3T5trujQgrzGP+fgjYhDHkASRTNLNar3/ktxW9twDmI0zoV1uO16GKfgW8/xQpA0
         BRRagWKnx8OQdWP0tAdRCyrrJKdpWr83k5UggRxwMTe3de77iUdlwQBemfzSRS8XXDKs
         yVz/Dmis5vlZSklHfGHfYOP1faJ/WL4/YV1zq+R6/seFIBRrG0+rj1BZ5/IUR6bhWQqT
         xpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=RilB0sLyopNSleOFSASFAums5syvHqEljZsZmvQUhag=;
        b=niNJvf7rtPKBOjjQspmLHNro1LZT6qBPIElGsKXT9+rSJIo3AfiZDgrsSUhTub60jA
         M3wzBE7xAAmMcfbXFHpohpJCHhJF687e1Yk92HV/DhXKrXKuP++mwe0pEO54K9vBwG7k
         Sywf6NRf8OzSW9xTaeRgBZDmcT+/Q6IzmZVZuixQziYfdf7J9tFF3KLcLSLDL+tw+8US
         /OQOYAYNhRLPuUS/r2tSI9u7N2pBaf38O0VWerwgv503eJLBmjmhVZRi5Z+04br8ORMB
         x+L/u/r0S9WN6mJKU6g9lQk1jVv/0S5wybfD7+0MQasFg41Vn2H6335yj8mdHG3IqOrJ
         zEaA==
X-Gm-Message-State: AOAM532M0JPdplYs0GyliyxEisQdj3u2/oAf+i/O3cHz/fz/iC410PZa
        gAfrBQefZYd++XXkrtP6Z+yOjBT1OFYDZkvc
X-Google-Smtp-Source: ABdhPJx6aDWN3NUPA8GOy9AMmyCBArvarusg7eYjHCpML5E/+qPM/RkzvwyoJzxSgQv61nU0/wJVoQ==
X-Received: by 2002:a1c:f311:: with SMTP id q17mr353523wmq.168.1601593932171;
        Thu, 01 Oct 2020 16:12:12 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id s19sm7487698wmc.0.2020.10.01.16.12.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 16:12:11 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for v5.10] Venus dt-binding changes
Date:   Fri,  2 Oct 2020 02:11:36 +0300
Message-Id: <20201001231136.23963-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This is a dt-binding change which was forgotten and it corresponds to a
driver change [1] already queued up in media_tree. Without this DT binding
changes the DT binding checks will produce errors.

Please pull for v5.10.

[1] 9a538b83612c ("media: venus: core: Add support for opp tables/perf voting")

The following changes since commit eb5f6b8ee9e4fcdda3807aff02a3df2d7ca51bbf:

  media: atomisp: fixes build breakage for ISP2400 due to a cleanup (2020-10-01 13:17:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.10-part3

for you to fetch changes up to 647b880ce3f000bea15a0466bf8a0d28fa16e90c:

  dt-bindings: media: venus: Add an optional power domain for perf voting (2020-10-02 01:08:57 +0300)

----------------------------------------------------------------
Venus updates for v5.10 part3

----------------------------------------------------------------
Rajendra Nayak (1):
      dt-bindings: media: venus: Add an optional power domain for perf voting

 Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml    | 6 +++++-
 Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)
