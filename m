Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9ABC4F1ECD
	for <lists+linux-media@lfdr.de>; Tue,  5 Apr 2022 00:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235172AbiDDVxR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Apr 2022 17:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380608AbiDDVVu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Apr 2022 17:21:50 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E0B23BF2
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 14:19:33 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nbU5i-003VAW-Ug; Mon, 04 Apr 2022 21:18:27 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nbU5f-002E7r-NO; Mon, 04 Apr 2022 21:18:23 +0000
Date:   Mon, 4 Apr 2022 21:18:22 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        mchehab@linuxtv.org
Message-ID: <1276497222.0.1649107102997@builder.linuxtv.org>
Subject: Build failed in Jenkins: media_stage_clang #442
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media_stage_clang
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media_stage_clang/442/display/redirect?page=changes>

Changes:

[torvalds] nfs: remove reliance on bdi congestion

[torvalds] ceph: remove reliance on bdi congestion

[torvalds] remove inode_congested()

[torvalds] remove bdi_congested() and wb_congested() and related functions

[torvalds] f2fs: replace congestion_wait() calls with io_schedule_timeout()

[torvalds] block/bfq-iosched.c: use "false" rather than "BLK_RW_ASYNC"

[torvalds] remove congestion tracking framework

[torvalds] mount: warn only once about timestamp range expiration

[torvalds] mm/memremap: avoid calling kasan_remove_zero_shadow() for device private memory

[torvalds] filemap: remove find_get_pages()

[torvalds] mm/writeback: minor clean up for highmem_dirtyable_memory

[torvalds] mm: fs: fix lru_cache_disabled race in bh_lru

[torvalds] mm: fix invalid page pointer returned with FOLL_PIN gups

[torvalds] mm/gup: follow_pfn_pte(): -EEXIST cleanup

[torvalds] mm/gup: remove unused pin_user_pages_locked()

[torvalds] mm: change lookup_node() to use get_user_pages_fast()

[torvalds] mm/gup: remove unused get_user_pages_locked()

[torvalds] mm/swap: fix confusing comment in folio_mark_accessed

[torvalds] tmpfs: support for file creation time

[torvalds] shmem: mapping_set_exiting() to help mapped resilience

[torvalds] tmpfs: do not allocate pages on read

[torvalds] mm: shmem: use helper macro __ATTR_RW

[torvalds] memcg: replace in_interrupt() with !in_task()

[torvalds] memcg: add per-memcg total kernel memory stat

[torvalds] mm/memcg: mem_cgroup_per_node is already set to 0 on allocation

[torvalds] mm/memcg: retrieve parent memcg from css.parent

[torvalds] memcg: refactor mem_cgroup_oom

[torvalds] memcg: unify force charging conditions

[torvalds] selftests: memcg: test high limit for single entry allocation

[torvalds] memcg: synchronously enforce memory.high for large overcharges

[torvalds] mm/memcontrol: return 1 from cgroup.memory __setup() handler

[torvalds] mm/memcg: revert ("mm/memcg: optimize user context object stock access")

[torvalds] mm/memcg: disable threshold event handlers on PREEMPT_RT

[torvalds] mm/memcg: protect per-CPU counter by disabling preemption on PREEMPT_RT where needed.

[torvalds] mm/memcg: opencode the inner part of obj_cgroup_uncharge_pages() in drain_obj_stock()

[torvalds] mm/memcg: protect memcg_stock with a local_lock_t

[torvalds] mm/memcg: disable migration instead of preemption in drain_all_stock().

[torvalds] mm: list_lru: transpose the array of per-node per-memcg lru lists

[torvalds] mm: introduce kmem_cache_alloc_lru

[torvalds] fs: introduce alloc_inode_sb() to allocate filesystems specific inode

[torvalds] fs: allocate inode by using alloc_inode_sb()

[torvalds] f2fs: allocate inode by using alloc_inode_sb()

[torvalds] mm: dcache: use kmem_cache_alloc_lru() to allocate dentry

[torvalds] xarray: use kmem_cache_alloc_lru to allocate xa_node

[torvalds] mm: memcontrol: move memcg_online_kmem() to mem_cgroup_css_online()

[torvalds] mm: list_lru: allocate list_lru_one only when needed

[torvalds] mm: list_lru: rename memcg_drain_all_list_lrus to memcg_reparent_list_lrus

[torvalds] mm: list_lru: replace linear array with xarray

[torvalds] mm: memcontrol: reuse memory cgroup ID for kmem ID

[torvalds] mm: memcontrol: fix cannot alloc the maximum memcg ID

[torvalds] mm: list_lru: rename list_lru_per_memcg to list_lru_memcg

[torvalds] mm: memcontrol: rename memcg_cache_id to memcg_kmem_id

[torvalds] memcg: enable accounting for tty-related objects

[torvalds] selftests, x86: fix how check_cc.sh is being invoked

[torvalds] mm: merge pte_mkhuge() call into arch_make_huge_pte()

[torvalds] mm: remove mmu_gathers storage from remaining architectures

[torvalds] mm: thp: fix wrong cache flush in remove_migration_pmd()

[torvalds] mm: fix missing cache flush for all tail pages of compound page

[torvalds] mm: hugetlb: fix missing cache flush in copy_huge_page_from_user()

[torvalds] mm: hugetlb: fix missing cache flush in hugetlb_mcopy_atomic_pte()

[torvalds] mm: shmem: fix missing cache flush in shmem_mfill_atomic_pte()

[torvalds] mm: userfaultfd: fix missing cache flush in mcopy_atomic_pte() and __mcopy_atomic()

[torvalds] mm: replace multiple dcache flush with flush_dcache_folio()

[torvalds] mm: don't skip swap entry even if zap_details specified

[torvalds] mm: rename zap_skip_check_mapping() to should_zap_page()

[torvalds] mm: change zap_details.zap_mapping into even_cows

[torvalds] mm: rework swap handling of zap_pte_range

[torvalds] mm/mmap: return 1 from stack_guard_gap __setup() handler

[torvalds] mm/memory.c: use helper function range_in_vma()

[torvalds] mm/memory.c: use helper macro min and max in unmap_mapping_range_tree()

[torvalds] mm: _install_special_mapping() apply VM_LOCKED_CLEAR_MASK

[torvalds] mm/mmap: remove obsolete comment in ksys_mmap_pgoff

[torvalds] mm/mremap:: use vma_lookup() instead of find_vma()

[torvalds] mm/sparse: make mminit_validate_memmodel_limits() static

[torvalds] mm/vmalloc: remove unneeded function forward declaration

[torvalds] mm/vmalloc: Move draining areas out of caller context

[torvalds] mm/vmalloc: add adjust_search_size parameter

[torvalds] mm/vmalloc: eliminate an extra orig_gfp_mask

[torvalds] mm/vmalloc.c: fix "unused function" warning

[torvalds] mm/vmalloc: fix comments about vmap_area struct

[torvalds] mm: page_alloc: avoid merging non-fallbackable pageblocks with others

[torvalds] mm/mmzone.c: use try_cmpxchg() in page_cpupid_xchg_last()

[torvalds] mm/mmzone.h: remove unused macros

[torvalds] mm/page_alloc: don't pass pfn to free_unref_page_commit()

[torvalds] cma: factor out minimum alignment requirement

[torvalds] mm: enforce pageblock_order < MAX_ORDER

[torvalds] mm/page_alloc: mark pagesets as __maybe_unused

[torvalds] mm/pages_alloc.c: don't create ZONE_MOVABLE beyond the end of a node

[torvalds] mm/page_alloc: fetch the correct pcp buddy during bulk free

[torvalds] mm/page_alloc: track range of active PCP lists during bulk free

[torvalds] mm/page_alloc: simplify how many pages are selected per pcp list during bulk free

[torvalds] mm/page_alloc: drain the requested list first during bulk free

[torvalds] mm/page_alloc: free pages in a single pass during bulk free

[torvalds] mm/page_alloc: limit number of high-order pages on PCP during bulk free

[torvalds] mm/page_alloc: do not prefetch buddies during bulk free

[torvalds] arch/x86/mm/numa: Do not initialize nodes twice

[torvalds] mm: count time in drain_all_pages during direct reclaim as memory pressure

[torvalds] mm/page_alloc: call check_new_pages() while zone spinlock is not held

[torvalds] mm/page_alloc: check high-order pages for corruption during PCP operations

[torvalds] mm/memory-failure.c: remove obsolete comment

[torvalds] mm/hwpoison: fix error page recovered but reported "not recovered"

[torvalds] mm: invalidate hwpoison page cache page in fault path

[torvalds] mm/memory-failure.c: minor clean up for memory_failure_dev_pagemap

[torvalds] mm/memory-failure.c: catch unexpected -EFAULT from vma_address()

[torvalds] mm/memory-failure.c: rework the signaling logic in kill_proc

[torvalds] mm/memory-failure.c: fix race with changing page more robustly

[torvalds] mm/memory-failure.c: remove PageSlab check in hwpoison_filter_dev

[torvalds] mm/memory-failure.c: rework the try_to_unmap logic in hwpoison_user_mappings()

[torvalds] mm/memory-failure.c: remove obsolete comment in __soft_offline_page

[torvalds] mm/memory-failure.c: remove unnecessary PageTransTail check

[torvalds] mm/hwpoison-inject: support injecting hwpoison to free page

[torvalds] mm/hwpoison: avoid the impact of hwpoison_filter() return value on mce handler

[torvalds] mm/hwpoison: add in-use hugepage hwpoison filter judgement

[torvalds] mm/memory-failure.c: fix race with changing page compound again

[torvalds] mm/memory-failure.c: avoid calling invalidate_inode_page() with unexpected pages

[torvalds] mm/memory-failure.c: make non-LRU movable pages unhandlable

[torvalds] mm, fault-injection: declare should_fail_alloc_page()

[torvalds] mm/mlock: fix potential imbalanced rlimit ucounts adjustment

[torvalds] mm: hugetlb: free the 2nd vmemmap page associated with each HugeTLB page

[torvalds] mm: hugetlb: replace hugetlb_free_vmemmap_enabled with a static_key

[torvalds] mm: sparsemem: use page table lock to protect kernel pmd operations

[torvalds] selftests: vm: add a hugetlb test case

[torvalds] mm: sparsemem: move vmemmap related to HugeTLB to CONFIG_HUGETLB_PAGE_FREE_VMEMMAP

[torvalds] mm/hugetlb: generalize ARCH_WANT_GENERAL_HUGETLB

[torvalds] hugetlb: clean up potential spectre issue warnings

[torvalds] mm/hugetlb: use helper macro __ATTR_RW

[torvalds] mm/hugetlb.c: export PageHeadHuge()

[torvalds] mm: remove unneeded local variable follflags

[torvalds] userfaultfd: provide unmasked address on page-fault

[torvalds] userfaultfd/selftests: fix uninitialized_var.cocci warning

[torvalds] mm/fs: delete PF_SWAPWRITE

[torvalds] mm: __isolate_lru_page_prepare() in isolate_migratepages_block()

[torvalds] mm/list_lru: optimize memcg_reparent_list_lru_node()

[torvalds] mm: lru_cache_disable: replace work queue synchronization with synchronize_rcu

[torvalds] mm: workingset: replace IRQ-off check with a lockdep assert.

[torvalds] mm: vmscan: fix documentation for page_check_references()

[torvalds] mm: compaction: cleanup the compaction trace events

[torvalds] mempolicy: mbind_range() set_policy() after vma_merge()

[torvalds] mm/oom_kill: remove unneeded is_memcg_oom check

[torvalds] mm,migrate: fix establishing demotion target

[torvalds] mm/migrate: fix race between lock page and clear PG_Isolated

[torvalds] mm/thp: refix __split_huge_pmd_locked() for migration PMD

[torvalds] mm/cma: provide option to opt out from exposing pages on activation failure

[torvalds] powerpc/fadump: opt out from freeing pages on cma activation failure

[torvalds] NUMA Balancing: add page promotion counter

[torvalds] NUMA balancing: optimize page placement for memory tiering system

[torvalds] memory tiering: skip to scan fast memory

[torvalds] mm: page_io: fix psi memory pressure error on cold swapins

[torvalds] mm/vmstat: add event for ksm swapping in copy

[torvalds] mm/ksm: use helper macro __ATTR_RW

[torvalds] mm/hwpoison: check the subpage, not the head page

[torvalds] mm/madvise: use vma_lookup() instead of find_vma()

[torvalds] mm: madvise: return correct bytes advised with process_madvise

[torvalds] mm: madvise: skip unmapped vma holes passed to process_madvise

[torvalds] mm, memory_hotplug: make arch_alloc_nodedata independent on CONFIG_MEMORY_HOTPLUG

[torvalds] mm: handle uninitialized numa nodes gracefully

[torvalds] mm, memory_hotplug: drop arch_free_nodedata

[torvalds] mm, memory_hotplug: reorganize new pgdat initialization

[torvalds] mm: make free_area_init_node aware of memory less nodes

[torvalds] memcg: do not tweak node in alloc_mem_cgroup_per_node_info

[torvalds] drivers/base/memory: add memory block to memory group after registration succeeded

[torvalds] drivers/base/node: consolidate node device subsystem initialization in node_dev_init()

[torvalds] mm/memory_hotplug: remove obsolete comment of __add_pages

[torvalds] mm/memory_hotplug: avoid calling zone_intersects() for ZONE_NORMAL

[torvalds] mm/memory_hotplug: clean up try_offline_node

[torvalds] mm/memory_hotplug: fix misplaced comment in offline_pages

[torvalds] drivers/base/node: rename link_mem_sections() to register_memory_block_under_node()

[torvalds] drivers/base/memory: determine and store zone for single-zone memory blocks

[torvalds] drivers/base/memory: clarify adding and removing of memory blocks

[torvalds] mm: only re-generate demotion targets when a numa node changes its N_CPU state

[torvalds] mm/thp: ClearPageDoubleMap in first page_add_file_rmap()

[torvalds] mm/zswap.c: allow handling just same-value filled pages

[torvalds] mm: remove usercopy_warn()

[torvalds] mm: uninline copy_overflow()

[torvalds] mm/usercopy: return 1 from hardened_usercopy __setup() handler

[torvalds] mm/early_ioremap: declare early_memremap_pgprot_adjust()

[torvalds] highmem: document kunmap_local()

[torvalds] mm/highmem: remove unnecessary done label

[torvalds] mm/page_table_check.c: use strtobool for param parsing

[torvalds] mm/kfence: remove unnecessary CONFIG_KFENCE option

[torvalds] kfence: allow re-enabling KFENCE after system startup

[torvalds] kfence: alloc kfence_pool after system startup

[torvalds] kunit: fix UAF when run kfence test case test_gfpzero

[torvalds] kunit: make kunit_test_timeout compatible with comment

[torvalds] kfence: test: try to avoid test_gfpzero trigger rcu_stall

[torvalds] kfence: allow use of a deferrable timer

[torvalds] mm/hmm.c: remove unneeded local variable ret

[torvalds] mm/damon/dbgfs/init_regions: use target index instead of target id

[torvalds] Docs/admin-guide/mm/damon/usage: update for changed initail_regions file input

[torvalds] mm/damon/core: move damon_set_targets() into dbgfs

[torvalds] mm/damon: remove the target id concept

[torvalds] mm/damon: remove redundant page validation

[torvalds] mm/damon: rename damon_primitives to damon_operations

[torvalds] mm/damon: let monitoring operations can be registered and selected

[torvalds] mm/damon/paddr,vaddr: register themselves to DAMON in subsys_initcall

[torvalds] mm/damon/reclaim: use damon_select_ops() instead of damon_{v,p}a_set_operations()

[torvalds] mm/damon/dbgfs: use damon_select_ops() instead of damon_{v,p}a_set_operations()

[torvalds] mm/damon/dbgfs: use operations id for knowing if the target has pid

[torvalds] mm/damon/dbgfs-test: fix is_target_id() change

[torvalds] mm/damon/paddr,vaddr: remove damon_{p,v}a_{target_valid,set_operations}()

[torvalds] mm/damon: remove unnecessary CONFIG_DAMON option

[torvalds] Docs/vm/damon: call low level monitoring primitives the operations

[torvalds] Docs/vm/damon/design: update DAMON-Idle Page Tracking interference handling

[torvalds] Docs/damon: update outdated term 'regions update interval'

[torvalds] mm/damon/core: allow non-exclusive DAMON start/stop

[torvalds] mm/damon/core: add number of each enum type values

[torvalds] mm/damon: implement a minimal stub for sysfs-based DAMON interface

[torvalds] mm/damon/sysfs: link DAMON for virtual address spaces monitoring

[torvalds] mm/damon/sysfs: support the physical address space monitoring

[torvalds] mm/damon/sysfs: support DAMON-based Operation Schemes

[torvalds] mm/damon/sysfs: support DAMOS quotas

[torvalds] mm/damon/sysfs: support schemes prioritization

[torvalds] mm/damon/sysfs: support DAMOS watermarks

[torvalds] mm/damon/sysfs: support DAMOS stats

[torvalds] selftests/damon: add a test for DAMON sysfs interface

[torvalds] Docs/admin-guide/mm/damon/usage: document DAMON sysfs interface

[torvalds] Docs/ABI/testing: add DAMON sysfs interface ABI document

[torvalds] mm/damon/sysfs: remove repeat container_of() in damon_sysfs_kdamond_release()

[kuba] iwlwifi: mvm: Don't fail if PPAG isn't supported

[kuba] net/mlx5e: Fix build warning, detected write beyond size of field

[axboe] crypto: fix crc64 testmgr digest byte order

[axboe] block: avoid calling blkg_free() in atomic context

[kuba] net: dsa: fix missing host-filtered multicast addresses

[kuba] net: geneve: add missing netlink policy and size for IFLA_GENEVE_INNER_PROTO_INHERIT

[hch] nvme: fix the read-only state for zoned namespaces with unsupposed features

[hch] nvme-pci: expose use_threaded_interrupts read-only in sysfs

[hch] nvme-pci: add quirks for Samsung X5 SSDs

[arnd] ARM: configs: multi_v5: Enable Allwinner F1C100

[broonie] ASoC: rockchip: i2s_tdm: Fixup config for SND_SOC_DAIFMT_DSP_A/B

[axboe] io_uring: bump poll refs to full 31-bits

[axboe] io_uring: fix assuming triggered poll waitqueue is the single poll

[axboe] io_uring: don't recycle provided buffer if punted to async worker

[pmladek] livepatch: Reorder to use before freeing a pointer

[lee.jones] mfd: atmel-flexcom: Fix compilation warning

[lee.jones] dt-bindings: Add compatibles for undocumented trivial syscons

[lee.jones] dt-bindings: mfd: brcm,cru: Rename pinctrl node

[lee.jones] mfd: intel-lpss: Provide an SSP type to the driver

[lee.jones] MAINTAINERS: Rectify entry for ROHM MULTIFUNCTION BD9571MWV-M PMIC DEVICE DRIVERS

[lee.jones] mfd: asic3: Add missing iounmap() on error asic3_mfd_probe

[lee.jones] mfd: arizona-spi: Split Windows ACPI init code into its own function

[lee.jones] mfd: arizona-spi: Add Android board ACPI table handling

[lee.jones] mfd: db8500-prcmu: Remove unused inline function

[lee.jones] mfd: Use platform_get_irq() to get the interrupt

[lee.jones] mfd: bd9576: fix typos in comments

[rostedt] tracing: Have trace event string test handle zero length strings

[lee.jones] dt-bindings: mfd: syscon: Add microchip,lan966x-cpu-syscon compatible

[axboe] fs: do not pass __GFP_HIGHMEM to bio_alloc in do_mpage_readpage

[agruenba] gfs2: Fix should_fault_in_pages() logic

[agruenba] gfs2: Disable page faults during lockless buffered reads

[agruenba] gfs2: Minor retry logic cleanup

[ebiederm] ptrace: Remove duplicated include in ptrace.c

[ebiederm] mm/mlock: fix two bugs in user_shm_lock()

[torvalds] cacheflush.h: Add forward declaration for struct folio

[kuba] drivers: net: xgene: Fix regression in CRC stripping

[kuba] net: marvell: prestera: add missing destroy_workqueue() in prestera_module_init()

[kuba] net: bridge: mst: Restrict info size queries to bridge ports

[kuba] net/sched: fix incorrect vlan_push_eth dest field

[kuba] ice: fix 'scheduling while atomic' on aux critical err interrupt

[kuba] ice: don't allow to run ice_send_event_to_aux() in atomic ctx

[kuba] drivers: ethernet: cpsw: fix panic when interrupt coaleceing is set via ethtool

[kuba] llc: fix netdevice reference leaks in llc_ui_bind()

[trond.myklebust] SUNRPC: avoid race between mod_timer() and del_timer_sync()

[alexandre.belloni] dt-bindings: rtc: at91: rename rtt bindings file

[alexandre.belloni] rtc: mc146818-lib: fix locking in mc146818_set_time

[alexandre.belloni] rtc: pl031: fix rtc features null pointer dereference

[alexandre.belloni] rtc: sun6i: Fix time overflow handling

[alexandre.belloni] rtc: sun6i: Add support for linear day storage

[alexandre.belloni] rtc: sun6i: Add support for broken-down alarm registers

[alexandre.belloni] rtc: sun6i: Add Allwinner H616 support

[alexandre.belloni] rtc: wm8350: Handle error for wm8350_register_irq

[alexandre.belloni] clk: sunxi-ng: mux: Allow muxes to have keys

[alexandre.belloni] clk: sunxi-ng: Add support for the sun6i RTC clocks

[alexandre.belloni] clk: sunxi-ng: sun6i-rtc: Add support for H6

[alexandre.belloni] rtc: ds1685: switch to RTC_FEATURE_UPDATE_INTERRUPT

[alexandre.belloni] rtc: ds1685: drop no_irq

[alexandre.belloni] rtc: ds1307: switch to RTC_FEATURE_UPDATE_INTERRUPT

[alexandre.belloni] rtc: mpc5121: let the core handle the alarm resolution

[alexandre.belloni] rtc: mpc5121: switch to RTC_FEATURE_UPDATE_INTERRUPT

[alexandre.belloni] rtc: m41t80: switch to RTC_FEATURE_UPDATE_INTERRUPT

[alexandre.belloni] rtc: opal: switch to RTC_FEATURE_UPDATE_INTERRUPT

[alexandre.belloni] rtc: pcf2123: switch to RTC_FEATURE_UPDATE_INTERRUPT

[alexandre.belloni] rtc: pcf2123: set RTC_FEATURE_ALARM_RES_MINUTE

[alexandre.belloni] rtc: pcf2127: switch to RTC_FEATURE_UPDATE_INTERRUPT

[alexandre.belloni] rtc: pcf2127: set RTC_FEATURE_ALARM_RES_2S

[alexandre.belloni] rtc: pcf85063: switch to RTC_FEATURE_UPDATE_INTERRUPT

[alexandre.belloni] rtc: pcf85063: set RTC_FEATURE_ALARM_RES_2S

[alexandre.belloni] rtc: pcf8523: switch to RTC_FEATURE_UPDATE_INTERRUPT

[alexandre.belloni] rtc: pcf8523: let the core handle the alarm resolution

[alexandre.belloni] rtc: pcf8563: let the core handle the alarm resolution

[alexandre.belloni] rtc: pcf8563: switch to RTC_FEATURE_UPDATE_INTERRUPT

[alexandre.belloni] rtc: spear: switch to devm_rtc_allocate_device

[alexandre.belloni] rtc: spear: set range

[alexandre.belloni] rtc: spear: drop uie_unsupported

[alexandre.belloni] rtc: spear: fix spear_rtc_read_time

[alexandre.belloni] rtc: add new RTC_FEATURE_ALARM_WAKEUP_ONLY feature

[alexandre.belloni] rtc: efi: switch to devm_rtc_allocate_device

[alexandre.belloni] rtc: efi: switch to RTC_FEATURE_UPDATE_INTERRUPT

[alexandre.belloni] rtc: hym8563: switch to devm_rtc_allocate_device

[alexandre.belloni] rtc: hym8563: let the core handle the alarm resolution

[alexandre.belloni] rtc: hym8563: switch to RTC_FEATURE_UPDATE_INTERRUPT

[alexandre.belloni] rtc: xgene: stop using uie_unsupported

[alexandre.belloni] rtc: remove uie_unsupported

[dan.j.williams] drivers/nvdimm: Fix build failure when CONFIG_PERF_EVENTS is not set

[dan.j.williams] powerpc/papr_scm: Fix build failure when

[dan.j.williams] MAINTAINERS: remove section LIBNVDIMM BLK: MMIO-APERTURE DRIVER

[stfrench] cifs: convert the path to utf16 in smb2_query_info_compound

[stfrench] cifs: change smb2_query_info_compound to use a cached fid, if available

[stfrench] cifs: fix bad fids sent over wire

[stfrench] ksmbd: store fids as opaque u64 integers

[stfrench] cifs: fix incorrect use of list iterator after the loop

[tglx] x86/fpu/xstate: Fix the ARCH_REQ_XCOMP_PERM implementation

[tglx] selftests/x86/amx: Update the ARCH_REQ_XCOMP_PERM test

[axboe] io_uring: ensure recv and recvmsg handle MSG_WAITALL correctly

[axboe] io_uring: add flag for disabling provided buffer recycling

[robh] dt-bindings: nvmem: add U-Boot environment variables binding

[robh] dt-bindings: kbuild: Make DT_SCHEMA_LINT a recursive variable

[dan.j.williams] nvdimm/blk: Fix title level

[torvalds] proc: alloc PATH_MAX bytes for /proc/${pid}/fd/ symlinks

[torvalds] proc/vmcore: fix possible deadlock on concurrent mmap and read

[torvalds] proc/vmcore: fix vmcore_alloc_buf() kernel-doc comment

[torvalds] linux/types.h: remove unnecessary __bitwise__

[torvalds] Documentation/sparse: add hints about __CHECKER__

[torvalds] kernel/ksysfs.c: use helper macro __ATTR_RW

[torvalds] Kconfig.debug: make DEBUG_INFO selectable from a choice

[torvalds] include: drop pointless __compiler_offsetof indirection

[torvalds] ilog2: force inlining of __ilog2_u32() and __ilog2_u64()

[torvalds] bitfield: add explicit inclusions to the example

[torvalds] lib/Kconfig.debug: add ARCH dependency for FUNCTION_ALIGN option

[torvalds] lib: bitmap: fix many kernel-doc warnings

[torvalds] checkpatch: prefer MODULE_LICENSE("GPL") over MODULE_LICENSE("GPL v2")

[torvalds] checkpatch: add --fix option for some TRAILING_STATEMENTS

[torvalds] checkpatch: add early_param exception to blank line after struct/function test

[torvalds] checkpatch: use python3 to find codespell dictionary

[torvalds] init: use ktime_us_delta() to make initcall_debug log more precise

[torvalds] init.h: improve __setup and early_param documentation

[torvalds] init/main.c: return 1 from handled __setup() functions

[torvalds] fs/pipe: use kvcalloc to allocate a pipe_buffer array

[torvalds] fs/pipe.c: local vars have to match types of proper pipe_inode_info fields

[torvalds] minix: fix bug when opening a file with O_DIRECT

[torvalds] fat: use pointer to simple type in put_user()

[torvalds] cgroup: use irqsave in cgroup_rstat_flush_locked().

[torvalds] kexec: make crashk_res, crashk_low_res and crash_notes symbols always visible

[torvalds] riscv: mm: init: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of #ifdef

[torvalds] x86/setup: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of #ifdef

[torvalds] arm64: mm: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of #ifdef

[torvalds] docs: kdump: update description about sysfs file system support

[torvalds] docs: kdump: add scp example to write out the dump file

[torvalds] panic: unset panic_on_warn inside panic()

[torvalds] ubsan: no need to unset panic_on_warn in ubsan_epilogue()

[torvalds] kasan: no need to unset panic_on_warn in end_report()

[torvalds] taskstats: remove unneeded dead assignment

[torvalds] docs: sysctl/kernel: add missing bit to panic_print

[torvalds] panic: add option to dump all CPUs backtraces in panic_print

[torvalds] panic: move panic_print before kmsg dumpers

[torvalds] kcov: split ioctl handling into locked and unlocked parts

[torvalds] kcov: properly handle subsequent mmap calls

[torvalds] kernel/resource: fix kfree() of bootmem memory again

[torvalds] Revert "ubsan, kcsan: Don't combine sanitizer with kcov on clang"

[mingo] x86/defconfig: Enable WERROR

[tsbogend] MIPS: Fix build error for loongson64 and sgi-ip27

[jani.nikula] drm/edid: check basic audio support on CEA extension block

[jani.nikula] drm/edid: fix CEA extension byte #3 parsing

[axboe] io_uring: remove IORING_CQE_F_MSG

[tiwai] ALSA: hda/realtek: Add mute and micmut LED support for Zbook Fury 17 G9

[fw] netfilter: egress: Report interface as outgoing

[pablo] netfilter: nf_conntrack_tcp: preserve liberal flag in tcp options

[trond.myklebust] NFS: replace usage of found with dedicated list iterator variable

[trond.myklebust] SUNRPC don't resend a task on an offlined transport

[trond.myklebust] NFSv4.1: don't retry BIND_CONN_TO_SESSION on session error

[daniel.thompson] kdb: Fix the putarea helper function

[arnd] dt: amd-seattle: remove Husky platform

[arnd] dt: amd-seattle: remove Overdrive revision A0 support

[arnd] dt: amd-seattle: upgrade AMD Seattle XGBE to new SMMU binding

[arnd] dt: amd-seattle: fix PCIe legacy interrupt routing

[arnd] dt: amd-seattle: add a description of the PCIe SMMU

[arnd] dt: amd-seattle: add description of the SATA/CCP SMMUs

[arnd] dt: amd-seattle: disable IPMI controller and some GPIO blocks on B0

[arnd] dt: amd-seattle: add a description of the CPUs and caches

[linus.walleij] pinctrl: mediatek: mt8186: Account for probe refactoring

[linus.walleij] pinctrl: nuvoton: Fix sparse warning

[linus.walleij] pinctrl: nuvoton: wpcm450: select GENERIC_PINCTRL_GROUPS

[linus.walleij] pinctrl: nuvoton: wpcm450: off by one in wpcm450_gpio_register()

[linus.walleij] pinctrl: nuvoton: Fix return value check in wpcm450_gpio_register()

[linus.walleij] pinctrl: ingenic: Fix regmap on X series SoCs

[linus.walleij] dt-bindings: pinctrl: rt2880: add missing pin groups and functions

[acme] tools arch x86: Sync the msr-index.h copy with the kernel sources

[acme] perf stat: Fix forked applications enablement of counters

[acme] tools headers cpufeatures: Sync with the kernel sources

[acme] tools headers cpufeatures: Sync with the kernel sources

[axboe] io_uring: fix async accept on O_NONBLOCK sockets

[linus.walleij] dt-bindings: pinctrl: aspeed: Update gfx node in example

[linus.walleij] pinctrl: qcom-pmic-gpio: Add support for pm8450

[agruenba] gfs2: Fix gfs2_file_buffered_write endless loop workaround

[agruenba] gfs2: Remove dead code in gfs2_file_read_iter

[agruenba] gfs2: Make sure not to return short direct writes

[keescook] usercopy: Disable CONFIG_HARDENED_USERCOPY_PAGESPAN

[axboe] io_uring: improve task work cache utilization

[airlied] fbdev: Fix sys_imageblit() for arbitrary image widths

[airlied] fbdev: Fix cfb_imageblit() for arbitrary image widths

[kuba] net: stmmac: dwmac-qcom-ethqos: Enable RGMII functional clock on resume

[sboyd] dt-bindings: clock: fix dt_binding_check error for qcom,gcc-other.yaml

[kuba] net: dsa: realtek: make interface drivers depend on OF

[sboyd] clk: qcom: gcc-msm8994: Fix gpll4 width

[kuba] net: usb: ax88179_178a: add Allied Telesis AT-UMCs

[kuba] vsock/virtio: initialize vdev->priv before using VQs

[kuba] vsock/virtio: read the negotiated features before using VQs

[kuba] vsock/virtio: enable VQs early on probe

[torvalds] tools/vm/page_owner_sort.c: sort by stacktrace before culling

[torvalds] tools/vm/page_owner_sort.c: support sorting by stack trace

[torvalds] tools/vm/page_owner_sort.c: add switch between culling by stacktrace and txt

[torvalds] tools/vm/page_owner_sort.c: support sorting pid and time

[torvalds] tools/vm/page_owner_sort.c: two trivial fixes

[torvalds] tools/vm/page_owner_sort.c: delete invalid duplicate code

[torvalds] Documentation/vm/page_owner.rst: update the documentation

[torvalds] Documentation/vm/page_owner.rst: fix unexpected indentation warns

[torvalds] lib/vsprintf: avoid redundant work with 0 size

[torvalds] mm/page_owner: use scnprintf() to avoid excessive buffer overrun check

[torvalds] mm/page_owner: print memcg information

[torvalds] mm/page_owner: record task command name

[torvalds] mm/page_owner.c: record tgid

[torvalds] tools/vm/page_owner_sort.c: fix the instructions for use

[torvalds] tools/vm/page_owner_sort.c: fix comments

[torvalds] tools/vm/page_owner_sort.c: add a security check

[torvalds] tools/vm/page_owner_sort.c: support sorting by tgid and update documentation

[torvalds] tools/vm/page_owner_sort: fix three trivival places

[torvalds] tools/vm/page_owner_sort: support for sorting by task command name

[torvalds] tools/vm/page_owner_sort.c: support for selecting by PID, TGID or task command name

[torvalds] tools/vm/page_owner_sort.c: support for user-defined culling rules

[torvalds] mm: unexport page_init_poison

[torvalds] selftest/vm: add util.h and and move helper functions there

[torvalds] selftest/vm: add helpers to detect PAGE_SIZE and PAGE_SHIFT

[torvalds] mm: delete __ClearPageWaiters()

[torvalds] mm: filemap_unaccount_folio() large skip mapcount fixup

[torvalds] mm/thp: fix NR_FILE_MAPPED accounting in page_*_file_rmap()

[torvalds] mm/migration: add trace events for THP migrations

[torvalds] mm/migration: add trace events for base page and HugeTLB migrations

[torvalds] kasan, page_alloc: deduplicate should_skip_kasan_poison

[torvalds] kasan, page_alloc: move tag_clear_highpage out of kernel_init_free_pages

[torvalds] kasan, page_alloc: merge kasan_free_pages into free_pages_prepare

[torvalds] kasan, page_alloc: simplify kasan_poison_pages call site

[torvalds] kasan, page_alloc: init memory of skipped pages on free

[torvalds] kasan: drop skip_kasan_poison variable in free_pages_prepare

[torvalds] mm: clarify __GFP_ZEROTAGS comment

[torvalds] kasan: only apply __GFP_ZEROTAGS when memory is zeroed

[torvalds] kasan, page_alloc: refactor init checks in post_alloc_hook

[torvalds] kasan, page_alloc: merge kasan_alloc_pages into post_alloc_hook

[torvalds] kasan, page_alloc: combine tag_clear_highpage calls in post_alloc_hook

[torvalds] kasan, page_alloc: move SetPageSkipKASanPoison in post_alloc_hook

[torvalds] kasan, page_alloc: move kernel_init_free_pages in post_alloc_hook

[torvalds] kasan, page_alloc: rework kasan_unpoison_pages call site

[torvalds] kasan: clean up metadata byte definitions

[torvalds] kasan: define KASAN_VMALLOC_INVALID for SW_TAGS

[torvalds] kasan, x86, arm64, s390: rename functions for modules shadow

[torvalds] kasan, vmalloc: drop outdated VM_KASAN comment

[torvalds] kasan: reorder vmalloc hooks

[torvalds] kasan: add wrappers for vmalloc hooks

[torvalds] kasan, vmalloc: reset tags in vmalloc functions

[torvalds] kasan, fork: reset pointer tags of vmapped stacks

[torvalds] kasan, arm64: reset pointer tags of vmapped stacks

[torvalds] kasan, vmalloc: add vmalloc tagging for SW_TAGS

[torvalds] kasan, vmalloc, arm64: mark vmalloc mappings as pgprot_tagged

[torvalds] kasan, vmalloc: unpoison VM_ALLOC pages after mapping

[torvalds] kasan, mm: only define ___GFP_SKIP_KASAN_POISON with HW_TAGS

[torvalds] kasan, page_alloc: allow skipping unpoisoning for HW_TAGS

[torvalds] kasan, page_alloc: allow skipping memory init for HW_TAGS

[torvalds] kasan, vmalloc: add vmalloc tagging for HW_TAGS

[torvalds] kasan, vmalloc: only tag normal vmalloc allocations

[torvalds] kasan, arm64: don't tag executable vmalloc allocations

[torvalds] kasan: mark kasan_arg_stacktrace as __initdata

[torvalds] kasan: clean up feature flags for HW_TAGS mode

[torvalds] kasan: add kasan.vmalloc command line flag

[torvalds] kasan: allow enabling KASAN_VMALLOC and SW/HW_TAGS

[torvalds] arm64: select KASAN_VMALLOC for SW/HW_TAGS modes

[torvalds] kasan: documentation updates

[torvalds] kasan: improve vmalloc tests

[torvalds] kasan: test: support async (again) and asymm modes for HW_TAGS

[torvalds] mm/kasan: remove unnecessary CONFIG_KASAN option

[torvalds] kasan: update function name in comments

[torvalds] kasan: print virtual mapping info in reports

[torvalds] kasan: drop addr check from describe_object_addr

[torvalds] kasan: more line breaks in reports

[torvalds] kasan: rearrange stack frame info in reports

[torvalds] kasan: improve stack frame info in reports

[torvalds] kasan: print basic stack frame info for SW_TAGS

[torvalds] kasan: simplify async check in end_report()

[torvalds] kasan: simplify kasan_update_kunit_status() and call sites

[torvalds] kasan: check CONFIG_KASAN_KUNIT_TEST instead of CONFIG_KUNIT

[torvalds] kasan: move update_kunit_status to start_report

[torvalds] kasan: move disable_trace_on_warning to start_report

[torvalds] kasan: split out print_report from __kasan_report

[torvalds] kasan: simplify kasan_find_first_bad_addr call sites

[torvalds] kasan: restructure kasan_report

[torvalds] kasan: merge __kasan_report into kasan_report

[torvalds] kasan: call print_report from kasan_report_invalid_free

[torvalds] kasan: move and simplify kasan_report_async

[torvalds] kasan: rename kasan_access_info to kasan_report_info

[torvalds] kasan: add comment about UACCESS regions to kasan_report

[torvalds] kasan: respect KASAN_BIT_REPORTED in all reporting routines

[torvalds] kasan: reorder reporting functions

[torvalds] kasan: move and hide kasan_save_enable/restore_multi_shot

[torvalds] kasan: disable LOCKDEP when printing reports

[torvalds] mm: enable MADV_DONTNEED for hugetlb mappings

[torvalds] selftests/vm: add hugetlb madvise MADV_DONTNEED MADV_REMOVE test

[torvalds] userfaultfd/selftests: enable hugetlb remap and remove event testing

[torvalds] mm/huge_memory: make is_transparent_hugepage() static

[torvalds] mm: optimize do_wp_page() for exclusive pages in the swapcache

[torvalds] mm: optimize do_wp_page() for fresh pages in local LRU pagevecs

[torvalds] mm: slightly clarify KSM logic in do_swap_page()

[torvalds] mm: streamline COW logic in do_swap_page()

[torvalds] mm/huge_memory: streamline COW logic in do_huge_pmd_wp_page()

[torvalds] mm/khugepaged: remove reuse_swap_page() usage

[torvalds] mm/swapfile: remove stale reuse_swap_page()

[torvalds] mm/huge_memory: remove stale page_trans_huge_mapcount()

[torvalds] mm/huge_memory: remove stale locking logic from __split_huge_pmd()

[torvalds] mm: warn on deleting redirtied only if accounted

[torvalds] mm: unmap_mapping_range_tree() with i_mmap_rwsem shared

[torvalds] mm: generalize ARCH_HAS_FILTER_PGPROT

[torvalds] mm: fix race between MADV_FREE reclaim and blkdev direct IO read

[torvalds] mm: madvise: MADV_DONTNEED_LOCKED

[torvalds] selftests: kselftest framework: provide "finished" helper

[sboyd] dt-bindings: clock: renesas: Make example 'clocks' parsable

[sboyd] dt-bindings: clock: drop useless consumer example

[herbert] crypto: arm/aes-neonbs-cbc - Select generic cbc and aes

[herbert] crypto: stm32 - fix reference leak in stm32_crc_remove

[herbert] crypto: x86/chacha20 - Avoid spurious jumps to other functions

[herbert] crypto: x86/poly1305 - Fixup SLS

[alexandre.belloni] clk: sunxi-ng: sun6i-rtc: include clk/sunxi-ng.h

[alexandre.belloni] rtc: pm8xxx: Attach wake irq to device

[alexandre.belloni] rtc: pm8xxx: Return -ENODEV if set_time disallowed

[alexandre.belloni] rtc: optee: add RTC driver for OP-TEE RTC PTA

[axboe] io_uring: enable EPOLLEXCLUSIVE for accept poll

[axboe] io_uring: improve req fields comments

[axboe] io_uring: fix invalid flags for io_put_kbuf()

[axboe] io_uring: fix put_kbuf without proper locking

[agruenba] fs/iomap: Fix buffered write page prefaulting

[Jason] random: skip fast_init if hwrng provides large chunk of entropy

[Jason] random: treat bootloader trust toggle the same way as cpu trust toggle

[Jason] random: re-add removed comment about get_random_{u32,u64} reseeding

[Jason] virt: vmgenid: recognize new CID added by Hyper-V

[stfrench] [smb3] move more common protocol header definitions to smbfs_common

[broonie] ASoC: SOF: Intel: Fix build error without SND_SOC_SOF_PCI_DEV

[broonie] regulator: rt4831: Add bypass mask to fix set_bypass API work

[broonie] regulator: rt4831: Add active_discharge_on to fix discharge API

[rafael.j.wysocki] ACPI: IPMI: replace usage of found with dedicated list iterator variable

[rafael.j.wysocki] ACPI: tables: Make LAPIC_ADDR_OVR address readable in message

[rafael.j.wysocki] ACPI: CPPC: Avoid out of bounds access when parsing _CPC data

[rafael.j.wysocki] ACPI: CPPC: Change default error code and clean up debug messages in probe

[trond.myklebust] SUNRPC: Do not dereference non-socket transports in sysfs

[trond.myklebust] SUNRPC: Don't return error values in sysfs read of closed files

[rafael.j.wysocki] Documentation: amd-pstate: grammar and sentence structure updates

[acme] perf lock: Add --synth=no option for record

[acme] perf lock: Extend struct lock_key to have print function

[acme] perf lock: Add -F/--field option to control output

[sboyd] clk: Initialize orphan req_rate

[boris.ostrovsky] xen: don't hang when resuming PCI device

[boris.ostrovsky] xen: fix is_xen_pmu()

[corbet] Documentation: Fix duplicate statement about raw_spinlock_t type

[linus.walleij] pinctrl: nuvoton: wpcm450: Fix build error without OF

[axboe] io_uring: fix memory leak of uid in files registration

[kuba] net: enetc: report software timestamping via SO_TIMESTAMPING

[kuba] net: sparx5: Remove unused GLAG handling in PGID

[kuba] net: sparx5: Refactor mdb handling according to feedback

[kuba] net: hns3: fix bug when PF set the duplicate MAC address for VFs

[kuba] net: hns3: fix port base vlan add fail when concurrent with reset

[kuba] net: hns3: add vlan list lock to protect vlan list

[kuba] net: hns3: refine the process when PF set VF VLAN

[sboyd] clk: test: Test clk_set_rate_range on orphan mux

[kuba] llc: only change llc->dev when bind() succeeds

[sboyd] clk: Drop the rate range on clk_put()

[kuba] net: phy: broadcom: Fix brcm_fet_config_init()

[kuba] selftests: test_vxlan_under_vrf: Fix broken test case

[trond.myklebust] NFS: Don't loop forever in nfs_do_recoalesce()

[acme] tools arm64: Import cputype.h

[acme] libperf tests: Fix typo in perf_evlist__open() failure error messages

[acme] perf tools: Enhance the matching of sub-commands abbreviations

[acme] perf python: Add perf_env stubs that will be needed in evsel__open_strerror()

[acme] perf evsel: Improve AMD IBS (Instruction-Based Sampling) error handling messages

[davem] net: hns3: fix ethtool tx copybreak buf size indicating not aligned issue

[davem] net: hns3: add max order judgement for tx spare buffer

[davem] net: hns3: clean residual vf config after disable sriov

[davem] net: hns3: add netdev reset check for hns3_set_tunable()

[davem] net: hns3: add NULL pointer check for hns3_set/get_ringparam()

[davem] net: hns3: fix phy can not link up when autoneg off and reset

[torvalds] Revert "swiotlb: rework "fix info leak with DMA_FROM_DEVICE""

[davem] net: sparx5: depends on PTP_1588_CLOCK_OPTIONAL

[davem] qlcnic: dcb: default to returning -EOPNOTSUPP

[davem] net/x25: Fix null-ptr-deref caused by x25_disconnect

[davem] net: sparx5: switchdev: fix possible NULL pointer dereference

[davem] octeontx2-af: initialize action variable

[davem] selftests: tls: skip cmsg_to_pipe tests with TLS=n

[davem] net/smc: fix a memory leak in smc_sysctl_net_exit()

[davem] net/sched: act_ct: fix ref leak when switching zones

[stfrench] smb3: move defines for ioctl protocol header and SMB2 sizes to smbfs_common

[stfrench] smb3: move defines for query info and query fsinfo to smbfs_common

[tiwai] ALSA: hda/realtek: Enable headset mic on Lenovo P360

[tiwai] ALSA: cs4236: fix an incorrect NULL check on list iterator

[linus.walleij] pinctrl: mediatek: common-v1: fix semicolon.cocci warnings

[wim] watchdog: imx2_wdg: Alow ping on suspend

[wim] watchdog: rti-wdt: Add missing pm_runtime_disable() in probe function

[wim] watchdog: aspeed: add nowayout support

[wim] watchdog: Improve watchdog_dev function documentation

[wim] dt-bindings: watchdog: renesas-wdt: Document r8a779f0 support

[wim] watchdog: renesas_wdt: Add R-Car Gen4 support

[wim] watchdog: allow building BCM7038_WDT for BCM4908

[wim] watchdog: orion_wdt: support pretimeout on Armada-XP

[wim] watchdog: ixp4xx: Implement restart

[wim] Watchdog: sp5100_tco: Move timer initialization into function

[wim] Watchdog: sp5100_tco: Refactor MMIO base address initialization

[wim] Watchdog: sp5100_tco: Add initialization using EFCH MMIO

[wim] Watchdog: sp5100_tco: Enable Family 17h+ CPUs

[mingo] x86/config: Make the x86 defconfigs a bit more usable

[gor] s390/zcrypt: Add admask to zcdn

[gor] s390/zcrypt: Filter admin CPRBs on custom devices

[gor] s390/pkey: fix typos in comments

[gor] s390: crypto: Use min_t() instead of doing it manually

[gor] s390: fix typo in syscall_wrapper.h

[gor] s390/tape: use bitwise instead of arithmetic operator for flags

[gor] s390/traps: improve panic message for translation-specification exception

[gor] s390/alternatives: use instructions instead of byte patterns

[gor] s390/alternatives: use insn format for new instructions

[gor] s390/ap: use insn format for new instructions

[gor] s390/ap: adjust whitespace

[gor] s390/test_unwind: extend kretprobe test

[gor] s390/kprobes: enable kretprobes framepointer verification

[gor] s390/unwind: recover kretprobe modified return address in stacktrace

[gor] s390/unwind: avoid duplicated unwinding entries for kretprobes

[gor] s390/test_unwind: verify __kretprobe_trampoline is replaced

[gor] s390/smp: cleanup target CPU callback starting

[gor] s390/smp: cleanup control register update routines

[gor] s390/maccess: rework absolute lowcore accessors

[gor] s390/vfio-ap: fix kernel doc and signature of group notifier functions

[gor] s390/zcrypt: fix using the correct variable for sizeof()

[gor] s390: cleanup timer API use

[gor] s390/smp: use physical address for SIGP_SET_PREFIX command

[gor] s390/pci: improve zpci_dev reference counting

[gor] s390/pci: rename get_zdev_by_bus() to zdev_from_bus()

[torvalds] powerpc: restore removed #endif

[torvalds] mm: kfence: fix missing objcg housekeeping for SLAB

[pablo] memcg: enable accounting for nft objects

[axboe] block: restore the old set_task_ioprio() behaviour wrt PF_EXITING

[axboe] block: Fix the maximum minor value is blk_alloc_ext_minor()

[trond.myklebust] NFSv4/pNFS: Fix another issue with a list iterator pointing to the head

[djwong] xfs: don't include bnobt blocks when reserving free block pool

[djwong] xfs: remove infinite loop when reserving free block pool

[djwong] xfs: always succeed at setting the reserve pool size

[djwong] xfs: fix overfilling of reserve pool

[djwong] xfs: don't report reserved bnobt space as available

[davem] selftests: net: Add tls config dependency for tls selftests

[tiwai] ALSA: hda/cs8409: Fix Warlock to use mono mic configuration

[tiwai] ALSA: hda/cs8409: Re-order quirk table into ascending order

[tiwai] ALSA: hda/cs8409: Fix Full Scale Volume setting for all variants

[tiwai] ALSA: hda/cs8409: Support new Warlock MLK Variants

[tiwai] ALSA: hda/cs8409: Disable HSBIAS_SENSE_EN for Cyborg

[tiwai] ALSA: hda/cs8409: Add new Dolphin HW variants

[torvalds] Reinstate some of "swiotlb: rework "fix info leak with DMA_FROM_DEVICE""

[corbet] docs: kfigure.py: Don't warn of missing PDF converter in 'make htmldocs'

[corbet] scripts/get_feat.pl: allow output the parsed file names

[corbet] docs: kernel_feat.py: add build dependencies

[corbet] docs: kernel_abi.py: add sphinx build dependencies

[corbet] docs: kernel_include.py: add sphinx build dependencies

[corbet] scripts/get_abi: change the file/line number meta info

[corbet] scripts/kernel-doc: change the line number meta info

[kuba] net: bnxt_ptp: fix compilation error

[bcain] MAINTAINERS: update hexagon maintainer email, tree

[mst] drivers/virtio: Enable virtio mem for ARM64

[mst] vhost: cache avail index in vhost_enable_notify()

[mst] vDPA/ifcvf: make use of virtio pci modern IO helpers in ifcvf

[mst] vhost_vdpa: don't setup irq offloading when irq_num < 0

[mst] vDPA/ifcvf: implement device MSIX vector allocator

[mst] vDPA/ifcvf: implement shared IRQ feature

[mst] vDPA/ifcvf: cacheline alignment for ifcvf_hw

[mst] mm/balloon_compaction: make balloon page compaction callbacks static

[mst] Add definition of VIRTIO_F_IN_ORDER feature bit

[mst] virtio_crypto: Introduce VIRTIO_CRYPTO_NOSPC

[mst] virtio-crypto: introduce akcipher service

[mst] virtio-crypto: implement RSA algorithm

[mst] virtio-crypto: rename skcipher algs

[mst] net/mlx5: Add support for configuring max device MTU

[mst] virtio_ring: rename vring_unmap_state_packed() to vring_unmap_extra_packed()

[mst] virtio_ring: remove flags check for unmap split indirect desc

[mst] virtio_ring: remove flags check for unmap packed indirect desc

[mst] tools/virtio: fix after premapped buf support

[mst] tools/virtio: compile with -pthread

[mst] virtio: use virtio_device_ready() in virtio_device_restore()

[mst] drivers/net/virtio_net: Fixed padded vheader to use v1 with hash.

[mst] drivers/net/virtio_net: Added basic RSS support.

[mst] drivers/net/virtio_net: Added RSS hash report.

[mst] drivers/net/virtio_net: Added RSS hash report control.

[mst] Revert "virtio-pci: harden INTX interrupts"

[mst] Revert "virtio_pci: harden MSI-X interrupts"

[mst] virtio: pci: check bar values read from virtio config space

[mst] vdpa/mlx5: re-create forwarding rules after mac modified

[mst] vdpa: support exposing the config size to userspace

[mst] vdpa: change the type of nvqs to u32

[mst] vdpa: support exposing the count of vqs to userspace

[mst] vhost: handle error while adding split ranges to iotlb

[mst] vdpa/mlx5: Avoid processing works if workqueue was destroyed

[gor] s390/alternatives: avoid using jgnop mnemonic

[corbet] Documentation: kunit: Fix cross-referencing warnings

[kuba] net: dsa: bcm_sf2_cfp: fix an incorrect NULL check on list iterator

[kuba] net: move net_unlink_todo() out of the header

[stfrench] smb3: cleanup and clarify status of tree connections

[kuba] net/smc: Send out the remaining data in sndbuf before close

[kuba] Revert "selftests: net: Add tls config dependency for tls selftests"

[willy] XArray: Fix xas_create_range() when multi-order entry present

[robh] Revert "dt-bindings: display: mediatek: add ethdr definition for mt8195"

[robh] dt-bindings: display: mediatek, mutex: Fix mediatek, gce-events type

[robh] dt-bindings: display: mediatek, ovl: Fix 'iommu' required property typo

[robh] dt-bindings: display: mediatek: Fix examples on new bindings

[robh] dt-bindings: net: snps,dwmac: modify available values of PBL

[robh] dt-bindings: media: mediatek,vcodec: Fix addressing cell sizes

[robh] dt-bindings: Fix missing '/schemas' in $ref paths

[ast] bpf/bpftool: Add unprivileged_bpf_disabled check against value of 2

[ast] fprobe: Fix smatch type mismatch warning

[ast] fprobe: Fix sparse warning for acccessing __rcu ftrace_hash

[ast] bpf: Sync comments for bpf_get_stack

[ast] bpf: Fix maximum permitted number of arguments check

[ast] selftests/bpf: fix selftest after random: Urandom_read tracepoint removal

[ast] bpftool: Fix generated code in codegen_asserts

[ast] kprobes: Use rethook for kretprobe if possible

[ast] x86,rethook,kprobes: Replace kretprobe with rethook on x86

[ast] x86,rethook: Fix arch_rethook_trampoline() to generate a complete pt_regs

[ast] x86,kprobes: Fix optprobe trampoline to generate complete pt_regs

[ast] xsk: Do not write NULL in SW ring at allocation failure

[ast] ice: xsk: Eliminate unnecessary loop iteration

[ast] ice: xsk: Stop Rx processing when ntc catches ntu

[ast] ice: xsk: Fix indexing in ice_tx_xsk_pool()

[ast] selftests/bpf: Fix clang compilation errors

[hch] nvmet: use a private workqueue instead of the system workqueue

[hch] nvmet: remove redundant assignment after left shift

[hch] nvme: allow duplicate NSIDs for private namespaces

[hch] nvme: fix RCU hole that allowed for endless looping in multipath round robin

[hch] nvme-multipath: fix hang when disk goes live over reconnect

[pabeni] openvswitch: Fixed nd target mask field in the flow dump.

[pabeni] ax25: fix UAF bug in ax25_send_control()

[pabeni] ax25: Fix UAF bugs in ax25 timers

[pabeni] net: lan966x: fix kernel oops on ioctl when I/F is down

[bp] x86/sev: Unroll string mmio with CC_ATTR_GUEST_UNROLL_STRING_IO

[deller] Revert "parisc: Fix invalidate/flush vmap routines"

[torvalds] phy: PHY_FSL_LYNX_28G should depend on ARCH_LAYERSCAPE

[axboe] io_uring: fail links if msg-ring doesn't succeeed

[pbonzini] KVM: Prevent module exit until all VMs are freed

[pbonzini] Revert "KVM: set owner of cpu and vm file operations"

[sboyd] clk: zynq: trivial warning fix

[sboyd] clk: zynq: Update the parameters to zynq_clk_register_periph_clk

[pbonzini] KVM: x86: Fix clang -Wimplicit-fallthrough in do_host_cpuid()

[pbonzini] Documentation: kvm: fixes for locking.rst

[pbonzini] Documentation: kvm: include new locks

[pbonzini] Documentation: KVM: add separate directories for architecture-specific documentation

[pbonzini] Documentation: KVM: add virtual CPU errata documentation

[pbonzini] Documentation: KVM: add API issues section

[pbonzini] KVM: x86: Check lapic_in_kernel() before attempting to set a SynIC irq

[pbonzini] KVM: x86: Avoid theoretical NULL pointer dereference in kvm_irq_delivery_to_apic_fast()

[pbonzini] KVM: x86: Forbid VMM to set SYNIC/STIMER MSRs when SynIC wasn't activated

[bp] x86/fpu: Remove redundant XCOMP_BV initialization

[deller] parisc: Fix CPU affinity for Lasi, WAX and Dino chips

[deller] parisc: Clean up cpu_check_affinity() and drop cpu_set_affinity_irq()

[deller] parisc: Detect hppa-suse-linux-gcc compiler for cross-building

[deller] parisc: Add constants for control registers and clean up mfctl()

[deller] parisc: Ensure set_firmware_width() is called only once

[deller] parisc: Switch from GENERIC_CPU_DEVICES to GENERIC_ARCH_TOPOLOGY

[deller] parisc: Move store_cpu_topology() into text section

[deller] parisc: Move CPU startup-related functions into .text section

[deller] parisc: Move disable_sr_hashing_asm() into .text section

[deller] parisc: Add PDC locking functions for rendezvous code

[deller] parisc: Implement __cpu_die() and __cpu_disable() for CPU hotplugging

[deller] parisc: Rewrite arch_cpu_idle_dead() for CPU hotplugging

[deller] parisc: Move common_stext into .text section when CONFIG_HOTPLUG_CPU=y

[deller] parisc: Find a new timesync master if current CPU is removed

[deller] parisc: Fix patch code locking and flushing

[axboe] io_uring: defer msg-ring file validity check until command issue

[alexandre.belloni] rtc: mc146818-lib: Fix the AltCentury for AMD platforms

[alexandre.belloni] rtc: gamecube: Fix refcount leak in gamecube_rtc_read_offset_from_sram

[alexandre.belloni] rtc: check if __rtc_read_time was successful

[palmer] riscv module: remove (NOLOAD)

[torvalds] fs: fd tables have to be multiples of BITS_PER_LONG

[mcgrof] lib/test: use after free in register_test_dev_kmod()

[kuba] dt-bindings: net: qcom,ethqos: Document SM8150 SoC compatible

[djwong] xfs: aborting inodes on shutdown may need buffer lock

[djwong] xfs: shutdown in intent recovery has non-intent items in the AIL

[djwong] xfs: run callbacks before waking waiters in xlog_state_shutdown_callbacks

[djwong] xfs: log shutdown triggers should only shut down the log

[djwong] xfs: xfs_do_force_shutdown needs to block racing shutdowns

[djwong] xfs: xfs_trans_commit() path must check for log shutdown

[djwong] xfs: shutdown during log recovery needs to mark the log shutdown

[djwong] xfs: drop async cache flushes from CIL commits.

[herbert] crypto: x86/sm3 - Fixup SLS

[hch] PCI: Remove the deprecated "pci-dma-compat.h" API

[torvalds] fs: fix fd table size alignment properly

[tiwai] ALSA: hda/realtek: Fix audio regression on Mi Notebook Pro 2020

[tiwai] ALSA: hda: Avoid unsol event during RPM suspending

[bp] x86/fpu: Remove unused supervisor only offsets

[bp] x86/fpu/xsave: Initialize offset/size cache early

[bp] x86/fpu: Cache xfeature flags from CPUID

[bp] x86/fpu/xsave: Handle compacted offsets correctly with supervisor states

[bp] x86/fpu/xstate: Handle supervisor states in XSTATE permissions

[bp] x86/fpu/xstate: Consolidate size calculations

[tiwai] ALSA: pcm: Fix potential AB/BA lock with buffer_mutex and mmap_lock

[stfrench] ksmbd: shorten experimental warning on loading the module

[stfrench] MAINTAINERS: ksmbd: switch Sergey to reviewer

[stfrench] ksmbd: Remove a redundant zeroing of memory

[stfrench] ksmbd: replace usage of found with dedicated list iterator variable

[hch] PCI/doc: cleanup references to the legacy PCI DMA API

[axboe] loop: fix ioctl calls using compat_loop_info

[djwong] fs: fix an infinite loop in iomap_fiemap

[tsbogend] mips: sgi-ip22: add a check for the return of kzalloc()

[tsbogend] MIPS: lantiq: check the return value of kzalloc()

[tsbogend] MIPS: rb532: move GPIOD definition into C-files

[axboe] drbd: fix potential silent data corruption

[kuba] net: dsa: felix: fix possible NULL pointer dereference

[kuba] ptp: ocp: handle error from nvmem_device_find

[kuba] sfc: Avoid NULL pointer dereference on systems without numa awareness

[corbet] docs: sphinx/requirements: Limit jinja2<3.1

[corbet] docs: Add a document on how to fix a messy diffstat

[palmer] riscv: Rename "sp_in_global" to "current_stack_pointer"

[torvalds] mm: page_alloc: validate buddy before check its migratetype.

[kuba] wireguard: queueing: use CFI-safe ptr_ring cleanup function

[kuba] wireguard: selftests: simplify RNG seeding

[kuba] wireguard: socket: free skb in send6 when ipv6 is disabled

[kuba] wireguard: socket: ignore v6 endpoints when ipv6 is disabled

[kuba] net: sparx5: uses, depends on BRIDGE or !BRIDGE

[masahiroy] usr/include: replace extra-y with always-y

[masahiroy] arch: syscalls: simplify uapi/kapi directory creation

[masahiroy] fixdep: use fflush() and ferror() to ensure successful write to files

[masahiroy] kbuild: add --target to correctly cross-compile UAPI headers with Clang

[masahiroy] kbuild: Make $(LLVM) more flexible

[palmer] riscv: dts: canaan: Fix SPI3 bus width

[palmer] riscv: Fix fill_callchain return value

[palmer] riscv: Increase stack size under KASAN

[palmer] RISC-V: Fix a comment typo in riscv_of_parent_hartid()

[mkl] can: isotp: restore accidentally removed MSG_PEEK feature

[mkl] can: mcp251xfd: mcp251xfd_register_get_dev_id(): fix return of error value

[mkl] can: m_can: m_can_tx_handler(): fix use after free of skb

[mkl] can: ems_usb: ems_usb_start_xmit(): fix double dev_kfree_skb() in error path

[mkl] can: usb_8dev: usb_8dev_start_xmit(): fix double dev_kfree_skb() in error path

[mkl] can: mcba_usb: mcba_usb_start_xmit(): fix double dev_kfree_skb in error path

[mkl] can: mcba_usb: properly check endpoint type

[mkl] can: gs_usb: gs_make_candev(): fix memory leak for devices with extended bit timing configuration

[tglx] Revert "signal, x86: Delay calling signals in atomic on RT enabled kernels"

[pabeni] docs: netdev: replace references to old archives

[pabeni] docs: netdev: minor reword

[pabeni] docs: netdev: move the patch marking section up

[pabeni] docs: netdev: turn the net-next closed into a Warning

[pabeni] docs: netdev: note that RFC postings are allowed any time

[pabeni] docs: netdev: shorten the name and mention msgid for patch status

[pabeni] docs: netdev: rephrase the 'Under review' question

[pabeni] docs: netdev: rephrase the 'should I update patchwork' question

[pabeni] docs: netdev: add a question about re-posting frequency

[pabeni] docs: netdev: make the testing requirement more stringent

[pabeni] docs: netdev: add missing back ticks

[pabeni] docs: netdev: call out the merge window in tag checking

[pabeni] docs: netdev: broaden the new vs old code formatting guidelines

[pabeni] docs: netdev: move the netdev-FAQ to the process pages

[pabeni] net: hns3: fix the concurrency between functions reading debugfs

[pabeni] net: hns3: fix software vlan talbe of vlan 0 inconsistent with hardware

[pabeni] rxrpc: Fix call timer start racing with call destruction

[axboe] block: use dedicated list iterator variable

[willy] XArray: Update the LRU list in xas_split()

[pabeni] rxrpc: fix some null-ptr-deref bugs in server_key.c

[rmk+kernel] ARM: 9189/1: decompressor: fix unneeded rebuilds of library objects

[rmk+kernel] ARM: 9187/1: JIVE: fix return value of __setup handler

[axboe] MAINTAINERS: add drbd co-maintainer

[brgl] gpio: ts4900: Fix comment formatting and grammar

[brgl] gpio: Properly document parent data union

[axboe] nbd: fix possible overflow on 'first_minor' in nbd_dev_add()

[stfrench] smb3: fix ksmbd bigendian bug in oplock break, and move its struct to smbfs_common

[stfrench] cifs: prevent bad output lengths in smb2_ioctl_query_info()

[stfrench] cifs: fix NULL ptr dereference in smb2_ioctl_query_info()

[brgl] gpio: ts5500: Fix Links to Technologic Systems web resources

[bhelgaas] PCI: hv: Remove unused hv_set_msi_entry_from_desc()

[kuba] openvswitch: Add recirc_id to recirc warning

[kuba] vxlan: do not feed vxlan_vnifilter_dump_dev with non vxlan devices

[keescook] ARM/dma-mapping: Remove CMA code when not built with CMA

[agruenba] gfs2: Make sure FITRIM minlen is rounded up to fs block size

[axboe] blk-wbt: remove wbt_track stub

[palmer] RISC-V: Declare per cpu boot data as static

[palmer] RISC-V: module: fix apply_r_riscv_rcv_branch_rela typo

[palmer] RISC-V: Enable profiling by default

[arnd] ARM: OMAP2+: Fix regression for smc calls for vmap stack

[Jason] random: mix build-time latent entropy into pool at init

[arnd] ARM: dts: spear13xx: Update SPI dma properties

[arnd] ARM: dts: spear1340: Update serial node properties

[arnd] arm64: dts: ls1043a: Update i2c dma properties

[arnd] arm64: dts: ls1046a: Update i2c node dma properties

[palmer] riscv: cpu.c: don't use kernel-doc markers for comments

[axboe] drbd: remove usage of list iterator variable after loop

[axboe] drbd: remove check of list iterator against head past the loop body

[palmer] Documentation: riscv: remove non-existent directory from table of contents

[bleung] platform: chrome: Split trace include file

[bleung] platform/chrome: cros_ec_debugfs: detach log reader wq from devm

[palmer] RISC-V: defconfig: Drop redundant SBI HVC and earlycon

[palmer] RISC-V: K210 defconfigs: Drop redundant MEMBARRIER=n

[linkinjeon] exfat: allow access to paths with trailing dots

[linkinjeon] exfat: do not clear VolumeDirty in writeback

[dmitry.torokhov] Revert "Input: clear BTN_RIGHT/MIDDLE on buttonpads"

[hch] dma-mapping: move pgprot_decrypted out of dma_pgprot

[tsbogend] MIPS: crypto: Fix CRC32 code

[rmk+kernel] ARM: 9190/1: kdump: add invalid input check for 'crashkernel=0'

[rmk+kernel] ARM: 9191/1: arm/stacktrace, kasan: Silence KASAN warnings in unwind_frame()

[snitzer] dm ioctl: log an error if the ioctl structure is corrupted

[snitzer] dm integrity: set journal entry unused when shrinking device

[masahiroy] kconfig: remove stale comment about removed kconfig_print_symbol()

[masahiroy] kbuild: fix empty ${PYTHON} in scripts/link-vmlinux.sh

[masahiroy] kbuild: Remove '-mno-global-merge'

[masahiroy] Revert "um: clang: Strip out -mno-global-merge from USER_CFLAGS"

[snitzer] dm: fix dm_io and dm_target_io flags race condition on Alpha

[snitzer] dm: fix bio polling to handle possibile BLK_STS_AGAIN

[willy] readahead: Remove read_cache_pages()

[willy] fs: Remove ->readpages address space operation

[willy] mm: remove the pages argument to read_pages

[willy] mm: remove the skip_page argument to read_pages

[willy] readahead: Update comments

[willy] iomap: Simplify is_partially_uptodate a little

[willy] fs: Remove read_actor_t

[willy] fs, net: Move read_descriptor_t to net.h

[willy] fs: Pass an iocb to generic_perform_write()

[willy] filemap: Remove AOP_FLAG_CONT_EXPAND

[willy] ext4: Correct ext4_journalled_dirty_folio() conversion

[willy] f2fs: Correct f2fs_dirty_data_folio() conversion

[willy] f2fs: Get the superblock from the mapping instead of the page

[willy] ntfs: Correct mark_ntfs_record_dirty() folio conversion

[willy] btrfs: Remove a use of PAGE_SIZE in btrfs_invalidate_folio()

[torvalds] Revert "mm: madvise: skip unmapped vma holes passed to process_madvise"

[torvalds] ocfs2: fix crash when mount with quota enabled

[torvalds] nilfs2: fix lockdep warnings in page operations for btree nodes

[torvalds] nilfs2: fix lockdep warnings during disk space reclamation

[torvalds] nilfs2: get rid of nilfs_mapping_init()

[torvalds] mm/munlock: add lru_add_drain() to fix memcg_stat_test

[torvalds] mm/munlock: update Documentation/vm/unevictable-lru.rst

[torvalds] mm/munlock: protect the per-CPU pagevec by a local_lock_t

[torvalds] mm: kfence: fix objcgs vector allocation

[torvalds] mailmap: update Kirill's email

[torvalds] mm,hwpoison: unmap poisoned page before invalidation

[torvalds] mm, kasan: fix __GFP_BITS_SHIFT definition breaking LOCKDEP

[torvalds] tools/vm/page_owner_sort.c: remove -c option

[torvalds] doc/vm/page_owner.rst: remove content related to -c option

[torvalds] mm/kmemleak: reset tag when compare object pointer

[torvalds] mm/damon: prevent activated scheme from sleeping by deactivated schemes

[acme] perf stat: Avoid SEGV if core.cpus isn't set

[acme] perf tools: Update copy of libbpf's hashmap.c

[acme] perf beauty: Update copy of linux/socket.h with the kernel sources

[acme] tools headers UAPI: Sync asm-generic/mman-common.h with the kernel

[acme] tools arch x86: Sync the msr-index.h copy with the kernel sources

[acme] tools kvm headers arm64: Update KVM headers from the kernel sources

[acme] tools headers UAPI: Sync linux/kvm.h with the kernel sources

[acme] tools headers UAPI: Sync drm/i915_drm.h with the kernel sources

[acme] tools headers cpufeatures: Sync with the kernel sources

[acme] perf tools: Stop depending on .git files for building PERF-VERSION-FILE

[acme] perf evlist: Rename cpus to user_requested_cpus

[acme] perf cpumap: Add is_subset function

[acme] perf cpumap: More cpu map reuse by merge.

[acme] perf evlist: Directly return instead of using local ret variable

[acme] perf python: Convert tracepoint.py example to python3

[palmer] dt-bindings: Fix phandle-array issues in the idle-states bindings

[pbonzini] KVM: MMU: propagate alloc_workqueue failure

[pbonzini] KVM: SVM: fix panic on out-of-bounds guest IRQ

[pbonzini] KVM: x86/mmu: Zap only TDP MMU leafs in zap range and mmu_notifier unmap

[pbonzini] KVM: avoid double put_page with gfn-to-pfn cache

[pbonzini] KVM: Don't actually set a request when evicting vCPUs for GFN cache invd

[pbonzini] KVM: x86/pmu: Use different raw event masks for AMD and Intel

[pbonzini] KVM: SVM: Fix kvm_cache_regs.h inclusions for is_guest_mode()

[pbonzini] KVM: Use enum to track if cached PFN will be used in guest and/or host

[pbonzini] KVM: Remove dirty handling from gfn_to_pfn_cache completely

[pbonzini] KVM: X86: Change the type of access u32 to u64

[pbonzini] KVM: X86: Fix comments in update_permission_bitmask

[pbonzini] KVM: X86: Rename variable smap to not_smap in permission_fault()

[pbonzini] KVM: X86: Handle implicit supervisor access with SMAP

[pbonzini] KVM: x86: Make APICv inhibit reasons an enum and cleanup naming

[pbonzini] KVM: x86: Add wrappers for setting/clearing APICv inhibits

[pbonzini] KVM: x86: Trace all APICv inhibit changes and capture overall status

[pbonzini] KVM: x86/svm: Clear reserved bits written to PerfEvtSeln MSRs

[pbonzini] KVM: x86: mmu: trace kvm_mmu_set_spte after the new SPTE was set

[pbonzini] KVM: x86/pmu: Fix and isolate TSX-specific performance event logic

[pbonzini] KVM: x86/emulator: Emulate RDPID only if it is enabled in guest

[pbonzini] KVM: x86: Only do MSR filtering when access MSR by rdmsr/wrmsr

[pbonzini] KVM: x86: document limitations of MSR filtering

[pbonzini] KVM: MIPS: remove reference to trap&emulate virtualization

[pbonzini] KVM: x86: SVM: fix avic spec based definitions again

[pbonzini] KVM: x86: SVM: move tsc ratio definitions to svm.h

[pbonzini] kvm: x86: SVM: remove unused defines

[pbonzini] KVM: x86: SVM: fix tsc scaling when the host doesn't support it

[pbonzini] KVM: x86: cleanup enter_rmode()

[pbonzini] KVM: x86: Remove redundant vm_entry_controls_clearbit() call

[pbonzini] KVM: x86/mmu: do compare-and-exchange of gPTE via the user address

[pbonzini] KVM: x86: fix sending PV IPI

[rostedt] tracing: Rename the staging files for trace_events

[rostedt] proc: bootconfig: Add null pointer check

[rostedt] tracing/user_events: Hold event_mutex during dyn_event_add

[rostedt] tracing/user_events: Remove eBPF interfaces

[rostedt] tracing: Set user_events to BROKEN

[rostedt] ftrace: Make ftrace_graph_is_dead() a static branch

[rostedt] tracing: Move user_events.h temporarily out of include/uapi

[torvalds] tracing: mark user_events as BROKEN

[torvalds] watch_queue: Free the page array when watch_queue is dismantled

[axboe] Revert "nbd: fix possible overflow on 'first_minor' in nbd_dev_add()"

[masahiroy] modpost: restore the warning message for missing symbol versions

[sboyd] Revert "clk: Drop the rate range on clk_put()"

[torvalds] Linux 5.18-rc1

[Mauro Carvalho Chehab] media: dvb-usb-ids.h: sort entries

[Mauro Carvalho Chehab] media: dvb-usb: move USB IDs to dvb-usb-ids.h

[Mauro Carvalho Chehab] media: dvb-usb: vp702x: reference to usb ID table

[Mauro Carvalho Chehab] media: dvb-usb: Add helper macros for using USB VID/PID

[Mauro Carvalho Chehab] media: dvb-usb: a800: use an enum for the device number

[Mauro Carvalho Chehab] media: af9005: use the newer dvb-usb macros for USB device

[Mauro Carvalho Chehab] media: dvb-usb: az6027: use an enum for the device number

[Mauro Carvalho Chehab] media: cinergyT2-core: use the newer dvb-usb macros for USB device

[Mauro Carvalho Chehab] media: cxusb: use the newer dvb-usb macros for USB device

[Mauro Carvalho Chehab] media: digitv: use the newer dvb-usb macros for USB device

[Mauro Carvalho Chehab] media: dvb-usb: dtt200u: use an enum for the device number

[Mauro Carvalho Chehab] media: dtv5100: use the newer dvb-usb macros for USB device

[Mauro Carvalho Chehab] media: dw2102: use the newer dvb-usb macros for USB device

[Mauro Carvalho Chehab] media: dvb-usb: gp8psk: use an enum for the device number

[Mauro Carvalho Chehab] media: dvb-usb: m920x: use an enum for the device number

[Mauro Carvalho Chehab] media: dvb-usb: nova-t-usb2: use an enum for the device number

[Mauro Carvalho Chehab] media: dvb-usb: opera1: use an enum for the device number

[Mauro Carvalho Chehab] media: dvb-usb: pctv452e: use an enum for the device number

[Mauro Carvalho Chehab] media: technisat-usb2: use the newer dvb-usb macros for USB device

[Mauro Carvalho Chehab] media: dvb-usb: ttusb2: use an enum for the device number

[Mauro Carvalho Chehab] media: dvb-usb: umt-010: use an enum for the device number

[Mauro Carvalho Chehab] media: dvb-usb: vp702x: use an enum for the device number

[Mauro Carvalho Chehab] media: dvb-usb: vp7045: use an enum for the device number

[Mauro Carvalho Chehab] media: dvb-usb: dibusb-mb: use an enum for the device number

[Mauro Carvalho Chehab] media: dvb-usb: dibusb-mc: use an enum for the device number

[Mauro Carvalho Chehab] media: dvb-usb: dib0700_devices: use an enum for the device number


------------------------------------------
[...truncated 2.60 KB...]
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
+ ./scripts/config -d MODULE_SIG -d KEYS -d IMA -d CONFIG_DEBUG_INFO -d SYSTEM_TRUSTED_KEYRING -d MODVERSIONS -d CHECK_SIGNATURE
+ make W=1 CC=clang-12 HOSTCC=clang-12 init
  SYNC    include/config/auto.conf.cmd
  UPD     include/config/kernel.release
  UPD     include/generated/uapi/linux/version.h
  UPD     include/generated/utsrelease.h
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  arch/x86/tools/relocs_64.o
  HOSTCC  arch/x86/tools/relocs_common.o
  DESCEND objtool
  HOSTCC  scripts/unifdef
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTLD  arch/x86/tools/relocs
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/exec-cmd.o>
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/help.o>
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTCC  scripts/dtc/libfdt/fdt.o
  HOSTCC  scripts/dtc/libfdt/fdt_ro.o
  HOSTCC  scripts/dtc/libfdt/fdt_wip.o
  HOSTCC  scripts/dtc/libfdt/fdt_sw.o
  HOSTCC  scripts/dtc/libfdt/fdt_rw.o
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/arch/x86/special.o>
  HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
  HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
  HOSTCC  scripts/dtc/libfdt/fdt_addresses.o
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/parse-options.o>
  GEN     <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/arch/x86/lib/inat-tables.c>
  HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/arch/x86/decode.o>
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/run-command.o>
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/weak.o>
  HOSTCC  scripts/dtc/fdtoverlay.o
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/check.o>
  HOSTLD  scripts/dtc/dtc
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/special.o>
  HOSTLD  scripts/dtc/fdtoverlay
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/sigchain.o>
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/orc_gen.o>
  HOSTCC  scripts/bin2c
  HOSTCC  scripts/kallsyms
  LD      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/libsubcmd-in.o>
  HOSTCC  scripts/selinux/genheaders/genheaders
  HOSTCC  scripts/sorttable
  AR      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/libsubcmd.a>
  HOSTCC  scripts/asn1_compiler
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/orc_dump.o>
  HOSTCC  scripts/selinux/mdp/mdp
  LD      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/arch/x86/objtool-in.o>
  HOSTCC  scripts/sign-file
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/builtin-check.o>
  HOSTCC  scripts/insert-sys-cert
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/builtin-orc.o>
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/elf.o>
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/objtool.o>
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/libstring.o>
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/libctype.o>
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/str_error_r.o>
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/librbtree.o>
  LD      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/objtool-in.o>
  LINK    <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/objtool>
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  CC      scripts/mod/devicetable-offsets.s
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTCC  scripts/mod/file2alias.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CALL    scripts/atomic/check-atomics.sh
  CC      arch/x86/kernel/asm-offsets.s
  HDRINST usr/include/asm-generic/socket.h
  HDRINST usr/include/asm-generic/signal.h
  HDRINST usr/include/asm-generic/mman-common.h
  HDRINST usr/include/asm-generic/shmbuf.h
  HDRINST usr/include/drm/panfrost_drm.h
  HDRINST usr/include/drm/i915_drm.h
  HDRINST usr/include/drm/drm_mode.h
  HDRINST usr/include/drm/msm_drm.h
  HDRINST usr/include/drm/amdgpu_drm.h
  HDRINST usr/include/linux/io_uring.h
  HDRINST usr/include/linux/if_ether.h
  HDRINST usr/include/linux/if_addr.h
  HDRINST usr/include/linux/rfkill.h
  HDRINST usr/include/linux/rseq.h
  HDRINST usr/include/linux/kvm.h
  HDRINST usr/include/linux/rtc.h
  HDRINST usr/include/linux/userfaultfd.h
  HDRINST usr/include/linux/ndctl.h
  HDRINST usr/include/linux/socket.h
  HDRINST usr/include/linux/if_bridge.h
  HDRINST usr/include/linux/btrfs_tree.h
  HDRINST usr/include/linux/types.h
  HDRINST usr/include/linux/ioam6_iptunnel.h
  HDRINST usr/include/linux/input-event-codes.h
  HDRINST usr/include/linux/mptcp.h
  HDRINST usr/include/linux/gtp.h
  HDRINST usr/include/linux/fsmap.h
  HDRINST usr/include/linux/magic.h
  HDRINST usr/include/linux/perf_event.h
  HDRINST usr/include/linux/virtio_crypto.h
  HDRINST usr/include/linux/loop.h
  HDRINST usr/include/linux/vhost.h
  HDRINST usr/include/linux/kfd_ioctl.h
  HDRINST usr/include/linux/thermal.h
  HDRINST usr/include/linux/openvswitch.h
  HDRINST usr/include/linux/mctp.h
  HDRINST usr/include/linux/nfs4.h
  HDRINST usr/include/linux/iio/types.h
  HDRINST usr/include/linux/rpmsg.h
  HDRINST usr/include/linux/smc_diag.h
  HDRINST usr/include/linux/counter.h
  HDRINST usr/include/linux/reiserfs_xattr.h
  HDRINST usr/include/linux/rtnetlink.h
  HDRINST usr/include/linux/nfs_fs.h
  HDRINST usr/include/linux/nvme_ioctl.h
  HDRINST usr/include/linux/vfio.h
  HDRINST usr/include/linux/dm-ioctl.h
  HDRINST usr/include/linux/tty.h
  HDRINST usr/include/linux/net_dropmon.h
  HDRINST usr/include/linux/xfrm.h
  HDRINST usr/include/linux/bpf.h
  HDRINST usr/include/linux/mroute6.h
  HDRINST usr/include/linux/psci.h
  HDRINST usr/include/linux/smc.h
  HDRINST usr/include/linux/elf.h
  HDRINST usr/include/linux/fsi.h
  HDRINST usr/include/linux/pkt_cls.h
  HDRINST usr/include/linux/if_tunnel.h
  HDRINST usr/include/linux/ethtool_netlink.h
  HDRINST usr/include/linux/netfilter/nfnetlink_queue.h
  HDRINST usr/include/linux/netfilter/nf_conntrack_common.h
  HDRINST usr/include/linux/nl80211.h
  HDRINST usr/include/linux/ptrace.h
  HDRINST usr/include/linux/kexec.h
  HDRINST usr/include/linux/iommu.h
  HDRINST usr/include/linux/virtio_config.h
  HDRINST usr/include/linux/btrfs.h
  HDRINST usr/include/linux/serial_core.h
  HDRINST usr/include/linux/can/isotp.h
  HDRINST usr/include/linux/hyperv.h
  HDRINST usr/include/linux/android/binder.h
  HDRINST usr/include/linux/if_link.h
  HDRINST usr/include/misc/fastrpc.h
  HDRINST usr/include/misc/habanalabs.h
  HDRINST usr/include/sound/asound.h
  HDRINST usr/include/sound/sof/abi.h
  HDRINST usr/include/xen/gntdev.h
  HDRINST usr/include/linux/version.h
  HDRINST usr/include/linux/cyclades.h
  HDRINST usr/include/asm/kvm.h
  HDRINST usr/include/asm/signal.h
  HDRINST usr/include/asm/shmbuf.h
  HDRINST usr/include/asm/processor-flags.h
  HDRINST usr/include/asm/amd_hsmp.h
  CALL    scripts/checksyscalls.sh
  CC      init/main.o
  CHK     include/generated/compile.h
  CC      init/do_mounts.o
  CC      init/do_mounts_rd.o
  CC      init/do_mounts_initrd.o
  CC      init/initramfs.o
  CC      init/calibrate.o
  CC      init/init_task.o
  UPD     include/generated/compile.h
  CC      init/version.o
In file included from init/do_mounts.c:22:
In file included from ./include/linux/nfs_fs.h:31:
In file included from ./include/linux/sunrpc/auth.h:13:
In file included from ./include/linux/sunrpc/sched.h:19:
./include/linux/sunrpc/xdr.h:734:10: error: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        if (len > SIZE_MAX / sizeof(*p))
            ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
1 error generated.
make[1]: *** [scripts/Makefile.build:288: init/do_mounts.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1834: init] Error 2
Build step 'Execute shell' marked build as failure
Not sending mail to unregistered user gor@linux.ibm.com
Not sending mail to unregistered user rmk+kernel@armlinux.org.uk
Not sending mail to unregistered user mkl@pengutronix.de
Not sending mail to unregistered user bleung@chromium.org
Not sending mail to unregistered user dmitry.torokhov@gmail.com
Not sending mail to unregistered user davem@davemloft.net
Not sending mail to unregistered user airlied@redhat.com
Not sending mail to unregistered user jani.nikula@intel.com
Not sending mail to unregistered user axboe@kernel.dk
Not sending mail to unregistered user stfrench@microsoft.com
Not sending mail to unregistered user rafael.j.wysocki@intel.com
Not sending mail to unregistered user torvalds@linux-foundation.org
Not sending mail to unregistered user sboyd@kernel.org
Not sending mail to unregistered user pbonzini@redhat.com
Not sending mail to unregistered user pabeni@redhat.com
Not sending mail to unregistered user lee.jones@linaro.org
Not sending mail to unregistered user linkinjeon@kernel.org
Not sending mail to unregistered user rostedt@goodmis.org
Not sending mail to unregistered user willy@infradead.org
Not sending mail to unregistered user pablo@netfilter.org
Not sending mail to unregistered user herbert@gondor.apana.org.au
Not sending mail to unregistered user bcain@codeaurora.org
Not sending mail to unregistered user hch@lst.de
Not sending mail to unregistered user robh@kernel.org
Not sending mail to unregistered user pmladek@suse.com
Not sending mail to unregistered user daniel.thompson@linaro.org
Not sending mail to unregistered user kuba@kernel.org
Not sending mail to unregistered user fw@strlen.de
Not sending mail to unregistered user tsbogend@alpha.franken.de
Not sending mail to unregistered user broonie@kernel.org
Not sending mail to unregistered user arnd@arndb.de
Not sending mail to unregistered user corbet@lwn.net
Not sending mail to unregistered user agruenba@redhat.com
Not sending mail to unregistered user wim@linux-watchdog.org
Not sending mail to unregistered user ast@kernel.org
Not sending mail to unregistered user bp@suse.de
Not sending mail to unregistered user keescook@chromium.org
Not sending mail to unregistered user mingo@kernel.org
Not sending mail to unregistered user masahiroy@kernel.org
Not sending mail to unregistered user djwong@kernel.org
Not sending mail to unregistered user brgl@bgdev.pl
Not sending mail to unregistered user boris.ostrovsky@oracle.com
Not sending mail to unregistered user mst@redhat.com
Not sending mail to unregistered user snitzer@redhat.com
Not sending mail to unregistered user Jason@zx2c4.com
Not sending mail to unregistered user bhelgaas@google.com
Not sending mail to unregistered user tglx@linutronix.de
Not sending mail to unregistered user deller@gmx.de
Not sending mail to unregistered user mcgrof@kernel.org
Not sending mail to unregistered user palmer@rivosinc.com
Not sending mail to unregistered user trond.myklebust@hammerspace.com
Not sending mail to unregistered user ebiederm@xmission.com
Not sending mail to unregistered user acme@redhat.com
Not sending mail to unregistered user alexandre.belloni@bootlin.com
Not sending mail to unregistered user dan.j.williams@intel.com
Not sending mail to unregistered user tiwai@suse.de
Not sending mail to unregistered user linus.walleij@linaro.org
