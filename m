Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D72C3763235
	for <lists+linux-media@lfdr.de>; Wed, 26 Jul 2023 11:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232974AbjGZJcO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jul 2023 05:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbjGZJbu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jul 2023 05:31:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED561420C;
        Wed, 26 Jul 2023 02:30:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4E09E619FD;
        Wed, 26 Jul 2023 09:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DDCC433C7;
        Wed, 26 Jul 2023 09:30:33 +0000 (UTC)
Message-ID: <aeaf46cd-205e-8111-c366-d4aa7223be4c@xs4all.nl>
Date:   Wed, 26 Jul 2023 11:30:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v8 1/2] Added Digiteq Automotive MGB4 driver
Content-Language: en-US
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     tumic@gpxsee.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Martin_T=c5=afma?= <martin.tuma@digiteqautomotive.com>
References: <20230704131339.2177-1-tumic@gpxsee.org>
 <20230704131339.2177-2-tumic@gpxsee.org>
 <fd6517b1-1bb9-d54e-45c6-87765343f112@xs4all.nl>
In-Reply-To: <fd6517b1-1bb9-d54e-45c6-87765343f112@xs4all.nl>
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

On 26/07/2023 11:14, Hans Verkuil wrote:
> Hi Martin,
> 
> On 04/07/2023 15:13, tumic@gpxsee.org wrote:
>> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>
>> Digiteq Automotive MGB4 is a modular frame grabber PCIe card for automotive
>> video interfaces. As for now, two modules - FPD-Link and GMSL - are
>> available and supported by the driver. The card has two inputs and two
>> outputs (FPD-Link only).
>>
>> In addition to the video interfaces it also provides a trigger signal
>> interface and a MTD interface for FPGA firmware upload.
>>
>> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
>> ---
>>  MAINTAINERS                             |   7 +
>>  drivers/media/pci/Kconfig               |   1 +
>>  drivers/media/pci/Makefile              |   1 +
>>  drivers/media/pci/mgb4/Kconfig          |  17 +
>>  drivers/media/pci/mgb4/Makefile         |   6 +
>>  drivers/media/pci/mgb4/mgb4_cmt.c       | 244 +++++++
>>  drivers/media/pci/mgb4/mgb4_cmt.h       |  17 +
>>  drivers/media/pci/mgb4/mgb4_core.c      | 711 ++++++++++++++++++
>>  drivers/media/pci/mgb4/mgb4_core.h      |  72 ++
>>  drivers/media/pci/mgb4/mgb4_dma.c       | 123 ++++
>>  drivers/media/pci/mgb4/mgb4_dma.h       |  18 +
>>  drivers/media/pci/mgb4/mgb4_i2c.c       | 140 ++++
>>  drivers/media/pci/mgb4/mgb4_i2c.h       |  35 +
>>  drivers/media/pci/mgb4/mgb4_io.h        |  33 +
>>  drivers/media/pci/mgb4/mgb4_regs.c      |  30 +
>>  drivers/media/pci/mgb4/mgb4_regs.h      |  35 +
>>  drivers/media/pci/mgb4/mgb4_sysfs.h     |  18 +
>>  drivers/media/pci/mgb4/mgb4_sysfs_in.c  | 757 +++++++++++++++++++
>>  drivers/media/pci/mgb4/mgb4_sysfs_out.c | 700 ++++++++++++++++++
>>  drivers/media/pci/mgb4/mgb4_sysfs_pci.c |  71 ++
>>  drivers/media/pci/mgb4/mgb4_trigger.c   | 208 ++++++
>>  drivers/media/pci/mgb4/mgb4_trigger.h   |   8 +
>>  drivers/media/pci/mgb4/mgb4_vin.c       | 930 ++++++++++++++++++++++++
>>  drivers/media/pci/mgb4/mgb4_vin.h       |  69 ++
>>  drivers/media/pci/mgb4/mgb4_vout.c      | 594 +++++++++++++++
>>  drivers/media/pci/mgb4/mgb4_vout.h      |  65 ++
>>  26 files changed, 4910 insertions(+)
>>  create mode 100644 drivers/media/pci/mgb4/Kconfig
>>  create mode 100644 drivers/media/pci/mgb4/Makefile
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_cmt.c
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_cmt.h
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_core.c
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_core.h
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_dma.c
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_dma.h
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_i2c.c
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_i2c.h
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_io.h
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_regs.c
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_regs.h
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs.h
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_in.c
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_out.c
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_pci.c
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_trigger.c
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_trigger.h
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_vin.c
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_vin.h
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_vout.c
>>  create mode 100644 drivers/media/pci/mgb4/mgb4_vout.h
>>
> 
> When I build with: make W=1 KCFLAGS=-Wmaybe-uninitialized
> 
> I get this warning:
> 
> drivers/media/pci/mgb4/mgb4_vout.c: In function 'mgb4_vout_create':
> drivers/media/pci/mgb4/mgb4_vout.c:473:27: warning: variable 'video' set but not used [-Wunused-but-set-variable]
>   473 |         struct mgb4_regs *video;
>       |                           ^~~~~

checkpatch.pl --strict also gives a lot of warnings.

You can ignore the "line length of 131 exceeds 100 columns" warnings for the hex dump.
Those are OK in that particular case.

But the suggested renamings would be good to implement to be consistent with other
drivers.

Regarding these:

WARNING: Missing a blank line after declarations
#3340: FILE: drivers/media/pci/mgb4/mgb4_trigger.c:93:
+               u32 data;
+               s64 ts __aligned(8);

WARNING: externs should be avoided in .c files
#3340: FILE: drivers/media/pci/mgb4/mgb4_trigger.c:93:
+               s64 ts __aligned(8);

This seems to be standard iio coding style, even though checkpatch
gets confused by this. So let's leave this as-is.

Regards,

	Hans
