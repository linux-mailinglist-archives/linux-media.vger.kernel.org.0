Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B627D1096
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 15:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731254AbfJINwI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 09:52:08 -0400
Received: from www.linuxtv.org ([130.149.80.248]:53591 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729883AbfJINwI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Oct 2019 09:52:08 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iICNm-0007Qv-MY; Wed, 09 Oct 2019 13:52:02 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iICOC-0003HT-0G; Wed, 09 Oct 2019 13:52:28 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] Various fixes/enhancements
Date:   Wed,  9 Oct 2019 13:52:27 +0000
Message-Id: <20191009135227.12570-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <5ebf6d7f-8a1d-8665-fe72-78df3849ae5b@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59364/
Build log: https://builder.linuxtv.org/job/patchwork/19674/
Build time: 00:12:16
Link: https://lore.kernel.org/linux-media/5ebf6d7f-8a1d-8665-fe72-78df3849ae5b@xs4all.nl

gpg: Signature made Wed 09 Oct 2019 01:34:31 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-cx88-Add-support-for-NotOnlyTV-LV3H-card.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-cx88-Add-support-for-NotOnlyTV-LV3H-card.patch
patches/0004-media-cx88-Add-support-for-NotOnlyTV-LV3H-card.patch:96: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-staging-media-imx-Use-devm_platform_ioremap_resource.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-staging-media-imx-Use-devm_platform_ioremap_resource.patch
patches/0009-staging-media-imx-Use-devm_platform_ioremap_resource.patch:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0013-media-usbvision-Fix-invalid-accesses-after-device-di.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0013-media-usbvision-Fix-invalid-accesses-after-device-di.patch
patches/0013-media-usbvision-Fix-invalid-accesses-after-device-di.patch:23: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

