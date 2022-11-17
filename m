Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5665E62E5DA
	for <lists+linux-media@lfdr.de>; Thu, 17 Nov 2022 21:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239968AbiKQU3n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Nov 2022 15:29:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239439AbiKQU3i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Nov 2022 15:29:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E334B10BD;
        Thu, 17 Nov 2022 12:29:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 36C5AB821F6;
        Thu, 17 Nov 2022 20:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33791C433D6;
        Thu, 17 Nov 2022 20:29:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="dVacaMQN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1668716966;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DPMLiF/zbiTMcInIb72heSS2PnqngFJgiAIRv7VDbZ0=;
        b=dVacaMQNEcasuPItZU/5b94iTzcITUbsaMYWeFVVrz97oMcpaeoBGsM6RCoPNsSuOPbaCT
        p9NVQqXrBKSBS9J6YhsAmnQCW8xuj98AWxUXf1csWy022IFFFYiBQvoOi2VdKuXLs3tcVs
        7m2hxddq9omGZVygyKq5YTQsJLMfbOo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id da2f4f56 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Thu, 17 Nov 2022 20:29:25 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-kernel@vger.kernel.org, patches@lists.linux.dev
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Kees Cook <keescook@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= 
        <christoph.boehmwalder@linbit.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Theodore Ts'o <tytso@mit.edu>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        "Darrick J . Wong" <djwong@kernel.org>,
        SeongJae Park <sj@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Helge Deller <deller@gmx.de>, netdev@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-block@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mmc@vger.kernel.org, linux-parisc@vger.kernel.org,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v3 1/3] treewide: use get_random_u32_below() instead of deprecated function
Date:   Thu, 17 Nov 2022 21:29:04 +0100
Message-Id: <20221117202906.2312482-2-Jason@zx2c4.com>
In-Reply-To: <20221117202906.2312482-1-Jason@zx2c4.com>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
 <20221117202906.2312482-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a simple mechanical transformation done by:

@@
expression E;
@@
- prandom_u32_max
+ get_random_u32_below
  (E)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Darrick J. Wong <djwong@kernel.org> # for xfs
Reviewed-by: SeongJae Park <sj@kernel.org> # for damon
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com> # for infiniband
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk> # for arm
Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # for mmc
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/arm/kernel/process.c                     |  2 +-
 arch/arm64/kernel/process.c                   |  2 +-
 arch/loongarch/kernel/process.c               |  2 +-
 arch/loongarch/kernel/vdso.c                  |  2 +-
 arch/mips/kernel/process.c                    |  2 +-
 arch/mips/kernel/vdso.c                       |  2 +-
 arch/parisc/kernel/vdso.c                     |  2 +-
 arch/powerpc/crypto/crc-vpmsum_test.c         |  4 +-
 arch/powerpc/kernel/process.c                 |  2 +-
 arch/s390/kernel/process.c                    |  2 +-
 arch/s390/kernel/vdso.c                       |  2 +-
 arch/sparc/vdso/vma.c                         |  2 +-
 arch/um/kernel/process.c                      |  2 +-
 arch/x86/entry/vdso/vma.c                     |  2 +-
 arch/x86/kernel/module.c                      |  2 +-
 arch/x86/kernel/process.c                     |  2 +-
 arch/x86/mm/pat/cpa-test.c                    |  4 +-
 crypto/rsa-pkcs1pad.c                         |  2 +-
 crypto/testmgr.c                              | 86 +++++++++----------
 drivers/block/drbd/drbd_receiver.c            |  4 +-
 drivers/bus/mhi/host/internal.h               |  2 +-
 drivers/dma-buf/st-dma-fence-chain.c          |  6 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
 .../drm/i915/gt/intel_execlists_submission.c  |  2 +-
 drivers/gpu/drm/i915/intel_memory_region.c    |  4 +-
 drivers/infiniband/core/cma.c                 |  2 +-
 drivers/infiniband/hw/cxgb4/id_table.c        |  4 +-
 drivers/infiniband/hw/hns/hns_roce_ah.c       |  4 +-
 drivers/infiniband/ulp/rtrs/rtrs-clt.c        |  2 +-
 drivers/md/bcache/request.c                   |  2 +-
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c |  8 +-
 .../media/test-drivers/vidtv/vidtv_demod.c    |  8 +-
 .../test-drivers/vivid/vivid-kthread-cap.c    |  2 +-
 .../test-drivers/vivid/vivid-kthread-out.c    |  2 +-
 .../media/test-drivers/vivid/vivid-radio-rx.c |  4 +-
 .../media/test-drivers/vivid/vivid-sdr-cap.c  |  2 +-
 .../test-drivers/vivid/vivid-touch-cap.c      |  2 +-
 drivers/mmc/core/core.c                       |  4 +-
 drivers/mmc/host/dw_mmc.c                     |  2 +-
 drivers/mtd/nand/raw/nandsim.c                |  4 +-
 drivers/mtd/tests/mtd_nandecctest.c           | 10 +--
 drivers/mtd/tests/stresstest.c                |  8 +-
 drivers/mtd/ubi/debug.c                       |  2 +-
 drivers/mtd/ubi/debug.h                       |  6 +-
 drivers/net/ethernet/broadcom/cnic.c          |  2 +-
 .../chelsio/inline_crypto/chtls/chtls_io.c    |  4 +-
 drivers/net/phy/at803x.c                      |  2 +-
 drivers/net/team/team_mode_random.c           |  2 +-
 drivers/net/wireguard/selftest/allowedips.c   | 20 ++---
 drivers/net/wireguard/timers.c                |  4 +-
 .../broadcom/brcm80211/brcmfmac/p2p.c         |  2 +-
 .../net/wireless/intel/iwlwifi/mvm/mac-ctxt.c |  2 +-
 drivers/pci/p2pdma.c                          |  2 +-
 drivers/s390/scsi/zfcp_fc.c                   |  2 +-
 drivers/scsi/fcoe/fcoe_ctlr.c                 |  4 +-
 drivers/scsi/qedi/qedi_main.c                 |  2 +-
 drivers/scsi/scsi_debug.c                     |  6 +-
 fs/ceph/inode.c                               |  2 +-
 fs/ceph/mdsmap.c                              |  2 +-
 fs/ext2/ialloc.c                              |  2 +-
 fs/ext4/ialloc.c                              |  2 +-
 fs/ext4/super.c                               |  5 +-
 fs/f2fs/gc.c                                  |  2 +-
 fs/f2fs/segment.c                             |  8 +-
 fs/ubifs/debug.c                              |  8 +-
 fs/ubifs/lpt_commit.c                         | 14 +--
 fs/ubifs/tnc_commit.c                         |  2 +-
 fs/xfs/libxfs/xfs_alloc.c                     |  2 +-
 fs/xfs/libxfs/xfs_ialloc.c                    |  2 +-
 fs/xfs/xfs_error.c                            |  2 +-
 include/linux/damon.h                         |  2 +-
 include/linux/nodemask.h                      |  2 +-
 kernel/bpf/core.c                             |  4 +-
 kernel/kcsan/selftest.c                       |  4 +-
 kernel/locking/test-ww_mutex.c                |  4 +-
 kernel/time/clocksource.c                     |  2 +-
 lib/fault-inject.c                            |  2 +-
 lib/find_bit_benchmark.c                      |  4 +-
 lib/kobject.c                                 |  2 +-
 lib/reed_solomon/test_rslib.c                 |  6 +-
 lib/sbitmap.c                                 |  4 +-
 lib/test-string_helpers.c                     |  2 +-
 lib/test_hexdump.c                            | 10 +--
 lib/test_list_sort.c                          |  2 +-
 lib/test_printf.c                             |  2 +-
 lib/test_rhashtable.c                         |  6 +-
 lib/test_vmalloc.c                            |  8 +-
 mm/kasan/kasan_test.c                         |  6 +-
 mm/kfence/core.c                              |  4 +-
 mm/kfence/kfence_test.c                       |  4 +-
 mm/slub.c                                     |  2 +-
 mm/swapfile.c                                 |  4 +-
 net/802/garp.c                                |  2 +-
 net/802/mrp.c                                 |  2 +-
 net/batman-adv/bat_iv_ogm.c                   |  4 +-
 net/batman-adv/bat_v_elp.c                    |  2 +-
 net/batman-adv/bat_v_ogm.c                    |  4 +-
 net/batman-adv/network-coding.c               |  2 +-
 net/bluetooth/mgmt.c                          |  4 +-
 net/can/j1939/socket.c                        |  2 +-
 net/can/j1939/transport.c                     |  2 +-
 net/ceph/mon_client.c                         |  2 +-
 net/ceph/osd_client.c                         |  2 +-
 net/core/neighbour.c                          |  4 +-
 net/core/pktgen.c                             | 28 +++---
 net/core/stream.c                             |  2 +-
 net/ipv4/icmp.c                               |  2 +-
 net/ipv4/igmp.c                               |  6 +-
 net/ipv4/inet_connection_sock.c               |  2 +-
 net/ipv4/inet_hashtables.c                    |  2 +-
 net/ipv4/route.c                              |  4 +-
 net/ipv4/tcp_bbr.c                            |  2 +-
 net/ipv4/tcp_input.c                          |  3 +-
 net/ipv6/addrconf.c                           |  8 +-
 net/ipv6/mcast.c                              | 10 +--
 net/ipv6/route.c                              |  2 +-
 net/netfilter/ipvs/ip_vs_twos.c               |  4 +-
 net/netfilter/nf_conntrack_core.c             |  4 +-
 net/netfilter/nf_nat_helper.c                 |  2 +-
 net/netlink/af_netlink.c                      |  2 +-
 net/packet/af_packet.c                        |  4 +-
 net/sched/act_gact.c                          |  2 +-
 net/sched/act_sample.c                        |  2 +-
 net/sched/sch_choke.c                         |  2 +-
 net/sched/sch_netem.c                         |  4 +-
 net/sctp/socket.c                             |  2 +-
 net/sctp/transport.c                          |  2 +-
 net/sunrpc/cache.c                            |  2 +-
 net/sunrpc/xprtsock.c                         |  2 +-
 net/tipc/socket.c                             |  2 +-
 net/vmw_vsock/af_vsock.c                      |  2 +-
 net/xfrm/xfrm_state.c                         |  2 +-
 132 files changed, 280 insertions(+), 280 deletions(-)

diff --git a/arch/arm/kernel/process.c b/arch/arm/kernel/process.c
index a2b31d91a1b6..f811733a8fc5 100644
--- a/arch/arm/kernel/process.c
+++ b/arch/arm/kernel/process.c
@@ -371,7 +371,7 @@ static unsigned long sigpage_addr(const struct mm_struct *mm,
 
 	slots = ((last - first) >> PAGE_SHIFT) + 1;
 
-	offset = prandom_u32_max(slots);
+	offset = get_random_u32_below(slots);
 
 	addr = first + (offset << PAGE_SHIFT);
 
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 044a7d7f1f6a..1395a1638427 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -591,7 +591,7 @@ unsigned long __get_wchan(struct task_struct *p)
 unsigned long arch_align_stack(unsigned long sp)
 {
 	if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize_va_space)
-		sp -= prandom_u32_max(PAGE_SIZE);
+		sp -= get_random_u32_below(PAGE_SIZE);
 	return sp & ~0xf;
 }
 
diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 2526b68f1c0f..77952d814bad 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -293,7 +293,7 @@ unsigned long stack_top(void)
 unsigned long arch_align_stack(unsigned long sp)
 {
 	if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize_va_space)
-		sp -= prandom_u32_max(PAGE_SIZE);
+		sp -= get_random_u32_below(PAGE_SIZE);
 
 	return sp & STACK_ALIGN;
 }
diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
index 8c9826062652..eaebd2e0f725 100644
--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -78,7 +78,7 @@ static unsigned long vdso_base(void)
 	unsigned long base = STACK_TOP;
 
 	if (current->flags & PF_RANDOMIZE) {
-		base += prandom_u32_max(VDSO_RANDOMIZE_SIZE);
+		base += get_random_u32_below(VDSO_RANDOMIZE_SIZE);
 		base = PAGE_ALIGN(base);
 	}
 
diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index bbe9ce471791..093dbbd6b843 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -711,7 +711,7 @@ unsigned long mips_stack_top(void)
 unsigned long arch_align_stack(unsigned long sp)
 {
 	if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize_va_space)
-		sp -= prandom_u32_max(PAGE_SIZE);
+		sp -= get_random_u32_below(PAGE_SIZE);
 
 	return sp & ALMASK;
 }
diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index 5fd9bf1d596c..f6d40e43f108 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -79,7 +79,7 @@ static unsigned long vdso_base(void)
 	}
 
 	if (current->flags & PF_RANDOMIZE) {
-		base += prandom_u32_max(VDSO_RANDOMIZE_SIZE);
+		base += get_random_u32_below(VDSO_RANDOMIZE_SIZE);
 		base = PAGE_ALIGN(base);
 	}
 
diff --git a/arch/parisc/kernel/vdso.c b/arch/parisc/kernel/vdso.c
index 47e5960a2f96..c5cbfce7a84c 100644
--- a/arch/parisc/kernel/vdso.c
+++ b/arch/parisc/kernel/vdso.c
@@ -75,7 +75,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm,
 
 	map_base = mm->mmap_base;
 	if (current->flags & PF_RANDOMIZE)
-		map_base -= prandom_u32_max(0x20) * PAGE_SIZE;
+		map_base -= get_random_u32_below(0x20) * PAGE_SIZE;
 
 	vdso_text_start = get_unmapped_area(NULL, map_base, vdso_text_len, 0, 0);
 
diff --git a/arch/powerpc/crypto/crc-vpmsum_test.c b/arch/powerpc/crypto/crc-vpmsum_test.c
index 273c527868db..c61a874a3a5c 100644
--- a/arch/powerpc/crypto/crc-vpmsum_test.c
+++ b/arch/powerpc/crypto/crc-vpmsum_test.c
@@ -77,8 +77,8 @@ static int __init crc_test_init(void)
 
 		pr_info("crc-vpmsum_test begins, %lu iterations\n", iterations);
 		for (i=0; i<iterations; i++) {
-			size_t offset = prandom_u32_max(16);
-			size_t len = prandom_u32_max(MAX_CRC_LENGTH);
+			size_t offset = get_random_u32_below(16);
+			size_t len = get_random_u32_below(MAX_CRC_LENGTH);
 
 			if (len <= offset)
 				continue;
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 67da147fe34d..fcf604370c66 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2303,6 +2303,6 @@ void notrace __ppc64_runlatch_off(void)
 unsigned long arch_align_stack(unsigned long sp)
 {
 	if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize_va_space)
-		sp -= prandom_u32_max(PAGE_SIZE);
+		sp -= get_random_u32_below(PAGE_SIZE);
 	return sp & ~0xf;
 }
diff --git a/arch/s390/kernel/process.c b/arch/s390/kernel/process.c
index 42af4b3aa02b..3f5d2db0b854 100644
--- a/arch/s390/kernel/process.c
+++ b/arch/s390/kernel/process.c
@@ -224,7 +224,7 @@ unsigned long __get_wchan(struct task_struct *p)
 unsigned long arch_align_stack(unsigned long sp)
 {
 	if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize_va_space)
-		sp -= prandom_u32_max(PAGE_SIZE);
+		sp -= get_random_u32_below(PAGE_SIZE);
 	return sp & ~0xf;
 }
 
diff --git a/arch/s390/kernel/vdso.c b/arch/s390/kernel/vdso.c
index 3105ca5bd470..119328e1e2b3 100644
--- a/arch/s390/kernel/vdso.c
+++ b/arch/s390/kernel/vdso.c
@@ -227,7 +227,7 @@ static unsigned long vdso_addr(unsigned long start, unsigned long len)
 	end -= len;
 
 	if (end > start) {
-		offset = prandom_u32_max(((end - start) >> PAGE_SHIFT) + 1);
+		offset = get_random_u32_below(((end - start) >> PAGE_SHIFT) + 1);
 		addr = start + (offset << PAGE_SHIFT);
 	} else {
 		addr = start;
diff --git a/arch/sparc/vdso/vma.c b/arch/sparc/vdso/vma.c
index ae9a86cb6f3d..136c78f28f8b 100644
--- a/arch/sparc/vdso/vma.c
+++ b/arch/sparc/vdso/vma.c
@@ -354,7 +354,7 @@ static unsigned long vdso_addr(unsigned long start, unsigned int len)
 	unsigned int offset;
 
 	/* This loses some more bits than a modulo, but is cheaper */
-	offset = prandom_u32_max(PTRS_PER_PTE);
+	offset = get_random_u32_below(PTRS_PER_PTE);
 	return start + (offset << PAGE_SHIFT);
 }
 
diff --git a/arch/um/kernel/process.c b/arch/um/kernel/process.c
index 010bc422a09d..e38f41444721 100644
--- a/arch/um/kernel/process.c
+++ b/arch/um/kernel/process.c
@@ -356,7 +356,7 @@ int singlestepping(void * t)
 unsigned long arch_align_stack(unsigned long sp)
 {
 	if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize_va_space)
-		sp -= prandom_u32_max(8192);
+		sp -= get_random_u32_below(8192);
 	return sp & ~0xf;
 }
 #endif
diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
index 311eae30e089..d45c5fcfeac2 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -327,7 +327,7 @@ static unsigned long vdso_addr(unsigned long start, unsigned len)
 	end -= len;
 
 	if (end > start) {
-		offset = prandom_u32_max(((end - start) >> PAGE_SHIFT) + 1);
+		offset = get_random_u32_below(((end - start) >> PAGE_SHIFT) + 1);
 		addr = start + (offset << PAGE_SHIFT);
 	} else {
 		addr = start;
diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index c032edcd3d95..c09ae279ef32 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -53,7 +53,7 @@ static unsigned long int get_module_load_offset(void)
 		 */
 		if (module_load_offset == 0)
 			module_load_offset =
-				(prandom_u32_max(1024) + 1) * PAGE_SIZE;
+				(get_random_u32_below(1024) + 1) * PAGE_SIZE;
 		mutex_unlock(&module_kaslr_mutex);
 	}
 	return module_load_offset;
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index c21b7347a26d..62671ccf0404 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -965,7 +965,7 @@ early_param("idle", idle_setup);
 unsigned long arch_align_stack(unsigned long sp)
 {
 	if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize_va_space)
-		sp -= prandom_u32_max(8192);
+		sp -= get_random_u32_below(8192);
 	return sp & ~0xf;
 }
 
diff --git a/arch/x86/mm/pat/cpa-test.c b/arch/x86/mm/pat/cpa-test.c
index 423b21e80929..3d2f7f0a6ed1 100644
--- a/arch/x86/mm/pat/cpa-test.c
+++ b/arch/x86/mm/pat/cpa-test.c
@@ -136,10 +136,10 @@ static int pageattr_test(void)
 	failed += print_split(&sa);
 
 	for (i = 0; i < NTEST; i++) {
-		unsigned long pfn = prandom_u32_max(max_pfn_mapped);
+		unsigned long pfn = get_random_u32_below(max_pfn_mapped);
 
 		addr[i] = (unsigned long)__va(pfn << PAGE_SHIFT);
-		len[i] = prandom_u32_max(NPAGES);
+		len[i] = get_random_u32_below(NPAGES);
 		len[i] = min_t(unsigned long, len[i], max_pfn_mapped - pfn - 1);
 
 		if (len[i] == 0)
diff --git a/crypto/rsa-pkcs1pad.c b/crypto/rsa-pkcs1pad.c
index 3285e3af43e1..0f722f8f779b 100644
--- a/crypto/rsa-pkcs1pad.c
+++ b/crypto/rsa-pkcs1pad.c
@@ -253,7 +253,7 @@ static int pkcs1pad_encrypt(struct akcipher_request *req)
 	ps_end = ctx->key_size - req->src_len - 2;
 	req_ctx->in_buf[0] = 0x02;
 	for (i = 1; i < ps_end; i++)
-		req_ctx->in_buf[i] = 1 + prandom_u32_max(255);
+		req_ctx->in_buf[i] = 1 + get_random_u32_below(255);
 	req_ctx->in_buf[ps_end] = 0x00;
 
 	pkcs1pad_sg_set_buf(req_ctx->in_sg, req_ctx->in_buf,
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index bcd059caa1c8..079923d43ce2 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -855,9 +855,9 @@ static int prepare_keybuf(const u8 *key, unsigned int ksize,
 /* Generate a random length in range [0, max_len], but prefer smaller values */
 static unsigned int generate_random_length(unsigned int max_len)
 {
-	unsigned int len = prandom_u32_max(max_len + 1);
+	unsigned int len = get_random_u32_below(max_len + 1);
 
-	switch (prandom_u32_max(4)) {
+	switch (get_random_u32_below(4)) {
 	case 0:
 		return len % 64;
 	case 1:
@@ -874,14 +874,14 @@ static void flip_random_bit(u8 *buf, size_t size)
 {
 	size_t bitpos;
 
-	bitpos = prandom_u32_max(size * 8);
+	bitpos = get_random_u32_below(size * 8);
 	buf[bitpos / 8] ^= 1 << (bitpos % 8);
 }
 
 /* Flip a random byte in the given nonempty data buffer */
 static void flip_random_byte(u8 *buf, size_t size)
 {
-	buf[prandom_u32_max(size)] ^= 0xff;
+	buf[get_random_u32_below(size)] ^= 0xff;
 }
 
 /* Sometimes make some random changes to the given nonempty data buffer */
@@ -891,15 +891,15 @@ static void mutate_buffer(u8 *buf, size_t size)
 	size_t i;
 
 	/* Sometimes flip some bits */
-	if (prandom_u32_max(4) == 0) {
-		num_flips = min_t(size_t, 1 << prandom_u32_max(8), size * 8);
+	if (get_random_u32_below(4) == 0) {
+		num_flips = min_t(size_t, 1 << get_random_u32_below(8), size * 8);
 		for (i = 0; i < num_flips; i++)
 			flip_random_bit(buf, size);
 	}
 
 	/* Sometimes flip some bytes */
-	if (prandom_u32_max(4) == 0) {
-		num_flips = min_t(size_t, 1 << prandom_u32_max(8), size);
+	if (get_random_u32_below(4) == 0) {
+		num_flips = min_t(size_t, 1 << get_random_u32_below(8), size);
 		for (i = 0; i < num_flips; i++)
 			flip_random_byte(buf, size);
 	}
@@ -915,11 +915,11 @@ static void generate_random_bytes(u8 *buf, size_t count)
 	if (count == 0)
 		return;
 
-	switch (prandom_u32_max(8)) { /* Choose a generation strategy */
+	switch (get_random_u32_below(8)) { /* Choose a generation strategy */
 	case 0:
 	case 1:
 		/* All the same byte, plus optional mutations */
-		switch (prandom_u32_max(4)) {
+		switch (get_random_u32_below(4)) {
 		case 0:
 			b = 0x00;
 			break;
@@ -959,24 +959,24 @@ static char *generate_random_sgl_divisions(struct test_sg_division *divs,
 		unsigned int this_len;
 		const char *flushtype_str;
 
-		if (div == &divs[max_divs - 1] || prandom_u32_max(2) == 0)
+		if (div == &divs[max_divs - 1] || get_random_u32_below(2) == 0)
 			this_len = remaining;
 		else
-			this_len = 1 + prandom_u32_max(remaining);
+			this_len = 1 + get_random_u32_below(remaining);
 		div->proportion_of_total = this_len;
 
-		if (prandom_u32_max(4) == 0)
-			div->offset = (PAGE_SIZE - 128) + prandom_u32_max(128);
-		else if (prandom_u32_max(2) == 0)
-			div->offset = prandom_u32_max(32);
+		if (get_random_u32_below(4) == 0)
+			div->offset = (PAGE_SIZE - 128) + get_random_u32_below(128);
+		else if (get_random_u32_below(2) == 0)
+			div->offset = get_random_u32_below(32);
 		else
-			div->offset = prandom_u32_max(PAGE_SIZE);
-		if (prandom_u32_max(8) == 0)
+			div->offset = get_random_u32_below(PAGE_SIZE);
+		if (get_random_u32_below(8) == 0)
 			div->offset_relative_to_alignmask = true;
 
 		div->flush_type = FLUSH_TYPE_NONE;
 		if (gen_flushes) {
-			switch (prandom_u32_max(4)) {
+			switch (get_random_u32_below(4)) {
 			case 0:
 				div->flush_type = FLUSH_TYPE_REIMPORT;
 				break;
@@ -988,7 +988,7 @@ static char *generate_random_sgl_divisions(struct test_sg_division *divs,
 
 		if (div->flush_type != FLUSH_TYPE_NONE &&
 		    !(req_flags & CRYPTO_TFM_REQ_MAY_SLEEP) &&
-		    prandom_u32_max(2) == 0)
+		    get_random_u32_below(2) == 0)
 			div->nosimd = true;
 
 		switch (div->flush_type) {
@@ -1035,7 +1035,7 @@ static void generate_random_testvec_config(struct testvec_config *cfg,
 
 	p += scnprintf(p, end - p, "random:");
 
-	switch (prandom_u32_max(4)) {
+	switch (get_random_u32_below(4)) {
 	case 0:
 	case 1:
 		cfg->inplace_mode = OUT_OF_PLACE;
@@ -1050,12 +1050,12 @@ static void generate_random_testvec_config(struct testvec_config *cfg,
 		break;
 	}
 
-	if (prandom_u32_max(2) == 0) {
+	if (get_random_u32_below(2) == 0) {
 		cfg->req_flags |= CRYPTO_TFM_REQ_MAY_SLEEP;
 		p += scnprintf(p, end - p, " may_sleep");
 	}
 
-	switch (prandom_u32_max(4)) {
+	switch (get_random_u32_below(4)) {
 	case 0:
 		cfg->finalization_type = FINALIZATION_TYPE_FINAL;
 		p += scnprintf(p, end - p, " use_final");
@@ -1071,7 +1071,7 @@ static void generate_random_testvec_config(struct testvec_config *cfg,
 	}
 
 	if (!(cfg->req_flags & CRYPTO_TFM_REQ_MAY_SLEEP) &&
-	    prandom_u32_max(2) == 0) {
+	    get_random_u32_below(2) == 0) {
 		cfg->nosimd = true;
 		p += scnprintf(p, end - p, " nosimd");
 	}
@@ -1084,7 +1084,7 @@ static void generate_random_testvec_config(struct testvec_config *cfg,
 					  cfg->req_flags);
 	p += scnprintf(p, end - p, "]");
 
-	if (cfg->inplace_mode == OUT_OF_PLACE && prandom_u32_max(2) == 0) {
+	if (cfg->inplace_mode == OUT_OF_PLACE && get_random_u32_below(2) == 0) {
 		p += scnprintf(p, end - p, " dst_divs=[");
 		p = generate_random_sgl_divisions(cfg->dst_divs,
 						  ARRAY_SIZE(cfg->dst_divs),
@@ -1093,13 +1093,13 @@ static void generate_random_testvec_config(struct testvec_config *cfg,
 		p += scnprintf(p, end - p, "]");
 	}
 
-	if (prandom_u32_max(2) == 0) {
-		cfg->iv_offset = 1 + prandom_u32_max(MAX_ALGAPI_ALIGNMASK);
+	if (get_random_u32_below(2) == 0) {
+		cfg->iv_offset = 1 + get_random_u32_below(MAX_ALGAPI_ALIGNMASK);
 		p += scnprintf(p, end - p, " iv_offset=%u", cfg->iv_offset);
 	}
 
-	if (prandom_u32_max(2) == 0) {
-		cfg->key_offset = 1 + prandom_u32_max(MAX_ALGAPI_ALIGNMASK);
+	if (get_random_u32_below(2) == 0) {
+		cfg->key_offset = 1 + get_random_u32_below(MAX_ALGAPI_ALIGNMASK);
 		p += scnprintf(p, end - p, " key_offset=%u", cfg->key_offset);
 	}
 
@@ -1652,8 +1652,8 @@ static void generate_random_hash_testvec(struct shash_desc *desc,
 	vec->ksize = 0;
 	if (maxkeysize) {
 		vec->ksize = maxkeysize;
-		if (prandom_u32_max(4) == 0)
-			vec->ksize = 1 + prandom_u32_max(maxkeysize);
+		if (get_random_u32_below(4) == 0)
+			vec->ksize = 1 + get_random_u32_below(maxkeysize);
 		generate_random_bytes((u8 *)vec->key, vec->ksize);
 
 		vec->setkey_error = crypto_shash_setkey(desc->tfm, vec->key,
@@ -2218,13 +2218,13 @@ static void mutate_aead_message(struct aead_testvec *vec, bool aad_iv,
 	const unsigned int aad_tail_size = aad_iv ? ivsize : 0;
 	const unsigned int authsize = vec->clen - vec->plen;
 
-	if (prandom_u32_max(2) == 0 && vec->alen > aad_tail_size) {
+	if (get_random_u32_below(2) == 0 && vec->alen > aad_tail_size) {
 		 /* Mutate the AAD */
 		flip_random_bit((u8 *)vec->assoc, vec->alen - aad_tail_size);
-		if (prandom_u32_max(2) == 0)
+		if (get_random_u32_below(2) == 0)
 			return;
 	}
-	if (prandom_u32_max(2) == 0) {
+	if (get_random_u32_below(2) == 0) {
 		/* Mutate auth tag (assuming it's at the end of ciphertext) */
 		flip_random_bit((u8 *)vec->ctext + vec->plen, authsize);
 	} else {
@@ -2249,7 +2249,7 @@ static void generate_aead_message(struct aead_request *req,
 	const unsigned int ivsize = crypto_aead_ivsize(tfm);
 	const unsigned int authsize = vec->clen - vec->plen;
 	const bool inauthentic = (authsize >= MIN_COLLISION_FREE_AUTHSIZE) &&
-				 (prefer_inauthentic || prandom_u32_max(4) == 0);
+				 (prefer_inauthentic || get_random_u32_below(4) == 0);
 
 	/* Generate the AAD. */
 	generate_random_bytes((u8 *)vec->assoc, vec->alen);
@@ -2257,7 +2257,7 @@ static void generate_aead_message(struct aead_request *req,
 		/* Avoid implementation-defined behavior. */
 		memcpy((u8 *)vec->assoc + vec->alen - ivsize, vec->iv, ivsize);
 
-	if (inauthentic && prandom_u32_max(2) == 0) {
+	if (inauthentic && get_random_u32_below(2) == 0) {
 		/* Generate a random ciphertext. */
 		generate_random_bytes((u8 *)vec->ctext, vec->clen);
 	} else {
@@ -2321,8 +2321,8 @@ static void generate_random_aead_testvec(struct aead_request *req,
 
 	/* Key: length in [0, maxkeysize], but usually choose maxkeysize */
 	vec->klen = maxkeysize;
-	if (prandom_u32_max(4) == 0)
-		vec->klen = prandom_u32_max(maxkeysize + 1);
+	if (get_random_u32_below(4) == 0)
+		vec->klen = get_random_u32_below(maxkeysize + 1);
 	generate_random_bytes((u8 *)vec->key, vec->klen);
 	vec->setkey_error = crypto_aead_setkey(tfm, vec->key, vec->klen);
 
@@ -2331,8 +2331,8 @@ static void generate_random_aead_testvec(struct aead_request *req,
 
 	/* Tag length: in [0, maxauthsize], but usually choose maxauthsize */
 	authsize = maxauthsize;
-	if (prandom_u32_max(4) == 0)
-		authsize = prandom_u32_max(maxauthsize + 1);
+	if (get_random_u32_below(4) == 0)
+		authsize = get_random_u32_below(maxauthsize + 1);
 	if (prefer_inauthentic && authsize < MIN_COLLISION_FREE_AUTHSIZE)
 		authsize = MIN_COLLISION_FREE_AUTHSIZE;
 	if (WARN_ON(authsize > maxdatasize))
@@ -2342,7 +2342,7 @@ static void generate_random_aead_testvec(struct aead_request *req,
 
 	/* AAD, plaintext, and ciphertext lengths */
 	total_len = generate_random_length(maxdatasize);
-	if (prandom_u32_max(4) == 0)
+	if (get_random_u32_below(4) == 0)
 		vec->alen = 0;
 	else
 		vec->alen = generate_random_length(total_len);
@@ -2958,8 +2958,8 @@ static void generate_random_cipher_testvec(struct skcipher_request *req,
 
 	/* Key: length in [0, maxkeysize], but usually choose maxkeysize */
 	vec->klen = maxkeysize;
-	if (prandom_u32_max(4) == 0)
-		vec->klen = prandom_u32_max(maxkeysize + 1);
+	if (get_random_u32_below(4) == 0)
+		vec->klen = get_random_u32_below(maxkeysize + 1);
 	generate_random_bytes((u8 *)vec->key, vec->klen);
 	vec->setkey_error = crypto_skcipher_setkey(tfm, vec->key, vec->klen);
 
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index ee69d50ba4fd..3eccc6cd5004 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -781,7 +781,7 @@ static struct socket *drbd_wait_for_connect(struct drbd_connection *connection,
 
 	timeo = connect_int * HZ;
 	/* 28.5% random jitter */
-	timeo += prandom_u32_max(2) ? timeo / 7 : -timeo / 7;
+	timeo += get_random_u32_below(2) ? timeo / 7 : -timeo / 7;
 
 	err = wait_for_completion_interruptible_timeout(&ad->door_bell, timeo);
 	if (err <= 0)
@@ -1004,7 +1004,7 @@ static int conn_connect(struct drbd_connection *connection)
 				drbd_warn(connection, "Error receiving initial packet\n");
 				sock_release(s);
 randomize:
-				if (prandom_u32_max(2))
+				if (get_random_u32_below(2))
 					goto retry;
 			}
 		}
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 01fd10a399b6..c73621aabbd1 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -129,7 +129,7 @@ enum mhi_pm_state {
 #define PRIMARY_CMD_RING				0
 #define MHI_DEV_WAKE_DB					127
 #define MHI_MAX_MTU					0xffff
-#define MHI_RANDOM_U32_NONZERO(bmsk)			(prandom_u32_max(bmsk) + 1)
+#define MHI_RANDOM_U32_NONZERO(bmsk)			(get_random_u32_below(bmsk) + 1)
 
 enum mhi_er_type {
 	MHI_ER_TYPE_INVALID = 0x0,
diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index 0a9b099d0518..9fbad7317d9b 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -400,7 +400,7 @@ static int __find_race(void *arg)
 		struct dma_fence *fence = dma_fence_get(data->fc.tail);
 		int seqno;
 
-		seqno = prandom_u32_max(data->fc.chain_length) + 1;
+		seqno = get_random_u32_below(data->fc.chain_length) + 1;
 
 		err = dma_fence_chain_find_seqno(&fence, seqno);
 		if (err) {
@@ -429,7 +429,7 @@ static int __find_race(void *arg)
 		dma_fence_put(fence);
 
 signal:
-		seqno = prandom_u32_max(data->fc.chain_length - 1);
+		seqno = get_random_u32_below(data->fc.chain_length - 1);
 		dma_fence_signal(data->fc.fences[seqno]);
 		cond_resched();
 	}
@@ -637,7 +637,7 @@ static void randomise_fences(struct fence_chains *fc)
 	while (--count) {
 		unsigned int swp;
 
-		swp = prandom_u32_max(count + 1);
+		swp = get_random_u32_below(count + 1);
 		if (swp == count)
 			continue;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 845023c14eb3..29d2459bcc90 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2424,7 +2424,7 @@ gen8_dispatch_bsd_engine(struct drm_i915_private *dev_priv,
 	/* Check whether the file_priv has already selected one ring. */
 	if ((int)file_priv->bsd_engine < 0)
 		file_priv->bsd_engine =
-			prandom_u32_max(num_vcs_engines(dev_priv));
+			get_random_u32_below(num_vcs_engines(dev_priv));
 
 	return file_priv->bsd_engine;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index c718e6dc40b5..45b605e32c87 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3689,7 +3689,7 @@ static void virtual_engine_initial_hint(struct virtual_engine *ve)
 	 * NB This does not force us to execute on this engine, it will just
 	 * typically be the first we inspect for submission.
 	 */
-	swp = prandom_u32_max(ve->num_siblings);
+	swp = get_random_u32_below(ve->num_siblings);
 	if (swp)
 		swap(ve->siblings[swp], ve->siblings[0]);
 }
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 9a4a7fb55582..b9a164efd6ae 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -38,7 +38,7 @@ static int __iopagetest(struct intel_memory_region *mem,
 			u8 value, resource_size_t offset,
 			const void *caller)
 {
-	int byte = prandom_u32_max(pagesize);
+	int byte = get_random_u32_below(pagesize);
 	u8 result[3];
 
 	memset_io(va, value, pagesize); /* or GPF! */
@@ -92,7 +92,7 @@ static int iopagetest(struct intel_memory_region *mem,
 static resource_size_t random_page(resource_size_t last)
 {
 	/* Limited to low 44b (16TiB), but should suffice for a spot check */
-	return prandom_u32_max(last >> PAGE_SHIFT) << PAGE_SHIFT;
+	return get_random_u32_below(last >> PAGE_SHIFT) << PAGE_SHIFT;
 }
 
 static int iomemtest(struct intel_memory_region *mem,
diff --git a/drivers/infiniband/core/cma.c b/drivers/infiniband/core/cma.c
index 26d1772179b8..dd1c703b10df 100644
--- a/drivers/infiniband/core/cma.c
+++ b/drivers/infiniband/core/cma.c
@@ -3807,7 +3807,7 @@ static int cma_alloc_any_port(enum rdma_ucm_port_space ps,
 
 	inet_get_local_port_range(net, &low, &high);
 	remaining = (high - low) + 1;
-	rover = prandom_u32_max(remaining) + low;
+	rover = get_random_u32_below(remaining) + low;
 retry:
 	if (last_used_port != rover) {
 		struct rdma_bind_list *bind_list;
diff --git a/drivers/infiniband/hw/cxgb4/id_table.c b/drivers/infiniband/hw/cxgb4/id_table.c
index 280d61466855..e2188b335e76 100644
--- a/drivers/infiniband/hw/cxgb4/id_table.c
+++ b/drivers/infiniband/hw/cxgb4/id_table.c
@@ -54,7 +54,7 @@ u32 c4iw_id_alloc(struct c4iw_id_table *alloc)
 
 	if (obj < alloc->max) {
 		if (alloc->flags & C4IW_ID_TABLE_F_RANDOM)
-			alloc->last += prandom_u32_max(RANDOM_SKIP);
+			alloc->last += get_random_u32_below(RANDOM_SKIP);
 		else
 			alloc->last = obj + 1;
 		if (alloc->last >= alloc->max)
@@ -85,7 +85,7 @@ int c4iw_id_table_alloc(struct c4iw_id_table *alloc, u32 start, u32 num,
 	alloc->start = start;
 	alloc->flags = flags;
 	if (flags & C4IW_ID_TABLE_F_RANDOM)
-		alloc->last = prandom_u32_max(RANDOM_SKIP);
+		alloc->last = get_random_u32_below(RANDOM_SKIP);
 	else
 		alloc->last = 0;
 	alloc->max = num;
diff --git a/drivers/infiniband/hw/hns/hns_roce_ah.c b/drivers/infiniband/hw/hns/hns_roce_ah.c
index 480c062dd04f..b37d2a81584d 100644
--- a/drivers/infiniband/hw/hns/hns_roce_ah.c
+++ b/drivers/infiniband/hw/hns/hns_roce_ah.c
@@ -41,8 +41,8 @@ static inline u16 get_ah_udp_sport(const struct rdma_ah_attr *ah_attr)
 	u16 sport;
 
 	if (!fl)
-		sport = prandom_u32_max(IB_ROCE_UDP_ENCAP_VALID_PORT_MAX + 1 -
-					IB_ROCE_UDP_ENCAP_VALID_PORT_MIN) +
+		sport = get_random_u32_below(IB_ROCE_UDP_ENCAP_VALID_PORT_MAX +
+					     1 - IB_ROCE_UDP_ENCAP_VALID_PORT_MIN) +
 			IB_ROCE_UDP_ENCAP_VALID_PORT_MIN;
 	else
 		sport = rdma_flow_label_to_udp_sport(fl);
diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
index 8546b8816524..ab75b690ad08 100644
--- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
+++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
@@ -1517,7 +1517,7 @@ static void rtrs_clt_err_recovery_work(struct work_struct *work)
 	rtrs_clt_stop_and_destroy_conns(clt_path);
 	queue_delayed_work(rtrs_wq, &clt_path->reconnect_dwork,
 			   msecs_to_jiffies(delay_ms +
-					    prandom_u32_max(RTRS_RECONNECT_SEED)));
+					    get_random_u32_below(RTRS_RECONNECT_SEED)));
 }
 
 static struct rtrs_clt_path *alloc_path(struct rtrs_clt_sess *clt,
diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
index 3427555b0cca..32e21ba64357 100644
--- a/drivers/md/bcache/request.c
+++ b/drivers/md/bcache/request.c
@@ -401,7 +401,7 @@ static bool check_should_bypass(struct cached_dev *dc, struct bio *bio)
 	}
 
 	if (bypass_torture_test(dc)) {
-		if (prandom_u32_max(4) == 3)
+		if (get_random_u32_below(4) == 3)
 			goto skip;
 		else
 			goto rescale;
diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index 303d02b1d71c..a366566f22c3 100644
--- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
+++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
@@ -872,7 +872,7 @@ static void precalculate_color(struct tpg_data *tpg, int k)
 	} else if (tpg->pattern == TPG_PAT_NOISE) {
 		r = g = b = get_random_u8();
 	} else if (k == TPG_COLOR_RANDOM) {
-		r = g = b = tpg->qual_offset + prandom_u32_max(196);
+		r = g = b = tpg->qual_offset + get_random_u32_below(196);
 	} else if (k >= TPG_COLOR_RAMP) {
 		r = g = b = k - TPG_COLOR_RAMP;
 	}
@@ -2286,7 +2286,7 @@ static void tpg_fill_params_extras(const struct tpg_data *tpg,
 		params->wss_width = tpg->crop.width;
 	params->wss_width = tpg_hscale_div(tpg, p, params->wss_width);
 	params->wss_random_offset =
-		params->twopixsize * prandom_u32_max(tpg->src_width / 2);
+		params->twopixsize * get_random_u32_below(tpg->src_width / 2);
 
 	if (tpg->crop.left < tpg->border.left) {
 		left_pillar_width = tpg->border.left - tpg->crop.left;
@@ -2495,9 +2495,9 @@ static void tpg_fill_plane_pattern(const struct tpg_data *tpg,
 		linestart_newer = tpg->black_line[p];
 	} else if (tpg->pattern == TPG_PAT_NOISE || tpg->qual == TPG_QUAL_NOISE) {
 		linestart_older = tpg->random_line[p] +
-				  twopixsize * prandom_u32_max(tpg->src_width / 2);
+				  twopixsize * get_random_u32_below(tpg->src_width / 2);
 		linestart_newer = tpg->random_line[p] +
-				  twopixsize * prandom_u32_max(tpg->src_width / 2);
+				  twopixsize * get_random_u32_below(tpg->src_width / 2);
 	} else {
 		unsigned frame_line_old =
 			(frame_line + mv_vert_old) % tpg->src_height;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index e7959ab1add8..d60c6d16beea 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -188,11 +188,11 @@ static void vidtv_demod_update_stats(struct dvb_frontend *fe)
 	 * Also, usually, signal strength is a negative number in dBm.
 	 */
 	c->strength.stat[0].svalue = state->tuner_cnr;
-	c->strength.stat[0].svalue -= prandom_u32_max(state->tuner_cnr / 50);
+	c->strength.stat[0].svalue -= get_random_u32_below(state->tuner_cnr / 50);
 	c->strength.stat[0].svalue -= 68000; /* Adjust to a better range */
 
 	c->cnr.stat[0].svalue = state->tuner_cnr;
-	c->cnr.stat[0].svalue -= prandom_u32_max(state->tuner_cnr / 50);
+	c->cnr.stat[0].svalue -= get_random_u32_below(state->tuner_cnr / 50);
 }
 
 static int vidtv_demod_read_status(struct dvb_frontend *fe,
@@ -213,11 +213,11 @@ static int vidtv_demod_read_status(struct dvb_frontend *fe,
 
 		if (snr < cnr2qual->cnr_ok) {
 			/* eventually lose the TS lock */
-			if (prandom_u32_max(100) < config->drop_tslock_prob_on_low_snr)
+			if (get_random_u32_below(100) < config->drop_tslock_prob_on_low_snr)
 				state->status = 0;
 		} else {
 			/* recover if the signal improves */
-			if (prandom_u32_max(100) <
+			if (get_random_u32_below(100) <
 			    config->recover_tslock_prob_on_good_snr)
 				state->status = FE_HAS_SIGNAL  |
 						FE_HAS_CARRIER |
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
index 690daada7db4..ee65d20314d3 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
@@ -693,7 +693,7 @@ static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
 
 	/* Drop a certain percentage of buffers. */
 	if (dev->perc_dropped_buffers &&
-	    prandom_u32_max(100) < dev->perc_dropped_buffers)
+	    get_random_u32_below(100) < dev->perc_dropped_buffers)
 		goto update_mv;
 
 	spin_lock(&dev->slock);
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-out.c b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
index 0833e021bb11..fac6208b51da 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
@@ -51,7 +51,7 @@ static void vivid_thread_vid_out_tick(struct vivid_dev *dev)
 
 	/* Drop a certain percentage of buffers. */
 	if (dev->perc_dropped_buffers &&
-	    prandom_u32_max(100) < dev->perc_dropped_buffers)
+	    get_random_u32_below(100) < dev->perc_dropped_buffers)
 		return;
 
 	spin_lock(&dev->slock);
diff --git a/drivers/media/test-drivers/vivid/vivid-radio-rx.c b/drivers/media/test-drivers/vivid/vivid-radio-rx.c
index 8bd09589fb15..79c1723bd84c 100644
--- a/drivers/media/test-drivers/vivid/vivid-radio-rx.c
+++ b/drivers/media/test-drivers/vivid/vivid-radio-rx.c
@@ -94,8 +94,8 @@ ssize_t vivid_radio_rx_read(struct file *file, char __user *buf,
 
 		if (data_blk == 0 && dev->radio_rds_loop)
 			vivid_radio_rds_init(dev);
-		if (perc && prandom_u32_max(100) < perc) {
-			switch (prandom_u32_max(4)) {
+		if (perc && get_random_u32_below(100) < perc) {
+			switch (get_random_u32_below(4)) {
 			case 0:
 				rds.block |= V4L2_RDS_BLOCK_CORRECTED;
 				break;
diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
index 0ae5628b86c9..a81f26b76988 100644
--- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
@@ -90,7 +90,7 @@ static void vivid_thread_sdr_cap_tick(struct vivid_dev *dev)
 
 	/* Drop a certain percentage of buffers. */
 	if (dev->perc_dropped_buffers &&
-	    prandom_u32_max(100) < dev->perc_dropped_buffers)
+	    get_random_u32_below(100) < dev->perc_dropped_buffers)
 		return;
 
 	spin_lock(&dev->slock);
diff --git a/drivers/media/test-drivers/vivid/vivid-touch-cap.c b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
index 6cc32eb54f9d..c7f6e23df51e 100644
--- a/drivers/media/test-drivers/vivid/vivid-touch-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
@@ -221,7 +221,7 @@ static void vivid_fill_buff_noise(__s16 *tch_buf, int size)
 
 static inline int get_random_pressure(void)
 {
-	return prandom_u32_max(VIVID_PRESSURE_LIMIT);
+	return get_random_u32_below(VIVID_PRESSURE_LIMIT);
 }
 
 static void vivid_tch_buf_set(struct v4l2_pix_format *f,
diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 95fa8fb1d45f..a1efda85c6f2 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -97,8 +97,8 @@ static void mmc_should_fail_request(struct mmc_host *host,
 	    !should_fail(&host->fail_mmc_request, data->blksz * data->blocks))
 		return;
 
-	data->error = data_errors[prandom_u32_max(ARRAY_SIZE(data_errors))];
-	data->bytes_xfered = prandom_u32_max(data->bytes_xfered >> 9) << 9;
+	data->error = data_errors[get_random_u32_below(ARRAY_SIZE(data_errors))];
+	data->bytes_xfered = get_random_u32_below(data->bytes_xfered >> 9) << 9;
 }
 
 #else /* CONFIG_FAIL_MMC_REQUEST */
diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index c78bbc22e0d1..6ef410053037 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -1858,7 +1858,7 @@ static void dw_mci_start_fault_timer(struct dw_mci *host)
 	 * Try to inject the error at random points during the data transfer.
 	 */
 	hrtimer_start(&host->fault_timer,
-		      ms_to_ktime(prandom_u32_max(25)),
+		      ms_to_ktime(get_random_u32_below(25)),
 		      HRTIMER_MODE_REL);
 }
 
diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 672719023241..274a31b93100 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -1405,9 +1405,9 @@ static void ns_do_bit_flips(struct nandsim *ns, int num)
 	if (bitflips && get_random_u16() < (1 << 6)) {
 		int flips = 1;
 		if (bitflips > 1)
-			flips = prandom_u32_max(bitflips) + 1;
+			flips = get_random_u32_below(bitflips) + 1;
 		while (flips--) {
-			int pos = prandom_u32_max(num * 8);
+			int pos = get_random_u32_below(num * 8);
 			ns->buf.byte[pos / 8] ^= (1 << (pos % 8));
 			NS_WARN("read_page: flipping bit %d in page %d "
 				"reading from %d ecc: corrected=%u failed=%u\n",
diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index 440988562cfd..824cc1c03b6a 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -47,7 +47,7 @@ struct nand_ecc_test {
 static void single_bit_error_data(void *error_data, void *correct_data,
 				size_t size)
 {
-	unsigned int offset = prandom_u32_max(size * BITS_PER_BYTE);
+	unsigned int offset = get_random_u32_below(size * BITS_PER_BYTE);
 
 	memcpy(error_data, correct_data, size);
 	__change_bit_le(offset, error_data);
@@ -58,9 +58,9 @@ static void double_bit_error_data(void *error_data, void *correct_data,
 {
 	unsigned int offset[2];
 
-	offset[0] = prandom_u32_max(size * BITS_PER_BYTE);
+	offset[0] = get_random_u32_below(size * BITS_PER_BYTE);
 	do {
-		offset[1] = prandom_u32_max(size * BITS_PER_BYTE);
+		offset[1] = get_random_u32_below(size * BITS_PER_BYTE);
 	} while (offset[0] == offset[1]);
 
 	memcpy(error_data, correct_data, size);
@@ -71,7 +71,7 @@ static void double_bit_error_data(void *error_data, void *correct_data,
 
 static unsigned int random_ecc_bit(size_t size)
 {
-	unsigned int offset = prandom_u32_max(3 * BITS_PER_BYTE);
+	unsigned int offset = get_random_u32_below(3 * BITS_PER_BYTE);
 
 	if (size == 256) {
 		/*
@@ -79,7 +79,7 @@ static unsigned int random_ecc_bit(size_t size)
 		 * and 17th bit) in ECC code for 256 byte data block
 		 */
 		while (offset == 16 || offset == 17)
-			offset = prandom_u32_max(3 * BITS_PER_BYTE);
+			offset = get_random_u32_below(3 * BITS_PER_BYTE);
 	}
 
 	return offset;
diff --git a/drivers/mtd/tests/stresstest.c b/drivers/mtd/tests/stresstest.c
index 75b6ddc5dc4d..8062098930d6 100644
--- a/drivers/mtd/tests/stresstest.c
+++ b/drivers/mtd/tests/stresstest.c
@@ -46,7 +46,7 @@ static int rand_eb(void)
 
 again:
 	/* Read or write up 2 eraseblocks at a time - hence 'ebcnt - 1' */
-	eb = prandom_u32_max(ebcnt - 1);
+	eb = get_random_u32_below(ebcnt - 1);
 	if (bbt[eb])
 		goto again;
 	return eb;
@@ -54,12 +54,12 @@ static int rand_eb(void)
 
 static int rand_offs(void)
 {
-	return prandom_u32_max(bufsize);
+	return get_random_u32_below(bufsize);
 }
 
 static int rand_len(int offs)
 {
-	return prandom_u32_max(bufsize - offs);
+	return get_random_u32_below(bufsize - offs);
 }
 
 static int do_read(void)
@@ -118,7 +118,7 @@ static int do_write(void)
 
 static int do_operation(void)
 {
-	if (prandom_u32_max(2))
+	if (get_random_u32_below(2))
 		return do_read();
 	else
 		return do_write();
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 908d0e088557..fcca6942dbdd 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -590,7 +590,7 @@ int ubi_dbg_power_cut(struct ubi_device *ubi, int caller)
 
 		if (ubi->dbg.power_cut_max > ubi->dbg.power_cut_min) {
 			range = ubi->dbg.power_cut_max - ubi->dbg.power_cut_min;
-			ubi->dbg.power_cut_counter += prandom_u32_max(range);
+			ubi->dbg.power_cut_counter += get_random_u32_below(range);
 		}
 		return 0;
 	}
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index dc8d8f83657a..23676f32b681 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -73,7 +73,7 @@ static inline int ubi_dbg_is_bgt_disabled(const struct ubi_device *ubi)
 static inline int ubi_dbg_is_bitflip(const struct ubi_device *ubi)
 {
 	if (ubi->dbg.emulate_bitflips)
-		return !prandom_u32_max(200);
+		return !get_random_u32_below(200);
 	return 0;
 }
 
@@ -87,7 +87,7 @@ static inline int ubi_dbg_is_bitflip(const struct ubi_device *ubi)
 static inline int ubi_dbg_is_write_failure(const struct ubi_device *ubi)
 {
 	if (ubi->dbg.emulate_io_failures)
-		return !prandom_u32_max(500);
+		return !get_random_u32_below(500);
 	return 0;
 }
 
@@ -101,7 +101,7 @@ static inline int ubi_dbg_is_write_failure(const struct ubi_device *ubi)
 static inline int ubi_dbg_is_erase_failure(const struct ubi_device *ubi)
 {
 	if (ubi->dbg.emulate_io_failures)
-		return !prandom_u32_max(400);
+		return !get_random_u32_below(400);
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/broadcom/cnic.c b/drivers/net/ethernet/broadcom/cnic.c
index 2198e35d9e18..74bc053a2078 100644
--- a/drivers/net/ethernet/broadcom/cnic.c
+++ b/drivers/net/ethernet/broadcom/cnic.c
@@ -4105,7 +4105,7 @@ static int cnic_cm_alloc_mem(struct cnic_dev *dev)
 	for (i = 0; i < MAX_CM_SK_TBL_SZ; i++)
 		atomic_set(&cp->csk_tbl[i].ref_count, 0);
 
-	port_id = prandom_u32_max(CNIC_LOCAL_PORT_RANGE);
+	port_id = get_random_u32_below(CNIC_LOCAL_PORT_RANGE);
 	if (cnic_init_id_tbl(&cp->csk_port_tbl, CNIC_LOCAL_PORT_RANGE,
 			     CNIC_LOCAL_PORT_MIN, port_id)) {
 		cnic_cm_free_mem(dev);
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_io.c b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_io.c
index a4256087ac82..ae6b17b96bf1 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_io.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_io.c
@@ -919,8 +919,8 @@ static int csk_wait_memory(struct chtls_dev *cdev,
 	current_timeo = *timeo_p;
 	noblock = (*timeo_p ? false : true);
 	if (csk_mem_free(cdev, sk)) {
-		current_timeo = prandom_u32_max(HZ / 5) + 2;
-		vm_wait = prandom_u32_max(HZ / 5) + 2;
+		current_timeo = get_random_u32_below(HZ / 5) + 2;
+		vm_wait = get_random_u32_below(HZ / 5) + 2;
 	}
 
 	add_wait_queue(sk_sleep(sk), &wait);
diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
index 349b7b1dbbf2..b07513c61c35 100644
--- a/drivers/net/phy/at803x.c
+++ b/drivers/net/phy/at803x.c
@@ -1758,7 +1758,7 @@ static int qca808x_phy_fast_retrain_config(struct phy_device *phydev)
 
 static int qca808x_phy_ms_random_seed_set(struct phy_device *phydev)
 {
-	u16 seed_value = prandom_u32_max(QCA808X_MASTER_SLAVE_SEED_RANGE);
+	u16 seed_value = get_random_u32_below(QCA808X_MASTER_SLAVE_SEED_RANGE);
 
 	return at803x_debug_reg_mask(phydev, QCA808X_PHY_DEBUG_LOCAL_SEED,
 			QCA808X_MASTER_SLAVE_SEED_CFG,
diff --git a/drivers/net/team/team_mode_random.c b/drivers/net/team/team_mode_random.c
index f3f8dd428402..53d0ce34b8ce 100644
--- a/drivers/net/team/team_mode_random.c
+++ b/drivers/net/team/team_mode_random.c
@@ -16,7 +16,7 @@ static bool rnd_transmit(struct team *team, struct sk_buff *skb)
 	struct team_port *port;
 	int port_index;
 
-	port_index = prandom_u32_max(team->en_port_count);
+	port_index = get_random_u32_below(team->en_port_count);
 	port = team_get_port_by_index_rcu(team, port_index);
 	if (unlikely(!port))
 		goto drop;
diff --git a/drivers/net/wireguard/selftest/allowedips.c b/drivers/net/wireguard/selftest/allowedips.c
index 19eac00b2381..78a916f30c82 100644
--- a/drivers/net/wireguard/selftest/allowedips.c
+++ b/drivers/net/wireguard/selftest/allowedips.c
@@ -285,8 +285,8 @@ static __init bool randomized_test(void)
 
 	for (i = 0; i < NUM_RAND_ROUTES; ++i) {
 		get_random_bytes(ip, 4);
-		cidr = prandom_u32_max(32) + 1;
-		peer = peers[prandom_u32_max(NUM_PEERS)];
+		cidr = get_random_u32_below(32) + 1;
+		peer = peers[get_random_u32_below(NUM_PEERS)];
 		if (wg_allowedips_insert_v4(&t, (struct in_addr *)ip, cidr,
 					    peer, &mutex) < 0) {
 			pr_err("allowedips random self-test malloc: FAIL\n");
@@ -300,7 +300,7 @@ static __init bool randomized_test(void)
 		for (j = 0; j < NUM_MUTATED_ROUTES; ++j) {
 			memcpy(mutated, ip, 4);
 			get_random_bytes(mutate_mask, 4);
-			mutate_amount = prandom_u32_max(32);
+			mutate_amount = get_random_u32_below(32);
 			for (k = 0; k < mutate_amount / 8; ++k)
 				mutate_mask[k] = 0xff;
 			mutate_mask[k] = 0xff
@@ -311,8 +311,8 @@ static __init bool randomized_test(void)
 				mutated[k] = (mutated[k] & mutate_mask[k]) |
 					     (~mutate_mask[k] &
 					      get_random_u8());
-			cidr = prandom_u32_max(32) + 1;
-			peer = peers[prandom_u32_max(NUM_PEERS)];
+			cidr = get_random_u32_below(32) + 1;
+			peer = peers[get_random_u32_below(NUM_PEERS)];
 			if (wg_allowedips_insert_v4(&t,
 						    (struct in_addr *)mutated,
 						    cidr, peer, &mutex) < 0) {
@@ -329,8 +329,8 @@ static __init bool randomized_test(void)
 
 	for (i = 0; i < NUM_RAND_ROUTES; ++i) {
 		get_random_bytes(ip, 16);
-		cidr = prandom_u32_max(128) + 1;
-		peer = peers[prandom_u32_max(NUM_PEERS)];
+		cidr = get_random_u32_below(128) + 1;
+		peer = peers[get_random_u32_below(NUM_PEERS)];
 		if (wg_allowedips_insert_v6(&t, (struct in6_addr *)ip, cidr,
 					    peer, &mutex) < 0) {
 			pr_err("allowedips random self-test malloc: FAIL\n");
@@ -344,7 +344,7 @@ static __init bool randomized_test(void)
 		for (j = 0; j < NUM_MUTATED_ROUTES; ++j) {
 			memcpy(mutated, ip, 16);
 			get_random_bytes(mutate_mask, 16);
-			mutate_amount = prandom_u32_max(128);
+			mutate_amount = get_random_u32_below(128);
 			for (k = 0; k < mutate_amount / 8; ++k)
 				mutate_mask[k] = 0xff;
 			mutate_mask[k] = 0xff
@@ -355,8 +355,8 @@ static __init bool randomized_test(void)
 				mutated[k] = (mutated[k] & mutate_mask[k]) |
 					     (~mutate_mask[k] &
 					      get_random_u8());
-			cidr = prandom_u32_max(128) + 1;
-			peer = peers[prandom_u32_max(NUM_PEERS)];
+			cidr = get_random_u32_below(128) + 1;
+			peer = peers[get_random_u32_below(NUM_PEERS)];
 			if (wg_allowedips_insert_v6(&t,
 						    (struct in6_addr *)mutated,
 						    cidr, peer, &mutex) < 0) {
diff --git a/drivers/net/wireguard/timers.c b/drivers/net/wireguard/timers.c
index d54d32ac9bc4..b5706b6718b1 100644
--- a/drivers/net/wireguard/timers.c
+++ b/drivers/net/wireguard/timers.c
@@ -147,7 +147,7 @@ void wg_timers_data_sent(struct wg_peer *peer)
 	if (!timer_pending(&peer->timer_new_handshake))
 		mod_peer_timer(peer, &peer->timer_new_handshake,
 			jiffies + (KEEPALIVE_TIMEOUT + REKEY_TIMEOUT) * HZ +
-			prandom_u32_max(REKEY_TIMEOUT_JITTER_MAX_JIFFIES));
+			get_random_u32_below(REKEY_TIMEOUT_JITTER_MAX_JIFFIES));
 }
 
 /* Should be called after an authenticated data packet is received. */
@@ -183,7 +183,7 @@ void wg_timers_handshake_initiated(struct wg_peer *peer)
 {
 	mod_peer_timer(peer, &peer->timer_retransmit_handshake,
 		       jiffies + REKEY_TIMEOUT * HZ +
-		       prandom_u32_max(REKEY_TIMEOUT_JITTER_MAX_JIFFIES));
+		       get_random_u32_below(REKEY_TIMEOUT_JITTER_MAX_JIFFIES));
 }
 
 /* Should be called after a handshake response message is received and processed
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
index 10d9d9c63b28..23c971b77965 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
@@ -1128,7 +1128,7 @@ static void brcmf_p2p_afx_handler(struct work_struct *work)
 	if (afx_hdl->is_listen && afx_hdl->my_listen_chan)
 		/* 100ms ~ 300ms */
 		err = brcmf_p2p_discover_listen(p2p, afx_hdl->my_listen_chan,
-						100 * (1 + prandom_u32_max(3)));
+						100 * (1 + get_random_u32_below(3)));
 	else
 		err = brcmf_p2p_act_frm_search(p2p, afx_hdl->peer_listen_chan);
 
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c b/drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c
index de0c545d50fd..1696fbf1009a 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c
@@ -1099,7 +1099,7 @@ static void iwl_mvm_mac_ctxt_cmd_fill_ap(struct iwl_mvm *mvm,
 			iwl_mvm_mac_ap_iterator, &data);
 
 		if (data.beacon_device_ts) {
-			u32 rand = prandom_u32_max(64 - 36) + 36;
+			u32 rand = get_random_u32_below(64 - 36) + 36;
 			mvmvif->ap_beacon_time = data.beacon_device_ts +
 				ieee80211_tu_to_usec(data.beacon_int * rand /
 						     100);
diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 88dc66ee1c46..5565f67d6537 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -673,7 +673,7 @@ struct pci_dev *pci_p2pmem_find_many(struct device **clients, int num_clients)
 	}
 
 	if (dev_cnt)
-		pdev = pci_dev_get(closest_pdevs[prandom_u32_max(dev_cnt)]);
+		pdev = pci_dev_get(closest_pdevs[get_random_u32_below(dev_cnt)]);
 
 	for (i = 0; i < dev_cnt; i++)
 		pci_dev_put(closest_pdevs[i]);
diff --git a/drivers/s390/scsi/zfcp_fc.c b/drivers/s390/scsi/zfcp_fc.c
index 77917b339870..f21307537829 100644
--- a/drivers/s390/scsi/zfcp_fc.c
+++ b/drivers/s390/scsi/zfcp_fc.c
@@ -48,7 +48,7 @@ unsigned int zfcp_fc_port_scan_backoff(void)
 {
 	if (!port_scan_backoff)
 		return 0;
-	return prandom_u32_max(port_scan_backoff);
+	return get_random_u32_below(port_scan_backoff);
 }
 
 static void zfcp_fc_port_scan_time(struct zfcp_adapter *adapter)
diff --git a/drivers/scsi/fcoe/fcoe_ctlr.c b/drivers/scsi/fcoe/fcoe_ctlr.c
index ddc048069af2..5c8d1ba3f8f3 100644
--- a/drivers/scsi/fcoe/fcoe_ctlr.c
+++ b/drivers/scsi/fcoe/fcoe_ctlr.c
@@ -2233,7 +2233,7 @@ static void fcoe_ctlr_vn_restart(struct fcoe_ctlr *fip)
 
 	if (fip->probe_tries < FIP_VN_RLIM_COUNT) {
 		fip->probe_tries++;
-		wait = prandom_u32_max(FIP_VN_PROBE_WAIT);
+		wait = get_random_u32_below(FIP_VN_PROBE_WAIT);
 	} else
 		wait = FIP_VN_RLIM_INT;
 	mod_timer(&fip->timer, jiffies + msecs_to_jiffies(wait));
@@ -3125,7 +3125,7 @@ static void fcoe_ctlr_vn_timeout(struct fcoe_ctlr *fip)
 					  fcoe_all_vn2vn, 0);
 			fip->port_ka_time = jiffies +
 				 msecs_to_jiffies(FIP_VN_BEACON_INT +
-					prandom_u32_max(FIP_VN_BEACON_FUZZ));
+					get_random_u32_below(FIP_VN_BEACON_FUZZ));
 		}
 		if (time_before(fip->port_ka_time, next_time))
 			next_time = fip->port_ka_time;
diff --git a/drivers/scsi/qedi/qedi_main.c b/drivers/scsi/qedi/qedi_main.c
index df2fe7bd26d1..f2ee49756df8 100644
--- a/drivers/scsi/qedi/qedi_main.c
+++ b/drivers/scsi/qedi/qedi_main.c
@@ -618,7 +618,7 @@ static int qedi_cm_alloc_mem(struct qedi_ctx *qedi)
 				sizeof(struct qedi_endpoint *)), GFP_KERNEL);
 	if (!qedi->ep_tbl)
 		return -ENOMEM;
-	port_id = prandom_u32_max(QEDI_LOCAL_PORT_RANGE);
+	port_id = get_random_u32_below(QEDI_LOCAL_PORT_RANGE);
 	if (qedi_init_id_tbl(&qedi->lcl_port_tbl, QEDI_LOCAL_PORT_RANGE,
 			     QEDI_LOCAL_PORT_MIN, port_id)) {
 		qedi_cm_free_mem(qedi);
diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index 629853662b82..a86db9761d00 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -5702,16 +5702,16 @@ static int schedule_resp(struct scsi_cmnd *cmnd, struct sdebug_dev_info *devip,
 			u64 ns = jiffies_to_nsecs(delta_jiff);
 
 			if (sdebug_random && ns < U32_MAX) {
-				ns = prandom_u32_max((u32)ns);
+				ns = get_random_u32_below((u32)ns);
 			} else if (sdebug_random) {
 				ns >>= 12;	/* scale to 4 usec precision */
 				if (ns < U32_MAX)	/* over 4 hours max */
-					ns = prandom_u32_max((u32)ns);
+					ns = get_random_u32_below((u32)ns);
 				ns <<= 12;
 			}
 			kt = ns_to_ktime(ns);
 		} else {	/* ndelay has a 4.2 second max */
-			kt = sdebug_random ? prandom_u32_max((u32)ndelay) :
+			kt = sdebug_random ? get_random_u32_below((u32)ndelay) :
 					     (u32)ndelay;
 			if (ndelay < INCLUSIVE_TIMING_MAX_NS) {
 				u64 d = ktime_get_boottime_ns() - ns_from_boot;
diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
index 4af5e55abc15..fb255988dee8 100644
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -362,7 +362,7 @@ static int ceph_fill_fragtree(struct inode *inode,
 	if (nsplits != ci->i_fragtree_nsplits) {
 		update = true;
 	} else if (nsplits) {
-		i = prandom_u32_max(nsplits);
+		i = get_random_u32_below(nsplits);
 		id = le32_to_cpu(fragtree->splits[i].frag);
 		if (!__ceph_find_frag(ci, id))
 			update = true;
diff --git a/fs/ceph/mdsmap.c b/fs/ceph/mdsmap.c
index 3fbabc98e1f7..7dac21ee6ce7 100644
--- a/fs/ceph/mdsmap.c
+++ b/fs/ceph/mdsmap.c
@@ -29,7 +29,7 @@ static int __mdsmap_get_random_mds(struct ceph_mdsmap *m, bool ignore_laggy)
 		return -1;
 
 	/* pick */
-	n = prandom_u32_max(n);
+	n = get_random_u32_below(n);
 	for (j = 0, i = 0; i < m->possible_max_rank; i++) {
 		if (CEPH_MDS_IS_READY(i, ignore_laggy))
 			j++;
diff --git a/fs/ext2/ialloc.c b/fs/ext2/ialloc.c
index f4944c4dee60..78b8686d9a4a 100644
--- a/fs/ext2/ialloc.c
+++ b/fs/ext2/ialloc.c
@@ -277,7 +277,7 @@ static int find_group_orlov(struct super_block *sb, struct inode *parent)
 		int best_ndir = inodes_per_group;
 		int best_group = -1;
 
-		parent_group = prandom_u32_max(ngroups);
+		parent_group = get_random_u32_below(ngroups);
 		for (i = 0; i < ngroups; i++) {
 			group = (parent_group + i) % ngroups;
 			desc = ext2_get_group_desc (sb, group, NULL);
diff --git a/fs/ext4/ialloc.c b/fs/ext4/ialloc.c
index e9bc46684106..9fc1af8e19a3 100644
--- a/fs/ext4/ialloc.c
+++ b/fs/ext4/ialloc.c
@@ -465,7 +465,7 @@ static int find_group_orlov(struct super_block *sb, struct inode *parent,
 			ext4fs_dirhash(parent, qstr->name, qstr->len, &hinfo);
 			parent_group = hinfo.hash % ngroups;
 		} else
-			parent_group = prandom_u32_max(ngroups);
+			parent_group = get_random_u32_below(ngroups);
 		for (i = 0; i < ngroups; i++) {
 			g = (parent_group + i) % ngroups;
 			get_orlov_stats(sb, g, flex_size, &stats);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 7cdd2138c897..63ef74eb8091 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -3778,7 +3778,7 @@ static int ext4_lazyinit_thread(void *arg)
 			}
 			if (!progress) {
 				elr->lr_next_sched = jiffies +
-					prandom_u32_max(EXT4_DEF_LI_MAX_START_DELAY * HZ);
+					get_random_u32_below(EXT4_DEF_LI_MAX_START_DELAY * HZ);
 			}
 			if (time_before(elr->lr_next_sched, next_wakeup))
 				next_wakeup = elr->lr_next_sched;
@@ -3925,8 +3925,7 @@ static struct ext4_li_request *ext4_li_request_new(struct super_block *sb,
 	 * spread the inode table initialization requests
 	 * better.
 	 */
-	elr->lr_next_sched = jiffies + prandom_u32_max(
-				EXT4_DEF_LI_MAX_START_DELAY * HZ);
+	elr->lr_next_sched = jiffies + get_random_u32_below(EXT4_DEF_LI_MAX_START_DELAY * HZ);
 	return elr;
 }
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 4546e01b2ee0..536d332d9e2e 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -282,7 +282,7 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,
 
 	/* let's select beginning hot/small space first in no_heap mode*/
 	if (f2fs_need_rand_seg(sbi))
-		p->offset = prandom_u32_max(MAIN_SECS(sbi) * sbi->segs_per_sec);
+		p->offset = get_random_u32_below(MAIN_SECS(sbi) * sbi->segs_per_sec);
 	else if (test_opt(sbi, NOHEAP) &&
 		(type == CURSEG_HOT_DATA || IS_NODESEG(type)))
 		p->offset = 0;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index acf3d3fa4363..334415d946f8 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2534,7 +2534,7 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
 
 	sanity_check_seg_type(sbi, seg_type);
 	if (f2fs_need_rand_seg(sbi))
-		return prandom_u32_max(MAIN_SECS(sbi) * sbi->segs_per_sec);
+		return get_random_u32_below(MAIN_SECS(sbi) * sbi->segs_per_sec);
 
 	/* if segs_per_sec is large than 1, we need to keep original policy. */
 	if (__is_large_section(sbi))
@@ -2588,7 +2588,7 @@ static void new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
 	curseg->alloc_type = LFS;
 	if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK)
 		curseg->fragment_remained_chunk =
-				prandom_u32_max(sbi->max_fragment_chunk) + 1;
+				get_random_u32_below(sbi->max_fragment_chunk) + 1;
 }
 
 static int __next_free_blkoff(struct f2fs_sb_info *sbi,
@@ -2625,9 +2625,9 @@ static void __refresh_next_blkoff(struct f2fs_sb_info *sbi,
 			/* To allocate block chunks in different sizes, use random number */
 			if (--seg->fragment_remained_chunk <= 0) {
 				seg->fragment_remained_chunk =
-				   prandom_u32_max(sbi->max_fragment_chunk) + 1;
+				   get_random_u32_below(sbi->max_fragment_chunk) + 1;
 				seg->next_blkoff +=
-				   prandom_u32_max(sbi->max_fragment_hole) + 1;
+				   get_random_u32_below(sbi->max_fragment_hole) + 1;
 			}
 		}
 	}
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 3f128b9fdfbb..9c9d3f0e36a4 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2467,7 +2467,7 @@ int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head)
 
 static inline int chance(unsigned int n, unsigned int out_of)
 {
-	return !!(prandom_u32_max(out_of) + 1 <= n);
+	return !!(get_random_u32_below(out_of) + 1 <= n);
 
 }
 
@@ -2485,13 +2485,13 @@ static int power_cut_emulated(struct ubifs_info *c, int lnum, int write)
 			if (chance(1, 2)) {
 				d->pc_delay = 1;
 				/* Fail within 1 minute */
-				delay = prandom_u32_max(60000);
+				delay = get_random_u32_below(60000);
 				d->pc_timeout = jiffies;
 				d->pc_timeout += msecs_to_jiffies(delay);
 				ubifs_warn(c, "failing after %lums", delay);
 			} else {
 				d->pc_delay = 2;
-				delay = prandom_u32_max(10000);
+				delay = get_random_u32_below(10000);
 				/* Fail within 10000 operations */
 				d->pc_cnt_max = delay;
 				ubifs_warn(c, "failing after %lu calls", delay);
@@ -2571,7 +2571,7 @@ static int corrupt_data(const struct ubifs_info *c, const void *buf,
 	unsigned int from, to, ffs = chance(1, 2);
 	unsigned char *p = (void *)buf;
 
-	from = prandom_u32_max(len);
+	from = get_random_u32_below(len);
 	/* Corruption span max to end of write unit */
 	to = min(len, ALIGN(from + 1, c->max_write_size));
 
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index cfbc31f709f4..c4d079328b92 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -1970,28 +1970,28 @@ static int dbg_populate_lsave(struct ubifs_info *c)
 
 	if (!dbg_is_chk_gen(c))
 		return 0;
-	if (prandom_u32_max(4))
+	if (get_random_u32_below(4))
 		return 0;
 
 	for (i = 0; i < c->lsave_cnt; i++)
 		c->lsave[i] = c->main_first;
 
 	list_for_each_entry(lprops, &c->empty_list, list)
-		c->lsave[prandom_u32_max(c->lsave_cnt)] = lprops->lnum;
+		c->lsave[get_random_u32_below(c->lsave_cnt)] = lprops->lnum;
 	list_for_each_entry(lprops, &c->freeable_list, list)
-		c->lsave[prandom_u32_max(c->lsave_cnt)] = lprops->lnum;
+		c->lsave[get_random_u32_below(c->lsave_cnt)] = lprops->lnum;
 	list_for_each_entry(lprops, &c->frdi_idx_list, list)
-		c->lsave[prandom_u32_max(c->lsave_cnt)] = lprops->lnum;
+		c->lsave[get_random_u32_below(c->lsave_cnt)] = lprops->lnum;
 
 	heap = &c->lpt_heap[LPROPS_DIRTY_IDX - 1];
 	for (i = 0; i < heap->cnt; i++)
-		c->lsave[prandom_u32_max(c->lsave_cnt)] = heap->arr[i]->lnum;
+		c->lsave[get_random_u32_below(c->lsave_cnt)] = heap->arr[i]->lnum;
 	heap = &c->lpt_heap[LPROPS_DIRTY - 1];
 	for (i = 0; i < heap->cnt; i++)
-		c->lsave[prandom_u32_max(c->lsave_cnt)] = heap->arr[i]->lnum;
+		c->lsave[get_random_u32_below(c->lsave_cnt)] = heap->arr[i]->lnum;
 	heap = &c->lpt_heap[LPROPS_FREE - 1];
 	for (i = 0; i < heap->cnt; i++)
-		c->lsave[prandom_u32_max(c->lsave_cnt)] = heap->arr[i]->lnum;
+		c->lsave[get_random_u32_below(c->lsave_cnt)] = heap->arr[i]->lnum;
 
 	return 1;
 }
diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index 01362ad5f804..a55e04822d16 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -700,7 +700,7 @@ static int alloc_idx_lebs(struct ubifs_info *c, int cnt)
 		c->ilebs[c->ileb_cnt++] = lnum;
 		dbg_cmt("LEB %d", lnum);
 	}
-	if (dbg_is_chk_index(c) && !prandom_u32_max(8))
+	if (dbg_is_chk_index(c) && !get_random_u32_below(8))
 		return -ENOSPC;
 	return 0;
 }
diff --git a/fs/xfs/libxfs/xfs_alloc.c b/fs/xfs/libxfs/xfs_alloc.c
index de79f5d07f65..989cf341779b 100644
--- a/fs/xfs/libxfs/xfs_alloc.c
+++ b/fs/xfs/libxfs/xfs_alloc.c
@@ -1516,7 +1516,7 @@ xfs_alloc_ag_vextent_lastblock(
 
 #ifdef DEBUG
 	/* Randomly don't execute the first algorithm. */
-	if (prandom_u32_max(2))
+	if (get_random_u32_below(2))
 		return 0;
 #endif
 
diff --git a/fs/xfs/libxfs/xfs_ialloc.c b/fs/xfs/libxfs/xfs_ialloc.c
index 94db50eb706a..5118dedf9267 100644
--- a/fs/xfs/libxfs/xfs_ialloc.c
+++ b/fs/xfs/libxfs/xfs_ialloc.c
@@ -636,7 +636,7 @@ xfs_ialloc_ag_alloc(
 	/* randomly do sparse inode allocations */
 	if (xfs_has_sparseinodes(tp->t_mountp) &&
 	    igeo->ialloc_min_blks < igeo->ialloc_blks)
-		do_sparse = prandom_u32_max(2);
+		do_sparse = get_random_u32_below(2);
 #endif
 
 	/*
diff --git a/fs/xfs/xfs_error.c b/fs/xfs/xfs_error.c
index c6b2aabd6f18..822e6a0e9d1a 100644
--- a/fs/xfs/xfs_error.c
+++ b/fs/xfs/xfs_error.c
@@ -279,7 +279,7 @@ xfs_errortag_test(
 
 	ASSERT(error_tag < XFS_ERRTAG_MAX);
 	randfactor = mp->m_errortag[error_tag];
-	if (!randfactor || prandom_u32_max(randfactor))
+	if (!randfactor || get_random_u32_below(randfactor))
 		return false;
 
 	xfs_warn_ratelimited(mp,
diff --git a/include/linux/damon.h b/include/linux/damon.h
index 620ada094c3b..84525b9cdf6e 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -21,7 +21,7 @@
 /* Get a random number in [l, r) */
 static inline unsigned long damon_rand(unsigned long l, unsigned long r)
 {
-	return l + prandom_u32_max(r - l);
+	return l + get_random_u32_below(r - l);
 }
 
 /**
diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index efef68c9352a..bb0ee80526b2 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -516,7 +516,7 @@ static inline int node_random(const nodemask_t *maskp)
 		bit = first_node(*maskp);
 		break;
 	default:
-		bit = find_nth_bit(maskp->bits, MAX_NUMNODES, prandom_u32_max(w));
+		bit = find_nth_bit(maskp->bits, MAX_NUMNODES, get_random_u32_below(w));
 		break;
 	}
 	return bit;
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 25a54e04560e..38159f39e2af 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -1032,7 +1032,7 @@ bpf_jit_binary_alloc(unsigned int proglen, u8 **image_ptr,
 	hdr->size = size;
 	hole = min_t(unsigned int, size - (proglen + sizeof(*hdr)),
 		     PAGE_SIZE - sizeof(*hdr));
-	start = prandom_u32_max(hole) & ~(alignment - 1);
+	start = get_random_u32_below(hole) & ~(alignment - 1);
 
 	/* Leave a random number of instructions before BPF code. */
 	*image_ptr = &hdr->image[start];
@@ -1094,7 +1094,7 @@ bpf_jit_binary_pack_alloc(unsigned int proglen, u8 **image_ptr,
 
 	hole = min_t(unsigned int, size - (proglen + sizeof(*ro_header)),
 		     BPF_PROG_CHUNK_SIZE - sizeof(*ro_header));
-	start = prandom_u32_max(hole) & ~(alignment - 1);
+	start = get_random_u32_below(hole) & ~(alignment - 1);
 
 	*image_ptr = &ro_header->image[start];
 	*rw_image = &(*rw_header)->image[start];
diff --git a/kernel/kcsan/selftest.c b/kernel/kcsan/selftest.c
index 1740ce389e7f..7b619f16a492 100644
--- a/kernel/kcsan/selftest.c
+++ b/kernel/kcsan/selftest.c
@@ -31,8 +31,8 @@ static bool __init test_encode_decode(void)
 	int i;
 
 	for (i = 0; i < ITERS_PER_TEST; ++i) {
-		size_t size = prandom_u32_max(MAX_ENCODABLE_SIZE) + 1;
-		bool is_write = !!prandom_u32_max(2);
+		size_t size = get_random_u32_below(MAX_ENCODABLE_SIZE) + 1;
+		bool is_write = !!get_random_u32_below(2);
 		unsigned long verif_masked_addr;
 		long encoded_watchpoint;
 		bool verif_is_write;
diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-ww_mutex.c
index 43efb2a04160..29dc253d03af 100644
--- a/kernel/locking/test-ww_mutex.c
+++ b/kernel/locking/test-ww_mutex.c
@@ -399,7 +399,7 @@ static int *get_random_order(int count)
 		order[n] = n;
 
 	for (n = count - 1; n > 1; n--) {
-		r = prandom_u32_max(n + 1);
+		r = get_random_u32_below(n + 1);
 		if (r != n) {
 			tmp = order[n];
 			order[n] = order[r];
@@ -538,7 +538,7 @@ static void stress_one_work(struct work_struct *work)
 {
 	struct stress *stress = container_of(work, typeof(*stress), work);
 	const int nlocks = stress->nlocks;
-	struct ww_mutex *lock = stress->locks + prandom_u32_max(nlocks);
+	struct ww_mutex *lock = stress->locks + get_random_u32_below(nlocks);
 	int err;
 
 	do {
diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 8058bec87ace..9cf32ccda715 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -310,7 +310,7 @@ static void clocksource_verify_choose_cpus(void)
 	 * CPUs that are currently online.
 	 */
 	for (i = 1; i < n; i++) {
-		cpu = prandom_u32_max(nr_cpu_ids);
+		cpu = get_random_u32_below(nr_cpu_ids);
 		cpu = cpumask_next(cpu - 1, cpu_online_mask);
 		if (cpu >= nr_cpu_ids)
 			cpu = cpumask_first(cpu_online_mask);
diff --git a/lib/fault-inject.c b/lib/fault-inject.c
index 96e092de5b72..9f53408c545d 100644
--- a/lib/fault-inject.c
+++ b/lib/fault-inject.c
@@ -139,7 +139,7 @@ bool should_fail(struct fault_attr *attr, ssize_t size)
 			return false;
 	}
 
-	if (attr->probability <= prandom_u32_max(100))
+	if (attr->probability <= get_random_u32_below(100))
 		return false;
 
 	if (!fail_stacktrace(attr))
diff --git a/lib/find_bit_benchmark.c b/lib/find_bit_benchmark.c
index 7c3c011abd29..d3fb09e6eff1 100644
--- a/lib/find_bit_benchmark.c
+++ b/lib/find_bit_benchmark.c
@@ -174,8 +174,8 @@ static int __init find_bit_test(void)
 	bitmap_zero(bitmap2, BITMAP_LEN);
 
 	while (nbits--) {
-		__set_bit(prandom_u32_max(BITMAP_LEN), bitmap);
-		__set_bit(prandom_u32_max(BITMAP_LEN), bitmap2);
+		__set_bit(get_random_u32_below(BITMAP_LEN), bitmap);
+		__set_bit(get_random_u32_below(BITMAP_LEN), bitmap2);
 	}
 
 	test_find_next_bit(bitmap, BITMAP_LEN);
diff --git a/lib/kobject.c b/lib/kobject.c
index a0b2dbfcfa23..af1f5f2954d4 100644
--- a/lib/kobject.c
+++ b/lib/kobject.c
@@ -694,7 +694,7 @@ static void kobject_release(struct kref *kref)
 {
 	struct kobject *kobj = container_of(kref, struct kobject, kref);
 #ifdef CONFIG_DEBUG_KOBJECT_RELEASE
-	unsigned long delay = HZ + HZ * prandom_u32_max(4);
+	unsigned long delay = HZ + HZ * get_random_u32_below(4);
 	pr_info("kobject: '%s' (%p): %s, parent %p (delayed %ld)\n",
 		 kobject_name(kobj), kobj, __func__, kobj->parent, delay);
 	INIT_DELAYED_WORK(&kobj->release, kobject_delayed_cleanup);
diff --git a/lib/reed_solomon/test_rslib.c b/lib/reed_solomon/test_rslib.c
index 848e7eb5da92..75cb1adac884 100644
--- a/lib/reed_solomon/test_rslib.c
+++ b/lib/reed_solomon/test_rslib.c
@@ -183,7 +183,7 @@ static int get_rcw_we(struct rs_control *rs, struct wspace *ws,
 
 		do {
 			/* Must not choose the same location twice */
-			errloc = prandom_u32_max(len);
+			errloc = get_random_u32_below(len);
 		} while (errlocs[errloc] != 0);
 
 		errlocs[errloc] = 1;
@@ -194,12 +194,12 @@ static int get_rcw_we(struct rs_control *rs, struct wspace *ws,
 	for (i = 0; i < eras; i++) {
 		do {
 			/* Must not choose the same location twice */
-			errloc = prandom_u32_max(len);
+			errloc = get_random_u32_below(len);
 		} while (errlocs[errloc] != 0);
 
 		derrlocs[i] = errloc;
 
-		if (ewsc && prandom_u32_max(2)) {
+		if (ewsc && get_random_u32_below(2)) {
 			/* Erasure with the symbol intact */
 			errlocs[errloc] = 2;
 		} else {
diff --git a/lib/sbitmap.c b/lib/sbitmap.c
index 7280ae8ca88c..58de526ff051 100644
--- a/lib/sbitmap.c
+++ b/lib/sbitmap.c
@@ -21,7 +21,7 @@ static int init_alloc_hint(struct sbitmap *sb, gfp_t flags)
 		int i;
 
 		for_each_possible_cpu(i)
-			*per_cpu_ptr(sb->alloc_hint, i) = prandom_u32_max(depth);
+			*per_cpu_ptr(sb->alloc_hint, i) = get_random_u32_below(depth);
 	}
 	return 0;
 }
@@ -33,7 +33,7 @@ static inline unsigned update_alloc_hint_before_get(struct sbitmap *sb,
 
 	hint = this_cpu_read(*sb->alloc_hint);
 	if (unlikely(hint >= depth)) {
-		hint = depth ? prandom_u32_max(depth) : 0;
+		hint = depth ? get_random_u32_below(depth) : 0;
 		this_cpu_write(*sb->alloc_hint, hint);
 	}
 
diff --git a/lib/test-string_helpers.c b/lib/test-string_helpers.c
index 86fadd3ba08c..41d3447bc3b4 100644
--- a/lib/test-string_helpers.c
+++ b/lib/test-string_helpers.c
@@ -587,7 +587,7 @@ static int __init test_string_helpers_init(void)
 	for (i = 0; i < UNESCAPE_ALL_MASK + 1; i++)
 		test_string_unescape("unescape", i, false);
 	test_string_unescape("unescape inplace",
-			     prandom_u32_max(UNESCAPE_ANY + 1), true);
+			     get_random_u32_below(UNESCAPE_ANY + 1), true);
 
 	/* Without dictionary */
 	for (i = 0; i < ESCAPE_ALL_MASK + 1; i++)
diff --git a/lib/test_hexdump.c b/lib/test_hexdump.c
index 0927f44cd478..efc50fd30a44 100644
--- a/lib/test_hexdump.c
+++ b/lib/test_hexdump.c
@@ -149,7 +149,7 @@ static void __init test_hexdump(size_t len, int rowsize, int groupsize,
 static void __init test_hexdump_set(int rowsize, bool ascii)
 {
 	size_t d = min_t(size_t, sizeof(data_b), rowsize);
-	size_t len = prandom_u32_max(d) + 1;
+	size_t len = get_random_u32_below(d) + 1;
 
 	test_hexdump(len, rowsize, 4, ascii);
 	test_hexdump(len, rowsize, 2, ascii);
@@ -208,11 +208,11 @@ static void __init test_hexdump_overflow(size_t buflen, size_t len,
 static void __init test_hexdump_overflow_set(size_t buflen, bool ascii)
 {
 	unsigned int i = 0;
-	int rs = (prandom_u32_max(2) + 1) * 16;
+	int rs = (get_random_u32_below(2) + 1) * 16;
 
 	do {
 		int gs = 1 << i;
-		size_t len = prandom_u32_max(rs) + gs;
+		size_t len = get_random_u32_below(rs) + gs;
 
 		test_hexdump_overflow(buflen, rounddown(len, gs), rs, gs, ascii);
 	} while (i++ < 3);
@@ -223,11 +223,11 @@ static int __init test_hexdump_init(void)
 	unsigned int i;
 	int rowsize;
 
-	rowsize = (prandom_u32_max(2) + 1) * 16;
+	rowsize = (get_random_u32_below(2) + 1) * 16;
 	for (i = 0; i < 16; i++)
 		test_hexdump_set(rowsize, false);
 
-	rowsize = (prandom_u32_max(2) + 1) * 16;
+	rowsize = (get_random_u32_below(2) + 1) * 16;
 	for (i = 0; i < 16; i++)
 		test_hexdump_set(rowsize, true);
 
diff --git a/lib/test_list_sort.c b/lib/test_list_sort.c
index 19ff229b9c3a..cc5f335f29b5 100644
--- a/lib/test_list_sort.c
+++ b/lib/test_list_sort.c
@@ -71,7 +71,7 @@ static void list_sort_test(struct kunit *test)
 		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, el);
 
 		 /* force some equivalencies */
-		el->value = prandom_u32_max(TEST_LIST_LEN / 3);
+		el->value = get_random_u32_below(TEST_LIST_LEN / 3);
 		el->serial = i;
 		el->poison1 = TEST_POISON1;
 		el->poison2 = TEST_POISON2;
diff --git a/lib/test_printf.c b/lib/test_printf.c
index 4bd15a593fbd..6d10187eddac 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -126,7 +126,7 @@ __test(const char *expect, int elen, const char *fmt, ...)
 	 * be able to print it as expected.
 	 */
 	failed_tests += do_test(BUF_SIZE, expect, elen, fmt, ap);
-	rand = 1 + prandom_u32_max(elen+1);
+	rand = 1 + get_random_u32_below(elen + 1);
 	/* Since elen < BUF_SIZE, we have 1 <= rand <= BUF_SIZE. */
 	failed_tests += do_test(rand, expect, elen, fmt, ap);
 	failed_tests += do_test(0, expect, elen, fmt, ap);
diff --git a/lib/test_rhashtable.c b/lib/test_rhashtable.c
index f2ba5787055a..6a8e445c8b55 100644
--- a/lib/test_rhashtable.c
+++ b/lib/test_rhashtable.c
@@ -368,8 +368,8 @@ static int __init test_rhltable(unsigned int entries)
 
 	pr_info("test %d random rhlist add/delete operations\n", entries);
 	for (j = 0; j < entries; j++) {
-		u32 i = prandom_u32_max(entries);
-		u32 prand = prandom_u32_max(4);
+		u32 i = get_random_u32_below(entries);
+		u32 prand = get_random_u32_below(4);
 
 		cond_resched();
 
@@ -396,7 +396,7 @@ static int __init test_rhltable(unsigned int entries)
 		}
 
 		if (prand & 2) {
-			i = prandom_u32_max(entries);
+			i = get_random_u32_below(entries);
 			if (test_bit(i, obj_in_table)) {
 				err = rhltable_remove(&rhlt, &rhl_test_objects[i].list_node, test_rht_params);
 				WARN(err, "cannot remove element at slot %d", i);
diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
index cf7780572f5b..104f09ea5fcc 100644
--- a/lib/test_vmalloc.c
+++ b/lib/test_vmalloc.c
@@ -151,7 +151,7 @@ static int random_size_alloc_test(void)
 	int i;
 
 	for (i = 0; i < test_loop_count; i++) {
-		n = prandom_u32_max(100) + 1;
+		n = get_random_u32_below(100) + 1;
 		p = vmalloc(n * PAGE_SIZE);
 
 		if (!p)
@@ -291,12 +291,12 @@ pcpu_alloc_test(void)
 		return -1;
 
 	for (i = 0; i < 35000; i++) {
-		size = prandom_u32_max(PAGE_SIZE / 4) + 1;
+		size = get_random_u32_below(PAGE_SIZE / 4) + 1;
 
 		/*
 		 * Maximum PAGE_SIZE
 		 */
-		align = 1 << (prandom_u32_max(11) + 1);
+		align = 1 << (get_random_u32_below(11) + 1);
 
 		pcpu[i] = __alloc_percpu(size, align);
 		if (!pcpu[i])
@@ -391,7 +391,7 @@ static void shuffle_array(int *arr, int n)
 
 	for (i = n - 1; i > 0; i--)  {
 		/* Cut the range. */
-		j = prandom_u32_max(i);
+		j = get_random_u32_below(i);
 
 		/* Swap indexes. */
 		swap(arr[i], arr[j]);
diff --git a/mm/kasan/kasan_test.c b/mm/kasan/kasan_test.c
index 0d59098f0876..640f9c7f8e44 100644
--- a/mm/kasan/kasan_test.c
+++ b/mm/kasan/kasan_test.c
@@ -1299,7 +1299,7 @@ static void match_all_not_assigned(struct kunit *test)
 	KASAN_TEST_NEEDS_CONFIG_OFF(test, CONFIG_KASAN_GENERIC);
 
 	for (i = 0; i < 256; i++) {
-		size = prandom_u32_max(1024) + 1;
+		size = get_random_u32_below(1024) + 1;
 		ptr = kmalloc(size, GFP_KERNEL);
 		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
 		KUNIT_EXPECT_GE(test, (u8)get_tag(ptr), (u8)KASAN_TAG_MIN);
@@ -1308,7 +1308,7 @@ static void match_all_not_assigned(struct kunit *test)
 	}
 
 	for (i = 0; i < 256; i++) {
-		order = prandom_u32_max(4) + 1;
+		order = get_random_u32_below(4) + 1;
 		pages = alloc_pages(GFP_KERNEL, order);
 		ptr = page_address(pages);
 		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
@@ -1321,7 +1321,7 @@ static void match_all_not_assigned(struct kunit *test)
 		return;
 
 	for (i = 0; i < 256; i++) {
-		size = prandom_u32_max(1024) + 1;
+		size = get_random_u32_below(1024) + 1;
 		ptr = vmalloc(size);
 		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
 		KUNIT_EXPECT_GE(test, (u8)get_tag(ptr), (u8)KASAN_TAG_MIN);
diff --git a/mm/kfence/core.c b/mm/kfence/core.c
index 141788858b70..6cbd93f2007b 100644
--- a/mm/kfence/core.c
+++ b/mm/kfence/core.c
@@ -360,9 +360,9 @@ static void *kfence_guarded_alloc(struct kmem_cache *cache, size_t size, gfp_t g
 	unsigned long flags;
 	struct slab *slab;
 	void *addr;
-	const bool random_right_allocate = prandom_u32_max(2);
+	const bool random_right_allocate = get_random_u32_below(2);
 	const bool random_fault = CONFIG_KFENCE_STRESS_TEST_FAULTS &&
-				  !prandom_u32_max(CONFIG_KFENCE_STRESS_TEST_FAULTS);
+				  !get_random_u32_below(CONFIG_KFENCE_STRESS_TEST_FAULTS);
 
 	/* Try to obtain a free object. */
 	raw_spin_lock_irqsave(&kfence_freelist_lock, flags);
diff --git a/mm/kfence/kfence_test.c b/mm/kfence/kfence_test.c
index a97bffe0cc3e..20028c179796 100644
--- a/mm/kfence/kfence_test.c
+++ b/mm/kfence/kfence_test.c
@@ -532,8 +532,8 @@ static void test_free_bulk(struct kunit *test)
 	int iter;
 
 	for (iter = 0; iter < 5; iter++) {
-		const size_t size = setup_test_cache(test, 8 + prandom_u32_max(300), 0,
-						     (iter & 1) ? ctor_set_x : NULL);
+		const size_t size = setup_test_cache(test, 8 + get_random_u32_below(300),
+						     0, (iter & 1) ? ctor_set_x : NULL);
 		void *objects[] = {
 			test_alloc(test, size, GFP_KERNEL, ALLOCATE_RIGHT),
 			test_alloc(test, size, GFP_KERNEL, ALLOCATE_NONE),
diff --git a/mm/slub.c b/mm/slub.c
index 157527d7101b..7cd2c657030a 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1881,7 +1881,7 @@ static bool shuffle_freelist(struct kmem_cache *s, struct slab *slab)
 		return false;
 
 	freelist_count = oo_objects(s->oo);
-	pos = prandom_u32_max(freelist_count);
+	pos = get_random_u32_below(freelist_count);
 
 	page_limit = slab->objects * s->size;
 	start = fixup_red_left(s, slab_address(slab));
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 5fc1237a9f21..e9318305a24a 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -773,7 +773,7 @@ static void set_cluster_next(struct swap_info_struct *si, unsigned long next)
 		if (si->highest_bit <= si->lowest_bit)
 			return;
 		next = si->lowest_bit +
-			prandom_u32_max(si->highest_bit - si->lowest_bit + 1);
+			get_random_u32_below(si->highest_bit - si->lowest_bit + 1);
 		next = ALIGN_DOWN(next, SWAP_ADDRESS_SPACE_PAGES);
 		next = max_t(unsigned int, next, si->lowest_bit);
 	}
@@ -3089,7 +3089,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		 */
 		for_each_possible_cpu(cpu) {
 			per_cpu(*p->cluster_next_cpu, cpu) =
-				1 + prandom_u32_max(p->highest_bit);
+				1 + get_random_u32_below(p->highest_bit);
 		}
 		nr_cluster = DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
 
diff --git a/net/802/garp.c b/net/802/garp.c
index fc9eb02a912f..77aac2763835 100644
--- a/net/802/garp.c
+++ b/net/802/garp.c
@@ -407,7 +407,7 @@ static void garp_join_timer_arm(struct garp_applicant *app)
 {
 	unsigned long delay;
 
-	delay = prandom_u32_max(msecs_to_jiffies(garp_join_time));
+	delay = get_random_u32_below(msecs_to_jiffies(garp_join_time));
 	mod_timer(&app->join_timer, jiffies + delay);
 }
 
diff --git a/net/802/mrp.c b/net/802/mrp.c
index 155f74d8b14f..8c6f0381023b 100644
--- a/net/802/mrp.c
+++ b/net/802/mrp.c
@@ -592,7 +592,7 @@ static void mrp_join_timer_arm(struct mrp_applicant *app)
 {
 	unsigned long delay;
 
-	delay = prandom_u32_max(msecs_to_jiffies(mrp_join_time));
+	delay = get_random_u32_below(msecs_to_jiffies(mrp_join_time));
 	mod_timer(&app->join_timer, jiffies + delay);
 }
 
diff --git a/net/batman-adv/bat_iv_ogm.c b/net/batman-adv/bat_iv_ogm.c
index 7f6a7c96ac92..114ee5da261f 100644
--- a/net/batman-adv/bat_iv_ogm.c
+++ b/net/batman-adv/bat_iv_ogm.c
@@ -280,7 +280,7 @@ batadv_iv_ogm_emit_send_time(const struct batadv_priv *bat_priv)
 	unsigned int msecs;
 
 	msecs = atomic_read(&bat_priv->orig_interval) - BATADV_JITTER;
-	msecs += prandom_u32_max(2 * BATADV_JITTER);
+	msecs += get_random_u32_below(2 * BATADV_JITTER);
 
 	return jiffies + msecs_to_jiffies(msecs);
 }
@@ -288,7 +288,7 @@ batadv_iv_ogm_emit_send_time(const struct batadv_priv *bat_priv)
 /* when do we schedule a ogm packet to be sent */
 static unsigned long batadv_iv_ogm_fwd_send_time(void)
 {
-	return jiffies + msecs_to_jiffies(prandom_u32_max(BATADV_JITTER / 2));
+	return jiffies + msecs_to_jiffies(get_random_u32_below(BATADV_JITTER / 2));
 }
 
 /* apply hop penalty for a normal link */
diff --git a/net/batman-adv/bat_v_elp.c b/net/batman-adv/bat_v_elp.c
index f1741fbfb617..f9a58fb5442e 100644
--- a/net/batman-adv/bat_v_elp.c
+++ b/net/batman-adv/bat_v_elp.c
@@ -51,7 +51,7 @@ static void batadv_v_elp_start_timer(struct batadv_hard_iface *hard_iface)
 	unsigned int msecs;
 
 	msecs = atomic_read(&hard_iface->bat_v.elp_interval) - BATADV_JITTER;
-	msecs += prandom_u32_max(2 * BATADV_JITTER);
+	msecs += get_random_u32_below(2 * BATADV_JITTER);
 
 	queue_delayed_work(batadv_event_workqueue, &hard_iface->bat_v.elp_wq,
 			   msecs_to_jiffies(msecs));
diff --git a/net/batman-adv/bat_v_ogm.c b/net/batman-adv/bat_v_ogm.c
index 033639df96d8..addfd8c4fe95 100644
--- a/net/batman-adv/bat_v_ogm.c
+++ b/net/batman-adv/bat_v_ogm.c
@@ -90,7 +90,7 @@ static void batadv_v_ogm_start_queue_timer(struct batadv_hard_iface *hard_iface)
 	unsigned int msecs = BATADV_MAX_AGGREGATION_MS * 1000;
 
 	/* msecs * [0.9, 1.1] */
-	msecs += prandom_u32_max(msecs / 5) - (msecs / 10);
+	msecs += get_random_u32_below(msecs / 5) - (msecs / 10);
 	queue_delayed_work(batadv_event_workqueue, &hard_iface->bat_v.aggr_wq,
 			   msecs_to_jiffies(msecs / 1000));
 }
@@ -109,7 +109,7 @@ static void batadv_v_ogm_start_timer(struct batadv_priv *bat_priv)
 		return;
 
 	msecs = atomic_read(&bat_priv->orig_interval) - BATADV_JITTER;
-	msecs += prandom_u32_max(2 * BATADV_JITTER);
+	msecs += get_random_u32_below(2 * BATADV_JITTER);
 	queue_delayed_work(batadv_event_workqueue, &bat_priv->bat_v.ogm_wq,
 			   msecs_to_jiffies(msecs));
 }
diff --git a/net/batman-adv/network-coding.c b/net/batman-adv/network-coding.c
index 5f4aeeb60dc4..bf29fba4dde5 100644
--- a/net/batman-adv/network-coding.c
+++ b/net/batman-adv/network-coding.c
@@ -1009,7 +1009,7 @@ static struct batadv_nc_path *batadv_nc_get_path(struct batadv_priv *bat_priv,
 static u8 batadv_nc_random_weight_tq(u8 tq)
 {
 	/* randomize the estimated packet loss (max TQ - estimated TQ) */
-	u8 rand_tq = prandom_u32_max(BATADV_TQ_MAX_VALUE + 1 - tq);
+	u8 rand_tq = get_random_u32_below(BATADV_TQ_MAX_VALUE + 1 - tq);
 
 	/* convert to (randomized) estimated tq again */
 	return BATADV_TQ_MAX_VALUE - rand_tq;
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index a92e7e485feb..b2f9679066c4 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -7374,8 +7374,8 @@ static int get_conn_info(struct sock *sk, struct hci_dev *hdev, void *data,
 	 * calculate conn info age as random value between min/max set in hdev.
 	 */
 	conn_info_age = hdev->conn_info_min_age +
-			prandom_u32_max(hdev->conn_info_max_age -
-					hdev->conn_info_min_age);
+			get_random_u32_below(hdev->conn_info_max_age -
+					     hdev->conn_info_min_age);
 
 	/* Query controller to refresh cached values if they are too old or were
 	 * never read.
diff --git a/net/can/j1939/socket.c b/net/can/j1939/socket.c
index b670ba03a675..7e90f9e61d9b 100644
--- a/net/can/j1939/socket.c
+++ b/net/can/j1939/socket.c
@@ -189,7 +189,7 @@ static void j1939_sk_queue_activate_next_locked(struct j1939_session *session)
 		int time_ms = 0;
 
 		if (err)
-			time_ms = 10 + prandom_u32_max(16);
+			time_ms = 10 + get_random_u32_below(16);
 
 		j1939_tp_schedule_txtimer(first, time_ms);
 	}
diff --git a/net/can/j1939/transport.c b/net/can/j1939/transport.c
index 55f29c9f9e08..67d36776aff4 100644
--- a/net/can/j1939/transport.c
+++ b/net/can/j1939/transport.c
@@ -1168,7 +1168,7 @@ static enum hrtimer_restart j1939_tp_txtimer(struct hrtimer *hrtimer)
 		if (session->tx_retry < J1939_XTP_TX_RETRY_LIMIT) {
 			session->tx_retry++;
 			j1939_tp_schedule_txtimer(session,
-						  10 + prandom_u32_max(16));
+						  10 + get_random_u32_below(16));
 		} else {
 			netdev_alert(priv->ndev, "%s: 0x%p: tx retry count reached\n",
 				     __func__, session);
diff --git a/net/ceph/mon_client.c b/net/ceph/mon_client.c
index db60217f911b..faabad6603db 100644
--- a/net/ceph/mon_client.c
+++ b/net/ceph/mon_client.c
@@ -222,7 +222,7 @@ static void pick_new_mon(struct ceph_mon_client *monc)
 				max--;
 		}
 
-		n = prandom_u32_max(max);
+		n = get_random_u32_below(max);
 		if (o >= 0 && n >= o)
 			n++;
 
diff --git a/net/ceph/osd_client.c b/net/ceph/osd_client.c
index 4e4f1e4bc265..11c04e7d928e 100644
--- a/net/ceph/osd_client.c
+++ b/net/ceph/osd_client.c
@@ -1479,7 +1479,7 @@ static bool target_should_be_paused(struct ceph_osd_client *osdc,
 
 static int pick_random_replica(const struct ceph_osds *acting)
 {
-	int i = prandom_u32_max(acting->size);
+	int i = get_random_u32_below(acting->size);
 
 	dout("%s picked osd%d, primary osd%d\n", __func__,
 	     acting->osds[i], acting->primary);
diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index a77a85e357e0..ba92762de525 100644
--- a/net/core/neighbour.c
+++ b/net/core/neighbour.c
@@ -111,7 +111,7 @@ static void neigh_cleanup_and_release(struct neighbour *neigh)
 
 unsigned long neigh_rand_reach_time(unsigned long base)
 {
-	return base ? prandom_u32_max(base) + (base >> 1) : 0;
+	return base ? get_random_u32_below(base) + (base >> 1) : 0;
 }
 EXPORT_SYMBOL(neigh_rand_reach_time);
 
@@ -1652,7 +1652,7 @@ void pneigh_enqueue(struct neigh_table *tbl, struct neigh_parms *p,
 		    struct sk_buff *skb)
 {
 	unsigned long sched_next = jiffies +
-			prandom_u32_max(NEIGH_VAR(p, PROXY_DELAY));
+			get_random_u32_below(NEIGH_VAR(p, PROXY_DELAY));
 
 	if (p->qlen > NEIGH_VAR(p, PROXY_QLEN)) {
 		kfree_skb(skb);
diff --git a/net/core/pktgen.c b/net/core/pktgen.c
index c3763056c554..95da2ddc1c20 100644
--- a/net/core/pktgen.c
+++ b/net/core/pktgen.c
@@ -2324,7 +2324,7 @@ static inline int f_pick(struct pktgen_dev *pkt_dev)
 				pkt_dev->curfl = 0; /*reset */
 		}
 	} else {
-		flow = prandom_u32_max(pkt_dev->cflows);
+		flow = get_random_u32_below(pkt_dev->cflows);
 		pkt_dev->curfl = flow;
 
 		if (pkt_dev->flows[flow].count > pkt_dev->lflow) {
@@ -2380,8 +2380,8 @@ static void set_cur_queue_map(struct pktgen_dev *pkt_dev)
 	else if (pkt_dev->queue_map_min <= pkt_dev->queue_map_max) {
 		__u16 t;
 		if (pkt_dev->flags & F_QUEUE_MAP_RND) {
-			t = prandom_u32_max(pkt_dev->queue_map_max -
-					    pkt_dev->queue_map_min + 1) +
+			t = get_random_u32_below(pkt_dev->queue_map_max -
+						 pkt_dev->queue_map_min + 1) +
 			    pkt_dev->queue_map_min;
 		} else {
 			t = pkt_dev->cur_queue_map + 1;
@@ -2411,7 +2411,7 @@ static void mod_cur_headers(struct pktgen_dev *pkt_dev)
 		__u32 tmp;
 
 		if (pkt_dev->flags & F_MACSRC_RND)
-			mc = prandom_u32_max(pkt_dev->src_mac_count);
+			mc = get_random_u32_below(pkt_dev->src_mac_count);
 		else {
 			mc = pkt_dev->cur_src_mac_offset++;
 			if (pkt_dev->cur_src_mac_offset >=
@@ -2437,7 +2437,7 @@ static void mod_cur_headers(struct pktgen_dev *pkt_dev)
 		__u32 tmp;
 
 		if (pkt_dev->flags & F_MACDST_RND)
-			mc = prandom_u32_max(pkt_dev->dst_mac_count);
+			mc = get_random_u32_below(pkt_dev->dst_mac_count);
 
 		else {
 			mc = pkt_dev->cur_dst_mac_offset++;
@@ -2469,16 +2469,16 @@ static void mod_cur_headers(struct pktgen_dev *pkt_dev)
 	}
 
 	if ((pkt_dev->flags & F_VID_RND) && (pkt_dev->vlan_id != 0xffff)) {
-		pkt_dev->vlan_id = prandom_u32_max(4096);
+		pkt_dev->vlan_id = get_random_u32_below(4096);
 	}
 
 	if ((pkt_dev->flags & F_SVID_RND) && (pkt_dev->svlan_id != 0xffff)) {
-		pkt_dev->svlan_id = prandom_u32_max(4096);
+		pkt_dev->svlan_id = get_random_u32_below(4096);
 	}
 
 	if (pkt_dev->udp_src_min < pkt_dev->udp_src_max) {
 		if (pkt_dev->flags & F_UDPSRC_RND)
-			pkt_dev->cur_udp_src = prandom_u32_max(
+			pkt_dev->cur_udp_src = get_random_u32_below(
 				pkt_dev->udp_src_max - pkt_dev->udp_src_min) +
 				pkt_dev->udp_src_min;
 
@@ -2491,7 +2491,7 @@ static void mod_cur_headers(struct pktgen_dev *pkt_dev)
 
 	if (pkt_dev->udp_dst_min < pkt_dev->udp_dst_max) {
 		if (pkt_dev->flags & F_UDPDST_RND) {
-			pkt_dev->cur_udp_dst = prandom_u32_max(
+			pkt_dev->cur_udp_dst = get_random_u32_below(
 				pkt_dev->udp_dst_max - pkt_dev->udp_dst_min) +
 				pkt_dev->udp_dst_min;
 		} else {
@@ -2508,7 +2508,7 @@ static void mod_cur_headers(struct pktgen_dev *pkt_dev)
 		if (imn < imx) {
 			__u32 t;
 			if (pkt_dev->flags & F_IPSRC_RND)
-				t = prandom_u32_max(imx - imn) + imn;
+				t = get_random_u32_below(imx - imn) + imn;
 			else {
 				t = ntohl(pkt_dev->cur_saddr);
 				t++;
@@ -2530,7 +2530,7 @@ static void mod_cur_headers(struct pktgen_dev *pkt_dev)
 				if (pkt_dev->flags & F_IPDST_RND) {
 
 					do {
-						t = prandom_u32_max(imx - imn) +
+						t = get_random_u32_below(imx - imn) +
 						    imn;
 						s = htonl(t);
 					} while (ipv4_is_loopback(s) ||
@@ -2578,8 +2578,8 @@ static void mod_cur_headers(struct pktgen_dev *pkt_dev)
 	if (pkt_dev->min_pkt_size < pkt_dev->max_pkt_size) {
 		__u32 t;
 		if (pkt_dev->flags & F_TXSIZE_RND) {
-			t = prandom_u32_max(pkt_dev->max_pkt_size -
-					    pkt_dev->min_pkt_size) +
+			t = get_random_u32_below(pkt_dev->max_pkt_size -
+						 pkt_dev->min_pkt_size) +
 			    pkt_dev->min_pkt_size;
 		} else {
 			t = pkt_dev->cur_pkt_size + 1;
@@ -2589,7 +2589,7 @@ static void mod_cur_headers(struct pktgen_dev *pkt_dev)
 		pkt_dev->cur_pkt_size = t;
 	} else if (pkt_dev->n_imix_entries > 0) {
 		struct imix_pkt *entry;
-		__u32 t = prandom_u32_max(IMIX_PRECISION);
+		__u32 t = get_random_u32_below(IMIX_PRECISION);
 		__u8 entry_index = pkt_dev->imix_distribution[t];
 
 		entry = &pkt_dev->imix_entries[entry_index];
diff --git a/net/core/stream.c b/net/core/stream.c
index 75fded8495f5..5b1fe2b82eac 100644
--- a/net/core/stream.c
+++ b/net/core/stream.c
@@ -123,7 +123,7 @@ int sk_stream_wait_memory(struct sock *sk, long *timeo_p)
 	DEFINE_WAIT_FUNC(wait, woken_wake_function);
 
 	if (sk_stream_memory_free(sk))
-		current_timeo = vm_wait = prandom_u32_max(HZ / 5) + 2;
+		current_timeo = vm_wait = get_random_u32_below(HZ / 5) + 2;
 
 	add_wait_queue(sk_sleep(sk), &wait);
 
diff --git a/net/ipv4/icmp.c b/net/ipv4/icmp.c
index d5d745c3e345..46aa2d65e40a 100644
--- a/net/ipv4/icmp.c
+++ b/net/ipv4/icmp.c
@@ -263,7 +263,7 @@ bool icmp_global_allow(void)
 		/* We want to use a credit of one in average, but need to randomize
 		 * it for security reasons.
 		 */
-		credit = max_t(int, credit - prandom_u32_max(3), 0);
+		credit = max_t(int, credit - get_random_u32_below(3), 0);
 		rc = true;
 	}
 	WRITE_ONCE(icmp_global.credit, credit);
diff --git a/net/ipv4/igmp.c b/net/ipv4/igmp.c
index 81be3e0f0e70..c920aa9a62a9 100644
--- a/net/ipv4/igmp.c
+++ b/net/ipv4/igmp.c
@@ -213,7 +213,7 @@ static void igmp_stop_timer(struct ip_mc_list *im)
 /* It must be called with locked im->lock */
 static void igmp_start_timer(struct ip_mc_list *im, int max_delay)
 {
-	int tv = prandom_u32_max(max_delay);
+	int tv = get_random_u32_below(max_delay);
 
 	im->tm_running = 1;
 	if (!mod_timer(&im->timer, jiffies+tv+2))
@@ -222,7 +222,7 @@ static void igmp_start_timer(struct ip_mc_list *im, int max_delay)
 
 static void igmp_gq_start_timer(struct in_device *in_dev)
 {
-	int tv = prandom_u32_max(in_dev->mr_maxdelay);
+	int tv = get_random_u32_below(in_dev->mr_maxdelay);
 	unsigned long exp = jiffies + tv + 2;
 
 	if (in_dev->mr_gq_running &&
@@ -236,7 +236,7 @@ static void igmp_gq_start_timer(struct in_device *in_dev)
 
 static void igmp_ifc_start_timer(struct in_device *in_dev, int delay)
 {
-	int tv = prandom_u32_max(delay);
+	int tv = get_random_u32_below(delay);
 
 	if (!mod_timer(&in_dev->mr_ifc_timer, jiffies+tv+2))
 		in_dev_hold(in_dev);
diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index 4e84ed21d16f..f22051219b50 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -314,7 +314,7 @@ inet_csk_find_open_port(const struct sock *sk, struct inet_bind_bucket **tb_ret,
 	if (likely(remaining > 1))
 		remaining &= ~1U;
 
-	offset = prandom_u32_max(remaining);
+	offset = get_random_u32_below(remaining);
 	/* __inet_hash_connect() favors ports having @low parity
 	 * We do the opposite to not pollute connect() users.
 	 */
diff --git a/net/ipv4/inet_hashtables.c b/net/ipv4/inet_hashtables.c
index d3dc28156622..a879ec1a267d 100644
--- a/net/ipv4/inet_hashtables.c
+++ b/net/ipv4/inet_hashtables.c
@@ -1037,7 +1037,7 @@ int __inet_hash_connect(struct inet_timewait_death_row *death_row,
 	 * on low contention the randomness is maximal and on high contention
 	 * it may be inexistent.
 	 */
-	i = max_t(int, i, prandom_u32_max(8) * 2);
+	i = max_t(int, i, get_random_u32_below(8) * 2);
 	WRITE_ONCE(table_perturb[index], READ_ONCE(table_perturb[index]) + i + 2);
 
 	/* Head lock still held and bh's disabled */
diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index cd1fa9f70f1a..de6e3515ab4f 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -471,7 +471,7 @@ static u32 ip_idents_reserve(u32 hash, int segs)
 	old = READ_ONCE(*p_tstamp);
 
 	if (old != now && cmpxchg(p_tstamp, old, now) == old)
-		delta = prandom_u32_max(now - old);
+		delta = get_random_u32_below(now - old);
 
 	/* If UBSAN reports an error there, please make sure your compiler
 	 * supports -fno-strict-overflow before reporting it that was a bug
@@ -689,7 +689,7 @@ static void update_or_create_fnhe(struct fib_nh_common *nhc, __be32 daddr,
 	} else {
 		/* Randomize max depth to avoid some side channels attacks. */
 		int max_depth = FNHE_RECLAIM_DEPTH +
-				prandom_u32_max(FNHE_RECLAIM_DEPTH);
+				get_random_u32_below(FNHE_RECLAIM_DEPTH);
 
 		while (depth > max_depth) {
 			fnhe_remove_oldest(hash);
diff --git a/net/ipv4/tcp_bbr.c b/net/ipv4/tcp_bbr.c
index 54eec33c6e1c..d2c470524e58 100644
--- a/net/ipv4/tcp_bbr.c
+++ b/net/ipv4/tcp_bbr.c
@@ -618,7 +618,7 @@ static void bbr_reset_probe_bw_mode(struct sock *sk)
 	struct bbr *bbr = inet_csk_ca(sk);
 
 	bbr->mode = BBR_PROBE_BW;
-	bbr->cycle_idx = CYCLE_LEN - 1 - prandom_u32_max(bbr_cycle_rand);
+	bbr->cycle_idx = CYCLE_LEN - 1 - get_random_u32_below(bbr_cycle_rand);
 	bbr_advance_cycle_phase(sk);	/* flip to next phase of gain cycle */
 }
 
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 0640453fce54..3b076e5ba932 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -3646,7 +3646,8 @@ static void tcp_send_challenge_ack(struct sock *sk)
 		u32 half = (ack_limit + 1) >> 1;
 
 		WRITE_ONCE(net->ipv4.tcp_challenge_timestamp, now);
-		WRITE_ONCE(net->ipv4.tcp_challenge_count, half + prandom_u32_max(ack_limit));
+		WRITE_ONCE(net->ipv4.tcp_challenge_count,
+			   half + get_random_u32_below(ack_limit));
 	}
 	count = READ_ONCE(net->ipv4.tcp_challenge_count);
 	if (count > 0) {
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 9c3f5202a97b..daf89a2eb492 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -104,7 +104,7 @@ static inline u32 cstamp_delta(unsigned long cstamp)
 static inline s32 rfc3315_s14_backoff_init(s32 irt)
 {
 	/* multiply 'initial retransmission time' by 0.9 .. 1.1 */
-	u64 tmp = (900000 + prandom_u32_max(200001)) * (u64)irt;
+	u64 tmp = (900000 + get_random_u32_below(200001)) * (u64)irt;
 	do_div(tmp, 1000000);
 	return (s32)tmp;
 }
@@ -112,11 +112,11 @@ static inline s32 rfc3315_s14_backoff_init(s32 irt)
 static inline s32 rfc3315_s14_backoff_update(s32 rt, s32 mrt)
 {
 	/* multiply 'retransmission timeout' by 1.9 .. 2.1 */
-	u64 tmp = (1900000 + prandom_u32_max(200001)) * (u64)rt;
+	u64 tmp = (1900000 + get_random_u32_below(200001)) * (u64)rt;
 	do_div(tmp, 1000000);
 	if ((s32)tmp > mrt) {
 		/* multiply 'maximum retransmission time' by 0.9 .. 1.1 */
-		tmp = (900000 + prandom_u32_max(200001)) * (u64)mrt;
+		tmp = (900000 + get_random_u32_below(200001)) * (u64)mrt;
 		do_div(tmp, 1000000);
 	}
 	return (s32)tmp;
@@ -3967,7 +3967,7 @@ static void addrconf_dad_kick(struct inet6_ifaddr *ifp)
 	if (ifp->flags & IFA_F_OPTIMISTIC)
 		rand_num = 0;
 	else
-		rand_num = prandom_u32_max(idev->cnf.rtr_solicit_delay ?: 1);
+		rand_num = get_random_u32_below(idev->cnf.rtr_solicit_delay ? : 1);
 
 	nonce = 0;
 	if (idev->cnf.enhanced_dad ||
diff --git a/net/ipv6/mcast.c b/net/ipv6/mcast.c
index 7860383295d8..1c02160cf7a4 100644
--- a/net/ipv6/mcast.c
+++ b/net/ipv6/mcast.c
@@ -1050,7 +1050,7 @@ bool ipv6_chk_mcast_addr(struct net_device *dev, const struct in6_addr *group,
 /* called with mc_lock */
 static void mld_gq_start_work(struct inet6_dev *idev)
 {
-	unsigned long tv = prandom_u32_max(idev->mc_maxdelay);
+	unsigned long tv = get_random_u32_below(idev->mc_maxdelay);
 
 	idev->mc_gq_running = 1;
 	if (!mod_delayed_work(mld_wq, &idev->mc_gq_work, tv + 2))
@@ -1068,7 +1068,7 @@ static void mld_gq_stop_work(struct inet6_dev *idev)
 /* called with mc_lock */
 static void mld_ifc_start_work(struct inet6_dev *idev, unsigned long delay)
 {
-	unsigned long tv = prandom_u32_max(delay);
+	unsigned long tv = get_random_u32_below(delay);
 
 	if (!mod_delayed_work(mld_wq, &idev->mc_ifc_work, tv + 2))
 		in6_dev_hold(idev);
@@ -1085,7 +1085,7 @@ static void mld_ifc_stop_work(struct inet6_dev *idev)
 /* called with mc_lock */
 static void mld_dad_start_work(struct inet6_dev *idev, unsigned long delay)
 {
-	unsigned long tv = prandom_u32_max(delay);
+	unsigned long tv = get_random_u32_below(delay);
 
 	if (!mod_delayed_work(mld_wq, &idev->mc_dad_work, tv + 2))
 		in6_dev_hold(idev);
@@ -1130,7 +1130,7 @@ static void igmp6_group_queried(struct ifmcaddr6 *ma, unsigned long resptime)
 	}
 
 	if (delay >= resptime)
-		delay = prandom_u32_max(resptime);
+		delay = get_random_u32_below(resptime);
 
 	if (!mod_delayed_work(mld_wq, &ma->mca_work, delay))
 		refcount_inc(&ma->mca_refcnt);
@@ -2574,7 +2574,7 @@ static void igmp6_join_group(struct ifmcaddr6 *ma)
 
 	igmp6_send(&ma->mca_addr, ma->idev->dev, ICMPV6_MGM_REPORT);
 
-	delay = prandom_u32_max(unsolicited_report_interval(ma->idev));
+	delay = get_random_u32_below(unsolicited_report_interval(ma->idev));
 
 	if (cancel_delayed_work(&ma->mca_work)) {
 		refcount_dec(&ma->mca_refcnt);
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 2f355f0ec32a..e74e0361fd92 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1713,7 +1713,7 @@ static int rt6_insert_exception(struct rt6_info *nrt,
 	net->ipv6.rt6_stats->fib_rt_cache++;
 
 	/* Randomize max depth to avoid some side channels attacks. */
-	max_depth = FIB6_MAX_DEPTH + prandom_u32_max(FIB6_MAX_DEPTH);
+	max_depth = FIB6_MAX_DEPTH + get_random_u32_below(FIB6_MAX_DEPTH);
 	while (bucket->depth > max_depth)
 		rt6_exception_remove_oldest(bucket);
 
diff --git a/net/netfilter/ipvs/ip_vs_twos.c b/net/netfilter/ipvs/ip_vs_twos.c
index f2579fc9c75b..3308e4cc740a 100644
--- a/net/netfilter/ipvs/ip_vs_twos.c
+++ b/net/netfilter/ipvs/ip_vs_twos.c
@@ -71,8 +71,8 @@ static struct ip_vs_dest *ip_vs_twos_schedule(struct ip_vs_service *svc,
 	 * from 0 to total_weight
 	 */
 	total_weight += 1;
-	rweight1 = prandom_u32_max(total_weight);
-	rweight2 = prandom_u32_max(total_weight);
+	rweight1 = get_random_u32_below(total_weight);
+	rweight2 = get_random_u32_below(total_weight);
 
 	/* Pick two weighted servers */
 	list_for_each_entry_rcu(dest, &svc->destinations, n_list) {
diff --git a/net/netfilter/nf_conntrack_core.c b/net/netfilter/nf_conntrack_core.c
index f97bda06d2a9..8703812405eb 100644
--- a/net/netfilter/nf_conntrack_core.c
+++ b/net/netfilter/nf_conntrack_core.c
@@ -906,7 +906,7 @@ nf_conntrack_hash_check_insert(struct nf_conn *ct)
 					   nf_ct_zone_id(nf_ct_zone(ct), IP_CT_DIR_REPLY));
 	} while (nf_conntrack_double_lock(net, hash, reply_hash, sequence));
 
-	max_chainlen = MIN_CHAINLEN + prandom_u32_max(MAX_CHAINLEN);
+	max_chainlen = MIN_CHAINLEN + get_random_u32_below(MAX_CHAINLEN);
 
 	/* See if there's one in the list already, including reverse */
 	hlist_nulls_for_each_entry(h, n, &nf_conntrack_hash[hash], hnnode) {
@@ -1227,7 +1227,7 @@ __nf_conntrack_confirm(struct sk_buff *skb)
 		goto dying;
 	}
 
-	max_chainlen = MIN_CHAINLEN + prandom_u32_max(MAX_CHAINLEN);
+	max_chainlen = MIN_CHAINLEN + get_random_u32_below(MAX_CHAINLEN);
 	/* See if there's one in the list already, including reverse:
 	   NAT could have grabbed it without realizing, since we're
 	   not in the hash.  If there is, we lost race. */
diff --git a/net/netfilter/nf_nat_helper.c b/net/netfilter/nf_nat_helper.c
index a95a25196943..bf591e6af005 100644
--- a/net/netfilter/nf_nat_helper.c
+++ b/net/netfilter/nf_nat_helper.c
@@ -223,7 +223,7 @@ u16 nf_nat_exp_find_port(struct nf_conntrack_expect *exp, u16 port)
 		if (res != -EBUSY || (--attempts_left < 0))
 			break;
 
-		port = min + prandom_u32_max(range);
+		port = min + get_random_u32_below(range);
 	}
 
 	return 0;
diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index a662e8a5ff84..7a401d94463a 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -835,7 +835,7 @@ static int netlink_autobind(struct socket *sock)
 		/* Bind collision, search negative portid values. */
 		if (rover == -4096)
 			/* rover will be in range [S32_MIN, -4097] */
-			rover = S32_MIN + prandom_u32_max(-4096 - S32_MIN);
+			rover = S32_MIN + get_random_u32_below(-4096 - S32_MIN);
 		else if (rover >= -4096)
 			rover = -4097;
 		portid = rover--;
diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 6ce8dd19f33c..51a47ade92e8 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -1350,7 +1350,7 @@ static bool fanout_flow_is_huge(struct packet_sock *po, struct sk_buff *skb)
 		if (READ_ONCE(history[i]) == rxhash)
 			count++;
 
-	victim = prandom_u32_max(ROLLOVER_HLEN);
+	victim = get_random_u32_below(ROLLOVER_HLEN);
 
 	/* Avoid dirtying the cache line if possible */
 	if (READ_ONCE(history[victim]) != rxhash)
@@ -1386,7 +1386,7 @@ static unsigned int fanout_demux_rnd(struct packet_fanout *f,
 				     struct sk_buff *skb,
 				     unsigned int num)
 {
-	return prandom_u32_max(num);
+	return get_random_u32_below(num);
 }
 
 static unsigned int fanout_demux_rollover(struct packet_fanout *f,
diff --git a/net/sched/act_gact.c b/net/sched/act_gact.c
index 62d682b96b88..be267ffaaba7 100644
--- a/net/sched/act_gact.c
+++ b/net/sched/act_gact.c
@@ -25,7 +25,7 @@ static struct tc_action_ops act_gact_ops;
 static int gact_net_rand(struct tcf_gact *gact)
 {
 	smp_rmb(); /* coupled with smp_wmb() in tcf_gact_init() */
-	if (prandom_u32_max(gact->tcfg_pval))
+	if (get_random_u32_below(gact->tcfg_pval))
 		return gact->tcf_action;
 	return gact->tcfg_paction;
 }
diff --git a/net/sched/act_sample.c b/net/sched/act_sample.c
index 7a25477f5d99..4194480746b0 100644
--- a/net/sched/act_sample.c
+++ b/net/sched/act_sample.c
@@ -168,7 +168,7 @@ static int tcf_sample_act(struct sk_buff *skb, const struct tc_action *a,
 	psample_group = rcu_dereference_bh(s->psample_group);
 
 	/* randomly sample packets according to rate */
-	if (psample_group && (prandom_u32_max(s->rate) == 0)) {
+	if (psample_group && (get_random_u32_below(s->rate) == 0)) {
 		if (!skb_at_tc_ingress(skb)) {
 			md.in_ifindex = skb->skb_iif;
 			md.out_ifindex = skb->dev->ifindex;
diff --git a/net/sched/sch_choke.c b/net/sched/sch_choke.c
index 3ac3e5c80b6f..19c851125901 100644
--- a/net/sched/sch_choke.c
+++ b/net/sched/sch_choke.c
@@ -183,7 +183,7 @@ static struct sk_buff *choke_peek_random(const struct choke_sched_data *q,
 	int retrys = 3;
 
 	do {
-		*pidx = (q->head + prandom_u32_max(choke_len(q))) & q->tab_mask;
+		*pidx = (q->head + get_random_u32_below(choke_len(q))) & q->tab_mask;
 		skb = q->tab[*pidx];
 		if (skb)
 			return skb;
diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
index fb00ac40ecb7..6ef3021e1169 100644
--- a/net/sched/sch_netem.c
+++ b/net/sched/sch_netem.c
@@ -513,8 +513,8 @@ static int netem_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 			goto finish_segs;
 		}
 
-		skb->data[prandom_u32_max(skb_headlen(skb))] ^=
-			1<<prandom_u32_max(8);
+		skb->data[get_random_u32_below(skb_headlen(skb))] ^=
+			1<<get_random_u32_below(8);
 	}
 
 	if (unlikely(sch->q.qlen >= sch->limit)) {
diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index 83628c347744..cfe72085fdc4 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -8319,7 +8319,7 @@ static int sctp_get_port_local(struct sock *sk, union sctp_addr *addr)
 
 		inet_get_local_port_range(net, &low, &high);
 		remaining = (high - low) + 1;
-		rover = prandom_u32_max(remaining) + low;
+		rover = get_random_u32_below(remaining) + low;
 
 		do {
 			rover++;
diff --git a/net/sctp/transport.c b/net/sctp/transport.c
index f8fd98784977..ca1eba95c293 100644
--- a/net/sctp/transport.c
+++ b/net/sctp/transport.c
@@ -199,7 +199,7 @@ void sctp_transport_reset_hb_timer(struct sctp_transport *transport)
 	if ((time_before(transport->hb_timer.expires, expires) ||
 	     !timer_pending(&transport->hb_timer)) &&
 	    !mod_timer(&transport->hb_timer,
-		       expires + prandom_u32_max(transport->rto)))
+		       expires + get_random_u32_below(transport->rto)))
 		sctp_transport_hold(transport);
 }
 
diff --git a/net/sunrpc/cache.c b/net/sunrpc/cache.c
index f075a9fb5ccc..95ff74706104 100644
--- a/net/sunrpc/cache.c
+++ b/net/sunrpc/cache.c
@@ -677,7 +677,7 @@ static void cache_limit_defers(void)
 
 	/* Consider removing either the first or the last */
 	if (cache_defer_cnt > DFR_MAX) {
-		if (prandom_u32_max(2))
+		if (get_random_u32_below(2))
 			discard = list_entry(cache_defer_list.next,
 					     struct cache_deferred_req, recent);
 		else
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 915b9902f673..2e4987dcba29 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -1619,7 +1619,7 @@ static int xs_get_random_port(void)
 	if (max < min)
 		return -EADDRINUSE;
 	range = max - min + 1;
-	rand = prandom_u32_max(range);
+	rand = get_random_u32_below(range);
 	return rand + min;
 }
 
diff --git a/net/tipc/socket.c b/net/tipc/socket.c
index e902b01ea3cb..b35c8701876a 100644
--- a/net/tipc/socket.c
+++ b/net/tipc/socket.c
@@ -3010,7 +3010,7 @@ static int tipc_sk_insert(struct tipc_sock *tsk)
 	struct net *net = sock_net(sk);
 	struct tipc_net *tn = net_generic(net, tipc_net_id);
 	u32 remaining = (TIPC_MAX_PORT - TIPC_MIN_PORT) + 1;
-	u32 portid = prandom_u32_max(remaining) + TIPC_MIN_PORT;
+	u32 portid = get_random_u32_below(remaining) + TIPC_MIN_PORT;
 
 	while (remaining--) {
 		portid++;
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 884eca7f6743..ff38c5a4d174 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -627,7 +627,7 @@ static int __vsock_bind_connectible(struct vsock_sock *vsk,
 
 	if (!port)
 		port = LAST_RESERVED_PORT + 1 +
-			prandom_u32_max(U32_MAX - LAST_RESERVED_PORT);
+			get_random_u32_below(U32_MAX - LAST_RESERVED_PORT);
 
 	vsock_addr_init(&new_addr, addr->svm_cid, addr->svm_port);
 
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 3d2fe7712ac5..40f831854774 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -2072,7 +2072,7 @@ int xfrm_alloc_spi(struct xfrm_state *x, u32 low, u32 high)
 	} else {
 		u32 spi = 0;
 		for (h = 0; h < high-low+1; h++) {
-			spi = low + prandom_u32_max(high - low + 1);
+			spi = low + get_random_u32_below(high - low + 1);
 			x0 = xfrm_state_lookup(net, mark, &x->id.daddr, htonl(spi), x->id.proto, x->props.family);
 			if (x0 == NULL) {
 				newspi = htonl(spi);
-- 
2.38.1

