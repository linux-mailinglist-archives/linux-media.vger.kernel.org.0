Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33BDE725834
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 10:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239081AbjFGIoc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 04:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235258AbjFGIob (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 04:44:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1BE71725;
        Wed,  7 Jun 2023 01:44:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 397C8616EE;
        Wed,  7 Jun 2023 08:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC8BC433EF;
        Wed,  7 Jun 2023 08:44:27 +0000 (UTC)
Message-ID: <d9b1b2f9-7e53-5096-2c5b-c5d1c185fdd0@xs4all.nl>
Date:   Wed, 7 Jun 2023 10:44:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESEND PATCH v6 0/1] Digiteq Automotive MGB4 driver
Content-Language: en-US
To:     tumic@gpxsee.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Martin_T=c5=afma?= <martin.tuma@digiteqautomotive.com>
References: <20230524112126.2242-1-tumic@gpxsee.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230524112126.2242-1-tumic@gpxsee.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

Thank you for this patch. I've reviewed it, so I'm looking forward to v7.

On 24/05/2023 13:21, tumic@gpxsee.org wrote:
> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
> 
> Hi,
> This patch adds a driver for the Digiteq Automotive MGB4 grabber card.
> MGB4 is a modular frame grabber PCIe card for automotive video interfaces
> (FPD-Link and GMSL for now). It is based on a Xilinx FPGA and uses their
> XDMA IP core for DMA transfers. Additionally, Xilinx I2C and SPI IP cores
> which already have drivers in linux are used in the design.
> 
> The driver is a quite standard v4l2 driver, with one exception - there are
> a lot of sysfs options that may/must be set before opening the v4l2 device
> to adapt the card on a specific signal (see mgb4.rst for details)
> as the card must be able to work with various signal sources (or displays)
> that can not be auto-detected.
> 
> I have run the driver through the v4l2-compliance test suite for both the
> input and the output and the results look fine to me (I can provide the
> output if required).

Yes please! Just include the output in the cover letter next time.

I always like to check it, especially for new drivers.

Regards,

	Hans

> 
> Changes in v6:
> * Rebased to current master that includes the Xilinx XDMA driver.
> 
> Changes in v5:
> * Removed unused <linux/version.h> includes
> 
> Changes in v4:
> * Redesigned the signal change handling logic. Now using the propper timings
>   API in the video input driver and a propper open() syscall check/logic in
>   the video output driver.
> * Fixed all minor issues from v3 review.
> * 'checkpatch.pl --strict' used for checking the code.
> 
> Changes in v3:
> * Rebased the DMA transfers part to use the new XDMA driver from Xilinx/AMD
> 
> Changes in v2:
> * Completely rewritten the original Xilinx's XDMA driver to meet kernel code
>   standards.
> * Added all required "to" and "cc" mail addresses.
> 
> Martin Tůma (1):
>   Added Digiteq Automotive MGB4 driver
> 
>  Documentation/admin-guide/media/mgb4.rst      | 352 ++++++++
>  .../admin-guide/media/pci-cardlist.rst        |   1 +
>  .../admin-guide/media/v4l-drivers.rst         |   1 +
>  MAINTAINERS                                   |   7 +
>  drivers/media/pci/Kconfig                     |   1 +
>  drivers/media/pci/Makefile                    |   1 +
>  drivers/media/pci/mgb4/Kconfig                |  17 +
>  drivers/media/pci/mgb4/Makefile               |   6 +
>  drivers/media/pci/mgb4/mgb4_cmt.c             | 247 ++++++
>  drivers/media/pci/mgb4/mgb4_cmt.h             |  16 +
>  drivers/media/pci/mgb4/mgb4_core.c            | 641 ++++++++++++++
>  drivers/media/pci/mgb4/mgb4_core.h            |  65 ++
>  drivers/media/pci/mgb4/mgb4_dma.c             | 123 +++
>  drivers/media/pci/mgb4/mgb4_dma.h             |  18 +
>  drivers/media/pci/mgb4/mgb4_i2c.c             | 140 +++
>  drivers/media/pci/mgb4/mgb4_i2c.h             |  35 +
>  drivers/media/pci/mgb4/mgb4_io.h              |  39 +
>  drivers/media/pci/mgb4/mgb4_regs.c            |  30 +
>  drivers/media/pci/mgb4/mgb4_regs.h            |  35 +
>  drivers/media/pci/mgb4/mgb4_sysfs.h           |  18 +
>  drivers/media/pci/mgb4/mgb4_sysfs_in.c        | 780 ++++++++++++++++
>  drivers/media/pci/mgb4/mgb4_sysfs_out.c       | 732 +++++++++++++++
>  drivers/media/pci/mgb4/mgb4_sysfs_pci.c       |  86 ++
>  drivers/media/pci/mgb4/mgb4_trigger.c         | 208 +++++
>  drivers/media/pci/mgb4/mgb4_trigger.h         |   8 +
>  drivers/media/pci/mgb4/mgb4_vin.c             | 830 ++++++++++++++++++
>  drivers/media/pci/mgb4/mgb4_vin.h             |  63 ++
>  drivers/media/pci/mgb4/mgb4_vout.c            | 501 +++++++++++
>  drivers/media/pci/mgb4/mgb4_vout.h            |  58 ++
>  29 files changed, 5059 insertions(+)
>  create mode 100644 Documentation/admin-guide/media/mgb4.rst
>  create mode 100644 drivers/media/pci/mgb4/Kconfig
>  create mode 100644 drivers/media/pci/mgb4/Makefile
>  create mode 100644 drivers/media/pci/mgb4/mgb4_cmt.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_cmt.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_core.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_core.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_dma.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_dma.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_i2c.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_i2c.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_io.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_regs.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_regs.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_in.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_out.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_pci.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_trigger.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_trigger.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_vin.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_vin.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_vout.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_vout.h
> 
> 
> base-commit: ae8373a5add4ea39f032563cf12a02946d1e3546

