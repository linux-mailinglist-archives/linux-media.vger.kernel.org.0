Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9587A678D
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 17:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232679AbjISPGA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 11:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232649AbjISPF7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 11:05:59 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970EEBE
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 08:05:54 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qicIT-008cEA-1V; Tue, 19 Sep 2023 15:05:53 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qicIP-009i7D-0j;
        Tue, 19 Sep 2023 15:05:51 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL] drm: renesas: shmobile: Atomic conversion + DT support (#94861)
Date:   Tue, 19 Sep 2023 15:05:50 +0000
Message-Id: <20230919150550.2314522-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/CAMuHMdWfBTKdXvZutg4LvWqBjuz-X=ZjzX0LKPqD=JxYuLoPRw@mail.gmail.com/
Build log: https://builder.linuxtv.org/job/patchwork/341053/
Build time: 00:00:00

gpg: Signature made Tue 19 Sep 2023 02:17:11 PM UTC
gpg:                using EDDSA key 3DA9A1E822CFF523871798488AC250FD6449F170
gpg: Good signature from "Geert Uytterhoeven <geert@linux-m68k.org>" [unknown]
gpg:                 aka "Geert Uytterhoeven <Geert.Uytterhoeven@gmail.com>" [unknown]
gpg:                 aka "Geert Uytterhoeven (Glider bvba) <geert@glider.be>" [unknown]
gpg:                 aka "Geert Uytterhoeven (Glider bv) <geert@glider.be>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 750D 82B0 A781 5431 5E25  925B 4804 B4BC 3F55 EEFB
     Subkey fingerprint: 3DA9 A1E8 22CF F523 8717  9848 8AC2 50FD 6449 F170


Build aborted due to a fatal error:
FAILED: patch patch patches/0020-drm-renesas-shmobile-Embed-drm_device-in-shmob_drm_d.patch doesn't apply:
Applying patch patches/0020-drm-renesas-shmobile-Embed-drm_device-in-shmob_drm_d.patch
patching file drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
patching file drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
Hunk #3 FAILED at 192.
Hunk #4 succeeded at 215 (offset 2 lines).
Hunk #5 succeeded at 246 (offset 2 lines).
Hunk #6 succeeded at 293 (offset 2 lines).
1 out of 6 hunks FAILED -- rejects in file drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
patching file drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
patching file drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
patching file drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
Patch patches/0020-drm-renesas-shmobile-Embed-drm_device-in-shmob_drm_d.patch does not apply (enforce with -f)

