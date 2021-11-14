Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECB944FC34
	for <lists+linux-media@lfdr.de>; Sun, 14 Nov 2021 23:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234904AbhKNW1Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Nov 2021 17:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231469AbhKNW1R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Nov 2021 17:27:17 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 205A2C061746;
        Sun, 14 Nov 2021 14:24:18 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id b1so32406523lfs.13;
        Sun, 14 Nov 2021 14:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=48XZovVNV/PbOzkLzCtoiEWbflOcMGPbMrTaZE0X8FE=;
        b=UgVvGAMFXb9vtVkKql7iJujsrJJqhAwxQCwiHDvRzTQUi+Fb6GwlYbhcFSPnNajD05
         afV/+a/LFb5zr1xGqCW+HdhvA1sWz5ABHcKVXLVkQY6Wgyg+vX7jH/eUZSb33nE+zgFu
         l4ilY16549yC28TBbZ8kCsB0o+qfcgaPCggv2GOH1CiJemJ/tv83Xc89wyUn6cd9k8IR
         GiLXCRs2deXQDGs7nmlf01X4Fx4fMqu8qgBMqSzbtLwzntDHT+/6jwf0onpM24cQWPN7
         eHaqitDTh7ETVe7o/oJnqg9Hfq64ld/xGddxuYCSbyjoqWDnS/v2A6jMfQlYio7DEftP
         zjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=48XZovVNV/PbOzkLzCtoiEWbflOcMGPbMrTaZE0X8FE=;
        b=T5fjqei5QZM0rcYtECzY5e7yvd3SOTmg49KCuItydiQppsJUybpEzksKzpNvDxWYfz
         uUiRDfunbroMmTtM1NfBlUsXqHg1mos3dWhIsbwgtmV9VtV3EFpdctVdfspyMqizaFge
         7gTfFxnYJXIRcBtnNmcWpOi14iUkzsm60tKPHxe8/pgTJ3WdmJlgsOXYqKZ/zaM19NxB
         q0G+daFsvFzmREYSU3gwzycWosVy2kQMYqYTh7oTOaS05c420dV3B0SuhIXUasSe5G/g
         mBaMTIRfX+cM36LIJEr8qKjhLMG/jviSnZfDrGT6RAAGvkacyhc8BuqYQQGuYjpcYnYr
         pHdg==
X-Gm-Message-State: AOAM533mu60WceRcBUz09MGBvdQEINtGjFdN0tT1IaiiYG5n1zRibRbi
        Y8MAjmklC4luF/wJQEiL1m4=
X-Google-Smtp-Source: ABdhPJx7CA5hvSVinPXfamTs948Bg57tl1gmgxN88USRgOgCCEs84DwQyamqOWvJJDHXts2zZMMzTA==
X-Received: by 2002:a05:6512:c28:: with SMTP id z40mr29762557lfu.457.1636928656490;
        Sun, 14 Nov 2021 14:24:16 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id d6sm1223339lfi.52.2021.11.14.14.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:24:16 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] Add NVIDIA Tegra114 support to video decoder driver
Date:   Mon, 15 Nov 2021 01:23:50 +0300
Message-Id: <20211114222353.22435-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Video decoder of Tegra114/124 SoCs uses additional memory buffer required
for decoding of protected content. We won't support that content, but it
is impossible to disable access to the buffer, hence a stub buffer needs
to be provided. This series enables decoder driver only for Tegra114
because Tegra124 support requires more non-trivial changes on both kernel
and userspace sides.

Dmitry Osipenko (1):
  media: staging: tegra-vde: Reorder misc device registration

Thierry Reding (2):
  media: staging: tegra-vde: Support reference picture marking
  media: staging: tegra-vde: Properly mark invalid entries

 drivers/staging/media/tegra-vde/vde.c | 143 +++++++++++++++++++++++---
 drivers/staging/media/tegra-vde/vde.h |  18 ++++
 2 files changed, 148 insertions(+), 13 deletions(-)

-- 
2.33.1

