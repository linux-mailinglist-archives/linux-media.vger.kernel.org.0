Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E16B1D3FB0
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 23:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbgENVJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 17:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727777AbgENVJk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 17:09:40 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA8C8C061A0C;
        Thu, 14 May 2020 14:09:38 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id g4so5126132ljl.2;
        Thu, 14 May 2020 14:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U4VmfW4FL3g5XlbJ7YpirLFQQt9NUcslAtYnzd5so8s=;
        b=XlpwXMaxIZrQx6uVHwjc8KYucE0BHnbabhp3Vbk8ETeCpw9au5E/dyBe9A8yLyZ1FX
         PZPzK/ONNPTrgflbkIxAuLEDAwlJNiRFL2vrsSX8Bj0vUBdwCSHZAPOlVtn0gDf0Ghyf
         s5FSDiIRqJMoRzQdsKm8F7lvcIS81hYAHc2yM89523fj46Vgah7b8+++l7TH8i5jqACT
         sEAJjKdxIna17nNR6/JufmbRDcuZX7eXgiphG6vfR2j+FJJA0qwpmiyyFUOvcYjEqMsJ
         los5PhxSwrUn5CfV9EWNbo4h4UCOh4epva+BB7mimfcpcJTTqX/XvMv8gszBDqFdswfv
         KNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U4VmfW4FL3g5XlbJ7YpirLFQQt9NUcslAtYnzd5so8s=;
        b=RVTtw232RzxvREV1CU+/OBWBwQreOYdexhMvpwrZWWMV9T7j13C+JQ6IC5MmtbiqZ5
         Ri4rtgTL8ACPrGbA+J7xUOjkREnl/gKnpxREBDA9gTtYw7QsDS+LviRnmechs6YDb7V7
         mm4gKs0Pg/3t4ZPmEAsKRDZRGcBI8k6bHLkcKmvbVZisI5QWzMGMX4czDoGTq1MGYzIw
         Vo5LFZLOKjJynJwrSnb71wtAq99g8lAedIApHXFOciH4BVFeT1uBpyxTs2abACsoDKue
         4k3t1fSdpO4kQWq5FmE5EFHc7bJDhsLJxriaW6mf4Gh0yg+2o8oKOujku+cGlYtNRJfZ
         SnsQ==
X-Gm-Message-State: AOAM531fwRbaeQhS62iIYtTI5RVEPsL3Yqpkifb+gbaHa16IuM3OSdJj
        Q4Ux4L3h4AaW61dY6jxmrqZG8zxX
X-Google-Smtp-Source: ABdhPJxSu9RwEUcnZ2Al2WFZnV8j+ZHOUSmmA55/vTsjJWZ6zbbqPO/J3cRtjZiXADCgceXZ5vZwbw==
X-Received: by 2002:a2e:8296:: with SMTP id y22mr124092ljg.194.1589490577063;
        Thu, 14 May 2020 14:09:37 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id g3sm45215ljk.27.2020.05.14.14.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:09:36 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] Tegra Video Decoder driver power management corrections
Date:   Fri, 15 May 2020 00:08:43 +0300
Message-Id: <20200514210847.9269-1-digetx@gmail.com>
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

