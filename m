Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 873C76062EB
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 16:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbiJTOZJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Oct 2022 10:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbiJTOZH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Oct 2022 10:25:07 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 265D4A8794
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 07:25:02 -0700 (PDT)
Received: (qmail 1285872 invoked by uid 1000); 20 Oct 2022 10:25:01 -0400
Date:   Thu, 20 Oct 2022 10:25:01 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nazar Mokrynskyi <nazar@mokrynskyi.com>,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        linux@roeck-us.net, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [Bug 216543] kernel NULL pointer dereference
 usb_hcd_alloc_bandwidth
Message-ID: <Y1FaPdAF3qVYtkf6@rowland.harvard.edu>
References: <bug-216543-208809@https.bugzilla.kernel.org/>
 <bug-216543-208809-AR52CPrAl3@https.bugzilla.kernel.org/>
 <Y03IXMGpZ2fCof2k@rowland.harvard.edu>
 <CANiDSCuiYCNM+6F2+3efps2uR_Q+p-oBSu-gVmY6ygf4_1U49Q@mail.gmail.com>
 <Y07AAmc2QnP5HiBg@pendragon.ideasonboard.com>
 <CANiDSCsSn=UJfCt6shy8htGXAPyeEceVzKva3eD+YxhC3YVmxA@mail.gmail.com>
 <Y09WlZwb270lHPkv@pendragon.ideasonboard.com>
 <CANiDSCvnWpnw=+QHMfykdbocUyZ2JgN0Mpyvq+fu9u4XWoqwwA@mail.gmail.com>
 <Y1AS7DzY+Vo8ovUx@rowland.harvard.edu>
 <CANiDSCsLwJ3iFnXV+EURRe4-b2ei+g=30mkKAhydM7z731_q5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCsLwJ3iFnXV+EURRe4-b2ei+g=30mkKAhydM7z731_q5w@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 20, 2022 at 09:57:24AM +0900, Ricardo Ribalda wrote:
> Hi Alan
> 
> On Thu, 20 Oct 2022 at 00:08, Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Wed, Oct 19, 2022 at 01:22:48PM +0900, Ricardo Ribalda wrote:
> > > Hi Laurent
> > >
> > > On Wed, 19 Oct 2022 at 10:45, Laurent Pinchart
> > > <laurent.pinchart@ideasonboard.com> wrote:
> > > > And I would like to avoid having to roll out manual changes to all
> > > > drivers when the problem can be fixed in the core, just because nobody
> > > > can be bothered to spend time to implement a good fix. We don't have to
> > > > aim for a solution at the cdev level if that takes too long, an
> > > > implementation in V4L2 would be enough to start with.
> > >
> > > Do we know what a "good fix" would look like?. This is a race
> > > condition between cdev, v4l2, and usb_driver. The only entity that
> > > knows about the three of them is the driver.
> > >
> > > If we "fix" v4l2 to provide a callback to notify the framework about a
> > > "bus disconnect". It can prevent new syscalls, but it cannot interrupt
> > > the current ones.
> >
> > It doesn't need to interrupt current syscalls.  It merely needs to wait
> > until the current ones complete (and help them to complete early by
> > making them aware of the disconnection) and to prevent new ones from
> > starting.
> >
> 
> The USB subsystem is not aware of the current syscalls running for that device,
> it just triggers the callback disconnect() to notify the driver that
> they are not allowed
> anymore to access the hardware.

Right.  The question is: At what level in the various video code paths 
should the check for "device gone" then be made?

One possibility is to do all these checks at the USB driver level.  This 
has the advantage of not requiring any changes to the V4L2 core or 
elsewhere in the framework.  But it has the disadvantage of spreading 
the checks all over the place, making it that much easier to forget one.  
Furthermore it would help only the USB driver, not any of the other 
video drivers.

Another possibility is to do the checks at the framework level, or at 
least, higher up than the driver level.  For example, upon syscall 
entry, and for long-running commands, at suitable intermediate points.  
This can be implemented by having the driver call a core function from 
within its disconnect callback; that function would let the framework 
know the device is gone and wouldn't return until all existing syscall 
threads were aware of this fact and had stopped accessing the device.
This approach has advantages and disadvantages complementary to the 
first approach.

I can't tell you which approach is better -- that's up to Laurent :-) -- 
I just want to make sure you are aware of the possibilities and their 
tradeoffs.

> Even when/if we fix this for real, a "basic test" checking if the
> device is disconnected is a
> nice thing to have. I think of it as a protective programming :)
> 
> Something like:
> 
> if WARN_ON(is_connected)
>    return -EIO;

Sure, it wouldn't hurt to sprinkle things like that here and there.  But 
obviously they won't fix the problem by themselves.

Alan Stern

> > I have no idea what facility (if any) the framework uses for this
> > already.  However, if it turns out that proper synchronization needs a
> > new approach, I suggest trying SRCU.  It can be viewed in some respects
> > as a kind of read-write mutex that is highly optimized for rapid
> > read-locks and -unlocks at the cost of very slow write-locks --
> > appropriate here since every syscall would need a read-lock whereas
> > write-locking would be needed only when a disconnect occurs.
> 
> 
> Thanks for the pointer :)
> 
> >
> > Alan Stern
> 
> 
> 
> -- 
> Ricardo Ribalda
