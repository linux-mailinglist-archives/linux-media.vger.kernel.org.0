Return-Path: <linux-media+bounces-36270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF205AEDA41
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 12:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 750977AAAFF
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 10:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BA125B31D;
	Mon, 30 Jun 2025 10:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BVjdNev+"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC2E259CBF;
	Mon, 30 Jun 2025 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751280409; cv=none; b=exDY8lRpN30/+xQPJRrRQ6SwbdwiddJk1KZ8X7ji1NY9Suex44y268Ork25ELIvxaQS+/XkYwzcS2OoZQiwVwKrfZn+wSpbCJ5Zs8/hPFUOCsDNQUVulEWXrN/sMfW3RLHglSiZPd7Tvkay4R/VcYu9amdUHovAIwVR6Mn0wo2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751280409; c=relaxed/simple;
	bh=FTNmyFRpGtxkFD1GDLfnBPdGgdYvPB1jbWNCgc5xVIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qoz1PvLHAZjKCngSeXmgEdpAEFvTnwcL/Y22FN0rJ8O1g/pUPLGpI8t0dhDBJNXV9G4U7JpeMmB74KKwww13YvDZEmbw8O1iLjjWavjM7/U5LlKsDGRIQdywSfVpTrsmCqUqnqHSP3tILI1WlXIvgfsgFIbCnaDfEd8dhFg4KFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BVjdNev+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751280405;
	bh=FTNmyFRpGtxkFD1GDLfnBPdGgdYvPB1jbWNCgc5xVIU=;
	h=From:Date:Subject:To:Cc:From;
	b=BVjdNev+90LkCDIzyvyuDtaPNvXReOEWiKxGDI9zq9nIfMXHxtOxyJdoHsh0aV6Cs
	 +klk6JUcV8BrB79SOZO9xmkDxEA/37IsajQ7pl9SiA4j5suuPTDM8kTccTtzGOxuKg
	 RMVEgEmEMqBCbfBQpxNplMximpITyAEBUr+lYxm3EHc9k7FpVXlFZrch3XYXvzqF5E
	 qxf75qSbzllj22ky4JX8VVuWvspVBz/HSvuk/y4zXBJ1coDLWp5ZRFAXeXomcjOixa
	 DULA2fw1foHJTmuNWegN5PIx5g8qjN4LROJQlfvIERXr3olxPRo4H6hZoD+6WSW0z+
	 syFtl6ek1IXnw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600c8f85Cf092d4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3607817E0657;
	Mon, 30 Jun 2025 12:46:45 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Mon, 30 Jun 2025 12:46:43 +0200
Subject: [PATCH] media: ti: j721e-csi2rx: fix list_del corruption
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-j721e-dma-fixup-v1-1-591e378ab3a8@collabora.com>
X-B4-Tracking: v=1; b=H4sIABJrYmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM2MD3SxzI8NU3ZTcRN20zIrSAl3TJJM0SzNziyTzRDMloK6ColSgBNj
 E6NjaWgAL2KxUYQAAAA==
X-Change-ID: 20250630-j721e-dma-fixup-5b4f9678b7a6
To: kernel@collabora.com, Jai Luthra <jai.luthra@linux.dev>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Pratyush Yadav <p.yadav@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Vaishnav Achath <vaishnav.a@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sjoerd Simons <sjoerd@collabora.com>, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

If ti_csi2rx_start_dma() fails in ti_csi2rx_dma_callback(), the buffer is
marked done with VB2_BUF_STATE_ERROR but is not removed from the DMA queue.
This causes the same buffer to be retried in the next iteration, resulting in
a double list_del() and eventual list corruption.

Fix this by removing the buffer from the queue before calling vb2_buffer_done()
on error.

This resolves a crash due to list_del corruption:
[   37.811243] j721e-csi2rx 30102000.ticsi2rx: Failed to queue the next buffer for DMA
[   37.832187]  slab kmalloc-2k start ffff00000255b000 pointer offset 1064 size 2048
[   37.839761] list_del corruption. next->prev should be ffff00000255bc28, but was ffff00000255d428. (next=ffff00000255b428)
[   37.850799] ------------[ cut here ]------------
[   37.855424] kernel BUG at lib/list_debug.c:65!
[   37.859876] Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
[   37.866061] Modules linked in: i2c_dev usb_f_rndis u_ether libcomposite dwc3 udc_core usb_common aes_ce_blk aes_ce_cipher ghash_ce gf128mul sha1_ce cpufreq_dt dwc3_am62 phy_gmii_sel sa2ul
[   37.882830] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.16.0-rc3+ #28 VOLUNTARY
[   37.890851] Hardware name: Bosch STLA-GSRV2-B0 (DT)
[   37.895737] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   37.902703] pc : __list_del_entry_valid_or_report+0xdc/0x114
[   37.908390] lr : __list_del_entry_valid_or_report+0xdc/0x114
[   37.914059] sp : ffff800080003db0
[   37.917375] x29: ffff800080003db0 x28: 0000000000000007 x27: ffff800080e50000
[   37.924521] x26: 0000000000000000 x25: ffff0000016abb50 x24: dead000000000122
[   37.931666] x23: ffff0000016abb78 x22: ffff0000016ab080 x21: ffff800080003de0
[   37.938810] x20: ffff00000255bc00 x19: ffff00000255b800 x18: 000000000000000a
[   37.945956] x17: 20747562202c3832 x16: 6362353532303030 x15: 0720072007200720
[   37.953101] x14: 0720072007200720 x13: 0720072007200720 x12: 00000000ffffffea
[   37.960248] x11: ffff800080003b18 x10: 00000000ffffefff x9 : ffff800080f5b568
[   37.967396] x8 : ffff800080f5b5c0 x7 : 0000000000017fe8 x6 : c0000000ffffefff
[   37.974542] x5 : ffff00000fea6688 x4 : 0000000000000000 x3 : 0000000000000000
[   37.981686] x2 : 0000000000000000 x1 : ffff800080ef2b40 x0 : 000000000000006d
[   37.988832] Call trace:
[   37.991281]  __list_del_entry_valid_or_report+0xdc/0x114 (P)
[   37.996959]  ti_csi2rx_dma_callback+0x84/0x1c4
[   38.001419]  udma_vchan_complete+0x1e0/0x344
[   38.005705]  tasklet_action_common+0x118/0x310
[   38.010163]  tasklet_action+0x30/0x3c
[   38.013832]  handle_softirqs+0x10c/0x2e0
[   38.017761]  __do_softirq+0x14/0x20
[   38.021256]  ____do_softirq+0x10/0x20
[   38.024931]  call_on_irq_stack+0x24/0x60
[   38.028873]  do_softirq_own_stack+0x1c/0x40
[   38.033064]  __irq_exit_rcu+0x130/0x15c
[   38.036909]  irq_exit_rcu+0x10/0x20
[   38.040403]  el1_interrupt+0x38/0x60
[   38.043987]  el1h_64_irq_handler+0x18/0x24
[   38.048091]  el1h_64_irq+0x6c/0x70
[   38.051501]  default_idle_call+0x34/0xe0 (P)
[   38.055783]  do_idle+0x1f8/0x250
[   38.059021]  cpu_startup_entry+0x34/0x3c
[   38.062951]  rest_init+0xb4/0xc0
[   38.066186]  console_on_rootfs+0x0/0x6c
[   38.070031]  __primary_switched+0x88/0x90
[   38.074059] Code: b00037e0 91378000 f9400462 97e9bf49 (d4210000)
[   38.080168] ---[ end trace 0000000000000000 ]---
[   38.084795] Kernel panic - not syncing: Oops - BUG: Fatal exception in interrupt
[   38.092197] SMP: stopping secondary CPUs
[   38.096139] Kernel Offset: disabled
[   38.099631] CPU features: 0x0000,00002000,02000801,0400420b
[   38.105202] Memory Limit: none
[   38.108260] ---[ end Kernel panic - not syncing: Oops - BUG: Fatal exception in interrupt ]---

Fixes: b4a3d877dc92 ("media: ti: Add CSI2RX support for J721E")
Suggested-by: Sjoerd Simons <sjoerd@collabora.com>
Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 6412a00be8eab89548950dd21b3b3ec02dafa5b4..0e358759e35faac95d1520e14a75096375c806bb 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -619,6 +619,7 @@ static void ti_csi2rx_dma_callback(void *param)
 
 		if (ti_csi2rx_start_dma(csi, buf)) {
 			dev_err(csi->dev, "Failed to queue the next buffer for DMA\n");
+			list_del(&buf->list);
 			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
 		} else {
 			list_move_tail(&buf->list, &dma->submitted);

---
base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
change-id: 20250630-j721e-dma-fixup-5b4f9678b7a6

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


