Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C4A5260DC
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 13:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379849AbiEMLUZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 07:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379850AbiEMLUY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 07:20:24 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CFEE2A7C03
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 04:20:22 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1npTLI-009p7n-CB; Fri, 13 May 2022 11:20:20 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1npTLG-00EKkl-4a; Fri, 13 May 2022 11:20:18 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 5.19] Ov5640 driver improvements (#83198)
Date:   Fri, 13 May 2022 11:20:17 +0000
Message-Id: <20220513112018.3416321-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Yn41HyGCOJyZU98T@valkosipuli.retiisi.eu>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/Yn41HyGCOJyZU98T@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/207146/
Build time: 00:26:48
Link: https://lore.kernel.org/linux-media/Yn41HyGCOJyZU98T@valkosipuli.retiisi.eu

gpg: Signature made Fri 13 May 2022 10:35:38 AM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F0D0 377A 0D4F 25A7 9238  EFE5 6D40 361B 6E28 C193

Summary: got 26/28 patches with issues, being 26 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-ov5640-Add-pixel-rate-to-modes.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2617 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2868 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0004-media-ov5640-Associate-bpp-with-formats.patch:

    allyesconfig: return code #512:
	../drivers/media/i2c/ov5640.c:205:12: error: ‘ov5640_code_to_bpp’ defined but not used [-Werror=unused-function]
	cc1: all warnings being treated as errors
	make[4]: *** [../scripts/Makefile.build:288: drivers/media/i2c/ov5640.o] Error 1
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/i2c] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/i2c/ov5640.c:205:12: error: ‘ov5640_code_to_bpp’ defined but not used [-Werror=unused-function]
	cc1: all warnings being treated as errors
	make[4]: *** [../scripts/Makefile.build:288: drivers/media/i2c/ov5640.o] Error 1
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/i2c] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0005-media-ov5640-Add-LINK_FREQ-control.patch:

    allyesconfig: return code #512:
	../drivers/media/i2c/ov5640.c:223:12: error: ‘ov5640_code_to_bpp’ defined but not used [-Werror=unused-function]
	cc1: all warnings being treated as errors
	make[4]: *** [../scripts/Makefile.build:288: drivers/media/i2c/ov5640.o] Error 1
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/i2c] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/i2c/ov5640.c:223:12: error: ‘ov5640_code_to_bpp’ defined but not used [-Werror=unused-function]
	cc1: all warnings being treated as errors
	make[4]: *** [../scripts/Makefile.build:288: drivers/media/i2c/ov5640.o] Error 1
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/i2c] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0005-media-ov5640-Add-LINK_FREQ-control.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:60: CHECK: Alignment should match open parenthesis

patches/0006-media-ov5640-Update-pixel_rate-and-link_freq.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0007-media-ov5640-Rework-CSI-2-clock-tree.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0008-media-ov5640-Rework-timings-programming.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0009-media-ov5640-Fix-720x480-in-RGB888-mode.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0010-media-ov5640-Split-DVP-and-CSI-2-timings.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0011-media-ov5640-Provide-timings-accessor.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0012-media-ov5640-Re-sort-per-mode-register-tables.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0013-media-ov5640-Remove-duplicated-mode-settings.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0014-media-ov5640-Remove-ov5640_mode_init_data.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0015-media-ov5640-Add-HBLANK-control.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0016-media-ov5640-Add-VBLANK-control.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0017-media-ov5640-Adjust-vblank-with-s_frame_interval.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0018-media-ov5640-Remove-frame-rate-check-from-find_mode.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0019-media-ov5640-Change-CSI-2-timings-to-comply-with-FPS.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0020-media-ov5640-Implement-init_cfg.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0021-media-ov5640-Implement-get_selection.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0022-media-ov5640-Register-device-properties.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0023-media-ov5640-Add-RGB565_1X16-format.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0024-media-ov5640-Add-BGR888-format.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0025-media-ov5640-Restrict-sizes-to-mbus-code.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0026-media-ov5640-Adjust-format-to-bpp-in-s_fmt.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0027-media-ov5640-Split-DVP-and-CSI-2-formats.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)

patches/0028-media-ov5640-Move-format-mux-config-in-format.patch:

    allyesconfig: return code #0:
	internal error: file too large:  db/kernel.return_fixes (limit 4096 bytes)


Error #512 when building PDF docs

