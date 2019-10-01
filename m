Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 330FDC3108
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 12:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729599AbfJAKNh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 06:13:37 -0400
Received: from www.linuxtv.org ([130.149.80.248]:47575 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728579AbfJAKNh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Oct 2019 06:13:37 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iFF9h-0004Ge-W0; Tue, 01 Oct 2019 10:13:18 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iFFA3-0003wO-NE; Tue, 01 Oct 2019 10:13:39 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] cx231xx: convert to vb2
Date:   Tue,  1 Oct 2019 10:13:39 +0000
Message-Id: <20191001101339.15107-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <d22f3417-9f36-c57e-ceb9-fe84364222b9@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59089/
Build log: https://builder.linuxtv.org/job/patchwork/18511/
Build time: 00:02:58
Link: https://lore.kernel.org/linux-media/d22f3417-9f36-c57e-ceb9-fe84364222b9@xs4all.nl

gpg: Signature made Tue 01 Oct 2019 10:04:58 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 1 patches and/or PDF generation with issues, being 1 at build time

Error/warnings:

drivers/staging/media/allegro-dvt/nal-h264.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/allegro-dvt/nal-h264.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/allegro-dvt/nal-h264.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/allegro-dvt/nal-h264.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/meson/vdec/esparser.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/meson/vdec/esparser.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/meson/vdec/esparser.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/meson/vdec/esparser.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/omap4iss/iss.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/omap4iss/iss.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/allegro-dvt/allegro-core.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/allegro-dvt/allegro-core.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/allegro-dvt/allegro-core.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/allegro-dvt/allegro-core.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/tegra-vde/vde.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/tegra-vde/vde.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/tegra-vde/vde.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/tegra-vde/vde.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/sunxi/cedrus/cedrus.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/sunxi/cedrus/cedrus.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/sunxi/cedrus/cedrus.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/sunxi/cedrus/cedrus.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/imx/imx-media-dev.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/imx/imx-media-dev.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/imx/imx-media-dev.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/imx/imx-media-dev.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/hantro/hantro_drv.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/hantro/hantro_drv.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/hantro/hantro_drv.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/hantro/hantro_drv.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/staging/media/imx/imx-media-dev.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/staging/media/imx/imx-media-dev.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/staging/media/imx] Error 2
make[1]: *** Waiting for unfinished jobs....
SPARSE:drivers/staging/media/meson/vdec/esparser.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/meson/vdec/esparser.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/staging/media/meson/vdec] Error 2
drivers/staging/media/ipu3/ipu3-mmu.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/ipu3/ipu3-mmu.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/ipu3/ipu3-mmu.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/ipu3/ipu3-mmu.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/staging/media/ipu3/ipu3-mmu.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/staging/media/ipu3/ipu3-mmu.o] Error 1
make[2]: *** Waiting for unfinished jobs....
drivers/staging/media/ipu3/ipu3-dmamap.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/ipu3/ipu3-dmamap.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/ipu3/ipu3-dmamap.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/ipu3/ipu3-dmamap.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/staging/media/sunxi/cedrus/cedrus.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:265: drivers/staging/media/sunxi/cedrus/cedrus.o] Error 1
make[2]: *** [scripts/Makefile.build:509: drivers/staging/media/sunxi/cedrus] Error 2
make[1]: *** [scripts/Makefile.build:509: drivers/staging/media/sunxi] Error 2
drivers/staging/media/tegra-vde/iommu.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/tegra-vde/iommu.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/tegra-vde/iommu.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/tegra-vde/iommu.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/staging/media/tegra-vde/iommu.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/tegra-vde/iommu.o] Error 1
make[2]: *** Waiting for unfinished jobs....
SPARSE:drivers/staging/media/ipu3/ipu3-dmamap.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/staging/media/ipu3/ipu3-dmamap.o] Error 1
drivers/staging/media/omap4iss/iss_csi2.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_csi2.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/omap4iss/iss_csi2.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_csi2.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/omap4iss/iss_csiphy.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_csiphy.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/omap4iss/iss_csiphy.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_csiphy.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/staging/media/tegra-vde/vde.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/tegra-vde/vde.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/staging/media/tegra-vde] Error 2
drivers/staging/media/omap4iss/iss_ipipeif.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_ipipeif.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/omap4iss/iss_ipipeif.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_ipipeif.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/staging/media/hantro/hantro_drv.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/hantro/hantro_drv.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/staging/media/hantro] Error 2
drivers/staging/media/omap4iss/iss_ipipe.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_ipipe.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/omap4iss/iss_ipipe.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_ipipe.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/staging/media/allegro-dvt/allegro-core.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/allegro-dvt/allegro-core.o] Error 1
make[2]: *** Waiting for unfinished jobs....
drivers/staging/media/omap4iss/iss_resizer.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_resizer.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/omap4iss/iss_resizer.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_resizer.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/staging/media/allegro-dvt/nal-h264.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/allegro-dvt/nal-h264.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/staging/media/allegro-dvt] Error 2
drivers/staging/media/omap4iss/iss_video.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_video.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/omap4iss/iss_video.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_video.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/staging/media/omap4iss/iss_ipipe.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/omap4iss/iss_ipipe.o] Error 1
make[2]: *** Waiting for unfinished jobs....
SPARSE:drivers/staging/media/omap4iss/iss_ipipeif.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/omap4iss/iss_ipipeif.o] Error 1
SPARSE:drivers/staging/media/omap4iss/iss_video.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/omap4iss/iss_video.o] Error 1
SPARSE:drivers/staging/media/omap4iss/iss_resizer.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/omap4iss/iss_resizer.o] Error 1
SPARSE:drivers/staging/media/omap4iss/iss_csiphy.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/omap4iss/iss_csiphy.o] Error 1
SPARSE:drivers/staging/media/omap4iss/iss_csi2.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/omap4iss/iss_csi2.o] Error 1
SPARSE:drivers/staging/media/omap4iss/iss.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/omap4iss/iss.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/staging/media/omap4iss] Error 2
SPARSE:drivers/staging/media/ipu3/ipu3-tables.c ./include/linux/bitops.h:4:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/staging/media/ipu3/ipu3-tables.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/staging/media/ipu3] Error 2
make: *** [Makefile:1670: drivers/staging/media] Error 2

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/staging/media
drivers/media/cec/cec-core.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/cec/cec-core.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/cec/cec-core.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/cec/cec-core.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/mc/mc-device.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/mc/mc-device.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/mc/mc-device.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/mc/mc-device.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/mmc/siano/smssdio.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/mmc/siano/smssdio.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/mmc/siano/smssdio.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/mmc/siano/smssdio.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/firewire/firedtv-avc.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/firewire/firedtv-avc.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/firewire/firedtv-avc.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/firewire/firedtv-avc.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/mmc/siano/smssdio.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/mmc/siano/smssdio.o] Error 1
make[2]: *** [scripts/Makefile.build:509: drivers/media/mmc/siano] Error 2
make[1]: *** [scripts/Makefile.build:509: drivers/media/mmc] Error 2
make[1]: *** Waiting for unfinished jobs....
drivers/media/dvb-core/dvbdev.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/dvb-core/dvbdev.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/dvb-core/dvbdev.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/dvb-core/dvbdev.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/pci/b2c2/flexcop-dma.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/pci/b2c2/flexcop-dma.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/pci/b2c2/flexcop-dma.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/pci/b2c2/flexcop-dma.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/common/b2c2/flexcop.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/common/b2c2/flexcop.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/common/b2c2/flexcop.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/common/b2c2/flexcop.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/pci/b2c2/flexcop-dma.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:265: drivers/media/pci/b2c2/flexcop-dma.o] Error 1
make[2]: *** [scripts/Makefile.build:509: drivers/media/pci/b2c2] Error 2
make[1]: *** [scripts/Makefile.build:509: drivers/media/pci] Error 2
drivers/media/dvb-frontends/dvb-pll.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/dvb-frontends/dvb-pll.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/dvb-frontends/dvb-pll.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/dvb-frontends/dvb-pll.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/dvb-core/dmxdev.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/dvb-core/dmxdev.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/dvb-core/dmxdev.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/dvb-core/dmxdev.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/common/b2c2/flexcop.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/common/b2c2/flexcop.o] Error 1
make[2]: *** [scripts/Makefile.build:509: drivers/media/common/b2c2] Error 2
make[1]: *** [scripts/Makefile.build:509: drivers/media/common] Error 2
drivers/media/i2c/msp3400-driver.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/msp3400-driver.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/msp3400-driver.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/msp3400-driver.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/dvb-frontends/dvb-pll.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/dvb-frontends/dvb-pll.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/media/dvb-frontends] Error 2
SPARSE:drivers/media/cec/cec-core.c ./include/uapi/linux/errno.h:1:11:  error: unable to open 'asm/errno.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/cec/cec-core.o] Error 1
drivers/media/mc/mc-devnode.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/mc/mc-devnode.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
make[1]: *** [scripts/Makefile.build:509: drivers/media/cec] Error 2
drivers/media/mc/mc-devnode.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/mc/mc-devnode.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/dvb-core/dvb_demux.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/dvb-core/dvb_demux.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/dvb-core/dvb_demux.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/dvb-core/dvb_demux.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/mc/mc-device.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/mc/mc-device.o] Error 1
make[2]: *** Waiting for unfinished jobs....
drivers/media/mc/mc-entity.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/mc/mc-entity.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/mc/mc-entity.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/mc/mc-entity.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/mc/mc-devnode.c ./include/uapi/linux/errno.h:1:11:  error: unable to open 'asm/errno.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/mc/mc-devnode.o] Error 1
drivers/media/mc/mc-request.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/mc/mc-request.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/mc/mc-request.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/mc/mc-request.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/dvb-core/dvbdev.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/dvb-core/dvbdev.o] Error 1
make[2]: *** Waiting for unfinished jobs....
SPARSE:drivers/media/firewire/firedtv-avc.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/media/firewire/firedtv-avc.o] Error 1
make[2]: *** Waiting for unfinished jobs....
SPARSE:drivers/media/dvb-core/dmxdev.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/dvb-core/dmxdev.o] Error 1
drivers/media/firewire/firedtv-ci.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/firewire/firedtv-ci.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/firewire/firedtv-ci.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/firewire/firedtv-ci.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/dvb-core/dvb_demux.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/dvb-core/dvb_demux.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/media/dvb-core] Error 2
drivers/media/firewire/firedtv-dvb.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/firewire/firedtv-dvb.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/firewire/firedtv-dvb.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/firewire/firedtv-dvb.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/firewire/firedtv-ci.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/firewire/firedtv-ci.o] Error 1
SPARSE:drivers/media/mc/mc-request.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/mc/mc-request.o] Error 1
drivers/media/i2c/msp3400-kthreads.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/msp3400-kthreads.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/msp3400-kthreads.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/msp3400-kthreads.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/firewire/firedtv-dvb.c ./include/linux/bitops.h:4:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/firewire/firedtv-dvb.o] Error 1
drivers/media/firewire/firedtv-fe.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/firewire/firedtv-fe.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/firewire/firedtv-fe.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/firewire/firedtv-fe.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/i2c/adv748x/adv748x-core.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/adv748x/adv748x-core.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/adv748x/adv748x-core.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/adv748x/adv748x-core.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/i2c/adv748x/adv748x-afe.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/adv748x/adv748x-afe.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/adv748x/adv748x-afe.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/adv748x/adv748x-afe.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/i2c/adv748x/adv748x-csi2.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/adv748x/adv748x-csi2.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/adv748x/adv748x-csi2.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/adv748x/adv748x-csi2.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/i2c/adv748x/adv748x-hdmi.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/adv748x/adv748x-hdmi.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/adv748x/adv748x-hdmi.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/adv748x/adv748x-hdmi.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/firewire/firedtv-fe.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/firewire/firedtv-fe.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/media/firewire] Error 2
SPARSE:drivers/media/mc/mc-entity.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/mc/mc-entity.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/media/mc] Error 2
SPARSE:drivers/media/i2c/msp3400-driver.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/i2c/msp3400-driver.o] Error 1
make[2]: *** Waiting for unfinished jobs....
drivers/media/i2c/cx25840/cx25840-core.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-core.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/cx25840/cx25840-core.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-core.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/i2c/adv748x/adv748x-csi2.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/adv748x/adv748x-csi2.o] Error 1
make[3]: *** Waiting for unfinished jobs....
SPARSE:drivers/media/i2c/adv748x/adv748x-afe.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/adv748x/adv748x-afe.o] Error 1
drivers/media/i2c/cx25840/cx25840-audio.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-audio.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/cx25840/cx25840-audio.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-audio.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/i2c/cx25840/cx25840-vbi.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-vbi.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/cx25840/cx25840-vbi.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-vbi.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/i2c/cx25840/cx25840-firmware.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-firmware.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/cx25840/cx25840-firmware.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-firmware.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/i2c/msp3400-kthreads.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/i2c/msp3400-kthreads.o] Error 1
SPARSE:drivers/media/i2c/adv748x/adv748x-hdmi.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/adv748x/adv748x-hdmi.o] Error 1
drivers/media/i2c/cx25840/cx25840-ir.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-ir.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/cx25840/cx25840-ir.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-ir.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/i2c/cx25840/cx25840-audio.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/cx25840/cx25840-audio.o] Error 1
make[3]: *** Waiting for unfinished jobs....
SPARSE:drivers/media/i2c/cx25840/cx25840-firmware.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/cx25840/cx25840-firmware.o] Error 1
SPARSE:drivers/media/i2c/cx25840/cx25840-vbi.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/cx25840/cx25840-vbi.o] Error 1
SPARSE:drivers/media/i2c/cx25840/cx25840-ir.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/cx25840/cx25840-ir.o] Error 1
SPARSE:drivers/media/i2c/adv748x/adv748x-core.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/adv748x/adv748x-core.o] Error 1
make[2]: *** [scripts/Makefile.build:509: drivers/media/i2c/adv748x] Error 2
SPARSE:drivers/media/i2c/cx25840/cx25840-core.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/cx25840/cx25840-core.o] Error 1
make[2]: *** [scripts/Makefile.build:509: drivers/media/i2c/cx25840] Error 2
make[1]: *** [scripts/Makefile.build:509: drivers/media/i2c] Error 2
make: *** [Makefile:1670: drivers/media] Error 2

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/media
drivers/staging/media/allegro-dvt/nal-h264.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/allegro-dvt/nal-h264.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/allegro-dvt/nal-h264.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/allegro-dvt/nal-h264.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/allegro-dvt/allegro-core.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/allegro-dvt/allegro-core.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/allegro-dvt/allegro-core.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/allegro-dvt/allegro-core.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/meson/vdec/esparser.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/meson/vdec/esparser.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/meson/vdec/esparser.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/meson/vdec/esparser.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/tegra-vde/vde.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/tegra-vde/vde.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/tegra-vde/vde.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/tegra-vde/vde.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/omap4iss/iss.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/omap4iss/iss.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/sunxi/cedrus/cedrus.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/sunxi/cedrus/cedrus.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/sunxi/cedrus/cedrus.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/sunxi/cedrus/cedrus.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/imx/imx-media-dev.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/imx/imx-media-dev.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/imx/imx-media-dev.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/imx/imx-media-dev.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/hantro/hantro_drv.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/hantro/hantro_drv.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/hantro/hantro_drv.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/hantro/hantro_drv.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/staging/media/imx/imx-media-dev.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/staging/media/imx/imx-media-dev.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/staging/media/imx] Error 2
make[1]: *** Waiting for unfinished jobs....
drivers/staging/media/ipu3/ipu3-mmu.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/ipu3/ipu3-mmu.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
SPARSE:drivers/staging/media/meson/vdec/esparser.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
drivers/staging/media/ipu3/ipu3-mmu.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/ipu3/ipu3-mmu.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
make[2]: *** [scripts/Makefile.build:265: drivers/staging/media/meson/vdec/esparser.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/staging/media/meson/vdec] Error 2
drivers/staging/media/ipu3/ipu3-dmamap.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/ipu3/ipu3-dmamap.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/ipu3/ipu3-dmamap.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/ipu3/ipu3-dmamap.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/staging/media/ipu3/ipu3-mmu.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/staging/media/ipu3/ipu3-mmu.o] Error 1
make[2]: *** Waiting for unfinished jobs....
SPARSE:drivers/staging/media/ipu3/ipu3-dmamap.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/staging/media/ipu3/ipu3-dmamap.o] Error 1
SPARSE:drivers/staging/media/sunxi/cedrus/cedrus.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:265: drivers/staging/media/sunxi/cedrus/cedrus.o] Error 1
make[2]: *** [scripts/Makefile.build:509: drivers/staging/media/sunxi/cedrus] Error 2
make[1]: *** [scripts/Makefile.build:509: drivers/staging/media/sunxi] Error 2
drivers/staging/media/tegra-vde/iommu.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/tegra-vde/iommu.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/tegra-vde/iommu.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/tegra-vde/iommu.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/tegra-vde/dmabuf-cache.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/tegra-vde/dmabuf-cache.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/tegra-vde/dmabuf-cache.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/tegra-vde/dmabuf-cache.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/staging/media/tegra-vde/iommu.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/tegra-vde/iommu.o] Error 1
make[2]: *** Waiting for unfinished jobs....
SPARSE:drivers/staging/media/tegra-vde/dmabuf-cache.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/tegra-vde/dmabuf-cache.o] Error 1
drivers/staging/media/hantro/hantro_v4l2.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/hantro/hantro_v4l2.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/hantro/hantro_v4l2.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/hantro/hantro_v4l2.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/hantro/hantro_h1_jpeg_enc.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/hantro/hantro_h1_jpeg_enc.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/hantro/hantro_h1_jpeg_enc.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/hantro/hantro_h1_jpeg_enc.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/hantro/hantro_g1_h264_dec.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/hantro/hantro_g1_h264_dec.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/hantro/hantro_g1_h264_dec.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/hantro/hantro_g1_h264_dec.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/staging/media/hantro/hantro_h1_jpeg_enc.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/staging/media/hantro/hantro_h1_jpeg_enc.o] Error 1
make[2]: *** Waiting for unfinished jobs....
SPARSE:drivers/staging/media/tegra-vde/vde.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/tegra-vde/vde.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/staging/media/tegra-vde] Error 2
SPARSE:drivers/staging/media/hantro/hantro_v4l2.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/staging/media/hantro/hantro_v4l2.o] Error 1
SPARSE:drivers/staging/media/hantro/hantro_drv.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/staging/media/hantro/hantro_drv.o] Error 1
SPARSE:drivers/staging/media/hantro/hantro_g1_h264_dec.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/staging/media/hantro/hantro_g1_h264_dec.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/staging/media/hantro] Error 2
drivers/staging/media/omap4iss/iss_csiphy.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_csiphy.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/omap4iss/iss_csiphy.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_csiphy.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/omap4iss/iss_csi2.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_csi2.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/omap4iss/iss_csi2.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_csi2.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/omap4iss/iss_ipipeif.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_ipipeif.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/omap4iss/iss_ipipeif.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_ipipeif.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/omap4iss/iss_ipipe.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_ipipe.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/omap4iss/iss_ipipe.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_ipipe.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/staging/media/allegro-dvt/allegro-core.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/allegro-dvt/allegro-core.o] Error 1
make[2]: *** Waiting for unfinished jobs....
SPARSE:drivers/staging/media/allegro-dvt/nal-h264.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/allegro-dvt/nal-h264.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/staging/media/allegro-dvt] Error 2
drivers/staging/media/omap4iss/iss_resizer.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_resizer.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/omap4iss/iss_resizer.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_resizer.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/staging/media/omap4iss/iss_video.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_video.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/staging/media/omap4iss/iss_video.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/staging/media/omap4iss/iss_video.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/staging/media/omap4iss/iss_ipipe.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/omap4iss/iss_ipipe.o] Error 1
make[2]: *** Waiting for unfinished jobs....
SPARSE:drivers/staging/media/omap4iss/iss_video.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/omap4iss/iss_video.o] Error 1
SPARSE:drivers/staging/media/omap4iss/iss_ipipeif.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/omap4iss/iss_ipipeif.o] Error 1
SPARSE:drivers/staging/media/omap4iss/iss_resizer.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/omap4iss/iss_resizer.o] Error 1
SPARSE:drivers/staging/media/omap4iss/iss_csiphy.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/omap4iss/iss_csiphy.o] Error 1
SPARSE:drivers/staging/media/omap4iss/iss.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/omap4iss/iss.o] Error 1
SPARSE:drivers/staging/media/omap4iss/iss_csi2.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/staging/media/omap4iss/iss_csi2.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/staging/media/omap4iss] Error 2
SPARSE:drivers/staging/media/ipu3/ipu3-tables.c ./include/linux/bitops.h:4:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/staging/media/ipu3/ipu3-tables.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/staging/media/ipu3] Error 2
make: *** [Makefile:1670: drivers/staging/media] Error 2

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/staging/media
drivers/media/cec/cec-core.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/cec/cec-core.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/cec/cec-core.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/cec/cec-core.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/mc/mc-device.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/mc/mc-device.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/mc/mc-device.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/mc/mc-device.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/dvb-core/dvbdev.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/dvb-core/dvbdev.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/dvb-core/dvbdev.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/dvb-core/dvbdev.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/firewire/firedtv-avc.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/firewire/firedtv-avc.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/firewire/firedtv-avc.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/firewire/firedtv-avc.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/mmc/siano/smssdio.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/mmc/siano/smssdio.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/mmc/siano/smssdio.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/mmc/siano/smssdio.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/pci/b2c2/flexcop-dma.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/pci/b2c2/flexcop-dma.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/pci/b2c2/flexcop-dma.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/pci/b2c2/flexcop-dma.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/common/b2c2/flexcop.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/common/b2c2/flexcop.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/common/b2c2/flexcop.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/common/b2c2/flexcop.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/pci/b2c2/flexcop-dma.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:265: drivers/media/pci/b2c2/flexcop-dma.o] Error 1
make[2]: *** [scripts/Makefile.build:509: drivers/media/pci/b2c2] Error 2
make[1]: *** [scripts/Makefile.build:509: drivers/media/pci] Error 2
make[1]: *** Waiting for unfinished jobs....
SPARSE:drivers/media/mmc/siano/smssdio.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/mmc/siano/smssdio.o] Error 1
make[2]: *** [scripts/Makefile.build:509: drivers/media/mmc/siano] Error 2
make[1]: *** [scripts/Makefile.build:509: drivers/media/mmc] Error 2
drivers/media/dvb-frontends/dvb-pll.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/dvb-frontends/dvb-pll.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/dvb-frontends/dvb-pll.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/dvb-frontends/dvb-pll.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/i2c/msp3400-driver.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/msp3400-driver.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/msp3400-driver.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/msp3400-driver.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/common/b2c2/flexcop.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:265: drivers/media/common/b2c2/flexcop.o] Error 1
make[2]: *** [scripts/Makefile.build:509: drivers/media/common/b2c2] Error 2
make[1]: *** [scripts/Makefile.build:509: drivers/media/common] Error 2
drivers/media/dvb-frontends/stv0299.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/dvb-frontends/stv0299.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/dvb-frontends/stv0299.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/dvb-frontends/stv0299.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/dvb-frontends/dvb-pll.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/media/dvb-frontends/dvb-pll.o] Error 1
make[2]: *** Waiting for unfinished jobs....
drivers/media/dvb-frontends/stb0899_drv.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/dvb-frontends/stb0899_drv.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/dvb-frontends/stb0899_drv.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/dvb-frontends/stb0899_drv.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/firewire/firedtv-avc.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/firewire/firedtv-avc.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/media/firewire] Error 2
drivers/media/dvb-frontends/stb0899_algo.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/dvb-frontends/stb0899_algo.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/dvb-frontends/stb0899_algo.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/dvb-frontends/stb0899_algo.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/cec/cec-core.c ./include/uapi/linux/errno.h:1:11:  error: unable to open 'asm/errno.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/cec/cec-core.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/media/cec] Error 2
drivers/media/mc/mc-devnode.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/mc/mc-devnode.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/mc/mc-devnode.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/mc/mc-devnode.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/dvb-core/dvbdev.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/media/dvb-core/dvbdev.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/media/dvb-core] Error 2
drivers/media/mc/mc-entity.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/mc/mc-entity.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/mc/mc-entity.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/mc/mc-entity.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/mc/mc-device.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/mc/mc-device.o] Error 1
make[2]: *** Waiting for unfinished jobs....
drivers/media/mc/mc-request.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/mc/mc-request.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/mc/mc-request.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/mc/mc-request.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/dvb-frontends/stv0299.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/media/dvb-frontends/stv0299.o] Error 1
SPARSE:drivers/media/mc/mc-devnode.c ./include/uapi/linux/errno.h:1:11:  error: unable to open 'asm/errno.h'
drivers/media/mc/mc-dev-allocator.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/mc/mc-dev-allocator.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
make[2]: *** [scripts/Makefile.build:266: drivers/media/mc/mc-devnode.o] Error 1
drivers/media/mc/mc-dev-allocator.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/mc/mc-dev-allocator.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/mc/mc-dev-allocator.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/mc/mc-dev-allocator.o] Error 1
drivers/media/i2c/msp3400-kthreads.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/msp3400-kthreads.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/msp3400-kthreads.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/msp3400-kthreads.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/i2c/cx25840/cx25840-core.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-core.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/cx25840/cx25840-core.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-core.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/mc/mc-request.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/mc/mc-request.o] Error 1
drivers/media/i2c/adv748x/adv748x-afe.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/adv748x/adv748x-afe.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/adv748x/adv748x-afe.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/adv748x/adv748x-afe.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/i2c/msp3400-driver.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/i2c/msp3400-driver.o] Error 1
make[2]: *** Waiting for unfinished jobs....
drivers/media/i2c/adv748x/adv748x-core.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/adv748x/adv748x-core.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/adv748x/adv748x-core.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/adv748x/adv748x-core.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/dvb-frontends/stb0899_algo.c ./include/linux/bitops.h:4:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/media/dvb-frontends/stb0899_algo.o] Error 1
SPARSE:drivers/media/mc/mc-entity.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:266: drivers/media/mc/mc-entity.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/media/mc] Error 2
drivers/media/i2c/adv748x/adv748x-csi2.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/adv748x/adv748x-csi2.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/adv748x/adv748x-csi2.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/adv748x/adv748x-csi2.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/dvb-frontends/stb0899_drv.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[2]: *** [scripts/Makefile.build:265: drivers/media/dvb-frontends/stb0899_drv.o] Error 1
make[1]: *** [scripts/Makefile.build:509: drivers/media/dvb-frontends] Error 2
SPARSE:drivers/media/i2c/adv748x/adv748x-afe.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/adv748x/adv748x-afe.o] Error 1
make[3]: *** Waiting for unfinished jobs....
drivers/media/i2c/adv748x/adv748x-hdmi.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/adv748x/adv748x-hdmi.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/adv748x/adv748x-hdmi.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/adv748x/adv748x-hdmi.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/i2c/cx25840/cx25840-firmware.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-firmware.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/cx25840/cx25840-firmware.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-firmware.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
drivers/media/i2c/cx25840/cx25840-audio.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-audio.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/cx25840/cx25840-audio.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-audio.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/i2c/adv748x/adv748x-csi2.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/adv748x/adv748x-csi2.o] Error 1
SPARSE:drivers/media/i2c/cx25840/cx25840-firmware.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
SPARSE:drivers/media/i2c/msp3400-kthreads.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/cx25840/cx25840-firmware.o] Error 1
make[2]: *** [scripts/Makefile.build:266: drivers/media/i2c/msp3400-kthreads.o] Error 1
make[3]: *** Waiting for unfinished jobs....
drivers/media/i2c/cx25840/cx25840-ir.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-ir.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/cx25840/cx25840-ir.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-ir.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/i2c/cx25840/cx25840-audio.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/cx25840/cx25840-audio.o] Error 1
drivers/media/i2c/cx25840/cx25840-vbi.c:./include/linux/sched.h:595:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-vbi.c:./include/linux/sched.h:595:73: error: invalid named zero-width bitfield `value'
drivers/media/i2c/cx25840/cx25840-vbi.c:./include/linux/sched.h:596:43: error: bad integer constant expression
drivers/media/i2c/cx25840/cx25840-vbi.c:./include/linux/sched.h:596:67: error: invalid named zero-width bitfield `bucket_id'
SPARSE:drivers/media/i2c/adv748x/adv748x-hdmi.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/adv748x/adv748x-hdmi.o] Error 1
SPARSE:drivers/media/i2c/cx25840/cx25840-vbi.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/cx25840/cx25840-vbi.o] Error 1
SPARSE:drivers/media/i2c/cx25840/cx25840-ir.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/cx25840/cx25840-ir.o] Error 1
SPARSE:drivers/media/i2c/adv748x/adv748x-core.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/adv748x/adv748x-core.o] Error 1
make[2]: *** [scripts/Makefile.build:509: drivers/media/i2c/adv748x] Error 2
SPARSE:drivers/media/i2c/cx25840/cx25840-core.c ./include/uapi/linux/types.h:5:11:  error: unable to open 'asm/types.h'
make[3]: *** [scripts/Makefile.build:266: drivers/media/i2c/cx25840/cx25840-core.o] Error 1
make[2]: *** [scripts/Makefile.build:509: drivers/media/i2c/cx25840] Error 2
make[1]: *** [scripts/Makefile.build:509: drivers/media/i2c] Error 2
make: *** [Makefile:1670: drivers/media] Error 2

Error #512 when running make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=compile_checks M=drivers/media
Warning: Documentation/devicetree/bindings/cpu/cpu-topology.txt references a file that doesn't exist: Documentation/devicetree/bindings/riscv/cpus.txt
Warning: Documentation/devicetree/bindings/timer/ingenic,tcu.txt references a file that doesn't exist: Documentation/mips/ingenic-tcu.txt
Warning: Documentation/devicetree/bindings/usb/amlogic,dwc3.txt references a file that doesn't exist: Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
Warning: Documentation/devicetree/bindings/usb/amlogic,dwc3.txt references a file that doesn't exist: Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
Warning: Documentation/driver-api/gpio/driver.rst references a file that doesn't exist: Documentation/driver-model/design-patterns.txt
Warning: Documentation/hwmon/inspur-ipsps1.rst references a file that doesn't exist: Documentation/i2c/instantiating-devices
Warning: Documentation/mips/ingenic-tcu.rst references a file that doesn't exist: Documentation/devicetree/bindings/mfd/ingenic,tcu.txt
Warning: Documentation/networking/device_drivers/mellanox/mlx5.rst references a file that doesn't exist: Documentation/trace/ftrase.rst
Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/j1939.txt
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
Warning: MAINTAINERS references a file that doesn't exist: Documentation/misc-devices/xilinx_sdfec.rst
Warning: drivers/media/v4l2-core/v4l2-fwnode.c references a file that doesn't exist: Documentation/acpi/dsd
Warning: drivers/net/ethernet/faraday/ftgmac100.c references a file that doesn't exist: Documentation/networking/phy.txt
Warning: drivers/net/ethernet/pensando/ionic/ionic_if.h references a file that doesn't exist: Documentation/networking/checksum-
Warning: fs/cifs/cifsfs.c references a file that doesn't exist: Documentation/workqueue.txt

