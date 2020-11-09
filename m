Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3AC2AB261
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 09:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgKII3O convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 9 Nov 2020 03:29:14 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:37255 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgKII3O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 03:29:14 -0500
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3DCAD6000C;
        Mon,  9 Nov 2020 08:28:57 +0000 (UTC)
Date:   Mon, 9 Nov 2020 09:28:55 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Adrian Hunter <ext-adrian.hunter@nokia.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Ben Dooks <ben@simtec.co.uk>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Boris BREZILLON <b.brezillon.dev@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Brian Norris <computersforpeace@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Choudary Kalluri <punnaia@xilinx.com>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Dan Brown <dan_brown@ieee.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Dmitriy B <rzk333@gmail.com>, dri-devel@lists.freedesktop.org,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Jian Zhang <jzhang@ti.com>,
        Jochen =?UTF-8?B?U2Now6R1Ymxl?= <psionic@psionic.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-samsung-soc@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Paul Mackerras <paulus@samba.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Qiang Yu <yuq825@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Sergey Lapin <slapin@ossfans.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Gleixner <gleixner@linutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
Subject: Re: [PATCH v2 00/23] Rid W=1 warnings in MTD
Message-ID: <20201109092855.495174dc@xps13>
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lee,

Lee Jones <lee.jones@linaro.org> wrote on Fri,  6 Nov 2020 21:36:32
+0000:

> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> v1 => v2:
>   - Added tags
>   - Satisfied Miquel's review comments
> 

You probably missed my request to update the titles. That's why I
wanted the entire series to be resent. Anyway, as I forgot a few,
please find below the prefixes that should be used:

> Lee Jones (23):
>   mtd: mtdpart: Fix misdocumented function parameter 'mtd'
>   mtd: devices: phram: File headers are not good candidates for
>     kernel-doc
>   mtd: nand: onenand: onenand_base: Fix expected kernel-doc formatting

mtd: onenand: Fix...

>   mtd: devices: docg3: Fix kernel-doc 'bad line' and 'excessive doc'
>     issues
>   mtd: mtdcore: Fix misspelled function parameter 'section'

mtd: Fix...

>   mtd: nand: onenand: onenand_bbt: Fix expected kernel-doc formatting

mtd: onenand: Fix...

>   mtd: spi-nor: controllers: hisi-sfc: Demote non-conformant kernel-doc

mtd: spi-nor: hisi-sfc: Demote...

>   mtd: ubi: build: Document 'ubi_num' in struct mtd_dev_param
>   mtd: nand: spi: toshiba: Demote non-conformant kernel-doc header

mtd: spinand: toshiba: Demote...

>   mtd: ubi: kapi: Correct documentation for 'ubi_leb_read_sg's 'sgl'
>     parameter
>   mtd: ubi: eba: Fix a couple of misdocumentation issues
>   mtd: ubi: wl: Fix a couple of kernel-doc issues
>   mtd: nand: raw: brcmnand: brcmnand: Demote non-conformant kernel-doc
>     headers

mtd: rawnand: brcmnand: Demote...

>   mtd: ubi: gluebi: Fix misnamed function parameter documentation
>   mtd: nand: raw: diskonchip: Marking unused variables as
>     __always_unused

mtd: rawnand: diskonchip: Marking...

>   mtd: nand: raw: cafe_nand: Remove superfluous param doc and add
>     another

mtd: rawnand: cafe: Remove

>   mtd: nand: raw: s3c2410: Add documentation for 2 missing struct
>     members

mtd: rawnand: s3c2410: Add...

>   mtd: nand: raw: omap_elm: Finish half populated function header,
>     demote empty ones

mtd: rawnand: omap_elm: Finish

>   mtd: nand: raw: omap2: Fix a bunch of kernel-doc misdemeanours

mtd:r rawnand: omap2: Fix

>   mtd: nand: raw: sunxi_nand: Document 'sunxi_nfc's 'caps' member

mtd: rawnand: sunxi: Document

>   mtd: nand: raw: arasan-nand-controller: Document 'anfc_op's 'buf'
>     member

mtd: rawnand: arasan: Document

>   mtd: nand: onenand: onenand_base: Fix some kernel-doc misdemeanours

mtd: onenand: Fix

>   mtd: devices: powernv_flash: Add function names to headers and fix
>     'dev'

Otherwise the content of the series looks good to me.

Thanks,
Miquèl
