Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1C0F44DE44
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 00:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234194AbhKKXLs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 18:11:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:36584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229930AbhKKXLr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 18:11:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D81F61267;
        Thu, 11 Nov 2021 23:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636672137;
        bh=IuSRf52+xGpS7ITL3neRaDQfWkxf2trMWc8cpi21IYw=;
        h=From:To:Cc:Subject:Date:From;
        b=byWn65CoxRuUJkk7HDBAcNCVLheFYXikI92rcxm0JrmtQ4oFJe4jlT2QinfoZ4zG2
         HeXyqdup4rou+9ghO/vA32t17MFFKuRsJeoDdeTbs0Wz/k0HGa7OsvCsXLb+x7kg4g
         dSQhJ+kP0rueEoFp296coJ33IXIq+OcMvIPjRgUIGRcPlCY8bw+XohRsFzsby1K2eu
         fwRu6M7hgxDp0492AnEcObawOkMBnqjZEWzPK8/3rzQLT6OGqaQBoRGBpy3N8+cwOJ
         Co+FAiB751ffCslWr+ysJ5GOp2CpPM7o7Ick62zFexbEFMCncMHjYGvcugG6lpQS6c
         BiSIYqTZSFo2w==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mlJBe-000I75-1L; Thu, 11 Nov 2021 23:08:54 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, llvm@lists.linux.dev
Subject: [PATCH 0/3] Fix some W=1 clang Werror at staging/media
Date:   Thu, 11 Nov 2021 23:08:50 +0000
Message-Id: <cover.1636672052.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, there are three errors produced when building with clang
with CONFIG_WERROR and W=1. Address them.

Mauro Carvalho Chehab (3):
  media: ipu3: drop an unused variable
  media: atomisp-gc2235: drop an unused var
  media: atomisp: handle errors at sh_css_create_isp_params()

 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 8 +++++---
 drivers/staging/media/atomisp/pci/sh_css_params.c  | 4 ++++
 drivers/staging/media/ipu3/ipu3-css-params.c       | 3 ---
 3 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.33.1


