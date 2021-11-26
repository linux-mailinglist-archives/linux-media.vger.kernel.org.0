Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF5545EA82
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 10:38:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376401AbhKZJlU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 04:41:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238177AbhKZJjR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 04:39:17 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC52C061396
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 01:32:54 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id v1so36290071edx.2
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 01:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=08+LjFVBcHxIAyrTBFPcnkLL1QMPWNSenak/w+o5csE=;
        b=M3RNY98nMXEqmIhu2vjx8RHrHVh4G9I4Awx/5Ao7WOtrFr1JRXl3fDxgH5nEGCkB17
         OJjd0meRnsJ8dLs/Yhbc3cK5bdf8HmTdIkLwU0Q+rh8ZIxrEYJpyeWk40bWNn8XcoWSW
         q6dFNfHYAyyOGsTDQq6iE6fY7ikZ5VwEGRqsPlPMCXR/EqundrhCq6A4rDc6fFAUsUHc
         y612g5VGwA5NU9geqsCWn6Z2RZftQnICP4Xpnofg9kQeuj9Eq8rsd3cqdREenkH73S2n
         k3SrFQ7Om6W+WxVc948SUGHg2okZ8otbhn/69vCba1+HW2VhaGTI74lqZQPjcYYqI6Fi
         cvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=08+LjFVBcHxIAyrTBFPcnkLL1QMPWNSenak/w+o5csE=;
        b=KvPjFae2R0Fo5qpzY81e72DGOCS/EhiVnaSfBlOGM+fTqfvGKZ8cmYlzQ9Y9J9i9a0
         nqFHHHJxRKb51Oxa60GRWmRc9+tRB8vLDTDpwvhU/s2TKYKul/9Po/OgrXtwoW5psJBv
         JcmeoHL4Bix9E4A8gZYXMnEmynniwz1KnO3qxsGiNPNSAYcpTdtPx1DoN0gBn8R3kt5j
         oSU/ktjIIs5N57y53rBB1qLeeC4pimol8J7fdIhx6OGbAIn7dHjd3mUjcyML3me4f7eb
         F2lvlo9/2X1/c/LSuOHpNMjLkshrkRonx1rsOkwr3euL308RqBIy4UM7209tO0vNzaGU
         DpWg==
X-Gm-Message-State: AOAM531rga7Rgd9tsNkIZNJ3p46VEiV3HtBGiGP7vadqt3GxqTsdYU1i
        HXJjLNPZKrYI06nwA0y0pdnlysCp9glT+g==
X-Google-Smtp-Source: ABdhPJwWk5sbUQfgK5AGSvlft9lfdmgwucbFedemNLcL0DKxg+jvQjKa52lUIETbr7Tp0S+9xOg9ww==
X-Received: by 2002:a05:6402:1d50:: with SMTP id dz16mr44858838edb.309.1637919173288;
        Fri, 26 Nov 2021 01:32:53 -0800 (PST)
Received: from localhost.localdomain (hst-221-9.medicom.bg. [84.238.221.9])
        by smtp.gmail.com with ESMTPSA id a17sm3422545edx.14.2021.11.26.01.32.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 01:32:52 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.17] Venus updates
Date:   Fri, 26 Nov 2021 11:32:43 +0200
Message-Id: <20211126093243.1254176-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This time the updates include few fixes.

Please pull.

regards,
Stan

The following changes since commit 999ed03518cb01aa9ef55c025db79567eec6268c:

  media: atomisp: cleanup qbuf logic (2021-11-17 19:40:19 +0000)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.17

for you to fetch changes up to 7f28a0331c663cdc51a2c85d76c7f9d13a19fa2e:

  media: venus: core: Fix a resource leak in the error handling path of 'venus_probe()' (2021-11-22 13:54:01 +0200)

----------------------------------------------------------------
Venus updates for v5.17

----------------------------------------------------------------
Christophe JAILLET (2):
      media: venus: core: Fix a potential NULL pointer dereference in an error handling path
      media: venus: core: Fix a resource leak in the error handling path of 'venus_probe()'

Mansur Alisha Shaik (2):
      venus: correct low power frequency calculation for encoder
      venus: avoid calling core_clk_setrate() concurrently during concurrent video sessions

 drivers/media/platform/qcom/venus/core.c       | 11 ++++++---
 drivers/media/platform/qcom/venus/pm_helpers.c | 32 +++++++++++++-------------
 2 files changed, 24 insertions(+), 19 deletions(-)
