Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17EAC2A96CD
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 14:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbgKFNPU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 08:15:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727353AbgKFNPT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 08:15:19 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EECEC0613D2
        for <linux-media@vger.kernel.org>; Fri,  6 Nov 2020 05:15:19 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id o23so1823787ejn.11
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2020 05:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=5btlHaR1uhCR9R2kpjNWmx9uzeHPQg5IF9XF8OExR6Q=;
        b=Q5YkbKninnnW7wJNCwCiw3gmHyCQYs9KmEsc5hEFQ3clPX4Mex3NW0G03tgofSPnJD
         w7iRBl5IAq1Lf854A/JSZ/f8+llu7khYyG3flIRhc6AiiA3IIC2rFUYdeBdEG+iLOb3R
         /iyylFy2Lk/s6HblIDc6paM+YZ5hVsOGEX+Cc3jnyocDaFSgkWjpBdxp80VnKcUHYERH
         6QyrVx8F9zCIGhqa1K8qwWqw96LvKlLn7+pqR8kHbJx4skh9s4O6kKocsGqVlAIhfMEp
         avFddZENCu9GugOYhNppO5unlwxgfGRaoTP86KOq53Ih1HSPodld9/fO+oPV+hUNoN2H
         9F+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=5btlHaR1uhCR9R2kpjNWmx9uzeHPQg5IF9XF8OExR6Q=;
        b=EIQjYfAboDskVT9TcYrPDzfKQO1gw4BKwJ+fr9iUixOmUHh+uGY4c6K9gQVPxOx8fF
         XCmevWT3f66TfEaA6ARatie/n8loThziD6fvBj3drWsc0PRy5iZsH1ZVGww0Tu/k5TjY
         R1ePfTfQIDX5hnYvQueHsDvrw/4U/BW+eKK8EciF9FHkfzp3xIaVPUhO6BU5JD+OGij9
         7GS4Y8W+nMlK8OLmaSXwj23D+iUZSbrNEaUvycwfE4xRYyjF0FMkjn20rIqb2Y2VT8wU
         R/WJqcF9tE1Hm6SGfC7whuu4P/ovVYzFws00jDpn49dmRLZxF0iE0/1GqOtMXWaZis7J
         gOOw==
X-Gm-Message-State: AOAM533AT3gWQQyJFTwH6k2jRXW07aHUQFgg6q85/9cI6OI9GMBEjgaE
        hW2996bmQh8Dr04WQfoFMOgvZNYenDjT4jlh
X-Google-Smtp-Source: ABdhPJy4pMqP7n5rce34MxRRUE4sMQVF01zgvijVEzL9R6Rqb3O/b1Hz8pyEoQzEMnbABiK11m3Wog==
X-Received: by 2002:a17:907:264d:: with SMTP id ar13mr1920207ejc.207.1604668518153;
        Fri, 06 Nov 2020 05:15:18 -0800 (PST)
Received: from localhost.localdomain (hst-221-56.medicom.bg. [84.238.221.56])
        by smtp.gmail.com with ESMTPSA id j1sm847410ejd.47.2020.11.06.05.15.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 05:15:17 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v5.10] Venus fixes for v5.10
Date:   Fri,  6 Nov 2020 15:14:19 +0200
Message-Id: <20201106131419.28034-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are two fixes for v5.10:

 * Fix profile/level set for encoder
 * Fix venus driver reload

Please pull.

regards,
Stan

The following changes since commit 9ac924b98728c3733c91c6c59fc410827d0da49f:

  media: cedrus: h264: Fix check for presence of scaling matrix (2020-11-05 14:33:02 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-fixes-v5.10

for you to fetch changes up to b3497fe36eb10e799d8ec26aefc1858204d53115:

  venus: pm_helpers: Fix kernel module reload (2020-11-06 13:32:00 +0200)

----------------------------------------------------------------
Venus fixes for v5.10

----------------------------------------------------------------
Stanimir Varbanov (2):
      venus: venc: Fix setting of profile and level
      venus: pm_helpers: Fix kernel module reload

 drivers/media/platform/qcom/venus/core.h       | 15 +++++++++++--
 drivers/media/platform/qcom/venus/pm_helpers.c |  4 ++--
 drivers/media/platform/qcom/venus/venc.c       | 31 +++++++++++++++++++++++++-
 drivers/media/platform/qcom/venus/venc_ctrls.c | 14 ++++++++++--
 4 files changed, 57 insertions(+), 7 deletions(-)
