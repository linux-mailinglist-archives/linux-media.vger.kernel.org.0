Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDB7A261089
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 13:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729912AbgIHLQi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 07:16:38 -0400
Received: from www.linuxtv.org ([130.149.80.248]:40960 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729922AbgIHLPi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 07:15:38 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kFbVE-001RQ2-4G; Tue, 08 Sep 2020 11:09:32 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kFbdj-0000uh-VW; Tue, 08 Sep 2020 11:18:20 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v5.9] cec-adap.c: don't use flush_scheduled_work() (#66837)
Date:   Tue,  8 Sep 2020 11:18:19 +0000
Message-Id: <20200908111819.3470-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <eb47954f-c916-f4c5-d255-a74b3ab0bdce@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/eb47954f-c916-f4c5-d255-a74b3ab0bdce@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/67419/
Build time: 00:15:49
Link: https://lore.kernel.org/linux-media/eb47954f-c916-f4c5-d255-a74b3ab0bdce@xs4all.nl

gpg: Signature made Tue 08 Sep 2020 10:46:40 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: got 1/1 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-cec-adap.c-don-t-use-flush_scheduled_work.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: ../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:703 is_pipe_valid_to_current_run_mode() warn: ignoring unreachable code.
	../drivers/staging/media/atomisp/pci/sh_css.c:1685:16: warning: assignment left-hand side might be a candidate for a format attribute [-Wsuggest-attribute=format]

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1909 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2856 em28xx_v4l2_init() parse error: turning off implications after 60 seconds


Error #512 when building PDF docs

