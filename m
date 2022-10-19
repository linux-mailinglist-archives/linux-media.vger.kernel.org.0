Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25B9F604CC6
	for <lists+linux-media@lfdr.de>; Wed, 19 Oct 2022 18:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbiJSQIk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Oct 2022 12:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbiJSQIf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Oct 2022 12:08:35 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 05BF622536
        for <linux-media@vger.kernel.org>; Wed, 19 Oct 2022 09:08:29 -0700 (PDT)
Received: (qmail 1252835 invoked by uid 1000); 19 Oct 2022 11:08:28 -0400
Date:   Wed, 19 Oct 2022 11:08:28 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nazar Mokrynskyi <nazar@mokrynskyi.com>,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        linux@roeck-us.net, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [Bug 216543] kernel NULL pointer dereference
 usb_hcd_alloc_bandwidth
Message-ID: <Y1AS7DzY+Vo8ovUx@rowland.harvard.edu>
References: <bug-216543-208809@https.bugzilla.kernel.org/>
 <bug-216543-208809-AR52CPrAl3@https.bugzilla.kernel.org/>
 <Y03IXMGpZ2fCof2k@rowland.harvard.edu>
 <CANiDSCuiYCNM+6F2+3efps2uR_Q+p-oBSu-gVmY6ygf4_1U49Q@mail.gmail.com>
 <Y07AAmc2QnP5HiBg@pendragon.ideasonboard.com>
 <CANiDSCsSn=UJfCt6shy8htGXAPyeEceVzKva3eD+YxhC3YVmxA@mail.gmail.com>
 <Y09WlZwb270lHPkv@pendragon.ideasonboard.com>
 <CANiDSCvnWpnw=+QHMfykdbocUyZ2JgN0Mpyvq+fu9u4XWoqwwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCvnWpnw=+QHMfykdbocUyZ2JgN0Mpyvq+fu9u4XWoqwwA@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 19, 2022 at 01:22:48PM +0900, Ricardo Ribalda wrote:
> Hi Laurent
> 
> On Wed, 19 Oct 2022 at 10:45, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > And I would like to avoid having to roll out manual changes to all
> > drivers when the problem can be fixed in the core, just because nobody
> > can be bothered to spend time to implement a good fix. We don't have to
> > aim for a solution at the cdev level if that takes too long, an
> > implementation in V4L2 would be enough to start with.
> 
> Do we know what a "good fix" would look like?. This is a race
> condition between cdev, v4l2, and usb_driver. The only entity that
> knows about the three of them is the driver.
> 
> If we "fix" v4l2 to provide a callback to notify the framework about a
> "bus disconnect". It can prevent new syscalls, but it cannot interrupt
> the current ones.

It doesn't need to interrupt current syscalls.  It merely needs to wait 
until the current ones complete (and help them to complete early by 
making them aware of the disconnection) and to prevent new ones from 
starting.

I have no idea what facility (if any) the framework uses for this 
already.  However, if it turns out that proper synchronization needs a 
new approach, I suggest trying SRCU.  It can be viewed in some respects 
as a kind of read-write mutex that is highly optimized for rapid 
read-locks and -unlocks at the cost of very slow write-locks -- 
appropriate here since every syscall would need a read-lock whereas 
write-locking would be needed only when a disconnect occurs.

Alan Stern
