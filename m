Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB4E300029
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 11:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbhAVKOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 05:14:43 -0500
Received: from www.linuxtv.org ([130.149.80.248]:43272 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727820AbhAVKIO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 05:08:14 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l2tLF-008iTZ-F4; Fri, 22 Jan 2021 10:06:57 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l2tOj-0001uV-Hh; Fri, 22 Jan 2021 10:10:33 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v2 for 5.12] More V4L2 patches (#71031)
Date:   Fri, 22 Jan 2021 10:10:33 +0000
Message-Id: <20210122101033.7302-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122094248.GL3@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210122094248.GL3@valkosipuli.retiisi.org.uk/
Build log: https://builder.linuxtv.org/job/patchwork/86881/
Build time: 00:09:29
Link: https://lore.kernel.org/linux-media/20210122094248.GL3@valkosipuli.retiisi.org.uk

gpg: Signature made Fri 22 Jan 2021 09:35:55 AM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key

Summary: got 2/6 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0002-media-v4l2-async-Add-waiting-subdevices-debugfs.patch:

   checkpatch.pl:
	$ cat patches/0002-media-v4l2-async-Add-waiting-subdevices-debugfs.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:20: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0004-media-i2c-Kconfig-Select-FWNODE-for-OV772x-sensor.patch:

   checkpatch.pl:
	$ cat patches/0004-media-i2c-Kconfig-Select-FWNODE-for-OV772x-sensor.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

