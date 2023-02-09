Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 983A168FD55
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 03:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbjBICug (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 21:50:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjBICsd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 21:48:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D6715580
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 18:45:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BF605B81FEB
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 02:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25873C433D2
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 02:45:38 +0000 (UTC)
Date:   Thu, 09 Feb 2023 03:45:37 +0100
Message-ID: <cad433047528c7f6ee1745c9353831aa.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Feb  9 03:00:23 CET 2023
media-tree git hash:	5fcc87c68e69407f841482fd7862a8310820a9da
media_build git hash:	0fe857b86addf382f6fd383948bd7736a3201403
v4l-utils git hash:	310b43a6452b31db2eaff863f057523eadbfcc14
edid-decode git hash:	915b0ce5329f417d2c3f84ddab3d443dd0e01b61
gcc version:		i686-linux-gcc (GCC) 12.2.0
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720-dirty
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8227-g70ee7aa1-dirty
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 734befdd86540876f88bf66e0fbdf5d15d580f2c
host hardware:		x86_64
host os:		6.0.0-6-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-mips: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: WARNINGS: VIDEOBUF_DMA_CONTIG
Check for strcpy/strncpy/strlcpy: OK
apps: OK
spec-git: OK
virtme: ERRORS
virtme-32: ERRORS
sparse: OK
smatch: WARNINGS
kerneldoc: OK

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Thursday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Thursday-test-media.log
https://hverkuil.home.xs4all.nl/logs/Thursday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Thursday-test-media-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
