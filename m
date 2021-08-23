Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D54F23F4865
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 12:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236066AbhHWKPE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 06:15:04 -0400
Received: from www.linuxtv.org ([130.149.80.248]:40706 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233145AbhHWKPD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 06:15:03 -0400
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mI6yC-00BvGQ-IP; Mon, 23 Aug 2021 10:14:20 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mI6y9-008Hk8-3e; Mon, 23 Aug 2021 10:14:17 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.16] uvcvideo v4l2-compliance fixes (#76513)
Date:   Mon, 23 Aug 2021 10:14:16 +0000
Message-Id: <20210823101416.1974782-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YSNsXylafQPuKH4H@pendragon.ideasonboard.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YSNsXylafQPuKH4H@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/132985/
Build time: 00:23:22
Link: https://lore.kernel.org/linux-media/YSNsXylafQPuKH4H@pendragon.ideasonboard.com

gpg: Signature made Mon 23 Aug 2021 09:31:23 AM UTC
gpg:                using RSA key CB9D6877529820CD53099B1B65F89C37BC54210D
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Can't check signature: No public key

Summary: got 8/17 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-v4l2-ioctl-Fix-check_ext_ctrls.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/cec/core/cec-adap.c: ../drivers/media/cec/core/cec-adap.c:926 cec_transmit_msg_fh() warn: '&data->list' not removed from list
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/platform/mtk-vpu/mtk_vpu.c: ../drivers/media/platform/mtk-vpu/mtk_vpu.c:946 mtk_vpu_probe() warn: 'vpu->clk' not released on lines: 851.
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2894 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-media-v4l2-ioctl-Fix-check_ext_ctrls.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:23: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0006-media-uvcvideo-Set-capability-in-s_param.patch:

   checkpatch.pl:
	$ cat patches/0006-media-uvcvideo-Set-capability-in-s_param.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0007-media-uvcvideo-Return-EIO-for-control-errors.patch:

   checkpatch.pl:
	$ cat patches/0007-media-uvcvideo-Return-EIO-for-control-errors.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:12: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0008-media-uvcvideo-refactor-__uvc_ctrl_add_mapping.patch:

   checkpatch.pl:
	$ cat patches/0008-media-uvcvideo-refactor-__uvc_ctrl_add_mapping.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:33: CHECK: Alignment should match open parenthesis

patches/0009-media-uvcvideo-Add-support-for-V4L2_CTRL_TYPE_CTRL_C.patch:

   checkpatch.pl:
	$ cat patches/0009-media-uvcvideo-Add-support-for-V4L2_CTRL_TYPE_CTRL_C.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0011-media-uvcvideo-Set-unique-vdev-name-based-in-type.patch:

   checkpatch.pl:
	$ cat patches/0011-media-uvcvideo-Set-unique-vdev-name-based-in-type.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:13: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0013-media-uvcvideo-Use-control-names-from-framework.patch:

   checkpatch.pl:
	$ cat patches/0013-media-uvcvideo-Use-control-names-from-framework.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:350: CHECK: Comparison to NULL could be written "!v4l2_ctrl_get_name"

patches/0014-media-uvcvideo-Check-controls-flags-before-accessing.patch:

   checkpatch.pl:
	$ cat patches/0014-media-uvcvideo-Check-controls-flags-before-accessing.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:82: CHECK: Alignment should match open parenthesis


Error #512 when building PDF docs

