Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C42D1572A55
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 02:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbiGMAkc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 20:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbiGMAka (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 20:40:30 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB5FC04DC
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 17:40:25 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oBQQR-008NV5-G6; Wed, 13 Jul 2022 00:40:24 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oBQQP-00BIEN-Bz; Wed, 13 Jul 2022 00:40:21 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.20] rkisp1 refactoring to prepare for i.MX8MP (#84809)
Date:   Wed, 13 Jul 2022 00:40:21 +0000
Message-Id: <20220713004021.2691641-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Ys30elcTTEnlu7c7@pendragon.ideasonboard.com>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/Ys30elcTTEnlu7c7@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/224370/
Build time: 00:12:13
Link: https://lore.kernel.org/linux-media/Ys30elcTTEnlu7c7@pendragon.ideasonboard.com

gpg: Signature made Tue 12 Jul 2022 10:21:10 PM UTC
gpg:                using RSA key CB9D6877529820CD53099B1B65F89C37BC54210D
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Can't check signature: No public key

Summary: got 46/46 patches with issues, being 46 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-v4l2-async-Add-notifier-operation-to-destroy-a.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:4967 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/dvb-frontends/mb86a16.c: ../drivers/media/dvb-frontends/mb86a16.c:1477 mb86a16_set_fe() parse error: turning off implications after 60 seconds
	../drivers/media/dvb-frontends/sp887x.c: ../drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __memcpy() '&buf[2]' too small (30 vs 16384)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2491 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000016Kb sm_state_count = 1725347
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 62 seconds
	../drivers/media/pci/cx88/cx88-dvb.c: ../drivers/media/pci/cx88/cx88-dvb.c:1626 dvb_register() error: we previously assumed 'fe1->dvb.frontend' could be null (see line 1086)
	../drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:193 sun6i_mipi_csi2_s_stream() warn: missing error code 'ret'
	../drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:225 sun8i_a83t_mipi_csi2_s_stream() warn: missing error code 'ret'
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2831 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0002-media-mc-entity-Rename-media_entity_remote_pad-to-me.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:4835 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:193 sun6i_mipi_csi2_s_stream() warn: missing error code 'ret'
	../drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:225 sun8i_a83t_mipi_csi2_s_stream() warn: missing error code 'ret'
	../drivers/media/dvb-frontends/mb86a16.c: ../drivers/media/dvb-frontends/mb86a16.c:1448 mb86a16_set_fe() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2229 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000028Kb sm_state_count = 1724594
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 72 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2804 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/dvb-frontends/sp887x.c: ../drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __memcpy() '&buf[2]' too small (30 vs 16384)
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx88/cx88-dvb.c: ../drivers/media/pci/cx88/cx88-dvb.c:1626 dvb_register() error: we previously assumed 'fe1->dvb.frontend' could be null (see line 1086)

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0002-media-mc-entity-Rename-media_entity_remote_pad-to-me.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:267: CHECK: Lines should not end with a '('

patches/0003-media-mc-entity-Add-a-new-helper-function-to-get-a-r.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #0:
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:5297 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000028Kb sm_state_count = 1725743
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 57 seconds
	../drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:193 sun6i_mipi_csi2_s_stream() warn: missing error code 'ret'
	../drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:225 sun8i_a83t_mipi_csi2_s_stream() warn: missing error code 'ret'
	../drivers/media/dvb-frontends/sp887x.c: ../drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __memcpy() '&buf[2]' too small (30 vs 16384)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2846 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0004-media-mc-entity-Add-a-new-helper-function-to-get-a-r.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #0:
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:5363 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000024Kb sm_state_count = 1725742
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 50 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/dvb-frontends/sp887x.c: ../drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __memcpy() '&buf[2]' too small (30 vs 16384)
	../drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:193 sun6i_mipi_csi2_s_stream() warn: missing error code 'ret'
	../drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:225 sun8i_a83t_mipi_csi2_s_stream() warn: missing error code 'ret'
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2884 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0005-media-rkisp1-Enable-compilation-on-ARCH_MXC.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0006-media-rkisp1-Disable-runtime-PM-in-probe-error-path.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0007-media-rkisp1-Read-the-ID-register-at-probe-time-inst.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0008-media-rkisp1-Rename-rkisp1_match_data-to-rkisp1_info.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0009-media-rkisp1-Save-info-pointer-in-rkisp1_device.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0010-media-rkisp1-Access-ISP-version-from-info-pointer.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0011-media-rkisp1-Make-rkisp1_isp_mbus_info-common.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0012-media-rkisp1-cap-Print-debug-message-on-failed-link-.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0013-media-rkisp1-Move-sensor-.s_stream-call-to-ISP.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0014-media-rkisp1-Reject-sensors-without-pixel-rate-contr.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0015-media-rkisp1-Create-link-from-sensor-to-ISP-at-notif.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0016-media-rkisp1-Create-internal-links-at-probe-time.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0017-media-rkisp1-Rename-rkisp1_subdev_notifier-to-rkisp1.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0018-media-rkisp1-Fix-sensor-source-pad-retrieval-at-boun.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0019-media-rkisp1-Split-CSI-handling-to-separate-file.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0019-media-rkisp1-Split-CSI-handling-to-separate-file.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:101: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0020-media-rkisp1-isp-Start-CSI-2-receiver-before-ISP.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0021-media-rkisp1-csi-Handle-CSI-2-RX-configuration-fully.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c:72:6: error: no previous prototype for ‘rkisp1_mipi_start’ [-Werror=missing-prototypes]
	../drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c:82:6: error: no previous prototype for ‘rkisp1_mipi_stop’ [-Werror=missing-prototypes]
	cc1: all warnings being treated as errors
	make[6]: *** [../scripts/Makefile.build:249: drivers/media/platform/rockchip/rkisp1/rkisp1-csi.o] Error 1
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:466: drivers/media/platform/rockchip/rkisp1] Error 2
	make[4]: *** [../scripts/Makefile.build:466: drivers/media/platform/rockchip] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0022-media-rkisp1-csi-Rename-CSI-functions-with-a-common-.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0023-media-rkisp1-csi-Move-start-delay-to-rkisp1_csi_star.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0024-media-rkisp1-csi-Pass-sensor-pointer-to-rkisp1_csi_c.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0025-media-rkisp1-csi-Constify-argument-to-rkisp1_csi_sta.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0026-media-rkisp1-isp-Don-t-initialize-ret-to-0-in-rkisp1.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0027-media-rkisp1-isp-Pass-mbus-type-and-flags-to-rkisp1_.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0028-media-rkisp1-isp-Rename-rkisp1_device.active_sensor-.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0029-media-rkisp1-isp-Add-container_of-wrapper-to-cast-su.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0030-media-rkisp1-isp-Add-rkisp1_device-backpointer-to-rk.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0031-media-rkisp1-isp-Pass-rkisp1_isp-pointer-to-internal.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0032-media-rkisp1-isp-Move-input-configuration-to-rkisp1_.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0033-media-rkisp1-isp-Merge-ISP_ACQ_PROP-configuration-in.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0034-media-rkisp1-isp-Initialize-some-variables-at-declar.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0035-media-rkisp1-isp-Fix-whitespace-issues.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0036-media-rkisp1-isp-Constify-various-local-variables.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0037-media-rkisp1-isp-Rename-rkisp1_get_remote_source.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0038-media-rkisp1-isp-Disallow-multiple-active-sources.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0039-media-rkisp1-csi-Implement-a-V4L2-subdev-for-the-CSI.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0039-media-rkisp1-csi-Implement-a-V4L2-subdev-for-the-CSI.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:65: CHECK: struct mutex definition without comment

patches/0040-media-rkisp1-csi-Plumb-the-CSI-RX-subdev.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0041-media-rkisp1-Use-fwnode_graph_for_each_endpoint.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0042-dt-bindings-media-rkisp1-Add-port-for-parallel-inter.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0043-media-rkisp1-Support-the-ISP-parallel-input.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0044-media-rkisp1-Add-infrastructure-to-support-ISP-featu.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0045-media-rkisp1-Make-the-internal-CSI-2-receiver-option.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0046-media-rkisp1-debug-Add-dump-file-in-debugfs-for-MI-m.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/staging/media/imx/imx7-media-csi.c:1966:10: error: implicit declaration of function ‘media_entity_remote_pad’; did you mean ‘media_entity_remove_links’? [-Werror=implicit-function-declaration]
	../drivers/staging/media/imx/imx7-media-csi.c:1966:8: error: assignment to ‘struct media_pad *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:249: drivers/staging/media/imx/imx7-media-csi.o] Error 1
	make[4]: *** [../scripts/Makefile.build:466: drivers/staging/media/imx] Error 2
	make[3]: *** [../scripts/Makefile.build:466: drivers/staging/media] Error 2
	make[2]: *** [../scripts/Makefile.build:466: drivers/staging] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1843: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2


Error #512 when building PDF docs

