Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB20538746C
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 10:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347600AbhERI4V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 04:56:21 -0400
Received: from www.linuxtv.org ([130.149.80.248]:34614 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240325AbhERI4U (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 04:56:20 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1livVF-008wdJ-N8; Tue, 18 May 2021 08:55:02 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1livZV-0003eY-4T; Tue, 18 May 2021 08:59:25 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.14] Minor RC & DVB updates (#74265)
Date:   Tue, 18 May 2021 08:59:24 +0000
Message-Id: <20210518085924.14001-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210513091426.GA12409@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210513091426.GA12409@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/107569/
Build time: 00:05:44
Link: https://lore.kernel.org/linux-media/20210513091426.GA12409@gofer.mess.org

gpg: Signature made Thu 13 May 2021 09:06:38 AM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: got 8/8 patches with issues, being 8 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-lirc-remove-out-of-date-comment.patch:

    allmodconfig: return code #512:
	ERROR: modpost: "module_layout" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__x86_indirect_alt_call_r14" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__x86_indirect_alt_call_r13" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__asan_register_globals" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__asan_unregister_globals" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "param_ops_bool" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "param_ops_int" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "memcpy" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "snprintf" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "kmem_cache_alloc_trace" [drivers/staging/media/zoran/zr36060.ko] undefined!
	WARNING: modpost: suppressed 2741 unresolved symbol warnings because there were too many)
	make[2]: *** [../scripts/Makefile.modpost:150: drivers/staging/media/Module.symvers] Error 1
	make[2]: *** Deleting file 'drivers/staging/media/Module.symvers'
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1754: modules] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/platform/exynos4-is/media-dev.c:1287:6: warning: unused variable ‘ret’ [-Wunused-variable]
	ERROR: modpost: "module_layout" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_register_globals" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_unregister_globals" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "usb_deregister" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "usb_register_driver" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__mutex_init" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "_dev_err" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__sanitizer_cov_trace_const_cmp2" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_load2_noabort" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "msleep" [drivers/media/radio/radio-raremono.ko] undefined!
	WARNING: modpost: suppressed 33831 unresolved symbol warnings because there were too many)
	make[2]: *** [../scripts/Makefile.modpost:150: drivers/media/Module.symvers] Error 1
	make[2]: *** Deleting file 'drivers/media/Module.symvers'
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1754: modules] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

patches/0002-media-rc-remove-tango-ir-driver-and-keymap.patch:

    allmodconfig: return code #512:
	ERROR: modpost: "module_layout" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__x86_indirect_alt_call_r14" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__x86_indirect_alt_call_r13" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__asan_register_globals" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__asan_unregister_globals" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "param_ops_bool" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "param_ops_int" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "memcpy" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "snprintf" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "kmem_cache_alloc_trace" [drivers/staging/media/zoran/zr36060.ko] undefined!
	WARNING: modpost: suppressed 2741 unresolved symbol warnings because there were too many)
	make[2]: *** [../scripts/Makefile.modpost:150: drivers/staging/media/Module.symvers] Error 1
	make[2]: *** Deleting file 'drivers/staging/media/Module.symvers'
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1754: modules] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

    allmodconfig: return code #512:
	ERROR: modpost: "module_layout" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_register_globals" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_unregister_globals" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "usb_deregister" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "usb_register_driver" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__mutex_init" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "_dev_err" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__sanitizer_cov_trace_const_cmp2" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_load2_noabort" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "msleep" [drivers/media/radio/radio-raremono.ko] undefined!
	WARNING: modpost: suppressed 33802 unresolved symbol warnings because there were too many)
	make[2]: *** [../scripts/Makefile.modpost:150: drivers/media/Module.symvers] Error 1
	make[2]: *** Deleting file 'drivers/media/Module.symvers'
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1754: modules] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0002-media-rc-remove-tango-ir-driver-and-keymap.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:40: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:43: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0003-media-rc-clean-up-Kconfig-dependencies.patch:

    allmodconfig: return code #512:
	ERROR: modpost: "module_layout" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__x86_indirect_alt_call_r14" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__x86_indirect_alt_call_r13" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__asan_register_globals" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__asan_unregister_globals" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "param_ops_bool" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "param_ops_int" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "memcpy" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "snprintf" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "kmem_cache_alloc_trace" [drivers/staging/media/zoran/zr36060.ko] undefined!
	WARNING: modpost: suppressed 2741 unresolved symbol warnings because there were too many)
	make[2]: *** [../scripts/Makefile.modpost:150: drivers/staging/media/Module.symvers] Error 1
	make[2]: *** Deleting file 'drivers/staging/media/Module.symvers'
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1754: modules] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

    allmodconfig: return code #512:
	ERROR: modpost: "module_layout" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_register_globals" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_unregister_globals" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "usb_deregister" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "usb_register_driver" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__mutex_init" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "_dev_err" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__sanitizer_cov_trace_const_cmp2" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_load2_noabort" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "msleep" [drivers/media/radio/radio-raremono.ko] undefined!
	WARNING: modpost: suppressed 33802 unresolved symbol warnings because there were too many)
	make[2]: *** [../scripts/Makefile.modpost:150: drivers/media/Module.symvers] Error 1
	make[2]: *** Deleting file 'drivers/media/Module.symvers'
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1754: modules] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

patches/0004-media-siano-use-DEFINE_MUTEX-for-mutex-lock-and-LIST.patch:

    allmodconfig: return code #512:
	ERROR: modpost: "module_layout" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__x86_indirect_alt_call_r14" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__x86_indirect_alt_call_r13" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__asan_register_globals" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__asan_unregister_globals" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "param_ops_bool" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "param_ops_int" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "memcpy" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "snprintf" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "kmem_cache_alloc_trace" [drivers/staging/media/zoran/zr36060.ko] undefined!
	WARNING: modpost: suppressed 2741 unresolved symbol warnings because there were too many)
	make[2]: *** [../scripts/Makefile.modpost:150: drivers/staging/media/Module.symvers] Error 1
	make[2]: *** Deleting file 'drivers/staging/media/Module.symvers'
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1754: modules] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

    allmodconfig: return code #512:
	ERROR: modpost: "module_layout" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_register_globals" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_unregister_globals" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "usb_deregister" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "usb_register_driver" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__mutex_init" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "_dev_err" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__sanitizer_cov_trace_const_cmp2" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_load2_noabort" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "msleep" [drivers/media/radio/radio-raremono.ko] undefined!
	WARNING: modpost: suppressed 33801 unresolved symbol warnings because there were too many)
	make[2]: *** [../scripts/Makefile.modpost:150: drivers/media/Module.symvers] Error 1
	make[2]: *** Deleting file 'drivers/media/Module.symvers'
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1754: modules] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

patches/0005-media-dvb-frontends-remove-redundant-words-and-fix-s.patch:

    allmodconfig: return code #512:
	ERROR: modpost: "module_layout" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__x86_indirect_alt_call_r14" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__x86_indirect_alt_call_r13" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__asan_register_globals" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__asan_unregister_globals" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "param_ops_bool" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "param_ops_int" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "memcpy" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "snprintf" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "kmem_cache_alloc_trace" [drivers/staging/media/zoran/zr36060.ko] undefined!
	WARNING: modpost: suppressed 2741 unresolved symbol warnings because there were too many)
	make[2]: *** [../scripts/Makefile.modpost:150: drivers/staging/media/Module.symvers] Error 1
	make[2]: *** Deleting file 'drivers/staging/media/Module.symvers'
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1754: modules] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

    allmodconfig: return code #512:
	ERROR: modpost: "module_layout" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_register_globals" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_unregister_globals" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "usb_deregister" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "usb_register_driver" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__mutex_init" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "_dev_err" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__sanitizer_cov_trace_const_cmp2" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_load2_noabort" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "msleep" [drivers/media/radio/radio-raremono.ko] undefined!
	WARNING: modpost: suppressed 33801 unresolved symbol warnings because there were too many)
	make[2]: *** [../scripts/Makefile.modpost:150: drivers/media/Module.symvers] Error 1
	make[2]: *** Deleting file 'drivers/media/Module.symvers'
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1754: modules] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

patches/0006-media-rc-i2c-Fix-an-error-message.patch:

    allmodconfig: return code #512:
	ERROR: modpost: "module_layout" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__x86_indirect_alt_call_r14" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__x86_indirect_alt_call_r13" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__asan_register_globals" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__asan_unregister_globals" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "param_ops_bool" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "param_ops_int" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "memcpy" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "snprintf" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "kmem_cache_alloc_trace" [drivers/staging/media/zoran/zr36060.ko] undefined!
	WARNING: modpost: suppressed 2741 unresolved symbol warnings because there were too many)
	make[2]: *** [../scripts/Makefile.modpost:150: drivers/staging/media/Module.symvers] Error 1
	make[2]: *** Deleting file 'drivers/staging/media/Module.symvers'
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1754: modules] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

    allmodconfig: return code #512:
	ERROR: modpost: "module_layout" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_register_globals" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_unregister_globals" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "usb_deregister" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "usb_register_driver" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__mutex_init" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "_dev_err" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__sanitizer_cov_trace_const_cmp2" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_load2_noabort" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "msleep" [drivers/media/radio/radio-raremono.ko] undefined!
	WARNING: modpost: suppressed 33801 unresolved symbol warnings because there were too many)
	make[2]: *** [../scripts/Makefile.modpost:150: drivers/media/Module.symvers] Error 1
	make[2]: *** Deleting file 'drivers/media/Module.symvers'
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1754: modules] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

patches/0007-media-lmedm04-delete-lme2510_get_adapter_count.patch:

    allmodconfig: return code #512:
	ERROR: modpost: "module_layout" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__x86_indirect_alt_call_r14" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__x86_indirect_alt_call_r13" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__asan_register_globals" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__asan_unregister_globals" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "param_ops_bool" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "param_ops_int" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "memcpy" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "snprintf" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "kmem_cache_alloc_trace" [drivers/staging/media/zoran/zr36060.ko] undefined!
	WARNING: modpost: suppressed 2741 unresolved symbol warnings because there were too many)
	make[2]: *** [../scripts/Makefile.modpost:150: drivers/staging/media/Module.symvers] Error 1
	make[2]: *** Deleting file 'drivers/staging/media/Module.symvers'
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1754: modules] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

    allmodconfig: return code #512:
	ERROR: modpost: "module_layout" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_register_globals" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_unregister_globals" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "usb_deregister" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "usb_register_driver" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__mutex_init" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "_dev_err" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__sanitizer_cov_trace_const_cmp2" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_load2_noabort" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "msleep" [drivers/media/radio/radio-raremono.ko] undefined!
	WARNING: modpost: suppressed 33801 unresolved symbol warnings because there were too many)
	make[2]: *** [../scripts/Makefile.modpost:150: drivers/media/Module.symvers] Error 1
	make[2]: *** Deleting file 'drivers/media/Module.symvers'
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1754: modules] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

patches/0008-media-dvb-usb-fix-wrong-definition.patch:

    allmodconfig: return code #512:
	ERROR: modpost: "module_layout" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__x86_indirect_alt_call_r14" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__x86_indirect_alt_call_r13" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__asan_register_globals" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "__asan_unregister_globals" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "param_ops_bool" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "param_ops_int" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "memcpy" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "snprintf" [drivers/staging/media/zoran/zr36060.ko] undefined!
	ERROR: modpost: "kmem_cache_alloc_trace" [drivers/staging/media/zoran/zr36060.ko] undefined!
	WARNING: modpost: suppressed 2741 unresolved symbol warnings because there were too many)
	make[2]: *** [../scripts/Makefile.modpost:150: drivers/staging/media/Module.symvers] Error 1
	make[2]: *** Deleting file 'drivers/staging/media/Module.symvers'
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1754: modules] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

    allmodconfig: return code #512:
	ERROR: modpost: "module_layout" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_register_globals" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_unregister_globals" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "usb_deregister" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "usb_register_driver" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__mutex_init" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "_dev_err" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__sanitizer_cov_trace_const_cmp2" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "__asan_load2_noabort" [drivers/media/radio/radio-raremono.ko] undefined!
	ERROR: modpost: "msleep" [drivers/media/radio/radio-raremono.ko] undefined!
	WARNING: modpost: suppressed 33801 unresolved symbol warnings because there were too many)
	make[2]: *** [../scripts/Makefile.modpost:150: drivers/media/Module.symvers] Error 1
	make[2]: *** Deleting file 'drivers/media/Module.symvers'
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1754: modules] Error 2
	make: *** [Makefile:215: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0008-media-dvb-usb-fix-wrong-definition.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:17: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

