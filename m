Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66B82266869
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 20:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgIKSsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 14:48:31 -0400
Received: from www.linuxtv.org ([130.149.80.248]:53450 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725770AbgIKSs0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 14:48:26 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kGnzz-005qGy-RH; Fri, 11 Sep 2020 18:42:15 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kGo8b-0006pR-6D; Fri, 11 Sep 2020 18:51:09 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.10] Venus updates - part2 (#66892)
Date:   Fri, 11 Sep 2020 18:51:09 +0000
Message-Id: <20200911185109.26208-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911175629.25918-1-stanimir.varbanov@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20200911175629.25918-1-stanimir.varbanov@linaro.org/
Build log: https://builder.linuxtv.org/job/patchwork/67884/
Build time: 00:38:44
Link: https://lore.kernel.org/linux-media/20200911175629.25918-1-stanimir.varbanov@linaro.org

gpg: Signature made Fri 11 Sep 2020 05:46:54 PM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
     Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2

Summary: got 3/9 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-venus-core-Drop-local-dma_parms.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: ../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:703 is_pipe_valid_to_current_run_mode() warn: ignoring unreachable code.
	../drivers/staging/media/atomisp/pci/sh_css.c:1685:16: warning: assignment left-hand side might be a candidate for a format attribute [-Wsuggest-attribute=format]

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1909 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0002-v4l2-ctrl-Add-VP9-codec-levels.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: ../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:703 is_pipe_valid_to_current_run_mode() warn: ignoring unreachable code.
	../drivers/staging/media/atomisp/pci/sh_css.c:1685:16: warning: assignment left-hand side might be a candidate for a format attribute [-Wsuggest-attribute=format]

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1909 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0002-v4l2-ctrl-Add-VP9-codec-levels.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:139: CHECK: Please use a blank line after function/struct/union/enum declarations
	-:139: CHECK: spaces preferred around that '+' (ctx:VxV)

patches/0008-firmware-qcom_scm-Add-memory-protect-virtual-address.patch:

   checkpatch.pl:
	$ cat patches/0008-firmware-qcom_scm-Add-memory-protect-virtual-address.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:72: CHECK: extern prototypes should be avoided in .h files


Error #512 when building PDF docs

