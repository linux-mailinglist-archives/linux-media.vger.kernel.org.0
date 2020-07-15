Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23B8E221827
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 00:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgGOWzO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 18:55:14 -0400
Received: from www.linuxtv.org ([130.149.80.248]:32854 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726765AbgGOWzO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 18:55:14 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jvqE8-00GaQQ-0C; Wed, 15 Jul 2020 22:50:12 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jvqLF-0007dg-Q0; Wed, 15 Jul 2020 22:57:33 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.9] Camera sensor + V4L2 async patches (#20200715222030)
Date:   Wed, 15 Jul 2020 22:57:33 +0000
Message-Id: <20200715225733.29322-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200715222030.GG836@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20200715222030.GG836@valkosipuli.retiisi.org.uk/
Build log: https://builder.linuxtv.org/job/patchwork/59881/
Build time: 00:27:22
Link: https://lore.kernel.org/linux-media/20200715222030.GG836@valkosipuli.retiisi.org.uk

gpg: Signature made Wed 15 Jul 2020 09:45:19 PM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: 5 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0004-dt-bindings-media-i2c-Add-bindings-for-Maxim-Integra.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0004-dt-bindings-media-i2c-Add-bindings-for-Maxim-Integra.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:26: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running cat patches/0005-media-i2c-Add-MAX9286-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0005-media-i2c-Add-MAX9286-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:133: CHECK: Prefer using the BIT macro
-:138: CHECK: Prefer using the BIT macro
-:149: CHECK: Prefer using the BIT macro
-:155: CHECK: Prefer using the BIT macro
-:173: CHECK: Prefer using the BIT macro
-:191: CHECK: Prefer using the BIT macro
-:199: CHECK: Prefer using the BIT macro
-:203: CHECK: Prefer using the BIT macro
-:286: CHECK: Macro argument reuse 'source' - possible side-effects?
-:1259: CHECK: Lines should not end with a '('
-:1285: CHECK: Lines should not end with a '('

Error #256 when running cat patches/0006-dt-bindings-media-i2c-Add-bindings-for-IMI-RDACM2x.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0006-dt-bindings-media-i2c-Add-bindings-for-IMI-RDACM2x.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:24: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running cat patches/0007-media-i2c-Add-RDACM20-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0007-media-i2c-Add-RDACM20-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:51: WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic order
-:463: CHECK: Prefer using the BIT macro
-:478: CHECK: Prefer using the BIT macro
-:489: CHECK: Prefer using the BIT macro
-:502: CHECK: Prefer using the BIT macro
-:510: CHECK: Prefer using the BIT macro
-:514: CHECK: Prefer using the BIT macro

