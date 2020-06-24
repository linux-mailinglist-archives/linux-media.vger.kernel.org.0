Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E259D2076CE
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 17:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404153AbgFXPI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 11:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390817AbgFXPI6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 11:08:58 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68613C061573;
        Wed, 24 Jun 2020 08:08:57 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q19so2963585lji.2;
        Wed, 24 Jun 2020 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OJu1Q0OHeIZeVEh+ckAdP5ZEp1YytGAeyJAi+Zqho8o=;
        b=TDWmm+sfBmEAHIhAD02JMvmJrggOBK77LVf6ttg1uMpkQdgH3FO0cT95zb8WwaQwTY
         x4wH+pcwf/tAQ0xOXg46gDjlozBqMfiBYY/iEnoMLwd4w6UJYHCr6z8eL1d9W+y6e85k
         5qg1ferl6r/GRDevW4sjloXzJI5ewMwM+QlytNusMfAIQB0CEdmYp0G7KOzSW5Ed0FXT
         IWW1Qwb5EDhWKq0M+ZTh9ppYeDK+xIyumu4u1GfUqXzvVtu+6xGAWEVvFZIiiHe2AyQ6
         FTX8AS2PiEMgI+c9BFDDXyeU/auyjMNU8oN2KqRZ6ihAGdiGrPZhYB7zPxxT+NBGpIum
         mQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OJu1Q0OHeIZeVEh+ckAdP5ZEp1YytGAeyJAi+Zqho8o=;
        b=oMQ7PiKgbjujSRTMKrSAscpxT78vBnxp+z3q086qszlsTerDO6vjrLA8sQJX3cLv79
         xO5ZSU4u3I5IQTJ86wKSRMKUsLaYfcH7so3qXfN5AQ5bSIY1P0WjyUvTcbvoWce3g+Uq
         myuaS1EGieUAowTzUFifPzSM3b+QOOE2lQH0lKXLr7WubYSiV1umZ4ip2JvDPqPat0+m
         1aRyVn2Zze/RQP1NIyOJGl6f+u0fsj967sBgU7PIwBPMoznOBpujWWhSAhoR0WFPSZhe
         J0G1UPr0dMmb+aU3opFy90t0Sf0WGnycvCtifuqqAkwKgfC6dJ1ypx0MMXl+tRtFUMCD
         hP8Q==
X-Gm-Message-State: AOAM531dhU5+YtdhCIOPaG8eIHtVDtcYoBOPcHp28k0mK6e6Glg4dwxb
        zekzPVsE8ypGEsfW7BMXv5Y=
X-Google-Smtp-Source: ABdhPJziT+8B80my7R9pbnPEEhLTjHgFhdsFgVB2yEpHxvGMDM9iqS0l4bcw31+Nyzs3kOiL43/4rg==
X-Received: by 2002:a2e:4b12:: with SMTP id y18mr12711346lja.117.1593011335949;
        Wed, 24 Jun 2020 08:08:55 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id z1sm4182049lja.47.2020.06.24.08.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:08:55 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Tegra Video Decoder driver power management corrections
Date:   Wed, 24 Jun 2020 18:08:43 +0300
Message-Id: <20200624150847.22672-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small series addresses a Runtime PM issue that was discovered during
of Tegra VI driver reviewing by balancing RPM usage count on RPM resume
failure. Secondly it fixes reboot on some Tegra devices due to bootloader
expecting VDE power partition to be ON at the boot time, which wasn't
happening in case of a warm re-booting (i.e. by PMC resetting).

Changelog:

v2: - Extended the commit's message of the "Balance runtime PM use-count on
      resume failure" patch.

    - Re-send for 5.9 inclusion.

Dmitry Osipenko (4):
  media: staging: tegra-vde: Balance runtime PM use-count on resume
    failure
  media: staging: tegra-vde: Runtime PM is always available on Tegra
  media: staging: tegra-vde: Turn ON power domain on shutdown
  media: staging: tegra-vde: Power-cycle hardware on probe

 drivers/staging/media/tegra-vde/vde.c | 45 +++++++++++++++++----------
 1 file changed, 29 insertions(+), 16 deletions(-)

-- 
2.26.0

