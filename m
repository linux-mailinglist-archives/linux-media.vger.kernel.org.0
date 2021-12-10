Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055E546FB0B
	for <lists+linux-media@lfdr.de>; Fri, 10 Dec 2021 08:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233061AbhLJHIm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Dec 2021 02:08:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbhLJHIl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Dec 2021 02:08:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A99FC061746
        for <linux-media@vger.kernel.org>; Thu,  9 Dec 2021 23:05:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B6434B81F55
        for <linux-media@vger.kernel.org>; Fri, 10 Dec 2021 07:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61019C00446;
        Fri, 10 Dec 2021 07:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639119904;
        bh=KwMQTcrdqfIZfsoz8/kKyyKT4950iHbNhxsz0EBHSY4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aIjdPIThy6Is0MvbwQ4D0IyyWXgj6+TPDIL6AS9kVG3yQvGcvA2jD+Pe0q/pGZh0y
         Ii5BUUtKD+nxEG9UlIczj1DT6s6N7Y11C5rHvJ1U+eHMrAoBqOhwlXxMR5FRLCk57o
         kpIhU1vS5lxyyJZnoc5lYYPaOJVxbHHkJUxXBTCKue5shAPtHROk73RyfFSYsEHXrN
         +u/ioS2K8mWgLBQiPXXnoto5BwOPTzt/iGI46oC4fvLOA2yueTRN37oxlOsg+euw8v
         gKaB7sYF59HrmLqjJXkbunoEqUxj1ieexSsKbeaCMZcYRZqHIaDP7bIoPpkxOR+Loe
         4y/+1v7WfBfww==
Date:   Fri, 10 Dec 2021 08:04:59 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Robert Schlabbach <Robert.Schlabbach@gmx.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: si2157: use a different namespace for
 firmware
Message-ID: <20211210080459.2b9db167@coco.lan>
In-Reply-To: <trinity-bb680ebb-853c-44e5-9457-1e66e3bd1791-1639085403130@3c-app-gmx-bap23>
References: <cover.1639049865.git.mchehab+huawei@kernel.org>
        <c06c7806247557daffa999d15cf090437d346747.1639049865.git.mchehab+huawei@kernel.org>
        <trinity-bb680ebb-853c-44e5-9457-1e66e3bd1791-1639085403130@3c-app-gmx-bap23>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 9 Dec 2021 22:30:03 +0100
Robert Schlabbach <Robert.Schlabbach@gmx.net> escreveu:

> Just wondering: You keep stacking new commits on top, rather than fixing
> issues found in the earlier commits. Do you plan to squash these into
> a single commit in the end? Because I would not feel well submitting the
> "bad"/untested in-between commits into the code...
> 
> > Rework the code in orde to use different firmware files depending
> > at the chip ID and rom ID.  
> 
> "order" (r missing) and "depending on" not "at".

ok.

> 
> > +enum si2157_chip_type {  
> 
> SiLabs calls this "part", and I would stick to that name to avoid
> confusion. We should not invent new names for things that the know
> the original name of.

ok.

> 
> > +struct si2157_firmware {  
> 
> My original idea was that this struct array would be the one-stop shop
> where the driver would obtain ALL its information about the tuners it
> supports from, i.e. it would be used to:
> 
> - provide a list of the supported parts, with all the constants
>   needed for identification
> - provide the firmware filenames
> - provide further information, e.g. "quirks"
> 
> In fact, you already use it for all that, but do not reflect that in
> the name. Maybe "struct si2157_tuner_info" and then name the list
> "si2157_supported_tuners[]"?

Works for me.

> As to the #defines for the part numbers, I actually see not much use
> in that, if each define will only be used in exactly one place - the
> table. Why not have the table be the "single source of truth",
> containing _all_ identifiers in one place, rather than needlessly
> scattering them over the source code?

Do you mean the enum (currently named as si2157_chip_type)?

If so, even if they're meant to be used just once, it still makes
sense to have them on an enum. See, Kernel developers hate to use
random meaningful numbers inside the code, as this obscures the
code. On other words, it is a lot more intuitive for anyone reviewing
the code to see:

	SI2141, SI2177, ...

than random numbers
	41, 77, ...

Also, assuming that this would be used just once is a mistake, as
the part enum could later be used to replace those defines:

	#define SI2157_CHIPTYPE_SI2157 0
	#define SI2157_CHIPTYPE_SI2146 1
	#define SI2157_CHIPTYPE_SI2141 2
	#define SI2157_CHIPTYPE_SI2177 3

> > + enum si2157_chip_type chip_id;
> > + unsigned char rom_id;
> > + bool required;
> > + const char *fw_name, *fw_alt_name;  
> 
> Before this patch, the driver determined whether it supported the
> tuner by comparing more/other fields from the PART_INFO response.
> I suppose it is ok to expand the support, but the newly introduced
> comparison of the rom_id could theoretically remove support for
> tuners that were previously supported by this driver. Is this an
> acceptable risk?

Good point. Before submitting the code, I had a logic that would
select the first ROM ID if it won't be able to match a rom. I
ended removing on the submitted version, but maybe I could do
something different. I'll address it at the next version.

> 
> > + const char *fw_name, *fw_alt_name;  
> 
> This might not suffice. Theoretically, there could be newer firmware
> patches in the future which we would want to support. Would we then
> throw out support for the older patches?
> 
> I would suggest, e.g.:
> 
> #define MAX_SUPPORTED_FIRMWARE_VERSIONS 4
> 
> const char *fw_name[MAX_SUPPORTED_FIRMWARE_VERSIONS];
> 
> and then sort the filenames from newest to oldest, and put the
> "legacy" names at the bottom.

Yeah, I'm not comfortable with that either, as it can be a maintenance
nightmare.

There's a better way to solve it: instead of placing the firmware
revision name, we could simply name the firmware files as:

	/* New firmware namespace */
	#define SI2141_60_FIRMWARE "dvb_driver_si2141_rom60.fw"
	#define SI2141_61_FIRMWARE "dvb_driver_si2141_rom61.fw"
	#define SI2146_11_FIRMWARE "dvb_driver_si2146_rom11.fw"
	#define SI2147_50_FIRMWARE "dvb_driver_si2147_rom50.fw"
	#define SI2148_32_FIRMWARE "dvb_driver_si2148_rom32.fw"
	#define SI2148_33_FIRMWARE "dvb_driver_si2148_rom33.fw"
	#define SI2157_50_FIRMWARE "dvb_driver_si2157_rom50.fw"
	#define SI2158_50_FIRMWARE "dvb_driver_si2178_rom50.fw"
	#define SI2158_51_FIRMWARE "dvb_driver_si2158_rom51.fw"
	#define SI2177_50_FIRMWARE "dvb_driver_si2177_rom50.fw"

This will still allow having one firmware per part/rom ID, and will
allow to use upgraded firmware files.

> > +static int si2157_find_and_load_firmware(struct dvb_frontend *fe)  
> 
> Hmm, I would prefer to cut the functionality in a different way:

I opted to split this way in order to simplify error handling logic.

With the current split:

- si2157_load_firmware() has the entire logic required for loading a
  firmware, and will de-allocate any data allocated by request_firmware;
- si2157_find_and_load_firmware() will contain all the logic needed to
  identify what firmware should be loaded, and will call 
  si2157_load_firmware() for both new and old firmware names.

> - query the part information (it's not "chip revision" - Antti did
>   not have the SiLabs source code available and had to guess what
>   this was called) and determine whether this part is supported by
>   the driver (and if we do not want to take the risk mentioned
>   above, maybe even pick one when there is no matching rom_id,
>   but the other values from the part information match?). I think
>   this would be compact enough to remain in the init() function.

Yes, but this would mean that the entire code would be under an if
block

	if (dev_dont_load_firmware) {
		dev_info(&client->dev, "device is buggy, skipping firmware download\n");
	} else {
		...
	}

Placing it on a separate function avoids the indentation, simplifying
the logic.

> - have a download_and_start_firmware() function that is passed the
>   matched struct si2157_tuner_info * and iterates over the contained
>   firmware filenames, and if it finds an available one, downloads
>   that into the tuner. Either way, the EXIT_BOOTLOADER command
>   (commented in the code as "reboot the tuner with new firmware?",
>   because, again, Antti could not know what the command was
>   called) should be part of THIS function, and not be in the init()
>   function. That is also the way it is cut in the SiLabs sources,
>   and it makes sense to me.

The "reboot the tuner with new firmware" logic could eventually be
moved to si2157_find_and_load_firmware(), but not sure if it is
worth, as calling it puts the device on a know condition. Moving it
to the load firmware function would mean that such code will never be
called if "dev->dont_load_firmware".

As moving it brings no real benefit and could cause regressions, I prefer
to keep it as-is, except if someone reports a bug due to that.

Thanks,
Mauro
