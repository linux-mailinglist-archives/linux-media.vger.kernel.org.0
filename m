Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC1D87D451A
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 03:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjJXBpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 21:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbjJXBpq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 21:45:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00405D68
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 18:45:43 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F0DC433C7
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 01:45:43 +0000 (UTC)
Date:   Tue, 24 Oct 2023 03:45:41 +0200
Message-ID: <4f1ffb07a245817e86741ffccad2ee36.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Oct 24 03:00:08 CEST 2023
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	19e67e01eb1e84f3529770d084b93f16a4894c42
v4l-utils git hash:	3d6682746de535d1f7aa71b43a30af40d52a539c
edid-decode git hash:	5920bf2a756b2f748c49ff6a08b9f421026473c5
gcc version:		i686-linux-gcc (GCC) 13.2.0
ccache version:		ccache version 4.8.3
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8494-gc4f4869a
sparse version:		v0.5.0-8494-gc4f4869a
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

drivers/media/i2c/adv7180.c:1514 adv7180_probe() warn: 'client->irq' from request_threaded_irq() not released on lines: 1514.
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/staging/media/meson/vdec/vdec_1.c:239 vdec_1_start() warn: 'core->vdec_1_clk' from clk_prepare_enable() not released on lines: 239.
drivers/staging/media/meson/vdec/vdec_hevc.c:227 vdec_hevc_start() warn: 'core->vdec_hevc_clk' from clk_prepare_enable() not released on lines: 227.
drivers/staging/media/meson/vdec/vdec_hevc.c:227 vdec_hevc_start() warn: 'core->vdec_hevcf_clk' from clk_prepare_enable() not released on lines: 227.
drivers/media/platform/st/sti/hva/hva-hw.c:412 hva_hw_probe() warn: 'hva->clk' from clk_prepare() not released on lines: 412.
drivers/media/pci/saa7134/saa7134-alsa.c:1186 alsa_card_saa7134_create() warn: 'dev->pci->irq' from request_irq() not released on lines: 1186.
drivers/media/pci/solo6x10/solo6x10-core.c:631 solo_pci_probe() warn: 'pdev->irq' from request_irq() not released on lines: 631.
drivers/media/pci/solo6x10/solo6x10-core.c:631 solo_pci_probe() warn: 'pdev' from pci_request_regions() not released on lines: 631.

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Tue Oct 24 03:15:49 CEST 2023
virtme-64: WARNINGS: Final Summary: 3218, Succeeded: 3218, Failed: 0, Warnings: 4
virtme-32: WARNINGS: Final Summary: 3342, Succeeded: 3342, Failed: 0, Warnings: 2

date:			Tue Oct 24 03:44:26 CEST 2023

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
