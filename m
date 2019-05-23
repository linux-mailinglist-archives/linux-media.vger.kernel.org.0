Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4AC27D04
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2019 14:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729863AbfEWMmS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 08:42:18 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40758 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729361AbfEWMmS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 08:42:18 -0400
Received: by mail-ed1-f67.google.com with SMTP id j12so9026957eds.7
        for <linux-media@vger.kernel.org>; Thu, 23 May 2019 05:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ALEQnUk/F6B0q6Kzg48clQ+IMAxEKhYjlEHqICBwqrI=;
        b=BCFGhkvU9ZWv7QI/K38M9PBgfH6JHvOdjSw6dhbDmp1vUDl0icJhcrCWSTej+3KSs/
         EK8FDJNLaa5Q53TSKFZHMjEdLQzrL65vBr+Lgly3AVW6t93FsK+PoI+jDfxHcHuruuNx
         y2bm5ySYOkbnDcEG+b9cv+EGu9PdT7ivb1LXHaWKiMUD7YnVOV9jSMFC94fqkTV/LOMR
         Wi7do4XWkHXO5iWhIhbfwhsQ+ALiUQ5tsDEedugbHGiunoujZ8q670ASHOncv6RETpYx
         Y7TIqTcfDUxpI/vqPZVY3W2v7emUd84nqexM/gLHh7s0Xe8h7qDpM1N457Ai1M3ynYNs
         KGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ALEQnUk/F6B0q6Kzg48clQ+IMAxEKhYjlEHqICBwqrI=;
        b=BX/y8LH06i0FJAJPs+ilOgp5plhUfMSM7NQk54PPz9VmNvtKV2w90oefH+/mAjz2Hj
         8SoM8RFrQ4q5TQwTqriXZbSW8fWH8X6vyxRgAnRJawcjkmxSZLP/AWedfAe1Hu3kOJiD
         Cd+Mw3gluv7Ud5OoqCDiqiOetq3q9MIXMFyGN59q678nDBpMSIqlurTBRxPw/QMyVC2E
         OqiFY9z/tl70vdvpoWRZTop/0HCs3mDnhx5j4VP5chyehpwGfLZrFPIW4bHnel3Y0OMy
         jeGKW+Ccb6nhIynN96UfaZQv+/hADt+NloqglFKJ9AaJwkFJKnQ8xKf1I+lJguDhegxE
         xzPQ==
X-Gm-Message-State: APjAAAUbmJPWq0JHlreFUKdsMCAomitjIIcQ2e5HZy3MSs/P4+ZHVJ1U
        b2kuuiv7NiYd2mXbxYNM1xD/4f38
X-Google-Smtp-Source: APXvYqz060Cs6ACWeG3x08KNTZdGVI4k5cVEUsi9Ib1juuPYTEl8u6BIcH7NuCIwQO/9QfWjwY1BdQ==
X-Received: by 2002:a50:b82d:: with SMTP id j42mr96908625ede.186.1558615334406;
        Thu, 23 May 2019 05:42:14 -0700 (PDT)
Received: from [192.168.1.5] ([194.76.131.27])
        by smtp.gmail.com with ESMTPSA id s15sm7915696edm.6.2019.05.23.05.42.13
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 05:42:13 -0700 (PDT)
Subject: Re: [GIT PULL v2] SAA716x DVB driver
To:     Soeren Moch <smoch@web.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <5fc93954-b5a6-c7d2-527f-1c60f3613318@web.de>
From:   =?UTF-8?Q?Tycho_L=c3=bcrsen?= <tycholursen@gmail.com>
Message-ID: <45c4fce8-ae0a-ff81-bcfd-5e798986be02@gmail.com>
Date:   Thu, 23 May 2019 14:42:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5fc93954-b5a6-c7d2-527f-1c60f3613318@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

@Mauro:

What's keeping you from pulling this driver? As far as I can see, Soeren 
Moch did in fact resolve all of your prior objections regarding this 
driver, including the api changes. I get that your opinion regarding 
these api changes differs from Soeren Moch's opinion, but there is no 
evidence whatsoever that these changes can in fact hurt the kernel. It 
still boils down to different opinions. That sucks...

I beg you to overcome these differences, you can do that!

Please pull.

Cheers,

Tycho.

Op 02-04-2019 om 10:06 schreef Soeren Moch:
> This is a driver for DVB cards based on SAA7160/61/62 PCIe bridges from
> Philips/NXP. The most important of these cards, at least for me, is the
> TechnoTrend S2-6400, a high-definition full-featured DVB-S2 card, the
> successor of the famous ttpci decoder cards for use with applications
> like vdr. Although equipped with a decoder, the S2-6400 is not able to
> send the decoded video back over PCIe, so the output part of this
> card cannot be used with applications like kaffeine.
>
> Other cards supported by this driver:
> Technisat SkyStar 2 eXpress HD
> TurboSight 6281 (DVB-T/T2/C)
> TurboSight 6285 (DVB-T/T2/C)
> Twinhan/Azurewave VP-6090
>
> The driver was taken from [1], converted to git and moved to
> drivers/media/pci. It is adapted for current mainline (v5.1-rc1)
> with lots of clean-up work done.
> This driver was licensed "GPL" from the beginning. S2-6400 firmware is
> available at [2].
>
> I preserved the development history of the driver, since this
> is mainly work of Andreas Regel, Manu Abraham, and Oliver Endriss.
> Additional support for TBS cards was provided by Luis Alves and
> Tycho Lürsen. Also thanks to Tobias Klausmann and Uwe Scheffler
> for their code contributions and testing work.
>
> Unfortunately Andreas seems not to take care of this driver anymore, he
> also did not answer my requests to integrate patches for newer kernel
> versions. So I send this upstream.
>
> Changes since v1 of this pull request [3]:
> - rebased and adapted to linux-5.1-rc1
> - added support for TBS cards
> - fixed IRQ/MSI init
> - fixed module dependencies
> - converted logging to pci_info/dbg/err
> - submitted for media/pci, not staging/media, all clean-up work done
> Remaining checkpatch warnings for lines over 80 characters are only
> to keep message strings and "code tables" intact.
>
> There was a request to convert the DVB API output part in this driver
> to "something more modern", apparently under the wrong assumption that
> this API is used here as some older version of a v4l2 decoder API.
> But the S2-6400 is a completely different class of hardware, with
> different and much simpler API requirements. The S2-6400 hardware
> is not able to send the decoded video back over PCIe. This driver has
> no access to the decoded video, and it is not in charge of controlling
> the video decoder on this card. The only available hardware interface
> for the dvb audio/video device is a fifo buffer to receive a DVB
> transport stream. So this driver only uses following calls from the
> DVB output API:
> - write a TS to the fifo via the video device node
> - 3 ioctls: reset fifo, get time stamp of packet at receiving end of fifo,
>    switch from fifo interface to DVB frontend (or back) for received TS
>  From an API point of view, this driver does not even know that there is
> a video decoder behind the fifo. It could as well be a transmission
> line, or a dvb modulator.
> This simple DVB transport stream output API very well meets the needs of
> the vdr application, I don't see why and how this should be converted
> to something different.
> Note: there is a debug access to a single decoded image in this driver,
> this is gated by a module option and disabled by default. Due to
> bandwith limitations on the card this should not be used in parallel
> to normal vdr operation.
>
> [1] https://bitbucket.org/powARman/v4l-dvb-saa716x/
> [2] http://www.aregel.de/downloads/
> [3] https://www.mail-archive.com/linux-media@vger.kernel.org/msg115690.html
>
>
>
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
>
>    Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
>
> are available in the Git repository at:
>
>    https://github.com/s-moch/linux-saa716x for-media-v2
>
> for you to fetch changes up to 33590a6a58a3d350678cd8aef4ea1578d66494fa:
>
>    saa716x: Add MAINTAINERS entry (2019-03-25 08:53:42 +0100)
>
> ----------------------------------------------------------------
> Andreas Regel (127):
>        saa716x: Simplified the code for I2C transfers.
>        saa716x: Transport stream ports can be configured now.
>        saa716x_ff: Disable frontend support through STi7109 firmware.
>        saa716x_ff: Initialize the frontend of the TT S2-6400.
>        saa716x_ff: Add VIDEO_GET_PTS ioctl.
>        saa716x_ff: Add audio device for TT S2-6400.
>        saa716x_ff: Use separate interrupts for OSD commands.
>        saa716x_ff: Use third TS input of the STi7109 for playback
>        saa716x_ff: Set error code when boot of firmware failed.
>        saa716x_ff: Added 10ms sleep after configuring the FPGA.
>        saa716x: Reduce compiler warnings
>        saa716x: fix kernel oops caused by missing initialisation
>        saa716x: fixed double frontend detach
>        saa716x: 1ms is enough when waiting for the PLL
>        saa716x_ff: Adapted frontend init to latest driver changes.
>        saa716x: Improve PHI performance by shorten timings a bit.
>        saa716x_ff: use double buffering for block transfers.
>        saa716x_ff: Reset block_done after receiving it.
>        saa716x_ff: add interrupt source for firmware log messages
>        saa716x_ff: read FPGA version register
>        saa716x_ff: fixed PTS/STC signed/unsigned issue
>        saa716x_ff: query and print loader and firmware versions
>        saa716x: disable debug printk
>        osd.h: Add const keyword to struct members
>        saa716x_ff: implement ioctl VIDEO_GET_SIZE
>        saa716x_ff: support production version of the S2-6400
>        saa716x: disable OVERFLOW and AV interrupts in FGPI
>        saa716x_ff: add some FPGA register definitions
>        saa716x_ff: restart TS capturing in case of non-aligned TS error
>        saa716x_ff: don't clear FGPI interrupts in IRQ routine.
>        saa716x: comment out SPI functions that are not needed currently
>        saa716x: add changes needed for kernel 2.6.36 and up.
>        saa716x: support building with media_build_experimental
>        saa716x_ff: use tasklet for FIFO transfer
>        saa716x: fix not working MSI
>        saa716x: Disable shared IRQ when using MSI mode.
>        saa716x_ff: Do an explicit demodulator reset.
>        saa716x: enable wait for PLL lock when setting clocks of all ports.
>        saa716x_ff: add counting of interrupts
>        saa716x: don't set i2c_adapter id field
>        saa716x_ff: support non-aligned TS data
>        saa716x_ff: Use a TS clock of 135Mhz instead of 90 Mhz.
>        saa716x_ff: Ignore false remote events.
>        saa716x_ff: Fix possible crash in IRQ handler.
>        saa716x_ff: move firmware command interface code to separate file.
>        saa716x_ff: Allow to have osd device opened twice.
>        saa716x_ff: support correct TS mux setting for FPGA 1.10.
>        saa716x_budget: Add missing GPIO initialization.
>        saa716x_hybrid: Add missing GPIO initialization.
>        saa716x_hybrid: fix tuner settings for nemo reference board
>        saa716x_hybrid: TS capturing on the nemo reference board works.
>        saa716x_hybrid: Make TS capturing code more generic.
>        saa716x: remove unused members from struct saa716x_config.
>        saa716x: Add function saa716x_fgpi_get_write_index.
>        saa716x_hybrid: Use saa716x_fgpi_get_write_index to simplify code.
>        saa716x_ff: Use saa716x_fgpi_get_write_index to simplify code.
>        saa716x: Set maximum number of adapters per saa716x to 4.
>        saa716x_budget: Add TS capturing code.
>        saa716x_hybrid: Do some cleanups.
>        saa716x: remove unused load_config functions.
>        saa716x_budget: Started with SkyStar 2 eXpress HD.
>        saa716x_hybrid: Add support for KWorld Dual DVB-T PE310.
>        saa716x: Fix I2C bus assignment on SAA7160ET.
>        saa716x: Fix stack corruption when parsing ROM info.
>        saa716x: Fix memory leak in ROM parsing.
>        saa716x: Skip unknown device descriptors when parsing the ROM
>        saa716x: change verbose level for some dprintk
>        saa716x_ff: Enable now working EEPROM parsing.
>        saa716x_ff: Add error message when FPGA is not responding.
>        saa716x_budget: Add frontend attach for the Skystar2 eXpress HD.
>        saa716x_ff: Reset the frontend on the SkyStar2 eXpress HD.
>        saa716x_ff: support CEC remote codes.
>        saa716x: Use interrupts for I2C writes instead of polling.
>        saa716x: separate I2C reading and writing into two functions.
>        saa716x_ff: change remote event printk to hexadecimal output.
>        saa716x: Support buffered I2C transaction using interrupts.
>        saa716x_ff: Use buffered I2C interrupt mode.
>        saa716x_ff: Don't use dvb_generic_ioctl.
>        saa716x_budget: Use GPIO 26 for reset on the Skystar 2 eXpress HD.
>        saa716x_budget: Use I2C B for accessing the frontend on the Skystar.
>        saa716x_budget: Get the Skystar 2 eXpress HD to work.
>        saa716x_budget: Implement LNB power switching for Skystar 2
> eXpress HD.
>        saa716x_ff: Fix memory leak.
>        saa716x_ff: Fix missing copy user <-> kernel space.
>        saa716x: FGPI DMA buffer size is passed to saa716x_fgpi_init.
>        saa716x: Fix FGPI settings for SD video capture.
>        saa716x: Export some FGPI functions.
>        saa716x: Remove unused header file.
>        saa716x: Remove duplicate definition.
>        saa716x: Make BAM register macros more generic.
>        saa716x: Use global macros for MMU register access.
>        saa716x: Add VI module implementation.
>        saa716x: Support one-shot video capturing.
>        saa716x_ff: Extend interrupt counters.
>        saa716x: Change video capture format from YUYV to UYUV.
>        saa716x_ff: Support capturing digital video coming from STi7109.
>        saa716x_ff: Protect reading of the captured video with a mutex.
>        saa716x_ff: Rename functions.
>        saa716x_ff: video capture refactoring.
>        saa716x: Use pitch value from stream params when setting FGPI_STRIDE.
>        saa716x: use offset from stream params instead of fixed value.
>        saa716x: Clear DMA buffer after allocatiion
>        saa716x: Support capturing raw data via FGPI unit
>        saa716x: Reset FGPI read index in saa716x_fgpi_start
>        saa716x_ff: Cancel data transfer in case of a block timeout
>        saa716x_ff: print decimal digits for firmware version.
>        saa716x: include fix for in-kernel build
>        saa716x: support directory structure of linux-3.7+
>        saa716x: section mismatch fixes
>        saa716x: remove __devinit and friends
>        saa716x: convert fifo_worker tasklet to workqueue
>        saa716x: TS output buffer cleanup
>        saa716x: Fix PHI address space offsets, cleanup register definitions.
>        saa716x: Clean up PHI configuration.
>        saa716x: Reset PHI on init.
>        saa716x: Print EEPROM content on DEBUG verbosity only.
>        saa716x: Fix errors and improve saa716x_set_clk.
>        saa716x_ff: Fix not setting command result length to 0 per default.
>        saa716x: move card specific PHI code to saa716x_ff driver
>        saa716x_ff: use special phi_fifo_write function
>        saa716x_ff: Add write-combining PCI iomem window for PHI1 access.
>        saa716x_ff: implement PHI speedup
>        saa716x: IO memory of upper PHI1 regions is mapped in saa716x_ff
> driver.
>        saa716x_ff: Optimize access to FIFO.
>        saa716x_ff: Align block data on 32 bytes for firmware 0.5.0 and up
>        saa716x_ff: Do not return on command ready timeout
>        saa716x_ff: Usa faster EMI timings only for FPGA version 1.10 and
> later
>
> Luis Alves (1):
>        saa716x: Add support for tbs 6281 and tbs 6285 cards.
>
> Manu Abraham (137):
>        saa716x: Initial framework driver to support SAA7160, SAA7161,
> SAA7162 chips
>        saa716x: Add missing return, to avoid falling through the error codes
>        saa716x: Updated board definitions
>        saa716x: Add some register definitions
>        saa716x: Add Read/Write macros
>        saa716x: Initial attempt to Boot the core
>        saa716x: Initial attempt to initialize the I2C core
>        saa716x: Setup CGU
>        saa716x: Whitespace cleanup
>        saa716x: Use subsystem Vendor ID
>        saa716x: Small cleanups
>        saa716x: Enable all inputs
>        saa716x: Initial go at MSI setup
>        saa716x: Update I2C register definitions and fields
>        saa716x: Initial go at the I2C implementation
>        saa716x: Remove unused definitions
>        saa716x: Move i2c related stuff to it's own header
>        saa716x: Add some labels
>        saa716x: Rename files
>        saa716x: Fix subdevice ID
>        saa716x: Add more register definitions
>        saa716x: Update/Reorganize register definitions
>        saa716x: Implement internal Boot mode
>        saa716x: Update register definitions
>        saa716x: Still scratching
>        saa716x: Initialize MSI
>        saa716x: Cleanup internal Boot configuration
>        saa716x: Cleanup external Boot configuration
>        saa716x: Initialize CGU and MSI modules
>        saa716x: Enable more debugging
>        saa716x: Check DMA availability
>        saa716x: Small cleanups and fixes
>        saa716x: Fix typo
>        saa716x: Reset internal modules
>        saa716x: Still debugging
>        saa716x: Code simplification
>        saa716x: Terminate PCI ID list
>        saa716x: Rename Rd/Wr operations
>        saa716x: Fix usage of wrong datatypes
>        saa716x: CGU related fixes
>        saa716x: Continue MSI-X implementation
>        saa716x: Add routines to handle clock related events
>        saa716x: Add support for Avermedia HC82 PCIe expresscard
>        saa716x: Disable BAR2 access
>        saa716x: Code cleanup
>        saa716x: Register SAA716x Adapter
>        saa716x: Add initial support for the second adapter
>        saa716x: Initialize adapters on the budget device
>        saa716x: Register only the relevant adapters for a specific device
>        saa716x: Add Avermedia HC82 specific device configuration
>        saa716x: Fix typo
>        saa716x: Register an array of devices
>        saa716x: Add support for the Avermedia H788 device
>        saa716x: Add support for the Azurewave VP-6002 device
>        saa716x: Usea separate frontend_attach for each of the devices
>        saa716x: Use a separate IRQ handler for separate modules
>        saa716x: Try to attach the demodulator
>        saa716x: Fix typo in register definitions
>        saa716x: Updates and Code simplification  - Initialize the I2C
> clock  - Disable core reset for hybrid cards
>        saa716x: Check device revision for I2C bus orderring
>        saa716x: Add support for the NXP Atlantis reference design
>        saa716x: Free IRQ before module unload
>        saa716x: Code reorganization
>        saa716x: Add support for the KNC1 Dual S2 device
>        saa716x: Add support for the VP-3071 DVB-T dual device
>        saa716x: Add GPIO control functions
>        saa716x: Use power and reset controls within a sig\ngle loop
>        saa716x: Use a configuration per adapter
>        saa716x: VP-1028: add power, reset configuration
>        saa716x: H788: Add power, reset configuration
>        saa716x: HC82: Add power, reset configuration
>        saa716x: Display Bus status
>        saa716x: Bug: Address needs to be shifted one bit
>        saa716x: Initial go at DMA routines
>        saa716x: Print warning, if MSI module is not supported
>        saa716x: Handle MSI in a generic manner
>        saa716x: Add PHI port definitions
>        saa716x: Initialize PHI bus
>        saa716x: Add GREG routines
>        saa716x: Reorganize CGU related routines
>        saa716x: Do not initialize the CGU twice
>        saa716x: Add more debug info, initialize handler count
>        saa716x: Add/remove I2C MSI vectors
>        saa716x: Add interrupt debugging
>        saa716x: Return error on MSI enable failure
>        saa716x: Initialize FPGI pagetables
>        saa716x: Setup FGPI parameters
>        saa716x: Use a separate module to handle Full fledged cards
>        saa716x: NULL terminate PCI ID list
>        saa716x: Read the mask bits instead
>        saa716x: Reduce a bit of noise in the handler debug mode
>        saa716x: Sleep a little while before enabling interrupts again
>        saa716x: Use individual handlers
>        saa716x: Transmit D is programmed, not S data
>        saa716x: Print return values
>        saa716x: Use adapter ordering
>        saa716x: Disable debugging
>        osd.h: Kickstart the TT S2 6400 Dual HD Premium - OSD update
>        saa716x: Kickstart the TT S2 6400 Dual HD Premium
>        saa716x: Code simplification, Overhaul, ROM dump
>        saa716x: Set the default rate for the NEMO reference design
>        saa716x: Code simplification, Overhauling, I2C related fixes
> Initial test with the NEMO reference device
>        saa716x: Try to attach the frontends
>        saa716x: Don't cast pointers to 32 bit int
>        saa716x: Partial rework of SPI I/O
>        saa716x: Add video device support
>        saa716x: S2-6400: Try to attach the frontend
>        saa716x: Handle multiple I2C messages
>        saa716x: Fix ROM parser
>        saa716x: Setup default I2C rates
>        saa716x: Fix BUS ordering
>        saa716x: Fix swapped I2C buses
>        saa716x: Print wait time, reduce number of loops
>        saa716x: Fix missing address in single write operation
>        saa716x: make register definitions specific to each of the modules
>        saa716x: Fix register definition typo
>        saa716x: Add function declaration
>        saa716x: Fix FGPI internal clock divider state
>        saa716x: Fix dmabuf allocation
>        saa716x: Cleanup debug prints
>        saa716x: Handle failure correctly
>        saa716x: Handle proper buffer flush
>        saa716x: FGPI DMA handling fixes
>        saa716x: Finally! we have stream capture
>        saa716x: Make the framework buildable
>        saa716x: Fix build issues
>        saa716x: Deinitialize I2C interrupts on exit
>        saa716x: Factorize register/detach routines to common code
>        saa716x: Start DMA engine as and when requested
>        saa716x: Enable timeout for modules having no clock
>        saa716x: Reset the frontend after powerup
>        saa716x: GPIO fix
>        saa716x: Fix powerup/reset
>        saa716x: Use the correct I2C Bus
>        saa716x: Code simplification
>        saa716x: Try to attach frontend on the Nemo reference board
>        saa716x: Do not report non-fatal errors to avoid issues with buggy
> BIOS's
>
> Oliver Endriss (3):
>        saa716x_ff: Rename saa716x_ff.c to saa716x_ff_main.c
>        saa716x_ff: Support remote control receiver
>        saa716x: Use tasklet to transfer data to the demuxer (TT S2-6400)
>
> Soeren Moch (94):
>        saa716x: i2c_del_adapter() fix
>        saa716x_ff: init frontends to low-power mode
>        saa716x_ff: Add linux-4.5 support
>        saa716x_ff: Avoid sleeping in fifo_worker
>        saa716x: remove unused saa716x_msi_handler
>        saa716x: pci: Remove asm includes for compatibility with linux-4.6
>        saa716x: add linux-4.10 support
>        saa716x: Remove broken MSI-X support
>        saa716x: Use %zu printk format for sizeof return values
>        saa716x_budget: Fix build in linux-4.13
>        saa716x_hybrid: Fix build in linux-4.13
>        saa716x_ff: Remove autorepeat handling
>        saa716x_ff: Convert to new timer API
>        saa716x: adapt for moved header files
>        media: dvb/audio.h: re-add AUDIO_GET_PTS
>        saa716x: remove kernel version conditionals
>        saa716x: fix include directories
>        saa716x: fix module dependencies
>        saa716x: simplify irq registration
>        saa716x: remove unused multi-vector MSI support
>        saa716x: remove unused i2c irq code
>        saa716x: simplify MSI init
>        saa716x: perform soft reset on device probe
>        saa716x: remove separate msi reset
>        saa716x_ff: move phi reset to probe function
>        saa716x: also soft-reset greg and gpio blocks on device probe
>        saa716x: move demux_worker to saa716x_adap
>        saa716x: remove rom debug code
>        saa716x: remove unused audio input port code
>        saa716x: remove unused spi code
>        saa716x: remove unused audio function prototypes
>        saa716x: remove boot function prototypes from saa716x_priv.h
>        saa716x: remove unused greg code
>        saa716x: remove unused gpio code
>        saa716x: remove unused private config and adapter entries
>        saa716x: remove decoder resets from common code
>        saa716x: move function headers from priv.h to own header files
>        saa716x_hybrid: remove incomplete Avermedia H-788 support
>        saa716x_hybrid: remove incomplete Avermedia HC-82 support
>        saa716x_hybrid: remove incomplete Twinhan VP-6090 DVB-S support
>        saa716x_budget: remove incomplete KNC1 Dual S2 support
>        saa716x_budget: remove incomplete Twinhan VP-6002 support
>        saa716x_budget: remove incomplete Twinhan VP-3071 support
>        saa716x_budget: remove incomplete Twinhan VP-1028 support
>        saa716x_budget: document Technisat Skystar 2 Express HD support
>        saa716x: allow individual configuration of video ports
>        saa716x_ff: cleanup POINTER_LOCATION checkpatch errors
>        saa716x: cleanup SPACING checkpatch errors
>        saa716x: cleanup ASSIGN_IN_IF checkpatch errors
>        saa716x: cleanup COMPLEX_MACRO checkpatch errors
>        saa716x: cleanup OPEN_BRACE and ELSE_AFTER_BRACE checkpatch errors
>        saa716x: cleanup CODE_INDENT and SWITCH_CASE_INDENT_LEVEL
> checkpatch errors
>        saa716x: cleanup SPACE_BEFORE_TAB checkpatch warnings
>        saa716x: cleanup Kconfig
>        saa716x_ff: constify structs
>        saa716x_budget: constify config structs
>        saa716x_hybrid: constify config structs
>        saa716x: convert printk to pci_info/err/dbg
>        saa716x_ff: convert printk to pci_info/err/dbg
>        saa716x_budget: convert printk to pci_err/dbg
>        saa716x_hybrid: convert printk to pci_err/dbg
>        saa716x: remove dprintk macro
>        saa716x_ff: remove interrupt counting debug code
>        saa716x: cleanup RETURN_VOID checkpatch warnings
>        saa716x: remove unused adap_lock
>        saa716x: #include cleanup
>        saa716x: use kcalloc for array memory allocation
>        saa716x_ff: cleanup CONSTANT_COMPARISON checkpatch warning
>        saa716x_hybrid: cleanup UNNECESSARY_ELSE checkpatch warning
>        saa716x: cleanup dma buffer sg list allocation
>        saa716x_ff: use common device struct
>        saa716x_ff: cleanup LINE_SPACING checkpatch warning
>        saa716x: cleanup BRACES checkpatch warnings
>        saa716x_budget: cleanup BRACES checkpatch warnings
>        saa716x_hybrid: cleanup BRACES checkpatch warnings
>        saa716x_ff: cleanup BRACES checkpatch warnings
>        saa716x_ff: add SPDX license identifier
>        saa716x_budget: add SPDX license identifier
>        saa716x_hybrid: add SPDX license identifier
>        saa716x: add SPDX license identifier
>        saa716x_ff: cleanup comment style and length
>        saa716x_budget: cleanup comment style
>        saa716x: cleanup comment style and length
>        saa716x_budget: cleanup LONG_LINE checkpatch warnings
>        saa716x_hybrid: cleanup LONG_LINE checkpatch warnings
>        saa716x_ff: cleanup LONG_LINE checkpatch warnings
>        saa716x: cleanup LONG_LINE checkpatch warnings
>        saa716x: do not report recoverable i2c transfer errors
>        saa716x_ff: simplify PHI code
>        saa716x_budget/ff/hybrid: autoselect PCI interrupt mode
>        saa716x_ff: autoselect phi_mode
>        saa716x_budget: simplify TBS frontend attach code
>        saa716x: hook up driver in drivers/media/pci
>        saa716x: Add MAINTAINERS entry
>
> Tobias Klausmann (1):
>        saa716x: add frontend selects to kconfig
>
> Tycho Lürsen (1):
>        saa716x: constify pci_device_id.
>
> Uwe Scheffler (1):
>        saa716x_ff : reduce ir repeat delay and period
>
>   Documentation/media/uapi/dvb/audio-get-pts.rst     |   65 +
>   .../media/uapi/dvb/audio_function_calls.rst        |    1 +
>   MAINTAINERS                                        |    6 +
>   drivers/media/pci/Kconfig                          |    1 +
>   drivers/media/pci/Makefile                         |    1 +
>   drivers/media/pci/saa716x/Kconfig                  |   55 +
>   drivers/media/pci/saa716x/Makefile                 |   22 +
>   drivers/media/pci/saa716x/saa716x_adap.c           |  327 ++++
>   drivers/media/pci/saa716x/saa716x_adap.h           |   11 +
>   drivers/media/pci/saa716x/saa716x_aip_reg.h        |   64 +
>   drivers/media/pci/saa716x/saa716x_boot.c           |   95 ++
>   drivers/media/pci/saa716x/saa716x_boot.h           |   13 +
>   drivers/media/pci/saa716x/saa716x_budget.c         |  503 ++++++
>   drivers/media/pci/saa716x/saa716x_budget.h         |   14 +
>   drivers/media/pci/saa716x/saa716x_cgu.c            |  542 +++++++
>   drivers/media/pci/saa716x/saa716x_cgu.h            |   65 +
>   drivers/media/pci/saa716x/saa716x_cgu_reg.h        |  180 +++
>   drivers/media/pci/saa716x/saa716x_dcs_reg.h        |   58 +
>   drivers/media/pci/saa716x/saa716x_dma.c            |  297 ++++
>   drivers/media/pci/saa716x/saa716x_dma.h            |   65 +
>   drivers/media/pci/saa716x/saa716x_dma_reg.h        |  204 +++
>   drivers/media/pci/saa716x/saa716x_ff.h             |  186 +++
>   drivers/media/pci/saa716x/saa716x_ff_cmd.c         |  450 ++++++
>   drivers/media/pci/saa716x/saa716x_ff_cmd.h         |   18 +
>   drivers/media/pci/saa716x/saa716x_ff_ir.c          |  194 +++
>   drivers/media/pci/saa716x/saa716x_ff_ir.h          |   27 +
>   drivers/media/pci/saa716x/saa716x_ff_main.c        | 1598
> ++++++++++++++++++++
>   drivers/media/pci/saa716x/saa716x_ff_phi.c         |  103 ++
>   drivers/media/pci/saa716x/saa716x_ff_phi.h         |   15 +
>   drivers/media/pci/saa716x/saa716x_fgpi.c           |  397 +++++
>   drivers/media/pci/saa716x/saa716x_fgpi.h           |   94 ++
>   drivers/media/pci/saa716x/saa716x_fgpi_reg.h       |   76 +
>   drivers/media/pci/saa716x/saa716x_gpio.c           |   77 +
>   drivers/media/pci/saa716x/saa716x_gpio.h           |   22 +
>   drivers/media/pci/saa716x/saa716x_gpio_reg.h       |   49 +
>   drivers/media/pci/saa716x/saa716x_greg_reg.h       |   96 ++
>   drivers/media/pci/saa716x/saa716x_hybrid.c         |  471 ++++++
>   drivers/media/pci/saa716x/saa716x_hybrid.h         |   12 +
>   drivers/media/pci/saa716x/saa716x_i2c.c            |  578 +++++++
>   drivers/media/pci/saa716x/saa716x_i2c.h            |   52 +
>   drivers/media/pci/saa716x/saa716x_i2c_reg.h        |  147 ++
>   drivers/media/pci/saa716x/saa716x_mod.h            |   27 +
>   drivers/media/pci/saa716x/saa716x_msi_reg.h        |  145 ++
>   drivers/media/pci/saa716x/saa716x_pci.c            |  167 ++
>   drivers/media/pci/saa716x/saa716x_pci.h            |    9 +
>   drivers/media/pci/saa716x/saa716x_phi_reg.h        |   96 ++
>   drivers/media/pci/saa716x/saa716x_priv.h           |  105 ++
>   drivers/media/pci/saa716x/saa716x_spi_reg.h        |   29 +
>   drivers/media/pci/saa716x/saa716x_vip.c            |  396 +++++
>   drivers/media/pci/saa716x/saa716x_vip.h            |   60 +
>   drivers/media/pci/saa716x/saa716x_vip_reg.h        |  143 ++
>   include/uapi/linux/dvb/audio.h                     |   13 +
>   include/uapi/linux/dvb/osd.h                       |   16 +
>   53 files changed, 8457 insertions(+)
>   create mode 100644 Documentation/media/uapi/dvb/audio-get-pts.rst
>   create mode 100644 drivers/media/pci/saa716x/Kconfig
>   create mode 100644 drivers/media/pci/saa716x/Makefile
>   create mode 100644 drivers/media/pci/saa716x/saa716x_adap.c
>   create mode 100644 drivers/media/pci/saa716x/saa716x_adap.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_aip_reg.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_boot.c
>   create mode 100644 drivers/media/pci/saa716x/saa716x_boot.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_budget.c
>   create mode 100644 drivers/media/pci/saa716x/saa716x_budget.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_cgu.c
>   create mode 100644 drivers/media/pci/saa716x/saa716x_cgu.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_cgu_reg.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_dcs_reg.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_dma.c
>   create mode 100644 drivers/media/pci/saa716x/saa716x_dma.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_dma_reg.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_ff.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_ff_cmd.c
>   create mode 100644 drivers/media/pci/saa716x/saa716x_ff_cmd.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_ff_ir.c
>   create mode 100644 drivers/media/pci/saa716x/saa716x_ff_ir.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_ff_main.c
>   create mode 100644 drivers/media/pci/saa716x/saa716x_ff_phi.c
>   create mode 100644 drivers/media/pci/saa716x/saa716x_ff_phi.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_fgpi.c
>   create mode 100644 drivers/media/pci/saa716x/saa716x_fgpi.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_fgpi_reg.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_gpio.c
>   create mode 100644 drivers/media/pci/saa716x/saa716x_gpio.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_gpio_reg.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_greg_reg.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_hybrid.c
>   create mode 100644 drivers/media/pci/saa716x/saa716x_hybrid.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_i2c.c
>   create mode 100644 drivers/media/pci/saa716x/saa716x_i2c.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_i2c_reg.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_mod.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_msi_reg.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_pci.c
>   create mode 100644 drivers/media/pci/saa716x/saa716x_pci.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_phi_reg.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_priv.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_spi_reg.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_vip.c
>   create mode 100644 drivers/media/pci/saa716x/saa716x_vip.h
>   create mode 100644 drivers/media/pci/saa716x/saa716x_vip_reg.h
>
