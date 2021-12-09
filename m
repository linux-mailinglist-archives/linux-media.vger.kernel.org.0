Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B6046E3F4
	for <lists+linux-media@lfdr.de>; Thu,  9 Dec 2021 09:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234475AbhLIIU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Dec 2021 03:20:56 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:43324 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhLIIU4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Dec 2021 03:20:56 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6F7B0B823CE
        for <linux-media@vger.kernel.org>; Thu,  9 Dec 2021 08:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 816B9C004DD;
        Thu,  9 Dec 2021 08:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639037841;
        bh=oXUw2Z1pRmJ6PhEzFdXwz8MNrCTJ4n0B3EZXm10ddxQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=g4Vg2aJeGSSebt4vgW0e8Jp3/i06RWZpH50D+0jZ3CHS62Hsbl9hd5XBmFCm4LAqU
         4oVQ9CeAlqL6+zzDVkM8aN01tziZFW0Y7yQpVkIpp9mSJBTD1rxcCvDVN6WSpwkru9
         ucTJbeumxWeyP15H+nVlNV+E69wgXg1QKoIOsB901PtOqbMX3Cegk+cLFqScKcdc21
         KjPgalmEocaruXcFDeeOK0O4YXdQnOnZzUcz4cz/8S2CINOXVxcvkabzk95S6o0s0F
         RMpfFe0jSxVbQiNe6/ViYYmW6EM4r1RjpySy0NxTnk63PziClhhgt5jTSgvdjoeJN9
         9hh+2kqZqJcFw==
Date:   Thu, 9 Dec 2021 09:17:17 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Robert Schlabbach <robert_s@gmx.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH RFC] media: si2157: optionally load firmare for
 SI2146_A10 and
Message-ID: <20211209091717.3107faca@coco.lan>
In-Reply-To: <trinity-8c68f148-355b-481f-8671-fb703307cb76-1639004515653@3c-app-gmx-bap08>
References: <cd3a382dc39e72229a73149cb91e80cf69e2b07d.1638958947.git.mchehab+huawei@kernel.org>
        <trinity-8c68f148-355b-481f-8671-fb703307cb76-1639004515653@3c-app-gmx-bap08>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 9 Dec 2021 00:01:55 +0100
Robert Schlabbach <robert_s@gmx.net> escreveu:

> > + case SI2146_A10:
> > + fw_required = false;
> > + fallthrough;
> > case SI2141_A10:
> > fw_name = SI2141_A10_FIRMWARE;
> > break;  
> 
> I don't think this form of firmware name aliasing is
> a good idea. The SiLabs code has a dedicated source
> file for the ROM patch for each tuner model, even if
> some are binary identical.
> 
> And in this particular case, there are not even
> binary identical firmware patches available for these
> two tuners, so they definitely should NOT share the
> same firmware filename.

Ok.

> So I propose having a clean 1:1 model <-> firmware
> filename mapping.

Makes sense.

> For si2157/si2177 and si2148/si2158
> it's already too late, but we should not expand this
> error even further.

It is not too late. It is just a matter of adding a secondary
firmware name for those devices. if the primary (new) name
is not found, the driver would try the old name for those
firmwares. As this is the current namespace:

#define SI2158_A20_FIRMWARE "dvb-tuner-si2158-a20-01.fw"
#define SI2141_A10_FIRMWARE "dvb-tuner-si2141-a10-01.fw"
#define SI2157_A30_FIRMWARE "dvb-tuner-si2157-a30-01.fw"

We would need to have a different namespace for the newer firmware
file model. On a quick look at the opensourced drivers, those seem to
be the firmware structs over there:

	$ git grep 'firmware_struct.*=.\s*{' TER|perl -ne 'print "$1\n" if m/struct.*(Si[^\[]+)/'
	Si2124_FW_2_1b5
	Si2141_FW_0_Ab23
	Si2141_FW_1_1b12
	Si2144_FW_2_1b5
	Si2147_FW_3_1b3
	Si2148_FW_2_1b11
	Si2151_FW_0_Ab23
	Si2151_FW_1_1b11
	Si2157_FW_3_1b3
	Si2158B_FW_0_Ab15
	Si2158B_FW_4_1b3
	Si2177_FW_3_1b3
	Si2178B_FW_0_Ab15
	Si2178B_FW_4_1b3

If the idea is to be as close as possible to how the original firmware are named,
we could do, e. g. something like this:

	$ git grep 'firmware_struct.*=.\s*{' TER|perl -ne 'tr /A-Z/a-z/; print "dvb_driver_si$1_$2.fw\n" if m/struct.*si(\w+)_fw_([^\[]+)/'
	dvb_driver_si2124_2_1b5.fw
	dvb_driver_si2141_0_ab23.fw
	dvb_driver_si2141_1_1b12.fw
	dvb_driver_si2144_2_1b5.fw
	dvb_driver_si2147_3_1b3.fw
	dvb_driver_si2148_2_1b11.fw
	dvb_driver_si2151_0_ab23.fw
	dvb_driver_si2151_1_1b11.fw
	dvb_driver_si2157_3_1b3.fw
	dvb_driver_si2158b_0_ab15.fw
	dvb_driver_si2158b_4_1b3.fw
	dvb_driver_si2177_3_1b3.fw
	dvb_driver_si2178b_0_ab15.fw
	dvb_driver_si2178b_4_1b3.fw

On other words, for si2157, for instance, the driver would first try
to load:
	dvb_driver_si2157_3_1b3.fw
if it fails, it would try:
	dvb-tuner-si2157-a30-01.fw

This is backward compatible and should be flexible enough to support
different firmware for different tuners.

There are some issues, though. This would require to have all those
firmware files generated from the opensourced sources and stored somewhere,
assuming that the license would allow that.

Also, as the firmware files will probably be different, tests with
the different supported models will be required to be sure that the
code is compatible with them (as the API might have changed on
some of those).

> More broadly, the SiLabs code actually matches the
> applicable firmware patch to the rom_id returned by
> the tuner. So if we wanted to do a real cleanup,
> I would propose having a const struct table, e.g.
> 
> const struct {
>     unsigned char part;
>     unsigned char chiprev;
>     unsigned char pmajor;
>     unsigned char pminor;
>     unsigned char rom_id;
>     const char *  firmware_name
> } supported_models[] = {
>     { /*Si21*/41, 'A', 1, 0, 0x60, "dvb-tuner-si2141-a10-00.fw" },
>     { /*Si21*/41, 'A', 1, 0, 0x61, "dvb-tuner-si2141-a10-01.fw" },
>     { /*Si21*/57, 'A', 3, 0, 0x50, "dvb-tuner-si2157-a30-01.fw" },
> (etc)
> };

The struct itself sounds OK to me, with some adjustments:

1. Coding style nit:  firmware name should be, instead:

	const char *firmware_name

2. It would also need a:

	const char *firmware_alt_name

   to store the old firmware namespace, e. g.:
	SI2158_A20_FIRMWARE, SI2141_A10_FIRMWARE and SI2157_A30_FIRMWARE.

3. instead of placing a number (41, 57, ...) it should use defines
   or enums.

Thanks,
Mauro
