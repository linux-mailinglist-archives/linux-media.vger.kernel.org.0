Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6133746CF80
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 09:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhLHIzk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Dec 2021 03:55:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhLHIzj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Dec 2021 03:55:39 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E8BC061746
        for <linux-media@vger.kernel.org>; Wed,  8 Dec 2021 00:52:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 4D3DCCE2035
        for <linux-media@vger.kernel.org>; Wed,  8 Dec 2021 08:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A14C00446;
        Wed,  8 Dec 2021 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638953524;
        bh=sPf85AOOV8l/h4pBATIdH3mnJhuRzKLVq4Uh6u629X0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pS0U7q2D6+TkgckOL1voM1p3xlPQV7Lc7ZL5a3RA422G3pZ+gYmzkp5qTBxXErMqD
         46WniuQcP8uB6xo/tLuIgWHD9OH8aQaXyXJbovslhMMmarMgL16rGkj5NH5EPPHVYV
         rXxnZ774iPXKQnsolypwEAyzl0xtEL7MIo0ujB9oIfMyh9dCewKxpe8Pihhvs3DUzw
         IlE9ywOUnhc+H0QO4B5LvREOb94bCs0ITMTNPR+GStgbo1P7YRr1YYoATi+selLXzT
         4rUfzJ/3EPc78tI9e5l7noOdJ+stYzCzyjPEvGnBCalufUO4hcuKHkH4wdllhd7wnQ
         SZi/3AsqELzMg==
Date:   Wed, 8 Dec 2021 09:52:00 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Robert Schlabbach <robert_s@gmx.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: si2157: Add optional firmware download
Message-ID: <20211208095200.6dfe2610@coco.lan>
In-Reply-To: <trinity-42d6e25d-b5bb-425c-a25a-ef6e758e216c-1638918425561@3c-app-gmx-bap19>
References: <trinity-0a2519c2-0c5d-4006-9aed-48fcd48cff8b-1638393058526@3c-app-gmx-bap03>
        <20211206150055.43043b53@coco.lan>
        <trinity-42d6e25d-b5bb-425c-a25a-ef6e758e216c-1638918425561@3c-app-gmx-bap19>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 8 Dec 2021 00:07:05 +0100
Robert Schlabbach <robert_s@gmx.net> escreveu:

> Von: "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>
> > This patch seems too risky. While I don't know the specifics of this
> > specific chipset, usually the ROM is on a separate chip that may or
> > may not be present. It may even have an unusable or problematic
> > firmware, depending on when the firmware was flashed.  
> 
> Hi Mauro, thanks for your review. Could you help me understand what
> risk you mean?
> 
> Before this change _all_ users of this driver had to rely on the ROM
> firmware, because the driver simply never downloaded any firmware
> patches into it.
> 
> With my change, the following scenarios are possible:
> 
> 1. The user has no si2157 firmware patch file in /lib/firmware. That
>    will probably be the case for the vast majority of users, as this
>    file is not found e.g. in linux-firmware.git.
>    In this case the device will continue to work just as it did before,
>    no regressions, no improvements.
> 
> 2. The user has a valid si2157 firmware patch file in /lib/firmware,
>    which is downloaded into the si2157. Should the user experience any
>    issues with the updated firmware (which I think is rather unlikely,
>    as I would expect SiLabs to have revoked it otherwise), simply
>    deleting the firmware patch file from /lib/firmware will cure it
>    and revert to scenario 1 above.
> 
> 3. The user has an invalid si2157 firmware patch file in /lib/firmware,
>    which looks "right" (to the file size check that's already been in
>    the driver), but does not fit the si2157. I found that in this case,
>    the si2157 will just operate with the original ROM firmware, i.e.
>    also yield the same result as scenario 1 above.
> 
> I have tested all 3 scenarios on my Hauppauge WinTV-QuadHD, and the
> result was a fully functional tuner in all cases. I haven't managed to
> produce a scenario where things broke.
> 
> Could you sketch what risk you still see of things breaking/regressing
> with my patch?

The issue is that you tested it only on Hauppauge WinTV-QuadHD,
which seems to have an eeprom where the firmware is stored, based on
your report.

See, while the technical docs for this device are not publicity 
available, the block diagram for this device on its "advertising"
datasheet:
	https://media.digikey.com/pdf/Data%20Sheets/Silicon%20Laboratories%20PDFs/Si2157.pdf

Doesn't show any internal ROM/eeprom. So, it sounds to me that
either some external rom chip is needed or its firmware should
load via I2C.

While I'm not concerned about Hauppauge devices, there are a lot of
others manufacturers that won't add any optional eeproms, in order
to save a couple of bucks.

So, my main concern here is with regards to other devices that
are using si2157 driver. Among those:

- Some may have no eeproms;
- Some may have an eeprom with compatible firmware;
- Some may have an eeprom with a too old firmware.

The above scenarios don't have any relationship with the chip_id.
They actually depend on the device's release date and if the
manufacturer spent an extra money to have a device with an eeprom
and/or cared enough to update the firmware on its manufacturing
process. 

Also, if I remember well, with some versions of the firmware,
DVB-C won't work, due to incompatibility between the Linux driver
and the firmware version.

On other words, the only way to ensure that the device will
be in sane state and be fully supported by the driver is to
load a known-to work firmware.

---

Back to your patch...

Do you have access to all the technical datasheet and
application notes for all chips supported by this driver?

If you have, could you please describe why only SI2157_A30
is safe with regards to firmware?

If not, then checking for chip_id == SI2157_A30 makes no
sense.

The logic should, instead, do something similar to this:

	#define FIRMWARE_MIN_VERSION 0x123456 // FIXME: add something here
	unsigned int firmware_version;

	ret = request_firmware(&fw, fw_name, &client->dev);
 	if (ret) {
		/* Perhaps something else is needed before querying firmware version */

		/* query firmware version */
		memcpy(cmd.args, "\x11", 1);
		cmd.wlen = 1;
		cmd.rlen = 10;
		ret = si2157_cmd_execute(client, &cmd);
	        if (ret) {
			dev_err(&client->dev,
				"firmware file '%s' not found and no firmware at eeprom\n",
				fw_name);
		}

		firmware_version = cmd.args[6] << 16 + cmd.args[7] << 8 + cmd.args[8];

		if (firmware_version < FIRMWARE_MIN_VERSION) {
			dev_err(&client->dev,
				"firmware file '%s' not found and eeprom firmware version %c.%c.%c is too old\n",
				cmd.args[6], cmd.args[7], cmd.args[8], fw_name);
			goto err;
		}
			
		dev_err(&client->dev,
			"firmware file '%s' not found, using firmware version %c.%c.%c from EEPROM.\n",
			cmd.args[6], cmd.args[7], cmd.args[8], fw_name);
	}


Thanks,
Mauro
