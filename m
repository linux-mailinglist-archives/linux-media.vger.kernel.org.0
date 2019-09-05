Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84014AAA51
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 19:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733236AbfIERpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 13:45:51 -0400
Received: from smtprelay0177.hostedemail.com ([216.40.44.177]:54813 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729101AbfIERpu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 13:45:50 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 4D6DC18029210;
        Thu,  5 Sep 2019 17:45:42 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::::,RULES_HIT:146:152:355:379:421:599:857:960:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1593:1594:1605:1730:1747:1777:1792:1801:2197:2199:2393:2525:2538:2539:2560:2563:2682:2685:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3622:3865:3866:3867:3868:3870:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:4384:4559:4605:5007:6299:7875:7901:7903:7974:8957:9025:9038:10004:10848:11026:11232:11657:11914:12043:12050:12296:12297:12438:12555:12740:12895:12986:13894:13972:14096:14097:14659:21080:21221:21326:21433:21451:21627:21740:21773:30028:30054:30055:30060:30064:30067:30070:30091,0,RBL:47.151.152.152:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:27,LUA_SUMMARY:none
X-HE-Tag: bun89_4e7388250d659
X-Filterd-Recvd-Size: 76350
Received: from XPS-9350.home (unknown [47.151.152.152])
        (Authenticated sender: joe@perches.com)
        by omf11.hostedemail.com (Postfix) with ESMTPA;
        Thu,  5 Sep 2019 17:45:38 +0000 (UTC)
Message-ID: <b32c2e46b91e7bcda2a9bd140673f06d71b2487a.camel@perches.com>
Subject: Re: [PATCH] docs: license-rules.txt: cover SPDX headers on Python
 scripts
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jessica Yu <jeyu@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org
Date:   Thu, 05 Sep 2019 10:45:36 -0700
In-Reply-To: <20190905090701.37dcf75e@coco.lan>
References: <20190905055614.7958918b@coco.lan>
         <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
         <20190905092703.GA30899@kroah.com> <20190905090701.37dcf75e@coco.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-09-05 at 09:07 -0300, Mauro Carvalho Chehab wrote:
> There are currently 227 files that don't complain with the "up to line 3"
> rule, including COPYING (with should probably be excluded from the check).
> 
> Patches are at:
> 
> 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=spdx_pedantic
> 
> Btw, most violations are due to:
> 
> /*
>  * SPDX...

Hey Mauro.

Here's a little script to move all of the improperly located
SPDX-License-Identifier lines in [.ch] files.

Using this command line:

$ git grep -n 'SPDX-License-Identifier: ' -- '*.[ch]' | \
  grep -v ':1:' | perl move_spdx.pl

and

$ cat move_spdx.pl
while (<>) {
    /^([^:]+):([^:]+):(.*)/;
    my ($file, $line, $spdx) = ($1, $2, $3);
    $spdx =~ s/^\s*\/?\*\s*//;
    $spdx =~ s/\s*\*\/\s*$//;
    if ($file =~ /\.h$/) {
	$spdx = "/* $spdx */";
    } else {
	$spdx = "// $spdx";
    }
    open(FH, '<', $file) or die $!;
    my @lines = <FH>;
    close FH;
    open(FH, '>', $file) or die $!;
    print FH "$spdx\n";
    my $count = 0;
    foreach (@lines) {
	$count++;
	next if ($count == $line);
	next if ($count == $line - 1 && $_ =~ /^\s*\*\s*$/);
	next if ($count == $line + 1 && $_ =~ /^\s*\*\s*$/);
	print FH "$_";
    }
    close FH;
}

which gives this diff for today's -next
---
 arch/x86/kernel/apic/apic_common.c                      | 3 +--
 drivers/dma/sprd-dma.c                                  | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_busy.c                | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c             | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_clflush.h             | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_context.c             | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_context.h             | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h       | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c              | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_domain.c              | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c          | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_fence.c               | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_internal.c            | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h              | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_mman.c                | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_object.h              | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h        | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_pages.c               | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_phys.c                | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_pm.c                  | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_pm.h                  | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c               | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c            | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c              | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_throttle.c            | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c              | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c             | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_wait.c                | 3 +--
 drivers/gpu/drm/i915/gem/i915_gemfs.c                   | 3 +--
 drivers/gpu/drm/i915/gem/i915_gemfs.h                   | 3 +--
 drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c    | 3 +--
 drivers/gpu/drm/i915/gem/selftests/huge_gem_object.h    | 3 +--
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c         | 3 +--
 drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c | 3 +--
 drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c   | 3 +--
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c    | 3 +--
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c      | 3 +--
 drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c    | 3 +--
 drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c      | 3 +--
 drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c      | 3 +--
 drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.h      | 3 +--
 drivers/gpu/drm/i915/gem/selftests/mock_context.c       | 3 +--
 drivers/gpu/drm/i915/gem/selftests/mock_context.h       | 3 +--
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c        | 3 +--
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h        | 3 +--
 drivers/gpu/drm/i915/gem/selftests/mock_gem_object.h    | 3 +--
 drivers/gpu/drm/i915/gt/intel_context.c                 | 3 +--
 drivers/gpu/drm/i915/gt/intel_context.h                 | 3 +--
 drivers/gpu/drm/i915/gt/intel_context_types.h           | 3 +--
 drivers/gpu/drm/i915/gt/intel_engine_pm.c               | 3 +--
 drivers/gpu/drm/i915/gt/intel_engine_pm.h               | 3 +--
 drivers/gpu/drm/i915/gt/intel_engine_pool.c             | 3 +--
 drivers/gpu/drm/i915/gt/intel_engine_pool.h             | 3 +--
 drivers/gpu/drm/i915/gt/intel_engine_pool_types.h       | 3 +--
 drivers/gpu/drm/i915/gt/intel_engine_types.h            | 3 +--
 drivers/gpu/drm/i915/gt/intel_engine_user.c             | 3 +--
 drivers/gpu/drm/i915/gt/intel_engine_user.h             | 3 +--
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h            | 3 +--
 drivers/gpu/drm/i915/gt/intel_gt_irq.c                  | 3 +--
 drivers/gpu/drm/i915/gt/intel_gt_irq.h                  | 3 +--
 drivers/gpu/drm/i915/gt/intel_gt_pm.c                   | 3 +--
 drivers/gpu/drm/i915/gt/intel_gt_pm.h                   | 3 +--
 drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c               | 3 +--
 drivers/gpu/drm/i915/gt/intel_gt_pm_irq.h               | 3 +--
 drivers/gpu/drm/i915/gt/intel_lrc_reg.h                 | 3 +--
 drivers/gpu/drm/i915/gt/intel_reset.c                   | 3 +--
 drivers/gpu/drm/i915/gt/intel_reset.h                   | 3 +--
 drivers/gpu/drm/i915/gt/intel_sseu.c                    | 3 +--
 drivers/gpu/drm/i915/gt/intel_sseu.h                    | 3 +--
 drivers/gpu/drm/i915/gt/intel_timeline.c                | 3 +--
 drivers/gpu/drm/i915/gt/intel_timeline_types.h          | 3 +--
 drivers/gpu/drm/i915/gt/intel_workarounds.c             | 3 +--
 drivers/gpu/drm/i915/gt/intel_workarounds.h             | 3 +--
 drivers/gpu/drm/i915/gt/intel_workarounds_types.h       | 3 +--
 drivers/gpu/drm/i915/gt/selftest_context.c              | 3 +--
 drivers/gpu/drm/i915/gt/selftest_engine.c               | 3 +--
 drivers/gpu/drm/i915/gt/selftest_engine.h               | 3 +--
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c            | 3 +--
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c            | 3 +--
 drivers/gpu/drm/i915/gt/selftest_lrc.c                  | 3 +--
 drivers/gpu/drm/i915/gt/selftest_timeline.c             | 3 +--
 drivers/gpu/drm/i915/gt/selftest_workarounds.c          | 3 +--
 drivers/gpu/drm/i915/gt/selftests/mock_timeline.c       | 3 +--
 drivers/gpu/drm/i915/gt/selftests/mock_timeline.h       | 3 +--
 drivers/gpu/drm/i915/i915_active.c                      | 3 +--
 drivers/gpu/drm/i915/i915_active.h                      | 3 +--
 drivers/gpu/drm/i915/i915_active_types.h                | 3 +--
 drivers/gpu/drm/i915/i915_getparam.c                    | 2 +-
 drivers/gpu/drm/i915/i915_globals.c                     | 3 +--
 drivers/gpu/drm/i915/i915_globals.h                     | 3 +--
 drivers/gpu/drm/i915/i915_gpu_error.h                   | 3 +--
 drivers/gpu/drm/i915/i915_pmu.c                         | 3 +--
 drivers/gpu/drm/i915/i915_pmu.h                         | 3 +--
 drivers/gpu/drm/i915/i915_priolist_types.h              | 3 +--
 drivers/gpu/drm/i915/i915_query.c                       | 3 +--
 drivers/gpu/drm/i915/i915_query.h                       | 3 +--
 drivers/gpu/drm/i915/i915_scatterlist.c                 | 3 +--
 drivers/gpu/drm/i915/i915_scatterlist.h                 | 3 +--
 drivers/gpu/drm/i915/i915_scheduler.c                   | 3 +--
 drivers/gpu/drm/i915/i915_scheduler.h                   | 3 +--
 drivers/gpu/drm/i915/i915_scheduler_types.h             | 3 +--
 drivers/gpu/drm/i915/i915_sw_fence.c                    | 3 +--
 drivers/gpu/drm/i915/i915_sw_fence.h                    | 3 +--
 drivers/gpu/drm/i915/i915_user_extensions.c             | 3 +--
 drivers/gpu/drm/i915/i915_user_extensions.h             | 3 +--
 drivers/gpu/drm/i915/intel_wakeref.c                    | 3 +--
 drivers/gpu/drm/i915/intel_wakeref.h                    | 3 +--
 drivers/gpu/drm/i915/intel_wopcm.h                      | 3 +--
 drivers/gpu/drm/i915/selftests/i915_active.c            | 3 +--
 drivers/gpu/drm/i915/selftests/i915_gem.c               | 3 +--
 drivers/gpu/drm/i915/selftests/igt_flush_test.c         | 3 +--
 drivers/gpu/drm/i915/selftests/igt_flush_test.h         | 3 +--
 drivers/gpu/drm/i915/selftests/igt_live_test.c          | 3 +--
 drivers/gpu/drm/i915/selftests/igt_live_test.h          | 3 +--
 drivers/gpu/drm/i915/selftests/igt_reset.c              | 3 +--
 drivers/gpu/drm/i915/selftests/igt_reset.h              | 3 +--
 drivers/gpu/drm/i915/selftests/igt_spinner.c            | 3 +--
 drivers/gpu/drm/i915/selftests/igt_spinner.h            | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c                | 2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c              | 2 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c              | 2 +-
 drivers/hid/hid-redragon.c                              | 2 +-
 drivers/i2c/busses/i2c-sprd.c                           | 3 +--
 drivers/media/common/siano/smsir.h                      | 3 +--
 drivers/media/i2c/saa711x_regs.h                        | 2 +-
 drivers/media/i2c/tvp5150_reg.h                         | 3 +--
 drivers/media/pci/bt8xx/bttv-audio-hook.h               | 3 +--
 drivers/media/platform/meson/ao-cec.c                   | 3 +--
 drivers/media/rc/rc-core-priv.h                         | 2 +-
 drivers/media/tuners/tuner-xc2028-types.h               | 2 +-
 drivers/media/tuners/tuner-xc2028.h                     | 2 +-
 drivers/media/usb/tm6000/tm6000-regs.h                  | 2 +-
 drivers/media/usb/tm6000/tm6000-usb-isoc.h              | 2 +-
 drivers/media/usb/tm6000/tm6000.h                       | 2 +-
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c           | 3 +--
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h           | 3 +--
 drivers/pinctrl/meson/pinctrl-meson-axg.c               | 3 +--
 drivers/rtc/rtc-rtd119x.c                               | 3 +--
 drivers/rtc/rtc-sc27xx.c                                | 3 +--
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c                 | 3 +--
 drivers/soc/amlogic/meson-gx-socinfo.c                  | 3 +--
 drivers/soc/amlogic/meson-mx-socinfo.c                  | 3 +--
 drivers/spi/spi-meson-spicc.c                           | 3 +--
 drivers/spi/spi-sprd-adi.c                              | 3 +--
 drivers/watchdog/rtd119x_wdt.c                          | 3 +--
 include/acpi/nfit.h                                     | 2 +-
 include/dt-bindings/clock/sun8i-de2.h                   | 3 +--
 include/dt-bindings/gpio/meson-axg-gpio.h               | 3 +--
 include/dt-bindings/power/owl-s500-powergate.h          | 3 +--
 include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h  | 3 +--
 include/dt-bindings/reset/sun8i-de2.h                   | 3 +--
 include/linux/ascii85.h                                 | 3 +--
 include/linux/soc/actions/owl-sps.h                     | 3 +--
 include/media/dvb_vb2.h                                 | 3 +--
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h         | 3 +--
 tools/perf/util/rlimit.h                                | 2 +-
 156 files changed, 156 insertions(+), 298 deletions(-)

diff --git a/arch/x86/kernel/apic/apic_common.c b/arch/x86/kernel/apic/apic_common.c
index 02b4839478b1..08d06d98950f 100644
--- a/arch/x86/kernel/apic/apic_common.c
+++ b/arch/x86/kernel/apic/apic_common.c
@@ -1,7 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Common functions shared between the various APIC flavours
- *
- * SPDX-License-Identifier: GPL-2.0
  */
 #include <linux/irq.h>
 #include <asm/apic.h>
diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index baac476c8622..cb99293e69f0 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -1,7 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2017 Spreadtrum Communications Inc.
- *
- * SPDX-License-Identifier: GPL-2.0
  */
 
 #include <linux/clk.h>
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 3d4f5775a4ba..f0b81188049c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index b9f504ba3b32..3bb142dc9fc2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.h b/drivers/gpu/drm/i915/gem/i915_gem_clflush.h
index e6c382973129..9d7ee1579900 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 1cdfe05514c3..9c7b2bc4ecf7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2011-2012 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index 176978608b6f..47e0e4bd370b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 260d59cc3de8..925e04f5264b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 96ce95c8ac5a..d8a4cc157b50 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright 2012 Red Hat Inc
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 9c58e8fac1d9..19a11e649cec 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index b5f6937369ea..6206dadb8480 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2008,2010 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_fence.c b/drivers/gpu/drm/i915/gem/i915_gem_fence.c
index 2f6100ec2608..9dd59c069579 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_fence.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_fence.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
index 0c41e04ab8fa..0885a5b8ec13 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h b/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
index ddc7f2a52b3e..0326e985943c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 595539a09e38..c768689cd680 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 5efb9936e05b..99955c0f473c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index ede0eb4218a8..20cfee35d0fb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 18f0ce0135c1..7005dad1e5d7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index 768356908160..9cb0ea04a631 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index 92e53c25424c..e9bd18837a9c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.h b/drivers/gpu/drm/i915/gem/i915_gem_pm.h
index 6f7d5d11ac3b..e5d8c8adb8d9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 4c4954e8ce0a..e67d4e38d71c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index edd21d14e64f..21e86c4fa857 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2008-2015 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index aa533b4ab5f5..3a5e6ff7db52 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2008-2012 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_throttle.c b/drivers/gpu/drm/i915/gem/i915_gem_throttle.c
index 1e372420771b..fc2ee8a1cae7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_throttle.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_throttle.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
index ca0c2f451742..f3c6fd9aff46 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2008 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 74da35611d7c..09b7eae33f9f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2012-2014 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index 8af55cd3e690..821ce2eb98f6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
index 5e6e8c91ab38..68748aa2353e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
+++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2017 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.h b/drivers/gpu/drm/i915/gem/i915_gemfs.h
index 2a1e59af3e4a..66b6b12b92d8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gemfs.h
+++ b/drivers/gpu/drm/i915/gem/i915_gemfs.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2017 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
index 3c5d17b2b670..9f73d65324a1 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.h b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.h
index 549c1394bcdc..5afc1fa40d93 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index 8de83c6d81f5..0206f4c4023c 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2017 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
index 0ff7a89aadca..ae5f19f727e2 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2017 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index 3e6f4a65d356..879553853e3c 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2017 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index d85d1ce273ca..e57b3dc34d9a 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 1d27babff0ce..b959a18a583f 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
index 2b6db6f799de..aa40ec85ac35 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
index 94a15e3f6db8..f839e4383f38 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c b/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c
index 57ece53c1075..304b08212a41 100644
--- a/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c
+++ b/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.h b/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.h
index 361a7ef866b0..eb2303488c9e 100644
--- a/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.h
+++ b/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
index be8974ccff24..4145889d5de2 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.h b/drivers/gpu/drm/i915/gem/selftests/mock_context.h
index 0b926653914f..4a02874419a0 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_context.h
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
index b9e059d4328a..e110d104ab27 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h
index f0f8bbd82dfc..9ab4752a03d0 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_gem_object.h b/drivers/gpu/drm/i915/gem/selftests/mock_gem_object.h
index 370360b4a148..7cd66effb204 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_gem_object.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index f55691d151ae..53bb9ecba235 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index dd742ac2fbdb..9c52a5ed5f73 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index bf9cedfccbf0..d7939b6ef2e7 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index a372d4ea9370..4150ce5a466d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
index 739c50fefcef..974f59d3c39e 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pool.c b/drivers/gpu/drm/i915/gt/intel_engine_pool.c
index 4cd54c569911..9d6c22261cdf 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pool.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pool.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pool.h b/drivers/gpu/drm/i915/gt/intel_engine_pool.h
index 8d069efd9457..2e6235f0ac0d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pool.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pool.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pool_types.h b/drivers/gpu/drm/i915/gt/intel_engine_pool_types.h
index e31ee361b76f..c02df7210648 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pool_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pool_types.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index a82cea95c2f2..a1589365e880 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 77cd5de83930..095400eb5bb9 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.h b/drivers/gpu/drm/i915/gt/intel_engine_user.h
index f845ea1cbfaa..3dc7e8ab9fbc 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index 86e00a2db8a4..f080cae26d07 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright � 2003-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index 34a4fb624bf7..90f91d356d7b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.h b/drivers/gpu/drm/i915/gt/intel_gt_irq.h
index 8f37593712c9..43c2317f76a1 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index 1363e069ec83..88d23b0b959e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
index fb39d99cd6ee..dceeafbf0730 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c
index babe866126d7..811a11ed181c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.h b/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.h
index b29816a04809..ff766966d6fc 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_irq.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc_reg.h b/drivers/gpu/drm/i915/gt/intel_lrc_reg.h
index b8f20ad71169..6bc64bb0f0f3 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc_reg.h
+++ b/drivers/gpu/drm/i915/gt/intel_lrc_reg.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 077716442c90..67893b19d04e 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2008-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.h b/drivers/gpu/drm/i915/gt/intel_reset.h
index 37a987b17108..e7614ef1b1c5 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.h
+++ b/drivers/gpu/drm/i915/gt/intel_reset.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2008-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index 6bf2d87da109..74e8af721c1e 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
index b50d0401a4e2..49a258dab704 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.h
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index 02fbe11b671b..a40a38c61aca 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline_types.h b/drivers/gpu/drm/i915/gt/intel_timeline_types.h
index 2b1baf2fcc8e..6d36295ec936 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_timeline_types.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 126ab3667919..91442cec7500 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.h b/drivers/gpu/drm/i915/gt/intel_workarounds.h
index 8c9c769c2204..15abb68b6c00 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.h
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
index e27ab1b710b3..b496af2ef2f8 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
index 9d1ea26c7a2d..01029e46064f 100644
--- a/drivers/gpu/drm/i915/gt/selftest_context.c
+++ b/drivers/gpu/drm/i915/gt/selftest_context.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * SPDX-License-Identifier: GPL-2.0
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine.c b/drivers/gpu/drm/i915/gt/selftest_engine.c
index f65b118e261d..262764f6d90a 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * SPDX-License-Identifier: GPL-2.0
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine.h b/drivers/gpu/drm/i915/gt/selftest_engine.h
index ab32d09ec5a1..c6feb3bd2ccc 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine.h
+++ b/drivers/gpu/drm/i915/gt/selftest_engine.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
index 3880f07c29b8..777bd4fcff55 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * SPDX-License-Identifier: GPL-2.0
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_pm.c b/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
index 3a1419376912..9fac6b1918b4 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * SPDX-License-Identifier: GPL-2.0
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index d791158988d6..528130f26aff 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/drm/i915/gt/selftest_timeline.c
index 321481403165..7125d520e4c4 100644
--- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
+++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2017-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index d06d68ac2a3b..00973f604fd4 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/selftests/mock_timeline.c b/drivers/gpu/drm/i915/gt/selftests/mock_timeline.c
index 598170efcaf6..ce5189d115c9 100644
--- a/drivers/gpu/drm/i915/gt/selftests/mock_timeline.c
+++ b/drivers/gpu/drm/i915/gt/selftests/mock_timeline.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2017-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gt/selftests/mock_timeline.h b/drivers/gpu/drm/i915/gt/selftests/mock_timeline.h
index 689efc66c908..d76275559285 100644
--- a/drivers/gpu/drm/i915/gt/selftests/mock_timeline.h
+++ b/drivers/gpu/drm/i915/gt/selftests/mock_timeline.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2017-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 48e16ad93bbd..42cc64a6d31d 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/drm/i915/i915_active.h
index f95058f99057..2fabc6ee001a 100644
--- a/drivers/gpu/drm/i915/i915_active.h
+++ b/drivers/gpu/drm/i915/i915_active.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_active_types.h b/drivers/gpu/drm/i915/i915_active_types.h
index 1854e7d168c1..f069629bd025 100644
--- a/drivers/gpu/drm/i915/i915_active_types.h
+++ b/drivers/gpu/drm/i915/i915_active_types.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 5d9101376a3d..85fc011a2f6a 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -1,5 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
  */
 
 #include "gt/intel_engine_user.h"
diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
index be127cd28931..4f4ad64c1e5e 100644
--- a/drivers/gpu/drm/i915/i915_globals.c
+++ b/drivers/gpu/drm/i915/i915_globals.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i915_globals.h
index b2f5cd9b9b1a..af03d9ac1836 100644
--- a/drivers/gpu/drm/i915/i915_globals.h
+++ b/drivers/gpu/drm/i915/i915_globals.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index df9f57766626..41343570625f 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright � 2008-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 8e251e719390..82c1e2dc53b3 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2017-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_pmu.h b/drivers/gpu/drm/i915/i915_pmu.h
index 4fc4f2478301..e1d89fb7e995 100644
--- a/drivers/gpu/drm/i915/i915_pmu.h
+++ b/drivers/gpu/drm/i915/i915_pmu.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2017-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_priolist_types.h b/drivers/gpu/drm/i915/i915_priolist_types.h
index 21037a2e2038..980e7a5dd5af 100644
--- a/drivers/gpu/drm/i915/i915_priolist_types.h
+++ b/drivers/gpu/drm/i915/i915_priolist_types.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index ad9240a0817a..7c57209bdc21 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_query.h b/drivers/gpu/drm/i915/i915_query.h
index 31dcef181f63..94e03e773774 100644
--- a/drivers/gpu/drm/i915/i915_query.h
+++ b/drivers/gpu/drm/i915/i915_query.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
index cc6b3846a8c7..dff58cc52596 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.c
+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
index 6617963df9ed..33956d140f5c 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.h
+++ b/drivers/gpu/drm/i915/i915_scatterlist.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 7b84ebca2901..cd01ba047f30 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
index 7eefccff39bf..d51048152a14 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.h
+++ b/drivers/gpu/drm/i915/i915_scheduler.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
index aad81acba9dc..e0606bb9e95b 100644
--- a/drivers/gpu/drm/i915/i915_scheduler_types.h
+++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index 6a88db291252..b001fd6c2832 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * (C) Copyright 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drivers/gpu/drm/i915/i915_sw_fence.h
index ab7d58bd0b9d..7a6dbf033404 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.h
+++ b/drivers/gpu/drm/i915/i915_sw_fence.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * i915_sw_fence.h - library routines for N:M synchronisation points
  *
  * Copyright (C) 2016 Intel Corporation
diff --git a/drivers/gpu/drm/i915/i915_user_extensions.c b/drivers/gpu/drm/i915/i915_user_extensions.c
index c822d0aafd2d..d1450d333c66 100644
--- a/drivers/gpu/drm/i915/i915_user_extensions.c
+++ b/drivers/gpu/drm/i915/i915_user_extensions.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/i915_user_extensions.h b/drivers/gpu/drm/i915/i915_user_extensions.h
index a14bf6bba9a1..0760c95e0e5f 100644
--- a/drivers/gpu/drm/i915/i915_user_extensions.h
+++ b/drivers/gpu/drm/i915/i915_user_extensions.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index 868cc78048d0..96761d281354 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
index 5f0c972a80fb..46bf577b50a6 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.h
+++ b/drivers/gpu/drm/i915/intel_wakeref.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/intel_wopcm.h b/drivers/gpu/drm/i915/intel_wopcm.h
index 17d6aa86008a..d2038b6de5e7 100644
--- a/drivers/gpu/drm/i915/intel_wopcm.h
+++ b/drivers/gpu/drm/i915/intel_wopcm.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2017-2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
index 77d844ac8b71..add9460ae29c 100644
--- a/drivers/gpu/drm/i915/selftests/i915_active.c
+++ b/drivers/gpu/drm/i915/selftests/i915_active.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
index bb6dd54a6ff3..5bff5c87a8b3 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/selftests/igt_flush_test.c b/drivers/gpu/drm/i915/selftests/igt_flush_test.c
index d3b5eb402d33..1ce782588a55 100644
--- a/drivers/gpu/drm/i915/selftests/igt_flush_test.c
+++ b/drivers/gpu/drm/i915/selftests/igt_flush_test.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/selftests/igt_flush_test.h b/drivers/gpu/drm/i915/selftests/igt_flush_test.h
index 63e009927c43..5772b54d7884 100644
--- a/drivers/gpu/drm/i915/selftests/igt_flush_test.h
+++ b/drivers/gpu/drm/i915/selftests/igt_flush_test.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/selftests/igt_live_test.c b/drivers/gpu/drm/i915/selftests/igt_live_test.c
index 3e902761cd16..bcab68e18cae 100644
--- a/drivers/gpu/drm/i915/selftests/igt_live_test.c
+++ b/drivers/gpu/drm/i915/selftests/igt_live_test.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/selftests/igt_live_test.h b/drivers/gpu/drm/i915/selftests/igt_live_test.h
index c0e9f99d50de..460ad2889be8 100644
--- a/drivers/gpu/drm/i915/selftests/igt_live_test.h
+++ b/drivers/gpu/drm/i915/selftests/igt_live_test.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/selftests/igt_reset.c b/drivers/gpu/drm/i915/selftests/igt_reset.c
index 7ec8f8b049c6..27baa4d65d3d 100644
--- a/drivers/gpu/drm/i915/selftests/igt_reset.c
+++ b/drivers/gpu/drm/i915/selftests/igt_reset.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/selftests/igt_reset.h b/drivers/gpu/drm/i915/selftests/igt_reset.h
index 851873b67ab3..c3320dc570b4 100644
--- a/drivers/gpu/drm/i915/selftests/igt_reset.h
+++ b/drivers/gpu/drm/i915/selftests/igt_reset.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/selftests/igt_spinner.c b/drivers/gpu/drm/i915/selftests/igt_spinner.c
index 11f04ad48e68..0e54b6494030 100644
--- a/drivers/gpu/drm/i915/selftests/igt_spinner.c
+++ b/drivers/gpu/drm/i915/selftests/igt_spinner.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 #include "gt/intel_gt.h"
diff --git a/drivers/gpu/drm/i915/selftests/igt_spinner.h b/drivers/gpu/drm/i915/selftests/igt_spinner.h
index ec62c9ef320b..0813ab422364 100644
--- a/drivers/gpu/drm/i915/selftests/igt_spinner.h
+++ b/drivers/gpu/drm/i915/selftests/igt_spinner.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2018 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index 29705e773a4b..caaf60e17dbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -1,5 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * SPDX-License-Identifier: GPL-2.0
  * Copyright (c) 2018, The Linux Foundation
  */
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 47403d4f2d28..7b7dd156fb7c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -1,5 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * SPDX-License-Identifier: GPL-2.0
  * Copyright (c) 2018, The Linux Foundation
  */
 
diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
index 8f6100db90ed..05554cbe7945 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
@@ -1,5 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * SPDX-License-Identifier: GPL-2.0
  * Copyright (c) 2018, The Linux Foundation
  */
 
diff --git a/drivers/hid/hid-redragon.c b/drivers/hid/hid-redragon.c
index 73c9d4c4fa34..b32ac27940b2 100644
--- a/drivers/hid/hid-redragon.c
+++ b/drivers/hid/hid-redragon.c
@@ -1,8 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *  HID driver for Redragon keyboards
  *
  *  Copyright (c) 2017 Robert Munteanu
- *  SPDX-License-Identifier: GPL-2.0+
  */
 
 /*
diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index b432e7580458..6f5da05854c7 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -1,7 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
  * Copyright (C) 2017 Spreadtrum Communications Inc.
- *
- * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
  */
 
 #include <linux/clk.h>
diff --git a/drivers/media/common/siano/smsir.h b/drivers/media/common/siano/smsir.h
index b2c54c256e86..97e6053a16d0 100644
--- a/drivers/media/common/siano/smsir.h
+++ b/drivers/media/common/siano/smsir.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * SPDX-License-Identifier: GPL-2.0+
- *
  * Siano Mobile Silicon, Inc.
  * MDTV receiver kernel modules.
  * Copyright (C) 2006-2009, Uri Shkolnik
diff --git a/drivers/media/i2c/saa711x_regs.h b/drivers/media/i2c/saa711x_regs.h
index 44fabe08234d..4b5f6985710b 100644
--- a/drivers/media/i2c/saa711x_regs.h
+++ b/drivers/media/i2c/saa711x_regs.h
@@ -1,5 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * SPDX-License-Identifier: GPL-2.0+
  * saa711x - Philips SAA711x video decoder register specifications
  *
  * Copyright (c) 2006 Mauro Carvalho Chehab <mchehab@kernel.org>
diff --git a/drivers/media/i2c/tvp5150_reg.h b/drivers/media/i2c/tvp5150_reg.h
index 9088186c24d1..90ead16867f7 100644
--- a/drivers/media/i2c/tvp5150_reg.h
+++ b/drivers/media/i2c/tvp5150_reg.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
- *
  * tvp5150 - Texas Instruments TVP5150A/AM1 video decoder registers
  *
  * Copyright (c) 2005,2006 Mauro Carvalho Chehab <mchehab@kernel.org>
diff --git a/drivers/media/pci/bt8xx/bttv-audio-hook.h b/drivers/media/pci/bt8xx/bttv-audio-hook.h
index d6a1a5a60a56..a918f102849e 100644
--- a/drivers/media/pci/bt8xx/bttv-audio-hook.h
+++ b/drivers/media/pci/bt8xx/bttv-audio-hook.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
- *
  * Handlers for board audio hooks, split from bttv-cards
  *
  * Copyright (c) 2006 Mauro Carvalho Chehab <mchehab@kernel.org>
diff --git a/drivers/media/platform/meson/ao-cec.c b/drivers/media/platform/meson/ao-cec.c
index 64ed549bf012..3a57490685b6 100644
--- a/drivers/media/platform/meson/ao-cec.c
+++ b/drivers/media/platform/meson/ao-cec.c
@@ -1,11 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Driver for Amlogic Meson AO CEC Controller
  *
  * Copyright (C) 2015 Amlogic, Inc. All rights reserved
  * Copyright (C) 2017 BayLibre, SAS
  * Author: Neil Armstrong <narmstrong@baylibre.com>
- *
- * SPDX-License-Identifier: GPL-2.0+
  */
 
 #include <linux/bitfield.h>
diff --git a/drivers/media/rc/rc-core-priv.h b/drivers/media/rc/rc-core-priv.h
index 9f21b3e8b377..5f36244cc34f 100644
--- a/drivers/media/rc/rc-core-priv.h
+++ b/drivers/media/rc/rc-core-priv.h
@@ -1,5 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
  * Remote Controller core raw events header
  *
  * Copyright (C) 2010 by Mauro Carvalho Chehab
diff --git a/drivers/media/tuners/tuner-xc2028-types.h b/drivers/media/tuners/tuner-xc2028-types.h
index 50d017a4822a..fcca39d3e006 100644
--- a/drivers/media/tuners/tuner-xc2028-types.h
+++ b/drivers/media/tuners/tuner-xc2028-types.h
@@ -1,5 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
  * tuner-xc2028_types
  *
  * This file includes internal tipes to be used inside tuner-xc2028.
diff --git a/drivers/media/tuners/tuner-xc2028.h b/drivers/media/tuners/tuner-xc2028.h
index 7b58bc06e35c..2dd45d0765d7 100644
--- a/drivers/media/tuners/tuner-xc2028.h
+++ b/drivers/media/tuners/tuner-xc2028.h
@@ -1,5 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
  * tuner-xc2028
  *
  * Copyright (c) 2007-2008 Mauro Carvalho Chehab <mchehab@kernel.org>
diff --git a/drivers/media/usb/tm6000/tm6000-regs.h b/drivers/media/usb/tm6000/tm6000-regs.h
index d10424673db9..6a181f2e7ef2 100644
--- a/drivers/media/usb/tm6000/tm6000-regs.h
+++ b/drivers/media/usb/tm6000/tm6000-regs.h
@@ -1,5 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
  * tm6000-regs.h - driver for TM5600/TM6000/TM6010 USB video capture devices
  *
  * Copyright (c) 2006-2007 Mauro Carvalho Chehab <mchehab@kernel.org>
diff --git a/drivers/media/usb/tm6000/tm6000-usb-isoc.h b/drivers/media/usb/tm6000/tm6000-usb-isoc.h
index b275dbce3a1b..e3c6933f854d 100644
--- a/drivers/media/usb/tm6000/tm6000-usb-isoc.h
+++ b/drivers/media/usb/tm6000/tm6000-usb-isoc.h
@@ -1,5 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
  * tm6000-buf.c - driver for TM5600/TM6000/TM6010 USB video capture devices
  *
  * Copyright (c) 2006-2007 Mauro Carvalho Chehab <mchehab@kernel.org>
diff --git a/drivers/media/usb/tm6000/tm6000.h b/drivers/media/usb/tm6000/tm6000.h
index bf396544da9a..c08c95312739 100644
--- a/drivers/media/usb/tm6000/tm6000.h
+++ b/drivers/media/usb/tm6000/tm6000.h
@@ -1,5 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
  * tm6000.h - driver for TM5600/TM6000/TM6010 USB video capture devices
  *
  * Copyright (c) 2006-2007 Mauro Carvalho Chehab <mchehab@kernel.org>
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
index e8931d9cf863..6653eafa37a9 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
 /*
  * Second generation of pinmux driver for Amlogic Meson-AXG SoC.
  *
@@ -6,8 +7,6 @@
  *
  * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
  * Author: Xingyu Chen <xingyu.chen@amlogic.com>
- *
- * SPDX-License-Identifier: (GPL-2.0+ or MIT)
  */
 
 /*
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
index 8ff88bf2e849..a3d860f31b05 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
@@ -1,11 +1,10 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
 /*
  * Copyright (c) 2017 Baylibre SAS.
  * Author:  Jerome Brunet  <jbrunet@baylibre.com>
  *
  * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
  * Author: Xingyu Chen <xingyu.chen@amlogic.com>
- *
- * SPDX-License-Identifier: (GPL-2.0+ or MIT)
  */
 
 struct meson_pmx_bank {
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
index ad502eda4afa..7510bea93fdd 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
@@ -1,10 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
 /*
  * Pin controller and GPIO driver for Amlogic Meson AXG SoC.
  *
  * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
  * Author: Xingyu Chen <xingyu.chen@amlogic.com>
- *
- * SPDX-License-Identifier: (GPL-2.0+ or MIT)
  */
 
 #include <dt-bindings/gpio/meson-axg-gpio.h>
diff --git a/drivers/rtc/rtc-rtd119x.c b/drivers/rtc/rtc-rtd119x.c
index b233559d950b..904285bd9ae2 100644
--- a/drivers/rtc/rtc-rtd119x.c
+++ b/drivers/rtc/rtc-rtd119x.c
@@ -1,9 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Realtek RTD129x RTC
  *
  * Copyright (c) 2017 Andreas Färber
- *
- * SPDX-License-Identifier: GPL-2.0+
  */
 
 #include <linux/clk.h>
diff --git a/drivers/rtc/rtc-sc27xx.c b/drivers/rtc/rtc-sc27xx.c
index 3474f7a20493..1b3a8c5da2f0 100644
--- a/drivers/rtc/rtc-sc27xx.c
+++ b/drivers/rtc/rtc-sc27xx.c
@@ -1,7 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2017 Spreadtrum Communications Inc.
- *
- * SPDX-License-Identifier: GPL-2.0
  */
 
 #include <linux/bitops.h>
diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
index 511b6856225d..a2141fc8dad1 100644
--- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
+++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
@@ -1,8 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (c) 2017 BayLibre, SAS
  * Author: Neil Armstrong <narmstrong@baylibre.com>
- *
- * SPDX-License-Identifier: GPL-2.0+
  */
 
 #include <linux/of_address.h>
diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 6d0d04f163cb..5c35edbb6d44 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -1,8 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (c) 2017 BayLibre, SAS
  * Author: Neil Armstrong <narmstrong@baylibre.com>
- *
- * SPDX-License-Identifier: GPL-2.0+
  */
 
 #include <linux/io.h>
diff --git a/drivers/soc/amlogic/meson-mx-socinfo.c b/drivers/soc/amlogic/meson-mx-socinfo.c
index 78f0f1aeca57..4a44550951f7 100644
--- a/drivers/soc/amlogic/meson-mx-socinfo.c
+++ b/drivers/soc/amlogic/meson-mx-socinfo.c
@@ -1,7 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (c) 2017 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
- *
- * SPDX-License-Identifier: GPL-2.0+
  */
 
 #include <linux/io.h>
diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index 7fe4488ace57..889d71969b3e 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -1,10 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Driver for Amlogic Meson SPI communication controller (SPICC)
  *
  * Copyright (C) BayLibre, SAS
  * Author: Neil Armstrong <narmstrong@baylibre.com>
- *
- * SPDX-License-Identifier: GPL-2.0+
  */
 
 #include <linux/bitfield.h>
diff --git a/drivers/spi/spi-sprd-adi.c b/drivers/spi/spi-sprd-adi.c
index 9a051286f120..71021de9baa5 100644
--- a/drivers/spi/spi-sprd-adi.c
+++ b/drivers/spi/spi-sprd-adi.c
@@ -1,7 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2017 Spreadtrum Communications Inc.
- *
- * SPDX-License-Identifier: GPL-2.0
  */
 
 #include <linux/delay.h>
diff --git a/drivers/watchdog/rtd119x_wdt.c b/drivers/watchdog/rtd119x_wdt.c
index 834b94ff3f90..ddaef279d052 100644
--- a/drivers/watchdog/rtd119x_wdt.c
+++ b/drivers/watchdog/rtd119x_wdt.c
@@ -1,9 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Realtek RTD129x watchdog
  *
  * Copyright (c) 2017 Andreas Färber
- *
- * SPDX-License-Identifier: GPL-2.0+
  */
 
 #include <linux/bitops.h>
diff --git a/include/acpi/nfit.h b/include/acpi/nfit.h
index 86ed07c1200d..ed7c3dac76bd 100644
--- a/include/acpi/nfit.h
+++ b/include/acpi/nfit.h
@@ -1,5 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
  * Copyright (C) 2018 Intel Corporation
  */
 
diff --git a/include/dt-bindings/clock/sun8i-de2.h b/include/dt-bindings/clock/sun8i-de2.h
index 7768f73b051e..67fbdefee2f4 100644
--- a/include/dt-bindings/clock/sun8i-de2.h
+++ b/include/dt-bindings/clock/sun8i-de2.h
@@ -1,7 +1,6 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
 /*
  * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.io>
- *
- * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
  */
 
 #ifndef _DT_BINDINGS_CLOCK_SUN8I_DE2_H_
diff --git a/include/dt-bindings/gpio/meson-axg-gpio.h b/include/dt-bindings/gpio/meson-axg-gpio.h
index 25bb1fffa97a..e5289297d66a 100644
--- a/include/dt-bindings/gpio/meson-axg-gpio.h
+++ b/include/dt-bindings/gpio/meson-axg-gpio.h
@@ -1,8 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
  * Author: Xingyu Chen <xingyu.chen@amlogic.com>
- *
- * SPDX-License-Identifier: GPL-2.0+
  */
 
 #ifndef _DT_BINDINGS_MESON_AXG_GPIO_H
diff --git a/include/dt-bindings/power/owl-s500-powergate.h b/include/dt-bindings/power/owl-s500-powergate.h
index 0a1c451865ea..aede7be77330 100644
--- a/include/dt-bindings/power/owl-s500-powergate.h
+++ b/include/dt-bindings/power/owl-s500-powergate.h
@@ -1,7 +1,6 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
 /*
  * Copyright (c) 2017 Andreas Färber
- *
- * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
  */
 #ifndef DT_BINDINGS_POWER_OWL_S500_POWERGATE_H
 #define DT_BINDINGS_POWER_OWL_S500_POWERGATE_H
diff --git a/include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h b/include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h
index 1f1b56e57346..9f6574e05e8b 100644
--- a/include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h
@@ -1,7 +1,6 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
 /*
  * Copyright (c) 2017 Martin Blumenstingl <martin.blumenstingl@googlemail.com>.
- *
- * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
  */
 
 #ifndef _DT_BINDINGS_AMLOGIC_MESON8B_CLKC_RESET_H
diff --git a/include/dt-bindings/reset/sun8i-de2.h b/include/dt-bindings/reset/sun8i-de2.h
index 1c36a6ac86d6..5b4e20717285 100644
--- a/include/dt-bindings/reset/sun8i-de2.h
+++ b/include/dt-bindings/reset/sun8i-de2.h
@@ -1,7 +1,6 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
 /*
  * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.io>
- *
- * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
  */
 
 #ifndef _DT_BINDINGS_RESET_SUN8I_DE2_H_
diff --git a/include/linux/ascii85.h b/include/linux/ascii85.h
index 4cc40201273e..2e956dd2f0e0 100644
--- a/include/linux/ascii85.h
+++ b/include/linux/ascii85.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
- *
  * Copyright (c) 2008 Intel Corporation
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
  */
diff --git a/include/linux/soc/actions/owl-sps.h b/include/linux/soc/actions/owl-sps.h
index 33d0dbeceb55..ad50e99618e5 100644
--- a/include/linux/soc/actions/owl-sps.h
+++ b/include/linux/soc/actions/owl-sps.h
@@ -1,7 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (c) 2017 Andreas Färber
- *
- * SPDX-License-Identifier: GPL-2.0+
  */
 #ifndef SOC_ACTIONS_OWL_SPS_H
 #define SOC_ACTIONS_OWL_SPS_H
diff --git a/include/media/dvb_vb2.h b/include/media/dvb_vb2.h
index 8cb88452cd6c..b2523dd784be 100644
--- a/include/media/dvb_vb2.h
+++ b/include/media/dvb_vb2.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
- *
  * dvb-vb2.h - DVB driver helper framework for streaming I/O
  *
  * Copyright (C) 2015 Samsung Electronics
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
index 11f3391d06f2..b1f29a6e5a98 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
- *
  * Copyright(C) 2015-2018 Linaro Limited.
  *
  * Author: Tor Jeremiassen <tor@ti.com>
diff --git a/tools/perf/util/rlimit.h b/tools/perf/util/rlimit.h
index 9f59d8e710a3..01c97f2de12a 100644
--- a/tools/perf/util/rlimit.h
+++ b/tools/perf/util/rlimit.h
@@ -1,6 +1,6 @@
+/* SPDX-License-Identifier: LGPL-2.1 */
 #ifndef __PERF_RLIMIT_H_
 #define __PERF_RLIMIT_H_
-/* SPDX-License-Identifier: LGPL-2.1 */
 
 void rlimit__bump_memlock(void);
 #endif // __PERF_RLIMIT_H_


