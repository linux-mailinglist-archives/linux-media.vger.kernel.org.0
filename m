Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 080B1DE570
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 09:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbfJUHlA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 03:41:00 -0400
Received: from www.linuxtv.org ([130.149.80.248]:53773 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727478AbfJUHk7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 03:40:59 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iMSJE-0002B5-3l; Mon, 21 Oct 2019 07:40:56 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iMSJi-0003iZ-GR; Mon, 21 Oct 2019 07:41:26 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.5] SMIA patches for 5.5
Date:   Mon, 21 Oct 2019 07:41:26 +0000
Message-Id: <20191021074126.14250-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021072359.GC864@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59575/
Build log: https://builder.linuxtv.org/job/patchwork/21363/
Build time: 00:05:26
Link: https://lore.kernel.org/linux-media/20191021072359.GC864@valkosipuli.retiisi.org.uk

gpg: Signature made Mon 21 Oct 2019 07:18:55 AM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: 4 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-smiapp-Refactor-reading-NVM-page.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-smiapp-Refactor-reading-NVM-page.patch
patches/0003-smiapp-Refactor-reading-NVM-page.patch:47: CHECK: Lines should not end with a '('

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-smiapp-Don-t-poll-for-NVM-ready-on-devices-that-don-.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-smiapp-Don-t-poll-for-NVM-ready-on-devices-that-don-.patch
patches/0005-smiapp-Don-t-poll-for-NVM-ready-on-devices-that-don-.patch:32: CHECK: Lines should not end with a '('
patches/0005-smiapp-Don-t-poll-for-NVM-ready-on-devices-that-don-.patch:47: CHECK: Blank lines aren't necessary before a close brace '}'

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-smiapp-Move-binning-configuration-to-streaming-start.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-smiapp-Move-binning-configuration-to-streaming-start.patch
patches/0010-smiapp-Move-binning-configuration-to-streaming-start.patch:69: CHECK: Lines should not end with a '('

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0012-smiapp-Use-non-binned-and-binned-limits-correctly.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0012-smiapp-Use-non-binned-and-binned-limits-correctly.patch
patches/0012-smiapp-Use-non-binned-and-binned-limits-correctly.patch:22: CHECK: Prefer kernel type 'u16' over 'uint16_t'
patches/0012-smiapp-Use-non-binned-and-binned-limits-correctly.patch:26: WARNING: line over 80 characters
patches/0012-smiapp-Use-non-binned-and-binned-limits-correctly.patch:27: WARNING: line over 80 characters
patches/0012-smiapp-Use-non-binned-and-binned-limits-correctly.patch:30: WARNING: line over 80 characters

