Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 251801F094B
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2020 03:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbgFGBxO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Jun 2020 21:53:14 -0400
Received: from www.linuxtv.org ([130.149.80.248]:53286 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728883AbgFGBxO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Jun 2020 21:53:14 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jhkR2-002zYk-Tz; Sun, 07 Jun 2020 01:49:16 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jhkWw-0006qW-5w; Sun, 07 Jun 2020 01:55:22 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.9] Xilinx CSI-2 RX subsystem (#64347)
Date:   Sun,  7 Jun 2020 01:55:22 +0000
Message-Id: <20200607015522.26275-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200607013904.GA21888@pendragon.ideasonboard.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/64347/
Build log: https://builder.linuxtv.org/job/patchwork/54297/
Build time: 00:05:07
Link: https://lore.kernel.org/linux-media/20200607013904.GA21888@pendragon.ideasonboard.com

gpg: Signature made Sun 07 Jun 2020 01:34:51 AM UTC
gpg:                using RSA key BD94648A8E47ECEDBF199B1862255D299E280B24
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Good signature from "Laurent Pinchart <laurent.pinchart@ideasonboard.com>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0001-media-dt-bindings-media-xilinx-Add-Xilinx-MIPI-CSI-2.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0001-media-dt-bindings-media-xilinx-Add-Xilinx-MIPI-CSI-2.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:25: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running cat patches/0002-media-v4l-xilinx-Add-Xilinx-MIPI-CSI-2-Rx-Subsystem-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0002-media-v4l-xilinx-Add-Xilinx-MIPI-CSI-2-Rx-Subsystem-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:42: WARNING: please write a paragraph that describes the config symbol fully
-:64: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

