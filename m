Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5D4ADE560
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 09:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfJUHfW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 03:35:22 -0400
Received: from www.linuxtv.org ([130.149.80.248]:53537 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbfJUHfW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 03:35:22 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iMSDk-0001rW-P7; Mon, 21 Oct 2019 07:35:16 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iMSEE-0001kL-Kd; Mon, 21 Oct 2019 07:35:46 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.5] Sensor and lens driver patches
Date:   Mon, 21 Oct 2019 07:35:46 +0000
Message-Id: <20191021073546.6672-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021071539.GB864@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59574/
Build log: https://builder.linuxtv.org/job/patchwork/21362/
Build time: 00:15:34
Link: https://lore.kernel.org/linux-media/20191021071539.GB864@valkosipuli.retiisi.org.uk

gpg: Signature made Mon 21 Oct 2019 07:04:11 AM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0016-media-ad5820-Add-support-for-ad5821-and-ad5823.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0016-media-ad5820-Add-support-for-ad5821-and-ad5823.patch
patches/0016-media-ad5820-Add-support-for-ad5821-and-ad5823.patch:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0017-media-i2c-ov5695-Fix-randbuild-error.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0017-media-i2c-ov5695-Fix-randbuild-error.patch
patches/0017-media-i2c-ov5695-Fix-randbuild-error.patch:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0019-media-i2c-Add-IMX290-CMOS-image-sensor-driver.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0019-media-i2c-Add-IMX290-CMOS-image-sensor-driver.patch
patches/0019-media-i2c-Add-IMX290-CMOS-image-sensor-driver.patch:54: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0019-media-i2c-Add-IMX290-CMOS-image-sensor-driver.patch:131: CHECK: struct mutex definition without comment
patches/0019-media-i2c-Add-IMX290-CMOS-image-sensor-driver.patch:377: WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
patches/0019-media-i2c-Add-IMX290-CMOS-image-sensor-driver.patch:568: CHECK: Lines should not end with a '('
patches/0019-media-i2c-Add-IMX290-CMOS-image-sensor-driver.patch:590: CHECK: Lines should not end with a '('

