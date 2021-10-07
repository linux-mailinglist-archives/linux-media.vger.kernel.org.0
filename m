Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B56424C09
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 05:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239992AbhJGDFl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 23:05:41 -0400
Received: from www.linuxtv.org ([130.149.80.248]:45416 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232360AbhJGDFj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Oct 2021 23:05:39 -0400
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mYJhB-008bQE-Op; Thu, 07 Oct 2021 03:03:45 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mYJh9-00G8kB-DZ; Thu, 07 Oct 2021 03:03:43 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.16] Misc improvements to omap_vout and rcar vsp1 (#77523)
Date:   Thu,  7 Oct 2021 03:03:43 +0000
Message-Id: <20211007030343.3846813-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YV5d9G1zp9fPyRPm@pendragon.ideasonboard.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YV5d9G1zp9fPyRPm@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/145793/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/YV5d9G1zp9fPyRPm@pendragon.ideasonboard.com

gpg: Signature made Thu 07 Oct 2021 02:29:58 AM UTC
gpg:                using RSA key CB9D6877529820CD53099B1B65F89C37BC54210D
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Can't check signature: No public key


Build aborted due to a fatal error:
FAILED: patch patch patches/0004-media-omap_vout-use-dma_addr_t-consistently.patch doesn't apply:
Applying patch patches/0004-media-omap_vout-use-dma_addr_t-consistently.patch
patching file drivers/media/platform/omap/omap_vout.c
Hunk #1 FAILED at 277.
Hunk #2 FAILED at 352.
Hunk #3 FAILED at 479.
Hunk #4 FAILED at 543.
Hunk #5 FAILED at 976.
Hunk #6 FAILED at 995.
Hunk #7 FAILED at 1018.
Hunk #8 FAILED at 1476.
8 out of 8 hunks FAILED -- rejects in file drivers/media/platform/omap/omap_vout.c
patching file drivers/media/platform/omap/omap_vout_vrfb.c
Hunk #1 FAILED at 305.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/omap/omap_vout_vrfb.c
patching file drivers/media/platform/omap/omap_voutdef.h
Hunk #1 FAILED at 170.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/omap/omap_voutdef.h
Patch patches/0004-media-omap_vout-use-dma_addr_t-consistently.patch can be reverse-applied

