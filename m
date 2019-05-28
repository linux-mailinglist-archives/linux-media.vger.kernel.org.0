Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 045462CFCE
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 21:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbfE1TyS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 15:54:18 -0400
Received: from casper.infradead.org ([85.118.1.10]:41726 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbfE1TyS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 15:54:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Z3k5xBGMSKwawaezDWEAWwQLMOK/+b9wbZXeY/husxQ=; b=pEbD5PVhWhFhXNY8ZW9Ez8Qn7U
        AzzJeiRK9JVTK653EMsp9xs79unKQ/Xrd4tri3XXeJuuNj0KQC2Dt18BgwVOvLZmyrh+fRXny8f6r
        62cnYanlO/1QbXDS0rKCfZbo7vbHhk9nRsa+qvXOGr9io+aEVLD/aeNshArL3uxwgvdgeufZBKyY4
        F+E2wKWTsAAsqunxvAmtr0WhQIm/McfPjwvhKWNtCofQRO47nG61T71Eq7EExwLAy7VR5DnJKYnuX
        f5Ao7QdEPTU9phbqeSjZwZ2OP8BsFfXxJHHw9usAAXBK60EKVUfBhsODyyxy7LB2mRVTVg80XzRNC
        8RTWr5ug==;
Received: from [187.58.202.19] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hViAo-0002pa-2O; Tue, 28 May 2019 19:54:15 +0000
Date:   Tue, 28 May 2019 16:54:10 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Tycho =?UTF-8?B?TMO8cnNlbg==?= <tycholursen@gmail.com>
Cc:     Soeren Moch <smoch@web.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL v2] SAA716x DVB driver
Message-ID: <20190528165410.4fcb76ac@coco.lan>
In-Reply-To: <45c4fce8-ae0a-ff81-bcfd-5e798986be02@gmail.com>
References: <5fc93954-b5a6-c7d2-527f-1c60f3613318@web.de>
        <45c4fce8-ae0a-ff81-bcfd-5e798986be02@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 23 May 2019 14:42:13 +0200
Tycho L=C3=BCrsen <tycholursen@gmail.com> escreveu:

> @Mauro:
>=20
> What's keeping you from pulling this driver?=20

It was sent too late during 5.2 development cycle, and as a pull
request only.

Patches should be sent to the ML first for review before I would
accept a pull request.

Also, I usually won't accept new drivers by -rc6, as reviewing those
takes a lot of time (and this time, I was really busy at -rc6 week,
when he submitted the PR).

> As far as I can see, Soeren=20
> Moch did in fact resolve all of your prior objections regarding this=20
> driver, including the api changes. I get that your opinion regarding=20
> these api changes differs from Soeren Moch's opinion, but there is no=20
> evidence whatsoever that these changes can in fact hurt the kernel. It=20
> still boils down to different opinions. That sucks...

If he didn't make the API changes as requested, it is not good to
be applied at drivers/media. I may consider it for drivers/staging/media.

Please notice that there are some API headers (audio.h, video.h/...)
that were already considered deprecated by the core media maintainers
and will vanish when we remove saa7111 driver. So, if we merge the
saa716x at staging and it depends on them, by the time we opt to
remove saa7111, we'll move those headers to the staging dir too.

Regards,
Mauro

>=20
> I beg you to overcome these differences, you can do that!
>=20
> Please pull.
>=20
> Cheers,
>=20
> Tycho.
>=20
> Op 02-04-2019 om 10:06 schreef Soeren Moch:
> > This is a driver for DVB cards based on SAA7160/61/62 PCIe bridges from
> > Philips/NXP. The most important of these cards, at least for me, is the
> > TechnoTrend S2-6400, a high-definition full-featured DVB-S2 card, the
> > successor of the famous ttpci decoder cards for use with applications
> > like vdr. Although equipped with a decoder, the S2-6400 is not able to
> > send the decoded video back over PCIe, so the output part of this
> > card cannot be used with applications like kaffeine.
> >
> > Other cards supported by this driver:
> > Technisat SkyStar 2 eXpress HD
> > TurboSight 6281 (DVB-T/T2/C)
> > TurboSight 6285 (DVB-T/T2/C)
> > Twinhan/Azurewave VP-6090
> >
> > The driver was taken from [1], converted to git and moved to
> > drivers/media/pci. It is adapted for current mainline (v5.1-rc1)
> > with lots of clean-up work done.
> > This driver was licensed "GPL" from the beginning. S2-6400 firmware is
> > available at [2].
> >
> > I preserved the development history of the driver, since this
> > is mainly work of Andreas Regel, Manu Abraham, and Oliver Endriss.
> > Additional support for TBS cards was provided by Luis Alves and
> > Tycho L=C3=BCrsen. Also thanks to Tobias Klausmann and Uwe Scheffler
> > for their code contributions and testing work.
> >
> > Unfortunately Andreas seems not to take care of this driver anymore, he
> > also did not answer my requests to integrate patches for newer kernel
> > versions. So I send this upstream.
> >
> > Changes since v1 of this pull request [3]:
> > - rebased and adapted to linux-5.1-rc1
> > - added support for TBS cards
> > - fixed IRQ/MSI init
> > - fixed module dependencies
> > - converted logging to pci_info/dbg/err
> > - submitted for media/pci, not staging/media, all clean-up work done
> > Remaining checkpatch warnings for lines over 80 characters are only
> > to keep message strings and "code tables" intact.
> >
> > There was a request to convert the DVB API output part in this driver
> > to "something more modern", apparently under the wrong assumption that
> > this API is used here as some older version of a v4l2 decoder API.
> > But the S2-6400 is a completely different class of hardware, with
> > different and much simpler API requirements. The S2-6400 hardware
> > is not able to send the decoded video back over PCIe. This driver has
> > no access to the decoded video, and it is not in charge of controlling
> > the video decoder on this card. The only available hardware interface
> > for the dvb audio/video device is a fifo buffer to receive a DVB
> > transport stream. So this driver only uses following calls from the
> > DVB output API:
> > - write a TS to the fifo via the video device node
> > - 3 ioctls: reset fifo, get time stamp of packet at receiving end of fi=
fo,
> >  =C2=A0 switch from fifo interface to DVB frontend (or back) for receiv=
ed TS
> >  From an API point of view, this driver does not even know that there is
> > a video decoder behind the fifo. It could as well be a transmission
> > line, or a dvb modulator.
> > This simple DVB transport stream output API very well meets the needs of
> > the vdr application, I don't see why and how this should be converted
> > to something different.
> > Note: there is a debug access to a single decoded image in this driver,
> > this is gated by a module option and disabled by default. Due to
> > bandwith limitations on the card this should not be used in parallel
> > to normal vdr operation.
> >
> > [1] https://bitbucket.org/powARman/v4l-dvb-saa716x/
> > [2] http://www.aregel.de/downloads/
> > [3] https://www.mail-archive.com/linux-media@vger.kernel.org/msg115690.=
html
> >
> >
> >
> > The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa=
231b:
> >
> >  =C2=A0 Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> >
> > are available in the Git repository at:
> >
> >  =C2=A0 https://github.com/s-moch/linux-saa716x for-media-v2
> >
> > for you to fetch changes up to 33590a6a58a3d350678cd8aef4ea1578d66494fa:
> >
> >  =C2=A0 saa716x: Add MAINTAINERS entry (2019-03-25 08:53:42 +0100)
> >
> > ----------------------------------------------------------------
> > Andreas Regel (127):
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Simplified the code for I2C tr=
ansfers.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Transport stream ports can be =
configured now.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Disable frontend support th=
rough STi7109 firmware.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Initialize the frontend of =
the TT S2-6400.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Add VIDEO_GET_PTS ioctl.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Add audio device for TT S2-=
6400.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Use separate interrupts for=
 OSD commands.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Use third TS input of the S=
Ti7109 for playback
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Set error code when boot of=
 firmware failed.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Added 10ms sleep after conf=
iguring the FPGA.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Reduce compiler warnings
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: fix kernel oops caused by miss=
ing initialisation
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: fixed double frontend detach
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: 1ms is enough when waiting for=
 the PLL
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Adapted frontend init to la=
test driver changes.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Improve PHI performance by sho=
rten timings a bit.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: use double buffering for bl=
ock transfers.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Reset block_done after rece=
iving it.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: add interrupt source for fi=
rmware log messages
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: read FPGA version register
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: fixed PTS/STC signed/unsign=
ed issue
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: query and print loader and =
firmware versions
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: disable debug printk
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 osd.h: Add const keyword to struct memb=
ers
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: implement ioctl VIDEO_GET_S=
IZE
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: support production version =
of the S2-6400
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: disable OVERFLOW and AV interr=
upts in FGPI
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: add some FPGA register defi=
nitions
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: restart TS capturing in cas=
e of non-aligned TS error
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: don't clear FGPI interrupts=
 in IRQ routine.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: comment out SPI functions that=
 are not needed currently
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: add changes needed for kernel =
2.6.36 and up.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: support building with media_bu=
ild_experimental
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: use tasklet for FIFO transf=
er
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: fix not working MSI
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Disable shared IRQ when using =
MSI mode.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Do an explicit demodulator =
reset.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: enable wait for PLL lock when =
setting clocks of all ports.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: add counting of interrupts
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: don't set i2c_adapter id field
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: support non-aligned TS data
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Use a TS clock of 135Mhz in=
stead of 90 Mhz.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Ignore false remote events.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Fix possible crash in IRQ h=
andler.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: move firmware command inter=
face code to separate file.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Allow to have osd device op=
ened twice.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: support correct TS mux sett=
ing for FPGA 1.10.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: Add missing GPIO initia=
lization.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: Add missing GPIO initia=
lization.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: fix tuner settings for =
nemo reference board
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: TS capturing on the nem=
o reference board works.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: Make TS capturing code =
more generic.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove unused members from str=
uct saa716x_config.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add function saa716x_fgpi_get_=
write_index.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: Use saa716x_fgpi_get_wr=
ite_index to simplify code.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Use saa716x_fgpi_get_write_=
index to simplify code.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Set maximum number of adapters=
 per saa716x to 4.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: Add TS capturing code.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: Do some cleanups.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove unused load_config func=
tions.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: Started with SkyStar 2 =
eXpress HD.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: Add support for KWorld =
Dual DVB-T PE310.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix I2C bus assignment on SAA7=
160ET.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix stack corruption when pars=
ing ROM info.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix memory leak in ROM parsing.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Skip unknown device descriptor=
s when parsing the ROM
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: change verbose level for some =
dprintk
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Enable now working EEPROM p=
arsing.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Add error message when FPGA=
 is not responding.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: Add frontend attach for=
 the Skystar2 eXpress HD.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Reset the frontend on the S=
kyStar2 eXpress HD.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: support CEC remote codes.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Use interrupts for I2C writes =
instead of polling.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: separate I2C reading and writi=
ng into two functions.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: change remote event printk =
to hexadecimal output.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Support buffered I2C transacti=
on using interrupts.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Use buffered I2C interrupt =
mode.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Don't use dvb_generic_ioctl.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: Use GPIO 26 for reset o=
n the Skystar 2 eXpress HD.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: Use I2C B for accessing=
 the frontend on the Skystar.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: Get the Skystar 2 eXpre=
ss HD to work.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: Implement LNB power swi=
tching for Skystar 2
> > eXpress HD.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Fix memory leak.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Fix missing copy user <-> k=
ernel space.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: FGPI DMA buffer size is passed=
 to saa716x_fgpi_init.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix FGPI settings for SD video=
 capture.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Export some FGPI functions.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Remove unused header file.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Remove duplicate definition.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Make BAM register macros more =
generic.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Use global macros for MMU regi=
ster access.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add VI module implementation.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Support one-shot video capturi=
ng.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Extend interrupt counters.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Change video capture format fr=
om YUYV to UYUV.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Support capturing digital v=
ideo coming from STi7109.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Protect reading of the capt=
ured video with a mutex.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Rename functions.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: video capture refactoring.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Use pitch value from stream pa=
rams when setting FGPI_STRIDE.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: use offset from stream params =
instead of fixed value.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Clear DMA buffer after allocat=
iion
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Support capturing raw data via=
 FGPI unit
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Reset FGPI read index in saa71=
6x_fgpi_start
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Cancel data transfer in cas=
e of a block timeout
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: print decimal digits for fi=
rmware version.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: include fix for in-kernel build
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: support directory structure of=
 linux-3.7+
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: section mismatch fixes
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove __devinit and friends
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: convert fifo_worker tasklet to=
 workqueue
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: TS output buffer cleanup
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix PHI address space offsets,=
 cleanup register definitions.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Clean up PHI configuration.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Reset PHI on init.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Print EEPROM content on DEBUG =
verbosity only.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix errors and improve saa716x=
_set_clk.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Fix not setting command res=
ult length to 0 per default.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: move card specific PHI code to=
 saa716x_ff driver
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: use special phi_fifo_write =
function
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Add write-combining PCI iom=
em window for PHI1 access.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: implement PHI speedup
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: IO memory of upper PHI1 region=
s is mapped in saa716x_ff
> > driver.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Optimize access to FIFO.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Align block data on 32 byte=
s for firmware 0.5.0 and up
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Do not return on command re=
ady timeout
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Usa faster EMI timings only=
 for FPGA version 1.10 and
> > later
> >
> > Luis Alves (1):
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add support for tbs 6281 and t=
bs 6285 cards.
> >
> > Manu Abraham (137):
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Initial framework driver to su=
pport SAA7160, SAA7161,
> > SAA7162 chips
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add missing return, to avoid f=
alling through the error codes
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Updated board definitions
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add some register definitions
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add Read/Write macros
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Initial attempt to Boot the co=
re
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Initial attempt to initialize =
the I2C core
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Setup CGU
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Whitespace cleanup
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Use subsystem Vendor ID
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Small cleanups
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Enable all inputs
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Initial go at MSI setup
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Update I2C register definition=
s and fields
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Initial go at the I2C implemen=
tation
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Remove unused definitions
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Move i2c related stuff to it's=
 own header
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add some labels
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Rename files
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix subdevice ID
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add more register definitions
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Update/Reorganize register def=
initions
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Implement internal Boot mode
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Update register definitions
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Still scratching
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Initialize MSI
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Cleanup internal Boot configur=
ation
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Cleanup external Boot configur=
ation
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Initialize CGU and MSI modules
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Enable more debugging
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Check DMA availability
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Small cleanups and fixes
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix typo
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Reset internal modules
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Still debugging
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Code simplification
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Terminate PCI ID list
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Rename Rd/Wr operations
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix usage of wrong datatypes
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: CGU related fixes
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Continue MSI-X implementation
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add routines to handle clock r=
elated events
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add support for Avermedia HC82=
 PCIe expresscard
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Disable BAR2 access
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Code cleanup
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Register SAA716x Adapter
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add initial support for the se=
cond adapter
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Initialize adapters on the bud=
get device
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Register only the relevant ada=
pters for a specific device
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add Avermedia HC82 specific de=
vice configuration
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix typo
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Register an array of devices
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add support for the Avermedia =
H788 device
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add support for the Azurewave =
VP-6002 device
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Usea separate frontend_attach =
for each of the devices
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Use a separate IRQ handler for=
 separate modules
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Try to attach the demodulator
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix typo in register definitio=
ns
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Updates and Code simplificatio=
n=C2=A0 - Initialize the I2C
> > clock=C2=A0 - Disable core reset for hybrid cards
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Check device revision for I2C =
bus orderring
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add support for the NXP Atlant=
is reference design
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Free IRQ before module unload
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Code reorganization
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add support for the KNC1 Dual =
S2 device
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add support for the VP-3071 DV=
B-T dual device
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add GPIO control functions
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Use power and reset controls w=
ithin a sig\ngle loop
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Use a configuration per adapter
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: VP-1028: add power, reset conf=
iguration
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: H788: Add power, reset configu=
ration
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: HC82: Add power, reset configu=
ration
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Display Bus status
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Bug: Address needs to be shift=
ed one bit
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Initial go at DMA routines
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Print warning, if MSI module i=
s not supported
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Handle MSI in a generic manner
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add PHI port definitions
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Initialize PHI bus
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add GREG routines
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Reorganize CGU related routines
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Do not initialize the CGU twice
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add more debug info, initializ=
e handler count
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add/remove I2C MSI vectors
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add interrupt debugging
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Return error on MSI enable fai=
lure
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Initialize FPGI pagetables
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Setup FGPI parameters
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Use a separate module to handl=
e Full fledged cards
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: NULL terminate PCI ID list
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Read the mask bits instead
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Reduce a bit of noise in the h=
andler debug mode
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Sleep a little while before en=
abling interrupts again
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Use individual handlers
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Transmit D is programmed, not =
S data
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Print return values
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Use adapter ordering
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Disable debugging
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 osd.h: Kickstart the TT S2 6400 Dual HD=
 Premium - OSD update
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Kickstart the TT S2 6400 Dual =
HD Premium
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Code simplification, Overhaul,=
 ROM dump
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Set the default rate for the N=
EMO reference design
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Code simplification, Overhauli=
ng, I2C related fixes
> > Initial test with the NEMO reference device
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Try to attach the frontends
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Don't cast pointers to 32 bit =
int
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Partial rework of SPI I/O
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add video device support
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: S2-6400: Try to attach the fro=
ntend
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Handle multiple I2C messages
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix ROM parser
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Setup default I2C rates
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix BUS ordering
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix swapped I2C buses
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Print wait time, reduce number=
 of loops
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix missing address in single =
write operation
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: make register definitions spec=
ific to each of the modules
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix register definition typo
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add function declaration
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix FGPI internal clock divide=
r state
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix dmabuf allocation
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Cleanup debug prints
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Handle failure correctly
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Handle proper buffer flush
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: FGPI DMA handling fixes
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Finally! we have stream capture
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Make the framework buildable
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix build issues
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Deinitialize I2C interrupts on=
 exit
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Factorize register/detach rout=
ines to common code
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Start DMA engine as and when r=
equested
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Enable timeout for modules hav=
ing no clock
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Reset the frontend after power=
up
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: GPIO fix
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Fix powerup/reset
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Use the correct I2C Bus
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Code simplification
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Try to attach frontend on the =
Nemo reference board
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Do not report non-fatal errors=
 to avoid issues with buggy
> > BIOS's
> >
> > Oliver Endriss (3):
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Rename saa716x_ff.c to saa7=
16x_ff_main.c
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Support remote control rece=
iver
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Use tasklet to transfer data t=
o the demuxer (TT S2-6400)
> >
> > Soeren Moch (94):
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: i2c_del_adapter() fix
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: init frontends to low-power=
 mode
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Add linux-4.5 support
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Avoid sleeping in fifo_work=
er
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove unused saa716x_msi_hand=
ler
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: pci: Remove asm includes for c=
ompatibility with linux-4.6
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: add linux-4.10 support
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Remove broken MSI-X support
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Use %zu printk format for size=
of return values
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: Fix build in linux-4.13
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: Fix build in linux-4.13
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Remove autorepeat handling
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: Convert to new timer API
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: adapt for moved header files
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: dvb/audio.h: re-add AUDIO_GET_PTS
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove kernel version conditio=
nals
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: fix include directories
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: fix module dependencies
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: simplify irq registration
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove unused multi-vector MSI=
 support
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove unused i2c irq code
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: simplify MSI init
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: perform soft reset on device p=
robe
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove separate msi reset
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: move phi reset to probe fun=
ction
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: also soft-reset greg and gpio =
blocks on device probe
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: move demux_worker to saa716x_a=
dap
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove rom debug code
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove unused audio input port=
 code
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove unused spi code
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove unused audio function p=
rototypes
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove boot function prototype=
s from saa716x_priv.h
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove unused greg code
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove unused gpio code
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove unused private config a=
nd adapter entries
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove decoder resets from com=
mon code
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: move function headers from pri=
v.h to own header files
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: remove incomplete Averm=
edia H-788 support
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: remove incomplete Averm=
edia HC-82 support
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: remove incomplete Twinh=
an VP-6090 DVB-S support
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: remove incomplete KNC1 =
Dual S2 support
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: remove incomplete Twinh=
an VP-6002 support
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: remove incomplete Twinh=
an VP-3071 support
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: remove incomplete Twinh=
an VP-1028 support
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: document Technisat Skys=
tar 2 Express HD support
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: allow individual configuration=
 of video ports
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: cleanup POINTER_LOCATION ch=
eckpatch errors
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: cleanup SPACING checkpatch err=
ors
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: cleanup ASSIGN_IN_IF checkpatc=
h errors
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: cleanup COMPLEX_MACRO checkpat=
ch errors
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: cleanup OPEN_BRACE and ELSE_AF=
TER_BRACE checkpatch errors
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: cleanup CODE_INDENT and SWITCH=
_CASE_INDENT_LEVEL
> > checkpatch errors
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: cleanup SPACE_BEFORE_TAB check=
patch warnings
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: cleanup Kconfig
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: constify structs
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: constify config structs
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: constify config structs
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: convert printk to pci_info/err=
/dbg
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: convert printk to pci_info/=
err/dbg
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: convert printk to pci_e=
rr/dbg
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: convert printk to pci_e=
rr/dbg
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove dprintk macro
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: remove interrupt counting d=
ebug code
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: cleanup RETURN_VOID checkpatch=
 warnings
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: remove unused adap_lock
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: #include cleanup
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: use kcalloc for array memory a=
llocation
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: cleanup CONSTANT_COMPARISON=
 checkpatch warning
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: cleanup UNNECESSARY_ELS=
E checkpatch warning
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: cleanup dma buffer sg list all=
ocation
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: use common device struct
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: cleanup LINE_SPACING checkp=
atch warning
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: cleanup BRACES checkpatch warn=
ings
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: cleanup BRACES checkpat=
ch warnings
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: cleanup BRACES checkpat=
ch warnings
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: cleanup BRACES checkpatch w=
arnings
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: add SPDX license identifier
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: add SPDX license identi=
fier
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: add SPDX license identi=
fier
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: add SPDX license identifier
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: cleanup comment style and l=
ength
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: cleanup comment style
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: cleanup comment style and leng=
th
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: cleanup LONG_LINE check=
patch warnings
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_hybrid: cleanup LONG_LINE check=
patch warnings
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: cleanup LONG_LINE checkpatc=
h warnings
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: cleanup LONG_LINE checkpatch w=
arnings
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: do not report recoverable i2c =
transfer errors
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: simplify PHI code
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget/ff/hybrid: autoselect PC=
I interrupt mode
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff: autoselect phi_mode
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_budget: simplify TBS frontend a=
ttach code
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: hook up driver in drivers/medi=
a/pci
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: Add MAINTAINERS entry
> >
> > Tobias Klausmann (1):
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: add frontend selects to kconfig
> >
> > Tycho L=C3=BCrsen (1):
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x: constify pci_device_id.
> >
> > Uwe Scheffler (1):
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saa716x_ff : reduce ir repeat delay and=
 period
> >
> >  =C2=A0Documentation/media/uapi/dvb/audio-get-pts.rst=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 65 +
> >  =C2=A0.../media/uapi/dvb/audio_function_calls.rst=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> >  =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 6 +
> >  =C2=A0drivers/media/pci/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> >  =C2=A0drivers/media/pci/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> >  =C2=A0drivers/media/pci/saa716x/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 55 +
> >  =C2=A0drivers/media/pci/saa716x/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 22 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_adap.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 327 ++++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_adap.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 11 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_aip_reg.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 64 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_boot.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 95 ++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_boot.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 13 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_budget.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 503 ++++++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_budget.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 14 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_cgu.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 542 +++++++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_cgu.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 65 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_cgu_reg.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 180 +++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_dcs_reg.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 58 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_dma.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 297 ++++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_dma.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 65 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_dma_reg.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 204 +++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_ff.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 186 +++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_ff_cmd.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 450 ++++++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_ff_cmd.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 18 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_ff_ir.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 194 +++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_ff_ir.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 27 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_ff_main.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1598
> > ++++++++++++++++++++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_ff_phi.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 103 ++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_ff_phi.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 15 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_fgpi.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 397 +++++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_fgpi.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 94 ++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_fgpi_reg.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 76 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_gpio.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 77 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_gpio.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 22 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_gpio_reg.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 49 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_greg_reg.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 96 ++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_hybrid.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 471 ++++++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_hybrid.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 12 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_i2c.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 578 +++++++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_i2c.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 52 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_i2c_reg.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 147 ++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_mod.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 27 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_msi_reg.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 145 ++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_pci.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 167 ++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_pci.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 9 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_phi_reg.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 96 ++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_priv.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 105 ++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_spi_reg.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 29 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_vip.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 396 +++++
> >  =C2=A0drivers/media/pci/saa716x/saa716x_vip.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 60 +
> >  =C2=A0drivers/media/pci/saa716x/saa716x_vip_reg.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 143 ++
> >  =C2=A0include/uapi/linux/dvb/audio.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 13 +
> >  =C2=A0include/uapi/linux/dvb/osd.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 16 +
> >  =C2=A053 files changed, 8457 insertions(+)
> >  =C2=A0create mode 100644 Documentation/media/uapi/dvb/audio-get-pts.rst
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/Kconfig
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/Makefile
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_adap.c
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_adap.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_aip_reg.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_boot.c
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_boot.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_budget.c
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_budget.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_cgu.c
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_cgu.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_cgu_reg.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_dcs_reg.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_dma.c
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_dma.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_dma_reg.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_ff.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_ff_cmd.c
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_ff_cmd.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_ff_ir.c
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_ff_ir.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_ff_main.c
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_ff_phi.c
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_ff_phi.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_fgpi.c
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_fgpi.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_fgpi_reg.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_gpio.c
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_gpio.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_gpio_reg.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_greg_reg.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_hybrid.c
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_hybrid.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_i2c.c
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_i2c.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_i2c_reg.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_mod.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_msi_reg.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_pci.c
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_pci.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_phi_reg.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_priv.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_spi_reg.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_vip.c
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_vip.h
> >  =C2=A0create mode 100644 drivers/media/pci/saa716x/saa716x_vip_reg.h
> > =20



Thanks,
Mauro
