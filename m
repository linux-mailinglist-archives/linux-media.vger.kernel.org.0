Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C3E224FD2
	for <lists+linux-media@lfdr.de>; Sun, 19 Jul 2020 07:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgGSFkx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Jul 2020 01:40:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:44992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgGSFkx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Jul 2020 01:40:53 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCE8820734;
        Sun, 19 Jul 2020 05:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595137251;
        bh=O2zxmvqXQCGVdbveF7s+vXFAkhcI7jUOrG1xBYwB7uY=;
        h=From:To:Cc:Subject:Date:From;
        b=AloXYMxNu2skO9C6OEkrEpQNGd9J0cB2jDM5Ys0Or/6fkLlm2lMuANXP/DhecNO7L
         mcn2TGSqOv/uv31eqgDui/1KRkB7rsNE+9Jvvj9cbAOc2VRV1BgTiKysNPjHEutqLl
         ZTJ5ESMnQta3xzyReM23Pj1V1zI/XiKrcT/ixjEk=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1jx248-007nUq-98; Sun, 19 Jul 2020 07:40:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH] media: atomisp: move system_local consts into a C file
Date:   Sun, 19 Jul 2020 07:40:47 +0200
Message-Id: <955bf4d69923df789bd913e988d1486e4f7476ab.1595137236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of declaring all those consts everywhere when the
headers are included, just place them on a single place.

This change shuts up lots of warnings when built with W=1:

In file included from drivers/staging/media/atomisp/pci/ia_css_acc_types.h:23,
                 from drivers/staging/media/atomisp/pci/ia_css.h:26,
                 from drivers/staging/media/atomisp/pci/atomisp_compat_css20.h:24,
                 from drivers/staging/media/atomisp/pci/atomisp_compat.h:22,
                 from drivers/staging/media/atomisp/pci/atomisp_drvfs.c:23:
./drivers/staging/media/atomisp//pci/system_local.h:193:26: warning: ‘STREAM2MMIO_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  193 | static const hrt_address STREAM2MMIO_CTRL_BASE[N_STREAM2MMIO_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:186:26: warning: ‘PIXELGEN_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  186 | static const hrt_address PIXELGEN_CTRL_BASE[N_PIXELGEN_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:179:26: warning: ‘CSI_RX_BE_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  179 | static const hrt_address CSI_RX_BE_CTRL_BASE[N_CSI_RX_BACKEND_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:172:26: warning: ‘CSI_RX_FE_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  172 | static const hrt_address CSI_RX_FE_CTRL_BASE[N_CSI_RX_FRONTEND_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:165:26: warning: ‘ISYS_IRQ_BASE’ defined but not used [-Wunused-const-variable=]
  165 | static const hrt_address ISYS_IRQ_BASE[N_ISYS_IRQ_ID] = {
      |                          ^~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:158:26: warning: ‘IBUF_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  158 | static const hrt_address IBUF_CTRL_BASE[N_IBUF_CTRL_ID] = {
      |                          ^~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:153:26: warning: ‘RX_BASE’ defined but not used [-Wunused-const-variable=]
  153 | static const hrt_address RX_BASE[N_RX_ID] = {
      |                          ^~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:138:26: warning: ‘INPUT_SYSTEM_BASE’ defined but not used [-Wunused-const-variable=]
  138 | static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
      |                          ^~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:130:26: warning: ‘INPUT_FORMATTER_BASE’ defined but not used [-Wunused-const-variable=]
  130 | static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:125:26: warning: ‘TIMED_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  125 | static const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
      |                          ^~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:120:26: warning: ‘GPIO_BASE’ defined but not used [-Wunused-const-variable=]
  120 | static const hrt_address GPIO_BASE[N_GPIO_ID] = {
      |                          ^~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:116:26: warning: ‘GP_TIMER_BASE’ defined but not used [-Wunused-const-variable=]
  116 | static const hrt_address GP_TIMER_BASE =
      |                          ^~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:109:26: warning: ‘GP_DEVICE_BASE’ defined but not used [-Wunused-const-variable=]
  109 | static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
      |                          ^~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:96:26: warning: ‘FIFO_MONITOR_BASE’ defined but not used [-Wunused-const-variable=]
   96 | static const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] = {
      |                          ^~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:90:26: warning: ‘GDC_BASE’ defined but not used [-Wunused-const-variable=]
   90 | static const hrt_address GDC_BASE[N_GDC_ID] = {
      |                          ^~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:78:26: warning: ‘IRQ_BASE’ defined but not used [-Wunused-const-variable=]
   78 | static const hrt_address IRQ_BASE[N_IRQ_ID] = {
      |                          ^~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:73:26: warning: ‘ISYS2401_DMA_BASE’ defined but not used [-Wunused-const-variable=]
   73 | static const hrt_address ISYS2401_DMA_BASE[N_ISYS2401_DMA_ID] = {
      |                          ^~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:69:26: warning: ‘DMA_BASE’ defined but not used [-Wunused-const-variable=]
   69 | static const hrt_address DMA_BASE[N_DMA_ID] = {
      |                          ^~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:63:26: warning: ‘MMU_BASE’ defined but not used [-Wunused-const-variable=]
   63 | static const hrt_address MMU_BASE[N_MMU_ID] = {
      |                          ^~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:54:26: warning: ‘SP_DMEM_BASE’ defined but not used [-Wunused-const-variable=]
   54 | static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
      |                          ^~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:50:26: warning: ‘SP_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
   50 | static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
      |                          ^~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:45:26: warning: ‘ISP_BAMEM_BASE’ defined but not used [-Wunused-const-variable=]
   45 | static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
      |                          ^~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:41:26: warning: ‘ISP_DMEM_BASE’ defined but not used [-Wunused-const-variable=]
   41 | static const hrt_address ISP_DMEM_BASE[N_ISP_ID] = {
      |                          ^~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:37:26: warning: ‘ISP_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
   37 | static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
      |                          ^~~~~~~~~~~~~
In file included from drivers/staging/media/atomisp/pci/ia_css_acc_types.h:23,
                 from drivers/staging/media/atomisp/pci/ia_css.h:26,
                 from drivers/staging/media/atomisp/pci/atomisp_file.c:27:
./drivers/staging/media/atomisp//pci/system_local.h:193:26: warning: ‘STREAM2MMIO_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  193 | static const hrt_address STREAM2MMIO_CTRL_BASE[N_STREAM2MMIO_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:186:26: warning: ‘PIXELGEN_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  186 | static const hrt_address PIXELGEN_CTRL_BASE[N_PIXELGEN_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:179:26: warning: ‘CSI_RX_BE_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  179 | static const hrt_address CSI_RX_BE_CTRL_BASE[N_CSI_RX_BACKEND_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:172:26: warning: ‘CSI_RX_FE_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  172 | static const hrt_address CSI_RX_FE_CTRL_BASE[N_CSI_RX_FRONTEND_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:165:26: warning: ‘ISYS_IRQ_BASE’ defined but not used [-Wunused-const-variable=]
  165 | static const hrt_address ISYS_IRQ_BASE[N_ISYS_IRQ_ID] = {
      |                          ^~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:158:26: warning: ‘IBUF_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  158 | static const hrt_address IBUF_CTRL_BASE[N_IBUF_CTRL_ID] = {
      |                          ^~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:153:26: warning: ‘RX_BASE’ defined but not used [-Wunused-const-variable=]
  153 | static const hrt_address RX_BASE[N_RX_ID] = {
      |                          ^~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:138:26: warning: ‘INPUT_SYSTEM_BASE’ defined but not used [-Wunused-const-variable=]
  138 | static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
      |                          ^~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:130:26: warning: ‘INPUT_FORMATTER_BASE’ defined but not used [-Wunused-const-variable=]
  130 | static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:125:26: warning: ‘TIMED_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  125 | static const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
      |                          ^~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:120:26: warning: ‘GPIO_BASE’ defined but not used [-Wunused-const-variable=]
  120 | static const hrt_address GPIO_BASE[N_GPIO_ID] = {
      |                          ^~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:116:26: warning: ‘GP_TIMER_BASE’ defined but not used [-Wunused-const-variable=]
  116 | static const hrt_address GP_TIMER_BASE =
      |                          ^~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:109:26: warning: ‘GP_DEVICE_BASE’ defined but not used [-Wunused-const-variable=]
  109 | static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
      |                          ^~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:96:26: warning: ‘FIFO_MONITOR_BASE’ defined but not used [-Wunused-const-variable=]
   96 | static const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] = {
      |                          ^~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:90:26: warning: ‘GDC_BASE’ defined but not used [-Wunused-const-variable=]
   90 | static const hrt_address GDC_BASE[N_GDC_ID] = {
      |                          ^~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:78:26: warning: ‘IRQ_BASE’ defined but not used [-Wunused-const-variable=]
   78 | static const hrt_address IRQ_BASE[N_IRQ_ID] = {
      |                          ^~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:73:26: warning: ‘ISYS2401_DMA_BASE’ defined but not used [-Wunused-const-variable=]
   73 | static const hrt_address ISYS2401_DMA_BASE[N_ISYS2401_DMA_ID] = {
      |                          ^~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:69:26: warning: ‘DMA_BASE’ defined but not used [-Wunused-const-variable=]
   69 | static const hrt_address DMA_BASE[N_DMA_ID] = {
      |                          ^~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:63:26: warning: ‘MMU_BASE’ defined but not used [-Wunused-const-variable=]
   63 | static const hrt_address MMU_BASE[N_MMU_ID] = {
      |                          ^~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:54:26: warning: ‘SP_DMEM_BASE’ defined but not used [-Wunused-const-variable=]
   54 | static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
      |                          ^~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:50:26: warning: ‘SP_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
   50 | static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
      |                          ^~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:45:26: warning: ‘ISP_BAMEM_BASE’ defined but not used [-Wunused-const-variable=]
   45 | static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
      |                          ^~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:41:26: warning: ‘ISP_DMEM_BASE’ defined but not used [-Wunused-const-variable=]
   41 | static const hrt_address ISP_DMEM_BASE[N_ISP_ID] = {
      |                          ^~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:37:26: warning: ‘ISP_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
   37 | static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
      |                          ^~~~~~~~~~~~~
In file included from ./drivers/staging/media/atomisp//pci/ia_css_acc_types.h:23,
                 from ./drivers/staging/media/atomisp//pci/ia_css_pipe_public.h:29,
                 from drivers/staging/media/atomisp/pci/sh_css_legacy.h:23,
                 from drivers/staging/media/atomisp/pci/atomisp_internal.h:34,
                 from drivers/staging/media/atomisp/pci/atomisp_cmd.h:30,
                 from drivers/staging/media/atomisp/pci/atomisp_csi2.c:21:
./drivers/staging/media/atomisp//pci/system_local.h:193:26: warning: ‘STREAM2MMIO_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  193 | static const hrt_address STREAM2MMIO_CTRL_BASE[N_STREAM2MMIO_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:186:26: warning: ‘PIXELGEN_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  186 | static const hrt_address PIXELGEN_CTRL_BASE[N_PIXELGEN_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:179:26: warning: ‘CSI_RX_BE_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  179 | static const hrt_address CSI_RX_BE_CTRL_BASE[N_CSI_RX_BACKEND_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:172:26: warning: ‘CSI_RX_FE_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  172 | static const hrt_address CSI_RX_FE_CTRL_BASE[N_CSI_RX_FRONTEND_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:165:26: warning: ‘ISYS_IRQ_BASE’ defined but not used [-Wunused-const-variable=]
  165 | static const hrt_address ISYS_IRQ_BASE[N_ISYS_IRQ_ID] = {
      |                          ^~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:158:26: warning: ‘IBUF_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  158 | static const hrt_address IBUF_CTRL_BASE[N_IBUF_CTRL_ID] = {
      |                          ^~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:153:26: warning: ‘RX_BASE’ defined but not used [-Wunused-const-variable=]
  153 | static const hrt_address RX_BASE[N_RX_ID] = {
      |                          ^~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:138:26: warning: ‘INPUT_SYSTEM_BASE’ defined but not used [-Wunused-const-variable=]
  138 | static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
      |                          ^~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:130:26: warning: ‘INPUT_FORMATTER_BASE’ defined but not used [-Wunused-const-variable=]
  130 | static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:125:26: warning: ‘TIMED_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  125 | static const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
      |                          ^~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:120:26: warning: ‘GPIO_BASE’ defined but not used [-Wunused-const-variable=]
  120 | static const hrt_address GPIO_BASE[N_GPIO_ID] = {
      |                          ^~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:116:26: warning: ‘GP_TIMER_BASE’ defined but not used [-Wunused-const-variable=]
  116 | static const hrt_address GP_TIMER_BASE =
      |                          ^~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:109:26: warning: ‘GP_DEVICE_BASE’ defined but not used [-Wunused-const-variable=]
  109 | static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
      |                          ^~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:96:26: warning: ‘FIFO_MONITOR_BASE’ defined but not used [-Wunused-const-variable=]
   96 | static const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] = {
      |                          ^~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:90:26: warning: ‘GDC_BASE’ defined but not used [-Wunused-const-variable=]
   90 | static const hrt_address GDC_BASE[N_GDC_ID] = {
      |                          ^~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:78:26: warning: ‘IRQ_BASE’ defined but not used [-Wunused-const-variable=]
   78 | static const hrt_address IRQ_BASE[N_IRQ_ID] = {
      |                          ^~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:73:26: warning: ‘ISYS2401_DMA_BASE’ defined but not used [-Wunused-const-variable=]
   73 | static const hrt_address ISYS2401_DMA_BASE[N_ISYS2401_DMA_ID] = {
      |                          ^~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:69:26: warning: ‘DMA_BASE’ defined but not used [-Wunused-const-variable=]
   69 | static const hrt_address DMA_BASE[N_DMA_ID] = {
      |                          ^~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:63:26: warning: ‘MMU_BASE’ defined but not used [-Wunused-const-variable=]
   63 | static const hrt_address MMU_BASE[N_MMU_ID] = {
      |                          ^~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:54:26: warning: ‘SP_DMEM_BASE’ defined but not used [-Wunused-const-variable=]
   54 | static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
      |                          ^~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:50:26: warning: ‘SP_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
   50 | static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
      |                          ^~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:45:26: warning: ‘ISP_BAMEM_BASE’ defined but not used [-Wunused-const-variable=]
   45 | static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
      |                          ^~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:41:26: warning: ‘ISP_DMEM_BASE’ defined but not used [-Wunused-const-variable=]
   41 | static const hrt_address ISP_DMEM_BASE[N_ISP_ID] = {
      |                          ^~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:37:26: warning: ‘ISP_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
   37 | static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
      |                          ^~~~~~~~~~~~~
In file included from ./drivers/staging/media/atomisp//pci/ia_css_acc_types.h:23,
                 from ./drivers/staging/media/atomisp//pci/ia_css_pipe_public.h:29,
                 from drivers/staging/media/atomisp/pci/sh_css_legacy.h:23,
                 from drivers/staging/media/atomisp/pci/atomisp_internal.h:34,
                 from drivers/staging/media/atomisp/pci/atomisp_acc.h:23,
                 from drivers/staging/media/atomisp/pci/atomisp_acc.c:29:
./drivers/staging/media/atomisp//pci/system_local.h:193:26: warning: ‘STREAM2MMIO_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  193 | static const hrt_address STREAM2MMIO_CTRL_BASE[N_STREAM2MMIO_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:186:26: warning: ‘PIXELGEN_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  186 | static const hrt_address PIXELGEN_CTRL_BASE[N_PIXELGEN_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:179:26: warning: ‘CSI_RX_BE_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  179 | static const hrt_address CSI_RX_BE_CTRL_BASE[N_CSI_RX_BACKEND_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:172:26: warning: ‘CSI_RX_FE_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  172 | static const hrt_address CSI_RX_FE_CTRL_BASE[N_CSI_RX_FRONTEND_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:165:26: warning: ‘ISYS_IRQ_BASE’ defined but not used [-Wunused-const-variable=]
  165 | static const hrt_address ISYS_IRQ_BASE[N_ISYS_IRQ_ID] = {
      |                          ^~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:158:26: warning: ‘IBUF_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  158 | static const hrt_address IBUF_CTRL_BASE[N_IBUF_CTRL_ID] = {
      |                          ^~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:153:26: warning: ‘RX_BASE’ defined but not used [-Wunused-const-variable=]
  153 | static const hrt_address RX_BASE[N_RX_ID] = {
      |                          ^~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:138:26: warning: ‘INPUT_SYSTEM_BASE’ defined but not used [-Wunused-const-variable=]
  138 | static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
      |                          ^~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:130:26: warning: ‘INPUT_FORMATTER_BASE’ defined but not used [-Wunused-const-variable=]
  130 | static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
      |                          ^~~~~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:125:26: warning: ‘TIMED_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
  125 | static const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
      |                          ^~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:120:26: warning: ‘GPIO_BASE’ defined but not used [-Wunused-const-variable=]
  120 | static const hrt_address GPIO_BASE[N_GPIO_ID] = {
      |                          ^~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:116:26: warning: ‘GP_TIMER_BASE’ defined but not used [-Wunused-const-variable=]
  116 | static const hrt_address GP_TIMER_BASE =
      |                          ^~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:109:26: warning: ‘GP_DEVICE_BASE’ defined but not used [-Wunused-const-variable=]
  109 | static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
      |                          ^~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:96:26: warning: ‘FIFO_MONITOR_BASE’ defined but not used [-Wunused-const-variable=]
   96 | static const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] = {
      |                          ^~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:90:26: warning: ‘GDC_BASE’ defined but not used [-Wunused-const-variable=]
   90 | static const hrt_address GDC_BASE[N_GDC_ID] = {
      |                          ^~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:78:26: warning: ‘IRQ_BASE’ defined but not used [-Wunused-const-variable=]
   78 | static const hrt_address IRQ_BASE[N_IRQ_ID] = {
      |                          ^~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:73:26: warning: ‘ISYS2401_DMA_BASE’ defined but not used [-Wunused-const-variable=]
   73 | static const hrt_address ISYS2401_DMA_BASE[N_ISYS2401_DMA_ID] = {
      |                          ^~~~~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:69:26: warning: ‘DMA_BASE’ defined but not used [-Wunused-const-variable=]
   69 | static const hrt_address DMA_BASE[N_DMA_ID] = {
      |                          ^~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:63:26: warning: ‘MMU_BASE’ defined but not used [-Wunused-const-variable=]
   63 | static const hrt_address MMU_BASE[N_MMU_ID] = {
      |                          ^~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:54:26: warning: ‘SP_DMEM_BASE’ defined but not used [-Wunused-const-variable=]
   54 | static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
      |                          ^~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:50:26: warning: ‘SP_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
   50 | static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
      |                          ^~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:45:26: warning: ‘ISP_BAMEM_BASE’ defined but not used [-Wunused-const-variable=]
   45 | static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
      |                          ^~~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:41:26: warning: ‘ISP_DMEM_BASE’ defined but not used [-Wunused-const-variable=]
   41 | static const hrt_address ISP_DMEM_BASE[N_ISP_ID] = {
      |                          ^~~~~~~~~~~~~
./drivers/staging/media/atomisp//pci/system_local.h:37:26: warning: ‘ISP_CTRL_BASE’ defined but not used [-Wunused-const-variable=]
   37 | static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
      |                          ^~~~~~~~~~~~~

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/Makefile        |   1 +
 .../staging/media/atomisp/pci/system_local.c  | 179 ++++++++++++++++++
 .../staging/media/atomisp/pci/system_local.h  | 146 +++-----------
 3 files changed, 205 insertions(+), 121 deletions(-)
 create mode 100644 drivers/staging/media/atomisp/pci/system_local.c

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 7b8288bbe119..205d0f8cc2e1 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -156,6 +156,7 @@ atomisp-objs += \
 	pci/hive_isp_css_common/host/timed_ctrl.o \
 	pci/hive_isp_css_common/host/vmem.o \
 	pci/hive_isp_css_shared/host/tag.o \
+	pci/system_local.o \
 
 obj-byt = \
 	pci/css_2400_system/hive/ia_css_isp_configs.o \
diff --git a/drivers/staging/media/atomisp/pci/system_local.c b/drivers/staging/media/atomisp/pci/system_local.c
new file mode 100644
index 000000000000..4ca8569d7feb
--- /dev/null
+++ b/drivers/staging/media/atomisp/pci/system_local.c
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Support for Intel Camera Imaging ISP subsystem.
+ * Copyright (c) 2015, Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ */
+
+#include "system_local.h"
+
+/* ISP */
+const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
+	0x0000000000020000ULL
+};
+
+const hrt_address ISP_DMEM_BASE[N_ISP_ID] = {
+	0x0000000000200000ULL
+};
+
+const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
+	0x0000000000100000ULL
+};
+
+/* SP */
+const hrt_address SP_CTRL_BASE[N_SP_ID] = {
+	0x0000000000010000ULL
+};
+
+const hrt_address SP_DMEM_BASE[N_SP_ID] = {
+	0x0000000000300000ULL
+};
+
+/* MMU */
+/*
+ * MMU0_ID: The data MMU
+ * MMU1_ID: The icache MMU
+ */
+const hrt_address MMU_BASE[N_MMU_ID] = {
+	0x0000000000070000ULL,
+	0x00000000000A0000ULL
+};
+
+/* DMA */
+const hrt_address DMA_BASE[N_DMA_ID] = {
+	0x0000000000040000ULL
+};
+
+const hrt_address ISYS2401_DMA_BASE[N_ISYS2401_DMA_ID] = {
+	0x00000000000CA000ULL
+};
+
+/* IRQ */
+const hrt_address IRQ_BASE[N_IRQ_ID] = {
+	0x0000000000000500ULL,
+	0x0000000000030A00ULL,
+	0x000000000008C000ULL,
+	0x0000000000090200ULL
+};
+
+/*
+	0x0000000000000500ULL};
+ */
+
+/* GDC */
+const hrt_address GDC_BASE[N_GDC_ID] = {
+	0x0000000000050000ULL,
+	0x0000000000060000ULL
+};
+
+/* FIFO_MONITOR (not a subset of GP_DEVICE) */
+const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] = {
+	0x0000000000000000ULL
+};
+
+/*
+const hrt_address GP_REGS_BASE[N_GP_REGS_ID] = {
+	0x0000000000000000ULL};
+
+const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
+	0x0000000000090000ULL};
+*/
+
+/* GP_DEVICE (single base for all separate GP_REG instances) */
+const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
+	0x0000000000000000ULL
+};
+
+/*GP TIMER , all timer registers are inter-twined,
+ * so, having multiple base addresses for
+ * different timers does not help*/
+const hrt_address GP_TIMER_BASE =
+    (hrt_address)0x0000000000000600ULL;
+
+/* GPIO */
+const hrt_address GPIO_BASE[N_GPIO_ID] = {
+	0x0000000000000400ULL
+};
+
+/* TIMED_CTRL */
+const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
+	0x0000000000000100ULL
+};
+
+/* INPUT_FORMATTER */
+const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
+	0x0000000000030000ULL,
+	0x0000000000030200ULL,
+	0x0000000000030400ULL,
+	0x0000000000030600ULL
+}; /* memcpy() */
+
+/* INPUT_SYSTEM */
+const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
+	0x0000000000080000ULL
+};
+
+/*	0x0000000000081000ULL, */ /* capture A */
+/*	0x0000000000082000ULL, */ /* capture B */
+/*	0x0000000000083000ULL, */ /* capture C */
+/*	0x0000000000084000ULL, */ /* Acquisition */
+/*	0x0000000000085000ULL, */ /* DMA */
+/*	0x0000000000089000ULL, */ /* ctrl */
+/*	0x000000000008A000ULL, */ /* GP regs */
+/*	0x000000000008B000ULL, */ /* FIFO */
+/*	0x000000000008C000ULL, */ /* IRQ */
+
+/* RX, the MIPI lane control regs start at offset 0 */
+const hrt_address RX_BASE[N_RX_ID] = {
+	0x0000000000080100ULL
+};
+
+/* IBUF_CTRL, part of the Input System 2401 */
+const hrt_address IBUF_CTRL_BASE[N_IBUF_CTRL_ID] = {
+	0x00000000000C1800ULL,	/* ibuf controller A */
+	0x00000000000C3800ULL,	/* ibuf controller B */
+	0x00000000000C5800ULL	/* ibuf controller C */
+};
+
+/* ISYS IRQ Controllers, part of the Input System 2401 */
+const hrt_address ISYS_IRQ_BASE[N_ISYS_IRQ_ID] = {
+	0x00000000000C1400ULL,	/* port a */
+	0x00000000000C3400ULL,	/* port b */
+	0x00000000000C5400ULL	/* port c */
+};
+
+/* CSI FE, part of the Input System 2401 */
+const hrt_address CSI_RX_FE_CTRL_BASE[N_CSI_RX_FRONTEND_ID] = {
+	0x00000000000C0400ULL,	/* csi fe controller A */
+	0x00000000000C2400ULL,	/* csi fe controller B */
+	0x00000000000C4400ULL	/* csi fe controller C */
+};
+
+/* CSI BE, part of the Input System 2401 */
+const hrt_address CSI_RX_BE_CTRL_BASE[N_CSI_RX_BACKEND_ID] = {
+	0x00000000000C0800ULL,	/* csi be controller A */
+	0x00000000000C2800ULL,	/* csi be controller B */
+	0x00000000000C4800ULL	/* csi be controller C */
+};
+
+/* PIXEL Generator, part of the Input System 2401 */
+const hrt_address PIXELGEN_CTRL_BASE[N_PIXELGEN_ID] = {
+	0x00000000000C1000ULL,	/* pixel gen controller A */
+	0x00000000000C3000ULL,	/* pixel gen controller B */
+	0x00000000000C5000ULL	/* pixel gen controller C */
+};
+
+/* Stream2MMIO, part of the Input System 2401 */
+const hrt_address STREAM2MMIO_CTRL_BASE[N_STREAM2MMIO_ID] = {
+	0x00000000000C0C00ULL,	/* stream2mmio controller A */
+	0x00000000000C2C00ULL,	/* stream2mmio controller B */
+	0x00000000000C4C00ULL	/* stream2mmio controller C */
+};
diff --git a/drivers/staging/media/atomisp/pci/system_local.h b/drivers/staging/media/atomisp/pci/system_local.h
index d60591e04b61..a47258c2e8a8 100644
--- a/drivers/staging/media/atomisp/pci/system_local.h
+++ b/drivers/staging/media/atomisp/pci/system_local.h
@@ -34,166 +34,70 @@
 #define GP_FIFO_BASE   ((hrt_address)0x0000000000090104)		/* This is NOT a base address */
 
 /* ISP */
-static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
-	0x0000000000020000ULL
-};
-
-static const hrt_address ISP_DMEM_BASE[N_ISP_ID] = {
-	0x0000000000200000ULL
-};
-
-static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
-	0x0000000000100000ULL
-};
+extern const hrt_address ISP_CTRL_BASE[N_ISP_ID];
+extern const hrt_address ISP_DMEM_BASE[N_ISP_ID];
+extern const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID];
 
 /* SP */
-static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
-	0x0000000000010000ULL
-};
-
-static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
-	0x0000000000300000ULL
-};
+extern const hrt_address SP_CTRL_BASE[N_SP_ID];
+extern const hrt_address SP_DMEM_BASE[N_SP_ID];
 
 /* MMU */
-/*
- * MMU0_ID: The data MMU
- * MMU1_ID: The icache MMU
- */
-static const hrt_address MMU_BASE[N_MMU_ID] = {
-	0x0000000000070000ULL,
-	0x00000000000A0000ULL
-};
+
+extern const hrt_address MMU_BASE[N_MMU_ID];
 
 /* DMA */
-static const hrt_address DMA_BASE[N_DMA_ID] = {
-	0x0000000000040000ULL
-};
-
-static const hrt_address ISYS2401_DMA_BASE[N_ISYS2401_DMA_ID] = {
-	0x00000000000CA000ULL
-};
+extern const hrt_address DMA_BASE[N_DMA_ID];
+extern const hrt_address ISYS2401_DMA_BASE[N_ISYS2401_DMA_ID];
 
 /* IRQ */
-static const hrt_address IRQ_BASE[N_IRQ_ID] = {
-	0x0000000000000500ULL,
-	0x0000000000030A00ULL,
-	0x000000000008C000ULL,
-	0x0000000000090200ULL
-};
-
-/*
-	0x0000000000000500ULL};
- */
+extern const hrt_address IRQ_BASE[N_IRQ_ID];
 
 /* GDC */
-static const hrt_address GDC_BASE[N_GDC_ID] = {
-	0x0000000000050000ULL,
-	0x0000000000060000ULL
-};
+extern const hrt_address GDC_BASE[N_GDC_ID];
 
 /* FIFO_MONITOR (not a subset of GP_DEVICE) */
-static const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] = {
-	0x0000000000000000ULL
-};
-
-/*
-static const hrt_address GP_REGS_BASE[N_GP_REGS_ID] = {
-	0x0000000000000000ULL};
-
-static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
-	0x0000000000090000ULL};
-*/
+extern const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID];
 
 /* GP_DEVICE (single base for all separate GP_REG instances) */
-static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
-	0x0000000000000000ULL
-};
+extern const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID];
 
 /*GP TIMER , all timer registers are inter-twined,
  * so, having multiple base addresses for
  * different timers does not help*/
-static const hrt_address GP_TIMER_BASE =
-    (hrt_address)0x0000000000000600ULL;
+extern const hrt_address GP_TIMER_BASE;
 
 /* GPIO */
-static const hrt_address GPIO_BASE[N_GPIO_ID] = {
-	0x0000000000000400ULL
-};
+extern const hrt_address GPIO_BASE[N_GPIO_ID];
 
 /* TIMED_CTRL */
-static const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
-	0x0000000000000100ULL
-};
+extern const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID];
 
 /* INPUT_FORMATTER */
-static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
-	0x0000000000030000ULL,
-	0x0000000000030200ULL,
-	0x0000000000030400ULL,
-	0x0000000000030600ULL
-}; /* memcpy() */
+extern const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID];
 
 /* INPUT_SYSTEM */
-static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
-	0x0000000000080000ULL
-};
-
-/*	0x0000000000081000ULL, */ /* capture A */
-/*	0x0000000000082000ULL, */ /* capture B */
-/*	0x0000000000083000ULL, */ /* capture C */
-/*	0x0000000000084000ULL, */ /* Acquisition */
-/*	0x0000000000085000ULL, */ /* DMA */
-/*	0x0000000000089000ULL, */ /* ctrl */
-/*	0x000000000008A000ULL, */ /* GP regs */
-/*	0x000000000008B000ULL, */ /* FIFO */
-/*	0x000000000008C000ULL, */ /* IRQ */
+extern const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID];
 
 /* RX, the MIPI lane control regs start at offset 0 */
-static const hrt_address RX_BASE[N_RX_ID] = {
-	0x0000000000080100ULL
-};
+extern const hrt_address RX_BASE[N_RX_ID];
 
 /* IBUF_CTRL, part of the Input System 2401 */
-static const hrt_address IBUF_CTRL_BASE[N_IBUF_CTRL_ID] = {
-	0x00000000000C1800ULL,	/* ibuf controller A */
-	0x00000000000C3800ULL,	/* ibuf controller B */
-	0x00000000000C5800ULL	/* ibuf controller C */
-};
+extern const hrt_address IBUF_CTRL_BASE[N_IBUF_CTRL_ID];
 
 /* ISYS IRQ Controllers, part of the Input System 2401 */
-static const hrt_address ISYS_IRQ_BASE[N_ISYS_IRQ_ID] = {
-	0x00000000000C1400ULL,	/* port a */
-	0x00000000000C3400ULL,	/* port b */
-	0x00000000000C5400ULL	/* port c */
-};
+extern const hrt_address ISYS_IRQ_BASE[N_ISYS_IRQ_ID];
 
 /* CSI FE, part of the Input System 2401 */
-static const hrt_address CSI_RX_FE_CTRL_BASE[N_CSI_RX_FRONTEND_ID] = {
-	0x00000000000C0400ULL,	/* csi fe controller A */
-	0x00000000000C2400ULL,	/* csi fe controller B */
-	0x00000000000C4400ULL	/* csi fe controller C */
-};
+extern const hrt_address CSI_RX_FE_CTRL_BASE[N_CSI_RX_FRONTEND_ID];
 
 /* CSI BE, part of the Input System 2401 */
-static const hrt_address CSI_RX_BE_CTRL_BASE[N_CSI_RX_BACKEND_ID] = {
-	0x00000000000C0800ULL,	/* csi be controller A */
-	0x00000000000C2800ULL,	/* csi be controller B */
-	0x00000000000C4800ULL	/* csi be controller C */
-};
+extern const hrt_address CSI_RX_BE_CTRL_BASE[N_CSI_RX_BACKEND_ID];
 
 /* PIXEL Generator, part of the Input System 2401 */
-static const hrt_address PIXELGEN_CTRL_BASE[N_PIXELGEN_ID] = {
-	0x00000000000C1000ULL,	/* pixel gen controller A */
-	0x00000000000C3000ULL,	/* pixel gen controller B */
-	0x00000000000C5000ULL	/* pixel gen controller C */
-};
+extern const hrt_address PIXELGEN_CTRL_BASE[N_PIXELGEN_ID];
 
 /* Stream2MMIO, part of the Input System 2401 */
-static const hrt_address STREAM2MMIO_CTRL_BASE[N_STREAM2MMIO_ID] = {
-	0x00000000000C0C00ULL,	/* stream2mmio controller A */
-	0x00000000000C2C00ULL,	/* stream2mmio controller B */
-	0x00000000000C4C00ULL	/* stream2mmio controller C */
-};
+extern const hrt_address STREAM2MMIO_CTRL_BASE[N_STREAM2MMIO_ID];
 
 #endif /* __SYSTEM_LOCAL_H_INCLUDED__ */
-- 
2.26.2

