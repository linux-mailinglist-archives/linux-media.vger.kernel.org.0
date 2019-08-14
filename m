Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3D08DC1A
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 19:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728443AbfHNRmk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 13:42:40 -0400
Received: from www.linuxtv.org ([130.149.80.248]:45284 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726951AbfHNRmk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 13:42:40 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hxxIB-0004gM-Eu; Wed, 14 Aug 2019 17:42:35 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hxxIC-0008Nl-A4; Wed, 14 Aug 2019 17:42:36 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v2 for 5.4] More sensor driver, omap3isp and documentation
Date:   Wed, 14 Aug 2019 17:42:36 +0000
Message-Id: <20190814174236.32180-1-jenkins@linuxtv.org>
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
Build log: https://builder.linuxtv.org/job/patchwork/8689/
Build time: 00:08:45
Link: https://lore.kernel.org/linux-media/20190814103251.GA3504@valkosipuli.retiisi.org.uk
Summary: 3 issues, being 0 at build time

gpg: Signature made Wed 14 Aug 2019 10:10:12 AM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]


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

