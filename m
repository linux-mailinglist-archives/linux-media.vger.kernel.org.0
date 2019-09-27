Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4829BC07CD
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 16:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfI0Onv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 10:43:51 -0400
Received: from www.linuxtv.org ([130.149.80.248]:45876 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727602AbfI0Onv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 10:43:51 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iDrTG-0004jX-9X; Fri, 27 Sep 2019 14:43:46 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iDrTZ-0004Y7-A0; Fri, 27 Sep 2019 14:44:06 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] am437x-vpfe: overdue maintenance
Date:   Fri, 27 Sep 2019 14:44:05 +0000
Message-Id: <20190927144405.17446-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <95a1c6a9-636f-66f4-0360-66105f22af57@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/58971/
Build log: https://builder.linuxtv.org/job/patchwork/17976/
Build time: 00:13:55
Link: https://lore.kernel.org/linux-media/95a1c6a9-636f-66f4-0360-66105f22af57@xs4all.nl

gpg: Signature made Fri 27 Sep 2019 02:25:10 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:

patches/0013-v4l-Add-macros-for-printing-V4L-fourcc-values.patch:70: ERROR: Macros with complex values should be enclosed in parentheses
patches/0013-v4l-Add-macros-for-printing-V4L-fourcc-values.patch:70: CHECK: Macro argument reuse 'fourcc' - possible side-effects?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0013-v4l-Add-macros-for-printing-V4L-fourcc-values.patch
patches/0014-v4l2-ioctl.c-use-new-v4l2_fourcc_conv-args-macros.patch:24: WARNING: line over 80 characters
patches/0014-v4l2-ioctl.c-use-new-v4l2_fourcc_conv-args-macros.patch:24: WARNING: Avoid logging continuation uses where feasible
patches/0014-v4l2-ioctl.c-use-new-v4l2_fourcc_conv-args-macros.patch:39: WARNING: line over 80 characters
patches/0014-v4l2-ioctl.c-use-new-v4l2_fourcc_conv-args-macros.patch:39: WARNING: Avoid logging continuation uses where feasible
patches/0014-v4l2-ioctl.c-use-new-v4l2_fourcc_conv-args-macros.patch:54: WARNING: line over 80 characters
patches/0014-v4l2-ioctl.c-use-new-v4l2_fourcc_conv-args-macros.patch:54: WARNING: Avoid logging continuation uses where feasible
patches/0014-v4l2-ioctl.c-use-new-v4l2_fourcc_conv-args-macros.patch:73: WARNING: Avoid logging continuation uses where feasible
patches/0014-v4l2-ioctl.c-use-new-v4l2_fourcc_conv-args-macros.patch:84: WARNING: Avoid logging continuation uses where feasible
patches/0014-v4l2-ioctl.c-use-new-v4l2_fourcc_conv-args-macros.patch:102: WARNING: line over 80 characters
patches/0014-v4l2-ioctl.c-use-new-v4l2_fourcc_conv-args-macros.patch:102: WARNING: Avoid logging continuation uses where feasible

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0014-v4l2-ioctl.c-use-new-v4l2_fourcc_conv-args-macros.patch
patches/0015-media-am437x-vpfe-Remove-print_fourcc-helper.patch:76: WARNING: line over 80 characters
patches/0015-media-am437x-vpfe-Remove-print_fourcc-helper.patch:87: WARNING: line over 80 characters
patches/0015-media-am437x-vpfe-Remove-print_fourcc-helper.patch:98: WARNING: line over 80 characters
patches/0015-media-am437x-vpfe-Remove-print_fourcc-helper.patch:109: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0015-media-am437x-vpfe-Remove-print_fourcc-helper.patch

