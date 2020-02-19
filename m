Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C59916422C
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 11:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgBSKba (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 05:31:30 -0500
Received: from www.linuxtv.org ([130.149.80.248]:45582 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbgBSKba (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 05:31:30 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j4Mc3-002hG7-4x; Wed, 19 Feb 2020 10:29:51 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j4Mex-0004CB-11; Wed, 19 Feb 2020 10:32:51 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.7] Sensor driver patches
Date:   Wed, 19 Feb 2020 10:32:50 +0000
Message-Id: <20200219103250.16086-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200219102657.GC5023@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61721/
Build log: https://builder.linuxtv.org/job/patchwork/38794/
Build time: 00:02:42
Link: https://lore.kernel.org/linux-media/20200219102657.GC5023@valkosipuli.retiisi.org.uk

gpg: Signature made Wed 19 Feb 2020 10:19:55 AM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-i2c-Add-driver-for-Sony-IMX219-sensor.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-i2c-Add-driver-for-Sony-IMX219-sensor.patch
patches/0004-media-i2c-Add-driver-for-Sony-IMX219-sensor.patch:60: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-MAINTAINERS-Sort-entries-in-database-for-TI-VPE-CAL.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-MAINTAINERS-Sort-entries-in-database-for-TI-VPE-CAL.patch
patches/0006-MAINTAINERS-Sort-entries-in-database-for-TI-VPE-CAL.patch:12: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

