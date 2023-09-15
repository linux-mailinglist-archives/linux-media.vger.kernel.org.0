Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A541F7A2AEF
	for <lists+linux-media@lfdr.de>; Sat, 16 Sep 2023 01:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237994AbjIOXSZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 19:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238008AbjIOXSG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 19:18:06 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68671BEB
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 16:17:59 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qhI4T-005prr-J8; Fri, 15 Sep 2023 23:17:57 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qhI4P-00EmJJ-2x;
        Fri, 15 Sep 2023 23:17:55 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v6.6] imx-mipi-csis regression fix (#94815)
Date:   Fri, 15 Sep 2023 23:17:54 +0000
Message-Id: <20230915231754.3522288-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230915224419.GA31632@pendragon.ideasonboard.com>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20230915224419.GA31632@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/340026/
Build time: 00:19:23
Link: https://lore.kernel.org/linux-media/20230915224419.GA31632@pendragon.ideasonboard.com

gpg: Signature made Fri 15 Sep 2023 10:26:32 PM UTC
gpg:                using EDDSA key C09EF871B3827B413F971CA9CC3F2D800327DE64
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Can't check signature: No public key

Summary: got 1/1 patches with issues, being 1 at build time

Error/warnings:

patches/0001-media-imx-mipi-csis-Remove-an-incorrect-fwnode_handl.patch:

    allyesconfig: return code #512:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/imx/imx-media-capture.c: In function ‘imx_media_capture_device_init’:
	../drivers/staging/media/imx/imx-media-capture.c:1000:51: error: ‘ capture’ directive output may be truncated writing 8 bytes into a region of size between 1 and 32 [-Werror=format-truncation=]
	../drivers/staging/media/imx/imx-media-capture.c:1000:9: note: ‘snprintf’ output between 9 and 40 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/imx/imx-media-capture.o] Error 1
	make[6]: *** [../scripts/Makefile.build:480: drivers/staging/media/imx] Error 2
	make[6]: *** Waiting for unfinished jobs....
	../drivers/staging/media/deprecated/atmel/atmel-isc-base.c: In function ‘isc_querycap’:
	../drivers/staging/media/deprecated/atmel/atmel-isc-base.c:496:28: error: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 23 [-Werror=format-truncation=]
	../drivers/staging/media/deprecated/atmel/atmel-isc-base.c:495:9: note: ‘snprintf’ output between 10 and 45 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/deprecated/atmel/atmel-isc-base.o] Error 1
	make[6]: *** [../scripts/Makefile.build:480: drivers/staging/media/deprecated/atmel] Error 2
	../drivers/staging/media/omap4iss/iss_csi2.c: In function ‘csi2_init_entities’:
	../drivers/staging/media/omap4iss/iss_csi2.c:1268:57: error: ‘%s’ directive output may be truncated writing up to 31 bytes into a region of size 22 [-Werror=format-truncation=]
	../drivers/staging/media/omap4iss/iss_csi2.c:1268:9: note: ‘snprintf’ output between 11 and 42 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/omap4iss/iss_csi2.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:480: drivers/staging/media/omap4iss] Error 2
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c: In function ‘ia_css_debug_pipe_graph_dump_stage’:
	../drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2786:66: error: ‘\n’ directive output may be truncated writing 2 bytes into a region of size between 0 and 198 [-Werror=format-truncation=]
	../drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2785:49: note: ‘snprintf’ output between 5 and 302 bytes into a destination of size 200
	../drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2772:66: error: ‘\n’ directive output may be truncated writing 2 bytes into a region of size between 0 and 198 [-Werror=format-truncation=]
	../drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2771:49: note: ‘snprintf’ output between 5 and 302 bytes into a destination of size 200
	../drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2749:92: error: ‘snprintf’ output may be truncated before the last format character [-Werror=format-truncation=]
	../drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2749:41: note: ‘snprintf’ output between 3 and 201 bytes into a destination of size 200
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:480: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:480: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:480: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:480: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1913: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

    allyesconfig: return code #512:
	../drivers/media/cec/core/cec-core.c: In function ‘cec_allocate_adapter’:
	../drivers/media/cec/core/cec-core.c:317:21: error: ‘/input0’ directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Werror=format-truncation=]
	../drivers/media/cec/core/cec-core.c:316:9: note: ‘snprintf’ output between 8 and 39 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/media/cec/core/cec-core.o] Error 1
	make[6]: *** [../scripts/Makefile.build:480: drivers/media/cec/core] Error 2
	make[5]: *** [../scripts/Makefile.build:480: drivers/media/cec] Error 2
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/rc/ati_remote.c: In function ‘ati_remote_probe’:
	../drivers/media/rc/ati_remote.c:876:21: error: ‘ mouse’ directive output may be truncated writing 6 bytes into a region of size between 1 and 80 [-Werror=format-truncation=]
	../drivers/media/rc/ati_remote.c:875:9: note: ‘snprintf’ output between 7 and 86 bytes into a destination of size 80
	cc1: all warnings being treated as errors
	make[6]: *** [../scripts/Makefile.build:243: drivers/media/rc/ati_remote.o] Error 1
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:480: drivers/media/rc] Error 2
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	make[4]: *** [../scripts/Makefile.build:480: drivers/media] Error 2
	make[3]: *** [../scripts/Makefile.build:480: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1913: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

