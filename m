Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11E067C7B4E
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 03:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbjJMBoi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 21:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjJMBoh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 21:44:37 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F2CBB
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 18:44:35 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08845C433C7
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 01:44:34 +0000 (UTC)
Date:   Fri, 13 Oct 2023 03:44:33 +0200
Message-ID: <1d1c317f25cacafd4c7d6b47976439ce.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Oct 13 03:00:10 CEST 2023
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	51b74c09ac8c5862007fc2bf0d465529d06dd446
v4l-utils git hash:	e77d513ecff8d085c388f95894363f946f92a3fe
edid-decode git hash:	e59b8a2ffd690d6576639365a67e890d91ca443d
gcc version:		i686-linux-gcc (GCC) 13.2.0
ccache version:		ccache version 4.8.3
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8490-g8b29de04
sparse version:		v0.5.0-8490-g8b29de04
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 4ea9496484e974bb46354c0bc783832182128194
host hardware:		x86_64
host os:		6.1.55-cobaltpc1

linux-git-powerpc64: OK
linux-git-arm: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-acpi.config: OK
no-of.config: OK
no-pm.config: OK
no-pm-sleep.config: OK
no-debug-fs.config: OK
sparse: WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

smatch: WARNINGS:

drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
  Locked on  : 326,387
  Unlocked on: 465,467
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2792 mxc_jpeg_probe() warn: missing unwind goto?
drivers/media/pci/cx18/cx18-mailbox.c:834 cx18_vapi() error: we previously assumed 'cx' could be null (see line 833)
drivers/media/pci/mgb4/mgb4_sysfs_out.c:118 video_source_store() warn: potential spectre issue 'mgbdev->vin' [r] (local cap)
drivers/media/pci/mgb4/mgb4_sysfs_out.c:122 video_source_store() warn: possible spectre second half.  'loopin_new'

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Fri Oct 13 03:16:03 CEST 2023
virtme-64: WARNINGS: Final Summary: 3080, Succeeded: 3080, Failed: 0, Warnings: 5
virtme-32: WARNINGS: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 2

date:			Fri Oct 13 03:43:23 CEST 2023

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Friday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Friday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Friday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
