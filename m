Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB91846F6
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 10:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbfHGIRv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 04:17:51 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43784 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728587AbfHGIRu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Aug 2019 04:17:50 -0400
Received: by mail-lj1-f193.google.com with SMTP id y17so60068982ljk.10
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2019 01:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=uZ71/IjfnhtwBPFF6THZcvtecPOI1brQIp9ai2NeI1k=;
        b=lw+MGCG53qlHD6l00B/7Hr2jQ5KNOzTe/Gk4nJidoMcAM/PCuqYZNE5tCopKN5tIB9
         ybdrmwbQq5dr9qON9O8J8tGMHldp8JlCb68Ac2C0JgrkXcGwvDALxCGgpGaA82m0RYXA
         zDX6S/ynK0N53ICsuuEg/6wrYFCVbJ2HCDDXtR42Frjtd5oq48/dnaIr00RzlNlkR7gP
         Dui88b7Dhs5Iyz7jNvscReYjqxYvEeRM5v4NIkWqclUCYLi2XkMxH0PRxVxOG9bZJv2L
         5QY+LkAUXXOj7VzSwILoN2j9w6heWQ+OyEsdpqqgtZUaF4YL1FkoK0LlSOT4PJM4xtNO
         sGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=uZ71/IjfnhtwBPFF6THZcvtecPOI1brQIp9ai2NeI1k=;
        b=O8ILxfzf2MqlSK8nk5igPvETc2Gj+cbdg8TfnHkY3KGZnDGX6nqPwHwNBA4yVvjlwf
         tHqtMwDmw+2ROKCXzf41WeqMEyA8dzvur+PEF+Orw74UU/pGohBKWcqqankDJg3uRLxN
         KG30NudqT1hGy2rFFE2Rmz0Xp/KHClXR3A3+Z6Mr8Tzbey6wXjz2rYk5tAIT7MnGTSxW
         TRw4bIPWGBaZaVQUynnzjjcAH5v3pH5lpIU4/uJ99RGE0c3ZhTLJnPwUzUv4oLbmytfm
         xCTxj9mCRFnxBoXWmfbIgwF3Uk2NFaqjJHcnI1uAS+/mn3ZjkF/wZZCjyzSvK5Jby9na
         d3Fg==
X-Gm-Message-State: APjAAAW9sP3ii60GOg9zFVX2nmV45mMA1g0GnTw0J8h/NuBxRFi1dtXw
        4OrES+SczKQXVQsUv98b3iB3EAehyf+OSUtrLXFMMg==
X-Google-Smtp-Source: APXvYqwBt9zZPEZS9Zv/S7dA7gva1bRM0PXxxk+aEKCKsKDg9IuOsBbotspesjzG8OPcsmVa9uK3w9BCohv4bn1xoHc=
X-Received: by 2002:a2e:87d0:: with SMTP id v16mr4116786ljj.24.1565165868639;
 Wed, 07 Aug 2019 01:17:48 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 7 Aug 2019 13:47:37 +0530
Message-ID: <CA+G9fYus+cW4775Y2_Xqpc+G6YP_KfjGeCMzoSQq6o2yVY8Q3w@mail.gmail.com>
Subject: next-20190806: arm64: adv7511 3-0039: failed to find dsi host
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans Verkuil <hans.verkuil@cisco.com>, mchehab@kernel.org,
        robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, agross@kernel.org,
        david.brown@linaro.org, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

arm64 devices dragonboard 410c (QC410E) and hi6220-hikey running Linux
next-20190806 loading modules causing floods of kernel messages.

We have enabled few extra kernel configs for testing.
CONFIG_DRM_I2C_ADV7511=m
CONFIG_DRM_I2C_ADV7511_CEC=y
...

Please find below boot log and config file link.

[    0.000000] Linux version 5.3.0-rc3-next-20190806 (oe-user@oe-host)
(gcc version 7.3.0 (GCC)) #1 SMP PREEMPT Tue Aug 6 05:49:36 UTC 2019
[    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
....
[   10.051193] adv7511 3-0039: 3-0039 supply dvdd not found, using
dummy regulator
[   10.051633] adv7511 3-0039: 3-0039 supply pvdd not found, using
dummy regulator
[   10.076257] adreno 1c00000.gpu: Adding to iommu group 0
[   10.090929] adv7511 3-0039: 3-0039 supply a2vdd not found, using
dummy regulator
[   10.101703] msm_mdp 1a01000.mdp: Adding to iommu group 1
[   10.102563] msm_mdp 1a01000.mdp: No interconnect support may cause
display underflows!
[   10.139492] adv7511 3-0039: failed to find dsi host
...
[   33.065744] adv7511 3-0039: failed to find dsi host
[   33.076721] msm 1a00000.mdss: 1a00000.mdss supply vdd not found,
using dummy regulator
[   33.078344] msm_mdp 1a01000.mdp: [drm:mdp5_bind [msm]] MDP5 version v1.6
[   33.083862] msm 1a00000.mdss: bound 1a01000.mdp (ops mdp5_ops [msm])
[   33.090892] msm_dsi 1a98000.dsi: 1a98000.dsi supply gdsc not found,
using dummy regulator
[   33.097756] msm_dsi 1a98000.dsi: 1a98000.dsi supply gdsc not found,
using dummy regulator
[   33.106606] msm_dsi_manager_register: failed to register mipi dsi
host for DSI 0
[   33.114579] msm 1a00000.mdss: failed to bind 1a98000.dsi (ops
dsi_ops [msm]): -517
[   33.121263] msm 1a00000.mdss: master bind failed: -517
[   33.135547] adv7511 3-0039: 3-0039 supply dvdd not found, using
dummy regulator
[   33.139360] adv7511 3-0039: 3-0039 supply pvdd not found, using
dummy regulator
[   33.143646] adv7511 3-0039: 3-0039 supply a2vdd not found, using
dummy regulator

Full test log
https://lkft.validation.linaro.org/scheduler/job/860208#L956

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: 958eb4327c1761c609bde8e9f7c04e9d1c6fbb96
  git describe: next-20190806
  make_kernelversion: 5.3.0-rc3
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/579/config
  kernel-defconfig:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/579/defconfig
  build-location:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/579

Best regards
Naresh Kamboju
