Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86CA21AA006
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 14:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369105AbgDOMV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 08:21:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:40780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S369099AbgDOMVw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 08:21:52 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A52E6206F9;
        Wed, 15 Apr 2020 12:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586953311;
        bh=NmutImGHJVt0bKoK4LeZCIkUpQBYzciAGLQ7TLAkGaU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tNtE7vP9LAUju3LtYOyPIr9UvRPulibjevCYdz67uRMQ8pQj/N1CIpyQ+9SflaBx5
         JiZpMQ8qglMMnbK/JnrukbdHJez326rHvucOKvsrqvkFgBMNsXjiw3z9V6u369hCmj
         eGVFxWySDOHTKjx2XKZjxSGkkOGyYSoiDdeA7abc=
Date:   Wed, 15 Apr 2020 14:21:47 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: media/master bisection: v4l2-compliance-vivid.device-presence
 on qemu_x86_64
Message-ID: <20200415142147.1ed3487e@coco.lan>
In-Reply-To: <a99d49d9-656d-6c5c-4953-6e7c56c0beba@collabora.com>
References: <5e960bf5.1c69fb81.8a349.6851@mx.google.com>
        <24564393-f229-6e29-7883-9605ed0d48b4@collabora.com>
        <20200414233347.2a844b85@coco.lan>
        <86feeb83-37ac-cbd6-b792-b81d17d559c9@collabora.com>
        <2f32345d-a818-8ec4-afd6-2b9cd9dcdf4a@collabora.com>
        <a99d49d9-656d-6c5c-4953-6e7c56c0beba@collabora.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 15 Apr 2020 10:36:04 +0100
Guillaume Tucker <guillaume.tucker@collabora.com> escreveu:

> On 15/04/2020 10:28, Guillaume Tucker wrote:
> > On 14/04/2020 22:43, Guillaume Tucker wrote:  
> >> On 14/04/2020 22:33, Mauro Carvalho Chehab wrote:  
> >>> Em Tue, 14 Apr 2020 22:23:52 +0100
> >>> Guillaume Tucker <guillaume.tucker@collabora.com> escreveu:
> >>>  
> >>>> Please see the bisection report below about absence of the vivid
> >>>> driver, which caused v4l2-compliance to fail to run.
> >>>>
> >>>> Presumably we need to update the configuration fragment used by
> >>>> kernelci.org to enable platform drivers.  Until now we've been
> >>>> using this:
> >>>>
> >>>>     CONFIG_MEDIA_SUPPORT=y
> >>>>     CONFIG_MEDIA_CAMERA_SUPPORT=y
> >>>>     CONFIG_VIDEO_DEV=y
> >>>>     CONFIG_VIDEO_V4L2=y
> >>>>     CONFIG_V4L_TEST_DRIVERS=y
> >>>>     CONFIG_VIDEO_VIVID=y
> >>>>     CONFIG_VIDEO_VIVID_MAX_DEVS=64
> >>>>
> >>>> Do we simply need to add this one in v5.7 onwards?
> >>>>
> >>>>     CONFIG_MEDIA_PLATFORM_SUPPORT=y  
> >>>
> >>> No, this shouldn't be needed.
> >>>
> >>> Helen sent us a patch that should likely fix it:
> >>>
> >>> 	https://git.linuxtv.org/media_tree.git/commit/?id=860b511766a3d95308a942ac09a34e4d1839e706
> >>>
> >>> Could you please check if this solves the issue?  
> >>
> >> I see, thanks.  This revision is being built and tested at the
> >> moment, I'll check the results when they land in my inbox.  
> > 
> > Helen's patch was needed, but there were still a couple of
> > issues.  First we need to enable this extra option now in the
> > config fragment:
> > 
> >     CONFIG_MEDIA_TEST_SUPPORT=y

Yes.

Another option would be to do:

	# MEDIA_SUPPORT_FILTER is not set

With this option (enabled by default if EMBEDDED or EXPERT),
all CONFIG_MEDIA_*_SUPPORT will be selected[1].

[1] except for CONFIG_MEDIA_CEC_SUPPORT. This doesn't
    depend on MEDIA_SUPPORT anymore.

> > 
> > as test_drivers/Kconfig starts with "if MEDIA_TEST_SUPPORT".  
> 
> Actually, this "if" seems redundant now in test_drivers/Kconfig
> with my patch to include the file conditionally...  Please let me
> know if we should also drop it and I'll send a v2, or if this
> should be fixed in a different way.

Just one "if MEDIA_TEST_SUPPORT" at the main media/Kconfig
should be enough.

Feel free to send a v2.

Thanks,
Mauro
