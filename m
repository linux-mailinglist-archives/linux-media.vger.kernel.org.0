Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6C47AAD17
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 10:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232390AbjIVItf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 04:49:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbjIVItc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 04:49:32 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2822CE8
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 01:49:22 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qjbqi-00B58o-6A; Fri, 22 Sep 2023 08:49:20 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qjbqe-000eIn-2m;
        Fri, 22 Sep 2023 08:49:18 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Sean Young <sean@mess.org>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.7] RC fixes (v2) (#94975)
Date:   Fri, 22 Sep 2023 08:49:17 +0000
Message-Id: <20230922084917.154912-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ZQ1L/LOtJn1ewOG/@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/ZQ1L/LOtJn1ewOG/@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/341836/
Build time: 00:27:48
Link: https://lore.kernel.org/linux-media/ZQ1L/LOtJn1ewOG/@gofer.mess.org

gpg: Signature made Fri 22 Sep 2023 07:36:20 AM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: got 4/4 patches with issues, being 4 at build time

Error/warnings:

patches/0001-dt-bindings-media-remove-nokia-n900-ir-as-pwm-ir-tx-.patch:

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
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/omap4iss/iss_csi2.c: In function ‘csi2_init_entities’:
	../drivers/staging/media/omap4iss/iss_csi2.c:1268:57: error: ‘%s’ directive output may be truncated writing up to 31 bytes into a region of size 22 [-Werror=format-truncation=]
	../drivers/staging/media/omap4iss/iss_csi2.c:1268:9: note: ‘snprintf’ output between 11 and 42 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/omap4iss/iss_csi2.o] Error 1
	make[6]: *** [../scripts/Makefile.build:480: drivers/staging/media/omap4iss] Error 2
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

   checkpatch.pl:
	$ cat patches/0001-dt-bindings-media-remove-nokia-n900-ir-as-pwm-ir-tx-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:35: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:38: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0002-media-rc-remove-ir-rx51-in-favour-of-generic-pwm-ir-.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/omap4iss/iss_csi2.c: In function ‘csi2_init_entities’:
	../drivers/staging/media/omap4iss/iss_csi2.c:1268:57: error: ‘%s’ directive output may be truncated writing up to 31 bytes into a region of size 22 [-Werror=format-truncation=]
	../drivers/staging/media/omap4iss/iss_csi2.c:1268:9: note: ‘snprintf’ output between 11 and 42 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/omap4iss/iss_csi2.o] Error 1
	make[6]: *** [../scripts/Makefile.build:480: drivers/staging/media/omap4iss] Error 2
	make[6]: *** Waiting for unfinished jobs....
	../drivers/staging/media/imx/imx-media-capture.c: In function ‘imx_media_capture_device_init’:
	../drivers/staging/media/imx/imx-media-capture.c:1000:51: error: ‘ capture’ directive output may be truncated writing 8 bytes into a region of size between 1 and 32 [-Werror=format-truncation=]
	../drivers/staging/media/imx/imx-media-capture.c:1000:9: note: ‘snprintf’ output between 9 and 40 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/imx/imx-media-capture.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/deprecated/atmel/atmel-isc-base.c: In function ‘isc_querycap’:
	../drivers/staging/media/deprecated/atmel/atmel-isc-base.c:496:28: error: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 23 [-Werror=format-truncation=]
	../drivers/staging/media/deprecated/atmel/atmel-isc-base.c:495:9: note: ‘snprintf’ output between 10 and 45 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/deprecated/atmel/atmel-isc-base.o] Error 1
	make[6]: *** [../scripts/Makefile.build:480: drivers/staging/media/deprecated/atmel] Error 2
	../drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c: In function ‘ia_css_debug_pipe_graph_dump_stage’:
	../drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2786:66: error: ‘\n’ directive output may be truncated writing 2 bytes into a region of size between 0 and 198 [-Werror=format-truncation=]
	../drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2785:49: note: ‘snprintf’ output between 5 and 302 bytes into a destination of size 200
	../drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2772:66: error: ‘\n’ directive output may be truncated writing 2 bytes into a region of size between 0 and 198 [-Werror=format-truncation=]
	../drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2771:49: note: ‘snprintf’ output between 5 and 302 bytes into a destination of size 200
	../drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2749:92: error: ‘snprintf’ output may be truncated before the last format character [-Werror=format-truncation=]
	../drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2749:41: note: ‘snprintf’ output between 3 and 201 bytes into a destination of size 200
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.o] Error 1
	make[6]: *** [../scripts/Makefile.build:480: drivers/staging/media/atomisp] Error 2
	make[6]: *** [../scripts/Makefile.build:480: drivers/staging/media/imx] Error 2
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
	../drivers/media/rc/ati_remote.c: In function ‘ati_remote_probe’:
	../drivers/media/rc/ati_remote.c:876:21: error: ‘ mouse’ directive output may be truncated writing 6 bytes into a region of size between 1 and 80 [-Werror=format-truncation=]
	../drivers/media/rc/ati_remote.c:875:9: note: ‘snprintf’ output between 7 and 86 bytes into a destination of size 80
	cc1: all warnings being treated as errors
	make[6]: *** [../scripts/Makefile.build:243: drivers/media/rc/ati_remote.o] Error 1
	make[5]: *** [../scripts/Makefile.build:480: drivers/media/rc] Error 2
	../drivers/media/platform/cadence/cdns-csi2tx.c: In function ‘csi2tx_get_resources’:
	../drivers/media/platform/cadence/cdns-csi2tx.c:485:63: error: ‘%u’ directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Werror=format-truncation=]
	../drivers/media/platform/cadence/cdns-csi2tx.c:485:54: note: directive argument in the range [0, 4294967294]
	../drivers/media/platform/cadence/cdns-csi2tx.c:485:17: note: ‘snprintf’ output between 14 and 23 bytes into a destination of size 16
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/media/platform/cadence/cdns-csi2tx.o] Error 1
	make[6]: *** [../scripts/Makefile.build:480: drivers/media/platform/cadence] Error 2
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:480: drivers/media/platform] Error 2
	In file included from ../include/linux/property.h:14,
	                 from ../include/linux/acpi.h:16,
	                 from ../drivers/media/pci/intel/ipu-bridge.c:4:
	In function ‘ipu_bridge_init_swnode_names’,
	    inlined from ‘ipu_bridge_create_connection_swnodes’ at ../drivers/media/pci/intel/ipu-bridge.c:445:2,
	    inlined from ‘ipu_bridge_connect_sensor’ at ../drivers/media/pci/intel/ipu-bridge.c:656:3:
	../include/linux/fwnode.h:81:49: error: ‘%u’ directive output may be truncated writing between 1 and 3 bytes into a region of size 2 [-Werror=format-truncation=]
	../drivers/media/pci/intel/ipu-bridge.c:384:18: note: in expansion of macro ‘SWNODE_GRAPH_PORT_NAME_FMT’
	../include/linux/fwnode.h: In function ‘ipu_bridge_connect_sensor’:
	../include/linux/fwnode.h:81:55: note: format string is defined here
	In function ‘ipu_bridge_init_swnode_names’,
	    inlined from ‘ipu_bridge_create_connection_swnodes’ at ../drivers/media/pci/intel/ipu-bridge.c:445:2,
	    inlined from ‘ipu_bridge_connect_sensor’ at ../drivers/media/pci/intel/ipu-bridge.c:656:3:
	../include/linux/fwnode.h:81:49: note: directive argument in the range [0, 255]
	../drivers/media/pci/intel/ipu-bridge.c:384:18: note: in expansion of macro ‘SWNODE_GRAPH_PORT_NAME_FMT’
	../drivers/media/pci/intel/ipu-bridge.c:382:9: note: ‘snprintf’ output between 7 and 9 bytes into a destination of size 7
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/media/pci/intel/ipu-bridge.o] Error 1
	make[6]: *** [../scripts/Makefile.build:480: drivers/media/pci/intel] Error 2
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:480: drivers/media/pci] Error 2
	make[4]: *** [../scripts/Makefile.build:480: drivers/media] Error 2
	make[3]: *** [../scripts/Makefile.build:480: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1913: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0002-media-rc-remove-ir-rx51-in-favour-of-generic-pwm-ir-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:75: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0003-media-rc-meson-ir-support-rc-driver-type-RC_DRIVER_S.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx-media-capture.c: In function ‘imx_media_capture_device_init’:
	../drivers/staging/media/imx/imx-media-capture.c:1000:51: error: ‘ capture’ directive output may be truncated writing 8 bytes into a region of size between 1 and 32 [-Werror=format-truncation=]
	../drivers/staging/media/imx/imx-media-capture.c:1000:9: note: ‘snprintf’ output between 9 and 40 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/imx/imx-media-capture.o] Error 1
	make[6]: *** [../scripts/Makefile.build:480: drivers/staging/media/imx] Error 2
	make[6]: *** Waiting for unfinished jobs....
	../drivers/staging/media/omap4iss/iss_csi2.c: In function ‘csi2_init_entities’:
	../drivers/staging/media/omap4iss/iss_csi2.c:1268:57: error: ‘%s’ directive output may be truncated writing up to 31 bytes into a region of size 22 [-Werror=format-truncation=]
	../drivers/staging/media/omap4iss/iss_csi2.c:1268:9: note: ‘snprintf’ output between 11 and 42 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/omap4iss/iss_csi2.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/deprecated/atmel/atmel-isc-base.c: In function ‘isc_querycap’:
	../drivers/staging/media/deprecated/atmel/atmel-isc-base.c:496:28: error: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 23 [-Werror=format-truncation=]
	../drivers/staging/media/deprecated/atmel/atmel-isc-base.c:495:9: note: ‘snprintf’ output between 10 and 45 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/deprecated/atmel/atmel-isc-base.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
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
	make[6]: *** [../scripts/Makefile.build:480: drivers/staging/media/deprecated/atmel] Error 2
	make[6]: *** [../scripts/Makefile.build:480: drivers/staging/media/omap4iss] Error 2
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
	make[7]: *** Waiting for unfinished jobs....
	../drivers/media/platform/cadence/cdns-csi2tx.c: In function ‘csi2tx_get_resources’:
	../drivers/media/platform/cadence/cdns-csi2tx.c:485:63: error: ‘%u’ directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Werror=format-truncation=]
	../drivers/media/platform/cadence/cdns-csi2tx.c:485:54: note: directive argument in the range [0, 4294967294]
	../drivers/media/platform/cadence/cdns-csi2tx.c:485:17: note: ‘snprintf’ output between 14 and 23 bytes into a destination of size 16
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/media/platform/cadence/cdns-csi2tx.o] Error 1
	make[6]: *** [../scripts/Makefile.build:480: drivers/media/platform/cadence] Error 2
	make[6]: *** Waiting for unfinished jobs....
	In file included from ../include/linux/property.h:14,
	                 from ../include/linux/acpi.h:16,
	                 from ../drivers/media/pci/intel/ipu-bridge.c:4:
	In function ‘ipu_bridge_init_swnode_names’,
	    inlined from ‘ipu_bridge_create_connection_swnodes’ at ../drivers/media/pci/intel/ipu-bridge.c:445:2,
	    inlined from ‘ipu_bridge_connect_sensor’ at ../drivers/media/pci/intel/ipu-bridge.c:656:3:
	../include/linux/fwnode.h:81:49: error: ‘%u’ directive output may be truncated writing between 1 and 3 bytes into a region of size 2 [-Werror=format-truncation=]
	../drivers/media/pci/intel/ipu-bridge.c:384:18: note: in expansion of macro ‘SWNODE_GRAPH_PORT_NAME_FMT’
	../include/linux/fwnode.h: In function ‘ipu_bridge_connect_sensor’:
	../include/linux/fwnode.h:81:55: note: format string is defined here
	In function ‘ipu_bridge_init_swnode_names’,
	    inlined from ‘ipu_bridge_create_connection_swnodes’ at ../drivers/media/pci/intel/ipu-bridge.c:445:2,
	    inlined from ‘ipu_bridge_connect_sensor’ at ../drivers/media/pci/intel/ipu-bridge.c:656:3:
	../include/linux/fwnode.h:81:49: note: directive argument in the range [0, 255]
	../drivers/media/pci/intel/ipu-bridge.c:384:18: note: in expansion of macro ‘SWNODE_GRAPH_PORT_NAME_FMT’
	../drivers/media/pci/intel/ipu-bridge.c:382:9: note: ‘snprintf’ output between 7 and 9 bytes into a destination of size 7
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/media/pci/intel/ipu-bridge.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/media/rc/ati_remote.c: In function ‘ati_remote_probe’:
	../drivers/media/rc/ati_remote.c:876:21: error: ‘ mouse’ directive output may be truncated writing 6 bytes into a region of size between 1 and 80 [-Werror=format-truncation=]
	../drivers/media/rc/ati_remote.c:875:9: note: ‘snprintf’ output between 7 and 86 bytes into a destination of size 80
	cc1: all warnings being treated as errors
	make[6]: *** [../scripts/Makefile.build:243: drivers/media/rc/ati_remote.o] Error 1
	make[5]: *** [../scripts/Makefile.build:480: drivers/media/rc] Error 2
	make[5]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:480: drivers/media/cec/core] Error 2
	make[6]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:480: drivers/media/pci/intel] Error 2
	make[6]: *** Waiting for unfinished jobs....
	../drivers/media/pci/cx18/cx18-driver.c: In function ‘cx18_init_struct1’:
	../drivers/media/pci/cx18/cx18-driver.c:688:65: error: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 11 [-Werror=format-truncation=]
	In function ‘cx18_create_in_workq’,
	    inlined from ‘cx18_init_struct1’ at ../drivers/media/pci/cx18/cx18-driver.c:724:8:
	../drivers/media/pci/cx18/cx18-driver.c:688:9: note: ‘snprintf’ output between 4 and 39 bytes into a destination of size 11
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/media/pci/cx18/cx18-driver.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:480: drivers/media/pci/cx18] Error 2
	../drivers/media/pci/cobalt/cobalt-v4l2.c: In function ‘cobalt_node_register’:
	../drivers/media/pci/cobalt/cobalt-v4l2.c:1213:26: error: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 32 [-Werror=format-truncation=]
	../drivers/media/pci/cobalt/cobalt-v4l2.c:1213:25: note: directive argument in the range [0, 12]
	../drivers/media/pci/cobalt/cobalt-v4l2.c:1212:9: note: ‘snprintf’ output between 3 and 39 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/media/pci/cobalt/cobalt-v4l2.o] Error 1
	make[6]: *** [../scripts/Makefile.build:480: drivers/media/pci/cobalt] Error 2
	make[5]: *** [../scripts/Makefile.build:480: drivers/media/platform] Error 2
	make[5]: *** [../scripts/Makefile.build:480: drivers/media/cec] Error 2
	../drivers/media/pci/cx23885/cx23888-ir.c: In function ‘cx23888_ir_probe’:
	../drivers/media/pci/cx23885/cx23888-ir.c:1162:49: error: ‘/888-ir’ directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Werror=format-truncation=]
	../drivers/media/pci/cx23885/cx23888-ir.c:1162:9: note: ‘snprintf’ output between 8 and 39 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/media/pci/cx23885/cx23888-ir.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/usb/dvb-usb-v2/af9035.c: ../drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
	  Locked on  : 326,387
	  Unlocked on: 465,467
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2517 dvb_register() parse error: OOM: 3014564Kb sm_state_count = 1757213
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2517 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 49 seconds
	make[6]: *** [../scripts/Makefile.build:480: drivers/media/pci/cx23885] Error 2
	make[5]: *** [../scripts/Makefile.build:480: drivers/media/pci] Error 2
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/cx231xx/cx231xx-417.c: In function ‘cx231xx_video_dev_init.constprop’:
	../drivers/media/usb/cx231xx/cx231xx-417.c:1718:52: error: ‘%s’ directive output may be truncated writing 4 bytes into a region of size between 2 and 31 [-Werror=format-truncation=]
	../drivers/media/usb/cx231xx/cx231xx-417.c:1718:9: note: ‘snprintf’ output 9 or more bytes (assuming 38) into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/media/usb/cx231xx/cx231xx-417.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:480: drivers/media/usb/cx231xx] Error 2
	make[6]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:480: drivers/media/usb] Error 2
	make[4]: *** [../scripts/Makefile.build:480: drivers/media] Error 2
	make[3]: *** [../scripts/Makefile.build:480: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1913: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0003-media-rc-meson-ir-support-rc-driver-type-RC_DRIVER_S.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:620: WARNING: DT compatible string "amlogic,meson-s4-ir" appears un-documented -- check ./Documentation/devicetree/bindings/

patches/0004-dt-bindings-media-Add-compatible-for-Meson-S4-IR-Con.patch:

    allyesconfig: return code #512:
	../drivers/staging/media/imx/imx-media-capture.c: In function ‘imx_media_capture_device_init’:
	../drivers/staging/media/imx/imx-media-capture.c:1000:51: error: ‘ capture’ directive output may be truncated writing 8 bytes into a region of size between 1 and 32 [-Werror=format-truncation=]
	../drivers/staging/media/imx/imx-media-capture.c:1000:9: note: ‘snprintf’ output between 9 and 40 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/imx/imx-media-capture.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/omap4iss/iss_csi2.c: In function ‘csi2_init_entities’:
	../drivers/staging/media/omap4iss/iss_csi2.c:1268:57: error: ‘%s’ directive output may be truncated writing up to 31 bytes into a region of size 22 [-Werror=format-truncation=]
	../drivers/staging/media/omap4iss/iss_csi2.c:1268:9: note: ‘snprintf’ output between 11 and 42 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/omap4iss/iss_csi2.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/deprecated/atmel/atmel-isc-base.c: In function ‘isc_querycap’:
	../drivers/staging/media/deprecated/atmel/atmel-isc-base.c:496:28: error: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 23 [-Werror=format-truncation=]
	../drivers/staging/media/deprecated/atmel/atmel-isc-base.c:495:9: note: ‘snprintf’ output between 10 and 45 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/deprecated/atmel/atmel-isc-base.o] Error 1
	make[6]: *** [../scripts/Makefile.build:480: drivers/staging/media/deprecated/atmel] Error 2
	make[6]: *** Waiting for unfinished jobs....
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
	make[6]: *** [../scripts/Makefile.build:480: drivers/staging/media/imx] Error 2
	make[6]: *** [../scripts/Makefile.build:480: drivers/staging/media/atomisp] Error 2
	make[6]: *** [../scripts/Makefile.build:480: drivers/staging/media/omap4iss] Error 2
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
	../drivers/media/platform/cadence/cdns-csi2tx.c: In function ‘csi2tx_get_resources’:
	../drivers/media/platform/cadence/cdns-csi2tx.c:485:63: error: ‘%u’ directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Werror=format-truncation=]
	../drivers/media/platform/cadence/cdns-csi2tx.c:485:54: note: directive argument in the range [0, 4294967294]
	../drivers/media/platform/cadence/cdns-csi2tx.c:485:17: note: ‘snprintf’ output between 14 and 23 bytes into a destination of size 16
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/media/platform/cadence/cdns-csi2tx.o] Error 1
	make[6]: *** [../scripts/Makefile.build:480: drivers/media/platform/cadence] Error 2
	make[6]: *** Waiting for unfinished jobs....
	In file included from ../include/linux/property.h:14,
	                 from ../include/linux/acpi.h:16,
	                 from ../drivers/media/pci/intel/ipu-bridge.c:4:
	In function ‘ipu_bridge_init_swnode_names’,
	    inlined from ‘ipu_bridge_create_connection_swnodes’ at ../drivers/media/pci/intel/ipu-bridge.c:445:2,
	    inlined from ‘ipu_bridge_connect_sensor’ at ../drivers/media/pci/intel/ipu-bridge.c:656:3:
	../include/linux/fwnode.h:81:49: error: ‘%u’ directive output may be truncated writing between 1 and 3 bytes into a region of size 2 [-Werror=format-truncation=]
	../drivers/media/pci/intel/ipu-bridge.c:384:18: note: in expansion of macro ‘SWNODE_GRAPH_PORT_NAME_FMT’
	../include/linux/fwnode.h: In function ‘ipu_bridge_connect_sensor’:
	../include/linux/fwnode.h:81:55: note: format string is defined here
	In function ‘ipu_bridge_init_swnode_names’,
	    inlined from ‘ipu_bridge_create_connection_swnodes’ at ../drivers/media/pci/intel/ipu-bridge.c:445:2,
	    inlined from ‘ipu_bridge_connect_sensor’ at ../drivers/media/pci/intel/ipu-bridge.c:656:3:
	../include/linux/fwnode.h:81:49: note: directive argument in the range [0, 255]
	../drivers/media/pci/intel/ipu-bridge.c:384:18: note: in expansion of macro ‘SWNODE_GRAPH_PORT_NAME_FMT’
	../drivers/media/pci/intel/ipu-bridge.c:382:9: note: ‘snprintf’ output between 7 and 9 bytes into a destination of size 7
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/media/pci/intel/ipu-bridge.o] Error 1
	make[6]: *** [../scripts/Makefile.build:480: drivers/media/pci/intel] Error 2
	make[5]: *** [../scripts/Makefile.build:480: drivers/media/pci] Error 2
	../drivers/media/rc/ati_remote.c: In function ‘ati_remote_probe’:
	../drivers/media/rc/ati_remote.c:876:21: error: ‘ mouse’ directive output may be truncated writing 6 bytes into a region of size between 1 and 80 [-Werror=format-truncation=]
	../drivers/media/rc/ati_remote.c:875:9: note: ‘snprintf’ output between 7 and 86 bytes into a destination of size 80
	cc1: all warnings being treated as errors
	make[6]: *** [../scripts/Makefile.build:243: drivers/media/rc/ati_remote.o] Error 1
	make[6]: *** Waiting for unfinished jobs....
	../drivers/media/platform/microchip/microchip-isc-base.c: In function ‘isc_querycap’:
	../drivers/media/platform/microchip/microchip-isc-base.c:486:28: error: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 23 [-Werror=format-truncation=]
	../drivers/media/platform/microchip/microchip-isc-base.c:485:9: note: ‘snprintf’ output between 10 and 45 bytes into a destination of size 32
	../drivers/media/platform/microchip/microchip-isc-base.c: In function ‘isc_mc_init’:
	../drivers/media/platform/microchip/microchip-isc-base.c:1996:76: error: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 23 [-Werror=format-truncation=]
	../drivers/media/platform/microchip/microchip-isc-base.c:1996:9: note: ‘snprintf’ output between 10 and 45 bytes into a destination of size 32
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/media/platform/microchip/microchip-isc-base.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[5]: *** [../scripts/Makefile.build:480: drivers/media/rc] Error 2
	make[6]: *** [../scripts/Makefile.build:480: drivers/media/platform/microchip] Error 2
	make[5]: *** [../scripts/Makefile.build:480: drivers/media/platform] Error 2
	make[4]: *** [../scripts/Makefile.build:480: drivers/media] Error 2
	make[3]: *** [../scripts/Makefile.build:480: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1913: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

