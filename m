Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F18743DB91
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 08:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhJ1GzA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 02:55:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:42796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229843AbhJ1Gyz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 02:54:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5894D60234;
        Thu, 28 Oct 2021 06:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635403948;
        bh=h9hK73EetmdcBW7u8LaC55KeL3ronu4IvHROVgw+LqI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TRQQbDTmy7vfKaH259yY21nMA8M4S3GA/OH/+Vy0EGS9RhkeNNGPgBReenfDSAivw
         7KDZS/0/117SznvyDkSU2KwIf0NPUo6gt1xiJdpkf8kTktY+tpYQoNvqQGmnBLxoGA
         Rn229PYonecKWATIpqXSJ01u/ghtCzXOpS4r8tUy+ufjJUeanqlQeU3qXjEoxY+Xan
         9rFrAWU4ODxk013tueYvB65oRGON3Zqy/df/X1oJCU55IFOFfEpyrtOs0Xwu6kfe3t
         VauVkx6sBQLOYqEofFrfLggOTenpTrdB/o6HWcyASwX7fC0vYzavXZ55bstMOTiaym
         QpvnwXMfuFhyQ==
Date:   Thu, 28 Oct 2021 07:52:21 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
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
Message-ID: <20211028075221.2e03f5a0@sal.lan>
In-Reply-To: <1a295721fd1f1e512cd54a659a250aef162bfb6f.camel@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
        <20211017161958.44351-5-kitakar@gmail.com>
        <20211026092637.196447aa@sal.lan>
        <1a295721fd1f1e512cd54a659a250aef162bfb6f.camel@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 28 Oct 2021 13:12:45 +0900
Tsuchiya Yuto <kitakar@gmail.com> escreveu:

> <Adding back people/list to Cc>
> 
> On Tue, 2021-10-26 at 09:26 +0100, Mauro Carvalho Chehab wrote:
> > Em Mon, 18 Oct 2021 01:19:44 +0900
> > Tsuchiya Yuto <kitakar@gmail.com> escreveu:
> >   
> > > Currently, the `port >= N_CSI_PORTS || err` checks for ISP2400 are always
> > > evaluated as true because the err variable is set to `-EINVAL` on
> > > declaration but the variable is never used until the evaluation.
> > > 
> > > Looking at the diff of commit 3c0538fbad9f ("media: atomisp: get rid of
> > > most checks for ISP2401 version"), the `port >= N_CSI_PORTS` check is
> > > for ISP2400 and the err variable check is for ISP2401. Fix this issue
> > > by adding ISP version test there accordingly.
> > > 
> > > Yes, there are other better ways to fix this issue, like adding support
> > > for ISP2400 to ia_css_mipi_is_source_port_valid(). In this way, we can
> > > unify the following test:
> > > 
> > > 	if (!IS_ISP2401)
> > > 		port = (unsigned int)pipe->stream->config.source.port.port;
> > > 	else
> > > 		err = ia_css_mipi_is_source_port_valid(pipe, &port);
> > > 
> > > However, the IS_ISP2401 test here (formerly `ifdef ISP2401`) is not
> > > a result of real hardware difference, but just a result of the following
> > > two different versions of driver merged by tools [1]:
> > > 
> > >   - ISP2400: irci_stable_candrpv_0415_20150521_0458
> > >   - ISP2401: irci_ecr-master_20150911_0724  
> > 
> > No.
> > 
> > While I don't have any internal information from the hardware manufacturer,
> > I guess you misinterpreted things here. 2400 and 2401 are different
> > hardware versions. See atomisp_pci_probe() logic.
> > 
> > Basically, Cherrytail and Anniedale comes with 2401. Older Atom CPUs
> > (Merrifield and Baytrail) comes with 2400.  
> 
> Yes, indeed, 2400 and 2401 are different hardware. When they (I mean who
> originally wrote atomisp driver non-upstream) needed to distinguish
> between ISP2400 and ISP2401, they used the ifdefs like the following:
> 
>   - USE_INPUT_SYSTEM_VERSION_2    (for both ISP2400/ISP2401)
>   - USE_INPUT_SYSTEM_VERSION_2401 (for ISP2401)
>   ...
> 
> I think this is a sign that the atomisp driver supports both
> ISP2400/ISP2401 in a single version.

Yes, the driver was written to support both, but it is not that simple.

As far as I heard, the downstream version used some code generator
to produce both the firmware and the driver. Those evaluate
internally some of the vars. What Alan seems to have done is to
generate both ISP2400 and ISP2401 versions and then merge them into
a single code, adding the ISP2400 version check.

If you look at the initial committed patch, you'll see things like:

	$ git show a49d25364dfb9f8a64037488a39ab1f56c5fa419
...
	+#ifdef ISP2401
	+
	+#endif

That clearly shows that some tool merged both CSP2400 and 2401 variants
into a single driver.

I did a large re-work of converting such ifdefs into runtime if's, as
the end goal is to be able have support for both BYT and CHT code
compiled at the time time, having the decision of enabling/disabling
the needed features in runtime.

This is not complete, though, as there's still a compile-time
variable to select the CHT variant: VIDEO_ATOMISP_ISP2401.

I would love to completely get rid of that, but the remaining bits
require to be able to test it on both BYT and CHT variants.

-

Now, if we look at the #ifdefs of the original upstreamed version,
clearly some of the changes are just improvements on the driver
(some are related to the addition of an error-check, for instance),
while others seem to be related to different hardware features
(like some related to the clock frequencies).

However, for most part, it is almost impossible to know if they're
due to a different firmware version or due to different hardware
features.

> Indeed, the upstreamed atomisp uses irci_stable_candrpv_0415_20150521_0458
> for ISP2400 and IIUC it was working on Bay Trail. 

Had you test it on BYT? On what hardware?

Btw, it would help a lot if you could describe exactly what tools are
you using to test. That would allow us to also test it on our hardware.

> On the other hand,
> intel-aero is a kernel for Cherry Trail and uses the same version
> irci_stable_candrpv_0415_20150521_0458.

See the Alan's original comment:

	+7. The ISP code depends on the exact FW version. The version defined in
	+   BYT: 
	+   drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_firmware.c
	+   static const char *release_version = STR(irci_stable_candrpv_0415_20150521_0458);
	+   CHT:
	+   drivers/staging/media/atomisp/pci/atomisp2/css/sh_css_firmware.c
	+   static const char *release_version = STR(irci_ecr-master_20150911_0724);
	+
	+   At some point we may need to round up a few driver versions and see if
	+   there are any specific things that can be done to fold in support for
	+   multiple firmware versions.

He clearly created it with a different firmware for CHT. Yet, nobody
were able to find the exact firmware he used. So, I ended changing
some parts of the driver to become closer to the one used by Intel Aero,
as the firmware for it is easy to retrieve.

Btw, even if BYT and CHT firmware were produced against the same version
of the generator toolset, it doesn't necessarily mean that they're
identical.

> 
> So, both ISP version ISP2400/ISP2401 can be supported by a single
> driver version.

Yes, but they needed to be compiled with a different option right
now, as the register addresses are different. That's basically the
main reason for VIDEO_ATOMISP_ISP2401 Kconfig option: to select
between ISP2400/candrpv register map and ISP2401/ecr-master register map.

Not clear yet if those differences are just due to different
firmware versions, just due to different hardware versions or both.

> > > We should eventually remove (not unify) such tests caused by just a
> > > driver version difference and use just one version of driver. So, for
> > > now, let's avoid further unification.
> > > 
> > > [1] The function ia_css_mipi_is_source_port_valid() and its usage is
> > >     added on updating css version to irci_master_20150701_0213
> > >     https://raw.githubusercontent.com/intel/ProductionKernelQuilts/cht-m1stable-2016_ww31/uefi/cht-m1stable/patches/cam-0439-atomisp2-css2401-and-2401_legacy-irci_master_2015070.patch
> > >     ("atomisp2: css2401 and 2401_legacy-irci_master_20150701_0213")  
> > 
> > What happens is that there is a 2401 and a 2401 "legacy". It sounds
> > that this due to some different software stacks that are reflected both
> > at the firmware and at the driver.  
> 
> Yeah, I'm not sure what the "legacy" is. It might be a reference of
> `ISP2401_NEW_INPUT_SYSTEM` (css_2401_csi2p_system) and
> non-`ISP2401_NEW_INPUT_SYSTEM` (css_2401_system).

Maybe.

> 
> > -
> > 
> > On other words, this patch requires some rework, as otherwise it will break
> > support for Baytrail.  
> 
> You mean "this patch"? then, I intended this patch is rather a fix for
> ISP2400 case! The err variable for ISP2400 case is always true because
> it is not used before the error check:
> 
>         int
>         allocate_mipi_frames(struct ia_css_pipe *pipe,
>         		     struct ia_css_stream_info *info)
>         {
>         	int err = -EINVAL;
> [...]
>         	if (!IS_ISP2401)
>         		port = (unsigned int)pipe->stream->config.source.port.port;
>         	else
>         		err = ia_css_mipi_is_source_port_valid(pipe, &port);
>         
>         	assert(port < N_CSI_PORTS);
>         
>         	if (port >= N_CSI_PORTS || err) {
>         		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>         				    "allocate_mipi_frames(%p) exit: error: port is not correct (port=%d).\n",
>         				    pipe, port);
>         		return -EINVAL;
>         	}
> 
> The first usage of err variable is ia_css_mipi_is_source_port_valid()
> for IS_ISP2401 case, but it's not used for ISP2400 case. This causes
> the evaluation `port >= N_CSI_PORTS || err` always true for ISP2400 case,
> meaning it will be always treated as a error.

Ok. So, please make it clearer at the description.

> 
> > Also, patch 13 should be dropped, as the firmware versions for 2400 are
> > different  
> 
> The firmware version for 2400 on the upstreamed atomisp is
> irci_stable_candrpv_0415_20150521_0458 :-)
> 
>         static const char *isp2400_release_version = STR(irci_stable_candrpv_0415_20150521_0458);
>         static const char *isp2401_release_version = STR(irci_ecr - master_20150911_0724);
> 
> The intention of that patch is rather, it clarifies ISP2401 is now using
> the same driver (css) version as ISP2400.

Ok, I see the point. Yeah, using a single release version makes
things better.

> 
> > - and maybe patches 8 to 12 may need more work in order to not
> > touch 2400.  
> 
> Those patches do not break ISP2400, because what they do for ISP2400
> is that, they remove members from `struct`s which were initially inside
> of `ifdef ISP2401`. And because these removed members were initially
> inside of the ifdefs, the usage was also inside the ifdefs.

Had you test them with both ISP2400 and ISP2401 hardware?

Did you compile with both VIDEO_ATOMISP_ISP2401 enabled and
disabled?

Regards,
Mauro
