Return-Path: <linux-media+bounces-44246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAE8BD2001
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 10:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEFFC18958BE
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 08:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9D42F2903;
	Mon, 13 Oct 2025 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="mccpO4n0"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB222EAD0F
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 08:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760343676; cv=none; b=hoBqFslyBjXQ2L8PfteCafDQQg5tMdENvt+1uxj6V3lEJdYKXxfE2wuZ9GzrxNFVvALJGRu/X0v72Y5rtRtribYhqkeHbMOHQeERHwOsPV51MM5/F0/AVFEUT1EqJDlPtyxKYz+UMT1FxcqngrSJuBJo1zOrVcPZBUjDoB6oM9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760343676; c=relaxed/simple;
	bh=plC427OWMD+BJRFBj3E4MUOS5kxSuNQeYz/WODvoBs0=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=b7VWZRsEb8IbzKM41S2xj8a81TTUKPrdkGL25pGtHHuzH1TCxnep7bKti1m126gXqo2dfkZIsXJIB7ckxkQH4IwsNeE7tW7YqzR6xMKr+opCDkfNi4xzHZGZ3V9XWTFKFvTnSbrHuaFOIotjc+EZp3kSS0UR6e3JiMqkdX0st7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=mccpO4n0; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=List-ID:Content-Type:MIME-Version:Subject:Message-ID:To:Reply-To:
	From:Date:Sender:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=dG3rSrdSSievpv86JDOuv0kR7wHtnngA+CGSvTuK+j4=; b=m
	ccpO4n0dgg3nC5IkBhZ9AGRAU0to7UsE89OPNEy9ugSu12kaQBvsAmVJAi8L5bFF1tsO6zxL6ZuQR
	h4V6F03Da2CQjga+0O8RYExfHjThqOBcCyGH4V7kVmIN0dN81N/aIQGousKKae8K0bqtJNBs5+STe
	HX16z2Z/7EyUiXmvIL4BN3sVu/+I7a+RmEXqhb3VYS43fD7j6XZ4Bw5IeNtEhdf1IlfxFJEG548dY
	96TtoIrjiwAVmMl0vc9zy6MLgHBri0N2SsHNVWp6+AuMK5Fe9Fifli638om1S+GXzJRVXHKi/BzZa
	ZKQqAYZ2nfJZE5+8eUhuW6JQsK88PMH6g==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1v8Dnn-0001rI-0k;
	Mon, 13 Oct 2025 08:21:07 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1v8Dnm-00GMTo-2a;
	Mon, 13 Oct 2025 08:21:06 +0000
Date: Mon, 13 Oct 2025 08:21:05 +0000 (UTC)
From: Jenkins Builder Robot <jenkins@linuxtv.org>
Reply-To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org
To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org
Message-ID: <1848929797.2.1760343666807@builder.linuxtv.org>
Subject: [Jenkins] media.git_drivers_build #438: build failed for x86_64
 allyesconfig x86_64 allmodconfig x86_64 no PM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1_1036049877.1760343666568"
X-Jenkins-Job: media.git_drivers_build

------=_Part_1_1036049877.1760343666568
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Some tests failed:
	FAIL: x86_64 allyesconfig
	FAIL: x86_64 allmodconfig
	FAIL: x86_64 no PM
	PASS: arm32 allmodconfig
	PASS: arm32 allyesconfig
	PASS: arm64 allyesconfig
	PASS: arm64 allmodconfig
	PASS: clang15 allmodconfig

GENERAL INFO

BUILD SUCCESSFUL
Build URL: https://builder.linuxtv.org/job/media.git_drivers_build/438/
Project: media.git_drivers_build
Date of build: Mon, 13 Oct 2025 07:05:08 GMT
Build duration: 1 hr 15 min and counting


CHANGE SET

  	 Revision  by rafael.j.wysocki: (PM: runtime: Add basic kunit tests for API contracts)

	 change: edit drivers/base/Kconfig

	 change: edit drivers/base/power/Makefile

	 change: add drivers/base/power/runtime-test.c

  	 Revision  by rafael.j.wysocki: (PM: runtime: Make put{,_sync}() return 1 when already suspended)

	 change: edit drivers/base/power/runtime-test.c

	 change: edit drivers/base/power/runtime.c

  	 Revision  by rafael.j.wysocki: (PM: runtime: Update kerneldoc return codes)

	 change: edit include/linux/pm_runtime.h

  	 Revision  by tiwai: (ALSA: hda/realtek: Add quirk for HP Spectre 14t-ea100)

	 change: edit sound/hda/codecs/realtek/alc269.c

  	 Revision  by rafael.j.wysocki: (PM: sleep: Do not wait on SYNC_STATE_ONLY device links)

	 change: edit drivers/base/power/main.c

	 change: edit drivers/base/base.h

	 change: edit drivers/base/core.c

  	 Revision  by asmadeus: (9p: clean up comment typos)

	 change: edit fs/9p/v9fs.c

  	 Revision  by asmadeus: (9p: fix /sys/fs/9p/caches overwriting itself)

	 change: edit fs/9p/v9fs.c

  	 Revision  by asmadeus: (9p: sysfs_init: don&#039;t hardcode error to ENOMEM)

	 change: edit fs/9p/v9fs.c

  	 Revision  by rostedt: (tracing: fgraph: Protect return handler from recursion loop)

	 change: edit kernel/trace/fgraph.c

  	 Revision  by ast: (bpf: Enforce expected_attach_type for tailcall compatibility)

	 change: edit kernel/bpf/core.c

	 change: edit include/linux/bpf.h

  	 Revision  by ast: (selftests/bpf: Add test case for different expected_attach_type)

	 change: add tools/testing/selftests/bpf/progs/test_xdp_devmap_tailcall.c

	 change: edit tools/testing/selftests/bpf/prog_tests/xdp_devmap_attach.c

  	 Revision  by luiz.von.dentz: (Bluetooth: btintel: Add support for BlazarIW core)

	 change: edit drivers/bluetooth/btintel.c

	 change: edit drivers/bluetooth/btintel_pcie.c

  	 Revision  by luiz.von.dentz: (Bluetooth: btintel_pcie: Add support for _suspend() / _resume())

	 change: edit drivers/bluetooth/btintel_pcie.c

  	 Revision  by luiz.von.dentz: (Bluetooth: btintel_pcie: Add Bluetooth core/platform as comments)

	 change: edit drivers/bluetooth/btintel_pcie.c

  	 Revision  by luiz.von.dentz: (Bluetooth: btintel_pcie: Add id of Scorpious, Panther Lake-H484)

	 change: edit drivers/bluetooth/btintel_pcie.c

  	 Revision  by luiz.von.dentz: (Bluetooth: btintel_pcie: Move model comment before its definition)

	 change: edit drivers/bluetooth/btintel_pcie.c

  	 Revision  by luiz.von.dentz: (Bluetooth: btusb: Add USB ID 2001:332a for D-Link AX9U rev. A1)

	 change: edit drivers/bluetooth/btusb.c

  	 Revision  by luiz.von.dentz: (Bluetooth: btintel_pcie: Define hdev-&gt;wakeup() callback)

	 change: edit drivers/bluetooth/btintel_pcie.c

  	 Revision  by luiz.von.dentz: (Bluetooth: Annotate struct hci_drv_rp_read_info with __counted_by_le())

	 change: edit include/net/bluetooth/hci_drv.h

  	 Revision  by luiz.von.dentz: (Bluetooth: btintel_pcie: Use strscpy() instead of strscpy_pad())

	 change: edit drivers/bluetooth/btintel_pcie.c

  	 Revision  by luiz.von.dentz: (Bluetooth: btintel_pcie: Refactor Device Coredump)

	 change: edit drivers/bluetooth/btintel_pcie.c

	 change: edit drivers/bluetooth/btintel_pcie.h

  	 Revision  by luiz.von.dentz: (MAINTAINERS: add a sub-entry for the Qualcomm bluetooth driver)

	 change: edit MAINTAINERS

  	 Revision  by luiz.von.dentz: (Bluetooth: ISO: Don&#039;t initiate CIS connections if there are no buffers)

	 change: edit net/bluetooth/iso.c

  	 Revision  by luiz.von.dentz: (Bluetooth: HCI: Fix using LE/ACL buffers for ISO packets)

	 change: edit net/bluetooth/hci_event.c

	 change: edit net/bluetooth/hci_conn.c

	 change: edit net/bluetooth/hci_core.c

  	 Revision  by luiz.von.dentz: (Bluetooth: ISO: Use sk_sndtimeo as conn_timeout)

	 change: edit net/bluetooth/iso.c

	 change: edit include/net/bluetooth/hci_core.h

	 change: edit net/bluetooth/hci_conn.c

  	 Revision  by luiz.von.dentz: (Bluetooth: hci_core: Detect if an ISO link has stalled)

	 change: edit include/net/bluetooth/hci.h

	 change: edit net/bluetooth/hci_core.c

	 change: edit include/net/bluetooth/hci_core.h

  	 Revision  by luiz.von.dentz: (Bluetooth: MGMT: Fix not exposing debug UUID on MGMT_OP_READ_EXP_FEATURES_INFO)

	 change: edit net/bluetooth/mgmt.c

  	 Revision  by luiz.von.dentz: (Bluetooth: Add function and line information to bt_dbg)

	 change: edit include/net/bluetooth/bluetooth.h

  	 Revision  by luiz.von.dentz: (Bluetooth: hci_core: Print number of packets in conn-&gt;data_q)

	 change: edit net/bluetooth/hci_core.c

  	 Revision  by luiz.von.dentz: (Bluetooth: hci_core: Print information of hcon on hci_low_sent)

	 change: edit net/bluetooth/hci_core.c

  	 Revision  by luiz.von.dentz: (Bluetooth: btusb: Check for unexpected bytes when defragmenting HCI frames)

	 change: edit drivers/bluetooth/btusb.c

  	 Revision  by luiz.von.dentz: (Bluetooth: remove duplicate h4_recv_buf() in header)

	 change: delete drivers/bluetooth/h4_recv.h

	 change: edit drivers/bluetooth/btmtksdio.c

	 change: edit drivers/bluetooth/bpa10x.c

	 change: edit drivers/bluetooth/btmtkuart.c

	 change: edit drivers/bluetooth/btnxpuart.c

  	 Revision  by luiz.von.dentz: (Bluetooth: btusb: Add new VID/PID 13d3/3627 for MT7925)

	 change: edit drivers/bluetooth/btusb.c

  	 Revision  by luiz.von.dentz: (Bluetooth: btusb: Add new VID/PID 13d3/3633 for MT7922)

	 change: edit drivers/bluetooth/btusb.c

  	 Revision  by luiz.von.dentz: (Bluetooth: bcsp: receive data only if registered)

	 change: edit drivers/bluetooth/hci_bcsp.c

  	 Revision  by luiz.von.dentz: (Bluetooth: SCO: Fix UAF on sco_conn_free)

	 change: edit net/bluetooth/sco.c

  	 Revision  by luiz.von.dentz: (Bluetooth: ISO: Fix possible UAF on iso_conn_free)

	 change: edit net/bluetooth/iso.c

  	 Revision  by luiz.von.dentz: (Bluetooth: ISO: free rx_skb if not consumed)

	 change: edit net/bluetooth/iso.c

  	 Revision  by luiz.von.dentz: (Bluetooth: ISO: don&#039;t leak skb in ISO_CONT RX)

	 change: edit net/bluetooth/iso.c

  	 Revision  by luiz.von.dentz: (Bluetooth: hci_sync: Fix using random address for BIG/PA advertisements)

	 change: edit net/bluetooth/hci_sync.c

  	 Revision  by luiz.von.dentz: (Bluetooth: Avoid a couple dozen -Wflex-array-member-not-at-end warnings)

	 change: edit include/net/bluetooth/mgmt.h

	 change: edit net/bluetooth/mgmt_config.c

  	 Revision  by kuba: (net/mlx5: Expose uar access and odp page fault counters)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/diag/reporter_vnic.c

	 change: edit Documentation/networking/devlink/mlx5.rst

  	 Revision  by jarkko: (KEYS: trusted_tpm1: Compare HMAC values in constant time)

	 change: edit security/keys/trusted-keys/trusted_tpm1.c

  	 Revision  by jarkko: (KEYS: trusted_tpm1: Use SHA-1 library instead of crypto_shash)

	 change: edit security/keys/trusted-keys/trusted_tpm1.c

	 change: edit security/keys/trusted-keys/Kconfig

  	 Revision  by jarkko: (KEYS: trusted_tpm1: Move private functionality out of public header)

	 change: edit include/keys/trusted_tpm.h

	 change: edit security/keys/trusted-keys/trusted_tpm1.c

  	 Revision  by wsa+renesas: (MAINTAINERS: delete email for Tharun Kumar P)

	 change: edit MAINTAINERS

  	 Revision  by wsa+renesas: (MAINTAINERS: Add me as maintainer of Synopsys DesignWare I2C driver)

	 change: edit MAINTAINERS

  	 Revision  by wsa+renesas: (MAINTAINERS: add entry for SpacemiT K1 I2C driver)

	 change: edit MAINTAINERS

  	 Revision  by daniel.lezcano: (thermal/drivers/renesas/rzg3e: Fix add thermal driver for the Renesas RZ/G3E SoC)

	 change: add drivers/thermal/renesas/rzg3e_thermal.c

  	 Revision  by wsa+renesas: (i2c: rtl9300: Drop unsupported I2C_FUNC_SMBUS_I2C_BLOCK)

	 change: edit drivers/i2c/busses/i2c-rtl9300.c

  	 Revision  by wsa+renesas: (dt-bindings: i2c: i2c-mt65xx: Add MediaTek MT8196/6991 compatibles)

	 change: edit Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml

  	 Revision  by wsa+renesas: (i2c: i801: Add support for Intel Wildcat Lake-U)

	 change: edit Documentation/i2c/busses/i2c-i801.rst

	 change: edit drivers/i2c/busses/i2c-i801.c

	 change: edit drivers/i2c/busses/Kconfig

  	 Revision  by viro: (kernel/acct.c: saner struct file treatment)

	 change: edit kernel/acct.c

  	 Revision  by viro: (Have cc(1) catch attempts to modify -&gt;f_path)

	 change: edit fs/open.c

	 change: edit fs/file_table.c

	 change: edit include/linux/fs.h

	 change: edit fs/namei.c

  	 Revision  by o-takashi: (firewire: core: fix undefined reference error in ARM EABI)

	 change: edit drivers/firewire/core.h

  	 Revision  by herbert: (KEYS: X.509: Fix Basic Constraints CA flag parsing)

	 change: edit crypto/asymmetric_keys/x509_cert_parser.c

  	 Revision  by herbert: (hwrng: ks-sa - fix division by zero in ks_sa_rng_init)

	 change: edit drivers/char/hw_random/ks-sa-rng.c

  	 Revision  by herbert: (crypto: doc - Add explicit title heading to API docs)

	 change: edit Documentation/crypto/api-sig.rst

	 change: edit Documentation/crypto/api-akcipher.rst

	 change: edit Documentation/crypto/api-skcipher.rst

	 change: edit Documentation/crypto/api-rng.rst

	 change: edit Documentation/crypto/api-digest.rst

	 change: edit Documentation/crypto/api-aead.rst

	 change: edit Documentation/crypto/api-kpp.rst

  	 Revision  by herbert: (dt-bindings: rng: hisi-rng: convert to DT schema)

	 change: add Documentation/devicetree/bindings/rng/hisi-rng.yaml

	 change: delete Documentation/devicetree/bindings/rng/hisi-rng.txt

  	 Revision  by dmitry.torokhov: (dt-bindings: input: Add Awinic AW86927)

	 change: add Documentation/devicetree/bindings/input/awinic,aw86927.yaml

  	 Revision  by dmitry.torokhov: (Input: aw86927 - add driver for Awinic AW86927)

	 change: edit drivers/input/misc/Kconfig

	 change: edit drivers/input/misc/Makefile

	 change: add drivers/input/misc/aw86927.c

  	 Revision  by tiwai: (ASoC: cs35l56: Set fw_regs table after getting REVID)

	 change: edit sound/hda/codecs/side-codecs/cs35l56_hda_i2c.c

	 change: edit sound/soc/codecs/cs35l56-sdw.c

	 change: edit sound/soc/codecs/cs35l56-spi.c

	 change: edit sound/soc/codecs/cs35l56-shared.c

	 change: edit sound/hda/codecs/side-codecs/cs35l56_hda.c

	 change: edit sound/soc/codecs/cs35l56-i2c.c

	 change: edit include/sound/cs35l56.h

	 change: edit sound/hda/codecs/side-codecs/cs35l56_hda_spi.c

  	 Revision  by tiwai: (ASoC: cs35l56: Add support for CS35L56 B2 silicon)

	 change: edit include/sound/cs35l56.h

	 change: edit sound/soc/codecs/cs35l56-shared.c

  	 Revision  by tiwai: (ALSA: compress: document &#039;chan_map&#039; member in snd_dec_opus)

	 change: edit include/uapi/sound/compress_params.h

  	 Revision  by tiwai: (ALSA: usb-audio: add mono main switch to Presonus S1824c)

	 change: edit sound/usb/mixer_s1810c.c

  	 Revision  by tiwai: (ALSA: usb-audio: fix race condition to UAF in snd_usbmidi_free)

	 change: edit sound/usb/midi.c

  	 Revision  by tiwai: (ALSA: usb-audio: add two-way convert between name and bit for QUIRK_FLAG_*)

	 change: edit sound/usb/quirks.c

	 change: edit sound/usb/usbaudio.h

	 change: edit sound/usb/quirks.h

  	 Revision  by tiwai: (ALSA: usb-audio: improve module param quirk_flags)

	 change: edit sound/usb/card.c

	 change: edit sound/usb/quirks.h

	 change: edit sound/usb/quirks.c

  	 Revision  by tiwai: (ALSA: usb-audio: make param quirk_flags change-able in runtime)

	 change: edit sound/usb/card.c

  	 Revision  by tiwai: (ALSA: doc: improved docs about quirk_flags in snd-usb-audio)

	 change: edit Documentation/sound/alsa-configuration.rst

  	 Revision  by leon: (net/mlx5: Add IFC bit for TIR/SQ order capability)

	 change: edit include/linux/mlx5/mlx5_ifc.h

  	 Revision  by leon: (net/mlx5: IFC add balance ID and LAG per MP group bits)

	 change: edit include/linux/mlx5/mlx5_ifc.h

  	 Revision  by ast: (selftests/bpf: Add stress test for rqspinlock in NMI)

	 change: edit tools/testing/selftests/bpf/Makefile

	 change: edit tools/testing/selftests/bpf/prog_tests/res_spin_lock.c

	 change: edit tools/testing/selftests/bpf/testing_helpers.h

	 change: edit tools/testing/selftests/bpf/test_kmods/Makefile

	 change: add tools/testing/selftests/bpf/test_kmods/bpf_test_rqspinlock.c

	 change: edit tools/testing/selftests/bpf/testing_helpers.c

  	 Revision  by rafael.j.wysocki: (ACPI: battery: Add synchronization between interface updates)

	 change: edit drivers/acpi/battery.c

  	 Revision  by rafael.j.wysocki: (ACPI: APEI: Remove redundant rcu_read_lock/unlock() under spinlock)

	 change: edit drivers/acpi/apei/ghes.c

  	 Revision  by ast: (libbpf: Replace AF_ALG with open coded SHA-256)

	 change: edit tools/lib/bpf/libbpf_internal.h

	 change: edit tools/lib/bpf/gen_loader.c

	 change: edit tools/lib/bpf/libbpf.c

  	 Revision  by nathan: (modpost: Initialize builtin_modname to stop SIGSEGVs)

	 change: edit scripts/mod/file2alias.c

  	 Revision  by wim: (dt-bindings: watchdog: add SMARC-sAM67 support)

	 change: edit Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml

  	 Revision  by wim: (watchdog/hpwdt New maintianer)

	 change: edit MAINTAINERS

  	 Revision  by tiwai: (ALSA: usb-audio: add the initial mix for Presonus Studio 1824c)

	 change: edit sound/usb/mixer_s1810c.c

  	 Revision  by tiwai: (ALSA: usb-audio: don&#039;t hardcode gain for output channel of Presonus Studio)

	 change: edit sound/usb/mixer_s1810c.c

  	 Revision  by akpm: (kho: only fill kimage if KHO is finalized)

	 change: edit kernel/kexec_handover.c

  	 Revision  by akpm: (Squashfs: fix uninit-value in squashfs_get_parent)

	 change: edit fs/squashfs/squashfs_fs_i.h

	 change: edit fs/squashfs/inode.c

  	 Revision  by akpm: (kernel: prevent prctl(PR_SET_PDEATHSIG) from racing with parent process exit)

	 change: edit kernel/sys.c

  	 Revision  by akpm: (cramfs: fix incorrect physical page address calculation)

	 change: edit fs/cramfs/inode.c

  	 Revision  by akpm: (checkpatch: suppress strscpy warnings for userspace tools)

	 change: edit scripts/checkpatch.pl

  	 Revision  by akpm: (ocfs2: fix double free in user_cluster_connect())

	 change: edit fs/ocfs2/stack_user.c

  	 Revision  by akpm: (panic: remove CONFIG_PANIC_ON_OOPS_VALUE)

	 change: edit lib/Kconfig.debug

	 change: edit kernel/panic.c

  	 Revision  by akpm: (lib/genalloc: fix device leak in of_gen_pool_get())

	 change: edit lib/genalloc.c

  	 Revision  by akpm: (Squashfs: add additional inode sanity checking)

	 change: edit fs/squashfs/inode.c

  	 Revision  by akpm: (Squashfs: add SEEK_DATA/SEEK_HOLE support)

	 change: edit fs/squashfs/file.c

	 change: edit fs/squashfs/squashfs_fs.h

	 change: edit fs/squashfs/squashfs.h

	 change: edit fs/squashfs/inode.c

  	 Revision  by akpm: (MAINTAINERS: update Sibi Sankar&#039;s email address)

	 change: edit .mailmap

	 change: edit MAINTAINERS

  	 Revision  by akpm: (kallsyms: use kmalloc_array() instead of kmalloc())

	 change: edit kernel/kallsyms_selftest.c

  	 Revision  by akpm: (Squashfs: reject negative file sizes in squashfs_read_inode())

	 change: edit fs/squashfs/inode.c

  	 Revision  by akpm: (mm/compaction: fix low_pfn advance on isolating hugetlb)

	 change: edit mm/compaction.c

  	 Revision  by akpm: (mm/page_vma_mapped: track if the page is mapped across page table boundary)

	 change: edit mm/page_vma_mapped.c

	 change: edit include/linux/rmap.h

  	 Revision  by akpm: (mm/rmap: fix a mlock race condition in folio_referenced_one())

	 change: edit mm/rmap.c

  	 Revision  by akpm: (mm/rmap: mlock large folios in try_to_unmap_one())

	 change: edit mm/rmap.c

  	 Revision  by akpm: (mm/fault: try to map the entire file folio in finish_fault())

	 change: edit mm/memory.c

  	 Revision  by akpm: (mm/filemap: map entire large folio faultaround)

	 change: edit mm/filemap.c

  	 Revision  by akpm: (mm/rmap: improve mlock tracking for large folios)

	 change: edit mm/rmap.c

  	 Revision  by akpm: (mm/memory_hotplug: fix typo &#039;esecially&#039; -&gt; &#039;especially&#039;)

	 change: edit mm/memory_hotplug.c

  	 Revision  by akpm: (mm: remove PMD alignment constraint in execmem_vmalloc())

	 change: edit mm/execmem.c

  	 Revision  by akpm: (drivers/base/node: fix double free in register_one_node())

	 change: edit drivers/base/node.c

  	 Revision  by akpm: (mm/ksm: fix incorrect KSM counter handling in mm_struct during fork)

	 change: edit include/linux/ksm.h

  	 Revision  by akpm: (selftests/mm: add fork inheritance test for ksm_merging_pages counter)

	 change: edit tools/testing/selftests/mm/ksm_functional_tests.c

  	 Revision  by akpm: (hugetlb: increase number of reserving hugepages via cmdline)

	 change: edit mm/hugetlb.c

  	 Revision  by akpm: (mm/ksm: get mm_slot by mm_slot_entry() when slot is !NULL)

	 change: edit mm/ksm.c

  	 Revision  by akpm: (mm/khugepaged: remove definition of struct khugepaged_mm_slot)

	 change: edit mm/khugepaged.c

  	 Revision  by akpm: (mm/memory-failure: don&#039;t select MEMORY_ISOLATION)

	 change: edit mm/Kconfig

  	 Revision  by akpm: (mm: silence data-race in update_hiwater_rss)

	 change: edit include/linux/mm.h

  	 Revision  by akpm: (alloc_tag: fix boot failure due to NULL pointer dereference)

	 change: edit mm/slub.c

  	 Revision  by akpm: (hugetlbfs: skip VMAs without shareable locks in hugetlb_vmdelete_list)

	 change: edit fs/hugetlbfs/inode.c

  	 Revision  by akpm: (mm/khugepaged: use start_addr/addr for improved readability)

	 change: edit mm/khugepaged.c

  	 Revision  by akpm: (mm: convert folio_page() back to a macro)

	 change: edit include/linux/page-flags.h

  	 Revision  by akpm: (mm: swap: check for stable address space before operating on the VMA)

	 change: edit mm/swapfile.c

  	 Revision  by jaegeuk: (f2fs: add sanity check on ei.len in __update_extent_tree_range())

	 change: edit fs/f2fs/extent_cache.c

  	 Revision  by jaegeuk: (f2fs: readahead node blocks in F2FS_GET_BLOCK_PRECACHE mode)

	 change: edit fs/f2fs/data.c

  	 Revision  by jaegeuk: (f2fs: fix UAF issue in f2fs_merge_page_bio())

	 change: edit fs/f2fs/data.c

  	 Revision  by skhan: (MAINTAINERS: add myself and Barry to dma_map_benchmark maintainers)

	 change: edit MAINTAINERS

  	 Revision  by torvalds: (Linux 6.17)

	 change: edit Makefile

  	 Revision  by alexandre.belloni: (i3c: master: adi: fix number of bytes written to fifo)

	 change: edit drivers/i3c/master/adi-i3c-master.c

  	 Revision  by alexandre.belloni: (i3c: fix big-endian FIFO transfers)

	 change: edit drivers/i3c/internals.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket_status_string())

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket.status_wait)

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket_init())

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket.disconnect_work)

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket.send_io.pending.{count,{dec,zero}_wait_queue})

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket.send_io.credits.{count,wait_queue})

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: introduce struct smbdirect_send_batch)

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket.rw_io.credits)

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: introduce struct smbdirect_rw_io)

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket.recv_io.{posted,credits})

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket_parameters.{resolve_{addr,route},rdma_connect,negotiate}_timeout_msec)

	 change: edit fs/smb/common/smbdirect/smbdirect.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket_parameters.{initiator_depth,responder_resources})

	 change: edit fs/smb/common/smbdirect/smbdirect.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket.rdma.legacy_iwarp)

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket.idle.{keepalive,immediate_work,timer_work})

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket.statistics)

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket.workqueue)

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: introduce struct smbdirect_mr_io)

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket_parameters.max_frmr_depth)

	 change: edit fs/smb/common/smbdirect/smbdirect.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket.mr_io.*)

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: let smbdirect_socket_init() initialize all [delayed_]work_structs as disabled)

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: client: fix sending the iwrap custom IRD/ORD negotiation messages)

	 change: edit fs/smb/client/smbdirect.h

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client/smbdirect: replace SMBDIRECT_SOCKET_CONNECTING with more detailed states)

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: client/smbdirect: introduce SMBDIRECT_SOCKET_ERROR)

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: smbdirect: introduce smbdirect_socket.first_error)

	 change: edit fs/smb/common/smbdirect/smbdirect_socket.h

  	 Revision  by stfrench: (smb: client: adjust smbdirect related output of cifs_debug_data_proc_show())

	 change: edit fs/smb/client/cifs_debug.c

  	 Revision  by stfrench: (smb: client: use status_wait and SMBDIRECT_SOCKET_NEGOTIATE_RUNNING for completion)

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/smbdirect.h

  	 Revision  by stfrench: (smb: client: use status_wait and SMBDIRECT_SOCKET_RESOLVE_{ADDR,ROUTE}_RUNNING for completion)

	 change: edit fs/smb/client/smbdirect.h

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: make use of smbdirect_socket.status_wait)

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/smbdirect.h

  	 Revision  by stfrench: (smb: client: make only use of wake_up[_all]() in smbdirect.c)

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: make use of smbdirect_socket_init())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: make use of smbdirect_socket.disconnect_work)

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/smbdirect.h

  	 Revision  by stfrench: (smb: client: make use of smbdirect_socket.send_io.pending.{count,{dec,zero}_wait_queue})

	 change: edit fs/smb/client/cifs_debug.c

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/smbdirect.h

  	 Revision  by stfrench: (smb: client: make use of smbdirect_socket.send_io.credits.{count,wait_queue})

	 change: edit fs/smb/client/cifs_debug.c

	 change: edit fs/smb/client/smbdirect.h

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: make sure smbd_disconnect_rdma_work() doesn&#039;t run after smbd_destroy() took over)

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: queue post_recv_credits_work also if the peer raises the credit target)

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: make use of ib_wc_status_msg() and skip IB_WC_WR_FLUSH_ERR logging)

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: remove info-&gt;wait_receive_queues handling in smbd_destroy())

	 change: edit fs/smb/client/smbdirect.h

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/cifs_debug.c

  	 Revision  by stfrench: (smb: client: limit the range of info-&gt;receive_credit_target)

	 change: edit fs/smb/client/smbdirect.h

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: count the number of posted recv_io messages in order to calculated credits)

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/smbdirect.h

  	 Revision  by stfrench: (smb: client: make use of smbdirect_socket.recv_io.{posted,credits})

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/smbdirect.h

	 change: edit fs/smb/client/cifs_debug.c

  	 Revision  by stfrench: (smb: client: remove useless smbd_connection.send_immediate)

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/smbdirect.h

  	 Revision  by stfrench: (smb: client: fill smbdirect_socket_parameters at the beginning and use the values from there)

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: make use of smbdirect_socket_parameters.{resolve_{addr,route},rdma_connect,negotiate}_timeout_msec)

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: make use of smbdirect_socket_parameters.{initiator_depth,responder_resources})

	 change: edit fs/smb/client/cifs_debug.c

	 change: edit fs/smb/client/smbdirect.h

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: make use of smbdirect_socket.rdma.legacy_iwarp)

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/smbdirect.h

  	 Revision  by stfrench: (smb: client: send empty packets via send_immediate_work)

	 change: edit fs/smb/client/smbdirect.h

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: fix smbdirect keep alive handling to match the documentation)

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: make use of smbdirect_socket.idle.{keepalive,immediate_work,timer_work})

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/smbdirect.h

  	 Revision  by stfrench: (smb: client: remove unused smbd_connection-&gt;protocol)

	 change: edit fs/smb/client/cifs_debug.c

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/smbdirect.h

  	 Revision  by stfrench: (smb: client: remove unused smbd_connection.count_reassembly_queue)

	 change: edit fs/smb/client/cifs_debug.c

	 change: edit fs/smb/client/smbdirect.h

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: make use of smbdirect_socket.statistics)

	 change: edit fs/smb/client/cifs_debug.c

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/smbdirect.h

  	 Revision  by stfrench: (smb: client: move rdma_readwrite_threshold from smbd_connection to TCP_Server_Info)

	 change: edit fs/smb/client/smbdirect.h

	 change: edit fs/smb/client/smb2pdu.c

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/cifs_debug.c

	 change: edit fs/smb/client/cifsglob.h

  	 Revision  by stfrench: (smb: client: make use of smbdirect_socket.workqueue)

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/smbdirect.h

  	 Revision  by stfrench: (smb: client: add and use smbd_get_parameters())

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/smbdirect.h

	 change: edit fs/smb/client/smb2ops.c

  	 Revision  by stfrench: (smb: client: make use of struct smbdirect_mr_io)

	 change: edit fs/smb/client/cifsglob.h

	 change: edit fs/smb/client/smbdirect.h

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: make use of smbdirect_socket_parameters.max_frmr_depth)

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/file.c

	 change: edit fs/smb/client/cifs_debug.c

	 change: edit fs/smb/client/smbdirect.h

  	 Revision  by stfrench: (smb: client: make use of smbdirect_socket.mr_io)

	 change: edit fs/smb/client/smbdirect.c

	 change: edit fs/smb/client/smbdirect.h

	 change: edit fs/smb/client/cifs_debug.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to {get,put}_receive_buffer())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to {allocate,destroy}_receive_buffers())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to {allocate,destroy}_caches_and_workqueue())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to {enqueue,_get_first}_reassembly())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to {allocate,destroy}_mr_list())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to smbd_disconnect_rdma_connection())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to smbd_post_recv())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to manage_credits_prior_sending())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to smbd_post_send())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to manage_keep_alive_before_sending())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to smbd_post_send_iter())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to smbd_post_send_empty())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to smbd_post_send_full_iter())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to smbd_conn_upcall())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to smbd_qp_async_error_upcall())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to smbd_create_id())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to smbd_ia_open())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to smbd_post_send_negotiate_req())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to smbd_negotiate())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: pass struct smbdirect_socket to get_mr())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: remove unused struct smbdirect_socket argument of smbd_iter_to_mr())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: let smbd_disconnect_rdma_connection() set SMBDIRECT_SOCKET_ERROR...)

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: fill in smbdirect_socket.first_error on error)

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: let smbd_disconnect_rdma_connection() disable all work but disconnect_work)

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: let smbd_{destroy,disconnect_rdma_{work,connection}}() wake up all wait queues)

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: make consitent use of spin_lock_irq{save,restore}() in smbdirect.c)

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: allocate smbdirect workqueue at the beginning of _smbd_get_connection())

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: defer calling ib_alloc_pd() after we are connected)

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: client: let smbd_post_send_iter() call ib_dma_map_single() for the header first)

	 change: edit fs/smb/client/smbdirect.c

  	 Revision  by stfrench: (smb: server: fix IRD/ORD negotiation with the client)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of common smbdirect_pdu.h)

	 change: edit fs/smb/server/transport_rdma.h

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of common smbdirect.h)

	 change: edit fs/smb/server/connection.c

	 change: edit fs/smb/server/transport_rdma.c

	 change: edit fs/smb/server/smb2pdu.h

	 change: edit fs/smb/server/connection.h

	 change: edit fs/smb/server/smb2pdu.c

  	 Revision  by stfrench: (smb: server: make use of common smbdirect_socket)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of common smbdirect_socket_parameters)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of smbdirect_socket-&gt;recv_io.expected)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of struct smbdirect_recv_io)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of smbdirect_socket.recv_io.free.{list,lock})

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of smbdirect_socket.recv_io.reassembly.*)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of SMBDIRECT_RECV_IO_MAX_SGE)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of struct smbdirect_send_io)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of smbdirect_socket.{send,recv}_io.mem.{cache,pool})

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make only use of wake_up[_all]() in transport_rdma.c)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: add a pr_info() when the server starts running)

	 change: edit fs/smb/server/server.c

  	 Revision  by stfrench: (smb: server: queue post_recv_credits_work in put_recvmsg() and avoid count_avail_recvmsg)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of smbdirect_socket.status_wait)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: only turn into SMBDIRECT_SOCKET_CONNECTED when negotiation is done)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: move smb_direct_disconnect_rdma_work() into free_transport())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: don&#039;t wait for info-&gt;send_pending == 0 on error)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of smbdirect_socket_init())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of smbdirect_socket.disconnect_work)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of smbdirect_socket.send_io.pending.{count,zero_wait_queue})

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of smbdirect_socket.send_io.credits.{count,wait_queue})

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of struct smbdirect_send_batch)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use smbdirect_socket.rw_io.credits)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of struct smbdirect_rw_io)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: take the recv_credit_target from the negotiate req and always limit the range)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: manage recv credits by counting posted recv_io and granted credits)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of smbdirect_socket.recv_io.{posted,credits})

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: replace smb_trans_direct_transfort() with SMBD_TRANS())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: remove useless casts from KSMBD_TRANS/SMBD_TRANS)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass ksmbd_transport to get_smbd_max_read_write_size())

	 change: edit fs/smb/server/smb2pdu.c

	 change: edit fs/smb/server/transport_rdma.c

	 change: edit fs/smb/server/transport_rdma.h

  	 Revision  by stfrench: (smb: server: fill smbdirect_socket_parameters at the beginning and use the values from there)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of smbdirect_socket_parameters.negotiate_timeout_msec and change to 5s)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of smbdirect_socket_parameters.{initiator_depth,responder_resources})

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of smbdirect_socket.rdma.legacy_iwarp)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of smbdirect_socket.idle.immediate_work)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: implement correct keepalive and timeout handling for smbdirect)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of smbdirect_socket.workqueue)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to {get_free,put}_recvmsg())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_{create,destroy}_pools())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_get_max_fr_pages())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_init_params())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_disconnect_rdma_connection())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_cm_handler())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_qpair_handler())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_create_qpair())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_post_recv())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_accept_client())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_prepare_negotiation())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_connect())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_{alloc,free}_sendmsg())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: remove unused struct struct smb_direct_transport argument from smb_direct_send_ctx_init())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_post_send())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_flush_send_list())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to wait_for_credits())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to wait_for_send_credits())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to wait_for_rw_credits())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to calc_rw_credits())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to manage_credits_prior_sending())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to manage_keep_alive_before_sending())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_create_header())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to post_sendmsg())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_post_send_data())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to {enqueue,get_first}_reassembly())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: pass struct smbdirect_socket to smb_direct_send_negotiate_response())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: let smb_direct_disconnect_rdma_connection() set SMBDIRECT_SOCKET_ERROR...)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: fill in smbdirect_socket.first_error on error)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: let smb_direct_disconnect_rdma_connection() disable all work but disconnect_work)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: let {free_transport,smb_direct_disconnect_rdma_{work,connection}}() wake up all wait queues)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make consitent use of spin_lock_irq{save,restore}() in transport_rdma.c)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: make use of ib_alloc_cq_any() instead of ib_alloc_cq())

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by stfrench: (smb: server: let smb_direct_flush_send_list() invalidate a remote key first)

	 change: edit fs/smb/server/transport_rdma.c

  	 Revision  by robh: (dt-bindings: arm: altera: Drop socfpga-sdram-edac.txt)

	 change: edit Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml

	 change: delete Documentation/devicetree/bindings/arm/altera/socfpga-sdram-edac.txt

  	 Revision  by kees: (lib/string_choices: Add str_assert_deassert() helper)

	 change: edit include/linux/string_choices.h

  	 Revision  by dmitry.torokhov: (Input: uinput - zero-initialize uinput_ff_upload_compat to avoid info leak)

	 change: edit drivers/input/misc/uinput.c

  	 Revision  by dmitry.torokhov: (Input: psxpad-spi - add a check for the return value of spi_setup())

	 change: edit drivers/input/joystick/psxpad-spi.c

  	 Revision  by vbabka: (slab: add sheaf support for batching kfree_rcu() operations)

	 change: edit mm/slab_common.c

	 change: edit mm/slub.c

	 change: edit mm/slab.h

  	 Revision  by vbabka: (maple_tree: remove redundant __GFP_NOWARN)

	 change: edit lib/maple_tree.c

  	 Revision  by vbabka: (slab: sheaf prefilling for guaranteed allocations)

	 change: edit mm/slub.c

	 change: edit include/linux/slab.h

  	 Revision  by vbabka: (tools/testing/vma: clean up stubs in vma_internal.h)

	 change: edit tools/testing/vma/vma_internal.h

  	 Revision  by vbabka: (slab: determine barn status racily outside of lock)

	 change: edit mm/slub.c

  	 Revision  by vbabka: (maple_tree: Drop bulk insert support)

	 change: edit lib/test_maple_tree.c

	 change: edit tools/testing/radix-tree/maple.c

	 change: edit lib/maple_tree.c

  	 Revision  by vbabka: (slab: skip percpu sheaves for remote object freeing)

	 change: edit mm/slub.c

	 change: edit mm/slab_common.c

  	 Revision  by vbabka: (tools/testing/vma: Implement vm_refcnt reset)

	 change: edit tools/testing/vma/vma_internal.h

  	 Revision  by vbabka: (slab: allow NUMA restricted allocations to use percpu sheaves)

	 change: edit mm/slub.c

  	 Revision  by vbabka: (tools/testing: Add support for changes to slab for sheaves)

	 change: edit tools/testing/vma/vma_internal.h

	 change: edit tools/include/linux/slab.h

	 change: edit tools/testing/shared/maple-shim.c

	 change: edit tools/testing/shared/linux.c

  	 Revision  by vbabka: (mm, vma: use percpu sheaves for vm_area_struct cache)

	 change: edit mm/vma_init.c

  	 Revision  by vbabka: (maple_tree: use percpu sheaves for maple_node_cache)

	 change: edit lib/maple_tree.c

  	 Revision  by vbabka: (tools/testing: include maple-shim.c in maple.c)

	 change: edit tools/testing/radix-tree/maple.c

  	 Revision  by vbabka: (testing/radix-tree/maple: Hack around kfree_rcu not existing)

	 change: edit tools/testing/shared/maple-shim.c

	 change: edit tools/testing/shared/maple-shared.h

  	 Revision  by vbabka: (maple_tree: Use kfree_rcu in ma_free_rcu)

	 change: edit lib/maple_tree.c

  	 Revision  by vbabka: (maple_tree: Replace mt_free_one() with kfree())

	 change: edit lib/maple_tree.c

  	 Revision  by vbabka: (tools/testing: Add support for prefilled slab sheafs)

	 change: edit tools/testing/shared/linux.c

	 change: edit tools/include/linux/slab.h

  	 Revision  by vbabka: (maple_tree: Prefilled sheaf conversion and testing)

	 change: edit include/linux/maple_tree.h

	 change: edit tools/testing/radix-tree/maple.c

	 change: edit lib/maple_tree.c

	 change: edit tools/testing/shared/linux.c

  	 Revision  by vbabka: (maple_tree: Add single node allocation support to maple state)

	 change: edit lib/maple_tree.c

	 change: edit include/linux/maple_tree.h

	 change: edit tools/testing/radix-tree/maple.c

  	 Revision  by vbabka: (maple_tree: Convert forking to use the sheaf interface)

	 change: edit lib/maple_tree.c

  	 Revision  by vbabka: (locking/local_lock: Introduce local_lock_is_locked().)

	 change: edit include/linux/rtmutex.h

	 change: edit kernel/locking/rtmutex_common.h

	 change: edit include/linux/local_lock.h

	 change: edit include/linux/local_lock_internal.h

  	 Revision  by vbabka: (mm: Allow GFP_ACCOUNT to be used in alloc_pages_nolock().)

	 change: edit include/linux/gfp.h

	 change: edit mm/page_alloc.c

	 change: edit kernel/bpf/syscall.c

	 change: edit kernel/bpf/stream.c

  	 Revision  by vbabka: (mm: Introduce alloc_frozen_pages_nolock())

	 change: edit mm/page_alloc.c

	 change: edit mm/internal.h

  	 Revision  by vbabka: (slab: Make slub local_(try)lock more precise for LOCKDEP)

	 change: edit mm/slub.c

	 change: edit mm/slab.h

  	 Revision  by vbabka: (slab: Reuse first bit for OBJEXTS_ALLOC_FAIL)

	 change: edit include/linux/memcontrol.h

	 change: edit mm/slub.c

  	 Revision  by vbabka: (slab: Introduce kmalloc_nolock() and kfree_nolock().)

	 change: edit mm/slub.c

	 change: edit include/linux/kasan.h

	 change: edit mm/kasan/common.c

	 change: edit include/linux/memcontrol.h

	 change: edit include/linux/slab.h

	 change: edit mm/Kconfig

	 change: edit mm/slab_common.c

	 change: edit mm/slab.h

  	 Revision  by viresh.kumar: (cpufreq: mediatek: fix device leak on probe failure)

	 change: edit drivers/cpufreq/mediatek-cpufreq.c

  	 Revision  by viresh.kumar: (rust: cpufreq: streamline find_supply_names)

	 change: edit drivers/cpufreq/rcpufreq_dt.rs

  	 Revision  by viresh.kumar: (cpufreq: tegra186: Set target frequency for all cpus in policy)

	 change: edit drivers/cpufreq/tegra186-cpufreq.c

  	 Revision  by viresh.kumar: (cpufreq: tegra186: Initialize all cores to max frequencies)

	 change: edit drivers/cpufreq/tegra186-cpufreq.c

  	 Revision  by martin.petersen: (scsi: target: target_core_configfs: Add length check to avoid buffer overflow)

	 change: edit drivers/target/target_core_configfs.c

  	 Revision  by agordeev: (s390: Add -Wno-pointer-sign to KBUILD_CFLAGS_DECOMPRESSOR)

	 change: edit arch/s390/Makefile

  	 Revision  by agordeev: (s390/cio/ioasm: Fix __xsch() condition code handling)

	 change: edit drivers/s390/cio/ioasm.c

  	 Revision  by agordeev: (s390: Remove superfluous newlines from inline assemblies)

	 change: edit arch/s390/kernel/skey.c

	 change: edit arch/s390/include/asm/checksum.h

	 change: edit arch/s390/include/asm/fpu-insn.h

	 change: edit arch/s390/hypfs/hypfs_sprp.c

	 change: edit arch/s390/include/asm/barrier.h

	 change: edit arch/s390/include/asm/kvm_para.h

	 change: edit arch/s390/include/asm/syscall.h

	 change: edit arch/s390/lib/test_unwind.c

	 change: edit arch/s390/pci/pci_insn.c

	 change: edit arch/s390/kernel/setup.c

	 change: edit arch/s390/include/asm/bitops.h

	 change: edit arch/s390/include/asm/processor.h

	 change: edit arch/s390/lib/xor.c

	 change: edit arch/s390/include/asm/stacktrace.h

	 change: edit arch/s390/include/asm/spinlock.h

	 change: edit arch/s390/lib/spinlock.c

	 change: edit arch/s390/include/asm/cpacf.h

	 change: edit arch/s390/include/asm/atomic_ops.h

	 change: edit arch/s390/include/asm/percpu.h

	 change: edit arch/s390/include/asm/ctlreg.h

	 change: edit arch/s390/kernel/diag/diag310.c

	 change: edit drivers/s390/cio/cmf.c

	 change: edit arch/s390/include/asm/string.h

	 change: edit arch/s390/kvm/kvm-s390.c

	 change: edit arch/s390/include/asm/timex.h

	 change: edit arch/s390/include/asm/cmpxchg.h

	 change: edit arch/s390/kernel/diag/diag324.c

	 change: edit arch/s390/mm/pgalloc.c

	 change: edit arch/s390/kernel/smp.c

	 change: edit arch/s390/lib/string.c

	 change: edit drivers/s390/char/sclp_early_core.c

	 change: edit arch/s390/mm/maccess.c

	 change: edit arch/s390/include/asm/rwonce.h

	 change: edit arch/s390/include/asm/ap.h

  	 Revision  by rafael.j.wysocki: (PM: runtime: Add auto-cleanup macros for &quot;resume and get&quot; operations)

	 change: edit drivers/base/power/runtime.c

	 change: edit include/linux/pm_runtime.h

  	 Revision  by rafael.j.wysocki: (PCI/sysfs: Use runtime PM guard macro for auto-cleanup)

	 change: edit drivers/pci/pci-sysfs.c

  	 Revision  by rafael.j.wysocki: (PM: runtime: Drop DEFINE_FREE() for pm_runtime_put())

	 change: edit include/linux/pm_runtime.h

  	 Revision  by ira.weiny: (nvdimm: Remove duplicate linux/slab.h header)

	 change: edit drivers/nvdimm/bus.c

  	 Revision  by ardb: (efi/x86: Memory protection on EfiGcdMemoryTypeMoreReliable)

	 change: edit drivers/firmware/efi/libstub/x86-stub.c

  	 Revision  by miquel.raynal: (mtd: spinand: fix direct mapping creation sizes)

	 change: edit drivers/mtd/nand/spi/core.c

  	 Revision  by miquel.raynal: (mtd: spinand: try a regular dirmap if creating a dirmap for continuous reading fails)

	 change: edit drivers/mtd/nand/spi/core.c

  	 Revision  by miquel.raynal: (mtd: spinand: repeat reading in regular mode if continuous reading fails)

	 change: edit drivers/mtd/nand/spi/core.c

  	 Revision  by torvalds: (Fix CC_HAS_ASM_GOTO_OUTPUT on non-x86 architectures)

	 change: edit init/Kconfig

  	 Revision  by miquel.raynal: (dt-bindings: mtd: Add realtek,rtl9301-ecc)

	 change: add Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.yaml

  	 Revision  by miquel.raynal: (mtd: nand: realtek-ecc: Add Realtek external ECC engine support)

	 change: edit drivers/mtd/nand/Makefile

	 change: add drivers/mtd/nand/ecc-realtek.c

	 change: edit drivers/mtd/nand/Kconfig

  	 Revision  by miquel.raynal: (mtd: rawnand: atmel: Fix error handling path in atmel_nand_controller_add_nands)

	 change: edit drivers/mtd/nand/raw/atmel/nand-controller.c

  	 Revision  by miquel.raynal: (mtd: rawnand: omap2: fix device leak on probe failure)

	 change: edit drivers/mtd/nand/raw/omap2.c

  	 Revision  by miquel.raynal: (mtd: nand: raw: gpmi: fix clocks when CONFIG_PM=N)

	 change: edit drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c

  	 Revision  by miquel.raynal: (mtd: cfi: use struct_size() helper for cfiq allocation)

	 change: edit drivers/mtd/chips/cfi_probe.c

  	 Revision  by miquel.raynal: (mtd: jedec_probe: use struct_size() helper for cfiq allocation)

	 change: edit drivers/mtd/chips/jedec_probe.c

  	 Revision  by miquel.raynal: (mtd: hyperbus: hbmc-am654: drop unused module alias)

	 change: edit drivers/mtd/hyperbus/hbmc-am654.c

  	 Revision  by miquel.raynal: (mtd: onenand: omap2: drop unused module alias)

	 change: edit drivers/mtd/nand/onenand/onenand_omap2.c

  	 Revision  by miquel.raynal: (mtd: rawnand: atmel: drop unused module alias)

	 change: edit drivers/mtd/nand/raw/atmel/pmecc.c

  	 Revision  by miquel.raynal: (mtd: rawnand: omap2: drop unused module alias)

	 change: edit drivers/mtd/nand/raw/omap2.c

  	 Revision  by miquel.raynal: (mtd: rawnand: pl353: drop unused module alias)

	 change: edit drivers/mtd/nand/raw/pl35x-nand-controller.c

  	 Revision  by miquel.raynal: (mtd: rawnand: rockchip: drop unused module alias)

	 change: edit drivers/mtd/nand/raw/rockchip-nand-controller.c

  	 Revision  by miquel.raynal: (mtd: rawnand: stm32_fmc2: drop unused module alias)

	 change: edit drivers/mtd/nand/raw/stm32_fmc2_nand.c

  	 Revision  by miquel.raynal: (mtd: rawnand: sunxi: drop unused module alias)

	 change: edit drivers/mtd/nand/raw/sunxi_nand.c

  	 Revision  by torvalds: (mount: handle NULL values in mnt_ns_release())

	 change: edit fs/namespace.c

  	 Revision  by mani: (PCI: keystone: Use devm_request_irq() to free &quot;ks-pcie-error-irq&quot; on exit)

	 change: edit drivers/pci/controller/dwc/pci-keystone.c

  	 Revision  by mani: (PCI: j721e: Fix incorrect error message in probe())

	 change: edit drivers/pci/controller/cadence/pci-j721e.c

  	 Revision  by kuba: (net: ethtool: remove duplicated mm.o from Makefile)

	 change: edit net/ethtool/Makefile

  	 Revision  by kuba: (docs: networking: phy: clarify abbreviation &quot;PAL&quot;)

	 change: edit Documentation/networking/phy.rst

  	 Revision  by torvalds: (Unbreak &#039;make tools/*&#039; for user-space targets)

	 change: edit Makefile

  	 Revision  by martin.petersen: (Revert &quot;scsi: qla2xxx: Fix memcpy() field-spanning write issue&quot;)

	 change: edit drivers/scsi/qla2xxx/qla_def.h

	 change: edit drivers/scsi/qla2xxx/qla_nvme.c

	 change: edit drivers/scsi/qla2xxx/qla_os.c

	 change: edit drivers/scsi/qla2xxx/qla_isr.c

  	 Revision  by torvalds: (Remove bcachefs core code)

	 change: delete fs/bcachefs/btree_key_cache.c

	 change: delete Documentation/filesystems/bcachefs/casefolding.rst

	 change: delete fs/bcachefs/lru.c

	 change: delete Documentation/filesystems/bcachefs/future/idle_work.rst

	 change: delete fs/bcachefs/snapshot_types.h

	 change: delete fs/bcachefs/eytzinger.c

	 change: delete fs/bcachefs/sb-errors.h

	 change: delete fs/bcachefs/bcachefs.h

	 change: delete fs/bcachefs/varint.c

	 change: delete fs/bcachefs/btree_key_cache.h

	 change: edit arch/m68k/configs/q40_defconfig

	 change: delete fs/bcachefs/inode_format.h

	 change: delete fs/bcachefs/super_types.h

	 change: delete fs/bcachefs/btree_locking.h

	 change: delete fs/bcachefs/btree_update.h

	 change: delete fs/bcachefs/bbpos_types.h

	 change: delete fs/bcachefs/fs-io.c

	 change: delete fs/bcachefs/sb-errors_types.h

	 change: delete fs/bcachefs/sb-counters_format.h

	 change: delete fs/bcachefs/backpointers.h

	 change: delete fs/bcachefs/fast_list.c

	 change: delete fs/bcachefs/replicas.h

	 change: delete fs/bcachefs/darray.c

	 change: edit fs/Kconfig

	 change: delete Documentation/filesystems/bcachefs/CodingStyle.rst

	 change: delete fs/bcachefs/errcode.c

	 change: delete fs/bcachefs/journal_seq_blacklist.h

	 change: delete fs/bcachefs/buckets_waiting_for_journal.c

	 change: delete fs/bcachefs/error.h

	 change: delete fs/bcachefs/checksum.h

	 change: delete fs/bcachefs/data_update.h

	 change: edit arch/m68k/configs/multi_defconfig

	 change: delete fs/bcachefs/enumerated_ref.h

	 change: delete fs/bcachefs/journal_seq_blacklist_format.h

	 change: delete fs/bcachefs/clock.h

	 change: delete fs/bcachefs/dirent.h

	 change: delete fs/bcachefs/rcu_pending.c

	 change: delete fs/bcachefs/enumerated_ref.c

	 change: delete fs/bcachefs/bkey_buf.h

	 change: edit arch/m68k/configs/amiga_defconfig

	 change: edit arch/m68k/configs/sun3x_defconfig

	 change: edit arch/s390/configs/defconfig

	 change: delete fs/bcachefs/sb-downgrade.c

	 change: delete fs/bcachefs/recovery.c

	 change: delete fs/bcachefs/async_objs.h

	 change: delete fs/bcachefs/xattr_format.h

	 change: delete fs/bcachefs/errcode.h

	 change: delete fs/bcachefs/movinggc.c

	 change: edit arch/s390/configs/debug_defconfig

	 change: delete fs/bcachefs/opts.h

	 change: delete fs/bcachefs/io_misc.c

	 change: delete Documentation/filesystems/bcachefs/errorcodes.rst

	 change: delete fs/bcachefs/logged_ops_format.h

	 change: delete fs/bcachefs/subvolume_format.h

	 change: delete fs/bcachefs/two_state_shared_lock.c

	 change: delete fs/bcachefs/extent_update.c

	 change: delete fs/bcachefs/disk_accounting.c

	 change: delete fs/bcachefs/journal_sb.c

	 change: delete fs/bcachefs/six.h

	 change: delete fs/bcachefs/lru.h

	 change: delete fs/bcachefs/sb-members_format.h

	 change: delete fs/bcachefs/vstructs.h

	 change: delete fs/bcachefs/disk_groups_format.h

	 change: delete fs/bcachefs/quota_format.h

	 change: delete fs/bcachefs/move_types.h

	 change: edit arch/m68k/configs/mvme16x_defconfig

	 change: delete fs/bcachefs/six.c

	 change: delete fs/bcachefs/sysfs.c

	 change: delete fs/bcachefs/reflink_format.h

	 change: delete fs/bcachefs/data_update.c

	 change: delete fs/bcachefs/extents_format.h

	 change: delete fs/bcachefs/btree_key_cache_types.h

	 change: delete fs/bcachefs/btree_journal_iter.c

	 change: delete fs/bcachefs/Kconfig

	 change: delete fs/bcachefs/bkey_sort.h

	 change: delete fs/bcachefs/keylist.h

	 change: delete fs/bcachefs/time_stats.h

	 change: delete fs/bcachefs/btree_io.c

	 change: delete fs/bcachefs/journal_io.c

	 change: delete fs/bcachefs/btree_node_scan_types.h

	 change: delete fs/bcachefs/fs.h

	 change: delete fs/bcachefs/snapshot.h

	 change: delete fs/bcachefs/buckets.c

	 change: delete fs/bcachefs/bcachefs_ioctl.h

	 change: delete fs/bcachefs/btree_types.h

	 change: delete fs/bcachefs/io_write.c

	 change: delete fs/bcachefs/Makefile

	 change: delete fs/bcachefs/journal_types.h

	 change: delete fs/bcachefs/acl.h

	 change: delete fs/bcachefs/fs-io-pagecache.h

	 change: delete fs/bcachefs/bset.c

	 change: delete fs/bcachefs/sysfs.h

	 change: edit arch/m68k/configs/mac_defconfig

	 change: delete fs/bcachefs/fs-io-direct.c

	 change: delete fs/bcachefs/alloc_types.h

	 change: delete fs/bcachefs/fsck.c

	 change: delete fs/bcachefs/snapshot_format.h

	 change: delete fs/bcachefs/fast_list.h

	 change: delete fs/bcachefs/quota.h

	 change: delete fs/bcachefs/sb-clean.h

	 change: delete fs/bcachefs/snapshot.c

	 change: edit MAINTAINERS

	 change: delete fs/bcachefs/super-io.h

	 change: delete fs/bcachefs/sb-errors_format.h

	 change: delete fs/bcachefs/two_state_shared_lock.h

	 change: delete fs/bcachefs/bkey_methods.h

	 change: delete fs/bcachefs/chardev.c

	 change: delete fs/bcachefs/btree_journal_iter.h

	 change: delete fs/bcachefs/disk_accounting_types.h

	 change: delete fs/bcachefs/printbuf.c

	 change: delete fs/bcachefs/fs-ioctl.h

	 change: delete fs/bcachefs/tests.h

	 change: delete fs/bcachefs/varint.h

	 change: delete fs/bcachefs/migrate.c

	 change: delete fs/bcachefs/btree_cache.c

	 change: delete fs/bcachefs/btree_gc.c

	 change: delete fs/bcachefs/super.h

	 change: delete fs/bcachefs/nocow_locking_types.h

	 change: delete fs/bcachefs/thread_with_file_types.h

	 change: delete fs/bcachefs/str_hash.c

	 change: delete fs/bcachefs/sb-counters.c

	 change: delete fs/bcachefs/util.c

	 change: delete fs/bcachefs/async_objs.c

	 change: delete fs/bcachefs/buckets_waiting_for_journal.h

	 change: delete fs/bcachefs/btree_cache.h

	 change: delete fs/bcachefs/disk_accounting.h

	 change: delete fs/bcachefs/opts.c

	 change: delete fs/bcachefs/bkey_cmp.h

	 change: delete fs/bcachefs/btree_locking.c

	 change: delete fs/bcachefs/ec.h

	 change: delete fs/bcachefs/btree_io.h

	 change: delete fs/bcachefs/journal_seq_blacklist.c

	 change: delete fs/bcachefs/alloc_foreground.c

	 change: delete fs/bcachefs/sb-members_types.h

	 change: delete fs/bcachefs/rebalance.h

	 change: delete fs/bcachefs/recovery_passes.h

	 change: delete fs/bcachefs/xattr.c

	 change: delete fs/bcachefs/journal_reclaim.c

	 change: delete fs/bcachefs/subvolume.h

	 change: delete fs/bcachefs/progress.h

	 change: edit arch/m68k/configs/atari_defconfig

	 change: delete fs/bcachefs/extents.h

	 change: delete fs/bcachefs/io_write_types.h

	 change: delete fs/bcachefs/darray.h

	 change: delete fs/bcachefs/sb-members.c

	 change: delete Documentation/filesystems/bcachefs/index.rst

	 change: delete fs/bcachefs/btree_node_scan.h

	 change: delete fs/bcachefs/rebalance_format.h

	 change: delete fs/bcachefs/bcachefs_format.h

	 change: delete fs/bcachefs/extents.c

	 change: delete fs/bcachefs/namei.h

	 change: delete fs/bcachefs/sb-downgrade.h

	 change: delete fs/bcachefs/thread_with_file.c

	 change: delete fs/bcachefs/rcu_pending.h

	 change: delete fs/bcachefs/clock.c

	 change: delete fs/bcachefs/journal_reclaim.h

	 change: delete fs/bcachefs/logged_ops.c

	 change: delete fs/bcachefs/recovery_passes.c

	 change: delete fs/bcachefs/sb-clean.c

	 change: delete fs/bcachefs/movinggc.h

	 change: delete fs/bcachefs/btree_gc.h

	 change: delete fs/bcachefs/journal_io.h

	 change: delete fs/bcachefs/journal.c

	 change: delete fs/bcachefs/recovery_passes_types.h

	 change: delete fs/bcachefs/siphash.h

	 change: delete fs/bcachefs/io_write.h

	 change: delete fs/bcachefs/debug.h

	 change: delete fs/bcachefs/ec_format.h

	 change: delete fs/bcachefs/rebalance_types.h

	 change: delete fs/bcachefs/bbpos.h

	 change: edit arch/m68k/configs/bvme6000_defconfig

	 change: delete fs/bcachefs/enumerated_ref_types.h

	 change: delete fs/bcachefs/extents_types.h

	 change: delete fs/bcachefs/io_read.h

	 change: delete fs/bcachefs/fs-io.h

	 change: delete fs/bcachefs/fs-io-buffered.c

	 change: delete fs/bcachefs/mean_and_variance.h

	 change: delete fs/bcachefs/mean_and_variance_test.c

	 change: delete fs/bcachefs/siphash.c

	 change: delete fs/bcachefs/subvolume.c

	 change: delete fs/bcachefs/logged_ops.h

	 change: delete fs/bcachefs/sb-members.h

	 change: delete fs/bcachefs/journal.h

	 change: delete fs/bcachefs/fs.c

	 change: delete fs/bcachefs/time_stats.c

	 change: delete fs/bcachefs/buckets.h

	 change: delete fs/bcachefs/trace.h

	 change: delete fs/bcachefs/super-io.c

	 change: delete fs/bcachefs/extent_update.h

	 change: edit arch/m68k/configs/hp300_defconfig

	 change: delete fs/bcachefs/inode.h

	 change: delete fs/bcachefs/recovery_passes_format.h

	 change: delete fs/bcachefs/btree_gc_types.h

	 change: edit Documentation/filesystems/index.rst

	 change: delete fs/bcachefs/super.c

	 change: delete fs/bcachefs/sb-counters.h

	 change: delete fs/bcachefs/chardev.h

	 change: delete fs/bcachefs/move.h

	 change: delete fs/bcachefs/reflink.h

	 change: delete fs/bcachefs/compress.c

	 change: delete fs/bcachefs/fs-ioctl.c

	 change: delete fs/bcachefs/eytzinger.h

	 change: delete fs/bcachefs/seqmutex.h

	 change: delete fs/bcachefs/bkey.h

	 change: delete fs/bcachefs/thread_with_file.h

	 change: delete fs/bcachefs/move.c

	 change: delete fs/bcachefs/str_hash.h

	 change: delete fs/bcachefs/fsck.h

	 change: delete fs/bcachefs/alloc_background.h

	 change: delete fs/bcachefs/lru_format.h

	 change: delete fs/bcachefs/bkey.c

	 change: delete fs/bcachefs/migrate.h

	 change: delete fs/bcachefs/quota.c

	 change: delete fs/bcachefs/printbuf.h

	 change: delete fs/bcachefs/bkey_sort.c

	 change: delete fs/bcachefs/replicas_format.h

	 change: delete fs/bcachefs/disk_groups.h

	 change: delete fs/bcachefs/error.c

	 change: delete fs/bcachefs/btree_write_buffer.c

	 change: delete fs/bcachefs/subvolume_types.h

	 change: delete fs/bcachefs/buckets_types.h

	 change: delete fs/bcachefs/bkey_types.h

	 change: delete fs/bcachefs/alloc_foreground.h

	 change: delete fs/bcachefs/trace.c

	 change: delete fs/bcachefs/btree_write_buffer.h

	 change: delete fs/bcachefs/alloc_background_format.h

	 change: delete fs/bcachefs/btree_update_interior.c

	 change: delete fs/bcachefs/rebalance.c

	 change: delete fs/bcachefs/disk_groups_types.h

	 change: delete fs/bcachefs/io_read.c

	 change: delete fs/bcachefs/replicas_types.h

	 change: delete fs/bcachefs/acl.c

	 change: delete fs/bcachefs/async_objs_types.h

	 change: delete fs/bcachefs/btree_journal_iter_types.h

	 change: delete fs/bcachefs/ec_types.h

	 change: delete fs/bcachefs/btree_iter.h

	 change: delete fs/bcachefs/reflink.c

	 change: delete fs/bcachefs/compress.h

	 change: delete fs/bcachefs/util.h

	 change: delete fs/bcachefs/dirent.c

	 change: delete fs/bcachefs/io_misc.h

	 change: delete fs/bcachefs/fs-io-buffered.h

	 change: delete fs/bcachefs/keylist.c

	 change: delete fs/bcachefs/quota_types.h

	 change: delete fs/bcachefs/namei.c

	 change: delete fs/bcachefs/sb-errors.c

	 change: delete fs/bcachefs/alloc_background.c

	 change: delete fs/bcachefs/mean_and_variance.c

	 change: delete fs/bcachefs/xattr.h

	 change: delete fs/bcachefs/clock_types.h

	 change: edit arch/m68k/configs/mvme147_defconfig

	 change: delete fs/bcachefs/nocow_locking.c

	 change: delete fs/bcachefs/nocow_locking.h

	 change: delete fs/bcachefs/tests.c

	 change: delete fs/bcachefs/recovery.h

	 change: delete fs/bcachefs/btree_write_buffer_types.h

	 change: delete fs/bcachefs/disk_accounting_format.h

	 change: delete fs/bcachefs/progress.c

	 change: delete fs/bcachefs/btree_iter.c

	 change: delete fs/bcachefs/btree_trans_commit.c

	 change: delete Documentation/filesystems/bcachefs/SubmittingPatches.rst

	 change: delete fs/bcachefs/backpointers.c

	 change: delete fs/bcachefs/fs-io-direct.h

	 change: delete fs/bcachefs/inode.c

	 change: delete fs/bcachefs/btree_node_scan.c

	 change: delete fs/bcachefs/debug.c

	 change: delete fs/bcachefs/disk_groups.c

	 change: delete fs/bcachefs/bkey_methods.c

	 change: edit arch/m68k/configs/apollo_defconfig

	 change: delete fs/bcachefs/btree_update_interior.h

	 change: edit arch/m68k/configs/sun3_defconfig

	 change: delete fs/bcachefs/keylist_types.h

	 change: delete fs/bcachefs/replicas.c

	 change: delete fs/bcachefs/ec.c

	 change: delete fs/bcachefs/fs-io-pagecache.c

	 change: delete fs/bcachefs/btree_update.c

	 change: delete fs/bcachefs/fifo.h

	 change: delete fs/bcachefs/checksum.c

	 change: delete fs/bcachefs/journal_sb.h

	 change: edit fs/Makefile

	 change: delete fs/bcachefs/bset.h

	 change: delete fs/bcachefs/buckets_waiting_for_journal_types.h

	 change: delete fs/bcachefs/sb-downgrade_format.h

	 change: delete fs/bcachefs/dirent_format.h

  	 Revision  by martin.petersen: (scsi: ufs: core: Fix runtime suspend error deadlock)

	 change: edit drivers/ufs/core/ufshcd.c

  	 Revision  by martin.petersen: (scsi: ufs: core: Fix PM QoS mutex initialization)

	 change: edit drivers/ufs/core/ufshcd.c

  	 Revision  by martin.petersen: (scsi: mvsas: Fix use-after-free bugs in mvs_work_queue)

	 change: edit drivers/scsi/mvsas/mv_init.c

  	 Revision  by bhelgaas: (PCI: xilinx-nwl: Fix ECAM programming)

	 change: edit drivers/pci/controller/pcie-xilinx-nwl.c

  	 Revision  by kuba: (ixgbe: fix typos and docstring inconsistencies)

	 change: edit drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c

  	 Revision  by kuba: (net: stmmac: est: Drop frames causing HLBS error)

	 change: edit drivers/net/ethernet/stmicro/stmmac/stmmac_est.c

	 change: edit drivers/net/ethernet/stmicro/stmmac/stmmac_est.h

	 change: edit drivers/net/ethernet/stmicro/stmmac/common.h

  	 Revision  by kuba: (net: stmmac: tc: Add HLBS drop count to taprio stats)

	 change: edit drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c

  	 Revision  by kuba: (scm: use masked_user_access_begin() in put_cmsg())

	 change: edit net/core/scm.c

  	 Revision  by kuba: (net: remove one stac/clac pair from move_addr_to_user())

	 change: edit net/socket.c

  	 Revision  by kuba: (idpf: fix mismatched free function for dma_alloc_coherent)

	 change: edit drivers/net/ethernet/intel/idpf/idpf_virtchnl.c

  	 Revision  by kuba: (net: libwx: support separate RSS configuration for every pool)

	 change: edit drivers/net/ethernet/wangxun/libwx/wx_hw.h

	 change: edit drivers/net/ethernet/wangxun/libwx/wx_hw.c

	 change: edit drivers/net/ethernet/wangxun/libwx/wx_type.h

	 change: edit drivers/net/ethernet/wangxun/libwx/wx_lib.c

  	 Revision  by kuba: (net: libwx: move rss_field to struct wx)

	 change: edit drivers/net/ethernet/wangxun/libwx/wx_type.h

	 change: edit drivers/net/ethernet/wangxun/libwx/wx_hw.c

  	 Revision  by kuba: (net: wangxun: add RSS reta and rxfh fields support)

	 change: edit drivers/net/ethernet/wangxun/libwx/wx_type.h

	 change: edit drivers/net/ethernet/wangxun/ngbe/ngbe_ethtool.c

	 change: edit drivers/net/ethernet/wangxun/libwx/wx_ethtool.h

	 change: edit drivers/net/ethernet/wangxun/libwx/wx_hw.c

	 change: edit drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c

	 change: edit drivers/net/ethernet/wangxun/libwx/wx_ethtool.c

  	 Revision  by kuba: (net: libwx: restrict change user-set RSS configuration)

	 change: edit drivers/net/ethernet/wangxun/libwx/wx_sriov.c

	 change: edit drivers/net/ethernet/wangxun/libwx/wx_hw.c

  	 Revision  by kuba: (ptr_ring: __ptr_ring_zero_tail micro optimization)

	 change: edit include/linux/ptr_ring.h

  	 Revision  by kuba: (tcp: use skb-&gt;len instead of skb-&gt;truesize in tcp_can_ingest())

	 change: edit net/ipv4/tcp_input.c

  	 Revision  by kuba: (mptcp: leverage skb deferral free)

	 change: edit net/mptcp/protocol.c

  	 Revision  by kuba: (tcp: make tcp_rcvbuf_grow() accessible to mptcp code)

	 change: edit net/ipv4/tcp_input.c

	 change: edit include/net/tcp.h

  	 Revision  by kuba: (mptcp: rcvbuf auto-tuning improvement)

	 change: edit net/mptcp/protocol.c

	 change: edit net/mptcp/protocol.h

  	 Revision  by kuba: (mptcp: introduce the mptcp_init_skb helper)

	 change: edit net/mptcp/protocol.c

  	 Revision  by kuba: (mptcp: remove unneeded mptcp_move_skb())

	 change: edit net/mptcp/protocol.c

  	 Revision  by kuba: (mptcp: factor out a basic skb coalesce helper)

	 change: edit net/mptcp/protocol.c

  	 Revision  by kuba: (mptcp: minor move_skbs_to_msk() cleanup)

	 change: edit net/mptcp/protocol.c

  	 Revision  by kuba: (selftests: mptcp: join: validate new laminar endp)

	 change: edit tools/testing/selftests/net/mptcp/pm_nl_ctl.c

	 change: edit tools/testing/selftests/net/mptcp/mptcp_join.sh

  	 Revision  by kuba: (net: stmmac: Convert open-coded register polling to helper macro)

	 change: edit drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c

  	 Revision  by kuba: (Revert &quot;net: group sk_backlog and sk_receive_queue&quot;)

	 change: edit include/net/sock.h

  	 Revision  by kuba: (net: rtnetlink: fix typo in rtnl_unregister_all() comment)

	 change: edit net/core/rtnetlink.c

  	 Revision  by kuba: (nfp: fix RSS hash key size when RSS is not supported)

	 change: edit drivers/net/ethernet/netronome/nfp/nfp_net_ethtool.c

  	 Revision  by kuba: (net: ena: return 0 in ena_get_rxfh_key_size() when RSS hash key is not configurable)

	 change: edit drivers/net/ethernet/amazon/ena/ena_ethtool.c

  	 Revision  by kuba: (selftest: packetdrill: Set ktap_set_plan properly for single protocol test.)

	 change: edit tools/testing/selftests/net/packetdrill/ksft_runner.sh

  	 Revision  by kuba: (selftest: packetdrill: Require explicit setsockopt(TCP_FASTOPEN).)

	 change: edit tools/testing/selftests/net/packetdrill/defaults.sh

  	 Revision  by kuba: (selftest: packetdrill: Define common TCP Fast Open cookie.)

	 change: edit tools/testing/selftests/net/packetdrill/defaults.sh

	 change: edit tools/testing/selftests/net/packetdrill/ksft_runner.sh

  	 Revision  by kuba: (selftest: packetdrill: Import TFO server basic tests.)

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_basic-rw.pkt

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_basic-non-tfo-listener.pkt

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_basic-cookie-not-reqd.pkt

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_basic-pure-syn-data.pkt

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_basic-zero-payload.pkt

  	 Revision  by kuba: (selftest: packetdrill: Add test for TFO_SERVER_WO_SOCKOPT1.)

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_basic-no-setsockopt.pkt

  	 Revision  by kuba: (selftest: packetdrill: Add test for experimental option.)

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_experimental_option.pkt

  	 Revision  by kuba: (selftest: packetdrill: Import opt34/fin-close-socket.pkt.)

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_fin-close-socket.pkt

  	 Revision  by kuba: (selftest: packetdrill: Import opt34/icmp-before-accept.pkt.)

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_icmp-before-accept.pkt

  	 Revision  by kuba: (selftest: packetdrill: Import opt34/reset-* tests.)

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_reset-before-accept.pkt

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_reset-non-tfo-socket.pkt

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_reset-close-with-unread-data.pkt

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_reset-after-accept.pkt

  	 Revision  by kuba: (selftest: packetdrill: Import opt34/*-trigger-rst.pkt.)

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_trigger-rst-listener-closed.pkt

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_trigger-rst-unread-data-closed.pkt

  	 Revision  by kuba: (selftest: packetdrill: Refine tcp_fastopen_server_reset-after-disconnect.pkt.)

	 change: delete tools/testing/selftests/net/packetdrill/tcp_fastopen_server_reset-after-disconnect.pkt

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_trigger-rst-reconnect.pkt

  	 Revision  by kuba: (selftest: packetdrill: Import sockopt-fastopen-key.pkt)

	 change: edit tools/testing/selftests/net/packetdrill/ksft_runner.sh

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_sockopt-fastopen-key.pkt

  	 Revision  by kuba: (selftest: packetdrill: Import client-ack-dropped-then-recovery-ms-timestamps.pkt)

	 change: add tools/testing/selftests/net/packetdrill/tcp_fastopen_server_client-ack-dropped-then-recovery-ms-timestamps.pkt

  	 Revision  by kuba: (net: stmmac: remove stmmac_hw_setup() excess documentation parameter)

	 change: edit drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

  	 Revision  by kuba: (net: dlink: handle copy_thresh allocation failure)

	 change: edit drivers/net/ethernet/dlink/dl2k.c

  	 Revision  by kuba: (net/mlx5: Stop polling for command response if interface goes down)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/cmd.c

  	 Revision  by kuba: (net/mlx5: pagealloc: Fix reclaim race during command interface teardown)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/pagealloc.c

  	 Revision  by kuba: (net/mlx5: fw reset, add reset timeout work)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c

  	 Revision  by kuba: (dpll: add phase-offset-avg-factor device attribute to netlink spec)

	 change: edit include/uapi/linux/dpll.h

	 change: edit Documentation/netlink/specs/dpll.yaml

	 change: edit Documentation/driver-api/dpll.rst

	 change: edit drivers/dpll/dpll_nl.c

  	 Revision  by kuba: (dpll: add phase_offset_avg_factor_get/set callback ops)

	 change: edit include/linux/dpll.h

	 change: edit drivers/dpll/dpll_netlink.c

  	 Revision  by kuba: (dpll: zl3073x: Allow to configure phase offset averaging factor)

	 change: edit drivers/dpll/zl3073x/core.c

	 change: edit drivers/dpll/zl3073x/dpll.c

	 change: edit drivers/dpll/zl3073x/dpll.h

	 change: edit drivers/dpll/zl3073x/core.h

  	 Revision  by stfrench: (smb: client: add tcon information to smb2_reconnect() debug messages)

	 change: edit fs/smb/client/smb2pdu.c

  	 Revision  by stfrench: (smb: Use arc4 library instead of duplicate arc4 code)

	 change: edit fs/smb/server/auth.c

	 change: delete fs/smb/common/cifs_arc4.c

	 change: edit fs/smb/server/Kconfig

	 change: edit fs/smb/client/cifsencrypt.c

	 change: delete fs/smb/common/arc4.h

	 change: edit fs/smb/client/Kconfig

	 change: edit fs/smb/common/Makefile

  	 Revision  by stfrench: (smb: client: fix crypto buffers in non-linear memory)

	 change: edit fs/smb/client/smb2ops.c

  	 Revision  by linkinjeon: (exfat: limit log print for IO error)

	 change: edit fs/exfat/fatent.c

  	 Revision  by linkinjeon: (exfat: validate cluster allocation bits of the allocation bitmap)

	 change: edit fs/exfat/balloc.c

  	 Revision  by linkinjeon: (exfat: drop redundant conversion to bool)

	 change: edit fs/exfat/inode.c

  	 Revision  by linkinjeon: (exfat: Remove unnecessary parentheses)

	 change: edit fs/exfat/nls.c

  	 Revision  by linkinjeon: (exfat: optimize allocation bitmap loading time)

	 change: edit fs/exfat/balloc.c

  	 Revision  by linkinjeon: (exfat: support modifying mount options via remount)

	 change: edit fs/exfat/super.c

  	 Revision  by linkinjeon: (exfat: combine iocharset and utf8 option setup)

	 change: edit fs/exfat/super.c

  	 Revision  by linkinjeon: (exfat: Add support for FS_IOC_{GET,SET}FSLABEL)

	 change: edit fs/exfat/exfat_raw.h

	 change: edit fs/exfat/dir.c

	 change: edit fs/exfat/namei.c

	 change: edit fs/exfat/file.c

	 change: edit fs/exfat/exfat_fs.h

  	 Revision  by pabeni: (Documentation: net: add flow control guide and document ethtool API)

	 change: edit Documentation/networking/index.rst

	 change: edit include/linux/ethtool.h

	 change: edit net/dcb/dcbnl.c

	 change: add Documentation/networking/flow_control.rst

	 change: edit Documentation/networking/phy.rst

	 change: edit Documentation/netlink/specs/ethtool.yaml

	 change: edit include/uapi/linux/ethtool_netlink_generated.h

	 change: edit net/ethtool/pause.c

  	 Revision  by pabeni: (bonding: fix xfrm offload feature setup on active-backup mode)

	 change: edit drivers/net/bonding/bond_netlink.c

	 change: edit drivers/net/bonding/bond_main.c

	 change: edit include/net/bonding.h

  	 Revision  by pabeni: (selftests: bonding: add ipsec offload test)

	 change: edit tools/testing/selftests/drivers/net/bonding/config

	 change: edit tools/testing/selftests/drivers/net/bonding/Makefile

	 change: add tools/testing/selftests/drivers/net/bonding/bond_ipsec_offload.sh

  	 Revision  by pabeni: (6pack: drop redundant locking and refcounting)

	 change: edit drivers/net/hamradio/6pack.c

  	 Revision  by pabeni: (net: nfc: nci: Add parameter validation for packet data)

	 change: edit net/nfc/nci/ntf.c

  	 Revision  by pabeni: (net: enetc: initialize SW PIR and CIR based HW PIR and CIR values)

	 change: edit drivers/net/ethernet/freescale/enetc/ntmp.c

  	 Revision  by pabeni: (tipc: adjust tipc_nodeid2string() to return string length)

	 change: edit net/tipc/link.c

	 change: edit net/tipc/addr.c

	 change: edit net/tipc/addr.h

  	 Revision  by pabeni: (page_pool: Clamp pool size to max 16K pages)

	 change: edit net/core/page_pool.c

  	 Revision  by pabeni: (net: phy: stop exporting phy_driver_unregister)

	 change: edit drivers/net/phy/phy_device.c

	 change: edit include/linux/phy.h

  	 Revision  by pabeni: (net: phy: annotate linkmode initializers as not used after init phase)

	 change: edit drivers/net/phy/phy_caps.c

	 change: edit drivers/net/phy/phy-caps.h

	 change: edit drivers/net/phy/phy_device.c

  	 Revision  by pabeni: (net: sfp: don&#039;t include swphy.h)

	 change: edit drivers/net/phy/sfp.c

  	 Revision  by pabeni: (net: sfp: improve poll interval handling)

	 change: edit drivers/net/phy/sfp.c

  	 Revision  by tiwai: (ALSA: hda/hdmi: Add pin fix for HP ProDesk model)

	 change: edit sound/hda/codecs/hdmi/hdmi.c

  	 Revision  by jgg: (iommufd: Register iommufd mock devices with fwspec)

	 change: edit drivers/iommu/iommu-priv.h

	 change: edit drivers/iommu/iommufd/selftest.c

	 change: edit drivers/iommu/iommu.c

  	 Revision  by pabeni: (netdevsim: a basic test PSP implementation)

	 change: add drivers/net/netdevsim/psp.c

	 change: edit drivers/net/netdevsim/Makefile

	 change: edit drivers/net/netdevsim/netdev.c

	 change: edit drivers/net/netdevsim/netdevsim.h

	 change: edit net/core/skbuff.c

  	 Revision  by pabeni: (selftests: drv-net: base device access API test)

	 change: add tools/testing/selftests/drivers/net/psp.py

	 change: edit tools/testing/selftests/drivers/net/hw/lib/py/__init__.py

	 change: edit tools/testing/selftests/drivers/net/lib/py/__init__.py

	 change: edit tools/testing/selftests/net/lib/py/__init__.py

	 change: edit tools/testing/selftests/net/lib/py/ynl.py

	 change: edit tools/testing/selftests/drivers/net/Makefile

	 change: edit tools/testing/selftests/drivers/net/config

  	 Revision  by pabeni: (selftests: drv-net: add PSP responder)

	 change: edit tools/testing/selftests/drivers/net/.gitignore

	 change: add tools/testing/selftests/drivers/net/psp_responder.c

	 change: edit tools/testing/selftests/drivers/net/Makefile

  	 Revision  by pabeni: (selftests: drv-net: psp: add basic data transfer and key rotation tests)

	 change: edit tools/testing/selftests/drivers/net/psp.py

  	 Revision  by pabeni: (selftests: drv-net: psp: add association tests)

	 change: edit tools/testing/selftests/drivers/net/lib/py/__init__.py

	 change: edit tools/testing/selftests/net/lib/py/ksft.py

	 change: edit tools/testing/selftests/drivers/net/hw/lib/py/__init__.py

	 change: edit tools/testing/selftests/drivers/net/psp.py

  	 Revision  by pabeni: (selftests: drv-net: psp: add connection breaking tests)

	 change: edit tools/testing/selftests/drivers/net/psp.py

  	 Revision  by pabeni: (selftests: drv-net: psp: add test for auto-adjusting TCP MSS)

	 change: edit tools/testing/selftests/drivers/net/psp.py

  	 Revision  by pabeni: (selftests: drv-net: psp: add tests for destroying devices)

	 change: edit tools/testing/selftests/net/lib/py/ksft.py

	 change: edit tools/testing/selftests/drivers/net/lib/py/env.py

	 change: edit tools/testing/selftests/drivers/net/lib/py/__init__.py

	 change: edit tools/testing/selftests/drivers/net/hw/lib/py/__init__.py

	 change: edit tools/testing/selftests/drivers/net/psp.py

  	 Revision  by pabeni: (net: make softnet_data.defer_count an atomic)

	 change: edit include/linux/netdevice.h

	 change: edit net/core/skbuff.c

	 change: edit net/core/dev.c

  	 Revision  by pabeni: (net: use llist for sd-&gt;defer_list)

	 change: edit include/linux/netdevice.h

	 change: edit net/core/dev.c

	 change: edit net/core/skbuff.c

  	 Revision  by pabeni: (net: add NUMA awareness to skb_attempt_defer_free())

	 change: edit include/net/hotdata.h

	 change: edit net/core/skbuff.c

	 change: edit include/linux/netdevice.h

	 change: edit net/core/dev.h

	 change: edit net/core/dev.c

  	 Revision  by imbrenda: (KVM: s390: Fix to clear PTE when discarding a swapped page)

	 change: edit arch/s390/mm/pgtable.c

	 change: edit arch/s390/mm/gmap_helpers.c

	 change: edit arch/s390/include/asm/pgtable.h

  	 Revision  by hubcap: (orangefs: Remove unused type in macro fill_default_sys_attrs)

	 change: edit fs/orangefs/namei.c

	 change: edit fs/orangefs/orangefs-kernel.h

  	 Revision  by hubcap: (orangefs: fix xattr related buffer overflow...)

	 change: edit fs/orangefs/xattr.c

  	 Revision  by hubcap: (fs/orangefs: Replace kzalloc + copy_from_user with memdup_user_nul)

	 change: edit fs/orangefs/orangefs-debugfs.c

  	 Revision  by pabeni: (Revert &quot;net/mlx5e: Update and set Xon/Xoff upon MTU set&quot;)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en_main.c

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en/port_buffer.h

  	 Revision  by melissa.srw: (drm/v3d: create a dedicated lock for dma fence)

	 change: edit drivers/gpu/drm/v3d/v3d_drv.h

	 change: edit drivers/gpu/drm/v3d/v3d_fence.c

	 change: edit drivers/gpu/drm/v3d/v3d_gem.c

  	 Revision  by kuba: (selftests/net: add tcp_port_share to .gitignore)

	 change: edit tools/testing/selftests/net/.gitignore

  	 Revision  by acme: (perf bpf-filter: Fix opts declaration on older libbpfs)

	 change: edit tools/perf/util/bpf-filter.c

  	 Revision  by acme: (perf bpf: Move the LIBBPF_CURRENT_VERSION_GEQ macro to bpf-utils.h)

	 change: edit tools/perf/util/bpf-utils.h

	 change: edit tools/perf/util/bpf-filter.c

  	 Revision  by acme: (perf bpf: Check libbpf version to use btf_dump_type_data_opts.emit_strings)

	 change: edit tools/perf/util/bpf-event.c

  	 Revision  by acme: (perf vendor events intel: Update alderlake events to v1.34)

	 change: edit tools/perf/pmu-events/arch/x86/mapfile.csv

	 change: edit tools/perf/pmu-events/arch/x86/alderlake/cache.json

  	 Revision  by acme: (perf vendor events intel: Update arrowlake events to v1.13)

	 change: edit tools/perf/pmu-events/arch/x86/mapfile.csv

	 change: edit tools/perf/pmu-events/arch/x86/arrowlake/memory.json

	 change: edit tools/perf/pmu-events/arch/x86/arrowlake/other.json

	 change: edit tools/perf/pmu-events/arch/x86/arrowlake/cache.json

  	 Revision  by acme: (perf vendor events intel: Update emeraldrapids events to v1.20)

	 change: edit tools/perf/pmu-events/arch/x86/emeraldrapids/cache.json

	 change: edit tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-cache.json

	 change: edit tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-power.json

	 change: edit tools/perf/pmu-events/arch/x86/mapfile.csv

	 change: edit tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-memory.json

	 change: edit tools/perf/pmu-events/arch/x86/emeraldrapids/emr-metrics.json

  	 Revision  by acme: (perf vendor events intel: Update grandridge events to v1.10)

	 change: edit tools/perf/pmu-events/arch/x86/mapfile.csv

	 change: edit tools/perf/pmu-events/arch/x86/grandridge/cache.json

  	 Revision  by acme: (perf vendor events intel: Update graniterapids events to v1.15)

	 change: edit tools/perf/pmu-events/arch/x86/graniterapids/uncore-interconnect.json

	 change: edit tools/perf/pmu-events/arch/x86/mapfile.csv

	 change: edit tools/perf/pmu-events/arch/x86/graniterapids/uncore-memory.json

  	 Revision  by acme: (perf vendor events intel: Update lunarlake events to v1.18)

	 change: edit tools/perf/pmu-events/arch/x86/lunarlake/memory.json

	 change: edit tools/perf/pmu-events/arch/x86/lunarlake/cache.json

	 change: edit tools/perf/pmu-events/arch/x86/lunarlake/other.json

	 change: edit tools/perf/pmu-events/arch/x86/mapfile.csv

  	 Revision  by acme: (perf vendor events intel: Update meteorlake events to v1.17)

	 change: edit tools/perf/pmu-events/arch/x86/mapfile.csv

	 change: edit tools/perf/pmu-events/arch/x86/meteorlake/cache.json

  	 Revision  by acme: (perf vendor events intel: Update pantherlake events to v1.00)

	 change: add tools/perf/pmu-events/arch/x86/pantherlake/uncore-memory.json

	 change: edit tools/perf/pmu-events/arch/x86/pantherlake/frontend.json

	 change: edit tools/perf/pmu-events/arch/x86/pantherlake/virtual-memory.json

	 change: edit tools/perf/pmu-events/arch/x86/pantherlake/cache.json

	 change: edit tools/perf/pmu-events/arch/x86/pantherlake/counter.json

	 change: edit tools/perf/pmu-events/arch/x86/pantherlake/memory.json

	 change: edit tools/perf/pmu-events/arch/x86/pantherlake/pipeline.json

	 change: add tools/perf/pmu-events/arch/x86/pantherlake/floating-point.json

	 change: add tools/perf/pmu-events/arch/x86/pantherlake/other.json

  	 Revision  by acme: (perf vendor events intel: Update sapphirerapids events to v1.35)

	 change: edit tools/perf/pmu-events/arch/x86/sapphirerapids/spr-metrics.json

	 change: edit tools/perf/pmu-events/arch/x86/mapfile.csv

	 change: edit tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-power.json

	 change: edit tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-memory.json

	 change: edit tools/perf/pmu-events/arch/x86/sapphirerapids/cache.json

	 change: edit tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-cache.json

  	 Revision  by acme: (perf vendor events intel: Update sierraforest events to v1.12)

	 change: edit tools/perf/pmu-events/arch/x86/sierraforest/uncore-memory.json

	 change: edit tools/perf/pmu-events/arch/x86/sierraforest/uncore-io.json

	 change: edit tools/perf/pmu-events/arch/x86/mapfile.csv

	 change: edit tools/perf/pmu-events/arch/x86/sierraforest/uncore-interconnect.json

	 change: edit tools/perf/pmu-events/arch/x86/sierraforest/cache.json

  	 Revision  by pbonzini: (KVM: s390/vfio-ap: Use kvm_is_gpa_in_memslot() instead of open coded equivalent)

	 change: edit drivers/s390/crypto/vfio_ap_ops.c

	 change: edit arch/s390/kvm/priv.c

	 change: edit arch/s390/include/asm/kvm_host.h

  	 Revision  by pbonzini: (KVM: Export KVM-internal symbols for sub-modules only)

	 change: edit arch/x86/include/asm/kvm_types.h

	 change: edit virt/kvm/kvm_main.c

	 change: edit arch/powerpc/include/asm/Kbuild

	 change: add arch/powerpc/include/asm/kvm_types.h

	 change: edit include/linux/kvm_types.h

	 change: edit virt/kvm/guest_memfd.c

	 change: edit virt/kvm/eventfd.c

  	 Revision  by pbonzini: (KVM: x86: Move kvm_intr_is_single_vcpu() to lapic.c)

	 change: edit arch/x86/include/asm/kvm_host.h

	 change: edit arch/x86/kvm/irq.c

	 change: edit arch/x86/kvm/lapic.c

	 change: edit arch/x86/kvm/lapic.h

  	 Revision  by pbonzini: (KVM: x86: Drop pointless exports of kvm_arch_xxx() hooks)

	 change: edit arch/x86/kvm/x86.c

  	 Revision  by pbonzini: (KVM: x86: Export KVM-internal symbols for sub-modules only)

	 change: edit arch/x86/kvm/smm.c

	 change: edit arch/x86/kvm/kvm_onhyperv.c

	 change: edit arch/x86/kvm/hyperv.c

	 change: edit arch/x86/kvm/irq.c

	 change: edit arch/x86/kvm/lapic.c

	 change: edit arch/x86/kvm/mmu/tdp_mmu.c

	 change: edit arch/x86/kvm/x86.c

	 change: edit arch/x86/kvm/cpuid.c

	 change: edit arch/x86/kvm/mmu/mmu.c

	 change: edit arch/x86/kvm/mmu/spte.c

	 change: edit arch/x86/kvm/pmu.c

  	 Revision  by martin.petersen: (scsi: ufs: sysfs: Make HID attributes visible)

	 change: edit drivers/ufs/core/ufs-sysfs.h

	 change: edit drivers/ufs/core/ufs-sysfs.c

	 change: edit drivers/ufs/core/ufshcd.c

  	 Revision  by anna.schumaker: (sunrpc: unexport rpc_malloc() and rpc_free())

	 change: edit net/sunrpc/sched.c

  	 Revision  by anna.schumaker: (NFSD: filecache: add STATX_DIOALIGN and STATX_DIO_READ_ALIGN support)

	 change: edit fs/nfsd/filecache.h

	 change: edit fs/nfsd/vfs.h

	 change: edit include/trace/misc/fs.h

	 change: edit fs/nfsd/filecache.c

	 change: edit fs/nfsd/trace.h

  	 Revision  by anna.schumaker: (nfs/localio: make trace_nfs_local_open_fh more useful)

	 change: edit fs/nfs/localio.c

	 change: edit fs/nfs/nfstrace.h

  	 Revision  by anna.schumaker: (nfs/localio: avoid issuing misaligned IO using O_DIRECT)

	 change: edit include/linux/nfslocalio.h

	 change: edit fs/nfsd/localio.c

	 change: edit fs/nfs/localio.c

  	 Revision  by martin.petersen: (scsi: ufs: core: Include UTP error in INT_FATAL_ERRORS)

	 change: edit include/ufs/ufshci.h

  	 Revision  by anna.schumaker: (nfs/localio: refactor iocb and iov_iter_bvec initialization)

	 change: edit fs/nfs/localio.c

  	 Revision  by anna.schumaker: (nfs/localio: refactor iocb initialization)

	 change: edit fs/nfs/localio.c

  	 Revision  by anna.schumaker: (nfs/localio: add proper O_DIRECT support for READ and WRITE)

	 change: edit fs/nfs/localio.c

  	 Revision  by anna.schumaker: (nfs/localio: add tracepoints for misaligned DIO READ and WRITE support)

	 change: edit fs/nfs/nfstrace.h

	 change: edit fs/nfs/internal.h

	 change: edit fs/nfs/nfs3xdr.c

	 change: edit fs/nfs/nfs2xdr.c

	 change: edit fs/nfs/localio.c

  	 Revision  by anna.schumaker: (NFS: add basic STATX_DIOALIGN and STATX_DIO_READ_ALIGN support)

	 change: edit fs/nfs/inode.c

  	 Revision  by dmitry.torokhov: (Input: aw86927 - fix error code in probe())

	 change: edit drivers/input/misc/aw86927.c

  	 Revision  by deller: (fbdev: xenfb: Use vmalloc_array to simplify code)

	 change: edit drivers/video/fbdev/xen-fbfront.c

  	 Revision  by deller: (fbdev: s3fb: Implement powersave for S3 FB)

	 change: edit drivers/video/fbdev/s3fb.c

  	 Revision  by deller: (fbdev: s3fb: Implement 1 and 2 BPP modes, improve 4 BPP)

	 change: edit drivers/video/fbdev/Kconfig

	 change: edit drivers/video/fbdev/s3fb.c

  	 Revision  by deller: (fbdev: core: Fix ubsan warning in pixel_to_pat)

	 change: edit drivers/video/fbdev/core/fb_fillrect.h

  	 Revision  by deller: (fbdev: Use string choices helpers)

	 change: edit drivers/video/fbdev/nvidia/nvidia.c

	 change: edit drivers/video/fbdev/pxafb.c

	 change: edit drivers/video/fbdev/core/fbmon.c

  	 Revision  by deller: (fbdev: mb862xxfb: Use int type to store negative error codes)

	 change: edit drivers/video/fbdev/mb862xx/mb862xxfbdrv.c

  	 Revision  by deller: (fbdev: s3fb: Revert mclk stop in suspend)

	 change: edit drivers/video/fbdev/s3fb.c

  	 Revision  by deller: (fbdev: simplefb: Fix use after free in simplefb_detach_genpds())

	 change: edit drivers/video/fbdev/simplefb.c

  	 Revision  by rostedt: (ftrace: Fix softlockup in ftrace_module_enable)

	 change: edit kernel/trace/ftrace.c

  	 Revision  by rostedt: (tracing: Ensure optimized hashing works)

	 change: edit kernel/trace/trace_sched_switch.c

  	 Revision  by kuba: (net/mlx5: Improve write-combining test reliability for ARM64 Grace CPUs)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/wc.c

  	 Revision  by wei.liu: (x86/hyperv: Add kexec/kdump support on Azure CVMs)

	 change: edit arch/x86/hyperv/ivm.c

  	 Revision  by wei.liu: (mshv: Handle NEED_RESCHED_LAZY before transferring to guest)

	 change: edit drivers/hv/mshv_common.c

	 change: edit drivers/hv/mshv_root_main.c

  	 Revision  by wei.liu: (entry/kvm: KVM: Move KVM details related to signal/-EINTR into KVM proper)

	 change: edit arch/loongarch/kvm/vcpu.c

	 change: edit kernel/entry/kvm.c

	 change: edit include/linux/kvm_host.h

	 change: edit arch/x86/kvm/vmx/vmx.c

	 change: edit arch/arm64/kvm/arm.c

	 change: edit arch/riscv/kvm/vcpu.c

	 change: edit include/linux/entry-kvm.h

	 change: edit arch/x86/kvm/x86.c

  	 Revision  by wei.liu: (entry: Rename &quot;kvm&quot; entry code assets to &quot;virt&quot; to genericize APIs)

	 change: edit kernel/entry/Makefile

	 change: edit arch/x86/kvm/Kconfig

	 change: edit MAINTAINERS

	 change: edit virt/kvm/Kconfig

	 change: edit kernel/rcu/tree.c

	 change: edit arch/arm64/kvm/Kconfig

	 change: edit include/linux/kvm_host.h

	 change: edit include/linux/rcupdate.h

	 change: add kernel/entry/virt.c

	 change: edit arch/loongarch/kvm/Kconfig

	 change: edit arch/riscv/kvm/Kconfig

	 change: add include/linux/entry-virt.h

	 change: delete kernel/entry/kvm.c

	 change: delete include/linux/entry-kvm.h

  	 Revision  by wei.liu: (mshv: Use common &quot;entry virt&quot; APIs to do work in root before running guest)

	 change: edit drivers/hv/Kconfig

	 change: edit drivers/hv/mshv_common.c

	 change: edit drivers/hv/mshv_root_main.c

	 change: edit drivers/hv/mshv.h

  	 Revision  by wei.liu: (x86/hyperv: Switch to msi_create_parent_irq_domain())

	 change: edit arch/x86/hyperv/irqdomain.c

	 change: edit drivers/hv/Kconfig

  	 Revision  by wei.liu: (Drivers: hv: vmbus: Clean up sscanf format specifier in target_cpu_store())

	 change: edit drivers/hv/vmbus_drv.c

  	 Revision  by wei.liu: (Drivers: hv: vmbus: Fix sysfs output format for ring buffer index)

	 change: edit drivers/hv/vmbus_drv.c

  	 Revision  by wei.liu: (Drivers: hv: vmbus: Fix typos in vmbus_drv.c)

	 change: edit drivers/hv/vmbus_drv.c

  	 Revision  by wei.liu: (Drivers: hv: Add CONFIG_HYPERV_VMBUS option)

	 change: edit drivers/hv/Makefile

	 change: edit drivers/uio/Kconfig

	 change: edit drivers/input/serio/Kconfig

	 change: edit drivers/net/hyperv/Kconfig

	 change: edit drivers/gpu/drm/Kconfig

	 change: edit drivers/hid/Kconfig

	 change: edit include/asm-generic/mshyperv.h

	 change: edit drivers/hv/Kconfig

	 change: edit drivers/video/fbdev/Kconfig

	 change: edit drivers/pci/Kconfig

	 change: edit drivers/scsi/Kconfig

	 change: edit net/vmw_vsock/Kconfig

  	 Revision  by wei.liu: (Drivers: hv: Make CONFIG_HYPERV bool)

	 change: edit drivers/hv/Makefile

	 change: edit drivers/Makefile

	 change: edit drivers/hv/Kconfig

  	 Revision  by kuba: (net/mlx5: HWS, Generalize complex matchers)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc.h

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc.c

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/steering/hws/definer.c

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.h

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/steering/hws/definer.h

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c

  	 Revision  by kuba: (net/mlx5e: Prevent entering switchdev mode with inconsistent netns)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c

  	 Revision  by kuba: (net/mlx5: Improve QoS error messages with actual depth values)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c

  	 Revision  by kuba: (net/mlx5e: Remove unused mdev param from RSS indir init)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en/rss.c

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en/rss.h

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en_tc.c

  	 Revision  by kuba: (net/mlx5e: Introduce mlx5e_rss_init_params)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en/rss.c

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en/rx_res.c

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en/rx_res.h

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en/rss.h

  	 Revision  by kuba: (net/mlx5e: Introduce mlx5e_rss_params for RSS configuration)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en/rx_res.c

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en/rss.h

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en/rss.c

  	 Revision  by kuba: (net/mlx5e: Use extack in set rxfh callback)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c

  	 Revision  by kuba: (octeontx2-vf: fix bitmap leak)

	 change: edit drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c

  	 Revision  by kuba: (octeontx2-pf: fix bitmap leak)

	 change: edit drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c

  	 Revision  by stfrench: (ksmbd: Fix race condition in RPC handle list access)

	 change: edit fs/smb/server/mgmt/user_session.c

  	 Revision  by stfrench: (ksmbd: make ksmbd thread names distinct by client IP)

	 change: edit fs/smb/server/transport_tcp.c

  	 Revision  by stfrench: (ksmbd: use sock_create_kern interface to create kernel socket)

	 change: edit fs/smb/server/transport_tcp.c

  	 Revision  by stfrench: (ksmbd: copy overlapped range within the same file)

	 change: edit fs/smb/server/vfs.c

  	 Revision  by stfrench: (ksmbd: fix error code overwriting in smb2_get_info_filesystem())

	 change: edit fs/smb/server/smb2pdu.c

  	 Revision  by stfrench: (ksmbd: add max ip connections parameter)

	 change: edit fs/smb/server/ksmbd_netlink.h

	 change: edit fs/smb/server/transport_tcp.c

	 change: edit fs/smb/server/transport_ipc.c

	 change: edit fs/smb/server/server.h

  	 Revision  by stfrench: (ksmbd: add an error print when maximum IP connections limit is reached)

	 change: edit fs/smb/server/transport_tcp.c

  	 Revision  by stfrench: (ksmbd: replace connection list with hash table)

	 change: edit fs/smb/server/connection.h

	 change: edit fs/smb/server/transport_rdma.c

	 change: edit fs/smb/server/connection.c

	 change: edit fs/smb/server/smb2pdu.c

	 change: edit fs/smb/server/transport_tcp.c

  	 Revision  by stfrench: (ksmbd: increase session and share hash table bits)

	 change: edit fs/smb/server/mgmt/user_session.c

	 change: edit fs/smb/server/mgmt/share_config.c

  	 Revision  by sboyd: (clk: microchip: core: remove duplicate roclk_determine_rate())

	 change: edit drivers/clk/microchip/clk-core.c

  	 Revision  by pabeni: (Revert &quot;Documentation: net: add flow control guide and document ethtool API&quot;)

	 change: edit Documentation/networking/index.rst

	 change: edit net/ethtool/pause.c

	 change: edit Documentation/networking/phy.rst

	 change: edit Documentation/netlink/specs/ethtool.yaml

	 change: edit net/dcb/dcbnl.c

	 change: delete Documentation/networking/flow_control.rst

	 change: edit include/uapi/linux/ethtool_netlink_generated.h

	 change: edit include/linux/ethtool.h

  	 Revision  by pabeni: (dt-bindings: net: sun8i-emac: Add A523 GMAC200 compatible)

	 change: edit Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml

  	 Revision  by pabeni: (net: stmmac: Add support for Allwinner A523 GMAC200)

	 change: edit drivers/net/ethernet/stmicro/stmmac/Kconfig

	 change: edit drivers/net/ethernet/stmicro/stmmac/Makefile

	 change: add drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c

  	 Revision  by lee: (mfd: simple-mfd-i2c: Add compatible strings for Layerscape QIXIS FPGA)

	 change: edit drivers/mfd/simple-mfd-i2c.c

  	 Revision  by lee: (mfd: adp5585: Drop useless return statement)

	 change: edit drivers/mfd/adp5585.c

  	 Revision  by lee: (mfd: Kconfig: Fix spelling mistake &quot;infontainment&quot; -&gt; &quot;infotainment&quot;)

	 change: edit drivers/mfd/Kconfig

  	 Revision  by lee: (mfd: stmpe: Remove IRQ domain upon removal)

	 change: edit drivers/mfd/stmpe.c

  	 Revision  by lee: (mfd: stmpe-spi: Use module_spi_driver to remove boilerplate)

	 change: edit drivers/mfd/stmpe-spi.c

  	 Revision  by lee: (mfd: stmpe-i2c: Use module_i2c_driver to remove boilerplate)

	 change: edit drivers/mfd/stmpe-i2c.c

  	 Revision  by lee: (mfd: stmpe-spi: Add missing MODULE_LICENSE)

	 change: edit drivers/mfd/stmpe-spi.c

  	 Revision  by lee: (mfd: stmpe-i2c: Add missing MODULE_LICENSE)

	 change: edit drivers/mfd/stmpe-i2c.c

  	 Revision  by lee: (dt-bindings: mfd: qnap,ts433-mcu: Add qnap,ts233-mcu compatible)

	 change: edit Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml

  	 Revision  by lee: (mfd: qnap-mcu: Add driver data for TS233 variant)

	 change: edit drivers/mfd/qnap-mcu.c

  	 Revision  by lee: (dt-bindings: mfd: qnap,ts433-mcu: Allow nvmem-layout child node)

	 change: edit Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml

  	 Revision  by lee: (mfd: kempld: Switch back to earlier -&gt;init() behavior)

	 change: edit drivers/mfd/kempld-core.c

  	 Revision  by lee: (mfd: qnap-mcu: Include linux/types.h in qnap-mcu.h shared header)

	 change: edit include/linux/mfd/qnap-mcu.h

  	 Revision  by lee: (mfd: qnap-mcu: Handle errors returned from qnap_mcu_write)

	 change: edit drivers/mfd/qnap-mcu.c

  	 Revision  by lee: (mfd: qnap-mcu: Convert to guard(mutex) in qnap_mcu_exec)

	 change: edit drivers/mfd/qnap-mcu.c

  	 Revision  by lee: (mfd: qnap-mcu: Improve structure in qnap_mcu_exec)

	 change: edit drivers/mfd/qnap-mcu.c

  	 Revision  by lee: (mfd: intel_soc_pmic_chtdc_ti: Set use_single_read regmap_config flag)

	 change: edit drivers/mfd/intel_soc_pmic_chtdc_ti.c

  	 Revision  by lee: (mfd: da9063: Split chip variant reading in two bus transactions)

	 change: edit drivers/mfd/da9063-i2c.c

  	 Revision  by lee: (mfd: macsmc: Remove error prints for devm_add_action_or_reset())

	 change: edit drivers/mfd/macsmc.c

  	 Revision  by lee: (mfd: madera: Work around false-positive -Wininitialized warning)

	 change: edit drivers/mfd/madera-core.c

  	 Revision  by lee: (dt-bindings: mfd: aspeed-lpc: Add missing &quot;clocks&quot; property on lpc-snoop node)

	 change: edit Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml

  	 Revision  by lee: (mfd: kempld: Use PTR_ERR_OR_ZERO() to simplify code)

	 change: edit drivers/mfd/kempld-core.c

  	 Revision  by lee: (dt-bindings: mfd: syscon: Add &quot;marvell,armada-3700-usb2-host-device-misc&quot; compatible)

	 change: edit Documentation/devicetree/bindings/mfd/syscon.yaml

  	 Revision  by lee: (mfd: max899x: Use dedicated interrupt wake setters)

	 change: edit drivers/mfd/max8998.c

	 change: edit drivers/mfd/max8997.c

  	 Revision  by lee: (mfd: arizona: Make legacy gpiolib interface optional)

	 change: edit drivers/mfd/arizona-irq.c

	 change: edit include/linux/mfd/arizona/pdata.h

	 change: edit sound/soc/codecs/arizona-jack.c

  	 Revision  by lee: (mfd: Remove unneeded &#039;fast_io&#039; parameter in regmap_config)

	 change: edit drivers/mfd/fsl-imx25-tsadc.c

	 change: edit drivers/mfd/sun4i-gpadc.c

	 change: edit drivers/mfd/exynos-lpass.c

	 change: edit drivers/mfd/stm32-lptimer.c

  	 Revision  by lee: (dt-bindings: mfd: Move embedded controllers to own directory)

	 change: add Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-c630-ec.yaml

	 change: delete Documentation/devicetree/bindings/mfd/google,cros-ec.yaml

	 change: add Documentation/devicetree/bindings/embedded-controller/huawei,gaokun3-ec.yaml

	 change: edit Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml

	 change: edit Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml

	 change: delete Documentation/devicetree/bindings/platform/microsoft,surface-sam.yaml

	 change: edit Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml

	 change: add Documentation/devicetree/bindings/embedded-controller/acer,aspire1-ec.yaml

	 change: delete Documentation/devicetree/bindings/platform/acer,aspire1-ec.yaml

	 change: edit Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml

	 change: delete Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml

	 change: edit Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml

	 change: delete Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml

	 change: add Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml

	 change: edit Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml

	 change: add Documentation/devicetree/bindings/embedded-controller/google,cros-ec.yaml

	 change: edit MAINTAINERS

	 change: add Documentation/devicetree/bindings/embedded-controller/gw,gsc.yaml

	 change: add Documentation/devicetree/bindings/embedded-controller/microsoft,surface-sam.yaml

	 change: edit Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml

	 change: delete Documentation/devicetree/bindings/platform/lenovo,yoga-c630-ec.yaml

	 change: delete Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml

	 change: edit Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml

  	 Revision  by lee: (mfd: si476x: Add GPIOLIB_LEGACY dependency)

	 change: edit drivers/mfd/Kconfig

	 change: edit sound/soc/codecs/Kconfig

  	 Revision  by lee: (mfd: aat2870: Add GPIOLIB_LEGACY dependency)

	 change: edit drivers/mfd/Kconfig

  	 Revision  by lee: (dt-bindings: mfd: sl28cpld: Add sa67mcu compatible)

	 change: edit Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml

  	 Revision  by lee: (dt-bindings: mfd: Add support the SpacemiT P1 PMIC)

	 change: add Documentation/devicetree/bindings/mfd/spacemit,p1.yaml

  	 Revision  by lee: (mfd: simple-mfd-i2c: Add SpacemiT P1 support)

	 change: edit drivers/mfd/simple-mfd-i2c.c

	 change: edit drivers/mfd/Kconfig

  	 Revision  by lee: (dt-bindings: mfd: syscon: Document the control-scb syscon on PolarFire SoC)

	 change: edit Documentation/devicetree/bindings/mfd/syscon.yaml

  	 Revision  by lee: (mfd: core: Increment of_node&#039;s refcount before linking it to the platform device)

	 change: edit drivers/mfd/mfd-core.c

  	 Revision  by lee: (mfd: macsmc: Add &quot;apple,t8103-smc&quot; compatible)

	 change: edit drivers/mfd/macsmc.c

  	 Revision  by lee: (dt-bindings: mfd: fsl,mc13xxx: Convert txt to DT schema)

	 change: add Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml

	 change: delete Documentation/devicetree/bindings/mfd/mc13xxx.txt

  	 Revision  by lee: (dt-bindings: mfd: fsl,mc13xxx: Add buttons node)

	 change: edit Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml

  	 Revision  by lee: (dt-bindings: mfd: Convert aspeed,ast2400-p2a-ctrl to DT schema)

	 change: delete Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt

	 change: edit Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml

  	 Revision  by lee: (dt-bindings: mfd: aspeed: Add AST2700 SCU compatibles)

	 change: edit Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml

  	 Revision  by lee: (mfd: bd71828, bd71815: Prepare for power-supply support)

	 change: edit drivers/mfd/rohm-bd71828.c

	 change: edit include/linux/mfd/rohm-bd71828.h

  	 Revision  by lee: (mfd: ls2kbmc: Introduce Loongson-2K BMC core driver)

	 change: edit MAINTAINERS

	 change: edit drivers/mfd/Makefile

	 change: add drivers/mfd/ls2k-bmc-core.c

	 change: edit drivers/mfd/Kconfig

  	 Revision  by lee: (mfd: ls2kbmc: Add Loongson-2K BMC reset function support)

	 change: edit drivers/mfd/ls2k-bmc-core.c

  	 Revision  by lee: (mfd: cs42l43: Move IRQ enable/disable to encompass force suspend)

	 change: edit drivers/mfd/cs42l43.c

  	 Revision  by lee: (mfd: cs42l43: Remove IRQ masking in suspend)

	 change: edit drivers/mfd/cs42l43.c

  	 Revision  by lee: (mfd: max77705: Setup the core driver as an interrupt controller)

	 change: edit drivers/mfd/max77705.c

  	 Revision  by lee: (mfd: rz-mtu3: Fix MTU5 NFCR register offset)

	 change: edit drivers/mfd/rz-mtu3.c

  	 Revision  by lee: (mfd: vexpress-sysreg: Use more common syntax for compound literals)

	 change: edit drivers/mfd/vexpress-sysreg.c

  	 Revision  by lee: (mfd: 88pm886: Add GPADC cell)

	 change: edit drivers/mfd/88pm886.c

  	 Revision  by lee: (mfd: intel-lpss: Add Intel Wildcat Lake LPSS PCI IDs)

	 change: edit drivers/mfd/intel-lpss-pci.c

  	 Revision  by lee: (dt-bindings: mfd: tps6594: Allow gpio-line-names)

	 change: edit Documentation/devicetree/bindings/mfd/ti,tps6594.yaml

  	 Revision  by lee: (dt-bindings: watchdog: Add SMARC-sAM67 support)

	 change: edit Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml

  	 Revision  by lee: (dt-bindings: mfd: twl: Add missing sub-nodes for TWL4030 &amp; TWL603x)

	 change: delete Documentation/devicetree/bindings/pwm/ti,twl-pwm.txt

	 change: edit Documentation/devicetree/bindings/mfd/ti,twl.yaml

	 change: delete Documentation/devicetree/bindings/mfd/twl4030-power.txt

	 change: delete Documentation/devicetree/bindings/pwm/ti,twl-pwmled.txt

  	 Revision  by lee: (mfd: simple-mfd-i2c: Keep compatible strings in alphabetical order)

	 change: edit drivers/mfd/simple-mfd-i2c.c

  	 Revision  by lee: (mfd: simple-mfd-i2c: Add compatible string for LX2160ARDB)

	 change: edit drivers/mfd/simple-mfd-i2c.c

  	 Revision  by mst: (vhost: vringh: Modify the return value check)

	 change: edit drivers/vhost/vringh.c

  	 Revision  by mst: (vhost: vringh: Fix copy_to_iter return value check)

	 change: edit drivers/vhost/vringh.c

  	 Revision  by mst: (virtio_balloon: Remove redundant __GFP_NOWARN)

	 change: edit drivers/virtio/virtio_balloon.c

  	 Revision  by mst: (virtio_ring: constify virtqueue pointer for DMA helpers)

	 change: edit drivers/virtio/virtio_ring.c

	 change: edit include/linux/virtio.h

  	 Revision  by mst: (virtio_ring: switch to use dma_{map|unmap}_page())

	 change: edit drivers/virtio/virtio_ring.c

  	 Revision  by mst: (virtio: rename dma helpers)

	 change: edit drivers/net/virtio_net.c

	 change: edit drivers/virtio/virtio_ring.c

	 change: edit include/linux/virtio.h

  	 Revision  by mst: (virtio: introduce virtio_map container union)

	 change: edit drivers/virtio/virtio_ring.c

	 change: edit drivers/virtio/virtio_vdpa.c

	 change: edit include/linux/virtio_ring.h

	 change: edit include/linux/virtio.h

  	 Revision  by mst: (virtio_ring: rename dma_handle to map_handle)

	 change: edit drivers/virtio/virtio_ring.c

  	 Revision  by mst: (virtio: introduce map ops in virtio core)

	 change: edit include/linux/virtio.h

	 change: edit include/linux/virtio_config.h

	 change: edit drivers/virtio/virtio_ring.c

	 change: edit drivers/virtio/virtio_vdpa.c

  	 Revision  by mst: (vdpa: support virtio_map)

	 change: edit drivers/vdpa/vdpa_sim/vdpa_sim.c

	 change: edit drivers/vdpa/mlx5/core/mr.c

	 change: edit drivers/vdpa/alibaba/eni_vdpa.c

	 change: edit drivers/vdpa/solidrun/snet_main.c

	 change: edit drivers/vdpa/ifcvf/ifcvf_main.c

	 change: edit drivers/vdpa/octeon_ep/octep_vdpa_main.c

	 change: edit drivers/vdpa/mlx5/net/mlx5_vnet.c

	 change: edit drivers/vdpa/virtio_pci/vp_vdpa.c

	 change: edit drivers/vhost/vdpa.c

	 change: edit include/linux/vdpa.h

	 change: edit drivers/vdpa/pds/vdpa_dev.c

	 change: edit drivers/vdpa/vdpa.c

	 change: edit drivers/vdpa/vdpa_user/vduse_dev.c

	 change: edit drivers/virtio/virtio_vdpa.c

  	 Revision  by mst: (vdpa: introduce map ops)

	 change: edit drivers/vdpa/ifcvf/ifcvf_main.c

	 change: edit drivers/vdpa/octeon_ep/octep_vdpa_main.c

	 change: edit drivers/vdpa/solidrun/snet_main.c

	 change: edit drivers/vdpa/pds/vdpa_dev.c

	 change: edit drivers/vdpa/vdpa_sim/vdpa_sim.c

	 change: edit drivers/vdpa/vdpa_user/vduse_dev.c

	 change: edit include/linux/vdpa.h

	 change: edit drivers/virtio/virtio_vdpa.c

	 change: edit drivers/vdpa/vdpa.c

	 change: edit drivers/vdpa/alibaba/eni_vdpa.c

	 change: edit drivers/vdpa/mlx5/net/mlx5_vnet.c

	 change: edit drivers/vdpa/virtio_pci/vp_vdpa.c

  	 Revision  by mst: (vduse: switch to use virtio map API instead of DMA API)

	 change: edit drivers/vdpa/vdpa_user/iova_domain.h

	 change: edit include/linux/virtio.h

	 change: edit drivers/vdpa/Kconfig

	 change: edit drivers/vdpa/vdpa_user/iova_domain.c

	 change: edit drivers/vdpa/vdpa_user/vduse_dev.c

  	 Revision  by mst: (vduse: Use fixed 4KB bounce pages for non-4KB page size)

	 change: edit drivers/vdpa/vdpa_user/iova_domain.c

	 change: edit drivers/vdpa/vdpa_user/iova_domain.h

  	 Revision  by mst: (virtio-vdpa: Drop redundant conversion to bool)

	 change: edit drivers/virtio/virtio_vdpa.c

  	 Revision  by rafael.j.wysocki: (cpufreq: Make drivers using CPUFREQ_ETERNAL specify transition latency)

	 change: edit drivers/cpufreq/cpufreq-dt.c

	 change: edit rust/kernel/cpufreq.rs

	 change: edit include/linux/cpufreq.h

	 change: edit drivers/cpufreq/spear-cpufreq.c

	 change: edit drivers/cpufreq/scmi-cpufreq.c

	 change: edit drivers/cpufreq/mediatek-cpufreq-hw.c

	 change: edit drivers/cpufreq/imx6q-cpufreq.c

	 change: edit drivers/cpufreq/scpi-cpufreq.c

	 change: edit drivers/cpufreq/rcpufreq_dt.rs

  	 Revision  by rafael.j.wysocki: (cpufreq: CPPC: Avoid using CPUFREQ_ETERNAL as transition delay)

	 change: edit drivers/cpufreq/cppc_cpufreq.c

  	 Revision  by rafael.j.wysocki: (ACPI: CPPC: Do not use CPUFREQ_ETERNAL as an error value)

	 change: edit drivers/acpi/cppc_acpi.c

	 change: edit drivers/cpufreq/amd-pstate.c

	 change: edit drivers/cpufreq/cppc_cpufreq.c

	 change: edit include/acpi/cppc_acpi.h

  	 Revision  by rafael.j.wysocki: (cpufreq: Drop unused symbol CPUFREQ_ETERNAL)

	 change: edit Documentation/admin-guide/pm/cpufreq.rst

	 change: edit Documentation/cpu-freq/cpu-drivers.rst

	 change: edit Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst

	 change: edit Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst

	 change: edit include/linux/cpufreq.h

  	 Revision  by acme: (perf tools: Fix duplicated words in documentation and comments)

	 change: edit tools/perf/builtin-script.c

	 change: edit tools/perf/Documentation/perf-diff.txt

	 change: edit tools/perf/util/hwmon_pmu.h

  	 Revision  by acme: (perf test perftool_testsuite: Use absolute paths)

	 change: edit tools/perf/tests/shell/base_probe/test_line_semantics.sh

	 change: edit tools/perf/tests/shell/base_probe/test_adding_kernel.sh

	 change: edit tools/perf/tests/shell/base_report/test_basic.sh

	 change: edit tools/perf/tests/shell/base_probe/test_adding_blacklisted.sh

	 change: edit tools/perf/tests/shell/base_probe/test_basic.sh

	 change: edit tools/perf/tests/shell/base_report/setup.sh

	 change: edit tools/perf/tests/shell/common/init.sh

	 change: edit tools/perf/tests/shell/base_probe/test_invalid_options.sh

  	 Revision  by robh: (dt-bindings: mmc: Correct typo &quot;upto&quot; to &quot;up to&quot;)

	 change: edit Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml

  	 Revision  by robh: (of: doc: Fix typo in doc comments.)

	 change: edit drivers/of/overlay.c

	 change: edit drivers/of/irq.c

	 change: edit include/linux/of.h

  	 Revision  by acme: (perf sched: Avoid union type punning undefined behavior)

	 change: edit tools/perf/builtin-sched.c

  	 Revision  by acme: (perf powerpc: Add basic CONFIG_AUXTRACE support for VPA pmu on powerpc)

	 change: edit tools/perf/util/auxtrace.h

	 change: add tools/perf/arch/powerpc/util/auxtrace.c

	 change: edit tools/perf/arch/powerpc/util/Build

	 change: add tools/perf/util/powerpc-vpadtl.h

	 change: edit tools/perf/util/auxtrace.c

  	 Revision  by acme: (perf powerpc: Process auxtrace events and display in &#039;perf report -D&#039;)

	 change: edit tools/perf/util/Build

	 change: edit tools/perf/util/auxtrace.c

	 change: edit tools/perf/util/event.h

	 change: edit tools/perf/util/powerpc-vpadtl.h

	 change: add tools/perf/util/powerpc-vpadtl.c

  	 Revision  by acme: (perf powerpc: Add event name as vpa-dtl of PERF_TYPE_SYNTH type to present DTL samples)

	 change: edit tools/perf/util/event.h

	 change: edit tools/perf/util/powerpc-vpadtl.c

  	 Revision  by acme: (perf powerpc: Allocate and setup aux buffer queue to help co-relate with other events across CPU&#039;s)

	 change: edit tools/perf/util/powerpc-vpadtl.c

  	 Revision  by acme: (perf powerpc: Process the DTL entries in queue and deliver samples)

	 change: edit tools/perf/util/powerpc-vpadtl.c

  	 Revision  by acme: (perf script: Enable to present DTL entries)

	 change: edit tools/perf/builtin-script.c

	 change: edit tools/perf/util/event.h

  	 Revision  by acme: (MAINTAINERS: Remove myself from perf_events subsystem)

	 change: edit MAINTAINERS

  	 Revision  by acme: (perf annotate: Use architecture-agnostic register limit)

	 change: edit tools/perf/util/annotate-data.h

  	 Revision  by dsterba: (btrfs: fix PAGE_SIZE format specifier in open_ctree())

	 change: edit fs/btrfs/disk-io.c

  	 Revision  by robh: (of: unittest: Fix device reference count leak in of_unittest_pci_node_verify)

	 change: edit drivers/of/unittest.c

  	 Revision  by bhelgaas: (PCI: stm32: Add PCIe host support for STM32MP25)

	 change: edit drivers/pci/controller/dwc/Kconfig

	 change: add drivers/pci/controller/dwc/pcie-stm32.c

	 change: add drivers/pci/controller/dwc/pcie-stm32.h

	 change: edit drivers/pci/controller/dwc/Makefile

  	 Revision  by bhelgaas: (dt-bindings: PCI: Add STM32MP25 PCIe Endpoint bindings)

	 change: add Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml

  	 Revision  by bhelgaas: (PCI: stm32-ep: Add PCIe Endpoint support for STM32MP25)

	 change: edit drivers/pci/controller/dwc/Makefile

	 change: add drivers/pci/controller/dwc/pcie-stm32-ep.c

	 change: edit drivers/pci/controller/dwc/Kconfig

	 change: edit drivers/pci/controller/dwc/pcie-stm32.h

  	 Revision  by bhelgaas: (MAINTAINERS: Add entry for ST STM32MP25 PCIe drivers)

	 change: edit MAINTAINERS

  	 Revision  by stfrench: (smb: client: show lease state as R/H/W (or NONE) in open_files)

	 change: edit fs/smb/client/cifs_debug.c

  	 Revision  by acme: (perf bpf_counter: Move header declarations into C code)

	 change: edit tools/perf/util/bpf_counter.c

	 change: edit tools/perf/util/bpf_ftrace.c

	 change: edit tools/perf/util/bpf_off_cpu.c

	 change: edit tools/perf/util/bpf_counter.h

	 change: edit tools/perf/util/bpf_counter_cgroup.c

  	 Revision  by acme: (perf bpf_counter: Fix handling of cpumap fixing hybrid)

	 change: edit tools/perf/util/bpf_counter.c

	 change: edit tools/perf/util/bpf_counter_cgroup.c

  	 Revision  by acme: (perf test: Refactor brstack test)

	 change: edit tools/perf/tests/shell/test_brstack.sh

  	 Revision  by acme: (perf test: Add syscall and address tests to brstack test)

	 change: edit tools/perf/tests/shell/test_brstack.sh

  	 Revision  by acme: (perf test: Extend branch stack sampling test for Arm64 BRBE)

	 change: edit tools/perf/tests/tests.h

	 change: edit tools/perf/tests/builtin-test.c

	 change: edit tools/perf/tests/shell/test_brstack.sh

	 change: edit tools/perf/tests/workloads/Build

	 change: add tools/perf/tests/workloads/traploop.c

  	 Revision  by rafael.j.wysocki: (ACPI: property: Return present device nodes only on fwnode interface)

	 change: edit drivers/acpi/property.c

  	 Revision  by chuck.lever: (NFSD: Allow layoutcommit during grace period)

	 change: edit fs/nfsd/nfs4proc.c

  	 Revision  by chuck.lever: (nfsd: delete unnecessary NULL check in __fh_verify())

	 change: edit fs/nfsd/nfsfh.c

  	 Revision  by chuck.lever: (NFSD: Do the grace period check in -&gt;proc_layoutget)

	 change: edit fs/nfsd/blocklayout.c

	 change: edit fs/nfsd/pnfs.h

	 change: edit fs/nfsd/nfs4proc.c

	 change: edit fs/nfsd/flexfilelayout.c

  	 Revision  by chuck.lever: (NFSD: Add io_cache_{read,write} controls to debugfs)

	 change: edit fs/nfsd/nfsd.h

	 change: edit fs/nfsd/debugfs.c

	 change: edit fs/nfsd/vfs.c

  	 Revision  by chuck.lever: (SUNRPC: Make RPCSEC_GSS_KRB5 select CRYPTO instead of depending on it)

	 change: edit net/sunrpc/Kconfig

  	 Revision  by chuck.lever: (nfsd: discard nfserr_dropit)

	 change: edit fs/nfsd/lockd.c

	 change: edit fs/nfsd/nfsd.h

  	 Revision  by acme: (perf test: Add an &#039;import perf&#039; test shell script)

	 change: add tools/perf/tests/shell/python-use.sh

  	 Revision  by acme: (perf test: Remove C python_use test)

	 change: delete tools/perf/tests/python-use.c

	 change: edit tools/perf/tests/Build

	 change: edit tools/perf/tests/builtin-test.c

	 change: edit tools/perf/tests/tests.h

  	 Revision  by ast: (selftests/bpf: Fix open-coded gettid syscall in uprobe syscall tests)

	 change: edit tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c

  	 Revision  by ast: (selftests/bpf: Fix typo in subtest_basic_usdt after merge conflict)

	 change: edit tools/testing/selftests/bpf/prog_tests/usdt.c

  	 Revision  by ast: (selftests/bpf: Fix realloc size in bpf_get_addrs)

	 change: edit tools/testing/selftests/bpf/trace_helpers.c

  	 Revision  by ast: (bpf: Skip scalar adjustment for BPF_NEG if dst is a pointer)

	 change: edit kernel/bpf/verifier.c

  	 Revision  by ast: (selftests/bpf: Add test for BPF_NEG alu on CONST_PTR_TO_MAP)

	 change: edit tools/testing/selftests/bpf/progs/verifier_value_illegal_alu.c

  	 Revision  by arnd: (ARM: configs: u8500: Set NFC_SHDLC as built-in)

	 change: edit arch/arm/configs/u8500_defconfig

  	 Revision  by arnd: (ARM: versatile: clock: convert from round_rate() to determine_rate())

	 change: edit arch/arm/mach-versatile/spc.c

  	 Revision  by ast: (libbpf: make libbpf_errno.c into more generic libbpf_utils.c)

	 change: edit tools/lib/bpf/Build

	 change: delete tools/lib/bpf/libbpf_errno.c

	 change: add tools/lib/bpf/libbpf_utils.c

  	 Revision  by ast: (libbpf: remove unused libbpf_strerror_r and STRERR_BUFSIZE)

	 change: edit tools/lib/bpf/str_error.c

	 change: edit tools/lib/bpf/libbpf.c

	 change: edit tools/lib/bpf/str_error.h

  	 Revision  by ast: (libbpf: move libbpf_errstr() into libbpf_utils.c)

	 change: edit tools/lib/bpf/usdt.c

	 change: edit tools/lib/bpf/ringbuf.c

	 change: edit tools/lib/bpf/elf.c

	 change: edit tools/lib/bpf/relo_core.c

	 change: delete tools/lib/bpf/str_error.c

	 change: edit tools/lib/bpf/Build

	 change: edit tools/lib/bpf/btf.c

	 change: edit tools/lib/bpf/btf_dump.c

	 change: edit tools/lib/bpf/libbpf_utils.c

	 change: edit tools/lib/bpf/features.c

	 change: edit tools/lib/bpf/libbpf.c

	 change: edit tools/lib/bpf/libbpf_internal.h

	 change: edit tools/lib/bpf/gen_loader.c

	 change: edit tools/lib/bpf/linker.c

	 change: delete tools/lib/bpf/str_error.h

  	 Revision  by ast: (libbpf: move libbpf_sha256() implementation into libbpf_utils.c)

	 change: edit tools/lib/bpf/libbpf_utils.c

	 change: edit tools/lib/bpf/libbpf.c

	 change: edit tools/lib/bpf/libbpf_internal.h

  	 Revision  by ast: (libbpf: remove linux/unaligned.h dependency for libbpf_sha256())

	 change: edit tools/lib/bpf/libbpf_utils.c

  	 Revision  by ast: (bpf: Reject negative offsets for ALU ops)

	 change: edit kernel/bpf/verifier.c

  	 Revision  by ast: (selftests/bpf: Add test for libbpf_sha256())

	 change: add tools/testing/selftests/bpf/prog_tests/sha256.c

  	 Revision  by mhiramat: (tracing: Fix race condition in kprobe initialization causing NULL pointer dereference)

	 change: edit kernel/trace/trace_fprobe.c

	 change: edit kernel/trace/trace_kprobe.c

	 change: edit kernel/trace/trace_probe.h

	 change: edit kernel/trace/trace_uprobe.c

  	 Revision  by pjw: (clk: COMMON_CLK_RPMI should depend on RISCV)

	 change: edit drivers/clk/Kconfig

  	 Revision  by stfrench: (smb: client: add drop_dir_cache module parameter to invalidate cached dirents)

	 change: edit fs/smb/client/cifsfs.c

  	 Revision  by stfrench: (smb: client: account smb directory cache usage and per-tcon totals)

	 change: edit fs/smb/client/readdir.c

	 change: edit fs/smb/client/cifs_debug.c

	 change: edit fs/smb/client/cached_dir.c

	 change: edit fs/smb/client/cifsfs.c

	 change: edit fs/smb/client/cached_dir.h

  	 Revision  by stfrench: (smb: client: ensure open_cached_dir_by_dentry() only returns valid cfid)

	 change: edit fs/smb/client/inode.c

	 change: edit fs/smb/client/dir.c

	 change: edit fs/smb/client/cached_dir.c

	 change: edit fs/smb/client/cached_dir.h

  	 Revision  by stfrench: (smb: client: update cfid-&gt;last_access_time in open_cached_dir_by_dentry())

	 change: edit fs/smb/client/cached_dir.c

  	 Revision  by stfrench: (smb: client: remove unused fid_lock)

	 change: edit fs/smb/client/cached_dir.h

	 change: edit fs/smb/client/cached_dir.c

  	 Revision  by stfrench: (smb: client: transport: avoid reconnects triggered by pending task work)

	 change: edit fs/smb/client/transport.c

  	 Revision  by stfrench: (smb: client: transport: minor indentation style fix)

	 change: edit fs/smb/client/transport.c

  	 Revision  by stfrench: (smb: client: remove pointless cfid-&gt;has_lease check)

	 change: edit fs/smb/client/smb2ops.c

  	 Revision  by stfrench: (smb: client: short-circuit in open_cached_dir_by_dentry() if !dentry)

	 change: edit fs/smb/client/cached_dir.c

  	 Revision  by stfrench: (smb: client: short-circuit negative lookups when parent dir is fully cached)

	 change: edit fs/smb/client/dir.c

  	 Revision  by stfrench: (smb client: fix bug with newly created file in cached dir)

	 change: edit fs/smb/client/dir.c

  	 Revision  by stfrench: (cifs: client: force multichannel=off when max_channels=1)

	 change: edit fs/smb/client/fs_context.c

  	 Revision  by herbert: (crypto: zstd - Fix compression bug caused by truncation)

	 change: edit crypto/zstd.c

  	 Revision  by rmk+kernel: (ARM: 9451/1: mm: l2x0: use string choices helper)

	 change: edit arch/arm/mm/cache-l2x0.c

  	 Revision  by rmk+kernel: (ARM: 9454/1: kernel: bios32: use string choices helper)

	 change: edit arch/arm/kernel/bios32.c

  	 Revision  by rmk+kernel: (ARM: 9456/1: mm: fault: use string choices helper)

	 change: edit arch/arm/mm/fault.c

  	 Revision  by rmk+kernel: (ARM: 9457/1: ftrace: Implement HAVE_FUNCTION_GRAPH_FREGS)

	 change: edit arch/arm/Kconfig

	 change: edit arch/arm/kernel/entry-ftrace.S

  	 Revision  by rafael.j.wysocki: (thermal: renesas: Fix RZ/G3E fall-out)

	 change: edit drivers/thermal/renesas/Makefile

	 change: edit drivers/thermal/renesas/Kconfig

	 change: edit MAINTAINERS

  	 Revision  by herbert: (crypto: ti - Add CRYPTO_ALG_ASYNC flag to DTHEv2 AES algos)

	 change: edit drivers/crypto/ti/dthev2-aes.c

  	 Revision  by broonie: (ASoC: SOF: ipc3-topology: Fix multi-core and static pipelines tear down)

	 change: edit sound/soc/sof/ipc3-topology.c

  	 Revision  by broonie: (ASoC: SOF: ipc4-pcm: fix delay calculation when DSP resamples)

	 change: edit sound/soc/sof/ipc4-pcm.c

  	 Revision  by broonie: (ASoC: SOF: ipc4-pcm: fix start offset calculation for chain DMA)

	 change: edit sound/soc/sof/ipc4-topology.c

	 change: edit sound/soc/sof/ipc4-topology.h

	 change: edit sound/soc/sof/ipc4-pcm.c

  	 Revision  by acme: (perf build: Remove libtracefs configuration)

	 change: edit tools/perf/Makefile.config

  	 Revision  by broonie: (ASoC: SOF: ipc4-topology: Correct the minimum host DMA buffer size)

	 change: edit sound/soc/sof/ipc4-topology.h

  	 Revision  by broonie: (ASoC: SOF: ipc4-topology: Account for different ChainDMA host buffer size)

	 change: edit sound/soc/sof/ipc4-topology.h

	 change: edit sound/soc/sof/ipc4-topology.c

  	 Revision  by broonie: (ASoC: SOF: Intel: hda-pcm: Place the constraint on period time instead of buffer time)

	 change: edit sound/soc/sof/intel/hda-pcm.c

  	 Revision  by bhelgaas: (PCI/AER: Avoid NULL pointer dereference in aer_ratelimit())

	 change: edit drivers/pci/pcie/aer.c

  	 Revision  by chenhuacai: (LoongArch: Add cflag -fno-isolate-erroneous-paths-dereference)

	 change: edit arch/loongarch/Makefile

  	 Revision  by chenhuacai: (LoongArch: Fix build error for LTO with LLVM-18)

	 change: edit arch/loongarch/Makefile

  	 Revision  by chenhuacai: (LoongArch: Init acpi_gbl_use_global_lock to false)

	 change: edit arch/loongarch/kernel/setup.c

  	 Revision  by chenhuacai: (LoongArch: Allow specify SIMD width via kernel parameters)

	 change: edit arch/loongarch/kernel/cpu-probe.c

  	 Revision  by chenhuacai: (LoongArch: Add struct loongarch_image_header for kernel)

	 change: add arch/loongarch/include/asm/image.h

  	 Revision  by chenhuacai: (LoongArch: Add preparatory infrastructure for kexec_file)

	 change: add arch/loongarch/kernel/machine_kexec_file.c

	 change: edit arch/loongarch/kernel/Makefile

	 change: edit arch/loongarch/Kconfig

	 change: edit arch/loongarch/include/asm/kexec.h

	 change: edit arch/loongarch/kernel/machine_kexec.c

  	 Revision  by chenhuacai: (LoongArch: Add EFI binary support for kexec_file)

	 change: edit arch/loongarch/kernel/Makefile

	 change: edit arch/loongarch/include/asm/image.h

	 change: add arch/loongarch/kernel/kexec_efi.c

	 change: edit arch/loongarch/kernel/machine_kexec_file.c

	 change: edit arch/loongarch/include/asm/kexec.h

  	 Revision  by chenhuacai: (LoongArch: Add ELF binary support for kexec_file)

	 change: edit arch/loongarch/Kconfig

	 change: edit arch/loongarch/include/asm/kexec.h

	 change: edit arch/loongarch/kernel/machine_kexec_file.c

	 change: add arch/loongarch/kernel/kexec_elf.c

	 change: edit arch/loongarch/kernel/Makefile

  	 Revision  by chenhuacai: (LoongArch: Add crash dump support for kexec_file)

	 change: edit arch/loongarch/kernel/machine_kexec_file.c

  	 Revision  by chenhuacai: (LoongArch: Automatically disable kaslr if boot from kexec_file)

	 change: edit arch/loongarch/kernel/relocate.c

  	 Revision  by chenhuacai: (LoongArch: Try VMA lock-based page fault handling first)

	 change: edit arch/loongarch/Kconfig

	 change: edit arch/loongarch/mm/fault.c

  	 Revision  by chenhuacai: (LoongArch: Handle new atomic instructions for probes)

	 change: edit arch/loongarch/kernel/inst.c

	 change: edit arch/loongarch/include/asm/inst.h

  	 Revision  by chenhuacai: (LoongArch: BPF: Optimize sign-extention mov instructions)

	 change: edit arch/loongarch/net/bpf_jit.c

  	 Revision  by chenhuacai: (LoongArch: BPF: Fix uninitialized symbol &#039;retval_off&#039;)

	 change: edit arch/loongarch/net/bpf_jit.c

  	 Revision  by chenhuacai: (LoongArch: BPF: Remove duplicated flags check)

	 change: edit arch/loongarch/net/bpf_jit.c

  	 Revision  by chenhuacai: (LoongArch: BPF: Remove duplicated bpf_flush_icache())

	 change: edit arch/loongarch/net/bpf_jit.c

  	 Revision  by chenhuacai: (LoongArch: BPF: No text_poke() for kernel text)

	 change: edit arch/loongarch/net/bpf_jit.c

  	 Revision  by chenhuacai: (LoongArch: BPF: No support of struct argument in trampoline programs)

	 change: edit arch/loongarch/net/bpf_jit.c

  	 Revision  by chenhuacai: (LoongArch: BPF: Don&#039;t align trampoline size)

	 change: edit arch/loongarch/net/bpf_jit.c

  	 Revision  by chenhuacai: (LoongArch: BPF: Make trampoline size stable)

	 change: edit arch/loongarch/net/bpf_jit.c

  	 Revision  by chenhuacai: (LoongArch: BPF: Make error handling robust in arch_prepare_bpf_trampoline())

	 change: edit arch/loongarch/net/bpf_jit.c

  	 Revision  by chenhuacai: (LoongArch: BPF: Sign-extend struct ops return values properly)

	 change: edit arch/loongarch/net/bpf_jit.c

  	 Revision  by acme: (tools build: Don&#039;t assume libtracefs-devel is always available)

	 change: edit tools/build/Makefile.feature

	 change: edit tools/build/feature/test-all.c

  	 Revision  by acme: (perf bpf: Use __builtin_preserve_field_info for GCC compatibility)

	 change: edit tools/perf/util/bpf_skel/sample_filter.bpf.c

  	 Revision  by acme: (perf symbol-minimal: Be more defensive when reading build IDs)

	 change: edit tools/perf/util/symbol-minimal.c

  	 Revision  by acme: (libperf mmap: In user mmap rdpmc avoid undefined behavior)

	 change: edit tools/lib/perf/mmap.c

  	 Revision  by acme: (perf test: Stat std output don&#039;t fail metric only)

	 change: edit tools/perf/tests/shell/stat+std_output.sh

  	 Revision  by acme: (perf bench futex: Add missing stdbool.h)

	 change: edit tools/perf/bench/futex.h

  	 Revision  by acme: (tools bitmap: Add missing asm-generic/bitsperlong.h include)

	 change: edit tools/include/linux/bitmap.h

  	 Revision  by acme: (tools include: Replace tools linux/gfp_types.h with kernel version)

	 change: edit tools/perf/check-headers.sh

	 change: edit tools/include/linux/gfp_types.h

  	 Revision  by acme: (tools include: Add headers to make tools builds more hermetic)

	 change: add tools/include/uapi/linux/netfilter_arp.h

	 change: add tools/include/uapi/linux/if_addr.h

	 change: add tools/include/uapi/linux/neighbour.h

	 change: add tools/include/uapi/linux/rtnetlink.h

	 change: edit tools/perf/check-headers.sh

	 change: add tools/include/uapi/linux/netfilter.h

	 change: add tools/include/uapi/linux/genetlink.h

  	 Revision  by acme: (perf tools kvm: Add missed memory allocation check and free)

	 change: edit tools/perf/builtin-kvm.c

  	 Revision  by acme: (perf tools kwork: Add missed memory allocation check and free)

	 change: edit tools/perf/builtin-kwork.c

  	 Revision  by acme: (perf tools kvm: Fix the potential out of range memory access issue)

	 change: edit tools/perf/builtin-kvm.c

  	 Revision  by acme: (perf tools: Add helper x86__is_intel_cpu())

	 change: edit tools/perf/util/env.h

	 change: edit tools/perf/util/env.c

  	 Revision  by acme: (perf tools kvm: Use &quot;cycles&quot; to sample guest for &quot;kvm record&quot; on Intel)

	 change: edit tools/perf/arch/x86/util/kvm-stat.c

	 change: edit tools/perf/util/kvm-stat.h

	 change: edit tools/perf/builtin-kvm.c

  	 Revision  by acme: (perf tools kvm: Use &quot;cycles&quot; to sample guest for &quot;kvm top&quot; on Intel)

	 change: edit tools/perf/builtin-kvm.c

  	 Revision  by acme: (perf map: Constify objdump offset/address conversion APIs)

	 change: edit tools/perf/util/map.c

	 change: edit tools/perf/util/map.h

  	 Revision  by acme: (perf capstone: Move capstone functionality into its own file)

	 change: edit tools/perf/util/Build

	 change: edit tools/perf/util/disasm.c

	 change: edit tools/perf/builtin-script.c

	 change: add tools/perf/util/capstone.c

	 change: add tools/perf/util/capstone.h

	 change: edit tools/perf/util/print_insn.c

  	 Revision  by acme: (perf llvm: Move llvm functionality into its own file)

	 change: edit tools/perf/util/srcline.c

	 change: edit tools/perf/util/disasm.h

	 change: edit tools/perf/util/disasm.c

	 change: edit tools/perf/util/srcline.h

	 change: add tools/perf/util/llvm.c

	 change: add tools/perf/util/llvm.h

	 change: edit tools/perf/util/Build

  	 Revision  by acme: (perf libbfd: Move libbfd functionality to its own file)

	 change: add tools/perf/util/libbfd.c

	 change: edit tools/perf/util/srcline.h

	 change: edit tools/perf/util/srcline.c

	 change: edit tools/perf/util/symbol.c

	 change: edit tools/perf/util/Build

	 change: edit tools/perf/util/symbol-elf.c

	 change: edit tools/perf/Makefile.config

	 change: edit tools/perf/util/disasm.c

	 change: delete tools/perf/util/disasm_bpf.h

	 change: delete tools/perf/util/disasm_bpf.c

	 change: add tools/perf/util/libbfd.h

  	 Revision  by acme: (perf capstone: Remove open_capstone_handle)

	 change: edit tools/perf/util/capstone.c

  	 Revision  by deller: (Documentation: fb: Split toctree)

	 change: edit Documentation/fb/index.rst

  	 Revision  by deller: (Documentation: fb: ep93xx: Demote section headings)

	 change: edit Documentation/fb/ep93xx-fb.rst

  	 Revision  by deller: (Documentation: fb: Retitle driver docs)

	 change: edit Documentation/fb/sa1100fb.rst

	 change: edit Documentation/fb/vesafb.rst

	 change: edit Documentation/fb/pvr2fb.rst

	 change: edit Documentation/fb/lxfb.rst

	 change: edit Documentation/fb/sisfb.rst

	 change: edit Documentation/fb/tgafb.rst

	 change: edit Documentation/fb/udlfb.rst

	 change: edit Documentation/fb/efifb.rst

	 change: edit Documentation/fb/sm712fb.rst

	 change: edit Documentation/fb/gxfb.rst

	 change: edit Documentation/fb/matroxfb.rst

	 change: edit Documentation/fb/aty128fb.rst

  	 Revision  by deller: (fbdev: radeonfb: Remove stale product link in Kconfig)

	 change: edit drivers/video/fbdev/Kconfig

  	 Revision  by deller: (fbdev: Make drivers depend on LCD_CLASS_DEVICE)

	 change: edit drivers/video/fbdev/Kconfig

  	 Revision  by ast: (selftests/bpf: Add tests for rejection of ALU ops with negative offsets)

	 change: edit tools/testing/selftests/bpf/progs/verifier_value_illegal_alu.c

  	 Revision  by wei.liu: (fbdev/hyperv_fb: deprecate this in favor of Hyper-V DRM driver)

	 change: edit drivers/video/fbdev/Kconfig

	 change: edit drivers/video/fbdev/hyperv_fb.c

  	 Revision  by wei.liu: (MAINTAINERS: Mark hyperv_fb driver Obsolete)

	 change: edit MAINTAINERS

  	 Revision  by wei.liu: (hyperv: Remove the spurious null directive line)

	 change: edit include/hyperv/hvgdk_mini.h

  	 Revision  by axboe: (loop: fix backing file reference leak on validation error)

	 change: edit drivers/block/loop.c

  	 Revision  by axboe: (block: Update a comment of disk statistics)

	 change: edit include/linux/part_stat.h

  	 Revision  by ast: (libbpf: Fix missing #pragma in libbpf_utils.c)

	 change: edit tools/lib/bpf/libbpf_utils.c

  	 Revision  by jaegeuk: (f2fs: add missing dput() when printing the donation list)

	 change: edit fs/f2fs/sysfs.c

  	 Revision  by lucas.demarchi: (drm/xe/tests: Fix build break on clang 16.0.6)

	 change: edit drivers/gpu/drm/xe/tests/xe_pci.c

  	 Revision  by lucas.demarchi: (drm/xe/configfs: Fix engine class parsing)

	 change: edit drivers/gpu/drm/xe/xe_configfs.c

  	 Revision  by lucas.demarchi: (drm/xe/configfs: Improve doc for ctx_restore* attributes)

	 change: edit drivers/gpu/drm/xe/xe_configfs.c

  	 Revision  by lucas.demarchi: (drm/xe/vf: Rename sriov_update_device_info)

	 change: edit drivers/gpu/drm/xe/xe_device.c

  	 Revision  by lucas.demarchi: (drm/xe/vf: Don&#039;t claim support for firmware late-bind if VF)

	 change: edit drivers/gpu/drm/xe/xe_device.c

  	 Revision  by lucas.demarchi: (drm/xe/bo: Fix an idle assertion for local bos)

	 change: edit drivers/gpu/drm/xe/xe_bo.c

  	 Revision  by lucas.demarchi: (drm/xe/xe_late_bind_fw: Fix missing initialization of variable offset)

	 change: edit drivers/gpu/drm/xe/xe_late_bind_fw.c

  	 Revision  by lucas.demarchi: (drm/gpusvm, drm/xe: Fix userptr to not allow device private pages)

	 change: edit drivers/gpu/drm/drm_gpusvm.c

	 change: edit include/drm/drm_gpusvm.h

	 change: edit drivers/gpu/drm/xe/xe_svm.c

	 change: edit drivers/gpu/drm/xe/xe_userptr.c

	 change: edit drivers/gpu/drm/xe/xe_svm.h

	 change: edit drivers/gpu/drm/xe/xe_vm.c

  	 Revision  by lucas.demarchi: (drm/xe/xe_late_bind_fw: Initialize uval variable in xe_late_bind_fw_num_fans())

	 change: edit drivers/gpu/drm/xe/xe_late_bind_fw.c

  	 Revision  by m.szyprowski: (kmsan: fix kmsan_handle_dma() to avoid false positives)

	 change: edit mm/kmsan/hooks.c

  	 Revision  by m.szyprowski: (dma-mapping: fix direction in dma_alloc direction traces)

	 change: edit include/trace/events/dma.h

  	 Revision  by vbabka: (slab: Add allow_spin check to eliminate kmemleak warnings)

	 change: edit mm/slub.c

  	 Revision  by broonie: (ASoC: SOF: sof-audio: add dev_dbg_ratelimited wrapper)

	 change: edit sound/soc/sof/sof-audio.h

  	 Revision  by broonie: (ASoC: SOF: ipc4-pcm: do not report invalid delay values)

	 change: edit sound/soc/sof/ipc4-pcm.c

  	 Revision  by broonie: (ASoC: SOF: Intel: Read the LLP via the associated Link DMA channel)

	 change: edit sound/soc/sof/intel/hda-stream.c

  	 Revision  by zohar: (integrity: Select CRYPTO from INTEGRITY_ASYMMETRIC_KEYS)

	 change: edit security/integrity/Kconfig

  	 Revision  by zohar: (lib/digsig: Use SHA-1 library instead of crypto_shash)

	 change: edit lib/digsig.c

	 change: edit lib/Kconfig

  	 Revision  by zohar: (ima: don&#039;t clear IMA_DIGSIG flag when setting or removing non-IMA xattr)

	 change: edit security/integrity/ima/ima_appraise.c

  	 Revision  by axboe: (io_uring: update liburing git URL)

	 change: edit io_uring/io_uring.c

  	 Revision  by will: (arm64: mte: Do not flag the zero page as PG_mte_tagged)

	 change: edit arch/arm64/kernel/cpufeature.c

	 change: edit arch/arm64/kernel/mte.c

  	 Revision  by rostedt: (tracing: Fix lock imbalance in s_start() memory allocation failure path)

	 change: edit kernel/trace/trace_events.c

  	 Revision  by kuba: (net: usb: lan78xx: Fix lost EEPROM read timeout error(-ETIMEDOUT) in lan78xx_read_raw_eeprom)

	 change: edit drivers/net/usb/lan78xx.c

  	 Revision  by kuba: (net/mlx4: prevent potential use after free in mlx4_en_do_uc_filter())

	 change: edit drivers/net/ethernet/mellanox/mlx4/en_netdev.c

  	 Revision  by kuba: (net: psp: don&#039;t assume reply skbs will have a socket)

	 change: edit net/ipv6/tcp_ipv6.c

	 change: edit net/ipv4/ip_output.c

	 change: edit net/psp/psp_sock.c

	 change: edit include/net/psp/functions.h

  	 Revision  by kuba: (net: doc: Fix typos in docs)

	 change: edit include/linux/phy.h

	 change: edit net/tipc/topsrv.c

	 change: edit net/tipc/crypto.c

  	 Revision  by acme: (perf namespaces: Avoid get_current_dir_name dependency)

	 change: delete tools/perf/util/get_current_dir_name.c

	 change: edit tools/perf/Makefile.config

	 change: edit tools/perf/util/namespaces.c

	 change: edit tools/perf/util/Build

	 change: delete tools/perf/util/get_current_dir_name.h

  	 Revision  by rafael.j.wysocki: (PM: runtime: Introduce one more usage counter guard)

	 change: edit include/linux/pm_runtime.h

  	 Revision  by rafael.j.wysocki: (PM: runtime: Fix error checking for kunit_device_register())

	 change: edit drivers/base/power/runtime-test.c

  	 Revision  by lucas.demarchi: (drm/xe/uapi: loosen used tracking restriction)

	 change: edit drivers/gpu/drm/xe/xe_query.c

  	 Revision  by lucas.demarchi: (drm/xe/hw_engine_group: Fix double write lock release in error path)

	 change: edit drivers/gpu/drm/xe/xe_hw_engine_group.c

  	 Revision  by lucas.demarchi: (drm/xe/i2c: Don&#039;t rely on d3cold.allowed flag in system PM path)

	 change: edit drivers/gpu/drm/xe/xe_pm.c

  	 Revision  by rafael.j.wysocki: (tools: lib: thermal: use pkg-config to locate libnl3)

	 change: edit tools/lib/thermal/Makefile

  	 Revision  by rafael.j.wysocki: (tools: lib: thermal: don&#039;t preserve owner in install)

	 change: edit tools/lib/thermal/Makefile

  	 Revision  by rafael.j.wysocki: (tools: lib: thermal: expose thermal_exit symbols)

	 change: edit tools/lib/thermal/libthermal.map

  	 Revision  by acme: (tools build: Remove get_current_dir_name feature check)

	 change: delete tools/build/feature/test-get_current_dir_name.c

	 change: edit tools/build/Makefile.feature

	 change: edit tools/build/feature/Makefile

	 change: edit tools/build/feature/test-all.c

  	 Revision  by acme: (perf stat: Move create_perf_stat_counter() to builtin-stat.c)

	 change: edit tools/perf/util/stat.c

	 change: edit tools/perf/builtin-stat.c

	 change: edit tools/perf/util/stat.h

  	 Revision  by acme: (perf stat: Refactor retry/skip/fatal error handling)

	 change: edit tools/perf/util/evsel.c

	 change: edit tools/perf/builtin-record.c

	 change: edit tools/perf/builtin-stat.c

	 change: edit tools/perf/util/evsel.h

  	 Revision  by acme: (perf annotate: Rename TSR_KIND_POINTER to TSR_KIND_PERCPU_POINTER)

	 change: edit tools/perf/arch/x86/annotate/instructions.c

	 change: edit tools/perf/util/annotate-data.c

	 change: edit tools/perf/util/annotate-data.h

  	 Revision  by acme: (tools build: Remove feature-libslang-include-subdir)

	 change: edit tools/build/feature/Makefile

	 change: delete tools/build/feature/test-libslang-include-subdir.c

	 change: edit tools/perf/ui/libslang.h

	 change: edit tools/perf/Makefile.config

  	 Revision  by acme: (perf build: Move libopcode disasm tests to BUILD_NONDISTRO)

	 change: edit tools/perf/Makefile.config

  	 Revision  by acme: (perf bpf-event: Use libbpf version rather than feature check)

	 change: edit tools/perf/builtin-check.c

	 change: edit tools/perf/Makefile.config

	 change: edit tools/perf/util/bpf-event.c

	 change: edit tools/perf/util/bpf-utils.h

  	 Revision  by acme: (tools build: Remove libbpf-strings feature test)

	 change: edit tools/build/feature/Makefile

	 change: edit tools/build/Makefile.feature

	 change: delete tools/build/feature/test-libbpf-strings.c

  	 Revision  by acme: (perf record: Add ratio-to-prev term)

	 change: edit tools/perf/util/evsel.c

	 change: edit tools/perf/arch/x86/util/evsel.c

	 change: edit tools/perf/util/parse-events.c

	 change: edit tools/perf/Documentation/perf-list.txt

	 change: edit tools/perf/util/pmu.c

	 change: add tools/perf/Documentation/intel-acr.txt

	 change: edit tools/perf/util/parse-events.l

	 change: edit tools/perf/util/parse-events.h

	 change: edit tools/perf/util/evsel_config.h

	 change: edit tools/perf/util/evsel.h

  	 Revision  by acme: (perf record: Add auto counter reload parse and regression tests)

	 change: edit tools/perf/tests/parse-events.c

	 change: edit tools/perf/tests/shell/record.sh

  	 Revision  by rafael.j.wysocki: (docs/zh_TW: Fix malformed table)

	 change: edit Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst

  	 Revision  by rafael.j.wysocki: (docs/zh_CN: Fix malformed table)

	 change: edit Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst

  	 Revision  by acme: (perf parse-events: Fix parsing of &gt;30kb event strings)

	 change: edit tools/perf/util/parse-events.l

  	 Revision  by akpm: (drivers/base/memory: add node id parameter to add_memory_block())

	 change: edit drivers/base/memory.c

  	 Revision  by akpm: (mm/memory_hotplug: activate node before adding new memory blocks)

	 change: edit mm/memory_hotplug.c

	 change: edit drivers/base/memory.c

	 change: edit include/linux/memory.h

  	 Revision  by akpm: (drivers/base: move memory_block_add_nid() into the caller)

	 change: edit drivers/base/memory.c

	 change: edit drivers/base/node.c

	 change: edit include/linux/memory.h

  	 Revision  by akpm: (mm: clean up is_guard_pte_marker())

	 change: edit mm/madvise.c

  	 Revision  by akpm: (Documentation/mm: drop pxx_mkdevmap() descriptions from page table helpers)

	 change: edit Documentation/mm/arch_pgtable_helpers.rst

  	 Revision  by akpm: (mm/ksm: cleanup mm_slot_entry() invocation)

	 change: edit mm/ksm.c

  	 Revision  by akpm: (mm/khugepaged: use KMEM_CACHE())

	 change: edit mm/khugepaged.c

  	 Revision  by deller: (fbdev: Add bounds checking in bit_putcs to fix vmalloc-out-of-bounds)

	 change: edit drivers/video/fbdev/core/bitblit.c

  	 Revision  by andi.shyti: (i2c: rtl9300: Implement I2C block read and write)

	 change: edit drivers/i2c/busses/i2c-rtl9300.c

  	 Revision  by andi.shyti: (i2c: rtl9300: use regmap fields and API for registers)

	 change: edit drivers/i2c/busses/i2c-rtl9300.c

  	 Revision  by andi.shyti: (dt-bindings: i2c: realtek,rtl9301-i2c: fix wording and typos)

	 change: edit Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml

  	 Revision  by andi.shyti: (i2c: rtl9300: rename internal sda_pin to sda_num)

	 change: edit drivers/i2c/busses/i2c-rtl9300.c

  	 Revision  by andi.shyti: (i2c: rtl9300: move setting SCL frequency to config_io)

	 change: edit drivers/i2c/busses/i2c-rtl9300.c

  	 Revision  by andi.shyti: (i2c: rtl9300: do not set read mode on every transfer)

	 change: edit drivers/i2c/busses/i2c-rtl9300.c

  	 Revision  by andi.shyti: (i2c: rtl9300: separate xfer configuration and execution)

	 change: edit drivers/i2c/busses/i2c-rtl9300.c

  	 Revision  by andi.shyti: (i2c: rtl9300: use scoped guard instead of explicit lock/unlock)

	 change: edit drivers/i2c/busses/i2c-rtl9300.c

  	 Revision  by andi.shyti: (dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support)

	 change: edit Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml

  	 Revision  by andi.shyti: (i2c: rtl9300: add support for RTL9310 I2C controller)

	 change: edit drivers/i2c/busses/i2c-rtl9300.c

  	 Revision  by tiwai: (ALSA: hda/realtek: Add quirk for ASUS ROG Zephyrus Duo)

	 change: edit sound/hda/codecs/realtek/alc269.c

  	 Revision  by tiwai: (ALSA: emu10k1: Fix typo in docs)

	 change: edit Documentation/sound/cards/emu-mixer.rst

  	 Revision  by jarkko: (KEYS: encrypted: Use SHA-256 library instead of crypto_shash)

	 change: edit security/keys/encrypted-keys/encrypted.c

	 change: edit security/keys/Kconfig

  	 Revision  by jarkko: (security: keys: use menuconfig for KEYS symbol)

	 change: edit security/keys/Kconfig

  	 Revision  by ast: (bpf: Finish constification of 1st parameter of bpf_d_path())

	 change: edit scripts/bpf_doc.py

	 change: edit tools/testing/selftests/bpf/progs/verifier_vfs_accept.c

	 change: edit include/uapi/linux/bpf.h

	 change: edit tools/include/uapi/linux/bpf.h

  	 Revision  by hca: (s390/pci: Expose firmware provided UID Checking state in sysfs)

	 change: edit arch/s390/pci/pci_sysfs.c

	 change: edit arch/s390/include/asm/pci.h

	 change: edit arch/s390/pci/pci.c

  	 Revision  by hca: (s390/cio: Update purge function to unregister the unused subchannels)

	 change: edit drivers/s390/cio/device.c

  	 Revision  by hca: (s390/pai_crypto: Consolidate PAI crypto allocation and cleanup paths)

	 change: edit arch/s390/kernel/perf_pai_crypto.c

  	 Revision  by wsa+renesas: (i2c: rename wait_for_completion callback to wait_for_completion_cb)

	 change: edit drivers/i2c/algos/i2c-algo-pca.c

	 change: edit drivers/i2c/busses/i2c-pca-isa.c

	 change: edit drivers/i2c/busses/i2c-pca-platform.c

	 change: edit include/linux/i2c-algo-pca.h

  	 Revision  by wsa+renesas: (i2c: mt65xx: convert set_speed function to void)

	 change: edit drivers/i2c/busses/i2c-mt65xx.c

  	 Revision  by chenhuacai: (LoongArch: Update Loongson-3 default config file)

	 change: edit arch/loongarch/configs/loongson3_defconfig

  	 Revision  by alexandre.belloni: (dt-bindings: rtc: Convert apm,xgene-rtc to DT schema)

	 change: add Documentation/devicetree/bindings/rtc/apm,xgene-rtc.yaml

	 change: delete Documentation/devicetree/bindings/rtc/xgene-rtc.txt

  	 Revision  by alexandre.belloni: (rtc: optee: fix error code in probe())

	 change: edit drivers/rtc/rtc-optee.c

  	 Revision  by alexandre.belloni: (rtc: optee: Fix error code in optee_rtc_read_alarm())

	 change: edit drivers/rtc/rtc-optee.c

  	 Revision  by alexandre.belloni: (rtc: optee: make optee_rtc_pm_ops static)

	 change: edit drivers/rtc/rtc-optee.c

  	 Revision  by alexandre.belloni: (rtc: Kconfig: move symbols to proper section)

	 change: edit drivers/rtc/Kconfig

  	 Revision  by alexandre.belloni: (rtc: sd2405al: Add I2C address.)

	 change: edit drivers/rtc/rtc-sd2405al.c

  	 Revision  by alexandre.belloni: (rtc: amlogic-a4: Optimize global variables)

	 change: edit drivers/rtc/rtc-amlogic-a4.c

  	 Revision  by alexandre.belloni: (rtc: zynqmp: Restore alarm functionality after kexec transition)

	 change: edit drivers/rtc/rtc-zynqmp.c

  	 Revision  by alexandre.belloni: (rtc: pcf2127: fix watchdog interrupt mask on pcf2131)

	 change: edit drivers/rtc/rtc-pcf2127.c

  	 Revision  by herbert: (Revert &quot;crypto: testmgr - desupport SHA-1 for FIPS 140&quot;)

	 change: edit crypto/testmgr.c

  	 Revision  by herbert: (crypto: rng - Ensure set_ent is always present)

	 change: edit crypto/rng.c

  	 Revision  by vbabka: (slab: Fix using this_cpu_ptr() in preemptible context)

	 change: edit mm/slub.c

  	 Revision  by zack.rusin: (drm/vmwgfx: Fix a null-ptr access in the cursor snooper)

	 change: edit drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c

  	 Revision  by zack.rusin: (drm/vmwgfx: Fix Use-after-free in validation)

	 change: edit drivers/gpu/drm/vmwgfx/vmwgfx_validation.c

  	 Revision  by zack.rusin: (drm/vmwgfx: Fix copy-paste typo in validation)

	 change: edit drivers/gpu/drm/vmwgfx/vmwgfx_validation.c

  	 Revision  by andrii: (libbpf: Fix undefined behavior in {get,put}_unaligned_be32())

	 change: edit tools/lib/bpf/libbpf_utils.c

  	 Revision  by alex.williamson: (mm: introduce num_pages_contiguous())

	 change: edit include/linux/mm.h

	 change: edit include/linux/mm_inline.h

  	 Revision  by alex.williamson: (vfio/type1: optimize vfio_pin_pages_remote())

	 change: edit drivers/vfio/vfio_iommu_type1.c

  	 Revision  by alex.williamson: (vfio/type1: batch vfio_find_vpfn() in function vfio_unpin_pages_remote())

	 change: edit drivers/vfio/vfio_iommu_type1.c

  	 Revision  by alex.williamson: (vfio/type1: introduce a new member has_rsvd for struct vfio_dma)

	 change: edit drivers/vfio/vfio_iommu_type1.c

  	 Revision  by alex.williamson: (vfio/type1: optimize vfio_unpin_pages_remote())

	 change: edit drivers/vfio/vfio_iommu_type1.c

  	 Revision  by alex.williamson: (vfio: Dump migration features under debugfs)

	 change: edit Documentation/ABI/testing/debugfs-vfio

	 change: edit drivers/vfio/debugfs.c

  	 Revision  by kuba: (net/sctp: fix a null dereference in sctp_disposition sctp_sf_do_5_1D_ce())

	 change: edit net/sctp/sm_statefuns.c

  	 Revision  by kuba: (net: wwan: t7xx: add support for HP DRMR-H01)

	 change: edit drivers/net/wwan/t7xx/t7xx_pci.c

  	 Revision  by kuba: (tcp: Don&#039;t call reqsk_fastopen_remove() in tcp_conn_request().)

	 change: edit net/ipv4/tcp_input.c

  	 Revision  by kuba: (net: mscc: ocelot: Fix use-after-free caused by cyclic delayed work)

	 change: edit drivers/net/ethernet/mscc/ocelot_stats.c

  	 Revision  by kuba: (selftest: net: ovpn: Fix uninit return values)

	 change: edit tools/testing/selftests/net/ovpn/ovpn-cli.c

  	 Revision  by kuba: (ice: ice_adapter: release xa entry on adapter allocation failure)

	 change: edit drivers/net/ethernet/intel/ice/ice_adapter.c

  	 Revision  by kuba: (net: fsl_pq_mdio: Fix device node reference leak in fsl_pq_mdio_probe)

	 change: edit drivers/net/ethernet/freescale/fsl_pq_mdio.c

  	 Revision  by acme: (perf check: Add libLLVM feature)

	 change: edit tools/perf/builtin-check.c

	 change: edit tools/perf/Documentation/perf-check.txt

  	 Revision  by nathan: (kbuild: uapi: Strip comments before size type check)

	 change: edit usr/include/headers_check.pl

  	 Revision  by kuba: (page_pool: Fix PP_MAGIC_MASK to avoid crashing on some 32-bit arches)

	 change: edit include/linux/mm.h

	 change: edit net/core/page_pool.c

  	 Revision  by acme: (perf llvm: Reduce LLVM initialization)

	 change: edit tools/perf/util/llvm.c

  	 Revision  by acme: (perf dso: Move read_symbol() from llvm/capstone to dso)

	 change: edit tools/perf/util/dso.h

	 change: edit tools/perf/util/llvm.c

	 change: edit tools/perf/util/capstone.c

	 change: edit tools/perf/util/dso.c

  	 Revision  by acme: (perf dso: Support BPF programs in dso__read_symbol())

	 change: edit tools/perf/util/libbfd.c

	 change: edit tools/perf/util/dso.c

	 change: edit tools/perf/util/disasm.c

	 change: edit tools/perf/util/libbfd.h

  	 Revision  by acme: (perf dso: Clean up read_symbol() error handling)

	 change: edit tools/perf/util/dso.c

	 change: edit tools/perf/util/capstone.c

	 change: edit tools/perf/util/llvm.c

  	 Revision  by acme: (perf disasm: Make ins__scnprintf() and ins__is_nop() static)

	 change: edit tools/perf/util/disasm.c

	 change: edit tools/perf/util/disasm.h

  	 Revision  by acme: (perf srcline: Fallback between addr2line implementations)

	 change: edit tools/perf/util/llvm.h

	 change: add tools/perf/util/addr2line.h

	 change: edit tools/perf/util/llvm.c

	 change: edit tools/perf/util/srcline.h

	 change: edit tools/perf/util/srcline.c

	 change: edit tools/perf/util/Build

	 change: add tools/perf/util/addr2line.c

	 change: edit tools/perf/util/config.c

  	 Revision  by acme: (perf disasm: Remove unused evsel from &#039;struct annotate_args&#039;)

	 change: edit tools/perf/util/annotate.c

	 change: edit tools/perf/util/disasm.h

  	 Revision  by acme: (tools build: Align warning options with perf)

	 change: edit tools/build/feature/Makefile

  	 Revision  by acme: (perf python: split Clang options when invoking Popen)

	 change: edit tools/perf/util/setup.py

  	 Revision  by acme: (perf build: Correct CROSS_ARCH for clang)

	 change: edit tools/build/feature/Makefile

	 change: edit tools/perf/Makefile.perf

  	 Revision  by acme: (perf build: Disable thread safety analysis for perl header)

	 change: edit tools/perf/util/scripting-engines/Build

	 change: edit tools/perf/scripts/perl/Perf-Trace-Util/Build

  	 Revision  by acme: (perf test coresight: Dismiss clang warning for memcpy thread)

	 change: edit tools/perf/tests/shell/coresight/memcpy_thread/memcpy_thread.c

  	 Revision  by acme: (perf test coresight: Dismiss clang warning for thread loop)

	 change: edit tools/perf/tests/shell/coresight/thread_loop/thread_loop.c

  	 Revision  by acme: (perf test coresight: Dismiss clang warning for unroll loop thread)

	 change: edit tools/perf/tests/shell/coresight/unroll_loop_thread/unroll_loop_thread.c

  	 Revision  by acme: (perf build: Support build with clang)

	 change: edit tools/perf/Makefile.config

  	 Revision  by acme: (perf docs: Document building with Clang)

	 change: edit tools/perf/Documentation/Build.txt

	 change: edit tools/perf/Documentation/android.txt

  	 Revision  by acme: (perf tests: Don&#039;t retest sections in &quot;Object code reading&quot;)

	 change: edit tools/perf/tests/code-reading.c

  	 Revision  by kuba: (tcp: take care of zero tp-&gt;window_clamp in tcp_set_rcvlowat())

	 change: edit net/ipv4/tcp.c

  	 Revision  by kuba: (selftests: net: sort configs)

	 change: edit tools/testing/selftests/net/netfilter/config

	 change: edit tools/testing/selftests/net/mptcp/config

	 change: edit tools/testing/selftests/net/config

	 change: edit tools/testing/selftests/net/tcp_ao/config

	 change: edit tools/testing/selftests/net/ovpn/config

	 change: edit tools/testing/selftests/net/hsr/config

	 change: edit tools/testing/selftests/net/af_unix/config

	 change: edit tools/testing/selftests/drivers/net/bonding/config

	 change: edit tools/testing/selftests/net/forwarding/config

	 change: edit tools/testing/selftests/drivers/net/config

	 change: edit tools/testing/selftests/net/packetdrill/config

  	 Revision  by kuba: (selftests: net: unify the Makefile formats)

	 change: edit tools/testing/selftests/net/rds/Makefile

	 change: edit tools/testing/selftests/drivers/net/Makefile

	 change: edit tools/testing/selftests/net/ovpn/Makefile

	 change: edit tools/testing/selftests/net/hsr/Makefile

	 change: edit tools/testing/selftests/drivers/net/dsa/Makefile

	 change: edit tools/testing/selftests/net/forwarding/Makefile

	 change: edit tools/testing/selftests/net/mptcp/Makefile

	 change: edit tools/testing/selftests/net/Makefile

	 change: edit tools/testing/selftests/net/af_unix/Makefile

	 change: edit tools/testing/selftests/net/packetdrill/Makefile

	 change: edit tools/testing/selftests/drivers/net/virtio_net/Makefile

	 change: edit tools/testing/selftests/net/lib/Makefile

	 change: edit tools/testing/selftests/net/netfilter/Makefile

	 change: edit tools/testing/selftests/drivers/net/bonding/Makefile

	 change: edit tools/testing/selftests/drivers/net/hw/Makefile

	 change: edit tools/testing/selftests/drivers/net/team/Makefile

	 change: edit tools/testing/selftests/drivers/net/netdevsim/Makefile

  	 Revision  by acme: (perf tools: Fix arm64 libjvmti build by generating unistd_64.h)

	 change: edit tools/perf/Makefile.perf

  	 Revision  by stfrench: (smb: client: Reduce the scopes for a few variables in two functions)

	 change: edit fs/smb/client/dir.c

  	 Revision  by stfrench: (smb: client: Use common code in cifs_lookup())

	 change: edit fs/smb/client/dir.c

  	 Revision  by jassisinghbrar: (mailbox: arm_mhuv3: Remove no_free_ptr() to maintain the original form of the pointer)

	 change: edit drivers/mailbox/arm_mhuv3.c

  	 Revision  by jassisinghbrar: (MAINTAINERS: Change mailbox-altera maintainer)

	 change: edit MAINTAINERS

  	 Revision  by jassisinghbrar: (dt-bindings: mailbox: qcom: Document Glymur CPUCP mailbox controller binding)

	 change: edit Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml

  	 Revision  by jassisinghbrar: (dt-bindings: mailbox: mediatek,gce-mailbox: Make clock-names optional)

	 change: edit Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml

  	 Revision  by jassisinghbrar: (mailbox: remove unneeded &#039;fast_io&#039; parameter in regmap_config)

	 change: edit drivers/mailbox/qcom-apcs-ipc-mailbox.c

  	 Revision  by jassisinghbrar: (mailbox: zynqmp-ipi: Remove redundant mbox_controller_unregister() call)

	 change: edit drivers/mailbox/zynqmp-ipi-mailbox.c

  	 Revision  by jassisinghbrar: (mailbox: zynqmp-ipi: Remove dev.parent check in zynqmp_ipi_free_mboxes)

	 change: edit drivers/mailbox/zynqmp-ipi-mailbox.c

  	 Revision  by jassisinghbrar: (mailbox: zynqmp-ipi: Fix out-of-bounds access in mailbox cleanup loop)

	 change: edit drivers/mailbox/zynqmp-ipi-mailbox.c

  	 Revision  by jassisinghbrar: (mailbox: zynqmp-ipi: Fix SGI cleanup on unbind)

	 change: edit drivers/mailbox/zynqmp-ipi-mailbox.c

  	 Revision  by jassisinghbrar: (dt-bindings: mailbox: Add MT8196 GPUEB Mailbox)

	 change: add Documentation/devicetree/bindings/mailbox/mediatek,mt8196-gpueb-mbox.yaml

  	 Revision  by jassisinghbrar: (mailbox: add MediaTek GPUEB IPI mailbox)

	 change: edit drivers/mailbox/Kconfig

	 change: add drivers/mailbox/mtk-gpueb-mailbox.c

	 change: edit drivers/mailbox/Makefile

  	 Revision  by ast: (bpf: Fix metadata_dst leak __bpf_redirect_neigh_v{4,6})

	 change: edit net/core/filter.c

  	 Revision  by tglx: (irqchip/aspeed-scu-ic: Fix an IS_ERR() vs NULL check)

	 change: edit drivers/irqchip/irq-aspeed-scu-ic.c

  	 Revision  by tglx: (irqchip/sifive-plic: Avoid interrupt ID 0 handling during suspend/resume)

	 change: edit drivers/irqchip/irq-sifive-plic.c

  	 Revision  by pabeni: (net: mdio: mdio-i2c: Hold the i2c bus lock during smbus transactions)

	 change: edit drivers/net/mdio/mdio-i2c.c

  	 Revision  by pabeni: (net: sparx5/lan969x: fix flooding configuration on bridge join/leave)

	 change: edit drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c

	 change: edit drivers/net/ethernet/microchip/sparx5/sparx5_main.c

	 change: edit drivers/net/ethernet/microchip/sparx5/sparx5_vlan.c

  	 Revision  by pabeni: (selftests: drv-net: make linters happy with our imports)

	 change: edit tools/testing/selftests/drivers/net/hds.py

	 change: edit tools/testing/selftests/drivers/net/lib/py/__init__.py

  	 Revision  by pabeni: (net: usb: asix: hold PM usage ref to avoid PM/MDIO + RTNL deadlock)

	 change: edit drivers/net/usb/asix_devices.c

  	 Revision  by pabeni: (net/mlx5: Prevent tunnel mode conflicts between FDB and NIC IPsec tables)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/eswitch.h

  	 Revision  by pabeni: (net/mlx5e: Prevent tunnel reformat when tunnel mode not allowed)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.h

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c

  	 Revision  by pabeni: (net/mlx5e: Do not fail PSP init on missing caps)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp.c

  	 Revision  by tiwai: (ALSA: hda/tas2781: Enable init_profile_id for device initialization)

	 change: edit sound/hda/codecs/side-codecs/tas2781_hda_i2c.c

  	 Revision  by tiwai: (ALSA: usb: fpc: replace kmalloc_array followed by copy_from_user with memdup_array_user)

	 change: edit sound/usb/fcp.c

  	 Revision  by broonie: (ASoC: meson: aiu-encoder-i2s: fix bit clock polarity)

	 change: edit sound/soc/meson/aiu-encoder-i2s.c

  	 Revision  by broonie: (ASoC: rt722: add settings for rt722VB)

	 change: edit sound/soc/codecs/rt722-sdca.c

	 change: edit sound/soc/codecs/rt722-sdca.h

	 change: edit sound/soc/codecs/rt722-sdca-sdw.c

  	 Revision  by axboe: (io_uring/waitid: always prune wait queue entry in io_waitid_wait())

	 change: edit io_uring/waitid.c

  	 Revision  by axboe: (io_uring: use tab indentation for IORING_SEND_VECTORIZED comment)

	 change: edit include/uapi/linux/io_uring.h

  	 Revision  by axboe: (block: remove bio_iov_iter_get_pages)

	 change: edit block/blk-map.c

	 change: edit include/linux/bio.h

  	 Revision  by axboe: (block: rename bio_iov_iter_get_pages_aligned to bio_iov_iter_get_pages)

	 change: edit include/linux/bio.h

	 change: edit block/bio.c

	 change: edit include/linux/blkdev.h

	 change: edit block/blk-map.c

  	 Revision  by axboe: (iomap: open code bio_iov_iter_get_bdev_pages)

	 change: edit fs/iomap/direct-io.c

  	 Revision  by axboe: (block: move bio_iov_iter_get_bdev_pages to block/fops.c)

	 change: edit include/linux/blkdev.h

	 change: edit block/fops.c

  	 Revision  by deller: (parisc: Remove spurious if statement from raw_copy_from_user())

	 change: edit arch/parisc/lib/memcpy.c

  	 Revision  by deller: (parisc: don&#039;t reference obsolete termio struct for TC* constants)

	 change: edit arch/parisc/include/uapi/asm/ioctls.h

  	 Revision  by kees: (kconfig: Avoid prompting for transitional symbols)

	 change: edit scripts/kconfig/symbol.c

	 change: add scripts/kconfig/tests/transitional/expected_stdout

	 change: edit scripts/kconfig/tests/transitional/initial_config

	 change: edit scripts/kconfig/tests/transitional/__init__.py

	 change: edit scripts/kconfig/tests/transitional/expected_config

	 change: edit scripts/kconfig/tests/transitional/Kconfig

  	 Revision  by kees: (tools headers: kcfi: rename missed CONFIG_CFI_CLANG)

	 change: edit tools/include/linux/cfi_types.h

  	 Revision  by jassisinghbrar: (mailbox: mtk-cmdq: Remove pm_runtime APIs from cmdq_mbox_send_data())

	 change: edit drivers/mailbox/mtk-cmdq-mailbox.c

  	 Revision  by deller: (parisc: Report emulation faults via perf)

	 change: edit arch/parisc/kernel/traps.c

  	 Revision  by deller: (parisc: Report software alignment faults via perf)

	 change: edit arch/parisc/kernel/unaligned.c

  	 Revision  by stfrench: (smb: client: Return a status code only as a constant in cifs_spnego_key_instantiate())

	 change: edit fs/smb/client/cifs_spnego.c

  	 Revision  by stfrench: (smb: client: Improve unlocking of a mutex in cifs_get_swn_reg())

	 change: edit fs/smb/client/cifs_swn.c

  	 Revision  by nathan: (scripts/Makefile.extrawarn: Respect CONFIG_WERROR / W=e for hostprogs)

	 change: edit scripts/Makefile.extrawarn

  	 Revision  by nathan: (gen_init_cpio: Ignore fsync() returning EINVAL on pipes)

	 change: edit usr/gen_init_cpio.c

  	 Revision  by deller: (parisc: Add initial kernel-side perf_event support)

	 change: edit arch/parisc/kernel/Makefile

	 change: edit arch/parisc/include/asm/perf_event.h

	 change: add arch/parisc/include/uapi/asm/perf_regs.h

	 change: add arch/parisc/kernel/perf_event.c

	 change: add arch/parisc/kernel/perf_regs.c

	 change: edit arch/parisc/Kconfig

  	 Revision  by vbabka: (slub: Don&#039;t call lockdep_unregister_key() for immature kmem_cache.)

	 change: edit mm/slub.c

  	 Revision  by alexander.deucher: (drm/amdgpu: Add additional DCE6 SCL registers)

	 change: edit drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_sh_mask.h

	 change: edit drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h

  	 Revision  by alexander.deucher: (drm/amd/display: Add missing DCE6 SCL_HORZ_FILTER_INIT* SRIs)

	 change: edit drivers/gpu/drm/amd/display/dc/dce/dce_transform.h

  	 Revision  by alexander.deucher: (drm/amd/display: Properly clear SCL_*_FILTER_CONTROL on DCE6)

	 change: edit drivers/gpu/drm/amd/display/dc/dce/dce_transform.c

  	 Revision  by alexander.deucher: (drm/amd/display: Properly disable scaling on DCE6)

	 change: edit drivers/gpu/drm/amd/display/dc/dce/dce_transform.h

	 change: edit drivers/gpu/drm/amd/display/dc/dce/dce_transform.c

  	 Revision  by alexander.deucher: (drm/amd/display: Disable scaling on DCE6 for now)

	 change: edit drivers/gpu/drm/amd/display/dc/resource/dce60/dce60_resource.c

  	 Revision  by alexander.deucher: (drm/amdgpu: Fix for GPU reset being blocked by KIQ I/O.)

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

  	 Revision  by alexander.deucher: (drm/amdkfd: Fix kfd process ref leaking when userptr unmapping)

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c

  	 Revision  by alexander.deucher: (drm/amdkfd: Fix mmap write lock not release)

	 change: edit drivers/gpu/drm/amd/amdkfd/kfd_svm.c

  	 Revision  by alexander.deucher: (drm/amd: Check whether secure display TA loaded successfully)

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c

  	 Revision  by alexander.deucher: (drm/amd/amdgpu: Fix the mes version that support inv_tlbs)

	 change: edit drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c

  	 Revision  by alexander.deucher: (drm/amdgpu: Merge amdgpu_vm_set_pasid into amdgpu_vm_init)

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c

  	 Revision  by alexander.deucher: (drm/amd/pm: Avoid interface mismatch messaging)

	 change: edit drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c

	 change: edit drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c

	 change: edit drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h

  	 Revision  by alexander.deucher: (drm/amdkfd: Fix two comments in kfd_ioctl.h)

	 change: edit include/uapi/linux/kfd_ioctl.h

  	 Revision  by alexander.deucher: (drm/amdgpu: Check swus/ds for switch state save)

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

  	 Revision  by alexander.deucher: (drm/amdgpu: Fix general protection fault in amdgpu_vm_bo_reset_state_machine)

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

  	 Revision  by alexander.deucher: (drm/amd/pm: Disable VCN queue reset on SMU v13.0.6 due to regression)

	 change: edit drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c

  	 Revision  by alexander.deucher: (drm/amd/display: Fix unsafe uses of kernel mode FPU)

	 change: edit drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c

	 change: edit drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c

	 change: edit drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c

	 change: edit drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c

	 change: edit drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c

	 change: edit drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c

  	 Revision  by alexander.deucher: (drm/amdgpu: partially revert &quot;revert to old status lock handling v3&quot;)

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c

  	 Revision  by alexander.deucher: (drm/amdgpu: Report individual reset error)

	 change: edit drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

  	 Revision  by alexander.deucher: (drm/amd/display: Enable Dynamic DTBCLK Switch)

	 change: edit drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

  	 Revision  by alexander.deucher: (drm/amd/display: Incorrect Mirror Cositing)

	 change: edit drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c

  	 Revision  by stfrench: (smb: client: Use common code in cifs_do_create())

	 change: edit fs/smb/client/dir.c

  	 Revision  by stfrench: (smb: client: Return directly after a failed genlmsg_new() in cifs_swn_send_register_message())

	 change: edit fs/smb/client/cifs_swn.c

  	 Revision  by dakr: (drm/nouveau: fix bad ret code in nouveau_bo_move_prep)

	 change: edit drivers/gpu/drm/nouveau/nouveau_bo.c

  	 Revision  by akpm: (MAINTAINERS, .mailmap: update Umang&#039;s email address)

	 change: edit MAINTAINERS

	 change: edit .mailmap

  	 Revision  by akpm: (kho: check if kho is finalized in __kho_preserve_order())

	 change: edit kernel/kexec_handover.c

  	 Revision  by akpm: (kho: replace kho_preserve_phys() with kho_preserve_pages())

	 change: edit kernel/kexec_handover.c

	 change: edit include/linux/kexec_handover.h

	 change: edit mm/memblock.c

  	 Revision  by akpm: (kho: add support for preserving vmalloc allocations)

	 change: edit kernel/kexec_handover.c

	 change: edit include/linux/kexec_handover.h

  	 Revision  by akpm: (lib/test_kho: use kho_preserve_vmalloc instead of storing addresses in fdt)

	 change: edit lib/test_kho.c

  	 Revision  by akpm: (memcg: skip cgroup_file_notify if spinning is not allowed)

	 change: edit include/linux/memcontrol.h

	 change: edit mm/memcontrol.c

  	 Revision  by akpm: (mm/thp: fix MTE tag mismatch when replacing zero-filled subpages)

	 change: edit mm/migrate.c

	 change: edit mm/huge_memory.c

  	 Revision  by akpm: (mm/rmap: fix soft-dirty and uffd-wp bit loss when remapping zero-filled mTHP subpage to shared zeropage)

	 change: edit mm/migrate.c

  	 Revision  by akpm: (mm/damon/vaddr: do not repeat pte_offset_map_lock() until success)

	 change: edit mm/damon/vaddr.c

  	 Revision  by akpm: (mm/ksm: fix flag-dropping behavior in ksm_madvise)

	 change: edit include/linux/mm.h

	 change: edit rust/bindings/bindings_helper.h

  	 Revision  by akpm: (fsnotify: pass correct offset to fsnotify_mmap_perm())

	 change: edit mm/util.c

  	 Revision  by akpm: (mm: hugetlb: avoid soft lockup when mprotect to large memory area)

	 change: edit mm/hugetlb.c

  	 Revision  by kuba: (net/mlx5: fix pre-2.40 binutils assembler error)

	 change: edit drivers/net/ethernet/mellanox/mlx5/core/wc.c

  	 Revision  by kuba: (net: pse-pd: tps23881: Fix current measurement scaling)

	 change: edit drivers/net/pse-pd/tps23881.c

  	 Revision  by dmitry.torokhov: (Input: atmel_mxt_ts - allow reset GPIO to sleep)

	 change: edit drivers/input/touchscreen/atmel_mxt_ts.c

  	 Revision  by herbert: (crypto: skcipher - Fix reqsize handling)

	 change: edit crypto/skcipher.c

  	 Revision  by fw: (netfilter: nft_objref: validate objref and objrefmap expressions)

	 change: edit net/netfilter/nft_objref.c

  	 Revision  by fw: (bridge: br_vlan_fill_forward_path_pvid: use br_vlan_group_rcu())

	 change: edit net/bridge/br_vlan.c

  	 Revision  by fw: (selftests: netfilter: nft_fib.sh: fix spurious test failures)

	 change: edit tools/testing/selftests/net/netfilter/nft_fib.sh

  	 Revision  by fw: (selftests: netfilter: query conntrack state to check for port clash resolution)

	 change: edit tools/testing/selftests/net/netfilter/nf_nat_edemux.sh

  	 Revision  by agordeev: (s390/uv: Fix comment of uv_find_secret() function)

	 change: edit arch/s390/kernel/uv.c

  	 Revision  by axboe: (loop: remove redundant __GFP_NOWARN flag)

	 change: edit drivers/block/loop.c

  	 Revision  by axboe: (io_uring/zcrx: fix overshooting recv limit)

	 change: edit io_uring/zcrx.c

  	 Revision  by axboe: (io_uring/zcrx: increment fallback loop src offset)

	 change: edit io_uring/zcrx.c

  	 Revision  by rostedt: (tracing/osnoise: Replace kmalloc + copy_from_user with memdup_user_nul)

	 change: edit kernel/trace/trace_osnoise.c

  	 Revision  by rostedt: (tracing: Fix wakeup tracers on failure of acquiring calltime)

	 change: edit kernel/trace/trace_sched_wakeup.c

  	 Revision  by rostedt: (tracing: Fix irqoff tracers on failure of acquiring calltime)

	 change: edit kernel/trace/trace_irqsoff.c

  	 Revision  by idryomov: (libceph: Use HMAC-SHA256 library instead of crypto_shash)

	 change: edit include/linux/ceph/messenger.h

	 change: edit net/ceph/Kconfig

	 change: edit net/ceph/messenger_v2.c

  	 Revision  by idryomov: (ceph: make ceph_start_io_*() killable)

	 change: edit fs/ceph/file.c

	 change: edit fs/ceph/io.c

	 change: edit fs/ceph/io.h

  	 Revision  by idryomov: (ceph: add checking of wait_for_completion_killable() return value)

	 change: edit fs/ceph/locks.c

  	 Revision  by idryomov: (ceph: fix wrong sizeof argument issue in register_session())

	 change: edit fs/ceph/mds_client.c

  	 Revision  by idryomov: (ceph: fix overflowed constant issue in ceph_do_objects_copy())

	 change: edit fs/ceph/file.c

  	 Revision  by idryomov: (ceph: fix potential race condition in ceph_ioctl_lazyio())

	 change: edit fs/ceph/ioctl.c

  	 Revision  by idryomov: (ceph: refactor wake_up_bit() pattern of calling)

	 change: edit fs/ceph/dir.c

	 change: edit fs/ceph/file.c

  	 Revision  by idryomov: (ceph: fix potential race condition on operations with CEPH_I_ODIRECT flag)

	 change: edit fs/ceph/io.c

	 change: edit fs/ceph/super.h

  	 Revision  by idryomov: (libceph: make ceph_con_get_out_msg() return the message pointer)

	 change: edit net/ceph/messenger.c

	 change: edit net/ceph/messenger_v1.c

	 change: edit include/linux/ceph/messenger.h

  	 Revision  by idryomov: (libceph: pass the message pointer instead of loading con-&gt;out_msg)

	 change: edit net/ceph/messenger_v2.c

	 change: edit include/linux/ceph/messenger.h

	 change: edit net/ceph/messenger.c

	 change: edit net/ceph/messenger_v1.c

  	 Revision  by idryomov: (libceph: add empty check to ceph_con_get_out_msg())

	 change: edit net/ceph/messenger_v2.c

	 change: edit net/ceph/messenger.c

	 change: edit net/ceph/messenger_v1.c

  	 Revision  by idryomov: (ceph: fix potential NULL dereference issue in ceph_fill_trace())

	 change: edit fs/ceph/inode.c

  	 Revision  by idryomov: (ceph: cleanup in ceph_alloc_readdir_reply_buffer())

	 change: edit fs/ceph/mds_client.c

  	 Revision  by idryomov: (ceph: fix multifs mds auth caps issue)

	 change: edit fs/ceph/super.h

	 change: edit fs/ceph/mdsmap.c

	 change: edit fs/ceph/super.c

	 change: edit fs/ceph/mds_client.c

  	 Revision  by bhelgaas: (PCI: Fix regression in pci_bus_distribute_available_resources())

	 change: edit drivers/pci/setup-bus.c

  	 Revision  by idryomov: (ceph: add bug tracking system info to MAINTAINERS)

	 change: edit MAINTAINERS

  	 Revision  by rostedt: (ring buffer: Propagate __rb_map_vma return value to caller)

	 change: edit kernel/trace/ring_buffer.c

  	 Revision  by rostedt: (tracing: Have trace_marker use per-cpu data to read user space)

	 change: edit kernel/trace/trace.c

  	 Revision  by herbert: (crypto: essiv - Check ssize for decryption and in-place encryption)

	 change: edit crypto/essiv.c

  	 Revision  by pabeni: (eth: fbnic: fix missing programming of the default descriptor)

	 change: edit drivers/net/ethernet/meta/fbnic/fbnic_mac.c

  	 Revision  by pabeni: (eth: fbnic: fix accounting of XDP packets)

	 change: edit drivers/net/ethernet/meta/fbnic/fbnic_txrx.c

  	 Revision  by pabeni: (eth: fbnic: fix saving stats from XDP_TX rings on close)

	 change: edit drivers/net/ethernet/meta/fbnic/fbnic_txrx.c

	 change: edit drivers/net/ethernet/meta/fbnic/fbnic_txrx.h

	 change: edit drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c

  	 Revision  by pabeni: (selftests: drv-net: xdp: rename netnl to ethnl)

	 change: edit tools/testing/selftests/drivers/net/xdp.py

  	 Revision  by pabeni: (selftests: drv-net: xdp: add test for interface level qstats)

	 change: edit tools/testing/selftests/drivers/net/xdp.py

  	 Revision  by pabeni: (eth: fbnic: fix reporting of alloc_failed qstats)

	 change: edit drivers/net/ethernet/meta/fbnic/fbnic_netdev.c

	 change: edit drivers/net/ethernet/meta/fbnic/fbnic_netdev.h

	 change: edit drivers/net/ethernet/meta/fbnic/fbnic_txrx.c

	 change: edit drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c

	 change: edit drivers/net/ethernet/meta/fbnic/fbnic_txrx.h

  	 Revision  by pabeni: (selftests: drv-net: fix linter warnings in pp_alloc_fail)

	 change: edit tools/testing/selftests/drivers/net/hw/pp_alloc_fail.py

  	 Revision  by pabeni: (selftests: drv-net: pp_alloc_fail: lower traffic expectations)

	 change: edit tools/testing/selftests/drivers/net/hw/pp_alloc_fail.py

  	 Revision  by pabeni: (selftests: drv-net: pp_alloc_fail: add necessary optoins to config)

	 change: edit tools/testing/selftests/drivers/net/hw/config

  	 Revision  by pabeni: (net: airoha: Fix loopback mode configuration for GDM2 port)

	 change: edit drivers/net/ethernet/airoha/airoha_regs.h

	 change: edit drivers/net/ethernet/airoha/airoha_eth.c

  	 Revision  by bartosz.golaszewski: (gpio: usbio: Add ACPI device-id for MTL-CVF devices)

	 change: edit drivers/gpio/gpio-usbio.c

  	 Revision  by wsa+renesas: (dt-bindings: i2c: hisilicon,hix5hd2: convert to DT schema)

	 change: delete Documentation/devicetree/bindings/i2c/i2c-hix5hd2.txt

	 change: add Documentation/devicetree/bindings/i2c/hisilicon,hix5hd2-i2c.yaml

  	 Revision  by stfrench: (smb: client: Omit an if branch in smb2_find_smb_tcon())

	 change: edit fs/smb/client/smb2transport.c

  	 Revision  by stfrench: (smb: client: batch SRV_COPYCHUNK entries to cut round trips)

	 change: edit fs/smb/client/smb2pdu.h

	 change: edit fs/smb/client/trace.h

	 change: edit fs/smb/client/smb2ops.c

  	 Revision  by stfrench: (cifs: Fix copy_to_iter return value check)

	 change: edit fs/smb/client/smb2ops.c

  	 Revision  by stfrench: (smb: client: fix missing timestamp updates with O_TRUNC)

	 change: edit fs/smb/client/file.c

	 change: edit fs/smb/client/cifsglob.h

	 change: edit fs/smb/client/inode.c

  	 Revision  by stfrench: (smb: client: fix missing timestamp updates after ftruncate(2))

	 change: edit fs/smb/client/inode.c

  	 Revision  by stfrench: (smb: client: fix missing timestamp updates after utime(2))

	 change: edit fs/smb/client/smb2inode.c

  	 Revision  by stfrench: (smb: client: fix race with fallocate(2) and AIO+DIO)

	 change: edit fs/smb/client/inode.c

	 change: edit fs/smb/client/smb2ops.c

	 change: edit fs/smb/client/cifsfs.c

  	 Revision  by stfrench: (smb: client: remove redudant assignment in cifs_strict_fsync())

	 change: edit fs/smb/client/file.c

  	 Revision  by stfrench: (smb: client: remove cfids_invalidation_worker)

	 change: edit fs/smb/client/cached_dir.c

	 change: edit fs/smb/client/cached_dir.h

  	 Revision  by alexandre.belloni: (rtc: interface: Fix long-standing race when setting alarm)

	 change: edit drivers/rtc/interface.c

  	 Revision  by alexandre.belloni: (rtc: isl12022: Fix initial enable_irq/disable_irq balance)

	 change: edit drivers/rtc/rtc-isl12022.c

  	 Revision  by alexandre.belloni: (rtc: cpcap: Fix initial enable_irq/disable_irq balance)

	 change: edit drivers/rtc/rtc-cpcap.c

  	 Revision  by alexandre.belloni: (rtc: tps6586x: Fix initial enable_irq/disable_irq balance)

	 change: edit drivers/rtc/rtc-tps6586x.c

  	 Revision  by alexandre.belloni: (rtc: interface: Ensure alarm irq is enabled when UIE is enabled)

	 change: edit drivers/rtc/interface.c

  	 Revision  by deller: (parisc: Firmware: Fix returned path for PDC_MODULE_FIND on older machines)

	 change: edit arch/parisc/kernel/firmware.c

  	 Revision  by deller: (parisc: Fix iodc and device path return values on old machines)

	 change: edit arch/parisc/kernel/drivers.c

  	 Revision  by deller: (fbdev: Fix logic error in &quot;offb&quot; name match)

	 change: edit drivers/video/fbdev/core/fb_cmdline.c

  	 Revision  by stfrench: (cifs: Query EA $LXMOD in cifs_query_path_info() for WSL reparse points)

	 change: edit fs/smb/client/smb1ops.c

  	 Revision  by stfrench: (cifs: Allow fallback code in smb_set_file_info() also for directories)

	 change: edit fs/smb/client/smb1ops.c

  	 Revision  by stfrench: (cifs: Add fallback code path for cifs_mkdir_setinfo())

	 change: edit fs/smb/client/smb1ops.c

  	 Revision  by stfrench: (cifs: Add comments for DeletePending assignments in open functions)

	 change: edit fs/smb/client/smb2inode.c

	 change: edit fs/smb/client/smb2pdu.c

	 change: edit fs/smb/client/cifssmb.c

  	 Revision  by jarkko: (tpm: Disable TPM2_TCG_HMAC by default)

	 change: edit drivers/char/tpm/Kconfig

  	 Revision  by jarkko: (tpm: Compare HMAC values in constant time)

	 change: edit drivers/char/tpm/tpm2-sessions.c

	 change: edit drivers/char/tpm/Kconfig

  	 Revision  by jarkko: (tpm: Use HMAC-SHA256 library instead of open-coded HMAC)

	 change: edit drivers/char/tpm/tpm2-sessions.c

  	 Revision  by jarkko: (tpm_tis: Fix incorrect arguments in tpm_tis_probe_irq_single)

	 change: edit drivers/char/tpm/tpm_tis_core.c

  	 Revision  by jarkko: (tpm: use a map for tpm2_calc_ordinal_duration())

	 change: edit drivers/char/tpm/tpm-interface.c

	 change: edit drivers/char/tpm/tpm2-cmd.c

	 change: edit include/linux/tpm.h

	 change: edit drivers/char/tpm/tpm.h

  	 Revision  by jarkko: (tpm: Prevent local DOS via tpm/tpm0/ppi/*operations)

	 change: edit drivers/char/tpm/tpm_ppi.c

  	 Revision  by bartosz.golaszewski: (gpio: wcd934x: mark the GPIO controller as sleeping)

	 change: edit drivers/gpio/gpio-wcd934x.c

  	 Revision  by robh: (MAINTAINERS: Move DT patchwork to kernel.org)

	 change: edit MAINTAINERS

  	 Revision  by stfrench: (cifs: update internal version number)

	 change: edit fs/smb/client/cifsfs.h

  	 Revision  by ast: (xsk: Harden userspace-supplied xdp_desc validation)

	 change: edit net/xdp/xsk_queue.h

  	 Revision  by ast: (bpf: Avoid RCU context warning when unpinning htab with internal structs)

	 change: edit kernel/bpf/inode.c

  	 Revision  by ast: (selftests/bpf: Add test for unpinning htab with internal timer struct)

	 change: add tools/testing/selftests/bpf/progs/test_pinning_htab.c

	 change: add tools/testing/selftests/bpf/prog_tests/pinning_htab.c

  	 Revision  by nathan: (kbuild: Restore pattern to avoid stripping .rela.dyn from vmlinux)

	 change: edit scripts/Makefile.vmlinux

  	 Revision  by nathan: (kbuild: Add &#039;.rel.*&#039; strip pattern for vmlinux)

	 change: edit scripts/Makefile.vmlinux

  	 Revision  by nathan: (s390/vmlinux.lds.S: Move .vmlinux.info to end of allocatable sections)

	 change: edit arch/s390/kernel/vmlinux.lds.S

  	 Revision  by robh: (dt-bindings: bus: allwinner,sun50i-a64-de2: don&#039;t check node names)

	 change: edit Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml

  	 Revision  by robh: (dt-bindings: bus: renesas-bsc: allow additional properties)

	 change: edit Documentation/devicetree/bindings/bus/renesas,bsc.yaml

  	 Revision  by nathan: (kbuild: Use &#039;--strip-unneeded-symbol&#039; for removing module device table symbols)

	 change: edit scripts/Makefile.vmlinux

  	 Revision  by rostedt: (tracing: Fix tracing_mark_raw_write() to use buf and not ubuf)

	 change: edit kernel/trace/trace.c

  	 Revision  by vbabka: (slab: fix barn NULL pointer dereference on memoryless nodes)

	 change: edit mm/slub.c

  	 Revision  by rostedt: (tracing: Stop fortify-string from warning in tracing_mark_raw_write())

	 change: edit kernel/trace/trace.c

  	 Revision  by wsa+renesas: (Revert &quot;i2c: boardinfo: Annotate code used in init phase only&quot;)

	 change: edit drivers/i2c/i2c-boardinfo.c

	 change: edit include/linux/i2c.h

  	 Revision  by torvalds: (Linux 6.18-rc1)

	 change: edit Makefile
------=_Part_1_1036049877.1760343666568--

