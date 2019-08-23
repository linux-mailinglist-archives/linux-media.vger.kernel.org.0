Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1376F9A915
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 09:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389149AbfHWHpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 03:45:10 -0400
Received: from www.linuxtv.org ([130.149.80.248]:41372 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388503AbfHWHpK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 03:45:10 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1i14Fs-00045e-0k; Fri, 23 Aug 2019 07:45:04 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1i14Fw-0004YH-GB; Fri, 23 Aug 2019 07:45:08 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.4] A10 CSI driver and atmel-isi fix
Date:   Fri, 23 Aug 2019 07:45:08 +0000
Message-Id: <20190823074508.17456-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190823073109.GR3504@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/58382/
Build log: https://builder.linuxtv.org/job/patchwork/12895/
Build time: 00:04:55
Link: https://lore.kernel.org/linux-media/20190823073109.GR3504@valkosipuli.retiisi.org.uk

gpg: Signature made Fri 23 Aug 2019 07:25:49 AM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:

patches/0003-media-sunxi-Refactor-the-Makefile-and-Kconfig.patch:46: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-sunxi-Refactor-the-Makefile-and-Kconfig.patch
patches/0004-media-sunxi-Add-A10-CSI-driver.patch:564: CHECK: spinlock_t definition without comment

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-sunxi-Add-A10-CSI-driver.patch

