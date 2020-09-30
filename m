Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9B527DEAF
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 05:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729786AbgI3DAE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 23:00:04 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:4218 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729446AbgI3DAD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 23:00:03 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f73f44e0002>; Tue, 29 Sep 2020 19:58:22 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Sep
 2020 03:00:02 +0000
Received: from skomatineni-linux.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 30 Sep 2020 03:00:02 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
Subject: [PATCH v1 0/2] Allow building Tegra video driver with COMPILE_TEST
Date:   Tue, 29 Sep 2020 20:02:36 -0700
Message-ID: <1601434958-29305-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601434702; bh=1nqr4ua6fcvL3/8a5eNm1SxuTO2CagaFTIPMzrgRzIU=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
         MIME-Version:Content-Type;
        b=OA+S7Bz99oAUP1W4RSA4rm04dSnO1ZYsNukV/Sdf7T0N5Cfq8fFT81x4AP0I6khUv
         kdATBkrRQf0TDr0CtvlytiUZQfKj+17MKifgG9lOkkYNKOrqqv/wekMa6Xb//Ai0Zu
         tQlvVpqmcE4++srxiSK2dWBvfRKpTP1jbSL/aDRSsThDaVAeGJTsxb8EasmB+cw9H2
         dcdtVyh3dOeST4eZkT/yrYf+tdBHzMCJeJfCmFDDNFok1DjspausWcHC2mF0lMNmzr
         1wvQxv0KNKtjXVJeO7xXuGToU3uQ6dwYziwAwL3hhp4F2GZbfEXkH1L4RJ2qjAQan3
         8VUmdpXgAMrzw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series enables COMPILE_TEST for Tegra video driver.

Tegra video driver has dependency on host1x driver. So this series also
includes a patch to allow building host1x driver with COMPILE_TEST for
all platforms.

Sowjanya Komatineni (2):
  gpu: host1x: Allow COMPILE_TEST to build host1x driver on all
    platforms
  media: tegra-video: Allow building driver with COMPILE_TEST

 drivers/gpu/host1x/Kconfig                | 2 +-
 drivers/staging/media/tegra-video/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4

