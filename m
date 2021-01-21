Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77D5E2FEAC4
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 13:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728996AbhAUMzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 07:55:05 -0500
Received: from www.linuxtv.org ([130.149.80.248]:57662 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731513AbhAUMyU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 07:54:20 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l2ZSy-007Jdv-24; Thu, 21 Jan 2021 12:53:36 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l2ZWS-0001VB-2I; Thu, 21 Jan 2021 12:57:12 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.12] More V4L2 patches (#71010)
Date:   Thu, 21 Jan 2021 12:57:11 +0000
Message-Id: <20210121125711.5732-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121122556.GK3@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210121122556.GK3@valkosipuli.retiisi.org.uk/
Build log: https://builder.linuxtv.org/job/patchwork/86754/
Build time: 00:06:06
Link: https://lore.kernel.org/linux-media/20210121122556.GK3@valkosipuli.retiisi.org.uk

gpg: Signature made Thu 21 Jan 2021 12:18:46 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key

Summary: got 3/5 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-v4l2-async-Add-waiting-subdevices-debugfs.patch:

    allmodconfig: return code #0:
	../drivers/media/v4l2-core/v4l2-async.c:846:2: warning: enumeration value ‘V4L2_ASYNC_MATCH_CUSTOM’ not handled in switch [-Wswitch]

   checkpatch.pl:
	$ cat patches/0001-media-v4l2-async-Add-waiting-subdevices-debugfs.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:20: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0003-media-i2c-Kconfig-Select-FWNODE-for-OV772x-sensor.patch:

   checkpatch.pl:
	$ cat patches/0003-media-i2c-Kconfig-Select-FWNODE-for-OV772x-sensor.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0004-media-v4l2-async-Safely-unregister-an-non-registered.patch:

    allmodconfig: return code #0:
	../drivers/media/v4l2-core/v4l2-async.c:849:2: warning: enumeration value ‘V4L2_ASYNC_MATCH_CUSTOM’ not handled in switch [-Wswitch]


Error #512 when building PDF docs

