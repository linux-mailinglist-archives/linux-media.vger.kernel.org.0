Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E481B739F
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 14:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgDXMK4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 08:10:56 -0400
Received: from www.linuxtv.org ([130.149.80.248]:54574 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726698AbgDXMKz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 08:10:55 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jRx7T-00EckG-Ad; Fri, 24 Apr 2020 12:07:47 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jRxCG-00016h-Sf; Fri, 24 Apr 2020 12:12:44 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.8] Add Tegra210 Video input driver (#63360)
Date:   Fri, 24 Apr 2020 12:12:44 +0000
Message-Id: <20200424121244.4214-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <506a8f62-f56a-9974-b419-a27e653dca16@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/63360/
Build log: https://builder.linuxtv.org/job/patchwork/48044/
Build time: 00:02:18
Link: https://lore.kernel.org/linux-media/506a8f62-f56a-9974-b419-a27e653dca16@xs4all.nl

gpg: Signature made Fri 24 Apr 2020 11:53:45 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-tegra-Add-Tegra210-Video-input-driver.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-tegra-Add-Tegra210-Video-input-driver.patch
patches/0001-media-tegra-Add-Tegra210-Video-input-driver.patch:80: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0001-media-tegra-Add-Tegra210-Video-input-driver.patch:980: WARNING: DT compatible string "nvidia,tegra210-csi" appears un-documented -- check ./Documentation/devicetree/bindings/
patches/0001-media-tegra-Add-Tegra210-Video-input-driver.patch:3383: WARNING: DT compatible string "nvidia,tegra210-csi" appears un-documented -- check ./Documentation/devicetree/bindings/

