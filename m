Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D8331DB82
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 15:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233418AbhBQOdH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 09:33:07 -0500
Received: from gofer.mess.org ([88.97.38.141]:40649 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233256AbhBQOdF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 09:33:05 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D6CDFC63F2; Wed, 17 Feb 2021 14:32:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1613572343; bh=rB0xNHQK3NjoXnbXqZMtS+Hyu+RZH2b/RIPMh5lVSdg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TY4VRBrvl219qdHNVmeBK87wGwcSMYAJASc0NRd8+Ci/ClompIOoO+htVQJmbo3VD
         yPSGc9Z2FJbGzf10IJLke45gQ2Y/aG/HnLx5856fPqNS7+Z8gQuPAVHqRNcuRbTL1T
         xLuZ7VevDTbFfkQvDxz0XPsvK+fbv133u0pR7aYoVrX3aLhvEqr9hRxKvuVO6nGevI
         rTXAZ2Nr1brg3crpCyVBIN6JU13FYXA+ZAUVHTgsxNmdtaoESPx3jQs1VCjoCgAgC0
         DK0nUfrn/TH7lDDsbBjkTzunWh85zgo8Hm066uLq+zz5Fmbgg7KhSdFZIlmIvDHRqq
         a1hpEm25qkmRw==
Date:   Wed, 17 Feb 2021 14:32:23 +0000
From:   Sean Young <sean@mess.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Issue with cec_register_adapter calling request_module() from an
 async context when called from intel_dp_detect
Message-ID: <20210217143223.GA28632@gofer.mess.org>
References: <91b0f6c8-79ca-d04f-1ae0-66bf954dd421@redhat.com>
 <8d24dad6-cb2a-da91-bd38-887a7aa3282f@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d24dad6-cb2a-da91-bd38-887a7aa3282f@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 17, 2021 at 01:41:46PM +0100, Hans Verkuil wrote:
> Hi Hans,
> 
> On 17/02/2021 13:24, Hans de Goede wrote:
> > <resend with the linux-media list added to the Cc>
> > 
> > Hi Hans,
> > 
> > Fedora has a (opt-in) system to automatically collect backtraces from software
> > crashing on users systems.
> > 
> > This includes collecting kernel backtraces (including once triggered by
> > WARN macros) while looking a the top 10 of the most reported backtrace during the
> > last 2 weeks report from ABRT: https://retrace.fedoraproject.org/faf/problems/
> > 
> > I noticed the following backtrace:
> > https://retrace.fedoraproject.org/faf/problems/8150/
> > which has been reported 170000 times by Fedora users who have opted-in during the
> > last 14 days.
> > 
> > The issue here is that cec_register_adapter ends up calling request_module()
> > from an async context, triggering this warn in kernel/kmod.c __request_module():
> > 
> >         /*
> >          * We don't allow synchronous module loading from async.  Module
> >          * init may invoke async_synchronize_full() which will end up
> >          * waiting for this task which already is waiting for the module
> >          * loading to complete, leading to a deadlock.
> >          */
> >         WARN_ON_ONCE(wait && current_is_async());
> > 
> > The call-path leading to this goes like this:
> > 
> >  ? kvasprintf+0x6d/0xa0
> >  ? kobject_set_name_vargs+0x6f/0x90
> >  rc_map_get+0x30/0x60
> 
> It's not CEC, it is rc_map_get that calls request_module() for rc-cec.ko.
> 
> I've added Sean Young to the CC list.
> 
> Sean, is it possible to treat rc-cec as a built-in if MEDIA_CEC_RC is set?
> 
> I think this issue is very specific to CEC. I would not expect to see this
> with any other rc keymap.

So CEC creates an RC device with a keymap (cec keymap, of course) and then
the keymap needs to be loaded. We certainly don't want all keymaps as
builtins, that would be a waste.

The cec keymap is scanned once to build a map from cec codes to linux
keycodes; making it builtin is not ideal, and makes the build system a
bit messy.

I don't think we can load the keymap later, user space may start remapping
the keymap from udev.

Possibly we could create the cec or rc device later but this could be a bit
messy.

Could CEC specify:

#if IS_ENABLED(CONFIG_MEDIA_CEC_RC)
MODULE_SOFTDEP("rc-cec")
#endif

?

Sean


> 
> Regards,
> 
> 	Hans
> 
> >  rc_register_device+0x108/0x510
> >  cec_register_adapter+0x5c/0x280 [cec]
> >  drm_dp_cec_set_edid+0x11e/0x178 [drm_kms_helper]
> >  intel_dp_set_edid+0x8d/0xc0 [i915]
> >  intel_dp_detect+0x188/0x5c0 [i915]
> >  drm_helper_probe_single_connector_modes+0xc2/0x6d0 [drm_kms_helper]
> >  ? krealloc+0x7b/0xb0
> >  drm_client_modeset_probe+0x25b/0x1320 [drm]
> >  ? kfree+0x1ea/0x200
> >  ? sched_clock+0x5/0x10
> >  ? sched_clock_cpu+0xc/0xa0
> >  __drm_fb_helper_initial_config_and_unlock+0x37/0x470 [drm_kms_helper]
> >  ? _cond_resched+0x16/0x40
> >  intel_fbdev_initial_config+0x14/0x30 [i915]
> >  async_run_entry_fn+0x39/0x160
> > 
> > So 2 questions:
> > 
> > 1. Can we get this fixed please ?
> >    Related to this, what happens if we make this an async modprobe
> >    (when running from async context) is that a problem, or is it fine
> >    if the rc_map module gets loaded later ?
> > 
> > 2. If the answer to 1. is "tricky", "maybe" or some such then can we
> > look into a workaround here ? E.g. do we know in advance which module
> > is going to be requested (1), or does that depend on the EDID data ?
> > 
> > Regards,
> > 
> > Hans
> > 
> > 
> > 1) And can we thus do tricks with a softdep on it ?
> > 
