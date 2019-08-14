Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4DA8D2BD
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 14:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfHNMJE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 08:09:04 -0400
Received: from www.linuxtv.org ([130.149.80.248]:57510 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726121AbfHNMJE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 08:09:04 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hxs5D-00046j-NK; Wed, 14 Aug 2019 12:08:51 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hxs5E-0005pN-9p; Wed, 14 Aug 2019 12:08:52 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>, mchehab+samsung@kernel.org,
        linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v2 for 5.4] More sensor driver, omap3isp and documentation
Date:   Wed, 14 Aug 2019 12:08:44 +0000
Message-Id: <20190814120844.22361-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814103251.GA3504@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/58128/
Build log: https://builder.linuxtv.org/job/patchwork/8485/
Build time: 00:09:49
Link: https://lore.kernel.org/linux-media/20190814103251.GA3504@valkosipuli.retiisi.org.uk
Summary: 3 issues, being 0 at build time

gpg: Signature made Wed 14 Aug 2019 10:10:12 AM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F0D0 377A 0D4F 25A7 9238  EFE5 6D40 361B 6E28 C193


Error/warnings:

patches/0001-ov5675-Add-support-for-OV5675-sensor.patch:660: CHECK: Alignment should match open parenthesis
patches/0001-ov5675-Add-support-for-OV5675-sensor.patch:709: CHECK: spaces preferred around that '/' (ctx:VxV)
patches/0001-ov5675-Add-support-for-OV5675-sensor.patch:774: CHECK: Alignment should match open parenthesis
patches/0001-ov5675-Add-support-for-OV5675-sensor.patch:781: CHECK: Alignment should match open parenthesis
patches/0001-ov5675-Add-support-for-OV5675-sensor.patch:786: CHECK: Alignment should match open parenthesis
patches/0001-ov5675-Add-support-for-OV5675-sensor.patch:791: CHECK: Alignment should match open parenthesis

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-ov5675-Add-support-for-OV5675-sensor.patch
patches/0006-media-i2c-ov5645-Fix-power-sequence.patch:8: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit aa4bb8b8838f ("media: ov5640: Re-work MIPI startup sequence")'

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-i2c-ov5645-Fix-power-sequence.patch
patches/0008-v4l-Documentation-Raw-Bayer-formats-are-not-RGB-form.patch:53: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0008-v4l-Documentation-Raw-Bayer-formats-are-not-RGB-form.patch:58: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-v4l-Documentation-Raw-Bayer-formats-are-not-RGB-form.patch

