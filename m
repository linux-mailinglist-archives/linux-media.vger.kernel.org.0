Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31DD344214B
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 21:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbhKAUG1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 16:06:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:49060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230497AbhKAUG0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 16:06:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 370D060D07;
        Mon,  1 Nov 2021 20:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635797032;
        bh=FNSqWHeSbc+RKp1TCaiPwYrAlW+agdhIaJXCGYyR0V4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=G4qEwKDcMpSS62iuy2+n+i+D8beWX0sMi33NmjcwXmrKWG17LdVT3VC5o38gzmQbb
         zzE53Wp6mea/zycfsqYjkvSa+DaWsWkhEL+CmEGBkpWS93GWGrIMc8Anzl8S/OHPGA
         7jVpZeP9/CkRaBa/M4122F/0+74fCphmFX/WPU3elmoSYma9++gX/YYKMBxGpgntHi
         GO3IxKigGytDtb6vSbXoVMjuPx0tYJmSXOkP4+TFz8MDmA/awz/QJMcgOVh1pC0osc
         L3a6rtOqJhSN0kp2SMj5sE3dcHz/AqueA2I43gNg6ytRXC8+a9TyITWuB7JpGWB/XY
         d8zU1hPMcMpxw==
Date:   Mon, 1 Nov 2021 20:03:47 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Tsuchiya Yuto <kitakar@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nable <nable.maininbox@googlemail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>
Subject: Re: [PATCH 04/17] media: atomisp: pci: do not use err var when
 checking port validity for ISP2400
Message-ID: <20211101200347.2910cbc7@sal.lan>
In-Reply-To: <2b81ca7e-fcaa-5449-5662-4eb72e746b02@redhat.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
        <20211017161958.44351-5-kitakar@gmail.com>
        <20211026092637.196447aa@sal.lan>
        <1a295721fd1f1e512cd54a659a250aef162bfb6f.camel@gmail.com>
        <20211028123944.66c212c1@sal.lan>
        <af7cdf9de020171567c2e75b713deb2ed073e4e3.camel@gmail.com>
        <20211101141058.36ea2c8e@sal.lan>
        <2b81ca7e-fcaa-5449-5662-4eb72e746b02@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 1 Nov 2021 20:06:52 +0100
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi,
> 
> On 11/1/21 15:10, Mauro Carvalho Chehab wrote:
> 
> <snip>
> 
> >>> Did you test on Baytrail (ISP2400), and with the compile-time option
> >>> enabled/disabled?    
> >>
> >> Sorry, I should have clarified on the cover later. For ISP2400, I did
> >> compile test only (CONFIG_VIDEO_ATOMISP_ISP2401 enabled/disabled).  
> > 
> > Maybe Hans could help us on that. I guess he has an Asus T100 device, 
> > which is BYT based.
> > 
> > Hans, if you're willing to do the tests, you could either use nvt
> > or v4l2grab to test it.
> > 
> > It seems that BYT has an additional issue, though: the ISP seems to
> > require 12 non-visible lines/columns (in addition to 16 ones required
> > by CHT?) for it to work.
> > 
> > So, you may need to tweak the resolution a bit, as otherwise the
> > driver will return an -EINVAL.
> > 
> > See:
> > 
> > 	https://git.linuxtv.org/media_stage.git/commit/?id=dcbc4f570495dbd490975979471687cbe2246f99
> > 
> > For the workaround I had to add for CHT to properly report the
> > visible resolution.  
> 
> Testing BYT support definitely is on my radar. Note that BYT
> also has the additional issue that the atomisp2 on BYT can be
> enumerated as either a PCI dev (which may work) or an ACPI/platform
> dev which is unsupported in the original atomisp2 code-drop and
> seems non trivial (because of pci config space writes) to get to
> work.
> 
> On the T100TA the device is actually enumerated as an ACPI/platform
> device and the BIOS option to change this is hidden. In the mean
> time I've gained quite a lot of experience with changing hidden
> BIOS options though, so I can easily put it in PCI mode for
> testing. But eventually we also need to tackle ACPI enumeration
> support...
> 
> Anyways I've let me self get distracted (hobby time wise) by
> looking into PMIC/charger/fuel-gauge issues on the Xiaomi Mi Pad 2.
> I've made a list of 3 (small-ish) loose ends which I want to
> tie up there and then I plan to start looking into atomisp2
> support in my hobby time. ATM my plan is:
> 
>    -Test on T101HA to reproduce Mauro's work

Yeah, it would be great to have a second test on it. I suspect that it
should work just fine with USERPTR (with v4l2grab or nvt).

>    -Try to get things to work on the T116

Didn't test it here either, but won't be able to do in the next
couple of weeks.

>    -Patch to not load atomisp_foo sensor drivers on !BYT && !CHT

Not sure if it is worth doing it, as there are a lot more to be
done before being able to use a generic sensor driver.

> And I've just added:
> 
>    -Try out BYT support 

Thanks!

> 
> As 4th item. Eventually I want to look into writing a proper
> regulator driver for the PMICs

Yeah, a proper regulator driver would be a lot better than the
PMIC ones.

> and then try to make the atomisp2
> code work with the non "atomisp_xxx" versions of the sensor drivers.

With a regulator driver, part of the problem will be solved. However, 
as the ISP driver "eats" 16 lines and 16 columns. It means that the sensor 
needs to be adjusted for it to provide those extra data. So, the atomisp 
sensor resolutions are (X + 16) x (Y + 16), e. g. in the case of
ov2680, it is set to 1616x1216, while the upstream one is 1600x1200.

Not sure if the selection API currently allows changing that to
satisfy atomisp, or if something else would be needed.

Regards,
Mauro
