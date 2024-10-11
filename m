Return-Path: <linux-media+bounces-19410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD12099A02D
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 11:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99C71282831
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 09:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABE820CCEB;
	Fri, 11 Oct 2024 09:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dXh/ESJ+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B7126AFC;
	Fri, 11 Oct 2024 09:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728639205; cv=none; b=kSPerC0rZaCVrtv3P6nmi/iUhXXkqQL08BZ4c+WvGmAhX1yRZ3ch9TzuNKeWwQvB9Ek9kYycrOaqBaFYWwgGWSFCMw/QEtkXA/5/9qFVvH9T2EswdHJhmuBiQLlo8rO7uDNDrgj45eTz/f180xbnGQre5UGcazti4zd9dvsF5U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728639205; c=relaxed/simple;
	bh=jS7r5CiTra2sA9uavhdyfqEtuGIud+x9Fzob3lNKlUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kHcS2Wa6xDI+/jdkwAT3FI+w2r9dDwYV+d/HE1dbsNu/K+mnMeVseqjFN3Lcjb95qnCPcmDxT0fH0bGBNzfU5K40UUjtMm1JJMq0bQsC+pPsYiv4oq7D7nABRaSKHaAsd3DZ1WYLkpjDqXbZ0YDKCRLYu2d4LhzFqqdVEimqMT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXh/ESJ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A880DC4CEC3;
	Fri, 11 Oct 2024 09:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728639204;
	bh=jS7r5CiTra2sA9uavhdyfqEtuGIud+x9Fzob3lNKlUE=;
	h=Date:From:To:Cc:Subject:From;
	b=dXh/ESJ+M6gJHsdh5J2NwQIbFLh1i0WnLafQDRP07VfHBNxyLxK6HY1+EHYfQ4pf8
	 /pMNcxGZ8P8bQpsncHGb96mIz523tLxRVq63u/MHlKlgvhpHlfATv+JHdnF8sCYIPx
	 KCHkKrUzLqVpayy1AERw9gIOPxkzh2Tde8sXm7TZkGnOCC13sKedL5FdDYgwoelaQF
	 5b4LynVlMCqoIQq/2mHCVE8gUQNKTqEjLiB6AKyP/c9CDL3hbhNUo3uHboTv7Es0Zg
	 zig3cX0sKtH3fAPGYIOdI4iccv0pumBfaHrL6d5HHRm1Kf6RNgBKzCTky5KjRgIwKH
	 D0rpmWPFVXUzQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1szC1Z-0000000051q-3zXV;
	Fri, 11 Oct 2024 11:33:30 +0200
Date: Fri, 11 Oct 2024 11:33:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: camss NULL-deref on power on with 6.12-rc2
Message-ID: <Zwjw6XfVWcufMlqM@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

This morning I hit the below NULL-deref in camss when booting a 6.12-rc2
kernel on the Lenovo ThinkPad X13s.

I booted the same kernel another 50 times without hitting it again it so
it may not be a regression, but simply an older, hard to hit bug.

Hopefully you can figure out what went wrong from just staring at the
oops and code.

Johan


[    5.657860] ov5675 24-0010: failed to get HW configuration: -517
[    5.676183] vreg_l6q: Bringing 2800000uV into 1800000-1800000uV

[    6.517689] qcom-camss ac5a000.camss: Adding to iommu group 22

[    6.589201] Unable to handle kernel NULL pointer dereference at virtual =
address 0000000000000030
[    6.589625] Mem abort info:
[    6.589960]   ESR =3D 0x0000000096000004
[    6.590293]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[    6.590630]   SET =3D 0, FnV =3D 0
[    6.591619]   EA =3D 0, S1PTW =3D 0
[    6.591968]   FSC =3D 0x04: level 0 translation fault
[    6.592298] Data abort info:
[    6.592621]   ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
[    6.593112]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
[    6.593450]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
[    6.593783] user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000010daef000
[    6.594139] [0000000000000030] pgd=3D0000000000000000, p4d=3D00000000000=
00000
[    6.594214] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[    6.594753] Modules linked in: qrtr_mhi cbc des_generic libdes algif_skc=
ipher md5 algif_hash af_alg ip6_tables xt_LOG nf_log_syslog r8152 ipt_REJEC=
T mii nf_reject_ipv4 libphy xt_tcpudp xt_conntrack nf_conntrack libcrc32c n=
f_defrag_ipv6 nf_defrag_ipv4 iptable_filter qcom_pm8008_regulator ov5675 sn=
d_q6apm(+) hci_uart btqca venus_enc venus_dec bluetooth videobuf2_dma_conti=
g qcom_pm8008 pmic_glink_altmode qcom_spmi_adc5 leds_qcom_lpg qcom_spmi_adc=
_tm5 mfd_core snd_soc_sc8280xp qcom_spmi_temp_alarm qcom_pon rpmsg_ctrl ecd=
h_generic fastrpc apr rpmsg_char qrtr_smd qcom_pd_mapper rtc_pm8xxx qcom_ba=
ttmgr ecc aux_hpd_bridge reboot_mode qcom_vadc_common industrialio nvmem_qc=
om_spmi_sdam led_class_multicolor regmap_i2c i2c_hid_of_elan snd_soc_qcom_c=
ommon snd_soc_qcom_sdw pwrseq_qcom_wcn ath11k_pci qcom_camss venus_core vid=
eobuf2_dma_sg videobuf2_memops v4l2_mem2mem v4l2_fwnode videobuf2_v4l2 msm =
v4l2_async videobuf2_common qcom_stats gpio_sbu_mux ath11k videodev drm_exe=
c dispcc_sc8280xp snd_soc_wcd938x phy_qcom_edp gpu_sched
[    6.594814]  snd_soc_wcd_classh snd_soc_wcd938x_sdw mac80211 drm_display=
_helper mc snd_soc_lpass_rx_macro snd_soc_lpass_wsa_macro drm_dp_aux_bus sn=
d_soc_lpass_tx_macro snd_soc_lpass_va_macro camcc_sc8280xp regmap_sdw video=
cc_sm8350 i2c_qcom_cci soundwire_qcom snd_soc_wcd_mbhc libarc4 snd_soc_lpas=
s_macro_common phy_qcom_qmp_combo cfg80211 qcom_q6v5_pas llcc_qcom aux_brid=
ge snd_soc_core snd_compress qcom_pil_info rfkill qcom_common snd_pcm qcom_=
glink_smem pci_pwrctl_pwrseq drm_kms_helper pci_pwrctl_core mhi typec qcom_=
glink pwrseq_core icc_bwmon snd_timer phy_qcom_qmp_usb qrtr phy_qcom_snps_f=
emto_v2 qcom_q6v5 gpucc_sc8280xp pinctrl_sc8280xp_lpass_lpi snd qcom_sysmon=
 pinctrl_lpass_lpi lpasscc_sc8280xp pmic_glink soundcore mdt_loader pdr_int=
erface soundwire_bus qcom_rng rpmsg_core leds_gpio input_leds qcom_pdr_msg =
socinfo qmi_helpers rng_core qcom_wdt pwm_bl icc_osm_l3 led_class fuse dm_m=
od ip_tables x_tables ipv6 autofs4 pcie_qcom crc8 phy_qcom_qmp_pcie nvme nv=
me_core hid_multitouch i2c_qcom_geni i2c_hid_of i2c_hid drm
[    6.594866]  i2c_core
[    6.594868] CPU: 0 UID: 0 PID: 557 Comm: v4l_id Not tainted 6.12.0-rc2 #=
165
[    6.594871] Hardware name: LENOVO 21BYZ9SRUS/21BYZ9SRUS, BIOS N3HET87W (=
1.59 ) 12/05/2023
[    6.594872] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[    6.594874] pc : camss_find_sensor+0x20/0x74 [qcom_camss]
[    6.594885] lr : camss_get_pixel_clock+0x18/0x60 [qcom_camss]
[    6.594889] sp : ffff800082d538f0
[    6.594890] x29: ffff800082d538f0 x28: ffff800082d53c70 x27: ffff670cc04=
04618
[    6.594893] x26: 0000000000000000 x25: 0000000000000000 x24: ffff670cd33=
173d0
[    6.594895] x23: ffff800082d539a8 x22: ffff670cd33192c8 x21: ffff800082d=
539b8
[    6.594898] x20: 0000000000000002 x19: 0000000000020001 x18: 00000000000=
00000
[    6.594900] x17: 0000000000000000 x16: ffffbf0bffbecdd0 x15: 00000000000=
00001
[    6.594902] x14: ffff670cc5c95300 x13: ffff670cc0b38980 x12: ffff670cc5c=
95ba8
[    6.594905] x11: ffffbf0c00f73000 x10: 0000000000000000 x9 : 00000000000=
00000
[    6.594907] x8 : ffffbf0c0085d000 x7 : 0000000000000000 x6 : 00000000000=
00078
[    6.594910] x5 : 0000000000000000 x4 : ffff670cd3318598 x3 : ffff670cd33=
18468
[    6.594912] x2 : ffff670cd3317728 x1 : ffff800082d539b8 x0 : 00000000000=
00000
[    6.594915] Call trace:
[    6.594915]  camss_find_sensor+0x20/0x74 [qcom_camss]
[    6.594920]  camss_get_pixel_clock+0x18/0x60 [qcom_camss]
[    6.594924]  vfe_get+0xb8/0x504 [qcom_camss]
[    6.594931]  vfe_set_power+0x30/0x58 [qcom_camss]
[    6.594936]  pipeline_pm_power_one+0x13c/0x150 [videodev]
[    6.594951]  pipeline_pm_power.part.0+0x58/0xf4 [videodev]
[    6.594960]  v4l2_pipeline_pm_use+0x58/0x94 [videodev]
[    6.594969]  v4l2_pipeline_pm_get+0x14/0x20 [videodev]
[    6.594978]  video_open+0x78/0xf4 [qcom_camss]
[    6.594982]  v4l2_open+0x80/0x120 [videodev]
[    6.594991]  chrdev_open+0xb4/0x204
[    6.594996]  do_dentry_open+0x138/0x4d0
[    6.595000]  vfs_open+0x2c/0xe4
[    6.595003]  path_openat+0x2b4/0x9fc
[    6.595005]  do_filp_open+0x80/0x130
[    6.595007]  do_sys_openat2+0xb4/0xe8
[    6.595010]  __arm64_sys_openat+0x64/0xac
[    6.595012]  invoke_syscall+0x48/0x110
[    6.595016]  el0_svc_common.constprop.0+0xc0/0xe0
[    6.595018]  do_el0_svc+0x1c/0x28
[    6.595021]  el0_svc+0x48/0x114
[    6.595023]  el0t_64_sync_handler+0xc0/0xc4
[    6.595025]  el0t_64_sync+0x190/0x194
[    6.595028] Code: 52800033 72a00053 d503201f f9402400 (f9401801)
[    6.595029] ---[ end trace 0000000000000000 ]---

