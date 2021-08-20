Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8240A3F2E27
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 16:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238451AbhHTOfh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Aug 2021 10:35:37 -0400
Received: from www.linuxtv.org ([130.149.80.248]:52278 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231706AbhHTOfg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Aug 2021 10:35:36 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mH5bl-007VfP-QJ; Fri, 20 Aug 2021 14:34:57 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mH5bk-00FHLw-0i; Fri, 20 Aug 2021 14:34:55 +0000
Date:   Fri, 20 Aug 2021 14:34:54 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1419478388.2.1629470094728@builder.linuxtv.org>
Subject: Build failed in Jenkins: linux-media #245
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: linux-media
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/linux-media/245/display/redirect>

Changes:


------------------------------------------
[...truncated 24824 lines...]
  CC [M]  drivers/staging/vt6656/vt6656_stage.mod.o
  CC [M]  kernel/trace/preemptirq_delay_test.mod.o
  CC [M]  lib/livepatch/test_klp_atomic_replace.mod.o
  CC [M]  lib/livepatch/test_klp_callbacks_busy.mod.o
  CC [M]  lib/livepatch/test_klp_callbacks_demo.mod.o
  CC [M]  lib/livepatch/test_klp_callbacks_demo2.mod.o
  CC [M]  lib/livepatch/test_klp_callbacks_mod.mod.o
  CC [M]  lib/livepatch/test_klp_livepatch.mod.o
  CC [M]  lib/livepatch/test_klp_shadow_vars.mod.o
  CC [M]  lib/livepatch/test_klp_state.mod.o
  CC [M]  lib/livepatch/test_klp_state2.mod.o
  CC [M]  lib/livepatch/test_klp_state3.mod.o
  CC [M]  lib/percpu_test.mod.o
  CC [M]  lib/test_bitops.mod.o
  CC [M]  lib/test_blackhole_dev.mod.o
  CC [M]  lib/test_bpf.mod.o
  CC [M]  lib/test_kasan_module.mod.o
  CC [M]  lib/test_kmod.mod.o
  CC [M]  lib/test_lockup.mod.o
  CC [M]  lib/test_module.mod.o
  CC [M]  lib/test_static_key_base.mod.o
  CC [M]  lib/test_static_keys.mod.o
  CC [M]  lib/test_ubsan.mod.o
  CC [M]  lib/test_user_copy.mod.o
  CC [M]  lib/test_vmalloc.mod.o
  CC [M]  samples/configfs/configfs_sample.mod.o
  CC [M]  samples/connector/cn_test.mod.o
  CC [M]  samples/ftrace/ftrace-direct-modify.mod.o
  CC [M]  samples/ftrace/ftrace-direct-too.mod.o
  CC [M]  samples/ftrace/ftrace-direct.mod.o
  CC [M]  samples/ftrace/sample-trace-array.mod.o
  CC [M]  samples/hw_breakpoint/data_breakpoint.mod.o
  CC [M]  samples/kdb/kdb_hello.mod.o
  CC [M]  samples/kfifo/bytestream-example.mod.o
  CC [M]  samples/kfifo/dma-example.mod.o
  CC [M]  samples/kfifo/inttype-example.mod.o
  CC [M]  samples/kfifo/record-example.mod.o
  CC [M]  samples/kmemleak/kmemleak-test.mod.o
  CC [M]  samples/kprobes/kprobe_example.mod.o
  CC [M]  samples/kprobes/kretprobe_example.mod.o
  CC [M]  samples/livepatch/livepatch-callbacks-busymod.mod.o
  CC [M]  samples/livepatch/livepatch-callbacks-demo.mod.o
  CC [M]  samples/livepatch/livepatch-callbacks-mod.mod.o
  CC [M]  samples/livepatch/livepatch-sample.mod.o
  CC [M]  samples/livepatch/livepatch-shadow-fix1.mod.o
  CC [M]  samples/livepatch/livepatch-shadow-fix2.mod.o
  CC [M]  samples/livepatch/livepatch-shadow-mod.mod.o
  CC [M]  samples/rpmsg/rpmsg_client_sample.mod.o
  CC [M]  samples/trace_events/trace-events-sample.mod.o
  CC [M]  samples/trace_printk/trace-printk.mod.o
  CC [M]  samples/vfio-mdev/mbochs.mod.o
  CC [M]  samples/vfio-mdev/mdpy-fb.mod.o
  CC [M]  samples/vfio-mdev/mdpy.mod.o
  CC [M]  samples/vfio-mdev/mtty.mod.o
  LD [M]  arch/x86/mm/testmmiotrace.ko
  LD [M]  drivers/accessibility/speakup/speakup_decpc.ko
  LD [M]  drivers/base/test/test_async_driver_probe.ko
  LD [M]  drivers/i2c/i2c-stub.ko
  LD [M]  drivers/mtd/tests/mtd_nandbiterrs.ko
  LD [M]  drivers/mtd/tests/mtd_nandecctest.ko
  LD [M]  drivers/mtd/tests/mtd_oobtest.ko
  LD [M]  drivers/mtd/tests/mtd_pagetest.ko
  LD [M]  drivers/mtd/tests/mtd_readtest.ko
  LD [M]  drivers/mtd/tests/mtd_speedtest.ko
  LD [M]  drivers/mtd/tests/mtd_stresstest.ko
  LD [M]  drivers/mtd/tests/mtd_subpagetest.ko
  LD [M]  drivers/ntb/hw/epf/ntb_hw_epf.ko
  LD [M]  drivers/mtd/tests/mtd_torturetest.ko
  LD [M]  drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.ko
  LD [M]  drivers/scsi/mpi3mr/mpi3mr.ko
  LD [M]  drivers/scsi/pcmcia/aha152x_cs.ko
  LD [M]  drivers/scsi/pcmcia/fdomain_cs.ko
  LD [M]  drivers/scsi/pcmcia/nsp_cs.ko
  LD [M]  drivers/scsi/pcmcia/qlogic_cs.ko
  LD [M]  drivers/scsi/pcmcia/sym53c500_cs.ko
  LD [M]  drivers/scsi/qlogicfas408.ko
  LD [M]  drivers/spi/spi-loopback-test.ko
  LD [M]  drivers/staging/gdm724x/gdmtty.ko
  LD [M]  drivers/staging/gdm724x/gdmulte.ko
  LD [M]  drivers/staging/rtl8188eu/r8188eu.ko
  LD [M]  drivers/staging/rtl8192e/rtl8192e/r8192e_pci.ko
  LD [M]  drivers/staging/rtl8192e/rtllib.ko
  LD [M]  drivers/staging/rtl8192e/rtllib_crypt_ccmp.ko
  LD [M]  drivers/staging/rtl8192e/rtllib_crypt_tkip.ko
  LD [M]  drivers/staging/rtl8192e/rtllib_crypt_wep.ko
  LD [M]  drivers/staging/rtl8192u/r8192u_usb.ko
  LD [M]  drivers/staging/rtl8723bs/r8723bs.ko
  LD [M]  drivers/staging/vt6655/vt6655_stage.ko
  LD [M]  drivers/staging/vt6656/vt6656_stage.ko
  LD [M]  kernel/trace/preemptirq_delay_test.ko
  LD [M]  lib/livepatch/test_klp_atomic_replace.ko
  LD [M]  lib/livepatch/test_klp_callbacks_busy.ko
  LD [M]  lib/livepatch/test_klp_callbacks_demo.ko
  LD [M]  lib/livepatch/test_klp_callbacks_demo2.ko
  LD [M]  lib/livepatch/test_klp_callbacks_mod.ko
  LD [M]  lib/livepatch/test_klp_livepatch.ko
  LD [M]  lib/livepatch/test_klp_shadow_vars.ko
  LD [M]  lib/livepatch/test_klp_state.ko
  LD [M]  lib/livepatch/test_klp_state2.ko
  LD [M]  lib/livepatch/test_klp_state3.ko
  LD [M]  lib/percpu_test.ko
  LD [M]  lib/test_bitops.ko
  LD [M]  lib/test_blackhole_dev.ko
  LD [M]  lib/test_kasan_module.ko
  LD [M]  lib/test_bpf.ko
  LD [M]  lib/test_kmod.ko
  LD [M]  lib/test_module.ko
  LD [M]  lib/test_static_key_base.ko
  LD [M]  lib/test_static_keys.ko
  LD [M]  lib/test_ubsan.ko
  LD [M]  lib/test_user_copy.ko
  LD [M]  lib/test_vmalloc.ko
  LD [M]  samples/configfs/configfs_sample.ko
  LD [M]  samples/connector/cn_test.ko
  LD [M]  lib/test_lockup.ko
  LD [M]  samples/ftrace/ftrace-direct-modify.ko
  LD [M]  samples/ftrace/ftrace-direct-too.ko
  LD [M]  samples/ftrace/ftrace-direct.ko
  LD [M]  samples/ftrace/sample-trace-array.ko
  LD [M]  samples/kdb/kdb_hello.ko
  LD [M]  samples/kfifo/bytestream-example.ko
  LD [M]  samples/kfifo/dma-example.ko
  LD [M]  samples/hw_breakpoint/data_breakpoint.ko
  LD [M]  samples/kfifo/inttype-example.ko
  LD [M]  samples/kfifo/record-example.ko
  LD [M]  samples/kmemleak/kmemleak-test.ko
  LD [M]  samples/kprobes/kprobe_example.ko
  LD [M]  samples/kprobes/kretprobe_example.ko
  LD [M]  samples/livepatch/livepatch-callbacks-busymod.ko
  LD [M]  samples/livepatch/livepatch-callbacks-demo.ko
  LD [M]  samples/livepatch/livepatch-callbacks-mod.ko
  LD [M]  samples/livepatch/livepatch-sample.ko
  LD [M]  samples/livepatch/livepatch-shadow-fix1.ko
  LD [M]  samples/livepatch/livepatch-shadow-fix2.ko
  LD [M]  samples/livepatch/livepatch-shadow-mod.ko
  LD [M]  samples/rpmsg/rpmsg_client_sample.ko
  LD [M]  samples/trace_events/trace-events-sample.ko
  LD [M]  samples/trace_printk/trace-printk.ko
  LD [M]  samples/vfio-mdev/mdpy-fb.ko
  LD [M]  samples/vfio-mdev/mbochs.ko
  LD [M]  samples/vfio-mdev/mdpy.ko
  LD [M]  samples/vfio-mdev/mtty.ko
  MKPIGGY arch/x86/boot/compressed/piggy.S
  AS      arch/x86/boot/compressed/piggy.o
  LD      arch/x86/boot/compressed/vmlinux
  ZOFFSET arch/x86/boot/zoffset.h
  OBJCOPY arch/x86/boot/vmlinux.bin
  AS      arch/x86/boot/header.o
  LD      arch/x86/boot/setup.elf
  OBJCOPY arch/x86/boot/setup.bin
  BUILD   arch/x86/boot/bzImage
Kernel: arch/x86/boot/bzImage is ready  (#11)
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/arm_yes'
+ make O=arm64_yes CROSS_COMPILER=/usr/bin/aarch64-linux-gnu- allyesconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media@2/arm64_yes'
  GEN     Makefile
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/arm64_yes'
+ ./scripts/config --file arm64_yes/.config -d MODULE_SIG -d KEYS -d IMA -d CONFIG_DEBUG_INFO -d SYSTEM_TRUSTED_KEYRING -d MODVERSIONS
+ make O=arm64_yes CROSS_COMPILER=/usr/bin/aarch64-linux-gnu- -j9
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media@2/arm64_yes'
  SYNC    include/config/auto.conf.cmd
  GEN     Makefile
  GEN     Makefile
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  arch/x86/tools/relocs_64.o
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/unifdef
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  arch/x86/tools/relocs_common.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTLD  arch/x86/tools/relocs
  SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  SYSTBL  arch/x86/include/generated/asm/syscalls_x32.h
  LEX     scripts/dtc/dtc-lexer.lex.c
  DESCEND objtool
  HYPERCALLS arch/x86/include/generated/asm/xen-hypercalls.h
  YACC    scripts/dtc/dtc-parser.tab.[ch]
  HOSTCC  scripts/dtc/libfdt/fdt.o
  HOSTCC  scripts/dtc/libfdt/fdt_ro.o
  HOSTCC  scripts/dtc/libfdt/fdt_wip.o
  HOSTCC  scripts/dtc/libfdt/fdt_sw.o
  HOSTCC  scripts/dtc/libfdt/fdt_rw.o
  HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
  HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
  HOSTCC  scripts/dtc/libfdt/fdt_addresses.o
  HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
  HOSTCC  scripts/dtc/fdtoverlay.o
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTLD  scripts/dtc/dtc
  HOSTLD  scripts/dtc/fdtoverlay
  HOSTCC  scripts/bin2c
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/sorttable
  HOSTCC  scripts/asn1_compiler
  HOSTCC  scripts/sign-file
  HOSTCC  scripts/extract-cert
  HOSTCC  scripts/selinux/genheaders/genheaders
make[5]: *** No rule to make target '/usr/lib/gcc/x86_64-linux-gnu/8/include/stddef.h', needed by '/var/lib/jenkins/workspace/linux-media@2/arm64_yes/tools/objtool/fixdep.o'.  Stop.
make[4]: *** [Makefile:47: /var/lib/jenkins/workspace/linux-media@2/arm64_yes/tools/objtool/fixdep-in.o] Error 2
make[3]: *** [/var/lib/jenkins/workspace/linux-media@2/tools/build/Makefile.include:5: fixdep] Error 2
make[2]: *** [Makefile:69: objtool] Error 2
make[1]: *** [/var/lib/jenkins/workspace/linux-media@2/Makefile:1355: tools/objtool] Error 2
make[1]: *** Waiting for unfinished jobs....
  HOSTCC  scripts/insert-sys-cert
  HOSTCC  scripts/selinux/mdp/mdp
  UPD     include/config/kernel.release
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/arm64_yes'
make: *** [Makefile:220: __sub-make] Error 2
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch arm/aarch64 (builtin)
[Pipeline] // parallel
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] step
