Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD3687DB5
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 17:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436567AbfHIPGS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 11:06:18 -0400
Received: from www.linuxtv.org ([130.149.80.248]:54229 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbfHIPGS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Aug 2019 11:06:18 -0400
Received: from 140-211-167-10-openstack.osuosl.org ([140.211.167.10] helo=builder.linuxtv.org)
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hw6T4-0007nT-Fh; Fri, 09 Aug 2019 15:06:10 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hw6T2-0004c9-V8; Fri, 09 Aug 2019 15:06:09 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>, mchehab+samsung@kernel.org,
        linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.4] Various fixes.enhancements
Date:   Fri,  9 Aug 2019 15:06:08 +0000
Message-Id: <20190809150608.17695-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <d1d8c63c-c346-9a4b-fea9-27c46a648667@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/58048/
Build log: https://builder.linuxtv.org/job/patchwork/5076/
Build time: 00:04:29
Link: https://lore.kernel.org/linux-media/r/d1d8c63c-c346-9a4b-fea9-27c46a648667@xs4all.nl
Summary: 2 issues, being 0 build regressions

Error/warnings:

patches/0002-omap_vout-convert-to-vb2.patch:148: WARNING: line over 80 characters
patches/0002-omap_vout-convert-to-vb2.patch:171: WARNING: line over 80 characters
patches/0002-omap_vout-convert-to-vb2.patch:186: WARNING: line over 80 characters
patches/0002-omap_vout-convert-to-vb2.patch:731: WARNING: line over 80 characters
patches/0002-omap_vout-convert-to-vb2.patch:781: WARNING: line over 80 characters
patches/0002-omap_vout-convert-to-vb2.patch:891: WARNING: line over 80 characters
patches/0002-omap_vout-convert-to-vb2.patch:948: WARNING: line over 80 characters
patches/0002-omap_vout-convert-to-vb2.patch:1034: WARNING: line over 80 characters
patches/0002-omap_vout-convert-to-vb2.patch:1243: WARNING: line over 80 characters
patches/0002-omap_vout-convert-to-vb2.patch:1363: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-omap_vout-convert-to-vb2.patch
patches/0005-Revert-media-vimc-propagate-pixel-format-in-the-stre.patch:541: CHECK: Logical continuations should be on the previous line

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-Revert-media-vimc-propagate-pixel-format-in-the-stre.patch

