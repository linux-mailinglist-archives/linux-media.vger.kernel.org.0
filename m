Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2E025908A
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 16:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbgIAOec (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 10:34:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:46586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728378AbgIAOeR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Sep 2020 10:34:17 -0400
Received: from coco.lan (ip5f5ad5cf.dynamic.kabel-deutschland.de [95.90.213.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3113D206FA;
        Tue,  1 Sep 2020 14:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598970808;
        bh=JNmfQDuYufiFeN1QfagfVFn418QL7S4j46INV2H5Efs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=vfDBP/MfHgwy/KvmIgWHbnStlg3WtNEPyIalsVQa3/blKMqpLPUNReHMoXd9PyDyA
         QjRCjqqathyipXWmRZHPck3ceOLpGK1ipI8evUwJyTMqIDSXg+HSJueaxgtzZH8o+l
         +WfQXfux35wICoz7ucTCAbbNWreHA9HRhIsOXIpI=
Date:   Tue, 1 Sep 2020 16:33:25 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Stefan Witzel <s.witzel@gmx.de>
Cc:     linux-media@vger.kernel.org
Subject: Re: Enforcing color profile
Message-ID: <20200901163325.5feb2874@coco.lan>
In-Reply-To: <ede0342b-3975-15e3-a8d8-98886456b489@gmx.de>
References: <7486393e-56b5-e460-b542-02c72525139b@gmx.de>
        <0fa5da29-a058-2678-e616-65c921c6389a@xs4all.nl>
        <72B7F2AA-4FCC-4842-A80B-5C4D856C0A89@gmx.de>
        <ede0342b-3975-15e3-a8d8-98886456b489@gmx.de>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 1 Sep 2020 15:37:23 +0200
Stefan Witzel <s.witzel@gmx.de> escreveu:

> Hello,
> 
> Just in case someone should stumble across this thread: An appropriate
> solution is available here:
> 
>   https://github.com/xkahn/camlink
> 
> As pointed out by Hans before the described problem is technically an
> application bug, so one might say it should be fixed on application
> level, which is what the solution above does.

Hmm... let me try to understand something. I don't have this device.
I'm just curious about what's happening here ;-)

After looking at the patches and at:
	https://assortedhackery.com/patching-cam-link-to-play-nicer-on-linux/

it sounded to me that the UVC driver reports support for 3 different
fourccs:

	Pixel Format: 'YUYV' # V4L2_PIX_FMT_YUYV
	Pixel Format: 'NV12' # V4L2_PIX_FMT_NV12
	Pixel Format: 'YU12' # V4L2_PIX_FMT_YUV420

all of them at 1080 p resolution. 

It is very common that devices would support multiple video
formats. So, the above looks fine on my eyes, provided that the
device has support for those 3 YUV format variants.

-

If I understood well, YUYV works fine (with is a variant of 4:2:2). 

The problem is with 4:2:0 formats (NV12 and YU12):

	https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-nv12.html
	https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-yuv420.html

that don't work properly with Discord. Is that right?
Btw, are both NV12 and YU12 broken there?

Did you try using those formats with a different application,
like qv4l2 or qvidcap?

> 
> Best,
> Stefan
> 
> On 17.08.20 16:50, Stefan Witzel wrote:
> > Hi Hans,

Please don't top-post!

> >
> > I suppose it is ultimately an application bug. I was just hoping that the v4l driver cold somehow artificially restrict the device's feature list so as to make the buggy application (which seems to be pretty much any existing web conference app) work. That would be like the hardware workaround but on driver level.
> >
> > I do not yet have the device myself, so I'm relying on information from the website I quoted. I very much appreciate that you took the time to reply! I might come back with more concrete questions once I have the device.
> >
> > Thanks a lot! Best,
> > Stefan
> >
> > Am 17. August 2020 15:34:00 MESZ schrieb Hans Verkuil <hverkuil@xs4all.nl>:  
> >> On 17/08/2020 14:09, Stefan Witzel wrote:  
> >>> Hello,
> >>>
> >>> I am not a V4L developer so if this is not the right place to bring  
> >> up  
> >>> the issue please tell me who to contact instead.
> >>> The page [1] documents a problem with a particular device "Elgato Cam
> >>> Link 4K" which provides various format options among which most  
> >> software  
> >>> does not consciously pick the one which it implicitly expects leading  
> >> to  
> >>> problems. There is a software workaround, transcoding and looping
> >>> through a virtual device and a hardware fix flashing the problematic
> >>> profiles away.
> >>> However it appears to me that the most satisfactory solution is  
> >> hinted  
> >>> at in the sentence
> >>>  
> >>>> I couldn't find any option in V4L to force selection of 'YUYV  
> >> 4:2:2', so instead  
> >>>
> >>> So my question is: what changes would be necessary to allow v4l2-ctl  
> >> to  
> >>> enforce a particular format and who would be the right person to ask  
> >> to  
> >>> make such changes?  
> >>
> >> It's there already:
> >>
> >> v4l2-ctl -v pixelformat=YUYV
> >>
> >> That will do the trick.
> >>
> >> If you plug in the device and run 'v4l2-ctl -V', which pixelformat does
> >> it
> >> report? I would expect it to be YUYV since that's first in the list.
> >>
> >> If apps like Discord pick YU12 instead, then that's weird. That's
> >> something that
> >> the application does, and v4l2-ctl won't help with that. I.e., it
> >> appears to be
> >> an application bug.
> >>
> >> One other alternative is that the device has broken 4:2:0 support, i.e.
> >> it reports
> >> these formats, but they don't actually work. You can use qv4l2 or
> >> qvidcap to test
> >> if these 4:2:0 formats are working.
> >>
> >> Regards,
> >>
> >> 	Hans
> >>
> >>  
> >>>
> >>> Best regards,
> >>> Stefan
> >>>
> >>>
> >>> [1]  
> >> https://assortedhackery.com/patching-cam-link-to-play-nicer-on-linux/  
> >>>  



Thanks,
Mauro
