Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45090164273
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 11:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgBSKnM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 05:43:12 -0500
Received: from www.linuxtv.org ([130.149.80.248]:46654 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbgBSKnM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 05:43:12 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j4MnN-002hv1-PI; Wed, 19 Feb 2020 10:41:33 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j4MqI-00012x-8Q; Wed, 19 Feb 2020 10:44:34 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.7] Smiapp driver cleanups, omap3isp fix
Date:   Wed, 19 Feb 2020 10:44:34 +0000
Message-Id: <20200219104434.3982-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200219103006.GD5023@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61722/
Build log: https://builder.linuxtv.org/job/patchwork/38795/
Build time: 00:04:25
Link: https://lore.kernel.org/linux-media/20200219103006.GD5023@valkosipuli.retiisi.org.uk

gpg: Signature made Wed 19 Feb 2020 10:24:28 AM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-smiapp-Turn-limit-lookup-into-a-function.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-smiapp-Turn-limit-lookup-into-a-function.patch
patches/0004-smiapp-Turn-limit-lookup-into-a-function.patch:24: CHECK: Alignment should match open parenthesis
patches/0004-smiapp-Turn-limit-lookup-into-a-function.patch:84: WARNING: line over 80 characters
patches/0004-smiapp-Turn-limit-lookup-into-a-function.patch:85: WARNING: line over 80 characters
patches/0004-smiapp-Turn-limit-lookup-into-a-function.patch:86: WARNING: line over 80 characters
patches/0004-smiapp-Turn-limit-lookup-into-a-function.patch:87: WARNING: line over 80 characters
patches/0004-smiapp-Turn-limit-lookup-into-a-function.patch:93: WARNING: line over 80 characters
patches/0004-smiapp-Turn-limit-lookup-into-a-function.patch:94: WARNING: line over 80 characters
patches/0004-smiapp-Turn-limit-lookup-into-a-function.patch:95: WARNING: line over 80 characters
patches/0004-smiapp-Turn-limit-lookup-into-a-function.patch:96: WARNING: line over 80 characters
patches/0004-smiapp-Turn-limit-lookup-into-a-function.patch:98: WARNING: line over 80 characters
patches/0004-smiapp-Turn-limit-lookup-into-a-function.patch:331: CHECK: Logical continuations should be on the previous line
patches/0004-smiapp-Turn-limit-lookup-into-a-function.patch:340: CHECK: Logical continuations should be on the previous line

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-smiapp-Move-SMIA-limit-reading-up.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-smiapp-Move-SMIA-limit-reading-up.patch
patches/0005-smiapp-Move-SMIA-limit-reading-up.patch:31: CHECK: Lines should not end with a '('

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-smiapp-Move-definitions-under-driver-directory.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-smiapp-Move-definitions-under-driver-directory.patch
patches/0007-smiapp-Move-definitions-under-driver-directory.patch:82: CHECK: Prefer kernel type 'u32' over 'uint32_t'
patches/0007-smiapp-Move-definitions-under-driver-directory.patch:85: CHECK: Prefer kernel type 'u32' over 'uint32_t'
patches/0007-smiapp-Move-definitions-under-driver-directory.patch:86: CHECK: Prefer kernel type 'u64' over 'uint64_t'
patches/0007-smiapp-Move-definitions-under-driver-directory.patch:97: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

