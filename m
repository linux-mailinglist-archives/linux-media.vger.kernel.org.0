Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D621C4558D2
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 11:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243077AbhKRKSl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 05:18:41 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56220 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245640AbhKRKRB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 05:17:01 -0500
Received: from [192.168.1.106] (unknown [103.251.226.33])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6D0B3E5;
        Thu, 18 Nov 2021 11:13:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637230440;
        bh=JhBX4dOBvMMsg3TXGvx4N3Zn+b1gYp72LgTJoX8ZkK8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=eHTLAn2Dk/amESRWPNHfdEZJ0ReTMLq8kIQecUAgDTjXLAnrXqXsOWLnHXpiPJymU
         OPvyaMHd6FV0TATCZnNzwmZklOqG/TBQZLSKoTpMXpelYciTe6+YwnTvDrtTjleHDk
         w4SC6ck+LTaG6z+MUjGwBY8dhm4uLvy41OrVwS9I=
Subject: Re: [libcamera-devel] [RFC] media: Auto exposure/gain support for
 atomisp / libcamera integration ?
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     andrey.i.trufanov@gmail.com, linux-staging@lists.linux.dev,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        libcamera-devel@lists.libcamera.org,
        Nable <nable.maininbox@googlemail.com>,
        linux-media@vger.kernel.org, Yury Luneff <yury.lunev@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
References: <20211107175013.355188-1-hdegoede@redhat.com>
From:   Umang Jain <umang.jain@ideasonboard.com>
Message-ID: <a13e1ed6-3050-3adf-fa6d-8506da66d9fa@ideasonboard.com>
Date:   Thu, 18 Nov 2021 15:43:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20211107175013.355188-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 11/7/21 11:20 PM, Hans de Goede wrote:
> Hi All,
>
> Now that we have the atomisp2 driver running on some devices like
> the Asus T101HA; and with the exposure + gain controls for the ov2680
> sensor found on that laptop fixed:
>
> https://lore.kernel.org/linux-media/20211107171549.267583-1-hdegoede@redhat.com/
>
> I believe we need to start thinking about various userspace API
> concerns. Thanks to Mauro's great work on various V4L2 API things
> are starting to work (somewhat) with regular V4L2 apps, but we really
> also need some processing / 3A stuff to make the cameras really
> usable.
>
> The most important thing needed is automatic exposure + gain control,
> ATM this relies on a custom ATOMISP ioctl, but I believe that we can
> just export the controls as regular v4l2 controls on the sensor subdev,
> at least for the ov2680 the exposure is already exported this way
> but it is read-only. Does anyone see any problems with just making
> these normal v4l2 controls on the sensor subdev ?
>
> We can then simulate the custom ATOMISP ioctl through the subdevs,
> or we can just remove it alltogether.
>
> Once we have the controls available this way I think we should write
> a libcamera plugin, which like the older versions of the Rasberry Pi
> plugin (if I've understood things correctly) won't use the MC framework
> for now. I believe we first need to understand the atomisp code better
> before we add MC support (*). But I still believe that an (experimental)
> plugin would be good, both to get something usable so that we can get
> more testers / more people interested in contributing.


I am trying to understand what 'plugin' here means? Is it a wrapper 
pertaining to use libcamera (fined tuned for atomisp) that apps can use?

> Another reason is to have another use-case where apps need to support
> libcamera to work properly (like on IPU3 devices) which will hopefully
> motivate people working on apps to put more effort in supporting libcamera


A valid and solid use case yes!

> (preferably through the new pipewire libcamera plugin so that things
> will also work in a flatpack sandbox).


In the longer term plan, I see this happening. I see there SPA support 
for libcamera in pipewire (not sure how much usable it is as of today). 
Once pipewire has a translating layer of ' request-controls' that can be 
mapped to libcamera controls, it would then make good base for 
applications for capturing video feeds by sending in requests with 
appropriate controls.

On the flatpak side, I think there will be more? plumbing work since  
you need to use flatpak-portals, rather than just bundling the library 
in the manifest (the sandbox cannot determine system's h/w capabilites). 
The current org.freedesktop.portal.Camera [1] seems to be geared to use 
pipewire so that's a starting point. CV applications are yet another 
use-case libcamera will be interested in, I think. Getting the 
flatpak-portal support there might get tricky as of 'quirky' requests? 
for the camera and pipewire API seems to be limiting to support that 
use-case? Not sure how would this work out (and also a distant future),

[1] 
https://flatpak.github.io/xdg-desktop-portal/portal-docs.html#gdbus-org.freedesktop.portal.Camera

>
> ###
>
> On other thing which I'm wondering about is the need to call S_INPUT to
> select front / back in this list from Mauro:
>
> 	$ for i in $(ls /dev/video*|sort -k2 -to -n); do echo -n $i:; v4l2-ctl -D -d $i|grep Name; done
> 	/dev/video0:	Name             : ATOMISP ISP CAPTURE output
> 	/dev/video1:	Name             : ATOMISP ISP VIEWFINDER output
> 	/dev/video2:	Name             : ATOMISP ISP PREVIEW output
> 	/dev/video3:	Name             : ATOMISP ISP VIDEO output
> 	/dev/video4:	Name             : ATOMISP ISP ACC
> 	/dev/video5:	Name             : ATOMISP ISP MEMORY input
> 	/dev/video6:	Name             : ATOMISP ISP CAPTURE output
> 	/dev/video7:	Name             : ATOMISP ISP VIEWFINDER output
> 	/dev/video8:	Name             : ATOMISP ISP PREVIEW output
> 	/dev/video9:	Name             : ATOMISP ISP VIDEO output
> 	/dev/video10:	Name             : ATOMISP ISP ACC
>
> I notice that everything is listed twice, I wonder if we can use /dev/video2
> with input 0 together with /dev/video8 for input 1, if that is possible then
> we might set a different default input on each.
>
> And maybe also make them /dev/video0 (already done I see) and /dev/video1,
> possibly combined with a module-option to hide the others for now. This
> should make things better for regular apps. OTOH if we go the libcamera
> route then this is not really necessary I guess?
>
> Regards,
>
> Hans
>
> *) I do believe that in the end MC support makes sense at least
> to tie together the
>
