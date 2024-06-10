Return-Path: <linux-media+bounces-12827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D2C901ED1
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AE24B25AAE
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86257868B;
	Mon, 10 Jun 2024 10:05:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB79762EB
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013951; cv=none; b=VlBlIkq4Tmead4XP/CAUHCRWkHls6cbjWO5+lGpjFz5xhuQriOZCItAuHTXlNAIC97c+FiBohU15NnjWy11ZkL74hlOgokryRtKdBrrizo7l2+krt+miNyrmCtKw41XlveMkJBYSOWf3fLTJzly9dyekob5PloSdBX5Swr/+Okk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013951; c=relaxed/simple;
	bh=2hLnGE+23X9WWntN5fDt9bG08afDtZdktAUcHlwvIbs=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=fxRtCabTk5dTVb/MOIfMvXlXUA+B4Bj5WwcAyDXOSg0lspIX0bQwEJk6rfxDvk0Xqi9+U48iERxICZCucvqvgCJEwGInyR3O46BzE+m+nxhrBisVJTfratIt3cZIHMuhl9Cj982BV7K1/MxRDLUNoWvGHkfFLlEPKaR8TP+Fd5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sGbuL-0004ra-20;
	Mon, 10 Jun 2024 10:05:45 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sGbuK-002Ls1-1J;
	Mon, 10 Jun 2024 10:05:45 +0000
Date: Mon, 10 Jun 2024 10:05:43 +0000 (UTC)
From: Jenkins Builder Robot <jenkins@linuxtv.org>
Reply-To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org
To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl
Message-ID: <2097259186.2.1718013945200@builder.linuxtv.org>
In-Reply-To: <1530684487.4.1717512419774@builder.linuxtv.org>
References: <1530684487.4.1717512419774@builder.linuxtv.org>
Subject: [Jenkins] stage-drivers-build #204: build failed for clang15
 allmodconfig
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1_228328241.1718013944839"
X-Jenkins-Job: stage-drivers-build

------=_Part_1_228328241.1718013944839
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Some tests failed:
	PASS: arm32 allmodconfig
	PASS: arm32 allyesconfig
	PASS: x86_64 allyesconfig
	PASS: arm64 allyesconfig
	PASS: x86_64 allmodconfig
	PASS: x86_64 no PM
	PASS: arm64 allmodconfig
	FAIL: clang15 allmodconfig

GENERAL INFO

BUILD SUCCESSFUL
Build URL: https://builder.linuxtv.org/job/stage-drivers-build/204/
Project: stage-drivers-build
Date of build: Mon, 10 Jun 2024 08:30:09 GMT
Build duration: 1 hr 35 min and counting


CHANGE SET

  	 Revision  by dakr: (drm/nouveau: use tile_mode and pte_kind for VM_BIND bo allocations)

	 change: edit drivers/gpu/drm/nouveau/nouveau_bo.c

	 change: edit drivers/gpu/drm/nouveau/nouveau_abi16.c

	 change: edit include/uapi/drm/nouveau_drm.h

  	 Revision  by martin.petersen: (scsi: mpi3mr: Use proper format specifier in mpi3mr_sas_port_add())

	 change: edit drivers/scsi/mpi3mr/mpi3mr_transport.c

  	 Revision  by martin.petersen: (scsi: core: alua: I/O errors for ALUA state transitions)

	 change: edit drivers/scsi/device_handler/scsi_dh_alua.c

  	 Revision  by martin.petersen: (scsi: sr: Fix unintentional arithmetic wraparound)

	 change: edit drivers/scsi/sr_ioctl.c

	 change: edit include/linux/cdrom.h

	 change: edit Documentation/cdrom/cdrom-standard.rst

	 change: edit drivers/scsi/sr.h

  	 Revision  by martin.petersen: (scsi: qedf: Don&#039;t process stag work during unload and recovery)

	 change: edit drivers/scsi/qedf/qedf_main.c

  	 Revision  by martin.petersen: (scsi: qedf: Wait for stag work during unload)

	 change: edit drivers/scsi/qedf/qedf.h

	 change: edit drivers/scsi/qedf/qedf_main.c

  	 Revision  by martin.petersen: (scsi: qedf: Set qed_slowpath_params to zero before use)

	 change: edit drivers/scsi/qedf/qedf_main.c

  	 Revision  by martin.petersen: (scsi: mpt3sas: Add missing kerneldoc parameter descriptions)

	 change: edit drivers/scsi/mpt3sas/mpt3sas_scsih.c

  	 Revision  by quic_kvalo: (wifi: ath11k: Fix error path in ath11k_pcic_ext_irq_config)

	 change: edit drivers/net/wireless/ath/ath11k/pcic.c

  	 Revision  by christian.koenig: (drm/buddy: stop using PAGE_SIZE)

	 change: edit drivers/gpu/drm/drm_buddy.c

	 change: edit include/drm/drm_buddy.h

  	 Revision  by christian.koenig: (drm/tests/buddy: stop using PAGE_SIZE)

	 change: edit drivers/gpu/drm/tests/drm_buddy_test.c

  	 Revision  by pablo: (netfilter: nfnetlink_queue: acquire rcu_read_lock() in instance_destroy_rcu())

	 change: edit net/netfilter/nfnetlink_queue.c

  	 Revision  by quic_kvalo: (wifi: ath10k: fix QCOM_RPROC_COMMON dependency)

	 change: edit drivers/net/wireless/ath/ath10k/Kconfig

  	 Revision  by pablo: (netfilter: ipset: Add list flush to cancel_gc)

	 change: edit net/netfilter/ipset/ip_set_list_set.c

  	 Revision  by pablo: (netfilter: nft_payload: restore vlan q-in-q match support)

	 change: edit net/netfilter/nft_payload.c

  	 Revision  by ulf.hansson: (pmdomain: imx: gpcv2: Add delay after power up handshake)

	 change: edit drivers/pmdomain/imx/gpcv2.c

  	 Revision  by asmadeus: (net/9p: fix uninit-value in p9_client_rpc())

	 change: edit net/9p/client.c

  	 Revision  by daniel.vetter: (drm/shmem-helper: Fix BUG_ON() on mmap(PROT_WRITE, MAP_PRIVATE))

	 change: edit drivers/gpu/drm/drm_gem_shmem_helper.c

  	 Revision  by kbusch: (nvme-multipath: find NUMA path only for online numa-node)

	 change: edit drivers/nvme/host/multipath.c

  	 Revision  by ast: (MAINTAINERS: Add myself as reviewer of ARM64 BPF JIT)

	 change: edit MAINTAINERS

  	 Revision  by ardb: (efi/libstub: zboot.lds: Discard .discard sections)

	 change: edit drivers/firmware/efi/libstub/zboot.lds

  	 Revision  by ardb: (efi: pstore: Return proper errors on UEFI failures)

	 change: edit drivers/firmware/efi/efi-pstore.c

  	 Revision  by asmadeus: (9p: add missing locking around taking dentry fid list)

	 change: edit fs/9p/vfs_dentry.c

  	 Revision  by broonie: (spi: Don&#039;t mark message DMA mapped when no transfer in it is)

	 change: edit drivers/spi/spi.c

  	 Revision  by broonie: (spi: Check if transfer is mapped before calling DMA sync APIs)

	 change: edit drivers/spi/spi.c

  	 Revision  by broonie: (spi: stm32: Revert change that enabled controller before asserting CS)

	 change: edit drivers/spi/spi-stm32.c

  	 Revision  by andi.shyti: (i2c: synquacer: Remove a clk reference from struct synquacer_i2c)

	 change: edit drivers/i2c/busses/i2c-synquacer.c

  	 Revision  by andi.shyti: (i2c: Remove I2C_CLASS_SPD)

	 change: edit include/linux/i2c.h

  	 Revision  by jikos: (HID: intel-ish-hid: Fix build error for COMPILE_TEST)

	 change: edit drivers/hid/intel-ish-hid/ishtp/loader.c

  	 Revision  by jikos: (HID: nvidia-shield: Add missing check for input_ff_create_memless)

	 change: edit drivers/hid/hid-nvidia-shield.c

  	 Revision  by quic_kvalo: (wifi: ath11k: fix WCN6750 firmware crash caused by 17 num_vdevs)

	 change: edit drivers/net/wireless/ath/ath11k/core.c

  	 Revision  by quic_kvalo: (wifi: ath11k: move power type check to ASSOC stage when connecting to 6 GHz AP)

	 change: edit drivers/net/wireless/ath/ath11k/mac.c

  	 Revision  by hch: (dma-mapping: benchmark: fix up kthread-related error handling)

	 change: edit kernel/dma/map_benchmark.c

  	 Revision  by hch: (dma-mapping: benchmark: avoid needless copy_to_user if benchmark fails)

	 change: edit kernel/dma/map_benchmark.c

  	 Revision  by hch: (dma-mapping: benchmark: fix node id validation)

	 change: edit kernel/dma/map_benchmark.c

  	 Revision  by hch: (dma-mapping: benchmark: handle NUMA_NO_NODE correctly)

	 change: edit kernel/dma/map_benchmark.c

  	 Revision  by pbonzini: (KVM: x86/mmu: Use SHADOW_NONPRESENT_VALUE for atomic zap in TDP MMU)

	 change: edit arch/x86/kvm/mmu/tdp_mmu.c

  	 Revision  by pbonzini: (KVM: VMX: Don&#039;t kill the VM on an unexpected #VE)

	 change: edit arch/x86/kvm/vmx/vmx.c

  	 Revision  by pbonzini: (KVM: nVMX: Initialize #VE info page for vmcs02 when proving #VE support)

	 change: edit arch/x86/kvm/vmx/nested.c

  	 Revision  by pbonzini: (KVM: nVMX: Always handle #VEs in L0 (never forward #VEs from L2 to L1))

	 change: edit arch/x86/kvm/vmx/nested.c

  	 Revision  by pbonzini: (KVM: x86/mmu: Add sanity checks that KVM doesn&#039;t create EPT #VE SPTEs)

	 change: edit arch/x86/kvm/mmu/tdp_iter.h

	 change: edit arch/x86/kvm/mmu/mmu.c

	 change: edit arch/x86/kvm/mmu/spte.h

  	 Revision  by pbonzini: (KVM: VMX: Dump VMCS on unexpected #VE)

	 change: edit arch/x86/kvm/vmx/vmx.c

  	 Revision  by pbonzini: (KVM: x86/mmu: Print SPTEs on unexpected #VE)

	 change: edit arch/x86/kvm/vmx/vmx.c

	 change: edit arch/x86/kvm/mmu/mmu.c

	 change: edit arch/x86/include/asm/kvm_host.h

  	 Revision  by pbonzini: (KVM: VMX: Enumerate EPT Violation #VE support in /proc/cpuinfo)

	 change: edit arch/x86/include/asm/vmxfeatures.h

  	 Revision  by pbonzini: (KVM: x86: Disable KVM_INTEL_PROVE_VE by default)

	 change: edit arch/x86/kvm/Kconfig

  	 Revision  by pbonzini: (KVM: x86: Force KVM_WERROR if the global WERROR is enabled)

	 change: edit arch/x86/kvm/Kconfig

  	 Revision  by pbonzini: (KVM: SVM: WARN on vNMI + NMI window iff NMIs are outright masked)

	 change: edit arch/x86/kvm/svm/svm.c

  	 Revision  by kbusch: (nvme: fix multipath batched completion accounting)

	 change: edit drivers/nvme/host/core.c

  	 Revision  by kbusch: (nvme-multipath: fix io accounting on failover)

	 change: edit drivers/nvme/host/core.c

	 change: edit drivers/nvme/host/multipath.c

	 change: edit drivers/nvme/host/nvme.h

  	 Revision  by kbusch: (nvmet: fix ns enable/disable possible hang)

	 change: edit drivers/nvme/target/configfs.c

  	 Revision  by alexander.deucher: (drm/amdgpu: correct hbm field in boot status)

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h

  	 Revision  by alexander.deucher: (drm/amd/display: Enable colorspace property for MST connectors)

	 change: edit drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c

  	 Revision  by mhiramat: (uprobes: prevent mutex_lock() under rcu_read_lock())

	 change: edit kernel/trace/trace_uprobe.c

  	 Revision  by martin.petersen: (scsi: core: Handle devices which return an unusually large VPD page count)

	 change: edit drivers/scsi/scsi.c

  	 Revision  by davem: (connector: Fix invalid conversion in cn_proc.h)

	 change: edit include/uapi/linux/cn_proc.h

  	 Revision  by davem: (net: phy: micrel: set soft_reset callback to genphy_soft_reset for KSZ8061)

	 change: edit drivers/net/phy/micrel.c

  	 Revision  by brauner: (netfs: Fix io_uring based write-through)

	 change: edit fs/netfs/write_collect.c

	 change: edit fs/netfs/write_issue.c

	 change: edit fs/netfs/direct_write.c

  	 Revision  by brauner: (netfs: Fix AIO error handling when doing write-through)

	 change: edit fs/netfs/write_issue.c

  	 Revision  by brauner: (filemap: add helper mapping_max_folio_size())

	 change: edit include/linux/pagemap.h

  	 Revision  by brauner: (iomap: fault in smaller chunks for non-large folio mappings)

	 change: edit fs/iomap/buffered-io.c

  	 Revision  by brauner: (signalfd: fix error return code)

	 change: edit fs/signalfd.c

  	 Revision  by brauner: (signalfd: drop an obsolete comment)

	 change: edit fs/signalfd.c

  	 Revision  by brauner: (netfs: Fix setting of BDP_ASYNC from iocb flags)

	 change: edit fs/netfs/buffered_write.c

  	 Revision  by brauner: (swap: yield device immediately)

	 change: edit kernel/power/swap.c

  	 Revision  by davem: (net/mlx5: Lag, do bond only if slaves agree on roce state)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c

  	 Revision  by davem: (net/mlx5: Do not query MPIR on embedded CPU function)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/lib/sd.c

  	 Revision  by davem: (net/mlx5: Fix MTMP register capability offset in MCAM register)

	 change: edit include/linux/mlx5/mlx5_ifc.h

  	 Revision  by davem: (net/mlx5: Use mlx5_ipsec_rx_status_destroy to correctly delete status rules)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c

  	 Revision  by davem: (net/mlx5e: Fix IPsec tunnel mode offload feature check)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_rxtx.h

  	 Revision  by davem: (net/mlx5e: Do not use ptp structure for tx ts stats when not initialized)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en_stats.c

  	 Revision  by davem: (net/mlx5e: Use rx_missed_errors instead of rx_dropped for reporting buffer exhaustion)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en_main.c

  	 Revision  by davem: (net/mlx5e: Fix UDP GSO for encapsulated packets)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en_tx.c

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en_accel/en_accel.h

  	 Revision  by christian.koenig: (dma-buf/sw-sync: don&#039;t enable IRQ from sync_print_obj())

	 change: edit drivers/dma-buf/sync_debug.c

  	 Revision  by daniel: (bpf: Fix potential integer overflow in resolve_btfids)

	 change: edit tools/bpf/resolve_btfids/main.c

  	 Revision  by kbusch: (nvme: remove sgs and sws)

	 change: edit drivers/nvme/host/nvme.h

  	 Revision  by kbusch: (nvme: adjust multiples of NVME_CTRL_PAGE_SIZE in offset)

	 change: edit drivers/nvme/host/pci.c

  	 Revision  by brauner: (afs: Don&#039;t cross .backup mountpoint from backup volume)

	 change: edit fs/afs/mntpt.c

  	 Revision  by ast: (bpf: fix multi-uprobe PID filtering logic)

	 change: edit kernel/trace/bpf_trace.c

	 change: edit tools/testing/selftests/bpf/prog_tests/uprobe_multi_test.c

  	 Revision  by ast: (bpf: remove unnecessary rcu_read_{lock,unlock}() in multi-uprobe attach logic)

	 change: edit kernel/trace/bpf_trace.c

  	 Revision  by ast: (libbpf: detect broken PID filtering logic for multi-uprobe)

	 change: edit tools/lib/bpf/features.c

  	 Revision  by ast: (selftests/bpf: extend multi-uprobe tests with child thread case)

	 change: edit tools/testing/selftests/bpf/progs/uprobe_multi.c

	 change: edit tools/testing/selftests/bpf/prog_tests/uprobe_multi_test.c

  	 Revision  by ast: (selftests/bpf: extend multi-uprobe tests with USDTs)

	 change: edit tools/testing/selftests/bpf/prog_tests/uprobe_multi_test.c

	 change: edit tools/testing/selftests/bpf/progs/uprobe_multi.c

  	 Revision  by ast: (ARC, bpf: Fix issues reported by the static analyzers)

	 change: edit arch/arc/net/bpf_jit_core.c

	 change: edit arch/arc/net/bpf_jit.h

	 change: edit arch/arc/net/bpf_jit_arcv2.c

  	 Revision  by ast: (netkit: Fix setting mac address in l2 mode)

	 change: edit drivers/net/netkit.c

  	 Revision  by ast: (netkit: Fix pkt_type override upon netkit pass verdict)

	 change: edit include/linux/etherdevice.h

	 change: edit drivers/net/netkit.c

	 change: edit net/ethernet/eth.c

  	 Revision  by ast: (selftests/bpf: Add netkit tests for mac address)

	 change: edit tools/testing/selftests/bpf/prog_tests/tc_netkit.c

  	 Revision  by ast: (selftests/bpf: Add netkit test for pkt_type)

	 change: edit tools/testing/selftests/bpf/prog_tests/tc_netkit.c

	 change: edit tools/testing/selftests/bpf/progs/test_tc_link.c

  	 Revision  by herbert: (hwrng: core - Remove add_early_randomness)

	 change: edit drivers/char/hw_random/core.c

  	 Revision  by kent.overstreet: (bcachefs: Fix debug assert)

	 change: edit fs/bcachefs/super.c

  	 Revision  by kent.overstreet: (bcachefs: Fix sb-downgrade validation)

	 change: edit fs/bcachefs/sb-downgrade.c

  	 Revision  by o-takashi: (firewire: add missing MODULE_DESCRIPTION() to test modules)

	 change: edit drivers/firewire/packet-serdes-test.c

	 change: edit drivers/firewire/uapi-test.c

  	 Revision  by broonie: (regmap-i2c: Subtract reg size from max_write)

	 change: edit drivers/base/regmap/regmap-i2c.c

  	 Revision  by kent.overstreet: (bcachefs: Use copy_folio_from_iter_atomic())

	 change: edit fs/bcachefs/fs-io-buffered.c

  	 Revision  by stfrench: (fs: smb: common: add missing MODULE_DESCRIPTION() macros)

	 change: edit fs/smb/common/cifs_arc4.c

	 change: edit fs/smb/common/cifs_md4.c

  	 Revision  by tiwai: (ALSA: core: Remove debugfs at disconnection)

	 change: edit sound/core/init.c

	 change: edit sound/core/jack.c

  	 Revision  by tiwai: (ALSA: hda/realtek: Adjust G814JZR to use SPI init for amp)

	 change: edit sound/pci/hda/patch_realtek.c

  	 Revision  by cassel: (ata: ahci: Do not apply Intel PCS quirk on Intel Alder Lake)

	 change: edit drivers/ata/ahci.c

  	 Revision  by pabeni: (enic: Validate length of nl attributes in enic_set_vf_port)

	 change: edit drivers/net/ethernet/cisco/enic/enic_main.c

  	 Revision  by hdegoede: (platform/x86: ISST: fix use-after-free in tpmi_sst_dev_remove())

	 change: edit drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c

  	 Revision  by hdegoede: (platform/x86: x86-android-tablets: Add &quot;select LEDS_CLASS&quot;)

	 change: edit drivers/platform/x86/x86-android-tablets/Kconfig

  	 Revision  by hdegoede: (platform/x86: thinkpad_acpi: Select INPUT_SPARSEKMAP in Kconfig)

	 change: edit drivers/platform/x86/Kconfig

  	 Revision  by hverkuil: (media: mgb4: Fix double debugfs remove)

	 change: edit drivers/media/pci/mgb4/mgb4_core.c

  	 Revision  by hdegoede: (platform/x86: touchscreen_dmi: Add support for setting touchscreen properties from cmdline)

	 change: edit Documentation/admin-guide/kernel-parameters.txt

	 change: edit drivers/platform/x86/touchscreen_dmi.c

  	 Revision  by hdegoede: (platform/x86: touchscreen_dmi: Add info for GlobalSpace SolT IVW 11.6&quot; tablet)

	 change: edit drivers/platform/x86/touchscreen_dmi.c

  	 Revision  by hdegoede: (platform/x86: touchscreen_dmi: Add info for the EZpad 6s Pro)

	 change: edit drivers/platform/x86/touchscreen_dmi.c

  	 Revision  by pabeni: (selftests: hsr: Fix &quot;File exists&quot; errors for hsr_ping)

	 change: edit tools/testing/selftests/net/hsr/hsr_ping.sh

  	 Revision  by pabeni: (af_unix: Annotate data-race around unix_sk(sk)-&gt;addr.)

	 change: edit net/unix/af_unix.c

  	 Revision  by pabeni: (af_unix: Read sk-&gt;sk_hash under bindlock during bind().)

	 change: edit net/unix/af_unix.c

  	 Revision  by pabeni: (Octeontx2-pf: Free send queue buffers incase of leaf to inner)

	 change: edit drivers/net/ethernet/marvell/octeontx2/nic/qos.c

  	 Revision  by chandanbabu: (xfs: Clear W=1 warning in xfs_iwalk_run_callbacks())

	 change: edit fs/xfs/xfs_iwalk.c

  	 Revision  by chandanbabu: (xfs: Stop using __maybe_unused in xfs_alloc.c)

	 change: edit fs/xfs/libxfs/xfs_alloc.c

  	 Revision  by chandanbabu: (xfs: drop xfarray sortinfo folio on error)

	 change: edit fs/xfs/scrub/xfarray.c

  	 Revision  by chandanbabu: (xfs: fix xfs_init_attr_trans not handling explicit operation codes)

	 change: edit fs/xfs/libxfs/xfs_attr.c

	 change: edit fs/xfs/libxfs/xfs_attr.h

	 change: edit fs/xfs/xfs_attr_item.c

  	 Revision  by chandanbabu: (xfs: allow symlinks with short remote targets)

	 change: edit fs/xfs/libxfs/xfs_inode_buf.c

  	 Revision  by chandanbabu: (xfs: don&#039;t open-code u64_to_user_ptr)

	 change: edit fs/xfs/scrub/scrub.c

	 change: edit fs/xfs/xfs_handle.c

  	 Revision  by rafael.j.wysocki: (ACPI: APEI: EINJ: Fix einj_dev release leak)

	 change: edit drivers/acpi/apei/einj-core.c

  	 Revision  by rafael.j.wysocki: (ACPI: EC: Abort address space access upon error)

	 change: edit drivers/acpi/ec.c

  	 Revision  by rafael.j.wysocki: (ACPI: EC: Avoid returning AE_OK on errors in address space handler)

	 change: edit drivers/acpi/ec.c

  	 Revision  by pabeni: (net: usb: smsc95xx: fix changing LED_SEL bit value updated from EEPROM)

	 change: edit drivers/net/usb/smsc95xx.c

  	 Revision  by rafael.j.wysocki: (thermal/debugfs: Print initial trip temperature and hysteresis in tze_seq_show())

	 change: edit drivers/thermal/thermal_debugfs.c

  	 Revision  by rafael.j.wysocki: (thermal/debugfs: Allow tze_seq_show() to print statistics for invalid trips)

	 change: edit drivers/thermal/thermal_debugfs.c

  	 Revision  by rafael.j.wysocki: (thermal: core: Introduce thermal_trip_crossed())

	 change: edit drivers/thermal/thermal_core.c

  	 Revision  by rafael.j.wysocki: (thermal: trip: Trigger trip down notifications when trips involved in mitigation become invalid)

	 change: edit drivers/thermal/thermal_trip.c

	 change: edit drivers/thermal/thermal_core.c

	 change: edit drivers/thermal/thermal_core.h

  	 Revision  by dakr: (drm/nouveau/nvif: Avoid build error due to potential integer overflows)

	 change: edit drivers/gpu/drm/nouveau/nvif/object.c

  	 Revision  by brauner: (netfs, 9p: Fix race between umount and async request completion)

	 change: edit fs/smb/client/cifsfs.c

	 change: edit fs/netfs/objects.c

	 change: edit fs/9p/vfs_inode.c

	 change: edit include/linux/netfs.h

	 change: edit fs/afs/inode.c

  	 Revision  by mhiramat: (tracing/probes: fix error check in parse_btf_field())

	 change: edit kernel/trace/trace_probe.c

  	 Revision  by broonie: (ASoC: cs42l43: Only restrict 44.1kHz for the ASP)

	 change: edit sound/soc/codecs/cs42l43.c

  	 Revision  by broonie: (ASoC: wm_adsp: Add missing MODULE_DESCRIPTION())

	 change: edit sound/soc/codecs/wm_adsp.c

  	 Revision  by broonie: (MAINTAINERS: Remove James Schulman from Cirrus audio maintainers)

	 change: edit MAINTAINERS

  	 Revision  by christian.koenig: (dma-buf: handle testing kthreads creation failure)

	 change: edit drivers/dma-buf/st-dma-fence.c

  	 Revision  by hch: (Documentation/core-api: correct reference to SWIOTLB_DYNAMIC)

	 change: edit Documentation/core-api/swiotlb.rst

  	 Revision  by acme: (tools include UAPI: Sync linux/stat.h with the kernel sources)

	 change: edit tools/perf/trace/beauty/include/uapi/linux/stat.h

  	 Revision  by axboe: (block: remove blk_queue_max_integrity_segments)

	 change: edit include/linux/blk-integrity.h

  	 Revision  by axboe: (dm: move setting zoned_enabled to dm_table_set_restrictions)

	 change: edit drivers/md/dm-zone.c

	 change: edit drivers/md/dm-table.c

  	 Revision  by axboe: (dm: remove dm_check_zoned)

	 change: edit drivers/md/dm-zone.c

  	 Revision  by axboe: (dm: make dm_set_zones_restrictions work on the queue limits)

	 change: edit drivers/md/dm.h

	 change: edit drivers/md/dm-zone.c

	 change: edit drivers/md/dm-table.c

  	 Revision  by acme: (tools headers UAPI: Sync linux/prctl.h with the kernel sources)

	 change: edit tools/perf/trace/beauty/include/uapi/linux/prctl.h

  	 Revision  by chandanbabu: (xfs: Add cond_resched to block unmap range and reflink remap path)

	 change: edit fs/xfs/libxfs/xfs_bmap.c

	 change: edit fs/xfs/xfs_reflink.c

  	 Revision  by acme: (tools headers UAPI: Sync fcntl.h with the kernel sources to pick F_DUPFD_QUERY)

	 change: edit tools/perf/builtin-trace.c

	 change: edit tools/perf/trace/beauty/include/uapi/linux/fcntl.h

  	 Revision  by acme: (perf beauty: Update copy of linux/socket.h with the kernel sources)

	 change: edit tools/perf/trace/beauty/include/linux/socket.h

  	 Revision  by acme: (perf trace beauty: Update the arch/x86/include/asm/irq_vectors.h copy with the kernel sources to pick POSTED_MSI_NOTIFICATION)

	 change: edit tools/perf/trace/beauty/arch/x86/include/asm/irq_vectors.h

  	 Revision  by maz: (KVM: arm64: Fix AArch32 register narrowing on userspace write)

	 change: edit arch/arm64/kvm/guest.c

  	 Revision  by maz: (KVM: arm64: Allow AArch32 PSTATE.M to be restored as System mode)

	 change: edit arch/arm64/kvm/guest.c

  	 Revision  by maz: (KVM: arm64: AArch32: Fix spurious trapping of conditional instructions)

	 change: edit arch/arm64/kvm/hyp/aarch32.c

  	 Revision  by daniel: (bpf: Allow delete from sockmap/sockhash only if update is allowed)

	 change: edit kernel/bpf/verifier.c

  	 Revision  by daniel: (Revert &quot;bpf, sockmap: Prevent lock inversion deadlock in map delete elem&quot;)

	 change: edit net/core/sock_map.c

  	 Revision  by daniel: (selftests/bpf: Cover verifier checks for mutating sockmap/sockhash)

	 change: edit tools/testing/selftests/bpf/prog_tests/verifier.c

	 change: add tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c

  	 Revision  by axboe: (null_blk: Fix return value of nullb_device_power_store())

	 change: edit drivers/block/null_blk/main.c

  	 Revision  by axboe: (block: delete redundant function declaration)

	 change: edit block/blk-stat.h

  	 Revision  by broonie: (ASoC: SOF: stream-ipc: remove unnecessary MODULE_LICENSE)

	 change: edit sound/soc/sof/stream-ipc.c

  	 Revision  by broonie: (ASoC: SOF: AMD: group all module related information)

	 change: edit sound/soc/sof/amd/pci-vangogh.c

	 change: edit sound/soc/sof/amd/pci-acp63.c

	 change: edit sound/soc/sof/amd/renoir.c

	 change: edit sound/soc/sof/amd/vangogh.c

	 change: edit sound/soc/sof/amd/acp63.c

	 change: edit sound/soc/sof/amd/rembrandt.c

	 change: edit sound/soc/sof/amd/pci-rn.c

	 change: edit sound/soc/sof/amd/pci-rmb.c

  	 Revision  by broonie: (ASoC: SOF: reorder MODULE_ definitions)

	 change: edit sound/soc/sof/amd/acp-common.c

	 change: edit sound/soc/sof/core.c

	 change: edit sound/soc/sof/amd/acp.c

	 change: edit sound/soc/sof/nocodec.c

	 change: edit sound/soc/sof/sof-client-ipc-msg-injector.c

	 change: edit sound/soc/sof/sof-client-probes.c

	 change: edit sound/soc/sof/sof-client-ipc-flood-test.c

	 change: edit sound/soc/sof/xtensa/core.c

	 change: edit sound/soc/sof/sof-client-ipc-kernel-injector.c

  	 Revision  by broonie: (ASoC: SOF: add missing MODULE_DESCRIPTION())

	 change: edit sound/soc/sof/intel/atom.c

	 change: edit sound/soc/sof/intel/pci-icl.c

	 change: edit sound/soc/sof/imx/imx-common.c

	 change: edit sound/soc/sof/intel/pci-lnl.c

	 change: edit sound/soc/sof/sof-of-dev.c

	 change: edit sound/soc/sof/imx/imx8.c

	 change: edit sound/soc/sof/intel/hda-codec.c

	 change: edit sound/soc/sof/sof-pci-dev.c

	 change: edit sound/soc/sof/imx/imx8ulp.c

	 change: edit sound/soc/sof/intel/pci-skl.c

	 change: edit sound/soc/sof/intel/pci-tgl.c

	 change: edit sound/soc/sof/sof-acpi-dev.c

	 change: edit sound/soc/sof/intel/hda-mlink.c

	 change: edit sound/soc/sof/intel/hda-ctrl.c

	 change: edit sound/soc/sof/mediatek/mt8195/mt8195.c

	 change: edit sound/soc/sof/mediatek/mt8186/mt8186.c

	 change: edit sound/soc/sof/intel/pci-tng.c

	 change: edit sound/soc/sof/imx/imx8m.c

	 change: edit sound/soc/sof/intel/byt.c

	 change: edit sound/soc/sof/intel/pci-mtl.c

	 change: edit sound/soc/sof/mediatek/mtk-adsp-common.c

	 change: edit sound/soc/sof/intel/hda.c

	 change: edit sound/soc/sof/intel/bdw.c

	 change: edit sound/soc/sof/intel/pci-apl.c

	 change: edit sound/soc/sof/intel/pci-cnl.c

	 change: edit sound/soc/sof/sof-utils.c

  	 Revision  by kuba: (ipv4: Fix address dump when IPv4 is disabled on an interface)

	 change: edit net/ipv4/devinet.c

  	 Revision  by kuba: (net: gro: initialize network_offset in network layer)

	 change: edit net/ipv6/ip6_offload.c

	 change: edit net/ipv4/af_inet.c

  	 Revision  by kuba: (tcp: reduce accepted window in NEW_SYN_RECV state)

	 change: edit net/ipv6/tcp_ipv6.c

	 change: edit net/ipv4/tcp_ipv4.c

	 change: edit net/ipv4/tcp_minisocks.c

	 change: edit include/net/request_sock.h

  	 Revision  by kuba: (dt-bindings: net: pse-pd: microchip,pd692x0: Fix missing &quot;additionalProperties&quot; constraints)

	 change: edit Documentation/devicetree/bindings/net/pse-pd/microchip,pd692x0.yaml

  	 Revision  by kuba: (dt-bindings: net: pse-pd: ti,tps23881: Fix missing &quot;additionalProperties&quot; constraints)

	 change: edit Documentation/devicetree/bindings/net/pse-pd/ti,tps23881.yaml

  	 Revision  by kuba: (net:fec: Add fec_enet_deinit())

	 change: edit drivers/net/ethernet/freescale/fec_main.c

  	 Revision  by kuba: (net: micrel: Fix lan8841_config_intr after getting out of sleep mode)

	 change: edit drivers/net/phy/micrel.c

  	 Revision  by kuba: (page_pool: fix &amp;page_pool_params kdoc issues)

	 change: edit include/net/page_pool/types.h

  	 Revision  by kuba: (idpf: don&#039;t enable NAPI and interrupts prior to allocating Rx buffers)

	 change: edit drivers/net/ethernet/intel/idpf/idpf_lib.c

	 change: edit drivers/net/ethernet/intel/idpf/idpf_txrx.h

	 change: edit drivers/net/ethernet/intel/idpf/idpf_txrx.c

  	 Revision  by kuba: (ice: fix accounting if a VLAN already exists)

	 change: edit drivers/net/ethernet/intel/ice/ice_vsi_vlan_lib.c

  	 Revision  by kuba: (selftests: mptcp: lib: support flaky subtests)

	 change: edit tools/testing/selftests/net/mptcp/mptcp_lib.sh

  	 Revision  by kuba: (selftests: mptcp: simult flows: mark &#039;unbalanced&#039; tests as flaky)

	 change: edit tools/testing/selftests/net/mptcp/simult_flows.sh

  	 Revision  by kuba: (selftests: mptcp: join: mark &#039;fastclose&#039; tests as flaky)

	 change: edit tools/testing/selftests/net/mptcp/mptcp_join.sh

  	 Revision  by kuba: (selftests: mptcp: join: mark &#039;fail&#039; tests as flaky)

	 change: edit tools/testing/selftests/net/mptcp/mptcp_join.sh

  	 Revision  by kuba: (docs: netdev: Fix typo in Signed-off-by tag)

	 change: edit Documentation/process/maintainer-netdev.rst

  	 Revision  by hverkuil: (media: Documentation: v4l: Fix ACTIVE route flag)

	 change: edit Documentation/userspace-api/media/v4l/dev-subdev.rst

  	 Revision  by hverkuil: (media: intel/ipu6: Fix some redundant resources freeing in ipu6_pci_remove())

	 change: edit drivers/media/pci/intel/ipu6/ipu6.c

  	 Revision  by hverkuil: (media: intel/ipu6: Move isys_remove() close to isys_probe())

	 change: edit drivers/media/pci/intel/ipu6/ipu6-isys.c

  	 Revision  by hverkuil: (media: intel/ipu6: Fix an error handling path in isys_probe())

	 change: edit drivers/media/pci/intel/ipu6/ipu6-isys.c

  	 Revision  by hverkuil: (media: intel/ipu6: fix the buffer flags caused by wrong parentheses)

	 change: edit drivers/media/pci/intel/ipu6/ipu6-isys-queue.c

  	 Revision  by thomas.hellstrom: (drm/xe: Change pcode timeout to 50msec while polling again)

	 change: edit drivers/gpu/drm/xe/xe_pcode.c

  	 Revision  by thomas.hellstrom: (drm/xe: Only use reserved BCS instances for usm migrate exec queue)

	 change: edit drivers/gpu/drm/xe/xe_migrate.c

  	 Revision  by thomas.hellstrom: (drm/xe: Properly handle alloc_guc_id() failure)

	 change: edit drivers/gpu/drm/xe/xe_guc_submit.c

  	 Revision  by jarkko: (tpm_tis_spi: Account for SPI header when allocating TPM SPI xfer buffer)

	 change: edit drivers/char/tpm/tpm_tis_spi_main.c

  	 Revision  by jarkko: (tpm: Open code tpm_buf_parameters())

	 change: edit drivers/char/tpm/tpm-buf.c

	 change: edit drivers/char/tpm/tpm2-cmd.c

	 change: edit include/linux/tpm.h

  	 Revision  by pabeni: (sock_map: avoid race between sock_map_close and sk_psock_put)

	 change: edit net/core/sock_map.c

  	 Revision  by jarkko: (tpm: Rename TPM2_OA_TMPL to TPM2_OA_NULL_KEY and make it local)

	 change: edit include/linux/tpm.h

	 change: edit drivers/char/tpm/tpm2-sessions.c

  	 Revision  by jarkko: (tpm: Enable TCG_TPM2_HMAC by default only for X86_64)

	 change: edit drivers/char/tpm/Kconfig

  	 Revision  by tiwai: (ALSA: seq: Fix missing bank setup between MIDI1/MIDI2 UMP conversion)

	 change: edit sound/core/seq/seq_ump_convert.c

  	 Revision  by tiwai: (ALSA: seq: Don&#039;t clear bank selection at event -&gt; UMP MIDI2 conversion)

	 change: edit sound/core/seq/seq_ump_convert.c

  	 Revision  by tiwai: (ALSA/hda: intel-dsp-config: reduce log verbosity)

	 change: edit sound/hda/intel-dsp-config.c

  	 Revision  by broonie: (regulator: rtq2208: Fix invalid memory access when devm_of_regulator_put_matches is called)

	 change: edit drivers/regulator/rtq2208-regulator.c

  	 Revision  by axboe: (null_blk: Print correct max open zones limit in null_init_zoned_dev())

	 change: edit drivers/block/null_blk/zoned.c

  	 Revision  by axboe: (sd: also set max_user_sectors when setting max_sectors)

	 change: edit drivers/scsi/sd.c

  	 Revision  by axboe: (block: stack max_user_sectors)

	 change: edit block/blk-settings.c

  	 Revision  by axboe: (block: check for max_hw_sectors underflow)

	 change: edit block/blk-settings.c

  	 Revision  by axboe: (bcache: allow allocator to invalidate bucket in gc)

	 change: edit drivers/md/bcache/alloc.c

	 change: edit drivers/md/bcache/bcache.h

	 change: edit drivers/md/bcache/btree.c

  	 Revision  by axboe: (bcache: call force_wake_up_gc() if necessary in check_should_bypass())

	 change: edit drivers/md/bcache/request.c

  	 Revision  by axboe: (bcache: code cleanup in __bch_bucket_alloc_set())

	 change: edit drivers/md/bcache/alloc.c

  	 Revision  by pabeni: (net: ti: icssg-prueth: Fix start counter for ft1 filter)

	 change: edit drivers/net/ethernet/ti/icssg/icssg_classifier.c

  	 Revision  by acme: (tools headers: Update the syscall tables and unistd.h, mostly to support the new &#039;mseal&#039; syscall)

	 change: edit tools/perf/arch/powerpc/entry/syscalls/syscall.tbl

	 change: edit tools/perf/arch/s390/entry/syscalls/syscall.tbl

	 change: edit tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl

	 change: edit tools/include/uapi/asm-generic/unistd.h

	 change: edit tools/perf/arch/x86/entry/syscalls/syscall_64.tbl

  	 Revision  by dsterba: (btrfs: ensure fast fsync waits for ordered extents after a write failure)

	 change: edit fs/btrfs/file.c

	 change: edit fs/btrfs/ordered-data.c

	 change: edit fs/btrfs/btrfs_inode.h

  	 Revision  by skhan: (tools/power/cpupower: Fix Pstate frequency reporting on AMD Family 1Ah CPUs)

	 change: edit tools/power/cpupower/utils/helpers/amd.c

  	 Revision  by kent.overstreet: (bcachefs: Plumb bkey into __btree_err())

	 change: edit fs/bcachefs/btree_io.c

  	 Revision  by kent.overstreet: (bcachefs: Fix lookup_first_inode() when inode_generations are present)

	 change: edit fs/bcachefs/fsck.c

  	 Revision  by kent.overstreet: (bcachefs: Fix locking assert)

	 change: edit fs/bcachefs/btree_key_cache.c

  	 Revision  by kent.overstreet: (bcachefs: Refactor delete_dead_snapshots())

	 change: edit fs/bcachefs/snapshot.c

  	 Revision  by kent.overstreet: (bcachefs: Run check_key_has_snapshot in snapshot_delete_keys())

	 change: edit fs/bcachefs/fsck.c

	 change: edit fs/bcachefs/snapshot.h

	 change: edit fs/bcachefs/snapshot.c

  	 Revision  by kent.overstreet: (bcachefs: Fix setting of downgrade recovery passes/errors)

	 change: edit fs/bcachefs/super-io.c

  	 Revision  by kent.overstreet: (bcachefs: add missing MODULE_DESCRIPTION())

	 change: edit fs/bcachefs/mean_and_variance_test.c

  	 Revision  by kent.overstreet: (bcachefs: btree_gc can now handle unknown btrees)

	 change: edit fs/bcachefs/btree_gc.c

	 change: edit fs/bcachefs/bcachefs.h

	 change: add fs/bcachefs/btree_gc_types.h

	 change: edit fs/bcachefs/btree_gc.h

	 change: edit fs/bcachefs/ec.c

  	 Revision  by kent.overstreet: (bcachefs: Better fsck error message for key version)

	 change: edit fs/bcachefs/btree_gc.c

  	 Revision  by kbusch: (nvme: use srcu for iterating namespace list)

	 change: edit drivers/nvme/host/ioctl.c

	 change: edit drivers/nvme/host/core.c

	 change: edit drivers/nvme/host/nvme.h

	 change: edit drivers/nvme/host/multipath.c

  	 Revision  by kbusch: (nvmet: fix a possible leak when destroy a ctrl during qp establishment)

	 change: edit drivers/nvme/target/core.c

  	 Revision  by robh: (of: of_test: add MODULE_DESCRIPTION())

	 change: edit drivers/of/of_test.c

  	 Revision  by acme: (tools arch x86: Sync the msr-index.h copy with the kernel sources)

	 change: edit tools/arch/x86/include/asm/msr-index.h

  	 Revision  by acme: (tools headers UAPI: Sync kvm headers with the kernel sources)

	 change: edit tools/include/uapi/linux/kvm.h

	 change: edit tools/arch/x86/include/uapi/asm/kvm.h

  	 Revision  by rafael.j.wysocki: (PNP: Make dev_is_pnp() to be a function and export it for modules)

	 change: edit include/linux/pnp.h

	 change: edit drivers/pnp/driver.c

  	 Revision  by rafael.j.wysocki: (PNP: Hide pnp_bus_type from the non-PNP code)

	 change: edit include/linux/pnp.h

	 change: edit drivers/pnp/base.h

  	 Revision  by acme: (tools headers UAPI: Update i915_drm.h with the kernel sources)

	 change: edit tools/include/uapi/drm/i915_drm.h

  	 Revision  by rafael.j.wysocki: (ACPI: AC: Properly notify powermanagement core about changes)

	 change: edit drivers/acpi/ac.c

	 change: edit drivers/acpi/sbs.c

  	 Revision  by rafael.j.wysocki: (cpufreq: amd-pstate: remove global header file)

	 change: delete include/linux/amd-pstate.h

	 change: edit MAINTAINERS

	 change: edit drivers/cpufreq/amd-pstate-ut.c

	 change: edit drivers/cpufreq/amd-pstate.c

	 change: add drivers/cpufreq/amd-pstate.h

  	 Revision  by rafael.j.wysocki: (cpufreq: amd-pstate: Fix the inconsistency in max frequency units)

	 change: edit drivers/cpufreq/amd-pstate.c

  	 Revision  by kent.overstreet: (bcachefs: split out sb-members_format.h)

	 change: edit fs/bcachefs/bcachefs_format.h

	 change: add fs/bcachefs/sb-members_format.h

  	 Revision  by kent.overstreet: (bcachefs: split out sb-downgrade_format.h)

	 change: edit fs/bcachefs/bcachefs_format.h

	 change: add fs/bcachefs/sb-downgrade_format.h

  	 Revision  by kent.overstreet: (bcachefs: Split out disk_groups_format.h)

	 change: edit fs/bcachefs/bcachefs_format.h

	 change: add fs/bcachefs/disk_groups_format.h

  	 Revision  by kent.overstreet: (bcachefs: Split out replicas_format.h)

	 change: edit fs/bcachefs/bcachefs_format.h

	 change: add fs/bcachefs/replicas_format.h

  	 Revision  by kent.overstreet: (bcachefs: Split out journal_seq_blacklist_format.h)

	 change: edit fs/bcachefs/bcachefs_format.h

	 change: add fs/bcachefs/journal_seq_blacklist_format.h

  	 Revision  by kent.overstreet: (bcachefs: Split out sb-errors_format.h)

	 change: edit fs/bcachefs/bcachefs_format.h

	 change: add fs/bcachefs/sb-errors_format.h

	 change: edit fs/bcachefs/sb-errors_types.h

  	 Revision  by kent.overstreet: (bcachefs: Fix uninitialized var warning)

	 change: edit fs/bcachefs/backpointers.c

	 change: edit fs/bcachefs/buckets.c

  	 Revision  by pablo: (netfilter: nft_payload: skbuff vlan metadata mangle support)

	 change: edit net/netfilter/nft_payload.c

  	 Revision  by pablo: (netfilter: tproxy: bail out if IP has been disabled on the device)

	 change: edit net/ipv4/netfilter/nf_tproxy_ipv4.c

  	 Revision  by pablo: (netfilter: nft_fib: allow from forward/input without iif selector)

	 change: edit net/netfilter/nft_fib.c

  	 Revision  by dave.jiang: (cxl/test: Add missing vmalloc.h for tools/testing/cxl/test/mem.c)

	 change: edit tools/testing/cxl/test/mem.c

  	 Revision  by dave.jiang: (cxl/region: Fix memregion leaks in devm_cxl_add_region())

	 change: edit drivers/cxl/core/region.c

  	 Revision  by kent.overstreet: (bcachefs: Don&#039;t return -EROFS from mount on inconsistency error)

	 change: edit fs/bcachefs/fs.c

  	 Revision  by kuba: (net/sched: taprio: make q-&gt;picos_per_byte available to fill_sched_entry())

	 change: edit net/sched/sch_taprio.c

	 change: edit tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json

  	 Revision  by kuba: (net/sched: taprio: extend minimum interval restriction to entire cycle too)

	 change: edit tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json

	 change: edit net/sched/sch_taprio.c

  	 Revision  by boris.brezillon: (drm/panfrost: Fix dma_resv deadlock at drm object pin time)

	 change: edit drivers/gpu/drm/panfrost/panfrost_gem.c

  	 Revision  by boris.brezillon: (drm/lima: Fix dma_resv deadlock at drm object pin time)

	 change: edit drivers/gpu/drm/lima/lima_gem.c

  	 Revision  by boris.brezillon: (drm/gem-shmem: Add import attachment warning to locked pin function)

	 change: edit drivers/gpu/drm/drm_gem_shmem_helper.c

  	 Revision  by masahiroy: (kconfig: remove unused expr_is_no())

	 change: edit scripts/kconfig/expr.h

  	 Revision  by masahiroy: (kconfig: fix comparison to constant symbols, &#039;m&#039;, &#039;n&#039;)

	 change: edit scripts/kconfig/symbol.c

  	 Revision  by masahiroy: (kconfig: remove redundant check in expr_join_or())

	 change: edit scripts/kconfig/expr.c

  	 Revision  by masahiroy: (kbuild: scripts/gdb: Replace missed $(srctree)/$(src) w/ $(src))

	 change: edit scripts/gdb/linux/Makefile

  	 Revision  by masahiroy: (kbuild: avoid unneeded kallsyms step 3)

	 change: edit scripts/link-vmlinux.sh

	 change: edit scripts/mksysmap

  	 Revision  by masahiroy: (kbuild: change scripts/mksysmap into sed script)

	 change: edit scripts/link-vmlinux.sh

	 change: edit scripts/mksysmap

  	 Revision  by masahiroy: (kbuild: fix short log for AS in link-vmlinux.sh)

	 change: edit scripts/link-vmlinux.sh

  	 Revision  by masahiroy: (kbuild: remove a stale comment about cleaning in link-vmlinux.sh)

	 change: edit scripts/link-vmlinux.sh

  	 Revision  by masahiroy: (scripts/make_fit: Drop fdt image entry compatible string)

	 change: edit scripts/make_fit.py

  	 Revision  by jani.nikula: (Revert &quot;drm/i915: Remove extra multi-gt pm-references&quot;)

	 change: edit drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c

  	 Revision  by jani.nikula: (drm/i915/gt: Disarm breadcrumbs if engines are already idle)

	 change: edit drivers/gpu/drm/i915/gt/intel_breadcrumbs.c

  	 Revision  by jani.nikula: (drm/i915/guc: avoid FIELD_PREP warning)

	 change: edit drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h

  	 Revision  by dmitry.baryshkov: (drm/panel/lg-sw43408: select CONFIG_DRM_DISPLAY_DP_HELPER)

	 change: edit drivers/gpu/drm/panel/Kconfig

  	 Revision  by jani.nikula: (drm/i915/selftests: Set always_coherent to false when reading from CPU)

	 change: edit drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c

  	 Revision  by dmitry.baryshkov: (drm/panel/lg-sw43408: mark sw43408_backlight_ops as static)

	 change: edit drivers/gpu/drm/panel/panel-lg-sw43408.c

  	 Revision  by jani.nikula: (drm/i915/gt: Fix CCS id&#039;s calculation for CCS mode setting)

	 change: edit drivers/gpu/drm/i915/gt/intel_gt_types.h

	 change: edit drivers/gpu/drm/i915/gt/intel_engine_cs.c

	 change: edit drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c

  	 Revision  by jani.nikula: (drm/i915/dpt: Make DPT object unshrinkable)

	 change: edit drivers/gpu/drm/i915/gem/i915_gem_object.h

  	 Revision  by jani.nikula: (drm/i915: Fix audio component initialization)

	 change: edit drivers/gpu/drm/i915/display/intel_audio.c

	 change: edit drivers/gpu/drm/i915/display/intel_audio.h

	 change: edit drivers/gpu/drm/i915/display/intel_display_driver.c

  	 Revision  by tiwai: (ALSA: seq: Fix incorrect UMP type for system messages)

	 change: edit sound/core/seq/seq_ump_convert.c

  	 Revision  by tiwai: (ALSA: ump: Don&#039;t clear bank selection after sending a program change)

	 change: edit sound/core/ump_convert.c

  	 Revision  by tiwai: (ALSA: pcm: fix typo in comment)

	 change: edit include/sound/pcm.h

  	 Revision  by broonie: (ASoC: Intel: sof-sdw: fix missing SPI_MASTER dependency)

	 change: edit sound/soc/intel/boards/Kconfig

  	 Revision  by davem: (MAINTAINERS: dwmac: starfive: update Maintainer)

	 change: edit MAINTAINERS

  	 Revision  by davem: (nfc/nci: Add the inconsistency check between the input data length and count)

	 change: edit drivers/nfc/virtual_ncidev.c

  	 Revision  by mpe: (powerpc/bpf: enforce full ordering for ATOMIC operations with BPF_FETCH)

	 change: edit arch/powerpc/net/bpf_jit_comp64.c

	 change: edit arch/powerpc/net/bpf_jit_comp32.c

  	 Revision  by broonie: (ASoC: SOF: ipc4-topology: Fix input format query of process modules without base extension)

	 change: edit sound/soc/sof/ipc4-topology.c

  	 Revision  by broonie: (spi: cadence: Ensure data lines set to low during dummy-cycle period)

	 change: edit drivers/spi/spi-cadence-xspi.c

  	 Revision  by johannes.berg: (wifi: mac80211: mesh: Fix leak of mesh_preq_queue objects)

	 change: edit net/mac80211/mesh_pathtbl.c

  	 Revision  by johannes.berg: (wifi: mac80211: mesh: init nonpeer_pm to active by default in mesh sdata)

	 change: edit net/mac80211/mesh.c

  	 Revision  by johannes.berg: (wifi: mac80211: Fix deadlock in ieee80211_sta_ps_deliver_wakeup())

	 change: edit net/mac80211/sta_info.c

  	 Revision  by johannes.berg: (wifi: cfg80211: validate HE operation element parsing)

	 change: edit net/wireless/scan.c

  	 Revision  by johannes.berg: (wifi: cfg80211: fully move wiphy work to unbound workqueue)

	 change: edit net/wireless/core.c

	 change: edit net/wireless/sysfs.c

  	 Revision  by johannes.berg: (wifi: cfg80211: Lock wiphy in cfg80211_get_station)

	 change: edit net/wireless/util.c

  	 Revision  by johannes.berg: (wifi: cfg80211: pmsr: use correct nla_get_uX functions)

	 change: edit net/wireless/pmsr.c

  	 Revision  by johannes.berg: (wifi: mac80211: apply mcast rate only if interface is up)

	 change: edit net/mac80211/cfg.c

  	 Revision  by johannes.berg: (wifi: mac80211: handle tasklet frames before stopping)

	 change: edit net/mac80211/util.c

	 change: edit net/mac80211/ieee80211_i.h

	 change: edit net/mac80211/main.c

  	 Revision  by johannes.berg: (wifi: cfg80211: fix 6 GHz scan request building)

	 change: edit net/wireless/rdev-ops.h

	 change: edit net/wireless/scan.c

  	 Revision  by johannes.berg: (wifi: mac80211: pass proper link id for channel switch started notification)

	 change: edit net/mac80211/cfg.c

  	 Revision  by johannes.berg: (wifi: iwlwifi: mvm: don&#039;t initialize csa_work twice)

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c

  	 Revision  by johannes.berg: (wifi: iwlwifi: mvm: always set the TWT IE offset)

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/mvm.h

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c

  	 Revision  by johannes.berg: (wifi: iwlwifi: mvm: fix a crash on 7265)

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/fw.c

  	 Revision  by johannes.berg: (wifi: iwlwifi: mvm: d3: fix WoWLAN command version lookup)

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/d3.c

  	 Revision  by johannes.berg: (wifi: iwlwifi: mvm: revert gen2 TX A-MPDU size to 64)

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/rs.h

  	 Revision  by johannes.berg: (wifi: iwlwifi: mvm: set properly mac header)

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c

  	 Revision  by johannes.berg: (wifi: iwlwifi: dbg_ini: move iwl_dbg_tlv_free outside of debugfs ifdef)

	 change: edit drivers/net/wireless/intel/iwlwifi/iwl-drv.c

  	 Revision  by johannes.berg: (wifi: iwlwifi: mvm: remove stale STA link data during restart)

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/sta.h

  	 Revision  by johannes.berg: (wifi: iwlwifi: mvm: Handle BIGTK cipher in kek_kck cmd)

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/d3.c

  	 Revision  by johannes.berg: (wifi: iwlwifi: mvm: handle BA session teardown in RF-kill)

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/sta.c

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c

  	 Revision  by johannes.berg: (wifi: iwlwifi: mvm: properly set 6 GHz channel direct probe option)

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/scan.c

  	 Revision  by johannes.berg: (wifi: iwlwifi: mvm: check n_ssids before accessing the ssids)

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/scan.c

  	 Revision  by johannes.berg: (wifi: iwlwifi: mvm: Fix scan abort handling with HW rfkill)

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/scan.c

  	 Revision  by johannes.berg: (wifi: iwlwifi: mvm: don&#039;t read past the mfuart notifcation)

	 change: edit drivers/net/wireless/intel/iwlwifi/mvm/fw.c

  	 Revision  by johannes.berg: (wifi: mac80211: fix Spatial Reuse element size check)

	 change: edit net/mac80211/parse.c

  	 Revision  by johannes.berg: (wifi: mac80211: correctly parse Spatial Reuse Parameter Set element)

	 change: edit net/mac80211/he.c

  	 Revision  by johannes.berg: (wifi: mac80211: fix UBSAN noise in ieee80211_prep_hw_scan())

	 change: edit net/mac80211/scan.c

  	 Revision  by broonie: (spi: Assign dummy scatterlist to unidirectional transfers)

	 change: edit drivers/spi/spi.c

  	 Revision  by axboe: (io_uring: don&#039;t attempt to mmap larger than what the user asks for)

	 change: edit io_uring/memmap.c

  	 Revision  by masahiroy: (kheaders: explicitly define file modes for archived headers)

	 change: edit kernel/gen_kheaders.sh

  	 Revision  by masahiroy: (kheaders: use `command -v` to test for existence of `cpio`)

	 change: edit kernel/gen_kheaders.sh

  	 Revision  by masahiroy: (dt-bindings: kbuild: Fix dt_binding_check on unconfigured build)

	 change: edit scripts/dtc/Makefile

  	 Revision  by torvalds: (Revert &quot;vfs: Delete the associated dentry when deleting a file&quot;)

	 change: edit fs/dcache.c

  	 Revision  by tiwai: (ALSA: ump: Don&#039;t accept an invalid UMP protocol number)

	 change: edit sound/core/ump.c

  	 Revision  by tiwai: (ALSA: ump: Set default protocol when not given explicitly)

	 change: edit sound/core/ump.c

  	 Revision  by broonie: (spi: stm32: Don&#039;t warn about spurious interrupts)

	 change: edit drivers/spi/spi-stm32.c

  	 Revision  by robh: (dt-bindings: arm: sunxi: Fix incorrect &#039;-&#039; usage)

	 change: edit Documentation/devicetree/bindings/arm/sunxi.yaml

  	 Revision  by robh: (dt-bindings: arm: stm32: st,mlahb: Drop spurious &quot;reg&quot; property from example)

	 change: edit Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml

  	 Revision  by skhan: (kselftest/alsa: Ensure _GNU_SOURCE is defined)

	 change: edit tools/testing/selftests/alsa/Makefile

  	 Revision  by skhan: (selftests/ftrace: Fix to check required event file)

	 change: edit tools/testing/selftests/ftrace/test.d/dynevent/test_duplicates.tc

  	 Revision  by skhan: (selftests/ftrace: Update required config)

	 change: edit tools/testing/selftests/ftrace/config

  	 Revision  by skhan: (tracing/selftests: Fix kprobe event name test for .isra. functions)

	 change: edit tools/testing/selftests/ftrace/test.d/kprobe/kprobe_eventname.tc

  	 Revision  by skhan: (selftests: cachestat: Fix build warnings on ppc64)

	 change: edit tools/testing/selftests/cachestat/test_cachestat.c

  	 Revision  by skhan: (selftests/openat2: Fix build warnings on ppc64)

	 change: edit tools/testing/selftests/openat2/openat2_test.c

  	 Revision  by skhan: (selftests/overlayfs: Fix build error on ppc64)

	 change: edit tools/testing/selftests/filesystems/overlayfs/dev_in_maps.c

  	 Revision  by sboyd: (clk: sifive: Do not register clkdevs for PRCI clocks)

	 change: edit drivers/clk/sifive/sifive-prci.c

  	 Revision  by kent.overstreet: (bcachefs: Fix failure to return error on misaligned dio write)

	 change: edit fs/bcachefs/fs-io-direct.c

  	 Revision  by alexander.deucher: (drm/amdgpu: Adjust logic in amdgpu_device_partner_bandwidth())

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

  	 Revision  by alexander.deucher: (drm/amdgpu: silence UBSAN warning)

	 change: edit drivers/gpu/drm/amd/include/atomfirmware.h

  	 Revision  by alexander.deucher: (drm/amdgpu: fix dereference null return value for the function amdgpu_vm_pt_parent)

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c

  	 Revision  by alexander.deucher: (Revert &quot;drm/amdkfd: fix gfx_target_version for certain 11.0.3 devices&quot;)

	 change: edit drivers/gpu/drm/amd/amdkfd/kfd_device.c

  	 Revision  by alexander.deucher: (drm/amdkfd: simplify APU VRAM handling)

	 change: edit drivers/gpu/drm/amd/amdkfd/kfd_migrate.c

	 change: edit drivers/gpu/drm/amd/amdkfd/kfd_svm.h

	 change: edit drivers/gpu/drm/amd/amdkfd/kfd_svm.c

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c

  	 Revision  by alexander.deucher: (drm/amdgpu: Make CPX mode auto default in NPS4)

	 change: edit drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c

  	 Revision  by alexander.deucher: (drm/amd/pm: remove deprecated I2C_CLASS_SPD support from newly added SMU_14_0_2)

	 change: edit drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c

  	 Revision  by linux: (hwmon: (dell-smm) Add Dell G15 5511 to fan control whitelist)

	 change: edit drivers/hwmon/dell-smm-hwmon.c

  	 Revision  by linux: (hwmon: (ltc2992) Fix memory leak in ltc2992_parse_dt())

	 change: edit drivers/hwmon/ltc2992.c

  	 Revision  by kuba: (net: fix __dst_negative_advice() race)

	 change: edit net/ipv6/route.c

	 change: edit include/net/sock.h

	 change: edit net/ipv4/route.c

	 change: edit net/xfrm/xfrm_policy.c

	 change: edit include/net/dst_ops.h

  	 Revision  by kuba: (ipv4: correctly iterate over the target netns in inet_dump_ifaddr())

	 change: edit net/ipv4/devinet.c

  	 Revision  by kuba: (net: dsa: microchip: fix RGMII error in KSZ DSA driver)

	 change: edit drivers/net/dsa/microchip/ksz_common.c

  	 Revision  by kuba: (e1000e: move force SMBUS near the end of enable_ulp function)

	 change: edit drivers/net/ethernet/intel/e1000e/ich8lan.c

	 change: edit drivers/net/ethernet/intel/e1000e/netdev.c

  	 Revision  by kuba: (i40e: factoring out i40e_suspend/i40e_resume)

	 change: edit drivers/net/ethernet/intel/i40e/i40e_main.c

  	 Revision  by kuba: (i40e: Fully suspend and resume IO operations in EEH case)

	 change: edit drivers/net/ethernet/intel/i40e/i40e_main.c

  	 Revision  by kuba: (ice: fix 200G PHY types to link speed mapping)

	 change: edit drivers/net/ethernet/intel/ice/ice_common.c

  	 Revision  by kuba: (ice: check for unregistering correct number of devlink params)

	 change: edit drivers/net/ethernet/intel/ice/devlink/devlink.c

  	 Revision  by kuba: (net: ena: Fix redundant device NUMA node override)

	 change: edit drivers/net/ethernet/amazon/ena/ena_com.c

  	 Revision  by pabeni: (ipvlan: Dont Use skb-&gt;sk in ipvlan_process_v{4,6}_outbound)

	 change: edit drivers/net/ipvlan/ipvlan_core.c

  	 Revision  by tiwai: (ALSA: seq: Fix yet another spot for system message conversion)

	 change: edit sound/core/seq/seq_ump_convert.c

  	 Revision  by pabeni: (netdev: add qstat for csum complete)

	 change: edit include/uapi/linux/netdev.h

	 change: edit Documentation/netlink/specs/netdev.yaml

	 change: edit tools/include/uapi/linux/netdev.h

  	 Revision  by broonie: (ASoC: SOF: ipc4-topology: Add support for NHLT with 16-bit only DMIC blob)

	 change: edit sound/soc/sof/ipc4-topology.c

  	 Revision  by broonie: (ASoC: SOF: ipc4-topology: Print out the channel count in sof_ipc4_dbg_audio_format)

	 change: edit sound/soc/sof/ipc4-topology.c

  	 Revision  by broonie: (ASoC: SOF: ipc4-topology/pcm: Rename sof_ipc4_copier_is_single_format())

	 change: edit sound/soc/sof/ipc4-topology.h

	 change: edit sound/soc/sof/ipc4-pcm.c

	 change: edit sound/soc/sof/ipc4-topology.c

  	 Revision  by broonie: (ASoC: SOF: ipc4-topology: Improve readability of sof_ipc4_prepare_dai_copier())

	 change: edit sound/soc/sof/ipc4-topology.c

  	 Revision  by broonie: (ASoC: SOF: ipc4-topology: Adjust the params based on DAI formats)

	 change: edit sound/soc/sof/ipc4-topology.c

  	 Revision  by mpe: (powerpc/pseries/lparcfg: drop error message from guest name lookup)

	 change: edit arch/powerpc/platforms/pseries/lparcfg.c

  	 Revision  by mpe: (powerpc/uaccess: Fix build errors seen with GCC 13/14)

	 change: edit arch/powerpc/include/asm/uaccess.h

  	 Revision  by mpe: (powerpc/uaccess: Use YZ asm constraint for ld)

	 change: edit arch/powerpc/include/asm/uaccess.h

  	 Revision  by mpe: (powerpc: Limit ARCH_HAS_KERNEL_FPU_SUPPORT to PPC64)

	 change: edit arch/powerpc/Kconfig

  	 Revision  by neil.armstrong: (drm/panel: sitronix-st7789v: fix timing for jt240mhqs_hwt_ek_e3 panel)

	 change: edit drivers/gpu/drm/panel/panel-sitronix-st7789v.c

  	 Revision  by neil.armstrong: (drm/panel: sitronix-st7789v: tweak timing for jt240mhqs_hwt_ek_e3 panel)

	 change: edit drivers/gpu/drm/panel/panel-sitronix-st7789v.c

  	 Revision  by neil.armstrong: (drm/panel: sitronix-st7789v: fix display size for jt240mhqs_hwt_ek_e3 panel)

	 change: edit drivers/gpu/drm/panel/panel-sitronix-st7789v.c

  	 Revision  by bp: (x86/topology/amd: Evaluate SMT in CPUID leaf 0x8000001e only on family 0x17 and greater)

	 change: edit arch/x86/kernel/cpu/topology_amd.c

  	 Revision  by axboe: (io_uring/rw: Free iovec before cleaning async data)

	 change: edit io_uring/opdef.c

  	 Revision  by hverkuil: (media: mei: csi: Put the IPU device reference)

	 change: edit drivers/media/pci/intel/ivsc/mei_csi.c

  	 Revision  by hverkuil: (media: mei: csi: Warn less verbosely of a missing device fwnode)

	 change: edit drivers/media/pci/intel/ivsc/mei_csi.c

  	 Revision  by hverkuil: (media: intel/ipu6: update the maximum supported csi2 port number to 6)

	 change: edit drivers/media/pci/intel/ipu6/ipu6.c

  	 Revision  by hverkuil: (media: intel/ipu6: add csi2 port sanity check in notifier bound)

	 change: edit drivers/media/pci/intel/ipu6/ipu6-isys.c

  	 Revision  by dave.hansen: (x86/cpu: Provide default cache line size if not enumerated)

	 change: edit arch/x86/kernel/cpu/common.c

  	 Revision  by linux: (hwmon: (intel-m10-bmc-hwmon) Fix multiplier for N6000 board power sensor)

	 change: edit drivers/hwmon/intel-m10-bmc-hwmon.c

  	 Revision  by linux: (hwmon: (shtc1) Fix property misspelling)

	 change: edit drivers/hwmon/shtc1.c

  	 Revision  by maz: (KVM: arm64: nv: Fix relative priorities of exceptions generated by ERETAx)

	 change: edit arch/arm64/kvm/emulate-nested.c

  	 Revision  by maz: (KVM: arm64: nv: Expose BTI and CSV_frac to a guest hypervisor)

	 change: edit arch/arm64/kvm/nested.c

  	 Revision  by palmer: (riscv: prevent pt_regs corruption for secondary idle threads)

	 change: edit arch/riscv/kernel/cpu_ops_spinwait.c

	 change: edit arch/riscv/kernel/cpu_ops_sbi.c

  	 Revision  by palmer: (riscv: enable HAVE_ARCH_HUGE_VMAP for XIP kernel)

	 change: edit arch/riscv/Kconfig

  	 Revision  by palmer: (Documentation: RISC-V: uabi: Only scalar misaligned loads are supported)

	 change: edit Documentation/arch/riscv/uabi.rst

  	 Revision  by palmer: (riscv: Fix fully ordered LR/SC xchg[8|16]() implementations)

	 change: edit arch/riscv/include/asm/cmpxchg.h

  	 Revision  by treding: (drm/msm: remove python 3.9 dependency for compiling msm)

	 change: edit drivers/gpu/drm/msm/registers/gen_header.py

  	 Revision  by skhan: (selftests/futex: pass _GNU_SOURCE without a value to the compiler)

	 change: edit tools/testing/selftests/futex/functional/Makefile

  	 Revision  by axboe: (io_uring/net: assign kmsg inq/flags before buffer selection)

	 change: edit io_uring/net.c

  	 Revision  by axboe: (null_blk: Do not allow runt zone with zone capacity smaller then zone size)

	 change: edit drivers/block/null_blk/zoned.c

  	 Revision  by axboe: (block: Fix validation of zoned device with a runt zone)

	 change: edit block/blk-zoned.c

  	 Revision  by axboe: (block: Fix zone write plugging handling of devices with a runt zone)

	 change: edit include/linux/blkdev.h

	 change: edit block/blk-zoned.c

  	 Revision  by martin.petersen: (scsi: ufs: mcq: Fix error output and clean up ufshcd_mcq_abort())

	 change: edit drivers/ufs/core/ufs-mcq.c

  	 Revision  by robh: (of/irq: Factor out parsing of interrupt-map parent phandle+args from of_irq_parse_raw())

	 change: edit drivers/of/irq.c

	 change: edit drivers/of/of_private.h

  	 Revision  by robh: (of: property: Fix fw_devlink handling of interrupt-map)

	 change: edit drivers/of/property.c

  	 Revision  by axboe: (blk-throttle: Fix incorrect display of io.max)

	 change: edit block/blk-throttle.c

	 change: edit block/blk-throttle.h

  	 Revision  by anup: (RISC-V: KVM: No need to use mask when hart-index-bit is 0)

	 change: edit arch/riscv/kvm/aia_device.c

  	 Revision  by anup: (RISC-V: KVM: Fix incorrect reg_subtype labels in kvm_riscv_vcpu_set_reg_isa_ext function)

	 change: edit arch/riscv/kvm/vcpu_onereg.c

  	 Revision  by tiwai: (ALSA: seq: ump: Fix swapped song position pointer data)

	 change: edit sound/core/seq/seq_ump_convert.c

  	 Revision  by mingo: (perf/x86/rapl: Add missing MODULE_DESCRIPTION() line)

	 change: edit arch/x86/events/rapl.c

  	 Revision  by mingo: (perf/x86/intel: Add missing MODULE_DESCRIPTION() lines)

	 change: edit arch/x86/events/intel/uncore.c

	 change: edit arch/x86/events/intel/cstate.c

  	 Revision  by mingo: (sched/x86: Export &#039;percpu arch_freq_scale&#039;)

	 change: edit arch/x86/kernel/cpu/aperfmperf.c

  	 Revision  by liviu.dudau: (drm/komeda: remove unused struct &#039;gamma_curve_segment&#039;)

	 change: edit drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.c

  	 Revision  by cassel: (ata: libata-core: Add ATA_HORKAGE_NOLPM for Crucial CT240BX500SSD1)

	 change: edit drivers/ata/libata-core.c

  	 Revision  by cassel: (ata: libata-core: Add ATA_HORKAGE_NOLPM for AMD Radeon S3 SSD)

	 change: edit drivers/ata/libata-core.c

  	 Revision  by cassel: (ata: libata-core: Add ATA_HORKAGE_NOLPM for Apacer AS340)

	 change: edit drivers/ata/libata-core.c

  	 Revision  by skhan: (selftests/tracing: Fix event filter test to retry up to 10 times)

	 change: edit tools/testing/selftests/ftrace/test.d/filter/event-filter-function.tc

  	 Revision  by mic: (landlock: Fix d_parent walk)

	 change: edit security/landlock/fs.c

  	 Revision  by mic: (selftests/landlock: Add layout1.refer_mount_root)

	 change: edit tools/testing/selftests/landlock/fs_test.c

  	 Revision  by stfrench: (cifs: fix creating sockets when using sfu mount options)

	 change: edit fs/smb/client/smb2ops.c

	 change: edit fs/smb/client/cifspdu.h

	 change: edit fs/smb/client/inode.c

  	 Revision  by kees: (scsi: mpt3sas: Avoid possible run-time warning with long manufacturer strings)

	 change: edit drivers/scsi/mpt3sas/mpt3sas_transport.c

	 change: edit drivers/scsi/mpt3sas/mpt3sas_base.c

  	 Revision  by kees: (mailmap: update entry for Kees Cook)

	 change: edit .mailmap

  	 Revision  by jassisinghbrar: (mailbox: zynqmp-ipi: drop irq_to_desc() call)

	 change: edit drivers/mailbox/zynqmp-ipi-mailbox.c

  	 Revision  by bp: (x86/topology/intel: Unlock CPUID before evaluating anything)

	 change: edit arch/x86/kernel/cpu/cpu.h

	 change: edit arch/x86/kernel/cpu/intel.c

	 change: edit arch/x86/kernel/cpu/common.c

  	 Revision  by kbusch: (nvme-fabrics: use reserved tag for reg read/write command)

	 change: edit drivers/nvme/host/fabrics.c

  	 Revision  by skhan: (selftests/futex: don&#039;t redefine .PHONY targets (all, clean))

	 change: edit tools/testing/selftests/futex/Makefile

  	 Revision  by skhan: (selftests/futex: don&#039;t pass a const char* to asprintf(3))

	 change: edit tools/testing/selftests/futex/functional/futex_requeue_pi.c

  	 Revision  by kees: (kunit/fortify: Remove __kmalloc_node() test)

	 change: edit lib/fortify_kunit.c

  	 Revision  by kbusch: (nvme: fix nvme_pr_* status code parsing)

	 change: edit drivers/nvme/host/pr.c

  	 Revision  by ast: (selftests/bpf: fix inet_csk_accept prototype in test_sk_storage_tracing.c)

	 change: edit tools/testing/selftests/bpf/progs/test_sk_storage_tracing.c

  	 Revision  by ast: (bpf: Fix bpf_session_cookie BTF_ID in special_kfunc_set list)

	 change: edit kernel/bpf/verifier.c

	 change: edit kernel/trace/bpf_trace.c

  	 Revision  by ast: (libbpf: don&#039;t close(-1) in multi-uprobe feature detector)

	 change: edit tools/lib/bpf/features.c

  	 Revision  by gregkh: (Revert &quot;VT: Use macros to define ioctls&quot;)

	 change: edit include/uapi/linux/kd.h

  	 Revision  by kvalo: (Revert &quot;wifi: wilc1000: convert list management to RCU&quot;)

	 change: edit drivers/net/wireless/microchip/wilc1000/hif.c

	 change: edit drivers/net/wireless/microchip/wilc1000/netdev.h

	 change: edit drivers/net/wireless/microchip/wilc1000/wlan.c

	 change: edit drivers/net/wireless/microchip/wilc1000/cfg80211.c

	 change: edit drivers/net/wireless/microchip/wilc1000/netdev.c

  	 Revision  by kvalo: (Revert &quot;wifi: wilc1000: set atomic flag on kmemdup in srcu critical section&quot;)

	 change: edit drivers/net/wireless/microchip/wilc1000/hif.c

  	 Revision  by kvalo: (wifi: wilc1000: document SRCU usage instead of SRCU)

	 change: edit drivers/net/wireless/microchip/wilc1000/netdev.h

  	 Revision  by kvalo: (wifi: mt76: mt7615: add missing chanctx ops)

	 change: edit drivers/net/wireless/mediatek/mt76/mt7615/main.c

  	 Revision  by kvalo: (wifi: rtlwifi: Ignore IEEE80211_CONF_CHANGE_RETRY_LIMITS)

	 change: edit drivers/net/wireless/realtek/rtlwifi/core.c

  	 Revision  by axboe: (io_uring: check for non-NULL file pointer in io_file_can_poll())

	 change: edit io_uring/io_uring.h

  	 Revision  by kuba: (virtio_net: fix missing lock protection on control_buf access)

	 change: edit drivers/net/virtio_net.c

  	 Revision  by kuba: (MAINTAINERS: remove Peter Geis)

	 change: edit MAINTAINERS

  	 Revision  by kuba: (ethtool: init tsinfo stats if requested)

	 change: edit net/ethtool/tsinfo.c

  	 Revision  by kuba: (virtio_net: fix possible dim status unrecoverable)

	 change: edit drivers/net/virtio_net.c

  	 Revision  by kuba: (virtio_net: fix a spurious deadlock issue)

	 change: edit drivers/net/virtio_net.c

  	 Revision  by kuba: (ax25: Fix refcount imbalance on inbound connections)

	 change: edit net/ax25/af_ax25.c

  	 Revision  by kuba: (ax25: Replace kfree() in ax25_dev_free() with ax25_dev_put())

	 change: edit net/ax25/ax25_dev.c

  	 Revision  by kuba: (net: rps: fix error when CONFIG_RFS_ACCEL is off)

	 change: edit net/core/dev.c

  	 Revision  by kuba: (net/ncsi: Fix the multi thread manner of NCSI driver)

	 change: edit net/ncsi/internal.h

	 change: edit net/ncsi/ncsi-rsp.c

	 change: edit net/ncsi/ncsi-manage.c

  	 Revision  by kuba: (net/tcp: Don&#039;t consider TCP_CLOSE in TCP_AO_ESTABLISHED)

	 change: edit include/net/tcp_ao.h

	 change: edit net/ipv4/tcp_ao.c

  	 Revision  by torvalds: (Linux 6.10-rc2)

	 change: edit Makefile

  	 Revision  by chenhuacai: (LoongArch: Remove CONFIG_ACPI_TABLE_UPGRADE in platform_init())

	 change: edit arch/loongarch/kernel/setup.c

  	 Revision  by chenhuacai: (LoongArch: Fix built-in DTB detection)

	 change: edit arch/loongarch/kernel/setup.c

  	 Revision  by chenhuacai: (LoongArch: Add all CPUs enabled by fdt to NUMA node 0)

	 change: edit arch/loongarch/kernel/smp.c

	 change: edit arch/loongarch/include/asm/numa.h

  	 Revision  by chenhuacai: (LoongArch: Fix entry point in kernel image header)

	 change: edit arch/loongarch/kernel/head.S

	 change: edit arch/loongarch/kernel/vmlinux.lds.S

	 change: edit drivers/firmware/efi/libstub/loongarch.c

  	 Revision  by chenhuacai: (LoongArch: Override higher address bits in JUMP_VIRT_ADDR)

	 change: edit arch/loongarch/include/asm/stackframe.h

  	 Revision  by chenhuacai: (LoongArch: Fix GMAC&#039;s phy-mode definitions in dts)

	 change: edit arch/loongarch/boot/dts/loongson-2k2000-ref.dts

	 change: edit arch/loongarch/boot/dts/loongson-2k0500-ref.dts

	 change: edit arch/loongarch/boot/dts/loongson-2k1000-ref.dts

  	 Revision  by neil.armstrong: (drm/panel: sitronix-st7789v: Add check for of_drm_get_panel_orientation)

	 change: edit drivers/gpu/drm/panel/panel-sitronix-st7789v.c

  	 Revision  by hdegoede: (Input: silead - Always support 10 fingers)

	 change: edit drivers/input/touchscreen/silead.c

  	 Revision  by hdegoede: (platform/x86: touchscreen_dmi: Drop &quot;silead,max-fingers&quot; property)

	 change: edit drivers/platform/x86/touchscreen_dmi.c

  	 Revision  by hdegoede: (platform/x86: touchscreen_dmi: Use 2-argument strscpy())

	 change: edit drivers/platform/x86/touchscreen_dmi.c

  	 Revision  by hdegoede: (platform/x86: yt2-1380: add CONFIG_EXTCON dependency)

	 change: edit drivers/platform/x86/Kconfig

  	 Revision  by hdegoede: (platform/x86: dell-smbios: Fix wrong token data in sysfs)

	 change: edit drivers/platform/x86/dell/dell-smbios-base.c

  	 Revision  by hdegoede: (platform/x86: dell-smbios: Simplify error handling)

	 change: edit drivers/platform/x86/dell/dell-smbios-base.c

  	 Revision  by hdegoede: (platform/x86/amd/hsmp: Check HSMP support on AMD family of processors)

	 change: edit drivers/platform/x86/amd/hsmp.c

  	 Revision  by tglx: (irqchip/riscv-intc: Prevent memory leak when riscv_intc_init_common() fails)

	 change: edit drivers/irqchip/irq-riscv-intc.c

  	 Revision  by davem: (net: phy: micrel: fix KSZ9477 PHY issues after suspend/resume)

	 change: edit drivers/net/phy/micrel.c

  	 Revision  by tglx: (irqchip/sifive-plic: Chain to parent IRQ after handlers are ready)

	 change: edit drivers/irqchip/irq-sifive-plic.c

  	 Revision  by bartosz.golaszewski: (gpio: tqmx86: fix typo in Kconfig label)

	 change: edit drivers/gpio/Kconfig

  	 Revision  by bartosz.golaszewski: (gpio: tqmx86: introduce shadow register for GPIO output value)

	 change: edit drivers/gpio/gpio-tqmx86.c

  	 Revision  by bartosz.golaszewski: (gpio: tqmx86: store IRQ trigger type and unmask status separately)

	 change: edit drivers/gpio/gpio-tqmx86.c

  	 Revision  by bartosz.golaszewski: (gpio: tqmx86: fix broken IRQ_TYPE_EDGE_BOTH interrupt type)

	 change: edit drivers/gpio/gpio-tqmx86.c

  	 Revision  by chuck.lever: (SUNRPC: Fix loop termination condition in gss_free_in_token_pages())

	 change: edit net/sunrpc/auth_gss/svcauth_gss.c

  	 Revision  by penguin-kernel: (tomoyo: update project links)

	 change: edit MAINTAINERS

	 change: edit security/tomoyo/Kconfig

	 change: edit security/tomoyo/common.c

	 change: edit Documentation/admin-guide/LSM/tomoyo.rst

  	 Revision  by palmer: (riscv: fix overlap of allocated page and PTR_ERR)

	 change: edit arch/riscv/mm/init.c

  	 Revision  by palmer: (Revert &quot;riscv: mm: accelerate pagefault when badaccess&quot;)

	 change: edit arch/riscv/mm/fault.c

  	 Revision  by daniel: (bpf, devmap: Remove unnecessary if check in for loop)

	 change: edit kernel/bpf/devmap.c

  	 Revision  by bp: (x86/kexec: Fix bug with call depth tracking)

	 change: edit arch/x86/kernel/machine_kexec_64.c

  	 Revision  by rafael.j.wysocki: (cpufreq: intel_pstate: Fix unchecked HWP MSR access)

	 change: edit drivers/cpufreq/intel_pstate.c

  	 Revision  by daniel: (bpf: Fix a potential use-after-free in bpf_link_free())

	 change: edit kernel/bpf/syscall.c

  	 Revision  by tglx: (irqchip/gic-v3-its: Fix potential race condition in its_vlpi_prop_update())

	 change: edit drivers/irqchip/irq-gic-v3-its.c

  	 Revision  by pbonzini: (KVM: SEV-ES: Prevent MSR access post VMSA encryption)

	 change: edit arch/x86/kvm/svm/svm.c

  	 Revision  by pbonzini: (KVM: SEV-ES: Disallow SEV-ES guests when X86_FEATURE_LBRV is absent)

	 change: edit arch/x86/kvm/svm/svm.h

	 change: edit arch/x86/kvm/svm/svm.c

	 change: edit arch/x86/kvm/svm/sev.c

  	 Revision  by pbonzini: (KVM: SEV-ES: Delegate LBR virtualization to the processor)

	 change: edit arch/x86/kvm/svm/svm.c

	 change: edit arch/x86/kvm/svm/svm.h

	 change: edit arch/x86/kvm/svm/sev.c

  	 Revision  by pbonzini: (KVM: x86: Drop support for hand tuning APIC timer advancement from userspace)

	 change: edit arch/x86/kvm/lapic.c

	 change: edit arch/x86/kvm/lapic.h

	 change: edit arch/x86/kvm/x86.c

  	 Revision  by acme: (tools headers uapi: Sync linux/stat.h with the kernel sources to pick STATX_SUBVOL)

	 change: edit tools/include/uapi/linux/stat.h

  	 Revision  by kuba: (vmxnet3: disable rx data ring on dma allocation failure)

	 change: edit drivers/net/vmxnet3/vmxnet3_drv.c

  	 Revision  by kuba: (ipv6: ioam: block BH from ioam6_output())

	 change: edit net/ipv6/ioam6_iptunnel.c

  	 Revision  by kuba: (net: ipv6: rpl_iptunnel: block BH in rpl_output() and rpl_input())

	 change: edit net/ipv6/rpl_iptunnel.c

  	 Revision  by kuba: (ipv6: sr: block BH in seg6_output_core() and seg6_input_core())

	 change: edit net/ipv6/seg6_iptunnel.c

  	 Revision  by kuba: (ila: block BH in ila_output())

	 change: edit net/ipv6/ila/ila_lwt.c

  	 Revision  by kuba: (net: dst_cache: add two DEBUG_NET warnings)

	 change: edit net/core/dst_cache.c

  	 Revision  by kuba: (lib/test_rhashtable: add missing MODULE_DESCRIPTION() macro)

	 change: edit lib/test_rhashtable.c

  	 Revision  by jikos: (HID: core: remove unnecessary WARN_ON() in implement())

	 change: edit drivers/hid/hid-core.c

  	 Revision  by bp: (EDAC/amd64: Convert PCIBIOS_* return codes to errnos)

	 change: edit drivers/edac/amd64_edac.c

  	 Revision  by bp: (EDAC/igen6: Convert PCIBIOS_* return codes to errnos)

	 change: edit drivers/edac/igen6_edac.c

  	 Revision  by pabeni: (net: tls: fix marking packets as decrypted)

	 change: edit net/ipv4/tcp.c

  	 Revision  by jroedel: (iommu/amd: Fix sysfs leak in iommu init)

	 change: edit drivers/iommu/amd/init.c

  	 Revision  by jroedel: (iommu/dma: Fix domain init)

	 change: edit drivers/iommu/dma-iommu.c

  	 Revision  by jroedel: (iommu: Return right value in iommu_sva_bind_device())

	 change: edit include/linux/iommu.h

  	 Revision  by jroedel: (iommu/amd: Fix workqueue name)

	 change: edit drivers/iommu/amd/ppr.c

  	 Revision  by jroedel: (iommu/amd: Check EFR[EPHSup] bit before enabling PPR)

	 change: edit drivers/iommu/amd/amd_iommu.h

  	 Revision  by jroedel: (iommu/amd: Fix Invalid wait context issue)

	 change: edit drivers/iommu/amd/ppr.c

	 change: edit drivers/iommu/amd/iommu.c

  	 Revision  by axboe: (io_uring/napi: fix timeout calculation)

	 change: edit io_uring/napi.c

  	 Revision  by axboe: (io_uring/io-wq: avoid garbage value of &#039;match&#039; in io_wq_enqueue())

	 change: edit io_uring/io-wq.c

  	 Revision  by axboe: (io_uring: fix possible deadlock in io_register_iowq_max_workers())

	 change: edit io_uring/register.c

  	 Revision  by maz: (KVM: arm64: Reintroduce __sve_save_state)

	 change: edit arch/arm64/kvm/hyp/fpsimd.S

	 change: edit arch/arm64/include/asm/kvm_hyp.h

  	 Revision  by maz: (KVM: arm64: Fix prototype for __sve_save_state/__sve_restore_state)

	 change: edit arch/arm64/include/asm/kvm_hyp.h

	 change: edit arch/arm64/kvm/hyp/include/hyp/switch.h

  	 Revision  by maz: (KVM: arm64: Abstract set/clear of CPTR_EL2 bits behind helper)

	 change: edit arch/arm64/include/asm/kvm_emulate.h

	 change: edit arch/arm64/kvm/hyp/nvhe/hyp-main.c

	 change: edit arch/arm64/include/asm/kvm_arm.h

	 change: edit arch/arm64/kvm/hyp/include/hyp/switch.h

  	 Revision  by maz: (KVM: arm64: Specialize handling of host fpsimd state on trap)

	 change: edit arch/arm64/kvm/hyp/vhe/switch.c

	 change: edit arch/arm64/kvm/hyp/include/hyp/switch.h

	 change: edit arch/arm64/kvm/hyp/nvhe/switch.c

  	 Revision  by maz: (KVM: arm64: Allocate memory mapped at hyp for host sve state in pKVM)

	 change: edit arch/arm64/kvm/reset.c

	 change: edit arch/arm64/include/asm/kvm_host.h

	 change: edit arch/arm64/include/asm/kvm_hyp.h

	 change: edit arch/arm64/include/asm/kvm_pkvm.h

	 change: edit arch/arm64/kvm/hyp/nvhe/setup.c

	 change: edit arch/arm64/kvm/arm.c

	 change: edit arch/arm64/kvm/hyp/nvhe/pkvm.c

  	 Revision  by maz: (KVM: arm64: Eagerly restore host fpsimd/sve state in pKVM)

	 change: edit arch/arm64/kvm/hyp/nvhe/hyp-main.c

	 change: edit arch/arm64/kvm/hyp/nvhe/pkvm.c

	 change: edit arch/arm64/kvm/hyp/include/hyp/switch.h

	 change: edit arch/arm64/kvm/hyp/nvhe/switch.c

  	 Revision  by maz: (KVM: arm64: Consolidate initializing the host data&#039;s fpsimd_state/sve in pKVM)

	 change: edit arch/arm64/kvm/hyp/include/nvhe/pkvm.h

	 change: edit arch/arm64/kvm/arm.c

	 change: edit arch/arm64/kvm/hyp/nvhe/pkvm.c

	 change: edit arch/arm64/kvm/hyp/nvhe/setup.c

	 change: edit arch/arm64/include/asm/kvm_host.h

  	 Revision  by maz: (KVM: arm64: Refactor CPACR trap bit setting/clearing to use ELx format)

	 change: edit arch/arm64/include/asm/kvm_emulate.h

	 change: edit arch/arm64/kvm/fpsimd.c

	 change: edit arch/arm64/include/asm/el2_setup.h

	 change: edit arch/arm64/kvm/hyp/nvhe/pkvm.c

	 change: edit arch/arm64/kvm/hyp/vhe/switch.c

	 change: edit arch/arm64/kvm/hyp/nvhe/switch.c

  	 Revision  by maz: (KVM: arm64: Ensure that SME controls are disabled in protected mode)

	 change: edit arch/arm64/kvm/fpsimd.c

	 change: edit arch/arm64/kvm/hyp/nvhe/hyp-main.c

  	 Revision  by jikos: (HID: logitech-dj: Fix memory leak in logi_dj_recv_switch_to_dj_mode())

	 change: edit drivers/hid/hid-logitech-dj.c

  	 Revision  by jikos: (HID: nintendo: Fix an error handling path in nintendo_hid_probe())

	 change: edit drivers/hid/hid-nintendo.c

  	 Revision  by jikos: (HID: intel-ish-hid: fix endian-conversion)

	 change: edit drivers/hid/intel-ish-hid/ishtp/loader.h

	 change: edit drivers/hid/intel-ish-hid/ishtp/loader.c

  	 Revision  by jikos: (HID: logitech-hidpp: add missing MODULE_DESCRIPTION() macro)

	 change: edit drivers/hid/hid-logitech-hidpp.c

  	 Revision  by thomas.hellstrom: (drm/xe/pf: Update the LMTT when freeing VF GT config)

	 change: edit drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c

  	 Revision  by bhelgaas: (PCI: Revert the cfg_access_lock lockdep mechanism)

	 change: edit drivers/pci/probe.c

	 change: edit drivers/pci/access.c

	 change: edit include/linux/lockdep.h

	 change: edit include/linux/pci.h

	 change: edit drivers/pci/pci.c

  	 Revision  by acme: (tools headers arm64: Sync arm64&#039;s cputype.h with the kernel sources)

	 change: edit tools/arch/arm64/include/asm/cputype.h

  	 Revision  by jarkko: (tpm_tis: Do *not* flush uninitialized work)

	 change: edit drivers/char/tpm/tpm_tis_core.c

  	 Revision  by jarkko: (tpm: Switch to new Intel CPU model defines)

	 change: edit drivers/char/tpm/tpm.h

	 change: edit drivers/char/tpm/tpm_tis_core.h

  	 Revision  by daniel: (bpf: Set run context for rawtp test_run callback)

	 change: edit net/bpf/test_run.c

  	 Revision  by daniel: (Revert &quot;xsk: Support redirect to any socket bound to the same umem&quot;)

	 change: edit net/xdp/xsk.c

  	 Revision  by daniel: (Revert &quot;xsk: Document ability to redirect to any socket bound to the same umem&quot;)

	 change: edit Documentation/networking/af_xdp.rst

  	 Revision  by ardb: (efi: Add missing __nocfi annotations to runtime wrappers)

	 change: edit drivers/firmware/efi/runtime-wrappers.c

  	 Revision  by davem: (octeontx2-af: Always allocate PF entries from low prioriy zone)

	 change: edit drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c

  	 Revision  by davem: (net/smc: avoid overwriting when adjusting sock bufsizes)

	 change: edit net/smc/af_smc.c

  	 Revision  by davem: (net: phy: Micrel KSZ8061: fix errata solution not taking effect problem)

	 change: edit drivers/net/phy/micrel.c

  	 Revision  by davem: (ionic: fix kernel panic in XDP_TX action)

	 change: edit drivers/net/ethernet/pensando/ionic/ionic_txrx.c

  	 Revision  by davem: (net: sched: sch_multiq: fix possible OOB write in multiq_tune())

	 change: edit net/sched/sch_multiq.c

  	 Revision  by davem: (vxlan: Fix regression when dropping packets due to invalid src addresses)

	 change: edit drivers/net/vxlan/vxlan_core.c

  	 Revision  by davem: (selftests: hsr: add missing config for CONFIG_BRIDGE)

	 change: edit tools/testing/selftests/net/hsr/config

  	 Revision  by will: (arm64: armv8_deprecated: Fix warning in isndep cpuhp starting process)

	 change: edit arch/arm64/kernel/armv8_deprecated.c

  	 Revision  by pbonzini: (KVM: x86/mmu: Don&#039;t save mmu_invalidate_seq after checking private attr)

	 change: edit arch/x86/kvm/mmu/mmu.c

  	 Revision  by davem: (tcp: count CLOSE-WAIT sockets for TCP_MIB_CURRESTAB)

	 change: edit net/ipv4/tcp.c

  	 Revision  by davem: (mptcp: count CLOSE-WAIT sockets for MPTCP_MIB_CURRESTAB)

	 change: edit net/mptcp/protocol.c

  	 Revision  by davem: (rtnetlink: make the &quot;split&quot; NLM_DONE handling generic)

	 change: edit net/core/rtnetlink.c

	 change: edit net/ipv4/devinet.c

	 change: edit include/net/rtnetlink.h

	 change: edit net/ipv4/fib_frontend.c

  	 Revision  by will: (arm64/io: add constant-argument check)

	 change: edit arch/arm64/include/asm/io.h

  	 Revision  by davem: (net: ethernet: mtk_eth_soc: handle dma buffer size soc specific)

	 change: edit drivers/net/ethernet/mediatek/mtk_eth_soc.h

	 change: edit drivers/net/ethernet/mediatek/mtk_eth_soc.c

  	 Revision  by davem: (net/mlx5: Stop waiting for PCI if pci channel is offline)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/lib/pci_vsc.c

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/fw.c

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/health.c

  	 Revision  by davem: (net/mlx5: Always stop health timer during driver removal)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/main.c

  	 Revision  by peterz: (perf/core: Fix missing wakeup when waiting for context reference)

	 change: edit kernel/events/core.c

  	 Revision  by peterz: (locking/atomic: scripts: fix ${atomic}_sub_and_test() kerneldoc)

	 change: edit scripts/atomic/kerneldoc/sub_and_test

	 change: edit include/linux/atomic/atomic-long.h

	 change: edit include/linux/atomic/atomic-instrumented.h

	 change: edit include/linux/atomic/atomic-arch-fallback.h

  	 Revision  by acme: (Revert &quot;perf record: Reduce memory for recording PERF_RECORD_LOST_SAMPLES event&quot;)

	 change: edit tools/perf/builtin-record.c

  	 Revision  by acme: (perf bpf: Fix handling of minimal vmlinux.h file when interrupting the build)

	 change: edit tools/perf/Makefile.perf

  	 Revision  by kent.overstreet: (bcachefs: Fix GFP_KERNEL allocation in break_cycle())

	 change: edit fs/bcachefs/btree_locking.c

  	 Revision  by kent.overstreet: (bcachefs: Rereplicate now moves data off of durability=0 devices)

	 change: edit fs/bcachefs/move.c

  	 Revision  by kent.overstreet: (bcachefs: Fix trans-&gt;locked assert)

	 change: edit fs/bcachefs/move.c

  	 Revision  by agordeev: (s390/crash: Do not use VM info if os_info does not have it)

	 change: edit arch/s390/kernel/crash_dump.c

  	 Revision  by agordeev: (KVM: s390x: selftests: Add shared zeropage test)

	 change: add tools/testing/selftests/kvm/s390x/shared_zeropage_test.c

	 change: edit tools/testing/selftests/kvm/Makefile

  	 Revision  by dsterba: (btrfs: fix crash on racing fsync and size-extending write into prealloc)

	 change: edit fs/btrfs/tree-log.c

  	 Revision  by dsterba: (btrfs: fix leak of qgroup extent records after transaction abort)

	 change: edit fs/btrfs/disk-io.c

  	 Revision  by alexander.deucher: (drm/amd: Fix shutdown (again) on some SMU v13.0.4/11 platforms)

	 change: edit drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c

  	 Revision  by alexander.deucher: (drm/amdgpu/pptable: Fix UBSAN array-index-out-of-bounds)

	 change: edit drivers/gpu/drm/amd/include/pptable.h

  	 Revision  by axboe: (null_blk: fix validation of block size)

	 change: edit drivers/block/null_blk/main.c

  	 Revision  by bp: (x86/amd_nb: Check for invalid SMN reads)

	 change: edit arch/x86/kernel/amd_nb.c

  	 Revision  by kuba: (net/mlx5: Fix tainted pointer delete is case of flow rules creation fail)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/lag/port_sel.c

  	 Revision  by kuba: (net/sched: taprio: always validate TCA_TAPRIO_ATTR_PRIOMAP)

	 change: edit net/sched/sch_taprio.c

  	 Revision  by kuba: (ptp: Fix error message on failed pin verification)

	 change: edit drivers/ptp/ptp_chardev.c

  	 Revision  by zack.rusin: (drm/vmwgfx: Filter modes which exceed graphics memory)

	 change: edit drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c

  	 Revision  by zack.rusin: (drm/vmwgfx: 3D disabled should not effect STDU memory limits)

	 change: edit drivers/gpu/drm/vmwgfx/vmwgfx_drv.c

  	 Revision  by zack.rusin: (drm/vmwgfx: Remove STDU logic from generic mode_valid function)

	 change: edit drivers/gpu/drm/vmwgfx/vmwgfx_drv.h

	 change: edit drivers/gpu/drm/vmwgfx/vmwgfx_kms.c

  	 Revision  by zack.rusin: (drm/vmwgfx: Standardize use of kibibytes when logging)

	 change: edit drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c

	 change: edit drivers/gpu/drm/vmwgfx/vmwgfx_drv.c

  	 Revision  by zack.rusin: (drm/vmwgfx: Don&#039;t destroy Screen Target when CRTC is enabled but inactive)

	 change: edit drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c

  	 Revision  by akpm: (mm: drop the &#039;anon_&#039; prefix for swap-out mTHP counters)

	 change: edit mm/page_io.c

	 change: edit mm/vmscan.c

	 change: edit mm/huge_memory.c

	 change: edit include/linux/huge_mm.h

	 change: edit Documentation/admin-guide/mm/transhuge.rst

  	 Revision  by akpm: (mm: huge_mm: fix undefined reference to `mthp_stats&#039; for CONFIG_SYSFS=n)

	 change: edit include/linux/huge_mm.h

  	 Revision  by akpm: (mm: arm64: fix the out-of-bounds issue in contpte_clear_young_dirty_ptes)

	 change: edit arch/arm64/mm/contpte.c

  	 Revision  by akpm: (memcg: remove the lockdep assert from __mod_objcg_mlstate())

	 change: edit mm/memcontrol.c

  	 Revision  by akpm: (nilfs2: fix potential kernel bug due to lack of writeback flag waiting)

	 change: edit fs/nilfs2/segment.c

  	 Revision  by akpm: (mm: page_alloc: fix highatomic typing in multi-block buddies)

	 change: edit mm/page_alloc.c

  	 Revision  by akpm: (vmalloc: check CONFIG_EXECMEM in is_vmalloc_or_module_addr())

	 change: edit mm/vmalloc.c

  	 Revision  by akpm: (kmsan: do not wipe out origin when doing partial unpoisoning)

	 change: edit mm/kmsan/core.c

  	 Revision  by akpm: (mm/ksm: fix ksm_pages_scanned accounting)

	 change: edit mm/ksm.c

  	 Revision  by akpm: (mm/ksm: fix ksm_zero_pages accounting)

	 change: edit include/linux/mm_types.h

	 change: edit fs/proc/base.c

	 change: edit include/linux/ksm.h

	 change: edit mm/ksm.c

  	 Revision  by akpm: (mm/hugetlb: do not call vma_add_reservation upon ENOMEM)

	 change: edit mm/hugetlb.c

  	 Revision  by akpm: (codetag: avoid race at alloc_slab_obj_exts)

	 change: edit mm/slub.c

  	 Revision  by akpm: (mm: fix xyz_noprof functions calling profiled functions)

	 change: edit mm/filemap.c

	 change: edit mm/util.c

	 change: edit mm/mempool.c

  	 Revision  by akpm: (nilfs2: fix nilfs_empty_dir() misjudgment and long loop on I/O errors)

	 change: edit fs/nilfs2/dir.c

  	 Revision  by zack.rusin: (drm/vmwgfx: remove unused struct &#039;vmw_stdu_dma&#039;)

	 change: edit drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c

  	 Revision  by kuba: (ice: fix iteration of TLVs in Preserved Fields Area)

	 change: edit drivers/net/ethernet/intel/ice/ice_nvm.c

  	 Revision  by kuba: (ice: fix reads from NVM Shadow RAM on E830 and E825-C devices)

	 change: edit drivers/net/ethernet/intel/ice/ice_type.h

	 change: edit drivers/net/ethernet/intel/ice/ice_nvm.c

  	 Revision  by kuba: (ice: remove af_xdp_zc_qps bitmap)

	 change: edit drivers/net/ethernet/intel/ice/ice.h

	 change: edit drivers/net/ethernet/intel/ice/ice_xsk.c

	 change: edit drivers/net/ethernet/intel/ice/ice_lib.c

  	 Revision  by kuba: (ice: add flag to distinguish reset from .ndo_bpf in XDP rings config)

	 change: edit drivers/net/ethernet/intel/ice/ice_lib.c

	 change: edit drivers/net/ethernet/intel/ice/ice_main.c

	 change: edit drivers/net/ethernet/intel/ice/ice.h

  	 Revision  by kuba: (ice: map XDP queues to vectors in ice_vsi_map_rings_to_vectors())

	 change: edit drivers/net/ethernet/intel/ice/ice_lib.c

	 change: edit drivers/net/ethernet/intel/ice/ice_base.c

	 change: edit drivers/net/ethernet/intel/ice/ice.h

	 change: edit drivers/net/ethernet/intel/ice/ice_main.c

  	 Revision  by kuba: (igc: Fix Energy Efficient Ethernet support declaration)

	 change: edit drivers/net/ethernet/intel/igc/igc_ethtool.c

	 change: edit drivers/net/ethernet/intel/igc/igc_main.c

  	 Revision  by zack.rusin: (drm/vmwgfx: Don&#039;t memcmp equivalent pointers)

	 change: edit drivers/gpu/drm/vmwgfx/vmwgfx_kms.c

  	 Revision  by pabeni: (net: wwan: iosm: Fix tainted pointer delete is case of region creation fail)

	 change: edit drivers/net/wwan/iosm/iosm_ipc_devlink.c

  	 Revision  by pabeni: (af_unix: Set sk-&gt;sk_state under unix_state_lock() for truly disconencted peer.)

	 change: edit net/unix/af_unix.c

  	 Revision  by pabeni: (af_unix: Annodate data-races around sk-&gt;sk_state for writers.)

	 change: edit net/unix/af_unix.c

  	 Revision  by pabeni: (af_unix: Annotate data-race of sk-&gt;sk_state in unix_inq_len().)

	 change: edit net/unix/af_unix.c

  	 Revision  by pabeni: (af_unix: Annotate data-races around sk-&gt;sk_state in unix_write_space() and poll().)

	 change: edit net/unix/af_unix.c

  	 Revision  by pabeni: (af_unix: Annotate data-race of sk-&gt;sk_state in unix_stream_connect().)

	 change: edit net/unix/af_unix.c

  	 Revision  by pabeni: (af_unix: Annotate data-race of sk-&gt;sk_state in unix_accept().)

	 change: edit net/unix/af_unix.c

  	 Revision  by pabeni: (af_unix: Annotate data-races around sk-&gt;sk_state in sendmsg() and recvmsg().)

	 change: edit net/unix/af_unix.c

  	 Revision  by pabeni: (af_unix: Annotate data-race of sk-&gt;sk_state in unix_stream_read_skb().)

	 change: edit net/unix/af_unix.c

  	 Revision  by pabeni: (af_unix: Annotate data-races around sk-&gt;sk_state in UNIX_DIAG.)

	 change: edit net/unix/diag.c

  	 Revision  by pabeni: (af_unix: Annotate data-races around sk-&gt;sk_sndbuf.)

	 change: edit net/unix/af_unix.c

  	 Revision  by pabeni: (af_unix: Annotate data-race of net-&gt;unx.sysctl_max_dgram_qlen.)

	 change: edit net/unix/af_unix.c

  	 Revision  by pabeni: (af_unix: Use unix_recvq_full_lockless() in unix_stream_connect().)

	 change: edit net/unix/af_unix.c

  	 Revision  by pabeni: (af_unix: Use skb_queue_empty_lockless() in unix_release_sock().)

	 change: edit net/unix/af_unix.c

  	 Revision  by pabeni: (af_unix: Use skb_queue_len_lockless() in sk_diag_show_rqlen().)

	 change: edit net/unix/diag.c

  	 Revision  by pabeni: (af_unix: Annotate data-race of sk-&gt;sk_shutdown in sk_diag_fill().)

	 change: edit net/unix/diag.c

  	 Revision  by masahiroy: (kconfig: remove unneeded code for user-supplied values being out of range)

	 change: edit scripts/kconfig/confdata.c

  	 Revision  by masahiroy: (kconfig: gconf: give a proper initial state to the Save button)

	 change: edit scripts/kconfig/gconf.c

  	 Revision  by masahiroy: (kconfig: doc: fix a typo in the note about &#039;imply&#039;)

	 change: edit Documentation/kbuild/kconfig-language.rst

  	 Revision  by masahiroy: (kconfig: doc: document behavior of &#039;select&#039; and &#039;imply&#039; followed by &#039;if&#039;)

	 change: edit Documentation/kbuild/kconfig-language.rst

  	 Revision  by pabeni: (ipv6: fix possible race in __fib6_drop_pcpu_from())

	 change: edit net/ipv6/ip6_fib.c

	 change: edit net/ipv6/route.c

  	 Revision  by masahiroy: (kconfig: remove wrong expr_trans_bool())

	 change: edit scripts/kconfig/menu.c

	 change: edit scripts/kconfig/expr.c

	 change: edit scripts/kconfig/expr.h

  	 Revision  by pabeni: (net: ethtool: fix the error condition in ethtool_get_phy_stats_ethtool())

	 change: edit net/ethtool/ioctl.c

  	 Revision  by cassel: (ata: pata_macio: Fix max_segment_size with PAGE_SIZE == 64K)

	 change: edit drivers/ata/pata_macio.c

  	 Revision  by kuba: (selftests: net: lib: support errexit with busywait)

	 change: edit tools/testing/selftests/net/lib.sh

  	 Revision  by kuba: (selftests: net: lib: avoid error removing empty netns name)

	 change: edit tools/testing/selftests/net/lib.sh

  	 Revision  by kuba: (selftests: net: lib: set &#039;i&#039; as local)

	 change: edit tools/testing/selftests/net/lib.sh

  	 Revision  by dsterba: (btrfs: protect folio::private when attaching extent buffer folios)

	 change: edit fs/btrfs/extent_io.c

  	 Revision  by masahiroy: (kbuild: explicitly run mksysmap as sed script from link-vmlinux.sh)

	 change: edit scripts/link-vmlinux.sh

  	 Revision  by masahiroy: (modpost: do not warn about missing MODULE_DESCRIPTION() for vmlinux.o)

	 change: edit scripts/mod/modpost.c

  	 Revision  by stfrench: (smb: client: fix deadlock in smb2_find_smb_tcon())

	 change: edit fs/smb/client/smb2transport.c

  	 Revision  by stfrench: (cifs: Don&#039;t advance the I/O iterator before terminating subrequest)

	 change: edit fs/smb/client/smb2pdu.c

  	 Revision  by bartosz.golaszewski: (gpio: add missing MODULE_DESCRIPTION() macros)

	 change: edit drivers/gpio/gpio-pcf857x.c

	 change: edit drivers/gpio/gpio-pl061.c

	 change: edit drivers/gpio/gpio-gw-pld.c

	 change: edit drivers/gpio/gpio-mc33880.c

  	 Revision  by bentiss: (hid: asus: asus_report_fixup: fix potential read out of bounds)

	 change: edit drivers/hid/hid-asus.c

  	 Revision  by bentiss: (input: Add event code for accessibility key)

	 change: edit drivers/hid/hid-input.c

	 change: edit include/uapi/linux/input-event-codes.h

	 change: edit drivers/hid/hid-debug.c

  	 Revision  by bentiss: (input: Add support for &quot;Do Not Disturb&quot;)

	 change: edit drivers/hid/hid-input.c

	 change: edit include/uapi/linux/input-event-codes.h

	 change: edit drivers/hid/hid-debug.c

  	 Revision  by bentiss: (dt-bindings: HID: i2c-hid: add dedicated Ilitek ILI2901 schema)

	 change: add Documentation/devicetree/bindings/input/ilitek,ili2901.yaml

	 change: edit Documentation/devicetree/bindings/input/elan,ekth6915.yaml

  	 Revision  by bentiss: (dt-bindings: HID: i2c-hid: elan: add Elan eKTH5015M)

	 change: edit Documentation/devicetree/bindings/input/elan,ekth6915.yaml

  	 Revision  by bentiss: (dt-bindings: HID: i2c-hid: elan: add &#039;no-reset-on-power-off&#039; property)

	 change: edit Documentation/devicetree/bindings/input/elan,ekth6915.yaml

  	 Revision  by bentiss: (HID: i2c-hid: elan: fix reset suspend current leakage)

	 change: edit drivers/hid/i2c-hid/i2c-hid-of-elan.c

  	 Revision  by jikos: (HID: Ignore battery for ELAN touchscreens 2F2C and 4116)

	 change: edit drivers/hid/hid-input.c

	 change: edit drivers/hid/hid-ids.h

  	 Revision  by torvalds: (Linux 6.10-rc3)

	 change: edit Makefile

  	 Revision  by hverkuil: (media: mediatek: vcodec: add decoder command to support stateless decoder)

	 change: edit drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c

  	 Revision  by hverkuil: (media: mediatek: vcodec: Handle invalid decoder vsi)

	 change: edit drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c

  	 Revision  by hverkuil: (media: mediatek: vcodec: Fix unreasonable data conversion)

	 change: edit drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c

  	 Revision  by hverkuil: (media: mediatek: vcodec: Alloc DMA memory with DMA_ATTR_ALLOC_SINGLE_PAGES)

	 change: edit drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c

  	 Revision  by hverkuil: (media: v4l2-ctrls: Add average QP control)

	 change: edit drivers/media/v4l2-core/v4l2-ctrls-defs.c

	 change: edit include/uapi/linux/v4l2-controls.h

	 change: edit Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst

  	 Revision  by hverkuil: (media: amphion: Remove lock in s_ctrl callback)

	 change: edit drivers/media/platform/amphion/vdec.c

	 change: edit drivers/media/platform/amphion/venc.c

  	 Revision  by hverkuil: (media: amphion: Report the average QP of current encoded frame)

	 change: edit drivers/media/platform/amphion/vpu_v4l2.h

	 change: edit drivers/media/platform/amphion/vpu.h

	 change: edit drivers/media/platform/amphion/vpu_windsor.c

	 change: edit drivers/media/platform/amphion/vpu_v4l2.c

	 change: edit drivers/media/platform/amphion/venc.c

	 change: edit drivers/media/platform/amphion/vpu_defs.h
------=_Part_1_228328241.1718013944839--

