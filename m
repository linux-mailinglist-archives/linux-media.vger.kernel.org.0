Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35775574A9B
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 12:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237762AbiGNKaC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 06:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbiGNKaB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 06:30:01 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A16443E60
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 03:29:57 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oBw6V-00AK1u-PF; Thu, 14 Jul 2022 10:29:55 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oBw6T-001r3e-L6; Thu, 14 Jul 2022 10:29:53 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.20] Venus updates - part2 (#84855)
Date:   Thu, 14 Jul 2022 10:29:53 +0000
Message-Id: <20220714102953.442236-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220714100219.897127-1-stanimir.varbanov@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20220714100219.897127-1-stanimir.varbanov@linaro.org/
Build log: https://builder.linuxtv.org/job/patchwork/224748/
Build time: 00:21:59
Link: https://lore.kernel.org/linux-media/20220714100219.897127-1-stanimir.varbanov@linaro.org

gpg: Signature made Thu 14 Jul 2022 09:21:47 AM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [expired]
gpg: Note: This key has expired!
Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
     Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2

Summary: got 1/2 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-venus-venus_helper_get_bufreq-req-is-never-NUL.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:5385 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000028Kb sm_state_count = 1725875
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 56 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/dvb-frontends/sp887x.c: ../drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __memcpy() '&buf[2]' too small (30 vs 16384)
	../drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:193 sun6i_mipi_csi2_s_stream() warn: missing error code 'ret'
	../drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:225 sun8i_a83t_mipi_csi2_s_stream() warn: missing error code 'ret'
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2864 em28xx_v4l2_init() parse error: turning off implications after 60 seconds


Error #512 when building PDF docs

