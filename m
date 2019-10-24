Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC3CE2B7B
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 09:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408751AbfJXHwQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 03:52:16 -0400
Received: from www.linuxtv.org ([130.149.80.248]:42670 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404960AbfJXHwP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 03:52:15 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iNXuh-0000Sb-00; Thu, 24 Oct 2019 07:52:07 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iNXvC-00053Y-8Z; Thu, 24 Oct 2019 07:52:38 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] Add AllWinner deinterlace driver
Date:   Thu, 24 Oct 2019 07:52:38 +0000
Message-Id: <20191024075238.19395-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <53668630-da7b-fc23-dd05-275234d7a0d3@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59618/
Build log: https://builder.linuxtv.org/job/patchwork/21797/
Build time: 00:02:27
Link: https://lore.kernel.org/linux-media/53668630-da7b-fc23-dd05-275234d7a0d3@xs4all.nl

gpg: Signature made Thu 24 Oct 2019 07:31:02 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-dt-bindings-media-Add-Allwinner-H3-Deinterlace-bindi.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-dt-bindings-media-Add-Allwinner-H3-Deinterlace-bindi.patch
patches/0001-dt-bindings-media-Add-Allwinner-H3-Deinterlace-bindi.patch:19: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-sun4i-Add-H3-deinterlace-driver.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-sun4i-Add-H3-deinterlace-driver.patch
patches/0002-media-sun4i-Add-H3-deinterlace-driver.patch:68: WARNING: please write a paragraph that describes the config symbol fully
patches/0002-media-sun4i-Add-H3-deinterlace-driver.patch:1222: CHECK: Prefer using the BIT macro

