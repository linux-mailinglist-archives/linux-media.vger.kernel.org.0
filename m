Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9A7454580
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 12:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234540AbhKQLXB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 06:23:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:40760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232294AbhKQLXA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 06:23:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E26D661B42;
        Wed, 17 Nov 2021 11:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637148002;
        bh=IgMs7/k9yx8yNUsIOyVlGRw/z1zRAAIFchQlLfQk8o8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BKy/CHry4bS3pZ7WLSBWDVzQTXQtmvWV5SHuoPb4c54c/bIWPsujDpynq7ECl0szh
         sbYogBNdQSus4dIhEuo55UUKZb/6bEQ6oDsB4om3vOcSB0kLtKundTB12bX3MR5fT9
         LvyTn3S8cOvn2UKwMGdotNCFWrc34ZxjdrBdbyR+DH344bSvxAwteS7uAZlIgo7kIC
         +bGw35Aedmzx+LaJ32h6SJhHCrGCP6wSlHfBNeCUf2A+ebCY8Wue80kwWXa4xgXxYB
         rn37SB1wWHtzJ91s3deqm45X2NjG/JvfxMOZAJi3O0qu1ELQZjfdmfb37E2RNTFqw9
         w4t12fzb8AzEw==
Date:   Wed, 17 Nov 2021 11:19:56 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 13/13] media: atomisp: sh_css_sp: better support the
 current firmware
Message-ID: <20211117111956.215743f8@sal.lan>
In-Reply-To: <20211117100238.GL26989@kadam>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
        <f0c9b8ec25fedbfccac6d14ff1add2d40beaa088.1637140900.git.mchehab+huawei@kernel.org>
        <20211117100238.GL26989@kadam>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 17 Nov 2021 13:02:38 +0300
Dan Carpenter <dan.carpenter@oracle.com> escreveu:

> On Wed, Nov 17, 2021 at 09:25:38AM +0000, Mauro Carvalho Chehab wrote:
> > As we're using Intel Aero firmware, make the code closer to the
> > driver for such device.  
> 
> I don't really understand this commit message.  Is there a out of tree
> Intel driver?

Yes. It is at:

	https://github.com/intel-aero/meta-intel-aero-base/tree/master/recipes-kernel/linux/linux-yocto

I guess I was too lazy to place the above on almost all patches in this 
series. There are some past patches for atomisp that already contains
such info.

The atomisp's TODO mentions it:


	- for CHT: /lib/firmware/shisp_2401a0_v21.bin

	  https://github.com/intel-aero/meta-intel-aero-base/blob/master/recipes-kernel/linux/linux-yocto/shisp_2401a0_v21.bin

-

Long answer:

Basically, as far as I'm aware, the original atomisp driver is produced by
some code generator, which not only dynamically add code to the driver's
source code output, but also sets several #ifdefs and dynamically change the
firmware API depending on the Atom CPU, features and on other options.

If you take a look at the original commit which added this driver:

	a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")

It basically had some efforts from Alan to support both ISP2400 (BYT) and
ISP2401 (CHT) versions at the same code.

If you look on its TODO, it says:

	"The ISP code depends on the exact FW version. The version defined in
	   BYT: 
	   drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_firmware.c
	   static const char *release_version = STR(irci_stable_candrpv_0415_20150521_0458);
	   CHT:
	   drivers/staging/media/atomisp/pci/atomisp2/css/sh_css_firmware.c
	   static const char *release_version = STR(irci_ecr-master_20150911_0724);"

So, the versions for BYT and CHT at the original patch were different, and
there are lots of #ifdefs to test between such differences.

There's another problem, through. The irci_ecr-master_20150911_0724 firmware
was never placed at linux-firmware, and got lost in time. I don't know
anyone whose has such exact version. It seems it got lost in time, no idea
why.

The only non-android Linux driver we know is for the Intel Aero hardware,
which is Cherrytail (CHT). For such hardware, the firmware is also provided
at the Intel Aero Yocto repositories, at:

	https://github.com/intel-aero/meta-intel-aero-base/blob/master/recipes-kernel/linux/linux-yocto/shisp_2401a0_v21.bin

The version of this firmware is:

	$ strings /lib/firmware/shisp_2401a0_v21.bin |grep irci_stable_
	irci_stable_candrpv_0415_20150521_0458

As we have both drivers and firmware for such version, we're actually
adjusting the upstream code to match this version for ISP2401 (CHT).

There's a side effect with this change: the code for ISP2400 and ISP2401
will be both based on the same version, which helps to reduce the
differences at the driver level - that's assuming that we can:

	- find a publicly-available ISP2400 
	  irci_stable_candrpv_0415_20150521_0458 binary;
	- have some BYT hardware for testing with upstream drivers[1];
	- have an Android driver for the same fix, in order to help
	  double-checking if the code is compatible with the firmware.

[1] On some BYT BIOS, the normal ACPI method of detecting the hardware
doesn't work, as the ISP is visible though the GPU. That's the case
of a commonly found hardware (Asus T100 with the production BIOS).

> 
> > diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
> > index f6db1f4a0e1d..a11078acb072 100644
> > --- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
> > +++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
> > @@ -982,6 +982,7 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
> >  	/* Make sure binary name is smaller than allowed string size */
> >  	assert(strlen(binary_name) < SH_CSS_MAX_BINARY_NAME - 1);
> >  	strscpy(sh_css_isp_stage.binary_name, binary_name, SH_CSS_MAX_BINARY_NAME);
> > +	sh_css_isp_stage.binary_name[SH_CSS_MAX_BINARY_NAME - 1] = 0;  
> 
> No, need for this.  strscpy() already guarantees that the result is NULL
> terminated.  That's one of the main reasons Linus invented it instead of
> using strncpy().
> 
> >  #ifdef ISP2401
> > -	if (stage == 0) {
> > -		pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
> > -		if (!pipe)
> > -			return -EINVAL;
> > +	pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
> > +	if (!pipe)
> > +		return -EINVAL;
> >  
> > -		if (args->in_frame)
> > -			ia_css_get_crop_offsets(pipe, &args->in_frame->info);
> > -		else
> > -			ia_css_get_crop_offsets(pipe, &binary->in_frame_info);
> > -	}
> > +	if (args->in_frame)
> > +		ia_css_get_crop_offsets(pipe, &args->in_frame->info);
> > +	else if (&binary->in_frame_info)  
>                   ^^^^^^^^^^^^^^^^^^^^^
> 
> This condition is wrong.  This is the address of something in the middle
> of "binary" so it can't be NULL.
> 
> > +		ia_css_get_crop_offsets(pipe, &binary->in_frame_info);
> >  #else
> >  	(void)pipe; /*avoid build warning*/
> >  #endif  
> 
> regards,
> dan carpenter
