Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18F675E7C60
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 15:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbiIWNzj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Sep 2022 09:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiIWNzh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Sep 2022 09:55:37 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427D112C6B3
        for <linux-media@vger.kernel.org>; Fri, 23 Sep 2022 06:55:36 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1obj9S-0082RS-HY; Fri, 23 Sep 2022 13:55:34 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1obj9N-00CqFJ-DO; Fri, 23 Sep 2022 13:55:28 +0000
Date:   Fri, 23 Sep 2022 13:55:27 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1513837516.0.1663941327981@builder.linuxtv.org>
Subject: Build failed in Jenkins: linux-media #293
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: linux-media
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/linux-media/293/display/redirect>

Changes:


------------------------------------------
[...truncated 283 lines...]
  CC      drivers/power/supply/bq24257_charger.o
  CC      drivers/power/supply/bq24735-charger.o
  CC      drivers/power/supply/bq2515x_charger.o
  CC      drivers/power/supply/bq25890_charger.o
  CC      drivers/power/supply/bq25980_charger.o
  CC      drivers/power/supply/bq256xx_charger.o
  CC      drivers/power/supply/smb347-charger.o
  CC      drivers/power/supply/tps65090-charger.o
  CC      drivers/power/supply/tps65217_charger.o
  CC      drivers/power/supply/axp288_fuel_gauge.o
  CC      drivers/power/supply/axp288_charger.o
  CC      drivers/power/supply/cros_usbpd-charger.o
  CC      drivers/power/supply/cros_peripheral_charger.o
  CC      drivers/power/supply/sc2731_charger.o
  CC      drivers/power/supply/sc27xx_fuel_gauge.o
  CC      drivers/power/supply/ucs1002_power.o
  CC      drivers/power/supply/bd99954-charger.o
  CC      drivers/power/supply/wilco-charger.o
  CC      drivers/power/supply/rn5t618_power.o
  CC      drivers/power/supply/acer_a500_battery.o
  CC      drivers/power/supply/surface_battery.o
  CC      drivers/power/supply/surface_charger.o
  CC      drivers/power/supply/ug3105_battery.o
  AR      drivers/power/supply/built-in.a
  AR      drivers/power/built-in.a
make[1]: *** [/var/lib/jenkins/workspace/linux-media@2/Makefile:1855: drivers] Error 2
make[1]: *** Waiting for unfinished jobs....
  CHK     kernel/kheaders_data.tar.xz
  GEN     kernel/kheaders_data.tar.xz
#
# configuration written to .config
#
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/arm_yes'
+ ./scripts/config --file arm_yes/.config -d MODULE_SIG -d KEYS -d IMA -d CONFIG_DEBUG_INFO -d SYSTEM_TRUSTED_KEYRING -d MODVERSIONS
+ make O=arm_yes CROSS_COMPILER=/usr/bin/arm-linux-gnueabihf- -j9
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media@2/arm_yes'
  SYNC    include/config/auto.conf.cmd
  GEN     Makefile
  CC      kernel/kheaders.o
  AR      kernel/built-in.a
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/i386'
make: *** [Makefile:222: __sub-make] Error 2
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch i386 and docs
  GEN     Makefile
  DESCEND objtool
  HOSTCC  /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/fixdep.o
  HOSTLD  /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/fixdep-in.o
  LINK    /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/fixdep
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/exec-cmd.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/help.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/pager.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/parse-options.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/run-command.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/sigchain.o
  CALL    ../scripts/atomic/check-atomics.sh
  CALL    ../scripts/checksyscalls.sh
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/subcmd-config.o
  LD      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/libsubcmd-in.o
  AR      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/libsubcmd.a
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/weak.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/check.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/special.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/builtin-check.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/elf.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/objtool.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/orc_gen.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/arch/x86/special.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/orc_dump.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/libstring.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/arch/x86/decode.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/libctype.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/str_error_r.o
  CC      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/librbtree.o
  LD      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/arch/x86/objtool-in.o
  LD      /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/objtool-in.o
  LINK    /var/lib/jenkins/workspace/linux-media@2/arm_yes/tools/objtool/objtool
  CHK     include/generated/compile.h
  CC [M]  samples/vfio-mdev/mtty.o
  CHK     kernel/kheaders_data.tar.xz
  CC [M]  arch/x86/mm/testmmiotrace.o
  CC [M]  kernel/trace/preemptirq_delay_test.o
  CC [M]  samples/vfio-mdev/mdpy.o
  CC [M]  samples/vfio-mdev/mdpy-fb.o
  CC [M]  samples/vfio-mdev/mbochs.o
  CC [M]  samples/configfs/configfs_sample.o
  CC [M]  samples/connector/cn_test.o
  CC [M]  samples/hw_breakpoint/data_breakpoint.o
  CC [M]  samples/kdb/kdb_hello.o
  CC [M]  samples/kfifo/bytestream-example.o
  CC [M]  samples/kfifo/dma-example.o
  CC [M]  samples/kfifo/inttype-example.o
  CC [M]  samples/kfifo/record-example.o
  CC [M]  samples/kprobes/kprobe_example.o
  CC [M]  samples/kprobes/kretprobe_example.o
  CC [M]  samples/livepatch/livepatch-sample.o
  CC [M]  samples/livepatch/livepatch-shadow-mod.o
  CC [M]  samples/livepatch/livepatch-shadow-fix1.o
  CC [M]  samples/livepatch/livepatch-shadow-fix2.o
  CC [M]  samples/livepatch/livepatch-callbacks-demo.o
  CC [M]  samples/livepatch/livepatch-callbacks-mod.o
  CC [M]  samples/livepatch/livepatch-callbacks-busymod.o
  CC [M]  samples/rpmsg/rpmsg_client_sample.o
  CC [M]  samples/trace_events/trace-events-sample.o
  CC [M]  samples/trace_printk/trace-printk.o
  CC [M]  samples/ftrace/ftrace-direct.o
  CC [M]  samples/trace_events/trace_custom_sched.o
  CC [M]  samples/ftrace/ftrace-direct-too.o
  CC [M]  samples/ftrace/ftrace-direct-modify.o
  CC [M]  samples/ftrace/ftrace-direct-multi.o
  CC [M]  samples/ftrace/ftrace-direct-multi-modify.o
  CC [M]  samples/ftrace/sample-trace-array.o
  CC [M]  samples/kmemleak/kmemleak-test.o
  CC [M]  samples/fprobe/fprobe_example.o
  CC [M]  drivers/soc/rockchip/dtpm.o
  CC [M]  drivers/base/test/test_async_driver_probe.o
  CC [M]  lib/test_bpf.o
  CC [M]  drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.o
  CC [M]  lib/test_bitops.o
  CC [M]  lib/test_kasan_module.o
  CC [M]  lib/test_ubsan.o
  CC [M]  lib/test_module.o
  CC [M]  lib/test_vmalloc.o
  CC [M]  lib/test_user_copy.o
  CC [M]  lib/test_static_keys.o
  CC [M]  lib/test_static_key_base.o
  CC [M]  lib/test_kmod.o
  CC [M]  lib/test_blackhole_dev.o
  CC [M]  lib/test_lockup.o
  CC [M]  lib/percpu_test.o
  CC [M]  drivers/scsi/pcmcia/fdomain_cs.o
  CC [M]  lib/livepatch/test_klp_atomic_replace.o
  CC [M]  lib/livepatch/test_klp_callbacks_demo.o
  CC [M]  lib/livepatch/test_klp_callbacks_demo2.o
  CC [M]  lib/livepatch/test_klp_callbacks_busy.o
  CC [M]  lib/livepatch/test_klp_callbacks_mod.o
  CC [M]  drivers/scsi/pcmcia/nsp_cs.o
  CC [M]  lib/livepatch/test_klp_livepatch.o
  CC [M]  drivers/scsi/pcmcia/sym53c500_cs.o
  CC [M]  lib/livepatch/test_klp_shadow_vars.o
  CC [M]  lib/livepatch/test_klp_state.o
  CC [M]  lib/livepatch/test_klp_state2.o
  LD [M]  drivers/scsi/pcmcia/qlogic_cs.o
  CC [M]  lib/livepatch/test_klp_state3.o
  LD [M]  drivers/scsi/pcmcia/aha152x_cs.o
  CC [M]  drivers/mtd/tests/mtd_nandecctest.o
  LD [M]  drivers/mtd/tests/mtd_oobtest.o
  LD [M]  drivers/mtd/tests/mtd_pagetest.o
  LD [M]  drivers/mtd/tests/mtd_readtest.o
  LD [M]  drivers/mtd/tests/mtd_speedtest.o
  LD [M]  drivers/mtd/tests/mtd_stresstest.o
  LD [M]  drivers/mtd/tests/mtd_subpagetest.o
  LD [M]  drivers/mtd/tests/mtd_torturetest.o
  LD [M]  drivers/mtd/tests/mtd_nandbiterrs.o
  CC [M]  kernel/kheaders.o
  CC [M]  drivers/spi/spi-loopback-test.o
  LD [M]  drivers/scsi/mpi3mr/mpi3mr.o
  CC [M]  drivers/scsi/qlogicfas408.o
  CC [M]  drivers/i2c/i2c-stub.o
  CC [M]  drivers/accessibility/speakup/speakup_decpc.o
  MODPOST modules-only.symvers
Kernel: arch/x86/boot/bzImage is ready  (#10)
  CC [M]  drivers/ntb/hw/epf/ntb_hw_epf.o
  CC [M]  drivers/staging/rtl8192e/rtllib_crypt_ccmp.o
  LD [M]  drivers/staging/rtl8192u/r8192u_usb.o
  CC [M]  drivers/staging/rtl8192e/rtllib_crypt_tkip.o
  CC [M]  drivers/staging/rtl8192e/rtllib_crypt_wep.o
  LD [M]  drivers/staging/rtl8192e/rtl8192e/r8192e_pci.o
  LD [M]  drivers/staging/rtl8723bs/r8723bs.o
  LD [M]  drivers/staging/vt6655/vt6655_stage.o
  LD [M]  drivers/staging/rtl8192e/rtllib.o
  LD [M]  drivers/staging/vt6656/vt6656_stage.o
  LD [M]  drivers/staging/r8188eu/r8188eu.o
  LD [M]  drivers/staging/gdm724x/gdmulte.o
  LD [M]  drivers/staging/gdm724x/gdmtty.o
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  AR      init/built-in.a
  LD      vmlinux.o
  GEN     Module.symvers
  LD [M]  kernel/kheaders.ko
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media/x86_64_mod'
+ make O=x86_64_yes allyesconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media/x86_64_yes'
  GEN     Makefile
#
# configuration written to .config
#
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media/x86_64_yes'
+ ./scripts/config --file x86_64_yes/.config -d MODULE_SIG -d KEYS -d IMA -d CONFIG_DEBUG_INFO -d SYSTEM_TRUSTED_KEYRING -d MODVERSIONS
+ make O=x86_64_yes -j9
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media/x86_64_yes'
  SYNC    include/config/auto.conf.cmd
  GEN     Makefile
  GEN     Makefile
  DESCEND objtool
  CALL    ../scripts/atomic/check-atomics.sh
  CALL    ../scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CHK     kernel/kheaders_data.tar.xz
  GEN     kernel/kheaders_data.tar.xz
  CC      kernel/kheaders.o
  AR      kernel/built-in.a
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  AR      init/built-in.a
  LD      vmlinux.o
Killed
make[2]: *** [../scripts/Makefile.vmlinux_o:68: vmlinux.o] Error 137
make[2]: *** Deleting file 'vmlinux.o'
make[1]: *** [/var/lib/jenkins/workspace/linux-media@2/Makefile:1171: vmlinux] Error 2
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/arm_yes'
make: *** [Makefile:222: __sub-make] Error 2
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch arm/aarch64 (builtin)
Killed
make[2]: *** [../scripts/Makefile.vmlinux_o:68: vmlinux.o] Error 137
make[2]: *** Deleting file 'vmlinux.o'
make[1]: *** [/var/lib/jenkins/workspace/linux-media/Makefile:1171: vmlinux] Error 2
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media/x86_64_yes'
make: *** [Makefile:222: __sub-make] Error 2
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch x86_64 (builtin/mod)
[Pipeline] // parallel
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] step
