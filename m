Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C414E51426F
	for <lists+linux-media@lfdr.de>; Fri, 29 Apr 2022 08:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238350AbiD2Gjq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Apr 2022 02:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232281AbiD2Gjm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Apr 2022 02:39:42 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74721B9F36
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 23:36:25 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nkKEp-006e3v-R6; Fri, 29 Apr 2022 06:36:23 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nkKEn-00E8dy-Hd; Fri, 29 Apr 2022 06:36:21 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.19] H.264 Field Decoding Support for Frame-based (#82804)
Date:   Fri, 29 Apr 2022 06:36:21 +0000
Message-Id: <20220429063621.3369772-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <5ac6c664-c130-265a-c8e0-6a47c9ebbd3f@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/5ac6c664-c130-265a-c8e0-6a47c9ebbd3f@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/203191/
Build time: 00:24:05
Link: https://lore.kernel.org/linux-media/5ac6c664-c130-265a-c8e0-6a47c9ebbd3f@xs4all.nl

gpg: Signature made Fri 29 Apr 2022 06:02:35 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Can't check signature: No public key

Summary: got 4/23 patches with issues, being 4 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-doc-Document-dual-use-of-H.264-pic_num-frame_n.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2888 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0004-media-h264-Use-v4l2_h264_reference-for-reflist.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/nvidia/tegra-vde/h264.c:823:22: error: ‘struct <anonymous>’ has no member named ‘top_field_order_cnt’
	make[6]: *** [../scripts/Makefile.build:288: drivers/media/platform/nvidia/tegra-vde/h264.o] Error 1
	make[5]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvidia/tegra-vde] Error 2
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvidia] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/nvidia/tegra-vde/h264.c:823:22: error: ‘struct <anonymous>’ has no member named ‘top_field_order_cnt’
	make[6]: *** [../scripts/Makefile.build:288: drivers/media/platform/nvidia/tegra-vde/h264.o] Error 1
	make[5]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvidia/tegra-vde] Error 2
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvidia] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0005-media-h264-Increase-reference-lists-size-to-32.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/nvidia/tegra-vde/h264.c:823:22: error: ‘struct <anonymous>’ has no member named ‘top_field_order_cnt’
	make[6]: *** [../scripts/Makefile.build:288: drivers/media/platform/nvidia/tegra-vde/h264.o] Error 1
	make[5]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvidia/tegra-vde] Error 2
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvidia] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/nvidia/tegra-vde/h264.c:823:22: error: ‘struct <anonymous>’ has no member named ‘top_field_order_cnt’
	make[6]: *** [../scripts/Makefile.build:288: drivers/media/platform/nvidia/tegra-vde/h264.o] Error 1
	make[5]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvidia/tegra-vde] Error 2
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvidia] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0006-media-h264-Store-current-picture-fields.patch:

    allyesconfig: return code #512:
	../drivers/media/platform/nvidia/tegra-vde/h264.c:823:22: error: ‘struct <anonymous>’ has no member named ‘top_field_order_cnt’
	make[6]: *** [../scripts/Makefile.build:288: drivers/media/platform/nvidia/tegra-vde/h264.o] Error 1
	make[5]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvidia/tegra-vde] Error 2
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvidia] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/nvidia/tegra-vde/h264.c:823:22: error: ‘struct <anonymous>’ has no member named ‘top_field_order_cnt’
	make[6]: *** [../scripts/Makefile.build:288: drivers/media/platform/nvidia/tegra-vde/h264.o] Error 1
	make[5]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvidia/tegra-vde] Error 2
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvidia] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2


Error #512 when building PDF docs

