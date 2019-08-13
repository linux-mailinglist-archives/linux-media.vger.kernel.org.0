Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D47EB8B8AC
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 14:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbfHMMhg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 08:37:36 -0400
Received: from www.linuxtv.org ([130.149.80.248]:51065 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727763AbfHMMhg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 08:37:36 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hxW3M-0005NM-Dm; Tue, 13 Aug 2019 12:37:28 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hxW3M-0004Az-6L; Tue, 13 Aug 2019 12:37:28 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.4] Fixes and i2c conversions
Date:   Tue, 13 Aug 2019 12:37:27 +0000
Message-Id: <20190813123727.16011-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0ce80e1f-46c1-6184-b0c1-fc99d0908725@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/58111/
Build log: https://builder.linuxtv.org/job/patchwork/7830/
Build time: 00:13:54
Link: https://lore.kernel.org/linux-media/0ce80e1f-46c1-6184-b0c1-fc99d0908725@xs4all.nl
Summary: 12 issues, being 0 build regressions

Error/warnings:

patches/0004-media-dvb-frontends-cxd2820r_core-convert-to-i2c_new.patch:26: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-dvb-frontends-cxd2820r_core-convert-to-i2c_new.patch
patches/0005-media-dvb-frontends-mn88443x-convert-to-i2c_new_dumm.patch:26: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-dvb-frontends-mn88443x-convert-to-i2c_new_dumm.patch
patches/0008-media-i2c-ad9389b-convert-to-i2c_new_dummy_device.patch:25: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-i2c-ad9389b-convert-to-i2c_new_dummy_device.patch
patches/0009-media-i2c-adv7180-convert-to-i2c_new_dummy_device.patch:25: CHECK: Alignment should match open parenthesis
patches/0009-media-i2c-adv7180-convert-to-i2c_new_dummy_device.patch:35: CHECK: Alignment should match open parenthesis

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-media-i2c-adv7180-convert-to-i2c_new_dummy_device.patch
patches/0010-media-i2c-adv7511-v4l2-convert-to-i2c_new_dummy_devi.patch:25: CHECK: Alignment should match open parenthesis
patches/0010-media-i2c-adv7511-v4l2-convert-to-i2c_new_dummy_devi.patch:40: CHECK: Alignment should match open parenthesis
patches/0010-media-i2c-adv7511-v4l2-convert-to-i2c_new_dummy_devi.patch:55: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-media-i2c-adv7511-v4l2-convert-to-i2c_new_dummy_devi.patch
patches/0022-media-i2c-adv748x-Convert-to-new-i2c-device-probe.patch:10: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type")'

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0022-media-i2c-adv748x-Convert-to-new-i2c-device-probe.patch
patches/0023-media-radio-si4713-Convert-to-new-i2c-device-probe.patch:7: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type")'
patches/0023-media-radio-si4713-Convert-to-new-i2c-device-probe.patch:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0023-media-radio-si4713-Convert-to-new-i2c-device-probe.patch
patches/0024-media-radio-si470x-Convert-to-new-i2c-device-probe.patch:7: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type")'
patches/0024-media-radio-si470x-Convert-to-new-i2c-device-probe.patch:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0024-media-radio-si470x-Convert-to-new-i2c-device-probe.patch
patches/0025-media-i2c-smiapp-Convert-to-new-i2c-device-probe.patch:7: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type")'
patches/0025-media-i2c-smiapp-Convert-to-new-i2c-device-probe.patch:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0025-media-i2c-smiapp-Convert-to-new-i2c-device-probe.patch
patches/0026-media-i2c-s5c73m3-Convert-to-new-i2c-device-probe.patch:7: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type")'
patches/0026-media-i2c-s5c73m3-Convert-to-new-i2c-device-probe.patch:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0026-media-i2c-s5c73m3-Convert-to-new-i2c-device-probe.patch
patches/0027-media-i2c-et8ek8-Convert-to-new-i2c-device-probe.patch:7: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type")'
patches/0027-media-i2c-et8ek8-Convert-to-new-i2c-device-probe.patch:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0027-media-i2c-et8ek8-Convert-to-new-i2c-device-probe.patch
patches/0028-media-i2c-Convert-to-new-i2c-device-probe.patch:7: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type")'

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0028-media-i2c-Convert-to-new-i2c-device-probe.patch

