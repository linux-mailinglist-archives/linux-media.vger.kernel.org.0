Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3663FFC72
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 10:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348517AbhICI4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 04:56:46 -0400
Received: from www.linuxtv.org ([130.149.80.248]:58586 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348513AbhICI4o (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Sep 2021 04:56:44 -0400
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mM4z9-00BLKK-Lu; Fri, 03 Sep 2021 08:55:43 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mM4z6-0071KO-CN; Fri, 03 Sep 2021 08:55:41 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.16] Make use of the helper function (#76760)
Date:   Fri,  3 Sep 2021 08:55:40 +0000
Message-Id: <20210903085540.1673354-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <7f52b9ae-6093-e1db-a60f-09769edffdde@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/7f52b9ae-6093-e1db-a60f-09769edffdde@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/136126/
Build time: 00:29:12
Link: https://lore.kernel.org/linux-media/7f52b9ae-6093-e1db-a60f-09769edffdde@xs4all.nl

gpg: Signature made Fri 03 Sep 2021 08:17:11 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [unknown]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/36 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-am437x-Make-use-of-the-helper-function-devm_pl.patch:

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


Error #512 when building PDF docs

