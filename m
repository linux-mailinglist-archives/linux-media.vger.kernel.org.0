Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6605426DAF5
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 14:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbgIQMBr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 08:01:47 -0400
Received: from www.linuxtv.org ([130.149.80.248]:60410 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726951AbgIQMBU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 08:01:20 -0400
X-Greylist: delayed 2057 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 08:01:19 EDT
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kIrxd-00D9Fu-7S; Thu, 17 Sep 2020 11:20:21 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kIs6N-0007Cp-8c; Thu, 17 Sep 2020 11:29:23 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.10] Various fixes (mostly rcar related) (#67062)
Date:   Thu, 17 Sep 2020 11:29:23 +0000
Message-Id: <20200917112923.27658-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0f564827-1eae-1660-95a5-86b910e44b26@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/0f564827-1eae-1660-95a5-86b910e44b26@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/68702/
Build time: 00:21:46
Link: https://lore.kernel.org/linux-media/0f564827-1eae-1660-95a5-86b910e44b26@xs4all.nl

gpg: Signature made Thu 17 Sep 2020 10:46:46 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: got 2/11 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-dt-bindings-media-renesas-vin-Add-device-tree-suppor.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: ../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:703 is_pipe_valid_to_current_run_mode() warn: ignoring unreachable code.
	../drivers/staging/media/atomisp/pci/sh_css.c:1685:16: warning: assignment left-hand side might be a candidate for a format attribute [-Wsuggest-attribute=format]

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1909 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0011-media-rcar-vin-Enable-YDS-bit-depending-on-bus_width.patch:

   checkpatch.pl:
	$ cat patches/0011-media-rcar-vin-Enable-YDS-bit-depending-on-bus_width.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:48: CHECK: Prefer using the BIT macro


Error #512 when building PDF docs

