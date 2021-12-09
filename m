Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A55A46E593
	for <lists+linux-media@lfdr.de>; Thu,  9 Dec 2021 10:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236259AbhLIJcc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Dec 2021 04:32:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236258AbhLIJc1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Dec 2021 04:32:27 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D67EC061746
        for <linux-media@vger.kernel.org>; Thu,  9 Dec 2021 01:28:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 30533B82401
        for <linux-media@vger.kernel.org>; Thu,  9 Dec 2021 09:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473C9C004DD;
        Thu,  9 Dec 2021 09:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639042132;
        bh=XhH70lmuH2nqyJ07WRi/LgyMIr5bdvGc7gL7UjA/ECs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DucXSB3H1bsHkK8xVD1dIl4zmQlFYqKmJsfN2pTvRJRaaJy07CzbUv53aIppKzL5R
         6ypMj0ki0/6lq5grSLFYSBNnmiMeSQoghgZEXfkTfWk78nmXyEsD6nxo2wuN+ndAV3
         9D5BG4PEKeXdRggErNVbs9hww1tQamFmaPAyfWfcrFszEYZBuQ6C2eP5dXNj+B6QAP
         c//3nNF+gErloaJcdP9Fl71ivoDTHNYcLl9F2eBsV2p3cTQdMtUNzJWYZ8HrEQFEaX
         enZcKwCVeqwkETQRUskp/qplpcea8M171AIRW5TZ495tU33Gl1l15hiDp920qq87/Y
         nQpGKgWD84U+A==
Date:   Thu, 9 Dec 2021 10:28:48 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Robert Schlabbach <robert_s@gmx.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH RFC] media: si2157: optionally load firmare for
 SI2146_A10 and
Message-ID: <20211209102742.738c4eea@coco.lan>
In-Reply-To: <20211209091717.3107faca@coco.lan>
References: <cd3a382dc39e72229a73149cb91e80cf69e2b07d.1638958947.git.mchehab+huawei@kernel.org>
        <trinity-8c68f148-355b-481f-8671-fb703307cb76-1639004515653@3c-app-gmx-bap08>
        <20211209091717.3107faca@coco.lan>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 9 Dec 2021 09:17:17 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Thu, 9 Dec 2021 00:01:55 +0100
> Robert Schlabbach <robert_s@gmx.net> escreveu:
> 
> > > + case SI2146_A10:
> > > + fw_required = false;
> > > + fallthrough;
> > > case SI2141_A10:
> > > fw_name = SI2141_A10_FIRMWARE;
> > > break;    
> > 
> > I don't think this form of firmware name aliasing is
> > a good idea. The SiLabs code has a dedicated source
> > file for the ROM patch for each tuner model, even if
> > some are binary identical.
> > 
> > And in this particular case, there are not even
> > binary identical firmware patches available for these
> > two tuners, so they definitely should NOT share the
> > same firmware filename.  
> 
> Ok.
> 
> > So I propose having a clean 1:1 model <-> firmware
> > filename mapping.  
> 
> Makes sense.
> 
> > For si2157/si2177 and si2148/si2158
> > it's already too late, but we should not expand this
> > error even further.  
> 
> It is not too late. It is just a matter of adding a secondary
> firmware name for those devices. if the primary (new) name
> is not found, the driver would try the old name for those
> firmwares. As this is the current namespace:
> 
> #define SI2158_A20_FIRMWARE "dvb-tuner-si2158-a20-01.fw"
> #define SI2141_A10_FIRMWARE "dvb-tuner-si2141-a10-01.fw"
> #define SI2157_A30_FIRMWARE "dvb-tuner-si2157-a30-01.fw"
> 
> We would need to have a different namespace for the newer firmware
> file model. On a quick look at the opensourced drivers, those seem to
> be the firmware structs over there:
> 
> 	$ git grep 'firmware_struct.*=.\s*{' TER|perl -ne 'print "$1\n" if m/struct.*(Si[^\[]+)/'
> 	Si2124_FW_2_1b5
> 	Si2141_FW_0_Ab23
> 	Si2141_FW_1_1b12
> 	Si2144_FW_2_1b5
> 	Si2147_FW_3_1b3
> 	Si2148_FW_2_1b11
> 	Si2151_FW_0_Ab23
> 	Si2151_FW_1_1b11
> 	Si2157_FW_3_1b3
> 	Si2158B_FW_0_Ab15
> 	Si2158B_FW_4_1b3
> 	Si2177_FW_3_1b3
> 	Si2178B_FW_0_Ab15
> 	Si2178B_FW_4_1b3
> 
> If the idea is to be as close as possible to how the original firmware are named,
> we could do, e. g. something like this:
> 
> 	$ git grep 'firmware_struct.*=.\s*{' TER|perl -ne 'tr /A-Z/a-z/; print "dvb_driver_si$1_$2.fw\n" if m/struct.*si(\w+)_fw_([^\[]+)/'
> 	dvb_driver_si2124_2_1b5.fw
> 	dvb_driver_si2141_0_ab23.fw
> 	dvb_driver_si2141_1_1b12.fw
> 	dvb_driver_si2144_2_1b5.fw
> 	dvb_driver_si2147_3_1b3.fw
> 	dvb_driver_si2148_2_1b11.fw
> 	dvb_driver_si2151_0_ab23.fw
> 	dvb_driver_si2151_1_1b11.fw
> 	dvb_driver_si2157_3_1b3.fw
> 	dvb_driver_si2158b_0_ab15.fw
> 	dvb_driver_si2158b_4_1b3.fw
> 	dvb_driver_si2177_3_1b3.fw
> 	dvb_driver_si2178b_0_ab15.fw
> 	dvb_driver_si2178b_4_1b3.fw
> 
> On other words, for si2157, for instance, the driver would first try
> to load:
> 	dvb_driver_si2157_3_1b3.fw
> if it fails, it would try:
> 	dvb-tuner-si2157-a30-01.fw
> 
> This is backward compatible and should be flexible enough to support
> different firmware for different tuners.
> 
> There are some issues, though. This would require to have all those
> firmware files generated from the opensourced sources and stored somewhere,
> assuming that the license would allow that.
> 
> Also, as the firmware files will probably be different, tests with
> the different supported models will be required to be sure that the
> code is compatible with them (as the API might have changed on
> some of those).
> 
> > More broadly, the SiLabs code actually matches the
> > applicable firmware patch to the rom_id returned by
> > the tuner. So if we wanted to do a real cleanup,
> > I would propose having a const struct table, e.g.
> > 
> > const struct {
> >     unsigned char part;
> >     unsigned char chiprev;
> >     unsigned char pmajor;
> >     unsigned char pminor;
> >     unsigned char rom_id;
> >     const char *  firmware_name
> > } supported_models[] = {
> >     { /*Si21*/41, 'A', 1, 0, 0x60, "dvb-tuner-si2141-a10-00.fw" },
> >     { /*Si21*/41, 'A', 1, 0, 0x61, "dvb-tuner-si2141-a10-01.fw" },
> >     { /*Si21*/57, 'A', 3, 0, 0x50, "dvb-tuner-si2157-a30-01.fw" },
> > (etc)
> > };  
> 
> The struct itself sounds OK to me, with some adjustments:
> 
> 1. Coding style nit:  firmware name should be, instead:
> 
> 	const char *firmware_name
> 
> 2. It would also need a:
> 
> 	const char *firmware_alt_name
> 
>    to store the old firmware namespace, e. g.:
> 	SI2158_A20_FIRMWARE, SI2141_A10_FIRMWARE and SI2157_A30_FIRMWARE.
> 
> 3. instead of placing a number (41, 57, ...) it should use defines
>    or enums.
> 
> Thanks,
> Mauro

I double-checked at the code: the A10/A20/A30 is actually not used,
just the ROM version.

So, I guess the enclosed data structs should be enough for the load
firmware code.

Regards,
Mauro

-

enum si2157_chip_type {
	SI2141 = 41,
	SI2146 = 46,
	SI2147 = 47,
	SI2148 = 48,
	SI2157 = 57,
	SI2158 = 58,
	SI2177 = 77,
};

struct si2157_firmware {
	enum si2157_chip_type type;
	unsigned char rom_id;
	bool required;
	const char *fw_name, *fw_alt_name;
};

#define SI2141_60_FIRMWARE "dvb_driver_si2141_0_ab23.fw"
#define SI2141_61_FIRMWARE "dvb_driver_si2141_1_1b12.fw"
#define SI2146_11_FIRMWARE "dvb_driver_si2146_1_1b3.fw"
#define SI2147_50_FIRMWARE "dvb_driver_si2147_3_1b3.fw"
#define SI2148_33_FIRMWARE "dvb_driver_si2148_2_1b11.fw"
#define SI2157_50_FIRMWARE "dvb_driver_si2157_3_1b3.fw"
#define SI2158_50_FIRMWARE "dvb_driver_si2178b_0_ab15.fw"
#define SI2158_51_FIRMWARE "dvb_driver_si2158b_4_1b3.fw"
#define SI2177_50_FIRMWARE "dvb_driver_si2177_3_1b3.fw"

static const struct si2157_firmware fw[] = {
	{ SI2141, true,  0x60, SI2141_60_FIRMWARE, SI2141_A10_FIRMWARE },
	{ SI2141, true,  0x61, SI2141_61_FIRMWARE, SI2141_A10_FIRMWARE },
	{ SI2146, false, 0x11, SI2146_11_FIRMWARE, NULL },
	{ SI2147, false, 0x50, SI2147_50_FIRMWARE, NULL },
	{ SI2148, true,  0x33, SI2148_33_FIRMWARE, SI2158_A20_FIRMWARE },
	{ SI2157, false, 0x50, SI2157_50_FIRMWARE, SI2157_A30_FIRMWARE },
	{ SI2158, true,  0x50, SI2158_50_FIRMWARE, SI2158_A20_FIRMWARE },
	{ SI2158, true,  0x51, SI2158_51_FIRMWARE, SI2158_A20_FIRMWARE },
	{ SI2177, true,  0x50, SI2177_50_FIRMWARE, SI2157_A30_FIRMWARE },
};

Thanks,
Mauro
