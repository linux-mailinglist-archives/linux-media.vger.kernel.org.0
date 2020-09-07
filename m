Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D79AB25FCB6
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 17:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730082AbgIGPCh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 11:02:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:34402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729948AbgIGPBK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Sep 2020 11:01:10 -0400
Received: from coco.lan (ip5f5ad5cf.dynamic.kabel-deutschland.de [95.90.213.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4FD892137B;
        Mon,  7 Sep 2020 15:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599490870;
        bh=hJJyNQ21kjcWY+ASlqSfoOVv+AJlUeQRn9oi/KouvSI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jVVAVuhjWacV/OvCzMBRBXRulV96RiiaEnt1sjzrwyuRjuTI/PC9bJmOph6G4YKP8
         q4JcdqHlvZhtwjhKcb1B6n+wCq5/CNNv+sqS9V8zWhJlzP5O4GO/BwGe0OOukC9Bbi
         mEhtyftexBkH2Ljg3eO6/cemzLHgBA8zpNJ7DDFg=
Date:   Mon, 7 Sep 2020 17:01:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] ir-keytable: re-add --device option
Message-ID: <20200907170106.3833d77e@coco.lan>
In-Reply-To: <20200907165806.3e236f45@coco.lan>
References: <20200907113659.0143dba2@coco.lan>
        <20200907144309.GA2767@gofer.mess.org>
        <20200907165806.3e236f45@coco.lan>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 7 Sep 2020 16:58:06 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Mon, 7 Sep 2020 15:43:09 +0100
> Sean Young <sean@mess.org> escreveu:
> 
> > On Mon, Sep 07, 2020 at 11:36:59AM +0200, Mauro Carvalho Chehab wrote:  
> > > While --device option doesn't work for enumerating and for RC/LIRC
> > > specific control, it is still useful for testing purposes
> > > for all kinds of input devices. For example, it can be used to
> > > test mouse events:
> > > 
> > > 	$ ./utils/keytable/ir-keytable -d /dev/input/event4 -t
> > > 	Testing events. Please, press CTRL-C to abort.
> > > 	1222738.567737: event type EV_REL(0x02): REL_X (0x0000) value=1
> > > 	1222738.567737: event type EV_SYN(0x00).
> > > 	1222738.573742: event type EV_REL(0x02): REL_X (0x0000) value=1
> > > 	1222738.573742: event type EV_SYN(0x00).
> > > 	1222738.581738: event type EV_REL(0x02): REL_X (0x0000) value=2
> > > 	1222738.581738: event type EV_REL(0x02): REL_Y (0x0001) value=1
> > > 
> > > So, re-add it, but only on test mode.    
> > 
> > Isn't this the same functionality as evtest(1), but not as complete?
> > 
> > https://cgit.freedesktop.org/evtest/
> > 
> > evtest is packaged for Fedora, Debian, and Ubuntu.  
> 
> No idea. At least on the device I'm testing (Hikey 970), evtest doesn't
> produce anything when I move my mouse (checking via ssh):
> 
> 	$ sudo evtest 
> 	No device specified, trying to scan all of /dev/input/event*
> 	Available devices:
> 	/dev/input/event0:	PixArt Dell MS116 USB Optical Mouse
> 	Select the device event number [0-0]: 
> 
> While ir-keytable works fine.

Gah! it actually expects a "0" as input, as pressing just <enter>
does nothing. crap!

Thanks,
Mauro
