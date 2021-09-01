Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A052F3FD937
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 14:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243974AbhIAMHX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 08:07:23 -0400
Received: from www.linuxtv.org ([130.149.80.248]:39234 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243920AbhIAMHW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 08:07:22 -0400
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mLP0b-008bde-6X; Wed, 01 Sep 2021 12:06:25 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mLP0Z-000AE8-9e; Wed, 01 Sep 2021 12:06:23 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.16] Various fixes (#76740)
Date:   Wed,  1 Sep 2021 12:06:22 +0000
Message-Id: <20210901120622.39266-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <7151eb26-7cea-aff8-24e5-587266b700c0@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/7151eb26-7cea-aff8-24e5-587266b700c0@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/135594/
Build time: 00:23:48
Link: https://lore.kernel.org/linux-media/7151eb26-7cea-aff8-24e5-587266b700c0@xs4all.nl

gpg: Signature made Wed 01 Sep 2021 11:36:25 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [unknown]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 3/24 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-vidtv-Fix-memory-leak-in-remove.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/cec/core/cec-adap.c: ../drivers/media/cec/core/cec-adap.c:926 cec_transmit_msg_fh() warn: '&data->list' not removed from list
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2868 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/platform/mtk-vpu/mtk_vpu.c: ../drivers/media/platform/mtk-vpu/mtk_vpu.c:946 mtk_vpu_probe() warn: 'vpu->clk' not released on lines: 851.

patches/0007-media-smsusb-Use-usb_get_dev-for-the-reference-count.patch:

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/usb/siano/smsusb.c: ../drivers/media/usb/siano/smsusb.c:354 smsusb_term_device() error: we previously assumed 'dev' could be null (see line 340)
	../drivers/media/usb/siano/smsusb.c: ../drivers/media/usb/siano/smsusb.c:354 smsusb_term_device() error: dereferencing freed memory 'dev'
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

patches/0016-media-pci-ivtv-switch-from-pci_-to-dma_-API.patch:

   checkpatch.pl:
	$ cat patches/0016-media-pci-ivtv-switch-from-pci_-to-dma_-API.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:179: CHECK: Alignment should match open parenthesis
	-:314: CHECK: Avoid CamelCase: <SGarray>
	-:325: CHECK: Avoid CamelCase: <SGlist>


Error #512 when building PDF docs

