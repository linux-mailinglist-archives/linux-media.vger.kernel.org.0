Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B8431E7B7
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 10:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbhBRIzH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 03:55:07 -0500
Received: from gofer.mess.org ([88.97.38.141]:43851 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231371AbhBRIxY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 03:53:24 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 6A986C6393; Thu, 18 Feb 2021 08:52:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1613638334; bh=FS8oKE9+ULFzr6uKmZRH/QwPqm60gWbTK1X1+rYwMh0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=InuvuHde/W894CalvB4arafU162CRVpf87LoeWqdeWoda7vhcILnbV9wVJAEECaaD
         symmVMCBJNW9ULIeuEX5i4LfjvrRAouo+jIFugvW3gp28etJgpmbbzcowVZm9W5j4l
         XOnmudTjcLJtaex6D0FAuPFri73wFGrli1fqUBH9LAkJGbPXUqOIbPLHcVlw0EM3bn
         RoWxyRUwk8DzSSzrl9Irj9EafdkZe43fqag3fhDiWMyhXILoBRgmipL0oGr+FS0r3Q
         X5yl6iP9Dx6DJoJlAWLyfx+4MshzfcpupP/HNX2xohPiefNNvWnx7fLSMQUUw0coxj
         mrmH9lg0F8yoA==
Date:   Thu, 18 Feb 2021 08:52:14 +0000
From:   Sean Young <sean@mess.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Issue with cec_register_adapter calling request_module() from an
 async context when called from intel_dp_detect
Message-ID: <20210218085214.GA9864@gofer.mess.org>
References: <91b0f6c8-79ca-d04f-1ae0-66bf954dd421@redhat.com>
 <8d24dad6-cb2a-da91-bd38-887a7aa3282f@xs4all.nl>
 <20210217143223.GA28632@gofer.mess.org>
 <1c081320-d040-12b7-fbd6-e6b8c03c2ae8@redhat.com>
 <20210217151159.GA29680@gofer.mess.org>
 <876e34f6-c39b-8e97-7ebb-79ae2c356e53@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <876e34f6-c39b-8e97-7ebb-79ae2c356e53@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed, Feb 17, 2021 at 05:29:46PM +0100, Hans Verkuil wrote:
> On 17/02/2021 16:11, Sean Young wrote:
> > On Wed, Feb 17, 2021 at 04:04:11PM +0100, Hans de Goede wrote:
> >> On 2/17/21 3:32 PM, Sean Young wrote:
> >>> On Wed, Feb 17, 2021 at 01:41:46PM +0100, Hans Verkuil wrote:
> >>>> Hi Hans,
> >>>>
> >>>> On 17/02/2021 13:24, Hans de Goede wrote:
> >>>>> <resend with the linux-media list added to the Cc>
> >>>>>
> >>>>> Hi Hans,
> >>>>>
> >>>>> Fedora has a (opt-in) system to automatically collect backtraces from software
> >>>>> crashing on users systems.
> >>>>>
> >>>>> This includes collecting kernel backtraces (including once triggered by
> >>>>> WARN macros) while looking a the top 10 of the most reported backtrace during the
> >>>>> last 2 weeks report from ABRT: https://retrace.fedoraproject.org/faf/problems/
> >>>>>
> >>>>> I noticed the following backtrace:
> >>>>> https://retrace.fedoraproject.org/faf/problems/8150/
> >>>>> which has been reported 170000 times by Fedora users who have opted-in during the
> >>>>> last 14 days.
> >>>>>
> >>>>> The issue here is that cec_register_adapter ends up calling request_module()
> >>>>> from an async context, triggering this warn in kernel/kmod.c __request_module():
> >>>>>
> >>>>>         /*
> >>>>>          * We don't allow synchronous module loading from async.  Module
> >>>>>          * init may invoke async_synchronize_full() which will end up
> >>>>>          * waiting for this task which already is waiting for the module
> >>>>>          * loading to complete, leading to a deadlock.
> >>>>>          */
> >>>>>         WARN_ON_ONCE(wait && current_is_async());
> >>>>>
> >>>>> The call-path leading to this goes like this:
> >>>>>
> >>>>>  ? kvasprintf+0x6d/0xa0
> >>>>>  ? kobject_set_name_vargs+0x6f/0x90
> >>>>>  rc_map_get+0x30/0x60
> >>>>
> >>>> It's not CEC, it is rc_map_get that calls request_module() for rc-cec.ko.
> >>>>
> >>>> I've added Sean Young to the CC list.
> >>>>
> >>>> Sean, is it possible to treat rc-cec as a built-in if MEDIA_CEC_RC is set?
> >>>>
> >>>> I think this issue is very specific to CEC. I would not expect to see this
> >>>> with any other rc keymap.
> >>>
> >>> So CEC creates an RC device with a keymap (cec keymap, of course) and then
> >>> the keymap needs to be loaded. We certainly don't want all keymaps as
> >>> builtins, that would be a waste.
> >>>
> >>> The cec keymap is scanned once to build a map from cec codes to linux
> >>> keycodes; making it builtin is not ideal, and makes the build system a
> >>> bit messy.
> >>>
> >>> I don't think we can load the keymap later, user space may start remapping
> >>> the keymap from udev.
> >>>
> >>> Possibly we could create the cec or rc device later but this could be a bit
> >>> messy.
> >>>
> >>> Could CEC specify:
> >>>
> >>> #if IS_ENABLED(CONFIG_MEDIA_CEC_RC)
> >>> MODULE_SOFTDEP("rc-cec")
> >>> #endif
> >>
> >> That would need to be:
> >>
> >> MODULE_SOFTDEP("pre: rc-cec")
> >>
> >> I see that the drm_kms_helper and i915 drivers both depend on the cec module already,
> >> so yes if that module will request for rc-cec to be loaded before it is loaded
> >> (and thus before i915 is loaded) then that should work around this.
> >>
> >> Assuming the user is using a module-loader which honors the softdep...
> >>
> >> Also this assumes that rc_map_get is smart enough to not call request_module()
> >> if the module is already loaded, is that the case ?
> > 
> > Yes, see rc_map_get().
> 
> I tried this. It works if CONFIG_RC_CORE is set to m, but setting it to
> y resulted in the same problem. It looks like MODULE_SOFTDEP only works if rc_main
> is a module as well.

Hmm, I'm not quite sure what is happening here. How can I reproduce this
issue locally?


Sean
