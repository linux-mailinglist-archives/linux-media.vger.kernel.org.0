Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5640731ECC1
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 18:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234215AbhBRQ7y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 11:59:54 -0500
Received: from gofer.mess.org ([88.97.38.141]:37089 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233800AbhBRQj3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 11:39:29 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A522CC6393; Thu, 18 Feb 2021 16:38:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1613666313; bh=y0hbTtN+1Apb7h1OOsg2A72G+L+BIUNXQR5KSXaTIAY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tbJERjJiXwastHt7/3QrYpJ5GObGydJcyrivSesGwwO05x9uv5pYbU4RQrmrHcksW
         kahGD7wsISJxOhYtiSmY5Bk+gxFBb6epsNORmClJ9rglQ2jpae5yDYaAMni+wX94Z/
         NGJ35NcmxN9xvgXj3cmdocpx4wBcwnji8cVw+MSbQ4yjTgjXRkMSHVo9H8Q9C1S0+P
         aSjTckWqCwOFk4x7Q6yGawXT6mAaf5ApTWaq7mkbkpQIwt8uFi+JRK3N+wfQ4qUUWO
         cFqYXASoMu+ClWxl2xndTTPYh2wq6ob6Q2dw0rmR6aWNtL6WyVc6dBawlwilTJwmSU
         lZYZSRpCjMkIQ==
Date:   Thu, 18 Feb 2021 16:38:33 +0000
From:   Sean Young <sean@mess.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Issue with cec_register_adapter calling request_module() from an
 async context when called from intel_dp_detect
Message-ID: <20210218163833.GA15560@gofer.mess.org>
References: <91b0f6c8-79ca-d04f-1ae0-66bf954dd421@redhat.com>
 <8d24dad6-cb2a-da91-bd38-887a7aa3282f@xs4all.nl>
 <20210217143223.GA28632@gofer.mess.org>
 <1c081320-d040-12b7-fbd6-e6b8c03c2ae8@redhat.com>
 <20210217151159.GA29680@gofer.mess.org>
 <876e34f6-c39b-8e97-7ebb-79ae2c356e53@xs4all.nl>
 <3e3c983f-b3bc-fe94-9247-69c8d97754df@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e3c983f-b3bc-fe94-9247-69c8d97754df@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Feb 18, 2021 at 04:33:38PM +0100, Hans de Goede wrote:
> On 2/17/21 5:29 PM, Hans Verkuil wrote:
> > On 17/02/2021 16:11, Sean Young wrote:
> >> Hi,
> >>
> >> On Wed, Feb 17, 2021 at 04:04:11PM +0100, Hans de Goede wrote:
> >>> On 2/17/21 3:32 PM, Sean Young wrote:
> >>>> On Wed, Feb 17, 2021 at 01:41:46PM +0100, Hans Verkuil wrote:
> >>>>> Hi Hans,
> >>>>>
> >>>>> On 17/02/2021 13:24, Hans de Goede wrote:
> >>>>>> <resend with the linux-media list added to the Cc>
> >>>>>>
> >>>>>> Hi Hans,
> >>>>>>
> >>>>>> Fedora has a (opt-in) system to automatically collect backtraces from software
> >>>>>> crashing on users systems.
> >>>>>>
> >>>>>> This includes collecting kernel backtraces (including once triggered by
> >>>>>> WARN macros) while looking a the top 10 of the most reported backtrace during the
> >>>>>> last 2 weeks report from ABRT: https://retrace.fedoraproject.org/faf/problems/
> >>>>>>
> >>>>>> I noticed the following backtrace:
> >>>>>> https://retrace.fedoraproject.org/faf/problems/8150/
> >>>>>> which has been reported 170000 times by Fedora users who have opted-in during the
> >>>>>> last 14 days.
> >>>>>>
> >>>>>> The issue here is that cec_register_adapter ends up calling request_module()
> >>>>>> from an async context, triggering this warn in kernel/kmod.c __request_module():
> >>>>>>
> >>>>>>         /*
> >>>>>>          * We don't allow synchronous module loading from async.  Module
> >>>>>>          * init may invoke async_synchronize_full() which will end up
> >>>>>>          * waiting for this task which already is waiting for the module
> >>>>>>          * loading to complete, leading to a deadlock.
> >>>>>>          */
> >>>>>>         WARN_ON_ONCE(wait && current_is_async());
> >>>>>>
> >>>>>> The call-path leading to this goes like this:
> >>>>>>
> >>>>>>  ? kvasprintf+0x6d/0xa0
> >>>>>>  ? kobject_set_name_vargs+0x6f/0x90
> >>>>>>  rc_map_get+0x30/0x60
> >>>>>
> >>>>> It's not CEC, it is rc_map_get that calls request_module() for rc-cec.ko.
> >>>>>
> >>>>> I've added Sean Young to the CC list.
> >>>>>
> >>>>> Sean, is it possible to treat rc-cec as a built-in if MEDIA_CEC_RC is set?
> >>>>>
> >>>>> I think this issue is very specific to CEC. I would not expect to see this
> >>>>> with any other rc keymap.
> >>>>
> >>>> So CEC creates an RC device with a keymap (cec keymap, of course) and then
> >>>> the keymap needs to be loaded. We certainly don't want all keymaps as
> >>>> builtins, that would be a waste.
> >>>>
> >>>> The cec keymap is scanned once to build a map from cec codes to linux
> >>>> keycodes; making it builtin is not ideal, and makes the build system a
> >>>> bit messy.
> >>>>
> >>>> I don't think we can load the keymap later, user space may start remapping
> >>>> the keymap from udev.
> >>>>
> >>>> Possibly we could create the cec or rc device later but this could be a bit
> >>>> messy.
> >>>>
> >>>> Could CEC specify:
> >>>>
> >>>> #if IS_ENABLED(CONFIG_MEDIA_CEC_RC)
> >>>> MODULE_SOFTDEP("rc-cec")
> >>>> #endif
> >>>
> >>> That would need to be:
> >>>
> >>> MODULE_SOFTDEP("pre: rc-cec")
> >>>
> >>> I see that the drm_kms_helper and i915 drivers both depend on the cec module already,
> >>> so yes if that module will request for rc-cec to be loaded before it is loaded
> >>> (and thus before i915 is loaded) then that should work around this.
> >>>
> >>> Assuming the user is using a module-loader which honors the softdep...
> >>>
> >>> Also this assumes that rc_map_get is smart enough to not call request_module()
> >>> if the module is already loaded, is that the case ?
> >>
> >> Yes, see rc_map_get().
> > 
> > I tried this. It works if CONFIG_RC_CORE is set to m, but setting it to
> > y resulted in the same problem. It looks like MODULE_SOFTDEP only works if rc_main
> > is a module as well.
> 
> Yeah that is a known limit of module softdeps, they only work inside modules ...

Yes, I assume this is the problem.

> Still, assuming there is no easy other fix, we could still use this somehow.
> 
> I do see that at least Fedora actually has CONFIG_RC_CORE=y for some reason.

This is to make BPF IR decoding possible.

> I guess we could maybe add the softdep to the CONFIG_RC_MAP module or
> maybe to the module which contains the code enabled by CONFIG_DRM_DP_CEC ?
> 
> At least Fedora has all drm stuff as modules and also has CONFIG_RC_MAP=m,
> 
> I know this is not a real fix but a workaround to get rid of 170,000
> backtraces / 14 days being reported by (opted-in) systems running the
> Fedora generic kernel config would be welcome regardless of it being the
> "perfect" fix.

Of course, I totally agree that a solution is needed.

How about:

 1) Use MODULE_SOFTDEP("rc-cec"); 

 2) If it's compiled as a module, rc-cec should be builtin


Sean
