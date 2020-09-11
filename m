Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B689265EC1
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 13:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbgIKLZH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 07:25:07 -0400
Received: from www.linuxtv.org ([130.149.80.248]:58476 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgIKLYp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 07:24:45 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kGh3y-005QQS-57; Fri, 11 Sep 2020 11:17:54 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kGhCY-0007kG-VA; Fri, 11 Sep 2020 11:26:47 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v5.9] Remove V4L2_FLAG_MEMORY_NON_CONSISTENT flag (#66890)
Date:   Fri, 11 Sep 2020 11:26:46 +0000
Message-Id: <20200911112646.29731-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <9347220a-a039-93ff-5dd7-f35613631a29@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/9347220a-a039-93ff-5dd7-f35613631a29@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/67842/
Build time: 00:19:57
Link: https://lore.kernel.org/linux-media/9347220a-a039-93ff-5dd7-f35613631a29@xs4all.nl

gpg: Signature made Fri 11 Sep 2020 10:38:11 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: got 1/1 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-v4l2-remove-V4L2_FLAG_MEMORY_NON_CONSISTENT-fl.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: ../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:703 is_pipe_valid_to_current_run_mode() warn: ignoring unreachable code.
	../drivers/staging/media/atomisp/pci/sh_css.c:1685:16: warning: assignment left-hand side might be a candidate for a format attribute [-Wsuggest-attribute=format]

    allyesconfig: return code #0:
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2856 em28xx_v4l2_init() parse error: turning off implications after 60 seconds


Error #512 when building PDF docs

