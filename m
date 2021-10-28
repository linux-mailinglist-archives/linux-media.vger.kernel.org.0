Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7CE43E023
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 13:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhJ1LmR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 07:42:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:38626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229578AbhJ1LmQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 07:42:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A9FF60FC4;
        Thu, 28 Oct 2021 11:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635421189;
        bh=MXx/7zhCpp3WEeak6Z4FisOR8mujHMNue5V2O/GYGGo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DxqhTqUuUWLwvqxprAKi+0qEklhXHH/tp3IPUaL1Ub86Z2zqwyxC24Cxxt/THdnI/
         qZx+z94mLoDbkad9yQSlt8vDRLGEOOxCJw7SYe5zBBHP9hsNSyufnolgqUFIfiTUy0
         2hBLGtodDSpetCPmqhDYCHZ8WZsBML5hnV9knXAeeuCewWAFFwgxLv2LbFZK5abWmb
         MVox1USuCnm2rh3W6jp/o4jc0MXeAOpW/ilYEm5xTRO41JNsVUNKyP2nqiZ9oHL8GE
         4cXvNzI34kNtTWLdd17EgaWvEoxXe06eAZXgXV9zSMP3RLCmxRwqnjgpkv94EkW+ym
         XjnQIuAo2aeOg==
Date:   Thu, 28 Oct 2021 12:39:44 +0100
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
Message-ID: <20211028123944.66c212c1@sal.lan>
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

Actually, supporting both on a single version is part of Alan's work.

It seems he used the generation tool to produce a version for 2400, and
then re-used it to generate for 2401. It then used some scripting tool
to convert the differences on #ifdef ISP2401. See:

	a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")

There are things there like:

	+#ifdef ISP2401
	+
	+#endif

I did a large cleanup work to get rid of those ifdefs, replacing them
by runtime logic.

The end goal is to have a single compile-time driver that works for
both 2400 and 2401.

This is not possible yet, as there are some registers that are mapped
on different addresses, depending on the hardware version, and making
it generic requires a lot of work and tests. So, for now, we need to 
have a compile-time option to select between both.

> Indeed, the upstreamed atomisp uses irci_stable_candrpv_0415_20150521_0458
> for ISP2400 and IIUC it was working on Bay Trail. On the other hand,
> intel-aero is a kernel for Cherry Trail and uses the same version
> irci_stable_candrpv_0415_20150521_0458.
> 
> So, both ISP version ISP2400/ISP2401 can be supported by a single
> driver version.

I See. OK!

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

Ok. Had you test the driver with Baytrail?

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

Ok.

> > - and maybe patches 8 to 12 may need more work in order to not
> > touch 2400.  
> 
> Those patches do not break ISP2400, because what they do for ISP2400
> is that, they remove members from `struct`s which were initially inside
> of `ifdef ISP2401`. And because these removed members were initially
> inside of the ifdefs, the usage was also inside the ifdefs.

Did you test on Baytrail (ISP2400), and with the compile-time option
enabled/disabled?

Regards,
Mauro
