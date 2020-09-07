Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263E926047F
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 20:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729573AbgIGS10 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 14:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728867AbgIGS1Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Sep 2020 14:27:25 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE41C061573
        for <linux-media@vger.kernel.org>; Mon,  7 Sep 2020 11:27:24 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 39B3FC642C; Mon,  7 Sep 2020 19:27:21 +0100 (BST)
Date:   Mon, 7 Sep 2020 19:27:21 +0100
From:   Sean Young <sean@mess.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] ir-keytable: re-add --device option
Message-ID: <20200907182721.GA7028@gofer.mess.org>
References: <20200907113659.0143dba2@coco.lan>
 <20200907144309.GA2767@gofer.mess.org>
 <20200907165806.3e236f45@coco.lan>
 <20200907170106.3833d77e@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907170106.3833d77e@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 07, 2020 at 05:01:06PM +0200, Mauro Carvalho Chehab wrote:
> Em Mon, 7 Sep 2020 16:58:06 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
> > Em Mon, 7 Sep 2020 15:43:09 +0100
> > Sean Young <sean@mess.org> escreveu:
> > 
> > > On Mon, Sep 07, 2020 at 11:36:59AM +0200, Mauro Carvalho Chehab wrote:  
> > > > While --device option doesn't work for enumerating and for RC/LIRC
> > > > specific control, it is still useful for testing purposes
> > > > for all kinds of input devices. For example, it can be used to
> > > > test mouse events:
> > > > 
> > > > 	$ ./utils/keytable/ir-keytable -d /dev/input/event4 -t
> > > > 	Testing events. Please, press CTRL-C to abort.
> > > > 	1222738.567737: event type EV_REL(0x02): REL_X (0x0000) value=1
> > > > 	1222738.567737: event type EV_SYN(0x00).
> > > > 	1222738.573742: event type EV_REL(0x02): REL_X (0x0000) value=1
> > > > 	1222738.573742: event type EV_SYN(0x00).
> > > > 	1222738.581738: event type EV_REL(0x02): REL_X (0x0000) value=2
> > > > 	1222738.581738: event type EV_REL(0x02): REL_Y (0x0001) value=1
> > > > 
> > > > So, re-add it, but only on test mode.    
> > > 
> > > Isn't this the same functionality as evtest(1), but not as complete?
> > > 
> > > https://cgit.freedesktop.org/evtest/
> > > 
> > > evtest is packaged for Fedora, Debian, and Ubuntu.  
> > 
> > No idea. At least on the device I'm testing (Hikey 970), evtest doesn't
> > produce anything when I move my mouse (checking via ssh):
> > 
> > 	$ sudo evtest 
> > 	No device specified, trying to scan all of /dev/input/event*
> > 	Available devices:
> > 	/dev/input/event0:	PixArt Dell MS116 USB Optical Mouse
> > 	Select the device event number [0-0]: 
> > 
> > While ir-keytable works fine.
> 
> Gah! it actually expects a "0" as input, as pressing just <enter>
> does nothing. crap!

You can specify the device on the command line:

$ sudo evtest /dev/input/event6
Input driver version is 1.0.1
Input device ID: bus 0x3 vendor 0x45e product 0x737 version 0x111
Input device name: "PixArt Microsoft USB Optical Mouse"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 272 (BTN_LEFT)
    Event code 273 (BTN_RIGHT)
    Event code 274 (BTN_MIDDLE)
  Event type 2 (EV_REL)
    Event code 0 (REL_X)
    Event code 1 (REL_Y)
    Event code 8 (REL_WHEEL)
    Event code 11 (REL_WHEEL_HI_RES)
  Event type 4 (EV_MSC)
    Event code 4 (MSC_SCAN)
Properties:
Testing ... (interrupt to exit)
Event: time 1599502969.368229, type 2 (EV_REL), code 1 (REL_Y), value -3

It gives more information about the device than ir-keytable, and it's
maintained by Peter Hutterer, the maintainer of libinput.

Having said that, asking for the input device when there is only one
is a bit stupid.

Thanks,

Sean
