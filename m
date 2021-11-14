Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC0F44FC4F
	for <lists+linux-media@lfdr.de>; Sun, 14 Nov 2021 23:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233998AbhKNWvg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Nov 2021 17:51:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231469AbhKNWvX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Nov 2021 17:51:23 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F09FC061746;
        Sun, 14 Nov 2021 14:48:28 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id b1so32505540lfs.13;
        Sun, 14 Nov 2021 14:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kq8l3SK94Kza+Lx51oJZ5qCJhBwYc4lAosdZK3UHqnQ=;
        b=qtRkpBbFoFU56CCdNTDVCSNE7ZBrmPXjL0VdA9CknRqF1Ki/b/UPICEJGr0uH7Vr8u
         hHT+0VoFBiOtPYxX+xSbBstOS7O5bHwFu6VifA7FwcLl5Ki1pGPwLxVKWzHS5k8fTgDE
         N+d1D8Ul7rwhBfxIqI+8Vm4c8p/DgSleVoKfKgUm+VKw0BshWBZDS/bhWWhjBvWYWYZS
         6+AvKMujMvJOIlxHyS4NFaOQq6/a+hO/XRu10ChcZzCoTlHiIwE82og6+V2F1YnIXqYl
         WQ1NyAE7c7VrmjzZhDdWXOBV8Tpi7/ntAuVLnwPLhh1HUHTJFVgevhcPAeiMo+IZm5zm
         n6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kq8l3SK94Kza+Lx51oJZ5qCJhBwYc4lAosdZK3UHqnQ=;
        b=OC0qrYE8+oPpEwPYG38eop118sQDhS5gf3T7QcZ15BrbOzmmn2lDrP7Ufe7wz6nhIF
         jbWbGI+H4DLsmtYgExHjMy4tBeYvE+eX+xZ1Ihhzf7tXrmDnEL9d/+rzDZO9TFk2x/D1
         RLmmvjhCj8SGAIPXNqa92zqBWEGJ2VHeL0JN0898caJW6Yx/YfyMMBxPdsidS+BulM0c
         NE8PBU0BGCRQheel8ET1s/5iL97FrHsOE/TGlJywjlRosOACPS4213hKoNdB0kApaZHx
         d6Gbn3VmHB5QDgXYCnzzW0bguaS5dSzGma2zQ1BZuWiofujf9MIHVtpSn4oUYZ4FjEz5
         gnaw==
X-Gm-Message-State: AOAM533zjRW+M2RBUeGnbCtlkx+jRu6OM7jvn4Feq/tS4F9cRTa4lIPw
        jmO9myx6zznWpyfVCHW+ggD09xqIRRE=
X-Google-Smtp-Source: ABdhPJzvOBq1gK6yT7oQyDY5RONej39BkP3mhL2dgUyGTkVI1OBLFz7i1UXqizTMVMVM9WccB1HLDg==
X-Received: by 2002:a05:6512:ac9:: with SMTP id n9mr24802279lfu.59.1636930106612;
        Sun, 14 Nov 2021 14:48:26 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id h1sm1228591lfu.277.2021.11.14.14.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:48:26 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add NVIDIA Tegra114 support to video decoder driver
Date:   Mon, 15 Nov 2021 01:47:29 +0300
Message-Id: <20211114224732.11550-1-digetx@gmail.com>
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

Changelog:

v2: - Changed tegra_vde_alloc_bo() to return errno and fix unassigned
      error code in tegra_vde_probe().

Dmitry Osipenko (1):
  media: staging: tegra-vde: Reorder misc device registration

Thierry Reding (2):
  media: staging: tegra-vde: Support reference picture marking
  media: staging: tegra-vde: Properly mark invalid entries

 drivers/staging/media/tegra-vde/vde.c | 147 +++++++++++++++++++++++---
 drivers/staging/media/tegra-vde/vde.h |  18 ++++
 2 files changed, 152 insertions(+), 13 deletions(-)

-- 
2.33.1

