Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9BBD504C5F
	for <lists+linux-media@lfdr.de>; Mon, 18 Apr 2022 07:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbiDRFqg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Apr 2022 01:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbiDRFqe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Apr 2022 01:46:34 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D5013E07
        for <linux-media@vger.kernel.org>; Sun, 17 Apr 2022 22:43:48 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ngKAk-005yk6-NM; Mon, 18 Apr 2022 05:43:39 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ngKAj-002dDX-63; Mon, 18 Apr 2022 05:43:36 +0000
Date:   Mon, 18 Apr 2022 05:43:36 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        mchehab@linuxtv.org
Message-ID: <576582567.0.1650260616499@builder.linuxtv.org>
In-Reply-To: <1214765103.0.1649169018341@builder.linuxtv.org>
References: <1214765103.0.1649169018341@builder.linuxtv.org>
Subject: Build failed in Jenkins: media_stage_clang #444
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

See <https://builder.linuxtv.org/job/media_stage_clang/444/display/redirect?page=changes>

Changes:

[mpe] KVM: PPC: Book3S HV P9: Fix "lost kick" race

[mpe] KVM: PPC: Book3S PR: Disable SCV when AIL could be disabled

[mpe] KVM: PPC: Book3S PR: Disallow AIL != 0

[mpe] KVM: PPC: Use KVM_CAP_PPC_AIL_MODE_3

[daniel.vetter] drm/panel: ili9341: fix optional regulator handling

[alexander.deucher] drm/amd: Add USBC connector ID

[dsterba] btrfs: zoned: traverse devices under chunk_mutex in btrfs_can_activate_zone

[dsterba] btrfs: zoned: remove left over ASSERT checking for single profile

[dsterba] btrfs: fix qgroup reserve overflow the qgroup limit

[robdclark] drm/msm/gpu: Rename runtime suspend/resume functions

[robdclark] drm/msm/gpu: Park scheduler threads for system suspend

[robdclark] drm/msm/gpu: Remove mutex from wait_event condition

[robdclark] drm/msm: Add missing put_task_struct() in debugfs path

[robdclark] dt-bindings: display/msm: another fix for the dpu-qcm2290 example

[dsterba] btrfs: remove device item and update super block in the same transaction

[dsterba] btrfs: fix fallocate to use file_modified to update permissions consistently

[dsterba] btrfs: avoid defragging extents whose next extents are not targets

[dsterba] btrfs: do not warn for free space inode in cow_file_range

[dsterba] btrfs: prevent subvol with swapfile from being deleted

[kvalo] MAINTAINERS: update Lorenzo's email address

[christian.koenig] dma-buf: Add dma_fence_array_for_each (v2)

[christian.koenig] dma-buf: add dma_fence_unwrap v2

[christian.koenig] dma-buf/sync-file: fix warning about fence containers

[alexander.deucher] drm/amdgpu: prevent memory wipe in suspend/shutdown stage

[alexander.deucher] drm/amdgpu: conduct a proper cleanup of PDB bo

[alexander.deucher] drm/amdgpu/pm: fix the Stable pstate Test in amdgpu_test

[alexander.deucher] drm/amdgpu: fix off by one in amdgpu_gfx_kiq_acquire()

[alexander.deucher] drm/amdgpu/gmc: use PCI BARs for APUs in passthrough

[alexander.deucher] drm/amdgpu: add workarounds for VCN TMZ issue on CHIP_RAVEN

[alexander.deucher] drm/amdgpu/pm: add asic smu support check

[alexander.deucher] drm/amd/display: Fix p-state allow debug index on dcn31

[alexander.deucher] drm/amd/display: fix audio format not updated after edid updated

[alexander.deucher] drm/amd/display: Reduce stack size

[alexander.deucher] drm/amd/display: FEC check in timing validation

[alexander.deucher] drm/amd/display: Add fSMC_MSG_SetDtbClk support

[alexander.deucher] drm/amd/display: Update VTEM Infopacket definition

[alexander.deucher] drm/amdgpu/vcn: Fix the register setting for vcn1

[alexander.deucher] drm/amd/display: Add support for zstate during extended vblank

[alexander.deucher] drm/amd/display: remove destructive verify link for TMDS

[alexander.deucher] drm/amdkfd: Fix Incorrect VMIDs passed to HWS

[alexander.deucher] drm/amdkfd: Check use_xgmi_p2p before reporting hive_id

[alexander.deucher] drm/amdgpu/vcn: improve vcn dpg stop procedure

[alexander.deucher] drm/amdkfd: Check for potential null return of kmalloc_array()

[alexander.deucher] drm/amdgpu: add more cases to noretry=1

[alexander.deucher] drm/amdgpu: set noretry=1 for gc 10.3.6

[alexander.deucher] drm/amdgpu: set noretry=1 for GFX 10.3.4

[alexander.deucher] drm/amdgpu: set noretry for gfx 10.3.7

[alexander.deucher] drm/amdgpu/gfx10: enable gfx1037 clock counter retrieval function

[chuck.lever] SUNRPC: Return true/false (not 1/0) from bool functions

[mpe] powerpc/64: Fix build failure with allyesconfig in book3s_64_entry.S

[christian.koenig] dma-buf/sync-file: fix logic error in new fence merge code

[christian.koenig] dma-buf: handle empty dma_fence_arrays gracefully

[wei.liu] Drivers: hv: vmbus: Deactivate sysctl_record_panic_msg by default in isolated guests

[wei.liu] Drivers: hv: vmbus: Fix initialization of device object in vmbus_device_register()

[wei.liu] Drivers: hv: vmbus: Fix potential crash on module unload

[wei.liu] Drivers: hv: vmbus: Propagate VMbus coherence to each VMbus device

[wei.liu] PCI: hv: Propagate coherence from VMbus device to PCI device

[wei.liu] Drivers: hv: vmbus: Prevent load re-ordering when reading ring buffer

[pablo] netfilter: bitwise: fix reduce comparisons

[trond.myklebust] Revert "NFSv4: Handle the special Linux file open access mode"

[trond.myklebust] NFSv4: fix open failure with O_ACCMODE flag

[trond.myklebust] SUNRPC: handle malloc failure in ->request_prepare

[martin.petersen] scsi: mpt3sas: Fix use after free in _scsih_expander_node_remove()

[martin.petersen] scsi: libiscsi: Remove unnecessary memset() in iscsi_conn_setup()

[martin.petersen] scsi: target: tcmu: Fix possible page UAF

[martin.petersen] scsi: lpfc: Improve PCI EEH Error and Recovery Handling

[martin.petersen] scsi: lpfc: Fix unload hang after back to back PCI EEH faults

[martin.petersen] scsi: lpfc: Fix queue failures when recovering from PCI parity error

[martin.petersen] scsi: lpfc: Update lpfc version to 14.2.0.1

[martin.petersen] scsi: lpfc: Fix broken SLI4 abort path

[martin.petersen] scsi: lpfc: Fix locking for lpfc_sli_iocbq_lookup()

[martin.petersen] scsi: ufs: core: Remove unused field in struct ufs_hba

[martin.petersen] scsi: core: scsi_logging: Fix a BUG

[martin.petersen] scsi: pmcraid: Remove the PMCRAID_PASSTHROUGH_IOCTL ioctl implementation

[martin.petersen] scsi: sr: Fix typo in CDROM(CLOSETRAY|EJECT) handling

[martin.petersen] scsi: ibmvscsis: Increase INITIAL_SRP_LIMIT to 1024

[martin.petersen] scsi: aha152x: Stop using struct scsi_pointer

[martin.petersen] scsi: core: Fix sbitmap depth in scsi_realloc_sdev_budget_map()

[martin.petersen] scsi: isci: Fix spelling mistake "doesnt" -> "doesn't"

[martin.petersen] scsi: virtio-scsi: Eliminate anonymous module_init & module_exit

[martin.petersen] scsi: hisi_sas: Remove stray fallthrough annotation

[martin.petersen] scsi: core: sysfs: Remove comments that conflict with the actual logic

[martin.petersen] scsi: ufs: qcom: Drop custom Android boot parameters

[martin.petersen] scsi: aic7xxx: Use standard PCI subsystem, subdevice defines

[martin.petersen] scsi: zorro7xx: Fix a resource leak in zorro7xx_remove_one()

[martin.petersen] scsi: bnx2fc: Fix spelling mistake "mis-match" -> "mismatch"

[martin.petersen] scsi: bnx2i: Fix spelling mistake "mis-match" -> "mismatch"

[maxime] drm: of: Properly try all possible cases for bridge/panel detection

[mst] Revert "virtio: use virtio_device_ready() in virtio_device_restore()"

[mst] Revert "virtio_config: introduce a new .enable_cbs method"

[mst] vdpa: mlx5: prevent cvq work from hogging CPU

[mst] vdpa: mlx5: synchronize driver status with CVQ

[daniel] bpftool: Explicit errno handling in skeletons

[daniel] bpf: Fix sparse warnings in kprobe_multi_resolve_syms

[daniel] selftests/bpf: Fix warning comparing pointer to 0

[ast] rethook: Fix to use WRITE_ONCE() for rethook:: Handler

[ast] bpf: Resolve to prog->aux->dst_prog->type only for BPF_PROG_TYPE_EXT

[ast] bpf: selftests: Test fentry tracing a struct_ops program

[mpe] powerpc/numa: Handle partially initialized numa nodes

[chuck.lever] nfsd: Fix a write performance regression

[chuck.lever] nfsd: Clean up nfsd_file_put()

[keescook] uapi/linux/stddef.h: Add include guards

[kvalo] ath9k: Properly clear TX status area before reporting to mac80211

[kvalo] MAINTAINERS: claim include/uapi/linux/wireless.h

[kvalo] MAINTAINERS: mark wil6210 as orphan

[davem] net: sfc: add missing xdp queue reinitialization

[davem] net/tls: fix slab-out-of-bounds bug in decrypt_internal

[davem] vrf: fix packet sniffing for traffic originating from ip tunnels

[davem] skbuff: fix coalescing for page_pool fragment recycling

[davem] Revert "net: dsa: stop updating master MTU from master.c"

[davem] ice: Clear default forwarding VSI during VSI release

[davem] ice: Fix MAC address setting

[davem] ice: Fix broken IFF_ALLMULTI handling

[davem] mctp: Fix check for dev_hard_header() result

[davem] mctp i2c: correct mctp_i2c_header_create result

[davem] mctp: Use output netdev to allocate skb headroom

[davem] net: micrel: fix KS8851_MLL Kconfig

[davem] net: ipv4: fix route with nexthop object delete warning

[davem] selftests: net: add delete nexthop route warning test

[kuba] net/fungible: Fix reference to __udivdi3 on 32b builds

[kuba] net: stmmac: Fix unset max_speed difference between DT and non-DT platforms

[davem] docs: net: dsa: fix minor grammar and punctuation issues

[davem] selftests: net: fix nexthop warning cleanup double ip typo

[mpe] KVM: PPC: Move kvmhv_on_pseries() into kvm_ppc.h

[axboe] io_uring: don't check req->file in io_fsync_prep()

[damien.lemoal] ata: libata-sff: Fix compilation warning in ata_sff_lost_interrupt()

[damien.lemoal] ata: sata_dwc_460ex: Fix crash due to OOB write

[damien.lemoal] ata: libata-core: Disable READ LOG DMA EXT for Samsung 840 EVOs

[sudeep.holla] firmware: arm_scmi: Remove clear channel call on the TX channel

[sudeep.holla] ARM: vexpress/spc: Avoid negative array index when !SMP

[p.zabel] drm/imx: imx-ldb: Check for null pointer after calling kmemdup

[p.zabel] drm/imx: Fix memory leak in imx_pd_connector_get_modes

[p.zabel] drm/imx: dw_hdmi-imx: Fix bailout in error cases of probe

[p.zabel] gpu: ipu-v3: Fix dev_dbg frequency output

[broonie] regulator: wm8994: Add an off-on delay for WM8994 variant

[broonie] regulator: rtq2134: Fix missing active_discharge_on setting

[broonie] spi: rpc-if: Fix RPM imbalance in probe error path

[broonie] spi: mxic: Fix an error handling path in mxic_spi_probe()

[broonie] regulator: atc260x: Fix missing active_discharge_on setting

[gregkh] tty: serial: mpc52xx_uart: make rx/tx hooks return unsigned, part II.

[will] Revert "arm64: Change elfcore for_each_mte_vma() to use VMA iterator"

[will] arm64: mte: Fix the stack frame size warning in mte_dump_tag_range()

[p.zabel] dt-bindings: reset: document deprecated HiSilicon property

[p.zabel] reset: renesas: Check return value of reset_control_deassert()

[p.zabel] reset: tegra-bpmp: Restore Handle errors in BPMP response

[will] arch/arm64: Fix topology initialization for core scheduling

[will] arm64: fix typos in comments

[will] arm64: Fix comments in macro __init_el2_gicv3

[p.zabel] dt-bindings: reset: Add parent "resets" property as optional

[will] perf: qcom_l2_pmu: fix an incorrect NULL check on list iterator

[will] perf: MARVELL_CN10K_DDR_PMU should depend on ARCH_THUNDER

[ulf.hansson] Revert "mmc: sdhci-xenon: fix annoying 1.8V regulator warning"

[ulf.hansson] mmc: mmci: stm32: correctly check all elements of sg list

[ulf.hansson] mmc: block: Check for errors after write on SPI

[ulf.hansson] mmc: core: Fixup support for writeback-cache for eMMC and SD

[davem] dt-bindings: net: micrel: Revert latency support and timestamping check

[davem] net: phy: micrel: Remove latency from driver

[davem] net: phy: micrel: Remove DT option lan8814,ignore-ts

[davem] qed: fix ethtool register dump

[davem] bnxt_en: Synchronize tx when xdp redirects happen on same ring

[davem] bnxt_en: reserve space inside receive page for skb_shared_info

[davem] bnxt_en: Prevent XDP redirect from running when stopping TX queue

[ulf.hansson] mmc: renesas_sdhi: special 4tap settings only apply to HS400

[davem] stmmac: dwmac-loongson: change loongson_dwmac_driver from global to static

[davem] sfc: Do not free an empty page_ring

[brgl] gpio: Restrict usage of GPIO chip irq members before initialization

[hdegoede] platform/x86: think-lmi: certificate support clean ups

[jgg] MAINTAINERS: Add Leon Romanovsky to RDMA maintainers

[jgg] MAINTAINERS: Update qib and hfi1 related drivers

[jgg] RDMA/mlx5: Don't remove cache MRs when a delay is needed

[jgg] RDMA/mlx5: Add a missing update of cache->last_add

[jgg] IB/cm: Cancel mad on the DREQ event when the state is MRA_REP_RCVD

[krzysztof.kozlowski] dt-bindings: update Krzysztof Kozlowski's email

[krzysztof.kozlowski] MAINTAINERS: update Krzysztof Kozlowski's email to Linaro

[hdegoede] platform/x86: samsung-laptop: Fix an unsigned comparison which can never be negative

[hdegoede] platform/x86: barco-p50-gpio: Fix duplicate included linux/io.h

[hdegoede] Documentation/ABI: sysfs-driver-intel_sdsi: Fix sphinx warnings

[hdegoede] Documentation/ABI: sysfs-class-firmware-attributes: Fix Sphinx errors

[hdegoede] Documentation/ABI: sysfs-class-firmware-attributes: Misc. cleanups

[hdegoede] platform/x86: acerhdf: Cleanup str_starts_with()

[hdegoede] platform/x86: amd-pmc: Fix compilation without CONFIG_SUSPEND

[arnd] ARM: davinci: da850-evm: Avoid NULL pointer dereference

[gregkh] staging: r8188eu: Fix PPPoE tag insertion on little endian systems

[gregkh] habanalabs: Fix test build failures

[arnd] ARM: iop32x: include iop3xx.h header where needed

[krzysztof.kozlowski] memory: renesas-rpc-if: fix platform-device leak in error path

[krzysztof.kozlowski] memory: atmel-ebi: Fix missing of_node_put in atmel_ebi_probe

[krzysztof.kozlowski] dt-bindings: memory: snps,ddrc-3.80a compatible also need interrupts

[stfrench] cifs: fix potential race with cifsd thread

[stfrench] cifs: remove check of list iterator against head past the loop body

[kvalo] Revert "ath11k: mesh: add support for 256 bitmap in blockack frames in 11ax"

[Jason] random: do not split fast init input in add_hwgenerator_randomness()

[bp] x86/mm/tlb: Revert retpoline avoidance approach

[jgg] IB/rdmavt: add lock to call to rvt_error_qp to prevent a race condition

[skhan] Documentation: kunit: fix path to .kunitconfig in start.rst

[robh] dt-bindings: extcon: maxim,max77843: fix ports type

[robh] dt-bindings: power: renesas,apmu: Fix cpus property limits

[rafael.j.wysocki] Revert "ACPI: processor: idle: Only flush cache on entering C3"

[robh] dt-bindings: Fix incomplete if/then/else schemas

[robh] dt-bindings: irqchip: mrvl,intc: refresh maintainers

[robh] dt-bindings: Fix 'enum' lists with duplicate entries

[skhan] selftests/vDSO: fix array_size.cocci warning

[skhan] selftests/proc: fix array_size.cocci warning

[skhan] selftests: x86: add 32bit build warnings for SUSE

[skhan] selftests: fix header dependency for pid_namespace selftests

[skhan] selftests: fix an unused variable warning in pidfd selftest

[skhan] selftests/harness: Run TEARDOWN for ASSERT failures

[skhan] selftests/harness: Pass variant to teardown

[sudeep.holla] firmware: arm_scmi: Fix sorting of retrieved clock rates

[sudeep.holla] firmware: arm_scmi: Replace zero-length array with flexible-array member

[sudeep.holla] firmware: arm_scmi: Fix sparse warnings in OPTEE transport driver

[kherbst] drm/nouveau/pmu: Add missing callbacks for Tegra devices

[axboe] io_uring: defer splice/tee file validity check until command issue

[axboe] io_uring: move read/write file prep state into actual opcode handler

[stfrench] cifs: force new session setup and tcon for dfs

[stfrench] cifs: update internal module number

[pabeni] sctp: count singleton chunks in assoc user stats

[maxime] dt-bindings: display: bridge: Drop requirement on input port for DSI devices

[peterz] sched/core: Fix forceidle balancing

[peterz] sched: Teach the forced-newidle balancer about CPU affinity limitation.

[peterz] entry: Fix compile error in dynamic_irqentry_exit_cond_resched()

[peterz] x86,static_call: Fix __static_call_return0 for i386

[peterz] static_call: Don't make __static_call_return0 static

[peterz] static_call: Properly initialise DEFINE_STATIC_CALL_RET0()

[peterz] static_call: Remove __DEFINE_STATIC_CALL macro

[peterz] x86/percpu: Remove volatile from arch_raw_cpu_ptr().

[peterz] Revert "locking/local_lock: Make the empty local_lock_*() function a macro."

[peterz] Revert "mm/page_alloc: mark pagesets as __maybe_unused"

[peterz] perf/x86: Add Intel Raptor Lake support

[peterz] perf/x86/cstate: Add Raptor Lake support

[peterz] perf/x86/msr: Add Raptor Lake CPU support

[peterz] perf/x86/uncore: Add Raptor Lake uncore support

[peterz] perf/core: Inherit event_caps

[peterz] perf/x86/intel: Don't extend the pseudo-encoding to GP counters

[peterz] perf/x86/intel: Update the FRONTEND MSR mask on Sapphire Rapids

[peterz] perf/core: Don't pass task around when ctx sched in

[peterz] perf/core: Use perf_cgroup_info->active to check if cgroup is active

[peterz] perf/core: Fix perf_cgroup_switch()

[peterz] perf/core: Always set cpuctx cgrp when enable cgroup event

[peterz] x86/bug: Prevent shadowing in __WARN_FLAGS

[peterz] objtool: Fix IBT tail-call detection

[peterz] objtool: Fix SLS validation for kcov tail-call replacement

[pablo] netfilter: nf_tables: memcg accounting for dynamically allocated objects

[pabeni] dpaa2-ptp: Fix refcount leak in dpaa2_ptp_probe

[pabeni] ice: Set txq_teid to ICE_INVAL_TEID on ring creation

[pabeni] ice: Do not skip not enabled queues in ice_vc_dis_qs_msg

[pabeni] ipv6: Fix stats accounting in ip6_pkt_drop

[pbonzini] KVM: SEV: Add cond_resched() to loop in sev_clflush_pages()

[pbonzini] KVM: x86/mmu: Resolve nx_huge_pages when kvm.ko is loaded

[pbonzini] KVM: x86/mmu: remove unnecessary flush_workqueue()

[pbonzini] Documentation: kvm: Add missing line break in api.rst

[gregkh] powerpc/pseries/vas: use default_groups in kobj_type

[gregkh] kobject: kobj_type: remove default_attrs

[Jason] random: opportunistically initialize on /dev/urandom reads

[Mauro Carvalho Chehab] media: rockchip/rga: do proper error checking in probe

[maz] irq/qcom-mpm: Fix build error without MAILBOX

[maz] irqchip/irq-qcom-mpm: fix return value check in qcom_mpm_init()

[maz] irqchip/gic-v4: Wait for GICR_VPENDBASER.Dirty to clear before descheduling

[maz] irqchip/gic-v3: Fix GICR_CTLR.RWP polling

[maz] irqchip/gic, gic-v3: Prevent GSI to SGI translations

[anthony.l.nguyen] ice: synchronize_rcu() when terminating rings

[anthony.l.nguyen] ice: xsk: fix VSI state check in ice_xsk_wakeup()

[anthony.l.nguyen] ice: clear cmd_type_offset_bsz for TX rings

[tiwai] ALSA: hda/i915 - skip acomp init if no matching display

[tiwai] ALSA: usb-audio: Fix undefined behavior due to shift overflowing the constant

[torvalds] x86/pm: Save the MSR validity status at context setup

[torvalds] x86/speculation: Restore speculation related MSRs during S3 resume

[rafael.j.wysocki] ACPI: bus: Eliminate acpi_bus_get_device()

[dsterba] btrfs: zoned: remove redundant condition in btrfs_run_delalloc_range

[dsterba] btrfs: remove unused variable in btrfs_{start,write}_dirty_block_groups()

[dsterba] btrfs: release correct delalloc amount in direct IO write path

[dsterba] btrfs: remove support of balance v1 ioctl

[dsterba] btrfs: mark resumed async balance as writing

[dsterba] btrfs: return allocated block group from do_chunk_alloc()

[dsterba] btrfs: zoned: activate block group only for extent allocation

[dsterba] btrfs: fix root ref counts in error handling in btrfs_get_root_ref

[dsterba] btrfs: fix btrfs_submit_compressed_write cgroup attribution

[linus.walleij] ARM: config: Refresh U8500 defconfig

[Mauro Carvalho Chehab] media: platform: imx-mipi-csis: Add dependency on VIDEO_DEV

[kuba] net: micrel: Fix KS8851 Kconfig

[kuba] net: openvswitch: don't send internal clone attribute to the userspace.

[kuba] net: ethernet: mv643xx: Fix over zealous checking of_get_mac_address()

[damien.lemoal] ata: ahci: Rename CONFIG_SATA_LPM_POLICY configuration item back

[krzysztof.kozlowski] memory: fsl_ifc: populate child nodes of buses and mfd devices

[linus.walleij] ARM: config: u8500: Add some common hardware

[maz] KVM: arm64: Generally disallow SMC64 for AArch32 guests

[maz] KVM: arm64: Actually prevent SMC64 SYSTEM_RESET2 from AArch32

[maz] KVM: arm64: Drop unneeded minor version check from PSCI v1.x handler

[maz] KVM: arm64: Don't split hugepages outside of MMU write lock

[maz] KVM: arm64: vgic: Remove unnecessary type castings

[will] arm64: alternatives: mark patch_alternative() as `noinstr`

[hca] s390: add z16 elf platform

[hca] s390: allow to compile with z16 optimizations

[maz] KVM: arm64: mixed-width check should be skipped for uninitialized vCPUs

[maz] KVM: arm64: selftests: Introduce vcpu_width_config

[will] tlb: hugetlb: Add more sizes to tlb_remove_huge_tlb_entry

[davem] net: openvswitch: fix leak of nested actions

[linus.walleij] ARM: config: u8500: Re-enable AB8500 battery charging

[davem] rxrpc: fix a race in rxrpc_exit_net()

[davem] net: sfc: fix using uninitialized xdp tx_queue

[davem] net: axienet: setup mdio unconditionally

[davem] net: axienet: factor out phy_node in struct axienet_local

[davem] dt-bindings: net: add pcs-handle attribute

[davem] net: axiemac: use a phandle to reference pcs_phy

[davem] net: phy: mscc-miim: reject clause 45 register accesses

[Jason] random: do not allow user to keep crng key around on stack

[Jason] random: check for signal_pending() outside of need_resched() check

[wei.liu] Drivers: hv: balloon: Support status report for larger page sizes

[wei.liu] Drivers: hv: balloon: Disable balloon and hot-add accordingly

[wei.liu] Drivers: hv: vmbus: Replace smp_store_mb() with virt_store_mb()

[davem] net: ipv6mr: fix unused variable warning with CONFIG_IPV6_PIMSM_V2=n

[davem] qede: confirm skb is allocated before using

[davem] net: usb: aqc111: Fix out-of-bounds accesses in RX fixup

[davem] myri10ge: fix an incorrect free for skb in myri10ge_sw_tso

[axboe] cdrom: remove unused variable

[broonie] spi: core: add dma_map_dev for __spi_unmap_msg()

[broonie] spi: cadence-quadspi: fix protocol setup for non-1-1-X operations

[broonie] spi: bcm-qspi: fix MSPI only access with bcm_qspi_exec_mem_op()

[alexander.deucher] drm/amdgpu/vcn3: send smu interface type

[alexander.deucher] drm/amd/vcn: fix an error msg on vcn 3.0

[alexander.deucher] drm/amd/display: Correct Slice reset calculation

[alexander.deucher] drm/amd/display: Remove redundant dsc power gating from init_hw

[alexander.deucher] drm/amd/display: Enable power gating before init_pipes

[alexander.deucher] drm/amd/display: Clear optc false state when disable otg

[alexander.deucher] drm/amd/display: Add work around for AUX failure on wake.

[alexander.deucher] drm/amd/display: Revert FEC check in validation

[alexander.deucher] drm/amd/display: Fix allocate_mst_payload assert on resume

[alexander.deucher] amd/display: set backlight only if required

[alexander.deucher] drm/amdgpu: fix incorrect GCR_GENERAL_CNTL address

[alexander.deucher] drm/amdgpu: Sync up header and implementation to use the same parameter names

[alexander.deucher] drm/amdkfd: Create file descriptor after client is added to smi_clients list

[alexander.deucher] drm/amd/display: Fix by adding FPU protection for dcn30_internal_validate_bw

[alexander.deucher] drm/amdgpu: don't use BACO for reset in S3

[alexander.deucher] drm/amd/display: remove assert for odm transition case

[alexander.deucher] drm/amd/display: Add configuration options for AUX wake work around.

[alexander.deucher] drm/amdgpu/display: change pipe policy for DCN 2.1

[alexander.deucher] drm/amd/display: update dcn315 clock table read

[alexander.deucher] drm/amdgpu/smu10: fix SoC/fclk units in auto mode

[robdclark] drm/msm/disp: check the return value of kzalloc()

[robdclark] drm/msm/dpu: Use indexed array initializer to prevent mismatches

[ast] bpf: Support dual-stack sockets in bpf_tcp_check_syncookie

[ast] bpf: Adjust bpf_tcp_check_syncookie selftest to test dual-stack sockets

[pbonzini] KVM: avoid NULL pointer dereference in kvm_dirty_ring_push

[robh] dt-bindings: net: snps: remove duplicate name

[chuck.lever] SUNRPC: Fix NFSD's request deferral on RDMA transports

[axboe] drbd: Fix five use after free bugs in get_initial_state

[axboe] drbd: fix an invalid memory access caused by incorrect use of list iterator

[axboe] drbd: set QUEUE_FLAG_STABLE_WRITES

[tzimmermann] fbdev: Fix unregistering of framebuffers without device

[robh] dt-bindings: gpu: mali-bifrost: Document RZ/V2L SoC

[mpe] powerpc: Fix virt_addr_valid() for 64-bit Book3E & 32-bit

[mpe] Revert "powerpc: Set max_mapnr correctly"

[Jason] random: check for signals every PAGE_SIZE chunk of /dev/[u]random

[marex] dt-bindings: display: panel: mipi-dbi-spi: Make width-mm/height-mm mandatory

[martin.petersen] scsi: scsi_debug: Fix sdebug_blk_mq_poll() in_use_bm bitmap use

[martin.petersen] scsi: mpt3sas: Fix mpt3sas_check_same_4gb_region() kdoc comment

[martin.petersen] scsi: ufs: ufs-pci: Add support for Intel MTL

[martin.petersen] scsi: sym53c500_cs: Stop using struct scsi_pointer

[martin.petersen] scsi: mpt3sas: Fail reset operation if config request timed out

[martin.petersen] scsi: sd: sd_read_cpr() requires VPD pages

[martin.petersen] scsi: mvsas: Add PCI ID of RocketRaid 2640

[martin.petersen] scsi: message: fusion: Remove redundant variable dmp

[martin.petersen] scsi: sd: Clean up gendisk if device_add_disk() failed

[martin.petersen] scsi: ufs: ufshpb: Fix a NULL check on list iterator

[martin.petersen] scsi: megaraid_sas: Target with invalid LUN ID is deleted during scan

[kuba] drivers: net: slip: fix NPD bug in sl_tx_timeout()

[maz] KVM: selftests: get-reg-list: Add KVM_REG_ARM_FW_REG(3)

[maz] KVM: Don't create VM debugfs files outside of the VM directory

[maz] selftests: KVM: Don't leak GIC FD across dirty log test iterations

[maz] selftests: KVM: Free the GIC FD when cleaning up in arch_timer

[tiwai] ALSA: hda/realtek: Add quirk for Clevo PD50PNT

[tiwai] sound/oss/dmasound: fix build when drivers are mixed =y/=m

[tiwai] ALSA: hda: intel-dsp-config: update AlderLake PCI IDs

[peterz] x86,bpf: Avoid IBT objtool warning

[peterz] x86/extable: Prefer local labels in .set directives

[sudeep.holla] ARM: vexpress/spc: Fix kernel-doc build warning for ve_spc_cpu_in_wfi

[sudeep.holla] ARM: vexpress/spc: Fix all the kernel-doc build warnings

[hca] s390/kexec: silence -Warray-bounds warning

[ulf.hansson] mmc: renesas_sdhi: don't overwrite TAP settings when HS400 tuning is complete

[arnd] ep93xx: clock: Fix UAF in ep93xx_clk_register_gate()

[arnd] ep93xx: clock: Don't use plain integer as NULL pointer

[arnd] arm: configs: imote2: Drop defconfig as board support dropped.

[arnd] arm: dts: at91: Fix boolean properties with values

[arnd] arm64: dts: tegra: Fix boolean properties with values

[arnd] arm: dts: imx: Fix boolean properties with values

[arnd] arm64: dts: imx: Fix imx8*-var-som touchscreen property sizes

[arnd] arm/arm64: dts: qcom: Fix boolean properties with values

[tglx] x86/msi: Fix msi message data shadow struct

[willy] mm/huge_memory: Avoid calling pmd_page() on a non-leaf PMD

[willy] mm/migrate: Use a folio in alloc_migration_target()

[willy] mm/migrate: Use a folio in migrate_misplaced_transhuge_page()

[willy] mm: Add vma_alloc_folio()

[willy] mm/mempolicy: Use vma_alloc_folio() in new_page()

[willy] mm/rmap: Fix handling of hugetlbfs pages in page_vma_mapped_walk

[chuck.lever] SUNRPC: Fix the svc_deferred_event trace class

[axboe] io_uring: propagate issue_flags state down to file assignment

[axboe] io_uring: defer file assignment

[axboe] io_uring: drop the old style inflight file tracking

[axboe] Revert "io_uring: Add support for napi_busy_poll"

[axboe] io_uring: implement compat handling for IORING_REGISTER_IOWQ_AFF

[axboe] io_uring: nospec index for tags on files update

[axboe] io_uring: don't touch scm_fp_list after queueing skb

[axboe] io_uring: zero tag on rsrc removal

[axboe] io_uring: use nospec annotation for more indexes

[boris.ostrovsky] xen/balloon: don't use PV mode extra memory for zone device allocations

[trond.myklebust] NFS: Replace readdir's use of xxhash() with hash_64()

[trond.myklebust] SUNRPC: Ensure we flush any closed sockets before xs_xprt_free()

[trond.myklebust] NFSv4.2: Fix missing removal of SLAB_ACCOUNT on kmem_cache allocation

[trond.myklebust] SUNRPC: Handle ENOMEM in call_transmit_status()

[trond.myklebust] SUNRPC: Handle low memory situations in call_status()

[trond.myklebust] NFSv4/pnfs: Handle RPC allocation errors in nfs4_proc_layoutget

[trond.myklebust] NFS: Ensure rpc_run_task() cannot fail in nfs_async_rename()

[trond.myklebust] SUNRPC: Handle allocation failure in rpc_new_task()

[trond.myklebust] SUNRPC: svc_tcp_sendmsg() should handle errors from xdr_alloc_bvec()

[trond.myklebust] SUNRPC: Move the call to xprt_send_pagedata() out of xprt_sock_sendmsg()

[ulf.hansson] mmc: core: improve API to make clear mmc_hw_reset is for cards

[jroedel] iommu/omap: Fix regression in probe for NULL pointer dereference

[will] arm64: patch_text: Fixup last cpu should be master

[will] arm64: Add part number for Arm Cortex-A78AE

[davem] dt-bindings: net: ave: Clean up clocks, resets, and their names using compatible string

[davem] dt-bindings: net: ave: Use unevaluatedProperties

[davem] net/sched: flower: fix parsing of ethertype following VLAN header

[broonie] MAINTAINERS: Fix reviewer info for a few ROHM ICs

[davem] bonding: Update layer2 and layer2+3 hash formula documentation

[davem] veth: Ensure eth header is in skb's linear part

[davem] flow_dissector: fix false-positive __read_overflow2_field() warning

[davem] vxlan: fix error return code in vxlan_fdb_append

[andriy.shevchenko] gpiolib: acpi: use correct format characters

[andriy.shevchenko] gpiolib: acpi: Convert type for pin to be unsigned

[tiwai] ALSA: usb-audio: Cap upper limits of buffer/period bytes for implicit fb

[tiwai] ALSA: usb-audio: Increase max buffer size

[will] perf/imx_ddr: Fix undefined behavior due to shift overflowing the constant

[stfrench] cifs: Check the IOCB_DIRECT flag, not O_DIRECT

[stfrench] cifs: release cached dentries only if mount is complete

[anthony.l.nguyen] ice: arfs: fix use-after-free when freeing @rx_cpu_rmap

[anthony.l.nguyen] Revert "iavf: Fix deadlock occurrence during resetting VF interface"

[jgg] RDMA/hfi1: Fix use-after-free bug for mm struct

[dan.j.williams] tools/testing/nvdimm: Fix security_init() symbol collision

[dan.j.williams] cxl/pci: Drop shadowed variable

[axboe] io_uring: fix race between timeout flush and removal

[kuba] net: mdio: don't defer probe forever if PHY IRQ provider is missing

[kuba] mlxsw: i2c: Fix initialization error flow

[kuba] sctp: use the correct skb for security_sctp_assoc_request

[kuba] net/sched: fix initialization order when updating chain 0 head

[dhowells] cachefiles: unmark inode in use in error path

[dhowells] cachefiles: Fix KASAN slab-out-of-bounds in cachefiles_set_volume_xattr

[dhowells] docs: filesystems: caching/backend-api.rst: correct two relinquish APIs use

[dhowells] docs: filesystems: caching/backend-api.rst: fix an object withdrawn API

[dhowells] fscache: Remove the cookie parameter from fscache_clear_page_bits()

[dhowells] fscache: Move fscache_cookies_seq_ops specific code under CONFIG_PROC_FS

[dhowells] fscache: Use wrapper fscache_set_cache_state() directly when relinquishing

[dhowells] fscache: remove FSCACHE_OLD_API Kconfig option

[torvalds] mm: migrate: use thp_order instead of HPAGE_PMD_ORDER for new page allocation.

[torvalds] highmem: fix checks in __kmap_local_sched_{in,out}

[torvalds] lz4: fix LZ4_decompress_safe_partial read out of bound

[torvalds] mm/sparsemem: fix 'mem_section' will never be NULL gcc 12 warning

[torvalds] mmmremap.c: avoid pointless invalidate_range_start/end on mremap(old_size=0)

[torvalds] mm/mempolicy: fix mpol_new leak in shared_policy_replace

[torvalds] mailmap: update Vasily Averin's email address

[torvalds] mm/list_lru.c: revert "mm/list_lru: optimize memcg_reparent_list_lru_node()"

[torvalds] MAINTAINERS: add Tom as clang reviewer

[stfrench] cifs: Split the smb3_add_credits tracepoint

[kuba] net: dsa: felix: suppress -EPROBE_DEFER errors

[kuba] net: atlantic: Avoid out-of-bounds indexing

[anup] RISC-V: KVM: Don't clear hgatp CSR in kvm_arch_vcpu_put()

[anup] KVM: selftests: riscv: Set PTE A and D bits in VS-stage page table

[anup] KVM: selftests: riscv: Fix alignment of the guest_hang() function

[anup] RISC-V: KVM: include missing hwcap.h into vcpu_fp

[acme] tools include UAPI: Sync linux/vhost.h with the kernel sources

[acme] tools build: Use $(shell ) instead of `` to get embedded libperl's ccopts

[acme] tools build: Filter out options and warnings not supported by clang

[acme] perf python: Fix probing for some clang command line options

[acme] perf build: Don't use -ffat-lto-objects in the python feature test when building with clang-13

[acme] perf test tsc: Fix error message when not supported

[acme] tools headers arm64: Sync arm64's cputype.h with the kernel sources

[acme] perf unwind: Don't show unwind error messages when augmenting frame pointer stack

[acme] perf: arm-spe: Fix perf report --mem-mode

[acme] perf tools: Fix perf's libperf_print callback

[acme] perf bench: Fix futex bench to correct usage of affinity for machines with #CPUs > 1K

[acme] perf bench: Fix epoll bench to correct usage of affinity for machines with #CPUs > 1K

[Mauro Carvalho Chehab] media: si2157: unknown chip version Si2147-A30 ROM 0x50

[acme] perf session: Remap buf if there is no space for event

[acme] perf docs: Add perf-iostat link to manpages

[acme] perf tools: Add external commands to list-cmds

[acme] perf annotate: Drop objdump stderr to avoid getting stuck waiting for stdout output

[tglx] timers: Fix warning condition in __run_timers()

[tglx] tick/nohz: Use WARN_ON_ONCE() to prevent console saturation

[tglx] tick/sched: Fix non-kernel-doc comment

[kvalo] mt76: Fix undefined behavior due to shift overflowing the constant

[kvalo] brcmfmac: sdio: Fix undefined behavior due to shift overflowing the constant

[kvalo] ath9k: Fix usage of driver-private space in tx_info

[hca] s390: update defconfigs

[torvalds] Linux 5.18-rc2

[axboe] io_uring: flag the fact that linked file assignment is sane

[joonas.lahtinen] drm/i915: Sunset igpu legacy mmap support based on GRAPHICS_VER_FULL

[tiwai] ALSA: pcm: Test for "silence" field in struct "pcm_format_data"

[tiwai] ALSA: hda/realtek: add quirk for Lenovo Thinkpad X12 speakers

[bp] x86/tsx: Use MSR_TSX_CTRL to clear CPUID bits

[tglx] genirq/affinity: Consider that CPUs on nodes can be unbalanced

[bp] x86/tsx: Disable TSX development mode at boot

[davem] net: phy: LAN87xx: remove genphy_softreset in config_aneg

[davem] net: ethernet: stmmac: fix altr_tse_pcs function when using a fixed-link

[davem] net/sched: taprio: Check if socket flags are valid

[johannes.berg] nl80211: correctly check NL80211_ATTR_REG_ALPHA2 size

[johannes.berg] cfg80211: hold bss_lock while updating nontrans_list

[johannes.berg] mac80211: fix ht_capa printout in debugfs

[pablo] netfilter: nft_socket: make cgroup match work in input too

[davem] dpaa_eth: Fix missing of_node_put in dpaa_get_ts_info()

[davem] ipv6: fix panic when forwarding a pkt with no in6 dev

[robdclark] drm/msm: Fix range size vs end confusion

[robdclark] drm/msm/mdp5: check the return of kzalloc()

[robdclark] drm/msm: Stop using iommu_present()

[robdclark] drm/msm/dsi: Use connector directly in msm_dsi_manager_connector_init()

[robdclark] drm/msm/dp: add fail safe mode outside of event_mutex context

[pbonzini] selftests: kvm: add tsc_scaling_sync to .gitignore

[pbonzini] Documentation: KVM: Add SPDX-License-Identifier tag

[pbonzini] KVM: SVM: Do not activate AVIC for SEV-enabled guest

[pbonzini] KVM: x86: hyper-v: Avoid writing to TSC page without an active vCPU

[axboe] io_uring: io_kiocb_update_pos() should not touch file for non -1 offset

[axboe] io_uring: move apoll->events cache

[axboe] io_uring: stop using io_wq_work as an fd placeholder

[kuba] net: macb: Restart tx only if queue pointer is lagging

[axboe] block: move lower_48_bits() to block

[kuba] net/smc: use memcpy instead of snprintf to avoid out of bounds read

[kuba] net/smc: Fix NULL pointer dereference in smc_pnet_find_ib()

[kuba] net/smc: Fix af_ops of child socket pointing to released memory

[robdclark] drm/msm/gpu: Avoid -Wunused-function with !CONFIG_PM_SLEEP

[martin.petersen] Revert "scsi: scsi_debug: Address races following module load"

[martin.petersen] scsi: pm80xx: Mask and unmask upper interrupt vectors 32-63

[martin.petersen] scsi: pm80xx: Enable upper inbound, outbound queues

[martin.petersen] scsi: iscsi: Move iscsi_ep_disconnect()

[martin.petersen] scsi: iscsi: Fix offload conn cleanup when iscsid restarts

[martin.petersen] scsi: iscsi: Release endpoint ID when its freed

[martin.petersen] scsi: iscsi: Fix endpoint reuse regression

[martin.petersen] scsi: iscsi: Fix conn cleanup and stop race during iscsid restart

[martin.petersen] scsi: iscsi: Fix unbound endpoint error handling

[martin.petersen] scsi: iscsi: Merge suspend fields

[martin.petersen] scsi: iscsi: Fix NOP handling during conn recovery

[martin.petersen] scsi: qedi: Fix failed disconnect handling

[martin.petersen] scsi: iscsi: MAINTAINERS: Add Mike Christie as co-maintainer

[kuba] sctp: Initialize daddr on peeled off socket

[kuba] net: lan966x: Update lan966x_ptp_get_nominal_value

[kuba] net: lan966x: Fix IGMP snooping when frames have vlan tag

[kuba] net: lan966x: Fix when a port's upper is changed.

[kuba] net: lan966x: Stop processing the MAC entry is port is wrong.

[pablo] netfilter: nf_tables: nft_parse_register can return a negative value

[tiwai] ALSA: core: Add snd_card_free_on_error() helper

[tiwai] ALSA: echoaudio: Fix the missing snd_card_free() call at probe error

[hca] s390: current_stack_pointer shouldn't be a function

[hca] s390: enable CONFIG_HARDENED_USERCOPY in debug_defconfig

[axboe] io_uring: fix assign file locking issue

[tiwai] ALSA: galaxy: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: sc6000: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: ad1889: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: ali5451: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: als4000: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: atiixp: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: au88x0: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: azt3328: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: ca0106: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: cs4281: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: cs5535audio: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: emu10k1x: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: ens137x: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: es1938: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: es1968: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: fm801: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: ice1724: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: intel8x0: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: korg1212: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: maestro3: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: riptide: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: rme32: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: rme96: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: sonicvibes: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: via82xx: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: intel_hdmi: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: sis7019: Fix the missing error handling

[tiwai] ALSA: bt87x: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: lola: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: als300: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: aw2: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: cmipci: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: lx6464es: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: oxygen: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: hdsp: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: hdspm: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: rme9652: Fix the missing snd_card_free() call at probe error

[tiwai] ALSA: mtpav: Don't call card private_free at probe error path

[tiwai] ALSA: nm256: Don't call card private_free at probe error path

[axboe] io_uring: move io_uring_rsrc_update2 validation

[axboe] io_uring: verify that resv2 is 0 in io_uring_rsrc_update2

[axboe] io_uring: verify resv is 0 in ringfd register/unregister

[axboe] io_uring: verify pad field is 0 in io_get_ext_arg

[keescook] gcc-plugins: latent_entropy: use /dev/urandom

[skhan] testing/selftests/mqueue: Fix mq_perf_tests to free the allocated cpu set

[axboe] asm-generic: fix __get_unaligned_be48() on 32 bit platforms

[torvalds] stat: fix inconsistency between struct stat and struct compat_stat

[tiwai] ALSA: memalloc: Add fallback SG-buffer allocations for x86

[tiwai] ALSA: usb-audio: Limit max buffer and period sizes per time

[acme] perf tools: Fix misleading add event PMU debug message

[sre] power: supply: samsung-sdi-battery: Add missing charge restart voltages

[sre] power: supply: Reset err after not finding static battery

[davem] macvlan: Fix leaking skb in source mode with nodst option

[davem] Revert "net: dsa: setup master before ports"

[davem] net: ftgmac100: access hardware register after clock ready

[Jason] random: allow partial reads if later user copies fail

[Jason] random: make random_get_entropy() return an unsigned long

[davem] net: dsa: realtek: fix Kconfig to assure consistent driver linkage

[davem] net: dsa: realtek: don't parse compatible string for RTL8366S

[davem] nfc: nci: add flush_workqueue to prevent uaf

[axboe] io_uring: use right issue_flags for splice/tee

[axboe] io_uring: fix poll file assign deadlock

[axboe] io_uring: fix poll error reporting

[snitzer] dm integrity: fix memory corruption when tag_size is less than digest size

[tglx] smp: Fix offline cpu check in flush_smp_call_function_queue()

[stfrench] cifs: potential buffer overflow in handling symlinks

[snitzer] dm mpath: only use ktime_get_ns() in historical selector

[snitzer] dm zone: fix NULL pointer dereference in dm_zone_map_bio

[alex.williamson] vfio/pci: Fix vf_token mechanism when device-specific VF drivers are used

[tglx] cpu/hotplug: Remove the 'cpu' member of cpuhp_cpu_state

[acme] perf stat: Fix error check return value of hashmap__new(), must use IS_ERR()

[acme] perf tools: Fix segfault accessing sample_id xyarray

[alexander.deucher] drm/amd/display: don't ignore alpha property on pre-multiplied mode

[alexander.deucher] drm/amdgpu: fix VCN 3.1.2 firmware name

[alexander.deucher] drm/amdgpu: Ensure HDA function is suspended before ASIC reset

[alexander.deucher] drm/amdgpu: Enable gfxoff quirk on MacBook Pro

[alexander.deucher] drm/amd/display: remove dtbclk_ss compensation for dcn316

[hch] dma-direct: avoid redundant memory sync for swiotlb

[stfrench] cifs: verify that tcon is valid before dereference in cifs_kill_sb

[pabeni] tun: annotate access to queue->trans_start

[pabeni] net: dsa: felix: fix tagging protocol changes with multiple CPU ports

[pabeni] rtnetlink: Fix handling of disabled L3 stats in RTM_GETSTATS replies

[pabeni] net: bcmgenet: Revert "Use stronger register read/writes to assure ordering"

[brgl] gpio: sim: fix setting and getting multiple lines

[acme] perf record: Fix per-thread option

[acme] perf bench: Fix numa testcase to check if CPU used to bind task is online

[acme] perf bench: Fix numa bench to fix usage of affinity for machines with #CPUs > 1K

[axboe] block: fix offset/size check in bio_trim()

[axboe] block: null_blk: end timed out poll request

[robh] dt-bindings: Fix array constraints on scalar properties

[arnd] ARM: dts: Fix more boolean properties with values

[arnd] ARM: dts: align SPI NOR node name with dtschema

[arnd] arm64: dts: qcom/sdm845-shift-axolotl: Fix boolean properties with values

[arnd] ARM: config: Update Gemini defconfig

[robh] dt-bindings: display: panel-timing: Define a single type for properties

[torvalds] VFS: filename_create(): fix incorrect intent.

[snitzer] dm: allow dm_accept_partial_bio() for dm_io without duplicate bios

[axboe] io_uring: abort file assignment prior to assigning creds

[hch] nvme: don't print verbose errors for internal passthrough requests

[hch] nvme: add a quirk to disable namespace identifiers

[hch] nvme-pci: disable namespace identifiers for the MAXIO MAP1002/1202

[hch] nvme-pci: disable namespace identifiers for Qemu controllers

[axboe] block/compat_ioctl: fix range check in BLKGETSIZE

[axboe] block: don't print I/O error warning for dead disks

[snitzer] dm: fix bio length of empty flush

[wsa] i2c: pasemi: Wait for write xfers to finish

[wsa] i2c: imx: Implement errata ERR007805 or e7805 bus frequency limit

[wsa] i2c: qcom-geni: Use dev_err_probe() for GPI DMA error

[wsa] i2c: dev: check return value when calling dev_set_name()

[wsa] i2c: dev: Force case user pointers in compat_i2cdev_ioctl()

[wsa] i2c: ismt: Fix undefined behavior due to shift overflowing the constant

[torvalds] MAINTAINERS: Broadcom internal lists aren't maintainers

[torvalds] tmpfs: fix regressions from wider use of ZERO_PAGE

[torvalds] mm/secretmem: fix panic when growing a memfd_secret

[torvalds] irq_work: use kasan_record_aux_stack_noalloc() record callstack

[torvalds] kasan: fix hw tags enablement when KUNIT tests are disabled

[torvalds] mm, kfence: support kmem_dump_obj() for KFENCE objects

[torvalds] mm, page_alloc: fix build_zonerefs_node()

[torvalds] mm: fix unexpected zeroed page mapping with zram swap

[torvalds] mm: compaction: fix compiler warning when CONFIG_COMPACTION=n

[torvalds] hugetlb: do not demote poisoned hugetlb pages

[torvalds] revert "fs/binfmt_elf: fix PT_LOAD p_align values for loaders"

[torvalds] revert "fs/binfmt_elf: use PT_LOAD p_align values for static PIE"

[torvalds] mm/vmalloc: fix spinning drain_vmap_work after reading from /proc/vmcore

[torvalds] mm: kmemleak: take a full lowmem check in kmemleak_*_phys()

[Jason] random: use memmove instead of memcpy for remaining 32 bytes

[torvalds] Linux 5.18-rc3

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
Started by an SCM change
Running as SYSTEM
Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/media_stage_clang/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir <https://builder.linuxtv.org/job/media_stage_clang/ws/.git> # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/media_stage.git # timeout=10
Fetching upstream changes from git://linuxtv.org/media_stage.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/media_stage.git +refs/heads/*:refs/remotes/origin/* # timeout=30
Seen branch in repository origin/master
Seen 1 remote branch
 > git show-ref --tags -d # timeout=10
Checking out Revision 3d59142ad94cf60b94b3dc94c19fdafa23aec8b1 (origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 3d59142ad94cf60b94b3dc94c19fdafa23aec8b1 # timeout=10
Commit message: "media: dvb-usb: dib0700_devices: use an enum for the device number"
 > git rev-list --no-walk 535f49a9e1f99d0bacb5d492a9dd193c3affbfc0 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 3d59142ad94cf60b94b3dc94c19fdafa23aec8b1^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/media_stage.git'
[GitCheckoutListener] Found previous build 'media_stage_clang #443' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '535f49a'
[GitCheckoutListener] -> Using head commit '3d59142' as starting point
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@10f374f4'
[GitCheckoutListener] -> Recorded 200 new commits
[media_stage_clang] $ /bin/sh -xe /tmp/jenkins8234162293492230774.sh
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make W=1 CC=clang-12 HOSTCC=clang-12 allyesconfig
#
# configuration written to .config
#
+ ./scripts/config -d MODULE_SIG -d KEYS -d IMA -d CONFIG_DEBUG_INFO -d SYSTEM_TRUSTED_KEYRING -d MODVERSIONS -d CHECK_SIGNATURE
+ make W=1 CC=clang-12 HOSTCC=clang-12 init
  SYNC    include/config/auto.conf.cmd
  UPD     include/config/kernel.release
  DESCEND objtool
  HOSTCC  scripts/selinux/genheaders/genheaders
  HOSTCC  scripts/selinux/mdp/mdp
  HDRINST usr/include/linux/io_uring.h
  HDRINST usr/include/linux/stddef.h
  UPD     include/generated/utsrelease.h
  CC      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/check.o>
  CC      scripts/mod/devicetable-offsets.s
  CC      kernel/bounds.s
  CALL    scripts/atomic/check-atomics.sh
  CC      arch/x86/kernel/asm-offsets.s
  CALL    scripts/checksyscalls.sh
  LD      <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/objtool-in.o>
  LINK    <https://builder.linuxtv.org/job/media_stage_clang/ws/tools/objtool/objtool>
  CC      init/main.o
  CHK     include/generated/compile.h
  CC      init/do_mounts_rd.o
  CC      init/do_mounts_initrd.o
  CC      init/initramfs.o
  CC      init/calibrate.o
  CC      init/init_task.o
  CC      init/do_mounts.o
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
Not sending mail to unregistered user p.zabel@pengutronix.de
Not sending mail to unregistered user ast@kernel.org
Not sending mail to unregistered user rostedt@goodmis.org
Not sending mail to unregistered user linkinjeon@kernel.org
Not sending mail to unregistered user robh@kernel.org
Not sending mail to unregistered user dmitry.torokhov@gmail.com
Not sending mail to unregistered user wsa@the-dreams.de
Not sending mail to unregistered user wei.liu@kernel.org
Not sending mail to unregistered user tglx@linutronix.de
Not sending mail to unregistered user will@kernel.org
Not sending mail to unregistered user sboyd@kernel.org
Not sending mail to unregistered user robdclark@chromium.org
Not sending mail to unregistered user arnd@arndb.de
Not sending mail to unregistered user wim@linux-watchdog.org
Not sending mail to unregistered user herbert@gondor.apana.org.au
Not sending mail to unregistered user djwong@kernel.org
Not sending mail to unregistered user sre@kernel.org
Not sending mail to unregistered user dan.j.williams@intel.com
Not sending mail to unregistered user kuba@kernel.org
Not sending mail to unregistered user axboe@kernel.dk
Not sending mail to unregistered user daniel@iogearbox.net
Not sending mail to unregistered user rmk+kernel@armlinux.org.uk
Not sending mail to unregistered user broonie@kernel.org
Not sending mail to unregistered user brgl@bgdev.pl
Not sending mail to unregistered user daniel.thompson@linaro.org
Not sending mail to unregistered user corbet@lwn.net
Not sending mail to unregistered user deller@gmx.de
Not sending mail to unregistered user mingo@kernel.org
Not sending mail to unregistered user stfrench@microsoft.com
Not sending mail to unregistered user willy@infradead.org
Not sending mail to unregistered user alex.williamson@redhat.com
Not sending mail to unregistered user keescook@chromium.org
Not sending mail to unregistered user marex@denx.de
Not sending mail to unregistered user bp@suse.de
Not sending mail to unregistered user chuck.lever@oracle.com
Not sending mail to unregistered user johannes.berg@intel.com
Not sending mail to unregistered user bleung@chromium.org
Not sending mail to unregistered user daniel.vetter@ffwll.ch
Not sending mail to unregistered user damien.lemoal@wdc.com
Not sending mail to unregistered user maxime@cerno.tech
Not sending mail to unregistered user Jason@zx2c4.com
Not sending mail to unregistered user airlied@redhat.com
Not sending mail to unregistered user masahiroy@kernel.org
Not sending mail to unregistered user krzysztof.kozlowski@canonical.com
Not sending mail to unregistered user linus.walleij@linaro.org
Not sending mail to unregistered user kherbst@redhat.com
Not sending mail to unregistered user sudeep.holla@arm.com
Not sending mail to unregistered user jroedel@suse.de
Not sending mail to unregistered user pablo@netfilter.org
Not sending mail to unregistered user mkl@pengutronix.de
Not sending mail to unregistered user dsterba@suse.com
Not sending mail to unregistered user dhowells@redhat.com
Not sending mail to unregistered user pabeni@redhat.com
Not sending mail to unregistered user tzimmermann@suse.de
Not sending mail to unregistered user rafael.j.wysocki@intel.com
Not sending mail to unregistered user gor@linux.ibm.com
Not sending mail to unregistered user mst@redhat.com
Not sending mail to unregistered user trond.myklebust@hammerspace.com
Not sending mail to unregistered user tsbogend@alpha.franken.de
Not sending mail to unregistered user andriy.shevchenko@linux.intel.com
Not sending mail to unregistered user snitzer@redhat.com
Not sending mail to unregistered user ebiederm@xmission.com
Not sending mail to unregistered user alexandre.belloni@bootlin.com
Not sending mail to unregistered user acme@redhat.com
Not sending mail to unregistered user lee.jones@linaro.org
Not sending mail to unregistered user boris.ostrovsky@oracle.com
Not sending mail to unregistered user skhan@linuxfoundation.org
Not sending mail to unregistered user christian.koenig@amd.com
Not sending mail to unregistered user joonas.lahtinen@linux.intel.com
Not sending mail to unregistered user hdegoede@redhat.com
Not sending mail to unregistered user bcain@codeaurora.org
Not sending mail to unregistered user pbonzini@redhat.com
Not sending mail to unregistered user alexander.deucher@amd.com
Not sending mail to unregistered user anup@brainfault.org
Not sending mail to unregistered user bhelgaas@google.com
Not sending mail to unregistered user davem@davemloft.net
Not sending mail to unregistered user fw@strlen.de
Not sending mail to unregistered user mpe@ellerman.id.au
Not sending mail to unregistered user kvalo@codeaurora.org
Not sending mail to unregistered user gregkh@linuxfoundation.org
Not sending mail to unregistered user jgg@ziepe.ca
Not sending mail to unregistered user anthony.l.nguyen@intel.com
Not sending mail to unregistered user ulf.hansson@linaro.org
Not sending mail to unregistered user tiwai@suse.de
Not sending mail to unregistered user torvalds@linux-foundation.org
Not sending mail to unregistered user pmladek@suse.com
Not sending mail to unregistered user hca@linux.ibm.com
Not sending mail to unregistered user hch@lst.de
Not sending mail to unregistered user palmer@rivosinc.com
Not sending mail to unregistered user jani.nikula@intel.com
Not sending mail to unregistered user maz@kernel.org
Not sending mail to unregistered user mcgrof@kernel.org
Not sending mail to unregistered user agruenba@redhat.com
Not sending mail to unregistered user martin.petersen@oracle.com
Not sending mail to unregistered user peterz@infradead.org
