Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1483511FA55
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 19:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfLOSJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 13:09:30 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34558 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfLOSJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 13:09:30 -0500
Received: by mail-lj1-f196.google.com with SMTP id m6so4251812ljc.1;
        Sun, 15 Dec 2019 10:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6BwnLgIw1O6Pl9DGM8GPZ2MRa8LW0r8gaeFDwLz4cXY=;
        b=Bipom6FUC0WO3TCqvzVyO12ZkoPXYR/rXIPD3qGKXxWhqDR3zF/bPgqWf5ivb0Ivdy
         fUjjMP9/DSFCZRptRknJoupOgk+MpqJYJK9bl7Kxc/+h78uhAiPS9wctOZBk+uW75su8
         WwPUXrh4VI9NKsRn5zm5lA7yILGTNtWQV7d0IudazRL6qZU1rqocy7TKwwpa2Fa3ezO4
         Dk+iPMAwhXuAGQvWzI3pa3iJKHKp5yKAZWlcbfbk+g8Axk/843n7tK5MsC42mshuoob9
         j/s7mD8XMIyOXNufpQ77/lzWcFsC2T3crt7Fk/DG60XN113q8pixbjtlo+7hV+sUoE8J
         On8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6BwnLgIw1O6Pl9DGM8GPZ2MRa8LW0r8gaeFDwLz4cXY=;
        b=si/W6NlZoVegOXwqX8/NqdBBTnaZIFxfLxNHT1Q6pZkwUK9eb2rqgVEsLNcv9hyeby
         iFddpXxFIqvrNsfczVfMeVHp8d8xbz/RasckzBkpdrrSHJ4MHOaJ1WrONNTvoibimWJp
         HXkWG/WWQ/yv78xy1Veg4PNr8mMEwKt/UqiiEa+ecjdBMnbjR614RSNjhy005BP3pkNK
         f4UFko5PPG3/AFCQrekQo4mUSSl2RZAiR88WFqCAP4blSOl8DMPqjmAXkvbkWiDpJufD
         cF5VYEnMrZLOgPPhtGmfvF0duROLJ4O6qiZi9dxjFO69EV20MVGfS9jQ+wzg+/soF5BG
         D5hg==
X-Gm-Message-State: APjAAAURZdHC2sKKzGmTDmgaGz086u+zkFsnzv5Kj0JZCRpljjtf5ySV
        GpSuN+Y0U4g2yY3VvYecdH0=
X-Google-Smtp-Source: APXvYqzBE614d51TKdCJodABHNuKxNyNlbBjrp69WJZ5wESzrJnGB5fpNG1iDS6jv04Zq0cO+bASSg==
X-Received: by 2002:a2e:99cd:: with SMTP id l13mr16798134ljj.243.1576433367539;
        Sun, 15 Dec 2019 10:09:27 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id t27sm8871875ljd.26.2019.12.15.10.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 10:09:26 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] Tegra VDE: Minor code clean up
Date:   Sun, 15 Dec 2019 21:07:49 +0300
Message-Id: <20191215180752.5408-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small series just makes a minor clean up of the driver's code,
addressing COMPILE_TEST build problem that was reported sometime ago.

Dmitry Osipenko (3):
  media: staging: tegra-vde: Select IOVA unconditionally in Kconfig
  media: staging: tegra-vde: Sort headers alphabetically
  media: staging: tegra-vde: Use __maybe_unused attribute instead of
    ifdef

 drivers/staging/media/tegra-vde/Kconfig | 2 +-
 drivers/staging/media/tegra-vde/vde.c   | 6 ++----
 drivers/staging/media/tegra-vde/vde.h   | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

-- 
2.24.0

