Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A802224B6D4
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 12:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729938AbgHTKmw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 06:42:52 -0400
Received: from www.linuxtv.org ([130.149.80.248]:44936 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730310AbgHTKmg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 06:42:36 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1k8hwE-00A5N6-Da; Thu, 20 Aug 2020 10:36:54 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1k8i4F-00078P-Io; Thu, 20 Aug 2020 10:45:11 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR 5.9] Dependency fixes (#20200820102447)
Date:   Thu, 20 Aug 2020 10:45:11 +0000
Message-Id: <20200820104511.27383-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200820102447.GE7145@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20200820102447.GE7145@valkosipuli.retiisi.org.uk/
Build log: https://builder.linuxtv.org/job/patchwork/64988/
Build time: 00:14:57
Link: https://lore.kernel.org/linux-media/20200820102447.GE7145@valkosipuli.retiisi.org.uk

gpg: Signature made Thu 20 Aug 2020 10:16:24 AM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: 4 patches and/or PDF generation with issues, being 2 at build time

Error/warnings:


Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/staging/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/staging/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/media:

Error #256 when running cat patches/0001-media-i2c-imx214-select-V4L2_FWNODE.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0001-media-i2c-imx214-select-V4L2_FWNODE.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:9: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 32a363d0b0b1 ("media: Kconfig files: use select for V4L2 subdevs and MC")'

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/staging/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/staging/media:

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/media:

