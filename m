Return-Path: <linux-media+bounces-54504-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OSXEPllqGl3uQAAu9opvQ
	(envelope-from <linux-media+bounces-54504-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 18:03:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D834F204CB0
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 18:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55B963039369
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 17:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E428237AA78;
	Wed,  4 Mar 2026 17:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpN9HoAu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C680D379EDF
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 17:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772643787; cv=none; b=KFf8IKmpIlnQFzT7YcOi+Lo+7j8sd0I9JnLehPqd0D9Yaoo1SWdWegdAEsfL9F85dLG87DXAkvkdGXUzZg5svuRCJiL5J8dnPuLxBTlKtn4yPLyTnSRwK8YHrE0NIZSXWOgca8xHXJjw45zCvkg4qzur98ahrEIbvIA8LcqteqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772643787; c=relaxed/simple;
	bh=7lOoWMMA0M8KH3kMw8y4MCoijnwPVWXaUCnl1JTNnJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ttmu5XHubgXV7gLMJ2YYZb6fnMtez6TWBA5S0X3/9wMcmBQYwNwBcigI/DpfFu4r7IK1ivdgG7Ea99HmVu2Kq7YgaKjbKTys6z4DdIaYLoZbeoS6vISZNwiKCaqYbC85DnZROCZMi58OU2ZlmUJHXESjShsHzi3qTnWQknCAE2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpN9HoAu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c944bb62so667637f8f.3
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 09:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643784; x=1773248584; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nbV/oYX7d0ZGq24NywUe6q4Jk9h6nNIgQ4I7M+8thk0=;
        b=PpN9HoAuwUAix7lPn9rZF8mL/iFJwgEn3ibMZKXGG2huEfIWWk+pbrWg385kN8aImT
         pcTn93SiyBrWdMy97VJXU2NSZpwM9XKrCRkKe4ap3TPCPt/MYZ/+WMP4Hv+BfqapQ8dt
         5pyRz1BFwgmyUkxYRJEEa0EySIRMdkDFldWVAODNP6AqWXZ9wuDwT7noRxVXZSdt6VSK
         sYeawrBQxhjo3OHKEWB5FJRdTzDwc89/HKAk7oOmNA0+KdUO7uiaSNeU1N7g7vnuHiAL
         Uj+Q5IjvxrkEU3lmZWZQ2+0NWeU/kd+8f3jswXAlY2q8X4qPa+Uy0aegrW5jOP34wUkU
         QTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643784; x=1773248584;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbV/oYX7d0ZGq24NywUe6q4Jk9h6nNIgQ4I7M+8thk0=;
        b=vpre/p0NprOtYAHcrZQZz4/hUMWRH8n4mOf/u/XuLwFk2sXrzmdFCNzvAxxLwU8ejZ
         f0o5VgKUlgcMprpIGDtV8yPULz6hAZM0RdY/XMf7NMRT2JZEQeyXIjFrlvLanH2wiM/w
         1vonDXRal9Tc/eZANSUQMgEBYiYrODhHANq0ky/OXk8fk8UgtmfuCxxkAb/yyyEBDWp0
         6KG2poYbyTdNc+lqKTNmBEx5IZXBt8pT6wOlI1ySUMfr0wcx9e51/D5np16eluWV/UPE
         q0QQktf2zGU0axxrt8QNNTr6QEGnb021s3Q0sp0d8/6DXUQw3afCDpkRyAX2BJNkKT2U
         erQA==
X-Forwarded-Encrypted: i=1; AJvYcCXRO8A8ggP7ihpRNF5K5WSEEakXVwn1+N0yaDJFjkM7i+Pd3OuxdJy06WVoGJhzO1i7sgmibIJBE2Z5eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfrGQzLlUkGFYkMOgX2cX6iSXxGzRidXt48cNHe1iz5f3UZAC2
	AMRHyGyqyMyiRhX5OvRnuxEmtP4ecRd1wa8vgD0kHEUhGU+klhDc0XAC
X-Gm-Gg: ATEYQzwZzbXZ79PpnF2ywGVSmKl3Eus63t7C9FsDyHeiM86SlSSCf2a1vk0OKYJYMTH
	pQDwGEZj9TLzmoNet7V1VVmWelR5aiJDX/FkF3lxeWaV00XZ1psDTn7HEMLfUDs9NTyxtZ8UE7k
	LNi53/s2uhMbV34mNoreh8Nu9Sis5FLYWlR9xnrnGp3AteekuZ4J/Ec3GhXKmRu8dX40kVQypOg
	2FPEogB6vEB5r7WuJeeFChG9hOKT4H0NxlEMU8r7ahuj4XyNdLQTg8v8wmc3NMsrNrQ/nd8kX61
	3uVESB7VshsHj6Yi7cgTAGWnOEnnkC2x0mNoR5ftlVfySOKNToUqrvcAMjoGgbIWNvwfp2IlIkm
	INe4e86LbIWAeIdzXb9pGXUlSPlWnkZvj19X+4w2uDLR4jYOEy1B4PwfCEVQTI/vYzBX2vHPn/f
	JLX+VxwbIi5KhFiaaKfy1cXPo0DYGK6FI9gYFq2l0nUqAWQ7/eKKNUqLBqSxO9hqUkjvTa1zE92
	EhLN4NCgJ3mDDid9aBTaGL/Gg3c94r/h5ASiAhO2Kw2ky1wVWXfFyidCt8k/QebOpvINlkCyA==
X-Received: by 2002:a05:6000:601:b0:439:c2b6:d5d8 with SMTP id ffacd0b85a97d-439c8006b97mr4939995f8f.36.1772643783963;
        Wed, 04 Mar 2026 09:03:03 -0800 (PST)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b8807a4esm23022556f8f.4.2026.03.04.09.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:03:03 -0800 (PST)
Date: Wed, 4 Mar 2026 18:03:01 +0100
From: Franz Schnyder <fra.schnyder@gmail.com>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca, 
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, sebastian.fricke@collabora.com, 
	shawnguo@kernel.org, ulf.hansson@linaro.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, 
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, imx@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: [REGRESSION] boot failure on imx8mp due to e0203ddf9af7
Message-ID: <n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: D834F204CB0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54504-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,ndufresne.ca,collabora.com,pengutronix.de,linaro.org,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fraschnyder@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello,

Our iMX8MP SoMs (Verdin and Toradex SMARC) fail to boot after 
commit e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC").
On rare occasions, it's still able to boot.
It fails after having registered g1 VPU, probably when it tries to
register g2 VPU.

Ming: Any ideas on how to proceed here?

Success::
[    9.040517] hantro-vpu 38300000.video-codec: registered nxp,imx8mm-vpu-g1-dec as /dev/video0
[    9.052133] hantro-vpu 38310000.video-codec: registered nxp,imx8mq-vpu-g2-dec as /dev/video1


Failure with decoded stacktrace::

[    9.004477] hantro-vpu 38300000.video-codec: registered nxp,imx8mm-vpu-g1-dec as /dev/video0
[    9.027097] Unable to handle kernel paging request at virtual address ffffd9c18eb05000
[    9.027132] Mem abort info:
[    9.027139]   ESR = 0x0000000096000007
[    9.027147]   EC = 0x25: DABT (current EL), IL = 32 bits
[    9.027156]   SET = 0, FnV = 0
[    9.027164]   EA = 0, S1PTW = 0
[    9.027171]   FSC = 0x07: level 3 translation fault
[    9.027180] Data abort info:
[    9.027187]   ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
[    9.027196]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    9.027205]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    9.027215] swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000004924f000
[    9.027226] [ffffd9c18eb05000] pgd=0000000000000000, p4d=10000000496dd003, pud=1000000102e42403, pmd=100000010c33d403, pte=0000000000000000
[    9.027258] Internal error: Oops: 0000000096000007 [#1]  SMP
[    9.101669] Modules linked in: snd_soc_fsl_sai crypto_engine rng_core imx_pcm_dma authenc snd_soc_fsl_aud2htx snd_soc_fsl_utils imx8mp_interconnect libdes i
mx8mp_hdmi_pai evdev imx8mp_hdmi_tx aes_ce_blk dw_hdmi ghash_ce drm_display_helper snd_soc_simple_card hantro_vpu phy_fsl_imx8mq_usb libaes phy_fsl_samsung_hdm
i snd_soc_simple_card_utils cec phy_fsl_imx8m_pcie v4l2_vp9 imx8mp_hdmi_pvi typec fsl_imx8_ddr_perf snd_soc_imx_hdmi gf128mul samsung_dsim v4l2_h264 etnaviv ti
_ads1015 industrialio_triggered_buffer snd_soc_nau8822 ina2xx lm75 gpu_sched i3c lontium_lt8912b kfifo_buf governor_userspace imx_sdma flexcan imx_aipstz dwc3_
imx8mp imx_bus can_dev spi_nxp_fspi caam spi_imx error pwm_imx27 imx8mm_thermal nvmem_snvs_lpgpr snvs_pwrkey usb_conn_gpio gpio_keys display_connector roles lo
op fuse ipv6 libsha1 autofs4
[    9.173690] CPU: 3 UID: 0 PID: 45 Comm: kworker/u16:2 Not tainted 6.19.0+ #47 PREEMPT
[    9.181623] Hardware name: Toradex Verdin iMX8M Plus on Verdin Development Board (DT)
[    9.189462] Workqueue: events_unbound deferred_probe_work_func
[    9.195314] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    9.202284] pc : of_find_matching_node_and_match (drivers/of/base.c:1129 drivers/of/base.c:1120 drivers/of/base.c:1187)
[    9.207869] lr : of_find_matching_node_and_match (drivers/of/base.c:1185)
[    9.213452] sp : ffff8000805dbad0
[    9.216771] x29: ffff8000805dbad0 x28: 0000000000000000 x27: 0000000000000000
[    9.223927] x26: 0000000000000000 x25: 0000000000000000 x24: ffffd9c2060d48e0
[    9.231078] x23: 0000000000000000 x22: ffffd9c18eb05000 x21: ffff0000ff79d7f8
[    9.238231] x20: 0000000000000000 x19: ffffd9c18eb05000 x18: 00000000ffffffff
[    9.245385] x17: ffff263ef9a67000 x16: ffffd9c2055d3d54 x15: ffff8000805db870
[    9.252536] x14: 0000000000000000 x13: 006365646f632d6f x12: 0000000000000001
[    9.259689] x11: 0000000000000003 x10: 0000000000000020 x9 : 0000000000000000
[    9.266842] x8 : 0000000000000020 x7 : 00000000ffffffff x6 : ffff0000c4a9d8c8
[    9.273995] x5 : 0000000000000014 x4 : 0000000000000000 x3 : 0000000000000001
[    9.281145] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
[    9.288301] Call trace:
[    9.290753]  of_find_matching_node_and_match (drivers/of/base.c:1129 drivers/of/base.c:1120 drivers/of/base.c:1187) (P)
[    9.296336] hantro_probe (./include/linux/of.h:983 drivers/media/platform/verisilicon/hantro_drv.c:1047 drivers/media/platform/verisilicon/hantro_drv.c:1225) hantro_vpu
[    9.301144]  platform_probe (drivers/base/platform.c:1449)
[    9.304815]  really_probe (drivers/base/dd.c:583 drivers/base/dd.c:661)
[    9.308399]  __driver_probe_device (drivers/base/dd.c:803)
[    9.312765]  driver_probe_device (drivers/base/dd.c:833)
[    9.316956]  __device_attach_driver (drivers/base/dd.c:962)
[    9.321415]  bus_for_each_drv (drivers/base/bus.c:500)
[    9.325262]  __device_attach (drivers/base/dd.c:1035)
[    9.329109]  device_initial_probe (drivers/base/dd.c:1088)
[    9.333303]  bus_probe_device (drivers/base/bus.c:576)
[    9.337152]  deferred_probe_work_func (drivers/base/dd.c:125 (discriminator 14))
[    9.341697]  process_one_work (kernel/workqueue.c:3268)
[    9.345719]  worker_thread (kernel/workqueue.c:3334 kernel/workqueue.c:3421)
[    9.349477]  kthread (kernel/kthread.c:467)
[    9.352716]  ret_from_fork (arch/arm64/kernel/entry.S:861)
[    9.356303] Code: 6b14001f 9a93d35a 1a80d294 91032273 (39400264)
All code
========
   0:   6b14001f        cmp     w0, w20
   4:   9a93d35a        csel    x26, x26, x19, le
   8:   1a80d294        csel    w20, w20, w0, le
   c:   91032273        add     x19, x19, #0xc8
  10:*  39400264        ldrb    w4, [x19]               <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0:   39400264        ldrb    w4, [x19]
[    9.362413] ---[ end trace 0000000000000000 ]---
[    9.367037] note: kworker/u16:2[45] exited with irqs disabled
[    9.367134] note: kworker/u16:2[45] exited with preempt_count 1


Thanks,
Franz


