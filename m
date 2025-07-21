Return-Path: <linux-media+bounces-38174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21598B0C4FD
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 15:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD3533A9B68
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 13:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519AF2D9494;
	Mon, 21 Jul 2025 13:16:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AF22D879E;
	Mon, 21 Jul 2025 13:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753103803; cv=none; b=uMICZ6u8q1zC0p9GzzcOKudPaLqaKUsdKwGsnc1JOneGbg18fSTbBVCxebnKvpMj3dNXjVHdr3V6csC7s5+P3HD4aAfQ7VOzJB2j4302l0GDswtTNWIw/sbv+MqoAXnu6l0OSWDQSW8m4P0MFmSnycRAjC8fi2oMt46xJ9lPzeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753103803; c=relaxed/simple;
	bh=CuO4/wP2doWcG2Xry6LZXfRYw061PoW12/IBTKpypgA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NAYgyhL5HnLKvJrjPJyzQRps755qDU7YRW/cdRH6LTlZ8lF0D4fD2+8pYZFXEWQtp8FfVM8Iw/1g96bBrowFlxmR/wzTHtf1ifDHabkvs3BTX14Sq8HYq7GxcOpH/YlKKAxfaHcy9gHw8GvgBrHLC17u3H6Hx1ZtN4B7iVJROgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 8320AC3EEAD7;
	Mon, 21 Jul 2025 15:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 8320AC3EEAD7
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Heiko Stuebner <heiko@sntech.de>,
  Paul Elder <paul.elder@ideasonboard.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
In-Reply-To: <175308758352.3134829.9472501038683860006@localhost> (Stefan
	Klug's message of "Mon, 21 Jul 2025 10:46:23 +0200")
References: <m3h5zbxkc6.fsf@t19.piap.pl> <m38qknx939.fsf@t19.piap.pl>
	<175308758352.3134829.9472501038683860006@localhost>
Sender: khalasa@piap.pl
Date: Mon, 21 Jul 2025 15:16:28 +0200
Message-ID: <m31pq9y98z.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

Stefan Klug <stefan.klug@ideasonboard.com> writes:

>> > The problems show themselves maybe in 5% or 10% of boots.
>
> How do you detect if the current boot was a "faulty" one?

I just try to run the tester.

NOTE: make sure you don't run it against a sleeping ISP (clock disabled,
reset etc). I just run the camera application in one session and my
tester in another. Also, make sure the -m argument and the address are
both valid for the ISP in use (0x32E1xxxx for the first MIPI/ISP and
0x32E2xxxx for the second).

If it shows something like:

# ./analyze_mi -m1 -s10000000 -a0x32E21400 -8
Using LDP Q*, Q*, [X*] instructions (2 * 128 bits)
addr:  32E21400 32E21404 32E21408 32E2140C 32E21410 32E21414 32E21418 32E21=
41C
---------------------------------------------------------------------------=
---
values   7A2001       20 3C240000   1FA400        0        0        0 3C2C0=
000 count 2242922
values   7A2001       20 3C300000   1FA400        0        0        0 3C2C0=
000 count 126
values   7A2001       20 3C300000   1FA400        0        0        0 3C380=
000 count 2106801
values   7A2001       20 3C3C0000   1FA400        0        0        0 3C380=
000 count 110
values   7A2001       20 3C3C0000   1FA400        0        0        0 3C440=
000 count 1982059
values   7A2001       20 3C0C0000   1FA400        0        0        0 3C440=
000 count 94
values   7A2001       20 3C0C0000   1FA400        0        0        0 3C140=
000 count 1871623
values   7A2001       20 3C180000   1FA400        0        0        0 3C140=
000 count 64
values   7A2001       20 3C180000   1FA400        0        0        0 3C200=
000 count 1796142
values   7A2001       20 3C240000   1FA400        0        0        0 3C200=
000 count 59

then all is good.

OTOH if it's:
# ./analyze_mi -m1 -s10000000 -a0x32E21400 -8
Using LDP Q*, Q*, [X*] instructions (2 * 128 bits)
addr:  32E21400 32E21404 32E21408 32E2140C 32E21410 32E21414 32E21418 32E21=
41C
---------------------------------------------------------------------------=
---
values        0       20 3C300000   1FA400        0        0        0 3C380=
000 count 139
values   7A2001       20 3C300000   1FA400        0        0        0 3C380=
000 count 2202205
values   7A2001       20 3C3C0000   1FA400        0        0        0 3C380=
000 count 108
values   7A2001       20 3C3C0000   1FA400        0        0        0 3C440=
000 count 2121036
values        0       20 3C3C0000   1FA400        0        0        0 3C440=
000 count 117
values   7A2001       20 3C0C0000   1FA400        0        0        0 3C440=
000 count 112
values   7A2001       20 3C0C0000   1FA400        0        0        0 3C140=
000 count 1997298
values        0       20 3C0C0000   1FA400        0        0        0 3C140=
000 count 88
values   7A2001       20 3C180000   1FA400        0        0        0 3C140=
000 count 106
values   7A2001       20 3C180000   1FA400        0        0        0 3C200=
000 count 1893775
values        0       20 3C180000   1FA400        0        0        0 3C200=
000 count 80
values   7A2001       20 3C240000   1FA400        0        0        0 3C200=
000 count 72
values   7A2001       20 3C240000   1FA400        0        0        0 3C2C0=
000 count 1784697
values        0       20 3C240000   1FA400        0        0        0 3C2C0=
000 count 65
values   7A2001       20 3C300000   1FA400        0        0        0 3C2C0=
000 count 67
values    FD200       20 3C0C0000   1FA400        0        0        0 3C140=
000 count 4
values    FD200       20 3C3C0000   1FA400        0        0        0 3C440=
000 count 5
values    10001       20 3C0C0000   1FA400        0        0        0 3C140=
000 count 3
values    FD200       20 3C180000   1FA400        0        0        0 3C200=
000 count 6
values    10001       20 3C180000   1FA400        0        0        0 3C200=
000 count 2
values 3C200000       20 3C180000   1FA400        0        0        0 3C200=
000 count 1
values 3C380000       20 3C300000   1FA400        0        0        0 3C380=
000 count 3
values    10001       20 3C300000   1FA400        0        0        0 3C380=
000 count 5
values    FD200       20 3C240000   1FA400        0        0        0 3C2C0=
000 count 1
values    FD200       20 3C300000   1FA400        0        0        0 3C380=
000 count 3
values 3C2C0000       20 3C240000   1FA400        0        0        0 3C2C0=
000 count 1
values    10001       20 3C3C0000   1FA400        0        0        0 3C440=
000 count 1

then, well, something's not right with the register at 0x32E21400.

The NXP-supplied docs on the ISP are not very helpful here, but maybe
the Rockchip RK3288 ISP docs are (there is a PDF on rockchip.fr).
It seems that the problem probably sits in the PVCI/AHB Slave -> CTRL ->
"To all (ISP) modules" (I don't know how ISP registers are connected to
the AHB/AXI on .MX8MP and it probably doesn't matter, the problem is
somewhere between the "AHB Slave and the "all modules").
It appears "only" MI registers are affected, though.

> Can you also share the kernel you are using?

I'm currently using v6.15 with several unrelated patches. Apparently
only this test patch could be relevant. BTW it won't have much effect
on the userspace utility (and it's not needed for the utility, it's just
for the driver and the camera application).

However, those problems were present with NXP-supplied kernels, too.

index 60c97bb7b18b..9530e653191a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c
@@ -192,3 +192,80 @@ void rkisp1_bls_swap_regs(enum rkisp1_fmt_raw_pat_type=
 pattern,
 	for (unsigned int i =3D 0; i < 4; ++i)
 		output[i] =3D input[swap[pattern][i]];
 }
+
+#define MIN_MATCHES 5
+#define READS 9
+u32 rkisp1_read(struct rkisp1_device *rkisp1, unsigned int addr)
+{
+	if (addr >=3D RKISP1_CIF_MI_BASE && addr <=3D RKISP1_CIF_MI_MP_Y_PIC_SIZE=
) {
+		unsigned long flags;
+		spin_lock_irqsave(&rkisp1->reg_lock, flags);
+
+		uint32_t v[READS];
+		unsigned a, b, cnt;
+		// i.MX8MP ISP MI interface corrupts transfers from time to time
+		if (addr % 8) { // 0x...4 and 0x...C
+			uint32_t value;
+			addr -=3D 4;
+			// first value may be corrupted, we discard it in wzr register
+			asm volatile ("ldp wzr, %w0, [%x1]" "\n"
+				      : "=3Dr" (value) // output
+				      : "r" (rkisp1->base_addr + addr)); // input
+			spin_unlock_irqrestore(&rkisp1->reg_lock, flags);
+			return value;
+		}
+		if (addr % 16) { // 0x...8
+			uint64_t value;
+			addr -=3D 8; // 64-bit: will read 0x...0 and 0x...8
+			// first value may be corrupted, we discard it in xzr register
+			asm volatile ("ldp xzr, %x0, [%x1]" "\n"
+				      : "=3Dr" (value) // output
+				      : "r" (rkisp1->base_addr + addr)); // input
+			spin_unlock_irqrestore(&rkisp1->reg_lock, flags);
+			return value; // little endian: only least significant 32 bits
+		}
+
+		// 0x...0 adreses are problematic: read multiple times
+		for (a =3D 0; a < ARRAY_SIZE(v); a++)
+			v[a] =3D readl(rkisp1->base_addr + addr);
+		for (a =3D 0; a < ARRAY_SIZE(v) - MIN_MATCHES + 1; a++) {
+			cnt =3D 0;
+			for (b =3D a; b < ARRAY_SIZE(v); b++)
+				if (v[b] =3D=3D v[a]) {
+					cnt++;
+					if (cnt =3D=3D MIN_MATCHES) {
+						spin_unlock_irqrestore(&rkisp1->reg_lock, flags);
+						return v[a];
+					}
+				}
+		}
+		spin_unlock_irqrestore(&rkisp1->reg_lock, flags);
+		pr_warn("Error reading ISP MI register 0x%X, returning the last value 0x=
%X\n", addr, v[ARRAY_SIZE(v) - 1]);
+		return v[ARRAY_SIZE(v) - 1];
+	}
+
+	return readl(rkisp1->base_addr + addr);
+}
+
+#define MAX_WRITES 5
+void rkisp1_write(struct rkisp1_device *rkisp1, unsigned int addr, u32 val)
+{
+	if (addr >=3D RKISP1_CIF_MI_BASE &&
+	    addr <=3D RKISP1_CIF_MI_MP_Y_PIC_SIZE &&
+	    addr !=3D RKISP1_CIF_MI_ICR /* write only */ &&
+	    addr !=3D RKISP1_CIF_MI_INIT) {
+		for (unsigned cnt =3D 0; cnt < MAX_WRITES; cnt++) {
+			unsigned long flags;
+			spin_lock_irqsave(&rkisp1->reg_lock, flags);
+			writel(val, rkisp1->base_addr + addr);
+			spin_unlock_irqrestore(&rkisp1->reg_lock, flags);
+
+			if (rkisp1_read(rkisp1, addr) =3D=3D val)
+				return; // succeeded
+		}
+		pr_warn("Error writing 0x%X to ISP MI register 0x%X\n", val, addr);
+		return;
+	}
+
+	writel(val, rkisp1->base_addr + addr);
+}

index ca952fd0829b..21bab4a3e647 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -520,6 +520,7 @@ struct rkisp1_device {
 	struct media_pipeline pipe;
 	struct mutex stream_lock; /* serialize {start/stop}_streaming cb between =
capture devices */
 	struct rkisp1_debug debug;
+	spinlock_t reg_lock; // used to serialize access to MI registers
 	const struct rkisp1_info *info;
 	int irqs[RKISP1_NUM_IRQS];
 	bool irqs_enabled;
@@ -547,16 +548,8 @@ struct rkisp1_mbus_info {
 	unsigned int direction;
 };
=20
-static inline void
-rkisp1_write(struct rkisp1_device *rkisp1, unsigned int addr, u32 val)
-{
-	writel(val, rkisp1->base_addr + addr);
-}
-
-static inline u32 rkisp1_read(struct rkisp1_device *rkisp1, unsigned int a=
ddr)
-{
-	return readl(rkisp1->base_addr + addr);
-}
+u32 rkisp1_read(struct rkisp1_device *rkisp1, unsigned int addr);
+void rkisp1_write(struct rkisp1_device *rkisp1, unsigned int addr, u32 val=
);
=20
 /*
  * rkisp1_cap_enum_mbus_codes - A helper function that return the i'th sup=
ported mbus code
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/=
media/platform/rockchip/rkisp1/rkisp1-dev.c
index dc65a7924f8a..07f87b70151b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -611,6 +611,7 @@ static int rkisp1_probe(struct platform_device *pdev)
 		return ret;
=20
 	mutex_init(&rkisp1->stream_lock);
+	spin_lock_init(&rkisp1->reg_lock);
=20
 	rkisp1->base_addr =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rkisp1->base_addr))


The (current working version of) analyze_mi.c, compile with -O2 -lpopt
and perhaps with -W -Wall -Wno-sign-compare
-Wno-missing-field-initializers -Wno-pointer-sign.
There is also a regular read_test (a single register and the whole ISP
MI, may use "alt read" workaround), and a write_test for a single
register as well.

// -*- mode: c; c-basic-offset: 4; tab-width: 4; -*-
// SPDX-License-Identifier: GPL-2.0
/*
 * Copyright (C) 2025 Sie=C4=87 Badawcza =C5=81ukasiewicz
 * - Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
 * Written by Krzysztof Ha=C5=82asa
 *
 * An i.MX8MP ISP MI register test utility v0.1
 * Make sure the ISP is active at all times while running this program.
 */

#include <err.h>
#include <fcntl.h>
#include <popt.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

#define ISP1_ADDR				0x32e10000	// must be page-aligned
#define ISP2_ADDR				0x32e20000
#define ISP_SIZE				0x4000	// with holes
#define MI_OFFSET				0x1400
#define MI_SIZE					0x200
#define MI_REGS					(MI_SIZE / 4 /* 32-bit */)
#define MAX_VALUES				128 // max different values for a register

#define error(...)				err(EXIT_FAILURE, __VA_ARGS__)
#define errorx(...)				errx(EXIT_FAILURE, __VA_ARGS__)
#define ARRAY_SIZE(arr)			(sizeof(arr) / sizeof((arr)[0]))
#define REG(offset, name, dec)	[((offset) - MI_OFFSET) / 4] {(name), (dec)}

static const struct reg {
	const char *name;
	int dec;
} reg_tab[MI_REGS] =3D {
	REG(0x1400, "mi_ctrl", 0), // Global control register
	REG(0x1404, "mi_init", 0), // Control register for address init and skip f=
unction (w)

	// Main picture
	REG(0x1408, "mi_mp_y_base_ad_init", 0), // Base address for Y component, J=
PEG or raw data
	REG(0x140C, "mi_mp_y_size_init", 1), // Size of Y component, JPEG or raw d=
ata
	REG(0x1410, "mi_mp_y_offs_cnt_init", 0), // Offset counter init value for =
Y, JPEG or raw data
	REG(0x1414, "mi_mp_y_offs_cnt_start", 0), // Offset counter start value fo=
r Y, JPEG or raw data
	REG(0x1418, "mi_mp_y_irq_offs_init", 0), // Fill level interrupt offset va=
lue for Y, JPEG or raw data
	REG(0x141C, "mi_mp_cb_base_ad_init", 0), // Base address for Cb component =
ring buffer
	REG(0x1420, "mi_mp_cb_size_init", 1), // Size of Cb component ring buffer
	REG(0x1424, "mi_mp_cb_offs_cnt_init", 0), // Offset counter init value for=
 Cb component ring buffer
	REG(0x1428, "mi_mp_cb_offs_cnt_start", 0), // Offset counter start value f=
or Cb component ring buffer
	REG(0x142C, "mi_mp_cr_base_ad_init", 0), // Base address for Cr component =
ring buffer
	REG(0x1430, "mi_mp_cr_size_init", 0), // Size of Cr component ring buffer
	REG(0x1434, "mi_mp_cr_offs_cnt_init", 0), // Offset counter init value for=
 Cr component ring buffer
	REG(0x1438, "mi_mp_cr_offs_cnt_start", 0), // Offset counter start value f=
or Cr component ring buffer

#if 0
	// Self picture
	REG(0x143C, "mi_sp_y_base_ad_init", 0), // Base address for Y component ri=
ng buffer
	REG(0x1440, "mi_sp_y_size_init", 1), // Size of Y component ring buffer
	REG(0x1444, "mi_sp_y_offs_cnt_init", 0), // Offset counter init value for =
Y component ring buffer
	REG(0x1448, "mi_sp_y_offs_cnt_start", 0), // Offset counter start value fo=
r Y component ring buffer
	REG(0x144C, "mi_sp_y_llength", 1), // Line length of Y component
	REG(0x1450, "mi_sp_cb_base_ad_init", 0), // Base address for Cb component =
ring buffer
	REG(0x1454, "mi_sp_cb_size_init", 1), // Size of Cb component ring buffer
	REG(0x1458, "mi_sp_cb_offs_cnt_init", 0), // Offset counter init value for=
 Cb component ring buffer
	REG(0x145C, "mi_sp_cb_offs_cnt_start", 0), // Offset counter start value f=
or Cb component ring buffer
	REG(0x1460, "mi_sp_cr_base_ad_init", 0), // Base address for Cr component =
ring buffer
	REG(0x1464, "mi_sp_cr_size_init", 1), // Size of Cr component ring buffer
	REG(0x1468, "mi_sp_cr_offs_cnt_init", 0), // Offset counter init value for=
 Cr component ring buffer
	REG(0x146C, "mi_sp_cr_offs_cnt_start", 0), // Offset counter start value f=
or Cr component ring buffer
#endif

	REG(0x1470, "mi_byte_cnt", 0), // Counter value of JPEG or RAW data bytes
	REG(0x1474, "mi_ctrl_shd", 0), // global control internal shadow register

	// Main picture
	REG(0x1478, "mi_mp_y_base_ad_shd", 0), // Base address shadow register for=
 Y component, JPEG or raw data ring buffer
	REG(0x147C, "mi_mp_y_size_shd", 1), // Size shadow register of Y component=
, JPEG or raw data
	REG(0x1480, "mi_mp_y_offs_cnt_shd", 0), // Current offset counter of Y com=
ponent, JPEG or raw data ring buffer
	REG(0x1484, "mi_mp_y_irq_offs_shd", 0), // Shadow register of fill level i=
nterrupt offset value for Y component, JPEG or raw data
	REG(0x1488, "mi_mp_cb_base_ad_shd", 0), // Base address shadow register fo=
r Cb component ring buffer
	REG(0x148C, "mi_mp_cb_size_shd", 1), // Size shadow register of Cb compone=
nt ring buffer
	REG(0x1490, "mi_mp_cb_offs_cnt_shd", 0), // Current offset counter of Cb c=
omponent ring buffer
	REG(0x1494, "mi_mp_cr_base_ad_shd", 0), // Base address shadow register fo=
r Cr component ring buffer
	REG(0x1498, "mi_mp_cr_size_shd", 0), // Size shadow register of Cr compone=
nt ring buffer
	REG(0x149C, "mi_mp_cr_offs_cnt_shd", 0), // Current offset counter of Cr c=
omponent ring buffer

#if 0
	// Self picture
	REG(0x14A0, "mi_sp_y_base_ad_shd", 0), // Base address shadow register for=
 Y component ring buffer
	REG(0x14A4, "mi_sp_y_size_shd", 1), // Size shadow register of Y component=
 ring buffer
	REG(0x14A8, "mi_sp_y_offs_cnt_shd", 0), // Current offset counter of Y com=
ponent ring buffer

	REG(0x14B0, "mi_sp_cb_base_ad_shd", 0), // Base address shadow register fo=
r Cb component ring buffer
	REG(0x14B4, "mi_sp_cb_size_shd", 1), // Size shadow register of Cb compone=
nt ring buffer
	REG(0x14B8, "mi_sp_cb_offs_cnt_shd", 0), // Current offset counter of Cb c=
omponent ring buffer
	REG(0x14BC, "mi_sp_cr_base_ad_shd", 0), // Base address shadow register fo=
r Cr component ring buffer
	REG(0x14C0, "mi_sp_cr_size_shd", 1), // Size shadow register of Cr compone=
nt ring buffer
	REG(0x14C4, "mi_sp_cr_offs_cnt_shd", 0), // Current offset counter of Cr c=
omponent ring buffer
#endif

	REG(0x14C8, "mi_dma_y_pic_start_ad", 1), // Y component image start address
	REG(0x14CC, "mi_dma_y_pic_width", 1), // Y component image width
	REG(0x14D0, "mi_dma_y_llength", 1), // Y component original line length
	REG(0x14D4, "mi_dma_y_pic_size", 1), // Y component image size
	REG(0x14D8, "mi_dma_cb_pic_start_ad", 0), // Cb component image start addr=
ess
	REG(0x14E8, "mi_dma_cr_pic_start_ad", 0), // Cr component image start addr=
ess

	REG(0x14F8, "mi_imsc", 0), // Interrupt Mask (1: interrupt active, 0: inte=
rrupt masked)
	REG(0x14FC, "mi_ris", 0), // Raw Interrupt Status
	REG(0x1500, "mi_mis", 0), // Masked Interrupt Status
	REG(0x1504, "mi_icr", 0),  // Interrupt Clear Register (w)
	REG(0x1508, "mi_isr", 0), // Interrupt Set Register (w)

	REG(0x150C, "mi_status", 0), // MI Status Register
	REG(0x1510, "mi_status_clr", 0), // MI Status Clear Register (w)
	REG(0x1514, "mi_sp_y_pic_width", 1), // Y component image width
	REG(0x1518, "mi_sp_y_pic_height", 1), // Y component image height
	REG(0x151C, "mi_sp_y_pic_size", 1), // Y component image size
	REG(0x1520, "mi_dma_ctrl", 0), // DMA control register
	REG(0x1524, "mi_dma_start", 0), // DMA start register (w)
	REG(0x1528, "mi_dma_status", 0), // DMA status register
	REG(0x152C, "mi_pixel_cnt", 0), // Counter value for defect pixel list

	// Main picture
	REG(0x1530, "mi_mp_y_base_ad_init2", 0), // Base address 2 (ping pong) for=
 Y component, JPEG or raw data
	REG(0x1534, "mi_mp_cb_base_ad_init2", 0), // Base address 2 (pingpong) for=
 Cb component
	REG(0x1538, "mi_mp_cr_base_ad_init2", 0), // Base address 2 (pingpong) for=
 Cr component ring buffer

#if 0
	// Self picture
	REG(0x153C, "mi_sp_y_base_ad_init2", 0), // Base address 2 (ping pong) for=
 Y component, JPEG or raw data
	REG(0x1540, "mi_sp_cb_base_ad_init2", 0), // Base address 2 (pingpong) for=
 Cb component
	REG(0x1544, "mi_sp_cr_base_ad_init2", 0), // Base address 2 (pingpong) for=
 Cr component ring buffer
#endif

	REG(0x1548, "mi_reserved_1", 0),
#ifdef ISP_MI_HANDSHAKE_NANO // never defined
	REG(0x154C, "mi_mp_handshake", 0), // MI mp handshake control for Nano han=
dshake
#else
	REG(0x154C, "mi_reserved_1_1", 0),
#endif
	REG(0x1550, "mi_mp_y_llength", 1), // MI mp y llength for Nano handshake,
	REG(0x1554, "mi_mp_y_slice_offset", 0), // MI mp y slice offset for Nano h=
andshake,
	REG(0x1558, "mi_mp_c_slice_offset", 0), // MI mp c slice offset for Nano h=
andshare,
	REG(0x155C, "mi_output_align_format", 0), // MI output byte swap and LSB a=
lignment control for Nano
	REG(0x1560, "mi_mp_output_fifo_size", 0), // MI mp output fifo control for=
 Nano,
	REG(0x1564, "mi_mp_y_pic_width", 1), // MI mp y width pix for Nano handsha=
ke,
	REG(0x1568, "mi_mp_y_pic_height", 1), // MI mp y height pix for Nano hands=
hake,
	REG(0x156C, "mi_mp_y_pic_size", 1), // MI mp y pix size for Nano handshare

#ifdef ISP_MI_BP // not defined
	REG(0x1580, "mi_bp_ctrl", 0),
	REG(0x1584, "mi_bp_r_base_ad_shd", 0),
	REG(0x1588, "mi_bp_gr_base_ad_shd", 0),
	REG(0x158C, "mi_bp_gb_base_ad_shd", 0),
	REG(0x1590, "mi_bp_b_base_ad_shd", 0),
	REG(0x1594, "mi_bp_r_offs_cnt_shd", 0),
	REG(0x1598, "mi_bp_gr_offs_cnt_shd", 0),
	REG(0x159C, "mi_bp_gb_offs_cnt_shd", 0),
	REG(0x15A0, "mi_bp_b_offs_cnt_shd", 0),
	REG(0x15A4, "mi_bp_wr_offs_cnt_init", 0),
	REG(0x15A8, "mi_bp_wr_irq_offs_shd", 0),
	REG(0x15AC, "mi_bp_wr_irq_offs_init", 0),
	REG(0x15B0, "mi_bp_wr_size_shd", 0),
	REG(0x15B4, "mi_bp_wr_size_init", 0),
	REG(0x15B8, "mi_bp_wr_llength", 0),
	REG(0x15BC, "mi_bp_pic_width", 1),
	REG(0x15C0, "mi_bp_pic_height", 1),
	REG(0x15C4, "mi_bp_pic_size", 1),
	REG(0x15C8, "mi_bp_r_offs_cnt_start", 0),
	REG(0x15CC, "mi_bp_gr_offs_cnt_start", 0),
	REG(0x15D0, "mi_bp_gb_offs_cnt_start", 0),
	REG(0x15D4, "mi_bp_b_offs_cnt_start", 0),
	REG(0x15D8, "mi_bp_r_base_ad_init", 0),
	REG(0x15DC, "mi_bp_gr_base_ad_init", 0),
	REG(0x15E0, "mi_bp_gb_base_ad_init", 0),
	REG(0x15E4, "mi_bp_b_base_ad_init", 0),
#endif
	REG(0x15E8, "mi_dma_y_raw_fmt", 0),
	REG(0x15EC, "mi_dma_y_raw_lval", 0)
};

struct values {
	struct {
		uint32_t value;
		unsigned count;
	} data[MAX_VALUES];
	unsigned data_count;
};

static int alt_read, verbose, debug;

static const struct reg *get_reg(uint32_t phys)
{
	phys &=3D ISP_SIZE - 1;
	if (phys >=3D MI_OFFSET && phys < MI_OFFSET + MI_SIZE * 2 /* 2 copies */)
		return &reg_tab[(phys - MI_OFFSET) / 4 /* 32-bit*/ % MI_REGS /* 2 copies =
*/];
	return NULL;
}

static void add_value(uint32_t phys, uint32_t value, struct values *values)
{
	unsigned cnt;
	for (cnt =3D 0; cnt < values->data_count; cnt++) {
		if (values->data[cnt].value =3D=3D value) {
			values->data[cnt].count++;
			break;
		}
	}

	if (cnt =3D=3D values->data_count) { // not found yet
		if (values->data_count =3D=3D MAX_VALUES)
			errorx("Too many register 0x%08X values", phys);
		values->data[cnt].value =3D value;
		values->data[cnt].count =3D 1;
		values->data_count++;
	}
}

static void show_values(uint32_t phys, const struct values *values)
{
	const struct reg *reg =3D get_reg(phys);

	for (unsigned cnt =3D 0; cnt < values->data_count; cnt++) {
		printf("Register 0x%08X %-23s", phys, reg && reg->name ? reg->name : "");
		if ((reg && reg->dec) || values->data[cnt].value < 10)
			printf(" value %10u count %u\n", values->data[cnt].value, values->data[c=
nt].count);
		else
			printf(" value 0x%08X count %u\n", values->data[cnt].value, values->data=
[cnt].count);
	}
	printf("\n");
}

static uint32_t read_reg(const volatile uint32_t *virt)
{
	if (alt_read) {
		if ((long)virt % 8) {
			// 32-bit LDP works with registers at xxx4 and xxxC, but corrupts xxx0 a=
nd xxx8 transfers.
			virt--;
			uint32_t value;
			asm volatile ("ldp wzr, %w0, [%x1]" "\n"
						  : "=3Dr" (value) // output
						  : "r" (virt)); // input
			return value;
		} else {
			virt -=3D 2;
			uint64_t value;
			asm volatile ("ldp xzr, %x0, [%x1]" "\n"
						  : "=3Dr" (value) // output
						  : "r" (virt)); // input
			return value; // little endian: only least significant 32 bits
		}
	} else
		return *(volatile uint32_t *)(virt);
}

static void __attribute__((noinline)) read_reg2(const volatile uint32_t *vi=
rt, void *v)
{
	uint32_t r, s;
	asm volatile ("ldp %w0, %w1, [%x2]" "\n"
				  : "=3Dr" (r), "=3Dr" (s) // output
				  : "r" (virt)); // input
	memcpy(v, &r, sizeof(r)); // possibly corrupted
	memcpy(v + sizeof(r), &s, sizeof(s)); // possibly corrupted if virt starts=
 on 8-byte boundary (valid for xxx4 and xxxC)
}

static void __attribute__((noinline)) read_reg4(const volatile uint32_t *vi=
rt, void *v)
{
	uint64_t r, s;
	asm volatile ("ldp %x0, %x1, [%x2]" "\n"
				  : "=3Dr" (r), "=3Dr" (s) // output
				  : "r" (virt)); // input
	memcpy(v, &r, sizeof(r)); // first half possibly corrupted, corruption in =
second half at xxxC also possible
	memcpy(v + sizeof(r), &s, sizeof(s)); // first half possibly corrupted if =
virt starts on 16-byte boundary (valid for xxx8)
}

static void __attribute__((noinline)) read_reg8(const volatile uint32_t *vi=
rt, void *v)
{
	_Float128 r, s;
	asm volatile ("ldp %q0, %q1, [%x2]" "\n"
				  : "=3Dw" (r), "=3Dw" (s) // output
				  : "r" (virt)); // input
	memcpy(v, &r, sizeof(r)); // possibly corrupted
	memcpy(v + sizeof(r), &s, sizeof(s)); // possibly corrupted if virt starts=
 on 8-byte boundary (valid for xxx4 and xxxC)
}

static void test_all(int samples, uint32_t mi_phys, uint32_t *mi)
{
	struct values values[MI_REGS] =3D {};
	for (unsigned cnt =3D 0; cnt < samples; cnt++) {
		if (cnt % (samples / 10) =3D=3D 0)
			printf("Sample %u\n", cnt);
		for (unsigned reg =3D 0; reg < MI_REGS; reg++)
			add_value(MI_OFFSET + reg * 4, read_reg(mi + reg), &values[reg]);
	}
	printf("\n");

	for (unsigned reg =3D 0; reg < MI_REGS; reg++) {
		uint32_t reg_addr =3D mi_phys + reg * 4;

		if (values[reg].data_count && (verbose || values[reg].data[0].value || va=
lues[reg].data[0].count !=3D samples))
			show_values(reg_addr, &values[reg]);
	}
}

static void test_reg(int samples, uint32_t phys, uint32_t *virt, uint32_t w=
rite_mask)
{
	if (!write_mask) {
		struct values values =3D {};
		for (unsigned cnt =3D 0; cnt < samples; cnt++) {
			if (cnt % (samples / 10) =3D=3D 0)
				printf("Sample %u\n", cnt);
			add_value(phys, read_reg(virt), &values);
		}
		printf("\n");

		show_values(phys, &values);
	} else {
		const struct reg *reg =3D get_reg(phys);
		if (reg && reg->name)
			printf("Register 0x%08X %s: (all values in hex)\n", phys, reg->name);
		else
			printf("Register 0x%08X: (all values in hex)\n", phys);

		uint32_t value =3D 0, prev_value =3D 0;
		unsigned mismatch_count =3D 0;
		for (unsigned cnt =3D 0; cnt < samples; cnt++) {
			*virt =3D value;
			uint32_t new_values[9];
			unsigned iter;

			for (iter =3D 0; iter < ARRAY_SIZE(new_values); iter++)
				new_values[iter] =3D read_reg(virt);

			for (iter =3D 0; iter < ARRAY_SIZE(new_values); iter++)
				if (new_values[iter] !=3D value)
					break;

			if (iter !=3D ARRAY_SIZE(new_values)) {
				printf("%8u:", cnt);
				printf(prev_value < 10 ? " %8u" :  " %08X", prev_value);
				printf(value < 10 ? " WR %8u RD" : " WR %08X RD", value);
				for (unsigned iter =3D 0; iter < ARRAY_SIZE(new_values); iter++)
					if (new_values[iter] =3D=3D value)
						printf("    valid");
					else if (new_values[iter] =3D=3D prev_value)
						printf(" previous");
					else if (iter && new_values[iter] =3D=3D new_values[iter - 1])
						printf("     same");
					else
						printf(new_values[iter] < 10 ? " %8u" : " %08X", new_values[iter]);
				putchar('\n');
				mismatch_count++;
			}
			prev_value =3D value;
			value =3D random();
			value ^=3D ((uint32_t)random()) << 16;
			value &=3D write_mask;
		}
		if (mismatch_count)
			printf("%u mismatches found\n", mismatch_count);
		else
			printf("No mismatches found\n");
	}
}

static void test_reg_ldp(int samples, uint32_t phys, uint32_t *virt, unsign=
ed words /* 32-bit*/)
{
	if (phys & (words * 2 - 1))
		errorx("Register address 0x%08X for 2 * %u-bit test is invalid", phys, wo=
rds * 16);

	struct {
		uint32_t v[8]; // max
		unsigned count;
	} data[MAX_VALUES] =3D {};
	unsigned data_count =3D 0;

	switch (words) {
	case 2:  printf("Using LDP W*, W*, [X*] instructions (2 * 32 bits)\n"); br=
eak;
	case 4:  printf("Using LDP X*, X*, [X*] instructions (2 * 64 bits)\n"); br=
eak;
	default: printf("Using LDP Q*, Q*, [X*] instructions (2 * 128 bits)\n");
	}

	for (unsigned sample =3D 0; sample < samples; sample++) {
		uint32_t v[8];

		switch (words) {
		case 2:  read_reg2(virt, v); break;
		case 4:  read_reg4(virt, v); break;
		default: read_reg8(virt, v);
		}

		unsigned cnt;
		for (cnt =3D 0; cnt < data_count; cnt++) {
			if (!memcmp(data[cnt].v, v, words * 4)) {
				data[cnt].count++;
				break;
			}
		}

		if (cnt =3D=3D data_count) { // not found yet
			if (data_count =3D=3D MAX_VALUES)
				errorx("Too many register 0x%08X values", phys);
			memcpy(data[cnt].v, v, words * 4);
			data[cnt].count =3D 1;
			data_count++;
		}
	}

	printf("addr: ");
	for (unsigned idx =3D 0; idx < words; idx++)
		printf(" %08X", phys + 4 * idx);
	printf("\n------");
	for (unsigned idx =3D 0; idx < words; idx++)
		printf("---------");
	putchar('\n');

	for (unsigned cnt =3D 0; cnt < data_count; cnt++) {
		printf("values");
		for (unsigned idx =3D 0; idx < words; idx++)
			printf(" %8X", data[cnt].v[idx]);
		printf(" count %u\n", data[cnt].count);
	}
	putchar('\n');
}

int main(int argc, char **argv)
{
	int samples =3D 100000, mipi =3D 0, reg_addr =3D 0, test_read =3D 0, test_=
read2 =3D 0, test_read4 =3D 0, test_read8 =3D 0, test_write =3D 0;
	long write_mask =3D 0xFFFFFFFF;
	struct poptOption options[] =3D {
		{"samples",       's', POPT_ARG_INT,  &samples,       0, "sample count"},
		{"mipi",          'm', POPT_ARG_INT,  &mipi,          0, "MIPI channel"},
		{"address",       'a', POPT_ARG_INT,  &reg_addr,      0, "ISP register ad=
dress"},
		{"read-test",     'r', POPT_ARG_NONE, &test_read,     0, "Perform a regis=
ter read test"},
		{"read-test2",    '2', POPT_ARG_NONE, &test_read2,    0, "Perform a 2 * 3=
2-bit register read test"},
		{"read-test4",    '4', POPT_ARG_NONE, &test_read4,    0, "Perform a 2 * 6=
4-bit register read test"},
		{"read-test8",    '8', POPT_ARG_NONE, &test_read8,    0, "Perform a 2 * 1=
28-bit register read test"},
		{"write-test",    'w', POPT_ARG_NONE, &test_write,    0, "Perform a regis=
ter write test"},
		{"write-mask",    'M', POPT_ARG_LONG, &write_mask,    0, "Value mask for =
write test", "MASK"},
		{"alt-read-mode", 'A', POPT_ARG_NONE, &alt_read,      0, "Alternate regis=
ter read mode"},
		{"verbose",       'v', POPT_ARG_NONE, &verbose,       0, "Verbose output"=
},
		{"debug",         'd', POPT_ARG_NONE, &debug,         0, "Debug output"},
		POPT_AUTOHELP
		POPT_TABLEEND
	};

	poptContext context =3D poptGetContext(NULL, argc, (const char **)argv, op=
tions, 0);
	int i =3D poptGetNextOpt(context);
	if (i < -1)
		errorx("%s: %s\n", poptBadOption(context, POPT_BADOPTION_NOALIAS), poptSt=
rerror(i));

	if (poptPeekArg(context)) {
		poptPrintUsage(context, stderr, 0);
		exit(1);
	}
	poptFreeContext(context);

	if (samples <=3D 0)
		errorx("Invalid number of samples");
	if (mipi !=3D 0 && mipi !=3D 1)
		errorx("Invalid MIPI interface index");
	if (test_read + test_read2 + test_read4 + test_read8 + test_write > 1)
		errorx("Multiple tests requested");
	if (write_mask < 1 || write_mask > 0xFFFFFFFF)
		errorx("Invalid write mask");

	int mem_fd =3D open("/dev/mem", O_RDWR | O_SYNC);
	if (mem_fd < 0)
		error("Error opening /dev/mem");

	uint32_t phys =3D mipi ? ISP2_ADDR : ISP1_ADDR;
	if (debug)
		printf("MIPI_ISP%u registers at 0x%X (size 0x%X)\n", mipi, phys, ISP_SIZE=
);
	void *virt =3D mmap(0, ISP_SIZE, test_write ? PROT_READ | PROT_WRITE : PRO=
T_READ, MAP_SHARED, mem_fd, phys);
	if (virt =3D=3D MAP_FAILED)
		error("Mmap failed");

	if (debug)
		printf("Mapped ISP registers at %p\n", virt);
	if (test_read || test_read2 || test_read4 || test_read8 || test_write) {
		if (reg_addr & 3 || reg_addr < phys || reg_addr >=3D phys + ISP_SIZE)
			errorx("Invalid ISP register address 0x%08X", reg_addr);
		virt +=3D reg_addr - phys;
		if (debug)
			printf("Register 0x%X mapped at %p\n", reg_addr, virt);
		if (test_read)
			test_reg(samples, reg_addr, virt, 0);
		else if (test_read2)
			test_reg_ldp(samples, reg_addr, virt, 2);
		else if (test_read4)
			test_reg_ldp(samples, reg_addr, virt, 4);
		else if (test_read8)
			test_reg_ldp(samples, reg_addr, virt, 8);
		else
			test_reg(samples, reg_addr, virt, write_mask);
	} else
		test_all(samples, phys + MI_OFFSET, virt + MI_OFFSET);

	return 0;
}

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

